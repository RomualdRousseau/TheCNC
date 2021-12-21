include <global.scad>

use <hardware.scad>
use <electronic.scad>
use <fan.scad>

module usb_blug(solid_holes = 0, extended_ports = 0)
{
    if(solid_holes) {
        color("silver") translate([0.4, 0, 0.7]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 3);
        color("silver") translate([3.2, 0, 0.7]) rotate([90, 0, 0]) cylinder(d = 0.3, h = 3);
    }
    else {
        color("DarkSlateGray") cube([3.6, 2.7, 1.4]);
    }
    if(extended_ports) {
        color("silver") translate([1.2, -3, 0.15]) cube(size = [1.2, 3, 1.1]);
    }
}

module main_board(solid_holes = 1)
{
    if(solid_holes) {
        translate([25.15, 8.65, -7.5]) cylinder(d = 0.3, h = 3);
        translate([25.15, 3.5, -7.5]) cylinder(d = 0.3, h = 3);
        translate([3, 6, -7.5]) cylinder(d = 0.3, h = 3);
        translate([12.35, 6, -7.5]) cylinder(d = 0.3, h = 3);
        translate([0.35, 8.7, -7.5]) cylinder(d = 0.3, h = 3);
        translate([16.65, 8.7, -7.5]) cylinder(d = 0.3, h = 3);
    }
    else {
        // pcb
        color("DarkGreen") difference()
        {
            cube([25.5, 9, 0.15]);
            
            translate([0.35, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([0.35, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([4.65, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([4.65, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            
            translate([6.35, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([6.35, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([10.65, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([10.65, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            
            translate([12.35, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([12.35, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([16.65, 1.8, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([16.65, 8.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            
            translate([18.35, 1.85, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([18.35, 8.65, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([25.15, 1.85, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([25.15, 8.65, -0.1]) cylinder(d = 0.3, h = 0.3);
            
            translate([25.15, 3.5, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([3, 6, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([12.35, 6, -0.1]) cylinder(d = 0.3, h = 0.3);
        }
        
        translate([23.5, 6, 1.25]) rotate([180, 0, 180]) ft232rl();
        
        // spacers
        translate([25.15, 8.65, 0]) nut(d = 0.3, h = 5.5);
        translate([25.15, 3.5, 0]) nut(d = 0.3, h = 5.5);
        translate([3, 6, 0]) nut(d = 0.3, h = 5.5);
        translate([12.35, 6, 0]) nut(d = 0.3, h = 5.5);
        translate([0.35, 8.7, 0]) nut(d = 0.3, h = 5.5);
        translate([16.65, 8.7, 0]) nut(d = 0.3, h = 5.5);
    }
}

module output_board(solid_holes = 1, extended_ports = 1)
{
    if(solid_holes) {
        translate([0.3, 0.3, -2.8]) cylinder(d = 0.3, h = 3);
        translate([0.3, 2.7, -2.8]) cylinder(d = 0.3, h = 3);
        translate([11.7, 2.7, -2.8]) cylinder(d = 0.3, h = 3);
        translate([11.7, 0.3, -2.8]) cylinder(d = 0.3, h = 3);
    }
    else {
        // pcb
        color("DarkGreen")  difference()
        {
            cube([12, 3, 0.15]);
            translate([0.3, 0.3, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([0.3, 2.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([11.7, 2.7, -0.1]) cylinder(d = 0.3, h = 0.3);
            translate([11.7, 0.3, -0.1]) cylinder(d = 0.3, h = 0.3);
        }
        // inputs / outputs
        color("LimeGreen")
        {
            translate([1, 1.9, 0.15]) cube([2, 1.1, 0.9]);
            translate([4, 1.9, 0.15]) cube([2, 1.1, 0.9]);
            translate([7, 1.9, 0.15]) cube([2, 1.1, 0.9]);
            translate([10, 1.9, 0.15]) cube([1, 1.1, 0.9]);
        }
        // spacers
        translate([0.3, 0.3, 0]) nut(d = 0.3, h = 0.8);
        translate([0.3, 2.7, 0]) nut(d = 0.3, h = 0.8);
        translate([11.7, 2.7, 0]) nut(d = 0.3, h = 0.8);
        translate([11.7, 0.3, 0]) nut(d = 0.3, h = 0.8);
    }
    
    if(extended_ports) {
        translate([0.5, 3, -0.3]) cube([11, 2, 2]);
    }
}

module electronic(solid_holes = 0, extended_ports = 0)
{
    translate([0.01, 3, 0]) power_supply(solid_holes);
    translate([25.99, 5, 0.8]) rotate([0, 0, 90]) dcdc_step_down(spacer = true, solid_holes = solid_holes);
    translate([29.99, 5, 0.8]) rotate([0, 0, 90]) dcdc_step_down(spacer = true, solid_holes = solid_holes);

    translate([2, 10.5, 8.1]) rotate([180, 0, -90]) translate([-7.5, -5, -0.15]) step_motor_driver(spacer = true);
    translate([8, 10.5, 8.1]) rotate([180, 0, -90]) translate([-7.5, -5, -0.15]) step_motor_driver(spacer = true);
    translate([14, 10.5, 8.1]) rotate([180, 0, -90]) translate([-7.5, -5, -0.15]) step_motor_driver(spacer = true);
    translate([20, 10.5, 8.1]) pwm_motor_driver(spacer = true);

    translate([2, 9, 5.5]) main_board(solid_holes);
    translate([3, 16.99, 0.8]) output_board(solid_holes, extended_ports);
    
    translate([5, 9.5, 9.99]) fan(solid_holes);
    
    translate([23, 5, 11.11]) emergency_button();
    
    translate([20, 0.01, 9]) rotate([90, 90, 0]) switch(angle = 10, thickness = 0.32);
    translate([23, -0.31, 9]) rotate([90, 0, 0]) big_switch_push();
    translate([26, -0.31, 9]) rotate([90, 0, 0]) big_switch_push();
    
    translate([23.5, -0.61, 5]) rotate([90, 0, 0]) banna_plug("Red");
    translate([25.5, -0.61, 5]) rotate([90, 0, 0]) banna_plug("Black");
    
    translate([24.5, 20.01, 2.65]) rotate([-90, 0, 180]) power_plug(solid_holes);
    translate([21, 19.49, 4.15]) rotate([-90, 0, 0]) small_switch_push(thickness = 0.52);
    translate([23.9, 20.01, 4.75]) rotate([-90, 0, 180]) power_switch();
    translate([26.5, 19.49, 4.75]) rotate([0, 90, 180]) usb_blug(solid_holes, extended_ports);
}

module internal_frame(solid_holes = 0)
{
    if(solid_holes) {
        translate([1, 0.01, 1.5]) rotate([90, 0, 0]) cylinder(d = 0.5, h = 2);
        translate([1, 0.01, 10.5]) rotate([90, 0, 0]) cylinder(d = 0.5, h = 2);
        translate([29, 0.01, 1.5]) rotate([90, 0, 0]) cylinder(d = 0.5, h = 2);
        translate([29, 0.01, 10.5]) rotate([90, 0, 0]) cylinder(d = 0.5, h = 2);
    }
    
    color("Silver") 
    {
        translate([0.01, 0, 0]) tube([2, 2, 12.5], 0.6, solid_holes = solid_holes);
        translate([27.99, 0, 0]) tube([2, 2, 12.5], 0.6, solid_holes = solid_holes);
        translate([27.99, 18, 0]) tube([2, 2, 12.5], 0.6, solid_holes = solid_holes);
        translate([0.01, 18, 0]) tube([2, 2, 12.5], 0.6, solid_holes = solid_holes);
    }
}

module power_panel(solid_holes = 0)
{
    if(solid_holes) {
        translate([19.35, 19.999, 0.5]) cube([8, 2, 5.5]);
    }
    else {
        translate([18.85, 19.5, 0.5]) cube([9, 0.5, 6]);
        translate([19.35, 19.5, 0]) cube([8, 0.5, 0.5]);
    }
    
    translate([18.85, 17.5, 0.5]) polyhedron(
               points=[[0,0,0], [0.5,0,0], [0.5,2,0], [0,2,0], [0,2,6], [0.5,2,6]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
    
    translate([27.35, 17.5, 0.5]) polyhedron(
               points=[[0,0,0], [0.5,0,0], [0.5,2,0], [0,2,0], [0,2,6], [0.5,2,6]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
}

module box_base()
{
    difference()
    {
        translate([0, 0, 0]) cube([30, 20, 0.5]);
        translate([19.35, 19.51, -0.01]) cube([8, 0.51, 0.52]);
    }
}

module box_front()
{
    color("white") translate([0, -0.3, 0]) cube([30, 0.3, 13]);
}

module box_back()
{
    translate([0, 20, 0]) cube([30, 0.5, 13.3]);
}

module box_top()
{
    translate([0, -0.7, 13]) cube([30, 21.2, 0.5]);
}

module box_side_left()
{
    translate([-0.5, -0.7, 0]) cube([0.5, 21.2, 13.5]);
}

module box_side_right()
{
    translate([30, -0.7, 0]) cube([0.5, 21.2, 13.5]);
}

module box_lid()
{
    box_top();
    box_side_left();
    box_side_right();
    box_back();
}

difference()
{
    union()
    {
        box_base();
        power_panel();
        box_front();
        box_lid();
    }
    translate([0, 0, 0.5]) electronic(1, 1);
    translate([0, 0, 0.5]) internal_frame(1);
    translate([0, 0, 0]) power_panel(1);
}
translate([0, 0, 0.5]) electronic();
translate([0, 0, 0.5]) internal_frame();
