rem # CPU Frequency

rem # !!! WARNING !!!

rem # FIND CPU MAX TURBO BOOST SPEED BEFORE ADJUSTING

rem # !!! WARNING !!!

rem # VALUE IS MHZ

rem # 4.2GHZ = 4200MHZ

PAUSE

echo "Enter CPU Max Turbo Speed in MHz"
set /p MHz=""

rem # Maximum processor frequency (PROCFREQMAX)
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e100 %MHz%

rem # Maximum processor frequency for Processor Power Efficiency Class 1 (PROCFREQMAX1)
powercfg -setacvalueindex SCHEME_CURRENT 54533251-82be-4824-96c1-47b60b740d00 75b0ae3f-bce0-45a7-8c89-c9611c25e101 %MHz%


PAUSE

