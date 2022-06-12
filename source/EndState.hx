package;

import org.flixel.FlxObject;
import org.flixel.plugin.photonstorm.FlxCollision;
import org.flixel.FlxState;
import org.flixel.FlxG;
import org.flixel.FlxText;
import org.flixel.FlxSprite;
import org.flixel.FlxGroup;
import nme.Assets;

class EndState extends FlxState{
	
	var titleText:FlxText;
	var startText:FlxText;
	var titleTextBack:FlxText;
	var startTextBack:FlxText;
	var returnText:FlxText;
	var returnTextBack:FlxText;
	public var finalScore:Int;
	
	public static function new(fScore:Int, stability:Int, servers:Int) {
		super();
		finalScore = fScore;
	}
	
	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xffe0d2be;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end
		
		//#if !FLX_NO_MOUSE
		//FlxG.mouse.show();
		//#end
		
		titleTextBack = new FlxText (200+20, 203, 640, "GAME OVER", 40, true);
		add(titleTextBack);
		titleTextBack.color = 0xff000000;
		
		startTextBack = new FlxText (200+58, 253, 640, "Final Score: " + finalScore , 24, true);
		add(startTextBack);
		startTextBack.color = 0xff000000;
		
		titleText = new FlxText (197+20, 200, 640, "GAME OVER", 40, true);
		add(titleText);
		
		startText = new FlxText (197+58, 250, 640, "Final Score: " + finalScore, 24, true);
		add(startText);
		
		returnTextBack = new FlxText (136, 481, 640, "Press ENTER to Return to Menu", 24, true);
		add(returnTextBack);
		returnTextBack.color = 0xff000000;
		
		returnText = new FlxText (133, 478, 640, "Press ENTER to Return to Menu", 24, true);
		add(returnText);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (FlxG.keys.justPressed("ENTER")) {
			FlxG.switchState(new MenuState());
		}
		super.update();
	}
}