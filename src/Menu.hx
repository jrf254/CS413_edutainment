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
	public var instructions:TextField;
	public var credits:TextField;
	public var back:TextField;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}

	public function mainMenu(){
		menu = new Image(Root.assets.getTexture("menu"));	
		menu.width = flash.Lib.current.stage.stageWidth;
        menu.height = flash.Lib.current.stage.stageHeight;
		rootSprite.addChild(menu);

		play = new TextField(200, 100, "Play", "font", 50);
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

   		instructions = new TextField(300, 100, "Instructions", "font", 50);
		instructions.color = 0xFFFFFF;
		instructions.x = 300;
		instructions.y = 265;
		rootSprite.addChild(instructions);

		instructions.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(instructions, TouchPhase.BEGAN);
                if (touch != null){
                  
   		}}); 

   		credits = new TextField(200, 100, "Credits", "font", 50);
		credits.color = 0xFFFFFF;
		credits.x = 350;
		credits.y = 330;
		rootSprite.addChild(credits);

		back = new TextField(300, 300, "Back to Menu", "font", 50);
		back.color = 0xFFFFFF;
		back.x = 650;
		back.y = 400;

		credits.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(credits, TouchPhase.BEGAN);
                if (touch != null){
                rootSprite.removeChild(instructions);
                rootSprite.removeChild(play);
                rootSprite.addChild(back);
                credits.y = 100;
                  
   		}}); 

   		back.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(back, TouchPhase.BEGAN);
                if (touch != null){
                rootSprite.removeChild(back);
                play.x = 350;
				play.y = 200;
				instructions.x = 300;
				instructions.y = 265;
				credits.y = 330;
                rootSprite.addChild(play);
                rootSprite.addChild(instructions);
   		}}); 
	}





}

