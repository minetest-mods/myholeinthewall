local material = {}
local shape = {}
local make_ok = {}
local anzahl = {}

minetest.register_node("myholeinthewall:machine", {
	description = "Hole Machine",
	tiles = {"myholeinthewall_sand.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375}, -- NodeBox3
			{-0.5, -0.5, -0.5, 0.5, 0.0625, 0.5}, -- NodeBox4
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox5
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.0625, 0.0625, -0.25, 0, 0.1875, 0.25}, -- NodeBox7
			{-0.0625, 0.0625, -0.125, 0, 0.25, 0.125}, -- NodeBox8
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Hole Machine is empty (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[8,9;]"..
		"background[-0.15,-0.25;8.40,9.75;myholeinthewall_background.png]"..
		"list[current_name;ingot;5.5,1;1,1;]"..
		"list[current_name;res;5.5,3;1,1;]"..
		"label[5.5,0.5;Input:]"..
		"label[5.5,2.5;Output:]"..
		"label[0,0;Choose Hole:]"..
--		Column 1
		"image_button[1,1;1,1;myholeinthewall_mach1.png;diamond; ]"..
		"image_button[1,2;1,1;myholeinthewall_mach2.png;diamondr; ]"..
		"image_button[1,3;1,1;myholeinthewall_mach3.png;x; ]"..
--		Column 2
		"image_button[2.5,1;1,1;myholeinthewall_mach4.png;cross; ]"..
		"image_button[2.5,2;1,1;myholeinthewall_mach5.png;crossi; ]"..
		"image_button[2.5,3;1,1;myholeinthewall_mach6.png;o; ]"..
		"list[current_player;main;0,5;8,4;]")
	meta:set_string("infotext", "Brick Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["diamond"] 
or fields["diamondr"] 
or fields["x"] 
or fields["cross"]
or fields["crossi"]
or fields["o"]
then

	if fields["diamond"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:diamond_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["diamondr"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:diamond_rough_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["x"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:x_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["cross"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:cross_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["crossi"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:cross_iron_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["o"] then
		make_ok = "0"
		anzahl = "1"
		shape = "myholeinthewall:o_"
		if inv:is_empty("ingot") then
			return
		end
	end

		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------
		if ingotstack:get_name()=="default:sandstone" then
				material = "default_sandstone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_sand" then
				material = "default_desert_sand"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:clay" then
				material = "default_clay"
				make_ok = "1"
		end

		if ingotstack:get_name()=="wool:white" then
				material = "millwork_white"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_stone" then
				material = "default_desert_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cobble" then
				material = "default_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stone" then
				material = "default_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cactus" then
				material = "default_cactus"
				make_ok = "1"
		end

		if ingotstack:get_name()=="wool:white" then
				material = "millwork_white"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:sand" then
				material = "default_sand"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:wood" then
				material = "default_wood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:pinewood" then
				material = "default_pinewood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:dirt" then
				material = "default_dirt"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:brick" then
				material = "default_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:bronzeblock" then
				material = "default_bronze_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:coalblock" then
				material = "default_coal_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:copperblock" then
				material = "default_copper_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_cobble" then
				material = "default_desert_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:diamondblock" then
				material = "default_diamond_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:glass" then
				material = "default_glass"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:goldblock" then
				material = "default_gold_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:gravel" then
				material = "default_gravel"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:ice" then
				material = "default_ice"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:jungletree" then
				material = "default_jungletree"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:junglewood" then
				material = "default_junglewood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:lava_source" then
				material = "default_lava"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:mese" then
				material = "default_mese"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:mossycobble" then
				material = "default_mossycobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:obsidian" then
				material = "default_obsidian"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:obsidian_glass" then
				material = "default_obsidian_glass"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:obsidianbrick" then
				material = "default_obsidian_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:pinetree" then
				material = "default_pinetree"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:sanddstonebrick" then
				material = "default_sandstone_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:snowblock" then
				material = "default_snow"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:steelblock" then
				material = "default_steel_block"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stonebrick" then
				material = "default_stone_brick"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:tree" then
				material = "default_tree"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:water_source" then
				material = "default_water"
				make_ok = "1"
		end

		if ingotstack:get_name()=="farming:straw" then
				material = "farming_straw"
				make_ok = "1"
		end

----------------------------------------------------------------------------
--wool

		if ingotstack:get_name()=="wool:white" then
				material = "wool_white"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:black" then
				material = "wool_black"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:blue" then
				material = "wool_blue"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:brown" then
				material = "wool_brown"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:cyan" then
				material = "wool_cyan"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:dark_green" then
				material = "wool_dark_green"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:dark_grey" then
				material = "wool_dark_grey"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:green" then
				material = "wool_green"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:grey" then
				material = "wool_grey"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:magenta" then
				material = "wool_magenta"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:orange" then
				material = "wool_orange"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:pink" then
				material = "wool_pink"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:red" then
				material = "wool_red"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:violet" then
				material = "wool_violet"
				make_ok = "1"
		end
		if ingotstack:get_name()=="wool:yellow" then
				material = "wool_yellow"
				make_ok = "1"
		end

----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end


})

--Craft

minetest.register_craft({
		output = 'myholeinthewall:machine',
		recipe = {
			{'default:sand', 'default:brick', 'default:sand'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:sand', "default:brick", 'default:sand'},		
		},
})













