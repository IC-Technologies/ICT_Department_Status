if Config.enableBadessentialsIntregration and (GetResourceState("Badssentials") ~= "starting" or GetResourceState("Badssentials") ~= "started") then
    print("")
end

for deptID, deptTable in pairs(Config.Departments) do
    if deptTable.command[1] ~= nil and deptTable.command[1] ~= "" then
        RegisterCommand(deptTable.command[1], function(source, args)
            local src = source

            if src == 0 or IsPlayerAceAllowed(src, deptTable.command[2]) then
                UpdateDepartmentStatus(deptID, not Config.Departments[deptID].activeOnStart)
            else
                TriggerClientEvent("chatMessage", src, Config.Messages.prefix .. Config.Messages.noToggleDepartmentPermission)
            end
        end)
    end
end

function UpdateDepartmentStatus(deptID, bool)
    Config.Departments[deptID].activeOnStart = bool

    TriggerClientEvent("ICT_Department_Status:UpdateDepartmentStatus", -1, deptID, Config.Departments[deptID].activeOnStart)
end