--==========Основные расчеты==========--

function Head()		--основные вычисления
	local ServerDate = getInfoParam("TRADEDATE")	--получение времени сервера
	local ServerTime = getInfoParam("SERVERTIME")	--получение даты сервера
	local SecCode = Emit	--код инструмента
	local Class = Class		--клас инструмента
	local Offer = getParamEx(Class, Emit, "OFFER").param_value	--цена спроса
	local Bid = getParamEx(Class, Emit, "BID").param_value		--цена предложения
	local Price = getParamEx(Class, Emit, "LAST").param_value
	local SecCode1 = Emit1
	local Class1 = Class
	local Offer1 = getParamEx(Class1, Emit1, "OFFER").param_value
	local Bid1 = getParamEx(Class1, Emit1, "BID").param_value
	local Price1 = getParamEx(Class, Emit1, "LAST").param_value 
--заполнение таблицы 
	SetCell(TableID, 1, 1, ServerDate)
	SetCell(TableID, 1, 2, ServerTime)
	SetCell(TableID, 1, 3, SecCode)
	SetCell(TableID, 1, 4, Offer)
	SetCell(TableID, 1, 5, Bid)
	SetCell(TableID, 1, 6, Price)
	SetCell(TableID, 1, 7, SecCode1)
	SetCell(TableID, 1, 8, Offer1)
	SetCell(TableID, 1, 9, Bid1)
	SetCell(TableID, 1, 10, Price1)

	sleep(10000)	
end

--Вывод таблицы на экран
function PutDataToTableInt()
	Clear(TableID)
	SetWindowPos(TableID, 100, 200, 550, 100)
	SetWindowCaption(TableID, "Export Data 10sec")
	InsertRow(TableID, -1)
end

--вывод данных в логфайл .txt
function WriteToEndofFile(sFile, sDataString)	--запись в логфайл указанную строку
		local ServerDate = getInfoParam("TRADEDATE")
		local ServerTime = getInfoParam("SERVERTIME")
		local SecCode = Emit
		local Class = Class
		local Offer = getParamEx(Class, Emit, "OFFER").param_value
		local Bid = getParamEx(Class, Emit, "BID").param_value
		local SecCode1 = Emit1
		local Price = getParamEx(Class, Emit, "LAST").param_value
		local SecCode1 = Emit1
		local Class1 = Class
		local Offer1 = getParamEx(Class1, Emit1, "OFFER").param_value
		local Bid1 = getParamEx(Class1, Emit1, "BID").param_value
		local Price1 = getParamEx(Class, Emit1, "LAST").param_value
		sDataString = ServerDate.." "..ServerTime..","..SecCode..","..Offer..","..Bid..","..Price..","..SecCode1..","..Offer1..","..Bid1..","..Price1.."\n"
		local f = io.open(sFile,"r+") --открытие файла (для чтения)
		if(f == nil) then 
			f = io.open(sFile,"w")	--открытие файла (для записи)
		end
		if (f ~= nil) then
		f:seek("end",0)			--"end -конец файла" "set -начало файла" "cur -текущая позиция" "0 -смещение
		f:write(sDataString)	-- запись данныхз в файл
		f:flush()	--сохранить файл
		f:close()	--закрытие файла
		end
end