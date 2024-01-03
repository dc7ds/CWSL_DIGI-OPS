# CWSL_DIGI-OPS
operational insights, thoughts and advisories on CWSL_DIGI operation

CWSL_DIGI and cw skimmer server monitoring scripts

1. Log data acquisition
cwskimmer server generates logs that contain spot data. The logs are stored in

C:\Users\[YOUR-USERNAME]\AppData\Roaming\Afreet\Products\SkimSrv\Spots.txt

CWSL_DIGI can generate logs, but you'll have to activate logging in CWSL_DIGI'S config.ini:
![image](https://github.com/dc7ds/CWSL_DIGI-OPS/assets/35285029/3f50dc75-25f9-4f9a-a65a-f122daf51602)

Both logfiles are locked by the respective application and there is currently no rollover mechanism. Watch logfile size, because this can get really big and can fill up your diskspace.

2. Preparing log snippets for further analysis
Graphical monitoring tools like MRTG operate on a certain processing cycle. MRTG uses a 5 minute cycle. To prepare the logs, we need to sample the last 5 minutes of log activity. For this purpose, i created two scripts:

a) https://github.com/dc7ds/CWSL_DIGI-OPS/blob/main/Powershell-scripts/last_5_min_cwskimmer.ps1

This script reads the activity of the last 5 minutes from cwskimmer server spot log and writes it to a dedicated file

b) https://github.com/dc7ds/CWSL_DIGI-OPS/blob/main/Powershell-scripts/last_5_min_CWSL_DIGI_skimmer.ps1

This script reads the activity of the last 5 minutes from CWSL_DIGI console log and writes it to a dedicated file

Create Windows Task Scheduler Jobs to run these scripts every 5 minutes. You may have to adapt your PowerShell execution policy to be able to run these scripts. Also, you may want to run there scripts in the same context that your skimming tools are running.
Use this argument in the task schedule: PowerShell.exe -ExecutionPolicy Bypass -File C:\Scripts\last_5_min_skimmer.ps1

3. Transfering log snippets to monitoring machine

cwskimmer server and CWSL_DIGI are Windows-only tools. Most graphical monitoring tools work best on a Linux based environment, so we'll have to transfer the log snippets to a Linux machine for further processing.
Here is an example Windows Batch-script, that does the transfer via putty pscp:
"C:\Program Files\PuTTY\pscp" -P 22 -i "C:\Program Files\PuTTY\.ssh\[YOUR-PRIVATE-KEY].ppk" c:\Scripts\*.log [USERNAME]@[IP-OF-MONITORING-SERVER]:/tmp/
Beforehand, you'll need to create a ssh keypair and place the public key in the respective authorized_keys file on your Linux machine.

4. Preparing monitoring server
To run the monitoring script and to generate the graphs, you'll need the MRTG package and some additional scripts



#####TODO########
- data aquisition from console_log (PowerShell)
- graph generation (MRTG)
  - FT8 spots (including max. and avg. distance of spotted stations)
  - FT4 spots
  - WSPR spots
  - cw spots
  - CWSL_DIGI timeouts and CPU overloads
