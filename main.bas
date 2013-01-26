DECLARE SUB painthelp ()


' PAINT PROGRAM
' Alexander Meng
' 8/29/04


' x ........ pixel position on x axis
' y ........ pixel position on y axis
' c ........ pixel color
' bg ....... background color
' size ..... brush size
' press$ ... INKEY$
' help$ .... INKEY$
' leave$ ... INKEY$
' nogo ..... GOTO location
' noquit ... GOTO location
' n ........ GOTO location


SCREEN 13
CLS

x = 40
y = 40
c = 15
bg = 0
size = 1
COLOR 15
n: CLS
LINE (1, 1)-(319, 189), 15, B
LINE (1, 170)-(319, 20), 15, B

'background
LOCATE 2, 3:  COLOR 15: PRINT "Select your background color:"
LOCATE 23, 3: COLOR 15: PRINT "Arrow keys:select      P:PROCEED"

bgdone = 0
DO WHILE bgdone = 0
   bgkey$ = INKEY$
   IF bg < 0 THEN bg = 15
   IF bg > 15 THEN bg = 0
   IF bgkey$ = CHR$(0) + "M" THEN bg = bg + 1
   IF bgkey$ = CHR$(0) + "K" THEN bg = bg - 1
   LINE (3, 22)-(317, 168), bg, BF
   IF bgkey$ = "p" OR bgkey$ = "P" THEN bgdone = 1
LOOP

noquit:

LOCATE 2, 2:  PRINT "                                     "
LOCATE 23, 2: PRINT "                                     "

DO WHILE press$ <> "q"

LOCATE 2, 5:  COLOR 15:    PRINT "Color:"
IF c > 1 THEN
LOCATE 2, 12: COLOR c - 1: PRINT "<"
ELSE
LOCATE 2, 12: COLOR 15:    PRINT "<"
END IF
LOCATE 2, 14: COLOR c:     PRINT "ÛÛÛÛ"
IF c < 15 THEN
LOCATE 2, 19: COLOR c + 1: PRINT ">"
ELSE
LOCATE 2, 19: COLOR 1:     PRINT ">"
END IF
LOCATE 2, 25: COLOR 15:    PRINT "Brush Size:"
LOCATE 2, 36:              PRINT USING "##"; size

LOCATE 23, 5: COLOR 15: PRINT "N:NEW"
LOCATE 23, 17:          PRINT "Q:QUIT"
LOCATE 23, 30:          PRINT "H:HELP"

press$ = INKEY$

SELECT CASE size
  CASE 1
    PSET (x, y), c
  CASE ELSE
    LINE (x, y)-(x + size, y + size), c, BF
END SELECT

IF press$ = CHR$(0) + "H" THEN y = y - 1
IF press$ = CHR$(0) + "P" THEN y = y + 1
IF press$ = CHR$(0) + "M" THEN x = x + 1
IF press$ = CHR$(0) + "K" THEN x = x - 1


IF press$ = "1" OR press$ = "!" THEN c = c - 1
IF press$ = "2" OR press$ = "@" THEN c = c + 1

IF press$ = "a" OR press$ = "A" THEN size = size - 1
IF press$ = "s" OR press$ = "S" THEN size = size + 1

IF c < 1 THEN c = 15
IF c > 15 THEN c = 1

IF size < 1 THEN size = 10
IF size > 10 THEN size = 1

IF press$ = "n" OR press$ = "N" THEN
  LOCATE 23, 2: PRINT "Image will be erased. Continue? (Y/N)"
  DO
    done = 0
    help$ = INKEY$
    IF help$ = "y" OR help$ = "Y" THEN
      done = 1
      GOTO n
    END IF
    IF help$ = "n" OR help$ = "N" THEN
      done = 1
    END IF
  LOOP UNTIL done = 1
  LOCATE 23, 2: PRINT "                                     "
  END IF
IF press$ = "h" OR press$ = "H" THEN
  LOCATE 23, 2: PRINT "Image will be erased. Continue? (Y/N)"
  DO
    done = 0
    help$ = INKEY$
    IF help$ = "y" OR help$ = "Y" THEN
      done = 1
      CALL painthelp
    END IF
    IF help$ = "n" OR help$ = "N" THEN
      done = 1
      LOCATE 23, 2: PRINT "                                     "
      GOTO nogo
    END IF
  LOOP UNTIL done = 1

  GOTO n
END IF

nogo:
IF x < 3 THEN x = 3
IF y < 22 THEN y = 22
IF x > 317 - size THEN x = 317 - size
IF y > 168 - size THEN y = 168 - size

LOOP

LOCATE 23, 2: PRINT "Are you sure you want to quit? (Y/N) "

DO
  done = 0
  leave$ = INKEY$
  IF leave$ = "y" OR leave$ = "Y" THEN
    END
  END IF
  IF leave$ = "n" OR leave$ = "N" THEN
    done = 1
    LOCATE 23, 2: PRINT "                                     "
    press$ = "wrong"
  END IF
LOOP UNTIL done = 1
GOTO noquit
END

SUB painthelp

CLS
LINE (1, 1)-(320, 200), 15, BF

COLOR 15
LOCATE 3, 3:   PRINT "                                  "
LOCATE 4, 3:   PRINT " Painting:       "
LOCATE 4, 20:  PRINT " arrow keys      "
LOCATE 5, 3:   PRINT "                                  "
LOCATE 6, 3:   PRINT " Next Color:     "
LOCATE 6, 20:  PRINT " [2] / [@]       "
LOCATE 7, 3:   PRINT " Previous Color: "
LOCATE 7, 20:  PRINT " [1] / [!]       "
LOCATE 8, 3:   PRINT "                                  "
LOCATE 9, 3:   PRINT " Next Brush:     "
LOCATE 9, 20:  PRINT " [s] / [S]       "
LOCATE 10, 3:  PRINT " Previous Brush: "
LOCATE 10, 20: PRINT " [a] / [A]       "
LOCATE 11, 3:  PRINT "                                  "

LOCATE 21, 3: PRINT "                     "
LOCATE 22, 3: PRINT " Press [n] to return "
LOCATE 23, 3: PRINT "                     "

DO UNTIL exit$ = "n" OR exit$ = "N"
  exit$ = INKEY$
LOOP

END SUB
