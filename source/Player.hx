package;

import org.flixel.FlxSprite;
import nme.Lib;
import org.flixel.FlxG;
import nme.Assets;
import nme.media.Sound;
import org.flixel.FlxText;
import org.flixel.FlxObject;
import org.flixel.FlxSound;
import haxe.Timer;

class Player extends FlxSprite {
	
	private var xSpeed:Float = 275;
	private var ySpeed:Float = 275;
	
	public var onServer:Bool;
	
	
	public function new() {
		super(192, 256, "assets/gfx/player_d.png");
	}
	
	override public function update():Void {
		
		super.update();
		
		velocity.x = 0;
		velocity.y = 0;
		
		if (FlxG.keys.RIGHT && x <= 600) {
			velocity.x += xSpeed;
			loadGraphic("assets/gfx/player_r.png", false);
			
		}
		if (FlxG.keys.LEFT && x >= 0) {
			velocity.x -= xSpeed;
			loadGraphic("assets/gfx/player_l.png", false);
			
		}
		if (FlxG.keys.UP && y >= 0) {
			velocity.y -= xSpeed;
			loadGraphic("assets/gfx/player_u.png", false);
			
		}
		if (FlxG.keys.DOWN && y <= 400) {
			velocity.y += xSpeed;
			loadGraphic("assets/gfx/player_d.png", false);
			
		}
		
	}
	
}