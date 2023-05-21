select s.sucursal, venta, gasto, venta - gasto
from 
( select v.IdSucursal,  sum(v.precio*cantidad) venta
from venta v
where year(v.fecha)=2020 
group by v.IdSucursal ) vta -- ventas del 2020 por sucursal
inner join 
(select g.idsucursal, sum(g.monto) gasto
from gasto g
where year(g.fecha)=2020 
group by g.idsucursal) gto -- gastos del 2020 por sucursal
on (vta.IdSucursal = gto.IdSucursal)
inner join sucursal s
on (vta.idsucursal = s.IdSucursal)
order by 4 desc ;

#Media=2703.1324207
#N=16260
#10330.804402634296


#select count(((Cantidad*Precio)- 2703.13)/10330.80) AS monto_venta from venta where ((Cantidad*Precio)- 2703.13)/10330.80>3 or ((Cantidad*Precio)- 2703.13)/10330.80<-3 

#select count(((Cantidad*Precio)- 2703.13)/10330.80) AS monto_venta from venta where ((Cantidad*Precio)- 2703.13)/10330.80>3;


select max(v.Cantidad*v.Precio) as Venta, s.Sucursal from venta as v
INNER JOIN
sucursal as s ON v.IdSucursal=s.IdSucursal
group by s.Sucursal
order by max(v.Cantidad*v.Precio) desc;


select sum(Porcentanje) as porcentaje from quiroz where anio=2020

, rosas, centro








