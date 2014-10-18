; represent a floppy
INCBIN "bootsect.bin"
; include a file loader
; RESB 0x200  ; FAT1 0x200 here
DB 0xF0,0xFF,0xFF   ; reserve FAT Entry 0 1
DB 0xFF,0xF         ; file loader occupy a culster

TIMES 0x1400 - ($-$$) DB 0 ; FAT2 same to FAT1
DB 0xF0,0xFF,0xFF  
DB 0xFF,0xF       
                        ; name      offset  len     describe
TIMES 0x2600 - ($-$$) DB 0  ; root dir
DB "loader  "           ; DIR_Name  0       0x0b    name&extname 
DB "bin"                
DB 0x20                 ; DIR_Attr  0xB     1       Attribute
TIMES 10 DB 0           ; Resrrve   0xC`    10
DW 0x0000               ; DIR_WrtTime 0x16  2       last time to write
DW 0x0000               ; DIR_WrtDate 0x18  2   
DW 0x0002               ; DIR_FstClus 0x1A  2       Cluster number of the file
DD 0x00000200           ; DIR_FileSzie 0x1C 4   

TIMES (((224 * 32) + (512 - 1))/512 + 19) * 512 - ($-$$) \
DB 0 ; 0x4200 - ($ - $$)
INCBIN "loader.bin"

TIMES 80*18*2*512 - ($-$$) DB 0
; current section - current line
; 80 sector * 18 cylinder * 2 head * 512 byte
