
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name CompteurSynchrone -dir "/home/arens/CompteurSynchrone/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/arens/CompteurSynchrone/Compteur8bitSynchrone.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/arens/CompteurSynchrone} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Compteur8bitSynchrone.ucf" [current_fileset -constrset]
add_files [list {Compteur8bitSynchrone.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
