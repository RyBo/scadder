set origin_dir [file dirname [info script]]
set location_dir [pwd]
set hw_name "hw_platform"

if { $argc != 1 } { 
    puts "Must supply only one argument for the project name!"
    puts $argc
    return 1
}

set project_name $argv
puts "$origin_dir"
puts "Creating SDK Workspace..."
sdk set_workspace "$location_dir/build/$project_name.sdk"
sdk set_user_repo_path "$origin_dir/../"

sdk create_hw_project -name $hw_name -hwspec "$location_dir/build/$project_name.sdk/design_1_wrapper.hdf"

sdk import_projects "$origin_dir/../"

puts "Creating Board Support Packages..."
sdk create_bsp_project -name "CPU0_bsp" -hwproject $hw_name -proc "ps7_cortexa9_0" -os "standalone"
sdk create_bsp_project -name "MB0_bsp" -hwproject $hw_name -proc "microblaze_0" -os "standalone"
sdk create_bsp_project -name "RT1_bsp" -hwproject $hw_name -proc "microblaze_1" -os "standalone"
sdk create_bsp_project -name "RT2_bsp" -hwproject $hw_name -proc "microblaze_2" -os "standalone"

puts "Building project..."
sdk build
sdk clean
