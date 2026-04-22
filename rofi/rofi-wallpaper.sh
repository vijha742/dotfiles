#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Pictures/wallpapers}"
WALLPAPER_DIR="${WALLPAPER_DIR%/}"
STATE_FILE="${WALLPAPER_STATE_FILE:-$HOME/.cache/current-wallpaper}"
ROFI_THEME="${ROFI_THEME_FILE:-$HOME/dotfiles/rofi/themes/tokyonight.rasi}"

ROFI_LAYOUT_OVERRIDE='listview { lines: 1; columns: 3; fixed-columns: true; layout: vertical; flow: horizontal; dynamic: false; fixed-height: true; scrollbar: false; spacing: 10px; } element { orientation: vertical; children: [ element-icon, element-text ]; padding: 6px; spacing: 4px; } element-icon { size: 88px; } element-text { horizontal-align: 0.5; width: 18ch; text-color: @primary; } element selected.normal element-text { text-color: @black; }'

usage() {
    printf 'Usage: %s [--pick|--restore]\n' "$(basename "$0")"
}

apply_wallpaper() {
    local wallpaper_path="$1"

    if [[ ! -f "$wallpaper_path" ]]; then
        return 1
    fi

    feh --bg-scale "$wallpaper_path"
    mkdir -p "$(dirname "$STATE_FILE")"
    printf '%s\n' "$wallpaper_path" > "$STATE_FILE"
}

restore_wallpaper() {
    local saved

    if [[ ! -f "$STATE_FILE" ]]; then
        return 1
    fi

    saved="$(<"$STATE_FILE")"
    if [[ -z "$saved" || ! -f "$saved" ]]; then
        return 1
    fi

    feh --bg-scale "$saved"
}

pick_wallpaper() {
    local selection_index
    local display_name
    local rel_path
    local base_name
    local -a files=()
    local rofi_args=()

    if [[ ! -d "$WALLPAPER_DIR" ]]; then
        rofi -e "Wallpaper directory not found: $WALLPAPER_DIR"
        return 1
    fi

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) -print0 | sort -z)

    if [[ ${#files[@]} -eq 0 ]]; then
        rofi -e "No wallpapers found in $WALLPAPER_DIR"
        return 1
    fi

    if [[ -f "$ROFI_THEME" ]]; then
        rofi_args+=("-theme" "$ROFI_THEME")
    fi

    rofi_args+=("-theme-str" "$ROFI_LAYOUT_OVERRIDE")

    selection_index="$({
        for file in "${files[@]}"; do
            rel_path="${file#"$WALLPAPER_DIR/"}"
            base_name="$(basename "$file")"
            if [[ ${#base_name} -gt 24 ]]; then
                display_name="${base_name:0:21}..."
            else
                display_name="$base_name"
            fi
            printf '%s\0icon\x1f%s\x1fmeta\x1f%s\n' "$display_name" "$file" "$rel_path"
        done
    } | rofi -dmenu -i -show-icons -p 'Wallpaper' -format 'i' "${rofi_args[@]}")"

    if [[ -z "$selection_index" ]]; then
        return 0
    fi

    if [[ ! "$selection_index" =~ ^[0-9]+$ ]]; then
        return 1
    fi

    apply_wallpaper "${files[$selection_index]}"
}

mode="${1:---pick}"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --pick|--restore|--help|-h)
            mode="$1"
            shift
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

case "$mode" in
    --pick)
        pick_wallpaper
        ;;
    --restore)
        restore_wallpaper || true
        ;;
    --help|-h)
        usage
        ;;
    *)
        usage
        exit 1
        ;;
esac
