set origin_dir [file dirname [info script]]

if { $argc != 1 } { 
    puts "Must supply only one argument for the project name!"
    puts $argc
    return 1
}

set project_name $argv

# Open project
open_project $origin_dir/../build/$project_name.xpr

file mkdir $origin_dir/../build/$project_name.sdk
file copy -force $origin_dir/../build/$project_name.runs/impl_1/design_1_wrapper.sysdef $origin_dir/../build/$project_name.sdk/design_1_wrapper.hdf
