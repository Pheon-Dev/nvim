return {
  "Pheon-Dev/pigeon",
      enabled = false,
  config = function()
    require("pigeon").setup({
      enabled = true,
      os = "linux",            -- windows, osx
      plugin_manager = "lazy", -- packer, paq, vim-plug
      hostname = {
        enabled = false,
        icon = " ",
      },
      updates = {
        enabled = true,
        pretext = "",
        posttext = "",
        icon = "󱌖 ",
      },
      datetime = {
        enabled = true,
        time = {
          enabled = true,
          format = "%H:%M",
          posttext = "",
          icon = "",
        },
        day = {
          enabled = true,
          format = "%A, %d %B %Y",
          icon = "",
        },
        date = {
          enabled = true,
          format = "%Y-%m-%d",
          icon = "",
        },
      },
      battery = {
        enabled = true,
        show_percentage = true,
        show_status_text = false,
        view = {
          charge = {
            zeros = { icon = "󰂎 " },
            tens = { icon = "󰁺 " },
            twenties = { icon = "󰁻 " },
            thirties = { icon = "󰁼 " },
            forties = { icon = "󰁽 " },
            fifties = { icon = "󰁾 " },
            sixties = { icon = "󰁿 " },
            seventies = { icon = "󰂀 " },
            eighties = { icon = "󰂁 " },
            nineties = { icon = "󰂂 " },
            hundred = { icon = "󰁹 " },
          },
          status = {
            enabled = true,
            charging = { icon = " 󱐋" },
            discharging = { icon = " 󱐌" },
            not_charging = { icon = "  " },
            full = { icon = "  " },
            unknown = { icon = " " },
            critical = { icon = " " },
          },
        },
      },
      percentage = { icon = " 󰏰" },
      internet = {
        enabled = true,
        signal = {
          enabled = true,
          unit = "mbps", -- mbps, dbm
        },
        ethernet = {
          enabled = true,
          icons = {
            connected = "󰞉 ",
            disconnected = "󰕑 ",
          },
        },
        wifi = {
          status = {
            connected = "󰤪",
            disconnected = "󰤫",
            enabled = true,
          },
          essid = {
            enabled = true,
          },
          bit_rate = {
            enabled = true,
            unit = "mbps",
          }
        },
      },
      volume = {
        enabled = true,
        show_percentage = false,
        icon = "󱄠",
      },
      temperature = {
        enabled = true,
        show_percentage = false,
        icon = "",
      },
      storage = {
        enabled = true,
        show_percentage = false,
        icon = "󱛟",
      },
      ram = {
        enabled = true,
        show_percentage = false,
        icon = "󰍛",
      },
      cpu = {
        enabled = false,
        show_percentage = false,
        icon = "󰻠",
      },
    })
  end,
}
