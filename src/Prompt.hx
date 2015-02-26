import starling.text.TextField;
import starling.text.BitmapFont;
import starling.events.EnterFrameEvent;

class Prompt extends TextField{
	private var correct:Bool = false;
	private var xCoord:Float;
	private var yCoord:Float;

	public function new(xCoord:Float, yCoord:Float){
		super(200, 200, "","",32);
		this.x = xCoord;
		this.y = yCoord;
		this.xCoord = xCoord;
		this.yCoord = yCoord;
		this.fontName = "font";
		this.fontSize = 32;
		this.color = 0xFFFFFF;
		this.text = generateQuestion(0,2);
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}
	
	public function generateQuestion(type:Int, difficulty:Int = 2):String{
		var returnString:String = "";
		var numArray:Array<Float> = new Array();
		for (i in 0...difficulty){
			numArray.push(Math.ffloor(Math.random()*100));
		}
		//addition branch
		if (type == 0){
			for (i in 0...difficulty){
				returnString = returnString + numArray.pop();
				if (i < difficulty - 1){
					returnString = returnString + " + ";
				}
			}
		}
		//multiplication branch
		else if(type == 1){
			for (i in 0...difficulty){
				returnString = returnString + numArray.pop();
				if (i < difficulty - 1){
					returnString = returnString + " * ";
				}
			}
		}else{
			return "ERROR";
		}
		return returnString;
	}
	
	public function update(){
		this.x = this.x - 2;
		if (isOffScreen()){
			this.x = xCoord;
			this.text = generateQuestion(0,2);
		}
	}
		
	public function enterFrame(event:EnterFrameEvent){
		update();
	}
	
	public function isCorrect():Bool{
		return correct;
	}
	
	public function isOffScreen():Bool{
		if (this.x + 200 < 0){
			return true;
		}
		return false;
	}
}