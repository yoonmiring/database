SELECT * FROM kopoctc.examtable4;
#examtable4 테이블이 있다면 지워라
drop table if exists examtable4;
#examtable4테이블을 만들어라
create table examtable4(
	name varchar(20), #이름은 문자형
    id int not null primary key, #학번은 빈값이 있으면 안되고 pk값이다며 정수형으로 받는다
    kor int, eng int, mat int); #국어와 영어 수학 점수는 정수형으로 받는다.
#examtable4테이블을 정렬해라
desc examtable4; 
#examtable4안에 값이 있으면 삭제해라
delete from examtable4 where id>0;
#insert_examtable4 프로시저를 사용하고 있다면 삭제해라
drop procedure if exists insert_examtable4;
#프로시저 생성
delimiter $$
create procedure insert_examtable4( _limit integer) #insert_examtable4 생성해라 파라미터 값은 정수형으로 받는다
begin
declare _name varchar(20); #이름은 정수형으로 선언
declare _id integer; #_id는 정수형으로 선언
declare _cnt integer; #_cnt는 정수형으로 선언
set _cnt=0;
	_loop: loop #반복문 실행
		set _cnt=_cnt+1; #1씩 증가하면서 실행해라
        set _name = concat("홍길",cast(_cnt as char(4))) ; #이름은 홍길과 뒤에 늘어나는 숫자만큼 붙여 이름을설정한다
        set _id = 209900 + _cnt; #학번도 209900에서 늘어나는 숫자만큼 더해서 설정한다
        
         #0부터 100까지의 숫자값이 랜덤으로 출력될 수 있게 rand()*100을 사용하여 점수값을 부여한다
        insert into examtable4 value (_name, _id, rand()*100,rand()*100,rand()*100); 
        
        if _cnt= _limit then #입력받은 파라미터와 증가한 숫자가 같아지면
			leave _loop; #루프문을 빠져나와라
		end if;
	end loop _loop; 
end $$
call insert_examtable4(1000); #프로시저를 1000번 파라미터로 주어 1000개의 데이터를 불러낸다
select * from examtable4; #결과값 출력
#examview의 뷰를 사용하고 있다면 지워라
drop view if exists examview;
#뷰 생성하기
create view examview(name,id,kor,eng,mat,tot,ave,ran) #뷰에 입력할 값을 지정한다
as select *, #이름,학번,국어,영어,수학
	b.kor+b.eng+b.mat, #총점
    (b.kor+b.eng+b.mat)/3, #평균
    ( select count(*)+1 from examtable4 as a where (a.kor+a.eng+a.mat) >(b.kor+b.eng+b.mat) ) #등수
    from examtable4 as b; #examtable4를 b로 지정한다.
    
select *from examview;
select name, ran from examview;

select * from examview where ran >500;
insert into examview values ("나연",309933,100,100,100,300,100,1);

