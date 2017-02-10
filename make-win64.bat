@echo off

set GOROOT=%GOROOT%
set GOBIN=%~dp0\bin
set GOPATH=%GOPATH%;%~dp0
set GOARCH=amd64
set GOOS=windows
set CGO_ENABLED=1
set PATH=%GOBIN%;%PATH%

make clean --makefile=Makefile-win64
rd /s /q src\ngrok\client\assets
rd /s /q src\ngrok\server\assets
del /f /q bin\go-bindata.exe
make assets --makefile=Makefile-win64
make release-all --makefile=Makefile-win64

pause
