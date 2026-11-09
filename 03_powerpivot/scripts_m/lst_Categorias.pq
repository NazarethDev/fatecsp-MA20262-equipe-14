//lst_Categorias

let
Fonte = cad_Etapa2{[Item = "lst_Categoria", Kind = "Table"]}[Data],
Tipos = Table.TransformColumnTypes(Fonte, {
{"lst_Categoria", type text}})
in
Tipos