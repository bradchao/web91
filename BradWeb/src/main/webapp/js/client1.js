window.onload = function(){
	var canvas, ctx;
	var isDrag = false;
	
	canvas = document.getElementById('myDrawer');
	ctx = canvas.getContext('2d');
	
	canvas.onmousedown = function(event){
		isDrag = true;
		var x = event.offsetX, y = event.offsetY;
		ctx.beginPath();
		ctx.lineWidth = 4;
		ctx.moveTo(x, y);
		console.log("down:" + x + ";" + y);
	};
	
	canvas.onmouseup = function(event){
		isDrag = false;
	};
	
	canvas.onmousemove = function(event){
		if (isDrag){
			var x = event.offsetX, y = event.offsetY;
			ctx.lineTo(x,y);
			ctx.stroke();
			console.log("move:" + x + ";" + y);
		}
	};
	
}