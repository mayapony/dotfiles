--vim.lsp.set_log_level("debug")

local status, tsserver = pcall(require, "lspconfig")
if (not status) then return end

