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

* ログファイルの内容

```json
[{"sequenceNumber":-1,"url":"rest/Table_1?$method='entityset'&$top='1'","startTime":"2021-10-28T04:52:35.137Z","endTime":"2021-10-28T04:52:35.203Z","duration":66,"response":{"status":200,"body":{"__ENTITYSET":"/rest/Table_1/$entityset/AED1A1EFB4F445EF9EA8A4D8A884F4B3","__DATACLASS":"Table_1","__entityModel":"Table_1","__GlobalStamp":0,"__COUNT":100000,"__FIRST":0,"__ENTITIES":[{"__KEY":"1","__TIMESTAMP":"2021-10-28T04:48:25.346Z","__STAMP":1,"ID":1,"Field_2":"alpha"}],"__SENT":1}}}
,{"sequenceNumber":-1,"url":"rest/Table_1/$entityset/AED1A1EFB4F445EF9EA8A4D8A884F4B3/Field_2?$progress4Dinfo='B6B0F0FCB03443E4BB4099A78668F1E8'&$distinct='true'","startTime":"2021-10-28T04:52:35.204Z","endTime":"2021-10-28T04:52:35.301Z","duration":97,"response":{"status":200,"body":["alpha","beta","delta","gamma"]}}
```
