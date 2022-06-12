package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import nme.ui.Mouse;

class MenuState extends FlxState
{
	var titleText:FlxText;
	var startText:FlxText;
	var titleTextBack:FlxText;
	var startTextBack:FlxText;
	
	//var titleTextWidth:Int;
	//var startTextWidth:Int;
	
	var cText:FlxText;
	
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
		
		titleTextBack = new FlxText (200+20, 203, 640, "Infiltration", 40, true);
		add(titleTextBack);
		titleTextBack.color = 0xff000000;
		
		startTextBack = new FlxText (200, 253, 640, "Press ENTER to Start", 24, true);
		add(startTextBack);
		startTextBack.color = 0xff000000;
		
		titleText = new FlxText (197+20, 200, 640, "Infiltration", 40, true);
		add(titleText);
		
		startText = new FlxText (197, 250, 640, "Press ENTER to Start", 24, true);
		add(startText);
		
		//cText = new FlxText (0, 455+64, 640, "Copyright (c) ZaptoSpark", 16, true);
		//add(cText);
		//FlxG.switchState(new PlayState());
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (FlxG.keys.justPressed("ENTER")) {
			FlxG.switchState(new PlayState());
		}
		super.update();
	}	
}