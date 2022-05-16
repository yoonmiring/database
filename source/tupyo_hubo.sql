SELECT * FROM kopoctc.tupyo_hubo;
desc tupyo_hubo;
#tupyo_hubo를 사용하고 있으면 삭제해라
delete from tupyo_hubo where kiho>0;
#insert_tupyo 프로세저를 사용하고 있으면 삭제해라
drop procedure if exists insert_tupyo;
#프로세저 생성
delimiter $$
create procedure insert_tupyo( _limit integer) #insert_tupyo를 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
        insert into tupyo_hubo value (rand()*8+1,rand()*8+1); #1부터 9까지의 숫자값이 랜덤으로 출력될 수 있게 rand()*8+1을 사용하여 입력해라
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$
call insert_tupyo(1000); #insert_tupyo의 프로세저를 1000번 파라미터 값으로 넣어 1000개의 투표를 생성해라
#입력된 정보 출력
select kiho as 투표한기호, age as 투표자연령대 from tupyo_hubo;

#각 기호와 받은 투표수를 그룹바이로 출력해라 
select kiho, count(*) from tupyo_hubo group by kiho;
#join문장 작성
#tupyo_hubo 테이블을 a , hubo 테이블을 b로 지정하고 
#b의 이름과 공약 a의 투표수를 출력한다.  
#a의 기호와 b의 기호는 foriegn키로 묶여 있어 같다고 표시해주어 같은 값일때 출력하고 a의 기호로 그룹바이해라
select b.name, b.gongyak, count(a.kiho) from tupyo_hubo as a, hubo as b where a.kiho=b.kiho group by a.kiho;
#select안에 select
select (select name from hubo where kiho=a.kiho), #tupyo_hubo의 기호와 hubo테이블의 기호가 같을때 이름을 출력하고 
	(select gongyak from hubo where kiho=a.kiho), #tupyo_hubo의 기호와 hubo테이블의 기호가 같을때 공약을 출력하고 
    count(a.kiho) #tupyo_hubo의 투표수를 출력해라
    from tupyo_hubo as a #tupyo_hubo는 a로 별칭을 지어주었다.
    group by a.kiho; #tupyo_hubo의 기호로 그룹바이 하여 출력해라
