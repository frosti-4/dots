#!/bin/bash

# Цветовая палитра (RGBA-формат, где последние два символа — альфа-канал)
BLANK='00000000'
CLEAR='ffffff22'
DEFAULT='88c0d0ff'
TEXT='eeeeeeff'
WRONG='bf616aff'
VERIFY='a3be8cff'

swaylock \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 120 \
  --indicator-thickness 10 \
  --effect-blur 7x7 \
  --effect-vignette 0.5:0.5 \
  --ring-color $DEFAULT \
  --inside-color $BLANK \
  --ring-ver-color $VERIFY \
  --inside-ver-color $CLEAR \
  --ring-wrong-color $WRONG \
  --inside-wrong-color $CLEAR \
  --text-color $TEXT \
  --text-ver-color $TEXT \
  --text-wrong-color $TEXT
