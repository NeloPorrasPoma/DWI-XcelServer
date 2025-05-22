<%-- 
    Document   : registro
    Created on : 24 abr. 2025, 17:12:14
    Author     : PorrasPoma
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro | XCEL_SERVER</title>
    <link rel="stylesheet" href="css/estilosGenerales.css">
    <link rel="stylesheet" href="css/estilosRegistro.css"> <!-- Agregar estilos específicos para el registro -->
</head>
<body> 
    <header>
        <nav> 
            <ul class="nav-center">
                <li><a href="index.jsp">INICIO</a></li>
                <li><a href="productos.jsp">PRODUCTOS</a></li>
                <li><a href="nosotros.jsp">NOSOTROS</a></li>
                <li><a href="contacto.jsp">CONTACTO</a></li>
            </ul>
            <ul class="nav-right">
                <li><a href="login.jsp">INICIAR SESIÓN</a></li>
            </ul>
        </nav>
    </header>

    <!-- Sección de registro -->
    <section id="registro">
        <div class="registro-container">
            <h2>REGÍSTRATE</h2>
            <form action="RegistroServlet" method="post" class="form-registro">
                <div class="form-group">
                    <label for="nombre">Nombre completo:</label>
                    <input type="text" id="nombre" name="nombre" required placeholder="Ingrese su nombre completo" />
                </div>
                <div class="form-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" required placeholder="Ingrese su correo electrónico" />
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" placeholder="Ingrese su teléfono" />
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" id="direccion" name="direccion" required placeholder="Ingrese su dirección" />
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" id="contrasena" name="contrasena" required placeholder="Ingrese una contraseña" />
                </div>
                <div class="form-group">
                    <label for="confirmarContrasena">Confirmar contraseña:</label>
                    <input type="password" id="confirmarContrasena" name="confirmarContrasena" required placeholder="Confirme su contraseña" />
                </div>
                <button type="submit" class="btn-registro">Registrarse</button>
            </form>
        </div>
    </section>

    <button onclick="window.location.href='contacto.jsp'" class="btn-ayuda">¿Necesitas ayuda?</button>

    <footer>
        <p>&copy; 2025 XCEL_SERVER. Todos los derechos reservados.</p>
    </footer>
</body>
</html>