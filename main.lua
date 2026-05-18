--- @since 26.1.22
--- @sync entry

local function entry(st, job)
	-- Guard clause: Ensure an argument was sent
	if not job or not job.args or #job.args < 1 then
		return
	end

	-- Convert the single 3-digit string argument to a raw number
	local layout_code = tonumber(job.args[1])
	if not layout_code then return end

	-- Math trickery to extract individual digits
	local parent_ratio  = math.floor(layout_code / 100)
	local current_ratio = math.floor((layout_code % 100) / 10)
	local preview_ratio = layout_code % 10

	-- Set the runtime manager ratio
	rt.mgr.ratio = { parent_ratio, current_ratio, preview_ratio }

	-- Force Yazi to redraw the screen layout
	ya.emit("app:resize", {})
end

return { entry = entry }
