function Connect-PSReaper {
    param (
        # Uri, including port number, where Reaper is running.
        [Parameter()]
        [Alias('ComputerName')]
        [uri]$ReaperHost = 'http://localhost:8080'
    )
    
    $script:ReaperConn = @{
        'uri' = $ReaperHost
    }
}