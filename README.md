# Hygrometer

<img src="https://github.com/meunomemauricio/hygrometer/blob/8ca9c8a97752705a92ad074d127f5579a52d77f0/images/final_top_reduced.jpg" width="75%" height="75%">

DIY HA compatible Temperature & Humidity Sensor

# 3D Printed Enclosure

## Design

<img src="https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/enclosure_reduced.png" width="50%" height="80%" />

## USB Board 

It's better to test if the dimensions of the USB board are correct enough by printing a [simplified support](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/usb_fit_test.scad).

| Simplified Support |  Board fit
:-------------------:|:-------------------------:
![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/conn_support_item_reduced.jpg)  |  ![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/conn_support_test_reduced.jpg)

## Fit Test Print

Once I finished the enclosure design, I used the slicer to make a cut of the model that contain the main features.


| Items |  Fit Test
:-------------------:|:-------------------------:
![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/fit_test_items_reduced.jpg) | ![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/fit_test_reduced.jpg)

## Final Print and Assembly

The end result fit perfectly! Everything looks great, but there's a _very unfortunate problem_.

The simple mesh I created in the laterals is not enough to dissipate the heat from the voltage regulators. It raises the temperatures in the DHT11 significantly (~5C higher).

| Empty Enclosure |  Compoments | Closed Enclosure | Lateral Shot
:-------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/final_empty_reduced.jpg) | ![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/final_components_reduced.jpg) | ![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/final_botton_reduced.jpg) | ![](https://github.com/meunomemauricio/hygrometer/blob/f57ef0650a297ba861d08bb6003e8ca89dd94b08/images/final_laterals_reduced.jpg)
