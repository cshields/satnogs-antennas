//Helical yagi T mount
//by cshields

pvc_width=18;
wall_width=8;

$fn=50;

long_length=48;
short_length=30;

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

difference() {
	union() {
		rotate(90,[0,1,0])
			holder(pvc_width, wall_width, long_length);
		rotate([90,90,0])
			translate([0,0,short_length/2])
				holder(pvc_width, wall_width, short_length);
	}

	// extra cut to allow the bar to pass all the way through.
	rotate(90,[0,1,0])
		cylinder(d=pvc_width,h=long_length+2,center=true);
}