# bcmdhd
#	-DDHDTHREAD -DDHD_GPL -DDHD_SCHED -DDHD_DEBUG -DSDTEST -DBDC -DTOE    \
#	-DDHD_BCMEVENTS -DSHOW_EVENTS -DDONGLEOVERLAYS -DBCMDBG               \
#	-DCUSTOMER_HW2 -DOOB_INTR_ONLY -DHW_OOB       \
#	-DMMC_SDIO_ABORT -DBCMSDIO -DBCMLXSDMMC -DBCMPLATFORM_BUS -DWLP2P     \
#	-DNEW_COMPAT_WIRELESS -DWIFI_ACT_FRAME -DARP_OFFLOAD_SUPPORT          \
#	-DKEEP_ALIVE -DCSCAN -DGET_CUSTOM_MAC_ENABLE -DPKT_FILTER_SUPPORT     \
#	-DEMBEDDED_PLATFORM -DENABLE_INSMOD_NO_FW_LOAD -DPNO_SUPPORT          \

DHDCFLAGS = -Wall -Wstrict-prototypes -Dlinux -DLINUX -DBCMDRIVER             \
        -DBCMDONGLEHOST -DUNRELEASEDCHIP -DBCMDMA32 -DBCMFILEIMAGE            \
        -DDHDTHREAD -DBDC                                                     \
        -DDHD_BCMEVENTS -DSHOW_EVENTS -DBCMDBG                                \
        -DMMC_SDIO_ABORT -DBCMSDIO -DBCMLXSDMMC -DBCMPLATFORM_BUS -DWLP2P     \
        -DWIFI_ACT_FRAME -DARP_OFFLOAD_SUPPORT                                \
        -DKEEP_ALIVE -DCSCAN -DPKT_FILTER_SUPPORT                             \
        -DEMBEDDED_PLATFORM -DPNO_SUPPORT -DSDIO_CRC_ERROR_FIX                \
	-Idrivers/net/wireless/bcmdhd -Idrivers/net/wireless/bcmdhd/include

DHDOFILES = aiutils.o bcmsdh_sdmmc_linux.o dhd_linux.o siutils.o bcmutils.o   \
	dhd_linux_sched.o dhd_sdio.o bcmwifi_channels.o bcmevent.o hndpmu.o   \
	bcmsdh.o dhd_cdc.o bcmsdh_linux.o dhd_common.o linux_osl.o            \
	bcmsdh_sdmmc.o dhd_custom_gpio.o sbutils.o wl_android.o wl_linux_mon.o   \
	dhd_cfg80211.o wl_cfg80211.o wl_cfgp2p.o wldev_common.o wl_roam.o

#################
# Common feature
#################

DHDCFLAGS += -DHW_OOB
DHDCFLAGS += -DOOB_INTR_ONLY
DHDCFLAGS += -DCUSTOM_OOB_GPIO_NUM=$(CONFIG_BCMDHD_GPIO_WL_HOSTWAKEUP)

ifeq ($(CONFIG_WIFI_CONTROL_FUNC),y)
DHDCFLAGS += -DCUSTOMER_HW2
DHDCFLAGS += -DCONFIG_WIFI_CONTROL_FUNC
endif

DHDCFLAGS += -DCUSTOMER_HW4
DHDCFLAGS += -DCUSTOMER_HW10
#Koine Kim C.G + 11019_ymlee
DHDCFLAGS += -DKEEP_ALIVE_PACKET_PERIOD_30_SEC
#DHDCFLAGS += -DBLOCK_IPV6_PACKET -DPASS_IPV4_SUSPEND
#DHDCFLAGS += -DSUPPORT_DEEP_SLEEP
#DHDCFLAGS += -DSIMPLE_MAC_PRINT

# Print out kernel panic point of file and line info when assertion happened
DHDCFLAGS += -DBCMASSERT_LOG

# For p2p connection issue
DHDCFLAGS += -DWL_CFG80211_GON_COLLISION
DHDCFLAGS += -DWL_SCB_TIMEOUT=10

# For Passing all multicast packets to host when not in suspend mode.
DHDCFLAGS += -DPASS_ALL_MCAST_PKTS

# Early suspend
#DHDCFLAGS += -DDHD_USE_EARLYSUSPEND 

DHDCFLAGS += -DSUPPORT_PM2_ONLY

# For Scan result patch
DHDCFLAGS += -DESCAN_RESULT_PATCH
DHDCFLAGS += -DDUAL_ESCAN_RESULT_BUFFER

DHDCFLAGS += -DROAM_ENABLE -DROAM_CHANNEL_CACHE -DROAM_API
#DHDCFLAGS += -DDISABLE_FW_ROAM_SUSPEND

# For Static Buffer
ifeq ($(CONFIG_BROADCOM_WIFI_RESERVED_MEM),y)
  DHDCFLAGS += -DCONFIG_DHD_USE_STATIC_BUF
  DHDCFLAGS += -DENHANCED_STATIC_BUF
  DHDCFLAGS += -DSTATIC_WL_PRIV_STRUCT
endif

# For CCX
ifeq ($(CONFIG_BRCM_CCX),y)
  DHDCFLAGS += -DBCMCCX
endif

DHDCFLAGS += -DWL_CFG80211
# Pantech patch, Koine Kim C.G + 11019_ymlee, For get FER, RSSI ...
DHDCFLAGS += -DCUSTOMER_HW_PANTECH

# SoftAP
DHDCFLAGS += -DSUPPORT_AUTO_CHANNEL -DSUPPORT_HIDDEN_AP
DHDCFLAGS += -DSUPPORT_SOFTAP_SINGL_DISASSOC 
#DHDCFLAGS += -DUSE_STAMAC_4SOFTAP

# DPC priority
DHDCFLAGS += -DCUSTOM_DPC_PRIO_SETTING=98

# WiFi turn off delay
DHDCFLAGS += -DWIFI_TURNOFF_DELAY=100

# DTIM listen interval in suspend mode(0 means follow AP's DTIM period)
DHDCFLAGS += -DCUSTOM_SUSPEND_BCN_LI_DTIM=3

# Priority mismatch fix with kernel stack
DHDCFLAGS += -DPKTPRIO_OVERRIDE
#DHDCFLAGS += -DBG_PKTPRIO_OVERRIDE

# Ioctl timeout 5000ms
DHDCFLAGS += -DIOCTL_RESP_TIMEOUT=5000

# WiFi Kernel thread type
DHDCFLAGS += -DUSE_KTHREAD_API

# for only AP Certification
#DHDCFLAGS += -DBCMWPA_MIXED

# B/G/BGN mode support in HOSTAPD
#DHDCFLAGS += -DSUPPORT_HOSTAPD_BGN_MODE

############
# JellyBean 
############
DHDCFLAGS += -DWL_ENABLE_P2P_IF
#DHDCFLAGS += -DMULTIPLE_SUPPLICANT
DHDCFLAGS += -DWL_CFG80211_STA_EVENT

#########################
# Chip dependent feature
#########################


  DHDCFLAGS += -DBCM4330_CHIP
  DHDCFLAGS += -DMCAST_LIST_ACCUMULATION
  DHDCFLAGS += -DCONFIG_PM_LOCK
  DHDCFLAGS += -DCUSTOM_GLOM_SETTING=0
  DHDCFLAGS += -DPASS_ARP_PACKET
  DHDCFLAGS += -DWL_CFG80211_VSDB_PRIORITIZE_SCAN_REQUEST


#############################
# Platform dependent feature
#############################

DHDCFLAGS += -DGET_CUSTOM_MAC_ENABLE
DHDCFLAGS += -DENABLE_INSMOD_NO_FW_LOAD


#########
# Others
#########

#EXTRA_LDFLAGS += --strip-debug

EXTRA_CFLAGS += $(DHDCFLAGS) -DDHD_DEBUG
KBUILD_CFLAGS += -I$(LINUXDIR)/include -I$(shell pwd)


obj-$(CONFIG_BCMDHD) += bcmdhd.o
bcmdhd-objs := $(DHDOFILES)

all:
	@echo "$(MAKE) --no-print-directory -C $(KDIR) SUBDIRS=$(CURDIR) modules"
	@$(MAKE) --no-print-directory -C $(KDIR) SUBDIRS=$(CURDIR) modules

clean:
	rm -rf *.o *.ko *.mod.c *~ .*.cmd \
	Module.symvers modules.order .tmp_versions modules.builtin

install:
	@$(MAKE) --no-print-directory -C $(KDIR) \
		SUBDIRS=$(CURDIR) modules_install
