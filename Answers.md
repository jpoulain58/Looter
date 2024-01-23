#Page 2
##exercice 1
###### Il manque l'id dans les paramètres pour que swift le détecte
##exercice 2
##### Vous avez ajouté un buton "Ajouter" et une fonction addLoot qui pourra ajouter un item et un label par la suite
##### Le foreach sert à parcourir la liste. Il est séparé du bouton car le bouton est affiché une seule fois.
##exercice 3
##### Le code ne fonctionne pas car loot n'est pas modifié à l'actualisation.
##### @State sert a enregistrer l'etat de la variable loot avant l'actualisation de la vue, grâce à cela lorsque la vue se recharge elle peut recuperer l'etat de la variable et l'utiliser pour l'initialiser au lieu de reprendre l'etat déclaré de base, cela aide a prendre en compte les modifs.

#Page 4
##exercice 1
##### Cela ne marche pas car la mise à jour ne recupere pas les changements 
##### ForEach<Array<String>, String, Text>: the ID Magie de feu occurs multiple times within the collection, this will give undefined results! ça ecrit ça parce que l'objet ajouté plusieurs fois à le meme id

##exercice 2
##### Le code declenche automatiquement des mises à jour de l’interface utilisateur lorque les propriétés de l'objet changent donc ça fonctionne bien
##### @StateObject est utilisé pour les nouveaux objets observables que la vue possède alors que @ObservedObject est utilisé pour les objets observables que la vue n'a pas créé mais simplement reçu. State n'est pas adapté aux objets
