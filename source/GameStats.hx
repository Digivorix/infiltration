package;

import haxe.Timer;
import org.flixel.FlxState;
import org.flixel.FlxG;
import nme.Lib;
import org.flixel.FlxText;
import org.flixel.FlxSprite;
import PlayState;

class GameStats extends FlxState {
	
	public var stableCount:Int;
	public var serverCount:Int;
	public var scoreCount:Int;
	
	public var stableText:FlxText;
	public var stableTextBack:FlxText;
	
	public var countText:FlxText;
	public var countTextBack:FlxText;
	
	public var scoreText:FlxText;
	public var scoreTextBack:FlxText;
	
	public function new() {
		super();
		
		stableTextBack = new FlxText(((175/2)+52) + 3, 3, 300, "STABILITY: ", 24, true);
		add(stableTextBack);
		stableTextBack.color = 0xff000000;
		
		stableText = new FlxText(((175/2)+52), 0, 300, "STABILITY: ", 24, true);
		add(stableText);
		
		countTextBack = new FlxText(((175*2)+52) + 3, 3, 300, "SERVERS: ", 24, true);
		add(countTextBack);
		countTextBack.color = 0xff000000;
		
		countText = new FlxText(((175*2)+52), 0, 300, "SERVERS: ", 24, true);
		add(countText);
		
		scoreTextBack = new FlxText(291, 481, 300, "SCORE: ", 24, true);
		add(scoreTextBack);
		scoreTextBack.color = 0xff000000;
		
		scoreText = new FlxText(288, 478, 300, "SCORE: ", 24, true);
		add(scoreText);
	}
	
	public function updateStable(changeStable:Int) {
		stableTextBack.text = "STABILITY: " + stableCount + "%";
		
		stableCount = changeStable;
		stableText.text = "STABILITY: " + stableCount + "%";
	}
	
	public function updateNum(changeNum:Int) {
		countTextBack.text = "SERVERS: " + serverCount;
		
		serverCount = changeNum;
		countText.text = "SERVERS: " + serverCount;
	}
	
	public function updateScore(changeScore:Int) {
		scoreCount = changeScore;
		
		scoreTextBack.text = "SCORE: " + scoreCount;
		
		scoreText.text = "SCORE: " + scoreCount;
	}
	
	override public function create():Void {
	}
	
	override public function destroy():Void {
		super.destroy();
	}
	
	override public function update():Void {
		super.update();
	}
}