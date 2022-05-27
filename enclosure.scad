// Hygrometer Enclosure
$fa = 1;
$fs = .4;

// Dimensions (in mm)

esp_board_w = 15; // 14.78
esp_board_d = 25; // 24.60
esp_board_h = 3;  // 3.14

dht_board_w = 21;  // 20.90
dht_board_d = 26;  // 25.29
dht_board_h = 1.6; // 1.61

dht_conn_w = 11; // 10.52
dht_conn_d = 5;  // 4.93
dht_conn_h = 9;  // 8.88

dht_w = 13; // 12.54
dht_d = 16; // 15.87
dht_h = 6;  // 6.01

usb_board_w = 15;  // 14.48
usb_board_d = 15;  // 14.85
usb_board_h = 1.1; // 1.10

usb_conn_w = 7.3;  // 7.30
usb_conn_d = 5.3;  // 5.26
usb_conn_h = 2.3;  // 2.32
usb_conn_d_of = 1; // 1.02

usb_hole_d = 3.5;    // 3.48
usb_hole_w_of = 8.5; // 8.45 - Between the holes. Assuming they're centered.
usb_hole_d_of = 5.5; // 5.50 - From oposite side of USB connector

// USB Connector Board
module usb_connector() {
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

  color("grey")
    translate([0, usb_board_d/2 - usb_conn_d/2 + usb_conn_d_of, usb_board_h/2 + usb_conn_h/2])
    cube([usb_conn_w, usb_conn_d, usb_conn_h], center=true);
}

// Assembly
usb_connector();