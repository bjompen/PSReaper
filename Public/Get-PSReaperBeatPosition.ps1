function Get-PSReaperBeatPosition {
    param (
        
    )
    
    $Fragment = 'BEATPOS'
    
    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment ).Split("`t")
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
        full_beat_position = [math]::Round($Res[3])
        measure_cnt = $Res[4]
        beats_in_measure = [math]::Ceiling($Res[5])
        time_signature = "$($Res[6])/$($Res[7])"
    }

    $RetObj
}