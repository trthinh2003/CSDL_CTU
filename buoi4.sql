CREATE TABLE  CGTRINH (
	STT_CTR int NOT NULL ,
	TEN_CTR varchar (20)  NULL ,
	DIACHI_CTR varchar (20)  NULL ,
	TINH_THANH varchar (15)  NULL ,
	KINH_PHI int NULL ,
	TEN_CHU varchar (20)  NULL ,
	TEN_THAU varchar (20)  NULL ,
	NGAY_BD date NULL 
) ;


CREATE TABLE  CHUNHAN (
	TEN_CHU varchar (20)  NOT NULL ,
	DCHI_CHU varchar (20)  NULL 
) ;


CREATE TABLE  CHUTHAU (
	TEN_THAU varchar (20)  NOT NULL ,
	TEL char (7)  NULL ,
	DCHI_THAU varchar (20)  NULL 
) ;


CREATE TABLE  CONGNHAN (
	HOTEN_CN varchar (20)  NOT NULL ,
	NAMS_CN int NULL ,
	NAM_VAO_N int NULL ,
	CH_MON varchar (10)  NULL 
) ;


CREATE TABLE  KTRUCSU (
	HOTEN_KTS varchar (20)  NOT NULL ,
	NAMS_KTS int NULL ,
	PHAI char (2)  NULL ,
	NOI_TN varchar (15)  NULL ,
	DCHI_LL_KTS varchar (30)  NULL 
) ;


CREATE TABLE  THAMGIA (
	HOTEN_CN varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	NGAY_TGIA date NULL ,
	SO_NGAY int NULL 
) ;


CREATE TABLE  THIETKE (
	HOTEN_KTS varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	THU_LAO int NULL 
) ;


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT PK_CGTRINH PRIMARY KEY  	(STT_CTR	)  ; 


ALTER TABLE  CHUNHAN ADD 
	CONSTRAINT PK_CHUNHAN PRIMARY KEY  (	TEN_CHU	)  ; 


ALTER TABLE  CHUTHAU ADD 
	CONSTRAINT PK_CHUTHAU PRIMARY KEY  (	TEN_THAU	)  ; 


ALTER TABLE  CONGNHAN ADD 
	CONSTRAINT PK_CONGNHAN PRIMARY KEY  (	HOTEN_CN	)  ; 


ALTER TABLE  KTRUCSU ADD 
	CONSTRAINT PK_KTRUCSU PRIMARY KEY  	(	HOTEN_KTS	)  ; 


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT PK_THAMGIA PRIMARY KEY  	(	HOTEN_CN,	STT_CTR	)  ; 


ALTER TABLE  THIETKE ADD 
	CONSTRAINT PK_THIETKE PRIMARY KEY  	(	HOTEN_KTS,	STT_CTR	)  ; 


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUNHAN FOREIGN KEY 	(	TEN_CHU	) REFERENCES  CHUNHAN (	TEN_CHU	);

ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUTHAU FOREIGN KEY 
	(	TEN_THAU	) REFERENCES  CHUTHAU (	TEN_THAU	);


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CGTRINH FOREIGN KEY 
	(		STT_CTR	) REFERENCES  CGTRINH (		STT_CTR	);

ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CONGNHAN FOREIGN KEY 
	(		HOTEN_CN	) REFERENCES  CONGNHAN (		HOTEN_CN	);


ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_CGTRINH FOREIGN KEY 	(STT_CTR) REFERENCES  CGTRINH (	STT_CTR	);

ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_KTRUCSU FOREIGN KEY 
	(	HOTEN_KTS	) REFERENCES  KTRUCSU (	HOTEN_KTS );


insert into  chunhan values ('so t mai du lich','54 xo viet nghe tinh');
insert into  chunhan values ('so van hoa thong tin','101 hai ba trung');
insert into  chunhan values ('so giao duc','29 duong 3/2');
insert into  chunhan values ('dai hoc can tho','56 duong 30/4');
insert into  chunhan values ('cty bitis','29 phan dinh phung');
insert into  chunhan values ('nguyen thanh ha','45 de tham');
insert into  chunhan values ('phan thanh liem','48/6 huynh thuc khan');


insert into  chuthau values ('cty xd so 6','567456','5 phan chu trinh');
insert into  chuthau values ('phong dich vu so xd','206481','2 le van sy');
insert into  chuthau values ('le van son','028374','12 tran nhan ton');
insert into  chuthau values ('tran khai hoan','658432','20 nguyen thai hoc');

insert into  congnhan values ('nguyen thi suu',   45 ,    60  ,'ho');
insert into  congnhan values ('vi chi a',   66  ,    87  ,'han');
insert into  congnhan values ('le manh quoc',   56  ,    71 ,'moc');
insert into  congnhan values ('vo van chin',   40 ,    52  ,'son');
insert into  congnhan values ('le quyet thang',   54  ,    74 ,'son');
insert into  congnhan values ('nguyen hong van',   50  ,    70   ,'dien');
insert into  congnhan values ('dang van son',   48,    65 ,'dien');


insert into  ktrucsu values ('le thanh tung',   1956          ,'1','tp hcm','25 duong 3/2 tp bien hoa');
insert into  ktrucsu values ('le kim dung',   1952          ,'0','ha noi','18/5 phan van tri tp can tho');
insert into  ktrucsu values ('nguyen anh thu',   1970          ,'0','new york usa','khu i dhct tp can tho');
insert into  ktrucsu values ('nguyen song do quyen',   1970          ,'0','tp hcm','73 tran hung dao tp hcm');
insert into  ktrucsu values ('truong minh thai',   1950          ,'1','paris france','12/2/5 tran phu tp hanoi');

insert into  cgtrinh values 
( 1       ,'khach san quoc te','5 nguyen an ninh','can tho',450 ,'so t mai du lich','cty xd so 6','dec-13-1994'); 
insert into  cgtrinh values 
( 2       ,'cong vien thieu nhi','100 nguyen thai hoc','can tho',   200         ,'so van hoa thong tin','cty xd so 6','may-08-1994'); 
insert into  cgtrinh values 
( 3       ,'hoi cho nong nghiep','bai cat','vinh long',   1000        ,'so t mai du lich','phong dich vu so xd','jun-10-1994'); 
insert into  cgtrinh values 
( 4       ,'truong mg mang non','48 cm thang 8','can tho',   30          ,'so giao duc','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 5       ,'khoa trong trot dhct','khu ii dhct','can tho',   3000        ,'dai hoc can tho','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 6       ,'van phong bitis','25 phan dinh phung','ha noi',   40          ,'cty bitis','le van son','oct-05-1994'); 
insert into  cgtrinh values 
( 7       ,'nha rieng 1','124/5 nguyen trai','tp hcm',   65          ,'nguyen thanh ha','phong dich vu so xd','nov-15-1994'); 
insert into  cgtrinh values 
( 8       ,'nha rieng 2','76 chau van liem','ha noi',   100         ,'phan thanh liem','tran khai hoan','sep-06-1994'); 

insert into  thamgia values ('nguyen thi suu',   2       ,'may-08-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   4       ,'sep-07-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   1       ,'dec-15-1994',   5           );
insert into  thamgia values ('le manh quoc',   1       ,'dec-18-1994',   6           );
insert into  thamgia values ('vo van chin',   2       ,'may-10-1994',   10          );
insert into  thamgia values ('le quyet thang',   2       ,'may-12-1994',   5           );
insert into  thamgia values ('nguyen hong van',   1       ,'dec-16-1994',   7           );
insert into  thamgia values ('nguyen hong van',   4       ,'sep-14-1994',   7           );
insert into  thamgia values ('dang van son',   3       ,'jun-10-1994',   18          );
insert into  thamgia values ('vo van chin',   3       ,'jun-10-1994',   10          );



insert into  thietke values ('le thanh tung',   1       ,    25          );
insert into  thietke values ('le kim dung',   5       ,    30          );
insert into  thietke values ('truong minh thai',   8       ,    18          );
insert into  thietke values ('le kim dung',   6       ,    40          );
insert into  thietke values ('nguyen anh thu',   3       ,    12          );
insert into  thietke values ('le thanh tung',   7       ,    10          );
insert into  thietke values ('nguyen song do quyen',   2       ,    6           );
insert into  thietke values ('truong minh thai',   6       ,    27          );
insert into  thietke values ('le kim dung',   4       ,    20          );
insert into  thietke values ('truong minh thai',   1       ,    12          );



--2. M? c�c b?ng d? li?u ?? xem ki?u d? li?u c?a t?ng tr??ng v� quan s�t d? li?u c?a
--t?ng b?ng
select * from ktrucsu;
select * from chuthau;
select * from chunhan;
select * from congnhan;
select * from cgtrinh;
select * from thamgia;
select * from thietke;

--3. H�y cho bi?t th�ng tin v? c�c ki?n tr�c s? c� h? l� L� v� sinh n?m 1956
select * 
from ktrucsu kts
where kts.hoten_kts like 'le%' and kts.nams_kts = '1956';

--4. H�y cho bi?t t�n c�c c�ng tr�nh b?t ??u trong kho?ng 1/9/1994 ??n 20/10/1994
select ct.ten_ctr
from cgtrinh ct
where ct.ngay_bd between to_date('1/9/1994', 'dd/mm/yyyy') and to_date('20/10/1994', 'dd/mm/yyyy');

--5. H�y cho bi?t t�n v� ??a ch? c�c c�ng tr�nh do ch? th?u �c�ng ty x�y d?ng s? 6� thi
--c�ng (ch� �: xem d? li?u ?? l?y ?�ng t�n c�ng ty x�y d?ng s? 6)
select ten_thau, dchi_thau
from chuthau
where ten_thau = 'cty xd so 6';

--6. T�m t�n v� ??a ch? li�n l?c c?a c�c ch? th?u thi c�ng c�ng tr�nh ? C?n Th? do ki?n
--tr�c s? L� Kim Dung thi?t k?
select distinct ct.ten_thau, dchi_thau, tel
from chuthau ct join cgtrinh c on ct.ten_thau = c.ten_thau
                join thietke k on c.stt_ctr = k.stt_ctr
where tinh_thanh = 'can tho' and hoten_kts = 'le kim dung';

--7. H�y cho bi?t n?i t?t nghi?p c?a c�c ki?n tr�c s? ?� thi?t k? c�ng tr�nh Kh�ch s?n
--qu?c t? ? C?n Th?
select kts.hoten_kts, kts.noi_tn
from ktrucsu kts, thietke tk, cgtrinh ct
where kts.hoten_kts = tk.hoten_kts
and tk.stt_ctr = ct.stt_ctr
and ct.ten_ctr like '%khach san quoc te%' and ct.tinh_thanh like '%can tho%';

--8. Cho bi?t h? t�n, n?m sinh v� n?m v�o ngh? c?a c�c c�ng nh�n c� chuy�n m�n h�n
--ho?c ?i?n ?� tham gia c�c c�ng tr�nh m� ch? th?u L� V?n S?n ?� tr�ng th?u
select cn.hoten_cn, nams_cn, nam_vao_n, ten_thau, ch_mon
from congnhan cn join thamgia t on cn.hoten_cn = t.hoten_cn
join cgtrinh ct on t.stt_ctr = ct.stt_ctr
where (ch_mon = 'han' or ch_mon = 'dien') and ten_thau = 'le van son';

--9. Nh?ng c�ng nh�n n�o ?� b?t ??u tham gia s�ng tr�nh Kh�ch s?n Qu?c t? ? C?n Th?
--trong giai ?o?n t? ng�y 15/12/1994 ??n 31/12/1994
select cn.hoten_cn
from cgtrinh ct, congnhan cn, thamgia tg
where ct.stt_ctr = tg.stt_ctr
and tg.hoten_cn = cn.hoten_cn
and ct.ten_ctr = 'khach san quoc te' and ct.tinh_thanh = 'can tho'
and tg.ngay_tgia between to_date('15/12/1994', 'dd/mm/yyyy') and to_date('31/12/1994', 'dd/mm/yyyy');

--10. Cho bi?t h? t�n v� n?m sinh c?a c�c ki?n tr�c s? ?� t?t nghi?p ? TP HCM v� ?� thi?t
--k? �t nh?t m?t c�ng tr�nh c� kinh ph� ??u t? tr�n 400 tri?u ??ng
select kt.hoten_kts, nams_kts, noi_tn, kinh_phi
from ktrucsu kt, thietke tk, cgtrinh ct
where kt.hoten_kts = tk.hoten_kts
and tk.stt_ctr = ct.stt_ctr
and noi_tn = 'tp hcm' and kinh_phi > 400;

--11. T�m h? t�n v� chuy�n m�n c?a c�c c�ng nh�n tham gia c�c c�ng tr�nh do ki?n tr�c
--s? L� Thanh T�ng thi?t k?
select cn.hoten_cn, cn.ch_mon, hoten_kts
from congnhan cn, thamgia t, thietke k
where cn.hoten_cn = t.hoten_cn
and t.stt_ctr = k.stt_ctr
and hoten_kts = 'le thanh tung';

--12. Cho bi?t t�n c�ng tr�nh c� kinh ph� cao nh?t
select ten_ctr, kinh_phi
from cgtrinh
where kinh_phi = (select max(kinh_phi) from cgtrinh);

--13. Cho bi?t h? t�n ki?n tr�c s? tr? tu?i nh?t
select hoten_kts kientrucsu_tretuoinhat
from ktrucsu
where nams_kts = (select min(nams_kts) from ktrucsu);

--14.T�m t?ng kinh ph� c?a c�c c�ng tr�nh theo t?ng ch? th?u
select ten_thau, ten_chu, sum(kinh_phi) tongkinhphi
from cgtrinh
group by ten_chu, ten_thau;

--15. T�m t�n v� ??a ch? nh?ng ch? th?u ?� tr�ng th?u c�ng tr�nh c� kinh ph� th?p nh?t
select ctr.ten_chu, cth.ten_thau, dchi_thau, kinh_phi
from chuthau cth, cgtrinh ctr
where cth.ten_thau = ctr.ten_thau
and kinh_phi = (select min(kinh_phi) from cgtrinh);

--16. Cho bi?t h? t�n c�c ki?n tr�c s? c� t?ng th� lao thi?t k? c�c c�ng tr�nh l?n h?n 25
--tri?u
select hoten_kts, sum(thu_lao) tongthulao
from thietke
group by hoten_kts having sum(thu_lao) > 25;

--17. Cho bi?t s? l??ng c�c ki?n tr�c s? c� t?ng th� lao thi?t k? c�c c�ng tr�nh l?n h?n 25
--tri?u
select count(*) sokientrucsu_cothulaolonnhat
from (
    select hoten_kts, sum(thu_lao) tongthulao
    from thietke
    group by hoten_kts having sum(thu_lao) > 25
);

--18. T�nh s? c�ng tr�nh m� m?i ki?n tr�c s? ?� thi?t k?
select hoten_kts, count(*) socongtrinh
from thietke 
group by hoten_kts;

--19. T�nh t?ng s? c�ng nh�n ?� tham gia m?i c�ng tr�nh
select ten_ctr, count(*) tongsocongnhan_thamgia
from thamgia tg, cgtrinh ct
where tg.stt_ctr = ct.stt_ctr
group by tg.stt_ctr, ten_ctr;

--20. T�m t�n v� ??a ch? c�ng tr�nh c� t?ng s? c�ng nh�n tham gia nhi?u nh?t
select ten_ctr, diachi_ctr, socn
from (
    select ct.ten_ctr, ct.diachi_ctr, count(*) socn 
    from cgtrinh ct, thamgia t
    where ct.stt_ctr = t.stt_ctr
    group by ten_ctr, diachi_ctr
)
where socn = (select max(socn) from (select ct.ten_ctr, ct.diachi_ctr, count(*) socn 
                                                          from cgtrinh ct, thamgia t
                                                          where ct.stt_ctr = t.stt_ctr
                                                          group by ten_ctr, diachi_ctr
                                                          )
);

--21. Cho bi?t t�n c�c th�nh ph? v� kinh ph� trung b�nh c?a c�c c�ng tr�nh c?a t?ng th�nh
--ph? t??ng ?ng
select tinh_thanh, avg(kinh_phi) kinhphitb
from cgtrinh
group by tinh_thanh;

--22. Cho bi?t t�n v� ??a ch? c?a c�c c�ng tr�nh m� c�ng nh�n Nguy?n H?ng V�n ?ang
--tham gia v�o ng�y 18/12/1994
select ten_ctr, diachi_ctr
from cgtrinh c join thamgia t on c.stt_ctr = t.stt_ctr
where lower(hoten_cn) = 'nguyen hong van' 
and to_date('18/12/1994', 'dd/mm/yyyy')  between ngay_tgia and ngay_tgia + so_ngay;

--23. Cho bi?t h? t�n ki?n tr�c s? v?a thi?t k? c�c c�ng tr�nh do Ph�ng d?ch v? S? X�y
--d?ng thi c�ng, v?a thi?t k? c�c c�ng tr�nh do ch? th?u L� V?n S?n thi c�ng
select tk.hoten_kts
from thietke tk, cgtrinh ct
where tk.stt_ctr = ct.stt_ctr
and ten_thau like '%phong dich vu so xd%'
intersect
select tk.hoten_kts
from thietke tk, cgtrinh ct
where tk.stt_ctr = ct.stt_ctr
and ten_thau like '%le van son%';

--24. Cho bi?t h? t�n c�c c�ng nh�n c� tham gia c�c c�ng tr�nh ? C?n Th? nh?ng kh�ng
--tham gia c�ng tr�nh ? V?nh Long
select hoten_cn
from thamgia t, cgtrinh c
where c.stt_ctr = t.stt_ctr
and lower(tinh_thanh) = 'can tho'
minus
select hoten_cn
from thamgia t, cgtrinh c
where c.stt_ctr = t.stt_ctr
and lower(tinh_thanh) = 'vinh long';

--25. Cho bi?t t�n c?a c�c ch? th?u ?� thi c�ng c�c c�ng tr�nh c� kinh ph� l?n h?n t?t c?
--c�c c�ng tr�nh do ch? th?u Ph�ng d?ch v? s? x�y d?ng thi c�ng
select ten_thau
from cgtrinh
where kinh_phi > ALL(select kinh_phi from cgtrinh where ten_thau = 'phong dich vu so xd');

--26. Cho bi?t h? t�n c�c ki?n tr�c s? c� th� lao thi?t k? cho m?t c�ng tr�nh n�o ?� d??i
--gi� tr? trung b�nh th� lao thi?t k? c?a c�c KTS.
select distinct hoten_kts
from thietke 
where thu_lao < (select avg(thu_lao) from thietke);

--27. Cho bi?t h? t�n c�c c�ng nh�n c� t?ng s? ng�y tham gia v�o c�c c�ng tr�nh l?n h?n
--t?ng s? ng�y tham gia c?a c�ng nh�n Nguy?n H?ng V�n
select *
from (
    select hoten_cn, sum(so_ngay) songay
    from thamgia 
    group by hoten_cn
)
where songay > (
    select sum(so_ngay) songay
    from thamgia 
    where hoten_cn = 'nguyen hong van'
);

--28. Cho bi?t h? t�n c�ng nh�n c� tham gia t?t c? c�c c�ng tr�nh
select hoten_cn, count(*) 
from thamgia
group by hoten_cn having count(*) = (select count(*) from cgtrinh);

--29. Cho bi?t h? t�n c�ng nh�n c� tham gia t?t c? c�c c�ng tr�nh
select distinct c.ten_thau, c1.ten_thau 
from cgtrinh c, cgtrinh c1
where c.tinh_thanh = c1.tinh_thanh
and c.ten_thau < c1.ten_thau;

--30. T�m c�c c?p t�n c?a c�c c�ng nh�n c� lamg vi?c chung v?i nhau trong �t nh?t l� hai
--c�ng tr�nh
select distinct t.hoten_cn, t1.hoten_cn 
from thamgia t, thamgia t1 
where t.stt_ctr = t1.stt_ctr
and t.hoten_cn < t1.hoten_cn
group by t.hoten_cn, t1.hoten_cn having count(*) > 1;







