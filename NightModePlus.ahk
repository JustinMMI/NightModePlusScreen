#SingleInstance Force
; Voile

; Raccourcis
if (A_Args.Length > 0) {
    if (A_Args[1] = "/nuit")
        Send("^!b") ; Nuit [cite: 2]
    if (A_Args[1] = "/jour")
        Send("^!h") ; Jour
    ExitApp()
}

; Voile
Voile := Gui("-Caption +AlwaysOnTop +LastFound +E0x20 +E0x80000")
Voile.BackColor := "000000"
Handle := Voile.Hwnd

Voile.Hide()

^!b:: { 
    ; 
    TotalW := SysGet(78)
    TotalH := SysGet(79)
    Left := SysGet(76) ; Coordonnée la plus à gauche (si écran 2 à gauche du 1)
    Top := SysGet(77)  ; Coordonnée la plus haute
    
    Voile.Show("x" . Left . " y" . Top . " w" . TotalW . " h" . TotalH . " NoActivate")
    WinSetTransparent(130, "ahk_id " . Handle)
}

^!h:: {
    Voile.Hide()
}

; --- SÉCURITÉ SHUTDOWN ---
OnMessage(0x0011, WM_QUERYENDSESSION)
WM_QUERYENDSESSION(wParam, lParam, *) {
    Voile.Hide()
    return true
}