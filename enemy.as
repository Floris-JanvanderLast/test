package {

	import flash.display.MovieClip;

	public class enemy extends MovieClip {

		// Properties
		var main: Main;
		var vecDirection: Vector2;
		var vecAcceleration: Vector2;
		var vecLocation: Vector2;
		var vecVelocity: Vector2;
		var maxSpeed: Number;
		var angle: Number;

		// constructor code
		public function enemy(_main) {
			this.main = _main;
			vecVelocity = new Vector2(0, 0);
			vecAcceleration = new Vector2(0.5, 0.5);
			vecLocation = new Vector2(0, 0);
			maxSpeed = 1;
		}

		public function Update() {
			//Movment
			vecDirection = Vector2.sub(main.myPlayer.vecLocation, vecLocation);
			vecDirection.setMag(0.15);
			vecAcceleration = vecDirection;
			vecVelocity.add(vecAcceleration);
			vecVelocity.limit(maxSpeed);
			vecLocation.add(vecVelocity);
			this.x = vecLocation.x;
			this.y = vecLocation.y;

			removeonimpact();

			// rotatie
			var rad = vecDirection.getAngle();
			angle = Vector2.rad2deg(rad);
			this.rotation = angle;
		}
		public function removeonimpact() {
			for (var i in Main.Playerlist) {
				var playr = Main.Playerlist[i];
				var achtergrond:MovieClip = new background();
				if (playr != null) {
					if (this.hitTestObject(playr)) {
						stage.removeChild(playr)
						stage.removeChild(this);
						Main.Enemylist.removeAt(i);
						trace(removeonimpact);
					}
				}
			}
		}
	}
}