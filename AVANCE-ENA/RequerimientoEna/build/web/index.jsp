<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autentificacion</title>
        
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="panel">
            <h1>Autentificacion</h1>
            <form id="frm" name="frm" action="validar.jsp" method="post">
                <p>
                    <label>Usuario</label>
                    <input required type="text" name="usuario" value="" />
                </p>
                <p>
                    <label>Clave</label>
                    <input required type="password" name="clave" value="" />
                </p>
                <p>
                    <input type="submit" value="Login" />
                </p>
            </form>
        </div>
    </body>
</html>
