#!/bin/bash

FIGURES='https://www.fourmilab.ch/hackdiet/online/figures/'

mkdir -p src/assets/figures
cd src/assets/figures

wget $FIGURES/{badge_sample,darwin,next,next_gr,prev,prev_gr,swlogo,titleicon,titlepage}.png $FIGURES/{hdicon.ico,swlogo.gif}
