package test;

import model.Plant;
import dao.PlantDao;

public class TestGetPlantByID {
    public static void main(String[] args) {
        try {
            Plant plant = PlantDao.getPlantByID(7);
            System.out.println(plant.toString() );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
