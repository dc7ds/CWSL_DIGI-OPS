# CWSL_DIGI-OPS
operational insights, thoughts and advisories on CWSL_DIGI operation

personal CWSL_DIGI feature wishlist:

- JS8Call / JS8 support covering all submodes as in OpenWebRX and SparkSDR
- FST4 / FST4W support as in OpenWebRX and SparkSDR
- configurable antenna info - this info is sent to PSKreporter (IPfix protocol)
- configurable log rotation for console_log (i use this as a basis for several monitoring scripts, thos logs get really big and are atm locked by CWSL_DIGI)
- watchdog component, that supervises CWSL_DIGIs working state and is able to restart CWSL_DIGI and or cw skimmer server
- configurable raw IQ or demodulated wav output streams to support custom decoding or audio recordings based on existing IQ-stream
- configurable delay (secs) on decode start-times per decoder slot (hypervsor node hosting CWSL_DIGI nodes gets heavy load every 15 secs, it would be great to stretch this out a bit on time scale)
