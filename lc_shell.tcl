
read_lib $::env(LIB_FILE).lib

write_lib $::env(LIB_FILE) -format db -output $::env(LIB_FILE).db

exit
