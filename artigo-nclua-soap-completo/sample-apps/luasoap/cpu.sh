#!/bin/bash

#Cria o arquivo apenas com o título das colunas
#apaga se o mesmo já existir
ps -aux | head -1 > cpu.log

while true
do
  #Pega a lista de processos lua
  #e passa novamente para o grep
  #retornando apenas as linhas
  #que não possuem (-v) a palavra grep.
  #Desta lista, passa pro grep
  #novamente para retonar
  #as que não tem a palavra gnome-terminal
  #e concatena no cpu.log
  ps -aux | grep lua | grep -v grep | grep -v gnome-terminal >> cpu.log
done
