-- СКРИПТ ГЛЕБА ДЛЯ ТЕХ, КТО ЗАПУСТИЛ
local songName = "Midu_Music.mp3"
local songUrl = "https://github.com/dksks8282/GlebScripts/raw/refs/heads/main/Midu_Echoing.mp3"

-- Шаг 1: Скрипт скачивает твою песню в папку инжектора
if not isfile(songName) then
    writefile(songName, game:HttpGet(songUrl))
end

-- Шаг 2: Создаем звук и берем его из скачанного файла
local sound = Instance.new("Sound")
sound.Name = "GlebSong"
sound.SoundId = getcustomasset(songName) -- Вот эта команда заставляет файл работать!
sound.Volume = 2
sound.Parent = game:GetService("SoundService")

sound:Play()

-- Сообщение тому, кто запустил
game.StarterGui:SetCore("SendNotification", {
    Title = "Глеб Скрипт",
    Text = "Привет! Ты слышишь музыку Глеба.",
    Duration = 7
})
