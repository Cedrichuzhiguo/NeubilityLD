LISCENSE_FOLDER="/home/label/Documents/Data/Newbility/LDEditor/license"
LDE_SRC="/home/label/Documents/Data/Newbility/LDEditor/"
LDE_TGT="~/Documents/LDE"
LDE_CURRENT="${LDE_TGT}/LDE_current"
LDE_CURRENT_ZIP_FILENAME="LDE-v0.9.8.5.1.release.with.debug_OPP.tar.gz"

# Find filename with .license extension from a subfolder
licenseFile=$(${LDE_TGT} -maxdepth 1 -type f -name "*.license" | head -n 1)
cp "${licenseFile}" "${LISCENSE_FOLDER}"

# Remove all the folder under LDE_TGT 
rm -rf "${LDE_TGT}"/*

# Unzip current zip file to LDE target folder
gunzip -c "${LDE_SRC}/${LDE_CURRENT_ZIP_FILENAME}" > "${LDE_TGT}/${LDE_CURRENT_ZIP_FILENAME%.gz}"
dirname=$(find "${LDE_TGT}" -maxdepth 1 -type d | head -n 1)

if [ -n "$dirname" ]; then
  # Rename the dirname to LDE_CURRENT
  mv "$dirname" "${LDE_CURRENT}"
fi

# Copy license file to the LDE_CURRENT folder
if [ ! -d "${LDE_CURRENT}" ]; then
  mkdir "${LDE_CURRENT}"
fi
cp "${licenseFile}" "${LDE_CURRENT}/license.license"



