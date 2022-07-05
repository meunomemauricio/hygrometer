// Hygrometer Enclosure

$fa = 1;
$fs = .4;  // .1 for exporting

include <dimensions.scad>

use <usb_board.scad>
use <dht_board.scad>

// Enclosure Mesh
module enc_mesh() {
  range_w = enc_w/2 - enc_tk * 2;
  range_d = enc_d/2 - enc_tk * 2;
  range_h = enc_h/2 - enc_tk * 2;

  color("red") {
    // Vertical holes for the top surface
    for (step_w = [-range_w : enc_mesh_tk * 2 : range_w]) {
      for (step_d = [-range_d: enc_mesh_tk * 2 : range_d]) {
        translate([step_w, step_d, 0])
          cube([enc_mesh_tk, enc_mesh_tk, enc_h + _min_cl * 2], center=true);
      }
    }

    // Horizontal holes for the lateral surfaces
    for (step_d = [-range_d : enc_mesh_tk * 2 : range_d]) {
      for (step_h = [-range_h: enc_mesh_tk * 2 : range_h]) {
        translate([0, step_d, step_h])
          cube([enc_w + _min_cl * 2, enc_mesh_tk, enc_mesh_tk], center=true);
      }
    }

    // Horizontal holes for the ??? surface
    for (step_w = [-range_w : enc_mesh_tk * 2 : range_w]) {
      for (step_h = [-range_h: enc_mesh_tk * 2 : range_h]) {
        translate([step_w, -enc_d/2 + enc_tk/2, step_h])
          cube([enc_mesh_tk, enc_tk * 2, enc_mesh_tk], center=true);
      }
    }
  }
}

// Main Enclosure Body
module enc_main_body() {
  difference() {
    cube([enc_w, enc_d, enc_h], center=true);
    translate([0, 0, enc_tk/2 +_min_cl/2])
      // TODO: Move to dimensions.scad
      cube([enc_w-(enc_tk*2), enc_d-(enc_tk*2), (enc_h-enc_tk)], center=true);

    // USB slot
    translate([usb_slot_w_of, usb_slot_d_of, usb_slot_h_of])
      cube([usb_slot_w, usb_slot_d, usb_slot_h], center=true);
  }
}

// Lid Screw Supports
module enc_screw_sup() {
  translate([screw_sup_w_of, screw_sup_d_of, screw_sup_h_of])
    cube([screw_sup_w, screw_sup_d, screw_sup_h], center=true);
  translate([-screw_sup_w_of, screw_sup_d_of, screw_sup_h_of])
    cube([screw_sup_w, screw_sup_d, screw_sup_h], center=true);
  translate([screw_sup_w_of, -screw_sup_d_of, screw_sup_h_of])
    cube([screw_sup_w, screw_sup_d, screw_sup_h], center=true);
  translate([-screw_sup_w_of, -screw_sup_d_of, screw_sup_h_of])
    cube([screw_sup_w, screw_sup_d, screw_sup_h], center=true);
}

// USB Board Support
module usb_support() {
  translate([0, usb_sup_base_d_of, usb_sup_base_h_of]) {
    translate([usb_sup_base_w_of, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        translate([0, 0, usb_sup_hole_h_of])
          cylinder(d=usb_sup_hole_d, h=usb_sup_hole_h);
      }

    translate([-usb_sup_base_w_of, 0, 0])
      difference() {
        cylinder(d=usb_sup_base_d, h=usb_sup_base_h);
        translate([0, 0, usb_sup_hole_h_of])
          cylinder(d=usb_sup_hole_d, h=usb_sup_hole_h);
      }
  }

  // Reinforcements
  translate([0, usb_sup_rein_d_of, usb_sup_rein_h_of]){
    cube([usb_sup_rein_w, usb_sup_rein_tk, usb_sup_rein_h], center=true);

    translate([usb_sup_rein_w_of, 0, 0])
      cube([usb_sup_rein_tk, usb_sup_rein_d, usb_sup_rein_h], center=true);

    translate([-usb_sup_rein_w_of, 0, 0])
      cube([usb_sup_rein_tk, usb_sup_rein_d, usb_sup_rein_h], center=true);
  }
}

// Screw Insert Slots
module screw_ins() {
  translate([screw_sup_w_of, screw_sup_d_of, screw_ins_h_of])
    cylinder(h=screw_ins_h, r=screw_ins_r);
  translate([-screw_sup_w_of, screw_sup_d_of, screw_ins_h_of])
    cylinder(h=screw_ins_h, r=screw_ins_r);
  translate([screw_sup_w_of, -screw_sup_d_of, screw_ins_h_of])
    cylinder(h=screw_ins_h, r=screw_ins_r);
  translate([-screw_sup_w_of, -screw_sup_d_of, screw_ins_h_of])
    cylinder(h=screw_ins_h, r=screw_ins_r);
}

// Enclosure Design
module enclosure() {
  // color("gray", 0.8) // Uncomment for transparency
  color("gray") {
    difference() {
      union() {
        difference() {
          enc_main_body();
          enc_mesh();
        }
        enc_screw_sup();
      }
      screw_ins();
    }
    usb_support();
  }
}

// Enclosure Lid
module enclosure_lid() {
  color("white") {
    difference() {
      cube([enc_w, enc_d, lid_h], center=true);

      // Lid Holes
      translate([screw_sup_w_of, screw_sup_d_of, 0]) {
        cylinder(h=lid_pocket_h, r=lid_pocket_r);
        translate([0, 0, -lid_h])
          cylinder(h=lid_hole_h, r=lid_hole_r);
      }
      translate([-screw_sup_w_of, screw_sup_d_of, 0]) {
        cylinder(h=lid_pocket_h, r=lid_pocket_r);
        translate([0, 0, -lid_h])
          cylinder(h=lid_hole_h, r=lid_hole_r);
      }
      translate([screw_sup_w_of, -screw_sup_d_of, 0]) {
        cylinder(h=lid_pocket_h, r=lid_pocket_r);
        translate([0, 0, -lid_h])
          cylinder(h=lid_hole_h, r=lid_hole_r);
      }
      translate([-screw_sup_w_of, -screw_sup_d_of, 0]) {
        cylinder(h=lid_pocket_h, r=lid_pocket_r);
        translate([0, 0, -lid_h])
          cylinder(h=lid_hole_h, r=lid_hole_r);
      }
    }
  }
}

// Final Assembly
translate([0, usb_enc_d_of, usb_enc_h_of])
  rotate([0, 180, 0])
  usb_board();

translate([0, dht_enc_d_of, dht_enc_h_of])
  dht_board();

translate([0, 0, enc_h + lid_h/2])
translate([0, 0, 20])  // Uncomment to open lid
// rotate([0, 180, 0])  // Uncomment to flip lid
difference() {
  enclosure_lid();

  // Uncomment to cut lid in half on the x=0 plane
  // translate([50, 0, 0])
  //   cube([100, 100, 100], center=true);
}

translate([0, 0, enc_h/2]) {  // So enclosure is above z=0 plane
  difference() {
    enclosure();

    // Uncomment to cut enclosure in half on the x=0 plane
    // translate([50, 0, 0])
    //   cube([100, 100, 100], center=true);

    // Uncomment to cut enclosure in half on the y=0 plane
    // translate([0, 50, 0])
    //   cube([100, 100, 100], center=true);
  }
}

// Uncomment for Lid Screw Guides
// color("red") {
//   translate([screw_sup_w_of, screw_sup_d_of, enc_tk]) {
//     cylinder(h=50, r=lid_hole_r);
//   }
//   translate([-screw_sup_w_of, screw_sup_d_of, enc_tk]) {
//     cylinder(h=50, r=lid_hole_r);
//   }
//   translate([screw_sup_w_of, -screw_sup_d_of, enc_tk]) {
//     cylinder(h=50, r=lid_hole_r);
//   }
//   translate([-screw_sup_w_of, -screw_sup_d_of, enc_tk]) {
//     cylinder(h=50, r=lid_hole_r);
//   }
// }
