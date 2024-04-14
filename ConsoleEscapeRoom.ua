# Experimental!
Lib ← &ffi ⊂□"User32.dll"
GetKeyState ← Lib {"short" "GetAsyncKeyState" "int "}

# Virtual-Key Codes WASD and ARROW keys
UP ← 87_38
LEFT ← 65_37
DOWN ← 83_40
RIGHT ← 68_39

GameSize ← 30
Game ← ↯[.GameSize 3] 0
StartPosPlayer ← [. ÷2 GameSize]
DoorPos ← 2_3
KeyPos ← 4_17

RED ← 1_0_0
BLUE ← 0_0_1
WHITE ← 1_1_1
DrawDot ← |3 ⍜(⊙⊡)(+)
DrawDoor ← DrawDot RED
DrawKey ← DrawDot BLUE
DrawPlayer ← DrawDot WHITE

PlayerDirections ← [¯1_0 0_¯1 1_0 0_1 0_0]

ForAllKeys! ← ♭ ≡(/+) ∵^! [UP LEFT DOWN RIGHT]

HandleUserInput! ← |1 ⍜(⊡ 0)(+/+▽:PlayerDirections ¬ ⌕ 0 (⊂^! 1))
DrawItems ← ⍜(⊡ 2) (⊙DrawKey.) ⍜(⊡ 1) (⊙DrawDoor.) ⍜(⊡ 0) (⊙DrawPlayer.)

# Init Game State
[StartPosPlayer DoorPos KeyPos]

# Game Loop
⍢(&sl 0.5 &ims: DrawItems HandleUserInput!ForAllKeys!GetKeyState : Game) 1
