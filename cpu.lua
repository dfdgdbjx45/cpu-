
local RunService = game:GetService("RunService")

local stressEnabled = true      
local intensity = 500000          

local maxSeconds = 500000
local startTime = tick()

local function heavyComputation()
    local x = 0
    for i = 1, intensity do
        x = math.sin(i) * math.cos(i) * math.sqrt(i)
    end
    return x
end

RunService.Heartbeat:Connect(function()
    if not stressEnabled then return end

    if tick() - startTime > maxSeconds then
        stressEnabled = false
        warn("Stress test ended automatically (safety limit reached)")
        return
    end

    local result = heavyComputation()

    if result == math.huge then
        print("impossible")
    end
end)