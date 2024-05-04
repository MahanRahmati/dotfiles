return {
  {
    "wildfunctions/myeyeshurt",
    opts = {
      initialFlakes = 100,
      flakeOdds = 20,
      maxFlakes = 750,
      nextFrameDelay = 175,
      useDefaultKeymaps = false,
      flake = { "*", "." },
      minutesUntilRest = 20,
    },
    keys = {
      {
        "<leader>ms",
        function()
          require("myeyeshurt").start()
        end,
        desc = "Start Snowflakes",
      },
      {
        "<leader>mx",
        function()
          require("myeyeshurt").stop()
        end,
        desc = "Stop Snowflakes",
      },
    },
  },
}
