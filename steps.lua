function buildStep(red, yellow, green, delay)
	local step = {}
	step["red"] = red
	step["yellow"] = yellow
	step["green"] = green
	step["delay"] = delay
	return step
end

steps = {}
steps[0] = buildStep(1, 0, 0, 15)
steps[1] = buildStep(1, 1, 0, 1)
steps[2] = buildStep(0, 0, 1, 15)
steps[3] = buildStep(0, 1, 0, 3)


