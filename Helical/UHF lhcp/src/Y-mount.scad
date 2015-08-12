//Helical yagi Y mount
//by cshields

pvc_width=18;
wall_width=8;

$fn=50;

length=30;

module holder(pvc, wall, len) {
	total_diameter = pvc+wall;
	difference() {
		union() {
			translate([total_diameter/4,0,0])
				cube([total_diameter/2,total_diameter,len],center=true);
			cylinder(d=total_diameter,h=len,center=true);
		}
		cylinder(d=pvc,h=len+2,center=true);
	}
}

union() {
	rotate(90,[0,1,0])
		translate([0,0,length/2])
		holder(pvc_width, wall_width, length);
	rotate([60,90,0])
		translate([0,0,-1*(length/2)])
		holder(pvc_width, wall_width, length);
	rotate([-60,90,0])
		translate([0,0,-1*(length/2)])
		holder(pvc_width, wall_width, length);
}