const struct BattleTowerTrainer gBattleTowerTrainers[] =
{
	{
		.trainerClass = TRAINER_CLASS_YOUNGSTER,
		.name = _("ALVIN"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_READY,
				EC_WORD_QUES,
				EC_WORD_HERE_I_COME,
				EC_WORD_EXCL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BIRD_KEEPER,
		.name = _("DIRK"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_OKAY,
				EC_WORD_I_AM,
				EC_WORD_GOING,
				EC_WORD_FOR,
				EC_WORD_IT,
				EC_WORD_EXCL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_LADY,
		.name = _("CYBIL"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU_RE,
				EC_WORD_A,
				EC_WORD_PUSHOVER,
				EC_WORD_LET_S,
				EC_WORD_GET,
				EC_WORD_GOING,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BLACK_BELT,
		.name = _("CHEN"),
		.teamFlags = 0x05,
		.greeting = {
			.easyChat = {
				EC_WORD_MY,
				EC_WORD_SPIRIT,
				EC_WORD_IS,
				EC_WORD_ENOUGH,
				EC_WORD_SNORT,
				EC_WORD_ARRGH,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_NINJA_BOY,
		.name = _("YOSHI"),
		.teamFlags = 0x05,
		.greeting = {
			.easyChat = {
				EC_WORD_GO,
				EC_WORD_MY,
				EC_WORD_POKEMON,
				EC_WORD_FIGHT,
				EC_WORD_THE,
				EC_WORD_BATTLE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SCHOOL_KID_F,
		.name = _("TINA"),
		.teamFlags = 0x0A,
		.greeting = {
			.easyChat = {
				EC_WORD_STUDY,
				EC_WORD_IS,
				EC_WORD_BORING,
				EC_WORD_LET_S,
				EC_WORD_BATTLE,
				EC_WORD_NOW,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BUG_MANIAC,
		.name = _("COREY"),
		.teamFlags = 0x41,
		.greeting = {
			.easyChat = {
				EC_WORD_HEY,
				EC_WORD_I,
				EC_WORD_WILL,
				EC_MOVE2(TRANSFORM),
				EC_WORD_FOR,
				EC_MOVE(STRENGTH),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_FISHERMAN,
		.name = _("GORDON"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_NEED,
				EC_WORD_A,
				EC_WORD_VACATION,
				EC_WORD_RIGHT,
				EC_WORD_NOW,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_TUBER_F,
		.name = _("ANN"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_WE,
				EC_WORD_ALL,
				EC_WORD_ADORE,
				EC_WORD_POKEMON,
				EC_WORD_ABSOLUTELY,
				EC_WORD_TRULY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEFAN_F,
		.name = _("JULIA"),
		.teamFlags = 0x42,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_A,
				EC_WORD_CUTE,
				EC_WORD_LADY,
				EC_WORD_YES,
				EC_WORD_I_AM,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GENTLEMAN,
		.name = _("GREGORY"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_THINK,
				EC_WORD_WE,
				EC_WORD_SHOULD,
				EC_WORD_START,
				EC_WORD_TODAY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CAMPER,
		.name = _("KEITH"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU_RE,
				EC_WORD_MY,
				EC_WORD_FRIEND,
				EC_WORD_FROM,
				EC_WORD_NOW,
				EC_WORD_ON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_F,
		.name = _("KENDRA"),
		.teamFlags = 0x0A,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_MOVE(SWIFT),
				EC_WORD_HOW,
				EC_WORD_ABOUT,
				EC_WORD_YOU,
				EC_WORD_QUES,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_HIKER,
		.name = _("DEV"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_WAHAHAHA,
				EC_WORD_I_AM,
				EC_WORD_FEELING,
				EC_WORD_LIKE,
				EC_WORD_IT_S,
				EC_MOVE2(PAY_DAY),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BATTLE_GIRL,
		.name = _("CASSIE"),
		.teamFlags = 0x0A,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU_RE,
				EC_WORD_STRONG,
				EC_WORD_AREN_T,
				0xFFFF,
				EC_WORD_YOU,
				EC_WORD_QUES,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PSYCHIC_M,
		.name = _("JULIAN"),
		.teamFlags = 0x05,
		.greeting = {
			.easyChat = {
				EC_WORD_FUFUFU,
				0xFFFF,
				EC_WORD_YOU,
				EC_WORD_CAN_T,
				EC_WORD_WIN,
				EC_WORD_KID,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_LASS,
		.name = _("JOYCE"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_BE,
				EC_WORD_KIND,
				EC_WORD_TO,
				EC_WORD_THE,
				EC_WORD_DIGITAL,
				EC_WORD_IDOL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GUITARIST,
		.name = _("LES"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_GREAT,
				EC_WORD_YOU_RE,
				EC_WORD_JUST,
				EC_WORD_RATHER,
				EC_WORD_OKAY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RICH_BOY,
		.name = _("CLINTON"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_HAVE,
				EC_WORD_ROUGH_SKIN,
				EC_WORD_I,
				EC_WORD_NEED,
				EC_WORD_NATURAL_CURE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BUG_CATCHER,
		.name = _("LEWIS"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_THIS,
				EC_WORD_IS,
				EC_WORD_EXCITING,
				EC_WORD_CAN,
				EC_WORD_I,
				EC_WORD_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PICNICKER,
		.name = _("RACHAEL"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_LIKE,
				EC_WORD_WALKING,
				EC_WORD_WITH,
				EC_WORD_MY,
				EC_WORD_POKEMON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COLLECTOR,
		.name = _("HAROLD"),
		.teamFlags = 0x09,
		.greeting = {
			.easyChat = {
				EC_WORD_HERE,
				EC_WORD_THEY,
				EC_WORD_COME,
				EC_WORD_MY,
				EC_MOVE2(SUPERPOWER),
				EC_WORD_POKEMON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_TUBER_M,
		.name = _("KIPP"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_A,
				EC_WORD_GENIUS,
				EC_WORD_I,
				EC_WORD_SHOULD,
				EC_WORD_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_KINDLER,
		.name = _("IRWIN"),
		.teamFlags = 0x05,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU,
				EC_WORD_WILL,
				EC_WORD_BE,
				EC_WORD_FEELING,
				EC_WORD_MY,
				EC_WORD_FIRE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PSYCHIC_F,
		.name = _("EILEEN"),
		.teamFlags = 0x0A,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_WILL,
				EC_MOVE(ASTONISH),
				EC_WORD_YOU,
				EC_WORD_IN,
				EC_WORD_BATTLE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMER_F,
		.name = _("ANNE"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_SORRY,
				EC_WORD_BUT,
				EC_WORD_YOU,
				EC_WORD_WILL,
				EC_WORD_NOT,
				EC_WORD_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_F,
		.name = _("RUTH"),
		.teamFlags = 0x06,
		.greeting = {
			.easyChat = {
				EC_WORD_A,
				EC_WORD_STRONG,
				EC_WORD_GIRL,
				EC_WORD_WANTS,
				EC_WORD_TOUGH,
				EC_WORD_POKEMON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMANIAC,
		.name = _("JEREMY"),
		.teamFlags = 0x40,
		.greeting = {
			.easyChat = {
				EC_WORD_MY,
				EC_WORD_POKEMON,
				EC_WORD_ARE,
				EC_WORD_COOL,
				EC_WORD_YOURS,
				EC_WORD_CAN_T_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SAILOR,
		.name = _("TREVOR"),
		.teamFlags = 0x09,
		.greeting = {
			.easyChat = {
				EC_WORD_MY,
				EC_WORD_OPPONENT,
				EC_WORD_IS,
				EC_WORD_FINALLY,
				EC_WORD_HERE,
				EC_WORD_EXCELLENT,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_BREEDER_F,
		.name = _("COLETTE"),
		.teamFlags = 0x06,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_AM,
				EC_WORD_HUNGRY,
				EC_MOVE2(POUND),
				EC_WORD_MY,
				EC_MOVE2(BELLY_DRUM),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_HEX_MANIAC,
		.name = _("PAULA"),
		.teamFlags = 0x42,
		.greeting = {
			.easyChat = {
				EC_WORD_IT_S,
				EC_WORD_HARD,
				EC_WORD_TO,
				EC_WORD_TAKE,
				EC_WORD_UGLY,
				EC_MOVE(SPITE),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUIN_MANIAC,
		.name = _("STANLY"),
		.teamFlags = 0x41,
		.greeting = {
			.easyChat = {
				EC_WORD_ADVENTURE,
				EC_WORD_AND,
				EC_WORD_BATTLE,
				EC_WORD_ARE,
				EC_WORD_MY,
				EC_WORD_LIKES,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
		.name = _("TROY"),
		.teamFlags = 0x09,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU,
				EC_WORD_CAN_T,
				EC_WORD_LOSE,
				EC_WORD_TO,
				EC_WORD_A,
				EC_WORD_KID,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SCHOOL_KID_M,
		.name = _("ED"),
		.teamFlags = 0x08,
		.greeting = {
			.easyChat = {
				EC_WORD_POKEMON,
				EC_WORD_DAILY,
				EC_WORD_AT,
				EC_WORD_SCHOOL,
				EC_WORD_IT_S,
				EC_WORD_AWESOME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_RANGER_F,
		.name = _("ELLEN"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_KIND,
				EC_WORD_TO,
				EC_WORD_YOUR,
				EC_WORD_POKEMON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMER_M,
		.name = _("ARNIE"),
		.teamFlags = 0x09,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_BATTLE,
				EC_WORD_SERIOUSLY,
				EC_WORD_BEAUTIFUL,
				EC_WORD_YOU,
				EC_MOVE(DIG),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_M,
		.name = _("HAL"),
		.teamFlags = 0x09,
		.greeting = {
			.easyChat = {
				EC_WORD_BOY,
				EC_WORD_I_AM,
				EC_WORD_TIRED,
				EC_WORD_READY,
				EC_WORD_FOR,
				EC_WORD_SLEEP,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BEAUTY,
		.name = _("LAUREN"),
		.teamFlags = 0x06,
		.greeting = {
			.easyChat = {
				EC_WORD_A,
				EC_WORD_TRAINER,
				EC_WORD_LIKE,
				EC_WORD_YOU,
				EC_WORD_IS,
				EC_WORD_EXCITING,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_AROMA_LADY,
		.name = _("STACY"),
		.teamFlags = 0x06,
		.greeting = {
			.easyChat = {
				EC_WORD_HAVE,
				EC_WORD_YOU,
				EC_WORD_A,
				EC_WORD_STENCH,
				EC_WORD_OR,
				EC_MOVE(SWEET_SCENT),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COLLECTOR,
		.name = _("DARYL"),
		.teamFlags = 0x81,
		.greeting = {
			.easyChat = {
				EC_WORD_YOUR,
				EC_WORD_POKEMON,
				EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
				EC_WORD_I,
				EC_WORD_WANT,
				EC_WORD_IT,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
		.name = _("KATHY"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_WILL,
				EC_WORD_TRY,
				EC_WORD_MY,
				EC_WORD_BEST,
				EC_WORD_TODAY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_RANGER_M,
		.name = _("HARRIS"),
		.teamFlags = 0x0C,
		.greeting = {
			.easyChat = {
				EC_WORD_WAAAH,
				EC_WORD_WAAAH,
				EC_WORD_WAAAH,
				EC_WORD_WAAAH,
				EC_WORD_EHEHE,
				EC_MOVE(FAKE_TEARS),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEFAN_M,
		.name = _("GLENN"),
		.teamFlags = 0x80,
		.greeting = {
			.easyChat = {
				EC_WORD_LISTEN,
				EC_WORD_TO,
				EC_WORD_MY,
				EC_WORD_LOUSY,
				EC_WORD_ANIME,
				EC_WORD_SONG,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_M,
		.name = _("NICO"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_DON_T,
				EC_WORD_JUST,
				EC_WORD_BATTLE,
				EC_WORD_DO,
				EC_WORD_SOMETHING,
				EC_WORD_ELSE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_BREEDER_M,
		.name = _("BAILEY"),
		.teamFlags = 0x41,
		.greeting = {
			.easyChat = {
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_BUSY,
				EC_WORD_GET,
				EC_WORD_WITH,
				EC_WORD_IT,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PARASOL_LADY,
		.name = _("ABBIE"),
		.teamFlags = 0x08,
		.greeting = {
			.easyChat = {
				EC_WORD_THE,
				EC_MOVE(MORNING_SUN),
				EC_WORD_HAS,
				EC_WORD_SO,
				EC_WORD_MUCH,
				EC_MOVE(COSMIC_POWER),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CAMPER,
		.name = _("AL"),
		.teamFlags = 0x0C,
		.greeting = {
			.easyChat = {
				EC_WORD_LET_S,
				EC_WORD_HAVE,
				EC_WORD_AN,
				EC_WORD_EXCITING,
				EC_WORD_BATTLE,
				EC_WORD_YEEHAW_EXCL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SCHOOL_KID_F,
		.name = _("PEGGY"),
		.teamFlags = 0x42,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_WANT,
				EC_WORD_TO,
				EC_WORD_SEE,
				EC_WORD_SOME,
				EC_MOVE(GROWTH),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BEAUTY,
		.name = _("NAOMI"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_IT,
				EC_WORD_WAS,
				EC_WORD_GREAT,
				EC_WORD_TO,
				EC_WORD_BE,
				EC_WORD_YOUNG,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_NINJA_BOY,
		.name = _("KENJI"),
		.teamFlags = 0x0C,
		.greeting = {
			.easyChat = {
				EC_WORD_PLEASE,
				0xFFFF,
				EC_WORD_DON_T,
				EC_WORD_BE,
				EC_WORD_MEAN,
				EC_WORD_TO_ME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_M,
		.name = _("ROSS"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_WAKE_UP,
				EC_WORD_MY,
				EC_MOVE2(HIDDEN_POWER),
				EC_WORD_AND,
				EC_MOVE(ASTONISH),
				EC_WORD_ME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_RANGER_F,
		.name = _("EDNA"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_BATTLE_TOWER,
				EC_WORD_IS,
				EC_WORD_SO,
				EC_WORD_ENTERTAINING,
				EC_WORD_IT_S,
				EC_WORD_AWESOME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUIN_MANIAC,
		.name = _("ANTON"),
		.teamFlags = 0x41,
		.greeting = {
			.easyChat = {
				EC_WORD_BLEND,
				EC_WORD_THICK_FAT,
				EC_WORD_AND,
				EC_WORD_CHLOROPHYLL,
				EC_WORD_IT_S,
				EC_WORD_TASTY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMER_M,
		.name = _("MITCH"),
		.teamFlags = 0x81,
		.greeting = {
			.easyChat = {
				EC_WORD_NEXT,
				EC_WORD_A,
				EC_WORD_GIRL,
				EC_WORD_WITH,
				EC_WORD_A,
				EC_MOVE(SCARY_FACE),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_HEX_MANIAC,
		.name = _("ROD"),
		.teamFlags = 0x42,
		.greeting = {
			.easyChat = {
				EC_WORD_GIMME,
				EC_WORD_A,
				EC_WORD_TOUGH,
				EC_WORD_BATTLE,
				EC_WORD_NOT,
				EC_WORD_WIMPY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_M,
		.name = _("RICH"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_TASTY,
				EC_WORD_WATER,
				EC_WORD_IS,
				EC_WORD_HIP_AND,
				EC_WORD_HAPPENING,
				EC_WORD_YES_SIR_EXCL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEFAN_M,
		.name = _("DANIEL"),
		.teamFlags = 0x80,
		.greeting = {
			.easyChat = {
				EC_WORD_GO,
				EC_WORD_FOR,
				EC_WORD_IT,
				EC_WORD_MY,
				EC_WORD_LOVEY_DOVEY,
				EC_WORD_POKEMON,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PSYCHIC_F,
		.name = _("GLORIA"),
		.teamFlags = 0x82,
		.greeting = {
			.easyChat = {
				EC_WORD_LET_S,
				EC_WORD_GET,
				EC_WORD_THIS,
				EC_WORD_FIERY,
				EC_WORD_BATTLE,
				EC_WORD_HAPPENING,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GUITARIST,
		.name = _("NELSON"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_MUSIC,
				EC_WORD_IS,
				EC_WORD_MY,
				EC_WORD_ALL,
				EC_WORD_MY,
				EC_WORD_DESTINY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_KINDLER,
		.name = _("FERRIS"),
		.teamFlags = 0x41,
		.greeting = {
			.easyChat = {
				EC_WORD_GOOD,
				EC_WORD_IT,
				EC_WORD_IS,
				EC_WORD_SO,
				EC_WORD_VERY,
				EC_WORD_GOOD,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_AROMA_LADY,
		.name = _("AMANDA"),
		.teamFlags = 0x82,
		.greeting = {
			.easyChat = {
				EC_WORD_WHAT,
				EC_WORD_KIND,
				EC_WORD_OF,
				EC_WORD_TRAINER,
				EC_WORD_ARE,
				EC_WORD_YOU,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
		.name = _("MASON"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_DON_T,
				EC_WORD_KNOW,
				EC_WORD_HOW,
				EC_WORD_TO,
				EC_WORD_LOSE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_DRAGON_TAMER,
		.name = _("NATE"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_DRAGON,
				EC_WORD_POKEMON,
				EC_WORD_ARE,
				EC_WORD_ALL,
				EC_WORD_THE,
				EC_MOVE(RAGE),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_LASS,
		.name = _("MIRIAM"),
		.teamFlags = 0x82,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU_RE,
				EC_WORD_TOO_STRONG,
				EC_WORD_SERIOUSLY,
				EC_WORD_IT_S,
				EC_WORD_BAD,
				EC_WORD_NEWS,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMANIAC,
		.name = _("THEO"),
		.teamFlags = 0x40,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_ADORE,
				EC_WORD_MY,
				EC_WORD_MEGA,
				EC_WORD_CUTE,
				EC_WORD_PLUSH_DOLL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
		.name = _("PAMELA"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_HERE_I_COME,
				EC_WORD_I_AM,
				EC_WORD_THE,
				EC_WORD_CUTE,
				EC_MOVE2(WATER_SPORT),
				EC_WORD_IDOL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEFAN_F,
		.name = _("ALISSA"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_IT_S,
				EC_WORD_A,
				EC_WORD_PREPOSTEROUS,
				EC_WORD_MATCH,
				EC_WORD_I_AM,
				EC_WORD_SHOCKED,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GENTLEMAN,
		.name = _("ARTHUR"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_PLEASE,
				EC_WORD_GIVE,
				EC_WORD_ME,
				EC_WORD_A,
				EC_WORD_GOOD,
				EC_WORD_BATTLE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMER_F,
		.name = _("MARCY"),
		.teamFlags = 0x82,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_BEAUTIFUL,
				EC_WORD_YOU,
				EC_WORD_CAN_T,
				EC_WORD_BEAT,
				EC_WORD_ME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COOL_TRAINER_M,
		.name = _("MILLER"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_BATTLE,
				EC_WORD_DAILY,
				EC_WORD_I,
				EC_WORD_WON_T,
				EC_WORD_LOSE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BIRD_KEEPER,
		.name = _("OLIVER"),
		.teamFlags = 0x11,
		.greeting = {
			.easyChat = {
				EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
				EC_WORD_GIGGLE,
				EC_WORD_ELLIPSIS_ELLIPSIS_ELLIPSIS,
				0xFFFF,
				0xFFFF,
				0xFFFF,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_CYCLING_TRIATHLETE_F,
		.name = _("MOLLY"),
		.teamFlags = 0x12,
		.greeting = {
			.easyChat = {
				EC_WORD_HOW,
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_ON,
				EC_WORD_MONDAY,
				EC_WORD_MORNING,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BUG_MANIAC,
		.name = _("JASON"),
		.teamFlags = 0x40,
		.greeting = {
			.easyChat = {
				EC_WORD_WATER,
				EC_WORD_AND,
				EC_WORD_BUG,
				EC_WORD_POKEMON,
				EC_WORD_ARE,
				EC_WORD_GREAT,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BATTLE_GIRL,
		.name = _("AVA"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_WHAT,
				EC_WORD_IS,
				EC_WORD_THIS,
				EC_WORD_PRESSURE,
				EC_WORD_ELLIPSIS,
				EC_WORD_STATIC,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_FISHERMAN,
		.name = _("HANK"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU_RE,
				EC_WORD_A,
				EC_WORD_KID,
				EC_WORD_YOU,
				EC_WORD_CAN_T,
				EC_WORD_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SAILOR,
		.name = _("PETER"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_IT_S,
				EC_WORD_SERIOUSLY,
				EC_WORD_TERRIBLE,
				EC_WORD_I,
				EC_WORD_REALLY,
				EC_WORD_THINK,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_EXPERT_F,
		.name = _("MINDY"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU,
				EC_WORD_APPEAR,
				EC_WORD_TO,
				EC_WORD_TRAIN,
				EC_WORD_VERY,
				EC_WORD_WELL,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BUG_MANIAC,
		.name = _("DWIGHT"),
		.teamFlags = 0x11,
		.greeting = {
			.easyChat = {
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_STRONG,
				EC_WORD_YOU,
				EC_WORD_ARE,
				EC_WORD_SCARY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_BREEDER_F,
		.name = _("REENA"),
		.teamFlags = 0x12,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_ALWAYS,
				EC_WORD_LOSE,
				EC_WORD_MAYBE,
				EC_WORD_TODAY,
				EC_WORD_ELLIPSIS,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PARASOL_LADY,
		.name = _("MEGAN"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_DON_T,
				EC_WORD_MAKE,
				EC_WORD_THAT,
				EC_MOVE(SCARY_FACE),
				EC_WORD_AT,
				EC_WORD_ME,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_RUNNING_TRIATHLETE_F,
		.name = _("SIERRA"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_I_VE,
				EC_WORD_RUN,
				EC_WORD_A_LOT,
				EC_WORD_SO,
				EC_WORD_I_AM,
				EC_WORD_HEALTHY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_RANGER_M,
		.name = _("ARNOLD"),
		.teamFlags = 0x08,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_FEELING,
				EC_WORD_AWESOME,
				EC_WORD_MY,
				EC_WORD_POKEMON,
				EC_WORD_ROCK,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BLACK_BELT,
		.name = _("XIN"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_HOO_HAH,
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_READY,
				EC_WORD_TO,
				EC_WORD_ROCK,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COOL_TRAINER_F,
		.name = _("KELLY"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_YOU,
				EC_WORD_COULDN_T,
				EC_WORD_BEAT,
				EC_WORD_ME,
				EC_WORD_EVER,
				EC_WORD_KID,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COLLECTOR,
		.name = _("VANCE"),
		.teamFlags = 0x80,
		.greeting = {
			.easyChat = {
				EC_WORD_POKEMON,
				EC_WORD_ALL,
				EC_WORD_OVER,
				EC_WORD_THE,
				EC_WORD_PLACE,
				EC_WORD_WOWEE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
		.name = _("TOBY"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_THIS,
				EC_WORD_ISN_T,
				EC_WORD_SPORTS,
				EC_WORD_IT_S,
				EC_WORD_A,
				EC_WORD_BATTLE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GENTLEMAN,
		.name = _("NORTON"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_HAVE,
				EC_WORD_TO,
				EC_WORD_WIN,
				EC_WORD_PLEASE,
				EC_WORD_LOSE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BATTLE_GIRL,
		.name = _("ZOE"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_THIS,
				EC_WORD_IS,
				EC_WORD_SCARY,
				EC_WORD_PLEASE,
				EC_WORD_BE,
				EC_WORD_NICE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_BEAUTY,
		.name = _("EMMA"),
		.teamFlags = 0x20,
		.greeting = {
			.easyChat = {
				EC_WORD_DON_T,
				EC_WORD_YOU,
				EC_MOVE(FLAIL),
				EC_WORD_YOU,
				EC_WORD_CAN_T,
				EC_MOVE(WITHDRAW),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_HIKER,
		.name = _("VINCE"),
		.teamFlags = 0x04,
		.greeting = {
			.easyChat = {
				EC_WORD_YAHOO,
				EC_WORD_YAHOO,
				EC_WORD_ARE,
				EC_WORD_YOU,
				EC_WORD_LISTENING,
				EC_WORD_QUES,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_EXPERT_M,
		.name = _("MARV"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_LEARN,
				EC_WORD_TO,
				EC_WORD_BATTLE,
				EC_WORD_THE,
				EC_WORD_CORRECT,
				EC_WORD_WAY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_POKEMON_BREEDER_M,
		.name = _("TODD"),
		.teamFlags = 0x40,
		.greeting = {
			.easyChat = {
				EC_WORD_THE,
				EC_WORD_WAY,
				EC_WORD_YOU,
				EC_WORD_BATTLE,
				EC_WORD_IT_S,
				EC_WORD_CHILD_S_PLAY,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_GUITARIST,
		.name = _("GAVIN"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_BABY,
				EC_WORD_BABY,
				EC_WORD_BABY,
				EC_WORD_ROCK,
				EC_WORD_ME,
				EC_WORD_HARD,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_PSYCHIC_M,
		.name = _("QUINN"),
		.teamFlags = 0x08,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_HAVE,
				EC_WORD_A,
				EC_WORD_STICKY_HOLD,
				EC_WORD_ON,
				EC_WORD_YOU,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COOL_TRAINER_F,
		.name = _("JENN"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_I_AM,
				EC_WORD_ON,
				EC_WORD_A,
				EC_WORD_TOUGH,
				EC_WORD_TRAINER,
				EC_WORD_SEARCH,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_EXPERT_M,
		.name = _("JOEL"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_BELIEVE,
				EC_WORD_IN,
				EC_WORD_YOUR,
				EC_WORD_POKEMON,
				EC_WORD_AND,
				EC_WORD_WIN,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_DRAGON_TAMER,
		.name = _("KYLE"),
		.teamFlags = 0x0C,
		.greeting = {
			.easyChat = {
				EC_WORD_I,
				EC_WORD_LIKE,
				EC_WORD_A,
				EC_WORD_GIRL,
				EC_WORD_WITH,
				EC_MOVE2(FORESIGHT),
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_COOL_TRAINER_M,
		.name = _("BRET"),
		.teamFlags = 0x01,
		.greeting = {
			.easyChat = {
				EC_WORD_TAKE,
				EC_WORD_MY,
				EC_WORD_OVERWHELMING,
				EC_WORD_POWER,
				EC_WORD_AND,
				EC_WORD_DISAPPEAR,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_EXPERT_F,
		.name = _("CARRIE"),
		.teamFlags = 0x10,
		.greeting = {
			.easyChat = {
				EC_WORD_TRAINER,
				EC_WORD_I,
				EC_WORD_SEE,
				EC_WORD_YOU,
				EC_WORD_ARE,
				EC_WORD_CAPABLE,
			},
		},
	},
	{
		.trainerClass = TRAINER_CLASS_LADY,
		.name = _("GILLIAN"),
		.teamFlags = 0x02,
		.greeting = {
			.easyChat = {
				EC_WORD_COME_ON,
				EC_WORD_SHOW,
				EC_WORD_ME,
				EC_WORD_AN,
				EC_WORD_EXCELLENT,
				EC_WORD_TIME,
			},
		},
	},
};
