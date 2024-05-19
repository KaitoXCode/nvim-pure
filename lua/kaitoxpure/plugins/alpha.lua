-- welcome screen with custom text and operations
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      "     🛸　　　 　🌎　°　　🌓　•　　.°•　　　🚀 ✯      ",
      "   　　　★　*　　　　　°　　　　🛰 　°·      🪐      ",
      "    .　　　•　° ★　•  ☄                              ",
      "                     ▁▂▃▄▅▆▇▇▆▅▄▃▂▁.                 ",
      "    ★　✯   🛸                    🪐   .°•    |       ",
      [[      __     ° ★　•       🛰       __      / \     ]],
      [[     / /   ____ ___  ______  _____/ /_    | O |    ]],
      [[    / /   / __ `/ / / / __ \/ ___/ __ \   | O |    ]],
      [[   / /___/ /_/ / /_/ / / / / /__/ / / /  /| | |\   ]],
      [[  /_____/\__,_/\__,_/_/ /_/\___/_/ /_/  /_(.|.)_\  ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("Ctrl n", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}