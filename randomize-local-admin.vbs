' A simple script used to randomize the local Administrator account password
' and disable/enable the account
'
' Written by Jeff McJunkin (@jeffmcjunkin, jeffmcjunkin.com)
' May be reused without permission, as long as the original source is attributed
' 
' Explanatory blog post at: http://jeffmcjunkin.com/2011/10/03/randomizing-the-local-administrator-account-password/

Set WshNetwork = WScript.CreateObject("WScript.Network")
strComputer = WshNetwork.ComputerName

strComputer = "."
Set objUser = GetObject("WinNT://" & strComputer & "/Administrator,user")

intHighNumber = 255
intLowNumber = 1

password=""

For i= 1 to 120
	Randomize
	intNumber = Int((intHighNumber - intLowNumber + 1) * Rnd + intLowNumber)
	password = password & Chr(intNumber)
Next

objUser.SetPassword password

' If you use something like Kon-Boot instead of NT Password Reset,
' it can be useful to leave the account enabled. In that case,
' set the following line to False

objUser.AccountDisabled = True
objUser.SetInfo
