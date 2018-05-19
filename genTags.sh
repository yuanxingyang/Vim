#!/bin/bash
OUT_PATH=${PWD}
SRC_PATH=( \
	${PWD}/dev/src/system/tsd-swupdate \
	${PWD}/dev/src/system/tsd-swupdate-client-pwc \
	${PWD}/dev/src/system/tsd-swupdate-client \
	${PWD}/dev/src/system/tsd-swupdate-client-android_ota \
	${PWD}/dev/src/system/tsd-swupdate-client-can \
	${PWD}/dev/src/system/tsd-swupdate-client-eth \
	${PWD}/dev/src/system/tsd-swupdate-client-flash \
	${PWD}/dev/src/system/tsd-swupdate-client-pkg \
	${PWD}/dev/src/system/tsd-swupdate-common \
	${PWD}/dev/src/system/tsd-swupdate-diagnosis \
	${PWD}/dev/src/system/tsd-swupdate-systemhmi \
	${PWD}/dev/src/system/tsd-swupdate-ta \
	${PWD}/dev/src/system/tsd-swupdate-viewcontroller \
        )

if [ -d ${OUT_PATH} ];
then
	echo "Use current directory \"${OUT_PATH}}\""
else
	echo "mkdir \"${OUT_PATH}\""
	mkdir ${OUT_PATH}
fi

rm -rf ${OUT_PATH}/names.file
for s in ${SRC_PATH[@]}; do
	if [ -d $s ];
	then
	   echo "scan $s ..."
	   find -L $s -name "*.h" -o -name "*.cpp" -o -name "*.cc" -o -name "*.c" -o -name "*.hpp"|grep -vi '\.git' >>${OUT_PATH}/names.file
        else
	   echo -e "\033[31m \033[05m ERROR:$s not exist! \033[0m"
	fi

done

echo "create ctag database"
ctags -L ${OUT_PATH}/names.file -f ${OUT_PATH}/tags
rm -rf ${OUT_PATH}/names.file
echo "Done!"
