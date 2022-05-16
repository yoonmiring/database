SELECT * FROM kopoctc.reporttable;
SELECT * FROM kopoctc.reporttable;
#reporttable 테이블을 사용하고 있다면 삭제해라
drop table if exists reporttable;
#reporttable 테이블 생성(채점 리포트 테이블)
create table reporttable(
stu_name varchar(20),#학생 이름은 문자열로 받는다
stu_id int not null,#학번은 정수형, 빈값을 둘 수 없다.examtable4
#국어 영어 수학 점수는 정수형으로 받는다
kor int, eng int, mat int
);
desc reporttable;

drop function if exists _korScore;
#스코어 함수 만들기
delimiter $$
create function _korScore (_stu_id integer) returns integer
begin
	declare _korScore integer;
    select (select(if(a.a01=b.a01,1,0)+if(a.a02=b.a02,1,0)+if(a.a03=b.a03,1,0)+if(a.a04=b.a04,1,0)+if(a.a05=b.a05,1,0)+	
	if(a.a06=b.a06,1,0)+if(a.a07=b.a07,1,0)+if(a.a08=b.a08,1,0)+if(a.a09=b.a09,1,0)+if(a.a10=b.a10,1,0)+	
	if(a.a11=b.a11,1,0)+if(a.a12=b.a12,1,0)+if(a.a13=b.a13,1,0)+if(a.a14=b.a14,1,0)+if(a.a15=b.a15,1,0)+	
	if(a.a16=b.a16,1,0)+if(a.a17=b.a17,1,0)+if(a.a18=b.a18,1,0)+if(a.a19=b.a19,1,0)+if(a.a20=b.a20,1,0))*5
    from ansewer as a, testing as b where a.subjectID = b.subjectID) into _korScore from reporttable;
return _korScore ;
end $$
delimiter ;