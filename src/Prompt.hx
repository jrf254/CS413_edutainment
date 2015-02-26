import starling.text.TextField;
import starling.text.BitmapFont;
import starling.events.EnterFrameEvent;

class Prompt extends TextField{
	private var correct:Bool = false;
	private var xCoord:Float;
	private var yCoord:Float;
	private var type:Int;
	private var answer:Float;
	private var diff:Int;
	private var correctCount:Int;

	public function new(xCoord:Float, yCoord:Float, type:Int = 1){
		super(500, 200, "","",48);
		this.x = xCoord;
		this.y = yCoord;
		this.xCoord = xCoord;
		this.yCoord = yCoord;
		this.fontName = "font";
		this.fontSize = 48;
		this.color = 0xFFFFFF;
		this.type = type;
		diff = 2;
		this.text = generateQuestion(type, diff);
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
			this.answer = 0;
			for (i in 0...difficulty){
				var num = numArray.pop();
				answer = answer + num;
				returnString = returnString + num;
				if (i < difficulty - 1){
					returnString = returnString + " + ";
				}
			}
			trace(answer);
		}
		//subtraction branch
		else if(type == 1){
			this.answer = 0;
			for (i in 0...difficulty){
				var num = numArray.pop();
				answer = answer - num;
				returnString = returnString + num;
				if (i < difficulty - 1){
					returnString = returnString + " - ";
				}
			}
			trace(answer);
		}
		//multiplication branch
		else if(type == 2){
			this.answer = 1;
			for (i in 0...difficulty){
				var num = numArray.pop();
				answer = answer * num;
				returnString = returnString + num;
				if (i < difficulty - 1){
					returnString = returnString + " x ";
				}
			}
			trace(answer);
		}else{
			return "ERROR";
		}
		return returnString;
	}
	
	public function update(){
		this.x = this.x - 2;
		if (isOffScreen()){
			this.x = xCoord;
			this.text = generateQuestion(type,diff);
		}
		if (correctCount >= 10){
			correctCount = 0;
			diff = diff + 1;
		}
	}
		
	public function enterFrame(event:EnterFrameEvent){
		update();
	}
	
	public function isCorrect():Bool{
		return correct;
	}
	
	public function isOffScreen():Bool{
		if (this.x + 500 < 0){
			return true;
		}
		return false;
	}
}