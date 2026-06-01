#SingleInstance Force

; Raccourcis
if (A_Args.Length > 0) {
    if (A_Args[1] = "/nuit")
        Send("^!n") ; Nuit [cite: 2]
    if (A_Args[1] = "/jour")
        Send("^!j") ; Jour
    ExitApp()
}

; --- CONFIG ---
CMM := "C:\Users\Justin\Downloads\controlmymonitor\ControlMyMonitor.exe"
Ecran := "Primary"
Ecrandeux := "Secondary"
Ecrantrois := "Tertiary"

; --- SÉCURITÉ STARTUP ---
ActiverJour()

; --- SÉCURITÉ SHUTDOWN ---
OnMessage(0x0011, WM_QUERYENDSESSION)
WM_QUERYENDSESSION(wParam, lParam, *) {
    ActiverJour()
    return true ;
}

; --- RACCOURCIS ---
^!n:: ActiverNuit()
^!j:: ActiverJour()

; --- FONCTIONS ---
ActiverNuit() {
    RunWait(CMM . ' /SetValue "' . Ecran . '" 10 0', , "Hide")   ; Lum au min
    RunWait(CMM . ' /SetValue "' . Ecran . '" 12 10', , "Hide")  ; Contraste bas
    RunWait(CMM . ' /SetValue "' . Ecran . '" 16 20', , "Hide")  ; Rouge bas
    RunWait(CMM . ' /SetValue "' . Ecran . '" 18 20', , "Hide")  ; Vert bas
    RunWait(CMM . ' /SetValue "' . Ecran . '" 1A 20', , "Hide")  ; Bleu bas

    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 10 0', , "Hide")   ; Lum au min
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 12 10', , "Hide")  ; Contraste bas
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 16 20', , "Hide")  ; Rouge bas
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 18 20', , "Hide")  ; Vert bas
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 1A 20', , "Hide")  ; Bleu bas

    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 10 0', , "Hide")   ; Lum au min
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 12 10', , "Hide")  ; Contraste bas
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 16 20', , "Hide")  ; Rouge bas
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 18 20', , "Hide")  ; Vert bas
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 1A 20', , "Hide")  ; Bleu bas
}

ActiverJour() {
    RunWait(CMM . ' /SetValue "' . Ecran . '" 10 0', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecran . '" 12 50', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecran . '" 16 50', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecran . '" 18 50', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecran . '" 1A 50', , "Hide") ; 

    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 10 30', , "Hide") ;
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 12 60', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 16 50', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 18 50', , "Hide") ; 
    RunWait(CMM . ' /SetValue "' . Ecrandeux . '" 1A 50', , "Hide") ; 

    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 10 XX', , "Hide") ; Ta valeur 10
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 12 XX', , "Hide") ; Ta valeur 12
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 16 XX', , "Hide") ; Ta valeur 16
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 18 XX', , "Hide") ; Ta valeur 18
    RunWait(CMM . ' /SetValue "' . Ecrantrois . '" 1A XX', , "Hide") ; Ta valeur 1A
}