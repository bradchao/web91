package tw.brad.apis;

public class MyTest {
	private int lottery;

	public MyTest() {
		lottery = (int)(Math.random()*49+1);
	}
	
	public int getLottery() {
		return lottery;
	}

}
