local la = require("module_la_shortcut")
local M = la.create_target()
M.LA_SETUP = {SHOW_HEADER = false}

function M:t()
    return la.shell("julia",
        "--color=yes",
        la.path("test", "runtests.jl"))
end

return M