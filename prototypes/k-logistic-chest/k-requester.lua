-- Kizrak
-- data.lua
local pathReplaceRecursively = require('prototypes.file-utils')(
                                   "__kizraks-robots__") -- luacheck: ignore 211

local sb = serpent.block -- luacheck: ignore 211

local logistic_container = {
    animation = {
        layers = {
            {
                filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
                frame_count = 7,
                height = 38,
                priority = "extra-high",
                shift = {0, -0.0625},
                width = 34
            }, {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
                height = 24,
                priority = "extra-high",
                repeat_count = 7,
                shift = {0.265625, 0.171875},
                width = 48
            }
        }
    },
    close_sound = {
        filename = "__base__/sound/metallic-chest-close.ogg",
        volume = 0.7
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    corpse = "requester-chest-remnants",
    fast_replaceable_group = "container",
    flags = {"placeable-player", "player-creation"},
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 64,
    inventory_size = 6,
    logistic_mode = "requester",
    max_logistic_slots = 3,
    max_health = 150,
    minable = {mining_time = 0.1, result = "k-logistic-chest-requester"},
    name = "k-logistic-chest-requester",
    open_sound = {
        filename = "__base__/sound/metallic-chest-open.ogg",
        volume = 0.65
    },
    opened_duration = 7,
    resistances = {
        {percent = 90, type = "fire"}, {percent = 60, type = "impact"}
    },
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    type = "logistic-container"
}

pathReplaceRecursively(logistic_container)

data:extend{logistic_container}

local item = {
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 64,
    name = "k-logistic-chest-requester",
    order = "kizrak-b[storage]-e[logistic-chest-requester]",
    place_result = "k-logistic-chest-requester",
    stack_size = 5,
    subgroup = "k-logistic-network",
    type = "item"
}

pathReplaceRecursively(item)

data:extend{item}

local recipe = {
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 6},
        {type = "fluid", name = "steam", amount = 120},
        {type = "item", name = "coal", amount = 10}
    },
    name = "k-logistic-chest-requester",
    results = {{type = "item", name = "k-logistic-chest-requester", amount = 1}},
    category = "crafting-with-fluid",
    energy_required = 13,
    type = "recipe"
}

data:extend{recipe}

