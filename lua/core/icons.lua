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
      Text = " 󰌑 ↲",
      rabbit = "󱩡 󱩢 ",
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
    symbols = { added = " ", modified = " ", removed = " ", renamed = " ", ignored = " " },
    ui = {
      ArrowClosed = "",
      ArrowOpen = "",
      Lock = "",
      Circle = " ",
      BigCircle = "",
      BigUnfilledCircle = "",
      Close = "",
      NewFile = "",
      Search = "  ",
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
      OpenFolder = " ",
      Folder = " ",
    },
    git = {
      Add = " ",
      Mod = "",
      Remove = "  ",
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
      Macro = " ",
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
    dap = {
      dots = "󰇘",
      Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
      added = " ",
      modified = " ",
      removed = " ",
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Codeium = "󰘦 ",
      Color = " ",
      Control = " ",
      Collapsed = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Copilot = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = "󰆼 ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = "󰀫 ",
    },
    File = " 🧻⦂ ",
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
    file = "",
    Desktop = "",
    Documents = "",
    Downloads = "",
    Dotfiles = "",
    Dropbox = "",
    Music = "",
    Pictures = "",
    Public = "",
    Templates = "",
    Videos = "",
    Escritorio = "",
    Documentos = "",
    Descargas = "",
    Msica = "",
    Imgenes = "",
    Pblico = "",
    Plantillas = "",
    Vdeos = "",
    Bureau = "",
    Images = "",
    Musique = "",
    Publique = "",
    Imagens = "",
    Modelos = "",
    Documenti = "",
    Immagini = "",
    Modelli = "",
    Musica = "",
    Pubblici = "",
    Scaricati = "",
    Scrivania = "",
    Bilder = "",
    Dokumente = "",
    Musik = "",
    Schreibtisch = "",
    -- Vorlagen= "",
    -- Öffentlich= "",
    -- Dokumentumok= "",
    -- Képek= "",
    -- Zene= "",
    -- Letöltések= "",
    -- Számítógép= "",
    -- Videók= "",
    -- bash_aliases= "",
    -- bash_history= "",
    -- bash_logout= "",
    -- bash_profile= "",
    -- bashprofile= "",
    -- bashrc= "",
    -- dmrc= "",
    -- DS_Store= "",
    -- fasd= "",
    -- fehbg= "",
    -- gitattributes= "",
    -- gitconfig= "",
    -- gitignore= "",
    -- gitlab_ci_yml= "",
    -- gvimrc= "",
    -- inputrc= "",
    -- jack_settings= "",
    -- mime_types= "",
    -- ncmpcpp= "",
    -- nvidia_settings_rc= "",
    -- pam_environment= "",
    -- profile= "",
    -- recently_used= "",
    -- selected_editor= "",
    -- vim= "",
    -- viminfo= "",
    -- vimrc= "",
    -- Xauthority= "",
    -- Xdefaults= "",
    -- xinitrc= "",
    -- xinputrc= "",
    -- Xresources= "",
    -- zshrc= "",
    -- gvimrc= "",
    -- vimrc= "",
    -- a_out= "",
    -- authorized_keys= "",
    -- bspwmrc= "",
    -- cmakelists_txt= "",
    -- config= "",
    -- config_ac= "",
    -- config_m4= "",
    -- config_mk= "",
    -- config_ru= "",
    -- configure= "",
    -- docker_compose_yml= "",
    -- dockerfile= "",
    -- Dockerfile= "",
    -- dropbox= "",
    -- exact_match_case_sensitive_1_txt= "X1",
    -- exact_match_case_sensitive_2= "X2",
    -- favicon_ico= "",
    -- gemfile= "",
    -- gruntfile_coffee= "",
    -- gruntfile_js= "",
    -- gruntfile_ls= "",
    -- gulpfile_coffee= "",
    -- gulpfile_js= "",
    -- gulpfile_ls= "",
    -- ini= "",
    -- known_hosts= "",
    -- ledger= "",
    -- license= "",
    -- LICENSE= "",
    -- LICENSE_md= "",
    -- LICENSE_txt= "",
    -- Makefile= "",
    -- makefile= "",
    -- Makefile_ac= "",
    -- Makefile_in= "",
    -- mimeapps_list= "",
    -- mix_lock= "",
    -- node_modules= "",
    -- package_lock_json= "",
    -- package_json= "",
    -- playlists= "",
    -- procfile= "",
    -- Rakefile= "",
    -- rakefile= "",
    -- react_jsx= "",
    -- README= "",
    -- README_markdown= "",
    -- README_md= "",
    -- README_rst= "",
    -- README_txt= "",
    -- sxhkdrc= "",
    -- user_dirs_dirs= "",
    -- webpack_config_js= "",
    -- sevenz= "",
    -- ai= "",
    -- apk= "",
    -- asm= "",
    -- asp= "",
    -- aup= "",
    -- avi= "",
    -- awk= "",
    -- bash= "",
    -- bat= "",
    -- bmp= "",
    -- bz2= "",
    -- clang= "",
    -- cplusplus="",
    -- cab= "",
    -- cbr= "",
    -- cbz= "",
    -- cc= "",
    -- class= "",
    -- clj= "",
    -- cljc= "",
    -- cljs= "",
    -- cmake= "",
    -- coffee= "",
    -- conf= "",
    -- cp= "",
    -- cpio= "",
    -- cpp= "",
    -- cs= "",
    -- csh= "",
    -- css= "",
    -- cue= "",
    -- cvs= "",
    -- cxx= "",
    -- d= "",
    -- darts= "",
    -- db= "",
    -- deb= "",
    -- diff= "",
    -- dll= "",
    -- doc= "",
    -- docx= "",
    -- dump= "",
    -- edn= "",
    -- eex= "",
    -- efi= "",
    -- ejs= "",
    -- elf= "",
    -- elm= "",
    -- epub= "",
    -- erl= "",
    -- ex= "",
    -- exe= "",
    -- exs= "",
    -- f//= "",
    -- fifo= "|",
    -- fish= "",
    -- flac= "",
    -- flv= "",
    -- fs= "",
    -- fsi= "",
    -- fsscript= "",
    -- fsx= "",
    -- gem= "",
    -- gemspec= "",
    -- gif= "",
    -- go= "",
    -- gz= "",
    -- gzip= "",
    -- h= "",
    -- haml= "",
    -- hbs= "",
    -- hh= "",
    -- hpp= "",
    -- hrl= "",
    -- hs= "",
    -- htaccess= "",
    -- htm= "",
    -- html= "",
    -- htpasswd= "",
    -- hxx= "",
    -- ico= "",
    -- img= "",
    -- ini= "",
    -- iso= "",
    -- jar= "",
    -- java= "",
    -- jl= "",
    -- jpeg= "",
    -- jpg= "",
    -- js= "",
    -- json= "",
    -- jsx= "",
    -- key= "",
    -- ksh= "",
    -- leex= "",
    -- less= "",
    -- lha= "",
    -- lhs= "",
    -- log= "",
    -- lua= "",
    -- lzh= "",
    -- lzma= "",
    -- m4a= "",
    -- m4v= "",
    -- markdown= "",
    -- md= "",
    -- mdx= "",
    -- mjs= "",
    -- mkv= "",
    -- ml= "λ",
    -- mli= "λ",
    -- mov= "",
    -- mp3= "",
    -- mp4= "",
    -- mpeg= "",
    -- mpg= "",
    -- msi= "",
    -- mustache= "",
    -- nix= "",
    -- o= "",
    -- ogg= "",
    -- pdf= "",
    -- php= "",
    -- pl= "",
    -- pm= "",
    -- png= "",
    -- pp= "",
    -- ppt= "",
    -- pptx= "",
    -- ps1= "",
    -- psb= "",
    -- psd= "",
    -- pub= "",
    -- py= "",
    -- pyc= "",
    -- pyd= "",
    -- pyo= "",
    -- r= "ﳒ",
    -- rake= "",
    -- rar= "",
    -- rb= "",
    -- rc= "",
    -- rlib= "",
    -- rmd= "",
    -- rom= "",
    -- rpm= "",
    -- rproj= "鉶",
    -- rs= "",
    -- rss= "",
    -- rtf= "",
    -- s= "",
    -- sass= "",
    -- scala= "",
    -- scss= "",
    -- sh= "",
    -- slim= "",
    -- sln= "",
    -- so= "",
    -- sql= "",
    -- styl= "",
    -- suo= "",
    -- swift= "",
    -- t= "",
    -- tar= "",
    -- tex= "ﭨ",
    -- tgz= "",
    -- toml= "",
    -- ts= "",
    -- tsx= "",
    -- twig= "",
    -- vim= "",
    -- vimrc= "",
    -- vue= "﵂",
    -- wav= "",
    -- webm= "",
    -- webmanifest= "",
    -- webp= "",
    -- xbps= "",
    -- xcplayground= "",
    -- xhtml= "",
    -- xls= "",
    -- xlsx= "",
    -- xml= "",
    -- xul= "",
    -- xz= "",
    -- yaml= "",
    -- yml= "",
    -- zip= "",
    -- zsh= "",
    -- 	╷ 	╶ 	┌ 	╴ 	┐ 	─ 	┬ 	╵ 	│ 	└ 	├ 	┘ 	┤ 	┴ 	┼ ╭ 	╮ 	╰ 	╯
  }
end
