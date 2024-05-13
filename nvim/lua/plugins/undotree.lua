
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local exists = function(var)
     if type(var) == "nil" then
         return false
     else
         return true
     end
end


if vim.g.loaded_undotree == 1 then
         return
end

-- vim.g.undotree_SetFocusWhenToggle = 1
-- vim.g.undotree_WindowLayout = 3
--

--=================================================
--Options:

-- Window layout
-- style 1
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+                        |
-- |          |                        |
-- |   diff   |                        |
-- |          |                        |
-- +----------+------------------------+
-- Style 2
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+------------------------+
-- |                                   |
-- |   diff                            |
-- |                                   |
-- +-----------------------------------+
-- Style 3
-- +------------------------+----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- |                        +----------+
-- |                        |          |
-- |                        |   diff   |
-- |                        |          |
-- +------------------------+----------+
-- Style 4
-- +-----------------------++----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- +------------------------+----------+
-- |                                   |
-- |                            diff   |
-- |                                   |
-- +-----------------------------------+

if not exists(vim.g.undotree_WindowLayout) then
         vim.g.undotree_WindowLayout = 1
end

-- e.g. using 'd' instead of 'days' to save some space.
if not exists(vim.g.undotree_ShortIndicators) then
         vim.g.undotree_ShortIndicators = 0
end

-- undotree window width
if not exists(vim.g.undotree_SplitWidth) then
         if vim.g.undotree_ShortIndicators == 1 then
                 vim.g.undotree_SplitWidth = 24

         else
                 vim.g.undotree_SplitWidth = 30

         end
end

-- diff window height
if not exists(vim.g.undotree_DiffpanelHeight) then
         vim.g.undotree_DiffpanelHeight = 12
end

-- auto open diff window
if not exists(vim.g.undotree_DiffAutoOpen) then
         vim.g.undotree_DiffAutoOpen = 1
end

-- if set, undotree window get focus after being opened, otherwise
-- focus will stay in current window.
if not exists(vim.g.undotree_SetFocusWhenToggle) then
         vim.g.undotree_SetFocusWhenToggle = 1
end

-- tree node shape.
if not exists(vim.g.undotree_TreeNodeShape) then
         vim.g.undotree_TreeNodeShape = '*'
end

-- tree vertical shape.
if not exists(vim.g.undotree_TreeVertShape) then
         vim.g.undotree_TreeVertShape = '|'
end

-- tree split shape.
if not exists(vim.g.undotree_TreeSplitShape) then
         vim.g.undotree_TreeSplitShape = '/'
end

-- tree return shape.
if not exists(vim.g.undotree_TreeReturnShape) then
         vim.g.undotree_TreeReturnShape = '\\'
end

if not exists(vim.g.undotree_DiffCommand) then
         vim.g.undotree_DiffCommand = "diff"
end

-- relative timestamp
if not exists(vim.g.undotree_RelativeTimestamp) then
         vim.g.undotree_RelativeTimestamp = 1
end

-- Highlight changed text
if not exists(vim.g.undotree_HighlightChangedText) then
         vim.g.undotree_HighlightChangedText = 1
end

-- Highlight changed text using signs in the gutter
if not exists(vim.g.undotree_HighlightChangedWithSign) then
         vim.g.undotree_HighlightChangedWithSign = 1
end

-- Highlight linked syntax type.
-- You may chose your favorite through ":hi" command
if not exists(vim.g.undotree_HighlightSyntaxAdd) then
         vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"
end
if not exists(vim.g.undotree_HighlightSyntaxChange) then
         vim.g.undotree_HighlightSyntaxChange = "DiffChange"
end
if not exists(vim.g.undotree_HighlightSyntaxDel) then
         vim.g.undotree_HighlightSyntaxDel = "DiffDelete"
end

-- Show help line
if not exists(vim.g.undotree_HelpLine) then
         vim.g.undotree_HelpLine = 1
end

-- Show cursorline
if not exists(vim.g.undotree_CursorLine) then
         vim.g.undotree_CursorLine = 1
end

