local setup, onedark = pcall(require,'onedark')
if not setup then
    print('Problem importing onedark plugin.')
    return
end

onedark.setup {
    style = 'darker',
    colors = {
        -- bright_orange = "#ff8800",    -- define a new color
        -- green = '#61ad5c',            -- redefine an existing color
    },
}

onedark.load()


