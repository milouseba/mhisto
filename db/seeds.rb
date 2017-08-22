# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# source textes : http://otheatre.over-blog.org/article-les-26-plus-celebres-monologues-classiques-115014490.html
puts "destroying old data..."
  Like.destroy_all
  Comment.destroy_all
  Answer.destroy_all
  Exercice.destroy_all
  User.destroy_all
puts "database clean..."


puts "Creating users database..."
10.times do
  users = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email)
  users.username = users.first_name
  users.password = users.first_name
  users.save
end
puts "Users created..."

exercices = [
{title: "L'attente", beginning_story: "Quand j'arrive à la gare de l'Est, j'espère toujours secrètement qu'il y aura quelqu'un pour m'attendre.",
end_story: "Je voudrais que quelqu'un m'attende quelque part... C'est quand même pas compliqué."},
{title: "Les Carnets du sous-sol", beginning_story: "Je suis un homme malade.Je suis un homme méchant. Un homme repoussoir.",
end_story: "J’ai mal au foie. Tant mieux, qu’il me fasse encore mal!"},
{title: "Le Gai Savoir", beginning_story: "Mais comment pouvons-nous nous permettre de blâmer ou louer l’univers ?",
end_story: "Quand pourrons-nous, nous autres hommes, redevenir nature ?"},
{title: "Battle Royale", beginning_story: " Comment peut-on tuer ses camarades de classe ?",
end_story: " C'est bien pour cette raison qu'avec Yukiko elles s'étaient éloignées de l'école et s'étaient enfermées ici."},
{title: "Antigone", beginning_story: "Comprendre… Vous n’avez que ce mot-là à la bouche, tous, depuis que je suis toute petite.",
end_story: "Comprendre… Vous n’avez que ce mot-là à la bouche, tous, depuis que je suis toute petite."},
{title: "Menace de mort", beginning_story: "Vous m’insultez ! Je suis un homme honnête, moi !",
end_story: "Eh oui !"},
{title: "Les Liaisons dangereuses", beginning_story: "Mais, on ne me dit rien, de sorte que, dans l’ignorance où je suis, je commets bien des gaucheries.",
end_story: "Je ne peux pas vous rendre combien j’ai été honteuse."},
{title: "Largo Desolato", beginning_story: "C’est du baratin, tout ça. Quand tu voulais me séduire, au début, tu ne parlais pas comme ça.",
end_story: "Tu es un cas désespéré. C’est bien fait pour moi. Une illusion de moins."},
{title: "Exercice de style", beginning_story: "Vers le milieu de la journée et à midi, je me trouvai et montai sur la plate-forme et la terrasse arrière d'un
autobus", end_story: "Deux heures après et cent vingt minutes plus tard, je le rencontre et le revois cour de Rome et devant la
gare Saint-Lazare."},
{title: "Salammbô", beginning_story: "C'était à Mégara, faubourg de Carthage, dans les jardins d'Hamilcar.",
end_story: "
Les arbres derrière eux fumaient encore ; de leurs branches noircies, des carcasses de singes à demi brûlées tombaient de temps à autre au milieu des plats. Les soldats ivres ronflaient la bouche ouverte à côté des cadavres ; et ceux qui ne dormaient pas baissaient leur tête, éblouis par le jour.
Le sol piétiné disparaissait sous des flaques rouges."},
{title: "Nuit sans date rue Saint Jacques", beginning_story: "La rue tombe noire, noire, la noire rue noire tombe là.",
end_story: "La rue tombe. La noire rue noire. Noire tombe noire. Là."},
{title: "Femme", beginning_story: "Dans un sursaut je me réveille. Il est 9h10, je suis en retard.",
end_story: "Je suis un femme. Je suis une femme. Je suis une FEMME ?!'
Et j'ai beau le répéter, je ne peux rien y faire."},
{title: "Mauvaise Surprise", beginning_story: "J'ouvre les yeux. Tout de suite, je remarque que mes jambes sont anormalement courtes.",
end_story: "Je repousse mes cheveux courts et gras. Fébrile, je met mon bicorne. C'est pas mal d'être empereur."},
{title: "Partir", beginning_story: "C'est un matin classique. Ma femme est dans la cuisine, mes enfants crient dans la salle de bain.",
end_story: "J'ai l'impression que le temps que je cligne des yeux, la ville apparaît déjà, minuscule, sous l'avion. Je sais que je ne reviendrai jamais."},
{title: "Brûler Rome", beginning_story: "J'entend le brouhaha quotidien. Rome, sous mes yeux, s'étale avec majesté.",
end_story: "Je ne pensais pas que la voir brûler me donnerait autant de satisfaction. Je me ressers du vin et mon rire se mêle au hurlement des victimes."},
{title: "La malédiction", beginning_story: "Sur un ordre d’Alain de Pareilles, les archers éteignirent leurs torches dans l’herbe, et la nuit ne fut plus éclairée que par le brasier.",
end_story: "Les flammes entrèrent dans la bouche du grand-maître, et y étouffèrent son dernier cri. Puis, pendant un temps qui parut interminable, il se battit contre la mort."},
{title: "Enfance", beginning_story: "On est là. Je suis là deux fois. Je me fixe. C'est moi à huit ans, qui me sourit. De lourdes larmes coulent le long de mes joues.",
end_story: "Je me dis adieu. Le moi enfant meurt silencieusement, paisible, en souriant."},
{title: "Hommage", beginning_story: "Le roi a décidé pour le jour d'aujourd'hui, Qu'en vers de douze pieds vous devrez vous comprendre, Depuis l'aube levée et ce jusqu'à la nuit, Ainsi célébrerez le trépas d'Alexandre",
end_story: "Dois-je comprendre que je suis dispensé ?"},
{title: "Britannicus", beginning_story: "Narcisse, c'en est fait, Néron est amoureux.",
end_story: "Voilà comme, occupé de mon nouvel amour, Mes yeux sans se fermer, ont attendu le jour."},
{title: "Les nourritures terrestres", beginning_story: "Nathanaël, tu regarderas tout en passant, et tu ne
t’arrêteras nulle part. Dis-toi bien que Dieu seul n’est pas provisoire. Que l’importance soit dans ton regard, non dans la chose regardée.",
end_story: "Nathanaël, je t’enseignerai la ferveur. Nos actes s’attachent à nous comme sa lueur au phosphore. Ils nous consument, il est vrai, mais ils nous font notre splendeur."},
{title: "Madame Bovary", beginning_story: "En effet, elle regarda tout autour d’elle, lentement, comme quelqu’un qui se réveille d’un songe ; puis, d’une voix distincte, elle demanda son miroir,
et elle resta penchée dessus quelque temps,jusqu’au moment où de grosses larmes lui découlèrent des yeux. Alors elle se renversa la tête en poussant un soupir et retomba sur l’oreiller.",
end_story: "Une convulsion la rabattit sur le matelas. Tous s’approchèrent. Elle n’existait plus."},
{title: "Le meurtre de Roger Ackroyd", beginning_story: "Le meurtrier est l’un d’entre nous, dites-vous ? Et… vous savez qui ? Poirot avait lu le message.
Il froissa la dépêche dans sa main et tapota la petite boulette de papier.",
end_story: "Ah ! si seulement Hercule Poirot n’avait pas pris sa retraite, et n’était pas venu chez nous cultiver des courges !"}
]

puts "Creating exercices..."
exercices.each do |exercice|
  exo = Exercice.new(
  title: exercice[:title],
  beginning_story: exercice[:beginning_story],
  end_story: exercice[:end_story],
  user_id: User.all.sample.id
  )
  exo.save
end
puts "Exercices created..."

answers = [
{content: "C'est con. J'ai beau savoir que ma mère est encore au boulot à cette heure-là et que Marc
n'est pas du genre à traverser la banlieue pour porter mon sac, j'ai toujours cet espoir débile.
Là encore, ça n'a pas loupé, avant de descendre les escalators pour prendre le métro,
j'ai jeté un dernier regard circulaire au cas où il y aurait quelqu'un...
Et à chaque fois dans les escalators mon sac me paraît encore plus lourd.", exercice_id: 1},
{content: "Je suis un homme méchant. Un homme repoussoir.
Voilà ce que je suis. Je crois que j’ai quelque chose au foie.
De toute façon, ma maladie, je n’y comprends rien, j’ignore au juste ce qui me fait mal.
Je ne me soigne pas, je ne me suis jamais soigné, même si je respecte la médecine et les docteurs.
En plus, je suis superstitieux comme ce n’est pas permis: enfin, assez pour respecter la médecine.
(Je suis suffisamment instruit pour ne pas être superstitieux.) Oui, c’est par méchanceté que je ne me soigne pas.
Ça, messieurs, je parie que c’est une chose que vous ne comprenez pas.
Moi, si! Evidemment, je ne saurais vous expliquer à qui je fais une crasse quand j’obéis à ma méchanceté
de cette façon-là; je sais parfaitement que ce ne sont pas les docteurs que j’emmerde en refusant de me soigner;
je suis le mieux placé pour savoir que ça ne peut faire de tort qu’à moi seul et à personne d’autre.
Et, malgré tout, si je ne me soigne pas, c’est par méchanceté.", exercice_id: 2},
{content: "Gardons-nous de lui reprocher de la dureté et de la raison, ou bien le contraire.
Il n’est ni parfait, ni beau, ni noble, et ne veut devenir rien de tout cela, il ne tend absolument pas à imiter l’homme !
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
Quand retrouverons-nous la nature pure, innocente ?", exercice_id: 3},
{content: "Certes, cette règle leur avait été imposée, mais Yumiko n'arrivait pas à croire qu'il existait quelqu'un
capable de jouer le jeu. Et pourtant...
Oui, et pourtant... Si elle se retrouvait face à quelqu'un qui en voulait à sa vie,
elle pouvait s'imaginer passer à l'acte, elle aussi. Et si elle en était capable, tout le monde le pouvait, non ?
Yumiko jeta un oeil sur un mégaphone apparemment abandonné dans un coin de la salle.
Etait-il en état de marche ? Et si oui...
S' il était utilisable, ne pouvait-elle le mettre à profit ?
La peur seule l'empêchait de s'en servir. Elle ne pouvait pas croire qu'il y ait des gens prêts à jouer le jeu
qui leur était imposé, mais d'un autre côté, elle ne pouvait pas nier qu'elle sentait son coeur pris
dans un filet d'angoisse.", exercice_id: 4},
{content: "Il fallait comprendre qu’on ne peut toucher à l’eau, à la belle eau fuyante parce que ça mouille les dalles,
à la terre parce que ça tache les robes. Il fallait comprendre qu’on ne doit pas manger tout à la fois,
donner tout ce qu’on a dans les poches au premier mendiant qu’on rencontre, courir,
courir dans le vent jusqu’à ce qu’on tombe par terre et boire quand on a chaud et se baigner quand il est trop tôt
ou trop tard, mais pas juste quand on en a envie !
Comprendre. Toujours comprendre...", exercice_id: 5},
{content: "Je suis un homme de conscience, moi !
Je suis un homme, sachez-le, qui peut arriver à se trouver, bien sûr –sans le vouloir- dans une situation désespérée.
Oui ! Mais ce n’est pas vrai, pas vrai que je voudrais me servir des femmes des autres.
Parce que s’il en était ainsi, je ne vous aurais pas dit ce que je viens de vous dire, qu’un mari ne devrait
jamais négliger sa femme. Et j’ajoute maintenant qu’un mari qui néglige sa femme comment, selon moi, un crime !
Et pas rien qu’un ! Plusieurs crimes !
Oui parce que non seulement il oblige sa femme à manquer à ses devoirs en envers elle-même, envers son honnêteté,
mais parce qu’il peut aussi obliger un homme, un autre homme, à être malheureux toute sa vie.", exercice_id: 6},
{content: "Mais oui : Ainsi hier, maman m’a dit de passer chez elle. Si c’était le monsieur, me dis-je !
La main me tremblait et le coeur me battait ; en entrant chez maman,
j’ai vu le monsieur en noir, debout près d’elle. Toute tremblante, j’ai trouvé un fauteuil et je me suis assise,
bien rouge et bien déconcertée. J’y étais à peine que voilà cet homme à mes genoux.
J’ai alors perdu la tête. Je me suis levée en jetant un cri perçant… comme lorsqu’il fait tonnerre.
Maman est partie d’un éclat de rire en me disant : « eh bien, qu’avez-vous ?
Donnez votre pied à monsieur… » Le monsieur était cordonnier.", exercice_id: 7},
{content: "J’allais faire renaître ton espoir, j’allais te régénérer, inaugurer pour toi une vie nouvelle.
Tu n’es pas une épave, Léopold, tu es un vulgaire démagogue.
Tu dirais n’importe quoi, tout ce qui t’arrange. Tu as eu tout ce que tu voulais et maintenant tu veux te débarrasser de moi.
Tu me parles de ton désarroi ! Foutaises, oui !
Tu veux me faire comprendre que j’ai rien à attendre de toi et en plus, tu veux te faire plaindre.
C’est malhonnête. Ce sont des grands mots, mais tu ne m’auras pas comme ça.
Oh !, comme j’ai été bête, bête à pleurer. Croire que je pourrais te faire partager mes sentiments,
te redonner goût à la vie ? Tu parles !", exercice_id: 8},
{content: " Je vis et remarquai un jeune homme et un vieil adolescent assez ridicule et pas mal
grotesque : cou maigre et tuyau décharné, ficelle et cordelière autour du chapeau et couvre-chef. Après
une bousculade et confusion, il dit et profère d'une voix et d'un ton larmoyants et pleurnichards que son
voisin et covoyageur fait exprès et s'efforce de le pousser et de l'importuner chaque fois qu'on descend et
sort. Ceci déclaré et après avoir ouvert la bouche, il se précipite et se dirige vers une place et un siège
vides et libres.", exercice_id: 9},
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
La clameur redoublait ; les lions blessés rugissaient dans l'ombre.", exercice_id: 10},
{content: "La rue tombe noire, noire, la noire rue noire tombe là.
La rue tombe noire, noire, tombe la noire rue noire, là.
La rue, tombe noire, noire, rue noire, la tombe noire, là.
La rue tombe noire, rue noire noire, là, tombe noire, là.", exercice_id: 11},
{content: "D'un pas lourd j'avance vers ma salle de bain. J'enjambe la baignoire et commence à me doucher. Je m'étale du savon sur le corps.
Je pousse un hurlement strident. J'ai des seins, et il manque quelque chose de plutôt important entre mes jambes. Je me claque les cuisses,
les fesses. Ce n'est pas possible. Je rêve. Je me jette devant le miroir. Je lève le bras. Mon reflet féminin aussi. J'essaie de le prendre par surprise,
sans succès. Je pousse des gémissements horrifiés à chaque tentative. Je ne sais pas quoi faire. Appeler quelqu'un ? Ils vont tous se demander quelle drogue
j'ai prise. Et puis ce n'est pas possible. Personne ne se transforme en femme pendant la nuit. Je nage en plein délire et tourne en rond, nue, dans mon appartement,
me tirant les cheveux, les yeux hagards.", exercice_id: 12},
{content: "La décoration autour de moi attire immédiatement mon attention. Le lit dans lequel je suis est énorme, une femme inconnue y dort paisiblement à mes côtés,
je me redresse. Plutôt intéressant ce rêve. Tout est doré, c'est un peu trop chargé à mon goût. Je me lève. Il faut que je trouve un miroir. Je suis si petit, j'ai
du mal à marcher avec mes nouvelles jambes. Je renverse une carafe au sol. Les tapis y sont aussi exagérés que le reste. Je trouve une tenue posée sur une chaise. On y voit
une broche, dorée elle aussi, en forme d'aigle. Je relève les yeux. Ce n'est pas le seul élément à figurer cet animal dans la pièce. Il y a des aigles partout. Je comprend soudain.
Je repère un petit miroir, et à côté, exactement le chapeau que je m'attendais y trouver.",
exercice_id: 13},
{content: "Je les écoute, je les regarde s'agiter, comme chaque matin. Comme chaque matin, je leur souris et je m'en vais.
Dans la voiture, comme chaque matin, je mets la radio. Je sors dans l'allée, et me dirige vers le centre ville.
Arrivé au rond point habituel, j'en fais une fois le tour, puis deux, puis trois. A chaque passage, il me paraît de
moins en moins possible que je prenne la bonne direction. Un rejet violent et viscéral s'est ancré dans mon estomac.
Le panneau indiquant l'aéroport attire soudain mon attention. Je refais deux tours. Les gens commencent à klaxonner. Tant pis j'y vais.
Plus je me rapproche de ma nouvelle destination, mieux je me sens. Le rejet est parti. C'est maintenant évident : il faut que je me tire d'ici.",
exercice_id: 14},
{content: "Je me sers un verre de vin et m'assomme au balcon. Je tapote légèrement la rambarde de mes doigts bagués.
Le bruissement, l'agitation, les cris, les meuglements du bétail, tout ce qui me paraissait beau me semble
soudain fade. Ce n'est qu'un ramassis de laideur. Chaque détail, dès que je le regarde mieux, me dégoûte.
Je regarde autour de moi. Mon palais semble échapper à ce phénomène. La raison me vient soudain, évidente et claire.
Il n'y a que moi qui puisse goûter à la véritable beauté, qui puisse la comprendre et même la créer. J'appelle un
messager. 'Il faut brûler Rome' lui dis-je. Halluciné, il met du temps à repartir. Il croit sûrement à un caprice.
Plus tard, je vois plusieurs lueurs de bûchers naissants apparaître à plusieurs extrémités de la ville. Ils ne se
doutent de rien. Personne ne se doute de rien. Ma puissance n'a aucune limite. Je commence à rire. Ce lieux que le
monde entier craint aujourd'hui grâce à moi, va disparaître.", exercice_id: 15},
{content: "Et tout à coup, la voix du grand-maître s’éleva à travers le rideau de feu et, comme si elle se fut adressée à chacun, atteignit chacun en plein visage. Avec une force stupéfiante, ainsi qu’il l’avait fait devant Notre-Dame, Jacques de Molait criait :
'Honte ! Honte ! Vous voyez des innocents qui meurent. Honte sur vous tous ! Dieu vous jugera.'
La flamme se flagella, brûla sa barbe, calcina en une seconde sa mitre de papier et alluma ses cheveux blancs.
La foule terrifiée s’était tue. On eût dit qu’on brûlait un prophète fou.
De ce visage en feu, la voix effrayante proféra : 'Pape Clément !...Chevalier Guillaume ! ...Roi Philippe !...
Avant un an, je vous cite à paraître au tribunal de Dieu pour y recevoir votre juste châtiment ! Maudits ! Maudits !
Tous maudits jusqu’à la treizième génération de vos races !'", exercice_id: 16},
{content: "On se regarde en silence quelques instants. Je n'ose rien dire. Finalement le moi de huit ans soupire et lâche :
'- Alors c'est ça que je suis devenu ?', je sursaute.
'- Bah oui. T'espérais quoi ?'
'- J'espérais au moins qu'on serait heureux.'
Je ne m'attendais pas à ça. Je ne sais pas quoi faire. Je grimace et me remet à pleurer. Dans un flash,
tous les rêves de moi enfant m'assaillissent. Tout devient clair. Je soupire à mon tour. et me prend la tête dans les mains.
Quelques instants passent. Il dit 'Tu sais ce qu'il te reste à faire.'
Lentement, je m'avance vers lui. Je place mes mains sur son cou et je serre. Il ne lutte pas, et au contraire paraît impatient
qu'on en finisse. Il n'arrête pas de sourire. Je serre plus. Il perd ses couleurs, je le sens devenir plus lourd dans mes bras.
Je suis en train de me tuer, j'explose de l'intérieur. Moi trouble et moi mourrant se fixent tout le long.
Puis, c'est enfin fini.", exercice_id: 17},
{content: "
  Léodagan : Debout !
  Yvain : Mais euh...
  Léodagan : DEBOUT.
  Yvain : Mère, cinq minutes encore.
  Léodagan : Décarrez du pajot ou mon pied au derrière
  Vous en extirpera plus vite qu'une météore.
  Cela vous apprendra, à défaut des manières
  A jamais plus prendre le mari pour l'épouse !
  Yvain : Arrêtez de huler... Même pas peur d'abord.
  Léodagan : Levez-vous, c'est un ordre espèce de triple bouse !
  Plus d'une heure déjà qu'on vous attend dehors.
  Yvain : Ah bon ? Et pourquoi donc ?
  Léodagan : En plus vous l'ignorez ?
  Votre examen final pour être Chevalier
  A lieu en ce moment. Veuillez donc vous grouiller !
  Yvain : Ah ça ! Y'a pas besoin, je vais me recoucher.
  Léodagan : Et pourquoi ce forfait ? Auriez-vous les miquettes ?
  Yvain : Que nenni, point du tout : Chevalier je le suis.
  Léodagan : Ceci n'est que rouerie, habile pirouette.
  Pas plus Sieur vous n'êtes que je suis Mévanouie.
  Yvain : Vous voulez dire ?
  Léodagan : Eh oui !
  Yvain : Que je dois ?
  Léodagan : Vous magner ! Enfilez vos bottes, votre armure, votre heaume
  Et tout votre attirail sans omettre l'épé.
  Yvain : L'armure c'est obligé pour avoir son diplôme ?
  Léodagan : Ne me dites pas que vous l'avez oubliée ?!
  Yvain : Non père, elle est bien là, rangée dans mon armoire.
  Il y a quelques temps, pour dire la vérité
  L'ami Gauvain et moi voulions savoir
  Si on pouvait user du plastron et d'l'écu
  Pour dévaler le pan arrière du donjon.
  Léodagan : Vous l'avez cabossée ? J'en reste sur le cul...
  Yvain : C'était vraiment hyper, comme si nous volions !
  Léodagan : Nul Dieu ici-bas, des Bretons ou des Romains
  pas même le Dieu chrétien, ne me condamnerait
  Si je vous étranglais de mes propres mains !", exercice_id: 18},
  {content: "Excité d'un désir curieux,
    Cette nuit je l'ai vue arriver en ces lieux,
Triste, levant au ciel ses yeux mouillés de larmes,
Qui brillaient au travers des flambeaux et des armes,
Belle, sans ornement, dans le simple appareil
D'une beauté qu'on vient d'arracher au sommeil.
Que veux-tu ? Je ne sais si cette négligence,
Les ombres, les flambeaux, les cris et le silence,
Et le farouche aspect de ses fiers ravisseurs,
Relevaient de ses yeux les timides douceurs.
Quoi qu'il en soit, ravi d'une si belle vue,
J'ai voulu lui parler, et ma voix s'est perdue :
Immobile, saisi d'un long étonnement,
Je l'ai laissée passer dans son appartement.
J'ai passé dans le mien. C'est là que solitaire,
De son image en vain j'ai voulu me distraire.
Trop présente à mes yeux, je croyais lui parler,
J'aimais jusqu'à ses pleurs que je faisais couler.
Quelquefois, mais trop tard, je lui demandais grâce ;
J'employais les soupirs, et même la menace.", exercice_id: 19},
{content: "Agir sans juger si l’action est bonne ou mauvaise.
Aimer sans s’inquiéter si c’est le bien ou le mal.
Nathanaël, je t’enseignerai la ferveur.
Une existence pathétique, Nathanaël, plutôt que la tranquillité.
Je ne souhaite pas d’autre repos que celui du sommeil
de la mort. J’ai peur que tout désir, toute énergie que je n’aurais
pas satisfaits durant ma vie, pour leur survie ne me tourmentent.
J’espère, après avoir exprimé sur cette terre tout ce qui
attendait en moi, satisfait, mourir complètement désespéré.
Non point la sympathie, Nathanaël, l’amour. Tu comprends,
n’est-ce pas, que ce n’est pas la même chose. C’est par
peur d’une perte d’amour que parfois j’ai pu sympathiser avec
des tristesses, des ennuis, des douleurs que sinon je n’aurais
qu’à peine endurés. Laisse à chacun le soin de sa vie.", exercice_id: 20},
{content: "Sa poitrine aussitôt se mit à haleter rapidement. La langue tout entière lui sortit hors de la bouche ;
ses yeux, en roulant, pâlissaient comme deux globes de lampe qui s’éteignent, à la croire déjà morte,
sans l’effrayante accélération de ses côtes, secouées par un souffle furieux,
comme si l’âme eût fait des bonds pour se détacher. Félicité s’agenouilla devant le crucifix,
et le pharmacien lui-même fléchit un peu les jarrets, tandis que M. Canivet regardait vaguement sur la place.
Bournisien s’était remis en prière, la figure inclinée contre le bord de la couche, avec sa longue soutane noire qui traînait derrière lui dans l’appartement.
Charles était de l’autre côté, à genoux, les bras étendus vers Emma.
Il avait pris ses mains et il les serrait, tressaillant à chaque battement de son cœur,
comme au contrecoup d’une ruine qui tombe. À mesure que le râle devenait plus fort,
l’ecclésiastique précipitait ses oraisons ; elles se mêlaient aux sanglots étouffés de Bovary,
et quelquefois tout semblait disparaître dans le sourd murmure des syllabes latines,
qui tintaient comme un glas de cloche.", exercice_id: 21},
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
moment où Parker téléphonait à la police… Je n’en vois qu’une : le Dr Sheppard !", exercice_id: 22}
]


puts "Creating answers..."
answers.each do |answer|
  Answer.create(
    content: answer[:content],
    status: "published",
    exercice_id: answer[:exercice_id],
    user_id: User.all.sample.id
    )
end
puts "Answers created..."









