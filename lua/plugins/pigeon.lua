return {
	"Pheon-Dev/pigeon",
	event = "BufReadPre",
	config = function()
		require("pigeon").setup({
			os = "linux", -- windows, osx
			plugin_manager = "lazy", -- packer, paq, vim-plug
			updates = {
				pretext = "",
				posttext = "",
				icon = "󱌖 ",
			},
			datetime = {
				time = {
					format = "%H:%M",
					posttext = "hrs",
					icon = " ",
				},
				day = {
					format = "%A",
					icon = " ",
				},
				date = {
					format = "%Y-%m-%d",
					icon = " ",
				},
			},
			battery = {
				show_percentage = true,
				show_status_text = false,
				view = {
					charge = {
						zeros = { icon = " " },
						tens = { icon = " " },
						twenties = { icon = " " },
						thirties = { icon = " " },
						forties = { icon = " " },
						fifties = { icon = " " },
						sixties = { icon = " " },
						seventies = { icon = " " },
						eighties = { icon = " " },
						nineties = { icon = " " },
						hundred = { icon = " " },
					},
					status = {
						charging = { icon = " 󱐋" },
						discharging = { icon = " 󱐌" },
						not_charging = { icon = " " },
						full = { icon = " ✔" },
						unknown = { icon = " " },
						percentage = { icon = " 󰏰" },
					},
				},
			},
			internet = {
				signal = {
					unit = "dBm", -- dBm, mbps | mb/s | Mb/s | MB/s | Mbps | MBps, Kbps, Gbps, Tbps
				},
				ethernet = {
					icons = {
						connected = "󰞉 ",
						disconnected = "󰕑 ",
					},
				},
				wifi = {
					icons = {
						connected = "󰤪",
						disconnected = "󰤫",
					},
				},
			},
			volume = {
				show_percentage = false,
				icon = "󱄠",
			},
			temperature = {
				show_percentage = false,
				icon = "",
			},
			storage = {
				show_percentage = false,
				icon = "󱛟",
			},
			ram = {
				show_percentage = false,
				icon = "󰍛",
			},
			cpu = {
				show_percentage = false,
				icon = "󰻠",
			},
		})
	end,
}
