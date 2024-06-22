local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({})

-- SHOULD BE IGNORED FROM HERE
-- Some autopair configuration for LaTex documents
-- Response B
--npairs.add_rules({
  --Rule("$", "$", "tex") -- Handles single $
    --:with_pair(cond.not_after_text("$")), -- Only complete if not followed by $
  --Rule("$$", "$$", "tex") -- Handles double $$
--})

--npairs.add_rules({
--Rule("$", "$", "tex")
--:with_move(cond.after_text("$"))
--:with_move(cond.before_text("$")),
--Rule("$$", "$$", "tex")
--:with_move(cond.after_text("$$"))
--:with_move(cond.before_text("$$"))
--})

-- Response A fix:
--npairs.add_rules({
--Rule("$", "$", "tex")
--:with_move(cond.after_text("$")) -- Only trigger if there's already a $ after
--:with_move(cond.before_text("$")), -- Only trigger if there's already a $ before

--Rule("$$", "$$", "tex")
--:with_move(cond.after_text("$$")) -- Only trigger if there's already a $$ after
--:with_move(cond.before_text("$$")) -- Only trigger if there's already a $$ before
--})
