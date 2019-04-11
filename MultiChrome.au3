Global $URL
$URL = 'facebook.com'
Run ('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe')
WinWait('New Tab - Google Chrome')
WinSetTitle('New Tab - Google Chrome',"Chrome Legacy Window",'Prvi')
WinMove('Prvi','',0,0)
Sleep(250)
Run ('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe')
WinWait('New Tab - Google Chrome')
WinSetTitle('New Tab - Google Chrome',"Chrome Legacy Window",'Drugi')
WinMove('Drugi','',960,0)
Sleep(250)
Run ('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe')
WinWait('New Tab - Google Chrome')
WinSetTitle('New Tab - Google Chrome',"Chrome Legacy Window",'Treci')
WinMove('Treci','',0,520)
Sleep(250)
Run ('C:\Program Files (x86)\Google\Chrome\Application\chrome.exe')
WinWait('New Tab - Google Chrome')
WinSetTitle('New Tab - Google Chrome',"Chrome Legacy Window",'Cetvrti')
WinMove('Cetvrti','',960,520)
Sleep(250)





MouseClick('primary',294,61,1,0)
Sleep(250)
Send('facebook.com')
Sleep(250)

MouseClick('primary',1150,58,1,0)
Sleep(250)
Send('facebook.com')
Sleep(250)

MouseClick('primary',360,960,1,0)
Sleep(250)
Send('facebook.com')
Sleep(250)

MouseClick('primary',1150,580,1,0)
Sleep(250)
Send('facebook.com')
Sleep(250)

