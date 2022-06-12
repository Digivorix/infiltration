package;

import haxe.Timer;
import org.flixel.FlxSprite;
import nme.Lib;
import org.flixel.FlxG;
import nme.Assets;
import org.flixel.FlxText;
import org.flixel.FlxObject;
import Random;
import org.flixel.FlxTimer;

class Server extends FlxSprite {
	
	public var crashState:Bool = false;
	
	public var randCrash:Int;
	
	private var randNumGen:Int;
	
	public var stability = 11;
	
	public var dead:Bool = false;
	
	var platformC:String;
	
	//public var canDie:Bool = false;
	
	public var serverNum:Int = 1;
	
	public var xPosition:Int;
	public var yPosition:Int;
	
	//public var sHealth:Int = 100;
	//public var healthText:FlxText;
	
	public var timerC:Int = 0;
	public var maxTimer:Int = 150;
	
	var maxRand:Int = 950;
	
	
	public function new(xPos:Int, yPos:Int, platformCheck:String) {
		super(xPos, yPos, "assets/gfx/server.png");
		platformC = platformCheck;
		
		var timer1 = new Timer(10000);
		timer1.run = function() {
			maxRand = 825;
			timer1.stop();
		}
		var timer2 = new Timer(20000);
		timer2.run = function() {
			maxRand = 650;
			timer2.stop();
		}
		var timer3 = new Timer(25000);
		timer3.run = function() {
			maxRand = 550;
			timer3.stop();
		}
		var timer4 = new Timer(35000);
		timer4.run = function() {
			maxRand = 425;
			timer4.stop();
		}
		var timer5 = new Timer(55000);
		timer5.run = function() {
			maxRand = 350;
			timer5.stop();
		}
		var timer6 = new Timer(75000);
		timer6.run = function() {
			maxRand = 250;
			timer6.stop();
		}
		var timer7 = new Timer(85000);
		timer7.run = function() {
			maxRand = 130;
			maxTimer = 135;
			timer7.stop();
		}
		var timer8 = new Timer(135000);
		timer8.run = function() {
			//maxRand = 130;
			maxTimer = 125;
			timer8.stop();
		}
		//xPosition = xPos;
		//yPosition = yPos;
		//healthText = new FlxText(xPosition , yPosition - 32, 300, sHealth + "%", 24, true);
		//healthText.color = 0xff000000;
	}
	
	public function resetServer():Void {
		loadGraphic("assets/gfx/server.png", false);
		stability = 11;
		crashState = false;
		serverNum = 1;
		//canDie = false;
	}
	//public function decreaseHealth():Void {
	//	timerC ++;
	//	if (timerC > maxTimer && crashState == true) {
	//		//sHealth--;
	//		timerC = 0;
	//	}
	//	
	//}

	
	override public function update():Void {
		
		//healthText.text = sHealth + "%";
		//trace(maxRand);
		
		randCrash = Random.int(1, maxRand);
		randNumGen = Random.int(1, maxRand);
		//trace(crashState);
		if (randCrash == randNumGen && stability > 0 && crashState == false) {
			loadGraphic("assets/gfx/server_e.png", false);
			stability = 5;
			crashState = true;
			//canDie = true;
			#if flash
				var offlinefx_mp3 = Assets.getSound("assets/sfx/offline.mp3");
				offlinefx_mp3.play();
			#else
				var offlinefx_wav = Assets.getSound("assets/sfx/offline.wav");
				offlinefx_wav.play();
			#end
			
		}
		
		if (crashState == true) {
			timerC ++;
			if (timerC > maxTimer && crashState == true) {
				serverNum = 0;
				stability = 0;
				loadGraphic("assets/gfx/server_d.png", false);
				#if flash
					var deathfx_mp3 = Assets.getSound("assets/sfx/death.mp3");
					deathfx_mp3.play();
				#else
					var deathfx_wav = Assets.getSound("assets/sfx/death.wav");
					deathfx_wav.play();
				#end
				dead = true;
				//kill();
				timerC = 0;
				crashState = false;
			}
		}
		
		if (crashState == false) {
			timerC = 0;
		}
		
		super.update();
	}
	
}