<%@page import="modelosVo.requerimiento"%>
<%@page import="modelosDao.requerimientosDao"%>
<%
    
    int numgerencia = Integer.parseInt(request.getParameter("Gerencia"));
    int numdpto = Integer.parseInt(request.getParameter("dpto"));
    int numasignar = Integer.parseInt(request.getParameter("asignar"));
    int numencargado = Integer.parseInt(request.getParameter("encargado"));
    String Requerimiento = request.getParameter("requerimiento"); 
   // String fecha = request.getParameter("fecha");

    requerimiento obj = new requerimiento(0, numgerencia, numdpto, numasignar, numencargado, "", "", "", "", Requerimiento);
    requerimientosDao dao = new requerimientosDao();
    dao.Insert(obj);

    response.sendRedirect("RequerimientoCst.jsp");
%>
