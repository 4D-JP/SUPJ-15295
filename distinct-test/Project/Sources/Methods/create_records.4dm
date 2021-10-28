//%attributes = {}
TRUNCATE TABLE:C1051([Table_1:1])
SET DATABASE PARAMETER:C642([Table_1:1]; Table sequence number:K37:31; 0)
$count:=100000
$values:=Split string:C1554("alpha,beta,gamma,delta"; ",")
For ($i; 1; $count)
	$e:=ds:C1482.Table_1.new()
	$e.Field_2:=$values[Random:C100%$values.length]
	$e.save()
End for 