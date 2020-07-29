
package modelosVo;

public class dpto {
    private int num;
    private String nombre;
    private int numgerencia;

    public dpto() {
    }

    public dpto(int num, String nombre, int numgerencia) {
        this.num = num;
        this.nombre = nombre;
        this.numgerencia = numgerencia;
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

    public int getNumgerencia() {
        return numgerencia;
    }

    public void setNumgerencia(int numgerencia) {
        this.numgerencia = numgerencia;
    }
    
    
}