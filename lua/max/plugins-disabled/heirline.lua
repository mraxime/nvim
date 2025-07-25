return {
	"rebelot/heirline.nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		local utils = require("heirline.utils")
		local status = require("max.utils.status")

		local tabline = { -- bufferline
			{ -- file tree padding
				condition = function(self)
					self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
					return status.condition.buffer_matches(
						{ filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree", "edgy" } },
						vim.api.nvim_win_get_buf(self.winid)
					)
				end,
				provider = function(self)
					return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1)
				end,
				hl = { bg = "tabline_bg" },
			},
			status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
			status.component.fill({ hl = { bg = "tabline_bg" } }), -- fill the rest of the tabline with background color
			{ -- tab list
				condition = function()
					return #vim.api.nvim_list_tabpages() >= 2
				end, -- only show tabs if there are more than one
				status.heirline.make_tablist({ -- component for each tab
					provider = status.provider.tabnr(),
					hl = function(self)
						return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true)
					end,
				}),
				{ -- close button for current tab
					provider = status.provider.close_button({ kind = "TabClose", padding = { left = 1, right = 1 } }),
					hl = status.hl.get_attributes("tab_close", true),
					on_click = {
						callback = function()
							-- TODO
						end,
						name = "heirline_tabline_close_tab_callback",
					},
				},
			},
		}

		require("heirline").setup({ tabline = tabline })
	end,
}
