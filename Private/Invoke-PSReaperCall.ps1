function Invoke-PSReaperCall {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Fragment
    )
    
    if (-not $Script:ReaperConn) {
        try {
            Connect-PSReaper
        }
        catch {
            throw 'No Reaper connection found. please run Connect-PSReaper to create connection properties'
        }
    }

    $uri = "$($Script:ReaperConn.uri.AbsoluteUri)_/$Fragment"

    Invoke-RestMethod $uri
}