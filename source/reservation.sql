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
insert into reservation values ("정연","2022-05-26",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-05-27",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-05-29",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("채영","2022-05-30",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-01",2,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-02",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-03",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-04",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-05",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-06",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-10",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-11",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-12",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-13",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("정연","2022-06-14",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-15",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-16",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-18",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-06-28",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-29",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("나연","2022-06-30",1,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("모모","2022-05-27",2,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("다현","2022-05-29",2,"서울","010-0101-0101","다현","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("다현","2022-06-04",2,"서울","010-0101-0101","다현","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-17",2,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("사나","2022-06-12",3,"서울","010-0101-0101","사나","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));
insert into reservation values ("지효","2022-06-29",3,"서울","010-0101-0101","나연","따뜻한방 주세요",DATE_FORMAT(NOW(),'%Y-%m-%d'));

#1달간 예약보기 위한 프로시저
drop procedure if exists resvstat_calc;	#기존의 동일명 프로시저 삭제
delimiter $$
# 프로시저 선언
create procedure resvstat_calc()
begin
	#변수 선언, 날짜, 방 1 2 3 선언
	declare _date date;
    declare _room1 varchar(20);
    declare _room2 varchar(20);
    declare _room3 varchar(20);
	##################################################################################################
    drop table if  exists reserv_stat;	#기존의 동일명 테이블 삭제
    # 결과 테이블 생성, 프라이머리키로 입실날짜 지정
    create table reserv_stat(
		reserve_date date not null,
        room1 varchar(20),
        room2 varchar(20),
        room3 varchar(20),
		primary key(reserve_date)
        );
	##################################################################################################
    #테이블을 돌면서 날짜가 똑같고 room 넘버가 동일하면 이름을 입력해라.
    insert into reserv_stat
    select distinct b.reserve_date,
		# 방번호와 예약 날짜가 동일하면 해당 예약자명을 입력해라, 단 값이 없으면 예약가능으로 입력해라
		(select ifnull((select a1.name from reservation as a1 where b.reserve_date = a1.reserve_date and 1 = a1.room), '예약가능')),
		(select ifnull((select a2.name from reservation as a2 where b.reserve_date = a2.reserve_date and 2 = a2.room), '예약가능')),
		(select ifnull((select a3.name from reservation as a3 where b.reserve_date = a3.reserve_date and 3 = a3.room), '예약가능'))
	from reservation as b
	#오늘부터 1달 뒤까지의 범위를 적용해서 reservation(b)를 참조해라
    where b.reserve_date BETWEEN DATE_FORMAT(NOW(),'%Y-%m-%d') AND DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 1 MONTH),'%Y-%m-%d'); 
	##################################################################################################
    select * from reserv_stat;	#해당 결과테이블 생성
end $$
#함수실행
call resvstat_calc();