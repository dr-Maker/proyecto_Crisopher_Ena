
package modelosDao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelosVo.requerimiento;

public class requerimientosDao {

    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    requerimiento obj;


    public List Listar() {
        List<requerimiento> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "sp_listar_Requerimiento";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                obj = new requerimiento();
                obj.setNum(rs.getInt("num"));
                obj.setNumdpto(rs.getInt("numdpto"));
                obj.setNumasignar(rs.getInt("numasignar"));
                obj.setNumencargado(rs.getInt("numencargado"));
                obj.setNomgerencia(rs.getString("nomgerencia"));
                obj.setNomdpto(rs.getString("nomdpto"));
                obj.setNomasignar(rs.getString("nomasignar"));
                obj.setNomencargado(rs.getString("nomencargado"));
                lista.add(obj);
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

    public List ListarV2(int numgerencia, int numdpto, int numasignar, int numencargado) {
        List<requerimiento> lista = new ArrayList<>();
        try {
            db.Conectar();
            sql = "sp_listar_RequerimientoV2 ?, ?, ?, ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, numgerencia);
            stmt.setInt(2, numdpto);
            stmt.setInt(3, numasignar);
            stmt.setInt(4, numencargado);
            rs = db.EjecutarConsulta(stmt);
            while (rs.next()) {
                obj = new requerimiento();
                obj.setNum(rs.getInt("num"));
                obj.setNumdpto(rs.getInt("numdpto"));
                obj.setNumasignar(rs.getInt("numasignar"));
                obj.setNumencargado(rs.getInt("numencargado"));

                obj.setNomgerencia(rs.getString("nomgerencia"));
                obj.setNomdpto(rs.getString("nomdpto"));
                obj.setNomasignar(rs.getString("nomasignar"));
                obj.setNomencargado(rs.getString("nomencargado"));
                lista.add(obj);
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return lista;
    }

    public boolean Insert(requerimiento obj) {
        boolean std = true;
        try {
            db.Conectar();
            sql = "insert into requerimiento (numgerencia,numdpto,numasignar,numencargado, requerimiento.requerimiento) values (?,?,?,?,?)";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, obj.getNumgerencia());
            stmt.setInt(2, obj.getNumdpto());
            stmt.setInt(3, obj.getNumasignar());
            stmt.setInt(4, obj.getNumencargado());
            stmt.setString(5, obj.getRequerimiento());
            db.EjecutarAccion(stmt);
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
            std = false;
        }
        return std;
    }
    
    public boolean delete(int num) {
        boolean std = true;
        try {
            db.Conectar();
            sql = "sp_delete_Requerimiento ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, num);
            db.EjecutarAccion(stmt);
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return std;
    }
    
    
    public requerimiento Buscar(int num) {
        try {
            db.Conectar();
            sql = "sp_buscar_Requerimiento ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, num);
            rs = db.EjecutarConsulta(stmt);
            if (rs.next()) {
                obj = new requerimiento();
                obj.setNum(rs.getInt("num"));
                obj.setNumdpto(rs.getInt("numdpto"));
                obj.setNumasignar(rs.getInt("numasignar"));
                obj.setNumencargado(rs.getInt("numencargado"));
                obj.setNomgerencia(rs.getString("nomgerencia"));
                obj.setNomdpto(rs.getString("nomdpto"));
                obj.setNomgerencia(rs.getString("nomgerencia"));
                obj.setNomencargado(rs.getString("nomencargado"));
            }
            db.Cerrar();
        } catch (SQLException exe) {
            System.out.println(exe.getMessage());
        }
        return obj;
    }

}

