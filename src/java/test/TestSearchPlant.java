/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.util.ArrayList;

import model.Plant;
import dao.PlantDao;

/**
 *
 * @author thanh
 */
public class TestSearchPlant {
    public static void main(String[] args) {
        System.out.println(System.getProperty("os.name"));
        
        try {
            ArrayList<Plant> plantList = PlantDao.getPlants("lan", "byname");
            for (Plant plant : plantList) {
                System.out.println(plant.getImgpath());
            }
            System.out.println();
        } catch (Exception e) {
        }
    }
}
