// USB Board Support Fit Test
// Simplified model of the USB Board support to test dimensions and proper fit.

include <dimensions.scad>
include <usb_board.scad>

module usb_fit_test() {
  support_h = 2;
  translate([0, 0, support_h/2])
    cube([20, 20, support_h], center=true);

  translate([
      0,
      -((usb_board_d/2)-usb_hole_d_of),
      support_h/2 + usb_sup_base_h/2
    ]) {
    translate([usb_hole_w_of/2, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        cylinder(d=usb_sup_hole_d * 1.1, h=usb_sup_base_h);
      }

    translate([-usb_hole_w_of/2, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        cylinder(d=usb_sup_hole_d * 1.1, h=usb_sup_base_h);
      }
  }

  // translate([0, 0, support_h + usb_sup_base_h + usb_board_h/2 + 0.1])
  //   usb_board();
}

usb_fit_test();