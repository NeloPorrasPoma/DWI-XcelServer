<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Categoria, modelo.CategoriaDAO, modelo.ProductoDAO, modelo.Producto, java.util.*" %>

<%
    String usuario = (String) session.getAttribute("usuario");

    CategoriaDAO catDAO = new CategoriaDAO();
    List<Categoria> categorias = catDAO.listarCategorias();

    String catParam = request.getParameter("cat");
    int catId = (catParam != null) ? Integer.parseInt(catParam) : 1;

    ProductoDAO dao = new ProductoDAO();
    List<Producto> lista = dao.listarPorCategoria(catId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Productos</title>
    <link rel="stylesheet" href="css/estilosGenerales.css">
    <link rel="stylesheet" href="css/estilosProductos.css">
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

<h2 style="text-align:center;">Categorías:</h2>
<div class="categorias">
    <ul>
        <% for (Categoria c : categorias) { %>
            <li><a href="productos.jsp?cat=<%= c.getId() %>"><%= c.getNombre() %></a></li>
        <% } %>
    </ul>
</div>

<div class="container-productos">
    <% if (lista.isEmpty()) { %>
        <p style="text-align:center;">No hay productos disponibles para esta categoría.</p>
    <% } else { 
        for (Producto p : lista) { %>
            <div class="card-producto">
                <img src="images/<%= p.getImagen() %>" alt="<%= p.getNombre() %>">
                <h3><%= p.getNombre() %></h3>
                <p class="descripcion"><%= p.getDescripcion() %></p>
                <p class="precio">S/ <%= p.getPrecio() %></p>
                <form action="CarritoServlet" method="post">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input type="hidden" name="nombre" value="<%= p.getNombre() %>">
                    <input type="hidden" name="precio" value="<%= p.getPrecio() %>">
                    <input type="number" name="cantidad" value="1" min="1" max="<%= p.getStock() %>" style="width:60px;">
                    <button type="submit" class="btn-agregar">Agregar al carrito</button>
                </form>
            </div>
    <%  } 
    } %>
</div>

</body>
</html>
