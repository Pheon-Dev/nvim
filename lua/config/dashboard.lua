vim.g.dashboard_default_executive = "telescope"
vim.cmd("highlight DashboardHeader guifg=#1080f0 ")
vim.cmd("highlight DashboardCenter guifg=#10a0f0 ")
vim.cmd("highlight DashboardFooter guifg=#10f0f0 ")
vim.cmd("highlight DashboardShortCut guifg=#10f030 ")
vim.cmd("highlight WinBar guifg=#8aa2f7 guibg=#2e2e2e ")
vim.cmd("highlight WinBarNC guifg=#808080 guibg=#2e2e2e ")

local db = require("dashboard")
db.confirm_key = "l"
db.custom_header = {

  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[ ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗     ⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ ]],
  [[ ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔═══██╗ ████═╗ ██║          ██╔═══██╗ ██╔════╝ ██║   ██║ ]],
  [[ ███████╔╝ ████████║ █████╗   ██║   ██║ ██╔███╗██║ ███████╗ ██║   ██║ █████╗   ██║   ██║ ]],
  [[ ██╔════╝  ██╔═══██║ ██╔══╝   ██║   ██║ ██║╚═████║  ╚═════╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ ]],
  [[ ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║  ╚███║         ⠀███████╔╝ ███████╗  ╚████╔╝  ]],
  [[ ╚═╝       ╚═╝⠀  ╚═╝ ╚══════╝  ╚═════┘  ╚═╝  ⠀ ╚═╝      ⠀    ╚═════╝  ╚══════╝   ╚═══╝   ]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                           [PHEON-DEV NEOVIM v3.0.2]         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],

}
local Terminal = require("toggleterm.terminal").Terminal
local toggle_terminal = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
  return lazygit:toggle()
end

-- Custom Section ﰟ
db.custom_center = {
  {
    icon = "ﯠ ",
    desc = "0 ---------------------------------- Harpoon          ",
    action = "lua require('harpoon.ui').toggle_quick_menu()",
  },
  {
    icon = " ",
    desc = "1 ---------------------------------- lir              ",
    action = "lua require('lir.float').toggle()",
  },
  {
    icon = " ",
    desc = "2 ---------------------------------- Find File        ",
    action = "Telescope find_files theme=dropdown initial_mode=insert previewer=false",
  },
  {
    icon = " ",
    desc = "3 ---------------------------------- Search Word      ",
    action = "Telescope live_grep theme=ivy",
  },
  {
    icon = "⋔ ",
    desc = "4 ---------------------------------- Mason            ",
    action = "Mason",
  },
  {
    icon = " ",
    desc = "5 ---------------------------------- Terminal         ",
    action = toggle_terminal,
  },
  {
    icon = " ",
    desc = "6 ---------------------------------- Git              ",
    action = toggle_lazygit,
  },
  {
    icon = " ",
    desc = "7 ---------------------------------- Help Tags        ",
    action = "Telescope help_tags theme=ivy initial_mode=insert",
  },
  {
    icon = "ﮅ ",
    desc = "8 ---------------------------------- List Repos       ",
    action = "Telescope repo list theme=dropdown initial_mode=normal previewer=false",
  },
  { icon = "✗ ", desc = "9 ---------------------------------- Exit             ", action = "q!" },
}
db.custom_footer = { "LET IT RIP! (KBL) - MIKEY" }
--[[ https://www.vertex42.com/ExcelTips/unicode-symbols.html ]]
local icons = {
  ["class-name"] = " ",
  ["function-name"] = " ",
  ["method-name"] = " ",
  ["container-name"] = "ﮅ ",
  ["tag-name"] = "炙",
  ["array-name"] = " ",
  ["object-name"] = " ",
  ["null-name"] = "[] ",
  ["boolean-name"] = "ﰰﰴ ",
  ["number-name"] = "# ",
  ["string-name"] = " ",
  ["title-name"] = "# ",
  ["label-name"] = " ",
  ["table-name"] = " ",
  ["date-name"] = " ",
  ["date-time-name"] = " ",
  ["float-name"] = " ",
  ["integer-name"] = "# ",
  ["time-name"] = " ",
  ["module-name"] = " ",
  ["file-name"] = " ",
  ["augment-path"] = " ",
  ["contained-name"] = " ",
  ["grouping-name"] = " ",
  ["typedef-name"] = " ",
  ["identity-name"] = " ",
  ["list-name"] = " ",
  ["leaf-list-name"] = " ",
  ["leaf-name"] = " ",
  ["action-name"] = " ",
  ["hook-name"] = "ﯠ ",
  ["box square"] = "□ ■ ▫ ▪",
  ["lozenge diamond"] = "◇ ◆ ◊",
  ["circle"] = "○ ● ◌",
  ["triangle:"] = "△ ▲ ▵ ▴ ▷ ▸ ▽ ▼ ◃ ◂",
  ["star:"] = "⋆ ★ ☆ ✦ ✧ ✪ ✶ ✷ ✹",
  ["die:"] = "⚀ ⚁ ⚂ ⚃ ⚄ ⚅",
  ["dagger:"] = "† ‡",
  ["prime:"] = "′ ″ ‴ ⁗",
  ["pm:"] = "± ∓",
  ["mp:"] = "∓",
  ["sum:"] = "∑",
  ["prod:"] = "∏ ∐",
  ["coprod:"] = "∐",
  ["forall"] = "all fa: ∀",
  ["exists:"] = "∃ ∄",
  ["empty:"] = "∅",
  ["in:"] = "∈ ∉",
  ["intersection"] = "cap: ∩ ⋂ ⊓ ⨅",
  ["union"] = "cup: ∪ ⋃ ⊔ ⨆ ⊎ ⊍ ⨄ ⨃",
  ["subset:"] = "⊂ ⊄ ⊆ ⊈",
  ["supset:"] = "⊃ ⊅ ⊇ ⊉",
  ["squb:"] = "⊏ ⊑ ⋢",
  ["squp:"] = "⊐ ⊒ ⋣",
  ["sqcup:"] = "⊔ ⨆",
  ["sqcap:"] = "⊓ ⨅",
  ["and:"] = "∧ ⋀",
  ["or:"] = "∨ ⋁",
  ["neg"] = "not: ¬",
  ["top:"] = "⊤",
  ["bot:"] = "⊥",
  ["multimap:"] = "⊸",
  ["parr:"] = "⅋",
  ["therefore:"] = "∴",
  ["because:"] = "∵",
  ["qed:"] = "∎",
  ["ast:"] = "∗",
  ["times:"] = "×",
  ["div:"] = "÷",
  ["comp:"] = "∘",
  ["dot:"] = "∙",
  ["bullet:"] = "•",
  ["sqrt:"] = "√",
  ["sqrt3:"] = "∛",
  ["sqrt4:"] = "∜",
  ["inf:"] = "∞",
  ["propto:"] = "∝",
  ["pitchfork:"] = "⋔",
  ["nabla"] = "grad: ∇",
  ["partial:"] = "𝜕",
  ["increment:"] = "∆",
  ["integral:"] = "∫ ∬ ∭ ∮ ∯ ∰",
  ["join:"] = "⋈ ⋉ ⋊ ⋋ ⋌ ⨝ ⟕ ⟖ ⟗",
  ["lbracket:"] = "⟨ ⟦ ⟪ ⦇",
  ["rbracket:"] = "⟩ ⟧ ⟫ ⦈",
  ["ceil:"] = "⌈ ⌉",
  ["lceil:"] = "⌈",
  ["rceil:"] = "⌉",
  ["floor:"] = "⌊ ⌋",
  ["lfloor:"] = "⌊",
  ["rfloor:"] = "⌋",
  ["flat:"] = "♭",
  ["harp:"] = "♯",
  ["q:"] = "∼ ≃ ≅ ≈",
  ["neq:"] = "≠ ≁ ≄ ≇ ≉",
  ["leq:"] = "≤",
  ["leqn:"] = "≰",
  ["geq:"] = "≥",
  ["geqn:"] = "≱",
  ["sim:"] = "∼ ≁ ≃ ≄",
  ["cong"] = "iso: ≅ ≇",
  ["approx:"] = "≈ ≉",
  ["equiv:"] = "≡ ≢",
  ["entails:"] = "⊢ ⊬ ⊣ ⊩ ⊮ ⊫ ⊯",
  ["models:"] = "⊨ ⊭",
  ["oplus:"] = "⊕",
  ["ominus:"] = "⊖",
  ["otimes:"] = "⊗",
  ["oslash:"] = "⊘",
  ["odot:"] = "⊙",
  ["oequal:"] = "⊜",
  ["ocirc:"] = "⊚",
  ["oast:"] = "⊛",
  ["Oplus:"] = "⨁",
  ["Otimes:"] = "⨂",
  ["Odot:"] = "⨀",
  ["boxplus:"] = "⊞",
  ["boxminus:"] = "⊟",
  ["boxtimes:"] = "⊠",
  ["boxdot:"] = "⊡",
  ["dots:"] = "… ⋯ ▊ ⋮ ⋰ ⋱",
  ["to"] = "arrow right: → ⇒ ↦",
  ["arrowleft"] = "left: ← ⇐",
  ["arrowup"] = "up: ↑ ⇑",
  ["arrowdown"] = "down: ↓ ⇓",
  ["arrowleftright"] = "leftright: ↔ ⇔",
  ["arrowupdown"] = "updown: ↕ ⇕",
  ["arrownw:"] = "↖ ⇖",
  ["arrowne:"] = "↗ ⇗",
  ["arrowse:"] = "↘ ⇘",
  ["arrowsw:"] = "↙ ⇙",
  ["bb"] = "booleans: 𝔹",
  ["bn"] = "naturals: ℕ",
  ["bz"] = "integers: ℤ",
  ["bq"] = "rationals: ℚ",
  ["br"] = "reals: ℝ",
  ["bc"] = "complex: ℂ",
  ["bh"] = "quaternions: ℍ",
  ["bp"] = "primes: ℙ",
  ["a"] = "ₐ",
  ["e"] = "ₑ",
  ["h"] = "ₕ",
  ["i"] = "ᵢ",
  ["j"] = "ⱼ",
  ["k"] = "ₖ",
  ["l"] = "ₗ",
  ["m"] = "ₘ",
  ["n"] = "ₙ",
  ["o"] = "ₒ",
  ["p"] = "ₚ",
  ["r"] = "ᵣ",
  ["s"] = "ₛ",
  ["t"] = "ₜ",
  ["u"] = "ᵤ",
  ["v"] = "ᵥ",
  ["x"] = "ₓ",
  ["0"] = "₀",
  ["1"] = "₁",
  ["2"] = "₂",
  ["3"] = "₃",
  ["4"] = "₄",
  ["5"] = "₅",
  ["6"] = "₆",
  ["7"] = "₇",
  ["8"] = "₈",
  ["9"] = "₉",
  ["+"] = "₊",
  ["-"] = "⁻",
  ["(:"] = "₍",
  ["):"] = "₎",
  ["=:"] = "₌",
  ["_"] = "₋",
  ["a:"] = "ᵃ ᴬ",
  ["b:"] = "ᵇ ᴮ",
  ["c:"] = "ᶜ",
  ["d:"] = "ᵈ ᴰ",
  ["e:"] = "ᵉ ᴱ",
  ["f:"] = "ᶠ",
  ["g:"] = "ᵍ ᴳ",
  ["h:"] = "ʰ ᴴ",
  ["i:"] = "ⁱ ᴵ",
  ["j:"] = "ʲ ᴶ",
  ["k:"] = "ᵏ ᴷ",
  ["l:"] = "ˡ ᴸ",
  ["m:"] = "ᵐ ᴹ",
  ["n:"] = "ⁿ ᴺ",
  ["o:"] = "ᵒ ᴼ",
  ["p:"] = "ᵖ ᴾ",
  ["r:"] = "ʳ ᴿ",
  ["s:"] = "ˢ",
  ["t:"] = "ᵗ ᵀ",
  ["u:"] = "ᵘ ᵁ",
  ["v:"] = "ᵛ ⱽ",
  ["w:"] = "ʷ ᵂ",
  ["x:"] = "ˣ",
  ["y:"] = "ʸ",
  ["z:"] = "ᶻ",
  ["0:"] = "⁰",
  ["1:"] = "¹",
  ["2:"] = "²",
  ["3:"] = "³",
  ["4:"] = "⁴",
  ["5:"] = "⁵",
  ["6:"] = "⁶",
  ["7:"] = "⁷",
  ["8:"] = "⁸",
  ["9:"] = "⁹",
  ["+:"] = "⁺",
  ["-:"] = "⁻",
}
