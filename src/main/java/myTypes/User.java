package myTypes;

import java.util.ArrayList;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
public class User {
    private ArrayList<Ticket> purchaseList;
    private String name;
    private String surname;

    public User(){
        purchaseList = new ArrayList<Ticket>();
        name = "none";
        surname = "none";
    }


    public ArrayList<Ticket> getPurchaseList() {
        return purchaseList;
    }


    public void setPurchaseList(ArrayList<Ticket> purchaseList) {
        this.purchaseList = purchaseList;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getSurname() {
        return surname;
    }


    public void setSurname(String surname) {
        this.surname = surname;
    }
}
