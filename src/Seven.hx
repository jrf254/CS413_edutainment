import starling.display.Image;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.MathUtil;
import starling.events.EnterFrameEvent;
import starling.core.Starling;
import flash.geom.Rectangle;
import starling.events.EventDispatcher;
import starling.events.Event;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.animation.Juggler;
import starling.display.Quad;

class Seven extends Image{

	// private var movieVector:Vector.<MovieClip>;
	public var jump:Bool;

	var seven1:Texture = Root.assets.getTexture("7v11");
	var seven2:Texture = Root.assets.getTexture("7v12");
	var seven3:Texture = Root.assets.getTexture("7v13");
	var seven4:Texture = Root.assets.getTexture("7v14");
	var seven5:Texture = Root.assets.getTexture("7v15");

	var time:Int = 0;

	public function new() {

		super(seven1);

		pivotX = this.texture.width / 2;
		pivotY = this.texture.height / 2;

		x = 80;
		y = 502;

		start();
	}

	public function start() {
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}

	public function enterFrame() {
		time = time + 1;

		if(time == 3){
		    texture =  seven2; 
		}
		else if(time == 6){
			texture =  seven3; 
		}
		else if(time == 9){
			texture =  seven4;
		}
		else if(time == 12){
			texture =  seven5;
		}
		else if(time == 15){
			texture =  seven1;
			time = 0;
		}
	}
}