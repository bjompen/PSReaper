function Connect-PSReaper {
    param (
        # Uri, including port number, where Reaper is running.
        [Parameter()]
        [Alias('ComputerName')]
        [uri]$ReaperHost = 'http://127.0.0.1:8080'
    )
    
    $script:ReaperConn = @{
        'uri' = $ReaperHost
    }
}