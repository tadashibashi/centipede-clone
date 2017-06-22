instance_create(x-4,y,explode_obj) //explode animation appears


if global.demo = false then score += 1000 //add score accordingly
global.geckos_killed += 1
instance_destroy(); //destroy self
with other instance_destroy(); //destroy other also

