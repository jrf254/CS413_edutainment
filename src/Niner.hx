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

class Niner extends Image{

	public var jump:Bool;
	private var timeJump:Bool = true;

	var niner1:Texture = Root.assets.getTexture("9v31");
	var niner2:Texture = Root.assets.getTexture("9v32");
	var niner3:Texture = Root.assets.getTexture("9v33");
	var niner4:Texture = Root.assets.getTexture("9v34");
	var niner5:Texture = Root.assets.getTexture("9v35");
	var njump1:Texture = Root.assets.getTexture("9jump1");
	var njump2:Texture = Root.assets.getTexture("9jump2");
	var njump3:Texture = Root.assets.getTexture("9jump3");
	var njump4:Texture = Root.assets.getTexture("9jump4");

	var time:Int = 0;

	public function new() {

		super(niner1);

		pivotX = this.texture.width / 2;
		pivotY = this.texture.height / 2;

		x = 600;
		y = 502;

		start();
	}

	public function start() {
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}

	public function enterFrame() {
		time = time + 1;
		if(jump == true){
			if(timeJump == true){
				time = 0;     
				timeJump = false;
				texture = njump1;
			}
			if(time == 30){
				texture = njump2;	      
			}
			else if(time < 60){
				y = y - 1;      
			}
			else if(time == 60){
			    texture = njump3; 
			}
			else if(time == 90){
				texture = njump4;      
			}
			else if(time == 120){
				jump = false;
				timeJump = true; 
				texture = niner1; 
				time = 0;    
			}
			else if(time > 60){
				y = y + 1;
			}
		}
		else {
			if(time == 3){
			    texture =  niner2; 
			}
			else if(time == 6){
				texture =  niner3; 
			}
			else if(time == 9){
				texture =  niner4;
			}
			else if(time == 12){
				texture =  niner5;
			}
			else if(time == 15){
				texture =  niner1;
				time = 0;
			}
		}
	}
}