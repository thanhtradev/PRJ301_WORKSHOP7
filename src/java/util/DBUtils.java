/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author thanhtra
 */
public class DBUtils {

    public static Connection makeConnection() throws Exception {
        Runtime rt = Runtime.getRuntime();

        Connection cn = null;
        String IP = "localhost";
        String instanceName = "";
        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        if (System.getProperty("os.name").contains("Linux")) {
            pwd = pwd + "6A@";
        }
        String db = "PlantShop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;

    }
}
