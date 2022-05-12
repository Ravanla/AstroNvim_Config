local M = {}

function M.config()
  local present, notify = pcall(require, "notify")
  if present then
    notify.setup(require("core.utils").user_plugin_opts("plugins.notify", {
      stages = "fade",
    }))

    vim.notify = notify
  end
  vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
  end
end

return M
