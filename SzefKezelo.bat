@ECHO OFF
chcp 65001
cls
title Széf kezelő
if EXIST "Széf (rejtett)" goto UNLOCK
if NOT EXIST Széf goto MDLOCKED
:CONFIRM
echo Leakarod zárni a széfedet, és szeretnéd titkosítani? (Y = I / N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==I goto LOCK
if %cho%==i goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Érvénytelen paraméter!
goto CONFIRM
:LOCK
ren Széf "Széf (rejtett)"
attrib +h +s "Széf (rejtett)"
echo Széf lezárva és titkosítva
goto End
:UNLOCK
echo Széf észlelve! Írd be a jelszót, hogy felold a széf titkosítását!
set/p "pass=>"
if NOT %pass%==password goto FAIL
attrib -h -s "Széf (rejtett)"
ren "Széf (rejtett)" Széf
echo Széf feloldva
goto End
:FAIL
echo Helytelen jelszó
goto end
:MDLOCKED
md Széf
echo Széf létrehozva
goto End
:End