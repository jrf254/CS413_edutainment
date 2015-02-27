import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.EventDispatcher;
import starling.events.Event;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.textures.Texture;

class Game extends Sprite {
	public var rootSprite:Sprite;
	public var boardsArray:Array<Image>;
	public var bottomsArray:Array<Image>;	
	public var nine:Niner;
	public var seven:Seven;
	public var type:Int;
	private var scoreCounter:TextField;
	private var correctCount:Int = 10;
	private var text:Prompt;
	public var menu:Menu;
	public var winText:TextField;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		Root.assets.playSound("bgsong", 0, 1000);
		rootSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
		boardsArray = populate();
		bottomsArray = populate1();
		text = new Prompt(900, 50, type);
		rootSprite.addChild(text);
		
		scoreCounter = new TextField(500,60, "Score: " + text.getScore(), "font", 50, 0xFFFFFF);
		scoreCounter.x = 550;
		scoreCounter.y = 0;
		rootSprite.addChild(scoreCounter);

		nine = new Niner();
		rootSprite.addChild(nine);

		seven = new Seven();
		rootSprite.addChild(seven);
	}
	
	public function enterFrame(event:EnterFrameEvent) {
		rotate(boardsArray);
		rotate(bottomsArray);
		updateScore();
	}
	
	//populates the board with multiple tiles
	public function populate():Array<Image>{
	
		var boardArray = new Array();
		
		var board = new Image(Root.assets.getTexture("chalkboard"));
		rootSprite.addChild(board);
		
		var board2 = new Image(Root.assets.getTexture("chalkboard2"));
		board2.x = 150;
		rootSprite.addChild(board2);
		
		var board3 = new Image(Root.assets.getTexture("chalkboard"));
		board3.x = 300;
		rootSprite.addChild(board3);
		
		var board4 = new Image(Root.assets.getTexture("chalkboard2"));
		board4.x = 450;
		rootSprite.addChild(board4);
		
		var board5 = new Image(Root.assets.getTexture("chalkboard"));
		board5.x = 600;
		rootSprite.addChild(board5);
		
		var board6 = new Image(Root.assets.getTexture("chalkboard2"));
		board6.x = 750;
		rootSprite.addChild(board6);
		
		var board7 = new Image(Root.assets.getTexture("chalkboard"));
		board7.x = 900;
		rootSprite.addChild(board7);
		
		var board8 = new Image(Root.assets.getTexture("chalkboard2"));
		board8.x = 1050;
		rootSprite.addChild(board8);
	
		boardArray.push(board);
		boardArray.push(board2);
		boardArray.push(board3);
		boardArray.push(board4);
		boardArray.push(board5);
		boardArray.push(board6);
		boardArray.push(board7);
		boardArray.push(board8);
		return boardArray;
	}

	public function populate1():Array<Image>{

		var bottomArray = new Array();

		var bottom = new Image(Root.assets.getTexture("bottom"));
		bottom.y = 570;
		rootSprite.addChild(bottom);

		var bottom2 = new Image(Root.assets.getTexture("bottom"));
		bottom2.x = 150;
		bottom2.y = 570;
		rootSprite.addChild(bottom2);

		var bottom3 = new Image(Root.assets.getTexture("bottom"));
		bottom3.x = 300;
		bottom3.y = 570;
		rootSprite.addChild(bottom3);

		var bottom4 = new Image(Root.assets.getTexture("bottom"));
		bottom4.x = 450;
		bottom4.y = 570;
		rootSprite.addChild(bottom4);

		var bottom5 = new Image(Root.assets.getTexture("bottom"));
		bottom5.x = 600;
		bottom5.y = 570;
		rootSprite.addChild(bottom5);

		var bottom6 = new Image(Root.assets.getTexture("bottom"));
		bottom6.x = 750;
		bottom6.y = 570;
		rootSprite.addChild(bottom6);

		var bottom7 = new Image(Root.assets.getTexture("bottom"));
		bottom7.x = 900;
		bottom7.y = 570;
		rootSprite.addChild(bottom7);	

		var bottom8 = new Image(Root.assets.getTexture("bottom"));
		bottom8.x = 1050;
		bottom8.y = 570;
		rootSprite.addChild(bottom8);

		bottomArray.push(bottom);
		bottomArray.push(bottom2);
		bottomArray.push(bottom3);
		bottomArray.push(bottom4);
		bottomArray.push(bottom5);
		bottomArray.push(bottom6);
		bottomArray.push(bottom7);
		bottomArray.push(bottom8);
		return bottomArray;
	}


	public function rotate(board:Array<Image>){
		for (i in board){
			i.x = i.x - 2;
			if ((i.x + 150) < 0){
				i.x = 1048;
			}
		}
	}
	public function setType(type:Int){
		this.type = type;
	}
	
	public function updateScore(){
		scoreCounter.text = "Score: " + text.getScore();
		winCond();
	}

	public function winCond(){
		if (text.getScore() == 30){
			var win:Image = new Image(Root.assets.getTexture("win"));
			win.width = flash.Lib.current.stage.stageWidth;
			win.height = flash.Lib.current.stage.stageHeight;
			rootSprite.addChild(win);
			winText = new TextField(350, 150, "You Win", "font", 100, 0xFFFFFF);
			winText.x = 50;
			winText.y = 0;
			rootSprite.addChild(winText);
		}
	}

}

