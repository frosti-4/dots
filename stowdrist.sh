#!/bin/bash

# Путь к вашей папке с дотфайлами
DOTS_DIR="$HOME/dots"
CONFIG_DIR="$HOME/.config"

# Проверка, существует ли папка с дотфайлами
if [ ! -d "$DOTS_DIR" ]; then
    echo "Ошибка: Директория $DOTS_DIR не найдена."
    exit 1
fi

echo "--- Подготовка к stow ---"

# 1. Удаляем существующие конфиги (чтобы stow не ругался на конфликты)
for app in fish kitty; do
    if [ -d "$CONFIG_DIR/$app" ] || [ -L "$CONFIG_DIR/$app" ]; then
        echo "Удаление старого конфига: $app"
        rm -rf "$CONFIG_DIR/$app"
    fi
done

# 2. Переходим в папку с дотфайлами
cd "$DOTS_DIR" || exit

# 3. Создаем симлинки через stow
# Предполагается, что внутри ~/dots лежат папки fish/ и kitty/, 
# в которых структура повторяет путь от домашней папки (напр. dots/fish/.config/fish/...)
echo "Создание симлинков через GNU Stow..."
stow fish
stow kitty

echo "--- Готово! ---"
