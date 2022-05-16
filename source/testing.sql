SELECT * FROM kopoctc.testing;
#testing 테이블을 사용하고 있다면 삭제해라
drop table if exists testing;
#testing 테이블 생성(시험테이블)
create table testing(
subjectID int not null,#과목아이디는 정수형, 빈값을 둘 수 없다
stu_name varchar(20),
stu_id int not null, #학번은 정수형, 빈값을 둘 수 없다.
#각 문제별 정답은 정수형으로 받는다
a01 int, a02 int,a03 int,a04 int,a05 int,a06 int,a07 int,a08 int,a09 int,a10 int,
a11 int,a12 int,a13 int,a14 int,a15 int,a16 int,a17 int,a18 int,a19 int,a20 int,
primary key(subjectID,stu_id) #pk값은 복합으로 subjectID,stu_id를 둔다
);
desc testing;

#첫번째 과목 프로시저 만들기 (국어)
#insert_subject1 프로시저가 있다면 삭제해라
drop procedure if exists insert_subject1;
#프로시저 생성
delimiter $$
create procedure insert_subject1( _limit integer) #insert_subject1 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _name varchar(20);#이름은 문자열로 선언한다
declare _id integer; #_id는 정수형으로 선언
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
        set _name = concat("홍길",cast(_cnt as char(4))) ; #이름은 홍길과 뒤에 늘어나는 숫자만큼 붙여 이름을설정한다
        set _id = 209900 + _cnt; #학번도 209900에서 늘어나는 숫자만큼 더해서 설정한다
        #과목코드, 이름, 학번, 답안을 랜덤으로 받아 입력한다
        insert into testing value (1, _name,_id, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1
        , rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1); 
        
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$

#두번째 과목 프로시저 만들기 (영어)
#insert_subject2 프로시저가 있다면 삭제해라
drop procedure if exists insert_subject2;
#프로시저 생성
delimiter $$
create procedure insert_subject2( _limit integer) #insert_subject2 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _name varchar(20);#이름은 문자열로 선언한다
declare _id integer; #_id는 정수형으로 선언
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
        set _name = concat("홍길",cast(_cnt as char(4))) ; #이름은 홍길과 뒤에 늘어나는 숫자만큼 붙여 이름을설정한다
        set _id = 209900 + _cnt; #학번도 209900에서 늘어나는 숫자만큼 더해서 설정한다
        #과목코드, 이름, 학번, 답안을 랜덤으로 받아 입력한다
        insert into testing value (2, _name,_id, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1
        , rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1); 
        
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$

#세번째 과목 프로시저 만들기 (수학)
#insert_subject3 프로시저가 있다면 삭제해라
drop procedure if exists insert_subject3;
#프로시저 생성
delimiter $$
create procedure insert_subject3( _limit integer) #insert_subject3 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _name varchar(20);#이름은 문자열로 선언한다
declare _id integer; #_id는 정수형으로 선언
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
        set _name = concat("홍길",cast(_cnt as char(4))) ; #이름은 홍길과 뒤에 늘어나는 숫자만큼 붙여 이름을설정한다
        set _id = 209900 + _cnt; #학번도 209900에서 늘어나는 숫자만큼 더해서 설정한다
        #과목코드, 이름, 학번, 답안을 랜덤으로 받아 입력한다
        insert into testing value (3, _name,_id, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1
        , rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1, rand()*4+1); 
        
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$

#각 과목을 1000개씩 프로시저를 실행한다.
call insert_subject1(1000);
call insert_subject2(1000);
call insert_subject3(1000);
#전체 코드 출력
select * from testing;