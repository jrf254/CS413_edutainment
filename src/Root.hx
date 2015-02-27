import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;


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
		
		assets.enqueue("assets/chalkboard.png");
		assets.enqueue("assets/chalkboard2.png");
        assets.enqueue("assets/win.png");
        assets.enqueue("assets/bottom.png");
		assets.enqueue("assets/font.png");
		assets.enqueue("assets/font.fnt");
        assets.enqueue("assets/menu.png");
        assets.enqueue("assets/9v31.png");
        assets.enqueue("assets/9v32.png");
        assets.enqueue("assets/9v33.png");
        assets.enqueue("assets/9v34.png");
        assets.enqueue("assets/9v35.png");
        assets.enqueue("assets/7v11.png");
        assets.enqueue("assets/7v12.png");
        assets.enqueue("assets/7v13.png");
        assets.enqueue("assets/7v14.png");
        assets.enqueue("assets/7v15.png");
        assets.enqueue("assets/9jump1.png");
        assets.enqueue("assets/9jump2.png");
        assets.enqueue("assets/9jump3.png");
        assets.enqueue("assets/9jump4.png");
		assets.enqueue("assets/bgsong.mp3");
		
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
}
