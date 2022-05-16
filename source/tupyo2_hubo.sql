SELECT * FROM kopoctc.tupyo2_hubo;
#tupyo2_hubo을 사용하고 있으면 삭제해라
drop table if exists tupyo2_hubo;
create table tupyo2_hubo(
	kiho1 int, #선호 1번
    kiho2 int, #선호 2번
    kiho3 int, #선호 3번
    age int); #연령대
desc tupyo2_hubo;

#프로세저 생성
delimiter $$
create procedure insert_tupyo2( _limit integer) #insert_tupyo2를 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
         #1부터 9까지의 숫자값이 랜덤으로 출력될 수 있게 rand()*8+1을 사용하여 입력해라
        insert into tupyo2_hubo value (rand()*8+1,rand()*8+1,rand()*8+1,rand()*8+1); 
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$
 #insert_tupyo2의 프로세저를 1000번 파라미터 값으로 넣어 1000개의 투표를 생성해라
call insert_tupyo2(1000);
#입력된 값을 출력해라
select *from tupyo2_hubo;
select count(*)from tupyo2_hubo;
#___________여기까지_______________________
#join으로 기호에 대한 후보자이름으로 바꾸는 쿼리 작성
select a.age, h1.name as 투표1, h2.name as 투표2 ,h3.name as 투표3 
	from tupyo2_hubo as a, hubo as h1,hubo as h2,hubo as h3 
	where a.kiho1=h1.kiho and  a.kiho2=h2.kiho and a.kiho3=h3.kiho;

#select 안에 select 문으로 기호에 대한 후보자이름으로 바꾸는 쿼리 작성
select a.age, #나이 출력
	(select name from hubo where a.kiho1=kiho) as 투표1,
    (select name from hubo where a.kiho2=kiho) as 투표2,
    (select name from hubo where a.kiho3=kiho) as 투표3
    from tupyo2_hubo as a; #tupyo2_hubo는 a로 별칭을 지어주었다.

#나정모사지미다채쯔의 총 득표수 출력
select
#투표 1,2,3 중 1을 뽑은게 있다면 나연은 1표가 주어져서 count하여 나연의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=1 or kiho2=1 or kiho3=1) as "나연", 
#투표 1,2,3 중 2을 뽑은게 있다면 정연은 1표가 주어져서 count하여 정연의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=2 or kiho2=2 or kiho3=2) as "정연",
#투표 1,2,3 중 3을 뽑은게 있다면 모모는 1표가 주어져서 count하여 모모의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=3 or kiho2=3 or kiho3=3) as "모모",
#투표 1,2,3 중 4을 뽑은게 있다면 사나는 1표가 주어져서 count하여 사나의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=4 or kiho2=4 or kiho3=4) as "사나",
#투표 1,2,3 중 5을 뽑은게 있다면 지효는 1표가 주어져서 count하여 지효의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=5 or kiho2=5 or kiho3=5) as "지효",
#투표 1,2,3 중 6을 뽑은게 있다면 미나는 1표가 주어져서 count하여 미나의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=6 or kiho2=6 or kiho3=6) as "미나",
#투표 1,2,3 중 7을 뽑은게 있다면 다현은 1표가 주어져서 count하여 다현의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=7 or kiho2=7 or kiho3=7) as "다현",
#투표 1,2,3 중 8을 뽑은게 있다면 채영은 1표가 주어져서 count하여 채영의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=8 or kiho2=8 or kiho3=8) as "채영",
#투표 1,2,3 중 9을 뽑은게 있다면 쯔위는 1표가 주어져서 count하여 쯔위의 총 투표수를 보여줌
(select count(*) from tupyo2_hubo where kiho1=9 or kiho2=9 or kiho3=9) as "쯔위";

#각 후보의 투표수와 총합,2개를 중복을 한 투표 수 , 3개다 같은 값을 찍은 투표 수를 출력
select
#각 후보의 투표 수 출력
(select count(*) from tupyo2_hubo where kiho1=1 or kiho2=1 or kiho3=1) as "나연",
(select count(*) from tupyo2_hubo where kiho1=2 or kiho2=2 or kiho3=2) as "정연",
(select count(*) from tupyo2_hubo where kiho1=3 or kiho2=3 or kiho3=3) as "모모",
(select count(*) from tupyo2_hubo where kiho1=4 or kiho2=4 or kiho3=4) as "사나",
(select count(*) from tupyo2_hubo where kiho1=5 or kiho2=5 or kiho3=5) as "지효",
(select count(*) from tupyo2_hubo where kiho1=6 or kiho2=6 or kiho3=6) as "미나",
(select count(*) from tupyo2_hubo where kiho1=7 or kiho2=7 or kiho3=7) as "다현",
(select count(*) from tupyo2_hubo where kiho1=8 or kiho2=8 or kiho3=8) as "채영",
(select count(*) from tupyo2_hubo where kiho1=9 or kiho2=9 or kiho3=9) as "쯔위",
#총 합 투표수를 구하기 위해 다 더함
((select count(*) from tupyo2_hubo where kiho1=1 or kiho2=1 or kiho3=1)+
(select count(*) from tupyo2_hubo where kiho1=2 or kiho2=2 or kiho3=2)+
(select count(*) from tupyo2_hubo where kiho1=3 or kiho2=3 or kiho3=3)+
(select count(*) from tupyo2_hubo where kiho1=4 or kiho2=4 or kiho3=4) +
(select count(*) from tupyo2_hubo where kiho1=5 or kiho2=5 or kiho3=5) +
(select count(*) from tupyo2_hubo where kiho1=6 or kiho2=6 or kiho3=6) +
(select count(*) from tupyo2_hubo where kiho1=7 or kiho2=7 or kiho3=7) +
(select count(*) from tupyo2_hubo where kiho1=8 or kiho2=8 or kiho3=8)+
(select count(*) from tupyo2_hubo where kiho1=9 or kiho2=9 or kiho3=9))as 총합,
#2개를 중복으로 투표 한 갯수 출력
(select count(*) from tupyo2_hubo where kiho1=kiho2 or kiho1=kiho3 or kiho2=kiho3) as 2중복,
#3개 중복으로 투표 한 갯수 출력
(select count(*) from tupyo2_hubo where kiho1=kiho2 and kiho2=kiho3) as 3중복;