
local function set_hotbar_slots(player, num_slots)
    player:hud_set_hotbar_itemcount(num_slots)
end


minetest.register_on_joinplayer(function(player)
    set_hotbar_slots(player, 1)
end)

local function set_player_physics(player)
    player:set_physics_override({
        gravity = 0.80,
		speed = 1.7
    })
end

local function show_menu(player)
    local formspec = "size[4,4]" ..
        "label[0,1; sam is evil]" ..
        "button_exit[2,2;2,1;ok;OK]"

    minetest.show_formspec(player:get_player_name(), "evilsam_player:menu", formspec)
end

minetest.register_on_joinplayer(function(player)
    show_menu(player)
end)

minetest.register_on_joinplayer(set_player_physics)

minetest.register_on_joinplayer(function(player)
    player:set_properties({
        visual_size = {x = 1, y = 1},
        collisionbox = {-0.1, 0.0, -0.1, 0.2, 0.7, 0.1},
        stepheight = 0.5,
        eye_height = 0.5
    })
end)