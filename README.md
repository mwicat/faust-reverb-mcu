## Building

1. Install [PlatformIO environment](https://docs.platformio.org/en/latest//integration/ide/vscode.html#installation)

2. Run target for your environment (see `Makefile` and `platform.io`)

```shell
make teensy35
```

## Special Note About the Teensy 3.6

Before this program can be compiled and uploaded to the Teensy 3.6, some modifications need to be made to the configuration file used by the compilation script used by Teensyduino (boards.txt). You should be able to find it in hardware/teensy/avr in the source of the Arduino software (its location will vary depending on the platform your using). The most important thing to do here is to use g++ instead of gcc for linking, so:

```ini
teensy36.build.command.linker=arm-none-eabi-gcc
```

should become:

```ini
teensy36.build.command.linker=arm-none-eabi-g++
```

in boards.txt. Beware that on older versions of Teensyduino, these changes should be made directly to platform.txt.

After making these changes, you should be able to compile and upload your sketch to the Teensy 3.6.
