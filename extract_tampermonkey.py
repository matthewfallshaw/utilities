#!/usr/bin/env python

# Linux usage: ./extract_tampermonkey_script.py "/home/<USER>/.config/<BROWSER>/Default/Local Extension Settings/<EXTENSION_ID>"
#        i.e.: ./extract_tampermonkey_script.py "/home/foo/.config/google-chrome-beta/Default/Local Extension Settings/gcalenpjmijncebpfijmoaglllgpjagf"
#   Mac usage: ./extract_tampermonkey_script.py "/Users/<USER>/Library/Application Support/Google/Chrome/Default/Local Extension Settings/<EXTENSION_ID>/"
#        i.e.: ./extract_tampermonkey_script.py "/Users/foo/Library/Application Support/Google/Chrome/Default/Local Extension Settings/dhdgffkkebhmkfjojejmpbldmpobfkfo/"

import leveldb
import sys
import re
import json
import codecs

pattern = re.compile("^@source(.*)$")

db = leveldb.LevelDB(sys.argv[1:][0])

for bk,bv in db.RangeIter():
    k = bk.decode('utf-8')
    v = bv.decode('utf-8')
    m = pattern.match(k)
    if m:
        name = re.sub("[\W\b]", "_", m.groups()[0].strip())
        full_name = "%s.user.js" % name

        print("Writing to %s" % full_name)

        content = json.loads(v)['value']

        with codecs.open(full_name, 'w', 'utf-8') as text_file:
            text_file.write(content)
