package tw.brad.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

@WebServlet("/Brad13")
public class Brad13 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String imgFile = "C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\upload\\coffee.jpg";

		BufferedImage img = ImageIO.read(new File(imgFile));
		Graphics2D g2d = img.createGraphics();
		
		Font font = new Font(null, Font.BOLD, 72);
		AffineTransform tran = new AffineTransform();
		tran.rotate(Math.toRadians(-30));
		Font font2 = font.deriveFont(tran);
		
		g2d.setColor(Color.YELLOW);
		g2d.setFont(font2);
		g2d.drawString("資策會論壇專屬, Hello, World", 100, 600);
		
		
		response.setContentType("image/jpeg");
		ImageIO.write(img, "JPEG", response.getOutputStream());
		response.flushBuffer();
		
		String newFile = "C:\\Users\\User\\git\\repository\\BradWeb\\src\\main\\webapp\\upload\\coffee2.jpg";
		ImageIO.write(img, "JPEG", new File(newFile));
	
	}

}
