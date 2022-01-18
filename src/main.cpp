#include <Arduino.h>
#include <Audio.h>

#include "FaustProcessor/FaustProcessor.h"

FaustProcessor faustProcessor;

AudioOutputAnalog        dac1;
AudioConnection          patchCord1(faustProcessor, dac1);

float val;

void setup() {
  AudioMemory(2);
}

void loop() {
  val = analogRead(A0);
  int freq = 200 + int(val/1024 * 400);
  Serial.println(freq);
  faustProcessor.setParamValue("Freq", freq);
  delay(50);
}
