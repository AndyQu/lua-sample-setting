local dumper=require 'pl.pretty'

local HomeScene=class("HomeScene", cc.load("mvc").ViewBase)

HomeScene.RESOURCE_FILENAME="HomeScene.csb"

local display = cc.Director:getInstance()
local MainScene=import("app.views.MainScene")

function HomeScene:onCreate()
	-- os.sleep("sleep "..5)
	print("[HomeScene:OnCreate]")

	
	dump(display,"display")
	-- print("[display]"..dumper.dump(getmetatable(display)))
	
	local function onInterval( dt )
		print("onInterval:"..dt)
		local mainScene=MainScene:new()
		dump(mainScene,"mainScene")
		dumper.dump(getmetatable(mainScene))
		mainScene:showWithScene("fade", 0.5, cc.c3b(255, 0, 0))
	end

	-- local scheduler=cc.Scheduler
	local scheduler=self:getScheduler():new()
	-- local scheduler=display:getScheduler()
	dump(scheduler,"scheduler")
	dumper.dump(getmetatable(scheduler))
	-- cc.Scheduler.performWithDelay(onInterval, 3)
	scheduler:schedule(onInterval, self, 10, 0, 3, false, "main-scene")
end

return HomeScene