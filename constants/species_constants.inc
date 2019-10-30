	.include "asm/macros/asm.inc"

	enum_start
	enum SPECIES_NONE       @ 0x000
	enum SPECIES_BULBASAUR  @ 0x001
	enum SPECIES_IVYSAUR    @ 0x002
	enum SPECIES_VENUSAUR   @ 0x003
	enum SPECIES_CHARMANDER @ 0x004
	enum SPECIES_CHARMELEON @ 0x005
	enum SPECIES_CHARIZARD  @ 0x006
	enum SPECIES_SQUIRTLE   @ 0x007
	enum SPECIES_WARTORTLE  @ 0x008
	enum SPECIES_BLASTOISE  @ 0x009
	enum SPECIES_CATERPIE   @ 0x00a
	enum SPECIES_METAPOD    @ 0x00b
	enum SPECIES_BUTTERFREE @ 0x00c
	enum SPECIES_WEEDLE     @ 0x00d
	enum SPECIES_KAKUNA     @ 0x00e
	enum SPECIES_BEEDRILL   @ 0x00f
	enum SPECIES_PIDGEY     @ 0x010
	enum SPECIES_PIDGEOTTO  @ 0x011
	enum SPECIES_PIDGEOT    @ 0x012
	enum SPECIES_RATTATA    @ 0x013
	enum SPECIES_RATICATE   @ 0x014
	enum SPECIES_SPEAROW    @ 0x015
	enum SPECIES_FEAROW     @ 0x016
	enum SPECIES_EKANS      @ 0x017
	enum SPECIES_ARBOK      @ 0x018
	enum SPECIES_PIKACHU    @ 0x019
	enum SPECIES_RAICHU     @ 0x01a
	enum SPECIES_SANDSHREW  @ 0x01b
	enum SPECIES_SANDSLASH  @ 0x01c
	enum SPECIES_NIDORAN_F  @ 0x01d
	enum SPECIES_NIDORINA   @ 0x01e
	enum SPECIES_NIDOQUEEN  @ 0x01f
	enum SPECIES_NIDORAN_M  @ 0x020
	enum SPECIES_NIDORINO   @ 0x021
	enum SPECIES_NIDOKING   @ 0x022
	enum SPECIES_CLEFAIRY   @ 0x023
	enum SPECIES_CLEFABLE   @ 0x024
	enum SPECIES_VULPIX     @ 0x025
	enum SPECIES_NINETALES  @ 0x026
	enum SPECIES_JIGGLYPUFF @ 0x027
	enum SPECIES_WIGGLYTUFF @ 0x028
	enum SPECIES_ZUBAT      @ 0x029
	enum SPECIES_GOLBAT     @ 0x02a
	enum SPECIES_ODDISH     @ 0x02b
	enum SPECIES_GLOOM      @ 0x02c
	enum SPECIES_VILEPLUME  @ 0x02d
	enum SPECIES_PARAS      @ 0x02e
	enum SPECIES_PARASECT   @ 0x02f
	enum SPECIES_VENONAT    @ 0x030
	enum SPECIES_VENOMOTH   @ 0x031
	enum SPECIES_DIGLETT    @ 0x032
	enum SPECIES_DUGTRIO    @ 0x033
	enum SPECIES_MEOWTH     @ 0x034
	enum SPECIES_PERSIAN    @ 0x035
	enum SPECIES_PSYDUCK    @ 0x036
	enum SPECIES_GOLDUCK    @ 0x037
	enum SPECIES_MANKEY     @ 0x038
	enum SPECIES_PRIMEAPE   @ 0x039
	enum SPECIES_GROWLITHE  @ 0x03a
	enum SPECIES_ARCANINE   @ 0x03b
	enum SPECIES_POLIWAG    @ 0x03c
	enum SPECIES_POLIWHIRL  @ 0x03d
	enum SPECIES_POLIWRATH  @ 0x03e
	enum SPECIES_ABRA       @ 0x03f
	enum SPECIES_KADABRA    @ 0x040
	enum SPECIES_ALAKAZAM   @ 0x041
	enum SPECIES_MACHOP     @ 0x042
	enum SPECIES_MACHOKE    @ 0x043
	enum SPECIES_MACHAMP    @ 0x044
	enum SPECIES_BELLSPROUT @ 0x045
	enum SPECIES_WEEPINBELL @ 0x046
	enum SPECIES_VICTREEBEL @ 0x047
	enum SPECIES_TENTACOOL  @ 0x048
	enum SPECIES_TENTACRUEL @ 0x049
	enum SPECIES_GEODUDE    @ 0x04a
	enum SPECIES_GRAVELER   @ 0x04b
	enum SPECIES_GOLEM      @ 0x04c
	enum SPECIES_PONYTA     @ 0x04d
	enum SPECIES_RAPIDASH   @ 0x04e
	enum SPECIES_SLOWPOKE   @ 0x04f
	enum SPECIES_SLOWBRO    @ 0x050
	enum SPECIES_MAGNEMITE  @ 0x051
	enum SPECIES_MAGNETON   @ 0x052
	enum SPECIES_FARFETCHD  @ 0x053
	enum SPECIES_DODUO      @ 0x054
	enum SPECIES_DODRIO     @ 0x055
	enum SPECIES_SEEL       @ 0x056
	enum SPECIES_DEWGONG    @ 0x057
	enum SPECIES_GRIMER     @ 0x058
	enum SPECIES_MUK        @ 0x059
	enum SPECIES_SHELLDER   @ 0x05a
	enum SPECIES_CLOYSTER   @ 0x05b
	enum SPECIES_GASTLY     @ 0x05c
	enum SPECIES_HAUNTER    @ 0x05d
	enum SPECIES_GENGAR     @ 0x05e
	enum SPECIES_ONIX       @ 0x05f
	enum SPECIES_DROWZEE    @ 0x060
	enum SPECIES_HYPNO      @ 0x061
	enum SPECIES_KRABBY     @ 0x062
	enum SPECIES_KINGLER    @ 0x063
	enum SPECIES_VOLTORB    @ 0x064
	enum SPECIES_ELECTRODE  @ 0x065
	enum SPECIES_EXEGGCUTE  @ 0x066
	enum SPECIES_EXEGGUTOR  @ 0x067
	enum SPECIES_CUBONE     @ 0x068
	enum SPECIES_MAROWAK    @ 0x069
	enum SPECIES_HITMONLEE  @ 0x06a
	enum SPECIES_HITMONCHAN @ 0x06b
	enum SPECIES_LICKITUNG  @ 0x06c
	enum SPECIES_KOFFING    @ 0x06d
	enum SPECIES_WEEZING    @ 0x06e
	enum SPECIES_RHYHORN    @ 0x06f
	enum SPECIES_RHYDON     @ 0x070
	enum SPECIES_CHANSEY    @ 0x071
	enum SPECIES_TANGELA    @ 0x072
	enum SPECIES_KANGASKHAN @ 0x073
	enum SPECIES_HORSEA     @ 0x074
	enum SPECIES_SEADRA     @ 0x075
	enum SPECIES_GOLDEEN    @ 0x076
	enum SPECIES_SEAKING    @ 0x077
	enum SPECIES_STARYU     @ 0x078
	enum SPECIES_STARMIE    @ 0x079
	enum SPECIES_MR_MIME    @ 0x07a
	enum SPECIES_SCYTHER    @ 0x07b
	enum SPECIES_JYNX       @ 0x07c
	enum SPECIES_ELECTABUZZ @ 0x07d
	enum SPECIES_MAGMAR     @ 0x07e
	enum SPECIES_PINSIR     @ 0x07f
	enum SPECIES_TAUROS     @ 0x080
	enum SPECIES_MAGIKARP   @ 0x081
	enum SPECIES_GYARADOS   @ 0x082
	enum SPECIES_LAPRAS     @ 0x083
	enum SPECIES_DITTO      @ 0x084
	enum SPECIES_EEVEE      @ 0x085
	enum SPECIES_VAPOREON   @ 0x086
	enum SPECIES_JOLTEON    @ 0x087
	enum SPECIES_FLAREON    @ 0x088
	enum SPECIES_PORYGON    @ 0x089
	enum SPECIES_OMANYTE    @ 0x08a
	enum SPECIES_OMASTAR    @ 0x08b
	enum SPECIES_KABUTO     @ 0x08c
	enum SPECIES_KABUTOPS   @ 0x08d
	enum SPECIES_AERODACTYL @ 0x08e
	enum SPECIES_SNORLAX    @ 0x08f
	enum SPECIES_ARTICUNO   @ 0x090
	enum SPECIES_ZAPDOS     @ 0x091
	enum SPECIES_MOLTRES    @ 0x092
	enum SPECIES_DRATINI    @ 0x093
	enum SPECIES_DRAGONAIR  @ 0x094
	enum SPECIES_DRAGONITE  @ 0x095
	enum SPECIES_MEWTWO     @ 0x096
	enum SPECIES_MEW        @ 0x097
	enum SPECIES_CHIKORITA  @ 0x098
	enum SPECIES_BAYLEEF    @ 0x099
	enum SPECIES_MEGANIUM   @ 0x09a
	enum SPECIES_CYNDAQUIL  @ 0x09b
	enum SPECIES_QUILAVA    @ 0x09c
	enum SPECIES_TYPHLOSION @ 0x09d
	enum SPECIES_TOTODILE   @ 0x09e
	enum SPECIES_CROCONAW   @ 0x09f
	enum SPECIES_FERALIGATR @ 0x0a0
	enum SPECIES_SENTRET    @ 0x0a1
	enum SPECIES_FURRET     @ 0x0a2
	enum SPECIES_HOOTHOOT   @ 0x0a3
	enum SPECIES_NOCTOWL    @ 0x0a4
	enum SPECIES_LEDYBA     @ 0x0a5
	enum SPECIES_LEDIAN     @ 0x0a6
	enum SPECIES_SPINARAK   @ 0x0a7
	enum SPECIES_ARIADOS    @ 0x0a8
	enum SPECIES_CROBAT     @ 0x0a9
	enum SPECIES_CHINCHOU   @ 0x0aa
	enum SPECIES_LANTURN    @ 0x0ab
	enum SPECIES_PICHU      @ 0x0ac
	enum SPECIES_CLEFFA     @ 0x0ad
	enum SPECIES_IGGLYBUFF  @ 0x0ae
	enum SPECIES_TOGEPI     @ 0x0af
	enum SPECIES_TOGETIC    @ 0x0b0
	enum SPECIES_NATU       @ 0x0b1
	enum SPECIES_XATU       @ 0x0b2
	enum SPECIES_MAREEP     @ 0x0b3
	enum SPECIES_FLAAFFY    @ 0x0b4
	enum SPECIES_AMPHAROS   @ 0x0b5
	enum SPECIES_BELLOSSOM  @ 0x0b6
	enum SPECIES_MARILL     @ 0x0b7
	enum SPECIES_AZUMARILL  @ 0x0b8
	enum SPECIES_SUDOWOODO  @ 0x0b9
	enum SPECIES_POLITOED   @ 0x0ba
	enum SPECIES_HOPPIP     @ 0x0bb
	enum SPECIES_SKIPLOOM   @ 0x0bc
	enum SPECIES_JUMPLUFF   @ 0x0bd
	enum SPECIES_AIPOM      @ 0x0be
	enum SPECIES_SUNKERN    @ 0x0bf
	enum SPECIES_SUNFLORA   @ 0x0c0
	enum SPECIES_YANMA      @ 0x0c1
	enum SPECIES_WOOPER     @ 0x0c2
	enum SPECIES_QUAGSIRE   @ 0x0c3
	enum SPECIES_ESPEON     @ 0x0c4
	enum SPECIES_UMBREON    @ 0x0c5
	enum SPECIES_MURKROW    @ 0x0c6
	enum SPECIES_SLOWKING   @ 0x0c7
	enum SPECIES_MISDREAVUS @ 0x0c8
	enum SPECIES_UNOWN      @ 0x0c9
	enum SPECIES_WOBBUFFET  @ 0x0ca
	enum SPECIES_GIRAFARIG  @ 0x0cb
	enum SPECIES_PINECO     @ 0x0cc
	enum SPECIES_FORRETRESS @ 0x0cd
	enum SPECIES_DUNSPARCE  @ 0x0ce
	enum SPECIES_GLIGAR     @ 0x0cf
	enum SPECIES_STEELIX    @ 0x0d0
	enum SPECIES_SNUBBULL   @ 0x0d1
	enum SPECIES_GRANBULL   @ 0x0d2
	enum SPECIES_QWILFISH   @ 0x0d3
	enum SPECIES_SCIZOR     @ 0x0d4
	enum SPECIES_SHUCKLE    @ 0x0d5
	enum SPECIES_HERACROSS  @ 0x0d6
	enum SPECIES_SNEASEL    @ 0x0d7
	enum SPECIES_TEDDIURSA  @ 0x0d8
	enum SPECIES_URSARING   @ 0x0d9
	enum SPECIES_SLUGMA     @ 0x0da
	enum SPECIES_MAGCARGO   @ 0x0db
	enum SPECIES_SWINUB     @ 0x0dc
	enum SPECIES_PILOSWINE  @ 0x0dd
	enum SPECIES_CORSOLA    @ 0x0de
	enum SPECIES_REMORAID   @ 0x0df
	enum SPECIES_OCTILLERY  @ 0x0e0
	enum SPECIES_DELIBIRD   @ 0x0e1
	enum SPECIES_MANTINE    @ 0x0e2
	enum SPECIES_SKARMORY   @ 0x0e3
	enum SPECIES_HOUNDOUR   @ 0x0e4
	enum SPECIES_HOUNDOOM   @ 0x0e5
	enum SPECIES_KINGDRA    @ 0x0e6
	enum SPECIES_PHANPY     @ 0x0e7
	enum SPECIES_DONPHAN    @ 0x0e8
	enum SPECIES_PORYGON2   @ 0x0e9
	enum SPECIES_STANTLER   @ 0x0ea
	enum SPECIES_SMEARGLE   @ 0x0eb
	enum SPECIES_TYROGUE    @ 0x0ec
	enum SPECIES_HITMONTOP  @ 0x0ed
	enum SPECIES_SMOOCHUM   @ 0x0ee
	enum SPECIES_ELEKID     @ 0x0ef
	enum SPECIES_MAGBY      @ 0x0f0
	enum SPECIES_MILTANK    @ 0x0f1
	enum SPECIES_BLISSEY    @ 0x0f2
	enum SPECIES_RAIKOU     @ 0x0f3
	enum SPECIES_ENTEI      @ 0x0f4
	enum SPECIES_SUICUNE    @ 0x0f5
	enum SPECIES_LARVITAR   @ 0x0f6
	enum SPECIES_PUPITAR    @ 0x0f7
	enum SPECIES_TYRANITAR  @ 0x0f8
	enum SPECIES_LUGIA      @ 0x0f9
	enum SPECIES_HO_OH      @ 0x0fa
	enum SPECIES_CELEBI     @ 0x0fb

	enum SPECIES_OLD_UNOWN_B
	enum SPECIES_OLD_UNOWN_C
	enum SPECIES_OLD_UNOWN_D
	enum SPECIES_OLD_UNOWN_E
	enum SPECIES_OLD_UNOWN_F
	enum SPECIES_OLD_UNOWN_G
	enum SPECIES_OLD_UNOWN_H
	enum SPECIES_OLD_UNOWN_I
	enum SPECIES_OLD_UNOWN_J
	enum SPECIES_OLD_UNOWN_K
	enum SPECIES_OLD_UNOWN_L
	enum SPECIES_OLD_UNOWN_M
	enum SPECIES_OLD_UNOWN_N
	enum SPECIES_OLD_UNOWN_O
	enum SPECIES_OLD_UNOWN_P
	enum SPECIES_OLD_UNOWN_Q
	enum SPECIES_OLD_UNOWN_R
	enum SPECIES_OLD_UNOWN_S
	enum SPECIES_OLD_UNOWN_T
	enum SPECIES_OLD_UNOWN_U
	enum SPECIES_OLD_UNOWN_V
	enum SPECIES_OLD_UNOWN_W
	enum SPECIES_OLD_UNOWN_X
	enum SPECIES_OLD_UNOWN_Y
	enum SPECIES_OLD_UNOWN_Z

	enum SPECIES_TREECKO    @ 0x115
	enum SPECIES_GROVYLE    @ 0x116
	enum SPECIES_SCEPTILE   @ 0x117
	enum SPECIES_TORCHIC    @ 0x118
	enum SPECIES_COMBUSKEN  @ 0x119
	enum SPECIES_BLAZIKEN   @ 0x11a
	enum SPECIES_MUDKIP     @ 0x11b
	enum SPECIES_MARSHTOMP  @ 0x11c
	enum SPECIES_SWAMPERT   @ 0x11d
	enum SPECIES_POOCHYENA  @ 0x11e
	enum SPECIES_MIGHTYENA  @ 0x11f
	enum SPECIES_ZIGZAGOON  @ 0x120
	enum SPECIES_LINOONE    @ 0x121
	enum SPECIES_WURMPLE    @ 0x122
	enum SPECIES_SILCOON    @ 0x123
	enum SPECIES_BEAUTIFLY  @ 0x124
	enum SPECIES_CASCOON    @ 0x125
	enum SPECIES_DUSTOX     @ 0x126
	enum SPECIES_LOTAD      @ 0x127
	enum SPECIES_LOMBRE     @ 0x128
	enum SPECIES_LUDICOLO   @ 0x129
	enum SPECIES_SEEDOT     @ 0x12a
	enum SPECIES_NUZLEAF    @ 0x12b
	enum SPECIES_SHIFTRY    @ 0x12c
	enum SPECIES_NINCADA    @ 0x12d
	enum SPECIES_NINJASK    @ 0x12e
	enum SPECIES_SHEDINJA   @ 0x12f
	enum SPECIES_TAILLOW    @ 0x130
	enum SPECIES_SWELLOW    @ 0x131
	enum SPECIES_SHROOMISH  @ 0x132
	enum SPECIES_BRELOOM    @ 0x133
	enum SPECIES_SPINDA     @ 0x134
	enum SPECIES_WINGULL    @ 0x135
	enum SPECIES_PELIPPER   @ 0x136
	enum SPECIES_SURSKIT    @ 0x137
	enum SPECIES_MASQUERAIN @ 0x138
	enum SPECIES_WAILMER    @ 0x139
	enum SPECIES_WAILORD    @ 0x13a
	enum SPECIES_SKITTY     @ 0x13b
	enum SPECIES_DELCATTY   @ 0x13c
	enum SPECIES_KECLEON    @ 0x13d
	enum SPECIES_BALTOY     @ 0x13e
	enum SPECIES_CLAYDOL    @ 0x13f
	enum SPECIES_NOSEPASS   @ 0x140
	enum SPECIES_TORKOAL    @ 0x141
	enum SPECIES_SABLEYE    @ 0x142
	enum SPECIES_BARBOACH   @ 0x143
	enum SPECIES_WHISCASH   @ 0x144
	enum SPECIES_LUVDISC    @ 0x145
	enum SPECIES_CORPHISH   @ 0x146
	enum SPECIES_CRAWDAUNT  @ 0x147
	enum SPECIES_FEEBAS     @ 0x148
	enum SPECIES_MILOTIC    @ 0x149
	enum SPECIES_CARVANHA   @ 0x14a
	enum SPECIES_SHARPEDO   @ 0x14b
	enum SPECIES_TRAPINCH   @ 0x14c
	enum SPECIES_VIBRAVA    @ 0x14d
	enum SPECIES_FLYGON     @ 0x14e
	enum SPECIES_MAKUHITA   @ 0x14f
	enum SPECIES_HARIYAMA   @ 0x150
	enum SPECIES_ELECTRIKE  @ 0x151
	enum SPECIES_MANECTRIC  @ 0x152
	enum SPECIES_NUMEL      @ 0x153
	enum SPECIES_CAMERUPT   @ 0x154
	enum SPECIES_SPHEAL     @ 0x155
	enum SPECIES_SEALEO     @ 0x156
	enum SPECIES_WALREIN    @ 0x157
	enum SPECIES_CACNEA     @ 0x158
	enum SPECIES_CACTURNE   @ 0x159
	enum SPECIES_SNORUNT    @ 0x15a
	enum SPECIES_GLALIE     @ 0x15b
	enum SPECIES_LUNATONE   @ 0x15c
	enum SPECIES_SOLROCK    @ 0x15d
	enum SPECIES_AZURILL    @ 0x15e
	enum SPECIES_SPOINK     @ 0x15f
	enum SPECIES_GRUMPIG    @ 0x160
	enum SPECIES_PLUSLE     @ 0x161
	enum SPECIES_MINUN      @ 0x162
	enum SPECIES_MAWILE     @ 0x163
	enum SPECIES_MEDITITE   @ 0x164
	enum SPECIES_MEDICHAM   @ 0x165
	enum SPECIES_SWABLU     @ 0x166
	enum SPECIES_ALTARIA    @ 0x167
	enum SPECIES_WYNAUT     @ 0x168
	enum SPECIES_DUSKULL    @ 0x169
	enum SPECIES_DUSCLOPS   @ 0x16a
	enum SPECIES_ROSELIA    @ 0x16b
	enum SPECIES_SLAKOTH    @ 0x16c
	enum SPECIES_VIGOROTH   @ 0x16d
	enum SPECIES_SLAKING    @ 0x16e
	enum SPECIES_GULPIN     @ 0x16f
	enum SPECIES_SWALOT     @ 0x170
	enum SPECIES_TROPIUS    @ 0x171
	enum SPECIES_WHISMUR    @ 0x172
	enum SPECIES_LOUDRED    @ 0x173
	enum SPECIES_EXPLOUD    @ 0x174
	enum SPECIES_CLAMPERL   @ 0x175
	enum SPECIES_HUNTAIL    @ 0x176
	enum SPECIES_GOREBYSS   @ 0x177
	enum SPECIES_ABSOL      @ 0x178
	enum SPECIES_SHUPPET    @ 0x179
	enum SPECIES_BANETTE    @ 0x17a
	enum SPECIES_SEVIPER    @ 0x17b
	enum SPECIES_ZANGOOSE   @ 0x17c
	enum SPECIES_RELICANTH  @ 0x17d
	enum SPECIES_ARON       @ 0x17e
	enum SPECIES_LAIRON     @ 0x17f
	enum SPECIES_AGGRON     @ 0x180
	enum SPECIES_CASTFORM   @ 0x181
	enum SPECIES_VOLBEAT    @ 0x182
	enum SPECIES_ILLUMISE   @ 0x183
	enum SPECIES_LILEEP     @ 0x184
	enum SPECIES_CRADILY    @ 0x185
	enum SPECIES_ANORITH    @ 0x186
	enum SPECIES_ARMALDO    @ 0x187
	enum SPECIES_RALTS      @ 0x188
	enum SPECIES_KIRLIA     @ 0x189
	enum SPECIES_GARDEVOIR  @ 0x18a
	enum SPECIES_BAGON      @ 0x18b
	enum SPECIES_SHELGON    @ 0x18c
	enum SPECIES_SALAMENCE  @ 0x18d
	enum SPECIES_BELDUM     @ 0x18e
	enum SPECIES_METANG     @ 0x18f
	enum SPECIES_METAGROSS  @ 0x190
	enum SPECIES_REGIROCK   @ 0x191
	enum SPECIES_REGICE     @ 0x192
	enum SPECIES_REGISTEEL  @ 0x193
	enum SPECIES_KYOGRE     @ 0x194
	enum SPECIES_GROUDON    @ 0x195
	enum SPECIES_RAYQUAZA   @ 0x196
	enum SPECIES_LATIAS     @ 0x197
	enum SPECIES_LATIOS     @ 0x198
	enum SPECIES_JIRACHI    @ 0x199
	enum SPECIES_DEOXYS     @ 0x19a
	enum SPECIES_CHIMECHO   @ 0x19b
	enum SPECIES_EGG        @ 0x19c

	enum SPECIES_UNOWN_B
	enum SPECIES_UNOWN_C
	enum SPECIES_UNOWN_D
	enum SPECIES_UNOWN_E
	enum SPECIES_UNOWN_F
	enum SPECIES_UNOWN_G
	enum SPECIES_UNOWN_H
	enum SPECIES_UNOWN_I
	enum SPECIES_UNOWN_J
	enum SPECIES_UNOWN_K
	enum SPECIES_UNOWN_L
	enum SPECIES_UNOWN_M
	enum SPECIES_UNOWN_N
	enum SPECIES_UNOWN_O
	enum SPECIES_UNOWN_P
	enum SPECIES_UNOWN_Q
	enum SPECIES_UNOWN_R
	enum SPECIES_UNOWN_S
	enum SPECIES_UNOWN_T
	enum SPECIES_UNOWN_U
	enum SPECIES_UNOWN_V
	enum SPECIES_UNOWN_W
	enum SPECIES_UNOWN_X
	enum SPECIES_UNOWN_Y
	enum SPECIES_UNOWN_Z
	enum SPECIES_UNOWN_EMARK
	enum SPECIES_UNOWN_QMARK

	.set NUM_SPECIES, SPECIES_EGG