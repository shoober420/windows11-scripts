rem -cef-force-32bit breaks launch
rem DONT USE COMMANDS: -dev -console -cef-disable-sandbox -no-cef-sandbox

cd "C:\Program Files (x86)\Steam"
start steam.exe -nointro -nobigpicture -nocrashmonitor -disablehighdpi -vrdisable -cef-disable-breakpad -cef-disable-js-logging -noconsole -oldtraymenu -showallbetas +open steam://open/minigameslist

rem cd "C:\Program Files (x86)\Steam"
start steam.exe -nofriendsui -no-dwrite -nointro -nobigpicture -nofasthtml -nocrashmonitor -noshaders -no-shared-textures -disablehighdpi -cef-single-process -cef-in-process-gpu -single_core -disable-winh264 -vrdisable -cef-disable-breakpad -cef-disable-d3d11 -cef-disable-gpu-compositing -cef-disable-gpu -cef-disable-js-logging -cef-disable-occlusion -cef-disable-renderer-restart -noconsole -oldtraymenu -showallbetas +open steam://open/minigameslist