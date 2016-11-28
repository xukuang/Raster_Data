library(raster)
library(rgdal)

### դ����󻹿����ڶ���R֮ǰ�鿴
GDALinfo("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

### դ���в���ֵ����ȡ
### ������դ�����Ķ�ȡ

DSM_HARV1 <- readGDAL("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")

### դ�����鿴
summary(DSM_HARV1)
slot(DSM_HARV1, "grid")
slot(DSM_HARV1, "bbox")
slot(DSM_HARV1, "proj4string")
dat.DSM1 = slot(DSM_HARV1, "data")
class(dat.DSM1)
head(dat.DSM1)

### դ�������ӻ�
image(DSM_HARV1,'band1', col = rev(terrain.colors(255)))

### դ������в���ֵ����ȡ
### ���������դ�����һһ��Ӧ������ƽ�̵�դ����

### ����һ
dat.mat = t(as.matrix(DSM_HARV1))
write.csv(dat.mat,"dat.mat.csv")

dat.mat1 = t(matrix(dat.DSM1$band1, 1697))
write.csv(dat.mat1, 'dat.mat1.csv')

### ��image()����������֤���������դ�����һһ��Ӧ
image(1:nrow(dat.mat1), 1:ncol(dat.mat1), dat.mat1, col = rev(terrain.colors(255))) ## ����ͼ��֮����������Ĳ�һ��������Ϊimage()������ͼ�ķ�ʽ������ƽ�̵���ˮƽ���ϵ�

### ������
library("raster")
DSM_HARV2 = raster("NEON-DS-Airborne-Remote-Sensing/HARV/DSM/HARV_dsmCrop.tif")
dat.mat2 = as.matrix(DSM_HARV2)
write.csv(dat.mat2,"dat.mat2.csv")

### ������
### 
dat.vector = as.vector(DSM_HARV2)
dat.xy = xyFromCell(DSM_HARV2,1:ncell(DSM_HARV2))
dat.mat3 = data.frame(dat.xy,dat.vector)
write.csv(dat.mat3, file = 'dat.mat3.csv')


### դ�����δ����R֮ǰ�鿴
GDALinfo("NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_RGB_Ortho.tif")

RGB_HARV1 <- readGDAL("NEON-DS-Airborne-Remote-Sensing/HARV/RGB_Imagery/HARV_RGB_Ortho.tif")

### դ�����鿴
summary(RGB_HARV1)
slot(RGB_HARV1, "grid")
slot(RGB_HARV1, "bbox")
slot(RGB_HARV1, "proj4string")
dat.RGB1 = slot(RGB_HARV1, "data")
class(dat.RGB1)
head(dat.RGB1)

rgb.dat.mat = t(as.matrix(RGB_HARV1))
write.csv(dat.mat,"dat.mat.csv")
