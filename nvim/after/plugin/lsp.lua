vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = '/home/vikas/Documents/' .. project_name
    local lombok_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls/lombok.jar'
    local config = {
      cmd = {
        '/usr/lib/jvm/java-21-openjdk-amd64/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_path,
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        '/home/vikas/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar',
        '-configuration',
        '/home/vikas/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data',
        workspace_dir,
      },
      root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml' },
      settings = {
        java = {},
      },
    }
    require('jdtls').start_or_attach(config)
  end,
})
