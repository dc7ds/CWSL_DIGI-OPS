#
#variables
#
#full path to CWSL_DIGI console log...
#set via logfile=C:\CWSL_DIGI\console_log.txt in config.ini
$infile = "C:\CWSL_DIGI\console_log.txt"
#
#full path to output file, this will contain last 5 min of CWSL_DIGI activity
$outfile = "c:\Scripts\CWSL_DIGI-Win10-1.log"

#determine required utc deviation
$UTCnow = [System.DateTime]::UtcNow
#
#setting target timestamp using the deviation
$TargetTime = $UTCnow.AddMinutes(-5)

$Content = (Get-Content $infile -tail 10000).where({
    [datetime]($_ -replace "(^\S+\s\S+).*",'$1') -ge $TargetTime
},'SkipUntil')
$Content | Out-File $outfile


((Get-Content $outfile) -join "`n") + "`n" | Set-Content -NoNewline $outfile

#Invoke-Expression -Command "c:\Scripts\Copy_cwspots_2_HUP.cmd"

