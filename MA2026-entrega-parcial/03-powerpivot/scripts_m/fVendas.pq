//fVendas

let
Fonte = cad_Etapa2{[Item = "fVendas", Kind = "Table"]}[Data],
Tipos = Table.TransformColumnTypes(Fonte, {
{"order_id", type text}, {"order_date", type date}, {"Eh_Data_Dobrada", type text}, {"Cod_Pais", type text}, 
{"product_category", type text}, {"quantity", Int64.Type}, {"product_price", Currency.Type}, {"Valor_Desconto", Currency.Type},
{"Valor_Bruto", Currency.Type}, {"discounted_price", Currency.Type},{"payment_method", type text}, {"traffic_source", type text},
{"Aba_Origem", type text}, {"Linha_Origem", Int64.Type}})
in
Tipos