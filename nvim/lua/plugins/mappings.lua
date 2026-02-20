return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>h"] = { ":bprevious<CR>", desc = "Previous buffer" },
          ["<Leader>l"] = { ":bnext<CR>", desc = "Next buffer" },
        },
      },
    },
  },
}

