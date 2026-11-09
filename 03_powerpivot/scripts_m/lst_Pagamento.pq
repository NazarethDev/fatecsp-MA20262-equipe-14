//lst_Pagamento
let
Fonte = cad_Etapa2{[Item = "lst_Pagamento", Kind = "Table"]}[Data],
Tipos = Table.TransformColumnTypes(Fonte, {
{"lst_Pagamento", type text}})
in
Tipos