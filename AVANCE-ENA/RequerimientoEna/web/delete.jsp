<%@page import="modelosDao.requerimientosDao"%>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    requerimientosDao dao=new requerimientosDao();
    dao.delete(num);
    response.sendRedirect("RequerimientoCst.jsp");
%>
