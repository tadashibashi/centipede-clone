/// @description Initialize WWise

// GMWWise Initialization
global.GMW_PROFILE = true;

gmwInit();

var path = "";

if (os_type == os_macosx)
    path = working_directory + "sound/banks/Mac/";
else
    path = working_directory + "sound/banks/Windows/";
    
gmwSetBasePath(path);


global.INIT_BANK = gmwLoadBank("Init.bnk");
global.GAME_BANK = gmwLoadBank("SoundBank.bnk");

global.DEFAULT_GROUP = 1;

// Register the sound controller with the engine
gmwRegisterObject(id, global.DEFAULT_GROUP, "SoundController");


//Initialize Links to IDs
global.EV_extraLife_stop = 55863436; 
global.EV_fleaDrop = 292675580;
global.EV_playerDie = 292934058;
global.EV_spider = 628468712;
global.EV_shipFire = 835522617;
global.EV_extraLife = 1172462585;
global.EV_stopAllSound = 1633173353;
global.EV_spider_stop = 1681071047;
global.EV_enemyDie = 2272056649;
global.EV_fleaDrop_stop = 3274175883;
global.EV_bgBloop_stop = 3310307557;
global.EV_bgBloop = 3365492598;
global.EV_gecko_stop = 3905478543;
global.EV_gecko = 4106074528;

global.RTPC_globalVolume = 3228663856;


// Set the music volume to max and start playing it
global.VOLUME = 100;

gmwSetGlobalParameter(global.RTPC_globalVolume, global.VOLUME);

gmwSet2DListenerPosition(0, 0, 0, 0);