$services_automatic = @(
    'Dhcp',
    'iphlpsvc',
    'RasAuto',
    'IKEEXT',
    'lmhosts',
    'LanmanWorkstation',
    'Wecsvc',
    'LanmanServer',
    'WlanSvc',
    'NetTcpPortSharing',
    'WinRM',
    'AppIDSvc'
)

$services_manual = @(
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
    'RemoteAccess',
    'RasMan',
    'NcaSvc',
    'wlpasvc',
    'WwanSvc',
    'PolicyAgent',
    'vds',
    'p2psvc',
    'PNRPAutoReg',
    'PNRPsvc',
    'p2pimsvc',
    'SNMPTRAP',
    'SessionEnv',
    'upnphost',
    'SharedAccess',
    'UmRdpService',
    'dot3svc',
    'Netlogon',
    'CertPropSvc',
    'SstpSvc',
    'MSiSCSI',
    'IpxlatCfgSvc',
    'Wcmsvc',
    'icssvc',
    'WMPNetworkSvc',
    'ALG',
    'TermService',
    'TapiSrv',
    'lltdsvc',
    'BITS'
)

$services_disabled = @(
    'SSDPSRV',
    'bthserv'
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

set_service_startuptype -Services $services_automatic -Type Automatic
set_service_startuptype -Services $services_manual -Type Manual
set_service_startuptype -Services $services_disabled -Type Disabled
