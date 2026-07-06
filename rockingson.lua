local url = "https://files.catbox.moe/g5dpn7.jpg"
local images = {}
local count = 0
local delay = 0.3
local mindelay = 0.01

local function SpawnImage()
    count = count + 1
    local filename = "cirno" .. count .. ".png"

    http.Fetch(url, function(body)
        file.Write(filename, body)
        local mat = Material("../data/" .. filename)

        table.insert(images, {
            mat = mat,
            x = math.random(0, ScrW() - 128),
            y = math.random(0, ScrH() - 128),
            size = 128
        })
        surface.PlaySound("ambient/creatures/teddy.wav")
    end)

    if count % 1 == 0 then
        delay = math.max(mindelay, delay - 0.01)
        timer.Adjust("CirnoBorn", delay, 0, SpawnImage)
    end
end

timer.Create("CirnoBorn", delay, 0, SpawnImage)

hook.Add("HUDPaint", "DrawCirno", function()
    for _, img in ipairs(images) do
        surface.SetMaterial(img.mat)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRect(img.x, img.y, img.size, img.size)
    end
end)
