random_set_seed(11)
//randomize(); //TODO: THIS SHOULD USE A random_set_seed(val) instead

global.tileSize = 64;

global.viewWidth = 10;
global.viewHeight = 10;

global.edgeBuffer = global.viewWidth; // we use this to seek outside the current viewport

global.mapData = ds_grid_create(global.viewWidth + (2* global.edgeBuffer), global.viewHeight + (2* global.edgeBuffer));
global.enemyData = ds_grid_create(global.viewWidth + (2* global.edgeBuffer), global.viewHeight + (2* global.edgeBuffer));

global.gridWidth = ds_grid_width(global.mapData);
global.gridHeight = ds_grid_height(global.mapData);

//NOISE FUNCTIONS
global.mapHash = simplex_generate_hash();
global.mapGrad = simplex_generate_grad3();

global.enemyHash = simplex_generate_hash();
global.enemyGrad = simplex_generate_grad3();

global.currentShipX = 0;
global.currentShipY = 0;

global.initialiseShip = true;

global.shipSpeed = 0;
global.shipPower = 3;
global.wakeLife=20;
