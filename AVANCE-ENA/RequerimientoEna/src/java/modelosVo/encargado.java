
package modelosVo;

public class encargado {

    private int num;
    private String nombre;
    private String email;
    private String fono;

    public encargado() {
    }

    public encargado(int num, String nombre, String email, String fono) {
        this.num = num;
        this.nombre = nombre;
        this.email = email;
        this.fono = fono;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFono() {
        return fono;
    }

    public void setFono(String fono) {
        this.fono = fono;
    }

}

