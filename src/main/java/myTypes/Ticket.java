package myTypes;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
public class Ticket {
    private static AtomicInteger c;

    private double price;
    private TicketType type;
    private int id;

    static {
        c = new AtomicInteger();
        c.set(0);
    }

    public Ticket(TicketType type){
        switch(type){
            case DAILY:
                price = 2;
                this.type = type;
                id = -1;
                break;
            case WEEKLY:
                price = 5.50;
                this.type = type;
                id = -1;
                break;
            case MONTHLY:
                price = 30;
                this.type = type;
                id = -1;
                break;
        }
    }

    public double getPrice(){
        return price;
    }

    public TicketType getType(){
        return type;
    }

    public void setId(int id){
        this.id = id;
    }

    public int getId(){
        return id;
    }

    // thread safe generation of a new id
    public static int getNewId(){
        return c.getAndIncrement();
    }
}
