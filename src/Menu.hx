import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import flash.geom.Rectangle;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.Event;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

class Menu extends Sprite{
	public var rootSprite:Sprite;
	public var menu:Image;
	public var play:TextField;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}

	public function mainMenu(){
		menu = new Image(Root.assets.getTexture("menu"));	
		menu.width = flash.Lib.current.stage.stageWidth;
        menu.height = flash.Lib.current.stage.stageHeight;
		rootSprite.addChild(menu);

		play = new TextField(200, 200, "Play", "font", 50);
		play.color = 0xFFFFFF;
		play.x = 350;
		play.y = 200;
		rootSprite.addChild(play);

		play.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(play, TouchPhase.BEGAN);
                if (touch != null){
                   	var game = new Game(rootSprite);
                   	game.start();
   		}}); 
	}





}

