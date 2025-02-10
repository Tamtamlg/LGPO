$services = @(
    'NlaSvc',
    'BthAvctpSvc',
    'CDPSvc',
    'Eaphost',
    'lfsvc',
    'edgeupdate',
    'edgeupdatem',
    'NcdAutoSetup',
    'NcbService',
    'QWAVE',
    'RmSvc',
    'TokenBroker',
    'WebClient',
    'WFDSConMgrSvc',
    'Audiosrv',
    'AudioEndpointBuilder',
    'MixedRealityOpenXRSvc',
    'XboxGipSvc',
    'XblAuthManager',
    'DusmSvc',
    'XblGameSave',
    'XboxNetApiSvc',
    'InstallService',
    'NetSetupSvc',
    'netprofm',
    'PhoneSvc',
    'Dhcp',
    'RemoteAccess',
    'RasMan',
    'NcaSvc',
    'wlpasvc',
    'WwanSvc',
    'PolicyAgent',
    'vds',
    'iphlpsvc',
    'RasAuto',
    'p2psvc',
    'PNRPAutoReg',
    'PNRPsvc',
    'p2pimsvc',
    'SNMPTRAP',
    'IKEEXT',
    'lmhosts',
    'SessionEnv',
    'upnphost',
    'SSDPSRV',
    'SharedAccess',
    'UmRdpService',
    'dot3svc',
    'Netlogon',
    'LanmanWorkstation',
    'CertPropSvc',
    'Wecsvc',
    'LanmanServer',
    'SstpSvc',
    'WlanSvc',
    'MSiSCSI',
    'IpxlatCfgSvc',
    'Wcmsvc',
    'icssvc',
    'NetTcpPortSharing',
    'WMPNetworkSvc',
    'bthserv',
    'WinRM',
    'ALG',
    'TermService',
    'TapiSrv',
    'lltdsvc',
    'BITS'
)

foreach ($service in $services) {
    try {
        Set-Service -Name $service -StartupType Disabled
        Write-Host "$($service) is Disabled" -ForegroundColor Green
    } catch {
        Write-Host "Something wrong with $($service): $_" -ForegroundColor Red
    }
}

# foreach ($service in $services) {
#     Write-Host "StartupType служби $($service) - $((Get-Service $service).StartType)" -ForegroundColor Yellow
# }