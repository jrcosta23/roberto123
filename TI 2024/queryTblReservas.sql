SELECT 
concat(codigoSala, " - ", numeroSala) as Sala,
responsavelReserva as Responsável, 
date_format(inicioReserva, "%d/%m/%Y") as "Data Inicio", 
date_format(fimReserva, "%d/%m/%Y") as "Data Fim",
date_format(inicioReserva, "%k:%i") as "Hora Inicio",
 date_format(fimReserva, "%k:%i") as "Hora Fim"
from reservas r
right join salas s
on r.idSala = s.idSala
where inicioReserva = current_date()
order by numeroSala;

select * from salas;

select * from reservas;

use dbCoworking;