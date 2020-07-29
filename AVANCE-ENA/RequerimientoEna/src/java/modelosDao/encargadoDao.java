
package modelosDao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import modelosVo.encargado;

public class encargadoDao {
    
    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    encargado obj;
    
    public List<encargado> Listar() {
        List<encargado> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "select * from tb_encargado";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                int num = rs.getInt("num");
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                String fono = rs.getString("fono");
                lista.add(new encargado(num, nombre, email, fono));
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }
}

