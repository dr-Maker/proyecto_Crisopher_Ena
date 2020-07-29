
package modelosVo;

public class requerimiento{
    private int num;
    private int numgerencia;
    private int numdpto;
    private int numasignar;
    private int numencargado;
    // extras
    private String nomgerencia;
    private String nomdpto;
    private String nomasignar;
    private String nomencargado;
    private String requerimiento;

    public requerimiento() {
    }

    public requerimiento(int num, int numgerencia, int numdpto, int numasignar, int numencargado, String nomgerencia, String nomdpto, String nomasignar, String nomencargado, String requerimiento) {
        this.num = num;
        this.numgerencia = numgerencia;
        this.numdpto = numdpto;
        this.numasignar = numasignar;
        this.numencargado = numencargado;
        this.nomgerencia = nomgerencia;
        this.nomdpto = nomdpto;
        this.nomasignar = nomasignar;
        this.nomencargado = nomencargado;
        this.requerimiento = requerimiento;
    }
    

    public String getNomgerencia() {
        return nomgerencia;
    }

    public void setNomgerencia(String nomgerencia) {
        this.nomgerencia = nomgerencia;
    }

    public String getNomdpto() {
        return nomdpto;
    }

    public void setNomdpto(String nomdpto) {
        this.nomdpto = nomdpto;
    }

    public String getNomasignar() {
        return nomasignar;
    }

    public void setNomasignar(String nomasignar) {
        this.nomasignar = nomasignar;
    }

    public String getNomencargado() {
        return nomencargado;
    }

    public void setNomencargado(String nomencargado) {
        this.nomencargado = nomencargado;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getNumgerencia() {
        return numgerencia;
    }

    public void setNumgerencia(int numgerencia) {
        this.numgerencia = numgerencia;
    }

    public int getNumdpto() {
        return numdpto;
    }

    public void setNumdpto(int numdpto) {
        this.numdpto = numdpto;
    }

    public int getNumasignar() {
        return numasignar;
    }

    public void setNumasignar(int numasignar) {
        this.numasignar = numasignar;
    }

    public int getNumencargado() {
        return numencargado;
    }

    public void setNumencargado(int numencargado) {
        this.numencargado = numencargado;
    }

    public String getFecha() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getRequerimiento() {
        return requerimiento;
    }

    public void setRequerimiento(String requerimiento) {
        this.requerimiento = requerimiento;
    }


    
  

}

