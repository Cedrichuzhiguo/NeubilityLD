
LISCENSE_FOLDER = /home/label/Documents/Data/Newbility/LDEditor/license
LDE_SRC = /home/label/Documents/Data/Newbility/LDEditor/
LDE_TGT = ~/Documents/LDE/
LDE_CURRENT = ${LDE_TGT}/LDE_current
LDE_CURRENT_ZIP_FILENAME = LDE-v0.9.8.5.1.release.with.debug_OPP.tar.gz

# Find filename with .license extension from a subfolder

licenseFile=$(find /path/to/folder -maxdepth 1 -type f -name "*.license" | head -n 1)
cp ${licenseFile} ${LISCENSE_FOLDER}


#remove all the folder under LDE_TGT 
rm -rf ${LDE_TGT}/*

#unzip current zip file to LDE target folder
gunzip -c ${LDE_SRC}/${LDE_CURRENT_ZIP_FILENAME} > ${LDE_TGT}
dirname=$(find ${LDE_TGT} -maxdepth 1 -type d | head -n 1)

if [ -n "$dirname" ]; then
  #rename the dirname to LDE_CURRENT
  mv dirname ${LDE_CURRENT}
fi

#copy license file to the LDE_CURRENT folder
cp ${licenseFile} ${LDE_CURRENT}/license.license


