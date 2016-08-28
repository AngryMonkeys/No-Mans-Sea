
//show_debug_message(self.speed);
var shipSpeed = speed;

depth=-1*(y+1000);

if(direction>=337.5 || direction < 22.5){
  image_index=0;
} else
if(direction>=22.5 && direction < 67.5){
  image_index=1;
} else
if(direction>=67.5 && direction < 112.5){
  image_index=2;
} else
if(direction>= 112.5 && direction < 157.5){
  image_index=3;
} else
if(direction>=157.5 && direction < 202.5){
  image_index=4;
} else
if(direction>=202.5 && direction < 247.5){
  image_index=5;
} else
if(direction>=247.5 && direction < 292.5){
  image_index=6;
} else
if(direction>=292.5 && direction < 337.5){
  image_index=7;
} 

/*if(direction=0){
  image_index=0;
} else
if(direction=45){
  image_index=1;
} else
if(direction=90 ){
  image_index=2;
} else
if(direction= 135 ){
  image_index=3;
} else
if(direction=180){
  image_index=4;
} else
if(direction=225){
  image_index=5;
} else
if(direction=270){
  image_index=6;
} else
if(direction=315 ){
  image_index=7;
} 
*/

var wake = instance_create(x+80,y+100,obj_wake);
with(wake){
  depth=-100;
  image_index=irandom(5);
  image_angle = other.direction;
  image_alpha=0.5
  image_yscale=0.01;
  image_xscale = shipSpeed;
}


