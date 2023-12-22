minetest.register_node("evilsam_nodes:evilsam", {
	description = ("he is bad"),
	tiles = {"test2.png"},
})

minetest.register_node("evilsam_nodes:monkey", {
	description = ("he is kidnapper"),
	tiles = {"beware.png"},
})

minetest.register_node("evilsam_nodes:floor1", {
	description = ("floor1"),
	tiles = {"floor1.png"},
})

minetest.register_node("evilsam_nodes:floor2", {
	description = ("floor2"),
	tiles = {"floor2.png"},
})
minetest.register_node("evilsam_nodes:floor3", {
	description = ("floor3"),
	tiles = {"floor3.png"},
})
minetest.register_node("evilsam_nodes:floor4", {
	description = ("floor4"),
	tiles = {"floor4.png"},
})

minetest.register_node("evilsam_nodes:lamp", {
	description = ("lamp"),
	tiles = {"lamp.png"},
	paramtype = "light",
	 light_source = 7,
})
minetest.register_node("evilsam_nodes:lamp2", {
	description = ("lamp2"),
	tiles = {"lamp.png"},
	paramtype = "light",
	 light_source = 8,
})

minetest.register_node("evilsam_nodes:block1", {
	description = ("block1"),
	tiles = {"block.png"},
})
minetest.register_node("evilsam_nodes:block2", {
	description = ("block2"),
	tiles = {"block2.png"},
})
minetest.register_node("evilsam_nodes:car", {
	description = ("car"),
	tiles = {"car.png"},
})
minetest.register_node("evilsam_nodes:wheel", {
	description = ("wheel"),
	tiles = {"wheel.png"},
})
minetest.register_node("evilsam_nodes:floor5", {
	description = ("floor5"),
	tiles = {"floor5.png"},
})
minetest.register_node("evilsam_nodes:floor6", {
	description = ("floor6"),
	tiles = {"floor6.png"},
})
minetest.register_node("evilsam_nodes:floor7", {
	description = ("floor7"),
	tiles = {"floor7.png"},
})

--------------------------
-- Define the password
local correctPassword = "713"
local correctPassword2 = "pepper"

-- Define the coordinates of the blocks to be deleted
local block1_pos = {x = -11, y = -0.5, z = -32.1}
local block2_pos = {x = -11, y = 0.5, z = -32.1}
local block3_pos = {x = -36.2, y = -0.5, z = -9}
local block4_pos = {x = -36.2, y = 0.5, z = -9}

-- Function to delete a block at the specified position
local function deleteBlock(pos)
    minetest.set_node(pos, {name = "air"})
end

-- Form registration function
local function registerPasswordForm(player, formname, fields)
    if formname == "evilsam_nodes:enter_password" then
        if fields.password == correctPassword then
            -- Correct password, delete the specified blocks
            deleteBlock(block1_pos)
            deleteBlock(block2_pos)
            minetest.chat_send_player(player:get_player_name(), "Correct password!")
        else
            minetest.chat_send_player(player:get_player_name(), "Incorrect password. Try again.")
        end
    end

    if formname == "evilsam_nodes:enter_password2" then
        if fields.password2 == correctPassword2 then
            -- Correct password, delete the specified blocks
            deleteBlock(block3_pos)
            deleteBlock(block4_pos)
            minetest.chat_send_player(player:get_player_name(), "Correct password2!")
        else
            minetest.chat_send_player(player:get_player_name(), "Incorrect password2. Try again.")
        end
    end
end

-- Node registration for protected_block
minetest.register_node("evilsam_nodes:protected_block", {
    description = "password :)",
    tiles = {"password.png"},
    
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        local pwd = meta:get_string("password") or ""

        -- Get the password from the player
        minetest.show_formspec(player:get_player_name(), "evilsam_nodes:enter_password",
            "size[4,2]" ..
            "label[1,0;Enter Password:]" ..
            "field[1,1;3,1;password;;]" ..
            "button_exit[2,2;1,1;submit;Submit]")
    end,
})

-- Node registration for protected_block2
minetest.register_node("evilsam_nodes:protected_block2", {
    description = "password2 :)",
    tiles = {"password.png"},
    
    on_rightclick = function(pos, node, player, itemstack, pointed_thing)
        minetest.show_formspec(player:get_player_name(), "evilsam_nodes:enter_password2",
            "size[4,2]" ..
            "label[1,0;Enter Password:]" ..
            "field[1,1;3,1;password2;;]" ..
            "button_exit[2,2;1,1;submit;Submit]")
    end,
})

-- Register on_player_receive_fields
minetest.register_on_player_receive_fields(registerPasswordForm)


---------------------------------------------------
local teleport_destination = {x = 15, y = -1.5, z = 3.9}

minetest.register_node("evilsam_nodes:lava", {
    description = "lava",
    tiles = {"lava.png"},  
  --    walkable  = false,
    on_player_step = function(pos, player)
        player:set_pos(teleport_destination)
    end,
})
--------------------------------------
minetest.register_node("evilsam_nodes:sword", {
    description = "sword",
    tiles = {"airsworddd.png"},
    groups = {cracky = 3},
	paramtype = "light",
	drawtype = "plantlike",
    on_punch = function(pos, node, puncher)
        if puncher and puncher:is_player() then
		    local inv = puncher:get_inventory()
            local item_name = "evilsam_nodes:airsword"
            inv:add_item("main", item_name)
            minetest.remove_node(pos)
            minetest.remove_node(pos)
        end
    end,
})

minetest.register_tool("evilsam_nodes:airsword", {
    description = "Air Sword",
    inventory_image = "airsworddd.png", 
    tool_capabilities = {
        full_punch_interval = 0.5,  
        max_drop_level = 3,  
        groupcaps = {
            snappy = {times = {[1]=0.50, [2]=0.20, [3]=0.10}, uses = 1000, maxlevel = 3}, 
        },
        damage_groups = {fleshy = 20}, 
    },
})

