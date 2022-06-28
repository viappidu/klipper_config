#!/bin/bash

sudo service klipper stop
cd ~/klipper

# Update mcu rpi
echo "Start update mcu rpi"
echo ""
make clean
# make menuconfig KCONFIG_CONFIG=~/klipper_config/script/config.linux_mcu
# make KCONFIG=~/klipper_config/script/config.linux_mcu
read -p "mcu rpi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=~/klipper_config/script/config.linux_mcu
echo "Finish update mcu rpi"
echo ""

# Update mcu Octopus
echo "Start update mcu Octopus Pro F429"
echo ""
#make clean
#make menuconfig KCONFIG_CONFIG=~/klipper_config/script/config.octopus
#make KCONFIG_CONFIG=~/klipper_config/script/config.octopus
read -p "mcu Octopus firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
# ~/klipper/scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f429xx_3E001E000750314B33323220-if00 Octopus-Pro-F429
read -p "mcu Octopus cannot be flashed, yet (missing support for SDIO). Copy ~/klipper/out/klipper.bin to firmware.bin on sd card manually. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu Octopus"
echo ""

# Update mcu Ramps (!PH3, !PH6, !PL2, !PL4 setting)
echo "Start update mcu Ramps"
echo ""
make clean
make menuconfig KCONFIG_CONFIG=~/klipper_config/script/config.ramps
make KCONFIG_CONFIG=~/klipper_config/script/config.ramps
read -p "mcu Ramps firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash FLASH_DEVICE=/dev/serial/by-id/usb-Arduino__www.arduino.cc__0042_55838323435351513021-if00
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0
#~/klipper/scripts/flash-usb.sh /dev/serial/by-id/usb-Arduino__www.arduino.cc__0042_55838323435351513021-if00
read -p "mcu Ramps firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
echo "Finish update mcu Ramps"
echo ""

sudo service klipper start
