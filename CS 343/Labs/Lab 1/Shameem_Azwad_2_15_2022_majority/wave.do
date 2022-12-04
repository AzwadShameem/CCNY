onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shameem_azwad_majority/x1
add wave -noupdate /shameem_azwad_majority/x2
add wave -noupdate /shameem_azwad_majority/x3
add wave -noupdate /shameem_azwad_majority/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148744 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {846231 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/shameem_azwad_majority/x1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/shameem_azwad_majority/x2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ns -dutycycle 50 -starttime 0ns -endtime 800ns sim:/shameem_azwad_majority/x3 
WaveCollapseAll -1
wave clipboard restore
