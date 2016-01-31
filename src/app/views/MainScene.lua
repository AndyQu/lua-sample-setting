local dumper=require 'pl.pretty'
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

musicVolume=0

function MainScene:onCreate()
    local csbNode=self:getResourceNode()
    showNodes(csbNode,0)
    local soundSlider = getSubNodeByName(csbNode, "Slider_7" )
    print(dumper.dump(getmetatable(soundSlider)))

    soundSlider:addEventListener( 
    	function ( sender, event )
   			print("sound slider value:"..sender:getPercent())
    	end
    	)
end

function showNodes(node,level)
	if node ~= nil then
		for k,node in pairs(node:getChildren()) do
			local s=""
			for i = 1,level,1 do
				s=s.."  "
			end
			s=s..(node:getName())..":"..(node:getTag())..";type:"..type(node)
			print(s)
			showNodes(node,level+1)
		end 
	end
end

function getSubNodeByName(node, name )
	if node == nil then
		return nil 
	else 
		for k, subNode in pairs(node:getChildren()) do
			if subNode:getName()==name then 
				return subNode
			else 
				local res=getSubNodeByName(subNode, name)
				if res ~= nil then
					return res
				end
			end
		end
		return nil
	end
end


return MainScene
