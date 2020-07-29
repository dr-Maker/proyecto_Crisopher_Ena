<
<%@page import="modelosDao.asignarDao"%>
<%@page import="modelosDao.encargadoDao"%>
<%@page import="modelosDao.encargadoDao"%>
<%@page import="modelosVo.dpto"%>
<%@page import="modelosDao.dptoDao"%>
<%@page import="modelosVo.gerencia"%>
<%@page import="modelosVo.asignar"%>
<%@page import="modelosVo.encargado"%>
<%@page import="modelosDao.gerenciaDao"%>
<%@page import="java.util.List"%>
<%@page import="modelosVo.requerimiento"%>
<%@page import="modelosDao.requerimientosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getSession().getAttribute("web") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String s = (String) request.getSession().getAttribute("web");
        if (s.equals("ERROR")) {
            response.sendRedirect("index.jsp");
        }
    }
%>

<%
    String gerencia = "0";
    String dpto = "0";
    String asignar = "0";
    String encargado = "0";
   
    String sltop = "";

    if (request.getParameter("gerencia") != null) {
        gerencia = request.getParameter("gerencia");
        dpto = request.getParameter("dpto");
        asignar = request.getParameter("asignar");
        encargado = request.getParameter("encargado");
    }
        
    gerenciaDao daogerencia = new gerenciaDao();
    List<gerencia> listagerencias = daogerencia.Listar();

    dptoDao daodptos = new dptoDao();
    List<dpto> listadpto = daodptos.Listar(Integer.parseInt(gerencia));

    asignarDao daoasignar = new asignarDao();
    List<asignar> listaasignar = daoasignar.Listar();

    encargadoDao daoencargado = new encargadoDao();
    List<encargado> listaencargado = daoencargado.Listar();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
            function goSubmit() {
                document.getElementById("frm").submit();
            }
        </script>
    </head>
    <body>
        <div class="panel2">
            <p style="text-align: right;">
                Hola <%=request.getSession().getAttribute("usuario")%>
                <br>
                <a href="logout.jsp">Cerrar session</a>
            </p>
            <h1>Cerrar Requerimiento</h1>

            <p>
                <a href="registro.jsp">Buscar</a>
            </p>

            <form id="frm" name="frm" action="RequerimientoCst.jsp" method="post">
                <table class="tablaSLT">
                    <tr>
                        <td>Gerencia</td>
                        <td>Dpto</td>
                        <td>Asignar a</td>
                        <td>Encargado</td>
                    </tr>
                    <tr>
                        <td>
                            <select class="cssslt" name="gerencia" onchange="goSubmit()">
                                <option value="0">Seleccione...</option>
                                <%  // llenamos los select (combo box)                                  
                                    for (gerencia item : listagerencias) {
                                        if (Integer.parseInt(gerencia) == item.getNum()) {
                                            out.print("<option selected value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                        } else {
                                            out.print("<option value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                        </td>
                        <td>
                            <select class="cssslt" name="dpto" onchange="goSubmit()">
                                <option value="0">Seleccione...</option>
                                <%  // llenamos los select (combo box)                                  
                                    for (dpto item : listadpto) {
                                        sltop = "";
                                        if (Integer.parseInt(dpto) == item.getNum()) {
                                            sltop = "selected";
                                        }
                                        out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                        <td>
                            <select class="cssslt" name="asignar" onchange="goSubmit()">
                                <option value="0">Seleccione...</option>
                                <%  // llenamos los select (combo box)  
                                    for (asignar item : listaasignar) {
                                        sltop = "";
                                        if (Integer.parseInt(asignar) == item.getNum()) {
                                            sltop = "selected";
                                        }
                                        out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                        <td>
                            <select class="cssslt" name="encargado" onchange="goSubmit()">
                                <option value="0">Todos</option>
                                <%  // llenamos los select (combo box)  
                                    for (encargado item : listaencargado) {
                                        sltop = "";
                                        if (Integer.parseInt(encargado) == item.getNum()) {
                                            sltop = "selected";
                                        }
                                        out.print("<option " + sltop + " value='" + item.getNum() + "'>" + item.getNombre() + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                </table>
            </form>

            <table class="plani">
                <thead>
                    <tr>
                        <td>Gerencia</td>
                        <td>Dpto</td>
                        <td>Asignar a</td>
                        <td>Encargado</td>
                        <td>cerrar</td>
                    </tr>
                </thead>
                <tbody>
                    <%            

                        requerimientosDao dao = new requerimientosDao();

                        int numgerencia = Integer.parseInt(gerencia);
                        int numdpto = Integer.parseInt(dpto);
                        int numasignar = Integer.parseInt(asignar);
                        int numencargado = Integer.parseInt(encargado);

                        List<requerimiento> lista = dao.ListarV2(numgerencia, numdpto, numasignar, numencargado);
                        for (requerimiento item : lista) {
                            out.print("<tr>");
                            out.print("<td>" + item.getNomgerencia() + "</td>");
                            out.print("<td>" + item.getNomdpto() + "</td>");
                            out.print("<td>" + item.getNomasignar() + "</td>");
                            out.print("<td>" + item.getFecha() + "</td>");
                            out.print("<td>" + item.getNomencargado() + "</td>");

                            out.print("<td><a href='borrar.jsp?num=" + item.getNum() + "'>Borrar</a></td>");

                            out.print("</tr>");
                        }
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>

