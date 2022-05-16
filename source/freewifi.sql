# wifi
#와이파이 전체 출력
SELECT * FROM kopoctc.freewifi;
# print_report_7 프로시저가 이미 존재한다면 삭제
DROP PROCEDURE IF EXISTS freeWifi_report;
# print_report_7 프로시저 생성
DELIMITER $$
CREATE PROCEDURE freeWifi_report(_currentPage int, _pageStudentNumber int) #프로시저의 파라미터 값을 두개로 선언한다.
BEGIN
#변수들을 선언해준다
DECLARE start_number int; #시작 번호
DECLARE page_last_number int; #페이지 마지막 번호
DECLARE cutpage int; #출력하는 페이지
DECLARE pagestudent int; #페이지내 갯수
DECLARE lastpage int; #마지막 페이지
DECLARE lat double; # 현재 위치의 위도
DECLARE lng double; # 현재 위치의 경도

#선언한 변수들의 값을 지정해준다
SET cutpage = _currentPage-1;  #입력한 페이지에서 1을 뺀 값이 출력해야할 페이지
SET pagestudent = _pageStudentNumber; #입력한 페이지 갯수는 
SET lastpage = 1000/_pageStudentNumber; #1000에서 입력한 페이지 수를 나눈값이 마지막 페이지
SET lat = 37.39; # 위도
SET lng = 127.118; # 경도

IF cutpage < 1 THEN #페이지가 1보다 작은 값이 들어오면
   SET cutpage = 1; #1페이지를 출력해라
END IF;
IF cutpage  > lastpage  THEN #페이지가 마지막 페이지보다 큰 값이 들어오면
   SET cutpage = lastpage; #마지막 페이지를 출력해라
END IF;

SET start_number = cutpage * _pageStudentNumber; #가장 처음 출력되는 값은 cutpage와 _pageStudentNumber를 곱한 값이 나온다
SET page_last_number = (cutpage+ 1) * (_pageStudentNumber); #가장 마지막에 출력되는 값은 cutpage에서 1을 더한 값과 _pageStudentNumber를 곱한 값이 나온다

# 주소, 위도, 경도, 거리 출력
select place_addr_road as 주소, latitude as 위도, longitude as 경도, (6371 * acos( cos( radians( lat ) ) * cos( radians( latitude) ) * 
cos( radians( longitude) - radians( lng )) + sin( radians(lat) ) * sin( radians(latitude) ) ) ) AS 거리 
from freewifi limit start_number, _pageStudentNumber;

END $$

call freeWifi_report(5, 25);
