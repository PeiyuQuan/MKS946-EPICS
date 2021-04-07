#!../../bin/linux-x86_64/MKS946

#- You may have to change MKS946 to something else
#- everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/MKS946.dbd"
MKS946_registerRecordDeviceDriver pdbbase


epicsEnvSet("PREFIX", "UWXRD:MKS946:")
epicsEnvSet("PORT", "serial4")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/MKS946App/Db")

drvAsynIPPortConfigure("serial4", "192.168.0.108:4004<192.168.0.108:4004/> COM", 0, 0, 0)
asynOctetSetInputEos("serial4",0,"FF")
asynOctetSetOutputEos("serial4",0,"FF")
asynSetOption("serial4",0,"baud","115200")
asynSetOption("serial4",0,"bits","8")
asynSetOption("serial4",0,"stop","1")
asynSetOption("serial4",0,"parity","none")
#asynSetOption("serial4",0,"clocal","Y")
asynSetOption("serial4",0,"crtscts","N")




## Load record instances
#dbLoadRecords("db/xxx.db","user=uwchamber")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc1,N=1")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc2,N=2")
dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc3,N=3")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc4,N=4")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc5,N=5")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946MFC.db","P=$(PREFIX),PORT=serial4,MFC=mfc6,N=6")

#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946PRC.db","P=$(PREFIX),PORT=serial4,PRC=prc1,N=1")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946PRC.db","P=$(PREFIX),PORT=serial4,PRC=prc2,N=2")
#dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946PRC.db","P=$(PREFIX),PORT=serial4,PRC=prc3,N=3")

cd "${TOP}/iocBoot/${IOC}"
iocInit
create_monitor_set("auto_settings.req", 30,"P=UWXRD:MKS946:")
## Start any sequence programs
#seq sncxxx,"user=uwchamber"
