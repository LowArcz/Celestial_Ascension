spawn(function ()
    while task.wait(.1) do
        for i,v in pairs(game:GetService("Workspace").Bushes:GetDescendants()) do
            if _G.Leaf then
                if v:IsA("MeshPart") then
                    if v.Transparency == 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        wait(_G.TPTime)
                    end
                end
            end
        end
    end
end)


local function fireproximityprompt(ProximityPrompt: ProximityPrompt, Amount: Integer, Skip: Boolean)
    assert(ProximityPrompt, "Argument #1 Missing or nil")
    assert(typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"), "Attempted to fire a Value that is not a ProximityPrompt")

    local HoldDuration = ProximityPrompt.HoldDuration
    if Skip then
        ProximityPrompt.HoldDuration = 0
    end

    for i = 1, Amount or 1 do
        ProximityPrompt:InputHoldBegin()
        if Skip then
            local RunService = game:GetService("RunService")
            local Start = time()
            repeat
                RunService.Heartbeat:Wait(0.1)
            until time() - Start > HoldDuration
        end
        ProximityPrompt:InputHoldEnd()
    end
    ProximityPrompt.HoldDuration = HoldDuration
end


spawn(function()
    while task.wait(.1) do
        pcall(function()
            for i,v in pairs(game:GetService("Workspace").Bushes:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    fireproximityprompt(v, 1, true)
                    wait(1)
                end
            end
        end)
    end
end)
