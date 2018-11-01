-- Define the variable used to open/close the tab
local tabEnabled = false
local tabLoaded = true --false

function REQUEST_NUI_FOCUS(bool)
    SetNuiFocus(bool, bool) -- focus, cursor
    if bool == true then
        SendNUIMessage({showtab = true})
    else
        SendNUIMessage({hidetab = true})
    end
    return bool
end

RegisterNUICallback(
    "tablet-bus",
    function(data)
        -- Do tablet hide shit
        if data.load then
            print("Loaded the tablet")
            tabLoaded = true
        elseif data.hide then
            print("Hiding the tablet")
            SetNuiFocus(false, false) -- Don't REQUEST_NUI_FOCUS here
            tabEnabled = false
        elseif data.click then
        -- if u need click events
        end
    end
)


Citizen.CreateThread(
    function()
        -- Wait for nui to load or just timeout
        local l = 0
        local timeout = false
        while not tabLoaded do
            Citizen.Wait(0)
            l = l + 1
            if l > 500 then
                tabLoaded = true --
                timeout = true
            end
        end

        if timeout == true then
            print("Failed to load tablet nui...")
        -- return ---- Quit
        end

        print("::The client lua for tablet loaded::")

        REQUEST_NUI_FOCUS(false) -- This is just in case the resources restarted whilst the NUI is focused.

        while true do
            -- Control ID 20 is the 'Z' key by default
            -- 244 = M
            -- Use https://wiki.fivem.net/wiki/Controls to find a different key
            if (IsControlJustPressed(1, 57)) then
				startAnim()
                tabEnabled = not tabEnabled -- Toggle tablet visible state
                REQUEST_NUI_FOCUS(tabEnabled)
                print("The tablet state is: " .. tostring(tabEnabled))
                Citizen.Wait(0)
            end
            if (tabEnabled) then
                local ped = GetPlayerPed(-1)
                DisableControlAction(0, 1, tabEnabled) -- LookLeftRight
                DisableControlAction(0, 2, tabEnabled) -- LookUpDown
                DisableControlAction(0, 24, tabEnabled) -- Attack
                DisablePlayerFiring(ped, tabEnabled) -- Disable weapon firing
                DisableControlAction(0, 142, tabEnabled) -- MeleeAttackAlternate
                DisableControlAction(0, 106, tabEnabled) -- VehicleMouseControlOverride
			end
			
			if not tabEnabled then
				stopAnim()
			end
			
            Citizen.Wait(0)
        end		
    end
)

function startAnim()
	Citizen.CreateThread(function()
	  RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
	  while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
	    Citizen.Wait(0)
	  end
		attachObject()
		TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function attachObject()
	tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
	StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
	DeleteEntity(tab)
end
