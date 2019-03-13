/*Pregunta 1 del Test Business Intelligence & Data Science
 
a) �Cu�l es la proporci�n de escuelas de educaci�n secundaria privadas 
y del sector p�blico para la Ciudad de M�xico, el estado de Puebla y Jalisco? */

select * from dbo.EscuelasMexico
select count(_id_) from EscuelasMexico
select distinct _nombre_act_ from EscuelasMexico

select count(_id_) from EscuelasMexico 
where _nombre_act_ like '%secundaria%' and _nombre_act_ like '%p�blico%' and _entidad_ in ('CIUDAD DE M�XICO','PUEBLA','JALISCO');

select count(_id_) from EscuelasMexico 
where _nombre_act_ like '%secundaria%' and _nombre_act_ like '%privado%' and _entidad_ in ('CIUDAD DE M�XICO','PUEBLA','JALISCO');

/*b) �Cu�les son los 20 municipios con mayor n�mero de escuelas de educaci�n superior en el pa�s y a cu�l estado pertenecen?*/

select top 20 _municipio_,_entidad_ from dbo.EscuelasMexico 
where _nombre_act_ like '%educaci�n superior%' or _nombre_act_ like '%educaci�n t�cnica superior%'
Group by _municipio_,_entidad_
Order by count(_nombre_act_) desc;
