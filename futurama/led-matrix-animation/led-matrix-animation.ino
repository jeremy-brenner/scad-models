#include <FastLED.h>
#define NUM_LEDS 64
#define DATA_PIN 2


int lights[9][4] = { 
  { 0, 1, 14, 15 },
  { 3, 4, 11, 12 },
  { 6, 7, 8, 9 },
  { 30, 31, 32, 33 },
  { 27, 28, 35, 36 },
  { 24, 25, 38, 39 },
  { 48, 49, 62, 63 },
  { 51, 52, 59, 60 },
  { 54, 55, 56, 57 }
};

long currentState = 0;
long lastState = 0;

CRGB leds[NUM_LEDS];

void setup() { 
  Serial.begin(9600);
  randomSeed(analogRead(0));
  FastLED.addLeds<WS2812, DATA_PIN>(leds, NUM_LEDS); 
}


void loop() {
  lastState = currentState;
  currentState = random(512);
  int steps = 10;
  long animationTime = 200;
  
  for (int step = 1; step <= steps; step++) {
    for (int x = 0; x < 9; x++) {
      bool wasOn = ((lastState >> x) & 1) == 1;    
      bool isOn = ((currentState >> x) & 1) == 1;    
      for (int z = 0; z < 4; z++) {
        if(isOn && wasOn) {
          leds[lights[x][z]] = CRGB (250, 30, 30);
          continue;
        }
        if(!isOn && !wasOn) {
          leds[lights[x][z]] = CRGB::Black;
          continue;
        }
        if(isOn) {
          leds[lights[x][z]] = CRGB (250/steps*step, 30/steps*step, 30/steps*step);
          continue;
        }
        if(!isOn) {
          leds[lights[x][z]] = CRGB (250-250/steps*step, 30-30/steps*step, 30-30/steps*step);
          continue;
        }
      }
    }
    FastLED.show(); 
    delay(animationTime/steps);
  }
  long sleepTime = random(4500);
  delay(sleepTime);
}
