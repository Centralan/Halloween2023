---------------
--Worlds / sound--
---------------
local world = World:new('survival3');

---------------------------
----------messaging--------
---------------------------

function spawn_whisper(npc, msg, player)
	p:sendMessage('&f&c' .. npc .. '&f' .. msg);
end

local xmas = AI:new("DOG", "AI", "survival3");


-------------------
--Intro Book ------
-------------------

-------------------
--Event Perms ------
-------------------
--runsafe.event.trees
--runsafe.event.emerald
--runsafe.event.flower
--runsafe.event.beacon

---------------
--Task 1 --
---------------
--warp hunt1
--18946,-21854

local framechest = Location:new(world, 18947.0, 112.0, -21580.0);
local framechestChestPlayers = {};
local framechestChestResetTimer = Timer:new("frame_reset_chest", 200 * 600 * 50);
local framechestChestResetTimerRunning = false;
local framechestChestOpen = Location:new(world, -64.0, 65.0, -515.0);


function find_trees(data)
          local player = Player:new(data.player);
	    if not framechestChestPlayers[player.name] then
		framechest:cloneChestToPlayer(player.name);
		player:closeInventory();
		xmas:speak( player.name .. " has completed the (classifed) objective.");
	         player:sendMessage('&7Something seems weird about these trees, almost like the server made them.');
	         player:sendMessage('&7Why would an Admin do this? Maybe I can find something here to build the portal.');
                 player:addPermission("runsafe.event.trees");
		framechestChestPlayers[player.name] = true; 
		
		if not framechestChestResetTimerRunning then
			framechestChestResetTimerRunning = true;
			framechestChestResetTimer:start();
		end
	end
end

registerHook("REGION_ENTER", "find_trees", "survival3-hunt_1");


---------------
--Task 2 --
---------------
--warp hunt2
--18444,-17258

local beanschest = Location:new(world, 18444.0, 62.0, -17258.0);
local beanschestChestPlayers = {};
local beanschestChestResetTimer = Timer:new("beans_reset_chest", 200 * 600 * 50);
local beanschestChestResetTimerRunning = false;
local beanschestChestOpen = Location:new(world, -64.0, 65.0, -515.0);

function beans_snow(data)
	local player = Player:new(data.player);
	if not beanschestChestPlayers[player.name] then
		beanschest:cloneChestToPlayer(player.name);
		player:closeInventory();
		xmas:speak( player.name .. " has completed the (classifed) objective.");
                player:sendMessage('&7Someone is into some weird stuff...');
                player:addPermission("runsafe.event.emerald");
		beanschestChestPlayers[player.name] = true; 
		
		if not beanschestChestResetTimerRunning then
			beanschestChestResetTimerRunning = true;
			beanschestChestResetTimer:start();
		end
	end
end

function beanschest_reset_chest()
	beanschestChestPlayers = {};
	beanschestChestResetTimerRunning = false;
end

registerHook("INTERACT", "beans_snow", 61, "survival3", 18446, 66, -17257);

---------------
--Task 3 --
---------------
--warp hunt3
--37044,22486

local flowerchest = Location:new(world, 37044.0, 34.0, -22486.0);
local flowerchestChestPlayers = {};
local flowerchestChestResetTimer = Timer:new("flower_reset_chest", 200 * 600 * 50);
local flowerchestChestResetTimerRunning = false;
local flowerchestChestOpen = Location:new(world, -64.0, 65.0, -515.0);

function space_crash(data)
	local player = Player:new(data.player);
	if not flowerchestChestPlayers[player.name] then
		flowerchest:cloneChestToPlayer(player.name);
		player:closeInventory();
		xmas:speak( player.name .. " has completed the (classifed) objective.");
                player:sendMessage('&7Seems whatever caused this metor to crash left a ... flower?');
		player:sendMessage('&7The flower has a strange glow to it. I wonder where it came from?');
		player:sendMessage('&9[?] &bSP&4E&bNCE&4R&f: &kbto wpt mt&f.');
                player:addPermission("runsafe.event.flower");
		flowerchestChestPlayers[player.name] = true; 
		
		if not flowerchestChestResetTimerRunning then
			flowerchestChestResetTimerRunning = true;
			flowerchestChestResetTimer:start();
		end
	end
end

function flowerchest_reset_chest()
	flowerchestChestPlayers = {};
	flowerchestChestResetTimerRunning = false;
end

registerHook("INTERACT", "space_crash", 77, "survival3", 37043, 33, -22481);

---------------
--Task 4 --
---------------
--warp hunt4
--20758,-21037

local beaconchest = Location:new(world, 20746.0, 85.0, -21014.0);
local beaconchestChestPlayers = {};
local beaconchestChestResetTimer = Timer:new("beacon_reset_chest", 200 * 600 * 50);
local beaconchestChestResetTimerRunning = false;
local beaconchestChestOpen = Location:new(world, -64.0, 65.0, -515.0);

function cpu_core(data)
	local player = Player:new(data.player);
	if not beaconchestChestPlayers[player.name] then
		beaconchest:cloneChestToPlayer(player.name);
		player:closeInventory();
		xmas:speak( player.name .. " has completed the (classifed) objective.");
                player:sendMessage('&7Who knew Runsafe ran on beacons.');
		player:sendMessage('&9[?] &bS&4P&bENC&4ER&f: Hey &kthat &fbel&kon&fgs &kto m&fe.');
                player:addPermission("runsafe.event.beacon");
		beaconchestChestPlayers[player.name] = true; 
		
		if not beaconchestChestResetTimerRunning then
			beaconchestChestResetTimerRunning = true;
			beaconchestChestResetTimer:start();
		end
	end
end

function beaconchest_reset_chest()
	beaconchestChestPlayers = {};
	beaconchestChestResetTimerRunning = false;
end

registerHook("INTERACT", "cpu_core", 146, "survival3", 20737, 70, -21070);

