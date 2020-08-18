function Get-PSReaperTrack {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]$TrackID,
        
        [Parameter()]
        [ValidatePattern('^\d{1,2}-\d{1,2}$', ErrorMessage = "Input needs to be in StartTrack-EndTrack format.")]
        [string]$TrackRange
    )
    
    if ($TrackID -and $TrackRange) {
        throw 'TrackID and TrackRange are mutualy exclusive.'
    }

    $Fragment = 'TRACK'
    if ($TrackID) {
        $Fragment = "$Fragment/$TrackID"
    }
    if ($TrackRange) {
        $Fragment = "$Fragment/$TrackRange"
    }

    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment).split("`n").where({$_})
    }
    catch {
        throw $_
    }

    foreach ($track in $Res) {
        $TrackObj = $track.split("`t")

        [PSCustomObject]@{
            Name = $TrackObj[0]
            tracknumber = $TrackObj[1]
            trackname = $TrackObj[2]
            trackflags = [trackflags]$TrackObj[3]
            volume = $TrackObj[4]
            pan = $TrackObj[5]
            last_meter_peak = $TrackObj[6]
            last_meter_pos = $TrackObj[7]
            width = $TrackObj[8]
            panmode = $TrackObj[9]
            sendcnt = $TrackObj[10]
            recvcnt = $TrackObj[11]
            hwoutcnt = $TrackObj[12]
            color = $TrackObj[13]
        }
        
    }
}