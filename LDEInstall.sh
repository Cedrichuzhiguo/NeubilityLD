LISCENSE_FOLDER="/home/label/Documents/Data/Newbility/LDEditor/licenses/"
LDE_SRC="/home/label/Documents/Data/Newbility/LDEditor/"
LDE_TGT="/home/label/Documents/LDE"
LDE_CURRENT="${LDE_TGT}/LDE_current"
LDE_CURRENT_ZIP_FILENAME="LDE-v0.9.8.5.1.release.with.debug_OPP.tar.gz"

echo "${LDE_CURRENT}"

# Find filename with .license extension from a subfolder
licenseFile=$(find "${LDE_TGT}" -maxdepth 1 -type f -name "*.license" | head -n 1)
licenseFile=$(basename "$licenseFile")
echo "now copy license file ${licenseFile} to ${LISCENSE_FOLDER}"
cp "${LDE_TGT}/${licenseFile}" "${LISCENSE_FOLDER}/"

# Remove all the folders under LDE_TGT 
rm -rf "${LDE_CURRENT}"

# Unzip current zip file to LDE target folder
tar -xzf "${LDE_SRC}/${LDE_CURRENT_ZIP_FILENAME}" -C "${LDE_TGT}"
dirname=$(find "${LDE_TGT}" -maxdepth 1 -type d | head -n 2 | tail -n 1)
echo "The new LDE license folder to be renamed $dirname"

if [ -n "$dirname" ]; then
  # Rename the dirname to LDE_CURRENT
  mv "${dirname}/" "${LDE_CURRENT}"
fi


# Copy license file to the LDE_CURRENT folder
cp "${LISCENSE_FOLDER}/${licenseFile}" "${LDE_CURRENT}/license.license"





