// DHT Shield Board + ESP Board

include <dimensions.scad>

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

// dht_board();