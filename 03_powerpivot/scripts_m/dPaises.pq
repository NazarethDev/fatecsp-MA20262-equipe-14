//dPaises
let
Fonte = cad_Etapa2{[Item = "dPaises", Kind = "Table"]}[Data],
Tipos = Table.TransformColumnTypes(Fonte, {
{"pais_cliente", type text}, {"Cod_padrao", type text}, {"Continente", type text}})
in
Tipos