import myTypes.Cart;
import myTypes.Ticket;
import myTypes.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
@WebServlet(name = "TransactionManager", urlPatterns = {"/private/TransactionManager"})
public class TransactionManager extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("inside transaction manager");

        Cart cart = (Cart)request.getSession().getAttribute("cart");
        User user = (User)request.getSession().getAttribute("user");
        ArrayList<Ticket> purchaseList = new ArrayList<Ticket>();
        for(Ticket t : cart.getTicketList()){
            purchaseList = user.getPurchaseList();
            purchaseList.add(t);
        }
        if(!purchaseList.isEmpty()){
            response.sendRedirect("/ticketStore/private/account.jsp");
        }
        else{
            response.sendRedirect("/ticketStore/cart.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
