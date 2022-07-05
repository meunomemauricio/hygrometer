// USB Connector Board

include <dimensions.scad>

module usb_board() {
  // Board
  color("green")
    difference() {
      cube([usb_board_w, usb_board_d, usb_board_h], center=true);

      translate([0, -((usb_board_d/2)-usb_hole_d_of), -usb_board_h]) {
        translate([usb_hole_w_of/2, 0, 0])
          cylinder(d=usb_hole_d, h=usb_board_h*2);

        translate([-usb_hole_w_of/2, 0, 0])
          cylinder(d=usb_hole_d, h=usb_board_h*2);
      }
    }

  // Connector
  color("grey")
    translate([0, usb_board_d/2 - usb_conn_d/2 + usb_conn_d_of, usb_board_h/2 + usb_conn_h/2])
    cube([usb_conn_w, usb_conn_d, usb_conn_h], center=true);
}

usb_board();
