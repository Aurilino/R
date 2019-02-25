-------------Экспорт цен из таблицы------------------------
-------------Версия 1.0

---Тело программы---
dofile(getScriptPath().."\\dll_export_head.lua")	--подключение файла, где описаны основные функции
is_run = true									--переменная для повторения цикла
Emit = "SBER"
Emit1 = "SBERP"
Class = "TQBR"
Filelog = getScriptPath().."\\export_head_log.txt"

--------------------Параметры для настройки--------------------
function OnInit ()
	TableID = AllocTable() -- создание рабочей таблицы
	AddColumn(TableID, 1, "Date", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 2, "Time", true, QTABLE_STRING_TYPE, 10)	
	AddColumn(TableID, 3, "Security", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 4, "Offer", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 5, "Bid", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 6, "Price", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 7, "Security", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 8, "Offer", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 9, "Bid", true, QTABLE_STRING_TYPE, 10)
	AddColumn(TableID, 10, "Price", true, QTABLE_STRING_TYPE, 10)
	CreateWindow(TableID)  -- выведем таблицу в QUIK
	PutDataToTableInt()
end

function main()
	while is_run == true do		
		Head() -- загрузка процесса из вспомогательного файла "dll_export.lua"
		WriteToEndofFile(Filelog)
	end
end

function OnTrade(TradeX)
	--действия при появлении новой сделк 
end

function OnOrder(OrderX)
	--действи при появлении заявки
end

function OnStopOrder()
	--действия при появлении стоп заявки
end

function OnStop()
	--Действия при нажатии кнопки "Остановить"
	is_run = false
	DestroyTable(TableID)	--таюлица исчезает после остановки
	WriteToEndofFile(Filelog, "Programm stoped")
end