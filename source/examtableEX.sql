
#examtableEX을 사용하고 있으면 삭제해라
drop table if exists examtableEX;
#examtableEX테이블 생성
create table examtableEX(
	name varchar(20),
    id int not null primary key,
    kor int, eng int, mat int, sum int, ave double, ranking int);
desc examtableEX;

#examtableEX 테이블에 이름,학번, 국어,영어,수학,총점,평균,등수를 입력해라.
insert into examtableEX
	select *,b.kor+b.eng+b.mat,(b.kor+b.eng+b.mat)/3,
    (select count(*)+1 from examtable4 as a where (a.kor+a.eng+a.mat) > (b.kor+b.eng+b.mat))
    from examtable4 as b; #examtable4을 b로 별칭을 정하여

#랭킹을 기준으로 내림차순으로 정렬하여 이름,학번, 국어,영어,수학,총점,평균,등수를 출력해라
select *from examtableEX order by ranking desc; 