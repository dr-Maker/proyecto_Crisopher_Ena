<%@page import="modelosVo.requerimiento"%>
<%@page import="modelosDao.requerimientosDao"%>
<%
    if (request.getSession().getAttribute("web") == null) {
        response.sendRedirect("index.jsp");
    } else {
        String s = (String) request.getSession().getAttribute("web");
        if (s.equals("ERROR")) {
            response.sendRedirect("index.jsp");
        }
    }

    int num = Integer.parseInt(request.getParameter("num"));
    requerimientosDao dao = new requerimientosDao();
    requerimiento obj = dao.Buscar(num);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cerrar requerimiento&oacute;n</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="panel">
            <h1>Cerrar requerimiento&oacute;n</h1>
            <form id="frm" name="frm" action="delete.jsp" method="post">
                <p>
                    gerencia: <%=obj.getNomgerencia()%>
                </p>
                <p>
                    dpto: <%=obj.getNomdpto()%>
                </p>
                <p>
                    asignar: <%=obj.getNomasignar()%>
                </p>
                <p>
                    encargado: <%=obj.getNomencargado()%>
                </p>
                <p>
                    Fecha inicio: <%=obj.getFecha()%>
                </p>

                <p>
                    <input type="hidden" name="num" value="<%=num%>"/>
                    <input type="submit" value="Cerrar"/>                    
                </p>
            </form>
            <p>
                <a href="menuPrincipal.jsp">Volver</a>
            </p>
        </div>
    </body>
</html>
