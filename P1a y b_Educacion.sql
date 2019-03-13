/*Pregunta 1 del Test Business Intelligence & Data Science
 
a) ¿Cuál es la proporción de escuelas de educación secundaria privadas 
y del sector público para la Ciudad de México, el estado de Puebla y Jalisco? */

select * from dbo.EscuelasMexico
select count(_id_) from EscuelasMexico
select distinct _nombre_act_ from EscuelasMexico

select count(_id_) from EscuelasMexico 
where _nombre_act_ like '%secundaria%' and _nombre_act_ like '%público%' and _entidad_ in ('CIUDAD DE MÉXICO','PUEBLA','JALISCO');

select count(_id_) from EscuelasMexico 
where _nombre_act_ like '%secundaria%' and _nombre_act_ like '%privado%' and _entidad_ in ('CIUDAD DE MÉXICO','PUEBLA','JALISCO');

/*b) ¿Cuáles son los 20 municipios con mayor número de escuelas de educación superior en el país y a cuál estado pertenecen?*/

select top 20 _municipio_,_entidad_ from dbo.EscuelasMexico 
where _nombre_act_ like '%educación superior%' or _nombre_act_ like '%educación técnica superior%'
Group by _municipio_,_entidad_
Order by count(_nombre_act_) desc;
