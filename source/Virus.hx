package;

import org.flixel.FlxSprite;
import org.flixel.FlxText;
import org.flixel.FlxObject;
import org.flixel.FlxTimer;
import org.flixel.FlxG;
import haxe.Timer;
import nme.Lib;
import nme.Assets;
import Random;

public var xPosition:Int;
public var yPosition:Int;

class Virus extends FlxSprite {
	public function new(xPos:Int, yPos:Int) {
		super(xPos, yPos, "assets/gfx/virus.png");
		xPosition = xPos;
		yPosition = yPos;
	}
}