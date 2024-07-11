--https://github.com/ninewise/dotfiles/blob/master/config/vis/visrc.lua
--https://git.sr.ht/~gjabell/vis-check
--https://git.sr.ht/~gjabell/vis-fix

local repl = vis:action_register("REPL", function()
    local repl_templates = {
        ["bash"] = "!bash -i %s",
        ["haskell"] = "!stack ghci %s",
        ["latex"] = "!tectonic %s",
        ["lithaskell"] = "!stack ghci %s",
        ["python"] = "!python -i %s",
        ["rust"] = "!cargo test %s",
    }
    local repl_template = repl_templates[vis.win.syntax]
    if repl_template then
        vis:command(string.format(repl_template, vis.win.file.name))
    else
        vis:info(string.format("No REPL configured for %s", vis.win.syntax))
    end
end, "REPL")

vis:map(vis.modes.NORMAL, ";r", repl)