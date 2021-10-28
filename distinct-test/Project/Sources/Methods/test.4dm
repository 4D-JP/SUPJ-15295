//%attributes = {}
If (Application type:C494=4D Remote mode:K5:5)
	$file:=Folder:C1567(fk logs folder:K87:17).file("distinct")
	ds:C1482.startRequestLog($file)
End if 

$cField_2:=ds:C1482.Table_1.all().distinct("Field_2")

If (Application type:C494=4D Remote mode:K5:5)
	ds:C1482.stopRequestLog()
	SHOW ON DISK:C922($file.platformPath)
End if 