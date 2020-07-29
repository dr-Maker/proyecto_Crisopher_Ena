<%@page import="java.util.List"%>
<%@page import="modelosVo.usuario"%>
<%@page import="modelosDao.usuarioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
    </head>
    <body>
        <div class="panel2">
            <%
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");

                usuarioDao dao = new usuarioDao();

                List<usuario> lista = dao.Validar(new usuario(0, usuario, clave));
                if (lista.size() > 0) {
                    out.print("<h1>Acceso OK</h1>");
                    request.getSession().setAttribute("web", "OK"); 
                    request.getSession().setAttribute("usuario", usuario);
                    response.sendRedirect("menuPrincipal.jsp");
                } else {
                    request.getSession().setAttribute("web", "ERROR");
                    out.print("<h1>Error de acceso!</h1>");
                }

            %>       
            <a href="index.jsp">Volver a iniciar</a>
        </div>
    </body>
</html>
