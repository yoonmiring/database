use kopoctc;

drop table if exists examtable; #examtable을 사용하고 있으면 삭제해라

#examtable을 생성해라
create table examtable(
	name varchar(20),
    id int not null primary key,
    kor int, eng int, mat int);

#examtable을 정렬해라
desc examtable;

#delete문은 오류가 나므로 where절을 사용하여 삭제
delete from examtable where id>0;
delete from examtable;


#성적 테이블을 생성해라
insert into examtable value ("나연",209901, rand()*100,rand()*100,rand()*100);
insert into examtable value ("정연",209902, rand()*100,rand()*100,rand()*100);
insert into examtable value ("모모",209903, rand()*100,rand()*100,rand()*100);
insert into examtable value ("사나",209904, rand()*100,rand()*100,rand()*100);
insert into examtable value ("지효",209905, rand()*100,rand()*100,rand()*100);
insert into examtable value ("미나",209906, rand()*100,rand()*100,rand()*100);
insert into examtable value ("다현",209907, rand()*100,rand()*100,rand()*100);
insert into examtable value ("채영",209908, rand()*100,rand()*100,rand()*100);
insert into examtable value ("쯔위",209909, rand()*100,rand()*100,rand()*100);
insert into examtable value ("송가인",209910, rand()*100,rand()*100,rand()*100);
insert into examtable value ("나연",209911, rand()*100,rand()*100,rand()*100);
insert into examtable value ("정연",209912, rand()*100,rand()*100,rand()*100);
insert into examtable value ("모모",209913, rand()*100,rand()*100,rand()*100);
insert into examtable value ("사나",209914, rand()*100,rand()*100,rand()*100);
insert into examtable value ("지효",209915, rand()*100,rand()*100,rand()*100);
insert into examtable value ("미나",209916, rand()*100,rand()*100,rand()*100);
insert into examtable value ("다현",209917, rand()*100,rand()*100,rand()*100);
insert into examtable value ("채영",209918, rand()*100,rand()*100,rand()*100);
insert into examtable value ("쯔위",209919, rand()*100,rand()*100,rand()*100);
insert into examtable value ("송가인",209920, rand()*100,rand()*100,rand()*100);

#전체 테이블 출력
select *from examtable;

#국어 점수를 정렬해라
select *from examtable order by kor;
#영어 점수 정렬
select *from examtable order by eng;
#국어 점수를 정렬하되 동점일 경우 영어순 정렬
select *from examtable order by kor,eng;
#국어 내림차순 정렬
select *from examtable order by kor asc;
#국어 오름차순 정렬
select *from examtable order by kor desc;

#이름 오름차순 정렬
select *from examtable order by name desc;
#수학 오름차순 정렬
select *from examtable order by mat desc;

#as(별칭주기)
#총합과 평균점수 출력
select *, (kor+eng+mat),((kor+eng+mat)/3) from examtable;
#총합과 평균점수를 출력하여 총합을 오름차순으로 정렬
select *, (kor+eng+mat),((kor+eng+mat)/3) from examtable order by (kor+eng+mat) desc;
#총합과 평균점수의 별칭을 total과 average로 지어준다. 총합을 오름차순으로 정렬
select *,kor+eng+mat as total,(kor+eng+mat)/3 as average from examtable order by total desc;
#name을 이름으로 id를 학번으로 kor을 국어로 eng를 영어로 mat를 수학으로 합계, 평균으로 이름을 지어준 후 출력 후 합계 오름차순으로 정렬한다.
select name as 이름, id as 학번, kor as 국어, eng as 영어, mat as 수학, kor+eng+mat as 합계,(kor+eng+mat)/3 as 평균 from examtable order by 합계 desc;

#group by
#오류 발생
#이름이 그룹으로 뭉쳐져있지만 중복된 이름을 하나로 표현이 불가능
select *from examtable group by name;
#이름과 이름의 중복갯수를 이름으로 그룹화하여 출력
select name, count(name) from examtable group by name;
#오류 발생
#국어점수를 그룹화하여 출력해라
select * from examtable group by kor;
#국어점수와 국어점수마다의 갯수를 출력하고 국어점수를 그룹화하여 출력해라
select kor, count(kor) from examtable group by kor;
#오류 발생 영어를 그룹화하였기 때문
select kor, count(kor) from examtable group by eng;
#국어와 영어점수의 갯수를 출력하여 국어,영어점수별로 그룹화하여 출력해라
select kor, count(kor), eng, count(eng) from examtable group by kor,eng;
#영어갯수와 영어점수별로 그룹화하여 출력
select eng, count(eng) from examtable group by eng;

#팽수의 국어와 영어점수가 같은 값을 두개 넣어준다. (수학점수는 랜덤)
insert into examtable value ("팽수",209921,100,90,rand()*100);
insert into examtable value ("팽수",209922,100,90,rand()*100);
#국어와 영어점수의 갯수를 출력하여 국어,영어점수별로 그룹화하여 출력해라
select kor, count(kor), eng, count(eng) from examtable group by kor,eng;
#국어와 이름과 국어 영어 점수를 그룹화 하여 출력
select name, count(name),kor, count(kor), eng, count(eng) from examtable group by name, kor,eng;
#오류 발생
#테이블 전체와 이름, 국어 영어 점수를 그룹화 하여 출력하면 오류가 발생한다.
select *,name, count(name),kor, count(kor), eng, count(eng) from examtable group by name, kor,eng;
#영어의 중복값이 2이상인 경우에 영어점수와 영어점수 갯수를 출력해라
select eng, count(eng) from examtable group by eng having count(eng)>1;

select *,kor+eng+mat as sum, (kor+eng+mat)/3 as ave from examtable limit 30,59;
drop procedure if exists insert_examtable;
delimiter $$
create procedure insert_examtable(_last integer)
begin
declare _name varchar(20);
declare _id integer;
declare _cnt integer;
set _cnt=0;
delete from examtable where id >0 ;
	_loop: loop
		set _cnt = _cnt+1;
        set _name = concat("홍길",cast(_cnt as char(4))) ;
        set _id = 209900+_cnt;
        
        insert into examtable value (_name, _id,rand()*100,rand()*100,rand()*100);
        if _cnt = _last then
			leave _loop;
		end if;
	end loop _loop;
end $$
#함수만들기
delimiter $$
create function f_get_sum(_id integer) returns integer
begin
	declare _sum integer;
    select kor+eng+mat into _sum from examtable where id=_id;
return _sum;
end $$
delimiter ;


#랭킹 출력
select *,kor+eng+mat as 총점, (kor+eng+mat)/3 as 평균, (select count(*) +1 from examtable as a
where (a.kor + a.eng + a.mat)> (b.kor + b.eng + b.mat)) as 등수 from examtable as b;

#ranking 함수를 사용하고 있으면 지우기
drop function if exists ranking;
#랭킹 함수 만들기
delimiter $$
create function _ranking (_id integer) returns integer #_ranking함수를 만들어라 리턴값은 정수형으로 선언
begin
	declare _ranking integer; #_ranking정수형 선언
    #등수를 함수로 선언하기 위해 select문 선언
	select (select count(*) +1 from examtable as a where (a.kor + a.eng + a.mat)> (b.kor + b.eng + b.mat)) into _ranking from examtable as b where id = _id;
return _ranking;
end $$ 
delimiter ;

select * from examtable;
select *,kor+eng+mat as 총점, (kor+eng+mat)/3 as 평균, _ranking(id) as 등수 from examtable ; #총점과 평균 등수(함수)를 출력해라
select *,kor+eng+mat as 총점, (kor+eng+mat)/3 as 평균, _ranking(id) as 등수 from examtable order by 등수; # 총점과 평균 등수(함수)를 정렬해서 출력해라

call insert_examtable(1000);
select * from examtable;

#print_reprot 프로시저를 사용하고 있으면 삭제해라
drop procedure if exists print_report;
#print_reprot 프로시저 생성
delimiter $$
create procedure print_report(_page integer ,_count integer)
begin
declare _name varchar(20);
declare _id integer;
declare _cnt integer;
set _cnt=0;
delete from examtable where id >0 ;
	_loop: loop
		set _cnt = _cnt+1;
        set _name = concat("홍길",cast(_cnt as char(4))) ;
        set _id = 209900+_cnt;
        
        insert into examtable value (_name, _id,rand()*100,rand()*100,rand()*100);
        if _cnt = _last then
			leave _loop;
		end if;
	end loop _loop;
end $$





