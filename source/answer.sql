SELECT * FROM kopoctc.ansewer;
#answer 테이블을 사용하고 있다면 삭제해라
drop table if exists answer;
#answer 테이블 생성(정답테이블)
create table answer(
subjectID int not null primary key, #과목아이디는 정수형, 빈값을 둘 수 없는 pk값 
#각 문제별 정답은 정수형으로 받는다
a01 int, a02 int,a03 int,a04 int,a05 int,a06 int,a07 int,a08 int,a09 int,a10 int,
a11 int,a12 int,a13 int,a14 int,a15 int,a16 int,a17 int,a18 int,a19 int,a20 int
);

insert into answer values (1 , rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1
, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1, rand()*5+1); 

select * from answer