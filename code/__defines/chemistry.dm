#define MAX_PILL_SPRITE 20
#define MAX_BOTTLE_SPRITE 3

#define SOLID 1
#define LIQUID 2
#define GAS 3

#define FOOD_METABOLISM 0.4
#define DRINK_METABOLISM 0.8

#define REAGENTS_OVERDOSE 30

#define REM REAGENTS_EFFECT_MULTIPLIER

// How many units of reagent are consumed per tick, by default.
#define REAGENTS_METABOLISM 0.2

// By defining the effect multiplier this way, it'll exactly adjust
// all effects according to how they originally were with the 0.4 metabolism
#define REAGENTS_EFFECT_MULTIPLIER REAGENTS_METABOLISM / 0.4

#define CE_STABLE        "stable"       // Inaprovaline
#define CE_ANTIBIOTIC    "antibiotic"   // Spaceacilin
#define CE_BLOODRESTORE  "bloodrestore" // Iron/nutriment
#define CE_PAINKILLER    "painkiller"
#define CE_ALCOHOL       "alcohol"      // Liver filtering
#define CE_ALCOHOL_TOXIC "alcotoxic"    // Liver damage
#define CE_SPEEDBOOST    "gofast"       // Hyperzine
#define CE_SLOWDOWN      "goslow"       // Slowdown
#define CE_PULSE         "xcardic"      // increases or decreases heart rate
#define CE_NOPULSE       "heartstop"    // stops heartbeat
#define CE_ANTITOX       "antitox"      // Dylovene
#define CE_OXYGENATED    "oxygen"       // Dexalin.
#define CE_BRAIN_REGEN   "brainfix"     // Alkysine.
#define CE_ANTIVIRAL     "antiviral"    // Anti-virus effect.
#define CE_TOXIN         "toxins"       // Generic toxins, stops autoheal.
#define CE_BREATHLOSS    "breathloss"   // Breathing depression, makes you need more air
#define CE_MIND    		 "mindbending"  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_CRYO 	     "cryogenic"    // Prevents damage from being frozen