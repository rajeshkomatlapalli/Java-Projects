
package com.serendipity.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author vladimir
 */
public class ImageFileUtil {
    
    /**
     * This will decode image base64 string back to image file.
     * Simply pass an encoded base64 string and it will return an image file.
     * 
     * @param img64
     * @param fileName
     */
    public void decodeImage(String img64, String fileName) {
        try{
                String ext;
                
                if(img64 != null) {
                    if(img64.contains("data:image/jpg"))
                        ext = "jpg";
                    else if(img64.contains("data:image/jpeg"))
                        ext = "jpeg";
                    else
                        ext = "png";
                } else {
                    return;
                }
                
                // remove data:image/png;base64, and then take the rest of the string
                img64 = img64.replaceFirst("^data:image/[^;]*;base64,?", "");
                byte[] decodedBytes = DatatypeConverter.parseBase64Binary(img64 );
                BufferedImage bfi = ImageIO.read(new ByteArrayInputStream(decodedBytes));

                URL location = getClass().getProtectionDomain().getCodeSource().getLocation();
                String imagePath = (String) location.getPath();
                
                imagePath = imagePath.replace("build/web/WEB-INF/classes/com/serendipity/util/ImageFileUtil.class", "web/assets/images/book");
                
                // create directory if does not exist
                File directory = new File(imagePath);
                if (!directory.exists()) {
                        if (directory.mkdir()) {
                                System.out.println("Directory is created!");
                        } else {
                                System.out.println("Failed to create directory!");
                        }
                }

                File outputfile = new File(imagePath + "/" + fileName.replaceAll(" ", "").replaceAll(":", "") + "." + ext);

                if (outputfile.createNewFile()){
                    System.out.println("Book image file is created!");
                }else{
                    System.out.println("Book image file already exists.");
                }

                ImageIO.write(bfi , ext, outputfile);
                bfi.flush();
                
            }catch(Exception e) {  
             //Implement exception code   
            System.err.println("Not Saved!!!!!!!!!!!!!!!!!");
        }
    }
}