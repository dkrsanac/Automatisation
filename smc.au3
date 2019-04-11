#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

;VARIJABLE
Global $wwmsActive, $glavniActive

$wwmsActive = WinExists ('Eventus login')
$glavniActive = WinExists('Glavni izbornik - okruženje - Produkcija')
$vlastitiActive = WinExists('Vlastiti zadaci')
$remoteDesktop = WinExists('Remote Desktop Connection')

;******PROVJERA AKO JE WWMS OTVOREN****** ;
If $wwmsActive Or $glavniActive Or $vlastitiActive = 1  Then
       WinActivate('Eventus login')
	   WinActivate('Glavni izbornik - okruženje - Produkcija')
	   WinActivate('Vlastiti zadaci')

Else
	    SplashTextOn ( "Obavijest:", "WWMS nije otvoren. Pokrecem Eventus Login....")
		Sleep(500)
		SplashOff()
		Call ('WWMSLogin')
		WinWait('Eventus login')
	    ControlSetText('Eventus login', '', 'Edit1', 'dkrsanac')
	    Sleep(150)
        ControlSetText('Eventus login', '', 'Edit2', 'Korisnik4$')
	    Sleep(150)
        ControlClick ('Eventus login','','Button1')
		WinWait('Glavni izbornik - okruženje - Produkcija')
	    Sleep(500)
        MouseClick ('primary', 193,260,2,1)
        WinWait('Vlastiti zadaci')
        Sleep(7000)
 EndIf

Func WWMSLogin()

MouseClick ('primary', 41,39,2,1)

EndFunc


;PROVJERA AKO JE NADZOR OTVOREN
Func CheckRemoteDesktopConnection()
   If $remoteDesktop = 0 Then
    Run ('C:\WINDOWS\system32\mstsc.exe')
	WinWait('Remote Desktop Connection')
	Send('{ENTER}')
    Sleep(250)

ElseIf $remoteDesktop = 1 Then
    WinActivate('sdslam.ad.local - Remote Desktop Connection')
	  Sleep(250)

EndIf
EndFunc
;DOHVAT DSLAMA
Func DohvatiDSLAM()
MouseClick('secondary',70,374,1,1)
Sleep(1500)
MouseClick('secondary',95,500,1,1)
Sleep(1500)
MouseClick('secondary',390,580,1,1)
Sleep(1500)
EndFunc
;USPOREDBA DSLAMA
Func UsporediDSLAM()
    Global $DSLAM1 = StringRegExp(ClipGet(),'_EM',0)
    Global $DSLAM2 = StringRegExp(ClipGet(),'_ES',0)
	Global $DSLAM3 = StringRegExp(ClipGet(),'_EA',0)
EndFunc

;********* LOGIN + OTVARANJE VLASTITIH ZADATAKA*************
Call ('DohvatProcesa')   ; <- bez ovoga program staje
Func DohvatProcesa()

;DOHVAT IZ CLIPBOARDA IME PROCESA
MouseClick('secondary',70,374,1,1)
Sleep(250)
MouseClick('secondary',95,500,1,1)
Sleep(250)
MouseClick('secondary',266,560,1,1)
Sleep(250)
;DOHVAT GOTOV ZA IME PROCESA
Call('UsporedbaProcesa')
EndFunc

Func DohvatRajona()

;DOHVAT IZ CLIPBOARDA IME PROCESA
MouseClick('secondary',70,374,1,1)
Sleep(250)
MouseClick('secondary',95,500,1,1)
Sleep(250)
MouseClick('secondary',266,516,1,1)
Sleep(250)
;DOHVAT GOTOV ZA IME RAJONA
EndFunc

;USPOREDI IMENA PROCESA
Func UsporedbaProcesa()

Global $ponovnoUkljucenje = StringRegExp(ClipGet(),'ponovno',0)
Global $privremenoIskljucenje = StringRegExp(ClipGet(),'iskljuèenje',0)
Global $promjenaUsluge =StringRegExp(ClipGet(),'promjena',0)

; TREBA NAPRAVIT PODUVJETE ZA PROMJENU USLUGE
EndFunc

Func UsporedbaRajona()
Global $rajon = ClipGet()
 MsgBox(0,'Naslov','Rajon je' & $rajon)
Global $rajonCount = StringLeft($rajon,2)
   MsgBox(0,'Naslov','Rajon je' & $rajonCount)
EndFunc


Global $ponovnoUkljucenje,$privremenoIskljucenje,$promjenaUsluge

if $ponovnoUkljucenje=1 Then ; Ponovno ukljuèenje
    MsgBox(4096, "Ime: ",'Ovo je ponovno ukljuèenje. ',4)
	Call ('CheckRemoteDesktopConnection')
    Call ('DohvatiDSLAM')
    Call ('UsporediDSLAM')

	  ;ODLUKA = ERRICSSON -> func DohvatiDSLAM i UsporediDSLAM
	  if $DSLAM1=1 Or $DSLAM2=1 or $DSLAM3=1 Then
		 MouseClick('primary',3238,20,2,5)
		 Sleep(5000)
		 MouseClick('primary',3788,624,1,1)
		 Sleep(50)
		 Send('dkrsanac',1)
		 MouseClick('primary',3793,657,1,1)
		 Sleep(50)
		 Send('Korisnik4$',1)
		 Sleep(50)
		 MouseClick('primary',3902,752,1,1)
		 Sleep(32000)
		 ;POKRETANJE USPOREDBE RAJONA
		 Call('DohvatRajona')
		 Call('UsporedbaRajona')

		 ; IF PETLJA ZA ODABIR REGIJE U ERICSSONU

			if $rajonCount = 94 Then  ; SJEVER
			   MouseClick('primary',3384,264,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 95 Then ; ISTOK
			   MouseClick('primary',3378,223,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 96 Then ; ISTOK
			   MouseClick('primary',3378,223,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 83 Then ; ZAPAD
			   MouseClick('primary',3382,305,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 84 Then ; ZAPAD
			   MouseClick('primary',3382,305,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 85 Then ; ZAPAD
			   MouseClick('primary',3382,305,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 71 Then ; JUG
			   MouseClick('primary',3379,242,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 72 Then ; JUG
			   MouseClick('primary',3379,242,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 73 Then ; JUG
			   MouseClick('primary',3379,242,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 61 Then ; ZAGREB
			   MouseClick('primary',3383,283,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 62 Then ; ZAGREB
			   MouseClick('primary',3383,283,1,1)
			   Sleep(50)
			ElseIf $rajonCount = 63 Then ; ZAGREB
			   MouseClick('primary',3383,283,1,1)
			   Sleep(50)




			EndIf

			;Pokretanje searcha nakon odabira regije.
		 MouseClick('primary',3847,93,1,1) ; SERVICE
		 Sleep(150)
		 MouseClick('primary',3843,117,1,1) ; PLUGIN
		 Sleep(150)
		 MouseClick('primary',3898,116,1,1) ; EM-PEM
		 Sleep(150)
		 MouseClick('primary',3975,138,1,1) ; Service
		 Sleep(20000)

		 ; END -> ODLUKA = ERRICSSON -> func DohvatiDSLAM i UsporediDSLAM
	  Else

	  EndIf

   ;NA KRAJU SVAKE TREBA DOÆ OBNAVLJANJE VLASTITIH

ElseIf $privremenoIskljucenje=1 Then ; Privremeno iskljuèenje
   MsgBox(4096, "Ime: ",'Ovo je privremeno iskljuèenje ',4)
   Call ('CheckRemoteDesktopConnection')
   Call ('DohvatiDSLAM')

    ;NA KRAJU SVAKE TREBA DOÆ OBNAVLJANJE VLASTITIH

ElseIf $promjenaUsluge=1 Then ; Promjena usluge



   ; TREBA NAPRAVIT PODUVJETE ZA PROMJENU USLUGE
EndIf



