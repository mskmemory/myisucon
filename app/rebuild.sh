#!bin/bash
cd webapp/go
rm isucari
killall isucari
make
./isucari &