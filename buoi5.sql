--1) Vẽ sơ đồ thông thương của các quan hệ
select * from caidat;
select * from khuvuc;
select * from loai;
select * from may;
select * from phanmem;
select * from phong;

--2) Loại của máy 'p8'
select l.tenloai
from may m, loai l
where m.idloai = l.idloai
and m.idmay = 'p8';

--3) Tên của các phần mềm 'UNIX
select tenpm
from phanmem
where idloai = 'UNIX';

--4) Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS'
select distinct p.tenphong, p.ip, p.mp
from phong p join may m on p.mp = m.mp
where m.idloai = 'UNIX' or m.idloai = 'PCWS';

--5) Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS' ở
--khu vực '130.120.80', sắp xếp kết quả tăng dần theo mã phòng
select distinct p.mp, p.tenphong, p.ip
from phong p, may m
where p.mp = m.mp and m.idloai = 'UNIX' or m.idloai = 'PCWS'
and p.ip = '130.120.80'
order by p.mp;

--6) Số các phần mềm được cài đặt trên máy 'p6'
select count(*) sophanmemcaidattrenmayp6
from caidat
where idmay = 'p6';

--7) Số các máy đã cài phần mềm 'log1'
select count(*) somaycaidatphanmemlog1
from caidat
where idpm= 'log1';

--8) Tên và địa chỉ IP (ví dụ: 130.120.80.1) đầy đủ của các máy loại 'TX'
select idmay, ip || '.' || ad tenvadiachidaydu
from may
where idloai = 'TX';

--9) Tính số phần mềm đã cài đặt trên mỗi máy
select idmay, count(*) sophanmemdacaidat
from caidat
group by idmay;

--10) Tính số máy mỗi phòng
select mp, somay
from phong
order by mp;

--11) Tính số cài lần cài đặt của mỗi phần mềm trên các máy khác nhau
select idpm, count (*) socaidat
from caidat
group by idpm;

--12) Giá trung bình của các phần mềm 'UNIX'
select avg(gia) giatrungbinh
from phanmem
where idloai = 'UNIX';

--13) Ngày mua phần mềm gần nhất
select max(ngaymua) ngaymuaphanmemgannhat
from phanmem;

--14) Số máy có ít nhất 2 phần mềm
select idmay, count(*) sophanmem
from caidat
group by idmay
having count(*) >= 2;

--15) Tìm các loại không thuộc loại máy
select *
from loai
where idloai not in (select idloai from may);

--16) Tìm các loại thuộc cả hai loại máy và loại phần mềm
select idloai
from loai l
where idloai in (select idloai from may)
and idloai in (select idloai from phanmem);

--17) Tìm các loại máy không phải là loại phần mềm
select idloai
from loai
where idloai not in (select idloai from phanmem);

--18) Địa chỉ IP đầy đủ của các máy cài phần mềm 'log6'
select idpm, ip || '.' || ad ipdaydu
from caidat cd join may m on cd.idmay = m.idmay
where idpm = 'log6';

--19) Địa chỉ IP đầy đủ của các máy cài phần mềm tên 'Oracle 8'
select m.idmay, pm.tenpm, ip ||'.'|| ad ipdaydu
from caidat cd join may m on cd.idmay = m.idmay join phanmem pm on cd.idpm = pm.idpm
where tenpm = 'Oracle 8';

--20) Tên của các khu vực có chính xác 3 máy loại 'TX'
select tenkhuvuc ,count(*) somay
from (select tenkhuvuc, idmay, idloai from khuvuc k, may m where k.ip = m.ip and idloai = 'TX')
group by tenkhuvuc 
having count(*) = 3;

--21) Tên phòng có ít nhất một máy cài phần mềm tên 'Oracle 6'
select  tenphong ,tenpm
from phong p, may m, caidat cd, phanmem p
where p.mp = m.mp 
and m.idmay = cd.idmay 
and cd.idpm = p.idpm
and tenpm = 'Oracle 6';

--22) Tên phần mềm được mua gần nhất
select tenpm, ngaymua ngaymuagannhat
from phanmem
where ngaymua = (select max(ngaymua) from phanmem);

--23) Tên của phần mềm PCNT có giá lớn hơn bất kỳ giá của một phần mềm UNIX nào
select tenpm, gia
from phanmem
where idloai = 'PCNT'
and gia > (select min(gia) from phanmem where  idloai = 'UNIX');

--24) Tên của phần mềm UNIX có giá lớn hơn tất cả các giá của các phần mềm PCNT
select tenpm, gia
from phanmem
where idloai = 'UNIX'
and gia > (select max(gia) from phanmem where  idloai = 'PCNT');

--25) Tên của máy có ít nhất một phần mềm chung với máy 'p6'
select distinct cd.idmay, tenmay
from caidat cd join may m on cd.idmay = m.idmay
where cd.idmay  <> 'p6'
and idpm in (select idpm from caidat where idmay = 'p6');

--26) Tên của các máy có cùng phần mềm như máy 'p6' (có thể nhiều phần mềm hơn
--máy 'p6')
--p12, p8, //p6
select m.tenmay, m.idmay
from may m, caidat cd, (select idpm from caidat where idmay = 'p6') tmp 
where cd.idpm = tmp.idpm and m.idmay =  cd.idmay
and cd.idmay <> 'p6'
group by m.tenmay, m.idmay
having count(cd.idpm) >= (select count(idpm) from caidat where idmay = 'p6');

--27) Tên của các máy có chính xác các phần mềm như máy 'p2'
--p1
create table cau27 as 
                                select m.tenmay, m.idmay
                                from may m, caidat cd, (select idpm from caidat where idmay = 'p2') tmp 
                                where cd.idpm = tmp.idpm and m.idmay =  cd.idmay
                                and cd.idmay <> 'p2'
                                group by m.tenmay, m.idmay
                                having count(cd.idpm) = (select count(idpm) from caidat where idmay = 'p2');
select *
from cau27
where idmay in (select idmay
                          from caidat 
                          where idmay <> 'p2' 
                          group by idmay
                          having count(*) = (select count(*) from caidat where idmay = 'p2'));
drop table cau27;                          
