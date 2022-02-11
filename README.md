# BitlockerRemoteUnlockOverSMB
Branch office servers that are not sufficiently protected should have all stored data appropriately protected. But we all know the struggle when the servers restart due to power failure, reboot after updates etc.

Provided Powershell script unlocks the drives if the branch office server can connect to the SMB share of the server in the headquarters where the key is stored. At this point we assume that this connectivity does not exist if the server gets stolen.
