package {

	import flash.display.*;
	import flash.events.*;
	import flash.ui.Keyboard;
	import fl.motion.MotionEvent;
	import flash.ui.Mouse;
	
	public class player extends MovieClip {
		
		var main:Main;
		var vecMousePosition:Vector2;
		var vecDirection:Vector2;
		var vecAcceleration:Vector2;
		var vecLocation:Vector2;
		var vecVelocity:Vector2;
		var maxSpeed:Number;
		var isRight: Boolean = false;
		var isLeft: Boolean = false;
		var isUp: Boolean = false;
		var isDown: Boolean = false;
		var Shift: Boolean = false;
		var velocity: Vector2;
		var position: Vector2;
		var maxspeed: Number;
		var accel: Vector2;
		var mouse: Vector2;
		private var _root;
		var mass: Number;
		var rad: Number;
		var friction: Vector2;
		var frictionmag: Number = 2;
		var dist_Y: Number;
		var dist_X: Number;
		var angle: Number;
		var degrees: Number;
		var toDegrees: Number = 180 / Math.PI;


		public function player(_root) {
			// constructor code	
			this.main = _root;
			vecVelocity = new Vector2(0, 0);
			vecAcceleration = new Vector2(0, 0);
			vecLocation = new Vector2(100, 100);
			maxSpeed = 20;
			this._root = _root;
			_root.stage.addEventListener(Event.ENTER_FRAME, update);
			_root.stage.addEventListener(KeyboardEvent.KEY_DOWN, downKey);
			_root.stage.addEventListener(KeyboardEvent.KEY_UP, upKey);

			
			//toDegrees = 180/Math.PI;

			velocity = new Vector2(5, 5);
			position = new Vector2(200, 200);
			maxspeed = 8;
			accel = new Vector2(0.5, 0.5);
			mass = 10;



		}
		function upKey(event: KeyboardEvent) {
			Shift = false
			isRight = false;
			isLeft = false;
			isUp = false;
			isDown = false;
		}
		function downKey(event: KeyboardEvent) {
			if (event.keyCode == Keyboard.SHIFT) {
				Shift = true;
			}
			if (event.keyCode == Keyboard.D) {
				isRight = true;

			} else
			if (event.keyCode == Keyboard.A) {
				isLeft = true;
			} else
			if (event.keyCode == Keyboard.W) {
				isUp = true;
			} else
			if (event.keyCode == Keyboard.S) {
				isDown = true;
			} else {
				Shift = false;
				isRight = false;
				isLeft = false;
				isUp = false;
				isDown = false;
			}
		}
		public function update(Event) {
			friction = velocity.copy();
			friction.multS(-1);
			friction.multS(frictionmag);
			applyForce(friction);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, shoot);
			//rad= velocity.getAngle();
			//angle = Vector2.rad2deg(rad);
			//this.rotation = angle;

			dist_Y = stage.mouseY - this.y;
			dist_X = stage.mouseX - this.x;
			angle = Math.atan2(dist_Y, dist_X);
			degrees = angle * 180 / Math.PI;
			this.rotation = degrees;
			//trace(angle);
			accel.normalize();
			//position.add(accel);
			//this.rotation = velocity.heading() * toDegrees / mouseX;
			//this.rotation = velocity.heading() * toDegrees / mouseY;
			if (isRight == true) {
				position.x += velocity.x;
			}
			if (isLeft == true) {
				position.x -= velocity.x;
			}

			if (isDown == true) {
				position.y += velocity.y;
			}
			if (isUp == true) {
				position.y -= velocity.y;
			}
			if (Shift == true) {
				maxspeed = 10;
			}

			x = position.x;
			y = position.y;

			if (position.x < 0) {
				position.x = 0;
			}
			if (position.x > stage.stageWidth) {
				position.x = stage.stageWidth;
			}
			if (position.y < 0) {
				position.y = 0;
			}
			if (position.y > stage.stageHeight) {
				position.y = stage.stageHeight;
			}


		}
		public function applyForce(force: Vector2) {
			var f: Vector2 = force.copy()
			f.divS(mass);

			accel.add(f);

		}
		public function shoot(m: MouseEvent) {
			var b = new bullet(this);
			b.rotation = rotation;
			b.x = x;
			b.y = y;

			parent.addChild(b);
			trace(b);
		}
	}
}