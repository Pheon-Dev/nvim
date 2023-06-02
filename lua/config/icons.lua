-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet
-- https://fontawesome.com/icons
-- https://www.nerdfonts.com/cheat-sheet
vim.g.use_nerd_icons = false
if vim.fn.has("mac") == 1 or vim.g.use_nerd_icons then
  -- elseif vim.fn.has "mac" == 1 then 
  return {
    kind = {
      Text = " 󰌑 ↲",
      rabbit = "󱩡 󱩢",
      bee = "󰾡 󰾢 ",
      -- Method = "m",
      -- Function = "",
      -- Constructor = "",
      modified_icon = "⬤",
      Method = "",
      Function = "",
      Constructor = "",
      -- Variable = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      -- Module = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      -- Keyword = "",
      Keyword = "",
      -- Snippet = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
    type = {
      Array = "",
      Number = "",
      String = "",
      Boolean = "蘒",
      Object = "",
    },
    documents = {
      File = "",
      Files = "",
      Folder = "",
      OpenFolder = "",
      empty_open = "",
    },
    ui = {
      ArrowClosed = "",
      ArrowOpen = "",
      Lock = "",
      Circle = " ",
      BigCircle = "",
      BigUnfilledCircle = "",
      Close = "",
      NewFile = "",
      Search = "",
      Lightbulb = "",
      Project = "",
      Dashboard = "",
      History = "",
      Comment = "",
      Bug = "",
      Code = "",
      Telescope = "",
      Gear = "  ",
      Package = "",
      List = "",
      SignIn = "",
      SignOut = "",
      Check = "",
      Fire = "",
      Note = "",
      BookMark = "",
      Pencil = "",
      -- ChevronRight = "",
      ChevronRight = ">",
      Table = "",
      Calendar = "",
      CloudDownload = "",
    },
    diagnostics = {
      Error = "",
      Warning = "",
      Information = "",
      Question = "",
      Hint = "",
    },
    misc = {
      Robot = "ﮧ",
      Squirrel = "",
      Tag = "",
      Watch = "⏲",
      Smiley = "ﲃ",
      Package = "",
      CircuitBoard = "",
    },
  }
else
  --   פּ ﯟ   蘒練 some other good icons
  return {
    kind = {
      Text = " ",
      Method = " ",
      Function = " ",
      Constructor = " ",
      Field = " ",
      Variable = " ",
      Class = " ",
      Interface = " ",
      Module = " ",
      Property = " ",
      Unit = " ",
      Value = " ",
      Enum = " ",
      Keyword = " ",
      Snippet = " ",
      Color = " ",
      File = " ",
      Reference = " ",
      Folder = " ",
      EnumMember = " ",
      Constant = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
      Misc = " ",
    },
    type = {
      Array = " ",
      Number = " ",
      String = " ",
      Boolean = " ",
      Object = " ",
    },
    documents = {
      File = " ",
      Files = " ",
      Folder = " ",
      OpenFolder = " ",
    },
    git = {
      Add = " ",
      Mod = " ",
      Remove = " ",
      Ignore = " ",
      Rename = " ➜ ",
      Diff = " ",
      Repo = " ",
      Octoface = " ",
      error_sign = "",
      warn_sign = "",
      hint_sign = "",
      infor_sign = "",
      diagnostic_header_icon = "   ",
      -- code action title icon
      code_action_icon = " ",
    },
    ui = {
      ArrowClosed = "",
      ArrowOpen = "",
      Lock = " ",
      Circle = " ",
      BigCircle = " ",
      BigUnfilledCircle = " ",
      Close = " ",
      NewFile = " ",
      Search = " ",
      Lightbulb = " ",
      Project = " ",
      Dashboard = " ",
      History = " ",
      Comment = "  ",
      Bug = "  ",
      Code = " ",
      Telescope = " ",
      Gear = " ",
      Package = " ",
      List = " ",
      SignIn = " ",
      SignOut = " ",
      NoteBook = " ",
      Check = " ",
      Fire = "  ",
      Note = " ",
      BookMark = " ",
      Pencil = " ",
      ChevronRight = "",
      Table = " ",
      Calendar = " ",
      CloudDownload = " ",
    },
    diagnostics = {
      Error = " ",
      Warning = " ",
      Information = " ",
      Question = " ",
      Hint = " ",
    },
    misc = {
      Robot = " ",
      Squirrel = " ",
      Tag = " ",
      Watch = " ",
      Smiley = " ",
      Package = " ",
      CircuitBoard = " ",
    },
    -- Custom Section ﰟ↻
    symbols = {
      git = {
        one = " ",
        two = " ",
        three = " ",
        four = " ",
        five = " ",
      },
      branch = "⎇ ",
      hashprefix = " =",
      ahead = "↑·",
      behind = "↓·",
      staged = "● ",
      conflict = "✖✗ ",
      modified = "✚ ",
      untracked = "… ",
      stashed = "⚑ ",
      clean = "✔✓",
    },
    kinds = {
      File = "",
      Package = "",
      Module = "",
      Namespace = "",
      Macro = "",
      Class = "",
      Constructor = "",
      Field = "",
      Property = "",
      Method = "",
      Struct = "",
      Event = "",
      Interface = "",
      Enum = "",
      EnumMember = "",
      Constant = "",
      Function = "",
      TypeParameter = "",
      Variable = "",
      Operator = "",
      Null = "",
      Boolean = "",
      Number = "",
      String = "",
      Key = "",
      Array = "",
      Object = "",
    },
    File = " 🧻 ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = "  ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
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
    ["circle"] = "○ ● -+◌👑",
    ["triangle:"] = "△ ∆∇▲ ▵ ▴ ▷ ▸ ▽ ▼ ◃ ◂",
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
    ["increment:"] = "∆∇",
    ["integral:"] = "∫ ∬ ∭ ∮ ∯ ∰",
    ["join:"] = "⋈ ⋉ ⋊ ⋋ ⋌ ⨝ ⟕ ⟖ ⟗",
    ["lbracket:"] = "⟨ ⟦ ⟪ ⦇",
    ["rbracket:"] = "⟩ ⟧ ⟫ ⦈",
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
    ["Odot:"] = "⨀ ",
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
    nii = "◌",
    ij = "📝",
    ic = "📝",
    vuiug = "🔬",
    V = "🔬",
    [""] = "🔬",
    swdi = "📺",
    S = "📺",
    [""] = "📺",
    riuas = "🎨",
    R = "🎨",
    Rv = "🎨",
    rm = "🎨",
    ["r?"] = "🎨",
    c = "",
    cv = "",
    ce = "",
    tiuduf = "",
    ["!"] = "⟫",
    no = "🧹",
    gui = "",
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
    ["--"] = "⁻-",
    ["(:"] = "₍",
    ["):"] = "₎",
    ["=:"] = "₌",
    ["_"] = "₋-",
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
    ["-:"] = "⁻-",
    aws = "  ",
    buf = " ",
    clang = " ",
    conda = " ",
    dart = " ",
    directory = " ",
    docker_context = " ",
    elixir = " ",
    elm = " ",
    git_branch = " ",
    golang = " ",
    guix_shell = " ",
    haskell = " ",
    haxe = "⌘ ",
    hg_branch = " ",
    java = " ",
    julia = " ",
    lua = " ",
    memory_usage = " ",
    meson = "喝 ",
    nim = " ",
    nix_shell = " ",
    nodejs = " ",
    Alpine = " ",
    Amazon = " ",
    Android = " ",
    Arch = " ",
    CentOS = " ",
    Debian = " ",
    DragonFly = " ",
    Emscripten = " ",
    EndeavourOS = " ",
    Fedora = " ",
    FreeBSD = " ",
    Garuda = "﯑ ",
    Gentoo = " ",
    HardenedBSD = "ﲊ ",
    Illumos = " ",
    Linux = " ",
    Macos = " ",
    Manjaro = " ",
    Mariner = " ",
    MidnightBSD = " ",
    Mint = " ",
    NetBSD = " ",
    NixOS = " ",
    OpenBSD = " ",
    openSUSE = " ",
    OracleLinux = " ",
    Pop = " ",
    Raspbian = " ",
    Redhat = " ",
    RedHatEnterprise = " ",
    Redox = " ",
    Solus = "ﴱ ",
    SUSE = " ",
    Ubuntu = " ",
    Unknown = " ",
    Windows = " ",
    package = " ",
    python = " ",
    rlang = "ﳒ ",
    ruby = " ",
    rust = " ",
    scala = " ",
    spack = "🅢 ",
  }
end
