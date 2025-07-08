package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Asegúrate que tienes este driver
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/xcel_server", // Cambia si tu puerto o BD es distinta
                "root", // Tu usuario de MySQL
                ""      // Tu contraseña si tiene
            );
        } catch (ClassNotFoundException | SQLException e) {
        }
        return con;
    }

    public static Connection conectar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
