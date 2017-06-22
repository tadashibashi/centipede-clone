//Spiders when colliding with mushrooms will destroy them.

//Attaches itself to the spider object. 
//(This object will destroy mushrooms when colliding with them.)

//The if statement checks if spider object exists, it will destroy itself if not.
if (!instance_exists(spider_obj)) {
    instance_destroy();
    exit;
}
x = spider_obj.x-4; y = spider_obj.y


