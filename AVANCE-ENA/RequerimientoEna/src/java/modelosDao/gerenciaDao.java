
package modelosDao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import modelosVo.gerencia;

public class gerenciaDao {

    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    gerencia obj;

    public List<gerencia> Listar() {
        List<gerencia> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "select * from tb_gerencia";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                int num = rs.getInt("num");
                String nombre = rs.getString("nombre");
                // obj = new Area(num, nombre);
                // lista.add(obj);
                lista.add(new gerencia(num, nombre));
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

}

