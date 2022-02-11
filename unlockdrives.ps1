# Unlock drives locked with BitLocker with key stored on remote server.
# Tested on domain joined MS Windows Server 2019

# TERMS OF USE
# ------------------

# 2021, blaz@overssh.si
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the “Software”), to
# deal in the Software without restriction, including without limitation the 
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
# 
#  - The above copyright notice and this permission notice shall be included 
#    in all copies or substantial portions of the Software.
# 
#  - THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS
#    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#    DEALINGS IN THE SOFTWARE.

# Predispositions:
# Network link between the servers exists without use of additional client
# (on network level - vpn appliance, vpn router etc.)

# location of your key
$keyPlainText = Get-Content \\UNCPATH.SOMEDOMAIN.SI\_RemoteUnlockKeys\keyOfSomeServer.key
$keySecureString = ConvertTo-SecureString $keyPlainText -AsPlainText -Force

# drive letters to be unlocked (with same key)
$drivesToUnlock = @('E','F','G','I')

foreach ($drive in $drivesToUnlock)
{
    Unlock-BitLocker -MountPoint $drive':' -Password $keySecureString
}
