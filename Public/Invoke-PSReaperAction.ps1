function Invoke-PSReaperAction {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet('play', 'stop', 'pause', 'next', 'previous', 'record', 'abort')]
        [String]$Action
    )
    
    $Fragment = [reaperaction]::$Action.Value__

    try { 
        Invoke-PSReaperCall -Fragment $Fragment
    }
    catch {
        throw $_
    }

}