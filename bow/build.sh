#!/bin/bash
gcc bow.c -o bow32 -fno-stack-protector -z execstack -m32