#setting up variables
$outfile = "c:\Scripts\cwspots_test.log"
$cwskimmerlog = "C:\Users\dl0pf\AppData\Roaming\Afreet\Products\SkimSrv\Spots.txt"
$TargetTime = (Get-Date).AddMinutes(-5)

$Content = (Get-Content $cwskimmerlog -tail 5000).where({
    [datetime]($_ -replace "(^\S+\s\S+).*",'$1') -ge $TargetTime
},'SkipUntil')

$Content | Out-File $outfile

((Get-Content $outfile) -join "`n") + "`n" | Set-Content -NoNewline $outfile

#Invoke-Expression -Command "c:\Scripts\Copy_cwspots_2_HUP.cmd"

