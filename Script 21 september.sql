create schema trabajo_final_iviglia3 authorization xodccfvo;

create table trabajo_final_iviglia3.grupoEmpresarial(
	idGrupoEmpresarial VARCHAR(20) not null, --PK 
	nombre VARCHAR(20) not null
);

alter table trabajo_final_iviglia3.grupoEmpresarial
add constraint grupoEmpresarial_PK primary key (idGrupoEmpresarial);


create table trabajo_final_iviglia3.marca(
	idMarca varchar(20) not null, --PK 
	idGrupoEmpresarial varchar(20) not null, --fk grupoEmpresarial
	nombre varchar(20) not null
	
);

--pk 
alter table trabajo_final_iviglia3.marca
add constraint marca_PK primary key (idMarca);
--fk
alter table trabajo_final_iviglia3.marca
add constraint marca_idGrupoEmpresarial_FK
		foreign key (idGrupoEmpresarial)
		references trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial);


create table trabajo_final_iviglia3.divisas(
	idDivisas VARCHAR(20) not null, --PK  
	tipoDivisa VARCHAR(10) not null 
);

alter table trabajo_final_iviglia3.divisas
add constraint divisas_PK primary key (idDivisas);

create table trabajo_final_iviglia3.color(
	idColor varchar(20) not null, --pk  
	tipoColor varchar(20) not null
);

alter table trabajo_final_iviglia3.color
add constraint color_PK primary key (idColor);

create table trabajo_final_iviglia3.seguro(
	idSeguro varchar(20) not null, --pk  
	empresa varchar(20) not null
);

alter table trabajo_final_iviglia3.seguro
add constraint seguro_PK primary key (idSeguro);

create table trabajo_final_iviglia3.modelo(
	idModelo varchar(20) not null, --pk  
	idMarca varchar(20) not null, --fk
	nombre varchar(20) not null 
);

alter table trabajo_final_iviglia3.modelo
add constraint modelo_PK primary key (idModelo);

alter table trabajo_final_iviglia3.modelo
add constraint modelo_idMarca_FK 
	foreign key (idMarca)
	references trabajo_final_iviglia3.marca (idMarca);

create table trabajo_final_iviglia3.coche(
	idCoche varchar(20) not null, --pk
	idModelo varchar(20) not null, --fk
	idColor varchar(20) not null, --fk
	idSeguro varchar(20) not null,--fk
	fechaAdquisicion date not null,
	kms varchar(20) not null,
	activo varchar (20) not null	
	
);

alter table trabajo_final_iviglia3.coche 
add column poliza varchar(20) not null;

alter table trabajo_final_iviglia3.coche
add constraint coche_PK primary key (idCoche);

alter table trabajo_final_iviglia3.coche
add constraint coche_idModelo_FK
	foreign key (idModelo)
	references trabajo_final_iviglia3.modelo (idModelo);

alter table trabajo_final_iviglia3.coche
add constraint coche_idColor_FK
	foreign key (idColor)
	references trabajo_final_iviglia3.color (idColor);

alter table trabajo_final_iviglia3.coche
add constraint coche_idSeguro_FK
	foreign key (idSeguro)
	references trabajo_final_iviglia3.seguro (idSeguro);

create table trabajo_final_iviglia3.historicoCoche(
	idCoche varchar(20) not null, --fk
	ordinal varchar (20)not null, -- pk
	kmsEnrevision varchar(20) not null,
	fechaRevision date not null,
	importeRevision integer not null,
	idDivisas VARCHAR(20) not null --fk
	
);



alter table trabajo_final_iviglia3.historicoCoche
add constraint historicoCoche_idCoche_FK
	foreign key (idCoche)
	references trabajo_final_iviglia3.coche (idCoche);

alter table trabajo_final_iviglia3.historicoCoche
add constraint historicoCoche_PK primary key (ordinal);

alter table trabajo_final_iviglia3.historicoCoche
add constraint historicoCoche_idDivisas_FK
	foreign key (idDivisas)
	references trabajo_final_iviglia3.divisas (idDivisas);

create table trabajo_final_iviglia3.matricula(
	idCoche varchar(20) not null, --fk
	pais varchar(20) not null, 
	numMatricula varchar(20) not null --pk
	
);

alter table trabajo_final_iviglia3.matricula
add constraint matricula_idCoche_FK
	foreign key (idCoche)
	references trabajo_final_iviglia3.coche (idCoche);
alter table trabajo_final_iviglia3.matricula
add constraint numMatricula_PK primary key (numMatricula);

--cargo los datos a las tablas

insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('01', 'Blanco');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('02', 'Rojo');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('03', 'Azul');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('04', 'Negro');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('05', 'Gris');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('06', 'Verde');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('07', 'Naranja');
insert into trabajo_final_iviglia3.color(idColor, tipoColor) 
values ('08', 'Rosado');

insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('01', 'Volkswagen GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('02', 'BMW GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('03', 'GM GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('04', 'FCA GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('05', 'Renault GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('06', 'Daimler GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('07', 'PSA GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('08', 'Ford GE');
insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('09', 'Tata GE');

insert into trabajo_final_iviglia3.grupoEmpresarial (idGrupoEmpresarial, nombre)
values('10', 'Honda GE');

insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M001', '01', 'Seat');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M002', '01', 'Audi');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M003', '01', 'Volkswagen');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M004', '01', 'Porsche');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M005', '02', 'BMW');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M006', '02', 'Mini');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M007', '03', 'Chevrolet');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M008', '03', 'GMC');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M009', '03', 'Holden');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M010', '04', 'Chrysler');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M011', '04', 'Fiat');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M012', '04', 'Jeep');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M013', '04', 'RAM');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M014', '04', 'Dodge');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M015', '05', 'Dacia');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M016', '05', 'Renault');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M017', '05', 'Lada');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M018', '06', 'Smart');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M019', '06', 'Mercedes Benz');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M020', '07', 'Peugeot');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M021', '07', 'Citroen');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M022', '08', 'Ford');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M023', '09', 'Land Rover');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M024', '09', 'Jaguar');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M025', '10', 'Honda');
insert into trabajo_final_iviglia3.marca (idmarca, idgrupoempresarial, nombre)
values('M026', '10', 'Acura');

insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I001','M001','Ibiza');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I002','M001','Arona');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I003','M002','A1');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I004','M002','A3');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I005','M002','A5');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I006','M003','Gol');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I007','M003','Golf');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I008','M003','Amarok');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I009','M004','911');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I010','M005','X1');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I011','M005','X3');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I012','M005','X6');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I013','M006','Mini Cooper');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I014','M007','S10');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I015','M007','Captiva');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I016','M007','Spark');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I017','M008','Sierra');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I018','M008','Yukon');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I019','M009','Wagon');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I020','M010','PT Cruiser');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I021','M010','300C');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I022','M011','500');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I023','M011','Punto');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I024','M011','Palio');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I025','M011','Sienna');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I026','M012','Renegatte');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I027','M012','Rubicon');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I028','M013','1500');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I029','M013','2500');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I030','M014','Journey');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I031','M015','Sandman');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I032','M015','Jogger');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I033','M016','Duster');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I034','M016','Kwid');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I035','M016','Koleos');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I036','M017','Niva');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I037','M018','Fortwo');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I038','M018','Forfour');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I039','M019','Clase A');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I040','M019','Clase C');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I041','M019','Clase A AMG');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I042','M020','207');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I043','M020','208');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I044','M020','307');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I045','M021','C3');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I046','M021','DS3');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I047','M021','DS4');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I048','M022','Ka');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I049','M022','Fiesta');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I050','M023','Evoque');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I051','M024','XF');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I052','M025','Civic');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I053','M025','Accord');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I054','M025','CRV');
insert into trabajo_final_iviglia3.modelo (idmodelo, idmarca, nombre) values ('I055','M026','NSX');



insert into trabajo_final_iviglia3.divisas (iddivisas, tipodivisa) values ('D01', 'EUR');
insert into trabajo_final_iviglia3.divisas (iddivisas, tipodivisa) values ('D02', 'USD');


insert into trabajo_final_iviglia3.seguro (idseguro, empresa) values ('S001', 'MAPFRE');
insert into trabajo_final_iviglia3.seguro (idseguro, empresa) values ('S002', 'FEDERACION PATRONAL');
insert into trabajo_final_iviglia3.seguro (idseguro, empresa) values ('S003', 'MMT');
insert into trabajo_final_iviglia3.seguro (idseguro, empresa) values ('S004', 'AXA');
insert into trabajo_final_iviglia3.seguro (idseguro, empresa) values ('S005', 'PROVINCIA SEGUROS');

insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X001','I001','01','S003','04/04/2012','334341','SI','MMT12432433');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X002','I033','01','S003','05/05/2012','432323','SI','MMT12432100');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X003','I045','03','S003','02/03/2013','330000','SI','MMT12992100');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X004','I010','05','S002','11/11/2013','123344','SI','FP700123');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X005','I003','05','S002','05/12/2013','153454','SI','FP712323');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X006','I007','04','S002','03/02/2014','334341','SI','FP783432');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X007','I050','06','S002','03/12/2014','234234','SI','FP874390');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X008','I052','02','S001','01/02/2015','311231','SI','MFRE10280');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X009','I044','02','S001','01/07/2015','125043','SI','MFRE10390');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X010','I054','02','S002','01/10/2015','157000','SI','FP880234');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X011','I037','04','S001','02/01/2016','187343','SI','MFRE10493');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X012','I017','04','S001','03/03/2016','231987','SI','MFRE10499');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X013','I019','04','S003','06/06/2017','255983','SI','MMT13892100');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X014','I018','01','S004','11/11/2017','278122','SI','AXA10400');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X015','I034','02','S005','12/12/2017','173054','SI','PS1023934');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X016','I051','02','S001','01/02/2018','143943','SI','MFRE10490');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X017','I047','02','S002','04/05/2018','90561','SI','FP883390');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X018','I023','06','S002','05/07/2018','97898','SI','FP888382');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X019','I029','06','S002','08/08/2018','74989','SI','FP889391');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X020','I003','08','S003','12/09/2018','51031','SI','MMT14892100');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X021','I004','05','S004','12/23/2018','87453','SI','AXA10708');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X022','I004','03','S001','03/02/2019','91045','SI','MFRE10567');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X023','I018','04','S001','01/05/2019','45098','SI','MFRE10768');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X024','I021','04','S001','01/06/2020','30123','SI','MFRE11763');
insert into trabajo_final_iviglia3.coche(idcoche, idmodelo, idcolor, idseguro, fechaadquisicion,kms,activo,poliza) values('X025','I017','01','S002','01/07/2021','17093','SI','FP899344');


insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X001','Espana','AA104NM');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X002','Espana','AA999ZA');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X003','Francia','AB343AN');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X004','Portugal','AD323NF');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X005','Portugal','AD934ZZ');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X006','Espana','BA132AT');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X007','Belgica','BB987OP');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X008','Belgica','BC123OP');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X009','Italia','BD983NM');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X010','Espana','BT324JK');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X011','Espana','CA234HJ');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X012','Portugal','CB341SJ');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X013','Portugal','CP123OP');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X014','Espana','DA834NB');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X015','Espana','DF343GH');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X016','Espana','DP333NN');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X017','Francia','EA544GH');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X018','Portugal','EY111AA');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X019','Italia','EY923AH');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X020','Italia','FG122AA');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X021','Belgica','FG943AT');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X022','Espana','FG123ES');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X023','Portugal','FZ999AE');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X024','Italia','FZ934AZ');
insert into trabajo_final_iviglia3.matricula(idcoche, pais, nummatricula) values('X025','Italia','HI444AS');

insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X001','N1-01','10500','12/04/2012','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X002','N2-01','10250','02/02/2013','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X003','N3-01','10097','07/06/2013','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X004','N4-01','10296','10/10/2014','55','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X001','N1-02','21700','11/11/2014','80','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X002','N2-02','20100','12/12/2014','80','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X005','N5-01','10700','12/12/2014','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X006','N6-01','10500','12/12/2014','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X007','N7-01','10123','04/04/2015','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X003','N3-02','31000','04/10/2015','120','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X008','N8-01','10123','06/06/2015','50','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X009','N9-01','9099','12/20/2015','90','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X001','N1-03','32029','12/21/2015','80','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X010','N10-01','9983','03/03/2016','70','D01');
insert into trabajo_final_iviglia3.historicocoche (idcoche, ordinal, kmsenrevision, fecharevision, importerevision, iddivisas) values('X011','N11-01','9934','02/02/2017','70','D01');

