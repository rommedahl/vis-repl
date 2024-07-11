--https://github.com/ninewise/dotfiles/blob/master/config/vis/visrc.lua
--https://git.sr.ht/~gjabell/vis-check
--https://git.sr.ht/~gjabell/vis-fix

local action = vis:action_register("REPL", function()
    local interactives = {
        ["bash"] = "!bash -i %s",
        ["haskell"] = "!stack ghci %s",
        ["latex"] = "!tectonic %s",
        ["lithaskell"] = "!stack ghci %s",
        ["python"] = "!python -i %s",
        ["rust"] = "!cargo test %s",
    }
    local command = interactives[vis.win.syntax]
    if command then
        vis:command(string.format(command, vis.win.file.name))
    else
        vis:info(string.format("No REPL configured for %s", vis.win.syntax))
    end
end, "REPL")

vis:map(vis.modes.NORMAL, ";i", action)
