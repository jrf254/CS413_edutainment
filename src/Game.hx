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
	public var type:Int;
	private var scoreCounter:TextField;
	private var correctCount:Int = 10;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		rootSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
		boardsArray = populate();
		var text = new Prompt(900, 50, type);
		rootSprite.addChild(text);
		
		scoreCounter = new TextField(500,60, "Score: " + text.getScore(), "font", 50, 0xFFFFFF);
		scoreCounter.x = 550;
		scoreCounter.y = 0;
		rootSprite.addChild(scoreCounter);
	}
	
	public function enterFrame(event:EnterFrameEvent) {
		rotate(boardsArray);
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
}

