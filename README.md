# BitlockerRemoteUnlockOverSMB
Branch office servers that are not sufficiently physically protected should have all stored data appropriately encrypted. But we all know the struggle when the servers restart due to power failure, reboot after updates etc. Manual unlock is not a solution for most of us (angry users etc.)

Provided Powershell script unlocks the drives if the branch office server can connect to the SMB share of the server in the headquarters where the key is stored. At this point we assume that this connectivity does not exist if the server gets stolen.

1. Place the contents of the script to C:\\_BIN\unlockdrives.ps1 and modify it according to your needs / system.
2. Create new task in Task Scheduler. Select SYSTEM as user!
 ![BO_Task](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_16_27.png?raw=true)
3. Set trigger to "On startup" and delay it for some time (your server won't be connected to the network the same moment the server boots)
 ![BO_Trigger](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_17_25.png?raw=true)
4. Add action (Run Powershell.exe with parameter -ExecutionPolicy Bypass C:\_BIN\unlockdrives.ps1)
 ![BO_Parameters](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_17_54.png?raw=true)

5. Action should look like this:

 ![BO_ParametersAll](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_18_11.png?raw=true)

On the server in the headquarters create network share and add read permissions to your computer (system account).

![HQ_Share](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_19_26.png?raw=true)

Don't forget to remove read permissions for all users. Disable file caching, so there will be no option, that the key gets saved on the remote server.

![HQ_Cache](https://raw.githubusercontent.com/pblaz1988/BitlockerRemoteUnlockOverSMB/main/img/2022-02-11%2022_19_56.png?raw=true)

This will work only for domain joined devices.
