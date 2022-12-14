--------------------------------------------------------------------------------
-- PACKER PLUGIN MANAGEMENT - plugins.lua - by archsinit
--------------------------------------------------------------------------------

local fn = vim.fn

-- Automatically run :PackerCompile when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

--------------------------------------------------------------------------------
-- Bootstrap packer.nvim
--------------------------------------------------------------------------------

local ensure_packer = function()
    local install_path = fn.stdpath('data')..
        '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 
        'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }
    use 'wbthomason/packer.nvim'
    use 'ledger/vim-ledger'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
