package modelosDao;

import data.BaseDatos;
import modelosVo.usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class usuarioDao {

    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    usuario obj;

    public List Validar(usuario obj) {
        List<usuario> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "select * from tb_user where usuario = ? and clave = ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setString(1, obj.getUsuario());
            stmt.setString(2, obj.getClave());
            rs = db.EjecutarConsulta(stmt);
            while(rs.next()){
                obj=new usuario();
                obj.setNum(rs.getInt("num"));
                obj.setUsuario(rs.getString("usuario"));
                obj.setClave("*****");
                lista.add(obj);
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

}