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
desc answer;
#정답지는 rand 함수를 사용하여 생성하였음
#subjectID 1번(국어) 정답지
insert into answer values (1 , rand()*4+1, rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,
rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1); 
#subjectID 2번(영어) 정답지
insert into answer values (2 , rand()*4+1, rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,
rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1);
#subjectID 3번(수학) 정답지 
insert into answer values (3 , rand()*4+1, rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,
rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1,rand()*4+1); 

select * from answer;