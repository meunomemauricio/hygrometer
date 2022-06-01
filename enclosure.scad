// Hygrometer Enclosure

$fa = 1;
$fs = .4;

// Minimal Clearance
_min_cl = 0.5;

// Dimensions (in mm)

enc_w = 32;
enc_d = 60;
enc_h = 25;

enc_tk = 3;

esp_board_w = 15;     // 14.78
esp_board_d = 25;     // 24.60
esp_board_h = 3;      // 3.14
esp_board_w_of = 0.4; // Not measured

esp_conn_h = 2.9; // 2.90

dht_board_w = 21;  // 20.90
dht_board_d = 26;  // 25.29
dht_board_h = 1.6; // 1.61

dht_enc_d_of = -(enc_d/2 - dht_board_d/2) + enc_tk + 2;  // Distance from the enclosure
dht_enc_h_of = enc_tk + 2;

dht_conn_w = 11;     // 10.52
dht_conn_d = 5;      // 4.93
dht_conn_h = 9;      // 8.88
dht_conn_w_of = 1.5; // 11.54

dht_w = 13;     // 12.54
dht_d = 16;     // 16.20
dht_h = 6;      // 6.01
dht_d_of = 0.8; // Offset from DHT module and board

dht_btn_w = 3;      // 3.33
dht_btn_d = 6;      // 6.06
dht_btn_h = 3;      // 2.99
dht_btn_d_of = 1.8; // 1.84

usb_board_w = 15;  // 14.48
usb_board_d = 15;  // 14.85
usb_board_h = 1.1; // 1.10

// Distance from the enclosure
usb_enc_d_of = enc_d/2 - usb_board_d/2 - enc_tk - 1;
usb_enc_h_of = enc_tk + 15;

usb_conn_w = 7.3;  // 7.30
usb_conn_d = 5.3;  // 5.26
usb_conn_h = 2.3;  // 2.32
usb_conn_d_of = 1; // 1.02

usb_hole_d = 3.5;    // 3.48
usb_hole_w_of = 8.5; // 8.45 - Between the holes. Assuming they're centered.
usb_hole_d_of = 5.5; // 5.50 - From oposite side of USB connector

usb_sup_base_h = 2;
usb_sup_base_d = 3.7;

usb_sup_hole_d = 1.4;  // For M1.6 screws

// USB Connector Board
module usb_connector() {
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

// DHT Shield Board + ESP Board
module dht_board() {
  // Board
  color("blue")
    cube([dht_board_w, dht_board_d, dht_board_h], center=true);

  // DHT Module
  color("deepskyblue")
    translate([dht_board_w/2-dht_w/2, dht_board_d/2+dht_d/2 + dht_d_of, dht_h/2 - dht_board_h/2])
    cube([dht_w, dht_d, dht_h], center=true);

  // ESP Connectors
  color("yellow")
    translate([
      dht_board_w/2-dht_conn_w/2 - dht_conn_w_of,
      -(dht_board_d/2-dht_conn_d/2),
      dht_conn_h/2 + dht_board_h/2
    ])
    cube([dht_conn_w, dht_conn_d, dht_conn_h], center=true);

  // Reset Button
  color("#222222") // Almost Black
    translate([
      -(dht_board_w/2 - dht_btn_w/2),
      dht_board_d/2 - dht_btn_d/2 - dht_btn_d_of,
      dht_board_h/2 + dht_btn_h/2
    ])
    cube([dht_btn_w, dht_btn_d, dht_btn_h], center=true);

  // ESP Board
  color("#222222") // Almost Black
    translate([
      dht_board_w/2 - esp_board_w/2 + esp_board_w_of,
      0,
      dht_board_h/2 + esp_board_h/2 + esp_conn_h + dht_conn_h
    ])
    cube([esp_board_w, esp_board_d, esp_board_h], center=true);
}

// Enclosure Design
module enclosure() {
  difference() {
    cube([enc_w, enc_d, enc_h], center=true);
    translate([0, 0, enc_tk/2])
      cube([enc_w-(enc_tk*2), enc_d-(enc_tk*2), (enc_h-enc_tk)+_min_cl], center=true);
  }
}

// USB Board Support Fit Test
// Simplified model of the USB Board support to test dimensions and proper fit.
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
  //   usb_connector();
}

// Final Assembly

translate([0, usb_enc_d_of, usb_enc_h_of])
  rotate([0, 180, 0])
  usb_connector();

translate([0, dht_enc_d_of, dht_enc_h_of])
  dht_board();

color("gray")
  translate([0, 0, enc_h/2]) {  // So enclosure is above z=0 plane
    difference() {
      enclosure();
      // translate([50, 0, 0])
      //   cube([100, 100, 100], center=true);
    }
  }