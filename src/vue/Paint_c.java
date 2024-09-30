/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vue;

import com.twelvemonkeys.image.ImageUtil;
import java.awt.Color;
import java.awt.Dimension;
import javax.swing.JComponent;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import javax.swing.Icon;
import javax.swing.ImageIcon;


public class Paint_c extends JComponent {
    
    private Icon image; 
    private BufferedImage bufferedImage;
    
    public Paint_c(){
        image = new ImageIcon(getClass().getResource("/image_icone/Rectangle.png"));        
    }
    
    private void createImage(){
        
        if(image!=null){
            int width = getWidth();
            int height = getHeight();
            
            if(width>0&&height>0){
                bufferedImage = new BufferedImage(width,height,BufferedImage.TYPE_INT_ARGB);
                Graphics2D g2 = bufferedImage.createGraphics();
                g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BILINEAR );
                Rectangle rec = getAutoSize(image);
                g2.drawImage(((ImageIcon) image).getImage(), rec.x, rec.y, rec.width, rec.height, null);
//                createBlurImage(g2);
               
                g2.dispose();
            }
        } 
    }
    
//    private void createBlurImage(Graphics2D g){
//        int x=20;
//        int y=20;
//        int width = 250;
//        int height = 250;
//        int shadow = 8;
//        if (width>0 && height >0){
//            BufferedImage img = new BufferedImage(width,height,BufferedImage.TYPE_INT_ARGB);
//            Graphics2D g2=img.createGraphics();
//            g2.drawImage(ImageUtil.blur(bufferedImage.getSubimage(x, y, width, height), 10f),0,0, null);
//            g2.dispose();
////            g.drawImage(new ShadowRenderer(shadow,0.3f, new Color(0,0,0)).createShadow(img), x, y,null);
//            g.drawImage(img, x, y,null);
//        }
//    }

    @Override
    protected void paintComponent(Graphics grphcs){
        grphcs.drawImage(bufferedImage, 0, 0, null);
        super.paintComponent(grphcs);
    }
    
    @Override
    public void setBounds(int i,int i1,int i2,int i3){
        super.setBounds(i, i1, i2, i3);
        createImage();
    }
    
    private Rectangle getAutoSize(Icon image){
        int w=getWidth();
        int h=getHeight();
        int iw=image.getIconWidth();
        int ih=image.getIconHeight();
        double xScale = (double) w / iw;
        double yScale = (double) h / ih;
        double scale = Math.max(xScale, yScale);
        int width = (int) (scale * iw);
        int height = (int) (scale * ih);
        if(width < 1){
            width = 1;
        }
        if(height < 1){
            height = 1;
        }
        int x = (w-width) / 2;
        int y = (h-height) / 2;
        return new Rectangle(new Point(x, y), new Dimension(width, height));
        
    }
    
}
