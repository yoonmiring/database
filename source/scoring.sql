SELECT * FROM kopoctc.scoring;
#scoring 테이블을 사용하고 있다면 삭제해라
drop table if exists scoring;
#scoring 테이블 생성(채점테이블)
create table scoring(
subjectID int not null,#과목아이디는 정수형, 빈값을 둘 수 없다
stu_name varchar(20),#학생 이름은 문자열로 받는다
stu_id int not null,#학번은 정수형, 빈값을 둘 수 없다.
#각 문제별 정답은 정수형으로 받는다
a01 int, a02 int,a03 int,a04 int,a05 int,a06 int,a07 int,a08 int,a09 int,a10 int,
a11 int,a12 int,a13 int,a14 int,a15 int,a16 int,a17 int,a18 int,a19 int,a20 int,
score int,
primary key(subjectID,stu_id) #pk값은 복합으로 subjectID,stu_id를 둔다
);
desc scoring;

#채점하기
select a.subjectID, b.stu_name,b.stu_id, #과목아이디, 이름, 학번 출력
#정답과 시험답안지가 같으면 1 다르면 0을 출력한다.
if(a.a01=b.a01,1,0) as a01,	if(a.a02=b.a02,1,0) as a02,	if(a.a03=b.a03,1,0) as a03,	if(a.a04=b.a04,1,0) as a04,	if(a.a05=b.a05,1,0) as a05,	
if(a.a06=b.a06,1,0) as a06,	if(a.a07=b.a07,1,0) as a07,	if(a.a08=b.a08,1,0) as a08,	if(a.a09=b.a09,1,0) as a09,	if(a.a10=b.a10,1,0) as a10,	
if(a.a11=b.a11,1,0) as a11,	if(a.a12=b.a12,1,0) as a12,	if(a.a13=b.a13,1,0) as a13,	if(a.a14=b.a14,1,0) as a14,	if(a.a15=b.a15,1,0) as a15,	
if(a.a16=b.a16,1,0) as a16,	if(a.a17=b.a17,1,0) as a17,	if(a.a18=b.a18,1,0) as a18,	if(a.a19=b.a19,1,0) as a19,	if(a.a20=b.a20,1,0) as a20,
#값을 다 더하고 *5를 하여 점수를 출력한다.
(if(a.a01=b.a01,1,0)+if(a.a02=b.a02,1,0)+if(a.a03=b.a03,1,0)+if(a.a04=b.a04,1,0)+if(a.a05=b.a05,1,0)+	
if(a.a06=b.a06,1,0)+if(a.a07=b.a07,1,0)+if(a.a08=b.a08,1,0)+if(a.a09=b.a09,1,0)+if(a.a10=b.a10,1,0)+	
if(a.a11=b.a11,1,0)+if(a.a12=b.a12,1,0)+if(a.a13=b.a13,1,0)+if(a.a14=b.a14,1,0)+if(a.a15=b.a15,1,0)+	
if(a.a16=b.a16,1,0)+if(a.a17=b.a17,1,0)+if(a.a18=b.a18,1,0)+if(a.a19=b.a19,1,0)+if(a.a20=b.a20,1,0))*5 as score
from answer as a, testing as b where a.subjectID = b.subjectID;