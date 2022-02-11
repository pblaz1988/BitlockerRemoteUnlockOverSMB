# BitlockerRemoteUnlockOverSMB
Branch office servers that are not sufficiently physically protected should have all stored data appropriately encrypted. But we all know the struggle when the servers restart due to power failure, reboot after updates etc. Manual unlock is not a solution for most of us (angry users etc.)

Provided Powershell script unlocks the drives if the branch office server can connect to the SMB share of the server in the headquarters where the key is stored. At this point we assume that this connectivity does not exist if the server gets stolen.

1. Place the contents of the script to C:\_BIN\unlockdrives.ps1 and modify it according to your needs / system.
2. Create new task in Task Scheduler.
3. Set trigger to "On startup" and delay it for some time (your server won't be connected to the network the same moment the server boots)
4. Add action (Run Powershell.exe with parameter -ExecutionPolicy Bypass C:\_BIN\unlockdrives.ps1)
5. As user select SYSTEM.

On server in the headquarters create network share and add your read permissions to your computer. Don't forget to remove read permissions for all users. Disable file caching, so there will be no option, that the key gets saved on the remote server.

This will work only for domain joined devices.
