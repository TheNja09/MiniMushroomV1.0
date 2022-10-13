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
	WriteByte(Sys3+0x9E0,0x00) -- Fire Cost: 15
	WriteByte(Sys3+0x15E0,0x00) -- Fira Cost: 15
	WriteByte(Sys3+0x1610,0x00) -- Firaga Cost: 15
	-- BLIZZARD ELEMENT
	WriteByte(Sys3+0xA40,0x00) -- Blizzard Cost: 15
	WriteByte(Sys3+0x1640,0x00) -- Blizzara Cost: 15
	WriteByte(Sys3+0x1670,0x00) -- Blizzaga Cost: 15
	-- THUNDER ELEMENT
	WriteByte(Sys3+0xA10,0x00) -- Thunder Cost: 15
	WriteByte(Sys3+0x16A0,0x00) -- Thundara Cost: 15
	WriteByte(Sys3+0x16D0,0x00) -- Thundaga Cost: 15
	-- CURE ELEMENT
	WriteByte(Sys3+0xA70,0x00) -- Cure Cost: 3
	WriteByte(Sys3+0x1700,0x00) -- Cura Cost: 2
	WriteByte(Sys3+0x1730,0x00) -- Curaga Cost: 2
	-- MAGNET ELEMENT
	WriteByte(Sys3+0x1F40,0x00) -- Magnet Cost: 15
	WriteByte(Sys3+0x1F70,0x00) -- Magnera Cost: 15
	WriteByte(Sys3+0x1FA0,0x00) -- Magnega Cost: 15
	-- REFLECT ELEMENT
	WriteByte(Sys3+0x1FD0,0x00) -- Reflect Cost: 3
	WriteByte(Sys3+0x2000,0x00) -- Reflera Cost: 2
	WriteByte(Sys3+0x2030,0x00) -- Reflega Cost: 1
   WriteFloat(Sys3+0x17CE4, 24) -- Sora movement speed
   local animpointer=ReadLong(0x1B2512)+0x2A8
   WriteFloat(animpointer, 1, true)
   local soraJumpStrengthPointer=ReadLong(0x1B2512)+0x130
   WriteFloat(soraJumpStrengthPointer, 600, true)
   local soraScalePointer=ReadLong(0x55629A)+0x3C
   WriteFloat(soraScalePointer, 0.3, true)
   local soraGravityPointer=ReadLong(0x1B2512)+0x138
   WriteFloat(soraGravityPointer, 5, true)
end