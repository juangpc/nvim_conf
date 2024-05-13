local status, deferred_clipboard = pcall(require,'deferred-clipboard')
if not status then
    return
end

deferred_clipboard.setup {
    fallback = 'unnamedplus', -- or your preferred setting for clipboard
    lazy = true,
}
