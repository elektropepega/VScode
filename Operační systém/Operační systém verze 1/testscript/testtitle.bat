title Spouštění skriptu %~n0...
prepare %*

:start
title Zpracování souboru %1...
process %1
shift
if not [] == [%1] goto start

title Dokončeno
pause > N