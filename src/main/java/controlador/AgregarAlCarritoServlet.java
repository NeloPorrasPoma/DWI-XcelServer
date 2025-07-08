package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import modelo.Producto;
import modelo.ProductoDAO;

@WebServlet("/AgregarAlCarritoServlet")
public class AgregarAlCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        ProductoDAO dao = new ProductoDAO();
        Producto producto = dao.obtenerPorId(id);

        if (producto != null) {
            producto.setCantidad(cantidad);

            HttpSession session = request.getSession();
            List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
            if (carrito == null) carrito = new ArrayList<>();

            boolean existe = false;
            for (Producto p : carrito) {
                if (p.getId() == producto.getId()) {
                    p.setCantidad(p.getCantidad() + cantidad);
                    existe = true;
                    break;
                }
            }

            if (!existe) {
                carrito.add(producto);
            }

            session.setAttribute("carrito", carrito);
        }

        response.sendRedirect("carrito.jsp");
    }
}
