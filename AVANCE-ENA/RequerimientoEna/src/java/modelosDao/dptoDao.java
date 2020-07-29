
package modelosDao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelosVo.dpto;

public class dptoDao {
    
    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    dpto obj;

    public List<dpto> Listar(int numgerencia) {
        List<dpto> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "select * from tb_dpto  where numgerencia = ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, numgerencia);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                int num = rs.getInt("num");
                String nombre = rs.getString("nombre");
                lista.add(new dpto(num, nombre, numgerencia));
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

}
