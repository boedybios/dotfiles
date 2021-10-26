#!/bin/bash

sleep 5
conky -c $HOME/.Conky/revolutionary_clocks/all/conkyrc1 &
sleep 1
conky -c $HOME/.Conky/revolutionary_clocks/all/conkyrc4 &
sleep 1
conky -c $HOME/.Conky/revolutionary_clocks/all/conkyrc3 &
sleep 1
conky -c $HOME/.Conky/revolutionary_clocks/all/conkyrc2 &
exit 0

