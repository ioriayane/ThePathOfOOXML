$name = Split-Path -Leaf (Convert-Path .)
$ext = $Args[0]
$out_path = ".\" + $name + "." + $ext
if (Test-Path ($out_path)) {
	Remove-Item -Path ($out_path)
}
Compress-Archive -Force -Path * -DestinationPath test.zip
Rename-Item -path .\test.zip -NewName ($out_path) -force
Start-Process ($out_path)
