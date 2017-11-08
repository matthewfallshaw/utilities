#!/bin/sh

diskutil eject $(diskutil list | grep 'external, physical' | cut -d' ' -f1)
