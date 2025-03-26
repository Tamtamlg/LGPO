$services_disabled = @(
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

$services_automatic = @(
    'AppIDSvc'
)

function set_service_startuptype() {
    param (
        $services, 
        $type
    )
    foreach ($service in $services) {
        try {
            sc.exe config $service start = $type | Out-Null
            Write-Host "$($service) is $($type)" -ForegroundColor Green
        } catch {
            Write-Host "Something wrong with $($service): $_" -ForegroundColor Red
        }
    }
}

set_service_startuptype -Services $services_disabled -Type Disabled
set_service_startuptype -Services $services_automatic -Type Automatic