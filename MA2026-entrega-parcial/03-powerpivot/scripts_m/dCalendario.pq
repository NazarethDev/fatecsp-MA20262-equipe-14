//dCalendario - substitui Feriado (referência do prof) por DataDobrada
let
Inicio = #date(2023, 1, 1),
Fim = #date(2025, 6, 18),
Dias = List.Dates(Inicio, Duration.Days(Fim - Inicio) + 1, #duration(1, 0, 0, 0)),
Tabela = Table.FromList(Dias, Splitter.SplitByNothing(), type table [Data = date]),
Ano = Table.AddColumn(Tabela, "Ano", each Date.Year([Data]), Int64.Type),
Mes = Table.AddColumn(Ano, "Mes", each Date.Month([Data]), Int64.Type),
NomeMes = Table.AddColumn(Mes, "NomeMes", each Text.Proper(Date.MonthName([Data], "pt-BR")),
type text),
MesAbrev = Table.AddColumn(NomeMes, "MesAbrev", each Text.Start([NomeMes], 3), type text),
AnoMes = Table.AddColumn(MesAbrev, "AnoMes", each Date.ToText([Data], "yyyy-MM"), type text),
MesInicio = Table.AddColumn(AnoMes, "Mes_Inicio", each Date.StartOfMonth([Data]), type date),
Trimestre = Table.AddColumn(MesInicio, "Trimestre", each "T" & Text.From(Date.QuarterOfYear([
Data])), type text),
DiaSemana = Table.AddColumn(Trimestre, "DiaSemana", each Date.DayOfWeek([Data], Day.Monday) + 1,
Int64.Type),
NomeDia = Table.AddColumn(DiaSemana, "NomeDia", each Date.DayOfWeekName([Data], "pt-BR"), type
text),
FimDeSemana = Table.AddColumn(NomeDia, "FimDeSemana", each if [DiaSemana] >= 6 then "Sim" else "
Não", type text),
DataDobrada = Table.AddColumn(FimDeSemana, "DataDobrada", each if List.Contains(lst_DoubleDates, [Data])
then "Sim" else "Não", type text)
in
DataDobrada