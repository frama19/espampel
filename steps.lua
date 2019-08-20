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

steps[4] = buildStep(1, 0, 0, 15)
steps[5] = buildStep(1, 1, 0, 1)
steps[6] = buildStep(0, 0, 1, 15)
steps[7] = buildStep(0, 1, 0, 3)

steps[8] = buildStep(1, 0, 0, 15)
steps[9] = buildStep(1, 1, 0, 1)
steps[10] = buildStep(0, 0, 1, 15)
steps[11] = buildStep(0, 1, 0, 3)

steps[12] = buildStep(0, 0, 0, 3)
steps[13] = buildStep(0, 1, 0, 1)
steps[14] = buildStep(0, 0, 0, 1)
steps[15] = buildStep(0, 1, 0, 1)
steps[16] = buildStep(0, 0, 0, 1)
steps[17] = buildStep(0, 1, 0, 1)
steps[18] = buildStep(0, 0, 0, 1)
steps[19] = buildStep(0, 1, 0, 1)
steps[20] = buildStep(0, 0, 0, 1)
steps[21] = buildStep(0, 1, 0, 1)
steps[22] = buildStep(0, 0, 0, 1)
steps[23] = buildStep(0, 1, 0, 1)
steps[24] = buildStep(0, 0, 0, 1)
steps[25] = buildStep(0, 1, 0, 1)
steps[26] = buildStep(0, 0, 0, 1)
steps[27] = buildStep(0, 1, 0, 1)
steps[28] = buildStep(0, 0, 0, 1)
steps[29] = buildStep(0, 1, 0, 1)
steps[30] = buildStep(0, 0, 0, 1)
steps[31] = buildStep(0, 1, 0, 1)
steps[32] = buildStep(0, 0, 0, 1)

steps[33] = buildStep(1, 0, 0, 10)
steps[34] = buildStep(1, 1, 0, 10)
steps[35] = buildStep(1, 1, 1, 10)
steps[36] = buildStep(0, 1, 1, 10)
steps[37] = buildStep(0, 0, 1, 10)

-- Index of current shown step on traffic light
curStepIndex = 0
-- Number of seconds in current step
curDelay = 0

function handleAuto()
	local curStep = steps[curStepIndex]
	gpio.write(red, curStep.red)
	gpio.write(yellow, curStep.yellow)
	gpio.write(green, curStep.green)

	-- print("[AUTO] curDelay=" .. curDelay .. " curStepIndex=" .. curStepIndex)

	curDelay = curDelay + 1
	if curDelay >= curStep.delay then	
		curStepIndex = curStepIndex + 1
		if steps[curStepIndex] == nil then
			curStepIndex = 0
		end
		curDelay = 0
		--print("[AUTO] transition to step " .. curStepIndex)
	end
end

autoTimer = tmr.create()
autoTimer:register(1000, tmr.ALARM_AUTO, handleAuto)
autoTimer:start()
