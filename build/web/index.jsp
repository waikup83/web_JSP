<%-- 
    Document   : index.jsp
    Created on : 2017-09-17, 19:02:01
    Author     : David Desbiens
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        
        <script type="text/javascript" src="script.js"></script>
                
        <!-- JQuery -->
        <script src="jquery-3.2.1.js"></script>
        <script src="jquery-ui.js"></script>
        
        <title>Bienvenue</title>
    </head>
    <body>
        <aside>
            <nav>
                <span id="AjouterImage">Ajouter</span>
                <br/><br/>
                <span id="ModifierImage">Modifier</span>
                <br/><br/>
                <span id="EnleverImage">Enlever</span>
            </nav>
        </aside>
        <br/><br/>
        
        <!-- Section pour l'image principale  -->
        <section id="AlbumPhoto">
            <header class="Centrer">
                <h1 id="ImageTitre"></h1>
            </header>
            <br/>
            
            <table id="tabImage" class="Centrer" width="100%">
                <tbody><tr>
                    <td id="ImagePrecedente">
                    </td>
                    <td id="ImagePrincipale">
                    </td>
                    <td id="ImageSuivante">
                    </td>
                </tr></tbody>
            </table>
            <br/>
            <article id="ImageDescription" class="Centrer">
            </article>
        </section>

        
        <br/><br/>
        <footer>
            <span id="Nom">David<sup>©</sup></span>
            <br/><br/>
            <a href="http://perdu.com">Perdu ¶§:oþ ???</a>
        </footer>
        <div id="Message"></div>
        <script>
            $(document).ready(function(){
                //Animation
                $("#Nom").mouseenter(function(){
                    $("#Nom").animate({ letterSpacing: "+=40px" });
                    ChercherImage1();
                });
                $("#Nom").mouseleave(function(){
                    $("#Nom").animate({ letterSpacing: "-=40px" });
                });
                
                //Première image
                if (location.search.substring(4) === "")
                    DemandePhoto("-1");
                else
                    DemandePhoto(location.search.substring(4));
                
                //Afficher l'image (Grossir)
                $("#ImagePrincipale").click(function() {
                    $("#Message").html("<img src=\"" + 
                        $("#ImagePrincipale img").attr("src") + "\" alt=\"Photo\" width=\"100%\">");
                    $("#Message").dialog({
                        width: "800px",
                        closeText: "Fermer",
                        hide: { effect: "drop", duration: 500 }
                    });
                });

                //Flèche de gauche
                $("#ImagePrecedente").click(function() {
                    var ID = $("#ImagePrecedente img").attr("id");
                    if (typeof ID !== "undefined") {
                        ID = ID.substr(3, ID.length);

                        //Chercher la nouvelle photo
                        DemandePhoto(ID);
                    }
                });

                //Flèche de droite
                $("#ImageSuivante").click(function() {
                    var ID = $("#ImageSuivante img").attr("id");
                    if (typeof ID !== "undefined") {
                        ID = ID.substr(3, ID.length);

                        //Chercher la nouvelle photo
                        DemandePhoto(ID);
                    }
                });

                //Menu
                $("#EnleverImage").click(function(){
                    var ID = $("#ImagePrincipale img").attr("id");
                    var IDSuivant = $("#ImageSuivante img").attr("id");

                    //Vérifier ID
                    if (typeof ID !== "undefined")
                        ID = ID.substr(3, ID.length);
                    else
                        ID = -1;

                    //Vérifier IDSuivant
                    if (typeof IDSuivant !== "undefined")
                        IDSuivant = IDSuivant.substr(3, IDSuivant.length);
                    else
                        IDSuivant = -1;

                    //Demande de suppression
                    EnleverPhoto(ID, IDSuivant);
                });
                
 
                $("#ModifierImage").click(function(){
                    var ID = $("#ImagePrincipale img").attr("id");
                    if (typeof ID !== "undefined")
                        ID = ID.substr(3, ID.length);
                        
                    window.location.replace("Modifier.jsp?id=" + ID);
                });


                $("#AjouterImage").click(function(){
                    window.location.replace("Ajouter.jsp");
                });

            });
        </script>
    </body>
</html>
