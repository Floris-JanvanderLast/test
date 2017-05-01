package {

	import flash.display.*;
	import flash.events.*;


	public class bullet extends MovieClip {
		private var speed: int;
		public var myBullet: MovieClip;
		var myPlayer: MovieClip;
		public var counter:Number;

		public function bullet(Player) {
			counter = 0;
			this.myPlayer = Player;
			speed = 40;
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		public function Update(e: Event) {

			removeonimpact();

			x = x + Math.cos(rotation / 180 * Math.PI) * speed;
			y = y + Math.sin(rotation / 180 * Math.PI) * speed;
			if (x < 0 || x > 1024 || y < 0 || y > 768) {
				removeEventListener(Event.ENTER_FRAME, Update);

				parent.removeChild(this);
			}

		}
		public function removeonimpact() {
			for (var i in Main.Enemylist) {
				var enem = Main.Enemylist[i];
				if (enem != null) {
					if (this.hitTestObject(enem)) {
						stage.removeChild(enem)
						stage.removeChild(this);
						Main.Enemylist.removeAt(i);
						trace(removeonimpact);
					}
				}
			}
		}
	}
}