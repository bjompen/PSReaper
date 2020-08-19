function Set-PSReaperPosition {
    [CmdLetBinding(DefaultParameterSetName='PositionTime')]
    param (
        # Sets edit cursor position to value_in_seconds
        [Parameter(Mandatory, ParameterSetName='PositionTime')]
        [ValidatePattern('^\d+\.?\d*$', ErrorMessage = 'Input has to be in nnn or nnn.mmm format')]
        [string]$Position,

        # Sets edit cursor position to PositionAsString (format auto-detected). r1 goes to region ID 1, m1 to marker 1, R1 to first timeline region, M1 to first timeline marker.
        [Parameter(Mandatory, ParameterSetName='PositionString')]
        [ValidatePattern('^[rmRM]\d+$', ErrorMessage = 'Input should start with r, R, m, or M, followed by one or more digits.')]
        [string]$PositionAsString
    )
    
    $Fragment = switch ($PSCmdlet.ParameterSetName) {
        'PositionTime'   { "SET/POS/$Position" }
        'PositionString' { "SET/POS_STR/$PositionAsString" }
    }

    try { 
        Invoke-PSReaperCall -Fragment $Fragment
    }
    catch {
        throw $_
    }

}