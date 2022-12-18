local dap_vt_status, dap_vt = pcall(require, 'nvim-dap-virtual-text')
if not dap_vt_status then return end

dap_vt.setup()
