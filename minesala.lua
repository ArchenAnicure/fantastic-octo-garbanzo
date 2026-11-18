local urls = {
    "https://i.postimg.cc/KvqnGK5x/Rock-Rockinson.jpg",
    "https://i.postimg.cc/PqLKsbsm/Screenshot-2026-11-18-183548.png",
    "https://i.postimg.cc/7YxVYrry/Screenshot-2026-11-18-183610.png"
}

local images = {}
local count = 0
local delay = 0.0001
local mindelay = 0.0001

local function SpawnImage()
    count = count + 1
    local filename = "rockinson" .. count .. ".png"
    local url = urls[math.random(#urls)] -- randomly pick one of the 3 images

    http.Fetch(url, function(body)
        file.Write(filename, body)
        local mat = Material("../data/" .. filename)

        table.insert(images, {
            mat = mat,
            x = math.random(0, ScrW() - 128),
            y = math.random(0, ScrH() - 128),
            size = 256
        })
        print("CURSED BY ROCK")
        surface.PlaySound("rockrockinson/minesala2.wav")
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
        surface.SetDrawColor(255, 255, 255)
        surface.DrawTexturedRect(img.x, img.y, img.size, img.size)
    end
end)

surface.PlaySound("rockrockinson/minesala2.wav")
surface.PlaySound("rockrockinson/minesala2.wav")
surface.PlaySound("rockrockinson/minesala2.wav")
