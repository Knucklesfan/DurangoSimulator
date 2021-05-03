//spawns a bunch of falling computers for durango to dodge. takes 1000 steps.
pos = 48;
tem = random(6);
objs = array(obj_computerfall,obj_computerfall,obj_computerfall,obj_computerfall,obj_computerfall,obj_computerfall,obj_pinebox);
var i;
for(i = 0; i < 6; i+= 1) {

inst = instance_create(pos,0,objs[tem]);
if(objs[tem] = obj_pinebox) {
inst.vspeed = 5;
}
if(tem <= 6) {
tem++
}
else {
tem = 0;

}
pos += 128;
}

