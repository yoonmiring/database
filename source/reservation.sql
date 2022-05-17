#reservation table
drop table reservation;	#기존에 테이블이 있으면 삭제
# 새 테이블 생성, 이름, 예약날짜, 방, 주소, 전화번호, 송금인, 메모, 송금날짜
create table reservation (
	name varchar(10),
    reserve_date date,
    room int,
    addr varchar(100),
    tel varchar(20),
    ipgum_name varchar(10),
    memo varchar(100),
    input_date date);
#임의 값 넣기
#now의 값은 년-월-일-시-분-초 형태이므로 년-월-일로 포맷을 지정하여 출력한다
insert into reservation values ("정연","2022-05-26",1,"서울","010-0101-0101","정연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-05-27",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-05-29",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("채영","2022-05-30",3,"서울","010-0101-0101","채영","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-01",2,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-02",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-03",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-04",3,"서울","010-0101-0101","지효","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-05",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-06",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-10",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-11",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-12",1,"서울","010-0101-0101","지효","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-13",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-14",1,"서울","010-0101-0101","정연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-15",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-16",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-18",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-28",1,"서울","010-0101-0101","모모","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-29",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-30",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("쯔위","2022-05-27",2,"서울","010-0101-0101","쯔위","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("다현","2022-05-29",2,"서울","010-0101-0101","다현","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("쯔위","2022-06-04",2,"서울","010-0101-0101","쯔위","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-05-23",2,"서울","010-0101-0101","지효","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-05-24",3,"서울","010-0101-0101","사나","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-29",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
select *from reservation;

#예약현황 확인하는 테이블 생성
drop table if  exists reserv_stat;	#reserv_stat 테이블이 있다면 삭제해라
# 결과 테이블 생성, pk는 예약확인날짜로 지정한다
    create table reserv_stat(
		reserve_date date not null,
        room1 varchar(20),
        room2 varchar(20),
        room3 varchar(20),
		primary key(reserve_date)
        );

#1달간 예약보기 위한 프로시저
drop procedure if exists resvstat_calc;	#기존의 동일명 프로시저 삭제
delimiter $$
# 프로시저 선언
create procedure resvstat_calc()
begin
	#변수 선언, 날짜, 방 1 2 3 선언
	declare _date date;
    declare _cnt integer;
    declare _room1 varchar(20);
    declare _room2 varchar(20);
    declare _room3 varchar(20);
    set _date=now();
	set _cnt = 0;
    _loop: LOOP   #루프선언
    
   #값입력, reserv_stat(reserve_date, room1, room2, room3) 값에 예약날짜, 예약가능 여부 및 신청인원 입력
         insert into reserv_stat (reserve_date, room1, room2, room3)
         #date_add를 통해서 오늘 날짜에 _cnt의 수 만큼 날짜 추가
         select distinct (date_add(_date, interval _cnt day)),
         #reservation(a)의 name을 출력한다. 
            (select ifnull((select a.name from reservation as a where a.reserve_date = (date_add(_date, interval _cnt day)) and a.room =1), '예약가능')),
            (select ifnull((select a.name from reservation as a where a.reserve_date = (date_add(_date, interval _cnt day)) and a.room =2), '예약가능')),
            (select ifnull((select a.name from reservation as a where a.reserve_date = (date_add(_date, interval _cnt day)) and a.room =3), '예약가능'))
         from reservation;
         set _cnt = _cnt+1;   #날짜 하루 증가
      #루프선언 한달치만큼 돌고 루프종료하는 if문 작성
      if _cnt = 31 then
            leave _loop;
         end if;
        end loop _loop;  
end $$
#함수실행
call resvstat_calc();

select * from reserv_stat;	#해당 결과테이블 생성