function Undo-PSReaperAction {
    param (
        # How many steps back would you like to undo.
        [Parameter()]
        [ValidateRange(1, 99)]
        [int]$Last = 1
    )
    
    $Fragment = [string]::Empty

    1..$Last | ForEach-Object {
        $Fragment = "$Fragment`40029;"
    } 

    try { 
        Invoke-PSReaperCall -Fragment $Fragment
    }
    catch {
        throw $_
    }
}