DisplayEnabled = true
ClientDisplayState = true

if (Config.toggleDisplayCommand ~= nil and Config.toggleDisplayCommand ~= "") then
    RegisterCommand(Config.toggleDisplayCommand, function(source, args)
        ClientDisplayState = not ClientDisplayState
    end)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if DisplayEnabled then
            local display = Config.HUD.Display

            for deptID, deptTable in pairs(Config.Departments) do
                local placeholder = "{" .. deptTable.placeHolder .. "}"
                if string.find(display, placeholder) then
                    if deptTable.activeOnStart then
                        display = display:gsub(placeholder, Config.activeColor .. deptTable.HUDText .. '~w~')
                    else
                        if deptTable.showTextWhenInactive then
                            display = display:gsub(placeholder, Config.inactiveColor .. deptTable.HUDText .. '~w~')
                        else
                            display = display:gsub(placeholder, "~w~")
                        end
                    end
                end
            end
            Draw2DText(Config.HUD.x, Config.HUD.y, display, Config.HUD.scale, Config.HUD.center)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        if DisplayEnabled and (Config.enableBadessentialsIntregration and exports['Badssentials']:IsDisplaysHidden()) or not ClientDisplayState then
            DisplayEnabled = false
        elseif ClientDisplayState and (Config.enableBadessentialsIntregration and not exports['Badssentials']:IsDisplaysHidden()) then
            DisplayEnabled = true
        end
    end
end)

function Draw2DText(x, y, text, scale, center)
    -- Draw text on screen
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    if center then 
    	SetTextJustification(0)
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

RegisterNetEvent("ICT_Department_Status:UpdateDepartmentStatus")
AddEventHandler("ICT_Department_Status:UpdateDepartmentStatus", function(deptID, bool)
    Config.Departments[deptID].activeOnStart = bool
end)