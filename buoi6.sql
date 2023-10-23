--1. Thêm khóa chính cho các bảng đã cho
--Đặt thuộc tính "ten" là khóa ngoài của bảng LUI_TOI và AN
--Thêm ràng buộc giá>0 cho cột "gia" của bảng PHUC_VU

alter table nguoi_an add primary key(ten);
alter table lui_toi add primary key(ten, quanpizza);
alter table an add primary key(ten, pizza);
alter table phuc_vu add primary key(quanpizza, pizza, gia);

alter table lui_toi add foreign key(ten) references nguoi_an;
alter table an add foreign key(ten) references nguoi_an;

alter table phuc_vu add check(gia > 0);

--2. Cho biết quán ‘Pizza Hut’ đã phục vụ các bánh pizza nào ?
select pizza
from phuc_vu
where quanpizza = 'Pizza Hut';

--3. Danh sách các bánh pizza mà các quán có bán ?
select quanpizza, pizza dscacbanh
from phuc_vu
order by quanpizza;

--4. Cho biết tên các quán có phục vụ các bánh pizza mà tên gồm chữ ‘m’
select quanpizza
from phuc_vu
where pizza like '%m';

--5. Tìm tên và tuổi của người ăn đã đến quán ‘Dominos’, sắp xếp kết quả giảm dần theo tuổi?
select na.ten, na.tuoi
from lui_toi lt, nguoi_an na
where lt.ten = na.ten
and lt.quanpizza = 'Dominos'
order by na.tuoi desc;

--6. Tìm tên quán pizza và số bánh pizza mà mỗi quán phục vụ ?
select quanpizza, count(*) so_banh_pizza
from phuc_vu
group by quanpizza;

--7. Tìm tên những quán pizza phục vụ pizza với giá cao nhất ?
select quanpizza, max(gia) giapizzacaonhat
from phuc_vu
group by quanpizza;

--8. Tìm tên các quán có phục vụ ít nhất một bánh pizza mà “Ian” thích ăn ?
select distinct quanpizza
from phuc_vu
where pizza in (select pizza from an where ten = 'Ian');

--9. Tìm tên các quán có phục vụ ít nhất một bánh mà “Eli” không thích ?
select distinct quanpizza
from phuc_vu
where pizza not in (select pizza from an where ten = 'Eli');

--10. Tìm tên các quán chỉ phục vụ các bánh mà “Eli” thích ?
select distinct quanpizza
from phuc_vu
minus
select distinct quanpizza
from phuc_vu
where pizza not in (select pizza from an where ten = 'Eli');

--11. Tên quán có phục vụ bánh với giá lớn hơn tất cả bánh phục vụ bởi quán ‘New York Pizza'
select distinct quanpizza
from phuc_vu
where quanpizza <> 'New York Pizza'
and gia > (select max(gia) from phuc_vu where quanpizza = 'New York Pizza');

--12. Tìm tên các quán chỉ phục vụ các bánh có giá nhỏ hơn 10 ?
select distinct quanpizza
from phuc_vu
where gia < 10 and quanpizza not in(select distinct quanpizza from phuc_vu where gia > 10);

--13. Tìm tên bánh được phục vụ bởi quán ‘New York Pizza’ và quán ‘Dominos'
select pizza 
from phuc_vu 
where quanpizza = 'New York Pizza'
intersect
select pizza
from phuc_vu 
where quanpizza = 'Dominos';

--14. Tìm tên bánh được phục vụ bởi quán ‘Little Caesars’ và không phục vụ bởi quán 'Pizza Hut'
select pizza 
from phuc_vu 
where quanpizza = 'Little Caesars'
minus
select pizza
from phuc_vu 
where quanpizza = 'Pizza Hut';

--15. Tìm tên các quán có phục vụ tất cả các loại bánh pizza?
select quanpizza, count(*) sobanhpizzaphucvu
from phuc_vu
group by quanpizza
having count(*) = (select count(*) from (select distinct pizza from phuc_vu));

--16. Tên quán phục vụ ít nhất 2 bánh pizza mà ‘Gus’ thích ?
select distinct quanpizza
from phuc_vu
where pizza in (select pizza from an where ten = 'Gus')
group by quanpizza
having count(pizza) >= 2;

--17. Tìm tên các quán có phục vụ tất cả các bánh mà ‘Ian’ thích
select quanpizza
from phuc_vu
where pizza in (select pizza from an where ten = 'Ian')
group by quanpizza
having count(*) = (select count(*) from (select pizza from an where ten = 'Ian'));

--18. Tên người ăn lui tới ít nhất 3 quán?
select ten
from lui_toi
group by ten having count(quanpizza) >= 3;

--19. Tính số loại pizza mà mỗi quán có bán ?
select quanpizza, count(*) soloaipizza
from phuc_vu
group by quanpizza;

--20. Tìm tên người ăn thích các bánh ít nhất là giống các bánh mà Hil thích ?
select ten
from an
where pizza in (select pizza from an where ten = 'Hil')
and ten <> 'Hil'
group by ten 
having count(*) >= (select count(*) from an where ten = 'Hil');