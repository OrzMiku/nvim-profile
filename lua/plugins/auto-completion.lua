-- =============================================================================
--  自动补全
-- =============================================================================

return {
  'saghen/blink.cmp',
  -- 可选：为代码片段源提供代码片段
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- 使用发布标签下载预构建的二进制文件
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (推荐) 用于类似内置补全的映射 (C-y 接受)
    -- 'super-tab' 用于类似 vscode 的映射 (tab 接受)
    -- 'enter' 用于回车接受
    -- 'none' 用于无映射
    --
    -- 所有预设都有以下映射：
    -- C-space: 打开菜单，如果菜单已打开则打开文档
    -- C-n/C-p 或 上/下：选择上一个/下一个项目
    -- C-e: 隐藏菜单
    -- C-k: 切换签名帮助 (如果 signature.enabled = true)
    --
    -- 查看 :h blink-cmp-config-keymap 定义你自己的键位映射
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (默认) 用于 'Nerd Font Mono' 或 'normal' 用于 'Nerd Font'
      -- 调整间距以确保图标对齐
      nerd_font_variant = 'mono'
    },

    -- (默认) 仅在手动触发时显示文档弹出窗口
    completion = { documentation = { auto_show = false } },

    -- 定义了默认启用的提供程序列表，以便你可以在
    -- 配置的其他地方扩展它，而无需由于 `opts_extend` 而重新定义它
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (默认) 使用 Rust 模糊匹配器，以提供容错和显著更好的性能
    -- 你也可以通过使用 `implementation = "lua"` 来使用 lua 实现，
    -- 或者回退到 lua 实现，当 Rust 模糊匹配器不可用时，
    -- 通过使用 `implementation = "prefer_rust"`
    --
    -- 查看模糊匹配文档以获取更多信息
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

