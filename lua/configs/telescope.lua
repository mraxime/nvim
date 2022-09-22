local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

--- Goto parent directory in |telescope-file-browser.picker.file_browser|.
---@param prompt_bufnr number: The prompt bufnr
---@param bypass boolean: Allow passing beyond the globally set current working directory
fb_actions.custom = function(prompt_bufnr, bypass)
  bypass = vim.F.if_nil(bypass, true)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local finder = current_picker.finder
  local parent_dir = Path:new(finder.path):parent():absolute()

  if not bypass then
    if vim.loop.cwd() == finder.path then
      fb_utils.notify(
        "action.goto_parent_dir",
        { msg = "You cannot bypass the current working directory!", level = "WARN", quiet = finder.quiet }
      )
      return
    end
  end

  finder.path = parent_dir
  fb_utils.redraw_border_title(current_picker)
  current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
end

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = "❯ ",
    path_display = { "truncate" },
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    mappings = {
      i = {
        ["<C-]>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,

        ["<C-c>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<space>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        --[[ ["H"] = actions.move_to_top, ]]
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  },
  pickers = {},
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      select_buffer = true, -- auto focus file from current buffer
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["n"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["gh"] = fb_actions.goto_home_dir,
          ["H"] = fb_actions.toggle_hidden,
          ["v"] = fb_actions.toggle_all,
          ["p"] = fb_actions.copy,
          ["m"] = fb_actions.move,
          ["q"] = actions.close,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    },
  },
})
