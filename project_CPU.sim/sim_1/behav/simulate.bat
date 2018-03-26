@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim MyPC_tb_behav -key {Behavioral:sim_1:Functional:MyPC_tb} -tclbatch MyPC_tb.tcl -view C:/Users/Sprkle/OneDrive - Auburn University/Academics/Compuer architecture/Project/project_CPU_RET_fixed _impl_seven_segment - demo/MyPC_tb_behav1.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
