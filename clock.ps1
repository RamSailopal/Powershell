#
#   Display a clock, clearing the screen each second
#
while(1) {
    Clear-Host
    Get-Date | ForEach-Object {
        $day=$_.Day.toString()
        $month=$_.Month.toString()
        $hour=$_.Hour.toString()
        $minute=$_.Minute.toString()
        $second=$_.Second.toString()
        $year=$_.Year.toString()
        If ($day.Length -eq 1) {
            $day = "0$($day)"
        }
        If ($month.Length -eq 1) {
            $month = "0$($month)"
        }
        If ($hour.Length -eq 1) {
            $year = "0$($hour)"
        }
        If ($minute.Length -eq 1) {
            $minute = "0$($minute)"
        }
        If ($second.Length -eq 1) {
            $second = "0$($second)"
        }
        Write-Host "$($_.DayofWeek) $($day)/$($month)/$($year) $($hour):$($minute):$($second)"
        Write-Host -ForegroundColor red "Press any key to quit" 
    }
    Start-Sleep -Seconds 1
    #
    #   Check for a key being pressed while sleep is in progress
    #
    If ( $host.UI.RawUI.KeyAvailable ) {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp,IncludeKeyDown")
        If ($key.KeyDown -eq "True") {
            break
        }
    }
}