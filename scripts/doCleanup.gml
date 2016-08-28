//i guess clean up the map?

with(obj_tile){
  instance_destroy();
}

with(obj_wake){
  instance_destroy();
}

with(obj_sinking){
  instance_destroy();
}
with(obj_enemy){
  instance_destroy();
}
show_debug_message("CLEANUP ON ISLE TOO");
