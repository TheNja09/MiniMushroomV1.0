function _OnFrame()
	World = ReadByte(Now + 0x00)
	Room = ReadByte(Now + 0x01)
	Place = ReadShort(Now + 0x00)
	Door = ReadShort(Now + 0x02)
	Map = ReadShort(Now + 0x04)
	Btl = ReadShort(Now + 0x06)
	Evt = ReadShort(Now + 0x08)
	Cheats()
end

function _OnInit()
	if GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301 and ENGINE_TYPE == "ENGINE" then--PCSX2
		Platform = 'PS2'
		Now = 0x032BAE0 --Current Location
		Save = 0x032BB30 --Save File
		Obj0 = 0x1C94100 --00objentry.bin
		Sys3 = 0x1CCB300 --03system.bin
		Btl0 = 0x1CE5D80 --00battle.bin
		Slot1 = 0x1C6C750 --Unit Slot 1
	elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then--PC
		Platform = 'PC'
		Now = 0x0714DB8 - 0x56454E
		Save = 0x09A7070 - 0x56450E
		Obj0 = 0x2A22B90 - 0x56450E
		Sys3 = 0x2A59DB0 - 0x56450E
		Btl0 = 0x2A74840 - 0x56450E
		Slot1 = 0x2A20C58 - 0x56450E
	end
end

function Events(M,B,E) --Check for Map, Btl, and Evt
	return ((Map == M or not M) and (Btl == B or not B) and (Evt == E or not E))
end

function Cheats()
   WriteFloat(Sys3+0x17CE4, 20) -- Sora movement speed
   WriteFloat(Sys3+0x17D18, 30) -- Valor Form
   WriteFloat(Sys3+0x17D4C, 30) -- Wisdom Form
   WriteFloat(Sys3+0x17D80, 25) -- Master Form
   WriteFloat(Sys3+0x17DB4, 40) -- Final Form
   WriteFloat(Sys3+0x17E1C, 45) -- Lion Sora
   WriteFloat(Sys3+0x17DE8, 40) -- Anti Form
   WriteFloat(Sys3+0x17E50, 18) -- Mermaid Sora
   WriteFloat(Sys3+0x18190, 50) -- Carpet Sora
   WriteFloat(Sys3+0x181F8, 20) -- Dice Sora
   WriteFloat(Sys3+0x1822C, 20) -- Card Sora
   WriteFloat(Sys3+0x18364, 20) -- Limit Form
   WriteFloat(0x3BE5A-0x56454E, 1.5)
   local animpointer=ReadLong(0x1B2512)+0x2A8
   WriteFloat(animpointer, 1, true)
   local soraJumpStrengthPointer=ReadLong(0x1B2512)+0x130
   WriteFloat(soraJumpStrengthPointer, 600, true)
   local soraScalePointer=ReadLong(0x55629A)+0x3C
   WriteFloat(soraScalePointer, 0.3, true)
   local soraGravityPointer=ReadLong(0x1B2512)+0x138
   WriteFloat(soraGravityPointer, 5, true)
end
