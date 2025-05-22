<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.*"%>

<%
    List<Producto> productos = new ArrayList<>();

    // Simulación de productos
    productos.add(new Producto(1, "Laptop Lenovo", 2500.00, 1));
    productos.add(new Producto(2, "Mouse Gamer", 100.00, 1));
    productos.add(new Producto(3, "Teclado Mecánico", 200.00, 1));

    request.setAttribute("productos", productos);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Productos</title>
    <link rel="stylesheet" href="css/estilosGenerales.css">
</head>
<body>
    <h1>Lista de Productos</h1>

    <%
        for (Producto p : productos) {
    %>
        <div style="border:1px solid #ccc; padding:10px; margin:10px;">
            <h3><%= p.getNombre() %></h3>
            <p>Precio: S/ <%= p.getPrecio() %></p>

            <form action="/src/main/java/controlador/AgregarAlCarritoServlet.java" method="post">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <input type="hidden" name="nombre" value="<%= p.getNombre() %>">
                <input type="hidden" name="precio" value="<%= p.getPrecio() %>">
                <label>Cantidad:</label>
                <input type="number" name="cantidad" value="1" min="1">
                <button type="submit">Agregar al Carrito</button>
            </form>
        </div>
    <%
        }
    %>
</body>
</html>
