#!/bin/bash

cd ~/../kpa/master/htw
ps | grep -i .elf | grep HCR | awk '{print $1}' | xargs kill -9
sh ~/../kpa/master/htw/run.sh
