-- =============================================================================
--  LAZY.NVIM
-- =============================================================================

-- -----------------------------------------------------------------------------
--  安装 lazy.nvim
-- -----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://gh-proxy.com/https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------------------------------------------
--  lazy.nvim 初始化
-- -----------------------------------------------------------------------------
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  git = {
    -- Github 加速
    url_format = "https://gh-proxy.com/https://github.com/%s.git"
  },
  checker = { enable = true },
})

-- -----------------------------------------------------------------------------
--  加载颜色主题 (ref: plugins/colorscheme.lua)
-- -----------------------------------------------------------------------------
local colorscheme = "tokyonight"
-- local colorscheme = "onedark"

local ok, _err = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not ok then
  vim.notify('colorscheme "' .. colorscheme .. '" not found!')
end
