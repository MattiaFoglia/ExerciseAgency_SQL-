-- 1
SELECT Matricola, Cognome FROM Impiegato, Dipartimento
WHERE Impiegato.codice_dipartimento = dipartimento.codice
AND Stipendio >= 50000
AND Dipartimento.Nome = 'Sud'
;
-- 2
SELECT Cognome, Stipendio FROM Impiegato, Dipartimento
WHERE Impiegato.codice_dipartimento = dipartimento.codice
AND Sede = 'Napoli'
ORDER BY Stipendio 
;
-- 3
SELECT Cognome,Dipartimento.Nome 
FROM Impiegato, Dipartimento
;
-- 4
SELECT Cognome FROM Impiegato, Dipartimento,Partecipazione
WHERE matricola = matricola_Direttore
AND Partecipazione.impiegato = matricola
AND Impiegato.codice_dipartimento = dipartimento.codice
AND sigla_progetto = 'Alpha'
;
-- 5 
SELECT Progetto.Nome, Cognome FROM Impiegato, Progetto -- , Partecipazione
WHERE matricola = matricola_responsabile
-- AND Partecipazione.impiegato = matricola
ORDER BY Progetto.Nome DESC
;
-- 6
SELECT Sum(Bilancio) AS BilancioTot FROM Impiegato, Dipartimento,Progetto
WHERE Impiegato.codice_dipartimento = dipartimento.codice
AND matricola = matricola_Direttore
AND Sede = 'Milano'
;
-- 7
SELECT Distinct Progetto.Nome, Cognome FROM Impiegato, Dipartimento,Progetto,Partecipazione
WHERE Impiegato.codice_dipartimento = dipartimento.codice
AND matricola = Partecipazione.impiegato
AND matricola = matricola_Direttore
AND Bilancio >= 10000 
;

-- 8
SELECT Distinct ImpiegatoBase.Cognome FROM Impiegato AS Direttore ,Impiegato AS ImpiegatoBase, Dipartimento,Partecipazione
WHERE ImpiegatoBase.codice_dipartimento = Direttore.codice_dipartimento
AND Direttore.matricola = matricola_Direttore
AND ImpiegatoBase.matricola = Partecipazione.impiegato
AND ImpiegatoBase.Stipendio > Direttore.Stipendio
;

-- 9
SELECT Dipartimento.Nome FROM Impiegato, Dipartimento
WHERE Impiegato.codice_dipartimento = dipartimento.codice
AND Impiegato.stipendio > 60000
;

-- 10
SELECT ImpiegatoBase.Cognome FROM Impiegato AS Responsabile ,Impiegato AS ImpiegatoBase,Partecipazione,Progetto
WHERE Responsabile.matricola = Partecipazione.impiegato
AND Partecipazione.sigla_progetto = Progetto.sigla
AND Responsabile.matricola = matricola_responsabile
AND ImpiegatoBase.matricola = Partecipazione.impiegato
AND ImpiegatoBase.codice_dipartimento = Responsabile.codice_dipartimento
;

-- 11
SELECT Count(Progetto.Sigla)AS NumeroProgetti FROM Impiegato, Dipartimento, Progetto
WHERE  Impiegato.codice_dipartimento = dipartimento.codice
AND matricola = matricola_responsabile
AND sede = 'Palermo'