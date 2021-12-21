use <controller.scad>;

projection()
{
    main_board();
    translate([26.5, 0, 0]) output_board();
    translate([0, 10, 0]) box_base();
    translate([31, 10, 0]) box_top();
    translate([0, 31, 0]) rotate([-90, 0, 0]) box_front();
    translate([31, 31, 0]) rotate([-90, 0, 0]) box_back();
}
