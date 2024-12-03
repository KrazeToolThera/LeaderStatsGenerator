local gScript='\ngame.Players.PlayerAdded:Connect(function(player)'
for _,item in pairs(game:GetService("Players").LocalPlayer:GetChildren()) do
    if table.find({'Backpack','StarterGear','PlayerGui','PlayerScripts'}, item.Name) then continue end

    local variable=string.lower(item.Name)

    gScript=gScript..'\n'..'  local '..variable..' = '..'Instance.new(\''..item.ClassName..'\')'
    gScript=gScript..'\n'..'  '..variable..'.Name = '..'\''..item.Name..'\''
    gScript=gScript..'\n'..'  '..variable..'.Parent = '..'player'

    local itemChildren=item:GetChildren()
    if #itemChildren ~= 1 then for _, v in pairs(itemChildren) do
        gScript=gScript..'\n'

        local itemvariable=string.lower(v.Name)

        gScript=gScript..'\n'..'  local '..itemvariable..' = '..'Instance.new(\''..v.ClassName..'\')'
        gScript=gScript..'\n'..'  '..itemvariable..'.Name = '..'\''..v.Name..'\''
        gScript=gScript..'\n'..'  '..itemvariable..'.Parent = '..variable
    end end
    gScript=gScript..'\n'
end
gScript=gScript..'end)'
if gScript ~= '\ngame.Players.PlayerAdded:Connect(function(player)end)' then setclipboard(gScript)end
