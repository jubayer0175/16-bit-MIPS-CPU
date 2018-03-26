# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.cache/wt} [current_project]
set_property parent.project_path {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/ADDER.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/ALU.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/CPU.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/Cont.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/InsMemory.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/MUX.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/MUX3.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/MyPC.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/PC.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/Reg.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/SignExtend.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/dataMemory.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/imports/new/display.v}
  {C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/sources_1/new/Test_PC.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/constrs_1/imports/Xilinx/Nexys4DDR_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/mzm0175/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/project_CPU.srcs/constrs_1/imports/Xilinx/Nexys4DDR_Master.xdc}}]


synth_design -top Test_PC -part xc7a100tcsg324-1


write_checkpoint -force -noxdef Test_PC.dcp

catch { report_utilization -file Test_PC_utilization_synth.rpt -pb Test_PC_utilization_synth.pb }