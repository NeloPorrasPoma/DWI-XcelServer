package modelo;

import java.sql.*;
import java.util.*;
import util.conexion;

public class CategoriaDAO {

    public List<Categoria> listarCategorias() {
        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM categoria";

        try (Connection con = conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Categoria cat = new Categoria();
                cat.setId(rs.getInt("ID"));
                cat.setNombre(rs.getString("CATEGORIA"));
                lista.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}
