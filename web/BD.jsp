<%-- 
    Document   : BD.jsp
    Created on : 2017-09-17, 19:02:01
    Author     : David Desbiens
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.JSONObject"%>


<%
    String g_Param;
    
    Connection g_Connexion;
    String g_Requete = "";
    Statement g_Demande = null;
    ResultSet g_Resultat = null;
    JSONObject g_Image = new JSONObject();;
    String g_ID;
    String g_Action;
 
    
    //Instanciation de la classe
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        g_Connexion = DriverManager.getConnection("jdbc:mysql://localhost/davidd?user=root");
    } catch (Exception e) {
        out.println("Erreur : " + e);
        return;
    }

    g_Action = request.getParameter("action");
    if (g_Action == null)
        g_Action = "-1";
    
    g_Param = request.getParameter("img");
    if (g_Param == null)
        g_Param = "-1";


    g_Demande = g_Connexion.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
        ResultSet.CONCUR_READ_ONLY);
    //Envoie de l'image demandée
    if (g_Action.equals("demande") && g_Param != "-1") {
        g_Requete = "SELECT * FROM tp1 ORDER BY Date DESC";
            
        try {
            g_Resultat = g_Demande.executeQuery(g_Requete);
            g_Resultat.first();

            //Chercher l'ID donné
            if (!g_Param.equals("-1")) {
                while(!g_Resultat.isLast() && !g_Resultat.getString("ID").equals(g_Param))
                    g_Resultat.next();

                //Image précédente
                if(!g_Resultat.isFirst() && g_Resultat.previous()) {
                    g_Image.put("IDPrecedent", g_Resultat.getString("ID"));
                    g_Resultat.next();
                }
                else
                    g_Image.put("IDPrecedent", "-1");
            }
            else
                g_Image.put("IDPrecedent", "-1");

            //Image principale
            g_ID = g_Resultat.getString("ID");
            g_Image.put("ID", g_ID);
            
            if (g_Resultat.getString("Titre") == null)
                g_Image.put("Titre", "");
            else
                g_Image.put("Titre", g_Resultat.getString("Titre"));
            
            if (g_Resultat.getString("Description") == null)
                g_Image.put("Description", "");
            else
                g_Image.put("Description", g_Resultat.getString("Description"));
            
            g_Image.put("Fichier", g_Resultat.getString("Image"));
            
            //Image suivante
            if (g_Resultat.next())
                g_Image.put("IDSuivant", g_Resultat.getString("ID"));
            else
                g_Image.put("IDSuivant", "-1");

        } catch (SQLException SQLe) {
            g_Image.put("IDPrecedent", "-1");
            g_Image.put("ID", "-1");
            g_Image.put("IDSuivant", "-1");
        }
        finally {
            //Fermeture de la requête
            g_Resultat.close();
        } 

        out.print(g_Image);
    }
        
        
    // Enlever la photo
    else if (g_Action.equals("enlever") && !g_Param.equals("-1")) {
        g_Requete = "DELETE FROM tp1 WHERE ID=" + g_Param;
            
        try {
            g_Demande.executeUpdate(g_Requete);
            g_Image.put("ID", "-1");
        } catch (SQLException SQLe) {
            g_Image.put("IDPrecedent", "-1");
            g_Image.put("ID", "-1");
            g_Image.put("IDSuivant", "-1");
        }
        out.print(g_Image);
    }
    
    //Modifier une photo
    else if (g_Action.equals("modifier") && !g_Param.equals("-1")) {
        g_Requete = "UPDATE tp1 SET Titre='" + request.getParameter("titre")
                + "', Description='" + request.getParameter("desc")
                + "' WHERE ID='" + g_Param + "'";
        try {
            g_Demande.executeUpdate(g_Requete);
            out.print(g_Param);
        } catch (SQLException SQLe) {
            out.print("-1");
        }
    }
    
    //Ajouter une photo
    else if (g_Action.equals("ajouter")) {
        File Fichier = new File(request.getParameter("fichier"));
        g_Requete = "INSERT INTO tp1 (Image) VALUES ('" + 
                Fichier.getName() + "')";
        
        try {
            g_Demande.executeUpdate(g_Requete);
        } catch (SQLException SQLe) {
        }
        response.sendRedirect("index.jsp");
    }
    
    g_Demande.close();
    g_Connexion.close();
%>
