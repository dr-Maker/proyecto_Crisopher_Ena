
package modelosDao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelosVo.asignar;

public class asignarDao {

    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    asignar obj;

    public List<asignar> Listar() {
        List<asignar> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "select * from tb_asignar";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                int num = rs.getInt("num");
                String nombre = rs.getString("nombre");
                int horas = rs.getInt("horas");
                int cupos = rs.getInt("cupos");
                lista.add(new asignar(num, nombre, horas, cupos));
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

}
