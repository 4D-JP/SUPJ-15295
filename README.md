# SUPJ-15295
distinctの検証

* レコード作成

```4d
TRUNCATE TABLE([Table_1])
SET DATABASE PARAMETER([Table_1]; Table sequence number; 0)
$count:=100000
$values:=Split string("alpha,beta,gamma,delta"; ",")
For ($i; 1; $count)
	$e:=ds.Table_1.new()
	$e.Field_2:=$values[Random%$values.length]
	$e.save()
End for 
```

* Distinct

```4d
If (Application type=4D Remote mode)
	$file:=Folder(fk logs folder).file("distinct")
	ds.startRequestLog($file)
End if 

$cField_2:=ds.Table_1.all().distinct("Field_2")

If (Application type=4D Remote mode)
	ds.stopRequestLog()
	SHOW ON DISK($file.platformPath)
End if 
```
