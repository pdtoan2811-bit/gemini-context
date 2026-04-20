@echo off
setlocal EnableDelayedExpansion

echo ===============================================================
echo  Multi-Agent Custom Automation Engine - One-Click Launcher
echo ===============================================================
echo.

Rem Debug: Print current location
echo [DEBUG] Current directory: %CD%

Rem Set credentials
set AZURE_SUBSCRIPTION_ID=ad92798a-d509-457a-9cc7-29adbf93cabb
set AZURE_RESOURCE_GROUP=rg-pdtoan2811-1063
set AZURE_LOCATION=eastus

Rem --- LOCAL DB CONFIG ---
set USE_LOCAL_DB=true

Rem --- MODEL CONFIG ---
set AZURE_OPENAI_DEPLOYMENT_NAME=o4-mini
set AZURE_OPENAI_API_VERSION=2024-05-01-preview

echo [INFO] Environment:
echo     Subscription: %AZURE_SUBSCRIPTION_ID%
echo     Resource Group: %AZURE_RESOURCE_GROUP%
echo     Database Mode: LOCAL (No Cosmos DB required)
echo     Model: %AZURE_OPENAI_DEPLOYMENT_NAME%

Rem --- STEP 1: CHECK AZD IN PATH ---
where azd >nul 2>nul
if %errorlevel% equ 0 goto :FoundGlobalAzd

echo [WARN] 'azd' not found in global PATH. Checking default install location...

Rem --- STEP 2: CHECK DEFAULT LOCATION ---
if exist "%LOCALAPPDATA%\Programs\Azure Dev CLI\azd.exe" goto :FoundLocalAzd

Rem --- STEP 3: INSTALL AZD ---
echo [ERROR] Azure Developer CLI (azd) is not explicitly installed.
echo.
echo We will attempt to install it for you now via PowerShell.
echo Press any key to continue with installation...
pause

echo [INFO] Installing azd...
powershell -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

if errorlevel 1 goto :InstallFailed

echo [INFO] Installation successful.
set "PATH=%LOCALAPPDATA%\Programs\Azure Dev CLI;%PATH%"
goto :CheckAzdFinal

:FoundLocalAzd
echo [INFO] Found azd in LOCALAPPDATA. Adding to PATH temporarily...
set "PATH=%LOCALAPPDATA%\Programs\Azure Dev CLI;%PATH%"
goto :CheckAzdFinal

:FoundGlobalAzd
echo [INFO] azd is in global PATH.
goto :CheckAzdFinal

:CheckAzdFinal
where azd >nul 2>nul
if %errorlevel% neq 0 goto :FatalAzdMissing

echo [INFO] azd is ready:
azd version
echo.

Rem --- STEP 4: LOGIN ---
echo [INFO] Logging into Azure...
call azd auth login
if %errorlevel% neq 0 goto :LoginFailed

Rem --- STEP 5: DEPLOY ---
echo.
echo [INFO] Starting Deployment (azd up)...
echo [NOTE] Using Subscription: %AZURE_SUBSCRIPTION_ID%
echo.

Rem Update .env for local run if needed, but 'azd up' usually deploys to cloud.
Rem If running locally, you'd use 'func start' or typical python start commands. 
Rem Assuming 'azd up' is still the desired launch method for resources, 
Rem BUT our code changes mainly affect the runtime behavior.
Rem To verify local DB, we simply pass the env var.

call azd up

if %errorlevel% neq 0 goto :DeployFailed

echo.
echo [SUCCESS] Deployment complete!
echo.
echo To run post-deployment scripts (upload sample data):
echo Powershell: infra\scripts\Selecting-Team-Config-And-Data.ps1
echo.
pause
exit /b 0

:InstallFailed
echo [ERROR] Automatic installation failed.
echo Please manually install from: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd
pause
exit /b 1

:FatalAzdMissing
echo [FATAL] Could not find 'azd' executable even after checks.
echo Please restart your computer or install 'azd' manually.
pause
exit /b 1

:LoginFailed
echo [ERROR] Failed to login to Azure.
pause
exit /b 1

:DeployFailed
echo.
echo [ERROR] Deployment failed. Please check the logs above.
echo Common reasons: Missing permissions, Quota limits, Invalid location.
pause
exit /b 1
