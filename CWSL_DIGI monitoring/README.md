# CWSL_DIGI-OPS
operational insights, thoughts and advisories on CWSL_DIGI operation

CWSL_DIGI and cw skimmer server monitoring scripts

1. Log data acquisition
cwskimmer server generates logs that contain spot data. The logs are stored in

C:\Users\[YOUR-USERNAME]\AppData\Roaming\Afreet\Products\SkimSrv\Spots.txt

CWSL_DIGI can generate logs, but you'll have to activate logging in CWSL_DIGI'S config.ini:
![image](https://github.com/dc7ds/CWSL_DIGI-OPS/assets/35285029/3f50dc75-25f9-4f9a-a65a-f122daf51602)

Both logfiles are locked by the respective application and there is currently no rollover mechanism. Watch logfile size, because this can get really big and can fill up your diskspace.








- data aquisition from console_log (PowerShell)
- graph generation (MRTG)
  - FT8 spots (including max. and avg. distance of spotted stations)
  - FT4 spots
  - WSPR spots
  - cw spots
  - CWSL_DIGI timeouts and CPU overloads
