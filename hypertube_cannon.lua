local panel = component.proxy("6F4C089A4D1E7CFB92C771ADDBEA7393")
local power = component.proxy("A3690B5B46666F19EBBC60AD2231BE3E")
local goButton = panel:getXModule(0)

local onFor = 10
local onUntil

event.listen(goButton)

while true do
  evt= event.pull(0.5)
  if(evt == "Trigger") then
    power.isSwitchOn = true
    now = computer.magicTime()
    onUntil = now + onFor
  end

  if onUntil ~= nil and computer.magicTime() > onUntil then
    power.isSwitchOn = false
    onUntil = nil
  end
end