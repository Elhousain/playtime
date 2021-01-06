package be.thomasmore.graduaten.playtime.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value =WebApplicationContext.SCOPE_SESSION,proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CartBean
{
    private ArrayList list = new ArrayList();
    private double total;


    public ArrayList getList() {

        return list;
    }

    public void setList(ArrayList list) {
        this.list = list;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getLineItemCount() {
        return list.size();
    }

    public CartBean() {
    }

    public void deleteCart(int stt) {
        //int iSTT = 0;
        try {
            //iSTT = Integer.parseInt(stt);
            list.remove(stt - 1);
            calculateOrderTotal();
        } catch (NumberFormatException nfe) {
            System.out.println("\n" +
                    "Fout bij het verwijderen van winkelwagenitem: " + nfe.getMessage());
            nfe.printStackTrace();
        }
    }

    public void updateCart(int stt, String aantal) {
        //int iSTT = Integer.parseInt(stt);
        CartItemBean cartItem = (CartItemBean) list.get(stt - 1);
        double iPrijs = cartItem.getPrijs();
        int iAantal = Integer.parseInt(aantal);
        try {
            if (iAantal > 0) {
                cartItem.setAantal(iAantal);
                cartItem.setTotaal(iPrijs * iAantal);
                calculateOrderTotal();
            }
        } catch (NumberFormatException nfe) {
            System.out.println("\n" +
                    "Fout bij het bijwerken van winkelwagen: " + nfe.getMessage());
            nfe.printStackTrace();
        }

    }

    public void listClear()
    {
        list.clear();
        total=0;
    }

    public void addCart(String id, String afbeelding, String prijs, String aantal,String titel) {
        Long iid=Long.parseLong(id);
        double iPrijs = Double.parseDouble(prijs);
        int iAantal = Integer.parseInt(aantal);

        CartItemBean cartItem = new CartItemBean();

        try {
            if (iAantal > 0) {

                cartItem.setId(iid);
                cartItem.setAfbeelding(afbeelding);
                cartItem.setPrijs(iPrijs);
                cartItem.setAantal(iAantal);
                cartItem.setTotaal(iPrijs *iAantal);
                cartItem.setTitel(titel);

                if(!list.contains(cartItem))
                    {
                        list.add(cartItem);
                    }

                calculateOrderTotal();
            }

        } catch (NumberFormatException nfe) {
            System.out.println("Error while parsing from String to primitive types: " + nfe.getMessage());
            nfe.printStackTrace();
        }
    }

    protected void calculateOrderTotal() {
        double plus = 0;
        for (int i = 0; i < list.size(); i++) {
            CartItemBean cartItem = (CartItemBean) list.get(i);
            plus += cartItem.getTotaal();

        }
        setTotal(plus);
    }
}
