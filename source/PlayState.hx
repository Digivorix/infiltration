package;

import haxe.io.StringInput;
import org.flixel.FlxObject;
import org.flixel.plugin.photonstorm.FlxCollision;
import org.flixel.FlxState;
import org.flixel.FlxG;
import org.flixel.FlxText;
import org.flixel.FlxSprite;
import org.flixel.FlxGroup;
import nme.Assets;
import nme.ui.Mouse;

class PlayState extends FlxState {
	
	public var stableStatus:Int;
	public var sNum:Int;
	
	public var g:Int;
	
	public var playerScore:Int = 0;
	
	public var platformCheck:String;
	
	var player1:Player;
	var server1:Server;
	var server2:Server;
	var server3:Server;
	var server4:Server;
	var server5:Server;
	var server6:Server;
	var server7:Server;
	var server8:Server;
	var server9:Server;
	
	var stats1:GameStats;
	
	override public function create():Void {
		
		#if flash
			platformCheck = ".mp3";
		#else
			platformCheck = ".wav";
		#end
		
		add(new FlxSprite(0, 0, "assets/gfx/floor.png"));
		
		server1 = new Server(64, 128, platformCheck);
		server2 = new Server(64, 256, platformCheck);
		server3 = new Server(64, 384, platformCheck);
		server4 = new Server(320, 128, platformCheck);
		server5 = new Server(320, 256, platformCheck);
		server6 = new Server(320, 384, platformCheck);
		server7 = new Server(576, 128, platformCheck);
		server8 = new Server(576, 256, platformCheck);
		server9 = new Server(576, 384, platformCheck);
		add(server1);
		add(server2);
		add(server3);
		add(server4);
		add(server5);
		add(server6);
		add(server7);
		add(server8);
		add(server9);
		//add(server1.healthText);
		//add(server2.healthText);
		//add(server3.healthText);
		//add(server4.healthText);
		//add(server5.healthText);
		//add(server6.healthText);
		//add(server7.healthText);
		//add(server8.healthText);
		//add(server9.healthText);
		
		
		player1 = new Player();
		add(player1);
		
		//add(new FlxText(250, 0, 300, Std.string(server1.sHealth), 16, true));
		
		stats1 = new GameStats();
		add(stats1);
	}
	
	override public function destroy():Void {
		super.destroy();
	}
	
	override public function update():Void {
		
		super.update();
		
		var hitfx = Assets.getSound("assets/sfx/hit"+platformCheck);
		
		stableStatus = server1.stability + server2.stability + server3.stability + server4.stability + server5.stability + server6.stability + server7.stability + server8.stability + server9.stability;
		stats1.updateStable(stableStatus);
		sNum = server1.serverNum + server2.serverNum + server3.serverNum + server4.serverNum + server5.serverNum + server6.serverNum + server7.serverNum + server8.serverNum + server9.serverNum;
		stats1.updateNum(sNum);
		stats1.updateScore(playerScore);
		
		if (stableStatus == 0 && sNum == 0) {
			FlxG.switchState(new EndState(playerScore, stableStatus, sNum));
		}
		if (FlxG.keys.justPressed("ESCAPE")){
			FlxG.switchState(new EndState(playerScore, stableStatus, sNum));
		}
		
		if (FlxG.overlap(player1, server1)){
			g = 1;
		}
		else if (FlxG.overlap(player1, server2)){
			g = 2;
		}
		else if (FlxG.overlap(player1, server3)){
			g = 3;
		}
		else if (FlxG.overlap(player1, server4)){
			g = 4;
		}
		else if (FlxG.overlap(player1, server5)){
			g = 5;
		}
		else if (FlxG.overlap(player1, server6)){
			g = 6;
		}
		else if (FlxG.overlap(player1, server7)){
			g = 7;
		}
		else if (FlxG.overlap(player1, server8)){
			g = 8;
		}
		else if (FlxG.overlap(player1, server9)){
			g = 9;
		}
		else {
			g = 0;
		}
		
		switch(g) {
			case 1:
				if (FlxG.keys.justPressed("SPACE") && server1.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server1.resetServer();
				}
			case 2:
				if (FlxG.keys.justPressed("SPACE") && server2.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server2.resetServer();
				}
			case 3:
				if (FlxG.keys.justPressed("SPACE") && server3.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server3.resetServer();
				}
			case 4:
				if (FlxG.keys.justPressed("SPACE") && server4.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server4.resetServer();
				}
			case 5:
				if (FlxG.keys.justPressed("SPACE") && server5.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server5.resetServer();
				}
			case 6:
				if (FlxG.keys.justPressed("SPACE") && server6.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server6.resetServer();
				}
			case 7:
				if (FlxG.keys.justPressed("SPACE") && server7.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 5;
					server7.resetServer();
				}
			case 8:
				if (FlxG.keys.justPressed("SPACE") && server8.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 10;
					server8.resetServer();
				}
			case 9:
				if (FlxG.keys.justPressed("SPACE") && server9.crashState == true) {
					hitfx.play();
					playerScore = playerScore + 10;
					server9.resetServer();
				}
		}
	}
	
	//destruction function (will probably go unused)
	function destroyObject(Obj2:FlxObject):Void {
		Obj2.kill();
	}
}