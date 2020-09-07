@copy "d:\gdal\bin\osgeo4w-setup.exe" "d:\gdal\bin\osgeo4w-setup-work.exe"
@start /b "Running with setup_test.ini" "d:\gdal\bin\osgeo4w-setup-work.exe" -R "d:\gdal" -t %*
