package myTypes;

import java.util.Collection;
import java.util.HashMap;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
public class Cart {
    private HashMap<Integer, Ticket> ticketList;
    private double tot;
    private int nItem;



    public Cart(){
        ticketList = new HashMap<Integer, Ticket>();
        tot = 0;
        nItem = 0;
    }

    public synchronized int addTicket(Ticket t){
        int id = Ticket.getNewId();
        t.setId(id);
        ticketList.put(id, t);
        tot += t.getPrice();
        nItem++;
        return id;
    }

    public synchronized Ticket removeTicket(int id){
        Ticket t = ticketList.remove(id);
        tot -= t.getPrice();
        nItem--;
        return t;
    }

    public Collection<Ticket> getTicketList(){
        return ticketList.values();
    }

    public double getTot(){
        return tot;
    }

    public int getNItem(){
        return nItem;
    }
}
