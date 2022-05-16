SELECT * FROM kopoctc.hobo;
use kopoctc;
desc hubo;

delete from hubo where kiho>0; #기호테이블을 사용하고 있으면 삭제해라
#각 후보자 번호와 이름, 공약을 입력
insert into hubo values (1,"나연","매일 아침 제공");
insert into hubo values (2,"정연","학교에 반려동물 데려올 수 있게..");
insert into hubo values (3,"모모","고양이가 세상을 구한다");
insert into hubo values (4,"사나","수요일은 매주 국가공휴일로 지정");
insert into hubo values (5,"지효","주 20시간 근무제");
insert into hubo values (6,"미나","국가재난 지원금 1억");
insert into hubo values (7,"다현","다자녀에게 집 한채 제공해주는 현실을 맛보게 해드립니다");
insert into hubo values (8,"채영","채소를 많이 먹어야 영(young)해져요");
insert into hubo values (9,"쯔위","쯔위 이쁘다");
#입력된 정보 출력
select kiho as 기호, name as 성명, gongyak as 공약 from hubo;
