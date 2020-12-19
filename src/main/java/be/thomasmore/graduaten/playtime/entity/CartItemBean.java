package be.thomasmore.graduaten.playtime.entity;

import java.util.Objects;

public class CartItemBean
{
    private Long id;
    private String afbeelding;
    private double prijs;
    private int aantal;
    private String titel;
    private double totaal;

    public CartItemBean() {}

    public void setId(Long id) {this.id = id;}
    public Long getId() {return id; }

    public String getAfbeelding() {return afbeelding;}
    public void setAfbeelding(String afbeelding) {this.afbeelding = afbeelding;}

    public double getPrijs() {return prijs;}
    public void setPrijs(double prijs) {this.prijs = prijs;}

    public int getAantal() { return aantal;}
    public void setAantal(int aantal) {this.aantal = aantal;}

    public void setTitel(String titel) {this.titel = titel;}

    public String getTitel() {return titel;}

    public double getTotaal() {return totaal; }
    public void setTotaal(double totaal) {this.totaal = totaal;}

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartItemBean that = (CartItemBean) o;
        return id.equals(that.id) && titel.equals(that.titel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, titel);
    }

    // Deze classe is in orde ga verder ben Cartbean
}
