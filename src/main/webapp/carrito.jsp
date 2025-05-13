<%-- 
    Document   : carrito
    Created on : 24 abr. 2025, 17:12:51
    Author     : PorrasPoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.Producto" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
    }
    double total = 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito | XCEL_SERVER</title>
    <link rel="stylesheet" href="css/estilosGenerales.css">
    <link rel="stylesheet" href="css/estilosCarrito.css"> 
</head>
<body>
<header>
    <nav>
        <ul class="nav-center">
            <% if (usuario == null) { %>
                <li><a href="productos.jsp">PRODUCTOS</a></li>
                <li><a href="nosotros.jsp">NOSOTROS</a></li>
                <li><a href="carrito.jsp">CARRITO</a></li>
                <li><a href="contacto.jsp">CONTACTO</a></li>
                <li><a href="login.jsp">INICIAR SESIÓN</a></li>
            <% } else { %>
                <li><a href="almacen.jsp">ALMACÉN</a></li>
                <li><a href="carrito.jsp">CARRITO</a></li>
                <li><a href="mispedidos.jsp">MIS PEDIDOS</a></li>
                <li><a href="LogoutServlet">SALIR</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<main class="carrito-container">
    <h1>Tu Carrito</h1>
    <%
        if (carrito.isEmpty()) {
    %>
        <p>No hay productos en tu carrito.</p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Precio Unitario</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Producto producto : carrito) {
                    double subtotal = producto.getPrecio() * producto.getCantidad();
                    total += subtotal;
                %>
                    <tr>
                        <td><%= producto.getNombre() %></td>
                        <td>S/ <%= producto.getPrecio() %></td>
                        <td>
                            <form action="ActualizarCantidadServlet" method="post">
                                <input type="hidden" name="id" value="<%= producto.getId() %>">
                                <input type="number" name="cantidad" value="<%= producto.getCantidad() %>" min="1">
                                <button type="submit">Actualizar</button>
                            </form>
                        </td>
                        <td>S/ <%= subtotal %></td>
                        <td>
                            <form action="EliminarDelCarritoServlet" method="post">
                                <input type="hidden" name="id" value="<%= producto.getId() %>">
                                <button type="submit">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="total">
            <h3>Total: S/ <%= total %></h3>
        </div>
        <div class="acciones-carrito">
            <a href="productos.jsp" class="btn">Seguir Comprando</a>
            <a href="FinalizarCompraServlet" class="btn">Finalizar Compra</a>
        </div>
    <%
        }
    %>
</main>

</body>
</html>


