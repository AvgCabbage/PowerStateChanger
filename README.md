# PowerStateChanger
Powershell script to modify max processor power state for Windows Power profiles

Some reference info https://technet.microsoft.com/en-us/library/Dd744398(v=WS.10).aspx

This script is basically let's you toggle between two Maximum Processor Power State values, which affects CPU frequency.  In this case, it toggles between 10% and 100%.

![alt tag](http://i.imgur.com/7jA1hfF.png)

Although this may help save power/reduce energy use, I don't know how well or if it is even worth doing. This was written mostly just to play around with PowerShell and something I thought of when changing the Windows power profile manually.
