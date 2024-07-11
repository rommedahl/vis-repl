--https://github.com/ninewise/dotfiles/blob/master/config/vis/visrc.lua
--https://git.sr.ht/~gjabell/vis-check
--https://git.sr.ht/~gjabell/vis-fix

local action = vis:action_register("REPL", function()
    local interactives = {
        ["bash"] = "!bash -i ",
        ["haskell"] = "!stack ghci ",
        ["latex"] = "!tectonic ",
        ["lithaskell"] = "!stack ghci ",
        ["python"] = "!python -i ",
        ["rust"] = "!cargo test ",
    }
    local command = interactives[vis.win.syntax]
    if command then
        vis:command(command.."'"..vis.win.file.name.."'")
    else
        vis:info("No REPL command defined for "..vis.win.syntax)
    end
end, "REPL")

vis:map(vis.modes.NORMAL, ";i", action)
