import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import starling.events.KeyboardEvent;
import starling.events.Event;
import flash.ui.Keyboard;


class Root extends Sprite {

    public static var assets:AssetManager;
    public var rootSprite:Sprite;
	public var menu:Menu;
	
    public function new() {
        rootSprite = this;
        super();
    }

    public function start(startup:Startup) {

        assets = new AssetManager();
		
		assets.enqueue("assets/spritesheet.png");
        assets.enqueue("assets/spritesheet.xml");
		assets.enqueue("assets/font.fnt");
		assets.enqueue("assets/bgsong.mp3");
		rootSprite.addEventListener(KeyboardEvent.KEY_UP, keyUp);
        assets.loadQueue(function onProgress(ratio:Float) {
            haxe.Log.clear();
            trace(ratio);
            if (ratio == 1) {
                haxe.Log.clear();
				startup.removeChild(startup.loadingBitmap);
 
				//var game = new Game(rootSprite);
				//game.start();
                menu = new Menu(rootSprite);
                menu.mainMenu();                
			}
        });
		
    }
	public function keyUp(event:KeyboardEvent){
		if (event.keyCode == Keyboard.SPACE) {
				trace(rootSprite.numChildren);
				rootSprite.removeChildren(0,-1, true);
				rootSprite.removeEventListeners();
				trace(rootSprite.numChildren);
				menu.mainMenu();
		}
    }
}
