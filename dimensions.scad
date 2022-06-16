// Dimensions (in mm)

// Minimal Clearance
_min_cl = 0.5;

enc_w = 32;
enc_d = 60;
enc_h = 25;

enc_tk = 2;

lid_h = enc_tk;

lid_ridge_w = enc_w - (enc_tk + _min_cl) * 2;
lid_ridge_d = enc_d - (enc_tk + _min_cl) * 2;
lid_ridge_h = 2;

lid_hollow_w = lid_ridge_w - 3;
lid_hollow_d = lid_ridge_d - 3;
lid_hollow_h = lid_ridge_h;

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

// TODO: Validate dimensions
dht_slot_w = dht_w;
dht_slot_d = dht_d;
dht_slot_h = enc_tk + _min_cl * 2;

dht_slot_w_of = 4;  // Make dependent
dht_slot_d_of = 10;  // Make dependent
dht_slot_h_of = -enc_h/2 + enc_tk/2;

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

// TODO: Correct dimensions
usb_slot_w = usb_conn_w + 4;
usb_slot_d = enc_tk + _min_cl*2;
usb_slot_h = usb_conn_h + 4;

usb_slot_w_of = 0;
usb_slot_d_of = enc_d/2 - usb_slot_d/2 + _min_cl;
usb_slot_h_of = 4;