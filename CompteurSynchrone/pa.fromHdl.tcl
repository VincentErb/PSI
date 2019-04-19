
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name CompteurSynchrone -dir "/home/arens/CompteurSynchrone/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Compteur8bitSynchrone.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../Documents/TDMSC/TD1 VHDL/Compteur8bitSynchrone.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top Compteur8bitSynchrone $srcset
add_files [list {Compteur8bitSynchrone.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
