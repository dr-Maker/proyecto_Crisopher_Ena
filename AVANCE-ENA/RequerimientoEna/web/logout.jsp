<% 
    request.getSession().setAttribute("web", "ERROR");
    response.sendRedirect("index.jsp");
%>