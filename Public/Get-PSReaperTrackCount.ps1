function Get-PSReaperTrackCount {
    param (
        
    )

    $Fragment = 'NTRACK'
    
    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment).split("`t")
    }
    catch {
        throw $_
    }

    $Ret = [PSCustomObject]@{
        Name = $Res[0]
        Tracks = $Res[1].Trim()
    }
    
    $Ret
}