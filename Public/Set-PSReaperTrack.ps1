function Set-PSReaperTrack {
    param (
        # ID / Index number of track
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('ID', 'Index')]
        [Int]$tracknumber,

        # sets volume for a track. If value starts with + or -, then adjustment is relative (in dB), otherwise adjustment is absolute (1=0dB, etc). If value ends in "g", then ganging is ignored.
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$Volume,

        # sets pan for a track. If value starts with + or -, adjustment is relative. If value ends in "g", then ganging is ignored.
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$pan,

        # sets width for a track. If value starts with + or -, adjustment is relative. If value ends in "g", then ganging is ignored.
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]$width,

        [Parameter()]
        [switch]$Mute,

        [Parameter()]
        [switch]$Solo,

        [Parameter()]
        [switch]$FX,

        [Parameter()]
        [switch]$Recarm,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('cycle', 'on', 'auto')]
        [string]$Recmon,

        [Parameter()]
        [string]$TrackName
        
    )

    # SET/TRACK/index/xxxxx/value
    $BaseFragment = "SET/TRACK/$tracknumber"
    $Fragment = [string]::Empty

    switch ($PSBoundParameters.Keys) {
        'Volume'    { $Fragment = "$Fragment$BaseFragment/VOL/$Volume;" }
        'pan'       { $Fragment = "$Fragment$BaseFragment/PAN/$pan;" }
        'width'     { $Fragment = "$Fragment$BaseFragment/WIDTH/$width;" }
        'Mute'      { $Fragment = "$Fragment$BaseFragment/MUTE/-1;" }
        'Solo'      { $Fragment = "$Fragment$BaseFragment/SOLO/-1;" }
        'FX'        { $Fragment = "$Fragment$BaseFragment/FX/-1;" }
        'Recarm'    { $Fragment = "$Fragment$BaseFragment/RECARM/-1;" }
        'Recmon'    { $Fragment = switch ($Recmon) {
            'cycle' { "$Fragment$BaseFragment/RECMON/-1;" }
            'on'    { "$Fragment$BaseFragment/RECMON/1;" }
            'auto'  { "$Fragment$BaseFragment/RECMON/2;" }
        }}
        'TrackName' { $Fragment = "$Fragment$BaseFragment/P_NAME/$TrackName;SET/UNDO/Rename%20Track" }
   }
    
    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment ).Split("`t")
    }
    catch {
        throw $_
    }

    $Res
}