@Set title=Testing...
@(@Title %title%)
@echo Finding Gateway Internal IP

::# Define a temp variable 'DefaultGateway'
@For /f "tokens=3" %%* in (
   'route.exe print ^|findstr "\<0.0.0.0\>"'
   ) Do @Set "DefaultGateway=%%*"
@echo Ping to Gateway ( "%DefaultGateway%") (No reply means no connection with the gateway)
@ping %DefaultGateway% -n 1 | FIND "TTL="
@echo Ping to Google (No reply means no connection with Google)
@ping google.es -n 1 | FIND "TTL="
@echo Done
@Pause
