#include <MsgBoxConstants.au3>

Global $aDays, $i, $dohvatiSlotPort


WinActivate('Link - Wikipedia - Google Chrome')
Sleep(1500)
MouseClickDrag('primary',1427,324,1461,339,10)
Sleep(1500)
Send('{CTRLDOWN}')
Send('{c}')
Send('{CTRLUP}')
$dohvatiSlotPort = ClipGet()
Call('Example')


Func Example()
    Global $razdvoji = StringSplit($dohvatiSlotPort, "'")


        MsgBox($MB_SYSTEMMODAL, "Slot", $razdvoji[2],2)
		MsgBox($MB_SYSTEMMODAL, "Port", $razdvoji[3],2)

EndFunc