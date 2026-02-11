-- ==========================================
-- АВТОР: ГЛЕБ (НОВОСИБИРСК)
-- НАЗВАНИЕ: САМАЯ КРУТАЯ МУЗЫКА В МИРЕ
-- ИНСТРУКЦИЯ: СКРИПТ ПЕРЕДАЕТ ДАННЫЕ ДРУГИМ!
-- ==========================================

local sound = Instance.new("Sound")
sound.Name = "Gleb_Global_Music"
sound.Parent = game:GetService("SoundService")

-- Ссылка на твой загруженный файл в GitHub:
sound.SoundId = "https://raw.githubusercontent.com/dksks8282/GlebScripts/main/Midu_Echoing.mp3"

-- Ультра-настройки (Глеб выкрутил на 10!)
sound.Volume = 10 
sound.Looped = true 
sound.RollOffMode = Enum.RollOffMode.Linear
sound.ReferenceDistance = 100000
sound.MaxDistance = 100000

-- ПОГНАЛИ!
sound:Play()

print("Скрипт Глеба успешно загружен! Музыка играет у всех скриптеров!")
