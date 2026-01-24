/*
  ECC83 katodstrommatare med 100 ohm shunt + MCP6002 (gain ~7.8)
  Visar Ik (mA) pa 0.96" OLED 128x64 (SSD1306 I2C) och pa Serial.

  Hardware (som ditt schema):
  - Shunt: 100 ohm i katodreturen (low-side)
  - Op-amp: MCP6002, icke-inverterande
      Rg = 10k till GND
      Rf = 68k fran OUT till -IN
      Gain = 1 + 68k/10k = 7.8
  - Op-amp OUT -> 1k -> Arduino A0
  - A0 -> 100nF -> GND
  - OLED I2C: SDA=A4, SCL=A5 (UNO/NANO)
*/

#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

// Vanlig adress: 0x3C. Om inget syns: prova 0x3D.
#define OLED_ADDR 0x3C

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

// ----- Konstanter for omrakning -----
const int   ADC_PIN = A0;
const float VREF    = 5.0f;          // Arduino Nano DEFAULT referens ~5V
const float ADC_MAX = 1023.0f;

// Gain = 1 + Rf/Rg = 1 + 68k/10k = 7.8
const float GAIN = 7.8f;
// Shunt = 100 ohm
const float RSHUNT = 100.0f;

// Ik(mA) = Vout / (GAIN * RSHUNT) * 1000
const float K_MA_PER_V = (1000.0f / (GAIN * RSHUNT)); // ~1.2820513

// ----- Enkel filtrering -----
float ema = 0.0f;                 // exponential moving average pa Vout
const float EMA_ALPHA = 0.15f;    // 0..1 (hogre = snabbare, lagre = lugnare)

float readVout() {
  int adc = analogRead(ADC_PIN);
  return adc * (VREF / ADC_MAX);
}

void oledSplash() {
  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.println("ECC83 shunt meter");
  display.println("Shunt: 100 ohm");
  display.print("Gain: ");
  display.println(GAIN, 2);
  display.print("k(mA/V): ");
  display.println(K_MA_PER_V, 3);
  display.display();
  delay(800);
}

void setup() {
  Serial.begin(115200);
  delay(50);

  Wire.begin();

  if (!display.begin(SSD1306_SWITCHCAPVCC, OLED_ADDR)) {
    // Om OLED inte hittas: stanna och skriv i Serial
    Serial.println("OLED init misslyckades. Prova annan adress (0x3C/0x3D) eller I2C-kablage.");
    while (1) { delay(10); }
  }

  oledSplash();

  // Initiera EMA med en forsta lasning
  float v0 = readVout();
  ema = v0;
}

void loop() {
  // 1) Las Vout
  float vout = readVout();

  // 2) Filtrera (EMA)
  ema = EMA_ALPHA * vout + (1.0f - EMA_ALPHA) * ema;

  // 3) Rakna strom
  float ik_mA = ema * K_MA_PER_V;

  // ----- Serial -----
  Serial.print("Vout=");
  Serial.print(ema, 3);
  Serial.print(" V  Ik=");
  Serial.print(ik_mA, 3);
  Serial.println(" mA");

  // ----- OLED -----
  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);

  // Stor rad med strom
  display.setTextSize(2);
  display.setCursor(0, 0);
  display.print("Ik ");
  display.print(ik_mA, 2);
  display.print("mA");

  // Mindre felsokningsrader
  display.setTextSize(1);
  display.setCursor(0, 28);
  display.print("Vout: ");
  display.print(ema, 3);
  display.println(" V");

  display.setCursor(0, 40);
  display.print("Gain: ");
  display.print(GAIN, 2);
  display.print("  Sh: ");
  display.print(RSHUNT, 0);
  display.println("R");

  display.setCursor(0, 52);
  display.print("k(mA/V): ");
  display.print(K_MA_PER_V, 3);

  display.display();

  delay(200);
}
