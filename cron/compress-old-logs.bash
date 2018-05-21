#!/bin/bash

# rm excess .log and .log.bz2 files (more than 5) and compress other than the newest .log file
/bin/ls -UtpT {*.log.bz2,*.log} | tail -n +6 | xargs -r -d \\n rm
/bin/ls -UtpT *.log | tail -n +2 | xargs -r -d \\n bzip2
