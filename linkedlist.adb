with Ada.Text_IO, Ada.Integer_Text_IO; use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure LinkedList is
	Input_Data : constant STRING := "БУКВОПЕЧАТАЮЩЕЙ СВЯЗИ НУЖНЫ ХОРОШИЕ Э/МАГНИТНЫЕ РЕЛЕ. ДАТЬ ЦИФРЫ (1234567890+-,:?-)";

	type LIST_ELEM;
	type LIST_ELEM_REF is access LIST_ELEM;
	type LIST_ELEM is
		record
			Value : CHARACTER;
			Next  : LIST_ELEM_REF;
		end record;

	First_Element : LIST_ELEM_REF;
	Last_Element  : LIST_ELEM_REF;

	---------------------------------------------------------------
	--  Процедура для просмотра содержимого списка.              --
	---------------------------------------------------------------
	procedure Traverse_List(Starting_Point : IN LIST_ELEM_REF) is
		Element : LIST_ELEM_REF;
	begin
		Put("ПЕЧАТЬ СПИСКА. =>");
		Element := Starting_Point;

		if Element = null then
			Put("НЕТ ДАННЫХ.");
		else
			loop
				Put(Element.Value);
				Element := Element.Next;
				if Element = null then 
					exit; 
				end if;
			end loop;
		end if;

		New_Line;
	end Traverse_List;

	---------------------------------------------------------------
	--  Процедура для сохранения элемента в списке.              --
	---------------------------------------------------------------
	procedure Store_Character(In_Char : IN CHARACTER) is
		Element : LIST_ELEM_REF;
	begin
		Element       := new LIST_ELEM;
		Element.Value := In_Char;

		if First_Element = null then
			First_Element := Element;
			Last_Element  := Element;
		else
			Last.Next     := Element;
			Last_Element  := Element;
		end if;

		Traverse_List(Start);
	end Store_Character;

begin
	---------------------------------------------------------------
	--  Сохранение элемента в списке                             --
	---------------------------------------------------------------
	for Index in InputData'RANGE loop
		Store_Character(InputData(Index));
	end loop;

	---------------------------------------------------------------
	--  Просмотр содержимого списка                              --
	---------------------------------------------------------------							
	New_Line;
	Put_Line("ПРОСМОТР СОДЕРЖИМОГО СПИСКА.");
	Traverse_List(Start);

	---------------------------------------------------------------
	--  Освобождение всего списка                                --
	---------------------------------------------------------------
	loop
		exit when First_Element = null;
		Last_Element  := Start.Next;
		Start.Next    := null;
		First_Element := Last;
	end loop;
end LinkedList;