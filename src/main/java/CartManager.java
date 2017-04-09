import myTypes.Cart;
import myTypes.Ticket;
import myTypes.TicketType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
@WebServlet(name = "CartManager", urlPatterns = {"/CartManager"})
public class CartManager extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO Auto-generated method stub
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        String action = request.getParameter("action");
        switch(action){
            case "add":
                String ticketType = request.getParameter("ticketType");
                Ticket ticket = new Ticket(TicketType.valueOf(ticketType));
                cart.addTicket(ticket);
                response.sendRedirect("index.jsp");
                break;
            case "remove":
                String ticketId = request.getParameter("ticketId");
                cart.removeTicket(Integer.parseInt(ticketId));
                response.sendRedirect("cart.jsp");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
