# Author: Yanni Zhan
# Date  : 08/03/2017
# For Modis EVI, red, blue, MIR, NIR LTA average download, mosaic, reproject and clip over Africa

# Note: You must install the MODIS Reprojection tools


rm(list=ls())

base_directory="/data2/MODIS" #the directory you want to save the data

setwd(base_directory)



### Step 1. Download + Mosaic 

##### download parameters

Band       = "EVI" #or "RED","BLUE","NIR","MIR","NDVI"

month      = 01
raw_folder = "01Jan" #02Feb,03Mar,07Jul,... #for naming use only
year_input = 2000:2016 #the temporal range you want to download #Jan starts from 2001

username   = "abc" #replace with your own username & password
pwd        = "123456"


##### MRT setting

MRTpath    = "/usr/local/mrt/bin"


##### start downloading

start_time1=Sys.time()

source("./function/Africa_download_mosaic_oneBand.R")




##### Step 2. LTA (before starting this step, you should already have downloaded all the months)

##### GRASS settings

gisBase="/usr/lib/grass64"
gisDbase="/data3/grassdata"


##### start calculating

start_time2=Sys.time()

source("./function/Africa_LTA_oneBand.R")
#or run the faster python script



### Step 3. reproject to laea & clip 

##### parameters

mapset="/data3/grassdata/lambert/quar_clip"


##### start 
in_folder="/data2/MODIS/200002-201706/EVI"

start_time3=Sys.time()

source("./function/Africa_laea_clip_oneBand.R")

