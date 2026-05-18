--- @since 26.1.22
--- @sync entry

local function set(parent, current, preview)
	rt.mgr.ratio = { parent, current, preview }
end

local function entry(st, job)
	job = type(job) == "string" and { args = { job } } or job

	-- Fallback default layout: columns (3, 5, 4)
	local parent  = tonumber(job.args and job.args[1]) or 3
	local current = tonumber(job.args and job.args[2]) or 5
	local preview = tonumber(job.args and job.args[3]) or 4

	set(parent, current, preview)

	ya.emit("app:resize", {})
end

return { entry = entry }