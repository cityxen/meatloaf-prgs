
!check_next_key:
    cmp #$31 // 1 hit
    bne !check_next_key+
    SetFileName(filename1)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$32 // 2 hit
    bne !check_next_key+
    SetFileName(filename2)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$33 // 3 hit
    bne !check_next_key+
    SetFileName(filename3)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$34 // 4 hit
    bne !check_next_key+
    SetFileName(filename_lan1)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$35 // 5 hit
    bne !check_next_key+
    SetFileName(filename_lan2)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$36 // 6 hit
    bne !check_next_key+
    SetFileName(filename_lan3)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$37 // 7 hit
    bne !check_next_key+
    SetFileName(filename_disk1)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$38 // 8 hit
    bne !check_next_key+
    SetFileName(filename_disk2)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop

!check_next_key:
    cmp #$39 // 9 hit
    bne !check_next_key+
    SetFileName(filename_disk3)
    jsr load_data
    ClearScreen(BLACK)
    jmp mainloop    
