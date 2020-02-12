insert into nmj_member (mb_id, mb_pw, mb_name, mb_img_org, mb_img_sav, mb_tel, mb_email, mb_type)
values ('ksi', '1234', '강성일', null, null, '010-4011-3450', 'ksi0678@naver.com', 1);

select * from nmj_member nm ;

-- nmj_member (매장 회원)
INSERT INTO nmj_member
	(mb_uid, mb_id, mb_pw, mb_name, mb_tel, mb_img_org, mb_img_sav, mb_email, mb_type)
VALUES
	(1,	"gomeilab",	"1234",	"고메이",	"010-1234-1234",	"",	"",	"gomeilab@gmail.com",	2                 ),
	(2,	"3popyeoksam",	"1234",	"쓰리팝역삼",	"010-1234-2234",	"",	"",	"3popyeoksam@gmail.com",	2     ),
	(3,	"irispc",	"1234",	"아이리스",	"010-1234-3234",	"",	"",	"irispc@gmail.com",	2                     ),
	(4,	"gameinners",	"1234",	"이너스",	"010-1234-4234",	"",	"",	"gameinners@gmail.com",	2             ),
	(5,	"3popgangnam",	"1234",	"쓰리팝강남",	"010-1234-5234",	"",	"",	"3popgangnam@gmail.com",	2     ),
	(6,	"peakpc",	"1234",	"픽",	"010-1234-6234",	"",	"",	"peakpc@gmail.com",	2                         ),
	(7,	"lioncitypc",	"1234",	"라이온",	"010-1234-7234",	"",	"",	"lioncitypc@gmail.com",	2             ),
	(8,	"ozpc",	"1234",	"오즈",	"010-1234-8234",	"",	"",	"ozpc@gmail.com",	2                             ),
	(9,	"wdgpc",	"1234",	"wdg",	"010-1234-9234",	"",	"",	"wdgpc@gmail.com",	2                         ),
	(10,	"chinchinpc",	"1234",	"친친",	"010-1234-0123",	"",	"",	"chinchinpc@gmail.com",	2             )
	;
select * from nmj_member nm;















-- nmj_store (매장 회원)
INSERT INTO nmj_store
	(store_uid, mb_uid, store_name, store_address,	store_tel, store_hours, store_content, store_img_org, store_img_sav, store_regNum, store_regImg_org, store_regImg_sav, store_lat, store_long, store_type, store_dtype, store_ratings, store_rateCount)
VALUES
	(1,	1,	"고메이랩",	"서울 강남구 논현로94길 30 2층",	"02-556-1273",	"00:00 ~ 24:00",	"오픈 1주년 기념 감사 할인 이벤트 1+1 이벤트를 진행 합니다.",	"gomeilab.png",	"gomeilab.png",	"123-12-12345",	"1231212345.png",	"1231212345.png",	37.50299,	127.038853,	1,	1,	4.5,	320),
	(),
	()
	;