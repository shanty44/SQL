select b.nombre as Modelo , 
c.nombre as Marca,
d.nombre as GrupoEmpresarial  , 
a.fechaadquisicion as FechaAdquisicion, 
f.nummatricula as Matricula ,
g.tipocolor as Color ,
a.kms ,  
e.empresa,
a.poliza 
from trabajo_final_iviglia.coche a , trabajo_final_iviglia.modelo b, trabajo_final_iviglia.marca c, trabajo_final_iviglia.grupoempresarial d, trabajo_final_iviglia.seguro e, trabajo_final_iviglia.matricula f, trabajo_final_iviglia.color g
where  activo = 'SI'
and a.idmodelo  = b.idmodelo 
and b.idmarca = c.idmarca 
and c.idgrupoempresarial = d.idgrupoempresarial 
and a.idseguro = e.idseguro 
and a.idcoche = f.idcoche 
and a.idcolor = g.idcolor 


