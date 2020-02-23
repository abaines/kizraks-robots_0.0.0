-- Kizrak

-- data.lua


local sb = serpent.block


local function compactLog(preamble,list,max_size)
	-- full|total size of input list
	local size = #list

	-- return result
	local r = preamble

	-- max number of rows (lines) for displaying list
	local max_rows = math.ceil(size/max_size)

	-- math desired number of items per line|row (should always be <= max_size)
	local columns = math.ceil(size/max_rows)

	-- number of rows that contain columns-1 number of items
	local shortRows = math.ceil(size/columns)*columns-size


	--log(string.rep("=",80))
	local i = 1
	for row=1,max_rows-shortRows do
		local sublist = {table.unpack(list, i, i+columns-1)}
		i = columns + i
		r = r .. "\n   " .. table.concat(sublist,", ")..","
	end
	for row=1+max_rows-shortRows,max_rows do
		local sublist = {table.unpack(list, i, i+columns-1-1)}
		i = columns + i - 1
		r = r .. "\n   " .. table.concat(sublist,", ")..","
	end
	--log(string.rep("-",80))

	return r
end


local function logDataRawTypeList()
	local dataRawTypeList = {}
	for k, v in pairs(data.raw) do
		if not string.find(k, "achievement") then
			table.insert(dataRawTypeList,k)
		end
	end
	log(compactLog("types in `data.raw`:",dataRawTypeList,6))
end


local function logDataRawType(rawType)
	local rawTypeList = {}
	for k, v in pairs(data.raw[rawType]) do
		table.insert(rawTypeList,k)
	end
	log(compactLog("keys in `data.raw."..rawType.."`:",rawTypeList,6))
end


local function logRecipeCategoryMap()
	local recipeCategoryMap = {}
	for k, v in pairs(data.raw.recipe) do
		-- https://wiki.factorio.com/Prototype/Recipe#category Default: "crafting"
		local category = v.category or "crafting"
		if not recipeCategoryMap[category] then
			recipeCategoryMap[category] = {}
		end
		table.insert(recipeCategoryMap[category],k)
	end

	log("data.raw.recipe:")
	for k, v in pairs(recipeCategoryMap) do
		log(compactLog("keys in `"..k.."`:",v,6))
	end
end


require("prototypes.k-logistic-chest-requester")


logDataRawTypeList()

logRecipeCategoryMap()

logDataRawType("item")

logDataRawType("logistic-container")
logDataRawType("logistic-robot")
logDataRawType("construction-robot")

log(sb( data.raw["item"]["logistic-chest-requester"] ))
log(sb( data.raw["logistic-container"]["logistic-chest-requester"] ))

