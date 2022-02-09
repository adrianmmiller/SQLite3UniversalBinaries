# SQLite3UniversalBinaries
A simple magisk module to provide universal SQLite3 binaries, notably used by my GPay SQLite Fix magisk module

*Inspired by Olivier Pantale & the aarch64 module*

This module will first check to see if an SQLite3 binary already exists in the common paths (as per my GPay SQLite Fix module), 
so it doesnt try and install another or overwrite an existing one. 

Armeabi-v7a architecture and above is provided by this module

Specifically supported:

    armeabi-v7a
    arm64-v8a
    x86
    x86_64

This module will put an sqlite3 binary into **/system/bin** if  **/system/xbin** is not present

Any scripts relying on this sqlite3 binary need to check both paths for sqlite....

Script Example for testing for presence of an sqlite3 binary in common known paths (path stored in sqlpath)

``` # check where sqlite3 is
ui_print "Checking for sqlite3 binary...."
	if [ -f /data/data/com.termux/files/usr/bin/sqlite3 ] ; then
		sqlpath=/data/data/com.termux/files/usr/bin
		ui_print "[termux] SQLite3 binary found in: $sqlpath"
	elif [ -f /data/data/com.keramidas.TitaniumBackup/files/sqlite3 ] ; then
		sqlpath=data/data/com.keramidas.TitaniumBackup/files/sqlite3
		ui_print "[titanium] SQLite3 binary found in: $sqlpath"	
	elif [ -f /system/bin/sqlite3 ] ; then
		sqlpath=/system/bin
		ui_print "[standard] SQLite3 binary found in: $sqlpath"
	elif [ -f /system/xbin/sqlite3 ] ; then
		sqlpath=/system/xbin
		ui_print "[standard] SQLite3 binary found in: $sqlpath"
	else 
		ui_print "SQLite3 binary not found, please install an SQLite3 binary, without this the fix may not work"
		ui_print "Please read the original post (see support link) or /cache/playfixfirstrun.log after reboot for further info"
	fi 	
```


**Please note:** the included LICENSE **only** covers the module components provided by the excellent work of Zack5tpg's 
Magisk Module Extended, which is available for here for module creators

https://github.com/Zackptg5/MMT-Extended/


All other work is credited above and **no one may fork or re-present this module as their own for the purposes of trying to 
monetize this module or its content without all parties permission. The module comes specifically without an overall license 
for this intent.**


### Project Stats ###

![GitHub release (latest by date)](https://img.shields.io/github/v/release/stylemessiah/SQLite3UniversalBinaries?label=Release&style=plastic)
![GitHub Release Date](https://img.shields.io/github/release-date/stylemessiah/SQLite3UniversalBinaries?label=Release%20Date&style=plastic)
![GitHub Releases](https://img.shields.io/github/downloads/stylemessiah/SQLite3UniversalBinaries/latest/total?label=Downloads%20%28Latest%20Release%29&style=plastic)
![GitHub All Releases](https://img.shields.io/github/downloads/stylemessiah/SQLite3UniversalBinaries/total?label=Total%20Downloads%20%28All%20Releases%29&style=plastic)
