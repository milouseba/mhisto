# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# source textes : http://otheatre.over-blog.org/article-les-26-plus-celebres-monologues-classiques-115014490.html

require 'open-uri'
require 'json'

puts "destroying old data..."
  # Like.destroy_all
  Comment.destroy_all
  Answer.destroy_all
  Exercice.destroy_all
  User.destroy_all
puts "database clean..."


puts "Creating users database..."
10.times do

url = 'https://randomuser.me/api/'
user_serialized = open(url).read
users_list = JSON.parse(user_serialized)

  user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  avatar: users_list["results"][0]["picture"]["large"])
  user.username = user.first_name
  user.password = user.first_name
  user.save
end

puts "Team users created..."

url = 'https://randomuser.me/api/'
user_serialized = open(url).read
users_list = JSON.parse(user_serialized)
User.create(email: "sebastien@gmail.com", password: "sebastien", first_name: "sebastien", last_name: "milou", username: "Seseb",
            avatar: users_list["results"][0]["picture"]["large"])

url = 'https://randomuser.me/api/'
user_serialized = open(url).read
users_list = JSON.parse(user_serialized)
User.create(email: "thomas@gmail.com", password: "thomas", first_name: "thomas", last_name: "chekaiban", username: "Tom",
            avatar: users_list["results"][0]["picture"]["large"])

url = 'https://randomuser.me/api/'
user_serialized = open(url).read
users_list = JSON.parse(user_serialized)
User.create(email: "maxime@gmail.com", password: "maxime", first_name: "maxime", last_name: "guillemain", username: "Mamax",
            avatar: users_list["results"][0]["picture"]["large"])

url = 'https://randomuser.me/api/'
user_serialized = open(url).read
users_list = JSON.parse(user_serialized)
User.create(email: "ariane@gmail.com", password: "ariane", first_name: "ariane", last_name: "decolle", username: "Ari",
            avatar: users_list["results"][0]["picture"]["large"])

puts "Team users added"
puts "Creating exercices..."

ex1 = Exercice.create!(title: "L'attente", beginning_story: "Quand j'arrive à la gare de l'Est, j'espère toujours secrètement qu'il y aura quelqu'un pour m'attendre. C'est con.",
end_story: "Je voudrais que quelqu'un m'attende quelque part... C'est quand même pas compliqué. Les personnages de ces douze nouvelles sont pleins d’espoirs
futiles, ou de désespoir grave.", user_id: User.all.sample.id, status: published)
ex1.remote_photo_url = "https://i.pinimg.com/564x/36/90/dc/3690dcb9de1669cccfe094f61679b627.jpg"
ex1.save

ex2 = Exercice.create(status: published, title: "Les Carnets du sous-sol", beginning_story: "Je suis un homme malade.Je suis un homme méchant. Un homme repoussoir. Voilà ce que je suis. Je crois que j’ai quelque chose au foie.",
end_story: "J’ai mal au foie. Tant mieux, qu’il me fasse encore mal! Il y a longtemps que je vis comme ça - dans les vingt ans. Maintenant j’en ai quarante.", user_id: User.all.sample.id)
ex2.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/dd/e3/33/dde333ee3daa1074279e9f943891fdff.jpg"
ex2.save

ex3 = Exercice.create(status: published, title: "Le Gai Savoir", beginning_story: "Mais comment pouvons-nous nous permettre de blâmer ou louer l’univers ? Gardons-nous de lui reprocher de la dureté et de la raison, ou bien le contraire.",
end_story: "Quand aurons-nous le droit, nous autres hommes, de nous rendre naturels, avec la nature pure, nouvellement trouvée, nouvellement délivrée ?", user_id: User.all.sample.id)
ex3.remote_photo_url = "https://www.les-philosophes.fr/images/stories/photo-nietzsche.jpg"
ex3.save

ex4 = Exercice.create(status: published, title: "Battle Royale", beginning_story: "Comment peut-on tuer ses camarades de classe ? Certes, cette règle leur avait été imposée, mais Yumiko n'arrivait pas à croire qu'il existait quelqu'un
capable de jouer le jeu.",
end_story: "Elle ne pouvait pas nier qu'elle sentait son coeur pris dans un filet d'angoisse. C'est bien pour cette raison qu'avec Yukiko elles s'étaient éloignées de l'école et s'étaient enfermées ici.", user_id: User.all.sample.id)
ex4.remote_photo_url = "http://2.bp.blogspot.com/-Jbj_5V9JvE0/UXmERuqwPtI/AAAAAAAACEQ/8HV9mPra3dU/s1600/battel-royale.jpg"
ex4.save

ex5 = Exercice.create(status: published, title: "Antigone", beginning_story: "Comprendre… Vous n’avez que ce mot-là à la bouche, tous, depuis que je suis toute petite.Il fallait comprendre qu’on ne peut toucher à l’eau...",
end_story: "Toujours comprendre. Moi, je ne veux pas comprendre. Je comprendrai quand je serai vieille [...]. Si je deviens vieille. Pas maintenant.”", user_id: User.all.sample.id)
ex5.remote_photo_url = "https://i.pinimg.com/564x/35/44/f3/3544f39fcd1b07acef3797eaf0aaf0f6.jpg"
ex5.save

ex6 = Exercice.create(status: published, title: "La mort est mon métier", beginning_story: "De tout temps, l'honneur avait été considéré comme l'idéal suprême du soldat. Mais on savait mal alors ce qu'était l'honneur.",
end_story: "d'être toujours dans le droit chemin, de servir inébranlablement, dans les bons et les mauvais jours, le principe éternel : L'Allemagne, l'Allemagne au-dessus de tout.", user_id: User.all.sample.id)
ex6.remote_photo_url = "https://i.pinimg.com/564x/fd/cb/87/fdcb87e8ab8c9f97db45411d8788f351.jpg"
ex6.save

ex7 = Exercice.create(status: published, title: "Les Liaisons dangereuses", beginning_story: "Mais, on ne me dit rien, de sorte que, dans l’ignorance où je suis, je commets bien des gaucheries.",
end_story: "« eh bien, qu’avez-vous ? Donnez votre pied à monsieur… ». Le monsieur était cordonnier. Je ne peux pas vous rendre combien j’ai été honteuse.", user_id: User.all.sample.id)
ex7.remote_photo_url = "https://i.pinimg.com/564x/8c/e5/96/8ce596b2eea1e4f22ca6b68b11305bc5.jpg"
ex7.save

ex8 = Exercice.create(status: published, title: "Largo Desolato", beginning_story: "C’est du baratin, tout ça. Quand tu voulais me séduire, au début, tu ne parlais pas comme ça.",
end_story: "Croire que je pourrais te faire partager mes sentiments, te redonner goût à la vie ? Tu parles ! Tu es un cas désespéré. C’est bien fait pour moi. Une illusion de moins.", user_id: User.all.sample.id)
ex8.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/54/e0/7f/54e07f7f8c745323c9e099d52730653f.jpg"
ex8.save

ex9 = Exercice.create(status: published, title: "Exercice de style", beginning_story: "Vers le milieu de la journée et à midi, je me trouvai et montai sur la plate-forme et la terrasse arrière d'un
autobus", end_story: "Deux heures après et cent vingt minutes plus tard, je le rencontre et le revois cour de Rome et devant la
gare Saint-Lazare.", user_id: User.all.sample.id)
ex9.remote_photo_url = "https://i.pinimg.com/564x/64/70/43/6470435d60ebee726fbc24ccd0824840.jpg"
ex9.save

ex10 = Exercice.create(status: published, title: "Salammbô", beginning_story: "C'était à Mégara, faubourg de Carthage, dans les jardins d'Hamilcar. Les soldats qu'il avait commandés en Sicile se donnaient un grand festin",
end_story: "Les soldats ivres ronflaient la bouche ouverte à côté des cadavres ; et ceux qui ne dormaient pas baissaient leur tête, éblouis par le jour.
Le sol piétiné disparaissait sous des flaques rouges.", user_id: User.all.sample.id)
ex10.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/6b/1b/d8/6b1bd88ac97ca94234c5c575be479249.jpg"
ex10.save

# ex24 = Exercice.create(title: "Le meurtre de Roger Ackroyd", beginning_story: "Le meurtrier est l’un d’entre nous, dites-vous ? Et… vous savez qui ? Poirot avait lu le message.
# Il froissa la dépêche dans sa main et tapota la petite boulette de papier.",
# end_story: "Ah ! si seulement Hercule Poirot n’avait pas pris sa retraite, et n’était pas venu chez nous cultiver des courges !")
# ex24.remote_photo_url = "https://i.pinimg.com/564x/de/64/2c/de642c13ace1a56088e7aa9510e05c1a.jpg"
# ex24.save

# ex11 = Exercise.create(title: "Nuit sans date rue Saint Jacques", beginning_story: "La rue tombe noire, noire, la noire rue noire tombe là.",
# end_story: "La rue tombe. La noire rue noire. Noire tombe noire. Là.")
# ex11.remote_photo_url = "https://static.fnac-static.com/multimedia/FR/Images_Produits/FR/fnac.com/Visual_Principal_340/1/1/0/9782253004011/tsp20120926103855/Les-liaisons-dangereuses.jpg"
# ex11.save

# ex12 = Exercice.create(title: "Le Bateau Ivre", beginning_story: "Comme je descendais des Fleuves impassibles,
# Je ne me sentis plus guidé par les haleurs :",
# end_story: "Je ne puis plus, baigné de vos langueurs, ô lames,
# Enlever leur sillage aux porteurs de cotons,
# Ni traverser l'orgueil des drapeaux et des flammes,
# Ni nager sous les yeux horribles des pontons.")
# ex12.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/236x/86/02/6a/86026a259d20a24fbacbfd33f626d9bc.jpg"
# ex12.save

# ex13 = Exercice.create(title: "Lettre à ma fille", beginning_story: "Ma chère enfant,
# Cette lettre a mis un temps extraordinaire à voir
# le jour. J’ai pourtant toujours su que je voulais
# t’adresser quelques-unes des leçons que j’ai apprises
# au cours de mon existence et te faire part des circonstances
# dans lesquelles j’ai eu à les apprendre.",
# end_story: "Ceci est mon legs.")
# ex13.remote_photo_url = "https://i.pinimg.com/564x/55/3c/0c/553c0c17c48661b26a281a82e9013a53.jpg"
# ex13.save

# ex14 = Exercice.create(title: "Disgrâce", beginning_story: "Pour un homme de son âge, cinquante-deux ans, divorcé, il a, lui semble-t-il, résolu la question de sa vie sexuelle de façon plutôt satisfaisante.",
# end_story: "Dans le désert aride qu'est la semaine, le jeudi une oasis de luxe et volupté.")
# ex14.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/4b/60/eb/4b60ebe5303133c0e2a43e70ae3fcaae.jpg"
# ex14.save

# ex15 = Exercice.create(title: "La Horde du Contrevent", beginning_story: ") À la cinquième salve, l’onde de choc fractura le fémur d’enceinte et le vent sabla cru le village à
# travers les jointures béantes du granit. Sous mon casque, le son atroce du roc poncé perce, mes dents vibrent.",
# end_story: " Et il ne laissera rien debout ici, dans ce bled qui ne figurait sur aucun carnet de contre, tant son
# plan carré, ses ruelles axiales et son architecture en pisé auraient fait hurler une Oroshi de huit ans.")
# ex15.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/236x/7b/c5/3e/7bc53ea567bdd58dc1925bf5a6f377e4.jpg"
# ex15.save

# ex16 = Exercice.create(title: "La malédiction", beginning_story: "Sur un ordre d’Alain de Pareilles, les archers éteignirent leurs torches dans l’herbe, et la nuit ne fut plus éclairée que par le brasier.",
# end_story: "Les flammes entrèrent dans la bouche du grand-maître, et y étouffèrent son dernier cri. Puis, pendant un temps qui parut interminable, il se battit contre la mort.")
# ex16.remote_photo_url = "https://i.pinimg.com/564x/20/e8/3d/20e83d0566e8a7048a5b992fd6cec50d.jpg"
# ex16.save

# ex17 = Exercice.create(title: "Dans les forêts de Sibérie", beginning_story: "Je m’étais promis avant mes quarante ans de vivre en ermite au fond des bois. ",
# end_story: "Tous les jours j’ai consigné mes pensées dans un cahier. Ce journal d’ermitage, vous le tenez dans les mains.")
# ex17.remote_photo_url = "https://i.pinimg.com/564x/eb/92/e6/eb92e6d7f6616bebd8d4aba1142d5abe.jpg"
# ex17.save

# ex18 = Exercice.create(title: "Harry Potter et la pierre philosophale", beginning_story: "Mr et Mrs Dursley, qui habitaient au 4, Privet Drive, avaient toujours affirmé avec la plus
# grande fierté qu'ils étaient parfaitement normaux, merci pour eux.",
# end_story: "Les Dursley avaient tout ce qu'ils voulaient. La seule chose indésirable qu'ils possédaient,
# c'était un secret dont ils craignaient plus que tout qu'on le découvre un jour.")
# ex18.remote_photo_url = "https://i.pinimg.com/564x/bf/80/95/bf8095a03e5f3dc642e043d078aa1cfd.jpg"
# ex18.save

# ex19 = Exercice.create(title: "Britannicus", beginning_story: "Narcisse, c'en est fait, Néron est amoureux.",
# end_story: "Voilà comme, occupé de mon nouvel amour, Mes yeux sans se fermer, ont attendu le jour.")
# ex19.remote_photo_url = "http://gallica.bnf.fr/ark:/12148/bpt6k54572377/f4.highres"
# ex19.save

# ex20 = Exercice.create(title: "Les nourritures terrestres", beginning_story: "Nathanaël, tu regarderas tout en passant, et tu ne
# t’arrêteras nulle part. Dis-toi bien que Dieu seul n’est pas provisoire. Que l’importance soit dans ton regard, non dans la chose regardée.",
# end_story: "Nathanaël, je t’enseignerai la ferveur. Nos actes s’attachent à nous comme sa lueur au phosphore. Ils nous consument, il est vrai, mais ils nous font notre splendeur.")
# ex20.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/b4/07/da/b407da54cc3f1c01eab58507d8a228ab.jpg"
# ex20.save

# ex21 = Exercice.create(title: "Madame Bovary", beginning_story: "En effet, elle regarda tout autour d’elle, lentement, comme quelqu’un qui se réveille d’un songe ; puis, d’une voix distincte, elle demanda son miroir,
# et elle resta penchée dessus quelque temps,jusqu’au moment où de grosses larmes lui découlèrent des yeux. Alors elle se renversa la tête en poussant un soupir et retomba sur l’oreiller.",
# end_story: "Une convulsion la rabattit sur le matelas. Tous s’approchèrent. Elle n’existait plus.")
# ex21.remote_photo_url = "https://i.pinimg.com/564x/c9/00/33/c90033d5ab82370fc0dadf45eacd8985.jpg"
# ex21.save


# ex22 = Exercice.create(title: "Le Comte de Monte Cristo", beginning_story: "Le 24 février 1815, la vigie de Notre-Dame de la Garde signala le trois-mâts le Pharaon,
# venant de Smyrne, Trieste et Naples.", end_story: "Néanmoins les experts en navigation reconnaissaient que si un accident était arrivé,
# ce ne pouvait être au bâtiment lui-même.")
# ex22.remote_photo_url = "https://i.pinimg.com/564x/8a/a2/4a/8aa24a3ce1dc9cbbbe64b8a7c867179a.jpg"
# ex22.save

ex22 = Exercice.create(status: published, title: "Le meurtre de Roger Ackroyd", beginning_story: "Le meurtrier est l’un d’entre nous, dites-vous ? Et… vous savez qui ? Poirot avait lu le message.
Il froissa la dépêche dans sa main et tapota la petite boulette de papier.",
end_story: "Ah ! si seulement Hercule Poirot n’avait pas pris sa retraite, et n’était pas venu chez nous cultiver des courges !", user_id: User.all.sample.id)
ex22.remote_photo_url = "https://i.pinimg.com/564x/8a/a2/4a/8aa24a3ce1dc9cbbbe64b8a7c867179a.jpg"
ex22.save


# ex23 = Exercice.create(title: "Mémoires d'un yakuza", beginning_story: "A REMPLIR CE SOIR", end_story: "A REMPLIR CE SOIR")
# ex23.remote_photo_url = "https://s-media-cache-ak0.pinimg.com/564x/b2/fa/60/b2fa60466c632f904b119fd34402a9a0.jpg"
# ex23.save



# exercices.each do |exercice|
#   exo = Exercice.new(
#   title: exercice[:title],
#   beginning_story: exercice[:beginning_story],
#   end_story: exercice[:end_story],
#   user_id: User.all.sample.id,
#   status: "draft")
#   exo.remote_photo_url =
#   exo.save!
# end



puts "Exercices created..."

answers = [
{content: "J'ai beau savoir que ma mère est encore au boulot à cette heure-là et que Marc
n'est pas du genre à traverser la banlieue pour porter mon sac, j'ai toujours cet espoir débile.
Là encore, ça n'a pas loupé, avant de descendre les escalators pour prendre le métro,
j'ai jeté un dernier regard circulaire au cas où il y aurait quelqu'un...
Et à chaque fois dans les escalators mon sac me paraît encore plus lourd.", exercice_id: ex1.id},
{content: "De toute façon, ma maladie, je n’y comprends rien, j’ignore au juste ce qui me fait mal.
Je ne me soigne pas, je ne me suis jamais soigné, même si je respecte la médecine et les docteurs.
En plus, je suis superstitieux comme ce n’est pas permis: enfin, assez pour respecter la médecine.
(Je suis suffisamment instruit pour ne pas être superstitieux.) Oui, c’est par méchanceté que je ne me soigne pas.
Ça, messieurs, je parie que c’est une chose que vous ne comprenez pas.
Moi, si! Evidemment, je ne saurais vous expliquer à qui je fais une crasse quand j’obéis à ma méchanceté
de cette façon-là; je sais parfaitement que ce ne sont pas les docteurs que j’emmerde en refusant de me soigner;
je suis le mieux placé pour savoir que ça ne peut faire de tort qu’à moi seul et à personne d’autre.
Et, malgré tout, si je ne me soigne pas, c’est par méchanceté.", exercice_id: ex2.id},
{content: "Il n’est ni parfait, ni beau, ni noble, et ne veut devenir rien de tout cela, il ne tend absolument pas à imiter l’homme !
Il n’est touché par aucun de nos jugements esthétiques et moraux ! Il ne possède pas non plus d’instinct de conservation et,
d’une façon générale, pas d’instinct du tout ; il ignore aussi toutes les lois.
Gardons-nous de dire qu’il y a des lois dans la nature.
Il n’y a que des nécessités : personne ne commande, personne n’obéit, personne ne désobéit.
Lorsque vous saurez qu’il n’y a point de fins,
vous saurez aussi qu’il n’y a point de hasard : car ce n’est qu’à côté d’un monde de fins que le mot « hasard » a un sens.
Gardons-nous de dire que la mort est opposé à la vie. La vie n’est qu’une variété de le mort et une variété très rare.
– Gardons-nous de penser que le monde crée éternellement du nouveau.
Il n’y a pas de substances éternellement durables ; la matière est une erreur pareille à celle des Dieux des Eléates.
Quand donc aurons-nous fini de nous ménager ? Quand toutes ces ombres de Dieu ne nous troublerons-elles plus ?
Quand aurons-nous entièrement dépouillé la nature de ses attributs divins ?
Quand retrouverons-nous la nature pure, innocente ?", exercice_id: ex3.id},
{content: "Et pourtant... Oui, et pourtant... Si elle se retrouvait face à quelqu'un qui en voulait à sa vie,
elle pouvait s'imaginer passer à l'acte, elle aussi. Et si elle en était capable, tout le monde le pouvait, non ?
Yumiko jeta un oeil sur un mégaphone apparemment abandonné dans un coin de la salle.
Etait-il en état de marche ? Et si oui...
S' il était utilisable, ne pouvait-elle le mettre à profit ?
La peur seule l'empêchait de s'en servir. Elle ne pouvait pas croire qu'il y ait des gens prêts à jouer le jeu
qui leur était imposé.", exercice_id: ex4.id},
{content: "...à la belle eau fuyante parce que ça mouille les dalles,
à la terre parce que ça tache les robes. Il fallait comprendre qu’on ne doit pas manger tout à la fois,
donner tout ce qu’on a dans les poches au premier mendiant qu’on rencontre, courir,
courir dans le vent jusqu’à ce qu’on tombe par terre et boire quand on a chaud et se baigner quand il est trop tôt
ou trop tard, mais pas juste quand on en a envie !
Comprendre. Toujours comprendre...", exercice_id: ex5.id},
{content: "Et dans la pratique, les soldats éprouvaient souvent des difficultés à choisir,
  entre plusieurs voies, celle qui leur paraissait la plus honorable.
  Ces difficultés, le Reichsführer était heureux de le dire, n'existait plus pour les SS.
  Il avait fait de cette définition la devise de sa troupe d'élite: 'Ton honneur', avait-il dit, 'c'est ta fidélité'.
  Désormais, par conséquent, tout était parfaitement simple et clair. On n'avait plus de cas de conscience à se poser.
  Il suffisait d'être fidèle, c'est-à-dire d'obéir. Notre devoir, notre unique devoir était d'obéir.
  Et grâce à cette obéissance absolue, consentie dans le véritable esprit du Corps noir,
  nous étions sûrs de ne plus jamais nous tromper.", exercice_id: ex6.id},
{content: "Mais oui : Ainsi hier, maman m’a dit de passer chez elle. Si c’était le monsieur, me dis-je !
La main me tremblait et le coeur me battait ; en entrant chez maman,
j’ai vu le monsieur en noir, debout près d’elle. Toute tremblante, j’ai trouvé un fauteuil et je me suis assise,
bien rouge et bien déconcertée. J’y étais à peine que voilà cet homme à mes genoux.
J’ai alors perdu la tête. Je me suis levée en jetant un cri perçant… comme lorsqu’il fait tonnerre.
Maman est partie d’un éclat de rire en me disant :", exercice_id: ex7.id},
{content: "J’allais faire renaître ton espoir, j’allais te régénérer, inaugurer pour toi une vie nouvelle.
Tu n’es pas une épave, Léopold, tu es un vulgaire démagogue.
Tu dirais n’importe quoi, tout ce qui t’arrange. Tu as eu tout ce que tu voulais et maintenant tu veux te débarrasser de moi.
Tu me parles de ton désarroi ! Foutaises, oui !
Tu veux me faire comprendre que j’ai rien à attendre de toi et en plus, tu veux te faire plaindre.
C’est malhonnête. Ce sont des grands mots, mais tu ne m’auras pas comme ça.
Oh !, comme j’ai été bête, bête à pleurer.", exercice_id: ex8.id},
{content: " Je vis et remarquai un jeune homme et un vieil adolescent assez ridicule et pas mal
grotesque : cou maigre et tuyau décharné, ficelle et cordelière autour du chapeau et couvre-chef. Après
une bousculade et confusion, il dit et profère d'une voix et d'un ton larmoyants et pleurnichards que son
voisin et covoyageur fait exprès et s'efforce de le pousser et de l'importuner chaque fois qu'on descend et
sort. Ceci déclaré et après avoir ouvert la bouche, il se précipite et se dirige vers une place et un siège
vides et libres.", exercice_id: ex9.id},
{content: "La houle des soldats se poussait. Ils n'avaient plus peur. Ils recommençaient à boire.
Les parfums qui leur coulaient du front mouillaient de gouttes larges leurs tuniques en lambeaux,
et s'appuyant des deux poings sur les tables qui leur semblaient osciller comme des navires,
ils promenaient à l'entour leurs gros yeux ivres, pour dévorer par la vue ce qu'ils ne pouvaient prendre.
D'autres, marchant tout au milieu des plats sur les nappes de pourpre, cassaient à coups de pied les escabeaux d'ivoire et les fioles tyriennes en verre.
Les chansons se mêlaient au râle des esclaves agonisant parmi les coupes brisées. Ils demandaient du vin, des viandes, de l'or.
Ils criaient pour avoir des femmes. Ils déliraient en cent langages. Quelques-uns se croyaient aux étuves,
à cause de la buée qui flottait autour d'eux, ou bien, apercevant des feuillages,
ils s'imaginaient être à la chasse et couraient sur leurs compagnons comme sur des bêtes sauvages.
L'incendie de l'un à l'autre gagnait tous les arbres, et les hautes masses de verdure, d'où s'échappaient de longues spirales blanches, semblaient des volcans qui commencent à fumer.
La clameur redoublait ; les lions blessés rugissaient dans l'ombre.", exercice_id: ex10.id},
# {content: "La rue tombe noire, noire, la noire rue noire tombe là.
# La rue tombe noire, noire, tombe la noire rue noire, là.
# La rue, tombe noire, noire, rue noire, la tombe noire, là.
# La rue tombe noire, rue noire noire, là, tombe noire, là.", exercice_id: 11},
# {content: "Des Peaux-rouges criards les avaient pris pour cibles,
# Les ayant cloués nus aux poteaux de couleurs.

# J'étais insoucieux de tous les équipages,
# Porteur de blés flamands ou de cotons anglais.
# Quand avec mes haleurs ont fini ces tapages,
# Les Fleuves m'ont laissé descendre où je voulais.

# Dans les clapotements furieux des marées,
# Moi, l'autre hiver, plus sourd que les cerveaux d'enfants,
# Je courus ! Et les Péninsules démarrées
# N'ont pas subi tohu-bohus plus triomphants.

# La tempête a béni mes éveils maritimes.
# Plus léger qu'un bouchon j'ai dansé sur les flots
# Qu'on appelle rouleurs éternels de victimes,
# Dix nuits, sans regretter l'œil niais des falots !", exercice_id: 12},
# {content: "J’ai pourtant toujours su que je voulais
# t’adresser quelques-unes des leçons que j’ai apprises
# au cours de mon existence et te faire part des circonstances
# dans lesquelles j’ai eu à les apprendre.
# Ma vie a été longue, et sachant que la vie chérit
# ceux qui la vivent, j’ai osé tout tenter, tremblante
# parfois, mais osant, néanmoins. Je ne relate ici que
# les événements et leçons qui m’ont semblé utiles.
# Je ne te raconte pas comment j’ai trouvé les solutions:
# je te sais créative, intelligente, pleine de ressources,
# et te fais confiance pour les interpréter au
# mieux.
# Tu liras donc ici les Mémoires d’une enfant qui
# grandit, des situations d’urgence, extrêmes, inattendues,
# quelques poèmes, des histoires légères
# pour te faire rire et des histoires graves qui te
# feront penser.",
# exercice_id: 13},
# {content: "Le jeudi après-midi il prend sa voiture pour se rendre à Green Point.
# À deux heures pile il appuie sur le bouton de la porte d'entrée de Windsor Mansions, il donne son nom et il entre.
# Il trouve Soraya qui l’attend sur le pas de la porte de l'appartement n° 113. Il va tout droit jusqu'à la chambre,
# plongée dans une lumière douce où flotte une odeur agréable, et il se déshabille.
# Soraya sort de la salle de bains, laisse tomber son peignoir glisse contre lui sous les draps.'Je t'ai manqué ?' demande-t-elle.
# 'Tu me manques tout le temps', répond-il, caresse son corps ambré couleur de miel, qu'elle n’a pas exposé au soleil ;
# il lui écarte bras et jambes, lui embrasse les seins ; ils font l'amour.
# Soraya est grande et mince, elle a les cheveux longs, noirs, et des yeux sombres et limpides.
# Chronologiquement parlant, il a l'âge d'être son père ; mais si l'on va par là,
# on peut être père à l'âge de douze ans. Cela fait maintenant un an qu'il est un de ses clients réguliers ;
# elle lui donne toute satisfaction",
# exercice_id: 14},
# {content: "Je plie contre Pietro, des aiguilles de quartz crissent sur son masque de contre. À terre, dans la
# ruelle qui nous couvre, deux vieillards tardifs qui clouaient un volet ont été criblés ; plus loin au
# carrefour, je cherche en vain la poignée de mômes qui crânaient front nu en braillant des défis que
# personne, pas même nous, ne peut à cette puissance, et sous cette viscosité d’air, relever. Toute la Horde
# est à présent plaquée contre la face ouest d’une bâtisse qui nous a paru un peu moins pitoyablement
# jointoyée que les autres, à attendre le ressac, la courte pause dans l’accélération, qui nous permettra de
# contrer dans le dédale des rues jusqu’aux fortifications, puis au-delà, si l’on sort. Si l’on se décide –
# finalement – à sortir. Des dômes les plus hauts, du métal tordu crie dans les accalmies, une éolienne
# grince, hoquette – elle repart… Se bloque. Les pales crépitent sous la grenaille. Une rafale encore – et le
# bruit se fond dans le rugissement saturé. À ma gauche, un chat oblong se cale, ébouriffé, dans une
# encoignure trop étroite pour lui, et volent les jouets cassés, des calebasses, des bancs qui raclent et des
# tuiles de terre cuite arrachées et jetées comme à la main à trois mètres de nous. Il n’y a plus de doute
# maintenant, pour personne : le furvent arrive. Il sera là dans l’heure. Il s’annonce, comme toujours, en
# quintet.", exercice_id: 15},
# {content: "Et tout à coup, la voix du grand-maître s’éleva à travers le rideau de feu et, comme si elle se fut adressée à chacun, atteignit chacun en plein visage. Avec une force stupéfiante, ainsi qu’il l’avait fait devant Notre-Dame, Jacques de Molait criait :
# 'Honte ! Honte ! Vous voyez des innocents qui meurent. Honte sur vous tous ! Dieu vous jugera.'
# La flamme se flagella, brûla sa barbe, calcina en une seconde sa mitre de papier et alluma ses cheveux blancs.
# La foule terrifiée s’était tue. On eût dit qu’on brûlait un prophète fou.
# De ce visage en feu, la voix effrayante proféra : 'Pape Clément !...Chevalier Guillaume ! ...Roi Philippe !...
# Avant un an, je vous cite à paraître au tribunal de Dieu pour y recevoir votre juste châtiment ! Maudits ! Maudits !
# Tous maudits jusqu’à la treizième génération de vos races !'", exercice_id: 16},
# {content: "Je me suis installé pendant six mois dans une cabane
# sibérienne sur les rives du lac Baïkal, à la pointe du cap des
# Cèdres du Nord. Un village à cent vingt kilomètres, pas de
# voisins, pas de routes d’accès, parfois, une visite. L’hiver,
# des températures de – 30 °C, l’été des ours sur les berges.
# Bref, le paradis.
# J’y ai emporté des livres, des cigares et de la vodka. Le
# reste — l’espace, le silence et la solitude — était déjà là.
# Dans ce désert, je me suis inventé une vie sobre et belle,
# j’ai vécu une existence resserrée autour de gestes simples.
# J’ai regardé les jours passer, face au lac et à la forêt. J’ai
# coupé du bois, pêché mon dîner, beaucoup lu, marché
# dans les montagnes et bu de la vodka, à la fenêtre. La
# cabane était un poste d’observation idéal pour capter les
# tressaillements de la nature.
# J’ai connu l’hiver et le printemps, le bonheur, le désespoir
# et, finalement, la paix.
# Au fond de la taïga, je me suis métamorphosé. L’immoExtrait
# de la publication
# bilité m’a apporté ce que le voyage ne me procurait plus.
# Le génie du lieu m’a aidé à apprivoiser le temps. Mon
# ermitage est devenu le laboratoire de ces transformations.", exercice_id: 17},
# {content: "Jamais quiconque n'aurait
# imaginé qu'ils puissent se trouver impliqués dans quoi que ce soit d'étrange ou de mystérieux.
# Ils n'avaient pas de temps à perdre avec des sornettes.
# Mr Dursley dirigeait la Grunnings, une entreprise qui fabriquait des perceuses. C'était un
# homme grand et massif, qui n'avait pratiquement pas de cou, mais possédait en revanche une
# moustache de belle taille. Mrs Dursley, quant à elle, était mince et blonde et disposait d'un
# cou deux fois plus long que la moyenne, ce qui lui était fort utile pour espionner ses voisins en
# regardant par-dessus les clôtures des jardins. Les Dursley avaient un petit garçon prénommé
# Dudley et c'était à leurs yeux le plus bel enfant du monde.", exercice_id: 18},
# {content: "Excité d'un désir curieux,
# Cette nuit je l'ai vue arriver en ces lieux,
# Triste, levant au ciel ses yeux mouillés de larmes,
# Qui brillaient au travers des flambeaux et des armes,
# Belle, sans ornement, dans le simple appareil
# D'une beauté qu'on vient d'arracher au sommeil.
# Que veux-tu ? Je ne sais si cette négligence,
# Les ombres, les flambeaux, les cris et le silence,
# Et le farouche aspect de ses fiers ravisseurs,
# Relevaient de ses yeux les timides douceurs.
# Quoi qu'il en soit, ravi d'une si belle vue,
# J'ai voulu lui parler, et ma voix s'est perdue :
# Immobile, saisi d'un long étonnement,
# Je l'ai laissée passer dans son appartement.
# J'ai passé dans le mien. C'est là que solitaire,
# De son image en vain j'ai voulu me distraire.
# Trop présente à mes yeux, je croyais lui parler,
# J'aimais jusqu'à ses pleurs que je faisais couler.
# Quelquefois, mais trop tard, je lui demandais grâce ;
# J'employais les soupirs, et même la menace.", exercice_id: 19},
# {content: "Agir sans juger si l’action est bonne ou mauvaise.
# Aimer sans s’inquiéter si c’est le bien ou le mal.
# Nathanaël, je t’enseignerai la ferveur.
# Une existence pathétique, Nathanaël, plutôt que la tranquillité.
# Je ne souhaite pas d’autre repos que celui du sommeil
# de la mort. J’ai peur que tout désir, toute énergie que je n’aurais
# pas satisfaits durant ma vie, pour leur survie ne me tourmentent.
# J’espère, après avoir exprimé sur cette terre tout ce qui
# attendait en moi, satisfait, mourir complètement désespéré.
# Non point la sympathie, Nathanaël, l’amour. Tu comprends,
# n’est-ce pas, que ce n’est pas la même chose. C’est par
# peur d’une perte d’amour que parfois j’ai pu sympathiser avec
# des tristesses, des ennuis, des douleurs que sinon je n’aurais
# qu’à peine endurés. Laisse à chacun le soin de sa vie.", exercice_id: 20},
# {content: "Sa poitrine aussitôt se mit à haleter rapidement. La langue tout entière lui sortit hors de la bouche ;
# ses yeux, en roulant, pâlissaient comme deux globes de lampe qui s’éteignent, à la croire déjà morte,
# sans l’effrayante accélération de ses côtes, secouées par un souffle furieux,
# comme si l’âme eût fait des bonds pour se détacher. Félicité s’agenouilla devant le crucifix,
# et le pharmacien lui-même fléchit un peu les jarrets, tandis que M. Canivet regardait vaguement sur la place.
# Bournisien s’était remis en prière, la figure inclinée contre le bord de la couche, avec sa longue soutane noire qui traînait derrière lui dans l’appartement.
# Charles était de l’autre côté, à genoux, les bras étendus vers Emma.
# Il avait pris ses mains et il les serrait, tressaillant à chaque battement de son cœur,
# comme au contrecoup d’une ruine qui tombe. À mesure que le râle devenait plus fort,
# l’ecclésiastique précipitait ses oraisons ; elles se mêlaient aux sanglots étouffés de Bovary,
# et quelquefois tout semblait disparaître dans le sourd murmure des syllabes latines,
# qui tintaient comme un glas de cloche.", exercice_id: 21},

# {content: "Comme d’habitude, un pilote côtier partit
# aussitôt du port, rasa le château d’If, et alla
# aborder le navire entre le cap de Morgion et l’île
# de Rion.
# Aussitôt, comme d’habitude encore, la plateforme
# du fort Saint-Jean s’était couverte de
# curieux ; car c’est toujours une grande affaire à
# Marseille que l’arrivée d’un bâtiment, surtout
# quand ce bâtiment, comme le Pharaon, a été
# construit, gréé, arrimé sur les chantiers de la
# vieille Phocée, et appartient à un armateur de la
# ville.
# 5
# Cependant ce bâtiment s’avançait ; il avait
# heureusement franchi le détroit que quelque
# secousse volcanique a creusé entre l’île de
# Calasareigne et l’île de Jaros ; il avait doublé
# Pomègue, et il s’avançait sous ses trois huniers,
# son grand foc et sa brigantine, mais si lentement
# et d’une allure si triste, que les curieux, avec cet
# instinct qui pressent un malheur, se demandaient
# quel accident pouvait être arrivé à bord", exercice_id: 22},
# {content: "A REMPLIR CE SOIR", exercice_id: 23}
{content: "Ainsi, notre portrait du meurtrier se précise. Il s’agit d’une personne qui a eu l’occasion, ce
jour-là, de dérober ses chaussures au capitaine Paton, aux Trois Marcassins.
Mais il y a plus : il fallait aussi que le meurtrier ait eu l’occasion de prendre le poignard dans
la vitrine. Vous me répondrez que n’importe quelle personne de la maison aurait pu le faire, mais
rappelez-vous : Flora Ackroyd a bien précisé que le poignard n’était plus dans la vitrine quand elle a
examiné les objets qui s’y trouvaient.
Et maintenant que tout est clair, récapitulons. Notre meurtrier est donc une personne qui est
allée aux Trois Marcassins dans la journée, et qui était assez liée avec Mr Ackroyd pour savoir qu’il
venait d’acheter un dictaphone. Une personne qui s’intéressait à la mécanique, qui a eu l’occasion de
prendre le poignard dans la vitrine avant l’arrivée de miss Flora et qui disposait de… du réceptacle
nécessaire pour cacher le dictaphone, une sacoche noire par exemple. Enfin une personne qui est
restée seule dans le cabinet de travail pendant quelques minutes après la découverte du crime, au
moment où Parker téléphonait à la police… Je n’en vois qu’une : le Dr Sheppard !", exercice_id: ex22.id},
]

puts "Creating answers..."
answers.each do |answer|
  ans = Answer.new(
    content: answer[:content],
    exercice_id: answer[:exercice_id],
    user_id: User.all.sample.id,
    status: "published"
    )
  ans.save
end
puts "Answers created..."



























