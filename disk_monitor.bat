@echo off
echo System Monitoring Script

REM Disk Usage
for /f "tokens=1-5" %%a in ('dir C:\^|find "free"') do set freeSpace=%%c
echo Free Space on C: drive: %freeSpace%

REM CPU Usage
for /f "tokens=*" %%i in ('powershell -command "Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average"') do set CPUUsage=%%i
echo CPU Usage: %CPUUsage% %%

for /f "tokens=*" %%j in ('powershell -command "$mem = Get-ComputerInfo; [math]::Round(($mem.CsTotalPhysicalMemory - $mem.OsTotalVisibleMemorySize) / $mem.CsTotalPhysicalMemory * 100, 2)"') do set MemUsage=%%j
echo Memory Usage: %MemUsage% %%
