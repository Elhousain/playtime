package be.thomasmore.graduaten.playtime.entity;

import java.util.ArrayList;

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

    public void deleteCart(String stt) {
        int iSTT = 0;
        try {
            iSTT = Integer.parseInt(stt);
            list.remove(iSTT - 1);
            calculateOrderTotal();
        } catch (NumberFormatException nfe) {
            System.out.println("\n" +
                    "Fout bij het verwijderen van winkelwagenitem: " + nfe.getMessage());
            nfe.printStackTrace();
        }
    }

    public void updateCart(String stt, String aantal) {
        int iSTT = Integer.parseInt(stt);
        CartItemBean cartItem = (CartItemBean) list.get(iSTT - 1);
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
