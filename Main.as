package {

	import flash.display.*;
	import flash.events.*;



	public class Main extends MovieClip {
		public var myPlayer: MovieClip;
		public var playr: Vector2 = new Vector2(0, 0);
		//public var myBullet: MovieClip;
		public static var Enemylist: Array;
		public static var Playerlist: Array;
		public var myEnemy: MovieClip;
		//public var position: Vector2 = new Vector2(Math.random()*1000,Math.random()*1000);
		//public var velocity: Vector2 = new Vector2(Math.random()*5,Math.random()*5);
		//public var acceleration: Vector2 = new Vector2(0.1, 0.1);
		public var achtergrond = new background;

		var main;
		var mass;


		public function Main() {
			// constructor code
			achtergrond.x = 0;
			achtergrond.y = 0;

			Enemylist = new Array();
			Playerlist = new Array();
			myPlayer = new player(this);
			//stage.addChild(myPlayer);
			//myEnemy = new enemy();
			//myBullet = new bullet(myPlayer);
			//this.main = main
			//mass = 1;
			stage.addEventListener(Event.ENTER_FRAME, Update);
			createEnemy();
			createPlayer();
			

		}

		public function Update(e: Event) {
			for each(var en: enemy in Enemylist) {
				en.Update();
			}
		}

		/*public function update(e: Event) {
			for (var i = 0; i < 4; i++) {
				myPlayer.x = myEnemy.x;
				myPlayer.y = myEnemy.y;
				myPlayer.acceleration.add(playr.sub(myEnemy.position));
				myPlayer.acceleration.normalize();
				myPlayer.acceleration.multS(1);
				myPlayer.velocity.add(myEnemy.acceleration);
				myPlayer.velocity.limit(8);
				myPlayer.position.add(myEnemy.velocity);
				myPlayer.x = myEnemy.position.x
				myPlayer.y = myEnemy.position.y
				
				if (myPlayer.x > this.stage.stageWidth - myPlayer.width) {
					myPlayer.position.x = this.stage.stageWidth - myPlayer.width;
					myPlayer.velocity.x *= -1;
				}
				if (myPlayer.x < 0) {
					myPlayer.position.x = 0;
					myPlayer.velocity.x *= -1;
				}

				if (myPlayer.y > this.stage.stageHeight - myEnemy.height) {
					myPlayer.position.y = this.stage.stageHeight - myEnemy.height;
					myPlayer.position.y = this.stage.stageHeight - myPlayer.height;
					myPlayer.velocity.y *= -1;
				}
				if (myPlayer.y < 0) {
					myPlayer.position.y = 0;
					myPlayer.velocity.y *= -1;
				}
				
			}

		}*/
		public static function makeRangedNumber(min: Number, max: Number): Number {
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}

		function createEnemy() {
			for (var e = 0; e < 10; e++) {
				var enem = new enemy(this);
				enem.vecLocation.setTo(makeRangedNumber(0, stage.stageWidth), makeRangedNumber(0, stage.stageHeight));
				//enem.x = makeRangedNumber(0, stage.stageWidth);
				//enem.y = makeRangedNumber(0, stage.stageHeight);
				Enemylist.push(enem);
				stage.addChild(enem);
			}
		}
		function createPlayer() {
			for (var a = 0; a < 1; a++) {
				var playr = new player(this);
				playr.vecLocation.setTo(makeRangedNumber(0, stage.stageWidth), makeRangedNumber(0, stage.stageHeight));
				Playerlist.push(playr);
				stage.addChild(playr);
			}
		}
	}

}