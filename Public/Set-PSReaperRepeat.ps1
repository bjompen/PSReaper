function Set-PSReaperRepeat {
    param (
        # Sets or toggles repeat.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Toggle', 'on', 'off')]
        [string]$Repeat
    )
    
    $Fragment = switch ($Repeat) {
        'Toggle' { 'SET/REPEAT/-1' }
        'on'     { 'SET/REPEAT/1' }
        'off'    { 'SET/REPEAT/0' }
    }

    try { 
        Invoke-PSReaperCall -Fragment $Fragment
    }
    catch {
        throw $_
    }

    Get-PSReaperRepeat

}