#!/usr/bin/bash 

set -eux

## Files Downloading
wget -q https://github.com/zxunge/build-wxWidgets/releases/download/wxWidgets-3.2.5-21-stl-cb-winlibs1420/wxWidgets-3.2.5-21-stl-cb-winlibs1420.7z
#wget -q https://sourceforge.net/projects/codeblocks/files/Binaries/Nightlies/Prerequisites/Mingw64dlls14.1.0.7z
#wget -q https://sourceforge.net/projects/codeblocks/files/Binaries/Nightlies/2024/CB_20240815_rev13542_win64.7z
wget -q https://github.com/brechtsanders/winlibs_mingw/releases/download/14.2.0posix-18.1.8-12.0.0-ucrt-r1/winlibs-i686-posix-dwarf-gcc-14.2.0-mingw-w64ucrt-12.0.0-r1.7z
wget -q https://github.com/wxWidgets/wxWidgets/releases/download/v3.2.5/wxWidgets-3.2.5-headers.7z
#wget -q https://sourceforge.net/projects/codeblocks/files/Binaries/Nightlies/Prerequisites/wxmsw32u_gcc_cb_wx325_2D_gcc1410-mingw64.7z
#7z x ./Mingw64dlls14.1.0.7z -o/opt/codeblocks/bin
7z x ./wxWidgets-3.2.5-headers.7z -o/opt/wxwidgets3.2
7z x ./winlibs-i686-posix-dwarf-gcc-14.2.0-mingw-w64ucrt-12.0.0-r1.7z -o/opt
#7z x ./wxmsw32u_gcc_cb_wx325_2D_gcc1410-mingw64.7z -o/opt/codeblocks/bin
#7z x ./CB_20240815_rev13542_win64.7z -o/opt/codeblocks/bin
7z x ./wxWidgets-3.2.5-21-stl-cb-winlibs1420.7z -o/opt/wxwidgets3.2
git clone https://github.com/bmatzelle/gow.git /opt/gow
git clone https://github.com/arnholm/codeblocks_sfmirror.git

## Building
export PATH=$PATH:/opt/codeblocks/bin:/opt/mingw32/bin:/opt/gow/bin
which zip
cp Makefile_core codeblocks_sfmirror/src/
cd codeblocks_sfmirror/src/
#cbp2make --config platform -unix
#cbp2make -in CodeBlocks_wx32.cbp -out Makefile_core
MSYS2_ARG_CONV_EXCL='*' cmd /c "mingw32-make -f Makefile_core WX32_INCLUDE=D:/msys64/opt/wxwidgets3.2/include WX32_LIB=D:/msys64/opt/wxwidgets3.2/lib TARGET_OBJECT_DIR=.objs32"
