/* 
    David Desbiens
    16 septembre 2017

    Fichier créer afin de diminuer le code dans le fichier index et autres

 */

function DemandePhoto(i) {
    $.ajax("BD.jsp",{
        type: "POST",
        dataType: "json",
        data: { img: i, action: "demande" },
        success: function(Donnees){
            if (Donnees.ID === "-1") {
                $("#ImageTitre").text("Aucune photo à afficher");
                $("#ImagePrincipale").text("");
                $("#ImageDescription").text("");
            }
            else {
                $("#ImageTitre").text(Donnees.Titre);
                $("#ImageTitre").val(Donnees.Titre);
                $("#ImagePrincipale").html(
                    "<img src=\"photos/" + Donnees.Fichier + 
                        "\" alt=\"Photo\" id=\"img" + Donnees.ID + "\">"
                );
                $("#ImageDescription").text(Donnees.Description);
            }

            VerifierFleches(Donnees.IDPrecedent, Donnees.IDSuivant);
        }
    });
}


function VerifierFleches(Precedent, Suivant) {
    //Precedent
    if (Precedent === "-1")
        $("#ImagePrecedente").html("");
    else
        $("#ImagePrecedente").html("<img src=\"img/precedent.png\" alt=\"<<\" id=\"img" + 
            Precedent + "\">");

    //Suivant
    if (Suivant === "-1")
        $("#ImageSuivante").html("");
    else
        $("#ImageSuivante").html("<img src=\"img/suivant.png\" alt=\">>\" id=\"img" + 
            Suivant+ "\">");
}

function EnleverPhoto(i, s) {
    $.ajax("BD.jsp",{
        type: "POST",
        dataType: "json",
        data: { img: + i, action: "enlever" },
        success: function() {
            DemandePhoto(s);
            alert("Photo effacée avec succès");
        }
    });
}

function ModifierPhoto(i) {
    $.ajax("BD.jsp",{
        type: "POST",
        dataType: "json",
        data: { img: + i, action: "modifier",
                titre: $("#ImageTitre").val(),
                desc: $("#ImageDescription").val() },
        success: function() {
            alert("Photo modifiée avec succès");
            window.location.replace("index.jsp?id=" + i);
        }
    });
}


function AjouterPhoto() {
    $.ajax("BD.jsp",{
        type: "POST",
        dataType: "json",
        data: { action: "ajouter",
                fichier: $("#idFichier").val() },
        success: function() {
            alert("Photo ajoutée avec succès");
        }
    });
}
