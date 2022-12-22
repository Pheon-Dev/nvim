require("grapple").setup({
    log_level = "warn",
    scope = "git",
    popup_options = {
        relative = "editor",
        width = 60,
        height = 12,
        style = "minimal",
        focusable = false,
        border = "single",
    },
    integrations = {
        resession = false,
    },
})

require("portal").setup({
    log_level = "warn",
    query = { "modified", "different", "valid", "grapple" },
    labels = { "j", "k", "h", "l" },
    escape = {
        ["<esc>"] = true,
    },
    lookback = 100,
    portal = {
        title = {
            render_empty = true,
            options = {
                relative = "cursor",
                width = 80,
                height = 1,
                col = 2,
                style = "minimal",
                focusable = false,
                border = "single",
                noautocmd = true,
                zindex = 98,
            },
        },
        body = {
            render_empty = false,
            options = {
                relative = "cursor",
                width = 80,
                height = 3,
                col = 2,
                focusable = false,
                border = "single",
                noautocmd = true,
                zindex = 99,
            },
        },
    },
})

local query = require("portal.query").resolve({ "grapple" })
local jumps = require("portal.jump").search(query, "backward")
require("portal.jump").select(jumps[1])
