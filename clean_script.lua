-- [[ PART 1: FRAMEWORK SETUP & CONFIGURATION ]]

local G = {}
G.IsPremium = function() return true end
G.RegisterReset = function() end

local isNoui = (tostring(getgenv().mode) == "noui")

if isNoui then
    local mockMeta = {
        __index = function(t, k) return t end,
        __call = function(t, ...) return t end
    }
    local mockUI = setmetatable({}, mockMeta)
    G.Library = mockUI
    G.Window = mockUI
    G.IsHeadless = function() return true end
else
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reversed1337/Testing-123/refs/heads/main/zetahub_uilib"))()
    G.Library = Library

    G.Window = Library:CreateWindow({
        Title = "Exotic Hub Pro",
        Footer = "exotichub.app/join | pootaaa",
        Position = UDim2.fromOffset(6, 6),
        Size = UDim2.fromOffset(720, 600),
        AutoShow = true,
        Center = true,
        Resizable = true,
        SearchbarSize = UDim2.fromScale(1, 1),
        CornerRadius = 4,
        NotifySide = "Right",
        ShowCustomCursor = false,
        Font = Enum.Font.Code,
        ToggleKeybind = Enum.KeyCode.RightControl,
        MobileButtonsSide = "Left",
    })
end

local V = game.GameId
if tostring(V) ~= "10200395747" then
    print("Exo: Invalid Game")
    return
end

if _G.is_running_gag2 then
    warn("Already running x")
    return
end 
_G.is_running_gag2 = true

local y = {}
local Z = task
local j = Z 

print("exo start > ")
print("Place Id ", game.PlaceId)
print("GameId: ", V)

local i = {}
i.GuiService = game:GetService("GuiService")
i.CollectionService = game:GetService("CollectionService")
i.LocalizationService = game:GetService("LocalizationService")
i.UserInputService = game:GetService("UserInputService")
i.Players = game:GetService("Players")
i.ReplicatedStorage = game:GetService("ReplicatedStorage")
i.Workspace = game:GetService("Workspace")
i.RunService = game:GetService("RunService")
i.ReplicatedFirst = game:GetService("ReplicatedFirst")
i.Lighting = game:GetService("Lighting")
i.Stats = game:GetService("Stats")
i.HttpService = game:GetService("HttpService")
i.MarketplaceService = game:GetService("MarketplaceService")
i.TeleportService = game:GetService("TeleportService")
i.LocalPlayer = i.Players.LocalPlayer

local c = {}
local J = {}
local T = {}
local d = {}
local u = {}
local q = {}
local g = {}
local E = {}
local a = {}
local H = {}

J.is_pro = G.IsPremium() == true 
J.GetCheckIfPro = function() return G.IsPremium() == true end 
J.SaveSyncPremiumAtStartup = J.is_pro == true

local r = 15
local Y = 5
local e = "TeleportButtons"
local s = "ExoticHubTeleportButtonScale"
local N = "GuildButton"
local W = "ViewGuildPage"
local X = 0
local h = 500000
local l = 1000

local B = {
    UseDefault = "Default Placement",
    Default = "Farm Middle",
    RightBackCenter = "RightFarm BackCenter",
    LeftBackCenter = "LeftFarm BackCenter",
    RightFrontCenter = "RightFarm FrontCenter",
    LeftFrontCenter = "LeftFarm FrontCenter",
    BackInsetStuds = 10
}
B.Options = {B.Default, B.RightBackCenter, B.LeftBackCenter, B.RightFrontCenter, B.LeftFrontCenter}
B.AreaByPlacement = {
    [B.RightBackCenter] = "PlantAreaColumn2",
    [B.LeftBackCenter] = "PlantAreaColumn1",
    [B.RightFrontCenter] = "PlantAreaColumn2",
    [B.LeftFrontCenter] = "PlantAreaColumn1"
}

y.LoopWorkProfiler = {
    EnabledLoopWorkProfiler = false,
    WindowSecondsLoopWorkProfiler = 3,
    StatsLoopWorkProfiler = {},
    LabelsByCoroutineLoopWorkProfiler = setmetatable({}, {__mode = "k"}),
    ActiveStartedAtByCoroutineLoopWorkProfiler = setmetatable({}, {__mode = "k"}),
    ReporterGenerationLoopWorkProfiler = 0,
    LabelLoopWorkProfiler = nil,
    TaskProxyLoopWorkProfiler = nil,
    
    SetLabelTextLoopWorkProfiler = function(G)
        local V = y.LoopWorkProfiler.LabelLoopWorkProfiler
        if V and type(V.SetText) == "function" then
            V:SetText(tostring(G or ""))
        end
    end,
    
    RecordDurationLoopWorkProfiler = function(G, V)
        local Z = y.LoopWorkProfiler
        if Z.EnabledLoopWorkProfiler ~= true then return false end 
        G = tostring(G or "")
        V = tonumber(V) or 0
        if G == "" or V < 0 then return false end
        local j = Z.StatsLoopWorkProfiler[G]
        if not j then
            j = {total = 0, maximum = 0, samples = 0}
            Z.StatsLoopWorkProfiler[G] = j
        end 
        j.total += V 
        j.maximum = math.max(j.maximum, V)
        j.samples += 1
        return true
    end,
    
    FinishCurrentSliceLoopWorkProfiler = function()
        local G = y.LoopWorkProfiler
        local V = coroutine.running()
        if not V then return false end
        local Z = G.ActiveStartedAtByCoroutineLoopWorkProfiler[V]
        G.ActiveStartedAtByCoroutineLoopWorkProfiler[V] = nil
        if not Z then return false end
        local j = G.LabelsByCoroutineLoopWorkProfiler[V]
        if not j then return false end
        return G.RecordDurationLoopWorkProfiler(j, os.clock() - Z)
    end,
    
    ResumeCurrentSliceLoopWorkProfiler = function()
        local G = y.LoopWorkProfiler
        if G.EnabledLoopWorkProfiler ~= true then return false end
        local V = coroutine.running()
        if not V or not G.LabelsByCoroutineLoopWorkProfiler[V] then return false end 
        G.ActiveStartedAtByCoroutineLoopWorkProfiler[V] = os.clock()
        return true
    end,
    
    SetCurrentLoopNameLoopWorkProfiler = function(G)
        local V = y.LoopWorkProfiler
        local Z = coroutine.running()
        if not Z then return nil end
        if V.EnabledLoopWorkProfiler == true then
            V.FinishCurrentSliceLoopWorkProfiler()
        end
        local j = V.LabelsByCoroutineLoopWorkProfiler[Z]
        V.LabelsByCoroutineLoopWorkProfiler[Z] = tostring(G or "")
        if V.EnabledLoopWorkProfiler == true then
            V.ResumeCurrentSliceLoopWorkProfiler()
        end
        return j
    end,
    
    RestoreCurrentLoopNameLoopWorkProfiler = function(G)
        local V = y.LoopWorkProfiler
        local Z = coroutine.running()
        if not Z then return false end
        if V.EnabledLoopWorkProfiler == true then
            V.FinishCurrentSliceLoopWorkProfiler()
        end 
        V.LabelsByCoroutineLoopWorkProfiler[Z] = G
        if V.EnabledLoopWorkProfiler == true and G then
            V.ResumeCurrentSliceLoopWorkProfiler()
        end
        return true
    end,
    
    MeasureLoopWorkProfiler = function(G, V, ...)
        if type(V) ~= "function" then return nil end
        local Z = y.LoopWorkProfiler
        if Z.EnabledLoopWorkProfiler ~= true then return V(...) end
        local j = Z.SetCurrentLoopNameLoopWorkProfiler(G)
        local i = table.pack(pcall(V, ...))
        Z.RestoreCurrentLoopNameLoopWorkProfiler(j)
        if not i[1] then error(i[2], 0) end
        return table.unpack(i, 2, i.n)
    end,
    
    RunNamedLoopWorkProfiler = function(G, V, ...)
        if type(V) ~= "function" then return nil end
        local Z = y.LoopWorkProfiler
        local j = Z.SetCurrentLoopNameLoopWorkProfiler(G)
        local i = table.pack(pcall(V, ...))
        Z.RestoreCurrentLoopNameLoopWorkProfiler(j)
        if not i[1] then error(i[2], 0) end
        return table.unpack(i, 2, i.n)
    end,
    
    SpawnNamedLoopWorkProfiler = function(G, V, ...)
        if type(V) ~= "function" then return nil end
        local j = table.pack(...)
        return Z.spawn(function()
            local Z = y.LoopWorkProfiler
            local i = Z.SetCurrentLoopNameLoopWorkProfiler(G)
            local c = table.pack(pcall(V, table.unpack(j, 1, j.n)))
            Z.RestoreCurrentLoopNameLoopWorkProfiler(i)
            if not c[1] then error(c[2], 0) end
        end)
    end,
    
    PublishWindowLoopWorkProfiler = function()
        local G = y.LoopWorkProfiler
        local V = G.StatsLoopWorkProfiler 
        G.StatsLoopWorkProfiler = {}
        local Z = {}
        for G, V in pairs(V) do
            if type(V) == "table" and ((tonumber(V.samples) or 0)) > 0 then
                Z[#Z + 1] = {
                    label = tostring(G),
                    total = tonumber(V.total) or 0,
                    maximum = tonumber(V.maximum) or 0,
                    samples = tonumber(V.samples) or 0
                }
            end
        end 
        table.sort(Z, function(G, V)
            if G.total ~= V.total then return G.total > V.total end
            return G.label < V.label
        end)
        local j = G.WindowSecondsLoopWorkProfiler
        local i = {string.format("<b>Active loop work • last %ds</b>", j)}
        if #Z == 0 then
            i[#i + 1] = "<font color='#AFAFAF'>No tracked loop work in this window.</font>"
        else
            for G, V in ipairs(Z) do
                local y = V.total / math.max(V.samples, 1)
                i[#i + 1] = string.format("<font color='#66CCFF'>%s</font> | last %ds: <font color='#FFFFFF'>%.4fs</font> | avg: <font color='#CFCFCF'>%.6fs</font> | max: <font color='#FFCC66'>%.6fs</font> | x%d", V.label, j, V.total, y, V.maximum, V.samples)
            end
        end 
        G.SetLabelTextLoopWorkProfiler(table.concat(i, "\n"))
        return true
    end,
    
    StartLoopWorkProfiler = function()
        local G = y.LoopWorkProfiler
        if G.EnabledLoopWorkProfiler == true then return false end 
        G.EnabledLoopWorkProfiler = true 
        G.StatsLoopWorkProfiler = {}
        G.ReporterGenerationLoopWorkProfiler += 1 
        j = G.TaskProxyLoopWorkProfiler 
        G.SetLabelTextLoopWorkProfiler(string.format("<font color='#FFCC66'>Collecting the first %d-second window...</font>", G.WindowSecondsLoopWorkProfiler))
        local V = G.ReporterGenerationLoopWorkProfiler 
        Z.spawn(function()
            while G.EnabledLoopWorkProfiler == true and V == G.ReporterGenerationLoopWorkProfiler do
                Z.wait(G.WindowSecondsLoopWorkProfiler)
                if G.EnabledLoopWorkProfiler == true and V == G.ReporterGenerationLoopWorkProfiler then
                    G.PublishWindowLoopWorkProfiler()
                end
            end
        end)
        return true
    end,
    
    StopLoopWorkProfiler = function()
        local G = y.LoopWorkProfiler 
        G.EnabledLoopWorkProfiler = false 
        G.ReporterGenerationLoopWorkProfiler += 1 
        G.StatsLoopWorkProfiler = {}
        table.clear(G.ActiveStartedAtByCoroutineLoopWorkProfiler)
        j = Z 
        G.SetLabelTextLoopWorkProfiler("<font color='#AFAFAF'>Loop tracking stopped.</font>")
        return true
    end
}

y.LoopWorkProfiler.TaskProxyLoopWorkProfiler = setmetatable({
    wait = function(G)
        local V = y.LoopWorkProfiler
        if V.EnabledLoopWorkProfiler == true then
            V.FinishCurrentSliceLoopWorkProfiler()
        end
        local j = Z.wait(G)
        if V.EnabledLoopWorkProfiler == true then
            V.ResumeCurrentSliceLoopWorkProfiler()
        end
        return j
    end,
    spawn = function(G, ...)
        local V = y.LoopWorkProfiler
        local j = coroutine.running()
        local i = nil
        if j then
            i = V.LabelsByCoroutineLoopWorkProfiler[j]
        end
        if i then
            return V.SpawnNamedLoopWorkProfiler(i, G, ...)
        end
        return Z.spawn(G, ...)
    end
}, {__index = Z})

local L = {
    fps_boost_enabled = false,
    full_performance_mode = false,
    remove_plants = false,
    remove_weather_visuals = false,
    sprinkler_time_esp_enabled = true,
    high_mode = false,
    server_project_kick_public = false,
    stack_keep_overrides_enabled = false,
    stack_keep_overrides = {},
    total_control_enabled = false,
    farm_default_placement = B.Default,
    farm_placement_mode_options_migration_v1 = false,
    garden_items_use_player_walk = true,
    weather_kick_rejoin_enabled = true,
    weather_kick_enabled = false,
    weather_kick_selected = {},
    seed_pro = {
        seed_pro_enabled = false,
        seed_pro_seeds_to_plant = {},
        seed_pro_place_mode = {},
        seed_pro_targetperplant = 10,
        seed_pro_delay = .1,
        seed_pro_saved_pos = {},
        seed_pro_rejoin = false,
        seed_pro_rejoin_time = 0,
        seed_pro_rejoin_growth_length = l,
        seed_pro_sync_guild_score_length = false,
        seed_pro_water_high_length_found_plant = false,
        seed_pro_webhook_highest_length = false
    },
    gift_send_enabled = false,
    gift_receive_enabled = false,
    gift_receive_mode = "Trusted Only",
    gift_send_targets = {},
    gift_receive_trusted = {},
    gift_receive_item_whitelist = {},
    gift_fruit_list = {},
    gift_min_weight = 0,
    gift_max_weight = 89,
    gift_mutation_whitelist = {},
    gift_mutation_blacklist = {},
    gift_variant_whitelist = {},
    gift_variant_blacklist = {},
    gift_max_per_cycle = 1,
    gift_delay = 1.25,
    gift_wait_timeout = 8,
    gift_preview_only = true,
    gift_keep_amount_per_fruit = 0,
    gift_only_when_backpack_over = 0,
    gift_send_order = "Lowest Weight First",
    gift_protect_favourites = true,
    gift_drop_pickup_enabled = false,
    gift_drop_pickup_mode = "Trusted Only",
    gift_drop_pickup_from = {},
    gift_drop_pickup_categories = {HarvestedFruits = true},
    gift_drop_pickup_use_player_walk = false,
    auto_drop_items_enabled = false,
    auto_drop_preview_only = true,
    auto_drop_categories = {HarvestedFruits = true, Seeds = true},
    auto_drop_fruit_list = {},
    auto_drop_min_weight = 0,
    auto_drop_max_weight = 89,
    auto_drop_mutation_whitelist = {},
    auto_drop_mutation_blacklist = {},
    auto_drop_variant_whitelist = {},
    auto_drop_variant_blacklist = {},
    auto_drop_protect_favourites = true,
    auto_drop_keep_amount_per_fruit = 0,
    auto_drop_seed_list = {},
    auto_drop_item_names = {},
    auto_drop_pet_selected = {},
    auto_drop_pet_protected = {},
    auto_drop_pet_rarity_whitelist = {},
    auto_drop_pet_rarity_blacklist = {},
    auto_drop_pet_size_whitelist = {},
    auto_drop_pet_size_blacklist = {},
    auto_drop_pet_variant_whitelist = {},
    auto_drop_pet_variant_blacklist = {},
    auto_drop_pet_keep_amount = 0,
    auto_drop_pet_protect_equipped = true,
    auto_drop_max_per_cycle = 1,
    auto_drop_delay = .75,
    auto_drop_order = "Fruits Lowest Weight",
    seed_drop_pick_enabled = false,
    seed_drop_pick_selected = {},
    seed_drop_pick_rejoin_limit = 100,
    seed_drop_pick_rejoin_count = 0,
    seed_drop_pick_rejoin_delay = 10,
    mutation_seed_placer_enabled = false,
    mutation_seed_placer_seed = {},
    mutation_seed_placer_keep_plants = {},
    mutation_seed_placer_seed_count = 1,
    mutation_seed_placer_place_delay = .1,
    mutation_seed_placer_rejoin = false,
    mutation_seed_placer_rejoin_delay = 10,
    mutation_seed_placer_rejoin_amount = 10,
    mutation_seed_placer_rejoin_count = 0,
    mutation_seed_placer_webhook_success = true,
    mutation_seed_placer_webhook_failure = false,
    mutation_seed_placer_shovel_failed = false,
    auto_expand_garden = false,
    auto_expand_garden_max_slot = 2,
    auto_expand_pet_inventory = false,
    auto_expand_pet_inventory_max_upgrade = 1,
    potted_weather_guard_enabled = false,
    potted_weather_guard_place_mode = "Saved Location",
    potted_weather_guard_selected_plants = {},
    potted_weather_guard_weather_selected = {},
    potted_weather_guard_saved_cframe = {},
    potted_weather_guard_place_same_spot = false,
    potted_weather_guard_max_per_cycle = 3,
    potted_weather_guard_action_delay = .3,
    potted_weather_guard_y_step = 4,
    potted_weather_guard_fruit_min_kg = 0,
    potted_weather_guard_fruit_max_kg = 100000000,
    potted_weather_guard_plant_mutations = {},
    pet_inventory_min_sheckles_enabled = false,
    pet_inventory_min_sheckles = 0,
    player_speed_enabled = false,
    player_speed_value = 80,
    web_api_key = "",
    webhook_enabled = true,
    webhook_url = "",
    webhook_pet_buys = true,
    webhook_mail_manual = true,
    webhook_mail_auto = true,
    webhook_mail_claims = true,
    webhook_event_seeds = true,
    dragon_egg_opener_enabled = true,
    egg_hatcher_enabled = false,
    egg_hatcher_selected = {},
    egg_hatcher_protected = {},
    egg_hatcher_delay = .35,
    egg_hatcher_max_per_cycle = 1,
    egg_hatcher_equip_tool = true,
    egg_hatcher_keep_pets = {},
    egg_hatcher_keep_rarities = {},
    egg_hatcher_keep_sizes = {},
    egg_hatcher_keep_variants = {},
    egg_hatcher_keep_super_rarity = true,
    egg_hatcher_pet_keep_filters = {},
    egg_hatcher_rejoin_delay = 15,
    egg_hatcher_rejoin_after_hatch = false,
    egg_hatcher_rejoin_open_limit = 0,
    egg_hatcher_pause_other_systems = false,
    egg_hatcher_webhook_enabled = true,
    egg_hatcher_webhook_pets = {},
    egg_hatcher_webhook_rarities = {},
    egg_hatcher_webhook_sizes = {},
    egg_hatcher_webhook_variants = {},
    seed_pack_opener_enabled = false,
    seed_pack_opener_selected = {},
    seed_pack_opener_protected = {},
    seed_pack_opener_delay = .35,
    seed_pack_opener_max_per_cycle = 1,
    seed_pack_opener_equip_tool = true,
    seed_pack_opener_webhook_enabled = true,
    seed_pack_opener_webhook_seeds = {},
    seed_pack_opener_webhook_rarities = {},
    pet_finder_enabled = false,
    pet_finder_buy_list = {},
    pet_finder_auto_hop = false,
    pet_finder_hop_minutes = 5,
    pet_finder_purchase_log = {},
    pet_tame_enabled = false,
    pet_tame_rarities = {},
    pet_tame_webhook = false,
    pet_tame_public_server_rejoin = false,
    water_plant_wait_effect = false,
    water_plant_delay = 0,
    auto_water_plants = false,
    water_plant_selected_cans = {},
    water_plant_mode = "Growing Plant",
    water_plant_target_plant = "",
    water_plant_saved_position = {},
    hide_player_ui = false,
    plant_fruit_esp_fruit_enabled = false,
    plant_fruit_esp_plant_enabled = false,
    plant_fruit_esp_names = {},
    plant_fruit_esp_min_length = X,
    plant_fruit_esp_max_length = h,
    plant_fruit_esp_min_kg = 0,
    plant_fruit_esp_max_kg = 100000000,
    plant_fruit_esp_max_distance = 150,
    backpack_fruit_price_esp_enabled = false,
    backpack_fruit_total_value_esp_enabled = false,
    auto_fruit_favourite_enabled = false,
    auto_fruit_favourite_names = {},
    auto_fruit_favourite_min_kg = 0,
    auto_fruit_favourite_max_kg = 100000000,
    auto_fruit_favourite_mutations = {},
    auto_fruit_favourite_variants = {},
    auto_fruit_favourite_max_value = 0,
    manual_fruit_favourite_names = {},
    manual_fruit_favourite_min_kg = 0,
    manual_fruit_favourite_max_kg = 100000000,
    manual_fruit_favourite_mutations = {},
    manual_fruit_favourite_variants = {},
    manual_fruit_favourite_max_value = 0,
    water_plant_weather_enabled = false,
    water_plant_weather_selected = {},
    friend_garden_care_enabled = false,
    friend_garden_care_friends = {},
    friend_garden_care_location_mode = B.UseDefault,
    friend_garden_care_saved_positions = {},
    friend_garden_care_watering_cans = {},
    friend_garden_care_water_growing_plants = false,
    friend_garden_care_use_speed_pets = true,
    friend_garden_care_sprinklers = {},
    friend_garden_care_check_within_studs = false,
    friend_garden_care_placement_delay = .15,
    friend_garden_care_watering_delay = r,
    friend_garden_care_max_watering = 0,
    friend_garden_care_restart_cycle = false,
    friend_garden_care_rejoin_new = false,
    sprinkler_place_weather_enabled = false,
    sprinkler_place_weather_selected = {},
    auto_sprinkler_place = false,
    sprinkler_replace_near_expiry_enabled = false,
    sprinkler_place_selected = {},
    sprinkler_place_default_target = 1,
    sprinkler_place_overrides = {},
    sprinkler_place_mode = B.UseDefault,
    sprinkler_place_target_plant = "",
    sprinkler_place_saved_position = {},
    sprinkler_place_teleport = false,
    sprinkler_place_delay = .6,
    shovel_plant_variant_blacklist = {},
    sell_when_backpack_full = false,
    auto_collect_event_seeds = true,
    auto_collect_drop_seeds = true,
    is_frist_run = false,
    seed_avoid = {},
    gear_shop_avoid = {},
    shop_selected_migration_v1 = false,
    seed_shop_buy_selected = {},
    enabled_seed_shop = false,
    seed_shop_min_sheckles_enabled = false,
    seed_shop_min_sheckles = 0,
    seed_shop_trigger_enabled = false,
    seed_shop_trigger_name = "Any Time",
    gear_shop_buy_selected = {},
    enabled_gear_shop = false,
    gear_shop_min_sheckles_enabled = false,
    gear_shop_min_sheckles = 0,
    gear_shop_trigger_enabled = false,
    gear_shop_trigger_name = "Any Time",
    crate_shop_buy_selected = {},
    enabled_crate_shop = false,
    crate_shop_min_sheckles_enabled = false,
    crate_shop_min_sheckles = 0,
    crate_shop_trigger_enabled = false,
    crate_shop_trigger_name = "Any Time",
    fast_auction_enabled = false,
    fast_auction_min_percent = 50,
    fast_auction_rejoin = false,
    fast_auction_rejoin_attempts = 10,
    auctioneer_enabled = false,
    auctioneer_preview_only = true,
    auctioneer_buy_selected = {},
    auctioneer_blacklisted_items = {},
    auctioneer_min_sheckles = 0,
    auctioneer_min_percent = 50,
    auctioneer_webhook_success = true,
    auctioneer_webhook_fail = false,
    auctioneer_overrides = {},
    auto_collect_fruit_enabled = false,
    always_protect_eclipse_bloom = false,
    eclipse_weather_harvest_enabled = false,
    lite_fruit_collection = false,
    lite_fruit_collection_speed = 40,
    fruit_collect_nolimits = false,
    fruit_collect_prevent_destroy_plants = false,
    collect_fruit_list = {},
    collect_min_weight = 0,
    collect_max_weight = 150,
    collect_mutation_whitelist = {},
    collect_mutation_blacklist = {},
    collect_variant_whitelist = {},
    collect_variant_blacklist = {},
    collect_sort_mode = "Default",
    collect_fruit_overrides = {},
    auto_seedplace = false,
    smart_seed_progression_enabled = false,
    smart_seed_progression_mutation_seeds_enabled = false,
    smart_seed_progression_prevent_placement_seeds = {},
    smart_seed_progression_prevent_shovel_plants = {
        ["Hypno Bloom"] = true,
        ["Moon Bloom"] = true,
        ["Briar Rose"] = true,
        ["Venom Spitter"] = true,
        ["Dragon's Breath"] = true,
        ["Venus Fly Trap"] = true
    },
    smart_seed_progression_prevent_shovel_rarity = {Super = true, Secret = true},
    allowed_seedsplace = {},
    seed_place_default_target = 10,
    seed_place_delay = .3,
    seed_place_mode = "Random",
    seed_place_saved_position = {},
    seed_place_max_garden_plants = 800,
    seed_place_overrides = {},
    seed_place_wall_mode = false,
    seed_place_stack_mode = false,
    seed_place_stack_mode_underground = false,
    auto_sell_sellallinventory = false,
    sell_use_filters = false,
    sell_fruit_list = {},
    sell_min_weight = 0,
    sell_max_weight = 89,
    sell_mutation_whitelist = {},
    sell_mutation_blacklist = {},
    sell_variant_whitelist = {},
    sell_variant_blacklist = {},
    sell_multiplier_enabled = false,
    sell_multiplier_collect_only = true,
    sell_multiplier_show_live = false,
    sell_multiplier_board_selected = {},
    sell_multiplier_overrides = {},
    auto_sell_pets = false,
    pet_sell_preview_only = true,
    pet_sell_selected = {},
    pet_sell_protected = {},
    pet_sell_protected_ids = {},
    pet_sell_duplicate_only = true,
    pet_sell_keep_amount = 1,
    pet_sell_max_per_cycle = 3,
    pet_sell_delay = .25,
    pet_sell_max_rarity = "Rare",
    pet_sell_max_base_price = 0,
    pet_sell_protect_rainbow = true,
    pet_sell_protect_big_huge = true,
    pet_sell_size_whitelist = {},
    pet_sell_size_blacklist = {},
    pet_sell_variant_whitelist = {},
    pet_sell_variant_blacklist = {},
    turbo_sell = false,
    hide_log_ui = false,
    collection_teleport = true,
    char_farm_middle = false,
    auto_shovel_fruits = false,
    shovel_fruit_types = {},
    shovel_mutation_whitelist = {},
    shovel_mutation_blacklist = {},
    shovel_min_weight = 0,
    shovel_max_weight = 99,
    shovel_variants = {Normal = true, Gold = true, Rainbow = true},
    fast_plant_shovel = {
        enabled = false,
        plant_types = {},
        min_height = 0,
        max_height = 200,
        variants = {},
        protected_variants = {},
        include_growing = false,
        plants_keep = 10
    },
    auto_shovel_plants = false,
    shovel_plant_types = {},
    shovel_plant_min_height = 0,
    shovel_plant_max_height = 200,
    shovel_plant_variants = {},
    shovel_growing_plants = false,
    shovel_plants_keep = 10,
    auto_trowel_plants = false,
    trowel_plant_types = {},
    trowel_use_fixed_spot = true,
    trowel_fixed_placement = B.UseDefault,
    trowel_saved_position = {},
    pet_return_farm = false,
    pet_return_farm_timer = 60,
    pet_equip_enabled = false,
    pet_equip_log_enabled = true,
    pet_equip_restore_previous = true,
    pet_equip_protect_rainbow = true,
    pet_equip_protect_big_huge = true,
    pet_equip_protect_super_secret = true,
    pet_equip_protected_names = {},
    pet_equip_protected_ids = {},
    pet_equip_rules = {},
    pet_equip_active_rule_id = "",
    pet_equip_manual_rule_id = "",
    pet_equip_restore_snapshot = {},
    pet_triggers_v2_enabled = false,
    pet_triggers_v2_rules = {},
    mail_manual_batch_together = false,
    mail_auto_batch_together = false,
    mail_auto_send_enabled = false,
    mail_value_manual_usernames = "",
    mail_value_manual_each = 0,
    mail_value_auto_usernames = "",
    mail_value_auto_each = 0,
    mail_value_auto_enabled = false,
    mail_value_progress = {},
    mail_auto_accept = false,
    mail_auto_accept_multiplier_rules = {},
    mail_include_comment = false,
    mail_next_send_at = 0,
    mail_manual_order = {},
    mail_auto_rules = {},
    mail_receipts = {},
    mail_web_completed_orders = {},
    mail_ignore_batch_limit = false,
    auto_use_daily_deal = false,
    daily_deal_status_enabled = false,
    daily_deal_min_backpack_value = 0,
    auto_double_or_nothing = false,
    double_or_nothing_target_streak = 3,
    double_or_nothing_roll_delay = .15,
    double_or_nothing_webhook_win = true,
    double_or_nothing_webhook_loss = false,
    step_teleport_speed = 60,
    save_sync_online_enabled = false,
    save_sync_auto_pull_enabled = false,
    save_sync_share_code = "",
    save_sync_own_share_code = "",
    save_sync_own_revision = 0,
    save_sync_pull_revision = 0,
    save_sync_pull_hash = "",
    save_sync_last_hash = ""
}

local m = type(getgenv) == "function" and getgenv() or _G
local K = type(m.gag2_config) == "table" and m.gag2_config or nil 
J.SaveSyncDebugEnabled = m.is_debug == true 
J.player_userid = i.LocalPlayer.UserId

if not J.player_userid then
    warn("Invalid player detected.")
    return
end 

J.alt_Plants_Physical = J.alt_Plants_Physical or {}
J.MakeAltFolder = function(G)
    if not G then
        warn("MakeAltFolder requires a userId!")
        return nil
    end
    local V = tostring(G) .. "_Plants"
    local y = i.ReplicatedStorage:FindFirstChild(V)
    if y then
        J.alt_Plants_Physical[G] = y
        return y
    end
    local Z = Instance.new("Folder")
    Z.Name = V 
    Z.Parent = i.ReplicatedFirst 
    J.alt_Plants_Physical[G] = Z
    return Z
end 

J.MakeAltFolder(J.player_userid)

local b = "exotichub99"
if not isfolder(b) then
    makefolder(b)
end

local S = b .. ("/" .. (tostring(J.player_userid) .. "gag2.json"))

d.Config = {
    Excluded = {
        pet_finder_purchase_log = true,
        mail_manual_batch_together = true,
        mail_next_send_at = true,
        mail_manual_order = true,
        mail_value_manual_usernames = true,
        mail_value_manual_each = true,
        mail_value_progress = true,
        mail_receipts = true,
        mail_web_completed_orders = true,
        save_sync_online_enabled = true,
        save_sync_auto_pull_enabled = true,
        save_sync_share_code = true,
        save_sync_own_share_code = true,
        save_sync_own_revision = true,
        save_sync_pull_revision = true,
        save_sync_pull_hash = true,
        save_sync_last_hash = true
    },
    OnlineExcluded = {
        mail_manual_batch_together = true,
        mail_next_send_at = true,
        mail_manual_order = true,
        mail_value_manual_usernames = true,
        mail_value_manual_each = true,
        mail_value_progress = true,
        mail_receipts = true,
        mail_web_completed_orders = true,
        save_sync_online_enabled = true,
        save_sync_auto_pull_enabled = true,
        save_sync_share_code = true,
        save_sync_own_share_code = true,
        save_sync_own_revision = true,
        save_sync_pull_revision = true,
        save_sync_pull_hash = true,
        save_sync_last_hash = true
    },
    OverrideEnabled = type(K) == "table",
    
    ToLua = function(G, V)
        V = tonumber(V) or 0
        local y = type(G)
        if y == "string" then
            return string.format("%q", G)
        end
        if y == "number" or y == "boolean" then
            return tostring(G)
        end
        if y ~= "table" then
            return "nil"
        end
        local Z = {}
        for G in pairs(G) do
            table.insert(Z, G)
        end
        if #Z == 0 then
            return "{}"
        end 
        table.sort(Z, function(G, V)
            if type(G) == type(V) then
                if type(G) == "number" then
                    return G < V
                end
                return tostring(G) < tostring(V)
            end
            return type(G) < type(V)
        end)
        local j = string.rep("    ", V)
        local i = string.rep("    ", V + 1)
        local c = {"{"}
        for y, Z in ipairs(Z) do
            local j
            if type(Z) == "string" and Z:match("^[%a_][%w_]*$") then
                j = Z
            else
                j = string.format("[%s]", d.Config.ToLua(Z, 0))
            end 
            table.insert(c, string.format("%s%s = %s,", i, j, d.Config.ToLua(G[Z], V + 1)))
        end 
        table.insert(c, j .. "}")
        return table.concat(c, "\n")
    end,
    
    CopyTable = function(G)
        if type(G) ~= "table" then
            return G
        end
        local V = {}
        for G, y in pairs(G) do
            V[G] = d.Config.CopyTable(y)
        end
        return V
    end,
    
    Merge = function(G, V, y)
        if type(G) ~= "table" or type(V) ~= "table" then
            return false
        end
        for V, Z in pairs(V) do
            local j = G[V]
            if y and j == nil then
                continue
            end
            if type(j) == "table" and type(Z) == "table" then
                d.Config.Merge(j, Z, false)
            elseif j == nil or type(j) == type(Z) then
                G[V] = d.Config.CopyTable(Z)
            end
        end
        return true
    end,
    
    ApplyOverride = function()
        if not d.Config.OverrideEnabled then
            return false
        end
        local G = {}
        for V in pairs(d.Config.OnlineExcluded) do
            G[V] = d.Config.CopyTable(L[V])
        end
        local V = d.Config.Merge(L, K, true)
        for G, V in pairs(G) do
            L[G] = V
        end
        return V
    end,
    
    GetCopyData = function()
        local G = {}
        for V, y in pairs(L) do
            if not d.Config.Excluded[V] then
                G[V] = y
            end
        end
        return G
    end,
    
    GetOnlineData = function()
        local G = {}
        for V, y in pairs(L) do
            if not d.Config.OnlineExcluded[V] then
                G[V] = d.Config.CopyTable(y)
            end
        end
        return G
    end,
    
    ApplyRuntimeGlobalOption = function(G)
        local V = m[G]
        local y = L[G]
        if V == nil or y == nil then
            return false
        end
        if type(y) == "number" then
            local Z = tonumber(V)
            if Z == nil or y == Z then
                return false
            end 
            L[G] = Z
            return true
        end
        if type(y) == "boolean" then
            if type(V) ~= "boolean" or y == V then
                return false
            end 
            L[G] = V
            return true
        end
        if type(y) == "string" then
            if type(V) ~= "string" then
                return false
            end 
            V = V:match("^%s*(.-)%s*$") or ""
            if V == "" or y == V then
                return false
            end 
            L[G] = V
            return true
        end
        if type(y) == "table" then
            if type(V) ~= "table" or next(V) == nil then
                return false
            end 
            L[G] = d.Config.CopyTable(V)
            return true
        end
        return false
    end,
    
    ApplyRuntimeGlobalOptions = function()
        local G = false
        local V = {
            "web_api_key",
            "webhook_url", "webhook_enabled", "total_control_enabled",
            "farm_default_placement", "mail_auto_accept",
            "server_project_kick_public",
            "smart_seed_progression_prevent_placement_seeds", "smart_seed_progression_prevent_shovel_plants",
            "smart_seed_progression_mutation_seeds_enabled", "smart_seed_progression_prevent_shovel_rarity",
            "mail_auto_send_enabled",
            "mail_auto_batch_together", "remove_plants",
            "remove_weather_visuals", "fps_boost_enabled", "full_performance_mode"
        }
        for V, y in ipairs(V) do
            if d.Config.ApplyRuntimeGlobalOption(y) then
                G = true
            end
        end
        return G
    end,
    
    ApplyRuntimeSyncOptions = function()
        local G = d.Config.ApplyRuntimeGlobalOptions()
        if m.share_code ~= nil then
            local V = ((tostring(m.share_code or "")):gsub("%s+", "")):lower()
            if V ~= tostring(L.save_sync_share_code or "") then
                L.save_sync_share_code = V 
                L.save_sync_pull_revision = 0 
                L.save_sync_pull_hash = "" 
                G = true
            end
        end
        if m.share_autosync ~= nil then
            local V = m.share_autosync == true
            if L.save_sync_auto_pull_enabled ~= V then
                L.save_sync_auto_pull_enabled = V 
                G = true
            end
        end
        if L.save_sync_is_debug ~= nil then
            L.save_sync_is_debug = nil 
            G = true
        end
        if J.SaveSyncPremiumAtStartup ~= true then
            if L.save_sync_online_enabled == true then
                L.save_sync_online_enabled = false 
                G = true
            end
            if L.save_sync_auto_pull_enabled == true then
                L.save_sync_auto_pull_enabled = false 
                G = true
            end
        end
        return G
    end,
    
    BuildCopyText = function()
        local G = d.Config.GetCopyData()
        if type(G) ~= "table" then
            return nil
        end
        local V, y = pcall(function()
            return "getgenv().gag2_config = " .. d.Config.ToLua(G, 0)
        end)
        if not V then
            return nil
        end
        return y
    end,
    
    BuildCopyWithLoaderText = function()
        local G = d.Config.BuildCopyText()
        if type(G) ~= "string" or G == "" then
            return nil
        end
        return table.concat({
            "getgenv().mode = \"noui\"",
            "getgenv().exo_key = \"YOUR_KEY\"", "getgenv().share_code = \"YOUR_SHARE_CODE\"", "getgenv().share_autosync = true", "",
            G,
            "", "loadstring(game:HttpGet(\"https://exotichub.app/auto.lua\"))()"
        }, "\n")
    end,
    
    BuildShareLauncherText = function()
        local G = (tostring(L.save_sync_own_share_code or "")):gsub("%s+", "")
        if G == "" then
            G = "YOUR_SHARE_CODE"
        end
        return table.concat({
            "-- Enter your key here.",
            "getgenv().exo_key = \"YOUR_KEY\"",
            "",
            "-- optional", "getgenv().mode = \"noui\"", "",
            "-- Enter the share code shown on your main account.", "getgenv().share_code = \"" .. (G .. "\""), "-- Keep it enabled to continue to get lastest sync data from your main account.",
            "getgenv().share_autosync = true", "",
            "loadstring(game:HttpGet(\"https://exotichub.app/auto.lua\"))()"
        }, "\n")
    end
}

d.Save = {
    RequireSave = false,
    
    SaveData = function(G)
        if d.Config.OverrideEnabled then
            return false
        end
        if G then
            d.Save.SaveDataSync()
            return true
        end 
        d.Save.RequireSave = true
        return true
    end,
    
    LoadData = function()
        if not isfile(S) then
            return
        end
        local G = readfile(S)
        if not G or G == "" then
            return
        end
        local V, y = pcall(i.HttpService.JSONDecode, i.HttpService, G)
        if not V then
            return
        end
        local function Z(G, V)
            for V, y in pairs(V) do
                local j = G[V]
                if type(y) == "table" and type(j) == "table" then
                    Z(j, y)
                else
                    G[V] = y
                end
            end
            return G
        end 
        Z(L, y)
    end,
    
    SaveDataSync = function()
        if d.Config.OverrideEnabled then
            return false
        end
        local G, V = pcall(function()
            return i.HttpService:JSONEncode(L)
        end)
        if G then
            writefile(S, V)
            return true
        else
            return false
        end
    end,
    
    SaveLoop = function()
        if d.Config.OverrideEnabled then
            return false
        end 
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Save Data", function()
            while true do
                j.wait(.5)
                if d.Config.OverrideEnabled then
                    return false
                end
                if d.Save.RequireSave then
                    d.Save.RequireSave = false 
                    d.Save.SaveDataSync()
                end
            end
        end)
        return false
    end
}

if d.Config.OverrideEnabled then
    d.Config.ApplyOverride()
else
    d.Save.LoadData()
end

if d.Config.ApplyRuntimeSyncOptions() and not d.Config.OverrideEnabled then
    d.Save.SaveDataSync()
end

if L.farm_placement_mode_options_migration_v1 ~= true then
    local G = {
        "seed_place_mode", "sprinkler_place_mode",
        "water_plant_mode", "friend_garden_care_location_mode",
        "potted_weather_guard_place_mode"
    }
    for G, V in ipairs(G) do
        if L[V] == B.Default then
            L[V] = B.UseDefault
        end
    end 
    L.farm_placement_mode_options_migration_v1 = true 
    d.Save.SaveDataSync()
end

if L.seed_place_mode == "Farm Corner" then
    L.seed_place_mode = B.UseDefault 
    d.Save.SaveDataSync()
end 

d.Save.SaveLoop()

local z = false
if L.auto_fruit_unfavourite_enabled ~= nil then
    L.auto_fruit_unfavourite_enabled = nil 
    z = true
end
if L.auto_fruit_favourite_managed ~= nil then
    L.auto_fruit_favourite_managed = nil 
    z = true
end
if z then
    d.Save.SaveData()
end 

i.Backpack = i.LocalPlayer:WaitForChild("Backpack")
i.PlayerGui = i.LocalPlayer:WaitForChild("PlayerGui")

local f = 130
while true do
    j.wait()
    local G = i.LocalPlayer:GetAttribute("PlotId")
    if not G then
        f = f - 1
    else
        break
    end
    if f < 1 then
        pcall(function()
            i.TeleportService:Teleport(game.PlaceId)
        end)
        j.wait(10)
        break
    end 
    j.wait(1)
end 

i.Character = i.LocalPlayer.Character or i.LocalPlayer.CharacterAdded:Wait()
i.LocalPlayer.CharacterAdded:Connect(function(G)
    i.Character = G
end)
i.LocalPlayer.CharacterRemoving:Connect(function(G)
    if i.Character == G then
        i.Character = nil
    end
end)

i.SharedData = i.ReplicatedStorage:FindFirstChild("SharedData")
i.SharedModules = i.ReplicatedStorage:FindFirstChild("SharedModules")
i.StockValues = i.ReplicatedStorage:FindFirstChild("StockValues")
i.CrateShop = i.StockValues:FindFirstChild("CrateShop")
i.ExclusiveShop = i.StockValues:FindFirstChild("ExclusiveShop")
i.GearShop = i.StockValues:FindFirstChild("GearShop")
i.SeedShop = i.StockValues:FindFirstChild("SeedShop")
i.fails = 0

function i.safeRequire(G)
    local V, y = pcall(require, G)
    if not V or y == nil then
        warn("[SafeRequire] Failed to load:", G)
        i.fails = i.fails + 1
        return nil
    end
    return y
end 

y.SaveDataKickRemoteRejoin = {
    PayloadUrlSaveDataKickRemoteRejoin = "https://exotichub.app/getautokickdetection.lua",
    CacheFileSaveDataKickRemoteRejoin = "exo_save_data_kick_rejoin_queue.lua",
    StartedSaveDataKickRemoteRejoin = false,
    
    GetQueueSaveDataKickRemoteRejoin = function()
        if type(queue_on_teleport) == "function" then
            return queue_on_teleport
        end
        if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
            return syn.queue_on_teleport
        end
        if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
            return fluxus.queue_on_teleport
        end
        return nil
    end,
    
    IsValidPayloadSaveDataKickRemoteRejoin = function(G)
        if type(G) ~= "string" or #G < 500 then
            return false
        end
        return G:find("EXO_SAVE_DATA_KICK_REMOTE_PAYLOAD_V1", 1, true) ~= nil
    end,
    
    ReadCachedPayloadSaveDataKickRemoteRejoin = function()
        local G = y.SaveDataKickRemoteRejoin.CacheFileSaveDataKickRemoteRejoin
        if type(isfile) ~= "function" or type(readfile) ~= "function" or not isfile(G) then
            return nil
        end
        local V, Z = pcall(function()
            return readfile(G)
        end)
        if V and y.SaveDataKickRemoteRejoin.IsValidPayloadSaveDataKickRemoteRejoin(Z) then
            return Z
        end
        return nil
    end,
    
    FetchPayloadSaveDataKickRemoteRejoin = function()
        local G = y.SaveDataKickRemoteRejoin.PayloadUrlSaveDataKickRemoteRejoin
        local V, Z = pcall(function()
            return game:HttpGet(G, true)
        end)
        if V and y.SaveDataKickRemoteRejoin.IsValidPayloadSaveDataKickRemoteRejoin(Z) then
            return Z
        end
        return nil
    end,
    
    CachePayloadSaveDataKickRemoteRejoin = function(G)
        if type(writefile) ~= "function" then
            return false
        end
        if not y.SaveDataKickRemoteRejoin.IsValidPayloadSaveDataKickRemoteRejoin(G) then
            return false
        end
        local V = y.SaveDataKickRemoteRejoin.CacheFileSaveDataKickRemoteRejoin 
        pcall(function()
            writefile(V, G)
        end)
        return true
    end,
    
    GetPayloadSaveDataKickRemoteRejoin = function()
        local G = y.SaveDataKickRemoteRejoin.FetchPayloadSaveDataKickRemoteRejoin()
        if G then
            y.SaveDataKickRemoteRejoin.CachePayloadSaveDataKickRemoteRejoin(G)
            return G
        end
        return y.SaveDataKickRemoteRejoin.ReadCachedPayloadSaveDataKickRemoteRejoin()
    end,
    
    QueuePayloadSaveDataKickRemoteRejoin = function()
        local G = y.SaveDataKickRemoteRejoin.GetQueueSaveDataKickRemoteRejoin()
        if type(G) ~= "function" then
            warn("[EXO SaveDataKick] queue_on_teleport missing")
            return false
        end
        local V = y.SaveDataKickRemoteRejoin.CacheFileSaveDataKickRemoteRejoin
        if type(readfile) ~= "function" then
            warn("[EXO SaveDataKick] readfile missing")
            return false
        end 
        pcall(function()
            G("loadstring(readfile(\"" .. (V .. "\"))()")
        end)
        warn("[EXO SaveDataKick] queued remote cached payload")
        return true
    end,
    
    StartSaveDataKickRemoteRejoin = function()
        if y.SaveDataKickRemoteRejoin.StartedSaveDataKickRemoteRejoin then
            return false
        end 
        y.SaveDataKickRemoteRejoin.StartedSaveDataKickRemoteRejoin = true
        local G = y.SaveDataKickRemoteRejoin.GetPayloadSaveDataKickRemoteRejoin()
        if not G then
            warn("[EXO SaveDataKick] payload fetch/cache failed")
            return false
        end 
        y.SaveDataKickRemoteRejoin.CachePayloadSaveDataKickRemoteRejoin(G)
        return y.SaveDataKickRemoteRejoin.QueuePayloadSaveDataKickRemoteRejoin()
    end
}

y.SaveDataKickRemoteRejoin.StartSaveDataKickRemoteRejoin()
i.Networking = i.safeRequire(i.SharedModules:WaitForChild("Networking"))
i.SeedData = i.safeRequire(i.SharedModules:WaitForChild("SeedData"))
i.GuildCompetition = i.safeRequire(i.SharedModules:WaitForChild("GuildCompetition"))
i.GearShopData = i.safeRequire(i.SharedModules:WaitForChild("GearShopData"))
i.PetData = i.safeRequire(i.SharedData:WaitForChild("PetData"))
i.RarityVisuals = i.safeRequire(i.SharedModules:WaitForChild("RarityVisuals"))
i.ReplicaClient = i.safeRequire(i.ReplicatedStorage.ClientModules.ReplicaClient)
i.MutationDataModule = i.SharedModules:WaitForChild("MutationData")
i.MutationData = i.safeRequire(i.MutationDataModule)
i.PetSizes = i.safeRequire(i.SharedData:WaitForChild("PetSizes"))
i.PetTypes = i.safeRequire(i.SharedData:WaitForChild("PetTypes"))
i.SellValueData = i.safeRequire(i.SharedModules:WaitForChild("SellValueData"))
i.SellFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("SellFlags"))
i.MergeFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("MergeFlags"))
i.FruitVisualizerController = i.safeRequire(i.LocalPlayer.PlayerScripts.Controllers.FruitVisualizerController)
i.DroppedItems = i.Workspace:WaitForChild("DroppedItems")
i.EventSeedDrops = (i.Workspace:WaitForChild("Map")):WaitForChild("SeedPackSpawnServerLocations")
i.CollectFruitNet = i.Networking and (i.Networking.Garden and i.Networking.Garden.CollectFruit)
i.WateringcanData = i.safeRequire(i.SharedModules:WaitForChild("WateringcanData"))
i.SprinklerData = i.safeRequire(i.SharedModules:WaitForChild("SprinklerData"))
i.MushroomData = i.safeRequire(i.SharedModules:WaitForChild("MushroomData"))
i.RaccoonData = i.safeRequire(i.SharedModules:WaitForChild("RaccoonData"))
i.GnomeData = i.safeRequire(i.SharedModules:WaitForChild("GnomeData"))
i.PowerHoseData = i.safeRequire(i.SharedModules:WaitForChild("PowerHoseData"))
i.TrowelData = i.safeRequire(i.SharedModules:WaitForChild("TrowelData"))
i.PropData = i.safeRequire(i.SharedModules:WaitForChild("PropData"))
i.GardenSyncController = i.safeRequire(i.LocalPlayer.PlayerScripts.Controllers:WaitForChild("GardenSyncController"))
i.GuiController = i.safeRequire(i.LocalPlayer.PlayerScripts.Controllers:WaitForChild("GuiController"))
i.PathfindingService = game:GetService("PathfindingService")
i.TweenService = game:GetService("TweenService")
i.PetSlotPrices = i.safeRequire(i.SharedData:WaitForChild("PetSlotPrices"))
i.MailboxItemCatalog = i.safeRequire(i.LocalPlayer.PlayerScripts.Controllers.MailboxController:WaitForChild("MailboxItemCatalog"))
i.ExpansionPrices = i.safeRequire(i.SharedData:WaitForChild("ExpansionPrices"))
i.GardenFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("GardenFlags"))
i.TimeCycleData = i.safeRequire(i.SharedModules:WaitForChild("TimeCycleData"))

local t = i.SharedModules and i.SharedModules:FindFirstChild("WeatherData")
i.WeatherData = t and i.safeRequire(t) or nil 

i.PerfFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("PerfFlags"))
i.PlantVisualizerController = i.safeRequire(i.LocalPlayer.PlayerScripts.Controllers:WaitForChild("PlantVisualizerController"))
i.SeedShopFlags = i.safeRequire(i.SharedModules.Flags.SeedShopFlags)
i.GearShopFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("GearShopFlags"))
i.CrateData = i.safeRequire(i.SharedModules:WaitForChild("CrateData"))
i.CrateShopFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("CrateShopFlags"))
i.EggData = i.safeRequire(i.SharedModules:WaitForChild("EggData"))
i.SeedPackData = i.safeRequire(i.SharedModules:WaitForChild("SeedPackData"))

local M = i.SharedModules and i.SharedModules:FindFirstChild("Auctioneer")
i.Auctioneer = M and i.safeRequire(M) or nil 

local A = i.SharedModules and (i.SharedModules:FindFirstChild("Flags") and i.SharedModules.Flags:FindFirstChild("AuctioneerFlags"))
i.AuctioneerFlags = A and i.safeRequire(A) or nil 

local x = i.SharedModules and i.SharedModules:FindFirstChild("PetLureData")
i.PetLureData = x and i.safeRequire(x) or nil 

i.PlantGenerationModulesRoot = i.ReplicatedStorage:WaitForChild("PlantGenerationModules")
i.FruitGenerationModules = i.PlantGenerationModulesRoot:WaitForChild("Fruits")
i.PlantGenerationModules = i.PlantGenerationModulesRoot:WaitForChild("Plants")
i.WeightFormat = i.safeRequire(i.SharedModules:WaitForChild("WeightFormat"))
i.CalculateOvertimeGrowth = i.safeRequire(i.SharedModules:WaitForChild("CalculateOvertimeGrowth"))
i.OvertimeGrowthFlags = i.safeRequire(i.SharedModules.Flags:WaitForChild("OvertimeGrowthFlags"))
i.FruitValueCalc = i.safeRequire(i.SharedModules:WaitForChild("FruitValueCalc"))
i.GrowRateData = i.safeRequire(i.SharedModules:WaitForChild("GrowRateData"))
i.RemoteEvent = i.SharedModules.Packet.RemoteEvent 

i.FruitGenerationData = {}
i.PlantGenerationData = {}

for G, V in ipairs(i.FruitGenerationModules:GetChildren()) do
    if V:IsA("ModuleScript") then
        i.FruitGenerationData[V.Name] = i.safeRequire(V)
    end
end

for G, V in ipairs(i.PlantGenerationModules:GetChildren()) do
    if V:IsA("ModuleScript") then
        i.PlantGenerationData[V.Name] = i.safeRequire(V)
    end
end

function Addcantsleep()
    local G = getconnections or get_signal_cons
    if G then
        for G, V in pairs((G)(i.LocalPlayer.Idled)) do
            if V.Disable then
                V.Disable(V)
            elseif V.Disconnect then
                V.Disconnect(V)
            end
        end
    end
end 

pcall(function() Addcantsleep() end)
pcall(function() i.LocalPlayer:SetAttribute("AntiAfkIdleOverride", 31536000) end)

local C = G.Library
local D = G.Window
local P = type(G.IsHeadless) == "function" and G.IsHeadless() == true 

i.AppName = "Exotic Hub"
i.CurentV = "v113j"
i.invite_link_url = "https://exotichub.app/join"
i.invite_link_short = "exotichub.app/join"

local O = {
    enabled = false,
    status = "",
    snapshot = {},
    filters = {},
    goals = {},
    locks = {},
    cooldowns = {},
    cache = {}
}

J.is_forced_stop = false 
J.is_private_server = false 
J.BuySelectFruitSelected = {}
J.BuySelectFruitUi = J.BuySelectFruitUi or {}
J.FruitCollectOverrideUiRefs = J.FruitCollectOverrideUiRefs or {}
J.SellMultiplierOverrideUiRefs = J.SellMultiplierOverrideUiRefs or {}

if type(G.RegisterReset) == "function" then
    G.RegisterReset(function() J.is_pro = false end)
end 

J.RarityRank = {
    Common = 1, Uncommon = 2, Rare = 3, Epic = 4,
    Legendary = 5, Mythic = 6, Super = 7, Secret = 8
}

J.TeleportLockNames = {
    SeedPackCollector = "Seed Collection",
    SeedPlacer = "Seed Placement System",
    FruitCollector = "Fruit Collector",
    PetFarmReturn = "Pet Farm Return",
    EventCollector = "Event Collection",
    GardenItemCollector = "Garden Item Collector",
    DragonEggOpener = "Dragon Egg Opener",
    PremiumFruitCollector = "Premium Fruit Collector",
    SprinklerPlacer = "Sprinkler Placement",
    PetFinderPremium = "Pet Finder Premium",
    PetTame = "Pet Tame",
    WaterPlants = "Water Plants",
    FriendGardenCare = "Friend Garden Care",
    GiftDropPickup = "Gift Drop Pickup",
    Other = "Other"
}

J.PetAndSeedTravelTimeoutSeconds = 90 

J.GetProMessage = function()
    return "\240\159\148\146 <stroke th='0.1' joins='round' sizing='fixed' color='#8C1600'><font color='#FA2B00'> Premium Feature - Join discord server to get Key.</font></stroke>"
end 

J.RollerRemoteActive = false 
J.RollerSaveActive = false 

J.SetRollerVisual = function(G)
    G = tostring(G or "")
    local V = i.PlayerGui or (i.LocalPlayer and i.LocalPlayer:FindFirstChild("PlayerGui"))
    if G == "" or not V then return false end 
    local y = V:FindFirstChild("RollerStatusGui")
    if y then y:Destroy() end 
    local Z = Instance.new("ScreenGui")
    Z.Name = "RollerStatusGui"
    Z.ResetOnSpawn = false 
    Z.IgnoreGuiInset = true 
    Z.DisplayOrder = 2147483647 
    Z.Parent = V 
    local j = Instance.new("TextLabel")
    j.Name = "RollerStatusLabel"
    j.AnchorPoint = Vector2.new(.5, 0)
    j.Position = UDim2.fromScale(.5, .02)
    j.Size = UDim2.fromOffset(300, 48)
    j.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    j.BackgroundTransparency = .3 
    j.BorderSizePixel = 0 
    j.Text = G 
    j.TextColor3 = Color3.fromRGB(255, 255, 255)
    j.TextSize = 22 
    j.Font = Enum.Font.GothamBold 
    j.Active = false 
    j.Parent = Z 
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = j 
    return true
end 

J.IsRollerSystemActive = function(G)
    if G == "EggHatcher" then
        return L.egg_hatcher_enabled == true and L.egg_hatcher_rejoin_after_hatch == true
    end
    if G == "MutationSeedPlacer" then
        return L.mutation_seed_placer_enabled == true and L.mutation_seed_placer_rejoin == true
    end
    if G == "SeedDropPick" then
        return L.seed_drop_pick_enabled == true
    end
    if G == "FastAuction" then
        return J.GetCheckIfPro() == true and (L.fast_auction_enabled == true and L.fast_auction_rejoin == true)
    end
    if G == "FriendGardenCare" then
        return J.GetCheckIfPro() == true and (L.friend_garden_care_enabled == true and L.friend_garden_care_rejoin_new == true)
    end
    return G == "Manual"
end 

J.Roller = function(G)
    if not J.IsRollerSystemActive(G) then return false end 
    if J.RollerSaveActive == true and G ~= "Manual" then return false end 
    if J.RollerRemoteActive == true then
        J.SetRollerVisual("Roll: Active")
        return true
    end 
    i.RemoteEvent:FireServer(54, ":\247")
    J.RollerRemoteActive = true 
    J.RollerSaveActive = false 
    J.SetRollerVisual("Roll: Active")
    return true
end 

J.RollerSave = function(G)
    local V = J.IsRollerSystemActive(G)
    if J.RollerRemoteActive == true then V = true end 
    if not V then return false end 
    i.RemoteEvent:FireServer(54, " ")
    J.RollerRemoteActive = false 
    J.RollerSaveActive = true 
    J.SetRollerVisual("Roll: Save Active")
    return true
end 

local F = {
    k = 1000.0, K = 1000.0, m = 1000000.0, M = 1000000.0,
    b = 1000000000.0, B = 1000000000.0, t = 1000000000000.0, T = 1000000000000.0,
    q = 1e+015, Q = 1e+015, Qa = 1e+015, qi = 1e+018, Qi = 1e+018,
    sx = 1e+021, Sx = 1e+021, sp = 1e+024, Sp = 1e+024,
    oc = 1e+027, Oc = 1e+027, no = 1e+030, No = 1e+030,
    dc = 1e+033, Dc = 1e+033
}
local v = {"k", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}

J.Notify = function(G, V)
    G = tostring(G or "")
    if G == "" or not C or type(C.Notify) ~= "function" then return false end 
    return pcall(function() C:Notify(G, tonumber(V) or 2.5) end)
end 

q.Http = {
    GetRequestFunction = function()
        return type(syn) == "table" and syn.request or type(http) == "table" and http.request or type(http_request) == "function" and http_request or type(request) == "function" and request or type(fluxus) == "table" and fluxus.request or type(krnl) == "table" and krnl.request
    end,
    
    PostJson = function(G, V)
        if type(G) ~= "string" or G == "" or type(V) ~= "table" then
            return false, 0, "", "Invalid request"
        end 
        local y, Z = pcall(i.HttpService.JSONEncode, i.HttpService, V)
        if not y or type(Z) ~= "string" then
            return false, 0, "", "Failed to encode request"
        end 
        local j, c = pcall(function()
            local V = q.Http.GetRequestFunction()
            if type(V) == "function" then
                return V({
                    Url = G,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json", Accept = "application/json"},
                    Body = Z
                })
            end
            local y = i.HttpService:PostAsync(G, Z, Enum.HttpContentType.ApplicationJson)
            return {StatusCode = 200, Body = y}
        end)
        if not j or type(c) ~= "table" then
            return false, 0, "", tostring(c or "Request failed")
        end 
        local J = tonumber(c.StatusCode or c.Status or c.status_code) or 0
        local T = c.Body or c.body or ""
        T = type(T) == "string" and T or tostring(T or "")
        if J == 0 and T ~= "" then J = 200 end 
        local d = J >= 200 and J < 300 
        local u = nil 
        if not d then u = "HTTP " .. tostring(J) end 
        return d, J, T, u
    end
}

J.SaveSyncStatusText = ""
J.TotalControlStatusText = ""

y.SaveSync = {
    PushUrlSaveSync = "https://exotichub.app/push-data",
    PullUrlSaveSync = "https://exotichub.app/pull-sync",
    GameKeySaveSync = "gag2",
    StartedSaveSync = false,
    PushBusySaveSync = false,
    PullBusySaveSync = false,
    LastEncodedSaveSync = "",
    LastOwnPullRevisionSaveSync = 0,
    
    SetStatusSaveSync = function(G, V)
        G = tostring(G or "")
        if G == "" then J.SaveSyncStatusText = "" return false end 
        J.SaveSyncStatusText = string.format("<stroke color='#000000' thickness='1'><font color='#FFFFFF'>☁️ [Save Sync]</font> <font color='%s'>%s</font></stroke>", tostring(V or "#FFFFFF"), G)
        return true
    end,
    
    DebugSaveSync = function(G, V)
        if J.SaveSyncDebugEnabled ~= true then return false end 
        warn("[SaveSync] " .. tostring(G or "debug"))
        if V ~= nil then
            local G, y = pcall(i.HttpService.JSONEncode, i.HttpService, V)
            warn("[SaveSyncData] " .. tostring(G and y or V))
        end 
        return true
    end,
    
    IsPremiumSaveSync = function()
        return J.SaveSyncPremiumAtStartup == true
    end,
    
    DisableNonPremiumSaveSync = function(G)
        local V = false
        if L.save_sync_online_enabled == true then L.save_sync_online_enabled = false V = true end 
        if L.save_sync_auto_pull_enabled == true then L.save_sync_auto_pull_enabled = false V = true end 
        if V and d.Config.OverrideEnabled ~= true then d.Save.SaveDataSync() end 
        y.SaveSync.SetStatusSaveSync(tostring(G or "Premium required for online save"), "#FF6666")
        y.SaveSync.RefreshUiSaveSync()
        return false
    end,
    
    GuardPremiumSaveSync = function(G)
        if y.SaveSync.IsPremiumSaveSync() then return true end 
        return y.SaveSync.DisableNonPremiumSaveSync(G)
    end,
    
    CleanShareCodeSaveSync = function(G)
        G = tostring(G or "")
        G = G:gsub("%s+", "")
        return G:lower()
    end,
    
    DecodeResponseSaveSync = function(G)
        if type(G) ~= "string" or G == "" then return nil end 
        local V, y = pcall(i.HttpService.JSONDecode, i.HttpService, G)
        if not V or type(y) ~= "table" then return nil end 
        return y
    end,
    
    BuildBasePayloadSaveSync = function()
        local G = i.LocalPlayer
        return {
            profile_id = tostring(J.player_userid or G and G.UserId or ""),
            username = tostring(G and G.Name or ""),
            game_key = y.SaveSync.GameKeySaveSync
        }
    end,
    
    RefreshUiSaveSync = function()
        local G = J.SaveSyncUiRefs
        if type(G) ~= "table" then return false end 
        if G.CodeLabel and type(G.CodeLabel.SetText) == "function" then
            local V = tostring(L.save_sync_own_share_code or "")
            G.CodeLabel:SetText(V ~= "" and "Your code: <font color='#7CFC00'>" .. (V .. "</font>") or "Your code: <font color='#FFCC66'>Enable Save Online to create one</font>")
        end 
        local V = J.SaveSyncStatusText ~= "" and J.SaveSyncStatusText or "<font color='#888888'>Ready</font>"
        if G.SaveOnlineStatusLabel and type(G.SaveOnlineStatusLabel.SetText) == "function" then G.SaveOnlineStatusLabel:SetText(V) end 
        if G.RealtimeSyncStatusLabel and type(G.RealtimeSyncStatusLabel.SetText) == "function" then G.RealtimeSyncStatusLabel:SetText(V) end 
        if G.ShareCodeLabel and type(G.ShareCodeLabel.SetText) == "function" then
            local V = tostring(L.save_sync_share_code or "")
            G.ShareCodeLabel:SetText(V ~= "" and "Saved sync code: <font color='#7CFC00'>" .. (V .. "</font>") or "No sync code saved. Type a code and press Enter to save it.")
        end 
        return true
    end,
    
    ApplySettingsSaveSync = function(G, V)
        if type(G) ~= "table" then
            y.SaveSync.SetStatusSaveSync("Invalid saved data", "#FF6666")
            return false
        end 
        local Z = {}
        for G in pairs(d.Config.OnlineExcluded) do Z[G] = d.Config.CopyTable(L[G]) end 
        for G, V in pairs(G) do
            local y = L[G]
            if y == nil then continue end 
            if type(y) == type(V) then L[G] = d.Config.CopyTable(V) end
        end 
        for G, V in pairs(Z) do L[G] = V end 
        d.Save.SaveDataSync()
        y.SaveSync.SetStatusSaveSync(V == "own" and "Loaded online save" or "Applied synced settings", "#7CFC00")
        y.SaveSync.RefreshUiSaveSync()
        return true
    end,
    
    SendPushSaveSync = function(G)
        if not y.SaveSync.GuardPremiumSaveSync("Premium required for online saving") then return false, "Premium required" end 
        if y.SaveSync.PushBusySaveSync then return false, "Save request already running" end 
        if d.Config.OverrideEnabled then return false, "Config override active" end 
        local V = d.Config.GetOnlineData()
        local Z, j = pcall(i.HttpService.JSONEncode, i.HttpService, V)
        if not Z or type(j) ~= "string" then
            y.SaveSync.SetStatusSaveSync("Could not prepare save", "#FF6666")
            return false, "Could not prepare save"
        end 
        if tostring(G or "") ~= "manual" and j == y.SaveSync.LastEncodedSaveSync then
            y.SaveSync.SetStatusSaveSync("Waiting for changes", "#CFCFCF")
            y.SaveSync.RefreshUiSaveSync()
            return true, "No changes"
        end 
        local c = y.SaveSync.BuildBasePayloadSaveSync()
        c.base_revision = tonumber(L.save_sync_own_revision) or 0 
        c.json_data = V 
        y.SaveSync.PushBusySaveSync = true 
        y.SaveSync.SetStatusSaveSync("Saving online...", "#FFCC66")
        y.SaveSync.DebugSaveSync("push request", c)
        local J, T, u, g = q.Http.PostJson(y.SaveSync.PushUrlSaveSync, c)
        y.SaveSync.PushBusySaveSync = false 
        y.SaveSync.DebugSaveSync("push response " .. tostring(T), u)
        local E = y.SaveSync.DecodeResponseSaveSync(u)
        if not J and type(E) ~= "table" then
            y.SaveSync.SetStatusSaveSync(tostring(g or "Save request failed"), "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, g or "Save request failed"
        end 
        if type(E) ~= "table" then
            y.SaveSync.SetStatusSaveSync("Invalid save response", "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, "Invalid save response"
        end 
        if E.success == true then
            L.save_sync_own_share_code = tostring(E.share_code or L.save_sync_own_share_code or "")
            L.save_sync_own_revision = tonumber(E.revision) or tonumber(L.save_sync_own_revision) or 0 
            L.save_sync_last_hash = tostring(E.save_hash or L.save_sync_last_hash or "")
            y.SaveSync.LastEncodedSaveSync = j 
            d.Save.SaveDataSync()
            y.SaveSync.SetStatusSaveSync(E.changed == false and "Online save is up to date" or "Saved online", "#7CFC00")
            y.SaveSync.RefreshUiSaveSync()
            return true, "Saved online", E
        end 
        if E.conflict == true then
            L.save_sync_own_revision = tonumber(E.server_revision) or tonumber(L.save_sync_own_revision) or 0 
            d.Save.SaveDataSync()
            y.SaveSync.SetStatusSaveSync("Online save is newer. Load it first.", "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, "Conflict", E
        end 
        local a = tostring(E.msg or E.message or "Save failed")
        y.SaveSync.SetStatusSaveSync(a, "#FF6666")
        y.SaveSync.RefreshUiSaveSync()
        return false, a, E
    end,
    
    PullSaveSync = function(G, V)
        if not y.SaveSync.GuardPremiumSaveSync("Premium required for online sync") then return false, "Premium required" end 
        if y.SaveSync.PullBusySaveSync then return false, "Sync request already running" end 
        if d.Config.OverrideEnabled then return false, "Config override active" end 
        G = y.SaveSync.CleanShareCodeSaveSync(G)
        local Z = y.SaveSync.BuildBasePayloadSaveSync()
        Z.share_code = G 
        Z.local_revision = V == true and 0 or (G ~= "" and ((tonumber(L.save_sync_pull_revision) or 0)) or y.SaveSync.LastOwnPullRevisionSaveSync)
        y.SaveSync.PullBusySaveSync = true 
        y.SaveSync.SetStatusSaveSync(G == "" and "Loading online save..." or "Checking synced save...", "#FFCC66")
        y.SaveSync.DebugSaveSync("pull request", Z)
        local j, i, c, J = q.Http.PostJson(y.SaveSync.PullUrlSaveSync, Z)
        y.SaveSync.PullBusySaveSync = false 
        y.SaveSync.DebugSaveSync("pull response " .. tostring(i), c)
        local T = y.SaveSync.DecodeResponseSaveSync(c)
        if not j and type(T) ~= "table" then
            y.SaveSync.SetStatusSaveSync(tostring(J or "Sync request failed"), "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, J or "Sync request failed"
        end 
        if type(T) ~= "table" then
            y.SaveSync.SetStatusSaveSync("Invalid sync response", "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, "Invalid sync response"
        end 
        if T.success ~= true then
            local G = tostring(T.msg or T.message or "No saved data found")
            y.SaveSync.SetStatusSaveSync(G, T.found == false and "#FFCC66" or "#FF6666")
            y.SaveSync.RefreshUiSaveSync()
            return false, G, T
        end 
        local u = tonumber(T.revision) or 0 
        if T.changed == false and V ~= true then
            y.SaveSync.SetStatusSaveSync("Synced save is up to date", "#CFCFCF")
            y.SaveSync.RefreshUiSaveSync()
            return true, "No changes", T
        end 
        if type(T.json_data) ~= "table" then
            y.SaveSync.SetStatusSaveSync("No saved data to apply", "#FFCC66")
            y.SaveSync.RefreshUiSaveSync()
            return false, "No saved data to apply", T
        end 
        local g = y.SaveSync.ApplySettingsSaveSync(T.json_data, G == "" and "own" or "shared")
        if g then
            if G == "" then
                L.save_sync_own_share_code = tostring(T.share_code or L.save_sync_own_share_code or "")
                L.save_sync_own_revision = u 
                y.SaveSync.LastOwnPullRevisionSaveSync = u
            else
                L.save_sync_pull_revision = u 
                L.save_sync_pull_hash = tostring(T.save_hash or "")
            end 
            d.Save.SaveDataSync()
            y.SaveSync.RefreshUiSaveSync()
        end 
        return g, g and "Applied" or "Apply failed", T
    end,
    
    StartSaveSync = function()
        if not y.SaveSync.IsPremiumSaveSync() then
            if L.save_sync_online_enabled == true or L.save_sync_auto_pull_enabled == true then
                y.SaveSync.DisableNonPremiumSaveSync("Premium required for online save")
            end 
            return false
        end 
        if y.SaveSync.StartedSaveSync then return false end 
        y.SaveSync.StartedSaveSync = true 
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Save Sync Push", function()
            j.wait(3)
            while y.SaveSync.StartedSaveSync and not J.is_forced_stop do
                if L.save_sync_online_enabled == true then
                    local G, V = pcall(function() y.SaveSync.SendPushSaveSync("loop") end)
                    if not G then
                        warn("[SaveSyncPush]", V)
                        y.SaveSync.SetStatusSaveSync("Save loop error", "#FF6666")
                    end
                end 
                j.wait(10)
            end
        end)
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Save Sync Pull", function()
            j.wait(5)
            while y.SaveSync.StartedSaveSync and not J.is_forced_stop do
                if L.save_sync_auto_pull_enabled == true then
                    local G = y.SaveSync.CleanShareCodeSaveSync(L.save_sync_share_code)
                    if G ~= "" then
                        local V, Z = pcall(function() y.SaveSync.PullSaveSync(G, false) end)
                        if not V then
                            warn("[SaveSyncPull]", Z)
                            y.SaveSync.SetStatusSaveSync("Sync loop error", "#FF6666")
                        end
                    else
                        y.SaveSync.SetStatusSaveSync("Enter a share code", "#FFCC66")
                        y.SaveSync.RefreshUiSaveSync()
                    end
                end 
                j.wait(math.random(9, 20))
            end
        end)
        return true
    end
}

    

y.WebApi.AutoLinkSavedWebApi()

J.PlantHeightCacheById = {}

y.PlantVisualBlocker = {
    StartedPlantVisualBlocker = false,
    OriginalSpawnPlantFromDataPlantVisualBlocker = nil,
    OriginalSpawnFruitFromDataPlantVisualBlocker = nil,
    FullCleanUntilPlantVisualBlocker = 0,
    ExcludedPlantHeightFoldersPlantVisualBlocker = {Fruits = true, FruitSpawnLocations = true},
    
    IsEnabledPlantVisualBlocker = function()
        if L.full_performance_mode == true then return true end 
        return L.remove_plants
    end,
    
    SetStatusPlantVisualBlocker = function(G, V)
        J.PlantVisualBlockerStatusText = string.format("<stroke color='#000000' thickness='1'><font color='#FFFFFF'>🌱 [Plant Visuals]</font> <font color='%s'>%s</font></stroke>", tostring(V or "#FFFFFF"), tostring(G or ""))
    end,
    
    MarkFullCleanPlantVisualBlocker = function(G)
        y.PlantVisualBlocker.FullCleanUntilPlantVisualBlocker = os.clock() + math.max(tonumber(G) or 10, 1)
    end,
    
    GetPlantVisualIdsPlantVisualBlocker = function(G)
        if typeof(G) ~= "Instance" then return nil, nil end 
        local V = G:GetAttribute("UserId")
        local y = G:GetAttribute("PlantId")
        if V ~= nil and y ~= nil then return V, y end 
        local Z, j = (tostring(G.Name or "")):match("^([^_]+)_(.+)$")
        return Z, j
    end,
    
    GetPlantHeightPlantVisualBlocker = function(G, V)
        G = tostring(G or "")
        if G == "" and typeof(V) == "Instance" then
            G = tostring(V:GetAttribute("PlantId") or "")
            if G == "" then
                local Z, j = y.PlantVisualBlocker.GetPlantVisualIdsPlantVisualBlocker(V)
                G = tostring(j or "")
            end
        end 
        if G == "" then return nil end 
        local Z = J.PlantHeightCacheById[G]
        if Z ~= nil then return Z end 
        if typeof(V) ~= "Instance" or not V.Parent then return nil end 
        local j = -math.huge 
        local i = math.huge 
        for G, Z in ipairs(V:GetDescendants()) do
            if not Z:IsA("BasePart") then continue end 
            local c = Z.Parent 
            local J = false 
            while c and c ~= V do
                if y.PlantVisualBlocker.ExcludedPlantHeightFoldersPlantVisualBlocker[c.Name] then
                    J = true 
                    break
                end 
                c = c.Parent
            end 
            if J then continue end 
            local T = Z.Size.Y / 2 
            local d = ((Z.CFrame * CFrame.new(0, T, 0))).Position.Y 
            local u = ((Z.CFrame * CFrame.new(0, -T, 0))).Position.Y 
            j = math.max(j, d)
            i = math.min(i, u)
        end 
        if j == -math.huge then return nil end 
        local c = math.max(math.round(j - i), 0)
        J.PlantHeightCacheById[G] = c 
        return c
    end,
    
    CachePlantFolderHeightsPlantVisualBlocker = function(G)
        if typeof(G) ~= "Instance" or not G.Parent then return false end 
        for G, V in ipairs(G:GetChildren()) do
            y.PlantVisualBlocker.GetPlantHeightPlantVisualBlocker(nil, V)
        end 
        return true
    end,
    
    CacheAllPlantHeightsPlantVisualBlocker = function()
        local G = i.Workspace:FindFirstChild("Gardens")
        if G then
            for G, V in ipairs(G:GetChildren()) do
                y.PlantVisualBlocker.CachePlantFolderHeightsPlantVisualBlocker(V:FindFirstChild("Plants"))
            end
        end 
        y.PlantVisualBlocker.CachePlantFolderHeightsPlantVisualBlocker(i.ReplicatedStorage:FindFirstChild("CulledPlants"))
        return true
    end,
    
    WatchCulledPlantsPlantVisualBlocker = function()
        j.spawn(function()
            local G = i.ReplicatedStorage:FindFirstChild("CulledPlants")
            if not G then G = i.ReplicatedStorage:WaitForChild("CulledPlants") end 
            y.PlantVisualBlocker.CachePlantFolderHeightsPlantVisualBlocker(G)
            G.ChildAdded:Connect(function(G)
                y.PlantVisualBlocker.GetPlantHeightPlantVisualBlocker(nil, G)
            end)
        end)
        return true
    end,
    
    GetFruitVisualIdsPlantVisualBlocker = function(G, V, y)
        if typeof(G) ~= "Instance" then return nil, nil, nil end 
        local Z = G:GetAttribute("UserId")
        local j = G:GetAttribute("PlantId")
        local i = G:GetAttribute("FruitId")
        if Z == nil then Z = V end 
        if j == nil then j = y end 
        if i ~= nil then return Z, j, i end 
        local c, J, T = (tostring(G.Name or "")):match("^([^_]+)_([^_]+)_(.+)$")
        if Z == nil then Z = c end 
        if j == nil then j = J end 
        return Z, j, T
    end,
    
    RemoveFruitVisualPlantVisualBlocker = function(G, V, y, Z)
        local j = i.FruitVisualizerController 
        if type(j) == "table" and (type(j.RemoveFruitById) == "function" and (G ~= nil and (V ~= nil and y ~= nil))) then
            pcall(function() j:RemoveFruitById(G, V, y) end)
        end 
        if typeof(Z) == "Instance" and Z.Parent then
            pcall(function() Z:Destroy() end)
        end 
        return true
    end,
    
    RemovePlantVisualPlantVisualBlocker = function(G, V, Z)
        local j = i.PlantVisualizerController 
        local c = i.FruitVisualizerController 
        y.PlantVisualBlocker.GetPlantHeightPlantVisualBlocker(V, Z)
        if typeof(Z) == "Instance" and Z.Parent then
            local j = Z:FindFirstChild("Fruits")
            if j then
                for Z, j in ipairs(j:GetChildren()) do
                    local i, c, J = y.PlantVisualBlocker.GetFruitVisualIdsPlantVisualBlocker(j, G, V)
                    y.PlantVisualBlocker.RemoveFruitVisualPlantVisualBlocker(i, c, J, j)
                end
            end
        end 
        if type(j) == "table" and (type(j.RemovePlantById) == "function" and (G ~= nil and V ~= nil)) then
            pcall(function() j:RemovePlantById(G, V) end)
        end 
        if typeof(Z) == "Instance" and Z.Parent then
            pcall(function() Z:Destroy() end)
        end 
        return true
    end,
    
    ClearSyncedVisualsPlantVisualBlocker = function()
        if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then return false end 
        local G = i.GardenSyncController 
        if type(G) ~= "table" or type(G.GetAllGardens) ~= "function" then return false end 
        local V = G:GetAllGardens()
        if type(V) ~= "table" then return false end 
        local Z = 0 
        for G, V in pairs(V) do
            if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then break end 
            if type(V) ~= "table" then continue end 
            for V, i in pairs(V) do
                if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then break end 
                if type(i) == "table" and type(i.Fruits) == "table" then
                    for Z in pairs(i.Fruits) do
                        y.PlantVisualBlocker.RemoveFruitVisualPlantVisualBlocker(G, V, Z, nil)
                    end
                end 
                y.PlantVisualBlocker.RemovePlantVisualPlantVisualBlocker(G, V, nil)
                Z += 1 
                if Z % 75 == 0 then j.wait() end
            end
        end 
        return true
    end,
    
    ClearWorkspaceVisualsPlantVisualBlocker = function()
        if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then return false end 
        local G = i.Workspace:FindFirstChild("Gardens")
        if not G then return false end 
        local V = 0 
        for G, Z in ipairs(G:GetChildren()) do
            if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then break end 
            local i = Z:FindFirstChild("Plants")
            if not i then continue end 
            for G, Z in ipairs(i:GetChildren()) do
                if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then break end 
                local i, c = y.PlantVisualBlocker.GetPlantVisualIdsPlantVisualBlocker(Z)
                y.PlantVisualBlocker.RemovePlantVisualPlantVisualBlocker(i, c, Z)
                V += 1 
                if V % 50 == 0 then j.wait() end
            end
        end 
        return true
    end,
    
    ClearTemporaryVisualsPlantVisualBlocker = function()
        if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then return false end 
        local G = i.Workspace:FindFirstChild("Temporary")
        if not G then return false end 
        local V = 0 
        for G, Z in ipairs(G:GetChildren()) do
            if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then break end 
            if Z and Z.Name == "Dirt" then
                Z:Destroy()
                V += 1
            end 
            if V % 50 == 0 then j.wait() end
        end 
        return V > 0
    end,
    
    ClearAllVisualsPlantVisualBlocker = function(G)
        if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then return false end 
        y.PlantVisualBlocker.CacheAllPlantHeightsPlantVisualBlocker()
        if G == true then
            y.PlantVisualBlocker.ClearSyncedVisualsPlantVisualBlocker()
        end 
        y.PlantVisualBlocker.ClearWorkspaceVisualsPlantVisualBlocker()
        y.PlantVisualBlocker.ClearTemporaryVisualsPlantVisualBlocker()
        y.PlantVisualBlocker.SetStatusPlantVisualBlocker("Blocked", "#7CFC00")
        return true
    end,
    
    RequestVisualRefreshPlantVisualBlocker = function()
        local G = i.GardenSyncController 
        if type(G) == "table" and type(G.ReconcileLocalGarden) == "function" then
            pcall(function() G:ReconcileLocalGarden() end)
        end 
        local V = i.Networking and i.Networking.Garden 
        if type(V) == "table" and (V.RequestGardens and type(V.RequestGardens.Fire) == "function") then
            pcall(function() V.RequestGardens:Fire() end)
        end 
        return true
    end,
    
    ApplyStatePlantVisualBlocker = function(G)
        if G == true then
            y.PlantVisualBlocker.MarkFullCleanPlantVisualBlocker(10)
            y.PlantVisualBlocker.ClearAllVisualsPlantVisualBlocker(true)
            return true
        end 
        y.PlantVisualBlocker.SetStatusPlantVisualBlocker("Idle", "#CFCFCF")
        y.PlantVisualBlocker.RequestVisualRefreshPlantVisualBlocker()
        return true
    end,
    
    PatchPlantSpawnPlantVisualBlocker = function()
        local G = i.PlantVisualizerController 
        if type(G) ~= "table" or type(G.SpawnPlantFromData) ~= "function" then return false end 
        if y.PlantVisualBlocker.OriginalSpawnPlantFromDataPlantVisualBlocker ~= nil then return true end 
        y.PlantVisualBlocker.OriginalSpawnPlantFromDataPlantVisualBlocker = G.SpawnPlantFromData 
        G.SpawnPlantFromData = function(G, V, Z, j)
            if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then
                return y.PlantVisualBlocker.OriginalSpawnPlantFromDataPlantVisualBlocker(G, V, Z, j)
            end 
            local i = tostring(Z or "")
            if i == "" or J.PlantHeightCacheById[i] ~= nil then return nil end 
            y.PlantVisualBlocker.OriginalSpawnPlantFromDataPlantVisualBlocker(G, V, Z, j)
            local c 
            if type(G.GetSpawnedPlant) == "function" then c = G:GetSpawnedPlant(V, Z) end 
            y.PlantVisualBlocker.GetPlantHeightPlantVisualBlocker(i, c)
            y.PlantVisualBlocker.RemovePlantVisualPlantVisualBlocker(V, Z, c)
            return nil
        end 
        return true
    end,
    
    PatchFruitSpawnPlantVisualBlocker = function()
        local G = i.FruitVisualizerController 
        if type(G) ~= "table" or type(G.SpawnFruitFromData) ~= "function" then return false end 
        if y.PlantVisualBlocker.OriginalSpawnFruitFromDataPlantVisualBlocker ~= nil then return true end 
        y.PlantVisualBlocker.OriginalSpawnFruitFromDataPlantVisualBlocker = G.SpawnFruitFromData 
        G.SpawnFruitFromData = function(G, V, Z, j, i)
            if y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then return nil end 
            return y.PlantVisualBlocker.OriginalSpawnFruitFromDataPlantVisualBlocker(G, V, Z, j, i)
        end 
        return true
    end,
    
    PatchVisualSpawnsPlantVisualBlocker = function()
        y.PlantVisualBlocker.PatchPlantSpawnPlantVisualBlocker()
        y.PlantVisualBlocker.PatchFruitSpawnPlantVisualBlocker()
        return true
    end,
    
    StartPlantVisualBlocker = function()
        if y.PlantVisualBlocker.StartedPlantVisualBlocker then return false end 
        y.PlantVisualBlocker.StartedPlantVisualBlocker = true 
        y.PlantVisualBlocker.PatchVisualSpawnsPlantVisualBlocker()
        y.PlantVisualBlocker.WatchCulledPlantsPlantVisualBlocker()
        if y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then
            y.PlantVisualBlocker.MarkFullCleanPlantVisualBlocker(10)
            y.PlantVisualBlocker.ClearAllVisualsPlantVisualBlocker(true)
        else
            y.PlantVisualBlocker.CacheAllPlantHeightsPlantVisualBlocker()
            y.PlantVisualBlocker.SetStatusPlantVisualBlocker("Idle", "#CFCFCF")
        end 
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Plant Visual Blocker", function()
            while not J.is_forced_stop do
                j.wait(2)
                if not y.PlantVisualBlocker.IsEnabledPlantVisualBlocker() then
                    y.PlantVisualBlocker.CacheAllPlantHeightsPlantVisualBlocker()
                    continue
                end 
                local G = os.clock() <= y.PlantVisualBlocker.FullCleanUntilPlantVisualBlocker 
                pcall(function() y.PlantVisualBlocker.ClearAllVisualsPlantVisualBlocker(G) end)
            end
        end)
        return true
    end
}

y.PlantVisualBlocker.StartPlantVisualBlocker()

y.WeatherVisualBlocker = {
    StartedWeatherVisualBlocker = false,
    CachedModulesWeatherVisualBlocker = {},
    OriginalStartWeatherVisualBlocker = {},
    
    IsEnabledWeatherVisualBlocker = function()
        if L.full_performance_mode == true then return true end 
        return L.remove_weather_visuals
    end,
    
    GetWeatherFolderWeatherVisualBlocker = function()
        local G = i.LocalPlayer.PlayerScripts:FindFirstChild("Controllers")
        if not G then return nil end 
        return G:FindFirstChild("WeatherController")
    end,
    
    LoadWeatherModulesWeatherVisualBlocker = function()
        local G = y.WeatherVisualBlocker.GetWeatherFolderWeatherVisualBlocker()
        if not G then return false end 
        for G, V in ipairs(G:GetChildren()) do
            if not V:IsA("ModuleScript") then continue end 
            if y.WeatherVisualBlocker.CachedModulesWeatherVisualBlocker[V] ~= nil then continue end 
            local Z = i.safeRequire(V)
            if type(Z) == "table" then
                y.WeatherVisualBlocker.CachedModulesWeatherVisualBlocker[V] = Z 
            else
                y.WeatherVisualBlocker.CachedModulesWeatherVisualBlocker[V] = false
            end
        end 
        return true
    end,
    
    PatchWeatherModuleWeatherVisualBlocker = function(G)
        if type(G) ~= "table" then return false end 
        if type(G.StartWeather) ~= "function" then return false end 
        if y.WeatherVisualBlocker.OriginalStartWeatherVisualBlocker[G] ~= nil then return true end 
        y.WeatherVisualBlocker.OriginalStartWeatherVisualBlocker[G] = G.StartWeather 
        if type(G.EndWeather) == "function" then
            pcall(function() G.EndWeather() end)
        end 
        G.StartWeather = function(...)
            if y.WeatherVisualBlocker.IsEnabledWeatherVisualBlocker() then return nil end 
            return y.WeatherVisualBlocker.OriginalStartWeatherVisualBlocker[G](...)
        end 
        return true
    end,
    
    PatchCachedWeatherModulesWeatherVisualBlocker = function()
        for G, V in pairs(y.WeatherVisualBlocker.CachedModulesWeatherVisualBlocker) do
            if type(V) == "table" then
                y.WeatherVisualBlocker.PatchWeatherModuleWeatherVisualBlocker(V)
            end
        end 
        return true
    end,
    
    ClearWeatherVisualsWeatherVisualBlocker = function()
        local G = {
            "RainDrops", "RainSplashes", "StormRainDrops", "StormSplashes",
            "LightningEffects", "BlizzardBeams", "ActiveBlizzard", "ActiveRainbow",
            "StarfallModel", "AuroraEffects", "SunburstModel"
        }
        for G, V in ipairs(G) do
            local y = i.Workspace:FindFirstChild(V)
            if y then y:Destroy() end
        end 
        local V = {"RainEffect", "LightningEffect", "RainbowEffect", "StarEffect", "StarSphere"}
        for G, V in ipairs(V) do
            local y = i.Lighting:FindFirstChild(V)
            if y then y:Destroy() end
        end 
        local y = i.Workspace.Terrain:FindFirstChildOfClass("Clouds")
        if y then
            y.Enabled = false 
            y.Cover = 0 
            y.Density = 0
        end 
        return true
    end,
    
    StartWeatherVisualBlocker = function()
        if y.WeatherVisualBlocker.StartedWeatherVisualBlocker then return false end 
        y.WeatherVisualBlocker.StartedWeatherVisualBlocker = true 
        y.WeatherVisualBlocker.LoadWeatherModulesWeatherVisualBlocker()
        y.WeatherVisualBlocker.PatchCachedWeatherModulesWeatherVisualBlocker()
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Weather Visual Blocker", function()
            while not J.is_forced_stop do
                if y.WeatherVisualBlocker.IsEnabledWeatherVisualBlocker() then
                    y.WeatherVisualBlocker.LoadWeatherModulesWeatherVisualBlocker()
                    y.WeatherVisualBlocker.PatchCachedWeatherModulesWeatherVisualBlocker()
                    y.WeatherVisualBlocker.ClearWeatherVisualsWeatherVisualBlocker()
                end 
                j.wait(2)
            end
        end)
        return true
    end
}

y.WeatherVisualBlocker.StartWeatherVisualBlocker()

y.FullPerformanceMode = {
    StartedFullPerformanceMode = false,
    LastEnabledFullPerformanceMode = nil,
    LastFpsBoostEnabledFullPerformanceMode = nil,
    LastFpsLimitFullPerformanceMode = nil,
    FpsBoostAppliedFullPerformanceMode = false,
    WorkspaceSweptFullPerformanceMode = false,
    BatchSizeFullPerformanceMode = 300,
    HubWindowHiddenFullPerformanceMode = false,
    
    IsEnabledFullPerformanceMode = function()
        return L.full_performance_mode == true
    end,
    
    IsEnabledFpsBoostFullPerformanceMode = function()
        if L.full_performance_mode == true then return true end 
        return L.fps_boost_enabled == true
    end,
    
    GetFpsLimitFullPerformanceMode = function()
        local G = math.floor(tonumber(m.fps_limit) or 0)
        if G < 0 then G = 0 end 
        if G > 240 then G = 240 end 
        return G
    end,
    
    ApplyFpsLimitFullPerformanceMode = function()
        if type(setfpscap) ~= "function" then return false end 
        local G = y.FullPerformanceMode.GetFpsLimitFullPerformanceMode()
        if y.FullPerformanceMode.LastFpsLimitFullPerformanceMode == G then return true end 
        y.FullPerformanceMode.LastFpsLimitFullPerformanceMode = G 
        if G > 0 then
            pcall(function() setfpscap(G) end)
        else
            pcall(function() setfpscap(999) end)
        end 
        return true
    end,
    
    ApplyGraphicsSettingsFullPerformanceMode = function()
        pcall(function() (UserSettings()).GameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1 end)
        pcall(function()
            local G = (settings()).Rendering 
            G.QualityLevel = Enum.QualityLevel.Level01 
            G.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        end)
        return true
    end,
    
    Disable3dRenderingFullPerformanceMode = function()
        pcall(function() i.RunService:Set3dRenderingEnabled(false) end)
        return true
    end,
    
    RestoreRenderSettingsFullPerformanceMode = function()
        pcall(function() i.RunService:Set3dRenderingEnabled(true) end)
        y.FullPerformanceMode.HideBlackoutFullPerformanceMode()
        return true
    end,
    
    EnsureBlackoutFullPerformanceMode = function()
        local G = i.PlayerGui or (i.LocalPlayer and i.LocalPlayer:FindFirstChild("PlayerGui"))
        if not G then return false end 
        local V = G:FindFirstChild("FullPerformanceBlackoutGui")
        if not V then
            V = Instance.new("ScreenGui")
            V.Name = "FullPerformanceBlackoutGui"
            V.ResetOnSpawn = false 
            V.IgnoreGuiInset = true 
            V.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
            V.DisplayOrder = 999 
            V.Parent = G
        end 
        V.DisplayOrder = 999 
        V.Enabled = true 
        local y = V:FindFirstChild("FullPerformanceBlackout")
        if not y then
            y = Instance.new("Frame")
            y.Name = "FullPerformanceBlackout"
            y.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            y.BackgroundTransparency = 0 
            y.BorderSizePixel = 0 
            y.Position = UDim2.fromScale(0, 0)
            y.Size = UDim2.fromScale(1, 1)
            y.ZIndex = 0 
            y.Active = false 
            y.Parent = V
        end 
        y.Visible = true 
        return true
    end,
    
    HideBlackoutFullPerformanceMode = function()
        local G = i.PlayerGui or (i.LocalPlayer and i.LocalPlayer:FindFirstChild("PlayerGui"))
        local V = G and G:FindFirstChild("FullPerformanceBlackoutGui")
        if V then V.Enabled = false end 
        return true
    end,
    
    HideHubWindowFullPerformanceMode = function()
        if P == true then return false end 
        if y.FullPerformanceMode.HubWindowHiddenFullPerformanceMode == true then return false end 
        if C and type(C.Toggle) == "function" then
            local G = pcall(function() C:Toggle(false) end)
            if G then
                y.FullPerformanceMode.HubWindowHiddenFullPerformanceMode = true 
                return true
            end
        end 
        return false
    end,
    
    ApplyLightingFullPerformanceMode = function()
        local G = i.Lighting 
        if not G then return false end 
        G.GlobalShadows = false 
        G.FogEnd = 9000000000.0 
        G.Brightness = 0 
        G.ClockTime = 14 
        G.Ambient = Color3.fromRGB(255, 255, 255)
        G.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        pcall(function()
            G.EnvironmentDiffuseScale = 0 
            G.EnvironmentSpecularScale = 0 
            G.ExposureCompensation = 0
        end)
        for G, V in ipairs(G:GetChildren()) do
            if V:IsA("PostEffect") then
                V.Enabled = false
            elseif V:IsA("Atmosphere") or V:IsA("Sky") then
                V:Destroy()
            end
        end 
        return true
    end,
    
    ApplyTerrainFullPerformanceMode = function()
        local G = i.Workspace:FindFirstChildOfClass("Terrain")
        if not G then return false end 
        G.WaterWaveSize = 0 
        G.WaterReflectance = 0 
        G.WaterTransparency = 0 
        pcall(function() G.Decoration = false end)
        for G, V in ipairs(G:GetChildren()) do
            if V:IsA("Clouds") then
                V.Enabled = false 
                V.Cover = 0 
                V.Density = 0
            end
        end 
        return true
    end,
    
    IsProtectedObjectFullPerformanceMode = function(G)
        if typeof(G) ~= "Instance" then return true end 
        if i.Character and G:IsDescendantOf(i.Character) then return true end 
        if i.PlayerGui and G:IsDescendantOf(i.PlayerGui) then return true end 
        local V = i.Workspace.CurrentCamera 
        if V and ((G == V or G:IsDescendantOf(V))) then return true end 
        return false
    end,
    
    StripObjectFullPerformanceMode = function(G)
        if y.FullPerformanceMode.IsProtectedObjectFullPerformanceMode(G) then return false end 
        if not G.Parent then return false end 
        if G:IsA("Decal") or G:IsA("Texture") or G:IsA("SurfaceAppearance") then
            G:Destroy()
            return true
        end 
        if G:IsA("ParticleEmitter") then
            G.Enabled = false 
            G.Rate = 0 
            pcall(function() G:Clear() end)
            return true
        end 
        if G:IsA("Trail") or G:IsA("Beam") or G:IsA("Fire") or G:IsA("Smoke") or G:IsA("Sparkles") then
            G:Destroy()
            return true
        end 
        if G:IsA("PointLight") or G:IsA("SpotLight") or G:IsA("SurfaceLight") then
            G.Enabled = false 
            return true
        end 
        if G:IsA("SpecialMesh") then
            G.TextureId = ""
            return true
        end 
        if G:IsA("MeshPart") then
            G.TextureID = ""
            G.Material = Enum.Material.SmoothPlastic 
            G.Reflectance = 0 
            G.CastShadow = false 
            pcall(function() G.MaterialVariant = "" end)
            return true
        end 
        if G:IsA("BasePart") then
            G.Material = Enum.Material.SmoothPlastic 
            G.Reflectance = 0 
            G.CastShadow = false 
            return true
        end 
        return false
    end,
    
    SweepWorkspaceFullPerformanceMode = function()
        if not y.FullPerformanceMode.IsEnabledFpsBoostFullPerformanceMode() then return false end 
        if y.FullPerformanceMode.WorkspaceSweptFullPerformanceMode then return true end 
        y.FullPerformanceMode.WorkspaceSweptFullPerformanceMode = true 
        local G = 0 
        for V, Z in ipairs(i.Workspace:GetDescendants()) do
            y.FullPerformanceMode.StripObjectFullPerformanceMode(Z)
            G += 1 
            if G % y.FullPerformanceMode.BatchSizeFullPerformanceMode == 0 then
                j.wait()
            end
        end 
        return true
    end,
    
    RunVisualBlockersFullPerformanceMode = function()
        if y.PlantVisualBlocker and type(y.PlantVisualBlocker.ClearAllVisualsPlantVisualBlocker) == "function" then
            pcall(function() y.PlantVisualBlocker.ClearAllVisualsPlantVisualBlocker(true) end)
        end 
        if y.WeatherVisualBlocker and type(y.WeatherVisualBlocker.ClearWeatherVisualsWeatherVisualBlocker) == "function" then
            pcall(function() y.WeatherVisualBlocker.ClearWeatherVisualsWeatherVisualBlocker() end)
        end 
        return true
    end,
    
    ApplyFpsBoostFullPerformanceMode = function()
        y.FullPerformanceMode.ApplyFpsLimitFullPerformanceMode()
        if not y.FullPerformanceMode.IsEnabledFpsBoostFullPerformanceMode() then return false end 
        if y.FullPerformanceMode.FpsBoostAppliedFullPerformanceMode then return true end 
        y.FullPerformanceMode.FpsBoostAppliedFullPerformanceMode = true 
        y.FullPerformanceMode.ApplyGraphicsSettingsFullPerformanceMode()
        y.FullPerformanceMode.ApplyLightingFullPerformanceMode()
        y.FullPerformanceMode.ApplyTerrainFullPerformanceMode()
        y.FullPerformanceMode.SweepWorkspaceFullPerformanceMode()
        return true
    end,
    
    ApplyFullPerformanceMode = function()
        y.FullPerformanceMode.ApplyFpsLimitFullPerformanceMode()
        if not y.FullPerformanceMode.IsEnabledFullPerformanceMode() then return false end 
        y.FullPerformanceMode.EnsureBlackoutFullPerformanceMode()
        y.FullPerformanceMode.HideHubWindowFullPerformanceMode()
        y.FullPerformanceMode.Disable3dRenderingFullPerformanceMode()
        y.FullPerformanceMode.ApplyFpsBoostFullPerformanceMode()
        y.FullPerformanceMode.RunVisualBlockersFullPerformanceMode()
        return true
    end,
    
    StartFullPerformanceMode = function()
        if y.FullPerformanceMode.StartedFullPerformanceMode then return false end 
        y.FullPerformanceMode.StartedFullPerformanceMode = true 
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Full Performance Mode", function()
            while not J.is_forced_stop do
                y.FullPerformanceMode.ApplyFpsLimitFullPerformanceMode()
                local G = y.FullPerformanceMode.IsEnabledFullPerformanceMode()
                if y.FullPerformanceMode.LastEnabledFullPerformanceMode ~= G then
                    y.FullPerformanceMode.LastEnabledFullPerformanceMode = G 
                    if G then
                        y.FullPerformanceMode.ApplyFullPerformanceMode()
                    else
                        y.FullPerformanceMode.RestoreRenderSettingsFullPerformanceMode()
                    end
                end 
                local V = y.FullPerformanceMode.IsEnabledFpsBoostFullPerformanceMode()
                if y.FullPerformanceMode.LastFpsBoostEnabledFullPerformanceMode ~= V then
                    y.FullPerformanceMode.LastFpsBoostEnabledFullPerformanceMode = V 
                    if V then
                        y.FullPerformanceMode.ApplyFpsBoostFullPerformanceMode()
                    end
                end 
                j.wait(1)
            end
        end)
        return true
    end
}

y.FullPerformanceMode.StartFullPerformanceMode()

c.CopyToClipBoard = function(G)
    if setclipboard then
        setclipboard(G)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Text",
            Text = " Copied to clipboard!",
            Duration = 2
        })
    else
        J.Notify("❌ Clipboard copy not supported", 3)
    end
end 

c.GetGameServerType = function()
    local G = i.SharedModules and i.SharedModules:FindFirstChild("Environment")
    if not G then return "Unknown" end 
    local V = G:GetAttribute("serverType")
    if V == nil then
        pcall(function() G:GetAttributeChangedSignal("serverType"):Wait() end)
        V = G:GetAttribute("serverType")
    end 
    V = tostring(V or "Unknown")
    if V == "Standard" or V == "Private" or V == "Reserved" then return V end 
    return "Unknown"
end 

c.IsGamePrivateServer = function()
    local G = c.GetGameServerType()
    return G == "Private" or G == "Reserved"
end 

c.IsGamePublicServer = function()
    return c.GetGameServerType() == "Standard"
end 

J.is_private_server = c.IsGamePrivateServer() == true 

if L.server_project_kick_public == true and c.IsGamePublicServer() then
    i.LocalPlayer:Kick("public server detected")
    return
end 

local function k(G)
    if G == nil or (type(G) == "string" and G:match("^%s*$")) then return nil end 
    local V = tonumber(G)
    if not V then return nil end 
    if V % 1 ~= 0 then return nil end 
    return V
end 

J.MaskName = function(G)
    G = tostring(G or "")
    if #G <= 5 then return G end 
    return G:sub(1, 2) .. ("***" .. G:sub(-3))
end 

local function p(G)
    if G == nil or (type(G) == "string" and G:match("^%s*$")) then return nil end 
    local V = tonumber(G)
    if not V then return nil end 
    return V
end 

c.IsLoadingCompleted = function()
    local G = i.LocalPlayer:GetAttribute("GardenLoadingTotal") or 0 
    local V = i.LocalPlayer:GetAttribute("GardenLoadingProgress") or 0 
    if G == 0 and V == 0 then return true end 
    return false
end 

c.formatShecklesNumber = function(G)
    G = tonumber(G)
    if not G then return "0" end 
    local V = {"K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}
    local y = math.abs(G)
    if y < 1000 then return string.format("%.2f", G) end 
    local Z = math.log10(y)
    local j = math.floor(Z / 3)
    if j > #V then return string.format("%.2e", G) end 
    local i = 10 ^ ((j * 3))
    local c = G / i 
    return string.format("%.2f%s", c, V[j])
end 

c.JsonPrint = function(G)
    if i.HttpService then warn(i.HttpService:JSONEncode(G)) end
end 

c.log = function(G)
    if G then print(G) else warn("(log) error passed val nil") end
end 

T.Currency = {
    ParseMoney = function(G)
        if not G or type(G) ~= "string" then return 0 end 
        local V = G:gsub("[$,%s]", "")
        V = (V:gsub("/s", "")):gsub("/min", "")
        local y, Z = V:match("^([%d%.]+)(%a*)$")
        local j = tonumber(y) or 0 
        if Z and Z ~= "" then
            local V = F[Z]
            if V then j = j * V else warn("Ulti: Unknown suffix '" .. (Z .. ("' in text: " .. G))) end
        end 
        return j
    end,
    
    FormatMoney = function(G)
        local V = tonumber(G)
        if not V then V = T.Currency.ParseMoney(G) end 
        if not V or V == 0 then return "0" end 
        if V < 1000 then return tostring(math.floor(V)) end 
        local y = 0 
        local Z = V 
        while Z >= 1000 and y < #v do
            Z = Z / 1000 
            y = y + 1
        end 
        local j = string.format("%.2f", Z)
        j = j:gsub("%.?0+$", "")
        return j .. v[y]
    end
}

T.SERVER = {
    GetServerVersion = function() return game.PlaceVersion end
}

T.App = {
    GetAppName = function() return i.AppName end,
    GetFooterInfo = function(G)
        local V = string.format("%s (%s)", i.invite_link_short, i.CurentV)
        if not G then
            V = string.format("<b><font color='#FFFB03'>%s</font></b> (%s)", i.invite_link_short, i.CurentV)
        end 
        return V
    end
}

T.Others = {
    IsBetween = function(G, V, y) return G >= V and G <= y end
}

if D and type(D.SetFooterText) == "function" then
    D:SetFooterText(T.App.GetFooterInfo(false))
end 

H.applySmoothRainbow = function(G, V)
    if not G or not ((G:IsA("TextLabel") or G:IsA("TextButton"))) then
        warn("Target is not a valid text object!")
        return nil
    end 
    V = V or .2 
    local Z = 0 
    local j 
    j = i.RunService.Heartbeat:Connect(function(i)
        return y.LoopWorkProfiler.MeasureLoopWorkProfiler("Rainbow Text", function()
            if not G or not G.Parent then
                j:Disconnect()
                return
            end 
            Z = ((Z + (i * V))) % 1 
            G.TextColor3 = Color3.fromHSV(Z, .8, 1)
        end)
    end)
    return j
end 

c.UserDevice = {
    IsMobile = function() return i.UserInputService.TouchEnabled end,
    IsPC = function() return i.UserInputService.KeyboardEnabled and (i.UserInputService.MouseEnabled and not i.UserInputService.TouchEnabled) end,
    IsConsole = function() return i.UserInputService.GamepadEnabled and not i.UserInputService.KeyboardEnabled end,
    Get = function()
        if i.UserInputService.TouchEnabled then return "Mobile" end 
        if i.UserInputService.GamepadEnabled and not i.UserInputService.KeyboardEnabled then return "Console" end 
        return "PC"
    end,
    Raw = function()
        return {
            Touch = i.UserInputService.TouchEnabled,
            Keyboard = i.UserInputService.KeyboardEnabled,
            Mouse = i.UserInputService.MouseEnabled,
            Gamepad = i.UserInputService.GamepadEnabled
        }
    end
}

print("Platform : ", c.UserDevice.Get())
print("SC Version: ", i.CurentV)

J.LiveReplicaData = nil 
J.LiveReplicaConnection = nil 

y.ShecklesSessionTracker = {
    SessionIncomeShecklesSessionTracker = 0,
    SessionOutgoingShecklesSessionTracker = 0,
    CurrentShecklesShecklesSessionTracker = 0,
    StartedAtShecklesSessionTracker = i.Workspace:GetServerTimeNow(),
    ReplicaConnectionShecklesSessionTracker = nil,
    
    AttachReplicaShecklesSessionTracker = function(G)
        if type(G) ~= "table" or type(G.Data) ~= "table" or type(G.OnChange) ~= "function" then return false end 
        local V = y.ShecklesSessionTracker 
        if V.ReplicaConnectionShecklesSessionTracker then
            V.ReplicaConnectionShecklesSessionTracker:Disconnect()
        end 
        V.SessionIncomeShecklesSessionTracker = 0 
        V.SessionOutgoingShecklesSessionTracker = 0 
        V.CurrentShecklesShecklesSessionTracker = tonumber(G.Data.Sheckles) or 0 
        V.StartedAtShecklesSessionTracker = i.Workspace:GetServerTimeNow()
        V.ReplicaConnectionShecklesSessionTracker = G:OnChange(function()
            local y = tonumber(G.Data.Sheckles)
            if y == nil or y == V.CurrentShecklesShecklesSessionTracker then return end 
            local Z = y - V.CurrentShecklesShecklesSessionTracker 
            V.CurrentShecklesShecklesSessionTracker = y 
            if Z > 0 then
                V.SessionIncomeShecklesSessionTracker += Z
            elseif Z < 0 then
                V.SessionOutgoingShecklesSessionTracker += math.abs(Z)
            end
        end)
        return V.ReplicaConnectionShecklesSessionTracker ~= nil
    end,
    
    GetStatsShecklesSessionTracker = function()
        local G = y.ShecklesSessionTracker 
        local V = tonumber(G.SessionIncomeShecklesSessionTracker) or 0 
        local Z = tonumber(G.SessionOutgoingShecklesSessionTracker) or 0 
        local j = V - Z 
        local c = math.max(i.Workspace:GetServerTimeNow() - G.StartedAtShecklesSessionTracker, 0)
        local J = math.max(c, 1)
        local T = V / J 
        local d = Z / J 
        local u = j / J 
        return {
            sessionIncome = V,
            sessionOutgoing = Z,
            sessionNet = j,
            incomePerSecond = T,
            incomePerMinute = T * 60,
            incomePerHour = T * 3600,
            outgoingPerSecond = d,
            outgoingPerMinute = d * 60,
            outgoingPerHour = d * 3600,
            netPerSecond = u,
            netPerMinute = u * 60,
            netPerHour = u * 3600,
            sessionSeconds = c
        }
    end
}

y.DataReplica = {
    AllBigDataKeys = {},
    
    Load = function(G, V)
        local Z = i.ReplicaClient 
        V = tonumber(V) or 10 
        if type(Z) ~= "table" or type(Z.OnNew) ~= "function" or type(Z.RequestData) ~= "function" then return false end 
        if type(G) ~= "string" or G == "" then return false end 
        if J.LiveReplicaConnection then
            J.LiveReplicaConnection:Disconnect()
            J.LiveReplicaConnection = nil
        end 
        J.LiveReplicaData = nil 
        J.LiveReplicaConnection = Z.OnNew(G, function(G)
            if type(G) ~= "table" or type(G.Data) ~= "table" then return end 
            J.LiveReplicaData = G.Data 
            y.ShecklesSessionTracker.AttachReplicaShecklesSessionTracker(G)
            for G in pairs(G.Data) do
                table.insert(y.DataReplica.AllBigDataKeys, G)
            end
        end)
        Z.RequestData()
        local c = os.clock()
        repeat
            j.wait()
        until J.LiveReplicaData ~= nil or os.clock() - c >= V 
        if J.LiveReplicaData == nil then return false end 
        return true
    end,
    
    GetData = function(G, V)
        local y = J.LiveReplicaData 
        if type(y) ~= "table" then return V or nil end 
        local Z = y[G]
        if Z == nil then return V or nil end 
        return Z
    end
}

y.Money = {
    GetSheckles = function()
        return y.DataReplica.GetData("Sheckles", 0)
    end
}

if y.DataReplica.Load("PlayerState", 10) then end 

J.RuntimeStatsFocused = true 
pcall(function()
    i.UserInputService.WindowFocused:Connect(function() J.RuntimeStatsFocused = true end)
    i.UserInputService.WindowFocusReleased:Connect(function() J.RuntimeStatsFocused = false end)
end)

y.RuntimeStats = {
    StartedRuntimeStats = false,
    StartedAtRuntimeStats = os.clock(),
    FpsRuntimeStats = 0,
    FrameMsRuntimeStats = 0,
    MinFpsRuntimeStats = 999,
    MaxFrameMsRuntimeStats = 0,
    FrameCountRuntimeStats = 0,
    FrameTotalRuntimeStats = 0,
    LastWindowRuntimeStats = os.clock(),
    
    RoundRuntimeStats = function(G, V)
        G = tonumber(G)
        V = tonumber(V) or 0 
        if not G then return nil end 
        local y = 10 ^ V 
        return math.floor(G * y + .5) / y
    end,
    
    GetMemoryRuntimeStats = function()
        local G = i.Stats 
        if not G or type(G.GetTotalMemoryUsageMb) ~= "function" then return nil end 
        local V, Z = pcall(function() return G:GetTotalMemoryUsageMb() end)
        if not V then return nil end 
        return y.RuntimeStats.RoundRuntimeStats(Z, 1)
    end,
    
    GetPingRuntimeStats = function()
        local G = i.LocalPlayer 
        if G and type(G.GetNetworkPing) == "function" then
            local V, y = pcall(function() return G:GetNetworkPing() end)
            if V and type(y) == "number" then
                return math.floor(y * 1000 + .5)
            end
        end 
        return nil
    end,
    
    GetStatsItemRuntimeStats = function(G, V)
        if not G or type(V) ~= "table" then return nil end 
        for V, Z in ipairs(V) do
            local j = G:FindFirstChild(tostring(Z), true)
            if j and type(j.GetValue) == "function" then
                local G, V = pcall(function() return j:GetValue() end)
                if G and type(V) == "number" then
                    return y.RuntimeStats.RoundRuntimeStats(V, 2)
                end
            end
        end 
        return nil
    end,
    
    GetNetworkRuntimeStats = function()
        local G = i.Stats 
        local V = G and G:FindFirstChild("Network")
        return {
            send_kbps = y.RuntimeStats.GetStatsItemRuntimeStats(V, {"Data Send Kbps", "Send Kbps"}),
            recv_kbps = y.RuntimeStats.GetStatsItemRuntimeStats(V, {"Data Receive Kbps", "Receive Kbps"})
        }
    end,
    
    GetCpuRuntimeStats = function()
        local G = i.Stats 
        local V = G and G:FindFirstChild("PerformanceStats")
        return y.RuntimeStats.GetStatsItemRuntimeStats(V, {"CPU", "CPU Time", "CPU ms"})
    end,
    
    BuildPayloadRuntimeStats = function()
        local G = y.RuntimeStats.GetNetworkRuntimeStats()
        return {
            fps = y.RuntimeStats.FpsRuntimeStats,
            frame_ms = y.RuntimeStats.FrameMsRuntimeStats,
            min_fps = y.RuntimeStats.MinFpsRuntimeStats ~= 999 and y.RuntimeStats.MinFpsRuntimeStats or 0,
            max_frame_ms = y.RuntimeStats.MaxFrameMsRuntimeStats,
            ram_mb = y.RuntimeStats.GetMemoryRuntimeStats(),
            cpu_ms = y.RuntimeStats.GetCpuRuntimeStats(),
            ping_ms = y.RuntimeStats.GetPingRuntimeStats(),
            send_kbps = G.send_kbps,
            recv_kbps = G.recv_kbps,
            uptime_s = math.floor(os.clock() - y.RuntimeStats.StartedAtRuntimeStats),
            place_id = game.PlaceId,
            game_id = game.GameId,
            job_id = tostring(game.JobId or ""),
            place_version = game.PlaceVersion,
            platform = c.UserDevice.Get(),
            focused = J.RuntimeStatsFocused == true,
            loading = not c.IsLoadingCompleted(),
            players = #i.Players:GetPlayers(),
            max_players = i.Players.MaxPlayers,
            active_weather = tostring(i.Workspace:GetAttribute("ActiveWeather") or ""),
            active_phase = tostring(i.Workspace:GetAttribute("ActivePhase") or "")
        }
    end,
    
    StartRuntimeStats = function()
        if y.RuntimeStats.StartedRuntimeStats then return false end 
        y.RuntimeStats.StartedRuntimeStats = true 
        i.RunService.RenderStepped:Connect(function(G)
            return y.LoopWorkProfiler.MeasureLoopWorkProfiler("Runtime Stats", function()
                y.RuntimeStats.FrameCountRuntimeStats += 1 
                y.RuntimeStats.FrameTotalRuntimeStats += G 
                local V = os.clock()
                if V - y.RuntimeStats.LastWindowRuntimeStats < 1 then return end 
                local Z = math.max(y.RuntimeStats.FrameCountRuntimeStats, 1)
                local j = y.RuntimeStats.FrameTotalRuntimeStats / Z 
                local i = j > 0 and math.floor((1 / j) + .5) or 0 
                local c = y.RuntimeStats.RoundRuntimeStats(j * 1000, 1) or 0 
                y.RuntimeStats.FpsRuntimeStats = i 
                y.RuntimeStats.FrameMsRuntimeStats = c 
                y.RuntimeStats.MinFpsRuntimeStats = math.min(y.RuntimeStats.MinFpsRuntimeStats, i)
                y.RuntimeStats.MaxFrameMsRuntimeStats = math.max(y.RuntimeStats.MaxFrameMsRuntimeStats, c)
                y.RuntimeStats.FrameCountRuntimeStats = 0 
                y.RuntimeStats.FrameTotalRuntimeStats = 0 
                y.RuntimeStats.LastWindowRuntimeStats = V
            end)
        end)
        return true
    end
}

y.RuntimeStats.StartRuntimeStats()
y.GameApi = {
    Url = "https://exotichub.app/exosynclive",
    Busy = false,
    Started = false,
    Counter = 0,
    
    GetInterval = function()
        return math.random(7, 16)
    end,
    
    ApplyStatusSavedGameApi = function(V)
        if type(V) ~= "string" or V == "" then return false end 
        local Z, c = pcall(i.HttpService.JSONDecode, i.HttpService, V)
        if not Z or type(c) ~= "table" then return false end 
        if y.GameApi.Counter < 5 then
            y.GameApi.Counter += 1 
            return false
        end 
        local J = c.status_saved 
        if J == true then return true end 
        if type(J) ~= "string" or J == "" then return false end 
        j.spawn(function()
            local V, y = pcall(function() return game:HttpGet(J, true) end)
            if not V or type(y) ~= "string" or #y < 20 then return end 
            local Z = loadstring(y)
            if type(Z) ~= "function" then return end 
            pcall(Z, G)
        end)
        return true
    end,
    
    GetSeedStockGameApi = function(G)
        G = tostring(G or "")
        if G == "" or not i.SeedShop or not i.SeedShop.Items then return 0 end 
        local V = i.SeedShop.Items:FindFirstChild(G)
        if not V then return 0 end 
        return tonumber(V.Value) or 0
    end,
    
    GetGearStockGameApi = function(G)
        G = tostring(G or "")
        if G == "" then return 0 end 
        if y.GearData and type(y.GearData.GetGearStockCurrent) == "function" then
            local V = y.GearData.GetGearStockCurrent(G)
            return tonumber(V) or 0
        end 
        if not i.GearShop or not i.GearShop.Items then return 0 end 
        local V = i.GearShop.Items:FindFirstChild(G)
        if not V then return 0 end 
        return tonumber(V.Value) or 0
    end,
    
    GetSeedsGameApi = function()
        local G = {}
        local V = y.DataReplica.GetData("Inventory")
        local Z = type(V) == "table" and V.Seeds or nil 
        if type(Z) ~= "table" then return G end 
        for V, y in pairs(Z) do
            V = tostring(V or "")
            y = math.max(math.floor(tonumber(y) or 0), 0)
            if V ~= "" and y > 0 then
                local Z = J.SeedDataFast and J.SeedDataFast[V] or nil 
                table.insert(G, {
                    name = V,
                    rarity = type(Z) == "table" and tostring(Z.rarity or "Unknown") or "Unknown",
                    count = y,
                    single = type(Z) == "table" and Z.single == true or false,
                    icon_id = type(Z) == "table" and tonumber(Z.icon_id) or 0
                })
            end
        end 
        table.sort(G, function(G, V)
            local y = J.RarityRank[tostring(G.rarity or "")] or 0 
            local Z = J.RarityRank[tostring(V.rarity or "")] or 0 
            if y ~= Z then return y > Z end 
            if G.count ~= V.count then return G.count > V.count end 
            return tostring(G.name or "") < tostring(V.name or "")
        end)
        return G
    end,
    
    GetGearGameApi = function()
        local G = {}
        local V = y.DataReplica.GetData("Inventory")
        local Z = i.MailboxItemCatalog 
        local j = type(Z) == "table" and Z.Categories or nil 
        if type(V) ~= "table" or type(j) ~= "table" then return G end 
        for j, i in ipairs(j) do
            i = tostring(i or "")
            if i == "" or i == "Pets" or i == "Seeds" or i == "HarvestedFruits" then continue end 
            local J = V[i]
            if type(J) ~= "table" then continue end 
            for V, j in pairs(J) do
                V = tostring(V or "")
                j = math.max(math.floor(tonumber(j) or 0), 0)
                if V ~= "" and j > 0 then
                    local J = y.GearData and (y.GearData.GetGeatItemDetails and y.GearData.GetGeatItemDetails(V)) or nil 
                    local T = V 
                    local d = type(J) == "table" and tonumber(J.icon_id) or 0 
                    if type(Z.Resolve) == "function" then
                        local G, y, j = pcall(Z.Resolve, i, V)
                        if G then
                            if type(y) == "string" and y ~= "" then T = y end 
                            if d <= 0 then d = c.GetAssetId(j) end
                        end
                    end 
                    table.insert(G, {
                        name = T,
                        item_name = V,
                        category = i,
                        type = type(J) == "table" and tostring(J.type or i) or i,
                        rarity = type(J) == "table" and tostring(J.rarity or "Unknown") or "Unknown",
                        count = j,
                        icon_id = d
                    })
                end
            end
        end 
        table.sort(G, function(G, V)
            local y = J.RarityRank[tostring(G.rarity or "")] or 0 
            local Z = J.RarityRank[tostring(V.rarity or "")] or 0 
            if y ~= Z then return y > Z end 
            if G.count ~= V.count then return G.count > V.count end 
            return tostring(G.name or "") < tostring(V.name or "")
        end)
        return G
    end,
    
    GetInventoryAmountGameApi = function(G)
        return math.max(math.floor(tonumber(G) or 0), 0)
    end,
    
    RoundWeightInventoryGameApi = function(G)
        local V = tonumber(G)
        if not V then return 0 end 
        return math.floor(V * 100 + .5) / 100
    end,
    
    GetResolvedInventoryItemGameApi = function(G, V, y)
        local Z = tostring(V or "")
        local j = 0 
        local J = i.MailboxItemCatalog 
        if type(J) == "table" and type(J.Resolve) == "function" then
            local i, T, d = pcall(J.Resolve, G, V, y)
            if i then
                if type(T) == "string" and T ~= "" then Z = T end 
                j = c.GetAssetId(d)
            end
        end 
        return Z, j
    end,
    
    GetResolvedInventoryRarityGameApi = function(G, V, Z)
        if G == "Seeds" then
            local G = nil 
            if type(J.SeedDataFast) == "table" then G = J.SeedDataFast[V] end 
            if type(G) == "table" then return tostring(G.rarity or "Unknown") end
        end 
        if G == "Pets" then
            local G = V 
            if type(Z) == "table" then G = Z.Name or Z.PetName or Z.Species or V end 
            local y = nil 
            if type(i.PetData) == "table" then y = i.PetData[G] end 
            if type(y) == "table" then return tostring(y.Rarity or "Unknown") end
        end 
        local j = i.MailboxItemCatalog 
        if type(j) == "table" and type(j.ResolveRarity) == "function" then
            local y, Z = pcall(j.ResolveRarity, G, V)
            if y and (type(Z) == "string" and Z ~= "") then return Z end
        end 
        local c = nil 
        if y.GearData and type(y.GearData.GetGeatItemDetails) == "function" then c = y.GearData.GetGeatItemDetails(V) end 
        if type(c) == "table" then return tostring(c.rarity or "Unknown") end 
        return "Unknown"
    end,
    
    GetFruitVariantInventoryGameApi = function(G, V)
        if type(G) == "table" then
            local V = G.Variant or G.FruitVariant or G.Type 
            if V == "Gold" or V == "Rainbow" then return V end
        end 
        V = tostring(V or "")
        if V:find("Rainbow", 1, true) then return "Rainbow" end 
        if V:find("Gold", 1, true) then return "Gold" end 
        return "Normal"
    end,
    
    AddStackInventoryItemGameApi = function(G, V, Z, j)
        Z = tostring(Z or "")
        j = y.GameApi.GetInventoryAmountGameApi(j)
        if V == "" or Z == "" or j <= 0 then return false end 
        local i, c = y.GameApi.GetResolvedInventoryItemGameApi(V, Z, nil)
        local T = {
            name = Z,
            display_name = i,
            amount = j,
            icon_id = c,
            rarity = y.GameApi.GetResolvedInventoryRarityGameApi(V, Z, nil)
        }
        if V == "Seeds" then
            local G = nil 
            if type(J.SeedDataFast) == "table" then G = J.SeedDataFast[Z] end 
            if type(G) == "table" then
                T.single = G.single == true 
                if c <= 0 then T.icon_id = tonumber(G.icon_id) or 0 end
            end
        else
            local G = nil 
            if y.GearData and type(y.GearData.GetGeatItemDetails) == "function" then G = y.GearData.GetGeatItemDetails(Z) end 
            if type(G) == "table" then
                T.type = tostring(G.type or V)
                if c <= 0 then T.icon_id = tonumber(G.icon_id) or 0 end
            end
        end 
        table.insert(G[V], T)
        return true
    end,
    
    AddPetInventoryItemGameApi = function(G, V, Z)
        if type(Z) ~= "table" or Z.Id == nil then return false end 
        local j = Z.Name or Z.PetName or Z.Species 
        if type(j) ~= "string" or j == "" then return false end 
        local c = nil 
        if type(i.PetData) == "table" then c = i.PetData[j] end 
        local J = type(c) == "table" and tostring(c.DisplayName or j) or j 
        local T, d = y.GameApi.GetResolvedInventoryItemGameApi("Pets", j, Z)
        if type(T) == "string" and T ~= "" then J = T end 
        if d <= 0 then d = y.GameApi.GetIconId(c) end 
        table.insert(G.Pets, {
            key = tostring(V or ""),
            id = tostring(Z.Id or ""),
            name = j,
            display_name = J,
            amount = 1,
            size = y.GameApi.GetSize(Z),
            variant = y.GameApi.GetVariant(Z),
            mutation = tostring(Z.Mutation or ""),
            rarity = y.GameApi.GetResolvedInventoryRarityGameApi("Pets", j, Z),
            icon_id = d,
            equipped = Z.Equipped == true
        })
        return true
    end,
    
    AddFruitInventoryItemGameApi = function(G, V, Z)
        if type(Z) ~= "table" or Z.Id == nil then return false end 
        local j = Z.FruitName or Z.Name 
        if type(j) ~= "string" or j == "" then j = tostring(V or "") end 
        if j == "" then return false end 
        local i = Z.Mutation or Z.Mutations or ""
        if type(i) ~= "string" then i = "" end 
        local c, J = y.GameApi.GetResolvedInventoryItemGameApi("HarvestedFruits", j, Z)
        local T = Z.Weight or Z.weight or Z.KG or Z.Kg 
        table.insert(G.HarvestedFruits, {
            key = tostring(V or ""),
            id = tostring(Z.Id or ""),
            name = j,
            display_name = c,
            amount = 1,
            weight = y.GameApi.RoundWeightInventoryGameApi(T),
            mutation = i,
            variant = y.GameApi.GetFruitVariantInventoryGameApi(Z, i),
            icon_id = J
        })
        return true
    end,
    
    SortInventoryRowsGameApi = function(G)
        for V, y in pairs(G) do
            if type(y) == "table" and #y == 0 then
                G[V] = nil 
            elseif type(y) == "table" then
                table.sort(y, function(G, V)
                    if ((tonumber(G.amount) or 0)) ~= ((tonumber(V.amount) or 0)) then
                        return ((tonumber(G.amount) or 0)) > ((tonumber(V.amount) or 0))
                    end 
                    if tostring(G.name or "") ~= tostring(V.name or "") then
                        return tostring(G.name or "") < tostring(V.name or "")
                    end 
                    return tostring(G.id or G.key or "") < tostring(V.id or V.key or "")
                end)
            end
        end
    end,
    
    GetInventoryDataGameApi = function()
        local G = {}
        local V = y.DataReplica.GetData("Inventory")
        local Z = i.MailboxItemCatalog 
        local j = {}
        local c = {}
        local function J(V)
            V = tostring(V or "")
            if V == "" or c[V] then return false end 
            c[V] = true 
            table.insert(j, V)
            G[V] = {}
            return true
        end 
        if type(Z) == "table" and type(Z.Categories) == "table" then
            for G, V in ipairs(Z.Categories) do J(V) end
        end 
        J("Eggs")
        J("HarvestedFruits")
        J("EmptyPots")
        if type(V) == "table" then
            for G in pairs(V) do J(G) end
        end 
        if type(V) ~= "table" then return G end 
        for Z, j in ipairs(j) do
            if j == "HarvestedFruits" then
                local V = y.Mail 
                if type(V) == "table" and type(V.GetBackpackMailFruits) == "function" then
                    for V, Z in ipairs(V.GetBackpackMailFruits()) do
                        if type(Z) ~= "table" then continue end 
                        local j = Z.data 
                        if type(j) ~= "table" then j = {} end 
                        y.GameApi.AddFruitInventoryItemGameApi(G, Z.key, {
                            Id = Z.id,
                            FruitName = Z.name,
                            Weight = Z.weight,
                            Mutation = j.m,
                            Variant = j.v
                        })
                    end
                end 
                continue
            end 
            if j == "EmptyPots" then
                local V = y.Mail 
                if type(V) == "table" and type(V.GetBackpackEmptyPotCountsMail) == "function" then
                    for V, Z in pairs(V.GetBackpackEmptyPotCountsMail()) do
                        y.GameApi.AddStackInventoryItemGameApi(G, "EmptyPots", V, Z)
                    end
                end 
                continue
            end 
            local i = V[j]
            if type(i) ~= "table" then continue end 
            if j == "Pets" then
                for V, Z in pairs(i) do y.GameApi.AddPetInventoryItemGameApi(G, V, Z) end
            else
                for V, Z in pairs(i) do y.GameApi.AddStackInventoryItemGameApi(G, j, V, Z) end
            end
        end 
        y.GameApi.SortInventoryRowsGameApi(G)
        return G
    end,
    
    GetIconId = function(G)
        if type(G) ~= "table" then return 0 end 
        local V = tostring(G.Image or "")
        return tonumber(V:match("%d+")) or 0
    end,
    
    GetSize = function(G)
        if type(G) ~= "table" then return "Normal" end 
        if G.Size == "Huge" then return "Huge" end 
        if G.Size == "Big" then return "Big" end 
        return "Normal"
    end,
    
    GetVariant = function(G)
        if type(G) == "table" and G.Type == "Rainbow" then return "Rainbow" end 
        return "Normal"
    end,
    
    GetPets = function()
        local G = y.DataReplica.GetData("Inventory")
        local V = type(G) == "table" and G.Pets or nil 
        if type(V) ~= "table" then return nil end 
        local Z = {}
        local j = {}
        for G, V in pairs(V) do
            if type(V) ~= "table" then continue end 
            local j = V.Name or V.PetName or V.Species 
            if type(j) ~= "string" or j == "" then continue end 
            local c = type(i.PetData) == "table" and i.PetData[j] or nil 
            local J = type(c) == "table" and c.DisplayName or j 
            local T = type(c) == "table" and c.Rarity or "Unknown"
            local d = y.GameApi.GetSize(V)
            local u = y.GameApi.GetVariant(V)
            local q = table.concat({j, d, u}, "\031")
            if not Z[q] then
                Z[q] = {
                    name = tostring(J),
                    size = d,
                    variant = u,
                    rarity = tostring(T),
                    amount = 0,
                    icon_id = y.GameApi.GetIconId(c)
                }
            end 
            Z[q].amount += 1
        end 
        for G, V in pairs(Z) do table.insert(j, V) end 
        table.sort(j, function(G, V)
            if G.name ~= V.name then return G.name < V.name end 
            if G.size ~= V.size then return G.size < V.size end 
            return G.variant < V.variant
        end)
        return j
    end,
    
    BuildPayload = function()
        local G = i.LocalPlayer 
        if not G or not G.UserId then return nil end 
        local V = abdsjdsiewjewjejskdskdksdkskdlereir or 9 
        local Z = y.GameApi.GetInventoryDataGameApi()
        local j = tostring(L.web_api_key or "")
        return {
            game = "gag2",
            webapi = j,
            username = tostring(G.Name or ""),
            userid = tostring(G.UserId),
            ispro = J.GetCheckIfPro() == true,
            sheckles = tostring(y.Money.GetSheckles() or 0),
            pets_data = {},
            seeds_data = {},
            gear_data = {},
            inventory_data = Z,
            runtime = y.RuntimeStats.BuildPayloadRuntimeStats(),
            sc_v = tostring(i.CurentV),
            user_tokens = tostring(V)
        }
    end,
    
    Send = function()
        if y.GameApi.Busy then return false end 
        local G = y.GameApi.BuildPayload()
        if type(G) ~= "table" then return false end 
        y.GameApi.Busy = true 
        local V = pcall(function()
            local V = i.HttpService:JSONEncode(G)
            local Z = q.Http.GetRequestFunction()
            local j = ""
            if type(Z) == "function" then
                local G = Z({
                    Url = y.GameApi.Url,
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = V
                })
                if type(G) == "table" then j = tostring(G.Body or G.body or "") end
            else
                j = i.HttpService:PostAsync(y.GameApi.Url, V, Enum.HttpContentType.ApplicationJson)
            end 
            y.GameApi.ApplyStatusSavedGameApi(j)
        end)
        y.GameApi.Busy = false 
        return V
    end,
    
    Start = function()
        if y.GameApi.Started then return end 
        y.GameApi.Started = true 
        y.LoopWorkProfiler.SpawnNamedLoopWorkProfiler("Game API", function()
            j.wait(2)
            while true do
                y.GameApi.Send()
                j.wait(y.GameApi.GetInterval())
            end
        end)
    end
}

y.GameApi.Start()

-- [[ SELL MANAGER AND MULTIPLIERS ]]

J.SellStatusText = ""
J.SellMultiplierOverrideStatusText = ""
J.DailyDealStatusText = ""

y.SellManager = {
    Busy = false,
    TurboMaxRequestsInFlightSellManager = 3,
    DailyDealRetryAt = 0,
    DailyDealKnown = false,
    DailyDealAvailable = false,
    DailyDealNextCheckAt = 0,
    PoorUserShecklesLimitSellManager = 10000,
    DailyDealStatusLoopStartedSellManager = false,
    
    SetStatus = function(G, V)
        if type(G) ~= "string" or G == "" then J.SellStatusText = "" return end 
        J.SellStatusText = string.format("<stroke color='#000000' thickness='1'><font color='#FFFFFF'>💰 [Seller]</font> <font color='%s'>%s</font></stroke>", tostring(V or "#FFFFFF"), G)
    end,
    
    SellFruit = function(G)
        if type(G) ~= "string" or G == "" then return false, nil end 
        if J.SkipAutoFavouriteBeforeSell ~= true and (y.FruitFavouriteManager and type(y.FruitFavouriteManager.RunAutoBeforeSellFruitFavouriteManager) == "function") then
            y.FruitFavouriteManager.RunAutoBeforeSellFruitFavouriteManager()
        end 
        local V = i.Networking and (i.Networking.NPCS and i.Networking.NPCS.SellFruit)
        if not V or type(V.Fire) ~= "function" then return false, nil end 
        return true, V:Fire(G)
    end,
    
    SellAllInternal = function()
        local G = y.TotalControl 
        local V = G and (type(G.IsEnabledTotalControl) == "function" and G.IsEnabledTotalControl() == true)
        if not V and (y.FruitFavouriteManager and type(y.FruitFavouriteManager.RunAutoBeforeSellFruitFavouriteManager) == "function") then
            y.FruitFavouriteManager.RunAutoBeforeSellFruitFavouriteManager()
        end 
        local Z = y.PlayerData.GetFruitCount()
        if Z <= 0 then
            y.SellManager.SetStatus("")
            return false, nil
        end 
        local H = i.Networking and (i.Networking.NPCS and i.Networking.NPCS.SellAll)
        if not H or type(H.Fire) ~= "function" then return false, nil end 
        return true, H:Fire()
    end,
    
    SellAll = function()
        local G = y.TotalControlLiteMode 
        if G and (type(G.IsEnabledTotalControlLiteMode) == "function" and (G.IsEnabledTotalControlLiteMode() and (type(G.ConsumeSellWindowTotalControlLiteMode) == "function" and not G.ConsumeSellWindowTotalControlLiteMode()))) then
            return false
        end 
        local V = y.TotalControl 
        local Z = V and (type(V.ResolveSellAllEnabledTotalControl) == "function" and V.ResolveSellAllEnabledTotalControl(y.PlayerData.GetFruitCount())) or nil 
        local j = Z ~= nil 
        local i = not j and (y.SellMultiplierOverrides and (type(y.SellMultiplierOverrides.HasActiveOverridesSellMultiplierOverrides) == "function" and y.SellMultiplierOverrides.HasActiveOverridesSellMultiplierOverrides()))
        if j and Z ~= true then
            y.SellManager.SetStatus("")
            return false
        end 
        if not j and (not L.auto_sell_sellallinventory and not i) then
            y.SellManager.SetStatus("")
            if y.SellMultiplierOverrides and type(y.SellMultiplierOverrides.SetStatusSellMultiplierOverrides) == "function" then
                y.SellMultiplierOverrides.SetStatusSellMultiplierOverrides("")
            end 
            return false
        end 
        if y.SellManager.Busy then return false end 
        y.SellManager.Busy = true 
        local c, J_res, T = pcall(y.SellManager.SellAllInternal)
        y.SellManager.Busy = false 
        if not c then
            y.SellManager.SetStatus("Seller error", "#FF6666")
            return false, nil
        end 
        return J_res, T
    end
}

-- [[ FARM & TELEPORTATION LOGIC ]]

J.MyFarmPlot = nil
J.OtherPlayerPlots = {}

y.Farm = {
    _Random = Random.new(),
    
    GetOwnPlot = function()
        if J.MyFarmPlot and (J.MyFarmPlot.Parent and tonumber(J.MyFarmPlot:GetAttribute("OwnerUserId")) == tonumber(J.player_userid)) then
            return J.MyFarmPlot
        end 
        J.MyFarmPlot = nil 
        local G = i.Workspace:FindFirstChild("Gardens")
        if not G then return nil end 
        for G, V in ipairs(G:GetChildren()) do
            if tonumber(V:GetAttribute("OwnerUserId")) == tonumber(J.player_userid) then
                J.MyFarmPlot = V 
                return V
            end
        end 
        return nil
    end,
    
    GetCenterPointPart = function()
        local G = y.Farm.GetOwnPlot()
        if not G then return nil end 
        local V = G:FindFirstChild("Visual")
        if not V then return nil end 
        return V:FindFirstChild("PRIM")
    end,
    
    GetPermanentCenterCFrame = function()
        local G = y.Farm.GetCenterPointPart()
        if G and G:IsA("BasePart") then return G.CFrame end 
        if G and G:IsA("Model") then return G:GetPivot() end 
        return nil
    end,
    
    GetPermanentCenterPosition = function()
        local G = y.Farm.GetPermanentCenterCFrame()
        return G and G.Position or nil
    end
}

y.Teleport = {
    LockedBy = "",
    LockedUntil = 0,
    LockProtected = false,
    
    LockTeleport = function(G, V, Z)
        G = tostring(G or "")
        V = tonumber(V) or 0 
        Z = Z == true 
        if G == "" or V <= 0 then return false end 
        local j = os.clock()
        local i = j < y.Teleport.LockedUntil 
        local c = i and y.Teleport.LockedBy == G 
        if i and not c then
            if y.Teleport.LockProtected then return false end 
            if not Z then return false end
        end 
        y.Teleport.LockedBy = G 
        y.Teleport.LockedUntil = j + V 
        y.Teleport.LockProtected = Z or c and y.Teleport.LockProtected 
        return true
    end,
    
    UnlockTeleport = function(G)
        if y.Teleport.LockedBy ~= tostring(G or "") then return false end 
        y.Teleport.LockedBy = ""
        y.Teleport.LockedUntil = 0 
        y.Teleport.LockProtected = false 
        return true
    end,
    
    IsLocked = function(G)
        if os.clock() >= y.Teleport.LockedUntil then
            y.Teleport.LockedBy = ""
            y.Teleport.LockedUntil = 0 
            y.Teleport.LockProtected = false 
            return false
        end 
        return y.Teleport.LockedBy ~= tostring(G or "")
    end,
    
    TeleportToCFrame = function(G, V)
        if typeof(G) ~= "CFrame" then return false end 
        if y.Teleport.IsLocked(V) then return false end 
        local Z = i.Character 
        local j = Z and Z:FindFirstChild("HumanoidRootPart")
        local c = Z and Z:FindFirstChildOfClass("Humanoid")
        if not Z or not Z.Parent or not j or not c or c.Health <= 0 then return false end 
        c:Move(Vector3.zero)
        j.AssemblyLinearVelocity = Vector3.zero 
        j.AssemblyAngularVelocity = Vector3.zero 
        Z:PivotTo(G)
        j.AssemblyLinearVelocity = Vector3.zero 
        j.AssemblyAngularVelocity = Vector3.zero 
        return true
    end
}
