<%-- 
    Document   : Modifier.jsp
    Created on : 2017-09-17, 19:02:01
    Author     : David Desbiens
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/formulaire.css">
        
        <script src="jquery-3.2.1.js"></script>
        <script src="script.js"></script>
        
        <title>Modifier une photo</title>
    </head>
    <body>
        <br/><br/><br/>
        <form>
            <table>
                <tr>
                    <td>
                        <label for="ImageTitre">Titre :</label> 
                    </td>
                    <td>
                        <input type="text" id="ImageTitre"/>
                    </td>
                </tr>
                <tr><td colspan="2" class="espace"></tr>
                <tr>
                    <td>
                        <label for="ImageDescription">Description :</label>   
                    </td>
                    <td>
                        <textarea id="ImageDescription" cols="27" rows="6"></textarea>
                    </td>
                </tr>
                <tr><td colspan="2" class="espace"></tr>
                <tr>
                    <td colspan="2" class="Centrer">
                        <input type="button" id="btnAjouter" value="Modifier">
                    </td>
                </tr>
            </table>
        </form>
        <br/><br/><br/>
        <footer class="Centrer">
            <a href="index.jsp"><< Retour</a>
        </footer>
        <br/></br>
        <script>
            $(document).ready(function(){
                var ID = location.search.substring(4);
               
                DemandePhoto(ID);
                
                $("#btnAjouter").click(function(){
                    ModifierPhoto(ID);
                });
            });
        </script>
    </body>
</html>
