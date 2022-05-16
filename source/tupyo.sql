#투표 테이블 생성
create table tupyo(
	name int,
    age int);
    
#투표 테이블 삭제
drop table tupyo;
#전체 테이블 출력
select * from tupyo;
select count(*) from tupyo;
#전체 테이블 출력이 
insert into tupyo value (rand()*8, rand()*8+1); 
insert into tupyo value ("나연", rand()*8+1); 
insert into tupyo value ("정연", rand()*8+1);
insert into tupyo value ("모모", rand()*8+1);
insert into tupyo value ("사나", rand()*8+1);
insert into tupyo value ("지효", rand()*8+1);
insert into tupyo value ("미나", rand()*8+1);
insert into tupyo value ("다현", rand()*8+1);
insert into tupyo value ("채영", rand()*8+1);
insert into tupyo value ("쯔위", rand()*8+1);

select name, count(name) as 득표수, count(name)/(select count(*) from tupyo)*100 as 득표율 from tupyo group by name order by 득표수 desc;
select age*10 as 연령대 , count(age) as 득표수, count(age)/(select count(*) from tupyo where name = '나연')*100 as 득표율 from tupyo where name = '나연' group by age order by 득표수 desc;
#생성된 input_data 프로세저가 있으면 삭제해라
drop procedure if exists input_data;
#프로세저 생성
delimiter $$ 
create procedure input_data(_last integer) #
BEGIN
declare _name integer; #이름값을 int형으로 받아준다 나중에 char형태로 바꿔줌
declare _age integer;
declare _cnt integer;
set _cnt=0;
delete from tupyo where age >0 ;
	_loop: loop #loop문 시작
		set _cnt=_cnt+1; #값을 하나씩 증가시킨다
        
        insert into tupyo value (rand()*8, rand()*8+1); #이름과 나이값을 랜덤함수로 받아준다
        
        if _cnt=_last then  #마지막번호와 입력한 번호가 같으면
			leave _loop; 
		end if; 
	end loop _loop; #loop문을 빠져나와라
end $$

call input_data(1000); #1000개 생성

ALTER TABLE tupyo MODIFY name varchar(20); # name 타입을 int를 varchar로 변경해준다
set sql_safe_updates= 0 ; # Error code 1175를 일시적으로 해결해주는 쿼리문
update tupyo set name = '나연' where name = '0'; # 0번은 나연으로 수정!
update tupyo set name = '정연' where name = '1'; # 1번은 정연으로 수정!
update tupyo set name = '모모' where name = '2'; # 2번은 모모로 수정!
update tupyo set name = '사나' where name = '3'; # 3번은 사나로 수정!
update tupyo set name = '지효' where name = '4'; # 4번은 지효로 수정!
update tupyo set name = '미나' where name = '5'; # 5번은 미나로 수정!
update tupyo set name = '다현' where name = '6'; # 6번은 다현으로 수정!
update tupyo set name = '채영' where name = '7'; # 7번은 채영으로 수정!
update tupyo set name = '쯔위' where name = '8'; # 8번은 쯔위로 수정!


select name, count(name) as 득표수, count(name)/(select count(*) from tupyo)*100 as 득표율 from tupyo group by name order by 득표수 desc
select * from tupyo;
#함수 지우기
drop function if exists twice_rate;
#선호도 비율 함수 
delimiter $$
create function twice_rate (_name varchar(10)) returns float  #twice_ranking함수를 만들어라 리턴값은 정수형으로 선언 
begin
	declare twice_rate float; #twice_rate 실수형 선언
    select count(name)/(select count(*) from tupyo)*100 into twice_rate from tupyo where name = _name; # 선호도 비율 함수 선언
return twice_rate;
end $$
delimiter ;

select * from tupyo;
select name, count(name) as 득표수 from tupyo group by name;
# 이름을 그룹으로 묶어 득표수와 선호도를 출력
select name, count(name) as 득표수, twice_rate(name) as 선호도  from tupyo group by name;
select name, count(name) as 득표수, twice_rate(name) as 선호도  from tupyo group by name order by 득표수 desc;

select *,kor+eng+mat as 총점, (kor+eng+mat)/3 as 평균, (select count(*) +1 from examtable as a where (a.kor + a.eng + a.mat)> (b.kor + b.eng + b.mat)) as 등수 from examtable as b;

