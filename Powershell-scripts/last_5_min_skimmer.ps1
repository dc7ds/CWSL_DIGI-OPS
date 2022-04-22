#
#
#
#
$outfile = "c:\Scripts\cwspots-Win10-4.log"
$outfile2 = "c:\Scripts\cwspots2.log"
$outfile3 = "c:\Scripts\CWSL_DIGI-Win10-4.log"
$TargetTime = (Get-Date).AddMinutes(-5)
$TargetTime3 = (Get-Date).AddMinutes(-125)

$Content = (Get-Content C:\Users\dl0pf\AppData\Roaming\Afreet\Products\SkimSrv\Spots.txt -tail 5000).where({
    [datetime]($_ -replace "(^\S+\s\S+).*",'$1') -ge $TargetTime
},'SkipUntil')

$Content | Out-File $outfile

#$Content2 = (Get-Content C:\Users\dl0pf\AppData\Roaming\Afreet\Products\SkimSrv2\Spots.txt).where({
#    [datetime]($_ -replace "(^\S+\s\S+).*",'$1') -ge $TargetTime
#},'SkipUntil')

#$Content2 | Out-File $outfile2

$Content3 = (Get-Content C:\CWSL_DIGI\console_log.txt -tail 10000).where({
    [datetime]($_ -replace "(^\S+\s\S+).*",'$1') -ge $TargetTime3
},'SkipUntil')
$Content3 | Out-File $outfile3

#ConvertTo-LinuxLineEndings $outfile
((Get-Content $outfile) -join "`n") + "`n" | Set-Content -NoNewline $outfile
#((Get-Content $outfile2) -join "`n") + "`n" | Set-Content -NoNewline $outfile2
((Get-Content $outfile3) -join "`n") + "`n" | Set-Content -NoNewline $outfile3

Invoke-Expression -Command "c:\Scripts\Copy_cwspots_2_HUP.cmd"

function ConvertTo-LinuxLineEndings($path) {
    $oldBytes = [io.file]::ReadAllBytes($path)
    if (!$oldBytes.Length) {
        return;
    }
    [byte[]]$newBytes = @()
    [byte[]]::Resize([ref]$newBytes, $oldBytes.Length)
    $newLength = 0
    for ($i = 0; $i -lt $oldBytes.Length - 1; $i++) {
        if (($oldBytes[$i] -eq [byte][char]"`r") -and ($oldBytes[$i + 1] -eq [byte][char]"`n")) {
            continue;
        }
        $newBytes[$newLength++] = $oldBytes[$i]
    }
    $newBytes[$newLength++] = $oldBytes[$oldBytes.Length - 1]
    [byte[]]::Resize([ref]$newBytes, $newLength)
    [io.file]::WriteAllBytes($path, $newBytes)
}
