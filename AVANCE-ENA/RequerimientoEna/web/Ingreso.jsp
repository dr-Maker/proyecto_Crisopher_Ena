<%@page import="java.util.List"%>

<%@page import="modelosDao.gerenciaDao"%>
<%@page import="modelosDao.dptoDao"%>
<%@page import="modelosDao.asignarDao"%>
<%@page import="modelosDao.encargadoDao"%>
<%@page import="modelosVo.gerencia"%>
<%@page import="modelosVo.dpto"%>
<%@page import="modelosVo.asignar"%>
<%@page import="modelosVo.encargado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int gerencia = 0;
    int dpto = 0;
    int asignar = 0;
    int encargado = 0;
    String fecha = "";
    String sltop = "";

    if (request.getParameter("Gerencia") != null) 
    { 
            gerencia = Integer.parseInt(request.getParameter("Gerencia")) ;
  
    if (request.getParameter("dpto") != null)
    {
            dpto =  Integer.parseInt(request.getParameter("dpto"));
      }
       
     if (request.getParameter("asignar") != null)
     {        
            asignar = Integer.parseInt(request.getParameter("asignar")) ;    
     }
     
     if (request.getParameter("encargado") != null)
     {     
            encargado = Integer.parseInt(request.getParameter("encargado"));
     }
     
        fecha = request.getParameter("fecha");
    }

    gerenciaDao daogerencia = new gerenciaDao();
    List<gerencia> listagerencia = daogerencia.Listar();

    dptoDao daodpto = new dptoDao();
    List<dpto> listadpto = daodpto.Listar(gerencia);

    asignarDao daoasignar = new asignarDao();
    List<asignar> listaasignar = daoasignar.Listar();

    encargadoDao daoencargado = new encargadoDao();
    List<encargado> listaencargado = daoencargado.Listar();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">

            function goSumit() {
                document.getElementById("frm").action = "Ingreso.jsp";
                document.getElementById("frm").submit();
            }

        </script>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-head">
                     <h1>Ingresar Requerimiento</h1>
                </div>
                <div class="card-body">
                    <form id="frm" name="frm" action="insert.jsp" method="post">    
                                <p>
                                   <label>Gerencia</label>
                                        <select required class="cssslt" name="Gerencia" onchange="goSumit()">
                                                    <option value="0">Seleccione..</option>

                                                    <%
                                                       
                                                        for (gerencia item : listagerencia) {
                                                            sltop = "";
                                                            if (gerencia == item.getNum()) 
                                                            {
                                                                sltop = "selected"; 
                                                            }
                                                            else
                                                            {
                                                                sltop = "";
                                                            }
                                                    %>  
                                                   
 
                                                    <option  <%= sltop %> value="<%= item.getNum() %>" > <%= item.getNum() + item.getNombre() %> </option>
             
                                                    <%       
                                                        }
                                                    %>
                                        </select>
                                        
                                        
                                </p>
                                
                            
                                
                                <p>
                                    <label>Dpto</label>
                                        <select required class="cssslt" name="dpto" onchange="goSumit()">
                                                    <option value="0">Seleccione..</option>
                                                    <%
                                                        for (dpto item : listadpto) {
                                                            sltop = "";
                                                            if (  dpto == item.getNum()) {
                                                                sltop = "selected";
                                                            }
                                                            out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                                        }
                                                    %>
                                        </select>
                                </p>
                                <p>
                                    <label>Asignar a</label>
                                        <select required class="cssslt" name="asignar" onchange="goSumit()">
                                                    <option value="0">Seleccione..</option>
                                                    <%
                                                        for (asignar item : listaasignar) {
                                                            sltop = "";
                                                            if ( asignar == item.getNum()) {
                                                                sltop = "selected";
                                                            }
                                                            out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                                        }
                                                    %>
                                        </select>
                                </p>
                                <p>
                                       <label>Encargado</label>
                                       <select required class="cssslt" name="encargado" onchange="goSumit()">
                                                    <option value="0">Seleccione..</option>
                                                    <%
                                                        for (encargado item : listaencargado) {
                                                            sltop = "0";
                                                            if (encargado == item.getNum()) {
                                                                sltop = "selected";
                                                            }
                                                            out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                                        }
                                                    %>
                                        </select>
                                 </p>
                                 <p>
                                     <label>Requerimientos</label>
                                           
                                     <input class="comentario" type="text" name="requerimiento" id="requerimiento"> 
                                     
                                 </p>

                                               

                                <p>
                                   <input type="submit" value="Ingresar" />
                               </p>
                     </form>
                    
                </div>
            </div>
        </div>
    </body>
</html>