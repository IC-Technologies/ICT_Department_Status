Config = {
    enableBadessentialsIntregration = false,
    --The command to toggle the department status displays. Set to "" or nil to disable. (This command only affects the clients who run it.)
    toggleDisplayCommand = "toggledeptdisplays",
    activeColor = "~g~",
    inactiveColor = "~r~",
    HUD = {
        --[[
        The text that will show up on the HUD. Available placeholders;
        {YOURCHOSENPLACEHOLDERHERE} - A department
        ]]
        Display = "~b~Active Emergeny Services:~w~ {LEO} | {FIRE}{FBI}",
        x = .16,
        y = .869,
        scale = .45,
        center = false,
    },
    Departments = {
        [1] = {
            command = {"leohud", "ICT.LEOHud"},
            activeOnStart = false,
            placeHolder = "LEO",
            HUDText = "LEO",
            showTextWhenInactive = true,
        },
        [2] = {
            command = {"firehud", "ICT.FireHud"},
            activeOnStart = false,
            placeHolder = "FIRE",
            HUDText = "FIRE/EMS",
            showTextWhenInactive = true,
        },
        [3] = {
            command = {"fbihud", "ICT.FBIHud"},
            activeOnStart = false,
            placeHolder = "FBI",
            HUDText = "~w~| ~g~FBI",
            showTextWhenInactive = false,
        },
    },
    Messages = {
        prefix = "^7[^5SERVERNAMEHERE^7]^0 ", 
        noToggleDepartmentPermission = "^1You do not have permission to toggle the state of that department.",
    },  
}