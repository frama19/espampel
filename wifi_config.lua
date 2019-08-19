

function debounce (func)
    local last = 0
    local delay = 200000

    return function (...)
        local now = tmr.now()
        if now - last < delay then return end

        last = now
        return func(...)
    end
end



	




--main routine after wifi has been setup correctly
function logic()
	red = 3
	yellow = 2
	green = 1
	onoff="OFF"
	gpio.mode(red,gpio.OUTPUT)
	gpio.mode(yellow,gpio.OUTPUT)
	gpio.mode(green,gpio.OUTPUT)
	gpio.write(red,0)
	gpio.write(yellow,0)
	gpio.write(green,0)
	-- start webserver
	dofile("webserver.lc")
	startWebServer()
	--register MDNS
	mdns.register("espampel", { description="ESP Camp Ampel", service="http", port="80" })
end

	--init_logic run once after successfully established network-connection 







--MAIN PROGRAM ENTRY POINT, CALLED FROM init.lua

--if unable to connect for 30 seconds, start enduser_setup-routine
--load Wifi-configuration and try to connect
dofile("wlancfg.lua")

logic()
      
									--at this point we should be ready to go....

