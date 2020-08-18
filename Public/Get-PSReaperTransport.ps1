function Get-PSReaperTransport {
    param (

    )
    
    $Fragment = 'TRANSPORT'
    
    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment).Split("`t")
    }
    catch {
        throw $_
    }

    $RetObj = [PSCustomObject]@{
        Name = $Res[0]
        playstate = switch ($res[1]) {
            0 { 'stopped' }
            1 { 'playing' }
            2 { 'paused' }
            5 { 'recording' }
            6 { 'record paused' }
            Default { 'Unknown' }
        }
        position_seconds =  New-TimeSpan -Seconds $Res[2]
        isRepeatOn = switch ($Res[3]) {
            0 { 'RepeatOff' }
            Default { 'RepeatOn' }
        }
        position_string = $Res[4]
        position_string_beats = $Res[5]
    }

    $RetObj
}