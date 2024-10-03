#include <FastLED.h>
#include <ESP8266TrueRandom.h>

#define NUM_LEDS 64
#define DATA_PIN 2
#define NUM_LIGHTS 9
#define LEDS_PER_LIGHT 4
#define ANIMATION_STEPS 10
#define ANIMATION_TIME 300
#define SLEEP_MAX_TIME 5000

int lights[NUM_LIGHTS][LEDS_PER_LIGHT] = { 
  {  0,  1, 14, 15 },
  {  3,  4, 11, 12 },
  {  6,  7,  8,  9 },
  { 30, 31, 32, 33 },
  { 27, 28, 35, 36 },
  { 24, 25, 38, 39 },
  { 48, 49, 62, 63 },
  { 51, 52, 59, 60 },
  { 54, 55, 56, 57 }
};

CRGB leds[NUM_LEDS];

CRGB onColor = CRGB::LimeGreen;
CRGB offColor = CRGB::Black;
CRGB redColor = CRGB::Red;

long currentState = 0;
long lastState = 0;

void setup() { 
  Serial.begin(9600);
  FastLED.addLeds<WS2812, DATA_PIN, GRB>(leds, NUM_LEDS); 
}

void loop() {
  lastState = currentState;
  currentState = ESP8266TrueRandom.random(512);
  
  for (int step = 1; step <= ANIMATION_STEPS; step++) {
    for (int lightIdx = 0; lightIdx < NUM_LIGHTS; lightIdx++) {
      CRGB color = blendColor(lightIdx, step);
      updateLight(lightIdx,color);
    }
    FastLED.show(); 
    delay(ANIMATION_TIME/ANIMATION_STEPS);
  }
  long sleepTime = ESP8266TrueRandom.random(SLEEP_MAX_TIME);
  delay(sleepTime);
}

void updateLight(int lightIdx, CRGB color) {
  for (int ledIdx = 0; ledIdx < LEDS_PER_LIGHT; ledIdx++) {
    leds[lights[lightIdx][ledIdx]] = color;
  }
}

bool lightIsOn(int state, int lightIdx) {
  return ((state >> lightIdx) & 1) == 1;    
}

CRGB getColor(int state, int lightIdx) {
  if(lightIsOn(state, lightIdx)) {
    return state == 341 ? redColor : onColor;
  }else{
    return offColor;
  }
}

CRGB blendColor(int lightIdx, int step) {
  return blend(getColor(lastState,lightIdx), getColor(currentState,lightIdx), (double)255/ANIMATION_STEPS * step); 
}
