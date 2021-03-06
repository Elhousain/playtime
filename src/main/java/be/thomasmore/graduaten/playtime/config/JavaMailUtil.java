package be.thomasmore.graduaten.playtime.config;



import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

//mail,datum,ordernr,userName
public class JavaMailUtil
{
    public static void sendMail(String recepient,String datum,String ordernr,String username) throws MessagingException {
        System.out.println("Preparing to send email");
        Properties properties =new Properties();

        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.poort","587");

        String myAccountEmail="bulentarslan0877@gmail.com";
        String password="Bilo1234@";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail,password);
            }
        });
        Message message=prepareMessage(session,myAccountEmail,recepient,datum,ordernr,username);

        Transport.send(message);
        System.out.println("Message sent succesfully");
    }




    private static Message prepareMessage(Session session, String myAccountEmail, String recepient, String datum, String ordernr,String username){
        try {
            Message message=new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
            message.setSubject("PlayTime Support");
            String htmlCode="<div style=\"width: 70% ;align-content: center;margin: auto\">\n" +
                    "    <div style=\"background: #17a2b8; padding: 10px; color: white; height: 30%;text-align: center;\" >\n" +
                    "        <h2 style=\"color: white\">Bevestiging ordernr </h2>\n" +
                    "        <p>"+ordernr+"</p>\n" +
                    "        <p>"+username+"</p>\n" +
                    "    </div>\n" +
                    "    <div style=\"height: 40%\">\n" +
                    "<p style=\"padding-top: 60px; padding-bottom: 60px\">Beste, <br> <br>U mag je bestellen komen afhalen op <strong>"+datum+"</strong>  vanaf <strong>9u00</strong> </p>\n" +
                    "    </div>\n" +
                    "    <div style=\"height: 30%\">\n" +
                    "<p>Vragen over jouw bestelling?<br><br>\n" +
                    "    Voor vragen over de bestelling kun je tijdens kantooruren contact opnemen met de PlayTime klantenservice: 0493/96.00.18\n" +
                    "    <br><br><br>\n" +
                    "\n" +
                    "    — Team PlayTime<br><br>www.playtime.be</p>\n" +
                    "    </div>\n" +
                    "\n" +
                    "</div>";

            message.setContent(htmlCode,"text/html; charset=utf-8");
            return message;
        }
        catch (Exception ex){
            Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }



}
