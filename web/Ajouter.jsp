<%-- 
    Document   : Ajouter.jsp
    Created on : 2017-09-17, 19:02:01
    Author     : David Desbiens
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/formulaire.css">
        
        <script src="jquery-3.2.1.js"></script>
        <script src="script.js"></script>
        
        <title>Ajouter une photo</title>
    </head>
    <body>
        <br/><br/><br/>
        <form action="upload.jsp" enctype="multipart/form-data" method="POST" id="frmAjouter">
            <table>
                <tr>
                    <td>
                        <label for="idFichier">Fichier :</label>    
                    </td>
                    <td>
                        <input type="file" id="idFichier" name="txtFichier">
                    </td>
                </tr>
                <tr><td colspan="2" class="espace"></tr>
                <tr>
                    <td colspan="2" class="Centrer">
                        <input type="submit" value="Ajouter">
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
                $("#frmAjouter").submit(function(frm) {
                    if ($("#idFichier").val() === "") {
                        //Arrêter l'envoie du formulaire
                        frm.preventDefault();
                        
                        //Mettre le focus sur txtFichier
                        $("#idFichier").focus();
                        
                        //Encadrer en rouge
                        $("#idFichier").addClass("EncadrerRouge");
                    }
                    else{
                        AjouterPhoto();
                    }
                });
            });
        </script>
    </body>
</html>
