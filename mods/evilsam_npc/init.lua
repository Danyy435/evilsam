local spawn_positions = {
    {entity = "evilsam_npc:robot", pos = {x = -19.5, y = 0.5, z = -20.6}},
    {entity = "evilsam_npc:cat", pos = {x = -3.4, y = 0.5, z = -34.6}},
    {entity = "evilsam_npc:rat", pos = {x = 15.8, y = -0.5, z = 2.6}},
  {entity = "evilsam_npc:lobster", pos = {x = 18.9, y = -0.2, z = 21.6 }},
    {entity = "evilsam_npc:monkey", pos = {x = 23.9, y = -0.5, z = 27.6 }},
    {entity = "evilsam_npc:sam", pos = {x = -40.2, y = 0.5, z = -15.4 }}


} 


local function spawn_entity(entity_name, pos)
    minetest.add_entity(pos, entity_name)
end

minetest.register_on_joinplayer(function(player)
    for _, spawn_data in ipairs(spawn_positions) do
        spawn_entity(spawn_data.entity, spawn_data.pos)
    end
end)



----------------------------

local robot = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"robot.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "sam destroyed our city, he is in creative mode :(",
}

function robot:set_message(msg)
    self.message = msg
end


function robot:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:robot", robot)


local pos = {x = -19.5, y = 0.5, z = -20.6 }
local obdj = minetest.add_entity(pos, "evilsam_npc:robot", nil)


------------------------------------------------------------------------------

local cat = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"cat.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "dont try to stop him, its impossible",
}

function cat:set_message(msg)
    self.message = msg
end


function cat:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:cat", cat)


local pos = {x = -3.4, y = 0.5, z = -34.6 }
local obdj = minetest.add_entity(pos, "evilsam_npc:cat", nil)

----------------------------------------------

local rat = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"rat.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "be carful!1",
}

function cat:set_message(msg)
    self.message = msg
end


function rat:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:rat", rat)


local pos = {x = 15.8, y = -0.5, z = 2.6 }
local obdj = minetest.add_entity(pos, "evilsam_npc:rat", nil)
-------------------------------------------------------------
local lobster = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"lobster.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "i am very good, sam is very bad,he is veryyy bad, i am good,sam is baaddd,password is pepper",
}

function lobster:set_message(msg)
    self.message = msg
end


function lobster:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:lobster", lobster)


local pos = {x = 18.9, y = -0.2, z = 21.6 }
local obdj = minetest.add_entity(pos, "evilsam_npc:lobster", nil)

----------------------------------------------------------------
local monkey = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"creepymonkey.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "take the air sword with you and defeat the griefer,dont kill the innocent",
}

function monkey:set_message(msg)
    self.message = msg
end


function monkey:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:monkey", monkey)


local pos = {x = 23.9, y = -1.5, z = 28.6 }
local obdj = minetest.add_entity(pos, "evilsam_npc:monkey", nil)
---------------------------------------------------------

local sam = {
    initial_properties = {
        hp_max = 1,
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -1, -1, 1, 1, 1},
        visual = "sprite",
        visual_size = {x = 1.5, y = 1.7},
        textures = {"him.png"},
        spritediv = {x = 1, y = 1},
        use_texture_alpha = true,
        initial_sprite_basepos = {x = 2, y = 1},
    },

    message = "what? i destroyed the city? i have creative? my head is in 999999999999? the robot told you? are you joking? ",
}

function sam:set_message(msg)
    self.message = msg
end


function sam:on_punch(hitter)
    minetest.chat_send_player(hitter:get_player_name(), self.message)
end



minetest.register_entity("evilsam_npc:sam", sam)


local pos = {x = -40.2, y = -0.5, z = -15.4 }
local obdj = minetest.add_entity(pos, "evilsam_npc:sam", nil)


