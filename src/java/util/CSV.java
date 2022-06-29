package util;

import java.io.*;

import model.Plant;
import dao.PlantDao;

/**
 * CSV
 */
public class CSV {
    public static void main(String[] args) throws NumberFormatException, Exception {
        String line = "";
        String splitBy = ",";
        try {

            // parsing a CSV file into BufferedReader class constructor
            BufferedReader br = new BufferedReader(new FileReader("/home/thanhtra/FPT/PRJ301/WS5/src/products.csv"));
            while ((line = br.readLine()) != null)
            // returns a Boolean value
            {
                String[] plant = line.split(splitBy);
                // use comma as separator
                // System.out.println("Plant [Name=" + plant[0] + ", price=" + plant[1] + ",
                // imgPath="
                // + plant[2] + "]");
                // Plant p = new Plant(1, plant[0], Integer.parseInt(plant[1]), plant[2],
                // "description", 1, 1, "catename");
                PlantDao.insertPlant(plant[0], Integer.parseInt(plant[1]), plant[2], "This is " + plant[0], 1, 1);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}