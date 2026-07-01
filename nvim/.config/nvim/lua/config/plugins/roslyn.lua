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
      choose_target = function(targets)
        -- prefer dirs-net472.sln when multiple solutions are found
        for _, target in ipairs(targets) do
          if target:find("dirs%-net472%.sln") then
            return target
          end
        end
        return targets[1]
      end,
    },
  },
}
