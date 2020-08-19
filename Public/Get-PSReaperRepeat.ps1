function Get-PSReaperRepeat {
    [CmdLetBinding()]
    param (

    )
    
    $Fragment = 'GET/REPEAT'

    try { 
        $Res = (Invoke-PSReaperCall -Fragment $Fragment).split("`t").Trim()
    }
    catch {
        throw $_
    }

    [PSCustomObject]@{
        Repeat = switch ($Res[1]) {
            '0' { 'off' }
            '1' { 'on' }
        }
    }
}