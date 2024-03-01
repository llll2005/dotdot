local animate = require('mini.animate')

-- local is_many_wins = function(sizes_from, 'winheight' / 'winwidth')
--   return vim.tbl_count(sizes_from) >= 3
-- end

require('mini.animate').setup(
-- No need to copy this inside `setup()`. Will be used automatically.
{
  -- Cursor path
  cursor = {
    -- Whether to enable this animation
    enable = true,
    -- Timing of animation (how steps will progress in time)
      -- timing = --<function: implements linear total 250ms animation duration>,

    -- Path generator for visualized cursor movement
      -- path = --<function: implements shortest line path>,

    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 300, unit = 'total' }),

    -- Animate with shortest line for any cursor move
    path = animate.gen_path.line({
      predicate = function() return true end,
    }),
  },

  -- Vertical scroll
  scroll = {
    -- Whether to enable this animation
    enable = true,

    -- Timing of animation (how steps will progress in time)
      -- timing = --<function: implements linear total 250ms animation duration>,

    -- Subscroll generator based on total scroll
     -- subscroll = --<function: implements equal scroll with at most 60 steps>,

    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),

    -- Animate equally but with at most 120 steps instead of default 60
    subscroll = animate.gen_subscroll.equal({ max_output_steps = 100 }),
  },



  -- Window resize
  resize = {
    -- Whether to enable this animation
    enable = true,

    -- Timing of animation (how steps will progress in time)
      -- timing = --<function: implements linear total 250ms animation duration>,

    -- Subresize generator for all steps of resize animations
      -- subresize = --<function: implements equal linear steps>,

    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),

    -- Animate only if there are at least 3 windows
--[[     subresize = animate.gen_subscroll.equal({ predicate = is_many_wins }), ]]
  },

  -- Window open
  open = {
    -- Whether to enable this animation
    enable = true,

    -- Timing of animation (how steps will progress in time)
      -- timing = --<function: implements linear total 250ms animation duration>,

    -- Floating window config generator visualizing specific window
      -- winconfig = --<function: implements static window for 25 steps>,

    -- 'winblend' (window transparency) generator for floating window
      -- winblend = --<function: implements equal linear steps from 80 to 100>,
    -- Animate for 400 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 350, unit = 'total' }),

    -- Animate with wiping from nearest edge instead of default static one
    winconfig = animate.gen_winconfig.wipe({ direction = 'from_edge' }),

    -- Make bigger windows more transparent
    winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
  },

  -- Window close
  close = {
    -- Whether to enable this animation
    enable = true,

    -- Timing of animation (how steps will progress in time)
      -- timing = --<function: implements linear total 250ms animation duration>,

    -- Floating window config generator visualizing specific window
      -- winconfig = --<function: implements static window for 25 steps>,

    -- 'winblend' (window transparency) generator for floating window
      -- winblend = --<function: implements equal linear steps from 80 to 100>,
    -- Animate for 400 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 350, unit = 'total' }),

    -- Animate with wiping to nearest edge instead of default static one
    winconfig = animate.gen_winconfig.wipe({ direction = 'to_edge' }),

    -- Make bigger windows more transparent
    winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
  },
}
)

