--[[
    Made in R-Lua (Roblox Lua)

    Developers :
        catwalker#1337 - Coding.
        safazi - Packages.

    Discord : ("https://discord.gg/WJdYTvvFxX")
]]

-- # Checking if game is loaded.

if not game:IsLoaded() then
    game["Loaded"]:wait()
end

local startTime = os.clock()
local printconsole = printconsole or warn

-- # Functions

if not getgenv()["cat"] then
	getgenv()["cat"] = ({
		getfenv = (syn and syn.getfenv) or getfenv;
		getsenv = (syn and syn.getsenv) or getsenv;
		getmenv = (syn and syn.getmenv) or getmenv;
		getgc = (syn and syn.getgc) or getgc;

		packages = ({ });
		services = ({
			workspace = game:service("Workspace");
			run = game:service("RunService");
			players = game:service("Players");
			core = game:service("CoreGui");
			replicated = game:service("ReplicatedStorage");
			test = game:service("TestService")
		});
	})

	function cat:_load(package)
		assert(package, "Failed to load air...")
		
		local loadtime = os.clock()
		
		printconsole(string.format("[catsense] tried to load [%s] package from github/belkworks", string.format("https://github.com/Belkworks/%s/blob/master/init.lua?raw=true", package)))

		local s, e = pcall(function()
		    return loadstring(game.HttpGet(game, string.format("https://github.com/Belkworks/%s/blob/master/init.lua?raw=true", package)))()
		end)
		
		if not s then
		    getgenv().cat = nil
		    return printconsole("| [catsense] failed")
		end
		
		printconsole(string.format("| [catsense] loaded, status:%s, error:%s", tostring(s), tostring(e or "none")))
		printconsole(string.format("| [catsense] %s", tostring(e)))
		
		return e
	end

	function cat:isSX()
		if(syn and (identifyexecutor == "Synapse")) then
			return true
		end

		return false
	end

	-- # Packages

	getgenv()["cat"]["packages"] = ({
		quick = cat:_load("quick"),
		synlog = cat:_load("synlog"),
		logfile = cat:_load("logfile"),
		ms = cat:_load("ms"),
		stringy = cat:_load("stringy"),
		nest = cat:_load("nest"),
		hold = cat:_load("hold"),
		task = cat:_load("broom"),
		chance = cat:_load("chance"),
		gate = cat:_load("gate"),
	})
end

cat["packages"].synlog:print(string.format("[catsense] loaded environment in : %s seconds", math.floor(os.clock()-startTime)))
