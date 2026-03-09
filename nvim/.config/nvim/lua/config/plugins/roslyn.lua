return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      broad_search = true,
    },
  },
}
