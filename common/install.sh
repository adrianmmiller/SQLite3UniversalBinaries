LogFile="/storage/emulated/0/sqlite3install.log"
ui_print " "
ui_print " "

# check for required files
ui_print "Checking for existing sqlite3 binary...." 2>&1 | tee -a $LogFile
if [ -f /data/data/com.termux/files/usr/bin/sqlite3 ] ; then
	sqlpath=/data/data/com.termux/files/usr/bin
	ui_print "[Existing binary]: termux SQLite3 binary found in: $sqlpath" 2>&1 | tee -a $LogFile
	ui_print "Install aborted" 2>&1 | tee -a $LogFile
	abort
elif [ -f /data/data/com.keramidas.TitaniumBackup/files/sqlite3 ] ; 	then
	sqlpath=data/data/com.keramidas.TitaniumBackup/files/sqlite3
	ui_print "[Existing binary]: titanium SQLite3 binary found in: $sqlpath" 2>&1 | tee -a $LogFile
	ui_print "Install aborted" 2>&1 | tee -a $LogFile
	abort
elif [ -f /system/bin/sqlite3 ] ; 	then
	sqlpath=/system/bin
	ui_print "[Existing binary]: standard SQLite3 binary found in: $sqlpath" 2>&1 | tee -a $LogFile
	ui_print "Install aborted" 2>&1 | tee -a $LogFile
	abort
elif [ -f /system/xbin/sqlite3 ] ; then
	sqlpath=/system/xbin
	ui_print "[Existing binary]: standard SQLite3 binary found in: $sqlpath" 2>&1 | tee -a $LogFile
	ui_print "Install aborted" 2>&1 | tee -a $LogFile
	abort
else 
	ui_print "[Existing binary]: not found..." 2>&1 | tee -a $LogFile
	ui_print " "
	ui_print "[Determining architecture]..."; 2>&1 | tee -a $LogFile

# detect ARCH
ui_print "[Determining architecture]: $ARCH" 2>&1 | tee -a $LogFile

# copy sqlite3 binary
case $ARCH in 
	arm|arm64)
		mv $MODPATH/sqlite3-$ARCH $MODPATH/system/xbin/sqlite3  >/dev/null 2>&1
		if [ $? -eq 0 ]; then 
			ui_print "[File copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/xbin/sqlite3" 2>&1 | tee -a $LogFile
		else
			ui_print "[File NOT copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/xbin/sqlite3" 2>&1 | tee -a $LogFile
			abort "[File NOT copied]: Install will now exit" 2>&1 | tee -a $LogFile
		fi
		;;
	x86)
		mv $MODPATH/sqlite3-i386 $MODPATH/system/xbin/sqlite3
		if [ $? -eq 0 ]; then 
			ui_print "[File copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/xbin/sqlite3" 2>&1 | tee -a $LogFile
		else
			ui_print "[File NOT copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/xbin/sqlite3" 2>&1 | tee -a $LogFile
			abort "[File NOT copied]: Install will now exit" 2>&1 | tee -a $LogFile
		fi		
		;;		
	x86_64)
		mv $MODPATH/sqlite3-x86_64 $MODPATH/system/xbin/sqlite3
		if [ $? -eq 0 ]; then 
			ui_print "[File copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/$BINDIR/sqlite3" 2>&1 | tee -a $LogFile
		else
			ui_print "[File NOT copied]: $MODPATH/sqlite3-$ARCH to $MODPATH/system/$BINDIR/sqlite3" 2>&1 | tee -a $LogFile
			abort "[File NOT copied]: Install will now exit" 2>&1 | tee -a $LogFile
		fi		
		;;
	*)
		ui_print "[File NOT copied]: no sqlite3 binary for your reported ARCH: $ARCH" 2>&1 | tee -a $LogFile
		abort "[File NOT copied]: Install will now exit" 2>&1 | tee -a $LogFile
		;;	
esac		
		
#tidy up unneeded binaries	
ui_print "[Clean up]: unneeded binaries" 2>&1 | tee -a $LogFile	
rm -f $MODPATH/sqlite3*
if [ $? -eq 0 ]; then 
	ui_print "[Clean up]: unneeded binaries...successful" 2>&1 | tee -a $LogFile	
else
	ui_print "[Clean up]: up unneeded binaries...failed" 2>&1 | tee -a $LogFile	
fi
	
fi
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	