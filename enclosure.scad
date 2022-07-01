// Hygrometer Enclosure

$fa = 1;
$fs = .4;

include <dimensions.scad>
include <usb_board.scad>
include <dht_board.scad>

// Enclosure Design
module enclosure() {
  difference() {
    cube([enc_w, enc_d, enc_h], center=true);
    translate([0, 0, enc_tk/2])
      cube([enc_w-(enc_tk*2), enc_d-(enc_tk*2), (enc_h-enc_tk)+_min_cl], center=true);

    // USB slot
    translate([usb_slot_w_of, usb_slot_d_of, usb_slot_h_of])
      cube([usb_slot_w, usb_slot_d, usb_slot_h], center=true);

    // DHT slot
    translate([dht_slot_w_of, dht_slot_d_of, dht_slot_h_of])
      cube([dht_slot_w, dht_slot_d, dht_slot_h], center=true);
  }
}

// Enclosure Lid
module enclosure_lid() {
  cube([enc_w, enc_d, lid_h], center=true);

  // Ridge
  translate([0, 0, -lid_ridge_h])
    difference() {
      cube([lid_ridge_w, lid_ridge_d, lid_ridge_h], center=true);
      cube([lid_hollow_w, lid_hollow_d, lid_hollow_h], center=true);
    }

  // USB Board Support
  translate([0, usb_sup_base_d_of, usb_sup_base_h_of]) {
    translate([usb_hole_w_of/2, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        translate([0, 0, -_min_cl])
          cylinder(d=usb_sup_hole_d * 1.1, h=usb_sup_base_h);
      }

    translate([-usb_hole_w_of/2, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        translate([0, 0, -_min_cl])
          cylinder(d=usb_sup_hole_d * 1.1, h=usb_sup_base_h);
      }
  }
}

// Final Assembly
translate([0, usb_enc_d_of, usb_enc_h_of])
  rotate([0, 180, 0])
  usb_board();

translate([0, dht_enc_d_of, dht_enc_h_of])
  dht_board();

color("white")
  translate([0, 0, enc_h + lid_h/2])
  // translate([0, 0, 20])  // Uncomment to open lid
  // rotate([0, 180, 0])  // Uncomment to flip lid
  difference() {
    enclosure_lid();

    // Uncomment to cut lid in half on the x=0 plane
    // translate([50, 0, 0])
    //   cube([100, 100, 100], center=true);
  }

// color("gray", 0.8) // Uncomment for transparency
color("gray")
  translate([0, 0, enc_h/2]) {  // So enclosure is above z=0 plane
    difference() {
      enclosure();

      // Uncomment to cut enclosure in half on the x=0 plane
      translate([50, 0, 0])
        cube([100, 100, 100], center=true);

      // Uncomment to cut enclosure in half on the y=0 plane
      // translate([0, 50, 0])
      //   cube([100, 100, 100], center=true);
    }
  }
