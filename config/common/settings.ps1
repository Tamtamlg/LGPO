function create_restore_point {

    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 0 -PropertyType DWord -Force
    
    Enable-ComputerRestore -Drive "C:\"
    
    Start-Process -FilePath "vssadmin.exe" -ArgumentList "resize shadowstorage /for=C: /on=C: /maxsize=5GB" -NoNewWindow -Wait
    
    $timestamp = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
    Checkpoint-Computer -Description "restore point $timestamp" -RestorePointType "MODIFY_SETTINGS"
    
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 1440

    Write-Host "Restore point has been created" -ForegroundColor Green
}

function set_events_log_size {
    
    #1073741824 = 1048576 Kb
    #2147483648 = 2097152 Kb
    #157286400 = 153600 Kb

    wevtutil sl Application /ms:1073741824
    wevtutil sl Security /ms:2147483648
    wevtutil sl System /ms:1073741824
    wevtutil sl Microsoft-Windows-PowerShell/Operational /ms:1073741824
    wevtutil sl Microsoft-Windows-TaskScheduler/Operational /ms:157286400
    wevtutil sl "Windows PowerShell" /ms:1073741824
    
    Write-Host "Event Viewer has been configured" -ForegroundColor Green
}

function set_crash_on_audit_fail {

    $pathCrashOnFail = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
    $nameCrashOnFail = "CrashOnAuditFail"
    
    $currentValueCrashOnFail = Get-ItemProperty -Path $pathCrashOnFail -Name $nameCrashOnFail -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $nameCrashOnFail
    
    if ($currentValueCrashOnFail -ne 0) {
        Set-ItemProperty -Path $pathCrashOnFail -Name $nameCrashOnFail -Value 0 -PropertyType DWord -Force
    }

    Write-Host "CrashOnAuditFail has been configured" -ForegroundColor Green
}

function add_settings {

    create_restore_point
    set_events_log_size
    set_crash_on_audit_fail

}


add_settings
