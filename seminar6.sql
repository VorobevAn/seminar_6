-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

drop function times;
delimiter //
create function times (seconds int)
returns varchar(100)
deterministic
begin
declare days int;
declare hours, minutes, sec int;
declare result varchar(100);
set days = floor(seconds/60/60/24);
set seconds = seconds-(days*24*60*60);
set hours = floor(seconds/60/60);
set seconds = seconds-(hours*60*60);
set minutes = floor(seconds/60);
set sec = seconds-(minutes*60);
set result = concat(days, " days ", hours, " hours ", minutes, " minutes ", sec, " seconds");
return result;
end //
delimiter ;


select times(123456);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
drop function numbers;

delimiter //
create function numbers()
returns varchar(20)
deterministic
begin
DECLARE i INT DEFAULT 1;
DECLARE result varchar(100) DEFAULT' ';
while i <= 10 do
		if (i % 2 = 0) then
			set result = concat(result,' ', i);
			set i = i + 2;
		else
			set i = i + 1;
        end if;
	end while;
return result;
end //
delimiter ;

select numbers();
