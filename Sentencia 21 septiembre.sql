select b.nombre as Modelo , 
c.nombre as Marca,
d.nombre as GrupoEmpresarial  , 
a.fechaadquisicion as FechaAdquisicion, 
f.nummatricula as Matricula ,
g.tipocolor as Color ,
a.kms ,  
e.empresa,
a.poliza 
from trabajo_final_iviglia3.coche a , trabajo_final_iviglia3.modelo b, trabajo_final_iviglia3.marca c, trabajo_final_iviglia3.grupoempresarial d, trabajo_final_iviglia3.seguro e, trabajo_final_iviglia3.matricula f, trabajo_final_iviglia3.color g
where  activo = 'SI'
and a.idmodelo  = b.idmodelo 
and b.idmarca = c.idmarca 
and c.idgrupoempresarial = d.idgrupoempresarial 
and a.idseguro = e.idseguro 
and a.idcoche = f.idcoche 
and a.idcolor = g.idcolor 


