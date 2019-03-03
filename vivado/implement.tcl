set origin_dir [file dirname [info script]]

# Open project
open_project $origin_dir/../build/microblaze-ocm.xpr

# Synthesize project
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1

# Implement project
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
