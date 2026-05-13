local e=LocalPlayer():GetEyeTrace().Entity if IsValid(e) then for k,v in pairs(e:GetMaterials()) do print("materials/"..v..".vmt") end end
