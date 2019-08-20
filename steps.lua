function buildStep(red, yellow, green, delay)
	local step = {}
	step["red"] = red
	step["yellow"] = yellow
	step["green"] = green
	step["delay"] = delay
	return step
end

-- Steps displayed in automatic mode
steps = {}
steps[0] = buildStep(1, 0, 0, 15)
steps[1] = buildStep(1, 1, 0, 1)
steps[2] = buildStep(0, 0, 1, 15)
steps[3] = buildStep(0, 1, 0, 3)

-- Index of current shown step on traffic light
curStepIndex = 0
-- Number of seconds in current step
curDelay = 0

function handleAuto()
	local curStep = steps[curStepIndex]
	gpio.write(red, curStep.red)
	gpio.write(yellow, curStep.yellow)
	gpio.write(green, curStep.green)

	print("[AUTO] curDelay=" .. curDelay .. " curStepIndex=" .. curStepIndex)

	curDelay = curDelay + 1
	if curDelay > curStep.delay then	
		curStepIndex = curStepIndex + 1
		if steps[curStepIndex] == nil then
			curStepIndex = 0
		end
		curDelay = 0
		print("transition to step " .. curStepIndex)
	end
end

autoTimer = tmr.create()
autoTimer:register(1000, tmr.ALARM_AUTO, handleAuto)
autoTimer:start()
