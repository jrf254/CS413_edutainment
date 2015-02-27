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
	public var title:TextField;
	public var veronika:TextField;
	public var joshua:TextField;
	public var jonathon:TextField;
	public var salvatore:TextField;
	public var thomas:TextField;
	public var how:TextField;
	public var type:Int;
	public var mode:TextField;
	public var add:TextField;
	public var sub:TextField;
	public var mul:TextField;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}

	public function mainMenu(){

		Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		menu = new Image(Root.assets.getTexture("menu"));	
		menu.width = flash.Lib.current.stage.stageWidth;
        menu.height = flash.Lib.current.stage.stageHeight;
		rootSprite.addChild(menu);

		title = new TextField(900, 100, "Why Was 6 Afraid Of 7", "font", 75);
		title.color = 0xFFFFFF;
		title.x = 5;
		title.y = 50;
		rootSprite.addChild(title);

		play = new TextField(200, 100, "Play", "font", 50);
		play.color = 0xFFFFFF;
		play.x = 350;
		play.y = 200;
		rootSprite.addChild(play);

		play.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(play, TouchPhase.BEGAN);
                if (touch != null){
                   	var game = new Game(rootSprite);
					game.setType(type);
                   	game.start();
   				}
   		}); 

   		instructions = new TextField(300, 100, "Instructions", "font", 50);
		instructions.color = 0xFFFFFF;
		instructions.x = 300;
		instructions.y = 300;
		rootSprite.addChild(instructions);

		instructions.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(instructions, TouchPhase.BEGAN);
                if (touch != null){
                	rootSprite.removeChild(mode);
                	rootSprite.removeChild(credits);
                	rootSprite.removeChild(play);
                	rootSprite.addChild(back);
                	instructions.y = 150;
                	how = new TextField(800, 200, "Help 9 escape from 7 by correctly answering the questions.", "font", 40);
					how.color = 0xFFFFFF;
					how.x = 50;
					how.y = 200;
					rootSprite.addChild(how);  
   				}
   		}); 

   		credits = new TextField(200, 100, "Credits", "font", 50);
		credits.color = 0xFFFFFF;
		credits.x = 350;
		credits.y = 400;
		rootSprite.addChild(credits);

		back = new TextField(300, 300, "Back to Menu", "font", 50);
		back.color = 0xFFFFFF;
		back.x = 650;
		back.y = 400;

		credits.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(credits, TouchPhase.BEGAN);
                if (touch != null){
                	rootSprite.removeChild(mode);
                	rootSprite.removeChild(instructions);
                	rootSprite.removeChild(play);
                	rootSprite.addChild(back);
                	credits.y = 150;
                	veronika = new TextField(300, 100, "Veronika Alves", "font", 40);
					veronika.color = 0xFFFFFF;
					veronika.x = 300;
					veronika.y = 200;
					rootSprite.addChild(veronika);
					salvatore = new TextField(400, 100, "Salvatore Bottiglieri", "font", 40);
					salvatore.color = 0xFFFFFF;
					salvatore.x = 250;
					salvatore.y = 250;
					rootSprite.addChild(salvatore);
                  	joshua = new TextField(400, 100, "Joshua Frampton", "font", 40);
					joshua.color = 0xFFFFFF;
					joshua.x = 250;
					joshua.y = 300;
					rootSprite.addChild(joshua);
					thomas = new TextField(400, 100, "Thomas 0Brien", "font", 40);
					thomas.color = 0xFFFFFF;
					thomas.x = 250;
					thomas.y = 350;
					rootSprite.addChild(thomas);
					jonathon = new TextField(400, 100, "Jonathon Todd", "font", 40);
					jonathon.color = 0xFFFFFF;
					jonathon.x = 250;
					jonathon.y = 400;
					rootSprite.addChild(jonathon);
   				}
   		}); 

   		mode = new TextField(300, 100, "Difficulty", "font", 50);
		mode.color = 0xFFFFFF;
		mode.x = 300;
		mode.y = 500;
		add = new TextField(100, 100, "Add", "font", 40);
		add.color = 0xFFFFFF;
		add.x = 400;
		add.y = 250;
		sub = new TextField(200, 100, "Subtract", "font", 40);
		sub.color = 0xFFFFFF;
		sub.x = 350;
		sub.y = 350;
		mul = new TextField(200, 100, "Multiply", "font", 40);
		mul.color = 0xFFFFFF;
		mul.x = 350;
		mul.y = 450;

		rootSprite.addChild(mode);

   		mode.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(mode, TouchPhase.BEGAN);
                if (touch != null){
                   	rootSprite.removeChild(credits);
                	rootSprite.removeChild(instructions);
                	rootSprite.removeChild(play);
                	rootSprite.addChild(back);
                	mode.y = 150;
					rootSprite.addChild(add);
					rootSprite.addChild(sub);
					rootSprite.addChild(mul);
   				}
   		}); 

   		add.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(add, TouchPhase.BEGAN);
                if (touch != null){
                	type = 0;
                	rootSprite.removeChild(add);
                	rootSprite.removeChild(sub);
                	rootSprite.removeChild(mul);
                	rootSprite.removeChild(back);
                	play.x = 350;
					play.y = 200;
					instructions.x = 300;
					instructions.y = 300;
					credits.x = 350;
					credits.y = 400;
					mode.x = 300;
					mode.y = 500;
                	rootSprite.addChild(play);
                	rootSprite.addChild(instructions);
                	rootSprite.addChild(credits);
                }
   		}); 

   		sub.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(sub, TouchPhase.BEGAN);
                if (touch != null){
                	type = 1;
                	rootSprite.removeChild(add);
                	rootSprite.removeChild(sub);
                	rootSprite.removeChild(mul);
                	rootSprite.removeChild(back);
                	play.x = 350;
					play.y = 200;
					instructions.x = 300;
					instructions.y = 300;
					credits.x = 350;
					credits.y = 400;
					mode.x = 300;
					mode.y = 500;
                	rootSprite.addChild(play);
                	rootSprite.addChild(instructions);
                	rootSprite.addChild(credits);
                }
   		});

		mul.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(mul, TouchPhase.BEGAN);
                if (touch != null){
                	type = 2;
                	rootSprite.removeChild(add);
                	rootSprite.removeChild(sub);
                	rootSprite.removeChild(mul);
                	rootSprite.removeChild(back);
                	play.x = 350;
					play.y = 200;
					instructions.x = 300;
					instructions.y = 300;
					credits.x = 350;
					credits.y = 400;
					mode.x = 300;
					mode.y = 500;
                	rootSprite.addChild(play);
                	rootSprite.addChild(instructions);
                	rootSprite.addChild(credits);
                }
   		});

   		back.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(back, TouchPhase.BEGAN);
                if (touch != null){
                	rootSprite.removeChild(add);
                	rootSprite.removeChild(sub);
                	rootSprite.removeChild(mul);
                	rootSprite.removeChild(veronika);
                	rootSprite.removeChild(salvatore);
                	rootSprite.removeChild(joshua);
                	rootSprite.removeChild(thomas);
                	rootSprite.removeChild(jonathon);
                	rootSprite.removeChild(how);
                	rootSprite.removeChild(back);
                	play.x = 350;
					play.y = 200;
					instructions.x = 300;
					instructions.y = 300;
					credits.x = 350;
					credits.y = 400;
					mode.x = 300;
					mode.y = 500;
                	rootSprite.addChild(play);
                	rootSprite.addChild(instructions);
                	rootSprite.addChild(credits);
                	rootSprite.addChild(mode);
   				}
   		}); 
	}

	public function keyUp(event:KeyboardEvent){
		if (event.keyCode == Keyboard.SPACE) {
				rootSprite.removeChildren();
				mainMenu();
			}
    }



}

