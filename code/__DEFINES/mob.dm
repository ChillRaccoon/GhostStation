///////////////////ORGAN STATUS DEFINES///////////////////
#define ORGAN_CUT_AWAY   1
#define ORGAN_ATTACHABLE 2
#define ORGAN_BLEEDING   4
#define ORGAN_BROKEN     8
#define ORGAN_DESTROYED  16
#define ORGAN_ROBOT      32
#define ORGAN_SPLINTED   64
#define ORGAN_DEAD       128
#define ORGAN_MUTATED    256
#define ORGAN_ARTERY_CUT 512

#define DROPLIMB_EDGE  0
#define DROPLIMB_BLUNT 1
#define DROPLIMB_BURN  2

// Bodypart defines
#define BP_CHEST  "chest"
#define BP_GROIN  "groin"
#define BP_HEAD   "head"
#define BP_L_ARM  "l_arm"
#define BP_R_ARM  "r_arm"
#define BP_L_LEG  "l_leg"
#define BP_R_LEG  "r_leg"

// Organ defines.
#define O_MOUTH    "mouth"
#define O_EYES     "eyes"
#define O_HEART    "heart"
#define O_LUNGS    "lungs"
#define O_BRAIN    "brain"
#define O_LIVER    "liver"
#define O_KIDNEYS  "kidneys"
#define O_APPENDIX "appendix"

#define AGE_MIN 25			//youngest a character can be
#define AGE_MAX 85			//oldest a character can be

#define LEFT  1
#define RIGHT 2

//Pulse levels, very simplified
#define PULSE_NONE		0	//so !M.pulse checks would be possible
#define PULSE_SLOW		1	//<60 bpm
#define PULSE_NORM		2	//60-90 bpm
#define PULSE_FAST		3	//90-120 bpm
#define PULSE_2FAST		4	//>120 bpm
#define PULSE_THREADY	5	//occurs during hypovolemic shock

// intent flags
#define I_HELP   "help"
#define I_DISARM "disarm"
#define I_GRAB   "grab"
#define I_HURT   "hurt" // or harm? or hurt? or what?

//proc/get_pulse methods
#define GETPULSE_HAND	0	//less accurate (hand)
#define GETPULSE_TOOL	1	//more accurate (med scanner, sleeper, etc)

// Species Names (keep in mind, that whitelist and preferences DB depends on this names too, and if anything is renamed, update MYSQL tables or is_alien_whitelisted() proc and preferences).
#define HUMAN          "Human"
#define UNATHI         "Unathi"
#define TAJARAN        "Tajaran"
#define SKRELL         "Skrell"
#define DIONA          "Diona"
#define IPC            "Machine"
#define VOX            "Vox"
#define VOX_ARMALIS    "Vox Armalis"
#define ABDUCTOR       "Abductor"
#define SKELETON       "Skeleton"
#define SHADOWLING     "Shadowling"
#define MONKEY         "Monkey"
#define GOLEM          "Adamantine Golem"
#define ZOMBIE         "Zombie"
#define ZOMBIE_TAJARAN "Zombie Tajaran"
#define ZOMBIE_SKRELL  "Zombie Skrell"
#define ZOMBIE_UNATHI  "Zombie Unathi"
#define TYCHEON        "Tycheon"

#define HUMAN_STRIP_DELAY 40 //takes 40ds = 4s to strip someone.

#define ALIEN_SELECT_AFK_BUFFER 1 // How many minutes that a person can be AFK before not being allowed to be an alien.

#define SHOES_SLOWDOWN -1.0			// How much shoes slow you down by default. Negative values speed you up

//Nutrition levels for humans.
#define NUTRITION_LEVEL_FAT 600
#define NUTRITION_LEVEL_FULL 550
#define NUTRITION_LEVEL_WELL_FED 450
#define NUTRITION_LEVEL_FED 350
#define NUTRITION_LEVEL_HUNGRY 250
#define NUTRITION_LEVEL_STARVING 150

// Factor of how fast mob nutrition decreases
#define METABOLISM_FACTOR 1 // standart (for humans, other)
#define SKRELL_METABOLISM_FACTOR 2 // Twice the speed for half the sense!

// Taste sensitivity - the more the more reagents you'll taste
#define TASTE_SENSITIVITY_NORMAL 1
#define TASTE_SENSITIVITY_SHARP 1.5
#define TASTE_SENSITIVITY_DULL 0.75
#define TASTE_SENSITIVITY_NO_TASTE 0

//Ian can lick or sniff
#define IAN_STANDARD 0
#define IAN_LICK     1
#define IAN_SNIFF    2

// CLicks Cooldowns
#define CLICK_CD_MELEE 8
#define CLICK_CD_INTERACT 4
#define CLICK_CD_RAPID 2
#define CLICK_CD_AI 9

#define MAX_FECES_COUNT 5

// Telepathy, but for dummies.
#define MAX_TELEPATHY_RANGE 30

//carbon taste sensitivity defines, used in mob/living/carbon/proc/ingest
#define TASTE_HYPERSENSITIVE 3 //anything below 5%
#define TASTE_SENSITIVE 2 //anything below 7%
#define TASTE_NORMAL 1 //anything below 15%
#define TASTE_DULL 0.5 //anything below 30%
#define TASTE_NUMB 0.1 //anything below 150%

//Used by show_message() and emotes
#define VISIBLE_MESSAGE 1
#define AUDIBLE_MESSAGE 2

//used for getting species temp values
#define COLD_LEVEL_1 -1
#define COLD_LEVEL_2 -2
#define COLD_LEVEL_3 -3
#define HEAT_LEVEL_1 1
#define HEAT_LEVEL_2 2
#define HEAT_LEVEL_3 3

//Synthetic human temperature vals
#define SYNTH_COLD_LEVEL_1 50
#define SYNTH_COLD_LEVEL_2 -1
#define SYNTH_COLD_LEVEL_3 -1
#define SYNTH_HEAT_LEVEL_1 500
#define SYNTH_HEAT_LEVEL_2 1000
#define SYNTH_HEAT_LEVEL_3 2000

#define CORPSE_CAN_REENTER 1
#define CORPSE_CAN_REENTER_AND_RESPAWN 2

#define SPECIES_HUMAN "Human"
#define SPECIES_TAJARA "Tajara"
#define SPECIES_DIONA "Diona"
#define SPECIES_VOX "Vox"
#define SPECIES_IPC "Machine"
#define SPECIES_UNATHI "Unathi"
#define SPECIES_SKRELL "Skrell"
#define SPECIES_NABBER "Giant Armoured Serpentid"
#define SPECIES_PROMETHEAN "Promethean"
#define SPECIES_BOGANI "Bogani"
#define SPECIES_EGYNO "Egyno"

#define SURGERY_CLOSED 0
#define SURGERY_OPEN 1
#define SURGERY_RETRACTED 2
#define SURGERY_ENCASED 3

#define STAMINA_EXHAUST 200

//Moods levels for humans
#define MOOD_LEVEL_HAPPY4 20
#define MOOD_LEVEL_HAPPY3 15
#define MOOD_LEVEL_HAPPY2 10
#define MOOD_LEVEL_HAPPY1 5
#define MOOD_LEVEL_NEUTRAL 0
#define MOOD_LEVEL_SAD1 -5
#define MOOD_LEVEL_SAD2 -10
#define MOOD_LEVEL_SAD3 -15
#define MOOD_LEVEL_SAD4 -20

#define NUTRITION_LEVEL_FAT 550
#define NUTRITION_LEVEL_FULL 500
#define NUTRITION_LEVEL_WELL_FED 450
#define NUTRITION_LEVEL_FED 350
#define NUTRITION_LEVEL_HUNGRY 250
#define NUTRITION_LEVEL_STARVING 150

//Thirst levels for humans
#define THIRST_LEVEL_MAX 600
#define THIRST_LEVEL_FILLED 500
#define THIRST_LEVEL_MEDIUM 300
#define THIRST_LEVEL_THIRSTY 200
#define THIRST_LEVEL_DEHYDRATED 50
#define THIRST_FACTOR 0.5

//Hygiene levels for humans
#define HYGIENE_LEVEL_CLEAN 250
#define HYGIENE_LEVEL_NORMAL 200
#define HYGIENE_LEVEL_DIRTY 75
#define HYGIENE_FACTOR_LOWEST 0.09
#define HYGIENE_FACTOR 0.1
#define HYGIENE_FACTOR_HIGHEST 0.110

//Disgust levels for humans
#define DISGUST_LEVEL_MAXEDOUT 150
#define DISGUST_LEVEL_DISGUSTED 75
#define DISGUST_LEVEL_VERYGROSS 50
#define DISGUST_LEVEL_GROSS 25

//Hardcore mode stuff

#define STARVATION_MIN 60 //If you have less nutrition than this value, the hunger indicator starts flashing
#define STARVATION_NOTICE 45 //If you have more nutrition than this value, you get an occasional message reminding you that you're going to starve soon
#define STARVATION_WEAKNESS 20 //Otherwise, if you have more nutrition than this value, you occasionally become weak and receive minor damage
#define STARVATION_NEARDEATH 5 //Otherwise, if you have more nutrition than this value, you have seizures and occasionally receive damage

//If you have less nutrition than STARVATION_NEARDEATH, you start getting damage
#define STARVATION_OXY_DAMAGE 2.5
#define STARVATION_TOX_DAMAGE 2.5
#define STARVATION_BRAIN_DAMAGE 2.5

#define STARVATION_OXY_HEAL_RATE 1 //While starving, THIS much oxygen damage is restored per life tick (instead of the default 5)

//Temperature stuff
//BODYTEMP_COLD_DAMAGE_LIMIT 			 -13�C Below which freezing damage occurs.						(defined in items_clothing.dm)
#define TEMPERATURE_REFRESHING 	278.15	//5�C  Below which drinks and foods are considered refreshing.
#define TEMPERATURE_WARM 		323.15	//50�C Above which drinks and foods are considered warm.
//BODYTEMP_HEAT_DAMAGE_LIMIT 			  87�C Above which burn damage occurs.							(defined in items_clothing.dm)#define STASIS_MISC "misc"
#define STASIS_CRYOBAG "cryobag"
#define STASIS_COLD "cold"

#define AURA_CANCEL 1
#define AURA_FALSE  2
#define AURA_TYPE_BULLET "Bullet"
#define AURA_TYPE_WEAPON "Weapon"
#define AURA_TYPE_THROWN "Thrown"
#define AURA_TYPE_LIFE   "Life"

//Social classes
#define SOCIAL_CLASS_MIN 1
#define SOCIAL_CLASS_MED 2
#define SOCIAL_CLASS_HIGH 3
#define SOCIAL_CLASS_MAX 4