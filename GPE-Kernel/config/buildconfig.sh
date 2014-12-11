#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/elementalx.conf"

#L2M
L2M=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Menu Settings #####\n# 0 to disable logo2menu" >> $CONFIGFILE
echo -e "# 1 to enable logo2menu\n" >> $CONFIGFILE
if [ $L2M = 1 ]; then
  echo "LOGO2MENU=1" >> $CONFIGFILE;
else
  echo "LOGO2MENU=0" >> $CONFIGFILE;
fi

#BLN
BLN=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### BLN Settings ######\n# 1 to enable button light notification\n# 0 to disable button light notification\n" >> $CONFIGFILE
if [ $BLN = 1 ]; then
  echo "BLN=1" >> $CONFIGFILE;
else
  echo "BLN=0" >> $CONFIGFILE;
fi

#S2W
SR=`grep "item.0.1" /tmp/aroma/sw.prop | cut -d '=' -f2`
SL=`grep "item.0.2" /tmp/aroma/sw.prop | cut -d '=' -f2`
SU=`grep "item.0.3" /tmp/aroma/sw.prop | cut -d '=' -f2`
SD=`grep "item.0.4" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep left" >> $CONFIGFILE
echo -e "# 4 to enable sweep up" >> $CONFIGFILE
echo -e "# 8 to enable sweep down\n" >> $CONFIGFILE
echo -e "# For combinations, add values together (e.g. all gestures enabled = 15)\n" >> $CONFIGFILE
if [ $SL = 1 ]; then
  SL=2
fi
if [ $SU == 1 ]; then
  SU=4
fi
if [ $SD == 1 ]; then
  SD=8
fi  

S2W=$(( SL + SR + SU + SD ))
echo S2W=$S2W >> $CONFIGFILE;

#DT2W
DT2W=`grep "item.0.5" /tmp/aroma/sw.prop | cut -d '=' -f2`
DT2WF=`grep "item.0.6" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n# 2 to enable DoubleTap2Wake fullscreen\n" >> $CONFIGFILE
if [ $DT2W = 1 ]; then
  echo "DT2W=1" >> $CONFIGFILE;
elif [ $DT2WF = 1 ]; then
  echo "DT2W=2" >> $CONFIGFILE;
else
  echo "DT2W=0" >> $CONFIGFILE;
fi

#L2W
L2W=`grep "item.0.7" /tmp/aroma/sw.prop | cut -d '=' -f2`
L2S=`grep selected.2 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Logo2Wake Settings #####\n# 0 to disable Logo2Wake/Logo2Sleep" >> $CONFIGFILE
echo -e "# 1 to enable Logo2Wake/Logo2Sleep\n" >> $CONFIGFILE
if [ $L2W = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
elif [ $L2S = 1 ]; then
  echo "LOGO2WAKE=1" >> $CONFIGFILE;
else
  echo "LOGO2WAKE=0" >> $CONFIGFILE;
fi

#Pocket detection
POCKET=`grep "item.0.8" /tmp/aroma/sw.prop | cut -d '=' -f2`
echo -e "\n\n##### Pocket Detection Settings #####\n# 0 to disable pocket detection" >> $CONFIGFILE
echo -e "# 1 to enable pocket detection(default)\n" >> $CONFIGFILE
if [ $POCKET = 1 ]; then
  echo "POCKET=1" >> $CONFIGFILE;
else
  echo "POCKET=0" >> $CONFIGFILE;
fi


#VIBRATION
VIB=`cat /tmp/aroma/vibrate.prop | cut -d '=' -f2`
echo -e "\n\n##### Vibration Settings #####\n# 0 to disable vibration" >> $CONFIGFILE
echo -e "# 1 for default vibration\n# 2 for stronger vibration\n" >> $CONFIGFILE
if [ $VIB = 1 ]; then
  echo "VIB=0" >> $CONFIGFILE;
elif [ $VIB = 3 ]; then
  echo "VIB=2" >> $CONFIGFILE;
else
  echo "VIB=1" >> $CONFIGFILE;
fi

#S2S
S2S=`grep selected.1 /tmp/aroma/s2s.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2sleep Settings #####\n# 0 to disable sweep2sleep" >> $CONFIGFILE
echo -e "# 1 to enable sweep2sleep right" >> $CONFIGFILE
echo -e "# 2 to enable sweep2sleep left" >> $CONFIGFILE
echo -e "# 3 to enable sweep2sleep left and right\n" >> $CONFIGFILE
if [ $S2S = 2 ]; then
  echo "S2S=1" >> $CONFIGFILE;
elif [ $S2S = 3 ]; then
  echo "S2S=2" >> $CONFIGFILE;
elif [ $S2S = 4 ]; then
  echo "S2S=3" >> $CONFIGFILE;
else
  echo "S2S=0" >> $CONFIGFILE;
fi

#FASTCHARGE
FC=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Fastcharge Settings ######\n# 1 to enable usb fastcharge\n# 0 to disable usb fastcharge\n" >> $CONFIGFILE
if [ $FC = 1 ]; then
  echo "FC=1" >> $CONFIGFILE;
else
  echo "FC=0" >> $CONFIGFILE;
fi

#COLOR ENHANCE
CE=`grep "item.0.4" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### HTC Color Enhancement settings ######\n# 1 to enable HTC color enhancement (default)\n# 0 to disable HTC color enhancement\n" >> $CONFIGFILE
if [ $CE = 1 ]; then
  echo "COLOR_ENHANCE=0" >> $CONFIGFILE;
else
  echo "COLOR_ENHANCE=1" >> $CONFIGFILE;
fi


#Graphics Boost
GBOOST=`grep "item.0.5" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Graphics Boost Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
if [ $GBOOST = 0 ]; then
  echo "GBOOST=0" >> $CONFIGFILE;
else
  echo "GBOOST=1" >> $CONFIGFILE;
fi

#Color module
COLOR=`grep "item.0.7" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Color/Gamma Settings ######\n# 1 to enable Color/Gamma support\n# 0 to disable Color/Gamma support\n" >> $CONFIGFILE
if [ $COLOR = 1 ]; then
  echo "COLOR=1" >> $CONFIGFILE;
else
  echo "COLOR=0" >> $CONFIGFILE;
fi

#GPU OC
GPU_OC=`grep selected.1 /tmp/aroma/gpu.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Settings ######\n#values:  410 450 477 491 504 531 558 585\n#These cannot be applied if you selected stock GPU frequency during installation\n" >> $CONFIGFILE
if [ $GPU_OC = 2 ]; then
  echo "GPU_OC=410" >> $CONFIGFILE;
elif [ $GPU_OC = 3 ]; then
  echo "GPU_OC=450" >> $CONFIGFILE;
elif [ $GPU_OC = 4 ]; then
  echo "GPU_OC=477" >> $CONFIGFILE;
elif [ $GPU_OC = 5 ]; then
  echo "GPU_OC=491" >> $CONFIGFILE;
elif [ $GPU_OC = 6 ]; then
  echo "GPU_OC=504" >> $CONFIGFILE;
elif [ $GPU_OC = 7 ]; then
  echo "GPU_OC=531" >> $CONFIGFILE;
elif [ $GPU_OC = 8 ]; then
  echo "GPU_OC=558" >> $CONFIGFILE;
elif [ $GPU_OC = 9 ]; then
  echo "GPU_OC=585" >> $CONFIGFILE;
else
  echo "GPU_OC=0" >> $CONFIGFILE;
fi

#THERMAL
THERM=`grep selected.3 /tmp/aroma/cpu.prop | cut -d '=' -f2`
echo -e "\n\n##### Thermal Settings #####\n# 0 for default thremal throttling" >> $CONFIGFILE
echo -e "# 1 to run cool\n# 2 to run extra cool\n# 3 to run hot\n" >> $CONFIGFILE
if [ $THERM = 1 ]; then
  echo "THERM=2" >> $CONFIGFILE;
elif [ $THERM = 2 ]; then
  echo "THERM=1" >> $CONFIGFILE;
elif [ $THERM = 4 ]; then
  echo "THERM=3" >> $CONFIGFILE;
else
  echo "THERM=0" >> $CONFIGFILE;
fi

#MPDECISION
MPDEC=`grep selected.2 /tmp/aroma/cpu.prop | cut -d '=' -f2`
echo -e "\n\n##### Mpdecision Settings #####\n# 0 for default settings" >> $CONFIGFILE
echo -e "# 1 for battery saving\n# 2 for performance\n" >> $CONFIGFILE
if [ $MPDEC = 1 ]; then
  echo "MPDEC=1" >> $CONFIGFILE;
elif [ $MPDEC = 3 ]; then
  echo "MPDEC=2" >> $CONFIGFILE;
else
  echo "MPDEC=0" >> $CONFIGFILE;
fi

#GPU Governor
GPU_GOV=`grep selected.2 /tmp/aroma/gpu.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Governor #####\n# 1 Ondemand (default)" >> $CONFIGFILE
echo -e "# 2 Simple\n# 3 Performance\n" >> $CONFIGFILE
if [ $GPU_GOV = 2 ]; then
  echo "GPU_GOV=2" >> $CONFIGFILE;
else
  echo "GPU_GOV=1" >> $CONFIGFILE;
fi

#i/o scheduler
SCHED=`grep selected.0 /tmp/aroma/disk.prop | cut -d '=' -f2`
echo -e "\n\n##### i/o Scheduler #####\n# 1 CFQ (stock)" >> $CONFIGFILE
echo -e "# 2 ROW (default)\n# 3 deadline\n# 4 FIOPS\n# 5 SIO\n# 6 BFQ\n# 7 noop\n" >> $CONFIGFILE
if [ $SCHED = 1 ]; then
  echo "SCHED=1" >> $CONFIGFILE;
elif [ $SCHED = 2 ]; then
  echo "SCHED=2" >> $CONFIGFILE;
elif [ $SCHED = 3 ]; then
  echo "SCHED=3" >> $CONFIGFILE;
elif [ $SCHED = 4 ]; then
  echo "SCHED=4" >> $CONFIGFILE;
elif [ $SCHED = 5 ]; then
  echo "SCHED=5" >> $CONFIGFILE;
elif [ $SCHED = 6 ]; then
  echo "SCHED=6" >> $CONFIGFILE;
elif [ $SCHED = 7 ]; then
  echo "SCHED=7" >> $CONFIGFILE;
fi


#reinstall options
echo -e "\n\n\n\n##### Reinstall Options #####" >> $CONFIGFILE
echo -e "# These settings are only applied if you run the express installer" >> $CONFIGFILE

#Maximum CPU freqs
CPU0=$(cat /tmp/aroma/freq0.prop | cut -d '=' -f2)
if [ ! -e /tmp/aroma/freq1.prop ]; then
  cp /tmp/aroma/freq0.prop /tmp/aroma/freq1.prop;
  cp /tmp/aroma/freq0.prop /tmp/aroma/freq2.prop;
  cp /tmp/aroma/freq0.prop /tmp/aroma/freq3.prop;
fi
CPU1=$(cat /tmp/aroma/freq1.prop | cut -d '=' -f2)
CPU2=$(cat /tmp/aroma/freq2.prop | cut -d '=' -f2)
CPU3=$(cat /tmp/aroma/freq3.prop | cut -d '=' -f2)


echo -e "\n\n##### Max CPU Frequncies #####" >> $CONFIGFILE
echo -e "# 1=1134MHz 2=1350MHz" >> $CONFIGFILE
echo -e "# 3=1566MHz 4=1728MHz" >> $CONFIGFILE
echo -e "# 5=1836MHz 6=1890MHz" >> $CONFIGFILE
echo -e "# 7=1944MHz 8=1998MHz" >> $CONFIGFILE
echo -e "# 9=2052MHz 10=2106MHz" >> $CONFIGFILE
echo -e "# 11=2133MHz 12=2160MHz" >> $CONFIGFILE
echo -e "# 13=2214MHz 14=2295MHz\n" >> $CONFIGFILE


echo "CPU0=$CPU0" >> $CONFIGFILE;
echo "CPU1=$CPU1" >> $CONFIGFILE;
echo "CPU2=$CPU2" >> $CONFIGFILE;
echo "CPU3=$CPU3" >> $CONFIGFILE;

#set undervolting
UV=$(cat /tmp/aroma/uv.prop | cut -d '=' -f2)
echo -e "\n\n##### Undervolt Settings #####" >> $CONFIGFILE
echo -e "# 1=stock 2=850mV 3=825mV 4=800mV" >> $CONFIGFILE
echo -e "# 5=775mV 6=750mV 7=725mV\n" >> $CONFIGFILE
echo "UV=$UV" >> $CONFIGFILE;

#GPU frequency
GPU_OC=$(grep selected.1 /tmp/aroma/gpu.prop | cut -d '=' -f2)
echo -e "\n\n##### GPU Settings #####" >> $CONFIGFILE
echo -e "# 1=stock 2=overclock (default)\n" >> $CONFIGFILE
echo "GPU_OC=$GPU_OC" >> $CONFIGFILE;

echo -e "\n\n##############################" >> $CONFIGFILE
#END
