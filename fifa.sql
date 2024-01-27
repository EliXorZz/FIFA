SET FOREIGN_KEY_CHECKS=0;

drop table if exists album cascade;

drop table if exists albumcontientphoto cascade;

drop table if exists article cascade;

drop table if exists articleassociejoueur cascade;

drop table if exists articlecontientphoto cascade;

drop table if exists articlecontientvideo cascade;

drop table if exists associationproduit cascade;

drop table if exists blog cascade;

drop table if exists blogcontientphoto cascade;

drop table if exists cartebancaire cascade;

drop table if exists categorieproduit cascade;

drop table if exists souscategorieproduit cascade;

drop table if exists categoriecontientproduit cascade;

drop table if exists club cascade;

drop table if exists commande cascade;

drop table if exists commentaire cascade;

drop table if exists competition cascade;

drop table if exists couleur cascade;

drop table if exists document cascade;

drop table if exists genre cascade;

drop table if exists imageproduit cascade;

drop table if exists joueur cascade;

drop table if exists joueurcontienttrophee cascade;

drop table if exists langue cascade;

drop table if exists lignecommande cascade;

drop table if exists nation cascade;

drop table if exists pays cascade;

drop table if exists photo cascade;

drop table if exists photocontientjoueur cascade;

drop table if exists prodemandeproduit cascade;

drop table if exists produit cascade;

drop table if exists produitcontientcouleur cascade;

drop table if exists produitcontientimage cascade;

drop table if exists produitcontienttaille cascade;

drop table if exists professionnel cascade;

drop table if exists reponsecommentaire cascade;

drop table if exists statistique cascade;

drop table if exists statistiquejoueur cascade;

drop table if exists stockproduit cascade;

drop table if exists tailleproduit cascade;

drop table if exists themevote cascade;

drop table if exists themevotecontientjoueur cascade;

drop table if exists trophee cascade;

drop table if exists typelivraison cascade;

drop table if exists utilisateur cascade;

drop table if exists utilisateurvote cascade;

drop table if exists variantecouleurproduit cascade;

drop table if exists video cascade;

drop table if exists visiteproduit cascade;

/*==============================================================*/
/* table: album                                                 */
/*==============================================================*/
create table album (
idpublication        int not null auto_increment,
idphoto              int                 not null,
titrepublication     varchar(100)         null,
resumepublication    varchar(500)         null,
datepublication      date                 null,
constraint pk_album primary key (idpublication)
);

/*==============================================================*/
/* table: albumcontientphoto                                    */
/*==============================================================*/
create table albumcontientphoto (
idpublication        int                 not null,
idphoto              int                 not null,
constraint pk_albumcontientphoto primary key (idpublication, idphoto)
);

/*==============================================================*/
/* table: article                                               */
/*==============================================================*/
create table article (
idpublication        int not null auto_increment,
idphoto              int                 not null,
titrepublication     varchar(100)         null,
resumepublication    varchar(500)         null,
datepublication      date                 null,
textearticle         text                 null,
constraint pk_article primary key (idpublication)
);

/*==============================================================*/
/* table: articleassociejoueur                                  */
/*==============================================================*/
create table articleassociejoueur (
idjoueur             int                 not null,
idpublication        int                 not null,
constraint pk_articleassociejoueur primary key (idjoueur, idpublication)
);

/*==============================================================*/
/* table: articlecontientphoto                                  */
/*==============================================================*/
create table articlecontientphoto (
idpublication        int                 not null,
idphoto              int                 not null,
constraint pk_articlecontientphoto primary key (idpublication, idphoto)
);

/*==============================================================*/
/* table: articlecontientvideo                                  */
/*==============================================================*/
create table articlecontientvideo (
idpublication        int                 not null,
idvideo              int                 not null,
constraint pk_articlecontientvideo primary key (idpublication, idvideo)
);

/*==============================================================*/
/* table: associationproduit                                    */
/*==============================================================*/
create table associationproduit (
idautreproduit       int                 not null,
idproduit            int                 not null,
constraint pk_associationproduit primary key (idautreproduit, idproduit)
);

/*==============================================================*/
/* table: blog                                                  */
/*==============================================================*/
create table blog (
idpublication        int not null auto_increment,
idphoto              int                 not null,
titrepublication     varchar(100)         null,
resumepublication    varchar(500)         null,
datepublication      date                 null,
texteblog            text                 null,
constraint pk_blog primary key (idpublication)
);

/*==============================================================*/
/* table: blogcontientimage                                     */
/*==============================================================*/
create table blogcontientphoto (
idpublication        int                 not null,
idphoto              int                 not null,
constraint pk_blogcontientphoto primary key (idpublication, idphoto)
);

/*==============================================================*/
/* table: cartebancaire                                         */
/*==============================================================*/
create table cartebancaire (
idcartebancaire      int not null auto_increment,
titulairecartebancaire varchar(100)         null,
numerocartebancaire  varchar(100)         null,
dateexpirationcartebancaire date                 null,
constraint pk_cartebancaire primary key (idcartebancaire)
);

/*==============================================================*/
/* table: categorieproduit                                      */
/*==============================================================*/
create table categorieproduit (
idcategorieproduit          int not null auto_increment,
nomcategorieproduit         varchar(100)         null,
parentcategorieproduit      boolean              null,
constraint pk_categorieproduit primary key (idcategorieproduit)
);

/*==============================================================*/
/* table: souscategorieproduit                                   */
/*==============================================================*/
create table souscategorieproduit (
idcategorieproduit       int               not null,
idautrecategorieproduit  int               not null,
constraint pk_souscategorieproduit primary key (idcategorieproduit, idautrecategorieproduit)
);

/*==============================================================*/
/* table: categoriecontientproduit                              */
/*==============================================================*/
create table categoriecontientproduit (
idproduit            int                 not null,
idcategorieproduit   int                 not null,
constraint pk_categoriecontientproduit primary key (idproduit, idcategorieproduit)
);

/*==============================================================*/
/* table: club                                                  */
/*==============================================================*/
create table club (
idclub               int not null auto_increment,
nomclub              varchar(100)         null,
constraint pk_club primary key (idclub)
);

/*==============================================================*/
/* table: commande                                              */
/*==============================================================*/
create table commande (
idcommande           int not null auto_increment,
idtypelivraison      int                 not null,
idutilisateur        int                 not null,
villelivraisoncmd    varchar(100)         null,
ruelivraisoncmd      varchar(100)         null,
postallivraisoncmd   char(5)              null,
villefacturationcmd  varchar(100)         null,
ruefacturationcmd    varchar(100)         null,
postalfacturationcmd char(5)              null,
prixlivraisoncmd     numeric(10,2)        null,
tvacmd               numeric(4,2)         null,
expeditioncmd        boolean              null,
facturecmd           varchar(500)         null,
datecmd              timestamp            null default current_timestamp,          
constraint pk_commande primary key (idcommande)
);

/*==============================================================*/
/* table: commentaire                                           */
/*==============================================================*/
create table commentaire (
idcommentaire        int not null auto_increment,
idutilisateur        int                 not null,
idpublication        int                 not null,
commentaire          varchar(300)         null,
datecommentaire      date                 null,
constraint pk_commentaire primary key (idcommentaire)
);

/*==============================================================*/
/* table: competition                                           */
/*==============================================================*/
create table competition (
idcompetition        int not null auto_increment,
nomcompetition       varchar(100)         null,
constraint pk_competition primary key (idcompetition)
);

/*==============================================================*/
/* table: couleur                                               */
/*==============================================================*/
create table couleur (
idcouleur            int not null auto_increment,
nomcouleur           varchar(100)         null,
hexacouleur          char(6)              null,
constraint pk_couleur primary key (idcouleur)
);

/*==============================================================*/
/* table: document                                              */
/*==============================================================*/
create table document (
idpublication        int not null auto_increment,
idphoto              int                 null,
titrepublication     varchar(100)         null,
resumepublication    varchar(500)         null,
datepublication      date                 null,
urlpdf               varchar(500)         null,
constraint pk_document primary key (idpublication)
);

/*==============================================================*/
/* table: genre                                                 */
/*==============================================================*/
create table genre (
idgenreproduit       int not null auto_increment,
nomgenreproduit      varchar(100)         null,
constraint pk_genre primary key (idgenreproduit)
);

/*==============================================================*/
/* table: imageproduit                                          */
/*==============================================================*/
create table imageproduit (
idimageproduit       int not null auto_increment,
urlimageproduit      varchar(500)         null,
constraint pk_imageproduit primary key (idimageproduit)
);

/*==============================================================*/
/* table: joueur                                                */
/*==============================================================*/
create table joueur (
idjoueur             int not null auto_increment,
idclub               int                 not null,
idpays               int                 not null,
nomjoueur            varchar(100)         null,
prenomjoueur         varchar(100)         null,
datenaissancejoueur  date                 null,
lieunaissancejoueur  varchar(100)         null,
piedjoueur           varchar(20)          null,
poidsjoueur          int                 null,
taillejoueur         int                 null,
postejoueur          varchar(50)          null,
biographie           varchar(500)         null,
photojoueur          varchar(500)         null,
constraint pk_joueur primary key (idjoueur)
);

/*==============================================================*/
/* table: joueurcontienttrophee                                 */
/*==============================================================*/
create table joueurcontienttrophee (
idjoueur             int                 not null,
idtrophee            int                 not null,
constraint pk_joueurcontienttrophee primary key (idjoueur, idtrophee)
);

/*==============================================================*/
/* table: langue                                                */
/*==============================================================*/
create table langue (
idlangue             int not null auto_increment,
nomlangue            varchar(100)         null,
constraint pk_langue primary key (idlangue)
);

/*==============================================================*/
/* table: lignecommande                                         */
/*==============================================================*/
create table lignecommande (
idlignecmd                          int not null auto_increment,
idvariantecouleurproduit            int                 not null,
idtailleproduit                     int                 not null,
idcommande                          int                 not null,
quantitecommande                    int                 null,
prixunitaire                        numeric(10,2)        null,
constraint pk_lignecommande primary key (idlignecmd),
constraint uq_lignecommande unique (idvariantecouleurproduit, idtailleproduit, idcommande)
);

/*==============================================================*/
/* table: nation                                                */
/*==============================================================*/
create table nation (
idnation             int not null auto_increment,
nomnation            varchar(100)         null,
constraint pk_nation primary key (idnation)
);

/*==============================================================*/
/* table: pays                                                  */
/*==============================================================*/
create table pays (
idpays               int not null auto_increment,
nompays              varchar(100)         null,
constraint pk_pays primary key (idpays)
);

/*==============================================================*/
/* table: photo                                                 */
/*==============================================================*/
create table photo (
idphoto              int not null auto_increment,
nomphoto             varchar(500)         null,
urlphoto             varchar(500)         null,
constraint pk_photo primary key (idphoto)
);

/*==============================================================*/
/* table: photocontientjoueur                                   */
/*==============================================================*/
create table photocontientjoueur (
idphoto              int                 not null,
idjoueur             int                 not null,
constraint pk_photocontientjoueur primary key (idphoto, idjoueur)
);

/*==============================================================*/
/* table: prodemandeproduit                                     */
/*==============================================================*/
create table prodemandeproduit (
idproduit            int                 not null,
idutilisateur        int                 not null,
constraint pk_prodemandeproduit primary key (idproduit, idutilisateur)
);

/*==============================================================*/
/* table: produit                                               */
/*==============================================================*/
create table produit (
idproduit            int not null auto_increment,
idcompetition        int                 null,
idnation             int                 null,
idgenreproduit       int                 null,
titreproduit         varchar(150)         null,
descriptionproduit   text                 null,
constraint pk_produit primary key (idproduit)
);

/*==============================================================*/
/* table: produitcontientcouleur                                */
/*==============================================================*/
create table produitcontientcouleur (
idproduit            int                 not null,
idcouleur            int                 not null,
constraint pk_produitcontientcouleur primary key (idproduit, idcouleur)
);

/*==============================================================*/
/* table: produitcontientimage                                  */
/*==============================================================*/
create table produitcontientimage (
idvariantecouleurproduit            int                 not null,
idimageproduit                      int                 not null,
constraint pk_produitcontientimage primary key (idvariantecouleurproduit, idimageproduit)
);

/*==============================================================*/
/* table: produitcontienttaille                                 */
/*==============================================================*/
create table produitcontienttaille (
idproduit            int                 not null,
idtailleproduit      int                 not null,
constraint pk_produitcontienttaille primary key (idproduit, idtailleproduit)
);

/*==============================================================*/
/* table: professionnel                                         */
/*==============================================================*/
create table professionnel (
idutilisateur        int                 not null,
constraint pk_professionnel primary key (idutilisateur)
);

/*==============================================================*/
/* table: reponsecommentaire                                    */
/*==============================================================*/
create table reponsecommentaire (
idcommentairereponse int                 not null,
idcommentaire        int                 not null,
constraint pk_reponsecommentaire primary key (idcommentairereponse, idcommentaire)
);

/*==============================================================*/
/* table: statistique                                           */
/*==============================================================*/
create table statistique (
idstatistique        int not null auto_increment,
nomstatistique       varchar(50)          null,
constraint pk_statistique primary key (idstatistique)
);

/*==============================================================*/
/* table: statistiquejoueur                                     */
/*==============================================================*/
create table statistiquejoueur (
idstatistique        int                 not null,
idjoueur             int                 not null,
valeurstatistique    int                 null,
constraint pk_statistiquejoueur primary key (idstatistique, idjoueur)
);

/*==============================================================*/
/* table: stockproduit                                          */
/*==============================================================*/
create table stockproduit (
idvariantecouleurproduit            int                 not null,
idtailleproduit                     int                 not null,
stock                               int                 null,
constraint pk_stockproduit primary key (idvariantecouleurproduit, idtailleproduit)
);

/*==============================================================*/
/* table: tailleproduit                                         */
/*==============================================================*/
create table tailleproduit (
idtailleproduit      int not null auto_increment,
nomtailleproduit     varchar(50)          null,
constraint pk_tailleproduit primary key (idtailleproduit)
);

/*==============================================================*/
/* table: themevote                                             */
/*==============================================================*/
create table themevote (
idthemevote          int not null auto_increment,
titrethemevote       varchar(100)         null,
constraint pk_themevote primary key (idthemevote)
);

/*==============================================================*/
/* table: themevotecontientjoueur                               */
/*==============================================================*/
create table themevotecontientjoueur (
idthemevote          int                 not null,
idjoueur             int                 not null,
constraint pk_themevotecontientjoueur primary key (idthemevote, idjoueur)
);

/*==============================================================*/
/* table: trophee                                               */
/*==============================================================*/
create table trophee (
idtrophee            int not null auto_increment,
nomtrophee           varchar(100)         null,
constraint pk_trophee primary key (idtrophee)
);

/*==============================================================*/
/* table: typelivraison                                         */
/*==============================================================*/
create table typelivraison (
idtypelivraison      int not null auto_increment,
nomlivraison         varchar(50)          not null,
maxbusinessdays      integer              null,
prixlivraison        numeric(10,2)        null,
constraint pk_typelivraison primary key (idtypelivraison)
);

/*==============================================================*/
/* table: utilisateur                                           */
/*==============================================================*/
create table utilisateur (
idutilisateur        int not null auto_increment,
idlangue             int                 not null,
idpays               int                 not null,
idpaysfavori         int                 not null,
stripeid             varchar(100)         null,
phoneutilisateur     varchar(50)          null,
prenomutilisateur    varchar(100)         null,
mailutilisateur      varchar(100)         null,
surnomutilisateur    varchar(100)         null,
datenaissance        date                 null,
motpasse             varchar(200)         null,
roleutilisateur      varchar(50)          null,
emailverified        timestamp            null, 
constraint pk_utilisateur primary key (idutilisateur),

constraint uq_utilisateur_stripeid unique(stripeid),
constraint uq_utilisateur_mailutilisateur unique (mailutilisateur),
constraint uq_utilisateur_surnomutilisateur unique (surnomutilisateur)
);

/*==============================================================*/
/* table: utilisateurvote                                       */
/*==============================================================*/
create table utilisateurvote (
idutilisateur        int                 not null,
idthemevote          int                 not null,
idjoueur             int                 not null,
rankvote             int                 null,
constraint pk_utilisateurvote primary key (idutilisateur, idthemevote, idjoueur)
);

/*==============================================================*/
/* table: variantecouleurproduit                                */
/*==============================================================*/
create table variantecouleurproduit (
idvariantecouleurproduit    int not null auto_increment,
idproduit                   int                 not null,
idcouleur                   int                 not null,
prix                        numeric(10,2)        null,
constraint pk_variantecouleurproduit primary key (idvariantecouleurproduit)
);

/*==============================================================*/
/* table: video                                                 */
/*==============================================================*/
create table video (
idvideo              int not null auto_increment,
nomvideo             varchar(500)         null,
urlvideo             varchar(500)         null,
constraint pk_video primary key (idvideo)
);

/*==============================================================*/
/* table: visiteproduit                                         */
/*==============================================================*/
create table visiteproduit (
idproduit            int                 not null,
idutilisateur        int                 not null,
constraint pk_visiteproduit primary key (idproduit, idutilisateur)
);

alter table album
add constraint fk_album_imagecouv_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table albumcontientphoto
add constraint fk_albumcon_albumcont_album foreign key (idpublication)
references album (idpublication)
on delete restrict on update restrict;

alter table albumcontientphoto
add constraint fk_albumcon_albumcont_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table article
add constraint fk_article_imagecouv_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table articleassociejoueur
add constraint fk_articlea_articleas_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table articleassociejoueur
add constraint fk_articlea_articleas_article foreign key (idpublication)
references article (idpublication)
on delete restrict on update restrict;

alter table articlecontientphoto
add constraint fk_articlec_articleco_article_photo foreign key (idpublication)
references article (idpublication)
on delete restrict on update restrict;

alter table articlecontientphoto
add constraint fk_articlec_articleco_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table articlecontientvideo
add constraint fk_articlec_articleco_article_video foreign key (idpublication)
references article (idpublication)
on delete restrict on update restrict;

alter table articlecontientvideo
add constraint fk_articlec_articleco_video foreign key (idvideo)
references video (idvideo)
on delete restrict on update restrict;

alter table associationproduit
add constraint fk_associat_associati_produit2 foreign key (idautreproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table associationproduit
add constraint fk_associat_associati_produit foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table blog
add constraint fk_blog_imagecouv_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table blogcontientphoto
add constraint fk_blogcont_blogconti_blog foreign key (idpublication)
references blog (idpublication)
on delete restrict on update restrict;

alter table blogcontientphoto
add constraint fk_blogcont_blogconti_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table souscategorieproduit
add constraint fk_souscategorieproduit_idcategorie foreign key (idcategorieproduit)
references categorieproduit (idcategorieproduit)
on delete restrict on update restrict;

alter table souscategorieproduit
add constraint fk_souscategorieproduit_idautrecategorie foreign key (idautrecategorieproduit)
references categorieproduit (idcategorieproduit)
on delete restrict on update restrict;

alter table categoriecontientproduit
add constraint fk_categoriecontientproduit_idproduit foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table categoriecontientproduit
add constraint fk_categoriecontientproduit_idcategorie foreign key (idcategorieproduit)
references categorieproduit (idcategorieproduit)
on delete restrict on update restrict;

alter table commande
add constraint fk_commande_associati_utilisateur foreign key (idutilisateur)
references utilisateur (idutilisateur)
on delete restrict on update restrict;

alter table commande
add constraint fk_commande_livraison_typelivr foreign key (idtypelivraison)
references typelivraison (idtypelivraison)
on delete restrict on update restrict;

alter table commentaire
add constraint fk_commenta_comentair_utilisat foreign key (idutilisateur)
references utilisateur (idutilisateur)
on delete restrict on update restrict;

alter table commentaire
add constraint fk_commenta_commente_blog foreign key (idpublication)
references blog (idpublication)
on delete restrict on update restrict;

alter table document
add constraint fk_document_imagecouv_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table joueur
add constraint fk_joueur_clubjoueu_club foreign key (idclub)
references club (idclub)
on delete restrict on update restrict;

alter table joueur
add constraint fk_joueur_paysnaiss_pays foreign key (idpays)
references pays (idpays)
on delete restrict on update restrict;

alter table joueurcontienttrophee
add constraint fk_joueurco_joueurcon_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table joueurcontienttrophee
add constraint fk_joueurco_joueurcon_trophee foreign key (idtrophee)
references trophee (idtrophee)
on delete restrict on update restrict;

alter table lignecommande
add constraint fk_lignecom_lignecomm_taillepr foreign key (idtailleproduit)
references tailleproduit (idtailleproduit)
on delete restrict on update restrict;

alter table lignecommande
add constraint fk_lignecom_lignecomm_commande foreign key (idcommande)
references commande (idcommande)
on delete restrict on update restrict;

alter table lignecommande
add constraint fk_lignecom_lignecomm_variante foreign key (idvariantecouleurproduit)
references variantecouleurproduit (idvariantecouleurproduit)
on delete restrict on update restrict;

alter table photocontientjoueur
add constraint fk_photocon_photocont_photo foreign key (idphoto)
references photo (idphoto)
on delete restrict on update restrict;

alter table photocontientjoueur
add constraint fk_photocon_photocont_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table prodemandeproduit
add constraint fk_prodeman_prodemand_produit foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table prodemandeproduit
add constraint fk_prodeman_prodemand_professi foreign key (idutilisateur)
references professionnel (idutilisateur)
on delete restrict on update restrict;

alter table produit
add constraint fk_produit_associati_competit foreign key (idcompetition)
references competition (idcompetition)
on delete restrict on update restrict;

alter table produit
add constraint fk_produit_associati_nation foreign key (idnation)
references nation (idnation)
on delete restrict on update restrict;

alter table produit
add constraint fk_produit_associati_genre foreign key (idgenreproduit)
references genre (idgenreproduit)
on delete restrict on update restrict;

alter table produitcontientcouleur
add constraint fk_produitc_produitco_produit_couleur foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table produitcontientcouleur
add constraint fk_produitc_produitco_couleur foreign key (idcouleur)
references couleur (idcouleur)
on delete restrict on update restrict;

alter table produitcontientimage
add constraint fk_produitc_produitco_imagepro foreign key (idimageproduit)
references imageproduit (idimageproduit)
on delete restrict on update restrict;

alter table produitcontientimage
add constraint fk_produitc_produitco_variante foreign key (idvariantecouleurproduit)
references variantecouleurproduit (idvariantecouleurproduit)
on delete restrict on update restrict;

alter table produitcontienttaille
add constraint fk_produitc_produitco_produit_taille foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table produitcontienttaille
add constraint fk_produitc_produitco_taillepr foreign key (idtailleproduit)
references tailleproduit (idtailleproduit)
on delete restrict on update restrict;

alter table professionnel
add constraint fk_professi_inheritan_utilisat foreign key (idutilisateur)
references utilisateur (idutilisateur)
on delete restrict on update restrict;

alter table reponsecommentaire
add constraint fk_reponsec_reponseco_commenta2 foreign key (idcommentairereponse)
references commentaire (idcommentaire)
on delete restrict on update restrict;

alter table reponsecommentaire
add constraint fk_reponsec_reponseco_commenta foreign key (idcommentaire)
references commentaire (idcommentaire)
on delete restrict on update restrict;

alter table statistiquejoueur
add constraint fk_statisti_statistiq_statisti foreign key (idstatistique)
references statistique (idstatistique)
on delete restrict on update restrict;

alter table statistiquejoueur
add constraint fk_statisti_statistiq_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table stockproduit
add constraint fk_stockpro_stockprod_variante foreign key (idvariantecouleurproduit)
references variantecouleurproduit (idvariantecouleurproduit)
on delete restrict on update restrict;

alter table stockproduit
add constraint fk_stockpro_stockprod_taillepr foreign key (idtailleproduit)
references tailleproduit (idtailleproduit)
on delete restrict on update restrict;

alter table themevotecontientjoueur
add constraint fk_themevot_themevote_themevot foreign key (idthemevote)
references themevote (idthemevote)
on delete restrict on update restrict;

alter table themevotecontientjoueur
add constraint fk_themevot_themevote_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table utilisateur
add constraint fk_utilisat_associati_langue foreign key (idlangue)
references langue (idlangue)
on delete restrict on update restrict;

alter table utilisateur
add constraint fk_utilisat_paysnaiss_pays foreign key (idpays)
references pays (idpays)
on delete restrict on update restrict;

alter table utilisateur
add constraint fk_utilisat_supporte_pays foreign key (idpaysfavori)
references pays (idpays)
on delete restrict on update restrict;

alter table utilisateurvote
add constraint fk_utilisat_utilisate_utilisat foreign key (idutilisateur)
references utilisateur (idutilisateur)
on delete restrict on update restrict;

alter table utilisateurvote
add constraint fk_utilisat_utilisate_themevot foreign key (idthemevote)
references themevote (idthemevote)
on delete restrict on update restrict;

alter table utilisateurvote
add constraint fk_utilisat_utilisate_joueur foreign key (idjoueur)
references joueur (idjoueur)
on delete restrict on update restrict;

alter table variantecouleurproduit
add constraint fk_variante_associati_couleur foreign key (idcouleur)
references couleur (idcouleur)
on delete restrict on update restrict;

alter table variantecouleurproduit
add constraint fk_variante_variantec_produit foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table visiteproduit
add constraint fk_visitepr_visitepro_produit foreign key (idproduit)
references produit (idproduit)
on delete restrict on update restrict;

alter table visiteproduit
add constraint fk_visitepr_visitepro_utilisat foreign key (idutilisateur)
references utilisateur (idutilisateur)
on delete restrict on update restrict;

insert into photo values (1, 'Pogba Coupe Du Monde', 'https://digitalhub.com/m/563dd966872c39fd/webimage-ftxcqmz4o9wksqmi2coc-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (2, 'suarez Enter', 'https://digitalhub.com/m/2b83f902d066e024/webimage-jekwnrm6pjooawb5qlf3-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (3, 'LionelMessi', 'https://digitalhub.com/transform/35bbdbd0-d9e8-4c67-ba33-eccfec8fdaee/Lionel-Messi-in-action-against-Paraguays-Angel-Cardozo-during-a-match-for-the-third-day-of-the-South-American-qualifiers-for-the-Qatar-2022-World-Cup?io=transform:fill,width:2048&quality=100');
insert into photo values (4, 'LlorisGardien', 'https://digitalhub.com/m/7712cf8dabe73028/webimage-h2fu3hvrxrdbyaugirax-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (5, 'Haalandchiffre', 'https://digitalhub.com/m/687479cef923119d/webimage-u7e4ytv8hsi1jpjwp4ft-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (6, 'London england match 27', 'https://digitalhub.com/transform/cf7d4c56-3eb7-42f6-827f-ee399a787764/LONDON-ENGLAND-MARCH-27-Harry-Kane-of-England-replaces-Wayne-Rooney-of-England-during-the-EURO-2016-Qualifier-between-England-and-Lithuania-at-Wembley-Stadium-on-March-27-2015-in-London-England-Photo-by-Michael-Regan-The-FA-The-FA-via-Getty-Images?io=transform:fill,width:2048&quality=100');
insert into photo values (7, 'Kane Harry', 'https://digitalhub.com/m/7621e26e71cc0b91/webimage-x21ugpzobr0p4p6himil-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (8, 'RyadHakimi', 'https://digitalhub.com/transform/0643d6ba-54c6-4e70-9a5c-06121bd14609/Canada-v-Morocco-Group-F-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (9, 'Cavani', 'https://digitalhub.com/m/18c8c1790cf7c3d3/webimage-rwozkvedradwfol1hfah-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (10, 'MohamedSalah', 'https://digitalhub.com/transform/42cff4ee-a0e6-47a2-bde2-237d286ecad6/Mohamed-Salah-of-Liverpool-celebrates-with-teammate-Trent-Alexander-Arnold-L-after-scoring-their-side-s-third-goal-during-the-Premier-League-match-between-Norwich-City-and-Liverpool-at-Carrow-Road-on-August-14-2021?io=transform:fill,width:2048&quality=100');
insert into photo values (11, 'Ronaldo Portugal Real Madrid', 'https://digitalhub.com/m/791d9debb9bccb60/webimage-zqfwb8fcczmdbbybdyis-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (12, 'Belga-Belgium', 'https://digitalhub.com/m/43bbf8897af29b0/webimage-IMAGO-Belga-Belgium-s-Kevin-De-Bruyne-and-Belgium-s-head-coach-Roberto-Martinez-pictured-at-the-start-of-a-training-session-of-Belgian-national-soccer-team-the-Red-Devils-in-Sochi-Russia-Saturday-16-June-2018-The-team-is-preparing-for-their-first-game-at-the-FIFA-World-Cup-WM-Weltmeisterschaft-Fussball-2018-next-Monday.png?tx=c_fill,x_2000,y_1333,g_xy_center,q_auto:best,w_2048');
insert into photo values (13, 'CoupeDuMonde', 'https://digitalhub.com/transform/f352866f-d41c-47f6-b169-5e0cb729ce8b/Argentina-v-France-Final-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (14, 'MessiCoupe', 'https://digitalhub.com/transform/4fa6fce7-9a36-4eb1-b267-5e5f0055dab6/Argentina-v-France-Final-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (15, 'Argentiva vs France', 'https://digitalhub.com/transform/00da6bdf-b086-4b9b-bd15-bd7611cbd9ce/Argentina-v-France-Final-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (16, 'SerbiavsSwiss', 'https://digitalhub.com/transform/2bddcb19-c9de-4ae4-842d-1455adede492/Serbia-v-Switzerland-Group-G-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (17, 'Serbia ', 'https://digitalhub.com/transform/0780bed2-b6d4-4c0e-9905-499b82fed901/Serbia-v-Switzerland-Group-G-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (18, 'Fifa final QATAR 2022', 'https://digitalhub.com/transform/ec028616-b305-4934-b42b-68fb7c11f1b8/Serbia-v-Switzerland-Group-G-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (19, 'South Korea QATAR 2022', 'https://digitalhub.com/transform/dfec3d28-8261-4097-a785-5b0ced45c8b2/Korea-Republic-v-Portugal-Group-H-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (20, 'Qatar v Ecuador GroupA', 'https://digitalhub.com/transform/eb9ff872-d30c-47c8-a31d-baa059281c9b/Qatar-v-Ecuador-Group-A-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (21, 'Qatar vs Ecuador', 'https://digitalhub.com/transform/dc8b61f9-9e1e-472a-be62-a172211ef9c8/Qatar-v-Ecuador-Group-A-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (22, 'Ecuador', 'https://digitalhub.com/transform/559f6876-8abe-48fc-a87e-a5347515e4e6/Qatar-v-Ecuador-Group-A-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (23, 'Qatar 2022', 'https://digitalhub.com/transform/0ef7f56b-b0e9-40cf-8f7e-6016430ac577/Qatar-v-Ecuador-Group-A-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (24, 'Portugal vs Swizerland', 'https://digitalhub.com/transform/4247d3cd-5dfd-4460-9838-50296076846b/Portugal-v-Switzerland-Round-of-16-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (25, 'Portugal fans QATAR 2022', 'https://digitalhub.com/transform/62152469-3eed-46de-b58f-78e37226f6db/Portugal-v-Switzerland-Round-of-16-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (26, 'Morocco vs Spain', 'https://digitalhub.com/transform/82bf1ea8-8a6b-49e9-b125-6b37147809d3/Morocco-v-Spain-Round-of-16-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (27, 'Morocco fans QATAR 2022', 'https://digitalhub.com/transform/140ba9ff-9691-4267-b251-46754e55a914/Morocco-v-Spain-Round-of-16-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (28, 'Portugal v Ghana ', 'https://digitalhub.com/transform/e1ffc9cf-4589-4892-abc0-bd5c0ea6200e/Portugal-v-Ghana-Group-H-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (29, 'Portugal v Ghana QATAR 2022', 'https://digitalhub.com/transform/b82925e3-7712-4809-bea1-3a4cc0507be0/Portugal-v-Ghana-Group-H-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (30, 'Uruguay v Korea', 'https://digitalhub.com/transform/6c6bb2fe-c575-4357-8467-2f181410d175/Uruguay-v-Korea-Republic-Group-H-FIFA-World-Cup-Qatar-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (31, 'LONDON-ENGLAND-SEPTEMBER-05-Harry-Kane', 'https://digitalhub.com/transform/222bc3d6-81d4-48e3-99cf-48fffd5ba47c/LONDON-ENGLAND-SEPTEMBER-05-Harry-Kane-of-England-celebrates-after-during-the-2022-FIFA-World-Cup-Qualifier-match-between-England-and-Andorra-at-Wembley-Stadium-on-September-05-2021-in-London-England-Photo-by-Ryan-Pierse-The-FA-The-FA-via-Getty-Images?io=transform:fill,width:2048&quality=100');
insert into photo values (32, 'Lloris France', 'https://digitalhub.com/transform/96d947ef-bc6e-4bb3-87b4-7aac9ab325ac/Thierry-Henry-Frankreich-spielt-den-Ball-im-Spiel-gegen-Irland-mit-der-Hand-und-kann-somit-erst-de?io=transform:fill,width:2048&quality=100');
insert into photo values (33, 'Morocco Ent', 'https://digitalhub.com/transform/4046cea3-0842-4e51-8238-028af9c573fa/Riyad-Mahrez-of-Algeria-during-the-2022-World-Cup-Qualifier-football-match-between-Djibouti-and-Algeria?io=transform:fill,width:2048&quality=100');
insert into photo values (34, 'Haaland', 'https://digitalhub.com/m/2863cd379a644386/webimage-kukzyichcksw43ckrvfi-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (35, 'Messi Barcelona', 'https://digitalhub.com/transform/77a64d7c-0734-4ea2-b64a-a11c13caf463/Lionel-Messi-of-FC-Barcelona-Barca-FC-Barcelona-v-Atletico-de-Madrid?io=transform:fill,width:2048&quality=100');
insert into photo values (36, 'Suarez-', 'https://digitalhub.com/m/5898739b07968880/webimage-chcfjrrcwbfbcnxbhlki-jpg.png?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (37, 'Ronaldo realmadrid', 'https://digitalhub.com/transform/6a808497-49c7-4257-8b39-eddaf88ad344/Cristiano-Ronaldo-Theodoros-Zagorakis-Portugal-Real-Madrid-Cf-Portugal-V-Greece-Dragao-Porto-Portugal-13-June-2004?io=transform:fill,width:2048&quality=100');
insert into photo values (38, 'Referee Seminar 1', 'https://digitalhub.com/transform/4941fc45-853c-45b3-a682-082122fee2ca/Referees-Seminar-at-CONMEBOL-Getty-Images-For-FIFA?io=transform:fill,width:2048&quality=100');
insert into photo values (39, 'Referee Seminar 2', 'https://digitalhub.com/transform/8ee820c5-8437-4853-8347-831a1fb0320d/FIFA-World-Cup-Qatar-2022-Referee-Seminar?io=transform:fill,width:2048&quality=100');
insert into photo values (40, 'Referee Seminar 3', 'https://digitalhub.com/transform/531ddbf7-a8c3-4695-af4b-207d6a88ab45/Referees-Seminar-at-CONMEBOL-Getty-Images-For-FIFA?io=transform:fill,width:2048&quality=100');
insert into photo values (41, 'Referee Seminar 4', 'https://digitalhub.com/transform/586d1a70-3e06-4703-bb29-2b299084cc06/Referees-Seminar-at-CONMEBOL-Getty-Images-For-FIFA?io=transform:fill,width:2048&quality=100');
insert into photo values (42, 'Referee Seminar 5', 'https://digitalhub.com/transform/8e15274e-892e-42df-9e22-6a582bfc2cde/Referees-Seminar-at-CONMEBOL-Getty-Images-For-FIFA?io=transform:fill,width:2048&quality=100');
insert into photo values (43, 'Referee Seminar 6', 'https://digitalhub.com/transform/a4ac9e6b-4ed6-4359-a18a-fd981bcfa641/FWC22-Referees-Seminar-in-Doha?io=transform:fill,width:2048&quality=100');
insert into photo values (44, 'Referee Seminar 7', 'https://digitalhub.com/transform/38b22917-00b1-4af6-a343-c4854122f8a0/FIFA-World-Cup-Qatar-2022-Referee-Seminar?io=transform:fill,width:2048&quality=100');
insert into photo values (45, 'Referee Seminar 8', 'https://digitalhub.com/transform/03c3c733-42d5-481c-ac58-9aa8019caf78/FIFA-World-Cup-Qatar-2022-Referee-Seminar?io=transform:fill,width:2048&quality=100');
insert into photo values (46, 'England Opening Session 1', 'https://digitalhub.com/transform/91080cf1-0ba6-4f49-9ba2-98cbdecaaf01/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023?io=transform:fill,width:2048&quality=100');
insert into photo values (47, 'England Opening Session 2', 'https://digitalhub.com/transform/6d588ab3-cbd9-4b7e-b793-54a7ee80417d/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023?io=transform:fill,width:2048&quality=100');
insert into photo values (48, 'England Opening Session 3', 'https://digitalhub.com/m/538ecde4ce210b5e/original/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (49, 'England Opening Session 4', 'https://digitalhub.com/transform/bf156f76-e836-4a80-83fa-bffb552aebc0/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023?io=transform:fill,width:2048&quality=100');
insert into photo values (50, 'England Opening Session 5', 'https://digitalhub.com/transform/6efc7827-de20-466d-94f3-aed3fd26e7e0/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023?io=transform:fill,width:2048&quality=100');
insert into photo values (51, 'England Opening Session 6', 'https://digitalhub.com/transform/5e19b33f-8cdf-4a67-853a-332914343163/England-Open-Training-Session-FIFA-Women-s-World-Cup-Australia-New-Zealand-2023?io=transform:fill,width:2048&quality=100');
insert into photo values (52, 'FIFA U17 Indonesia 1', 'https://digitalhub.com/transform/3f0e209e-c364-43b1-94b1-d6244d3397f4/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (53, 'FIFA U17 Indonesia 2', 'https://digitalhub.com/transform/3f7f4847-426c-4c3f-9d37-2d8930c680ba/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (54, 'FIFA U17 Indonesia 3', 'https://digitalhub.com/transform/cb7fb1e4-9d5a-422f-a83f-dda6d9079abe/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (55, 'FIFA U17 Indonesia 4', 'https://digitalhub.com/transform/9468d2ee-b820-4337-8411-2a8b91c29e4d/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (56, 'FIFA U17 Indonesia 5', 'https://digitalhub.com/transform/0ddd1647-0f15-406c-9cd1-6d2b7a6745d4/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (57, 'FIFA U17 Indonesia 6', 'https://digitalhub.com/transform/c65eb40c-271e-4fa3-ad1b-9c6dd3b7ecb6/FIFA-U-17-World-Cup-2023-Indonesia-Final-Draw?io=transform:fill,width:2048&quality=100');
insert into photo values (58, 'Danemark-Allemagne Femminine 1', 'https://digitalhub.com/m/26da298b49de5422/original/aoeynjf7iwlv2mzcnwtm-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (59, 'Danemark-Allemagne Femminine 2', 'https://digitalhub.com/m/5a4af64bd4a8e6e3/original/mbhkswt0rzxzo5jqlzvw-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (60, 'Danemark-Allemagne Femminine 3', 'https://digitalhub.com/m/4a5d269feb39ad08/original/aevf3u21cxwslxyvfyi2-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (61, 'Danemark-Allemagne Femminine 4', 'https://digitalhub.com/m/e82211a7963a2bb/original/j2mjtwmlzktz1irwwfzf-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (62, 'Danemark-Allemagne Femminine 5', 'https://digitalhub.com/m/1bb0e6c836f97ef5/original/elhkozzaubzwbzob9wd6-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (63, 'Danemark-Allemagne Femminine 6', 'https://digitalhub.com/m/771f7f8d48bb56a0/original/w3dziesovoe5o6b31cqa-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (64, 'Danemark-Allemagne Femminine 7', 'https://digitalhub.com/m/642dffb885d20d46/original/nbazqiczobfjoiggupia-jpg.jpg?tx=c_fill,g_auto,q_auto:best,w_2048');
insert into photo values (65, 'Groupe Phase African school 1', 'https://digitalhub.com/transform/e1e4b509-04e7-44c5-b502-bbb5bbf753be/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (66, 'Groupe Phase African school 2', 'https://digitalhub.com/transform/3b8fe637-434c-456f-9865-18e54344e836/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (67, 'Groupe Phase African school 3', 'https://digitalhub.com/transform/355b02e7-9578-4810-afd7-39e77ab5f036/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (68, 'Groupe Phase African school 4', 'https://digitalhub.com/transform/e800b6c5-73e4-4caf-9e66-bd4ddc69c591/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (69, 'Groupe Phase African school 5', 'https://digitalhub.com/transform/3737b086-af60-4793-b8e5-fd2fb279ba09/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (70, 'Groupe Phase African school 6', 'https://digitalhub.com/transform/45cbe355-8e0e-46ac-aff2-171ca1a732e5/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');
insert into photo values (71, 'Groupe Phase African school 7', 'https://digitalhub.com/transform/6509eabd-baf5-44b1-8e33-5ff78b569092/Group-Phase-African-School-Champions-Cup-2022?io=transform:fill,width:2048&quality=100');


--
-- TOC entry 3986 (class 0 OID 1213397)
-- Dependencies: 207
-- Data for Name: album; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into album values (1, 38, 'Séminaires de formation des arbitres de la Coupe du Monde de la FIFA 2022 à Madrid, Doha et Asuncion', 'Séminaires de formation des arbitres de la Coupe du Monde de la FIFA 2022 à Madrid, Doha et Asuncion', '2022-08-05');
insert into album values (2, 46, 'Entraînement de l''Angleterre - Coupe du Monde Féminine de la FIFA 2023', NULL, '2023-07-25');
insert into album values (3, 52, 'Tirage au sort de la Coupe du Monde U-17 de la FIFA, au Siège de la FIFA', NULL, '2023-09-13');
insert into album values (4, 58, 'EURO 2017 : Allemagne - Danemark', NULL, '2017-07-30');
insert into album values (5, 65, 'Journée d''ouverture de la Coupe d’Afrique des Écoles Championnes à Kinshasa', 'La première Coupe d’Afrique des Écoles Championnes a débuté en beauté à Kinshasa avec la participation des équipes représentant six associations membres', '2022-02-19');


--
-- TOC entry 3987 (class 0 OID 1213406)
-- Dependencies: 208
-- Data for Name: albumcontientphoto; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into albumcontientphoto values (1, 38);
insert into albumcontientphoto values (1, 39);
insert into albumcontientphoto values (1, 40);
insert into albumcontientphoto values (1, 41);
insert into albumcontientphoto values (1, 42);
insert into albumcontientphoto values (1, 43);
insert into albumcontientphoto values (1, 44);
insert into albumcontientphoto values (1, 45);
insert into albumcontientphoto values (2, 46);
insert into albumcontientphoto values (2, 47);
insert into albumcontientphoto values (2, 48);
insert into albumcontientphoto values (2, 49);
insert into albumcontientphoto values (2, 50);
insert into albumcontientphoto values (2, 51);
insert into albumcontientphoto values (3, 52);
insert into albumcontientphoto values (3, 53);
insert into albumcontientphoto values (3, 54);
insert into albumcontientphoto values (3, 55);
insert into albumcontientphoto values (3, 56);
insert into albumcontientphoto values (3, 57);
insert into albumcontientphoto values (4, 58);
insert into albumcontientphoto values (4, 59);
insert into albumcontientphoto values (4, 60);
insert into albumcontientphoto values (4, 61);
insert into albumcontientphoto values (4, 62);
insert into albumcontientphoto values (4, 63);
insert into albumcontientphoto values (4, 64);
insert into albumcontientphoto values (5, 65);
insert into albumcontientphoto values (5, 66);
insert into albumcontientphoto values (5, 67);
insert into albumcontientphoto values (5, 68);
insert into albumcontientphoto values (5, 69);
insert into albumcontientphoto values (5, 70);
insert into albumcontientphoto values (5, 71);


--
-- TOC entry 3989 (class 0 OID 1213413)
-- Dependencies: 210
-- Data for Name: article; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into article values (1, 6, 'Record en vue pour Kane au Qatar', 'vendredi 08 avril 2022, 08:00 Record en vue pour Kane au Qatar Harry Kane a remporté le Soulier d’or adidas de Russie 2018
 L’international anglais est le favori des  bookmakers  à sa propre succession
 ', '2022-04-08', 'Harry Kane a remporté le Soulier d’or adidas de Russie 2018
L’international anglais est le favori des bookmakers à sa propre succession
L’attaquant de Tottenham pourrait devenir le meilleur buteur de l’histoire des Trois Lions
Harry Kane a déjà marqué la Coupe du Monde de la FIFA™ de son empreinte. Auteur de six réalisations tout au long de Russie 2018, le capitaine anglais s’est adjugé le Soulier d’or adidas, intégrant ainsi un cercle prestigieux dans lequel l’attendaient déjà Ronaldo, Gerd Müller ou encore Eusébio.

À 28 ans, l’attaquant de Tottenham Hotspur est considéré comme une légende vivante dans son pays. Collectionneur de records, il détient celui du nombre de buts en matches de compétition avec les Trois Lions. Plus généralement, ses statistiques personnelles (49 buts en 69 sélections) n’ont rien à envier à celles des plus fines gâchettes de sa génération. Ses records en équipe d’Angleterre
Meilleur buteur en matches de compétition (43)
Meilleur buteur dans des grands tournois (10 – un record qu''il partage avec Gary Lineker)
Meilleur buteur sur une année civile (12 – un record qu’il partage avec George Hilsdon et Dixie Dean)
En réussite depuis quelques semaines sous le maillot des Spurs, Kane fait beaucoup parler de lui, au point que certains se demandent si d’autres records ne pourraient pas tomber dans son escarcelle, d’ici la fin de l’année. 

On l’imagine, par exemple, capable de terminer meilleur buteur de la Coupe du Monde lors de deux éditions différentes, un exploit que personne n’a encore jamais réalisé. Les bookmakers font en tout cas de lui le favori de Qatar 2022. De fait, ses douze buts en huit matches dans les qualifications européennes (un toutes les 49 minutes) donnent certainement du poids à sa candidature.');
insert into article values (2, 7, 'L''Angleterre avance en s''appuyant sur Kane', 'dimanche 24 juin 2018,  L''Angleterre avance en s''appuyant sur Kane ​Harry Kane a battu plusieurs records pour l''Angleterre contre le Panama Impossible de lui prendre le ballon des mains après le match ', '2018-06-24', 'Harry Kane a battu plusieurs records pour l''Angleterre contre le Panama
Impossible de lui prendre le ballon des mains après le match
Kane s''est dit fier de sa prestation de celle de l''Angleterre
De notre reporter d''équipe avec l''Angleterre, Laure James

Quelle journée pour Harry Kane ! L''attaquant de 24 ans est devenu le deuxième joueur de l''Angleterre à faire trembler les filets lors de ses deux premiers matches de Coupe du Monde de la FIFA™ et le troisième à inscrire un triplé dans cette compétition, après Geoff Hurst et Gary Lineker.

Kane a, par la même occasion, pris la tête du classement des buteurs avec cinq réalisations en deux matches, autant que Thomas Müller, Soulier d''Or adidas lors d''Afrique du Sud 2010. Il passe donc devant Romelu Lukaku et Cristiano Ronaldo dans la folle course aux buts lancée en Russie. Mais il a surtout aidé l''Angleterre à décrocher sa plus large victoire (6-1) en Coupe du Monde et à prendre la tête du Groupe G. Pourtant, Kane continue de jouer la carte de la modestie.
');
insert into article values (3, 10, 'Les finalistes à la loupe : Mohamed Salah', 'mercredi 12 janvier 2022, 08:00 Les finalistes à la loupe : Mohamed Salah français  - Autres langues (3) Mohamed Salah est l''un des finalistes du prix forts et les stats du buteur égyptien  "Au final, c''est le vote ', '2012-01-13', 'Mohamed Salah est l''un des finalistes du prix The Best – Joueur de la FIFA
L''attaquant de Liverpool brille en club et en sélection
Retour sur les temps forts et les stats du buteur égyptien 

"Au final, c''est le vote des gens qui l''emporte, mais dans ma tête, je suis le meilleur joueur du monde", confiait Mohamed Salah le mois dernier.

À l''instar des autres finalistes du prix The Best – Joueur de la FIFA, l''attaquant est étincelant à chacune de ses apparitions sur le terrain, a excellé au cours des années écoulées et s''est encore surpassé ces derniers mois.

À quelques jours des The Best FIFA Football Awards™ 2021, nous passons l''ailier égyptien de Liverpool au crible.  Le pilier des Reds
Après les campagnes couronnées par un sacre en Ligue des champions de l''UEFA et le premier titre en championnat en 30 ans, la saison blanche 2020/21 a déçu. Salah est cependant resté l''homme fort des Reds. Premier joueur de Liverpool à marquer plus de 20 buts en trois saisons de Premier League, il a pris rang de meilleur buteur du club en championnat et en Ligue des champions, avec deux fois plus de réalisations que son poursuivant le plus proche Sadio Mané (22 contre 11, et 6 contre 3 respectivement). ');
insert into article values (4, 9, 'Cavani mène la Celeste au paradis', 'dimanche 01 juillet 2018, 08:18 Cavani mène la Celeste au paradis Cavani a déjà marqué 3 fois en Russie Il offre à l''Uruguay la qualification pour les Cette soirée de Sotchi restera dans l''ensemble comme un ', '2018-06-18', 'Cavani a déjà marqué 3 fois en Russie
Il offre à l''Uruguay la qualification pour les quarts de finale
La Celeste jouera contre la France le vendredi 6 juillet
Quand il répond aux questions, sa voix est un peu étouffée : par l''émotion et le bonheur bien sûr, mais un peu aussi par l''inquiétude. Cette soirée de Sotchi restera dans l''ensemble comme un excellent souvenir pour Edinson Cavani. L''attaquant de l''Uruguay a réussi un doublé contre le Portugal, ce qui a permis à la Celeste de se qualifier pour les quarts de finale de Russie 2018.

"Je suis heureux de ce qui s''est passé. C''est excitant, il n''y a pas de mots pour décrire cela... Il faut continuer à rêver", dit-il en tentant de contenir son émotion, tout en écoutant les chants sans fin des fans uruguayens au Stade Fisht. Cavani a ouvert le score d''une tête imparable dans la lucarne de Rui Patricio, sur un centre parfait de son complice d''attaque Luis Suarez. Et lorsque le Portugal poussait après avoir égalisé, c''est encore lui qui a doublé la mise, d''une frappe enveloppée du pied droit qui n''a laissé aucune chance au portier lusitanien.

"C''est l''homme aux mille poumons", commente Lucas Torreira. "Il est partout sur le terrain et cela nous aide beaucoup. Il a un sens du sacrifice hors norme", poursuit le milieu de terrain au micro de la FIFA, alors que ses coéquipiers font la fête.

Mais le héros charrúa a dû quitter ses coéquipiers en cours de partie, sortant du terrain en boitant et avec l''aide de Cristiano Ronaldo. D''où les larmes, et l''angoisse, au coup de sifflet final.');
insert into article values (5, 4, 'Lloris : "Un gardien doit être joueur dans l''âme"', 'Lloris : "Un gardien doit être joueur dans l''âme" français  - Autres langues (2) Mercredi 6 avril 2016, 12:08 (heure locale) La France a changé plusieurs Hugo Lloris, lui, est toujours là. Hugo, qui vous a donné envie', '2016-04-06', 'La France a changé plusieurs fois de visage depuis la débâcle de la Coupe du Monde de la FIFA, Afrique du Sud 2010. Il y a eu Laurent Blanc puis Didier Deschamps sur le banc, mais surtout une multitude de changements, que ce soit en charnière centrale, dans l''entrejeu ou en attaque, au gré des performances, des suspensions, des blessures, des retraites internationales ou de l''éclosion de nouvelles têtes.

Hugo Lloris, lui, est toujours là. Capitaine des Bleus depuis novembre 2010, le gardien de 29 ans représente la continuité du renouveau tricolore, matérialisé par un quart de finale à Brésil 2014 mais qui se doit désormais de viser plus haut avec la tenue de l''UEFA EURO 2016 à domicile.

Le portier de Tottenham a consacré un long entretien à com où il évoque son poste, ses responsabilités et ses ambitions.

Hugo, qui vous a donné envie d''être gardien de but ?C''est marrant parce que c''est venu naturellement, sans avoir regardé de match à la télé ou en vrai. À la base, j''étais plutôt tennis et on jouait parfois sur un petit terrain à côté de mon club, avec deux chaises pour faire les buts. J''ai tout de suite été attiré par l''idée de garder les buts. C''est quand j''ai débuté le foot en club que j''ai commencé à vraiment m''intéresser aux gardiens, comme Peter Schmeichel, Fabien Barthez ou d''autres. J''étais attiré par le fait que ce soit un poste à responsabilités, qui me faisait me sentir différent. Ce n''était pas pour me distinguer mais plutôt pour servir à quelque chose et aider mon équipe.

Auriez-vous pu être joueur de champ ?La question s''est posée à un moment donné, vers sept ou huit ans, parce que j''avais envie de goûter à autre chose. J''ai commencé à être poussé vers l''avant, à jouer "goal volant". On jouait sur des petits terrains de foot à sept, et avec mon pied gauche je cherchais déjà à lober le gardien sur mes dégagements, je partais balle au pied. Du coup, j''ai testé le poste d''attaquant, et ça a été une très bonne expérience. Mais après, Dominique Baratelli de l''OGC Nice a insisté pour que je revienne dans le but au moment de signer pour le club. J''avais dix ans, et c''est là que les choses sérieuses ont commencé pour moi.

Quand avez-vous compris que vous pouviez devenir gardien professionnel ? J''ai toujours gardé une certaine ligne de conduite entre scolarité et football. Même si c''était dans un coin de ma tête, j''ai privilégié l''école jusqu''au bac. J''ai eu ma chance à l''OGC Nice dès 18 ans, d''abord en Coupe de la Ligue, puis en Coupe de France et en championnat. Tout a commencé très vite et très tôt pour moi, mais j''étais déjà assez mature et j''avais les idées bien précises.

Diriez-vous, comme Fabien Barthez, que le poste de gardien manque de reconnaissance ? Peut-être que c''était différent à son époque, mais je trouve que ce n''est plus le cas aujourd''hui, notamment grâce à Fabien qui a fait évoluer le poste parce qu''il était très joueur. Le football moderne est très exigeant pour le gardien parce que c''est le premier relanceur. C''est une responsabilité que je sens au quotidien avec Tottenham parce que nous avons un jeu qui se construit de derrière et qui évite de balancer des longs ballons. Ça me demande une vivacité dans les prises de décisions et les prises de risques. Aujourd''hui, un gardien doit être joueur dans l''âme. Les entraîneurs le demandent. On joue à 11, non pas à 10. Les gardiens participent au jeu.');
insert into article values (6, 8, 'Afrique : qualifications ou désillusions', 'Malgré un effectif de haut niveau éclairé par Achraf Hakimi et Yassine Bounou, les  Lions de l''Atlas  ne sont pas au sommet de leur forme, comme l’a montré', '2022-03-24', 'Les barrages de la zone Afrique débutent le 25 mars avec 10 équipes en lice
Cinq tickets qualificatifs sont en jeu
Au programme notamment les chocs Égypte-Sénégal et Cameroun-Algérie
Un mois et demi après la Coupe d’Afrique des Nations 2021, le continent africain va de nouveau vibrer à partir du 25 mars, avec les barrages de la Coupe du Monde de la FIFA 2022™. Dix équipes sont en lice pour le Qatar, et à l''issue d''une confrontation en matches aller-retour, il n''en restera que cinq. 

Dix rencontres qui s''annoncent palpitantes, avec notamment deux affiches au programme : Égypte-Sénégal, remake de la finale de la CAN 2021 remportée par les Lions de la Téranga, et Cameroun-Algérie. Tour d''horizon des enjeux et des forces en présence. Cameroun - Algérie, pour le Qatar et pour le rachat
Sur le podium de la CAN 2021 organisée à domicile, le Cameroun vise une huitième qualification à la Coupe du Monde. Fraîchement nommé, le sélectionneur des Lions Indomptables, Rigobert Song, aura fort à faire pour ses premiers pas. Face à lui, une Algérie blessée après son élimination surprise au premier tour de la CAN. Les Fennecs vont devoir se retrousser les manches s''ils veulent aller au Qatar et participer à la cinquième Coupe du Monde de leur histoire. Sous le feu des critiques, le sélectionneur Djamel Belmadi pourra toutefois s''appuyer sur Riyad Mahrez, actuellement en forme et auteur de 22 buts cette saison, toutes compétitions confondues, avec Manchester City.  ');
insert into article values (7, 5, 'Haaland, débuts et des buts', 'lundi 20 janvier 2020, 09:41 Haaland, débuts et des buts Erling Haaland signe un triplé pour ses débuts avec Dortmund Mené 3-1 à Augsbourg, le BVB fait La suite : Haaland a signé un triplé, et les  Jaune et Noir  ', '2020-01-20', 'Erling Haaland signe un triplé pour ses débuts avec Dortmund
Mené 3-1 à Augsbourg, le BVB fait entrer son nouvel attaquant et s’impose 5-3
Les supporters et les journalistes sont sous le charme
Ce 18 janvier, les supporters du Borussia Dortmund n’étaient pas les seuls à suivre avec intérêt le déplacement du BVB à Augsbourg. Les habitués de la Bundesliga et, plus généralement, les amateurs de football étaient curieux d’assister aux débuts d’Erling Haaland dans l’élite allemande.

Lucien Favre, son entraîneur a fait le choix de la patience : il a laissé le Norvégien de 19 ans sur le banc des remplaçants au coup d’envoi. Près d’une heure plus tard, les locaux menaient 3-1 et semblaient bien partis pour s''imposer. C’est dans ce contexte que Favre a décidé de lancer son attaquant, à la 56ème minute... La suite : Haaland a signé un triplé, et les Jaune et Noir ont gagné.

Les débuts d’Haaland en chiffres
Haaland porte le numéro 17, comme Pierre-Emerick Aubameyang avant lui. En août 2013, le Gabonais avait lui aussi signé un triplé pour ses débuts en Bundesliga, contre... Augsbourg !
À 19 ans, 5 mois et 28 jours, le Norvégien est le plus jeune joueur à réussir un triplé pour son introduction en championnat d''Allemagne.
Il ne lui a fallu que 23 minutes pour inscrire ses trois premiers buts. Le précédent record du triplé le plus rapide pour des débuts en Bundesliga, établi par Hermann Ohlicher en 1973 avec le VfB Stuttgart, était de 62 minutes.
Il est le premier remplaçant à réussir un triplé dès sa première apparition en Bundesliga.
Ses trois tirs cadrés ont tous fini au fond des filets.');
insert into article values (8, 3, 'Les finalistes à la loupe : Lionel Messi', 'dimanche 09 janvier 2022, 23:00 Les finalistes à la loupe : Lionel Messi français  - Autres langues (3) Lionel Messi figure pour la 14ème fois parmi les Toutefois, Messi ne serait plus vraiment Messi sans quelques ', '2022-01-10', 'Lionel Messi figure pour la 14ème fois parmi les finalistes pour le titre The Best – Joueur de la FIFA
En 2021, il a remporté la Copa América avec l''Argentine
Retour sur une saison riche en émotions pour l’attaquant de 34 ans
Lionel Messi n’oubliera sans doute pas de sitôt la saison 2020/21. Non content d’avoir offert à l''Argentine la victoire en Copa América, le joueur emblématique du FC Barcelone a créé la surprise en quittant la Catalogne pour rejoindre le Paris Saint-Germain. Toutefois, Messi ne serait plus vraiment Messi sans quelques records pour saupoudrer le tout. À quelques jours des The Best FIFA Football Awards™ 2021, nous revenons sur les temps forts qui ont rythmé l’année de l’Argentin.

Qualifications pour la Coupe du Monde de la FIFA, Qatar 2022™
Le 17 novembre 2021, l’Albiceleste a fait un pas décisif vers une 17ème participation à la phase finale de la Coupe du Monde de la FIFA™. Cette performance ne saurait toutefois faire oublier des débuts poussifs dans la compétition préliminaire sud-américaine. Lors des quatre premières journées, les Argentins ont souvent été à la peine, notamment face au Pérou. Malgré ces difficultés, Messi a tenu son rôle de capitaine. Il n’a pas manqué une minute de jeu et a été directement impliqué dans deux des neuf buts de son équipe. Son billet pour le Qatar en poche, Messi peut désormais envisager d''égaler prochainement un nouveau record, à savoir une cinquième participation à l’épreuve mondiale. Seuls Antonio Carbajal, Lothar Matthäus et Gianluigi Buffon ont déjà réalisé un tel exploit par le passé.');
insert into article values (9, 2, 'Suárez fait monter la Vinotinto en puissance', 'lundi 20 avril 2020, 03:04 Suárez fait monter la Vinotinto en puissance français  - Autres langues (3) Le Venezuela s’est qualifié pour sa première Coupe du Monde de Futsal de la FIFA Enderson Suárez se ', '2020-03-15', 'Le Venezuela s’est qualifié pour sa première Coupe du Monde de Futsal de la FIFA
Enderson Suárez se distingue depuis 2019 dans le championnat finlandais
Le pivot revient sur les qualifications et évoque sa vie en Europe
Enderson Suárez a le sourire. Avec ses coéquipiers, il a livré un rude combat pour qualifier le Venezuela pour sa première Coupe du Monde de Futsal de la FIFA et rien ne pourra leur retirer la satisfaction de cet accomplissement. Même si la pandémie de COVID-19 a mis en doute les dates de la compétition, qui se disputera en Lituanie, sa Vinotinto sera de la partie, quoi qu’il arrive.

"C’est une fierté énorme d’avoir gravi cette marche sur laquelle on butait", confie Suárez com depuis la Finlande, où il évolue au FC Kemi. "Il nous est arrivé de rester sur le bord du chemin, mais cette fois, ça a été différent. Ça nous procure une grande satisfaction."

Le Venezuela a pris la deuxième place de son groupe des qualifications sud-américaines derrière l’Argentine, ce qui lui a ouvert les portes du dernier carré, synonyme d’accession à l’épreuve mondiale. Pour le puissant pivot de 27 ans, qui a fêté son anniversaire le 9 avril en plein confinement à Kemi, c’est l’expérience apportée par les joueurs évoluant à l’étranger qui a fait la différence. "Il y a cinq ans, il n’y avait pratiquement pas de Vénézuéliens dans les championnats étrangers. Aujourd’hui, on en voit en Argentine, en Italie, en Finlande, en Colombie, en Uruguay… Cela procure un argument supplémentaire pour y croire, sachant que nous, les joueurs évoluant à l’étranger, avons rejoint le groupe 10 jours avant les qualifications", estime-t-il.');
insert into article values (10, 1, 'C’est la lutte finale pour Pogba', 'samedi 14 juillet 2018, 06:11 C’est la lutte finale pour Pogba Paul Pogba semble être arrivé à maturité et revenu à son meilleur niveau Il veut effacer la déception de la finale de l’UEFA EURO 2016 "Les joueurs ', '2018-07-14', 'Paul Pogba semble être arrivé à maturité et revenu à son meilleur niveau
Il veut effacer la déception de la finale de l’UEFA EURO 2016
"Les joueurs croates, c’est la classe mondiale", assure-t-il
C’est un Paul Pogba nouveau que le public français a découvert depuis le début de la Coupe du Monde de la FIFA, Russie 2018. Intraitable, appliqué, créatif, le milieu de terrain des Bleus est apparu mature mentalement et à son meilleur niveau footballistique. Mais pas question de se relâcher, surtout maintenant.

Piochy - comme l’appelle Antoine Griezmann -, a l’air grave quand il entre dans notre studio deux jours après avoir éliminé la Belgique. Pourtant, les Bleus sont qualifiés pour la finale. "Je suis vraiment heureux mais je ne veux pas encore être fier. Je veux attendre. Pour l’instant on n’a rien fait", lâche-t-il pour justifier sa mine sérieuse, lui d’ordinaire souriant et boute-en-train.

Un goût amer
La vie a appris au milieu français qu’une équipe sur deux repart effondrée chez elle après une finale : "Il y a eu la finale l’UEFA Europa League gagnée avec Manchester en 2017 (dont il a été élu meilleur joueur) mais sinon, je ne connais pas le goût de la victoire en finale. En Ligue des champions en 2015 et à l’UEFA EURO 2016, je n’ai connu que celui de la défaite...", regrette celui qui oublie au passage qu’il a remporté celle de la Coupe du Monde U-20 de la FIFA 2013, en étant élu meilleur joueur du tournoi.');
insert into article values (11, 11, 'Cristiano Ronaldo et le Portugal : une histoire de records', 'vendredi 18 mars 2022, 07:00 Cristiano Ronaldo et le Portugal : une histoire de records Désigné meilleur joueur du monde par la FIFA à cinq reprises, Ronaldo Depuis sa première cape avec le Portugal le 20 août ', '2022-03-18', 'Désigné meilleur joueur du monde par la FIFA à cinq reprises, Ronaldo est l''un des meilleurs attaquants de tous les temps
Il est le meilleur buteur de l''histoire des sélections nationales masculines avec 115 buts
En cas de qualification au Mondial 2022, il pourrait participer à son dixième grand tournoi international consécutif 
Du Real Madrid à Manchester United, en passant par la Juventus de Turin, Cristiano Ronaldo a battu des records dans tous les clubs où il est passé. Désormais meilleur buteur de l''histoire du football masculin avec 807 buts inscrits, le double vainqueur de The Best - Joueur de la FIFA est notamment le recordman du nombre de succès en finale de Ligue des champions de l''UEFA (5), et également le meilleur buteur de l''histoire de cette compétition (141 buts). 

Depuis sa première cape avec le Portugal le 20 août 2003, Ronaldo fait aussi exploser les compteurs en sélection nationale. À quelques jours du barrage face à la Turquie en qualifications pour la Coupe du Monde 2022, voici un tour d''horizon chiffré de ses exploits avec la Selecção das Quinas. ');
insert into article values (12, 12, 'Hazard, une âme de capitaine dans un esprit d''enfant', 'dimanche 01 juillet 2018, 09:05 Hazard, une âme de capitaine dans un esprit d''enfant Eden Hazard parle de son rôle de capitaine, assumé pas mas inné Hazard Si la capacité naturelle d''Eden Hazard à se fondre ', '2018-06-01', 'Eden Hazard parle de son rôle de capitaine, assumé pas mas inné
Hazard et toute son équipe insistent sur l''importance de s''amuser pour être performant
En huitième de finale, la Belgique affronte le Japon
La fonction fait-elle l''homme ou l''homme fait-il la fonction ? Si la capacité naturelle d''Eden Hazard à se fondre dans un groupe semble innée, il n''a jamais aspiré au brassard de capitaine de la Belgique que lui a confié Marc Wilmots en juin 2015, et qu''a confirmé Roberto Martinez a son arrivée en septembre 2016. Le milieu offensif avait cependant accepté la proposition avec un mélange de détachement et de sens des responsabilités, comme il prend les choses dans la vie.

"Il a n''a jamais aimé prendre la parole sur le terrain ou dans les vestiaires", confirme son petit frère Thorgan. "Ses pieds restent son mode d’expression favori, même si son nouveau rôle le pousse à aller encore plus vers le groupe." Le changement est notable, mais il a pris du temps à se dessiner. Hazard ne se contente plus d''apporter au groupe sa bonne humeur, ses blagues et son talent. Il cherche désormais à impliquer au mieux l''ensemble des Diables Rouges et à se faire entendre si le contexte l''impose. Une réalité plus marquée encore depuis le début de la Coupe du Monde de la FIFA, Russie 2018.');


--
-- TOC entry 4004 (class 0 OID 1213486)
-- Dependencies: 225
-- Data for Name: club; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into club values (1, 'Manchester United');
insert into club values (2, 'Paris Saint-Germain');
insert into club values (3, 'Real Madrid');
insert into club values (4, 'Manchester City');
insert into club values (5, 'Tottenham Hotspur');
insert into club values (6, 'Bayern Munich');
insert into club values (7, 'Atlético Madrid');
insert into club values (8, 'Liverpool');
insert into club values (9, 'Chelsea');
insert into club values (10, 'Manchester United');
insert into club values (11, 'Inter Milan');
insert into club values (12, 'Borussia Dortmund');
insert into club values (13, 'Juventus');
insert into club values (14, 'Napoli');


--
-- TOC entry 4029 (class 0 OID 1213603)
-- Dependencies: 250
-- Data for Name: pays; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into pays values (1, 'Afghanistan');
insert into pays values (2, 'Afrique du Sud');
insert into pays values (3, 'Albanie');
insert into pays values (4, 'Algérie');
insert into pays values (5, 'Allemagne');
insert into pays values (6, 'Andorre');
insert into pays values (7, 'Angola');
insert into pays values (8, 'Antigua-et-Barbuda');
insert into pays values (9, 'Arabie saoudite');
insert into pays values (10, 'Argentine');
insert into pays values (11, 'Arménie');
insert into pays values (12, 'Australie');
insert into pays values (13, 'Autriche');
insert into pays values (14, 'Azerbaïdjan');
insert into pays values (15, 'Bahamas');
insert into pays values (16, 'Bahreïn');
insert into pays values (17, 'Bangladesh');
insert into pays values (18, 'Barbade');
insert into pays values (19, 'Bélarus');
insert into pays values (20, 'Belgique');
insert into pays values (21, 'Belize');
insert into pays values (22, 'Bénin');
insert into pays values (23, 'Bhoutan');
insert into pays values (24, 'Bolivie');
insert into pays values (25, 'Bosnie-Herzégovine');
insert into pays values (26, 'Botswana');
insert into pays values (27, 'Brésil');
insert into pays values (28, 'Brunei');
insert into pays values (29, 'Bulgarie');
insert into pays values (30, 'Burkina Faso');
insert into pays values (31, 'Burundi');
insert into pays values (32, 'Cambodge');
insert into pays values (33, 'Cameroun');
insert into pays values (34, 'Canada');
insert into pays values (35, 'Cap-Vert');
insert into pays values (36, 'République centrafricaine');
insert into pays values (37, 'Chili');
insert into pays values (38, 'Chine');
insert into pays values (39, 'Chypre');
insert into pays values (40, 'Colombie');
insert into pays values (41, 'Comores');
insert into pays values (42, 'Congo (République du)');
insert into pays values (43, 'Corée du Nord');
insert into pays values (44, 'Corée du Sud');
insert into pays values (45, 'Costa Rica');
insert into pays values (46, 'Côte d''Ivoire');
insert into pays values (47, 'Croatie');
insert into pays values (48, 'Cuba');
insert into pays values (49, 'Danemark');
insert into pays values (50, 'Djibouti');
insert into pays values (51, 'Dominique');
insert into pays values (52, 'Égypte');
insert into pays values (53, 'Émirats arabes unis');
insert into pays values (54, 'Équateur');
insert into pays values (55, 'Érythrée');
insert into pays values (56, 'Espagne');
insert into pays values (57, 'Estonie');
insert into pays values (58, 'États-Unis');
insert into pays values (59, 'Éthiopie');
insert into pays values (60, 'Fidji');
insert into pays values (61, 'Finlande');
insert into pays values (62, 'France');
insert into pays values (63, 'Gabon');
insert into pays values (64, 'Gambie');
insert into pays values (65, 'Géorgie');
insert into pays values (66, 'Ghana');
insert into pays values (67, 'Grèce');
insert into pays values (68, 'Grenade');
insert into pays values (69, 'Guatemala');
insert into pays values (70, 'Guinée');
insert into pays values (71, 'Guinée équatoriale');
insert into pays values (72, 'Guinée-Bissau');
insert into pays values (73, 'Guyana');
insert into pays values (74, 'Haïti');
insert into pays values (75, 'Honduras');
insert into pays values (76, 'Hongrie');
insert into pays values (77, 'Îles Marshall');
insert into pays values (78, 'Îles Salomon');
insert into pays values (79, 'Inde');
insert into pays values (80, 'Indonésie');
insert into pays values (81, 'Irak');
insert into pays values (82, 'Iran');
insert into pays values (83, 'Irlande');
insert into pays values (84, 'Islande');
insert into pays values (85, 'Israël');
insert into pays values (86, 'Italie');
insert into pays values (87, 'Jamaïque');
insert into pays values (88, 'Japon');
insert into pays values (89, 'Jordanie');
insert into pays values (90, 'Kazakhstan');
insert into pays values (91, 'Kenya');
insert into pays values (92, 'Kirghizistan');
insert into pays values (93, 'Kiribati');
insert into pays values (94, 'Koweït');
insert into pays values (95, 'Laos');
insert into pays values (96, 'Lesotho');
insert into pays values (97, 'Lettonie');
insert into pays values (98, 'Liban');
insert into pays values (99, 'Liberia');
insert into pays values (100, 'Libye');
insert into pays values (101, 'Liechtenstein');
insert into pays values (102, 'Lituanie');
insert into pays values (103, 'Luxembourg');
insert into pays values (104, 'Macédoine');
insert into pays values (105, 'Madagascar');
insert into pays values (106, 'Malaisie');
insert into pays values (107, 'Malawi');
insert into pays values (108, 'Maldives');
insert into pays values (109, 'Mali');
insert into pays values (110, 'Malte');
insert into pays values (111, 'Maroc');
insert into pays values (112, 'Maurice');
insert into pays values (113, 'Mauritanie');
insert into pays values (114, 'Mexique');
insert into pays values (115, 'Micronésie');
insert into pays values (116, 'Moldavie');
insert into pays values (117, 'Monaco');
insert into pays values (118, 'Mongolie');
insert into pays values (119, 'Monténégro');
insert into pays values (120, 'Mozambique');
insert into pays values (121, 'Myanmar');
insert into pays values (122, 'Namibie');
insert into pays values (123, 'Nauru');
insert into pays values (124, 'Népal');
insert into pays values (125, 'Nicaragua');
insert into pays values (126, 'Niger');
insert into pays values (127, 'Nigeria');
insert into pays values (128, 'Norvège');
insert into pays values (129, 'Nouvelle-Zélande');
insert into pays values (130, 'Oman');
insert into pays values (131, 'Ouganda');
insert into pays values (132, 'Ouzbékistan');
insert into pays values (133, 'Pakistan');
insert into pays values (134, 'Palaos');
insert into pays values (135, 'Panama');
insert into pays values (136, 'Papouasie-Nouvelle-Guinée');
insert into pays values (137, 'Paraguay');
insert into pays values (138, 'Pays-Bas');
insert into pays values (139, 'Pérou');
insert into pays values (140, 'Philippines');
insert into pays values (141, 'Pologne');
insert into pays values (142, 'Portugal');
insert into pays values (143, 'Qatar');
insert into pays values (144, 'République dominicaine');
insert into pays values (145, 'République tchèque');
insert into pays values (146, 'Roumanie');
insert into pays values (147, 'Royaume-Uni');
insert into pays values (148, 'Russie');
insert into pays values (149, 'Rwanda');
insert into pays values (150, 'Saint-Christophe-et-Niévès');
insert into pays values (151, 'Saint-Marin');
insert into pays values (152, 'Saint-Vincent-et-les Grenadines');
insert into pays values (153, 'Sainte-Lucie');
insert into pays values (154, 'Salvador');
insert into pays values (155, 'Samoa');
insert into pays values (156, 'São Tomé-et-Principe');
insert into pays values (157, 'Sénégal');
insert into pays values (158, 'Serbie');
insert into pays values (159, 'Seychelles');
insert into pays values (160, 'Sierra Leone');
insert into pays values (161, 'Singapour');
insert into pays values (162, 'Slovaquie');
insert into pays values (163, 'Slovénie');
insert into pays values (164, 'Somalie');
insert into pays values (165, 'Soudan');
insert into pays values (166, 'Soudan du Sud');
insert into pays values (167, 'Sri Lanka');
insert into pays values (168, 'Suède');
insert into pays values (169, 'Suisse');
insert into pays values (170, 'Suriname');
insert into pays values (171, 'Swaziland');
insert into pays values (172, 'Syrie');
insert into pays values (173, 'Tadjikistan');
insert into pays values (174, 'Tanzanie');
insert into pays values (175, 'Tchad');
insert into pays values (176, 'Thaïlande');
insert into pays values (177, 'Timor-Leste');
insert into pays values (178, 'Togo');
insert into pays values (179, 'Tonga');
insert into pays values (180, 'Trinité-et-Tobago');
insert into pays values (181, 'Tunisie');
insert into pays values (182, 'Turkménistan');
insert into pays values (183, 'Turquie');
insert into pays values (184, 'Tuvalu');
insert into pays values (185, 'Ukraine');
insert into pays values (186, 'Uruguay');
insert into pays values (187, 'Vanuatu');
insert into pays values (188, 'Vatican');
insert into pays values (189, 'Venezuela');
insert into pays values (190, 'Viêt Nam');
insert into pays values (191, 'Yémen');
insert into pays values (192, 'Zambie');
insert into pays values (193, 'Zimbabwe');


--
-- TOC entry 4020 (class 0 OID 1213558)
-- Dependencies: 241
-- Data for Name: joueur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into joueur values (1, 1, 142, 'Ronaldo', 'Cristiano', '1985-02-05', 'Funchal', 'Droitier', 84, 187, 'Attaquant', 'Cristiano Ronaldo est l''un des meilleurs joueurs de football du monde, connu pour sa vitesse et sa capacité à marquer des buts.', 'https://assets-fr.imgfoot.com/media/cache/1200x1200/cristiano-ronaldo-al-nassr.jpg');
insert into joueur values (2, 2, 10, 'Messi', 'Lionel', '1987-06-24', 'Rosario', 'Gaucher', 72, 170, 'Attaquant', 'Lionel Messi est considéré comme l''un des plus grands joueurs de tous les temps, avec de nombreux titres et records à son actif.', 'https://www.parismatch.com/lmnr/var/pm/public/media/image/Lionel-Messi_0.jpg?VersionId=9IMsjKtwh3CF1p7sEXw_D0hvR0g.h51e');
insert into joueur values (3, 2, 27, 'Neymar Jr.', 'Neymar', '1992-02-05', 'Mogi das Cruzes', 'Droitier', 68, 175, 'Attaquant', 'Neymar est un joueur brésilien talentueux, connu pour ses dribbles et sa créativité sur le terrain.', 'https://www.gala.fr/imgre/fit/~1~gal~2023~10~09~ea319e2e-a624-4e2a-b208-3b5f69444014.jpeg/2385x1849/quality/80/neymar.jpeg');
insert into joueur values (4, 3, 20, 'Hazard', 'Eden', '1991-01-07', 'La Louvière', 'Gaucher', 74, 173, 'Milieu de Terrain', 'Eden Hazard est un milieu de terrain offensif belge, reconnu pour son habileté et sa vision de jeu.', 'https://assets-fr.imgfoot.com/media/cache/1200x1200/eden-hazard-2223-1.jpg');
insert into joueur values (5, 2, 62, 'Mbappé', 'Kylian', '1998-12-20', 'Bondy', 'Droitier', 73, 178, 'Attaquant', 'Kylian Mbappé est un jeune attaquant français en pleine ascension, avec une vitesse remarquable.', 'https://img.20mn.fr/ZErb769fTy6uli4q2QK7Qik/1200x768_france-s-forward-kylian-mbappe-looks-on-during-a-training-session-ahead-of-the-upcoming-uefa-euro-2024-football-tournament-qualifying-matches-in-clairefontaine-en-yvelines-on-june-10-2023-france-will-play-against-gibraltar-on-june-16-2023-and-against-greece-on-june-19-2023-in-their-uefa-euro-2024-group-b-qualification-matches-photo-by-bertrand-guay-afp');
insert into joueur values (6, 4, 20, 'De Bruyne', 'Kevin', '1991-06-28', 'Drongen', 'Droitier', 70, 181, 'Milieu de Terrain', 'Kevin De Bruyne est un milieu de terrain belge créatif, considéré comme l''un des meilleurs du monde.', 'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltc5580cd4a1255365/60dabddd47339c0fc0191db6/9b94f63b6a3bf9db713faa54fafc6d7bade8705f.jpg?auto=webp&format=pjpg&width=3840&quality=60');
insert into joueur values (7, 2, 56, 'Sergio Ramos', 'Sergio', '1986-03-30', 'Camas', 'Droitier', 80, 184, 'Défenseur', 'Sergio Ramos est un défenseur espagnol légendaire, réputé pour sa robustesse et son leadership.', 'https://i.eurosport.com/2023/09/04/3778333-76856588-2560-1440.jpg');
insert into joueur values (8, 5, 147, 'Kane', 'Harry', '1993-07-28', 'Walthamstow', 'Droitier', 86, 188, 'Attaquant', 'Harry Kane est un attaquant anglais de classe mondiale, connu pour ses compétences de buteur.', 'https://www.leparisien.fr/resizer/ZF-efMIcieNBZ5NdCen3EjKN_pU=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/NIBRACUPT5B5ZLDKIR4NPET5RA.jpg');
insert into joueur values (9, 6, 141, 'Lewandowski', 'Robert', '1988-08-21', 'Varsovie', 'Droitier', 81, 185, 'Attaquant', 'Robert Lewandowski est un attaquant polonais redoutable, célèbre pour son instinct de buteur.', 'https://media.sudouest.fr/7802902/1000x625/sudouest-photo-1-30579015.jpg?v=1642494051');
insert into joueur values (10, 3, 5, 'Kroos', 'Toni', '1990-01-04', 'Greifswald', 'Droitier', 78, 182, 'Milieu de Terrain', 'Toni Kroos est un milieu de terrain allemand qui excelle dans la passe et la vision du jeu.', 'https://i0.wp.com/real-france.fr/wp-content/uploads/2023/02/Icon_634_RMAHIL20230211_r_056.jpg?fit=750%2C499&ssl=1');
insert into joueur values (11, 7, 186, 'Suárez', 'Luis', '1987-01-24', 'Salto', 'Droitier', 81, 182, 'Attaquant', 'Luis Suárez est un attaquant uruguayen renommé pour son instinct de buteur et ses dribbles.', 'https://arc-anglerfish-eu-central-1-prod-leparisien.s3.amazonaws.com/public/MXUJWLKXVQR6ZCNBXVQ2SFSDQE.jpg');
insert into joueur values (12, 8, 157, 'Mané', 'Sadio', '1992-04-10', 'Bambali', 'Gaucher', 69, 175, 'Attaquant', 'Sadio Mané est un ailier sénégalais rapide et talentueux, un atout majeur de Liverpool.', 'https://www.afrik-foot.com/wp-content/uploads/2023/08/iconsport-icon-dib-240922-11-124.jpg');
insert into joueur values (13, 8, 52, 'Salah', 'Mohamed', '1992-06-15', 'Basyoun', 'Droitier', 71, 175, 'Attaquant', 'Mohamed Salah est un attaquant égyptien de classe mondiale, réputé pour sa vitesse et ses buts spectaculaires.', 'https://i.eurosport.com/2023/11/12/3824809-77729108-2560-1440.jpg');
insert into joueur values (14, 9, 62, 'Kanté', 'N''Golo', '1991-03-29', 'Paris', 'Droitier', 68, 168, 'Milieu de Terrain', 'N''Golo Kanté est un milieu de terrain français incroyablement polyvalent, un pilier de l''équipe de Chelsea.', 'https://www.gala.fr/imgre/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fprismamedia_people.2F2018.2F06.2F13.2Fb25e576e-435b-4300-818e-0950eb3e90f3.2Ejpeg/2638x1828/quality/80/n-golo-kante.jpeg');
insert into joueur values (15, 1, 56, 'De Gea', 'David', '1990-11-07', 'Madrid', 'Droitier', 76, 192, 'Gardien de But', 'David De Gea est un gardien de but espagnol de renom, connu pour ses réflexes impressionnants.', 'https://prod-media.beinsports.com/image/1698303601811_361efcd7-c5c3-40c6-8b2d-2a647de03fc2.jpg');
insert into joueur values (16, 1, 62, 'Pogba', 'Paul', '1993-03-15', 'Lagny-sur-Marne', 'Droitier', 84, 191, 'Milieu de Terrain', 'Paul Pogba est un milieu de terrain français créatif, doté de compétences de passe exceptionnelles.', 'https://www.voici.fr/imgre/fit/~1~voi~2023~11~21~8ed7cfa6-d7af-40eb-a8c4-b9622cd46e06.jpeg/1200x675/quality/80/paul-pogba-suspendu-pour-dopage-une-star-de-l-equipe-de-france-lui-apporte-son-soutien.jpg');
insert into joueur values (17, 5, 62, 'Lloris', 'Hugo', '1986-12-26', 'Nice', 'Droitier', 78, 188, 'Gardien de But', 'Hugo Lloris est un gardien de but français expérimenté, le capitaine de Tottenham Hotspur et de l''équipe nationale française.', 'https://upload.wikimedia.org/wikipedia/commons/3/3d/2020-03-10_Fu%C3%9Fball%2C_M%C3%A4nner%2C_UEFA_Champions_League_Achtelfinale%2C_RB_Leipzig_-_Tottenham_Hotspur_1DX_3687_by_Stepro.jpg');
insert into joueur values (18, 4, 147, 'Sterling', 'Raheem', '1994-12-08', 'Kingston', 'Droitier', 69, 170, 'Attaquant', 'Raheem Sterling est un attaquant anglais rapide, doté d''une grande agilité et d''une capacité à dribbler ses adversaires.', 'https://assets-fr.imgfoot.com/media/cache/1200x900/raheem-sterling-wc-22-1.jpg');
insert into joueur values (19, 11, 37, 'Vidal', 'Arturo', '1987-05-22', 'Santiago', 'Droitier', 74, 180, 'Milieu de Terrain', 'Arturo Vidal est un milieu de terrain chilien robuste, célèbre pour sa combativité sur le terrain.', 'https://fifpro.org/media/242mwuos/arturo-vidal-pwm.jpg?rxy=0.52119483916879439,0.22549354900538551&width=1600&height=1024&rnd=132979627666770000');
insert into joueur values (20, 8, 27, 'Alisson Becker', 'Alisson', '1992-10-02', 'Novo Hamburgo', 'Droitier', 91, 193, 'Gardien de But', 'Alisson Becker est un gardien de but brésilien, connu pour ses arrêts impressionnants et sa capacité à jouer avec les pieds.', 'https://thisisliverpool.fr/wp-content/uploads/2022/09/alisson-becker-liverpool-scaled.jpg');
insert into joueur values (21, 3, 47, 'Modrić', 'Luka', '1985-09-09', 'Zadar', 'Droitier', 66, 172, 'Milieu de Terrain', 'Luka Modrić est un milieu de terrain croate exceptionnel, réputé pour sa vision du jeu et sa précision de passe.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/ISL-HRV_%287%29.jpg/800px-ISL-HRV_%287%29.jpg');
insert into joueur values (22, 6, 5, 'Kimmich', 'Joshua', '1995-02-08', 'Rottweil', 'Droitier', 73, 176, 'Milieu de Terrain', 'Joshua Kimmich est un polyvalent joueur allemand, capable de jouer à plusieurs postes et connu pour son travail acharné.', 'https://i.la-croix.com/1400x933/smart/2021/12/14/1201190127/semaines-Joshua-Kimmich-tient-terrains-jouera-pasle-debut-dannee-prochaine_0.jpg');
insert into joueur values (23, 8, 138, 'Van Dijk', 'Virgil', '1991-07-08', 'Breda', 'Droitier', 92, 193, 'Défenseur', 'Virgil van Dijk est un défenseur central néerlandais considéré comme l''un des meilleurs au monde, il apporte une stabilité à la défense de Liverpool.', 'https://static.independent.co.uk/2023/11/08/20/1aa270d99db6553fc45109b3d2cdce17Y29udGVudHNlYXJjaGFwaSwxNjk5NTU4NjE2-2.73875071.jpg');
insert into joueur values (24, 7, 62, 'Griezmann', 'Antoine', '1991-03-21', 'Mâcon', 'Droitier', 73, 176, 'Attaquant', 'Antoine Griezmann est un attaquant français talentueux, reconnu pour ses dribbles et ses compétences de finisseur.', 'https://www.topmercato.com/wp-content/uploads/2023/11/Antoine-Griezmann.jpg');
insert into joueur values (25, 9, 20, 'Lukaku', 'Romelu', '1993-05-13', 'Antwerp', 'Droitier', 94, 190, 'Attaquant', 'Romelu Lukaku est un attaquant belge puissant et rapide, avec une capacité à marquer des buts remarquable.', 'https://images.bfmtv.com/U4r_gjPt3J8gfDuJ1Y72bNkwzOA=/114x0:1934x1365/640x0/images/Romelu-Lukaku-1736388.jpg');
insert into joueur values (26, 1, 62, 'Varane', 'Raphaël', '1993-04-25', 'Lille', 'Droitier', 81, 191, 'Défenseur', 'Raphaël Varane est un défenseur central français, réputé pour sa vitesse et son sens du placement.', 'https://www.leparisien.fr/resizer/Co_YWsK12MUNVzwftrzZXyWGLkw=/932x582/cloudfront-eu-central-1.images.arcpublishing.com/leparisien/LOPGD76IKZFA3HVIHZMNVCBK7M.jpg');
insert into joueur values (27, 6, 5, 'Sane', 'Leroy', '1996-01-11', 'Essen', 'Droitier', 86, 184, 'Attaquant', 'Leroy Sané est un ailier allemand rapide et créatif, connu pour ses dribbles et sa capacité à marquer des buts.', 'https://assets.bundesliga.com/tachyon/sites/2/2022/11/bvb_fcb_sane_1920.jpg?crop=0px,0px,1920px,1080px&fit=1140,1140');
insert into joueur values (28, 1, 142, 'Fernandes', 'Bruno', '1994-09-08', 'Porto', 'Droitier', 83, 183, 'Milieu de Terrain', 'Bruno Fernandes est un milieu de terrain portugais doué pour la création d''occasions et les coups de pied arrêtés.', 'https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg)/origin-imgresizer.eurosport.com/2023/10/03/3796983-77229588-2560-1440.jpg');
insert into joueur values (29, 2, 10, 'Di María', 'Ángel', '1988-02-14', 'Rosario', 'Gaucher', 75, 180, 'Attaquant', 'Ángel Di María est un attaquant argentin rapide et talentueux, célèbre pour ses dribbles et ses passes précises.', 'https://images.bfmtv.com/4S6Z5X0hPQlHbpRxcQ7ihuF3-cY=/0x0:2048x1152/images/La-joie-d-Angel-Di-Maria-avec-l-Argentine-en-finale-de-la-Coupe-du-monde-1754279.jpg');
insert into joueur values (30, 2, 111, 'Hakimi', 'Achraf', '1998-11-04', 'Madrid', 'Droitier', 75, 181, 'Défenseur', 'Achraf Hakimi est un défenseur marocain polyvalent, capable de jouer en tant que latéral droit ou gauche, et connu pour sa vitesse.', 'https://www.gala.fr/imgre/fit/~1~gal~2023~01~05~4a1c0f87-bc66-4a1e-b2cc-1e6fa7c0b88c.jpeg/1520x1027/quality/80/achraf-hakimi.jpeg');
insert into joueur values (31, 4, 62, 'Laporte', 'Aymeric', '1994-05-27', 'Agen', 'Gaucher', 87, 191, 'Défenseur', 'Aymeric Laporte est un défenseur central français qui apporte de la solidité à la défense de Manchester City.', 'https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg)/origin-imgresizer.eurosport.com/2023/06/17/3728418-75858288-2560-1440.jpg');
insert into joueur values (32, 8, 27, 'Firmino', 'Roberto', '1991-10-02', 'Maceió', 'Droitier', 76, 181, 'Attaquant', 'Roberto Firmino est un attaquant brésilien polyvalent, connu pour sa créativité et sa capacité à travailler dur pour l''équipe.', 'https://assets-fr.imgfoot.com/media/cache/1200x1200/roberto-firmino-2223-4.jpg');
insert into joueur values (33, 1, 186, 'Cavani', 'Edinson', '1987-02-14', 'Salto', 'Droitier', 71, 184, 'Attaquant', 'Edinson Cavani est un attaquant uruguayen renommé pour son instinct de buteur et sa mobilité sur le terrain.', 'https://images.rtl.fr/~c/2000v2000/rtl/www/1226380-edinson-cavani-avec-l-uruguay-en-2019.jpg');
insert into joueur values (34, 1, 147, 'Sancho', 'Jadon', '2000-03-25', 'Londres', 'Droitier', 76, 180, 'Attaquant', 'Jadon Sancho est un jeune attaquant anglais talentueux, connu pour sa vitesse et ses dribbles.', 'https://s.hs-data.com/bilder/spieler/gross/366235.jpg');
insert into joueur values (35, 3, 27, 'Casemiro', 'Carlos', '1992-02-23', 'São José dos Campos', 'Droitier', 84, 185, 'Milieu de Terrain', 'Casemiro est un milieu de terrain brésilien robuste, un élément clé du milieu de terrain du Real Madrid.', 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQCF6XFYnv5jbyq2LvedXhcPrF8Dh6DRGuTwo6Px46QDSLas6Gji-8I6JHaK-TgDiPe');
insert into joueur values (36, 9, 5, 'Werner', 'Timo', '1996-03-06', 'Stuttgart', 'Droitier', 82, 184, 'Attaquant', 'Timo Werner est un attaquant allemand rapide, reconnu pour sa capacité à marquer des buts et à créer des occasions.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/20180602_FIFA_Friendly_Match_Austria_vs._Germany_Timo_Werner_850_0621.jpg/1200px-20180602_FIFA_Friendly_Match_Austria_vs._Germany_Timo_Werner_850_0621.jpg');
insert into joueur values (37, 2, 86, 'Donnarumma', 'Gianluigi', '1999-02-25', 'Castellammare di Stabia', 'Droitier', 90, 196, 'Gardien de But', 'Gianluigi Donnarumma est un gardien de but italien talentueux, célèbre pour sa stature imposante et ses réflexes impressionnants.', 'https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRDdMp8tV3W2SomQrih7-8-zUeNb2k3_ook6AXhnxgcIeQoATQlCU8oNo2Riz5ilNrj');
insert into joueur values (38, 12, 128, 'Haaland', 'Erling', '2000-07-21', 'Leeds', 'Droitier', 91, 194, 'Attaquant', 'Erling Haaland est un jeune attaquant norvégien en pleine ascension, connu pour sa puissance et sa capacité à marquer des buts.', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRxFc0bysexHksp_1Qbys89hnnuAe6pyNpnl5wJdh74Tcf22Ups');
insert into joueur values (39, 9, 147, 'Mount', 'Mason', '1999-01-10', 'Plymouth', 'Droitier', 79, 183, 'Milieu de Terrain', 'Mason Mount est un milieu de terrain anglais polyvalent, capable de marquer des buts et de créer des occasions pour son équipe.', 'https://static.standard.co.uk/2023/05/25/08/newFile-3.jpg?width=1200&height=1200&fit=crop');
insert into joueur values (40, 13, 86, 'Chiesa', 'Federico', '1997-10-25', 'Genève', 'Droitier', 75, 175, 'Attaquant', 'Federico Chiesa est un jeune attaquant italien talentueux, connu pour sa rapidité et sa créativité sur le terrain.', 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSuOPU_aJ8ugcy2mypS2NaHwiqTeznk7HyxeQ2Spr0aWI1BH52nDfj9xWj_dUyl-hn8');
insert into joueur values (41, 6, 5, 'Gnabry', 'Serge', '1995-07-14', 'Stuttgart', 'Droitier', 76, 175, 'Attaquant', 'Serge Gnabry est un ailier allemand rapide et technique, un atout majeur pour le Bayern Munich.', 'https://www.lequipe.fr/_medias/img-photo-jpg/serge-gnabry-a-marque-un-quadruple-contre-tottenham-expa-focus-images-presse-sports/1500000001233499/0:0,1997:1331-828-552-75/89e96.jpg');
insert into joueur values (42, 4, 147, 'Grealish', 'Jack', '1995-09-10', 'Solihull', 'Droitier', 73, 175, 'Milieu de Terrain', 'Jack Grealish est un milieu de terrain anglais créatif, connu pour ses dribbles et ses passes précises.', 'https://www.mancity.com/meta/media/ax3mxptm/jack-grealish.png');
insert into joueur values (43, 2, 27, 'Marquinhos', 'Marco', '1994-05-14', 'São Paulo', 'Droitier', 75, 183, 'Défenseur', 'Marco Marquinhos est un défenseur polyvalent brésilien, un pilier de la défense du Paris Saint-Germain.', 'https://www.psg.fr/media/232984/marquinhos.jpg?quality=60&width=1600&bgcolor=ffffff');
insert into joueur values (44, 3, 62, 'Mendy', 'Ferland', '1995-06-08', 'Meulan-en-Yvelines', 'Gaucher', 80, 183, 'Défenseur', 'Ferland Mendy est un latéral gauche français rapide, réputé pour sa capacité à monter et défendre.', 'https://i0.wp.com/real-france.fr/wp-content/uploads/2021/11/mendy.jpg?fit=750%2C478&ssl=1');
insert into joueur values (45, 6, 34, 'Davies', 'Alphonso', '2000-11-02', 'Buduburam', 'Gaucher', 74, 182, 'Défenseur', 'Alphonso Davies est un arrière latéral canadien polyvalent, connu pour sa rapidité et ses capacités offensives.', 'https://b.fssta.com/uploads/application/soccer/headshots/44670.vresize.350.350.medium.28.png');
insert into joueur values (46, 7, 163, 'Oblak', 'Jan', '1993-01-07', 'Škofja Loka', 'Droitier', 87, 188, 'Gardien de But', 'Jan Oblak est un gardien de but slovène exceptionnel, réputé pour ses arrêts spectaculaires.', 'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ5YskkCVuMhhYGRsNWLNOyA7tlXTRws566Y56DJHKeNvRlXZNhvl4LraVreXL49XJd');
insert into joueur values (47, 1, 147, 'Rashford', 'Marcus', '1997-10-31', 'Manchester', 'Droitier', 70, 180, 'Attaquant', 'Marcus Rashford est un attaquant anglais talentueux, connu pour sa vitesse et sa polyvalence.', 'https://oneftbl-cms.imgix.net/https%3A%2F%2Fimages2.minutemediacdn.com%2Fimage%2Fupload%2Fc_crop%2Cw_3000%2Ch_1687%2Cx_0%2Cy_270%2Fc_fill%2Cw_1440%2Car_16%3A9%2Cf_auto%2Cq_auto%2Cg_auto%2Fimages%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01h3emnsm3t80qvaxdxn.jpg?auto=format%2Ccompress&crop=faces&dpr=2&fit=crop&h=210&q=25&w=280&s=4253d27871c7db3ffc037ea70cab0f42');
insert into joueur values (48, 9, 111, 'Ziyech', 'Hakim', '1993-03-19', 'Dronten', 'Gaucher', 75, 180, 'Milieu de Terrain', 'Hakim Ziyech est un milieu de terrain marocain créatif, reconnu pour ses passes précises et sa vision du jeu.', 'https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcS6RErEUWae6dUYz5gfDVfvtKp2SgC54so1WVUHyPLFFeufk0hrWuu3wgULgIW1IZLG');
insert into joueur values (49, 14, 86, 'Insigne', 'Lorenzo', '1991-06-04', 'Naples', 'Droitier', 59, 163, 'Attaquant', 'Lorenzo Insigne est un attaquant italien agile, connu pour sa capacité à dribbler et à marquer des buts.', 'https://a.espncdn.com/combiner/i?img=/i/headshots/soccer/players/full/139028.png&w=350&h=254');
insert into joueur values (50, 9, 62, 'Koundé', 'Jules', '1998-11-12', 'Paris', 'Droitier', 75, 182, 'Défenseur', 'Jules Koundé est un jeune défenseur central français en pleine ascension, réputé pour sa vitesse et son sens du placement.', 'https://b.fssta.com/uploads/application/soccer/headshots/40821.vresize.350.350.medium.91.pnghttps://b.fssta.com/uploads/application/soccer/headshots/40821.vresize.350.350.medium.91.png');


--
-- TOC entry 3990 (class 0 OID 1213422)
-- Dependencies: 211
-- Data for Name: articleassociejoueur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into articleassociejoueur values (16, 10);
insert into articleassociejoueur values (11, 9);
insert into articleassociejoueur values (2, 8);
insert into articleassociejoueur values (17, 5);
insert into articleassociejoueur values (38, 7);
insert into articleassociejoueur values (8, 1);
insert into articleassociejoueur values (8, 2);
insert into articleassociejoueur values (30, 6);
insert into articleassociejoueur values (33, 4);
insert into articleassociejoueur values (13, 3);
insert into articleassociejoueur values (1, 11);
insert into articleassociejoueur values (4, 12);


--
-- TOC entry 3991 (class 0 OID 1213427)
-- Dependencies: 212
-- Data for Name: articlecontientphoto; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into articlecontientphoto values (1, 31);
insert into articlecontientphoto values (2, 7);
insert into articlecontientphoto values (3, 10);
insert into articlecontientphoto values (5, 32);
insert into articlecontientphoto values (6, 33);
insert into articlecontientphoto values (7, 34);
insert into articlecontientphoto values (8, 35);
insert into articlecontientphoto values (9, 36);
insert into articlecontientphoto values (11, 37);
insert into articlecontientphoto values (12, 12);


--
-- TOC entry 4060 (class 0 OID 1213755)
-- Dependencies: 281
-- Data for Name: video; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into video values (1, 'Mo Salah''s 100 Liverpool Premier League goals | Man Utd celeb, Chelsea screamer & Everton stunner', 'https://youtu.be/cGJBKbManZE');
insert into video values (2, 'Erling Haaland scores NINE goals v Honduras | FIFA U-20 World Cup Poland 2019 | Match Highlights', 'https://youtu.be/k13EltDN5cU');
insert into video values (3, 'Blanc talks Pogba', 'https://www.youtube.com/watch?v=U8fuQeevsBw');
insert into video values (4, 'Eden HAZARD Goal 2 - Belgium v Tunisia - MATCH 29', 'https://youtu.be/ptMonLkshxE');


--
-- TOC entry 3992 (class 0 OID 1213432)
-- Dependencies: 213
-- Data for Name: articlecontientvideo; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into articlecontientvideo values (3, 1);
insert into articlecontientvideo values (7, 2);
insert into articlecontientvideo values (10, 3);
insert into articlecontientvideo values (12, 4);


--
-- TOC entry 4010 (class 0 OID 1213515)
-- Dependencies: 231
-- Data for Name: competition; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into competition values (1, 'Coupe du Monde Féminine de la FIFA 2023');
insert into competition values (2, 'Coupe du monde de la FIFA 2022');
insert into competition values (3, 'FIFAE');
insert into competition values (4, 'Coupe du Monde U-20 de la FIFA 2023');
insert into competition values (5, 'Coupe du Monde des Clubs de la FIFA 2022');
insert into competition values (6, 'Coupe du Monde Féminine de la FIFA U-17');
insert into competition values (7, 'Coupe du Monde Féminine de la FIFA U-20');


--
-- TOC entry 4016 (class 0 OID 1213542)
-- Dependencies: 237
-- Data for Name: genre; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into genre values (1, 'Homme');
insert into genre values (2, 'Femme');
insert into genre values (3, 'Unisexe');


--
-- TOC entry 4027 (class 0 OID 1213595)
-- Dependencies: 248
-- Data for Name: nation; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into nation values (1, 'Allemagne');
insert into nation values (2, 'Algérie');
insert into nation values (3, 'Angleterre');
insert into nation values (4, 'Arabie Saoudite');
insert into nation values (5, 'Argentine');
insert into nation values (6, 'Australie');
insert into nation values (7, 'Autriche');
insert into nation values (8, 'Belgique');
insert into nation values (9, 'Bolivie');
insert into nation values (10, 'Bosnie-Herzégovine');
insert into nation values (11, 'Brésil');
insert into nation values (12, 'Bulgarie');
insert into nation values (13, 'Cameroun');
insert into nation values (14, 'Chili');
insert into nation values (15, 'Colombie');
insert into nation values (16, 'Corée du Sud');
insert into nation values (17, 'Costa Rica');
insert into nation values (18, 'Côte d''Ivoire');
insert into nation values (19, 'Croatie');
insert into nation values (20, 'Danemark');
insert into nation values (21, 'Égypte');
insert into nation values (22, 'Équateur');
insert into nation values (23, 'Espagne');
insert into nation values (24, 'États-Unis');
insert into nation values (25, 'France');
insert into nation values (26, 'Ghana');
insert into nation values (27, 'Grèce');
insert into nation values (28, 'Honduras');
insert into nation values (29, 'Hongrie');
insert into nation values (30, 'Iran');
insert into nation values (31, 'Irlande');
insert into nation values (32, 'Irlande du Nord');
insert into nation values (33, 'Islande');
insert into nation values (34, 'Italie');
insert into nation values (35, 'Jamaïque');
insert into nation values (36, 'Japon');
insert into nation values (37, 'Maroc');
insert into nation values (38, 'Mexique');
insert into nation values (39, 'Nigeria');
insert into nation values (40, 'Norvège');
insert into nation values (41, 'Nouvelle-Zélande');
insert into nation values (42, 'Paraguay');
insert into nation values (43, 'Pays-Bas');
insert into nation values (44, 'Pérou');
insert into nation values (45, 'Pologne');
insert into nation values (46, 'Portugal');
insert into nation values (47, 'République Tchèque');
insert into nation values (48, 'Roumanie');
insert into nation values (49, 'Russie');
insert into nation values (50, 'Sénégal');
insert into nation values (51, 'Serbie');
insert into nation values (52, 'Slovaquie');
insert into nation values (53, 'Slovénie');
insert into nation values (54, 'Suède');
insert into nation values (55, 'Suisse');
insert into nation values (56, 'Tunisie');
insert into nation values (57, 'Turquie');
insert into nation values (58, 'Ukraine');
insert into nation values (59, 'Uruguay');
insert into nation values (60, 'Venezuela');


--
-- TOC entry 4035 (class 0 OID 1213632)
-- Dependencies: 256
-- Data for Name: produit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into produit values (1, 1, NULL, 3, 'RÉPLIQUE SOUS LICENCE DE LA COUPE DU MONDE FÉMININE DE LA FIFA 150 MM', 'Réplique officielle du trophée de la Coupe du Monde Féminine de la FIFA™
Vendu avec la boîte de présentation
Édition collector
Acier');
insert into produit values (2, 1, NULL, 3, 'ÉCHARPE NOIRE FINALE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Découvrez l’écharpe finaliste de la Coupe du Monde Féminine de la FIFA 2023™, qui célèbre les deux meilleures équipes de cette édition. Agréable et confortable, cet accessoire est idéal pour pour afficher son soutien à la Coupe du Monde Féminine de la FIFA 2023™ et honorer son héritage.');
insert into produit values (3, 2, 23, 3, 'MAILLOT DOMICILE ESPAGNE ADIDAS - HOMME', 'Maillot officiel Coupe du Monde 2022
Interlock 100% polyester recyclé
Technologie absorbante AEROREADY
Coupe plus longue à l’arrière
Coupe slim');
insert into produit values (4, 1, NULL, 3, 'RÉPLIQUE SOUS LICENCE DE LA COUPE DU MONDE FÉMININE DE LA FIFA 150 MM', 'Réplique officielle du trophée de la Coupe du Monde Féminine de la FIFA™
Vendu avec la boîte de présentation
Édition collector
Acier');
insert into produit values (5, NULL, NULL, 3, 'BALLON ADIDAS FINAL OCEAUNZ PRO –- TAILLE 5', 'Pour des moments historiques au plus haut niveau Ballon officiel des demi-finales, du match pour la troisième place et de la finale de la Coupe du Monde Féminine de la FIFA™. Avec ses tons ocres relevés de reflets jaunes et or, le ballon adidas Final Oceaunz Pro évoque l’incomparable beauté des territoires australiens et néo-zélandais, ainsi que le trophée des vainqueurs. Son assemblage sans couture garantit une trajectoire et des rebonds prévisibles. FIFA Quality Pro est le label de qualité le plus élevé de la 

70% polyuréthane / 20% polyester recyclé / 10% viscose (revêtement)
Assemblage thermique sans couture
Vessie en butyle de qualité supérieure');
insert into produit values (6, 1, NULL, 3, 'COUPE DU MONDE FÉMININE DE LA FIFA 2023™ T-SHIRT FINALISTE NOIR – UNISEXE', 'Découvrez le t-shirt finaliste de la Coupe du Monde Féminine de la FIFA 2023™, qui célèbre les deux meilleures équipes de cette édition, prêtes à en découdre pour le titre suprême. Confortable et intemporel, il vous permettra d’afficher avec style votre soutien à votre pays.

Produit dérivé officiel de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™ sous licence
100% coton
Impression sur la poitrine
Coupe droite');
insert into produit values (7, 1, NULL, 3, 'MINI-BALLON ADIDAS OCEAUNZ – TAILLE 1', 'Mini-ballon officiel Coupe du Monde Féminine 2023
Vessie en caoutchouc
Logo Coupe du Monde Féminine de la FIFA imprimé
La nature prend le dessus avec le ballon officiel de la Coupe du Monde Féminine. Inspiré par les rivages australiens et néo-zélandais, ce mini-ballon adidas Oceaunz arbore des motifs évoquant des vagues et divers détails emblématiques. Il célèbre la connexion des pays hôtes avec la Terre et les océans.');
insert into produit values (8, NULL, 54, 3, 'MAILLOT DOMICILE SUÈDE ADIDAS - HOMME', 'Interlock 100% polyester recyclé
Technologie absorbante AEROREADY
Coupe plus longue à l’arrière
Coupe slim');
insert into produit values (9, 1, 3, 3, 'MAILLOT EXTÉRIEUR ÉQUIPE D’ANGLETERRE FÉMININE 2023 – FEMME', 'Maillot officiel Nike extérieur de l’Angleterre à la Coupe du Monde Féminine de la FIFA 2023™
Coupe droite pour plus de confort
100% polyester
La technologie Nike Dri-FIT évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort.
Ce maillot réplique reprend les composants du maillot porté par les pros.
Lavable en machine
Affichez votre soutien à l’Angleterre dans sa quête du trophée de la Coupe du Monde Féminine avec le maillot Nike extérieur de l’Angleterre pour la Coupe du Monde Féminine 2023. La technologie Dri-FIT de Nike évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort. Grâce à sa légèreté, vos performances seront toujours les meilleures jusqu''au coup de sifflet final. Grâce à ses composants faciles à laver et sécher, votre maillot sera toujours prêt pour le prochain entraînement ou match.');
insert into produit values (10, 1, 41, 3, 'MAILLOT EXTÉRIEUR DE LA NOUVELLE-ZÉLANDE 2023 – HOMME', 'Maillot officiel Nike extérieur de la Nouvelle-Zélande à la Coupe du Monde Féminine de la FIFA 2023™
Coupe droite pour plus de confort
100% polyester
La technologie Nike Dri-FIT évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort.
Ce maillot réplique reprend les composants du maillot porté par les pros.
Lavable en machine
Affichez votre soutien à la Nouvelle-Zélande dans sa quête du trophée de la Coupe du Monde Féminine avec le maillot Nike extérieur de la Nouvelle-Zélande pour la Coupe du Monde Féminine 2023. La technologie Dri-FIT de Nike évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort. Grâce à sa légèreté, vos performances seront toujours les meilleures jusqu''au coup de sifflet final. Grâce à ses composants faciles à laver et sécher, votre maillot sera toujours prêt pour le prochain entraînement ou match.');
insert into produit values (11, 1, 24, 3, 'MAILLOT DOMICILE ÉQUIPE DES ÉTATS-UNIS FÉMININE 2023 – HOMME', 'Maillot officiel Nike domicile des États-Unis à la Coupe du Monde Féminine de la FIFA 2023™
Coupe droite pour plus de confort
100% polyester
La technologie Nike Dri-FIT évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort.
Ce maillot réplique reprend les composants du maillot porté par les pros.
Lavable en machine
Affichez votre soutien aux États-Unis dans leur quête du trophée de la Coupe du Monde Féminine avec le maillot Nike domicile des États-Unis pour la Coupe du Monde Féminine 2023. La technologie Dri-FIT de Nike évacue la transpiration pour une évaporation plus rapide, vous permettant de rester au sec et de bénéficier d''un maximum de confort. Grâce à sa légèreté, vos performances seront toujours les meilleures jusqu''au coup de sifflet final. Grâce à ses composants faciles à laver et sécher, votre maillot sera toujours prêt pour le prochain entraînement ou match.');
insert into produit values (12, 1, 6, 3, 'T-SHIRT MULTICOLORE SUPPORTER AUSTRALIE COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Avec ce t-shirt léger en polyester, arborez avec fierté les couleurs de votre nation et encouragez votre équipe pendant la Coupe du Monde Féminine de la FIFA™ ! Quoi de mieux pour encourager fièrement votre pays que ce t-shirt supporter en polyester doux au toucher !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Coupe droite
100% polyester');
insert into produit values (13, 1, 41, 3, 'ÉCHARPE NOUVELLE-ZÉLANDE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Cette écharpe de l’équipe de Nouvelle-Zélande vous permettra d’exprimer votre soutien sans faille envers votre équipe favorite, où que vous soyez !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% acrylique');
insert into produit values (14, 1, 54, 3, 'ÉCHARPE SUÈDE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Cette écharpe de l’équipe de Suède vous permettra d’exprimer votre soutien sans faille envers votre équipe favorite, où que vous soyez !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% acrylique');
insert into produit values (15, 1, NULL, 3, 'VESTE ROUGE SUPPORTER CANADA COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Que ce soit dans les gradins ou sur votre canapé, encouragez votre équipe avec cette veste de supporter légère et élégante.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% polyester');
insert into produit values (16, 1, NULL, 3, 'DOUDOUNE SANS MANCHE STRIP ART NOIR COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% polyester');
insert into produit values (17, 1, NULL, 3, 'BOB NOIR MASCOTTE COUPE DU MONDE FÉMININE DE LA FIFA 2023 – UNISEXE', 'Célébrez la neuvième édition de la plus prestigieuse des compétitions féminines en revêtant ce sweat à capuche à l’effigie de la mascotte officielle de la Coupe du Monde Féminine 2023 ! Jeune pingouin d’une espèce endémique de Nouvelle-Zélande et d’Australie, Tazuni joindra sa voix à celles des supporters de toutes les nations pour encourager les joueuses s’affrontant sur le terrain en Australie et Nouvelle-Zélande.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Coupe droite
100% coton');
insert into produit values (18, NULL, 34, 3, 'MAILLOT EXTÉRIEUR ITALIE ADIDAS – HOMMES', 'Coupe droite
Col rond côtelé
100% polyester recyclé
AEROREADY
Mesh de ventilation sous les bras
Manches côtelées
Coupe plus longue à l’arrière
Écusson italien cousu main
Fibre composée à 50 % de plastique Parley Ocean
Ce vêtement est composé à au moins 40% de matériaux recyclés
Un chef d''œuvre pour le plus grand des sports. Ce maillot extérieur de l’Italie doit son apparence unique à un matériau au cœur de la culture méditerranéenne depuis l’antiquité. Associés au lettrage « Italia » sur la nuque, les motifs marbrés du maillot mettent en lumière le tout nouveau partenariat conclu entre l’Italie et adidas. AEROREADY évacue l’humidité pour plus de confort. L’écusson cousu main la fierté des supporters.');
insert into produit values (19, NULL, 1, 3, 'MAILLOT EXTÉRIEUR ADIDAS ALLEMAGNE 2023 – FEMMES', 'Pour ce maillot adidas extérieur, le visuel accrocheur met à l’honneur les majestueuses forêts d’Allemagne. Conçu dans un esprit de confort maximal, il s’appuie sur la technologie absorbante AEROREADY et comporte des empiècements en mesh. Se découpant sur un imprimé hypnotique inspiré de la canopée, l’écusson brodé de la sélection vous permettra d’afficher votre fierté de supporter. Cette pièce est faite à partir d’une fibre composée pour moitié de Parley Ocean Plastic. Ce matériau fabriqué à partir de déchets plastiques collectés sur des îles, des plages et des littoraux lointains permet de limiter la pollution des océans. Ce maillot est composé au moins à 70% de matériaux recyclés.

Coupe droite
Col V côtelé
Double maille 100% polyester recyclé
Technologie absorbante AEROREADY
Empiècements en mesh sous les bras');
insert into produit values (20, NULL, 34, 3, 'MAILLOT DOMICILE ITALIE ADIDAS – HOMMES', 'Coupe droite
Col rond côtelé
100% polyester recyclé
AEROREADY
Mesh de ventilation sous les bras
Manches côtelées
Coupe plus longue à l’arrière
Écusson italien cousu main
L’Italie dans l’âme. Le marbre, qui occupe une place prépondérante dans la culture italienne, est l’élément central de la conception de ce superbe maillot. Au côté de détails dorés et du lettrage « Italia » sur la nuque, les veinures caractéristiques de la précieuse roche strient la couleur bleu du maillot. Confectionné par adidas pour les supporters, cette version du maillot intègre la technologie absorbante AEROREADY ainsi qu’un écusson cousu main.');
insert into produit values (21, 1, 3, 3, 'BALLON BLANC ANGLETERRE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Partout où vous jouez, inspirez-vous des plus grandes joueuses de la Coupe du Monde Féminine de la FIFA 2023 avec ce ballon aux couleurs de l’Angleterre.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
1,6 mm PVC
Taille 5');
insert into produit values (22, 1, 25, 3, 'BALLON BLEU FRANCE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Partout où vous jouez, inspirez-vous des plus grandes joueuses de la Coupe du Monde Féminine de la FIFA 2023 avec ce ballon aux couleurs de la France.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
1,6 mm PVC
Taille 5');
insert into produit values (23, 1, 11, 3, 'ÉCHARPE BRÉSIL COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Cette écharpe de l’équipe du Brésil vous permettra d’exprimer votre soutien sans faille envers votre équipe favorite, où que vous soyez !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% acrylique');
insert into produit values (24, 1, NULL, 3, 'T-SHIRT MULTICOLORE DRAPEAU AUSTRALIE COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Encouragez votre équipe pendant la Coupe du Monde Féminine de la FIFA 2023™ avec ce t-shirt supporter officiel.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Arborez avec fierté les couleurs de l’Australie !
100% coton poids moyen 150 g/m²');
insert into produit values (25, 1, 1, 3, 'SWEAT À CAPUCHE NOIR ALLEMAGNE COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Affichez votre soutien sans faille à votre pays pendant la Coupe du Monde Féminine de la FIFA 2023™. Quoi de mieux pour encourager votre équipe que ce sweat à capuche en laine polaire douce au toucher !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Arborez avec fierté les couleurs de l''Allemagne !
60% coton
40% polyester');
insert into produit values (26, 1, 23, 3, 'SWEAT À CAPUCHE BLEU MARINE ESPAGNE COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Affichez votre soutien sans faille à votre pays pendant la Coupe du Monde Féminine de la FIFA 2023™. Quoi de mieux pour encourager votre équipe que ce sweat à capuche en laine polaire douce au toucher !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Arborez avec fierté les couleurs de l’Espagne !
60% coton
40% polyester');
insert into produit values (27, 1, NULL, 3, 'PORTE-CLÉS 2D TROPHÉE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Produit dérivé sous licence officielle de la Coupe du Monde Féminine de la FIFA 2023™
Avec une réplique miniature du trophée de la Coupe du Monde Féminine de la FIFA™, qui symbolise l’aspect athlétique, le dynamisme et l’élégance du football féminin international
Avec le logo officiel de la Coupe du Monde Féminine de la FIFA 2023™, qui représente les 32 nations participantes 
Alliage zinc');
insert into produit values (28, 1, NULL, 3, 'RÉPLIQUE SOUS LICENCE DE LA COUPE DU MONDE FÉMININE DE LA FIFA 70 MM, ENCADRÉE', 'Réplique officielle du trophée de la Coupe du Monde Féminine de la FIFA™
Vendu avec la boîte de présentation
Édition collector
Acier');
insert into produit values (46, 1, 5, 3, 'ÉCHARPE ARGENTINE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Cette écharpe de l’équipe d’Argentine vous permettra d’exprimer votre soutien sans faille envers votre équipe favorite, où que vous soyez !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% acrylique');
insert into produit values (29, 1, 54, 3, 'MAILLOT EXTÉRIEUR ADIDAS SUÈDE 2023 – FEMMES', 'Inspiré de la majesté des glaciers étincelants de la Suède, ce maillot extérieur adidas prend des allures de signal de détresse face à l’urgence climatique. Conçu pour garantir un confort optimal sur le terrain comme en dehors, ce maillot allie technologie absorbante AEROREADY et empiècements latéraux en mesh pour une meilleure respiration. Avec son écusson brodé et l’inscription Sverige imprimée ton sur ton, ce maillot vous permettra d''afficher fièrement les couleurs de votre équipe favorite sur la plus prestigieuse des scènes. Cette pièce est faite à partir d’une fibre composée pour moitié de Parley Ocean Plastic. Ce matériau fabriqué à partir de déchets plastiques collectés sur des îles, des plages et des littoraux lointains permet de limiter la pollution des océans. Ce maillot est composé au moins à 70% de matériaux recyclés.

Coupe droite
Col ras-du-cou côtelé
Interlock 100% polyester recyclé
textile technique en 3D avec empiècements d’aération en mesh
Technologie absorbante AEROREADY
Poignets côtelés');
insert into produit values (30, NULL, NULL, 3, 'MAILLOT DOMICILE HAÏTI - HOMME', 'Maillot domicile officiel d’Haïti
100% polyester
Coupe ajustée
La technologie Thermic-Dry vous permet de rester au sec et à l’aise

CE QUE LE FOOTBALL SIGNIFIE POUR HAÏTI

Le football est le sport le plus populaire à Haïti.

Haïti est membre de la FIFA depuis 1934, membre de la CONCACAF depuis 1961 et membre de l’Union de Football des Caraïbes (CFU) depuis 1978. Leur seule et unique qualification pour la Coupe du monde de la FIFA ™ a eu lieu en 1974. Le football permet aux Haïtiens de se libérer de leurs difficultés quotidiennes. Ce sport incarne la devise inscrite sur le drapeau haïtien : l’union fait la force.');
insert into produit values (31, 1, NULL, 3, 'PELUCHE TAZUNI, MASCOTTE DE LA COUPE DU MONDE FÉMININE 2023 - PETITE TAILLE', 'Célébrez la 9e édition de la compétition reine du football féminin avec la peluche de la mascotte officielle de la Coupe du Monde Féminine de la FIFA 2023™ !

Jeune pingouin d’une espèce endémique de Nouvelle-Zélande et d’Australie, Tazuni joindra sa voix à celles des supporters de toutes les nations pour encourager les joueuses s’affrontant sur le terrain en Australie et Nouvelle-Zélande.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Peluche en matière douce
100% polyester
6x26x13 cm');
insert into produit values (32, 1, NULL, 3, 'BOB RÉVERSIBLE NOIR COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Montrez votre soutien aux nations participantes à la Coupe du Monde Féminine de la FIFA™ avec ce bob réversible !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
50% coton
50% polyester');
insert into produit values (33, 1, NULL, 3, 'PORTE-CLÉS LOGO MULTICOLORE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Produit dérivé sous licence officielle de la Coupe du Monde Féminine de la FIFA 2023™
Avec le logo officiel de la Coupe du Monde Féminine de la FIFA 2023™, composé de 32 carrés représentant les 32 nations participantes 
Porte-clés en métal (alliage de cuivre) estampé et plaqué or avec faux cloisonné');
insert into produit values (34, 1, 6, 3, 'SAC À CORDONS AUSTRALIE COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Gardez le nécessaire à portée de main partout où vous allez grâce à ce sac à cordons aux couleurs de l’une des deux nations hôtes, l’Australie.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Polyester');
insert into produit values (35, 1, NULL, 3, 'BONNET NOIR COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Montrez votre soutien aux nations participantes à la Coupe du Monde Féminine de la FIFA™ avec ce bonnet !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% polyester');
insert into produit values (36, 2, NULL, 3, 'BRACELET ROUGE/BLANC/BLEU MARINE COUPE DU MONDE 2022', 'Produits dérivés sous licence officielle Coupe du Monde de la FIFA, Qatar 2022
Sable de la mer Morte
Eau du mont Everest
100% silicone');
insert into produit values (37, 1, NULL, 3, 'T-SHIRT NOIR LOGO CERCLE GRIS COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – UNISEXE', 'Encouragez les équipes participant à la Coupe du Monde Féminine de la FIFA 2023™ avec ce t-shirt supporter officiel pour femmes.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% coton');
insert into produit values (38, 1, NULL, 3, 'BONNET PÉRUVIEN MULTICOLORE EN TRICOT TRANSFERT COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Montrez votre soutien aux nations participantes à la Coupe du Monde Féminine de la FIFA™ avec ce bonnet péruvien en tricot !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% polyester');
insert into produit values (39, 1, NULL, 3, 'BONNET À POMPON MULTICOLORE RÉPUBLIQUE DE CORÉE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Avec ce bonnet doux au toucher, encouragez votre équipe lors de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™ qu’importe où vous soyez.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Arborez avec fierté les couleurs de la République de Corée !
100% polyester');
insert into produit values (40, 1, 24, 3, 'BALLON BLEU ÉTATS-UNIS COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Partout où vous jouez, inspirez-vous des plus grandes joueuses de la Coupe du Monde Féminine de la FIFA 2023 avec ce ballon aux couleurs des États-Unis.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
1,6 mm PVC
Taille 5');
insert into produit values (41, 1, 5, 3, 'CASQUETTE MULTICOLORE SUPPORTER ARGENTINE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Préparez-vous à encourager votre équipe lors de la Coupe du Monde Féminine de la FIFA 2023™ avec cette casquette réglable 100 % coton.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Casquette taille unique réglable
100% coton croisé');
insert into produit values (42, NULL, 20, 3, 'MAILLOT DOMICILE DANEMARK - HOMME', 'Produit sous licence officielle Hummel
Réplique officielle maillot sélection nationale
Manches raglan
100% fibre polyester');
insert into produit values (43, 1, NULL, 3, 'T-SHIRT ROSE MARQUE VERBALE COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Encouragez les équipes participant à la Coupe du Monde Féminine de la FIFA 2023™ avec ce t-shirt supporter officiel pour femmes.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% coton');
insert into produit values (44, 1, 41, 3, 'SWEAT À CAPUCHE NOIR NOUVELLE-ZÉLANDE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Affichez votre soutien sans faille à votre pays pendant la Coupe du Monde Féminine de la FIFA 2023™. Quoi de mieux pour encourager votre équipe que ce sweat à capuche en laine polaire douce au toucher !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Arborez avec fierté les couleurs de la Nouvelle-Zélande !
60% coton
40% polyester');
insert into produit values (45, 1, 41, 3, 'SAC À CORDONS NOUVELLE-ZÉLANDE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Gardez le nécessaire à portée de main partout où vous allez grâce à ce sac à cordons aux couleurs de l’une des deux nations hôtes, la Nouvelle-Zélande.
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
Polyester');
insert into produit values (47, 1, NULL, 3, 'GOURDE IMPRESSION 360 DEGRÉS COUPE DU MONDE FÉMININE DE LA FIFA 2023', 'Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence');
insert into produit values (48, 1, NULL, 3, 'VESTE DE SURVÊTEMENT BLEUE COUPE DU MONDE FÉMININE DE LA FIFA 2023™ – FEMME', 'Avec son design épuré et son splendide logo de la compétition, cette veste de survêtement pour femme célèbre les exploits des joueuses qui participent à la Coupe du Monde Féminine de la FIFA 2023™ !

Produit dérivé officiel de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™ sous licence.
Maille 100% polyester brossé');
insert into produit values (49, 1, NULL, 3, 'BALLON ADIDAS OCEAUNZ CLUB – TAILLE 4', 'Ballon officiel Coupe du Monde Féminine 2023 club
Ballon de taille 4 
100% TPU
Vessie en caoutchouc
Logo Coupe du Monde Féminine de la FIFA imprimé
La nature prend le dessus avec le ballon officiel de la Coupe du Monde Féminine. Inspiré par les rivages australiens et néo-zélandais, ce ballon adidas Oceaunz Club arbore des motifs évoquant des vagues et divers détails emblématiques. Il célèbre la connexion des pays hôtes avec la Terre et les océans.');
insert into produit values (50, 1, 34, 3, 'ÉCHARPE ITALIE COUPE DU MONDE FÉMININE DE LA FIFA 2023™', 'Cette écharpe de l’équipe d''Italie vous permettra d’exprimer votre soutien sans faille envers votre équipe favorite, où que vous soyez !
Produits dérivés officiels de la Coupe du Monde Féminine de la FIFA, Australie & Nouvelle-Zélande 2023™sous licence
100% acrylique');


--
-- TOC entry 3993 (class 0 OID 1213437)
-- Dependencies: 214
-- Data for Name: associationproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into associationproduit values (38, 48);
insert into associationproduit values (26, 34);
insert into associationproduit values (43, 25);
insert into associationproduit values (41, 19);
insert into associationproduit values (8, 36);
insert into associationproduit values (33, 13);
insert into associationproduit values (19, 16);
insert into associationproduit values (27, 28);
insert into associationproduit values (30, 16);
insert into associationproduit values (30, 15);
insert into associationproduit values (48, 31);
insert into associationproduit values (42, 50);
insert into associationproduit values (23, 13);
insert into associationproduit values (45, 35);
insert into associationproduit values (43, 2);
insert into associationproduit values (50, 40);
insert into associationproduit values (30, 20);
insert into associationproduit values (7, 16);
insert into associationproduit values (28, 18);
insert into associationproduit values (21, 1);
insert into associationproduit values (1, 37);
insert into associationproduit values (26, 40);
insert into associationproduit values (22, 6);
insert into associationproduit values (28, 49);
insert into associationproduit values (11, 29);
insert into associationproduit values (29, 4);
insert into associationproduit values (35, 34);
insert into associationproduit values (30, 28);
insert into associationproduit values (47, 10);
insert into associationproduit values (30, 2);
insert into associationproduit values (40, 46);
insert into associationproduit values (39, 33);
insert into associationproduit values (2, 47);
insert into associationproduit values (28, 46);
insert into associationproduit values (28, 19);
insert into associationproduit values (8, 16);
insert into associationproduit values (33, 10);
insert into associationproduit values (23, 30);
insert into associationproduit values (11, 23);
insert into associationproduit values (37, 9);
insert into associationproduit values (17, 10);
insert into associationproduit values (38, 14);
insert into associationproduit values (20, 13);
insert into associationproduit values (50, 47);
insert into associationproduit values (44, 39);
insert into associationproduit values (47, 45);
insert into associationproduit values (2, 7);
insert into associationproduit values (5, 2);


--
-- TOC entry 3995 (class 0 OID 1213444)
-- Dependencies: 216
-- Data for Name: blog; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into blog values (1, 13, 'Blog de la Coupe du Monde', 'À l''issue d''une finale à rebondissements, l''Argentine est devenue championne du monde en battant la France', '2022-12-18', 'L''Argentine a dominé les débats jusqu''à la 80ème minute, Messi sur penalty (23'') et Angel Di Maria (36'') donnant une avance de deux buts aux Sud-Américains. Puis la France a recollé au score en moins de deux minutes, Mbappé des 11 mètres (80'') et d''une superbe volée (81'') se chargeant de la remettre dans le match.

Buteur à nouveau dans la prolongation (109''), Messi a été proche de libérer les siens sans en passer par les tirs au but, mais Mbappé a remis les pendules à la 118ème minute, sur penalty à nouveau. Il a donc fallu l''épreuve des penalties pour départager les deux équipes et à ce jeu, c''est l''Argentine qui est sortie vainqueur suite aux échecs de Kingsley Coman et d''Aurélien Tchouaméni. Cruel pour la France, mais pas immérité pour l''Argentine au regard de 120 minutes de jeu de très haute intensité. Festival de Fans
﻿Alors que la Coupe du Monde de la FIFA, Qatar 2022™ s’apprête à livrer son verdict, le FIFA Fan Festival™ au parc Al Bidda de Doha, au Qatar, totalise plus de 1,8 million d’entrées. Tout au long de la compétition, les visiteurs ont pu suivre la retransmission des matches en direct, mais aussi profiter des nombreuses activités à l’affiche.

Le FIFA Fan Festival™ a ouvert ses portes le samedi 19 novembre 2022. Il s’est depuis établi comme un point de ralliement pour les supporters qatariens et internationaux, avec ses retransmissions sur un écran géant de 1 800m². Entre les matches, le public a pu profiter de concerts gratuits de grands noms de la musique');
insert into blog values (2, 16, 'Blog de la Coupe du Monde (29 Nov. - 02 Déc.)', 'Le Cameroun avait besoin d’un succès contre le Brésil, et d’un résultat favorable dans l’autre rencontre du Groupe G entre la Serbie et la Suisse pour décrocher une qualification pour les huitièmes de finale de la Coupe du Monde de la FIFA, Qatar 2022. ', '2022-11-29', 'La Nati domine la Serbie et se qualifie

C’est pratiquement une finale qui attendait la Serbie et la Suisse en clôture du Groupe G de la Coupe du Monde de la FIFA, Qatar 2022, dominé par le Brésil. La Nati pouvait se contenter du nul, alors que les Serbes avaient besoin des trois points. Ils ont cru les tenir en menant au score grâce aux buts d’Aleksandar Mitrovic et Dusan Vlahovic pour répondre à l’ouverture du score précoce de Xherdan Shaqiri. Mais une superbe action collective conclue par Breel Embolo, et un but signé Remo Freuler ont permis aux Helvètes de décrocher un précieux succès et de réserver une place en huitièmes de finale. Pour sa part, la Serbie quitte le tournoi avec un seul point au compteur. En décembre 2021, lors de son élection à la présidence de la Fédération Camerounaise de Football, Samuel Eto’o avait juré de "lancer le chantier de la reconstruction du football" dans son pays. Un an plus tard, chantier et reconstruction ont bien eu lieu : un billet pour la Coupe du Monde de la FIFA 2022 a été décroché huit ans après une participation à Brésil 2014 décevante… et le Centre Technique National d’Odza a fait peau neuve après de longs mois de travaux, lesquels avaient d’ailleurs débuté sous la présidence de Seidou Mbombo Njoya en 2020.

Mais un autre chantier attend le Cameroun﻿ ce soir... Les Lions Indomptables affrontent le Brésil pour une place en huitième de finale de Qatar 2022. Coup d''envoi 20h00 CET.');
insert into blog values (3, 20, 'Blog de la Coupe du Monde (18-22 Nov)', 'Maximiser le développement du football est parmi les principaux objectifs de la Vision de la FIFA 2020-2023. Et encourager la construction d’infrastructures est l’un des moyens pour l’atteindre.', '2022-11-18', 'Maximiser le développement du football est parmi les principaux objectifs de la Vision de la FIFA 2020-2023. Et encourager la construction d’infrastructures est l’un des moyens pour l’atteindre.  C’est dans ce cadre que l’instance dirigeante du football mondial a soutenu un projet, en Tunisie, visant à construire et rénover des infrastructures du Centre Technique de sa Fédération de Football. "Le football tunisien, et l’équipe nationale en particulier, en avait grandement besoin. Ces infrastructures apporteront du confort pour les joueurs. Par ce genre de projet, le football tunisien tend vers le professionnalisme. Je suis convaincu que le succès passe par des outils de ce type" - Youssef Msakni 

Msakni portera le brassard de capitaine pour l''entrée en lice de la Tunisie face au Danemark. Temps additionnel
"Nous recommandons à nos arbitres d''être très précis dans le calcul du temps à ajouter à la fin de chaque mi-temps afin de compenser le temps perdu à cause d''un type spécifique d''incident" - Pierluigi Collina, Président de la Commission des Arbitres de la  ');
insert into blog values (4, 24, 'Blog de la Coupe du Monde (03-06 Dec)', 'En attendant les matches du jour, revivez les meilleurs moments de la troisième journée des huitièmes de finale sur FIFA+.﻿', '2022-12-03', 'Largement supérieur à la Suisse, le Portugal passe avec fracas le cap des huitièmes de finale de la Coupe du Monde de la FIFA, Qatar 2022 ﻿et rejoint le Maroc en quart. Les Lions de l''Atlas en quart et dans l''Histoire
﻿Le Maroc et l’Espagne ont passé 120 minutes sur le terrain de l’Education City Stadium de Doha pour tenter de gagner leur place en quart de finale de la Coupe du Monde de la FIFA, Qatar 2022™. Mais cela n’a pas suffi aux deux équipes pour se départager. C’est donc aux tirs au but que s’est décidée l’issue de cet avant-dernier huitième de finale. Luis Enrique, l’entraîneur de la Roja, avait annoncé avant la rencontre que ses joueurs s’étaient entraînés à cette épreuve. Mais visiblement, pas assez, puisque les trois premiers tireurs espagnols ont manqué leur tentative. Et comme les Marocains en ont réussi deux sur trois dans le même temps, ce sont les Lions de l’Atlas qui créent la surprise et s’invitent dans le Grand Huit. Un exploit historique pour une équipe africaine puisque seuls le Cameroun (1990), le Sénégal (2002) et le Ghana (2010) avaient atteint ce stade auparavant. Un espace est dédié au programme Football For Schools au Musée olympique et sportif 3-2-1 de Doha. Le lundi 5 décembre, des enfants s''y sont entraînés avec deux FIFA Legends. ');
insert into blog values (5, 28, 'Blog de la Coupe du Monde (23-24 Nov)', 'Pour son entrée en lice dans la Coupe du Monde de la FIFA, Qatar 2022, le Brésil a eu besoin d''une mi-temps pour prendre la mesure d''une solide Serbie. ', '2022-11-22', 'Mais après la pause, les Auriverdes ont fait la différence avec un doublé - dont un bijou acrobatique - de Richarlison. La Seleçao prend par la même occasion la tête du Groupe G.﻿
"La Coupe du Monde fait tomber les barrières culturelles. Vous allez à la Coupe du Monde et ressentez du bonheur en voyant des gens du monde entier et de toutes religions, tous niveaux d''éducation et de tous milieux"

Le capitaine de la Seleção triomphante d''USA 1994 ﻿évoque la magie de la Coupe du Monde et le pouvoir rassembleur du ballon rond. Les étoiles de la Seleçao brillent face aux Black Stars

Dans le deuxième match du Groupe H de la Coupe du Monde de la FIFA, Qatar 2022, le Portugal s’est imposé face au Ghana au terme d’un match spectaculaire et riche en buts. Les joueurs vedettes de la Seleçao ont brillé, puisque Cristiano Ronaldo, João Félix et Rafael Leão ont trouvé le chemin des filets, alors que les Black Stars ont entretenu le suspense jusqu’au bout grâce à André Ayew et Ousman Bukari.');


--
-- TOC entry 3996 (class 0 OID 1213453)
-- Dependencies: 217
-- Data for Name: blogcontientphoto; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into blogcontientphoto values (1, 14);
insert into blogcontientphoto values (1, 15);
insert into blogcontientphoto values (2, 17);
insert into blogcontientphoto values (2, 18);
insert into blogcontientphoto values (2, 19);
insert into blogcontientphoto values (3, 21);
insert into blogcontientphoto values (3, 22);
insert into blogcontientphoto values (3, 23);
insert into blogcontientphoto values (4, 25);
insert into blogcontientphoto values (4, 26);
insert into blogcontientphoto values (4, 27);
insert into blogcontientphoto values (5, 29);
insert into blogcontientphoto values (5, 30);


--
-- TOC entry 3998 (class 0 OID 1213460)
-- Dependencies: 219
-- Data for Name: cartebancaire; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--



--
-- TOC entry 4000 (class 0 OID 1213468)
-- Dependencies: 221
-- Data for Name: categorieproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into categorieproduit values (1, 'Maillots', true);
insert into categorieproduit values (2, 'Vêtements', true);
insert into categorieproduit values (3, 'Accessoires', true);
insert into categorieproduit values (4, 'Objets de collection', true);
insert into categorieproduit values (5, 'Ballons', false);
insert into categorieproduit values (6, 'Couvre-chefs', false);
insert into categorieproduit values (7, 'Chaussettes', false);
insert into categorieproduit values (8, 'Sac à dos', false);
insert into categorieproduit values (9, 'Sacs', false);
insert into categorieproduit values (10, 'Porte-clé', false);
insert into categorieproduit values (11, 'T-Shirt', false);
insert into categorieproduit values (12, 'Pull', false);
insert into categorieproduit values (13, 'Veste', false);
insert into categorieproduit values (14, 'Doudoune', false);


--
-- TOC entry 4002 (class 0 OID 1213479)
-- Dependencies: 223
-- Data for Name: categoriecontientproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into categoriecontientproduit values (1, 3);
insert into categoriecontientproduit values (2, 3);
insert into categoriecontientproduit values (3, 1);
insert into categoriecontientproduit values (4, 3);
insert into categoriecontientproduit values (5, 4);
insert into categoriecontientproduit values (6, 2);
insert into categoriecontientproduit values (7, 4);
insert into categoriecontientproduit values (8, 1);
insert into categoriecontientproduit values (9, 1);
insert into categoriecontientproduit values (10, 1);
insert into categoriecontientproduit values (11, 1);
insert into categoriecontientproduit values (12, 2);
insert into categoriecontientproduit values (13, 3);
insert into categoriecontientproduit values (14, 3);
insert into categoriecontientproduit values (15, 2);
insert into categoriecontientproduit values (16, 2);
insert into categoriecontientproduit values (17, 3);
insert into categoriecontientproduit values (18, 1);
insert into categoriecontientproduit values (19, 1);
insert into categoriecontientproduit values (20, 1);
insert into categoriecontientproduit values (21, 4);
insert into categoriecontientproduit values (22, 4);
insert into categoriecontientproduit values (23, 3);
insert into categoriecontientproduit values (24, 2);
insert into categoriecontientproduit values (25, 2);
insert into categoriecontientproduit values (26, 2);
insert into categoriecontientproduit values (27, 4);
insert into categoriecontientproduit values (28, 4);
insert into categoriecontientproduit values (29, 1);
insert into categoriecontientproduit values (30, 1);
insert into categoriecontientproduit values (31, 4);
insert into categoriecontientproduit values (32, 3);
insert into categoriecontientproduit values (33, 4);
insert into categoriecontientproduit values (34, 4);
insert into categoriecontientproduit values (35, 3);
insert into categoriecontientproduit values (36, 3);
insert into categoriecontientproduit values (37, 2);
insert into categoriecontientproduit values (38, 3);
insert into categoriecontientproduit values (39, 3);
insert into categoriecontientproduit values (40, 4);
insert into categoriecontientproduit values (41, 3);
insert into categoriecontientproduit values (42, 1);
insert into categoriecontientproduit values (43, 2);
insert into categoriecontientproduit values (44, 2);
insert into categoriecontientproduit values (45, 3);
insert into categoriecontientproduit values (46, 3);
insert into categoriecontientproduit values (47, 4);
insert into categoriecontientproduit values (48, 2);
insert into categoriecontientproduit values (49, 4);
insert into categoriecontientproduit values (50, 3);
insert into categoriecontientproduit values (5, 5);
insert into categoriecontientproduit values (7, 5);
insert into categoriecontientproduit values (21, 5);
insert into categoriecontientproduit values (22, 5);
insert into categoriecontientproduit values (40, 5);
insert into categoriecontientproduit values (49, 5);
insert into categoriecontientproduit values (25, 12);
insert into categoriecontientproduit values (26, 12);
insert into categoriecontientproduit values (44, 12);


--
-- TOC entry 4023 (class 0 OID 1213577)
-- Dependencies: 244
-- Data for Name: langue; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into langue values (1, 'Afrikaans');
insert into langue values (2, 'Albanais');
insert into langue values (3, 'Allemand');
insert into langue values (4, 'Amharique');
insert into langue values (5, 'Anglais');
insert into langue values (6, 'Arabe');
insert into langue values (7, 'Arménien');
insert into langue values (8, 'Azéri');
insert into langue values (9, 'Bengali');
insert into langue values (10, 'Biélorusse');
insert into langue values (11, 'Birman');
insert into langue values (12, 'Bosniaque');
insert into langue values (13, 'Bulgare');
insert into langue values (14, 'Catalan');
insert into langue values (15, 'Cebuano');
insert into langue values (16, 'Chichewa');
insert into langue values (17, 'Chinois (simplifié)');
insert into langue values (18, 'Chinois (traditionnel)');
insert into langue values (19, 'Coréen');
insert into langue values (20, 'Créole haïtien');
insert into langue values (21, 'Croate');
insert into langue values (22, 'Danois');
insert into langue values (23, 'Espagnol');
insert into langue values (24, 'Espéranto');
insert into langue values (25, 'Estonien');
insert into langue values (26, 'Finnois');
insert into langue values (27, 'Français');
insert into langue values (28, 'Gaélique écossais');
insert into langue values (29, 'Galicien');
insert into langue values (30, 'Gallois');
insert into langue values (31, 'Géorgien');
insert into langue values (32, 'Grec');
insert into langue values (33, 'Gudjarati');
insert into langue values (34, 'Haoussa');
insert into langue values (35, 'Hawaïen');
insert into langue values (36, 'Hébreu');
insert into langue values (37, 'Hindi');
insert into langue values (38, 'Hmong');
insert into langue values (39, 'Hongrois');
insert into langue values (40, 'Igbo');
insert into langue values (41, 'Indonésien');
insert into langue values (42, 'Irlandais');
insert into langue values (43, 'Islandais');
insert into langue values (44, 'Italien');
insert into langue values (45, 'Japonais');
insert into langue values (46, 'Javanais');
insert into langue values (47, 'Kannada');
insert into langue values (48, 'Kazakh');
insert into langue values (49, 'Khmer');
insert into langue values (50, 'Kirghize');
insert into langue values (51, 'Kurde');
insert into langue values (52, 'Laotien');
insert into langue values (53, 'Latin');
insert into langue values (54, 'Letton');
insert into langue values (55, 'Lituanien');
insert into langue values (56, 'Luxembourgeois');
insert into langue values (57, 'Macédonien');
insert into langue values (58, 'Malais');
insert into langue values (59, 'Malayalam');
insert into langue values (60, 'Malgache');
insert into langue values (61, 'Maltais');
insert into langue values (62, 'Maori');
insert into langue values (63, 'Marathi');
insert into langue values (64, 'Mongol');
insert into langue values (65, 'Néerlandais');
insert into langue values (66, 'Népalais');
insert into langue values (67, 'Norvégien');
insert into langue values (68, 'Ouzbek');
insert into langue values (69, 'Pendjabi');
insert into langue values (70, 'Persan');
insert into langue values (71, 'Polonais');
insert into langue values (72, 'Portugais');
insert into langue values (73, 'Roumain');
insert into langue values (74, 'Russe');
insert into langue values (75, 'Sesotho');
insert into langue values (76, 'Sindhi');
insert into langue values (77, 'Singhalais');
insert into langue values (78, 'Slovaque');
insert into langue values (79, 'Slovène');
insert into langue values (80, 'Somali');
insert into langue values (81, 'Suédois');
insert into langue values (82, 'Swahili');
insert into langue values (83, 'Tadjik');
insert into langue values (84, 'Tagalog');
insert into langue values (85, 'Tamoul');
insert into langue values (86, 'Tchèque');
insert into langue values (87, 'Telugu');
insert into langue values (88, 'Thaï');
insert into langue values (89, 'Turc');
insert into langue values (90, 'Ukrainien');
insert into langue values (91, 'Urdu');
insert into langue values (92, 'Vietnamien');
insert into langue values (93, 'Yiddish');
insert into langue values (94, 'Yoruba');
insert into langue values (95, 'Zoulou');


--
-- TOC entry 4053 (class 0 OID 1213715)
-- Dependencies: 274
-- Data for Name: typelivraison; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into typelivraison values (1, 'Standard', 4, 9.00);
insert into typelivraison values (2, 'Express', 3, 16.50);


--
-- TOC entry 4055 (class 0 OID 1213723)
-- Dependencies: 276
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into utilisateur values (1, 27, 62, 156, NULL, '+33763408325', 'John', 'johndoe@gmail.com', 'CheatWolf', '1985-01-15', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (2, 27, 62, 21, NULL, '+33763408325', 'Alice', 'alicesmith@sfr.com', 'HadessRed', '1990-06-22', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (3, 27, 62, 140, NULL, '+33763408325', 'Michael', 'michaeljohnson@orange.com', 'TotoMr.', '1982-03-05', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (4, 27, 62, 62, NULL, '+33763408325', 'Emily', 'emilyanderson@free.com', 'TruckGamer', '1993-10-12', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (5, 27, 62, 102, NULL, '+33763408325', 'David', 'davidwilliams@yahoo.com', 'OscarGalactic', '1987-09-08', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (6, 27, 62, 8, NULL, '+33763408325', 'Sarah', 'sarahbrown@free.com', 'SnakeMoon', '1991-05-18', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (7, 27, 62, 124, NULL, '+33763408325', 'Robert', 'robertjones@hotmail.com', 'AmiboRider', '1980-07-25', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (8, 27, 62, 162, NULL, '+33763408325', 'Linda', 'lindadavis@gmail.com', 'PepitoStun', '1988-04-09', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (9, 27, 62, 107, NULL, '+33763408325', 'William', 'williammiller@orange.com', 'RoninBlack', '1975-06-30', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (10, 27, 62, 14, NULL, '+33763408325', 'Karen', 'karenwilson@sfr.com', 'BoeufPepito', '1986-11-14', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (11, 27, 62, 78, NULL, '+33763408325', 'James', 'jamesmoore@free.com', 'DinoFrost', '1981-08-03', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (12, 27, 62, 89, NULL, '+33763408325', 'Jennifer', 'jenniferharris@free.com', 'BlackDela', '1995-01-28', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (13, 27, 62, 160, NULL, '+33763408325', 'Charles', 'charlesclark@yahoo.com', 'DragonLag', '1979-07-07', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (14, 27, 62, 67, NULL, '+33763408325', 'Lisa', 'lisayoung@orange.com', 'DrakeRed', '1984-05-02', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (15, 27, 62, 10, NULL, '+33763408325', 'Daniel', 'danielhall@gmail.com', 'TyraGt', '1992-03-19', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (16, 27, 62, 62, NULL, '+33763408325', 'Margaret', 'margaretlewis@sfr.com', 'BloodBlood', '1983-09-04', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (17, 27, 62, 45, NULL, '+33763408325', 'Richard', 'richardking@free.com', 'MambaCraft', '1977-10-10', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (18, 27, 62, 92, NULL, '+33763408325', 'Susan', 'susanallen@free.com', 'BestCraft', '1989-04-01', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (19, 27, 62, 192, NULL, '+33763408325', 'Joseph', 'josephwright@hotmail.com', 'OmegaPredator', '1978-06-16', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (20, 27, 62, 79, NULL, '+33763408325', 'Nancy', 'nancyturner@yahoo.com', 'BannanaPython', '1994-02-11', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (21, 27, 62, 80, NULL, '+33763408325', 'Sophie', 'sophiemartin@sfr.com', 'SunCrazy', '1986-03-14', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (22, 27, 62, 62, NULL, '+33763408325', 'Matthew', 'matthewwhite@hotmail.com', 'AimGama', '1991-09-23', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (23, 27, 62, 132, NULL, '+33763408325', 'Ella', 'ellarobinson@free.com', 'ShadowToto', '1989-07-08', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (24, 27, 62, 10, NULL, '+33763408325', 'Oliver', 'oliverclark@gmail.com', 'GiveupDream', '1980-12-17', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (25, 27, 62, 73, NULL, '+33763408325', 'Mia', 'miahall@orange.com', 'PoseHyper', '1984-06-11', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (26, 27, 62, 59, NULL, '+33763408325', 'Noah', 'noahyoung@hotmail.com', 'DrStone', '1993-05-02', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (27, 27, 62, 181, NULL, '+33763408325', 'Lily', 'lilyturner@gmail.com', 'ViperThunder', '1987-08-25', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (28, 27, 62, 51, NULL, '+33763408325', 'Lucas', 'lucasdavies@sfr.com', 'WitcherSmall', '1982-01-29', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (29, 27, 62, 181, NULL, '+33763408325', 'Ava', 'avawilson@free.com', 'DeathAmibo', '1990-04-19', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (30, 27, 62, 62, NULL, '+33763408325', 'Liam', 'liamwright@hotmail.com', 'GokuChocolatine', '1983-03-05', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (31, 27, 62, 4, NULL, '+33763408325', 'Zoe', 'zoeharris@orange.com', 'NarutoSynn', '1995-10-12', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (32, 27, 62, 134, NULL, '+33763408325', 'James', 'jamesmoulin@free.com', 'FantasyCar', '1981-08-03', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (33, 27, 62, 62, NULL, '+33763408325', 'Sophia', 'sophiabrown@gmail.com', 'BoisPhantom', '1992-05-18', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (34, 27, 62, 52, NULL, '+33763408325', 'William', 'williamwilliams@sfr.com', 'FantasyHyper', '1988-09-02', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (35, 27, 62, 52, NULL, '+33763408325', 'Amelia', 'amelialewis@orange.com', 'FlyHyper', '1976-07-09', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (36, 27, 62, 118, NULL, '+33763408325', 'Oliver', 'oliverjackson@hotmail.com', 'OxygeneHack', '1994-11-21', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (37, 27, 62, 142, NULL, '+33763408325', 'Charlotte', 'charlottedavis@gmail.com', 'WarriorRiver', '1986-02-14', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (38, 27, 62, 67, NULL, '+33763408325', 'Liam', 'liamperez@sfr.com', 'FrenchCloud', '1993-04-27', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (39, 27, 62, 87, NULL, '+33763408325', 'Emma', 'emmahill@free.com', 'ShoqapikRiku', '1980-03-16', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (40, 27, 62, 1, NULL, '+33763408325', 'Henry', 'henrytaylor@yahoo.com', 'WarriorFrost', '1989-10-31', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (41, 27, 62, 8, NULL, '+33763408325', 'Ava', 'avaedwards@hotmail.com', 'NightMaster', '1992-12-06', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (42, 27, 62, 157, NULL, '+33763408325', 'Olivia', 'oliviascott@sfr.com', 'RexPickle', '1978-08-08', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (43, 27, 62, 134, NULL, '+33763408325', 'Lucas', 'lucasevans@gmail.com', 'SkillMamba', '1984-01-23', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (44, 27, 62, 62, NULL, '+33763408325', 'Sophia', 'sophiathomas@hotmail.com', 'NoobUranium', '1991-07-18', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (45, 27, 62, 118, NULL, '+33763408325', 'Noah', 'noahjohnson@orange.com', 'StunFish', '1985-05-04', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (46, 27, 62, 81, NULL, '+33763408325', 'Ella', 'ellamoore@free.com', 'DragonNinja', '1987-09-02', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (47, 27, 62, 10, NULL, '+33763408325', 'Mia', 'miawhite@yahoo.com', 'CovidFreestyle', '1994-06-07', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (48, 27, 62, 119, NULL, '+33763408325', 'Liam', 'liamwilson@sfr.com', 'CloudVador', '1990-12-15', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (49, 27, 62, 94, NULL, '+33763408325', 'Zoe', 'zoejackson@free.com', 'BadboyDocteur', '1983-03-19', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', NULL, NULL);
insert into utilisateur values (50, 27, 62, 59, NULL, '+33763408325', 'Oliver', 'oliverservice@orange.com', 'Service', '1979-11-10', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', 'service-expedition', '2023-08-13 00:00:00');
insert into utilisateur values (51, 27, 62, 59, NULL, '+33763408325', 'Oliver', 'olivervente@orange.com', 'Vente', '1979-11-10', '$2y$12$lQufeQnsaWKBM16vPl9X9.dgyGHIMDObCHDX7Z.aJUkk.i2ha1Hyq', 'service-vente', '2023-08-13 00:00:00');


--
-- TOC entry 4006 (class 0 OID 1213494)
-- Dependencies: 227
-- Data for Name: commande; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into commande values (1, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-08-13 00:00:00');
insert into commande values (2, 2, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 16.50, 0.20, false, NULL, '2023-11-13 00:00:00');
insert into commande values (3, 1, 16, 'Bordeaux', '25 Rue du Ciel', '33017', 'Bordeaux', '25 Rue du Ciel', '33017', 9.00, 0.20, false, NULL, '2023-08-05 00:00:00');
insert into commande values (4, 2, 3, 'Marseille', '8 Boulevard du Soleil', '13004', 'Marseille', '8 Boulevard du Soleil', '13004', 16.50, 0.20, true, NULL, '2023-10-05 00:00:00');
insert into commande values (5, 1, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 9.00, 0.20, false, NULL, '2023-11-26 00:00:00');
insert into commande values (6, 2, 21, 'Nantes', '28 Boulevard de la Mer', '44022', 'Nantes', '28 Boulevard de la Mer', '44022', 16.50, 0.20, false, NULL, '2023-11-28 00:00:00');
insert into commande values (7, 1, 33, 'Lyon', '27 Avenue du Bois', '69034', 'Lyon', '27 Avenue du Bois', '69034', 9.00, 0.20, false, NULL, '2023-09-21 00:00:00');
insert into commande values (8, 2, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 16.50, 0.20, true, NULL, '2023-09-23 00:00:00');
insert into commande values (9, 1, 12, 'Lyon', '16 Rue de la Rivière', '69013', 'Lyon', '16 Rue de la Rivière', '69013', 9.00, 0.20, true, NULL, '2023-09-23 00:00:00');
insert into commande values (10, 2, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 16.50, 0.20, true, NULL, '2023-11-09 00:00:00');
insert into commande values (11, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, true, NULL, '2023-09-23 00:00:00');
insert into commande values (12, 1, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 9.00, 0.20, true, NULL, '2023-11-07 00:00:00');
insert into commande values (13, 1, 12, 'Lyon', '16 Rue de la Rivière', '69013', 'Lyon', '16 Rue de la Rivière', '69013', 9.00, 0.20, false, NULL, '2023-10-28 00:00:00');
insert into commande values (14, 2, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 16.50, 0.20, false, NULL, '2023-11-20 00:00:00');
insert into commande values (15, 2, 3, 'Marseille', '8 Boulevard du Soleil', '13004', 'Marseille', '8 Boulevard du Soleil', '13004', 16.50, 0.20, true, NULL, '2023-10-07 00:00:00');
insert into commande values (16, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, false, NULL, '2023-07-21 00:00:00');
insert into commande values (17, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-10-08 00:00:00');
insert into commande values (18, 1, 20, 'Marseille', '9 Rue du Jardin', '13021', 'Marseille', '9 Rue du Jardin', '13021', 9.00, 0.20, false, NULL, '2023-10-30 00:00:00');
insert into commande values (19, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, true, NULL, '2023-11-21 00:00:00');
insert into commande values (20, 1, 2, 'Lyon', '23 Avenue de la Gare', '69003', 'Lyon', '23 Avenue de la Gare', '69003', 9.00, 0.20, true, NULL, '2023-09-07 00:00:00');
insert into commande values (21, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, true, NULL, '2023-10-23 00:00:00');
insert into commande values (22, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-10-17 00:00:00');
insert into commande values (23, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, false, NULL, '2023-08-05 00:00:00');
insert into commande values (24, 1, 3, 'Marseille', '8 Boulevard du Soleil', '13004', 'Marseille', '8 Boulevard du Soleil', '13004', 9.00, 0.20, false, NULL, '2023-07-24 00:00:00');
insert into commande values (25, 1, 16, 'Bordeaux', '25 Rue du Ciel', '33017', 'Bordeaux', '25 Rue du Ciel', '33017', 9.00, 0.20, false, NULL, '2023-08-26 00:00:00');
insert into commande values (26, 1, 34, 'Nice', '16 Boulevard des Vagues', '06035', 'Nice', '16 Boulevard des Vagues', '06035', 9.00, 0.20, false, NULL, '2023-08-29 00:00:00');
insert into commande values (27, 1, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 9.00, 0.20, false, NULL, '2023-07-06 00:00:00');
insert into commande values (28, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, false, NULL, '2023-10-11 00:00:00');
insert into commande values (29, 1, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 9.00, 0.20, false, NULL, '2023-11-18 00:00:00');
insert into commande values (30, 2, 20, 'Marseille', '9 Rue du Jardin', '13021', 'Marseille', '9 Rue du Jardin', '13021', 16.50, 0.20, false, NULL, '2023-07-06 00:00:00');
insert into commande values (31, 1, 1, 'Paris', '15 Rue de la Liberté', '75002', 'Paris', '15 Rue de la Liberté', '75002', 9.00, 0.20, false, NULL, '2023-10-09 00:00:00');
insert into commande values (32, 2, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 16.50, 0.20, false, NULL, '2023-09-10 00:00:00');
insert into commande values (33, 1, 1, 'Paris', '15 Rue de la Liberté', '75002', 'Paris', '15 Rue de la Liberté', '75002', 9.00, 0.20, false, NULL, '2023-09-18 00:00:00');
insert into commande values (34, 1, 20, 'Marseille', '9 Rue du Jardin', '13021', 'Marseille', '9 Rue du Jardin', '13021', 9.00, 0.20, false, NULL, '2023-09-22 00:00:00');
insert into commande values (35, 1, 2, 'Lyon', '23 Avenue de la Gare', '69003', 'Lyon', '23 Avenue de la Gare', '69003', 9.00, 0.20, false, NULL, '2023-11-14 00:00:00');
insert into commande values (36, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-10-01 00:00:00');
insert into commande values (37, 1, 9, 'Montpellier', '3 Boulevard des Champs', '34010', 'Montpellier', '3 Boulevard des Champs', '34010', 9.00, 0.20, false, NULL, '2023-11-08 00:00:00');
insert into commande values (38, 1, 31, 'Toulouse', '33 Avenue de la Colline', '31032', 'Toulouse', '33 Avenue de la Colline', '31032', 9.00, 0.20, false, NULL, '2023-09-02 00:00:00');
insert into commande values (39, 1, 20, 'Marseille', '9 Rue du Jardin', '13021', 'Marseille', '9 Rue du Jardin', '13021', 9.00, 0.20, false, NULL, '2023-07-10 00:00:00');
insert into commande values (40, 1, 19, 'Strasbourg', '5 Avenue du Paradis', '67020', 'Strasbourg', '5 Avenue du Paradis', '67020', 9.00, 0.20, true, NULL, '2023-10-13 00:00:00');
insert into commande values (41, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-10-28 00:00:00');
insert into commande values (42, 1, 31, 'Toulouse', '33 Avenue de la Colline', '31032', 'Toulouse', '33 Avenue de la Colline', '31032', 9.00, 0.20, false, NULL, '2023-10-30 00:00:00');
insert into commande values (43, 1, 34, 'Nice', '16 Boulevard des Vagues', '06035', 'Nice', '16 Boulevard des Vagues', '06035', 9.00, 0.20, false, NULL, '2023-10-10 00:00:00');
insert into commande values (44, 1, 30, 'Marseille', '20 Rue de la Cascade', '13031', 'Marseille', '20 Rue de la Cascade', '13031', 9.00, 0.20, false, NULL, '2023-09-25 00:00:00');
insert into commande values (45, 1, 3, 'Marseille', '8 Boulevard du Soleil', '13004', 'Marseille', '8 Boulevard du Soleil', '13004', 9.00, 0.20, false, NULL, '2023-09-12 00:00:00');
insert into commande values (46, 2, 16, 'Bordeaux', '25 Rue du Ciel', '33017', 'Bordeaux', '25 Rue du Ciel', '33017', 16.50, 0.20, false, NULL, '2023-10-20 00:00:00');
insert into commande values (47, 2, 9, 'Montpellier', '3 Boulevard des Champs', '34010', 'Montpellier', '3 Boulevard des Champs', '34010', 16.50, 0.20, false, NULL, '2023-08-29 00:00:00');
insert into commande values (48, 1, 35, 'Marseille', '38 Avenue de la Montagne', '13036', 'Marseille', '38 Avenue de la Montagne', '13036', 9.00, 0.20, true, NULL, '2023-11-21 00:00:00');
insert into commande values (49, 1, 13, 'Paris', '31 Avenue du Vent', '75014', 'Paris', '31 Avenue du Vent', '75014', 9.00, 0.20, false, NULL, '2023-09-17 00:00:00');
insert into commande values (50, 1, 30, 'Marseille', '20 Rue de la Cascade', '13031', 'Marseille', '20 Rue de la Cascade', '13031', 9.00, 0.20, false, NULL, '2023-11-10 00:00:00');
insert into commande values (51, 1, 3, 'Marseille', '8 Boulevard du Soleil', '13004', 'Marseille', '8 Boulevard du Soleil', '13004', 9.00, 0.20, false, NULL, '2023-10-27 00:00:00');
insert into commande values (52, 2, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 16.50, 0.20, false, NULL, '2023-07-13 00:00:00');
insert into commande values (53, 1, 22, 'Montpellier', '4 Rue du Champ', '34023', 'Montpellier', '4 Rue du Champ', '34023', 9.00, 0.20, true, NULL, '2023-09-11 00:00:00');
insert into commande values (54, 1, 31, 'Toulouse', '33 Avenue de la Colline', '31032', 'Toulouse', '33 Avenue de la Colline', '31032', 9.00, 0.20, false, NULL, '2023-11-13 00:00:00');
insert into commande values (55, 2, 35, 'Marseille', '38 Avenue de la Montagne', '13036', 'Marseille', '38 Avenue de la Montagne', '13036', 16.50, 0.20, false, NULL, '2023-11-04 00:00:00');
insert into commande values (56, 2, 14, 'Lille', '17 Rue du Lac', '59015', 'Lille', '17 Rue du Lac', '59015', 16.50, 0.20, false, NULL, '2023-09-12 00:00:00');
insert into commande values (57, 1, 14, 'Lille', '17 Rue du Lac', '59015', 'Lille', '17 Rue du Lac', '59015', 9.00, 0.20, false, NULL, '2023-10-02 00:00:00');
insert into commande values (58, 1, 12, 'Lyon', '16 Rue de la Rivière', '69013', 'Lyon', '16 Rue de la Rivière', '69013', 9.00, 0.20, false, NULL, '2023-11-01 00:00:00');
insert into commande values (59, 1, 8, 'Strasbourg', '42 Avenue de la Montagne', '67009', 'Strasbourg', '42 Avenue de la Montagne', '67009', 9.00, 0.20, true, NULL, '2023-11-18 00:00:00');
insert into commande values (60, 2, 35, 'Marseille', '38 Avenue de la Montagne', '13036', 'Marseille', '38 Avenue de la Montagne', '13036', 16.50, 0.20, false, NULL, '2023-10-19 00:00:00');
insert into commande values (61, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, false, NULL, '2023-09-26 00:00:00');
insert into commande values (62, 1, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 9.00, 0.20, false, NULL, '2023-08-22 00:00:00');
insert into commande values (63, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-07-30 00:00:00');
insert into commande values (64, 1, 13, 'Paris', '31 Avenue du Vent', '75014', 'Paris', '31 Avenue du Vent', '75014', 9.00, 0.20, false, NULL, '2023-09-18 00:00:00');
insert into commande values (65, 1, 35, 'Marseille', '38 Avenue de la Montagne', '13036', 'Marseille', '38 Avenue de la Montagne', '13036', 9.00, 0.20, false, NULL, '2023-09-23 00:00:00');
insert into commande values (66, 1, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 9.00, 0.20, false, NULL, '2023-07-16 00:00:00');
insert into commande values (67, 1, 14, 'Lille', '17 Rue du Lac', '59015', 'Lille', '17 Rue du Lac', '59015', 9.00, 0.20, true, NULL, '2023-11-13 00:00:00');
insert into commande values (68, 1, 21, 'Nantes', '28 Boulevard de la Mer', '44022', 'Nantes', '28 Boulevard de la Mer', '44022', 9.00, 0.20, false, NULL, '2023-11-06 00:00:00');
insert into commande values (69, 1, 26, 'Lille', '7 Rue de la Brise', '59027', 'Lille', '7 Rue de la Brise', '59027', 9.00, 0.20, false, NULL, '2023-11-15 00:00:00');
insert into commande values (70, 1, 32, 'Paris', '14 Rue du Vent', '75033', 'Paris', '14 Rue du Vent', '75033', 9.00, 0.20, false, NULL, '2023-11-13 00:00:00');
insert into commande values (71, 1, 18, 'Toulouse', '12 Rue de la Colline', '31019', 'Toulouse', '12 Rue de la Colline', '31019', 9.00, 0.20, false, NULL, '2023-10-19 00:00:00');
insert into commande values (72, 1, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 9.00, 0.20, false, NULL, '2023-08-06 00:00:00');
insert into commande values (73, 1, 24, 'Lyon', '13 Rue de la Prairie', '69025', 'Lyon', '13 Rue de la Prairie', '69025', 9.00, 0.20, false, NULL, '2023-10-21 00:00:00');
insert into commande values (74, 1, 6, 'Lille', '6 Rue de la Joie', '59007', 'Lille', '6 Rue de la Joie', '59007', 9.00, 0.20, true, NULL, '2023-07-07 00:00:00');
insert into commande values (75, 1, 21, 'Nantes', '28 Boulevard de la Mer', '44022', 'Nantes', '28 Boulevard de la Mer', '44022', 9.00, 0.20, false, NULL, '2023-07-25 00:00:00');
insert into commande values (76, 2, 31, 'Toulouse', '33 Avenue de la Colline', '31032', 'Toulouse', '33 Avenue de la Colline', '31032', 16.50, 0.20, false, NULL, '2023-11-24 00:00:00');
insert into commande values (77, 1, 14, 'Lille', '17 Rue du Lac', '59015', 'Lille', '17 Rue du Lac', '59015', 9.00, 0.20, false, NULL, '2023-10-14 00:00:00');
insert into commande values (78, 2, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 16.50, 0.20, false, NULL, '2023-08-19 00:00:00');
insert into commande values (79, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, true, NULL, '2023-07-21 00:00:00');
insert into commande values (80, 1, 16, 'Bordeaux', '25 Rue du Ciel', '33017', 'Bordeaux', '25 Rue du Ciel', '33017', 9.00, 0.20, false, NULL, '2023-11-15 00:00:00');
insert into commande values (81, 1, 17, 'Montpellier', '19 Avenue de la Cascade', '34018', 'Montpellier', '19 Avenue de la Cascade', '34018', 9.00, 0.20, true, NULL, '2023-10-28 00:00:00');
insert into commande values (82, 1, 1, 'Paris', '15 Rue de la Liberté', '75002', 'Paris', '15 Rue de la Liberté', '75002', 9.00, 0.20, false, NULL, '2023-09-20 00:00:00');
insert into commande values (83, 2, 24, 'Lyon', '13 Rue de la Prairie', '69025', 'Lyon', '13 Rue de la Prairie', '69025', 16.50, 0.20, false, NULL, '2023-07-18 00:00:00');
insert into commande values (84, 1, 8, 'Strasbourg', '42 Avenue de la Montagne', '67009', 'Strasbourg', '42 Avenue de la Montagne', '67009', 9.00, 0.20, true, NULL, '2023-10-02 00:00:00');
insert into commande values (85, 2, 26, 'Lille', '7 Rue de la Brise', '59027', 'Lille', '7 Rue de la Brise', '59027', 16.50, 0.20, false, NULL, '2023-08-24 00:00:00');
insert into commande values (86, 1, 13, 'Paris', '31 Avenue du Vent', '75014', 'Paris', '31 Avenue du Vent', '75014', 9.00, 0.20, false, NULL, '2023-10-03 00:00:00');
insert into commande values (87, 1, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 9.00, 0.20, false, NULL, '2023-07-17 00:00:00');
insert into commande values (88, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-12-08 00:00:00');
insert into commande values (89, 1, 25, 'Paris', '18 Avenue du Bois', '75026', 'Paris', '18 Avenue du Bois', '75026', 9.00, 0.20, false, NULL, '2023-07-20 00:00:00');
insert into commande values (90, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, false, NULL, '2023-08-26 00:00:00');
insert into commande values (91, 2, 19, 'Strasbourg', '5 Avenue du Paradis', '67020', 'Strasbourg', '5 Avenue du Paradis', '67020', 16.50, 0.20, false, NULL, '2023-08-26 00:00:00');
insert into commande values (92, 1, 27, 'Nice', '21 Boulevard de la Lune', '06028', 'Nice', '21 Boulevard de la Lune', '06028', 9.00, 0.20, false, NULL, '2023-08-19 00:00:00');
insert into commande values (93, 2, 16, 'Bordeaux', '25 Rue du Ciel', '33017', 'Bordeaux', '25 Rue du Ciel', '33017', 16.50, 0.20, true, NULL, '2023-08-01 00:00:00');
insert into commande values (94, 1, 5, 'Nice', '11 Avenue de la Paix', '06006', 'Nice', '11 Avenue de la Paix', '06006', 9.00, 0.20, true, NULL, '2023-11-09 00:00:00');
insert into commande values (95, 2, 11, 'Marseille', '10 Avenue de la Forêt', '13012', 'Marseille', '10 Avenue de la Forêt', '13012', 16.50, 0.20, false, NULL, '2023-11-08 00:00:00');
insert into commande values (96, 1, 9, 'Montpellier', '3 Boulevard des Champs', '34010', 'Montpellier', '3 Boulevard des Champs', '34010', 9.00, 0.20, true, NULL, '2023-07-28 00:00:00');
insert into commande values (97, 1, 22, 'Montpellier', '4 Rue du Champ', '34023', 'Montpellier', '4 Rue du Champ', '34023', 9.00, 0.20, true, NULL, '2023-09-02 00:00:00');
insert into commande values (98, 2, 32, 'Paris', '14 Rue du Vent', '75033', 'Paris', '14 Rue du Vent', '75033', 16.50, 0.20, true, NULL, '2023-10-02 00:00:00');
insert into commande values (99, 1, 13, 'Paris', '31 Avenue du Vent', '75014', 'Paris', '31 Avenue du Vent', '75014', 9.00, 0.20, false, NULL, '2023-11-28 00:00:00');
insert into commande values (100, 1, 2, 'Lyon', '23 Avenue de la Gare', '69003', 'Lyon', '23 Avenue de la Gare', '69003', 9.00, 0.20, false, NULL, '2023-10-01 00:00:00');


--
-- TOC entry 4008 (class 0 OID 1213506)
-- Dependencies: 229
-- Data for Name: commentaire; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into commentaire values (1, 48, 5, 'Quelle performance incroyable de l''équipe! Ils ont vraiment montré leur détermination sur le terrain.', '2023-02-16');
insert into commentaire values (2, 49, 2, 'Le joueur X est vraiment en feu en ce moment, il est indispensable pour l''équipe!', '2018-04-10');
insert into commentaire values (3, 29, 4, 'Les tactiques de l''entraîneur ont fait toute la différence dans ce match crucial.', '2022-04-18');
insert into commentaire values (4, 45, 3, 'Un match électrisant du début à la fin, c''est ça qu''on aime voir dans le football!', '2023-01-17');
insert into commentaire values (5, 20, 4, 'Les supporteurs étaient en feu aujourd''hui, leur énergie a porté l''équipe vers la victoire.', '2017-03-14');
insert into commentaire values (6, 41, 3, 'C''était un affrontement épique entre deux géants du football, chaque minute comptait!', '2018-03-09');
insert into commentaire values (7, 19, 2, 'Les jeunes talents de l''équipe montrent qu''ils ont un avenir brillant devant eux.', '2023-01-07');
insert into commentaire values (8, 36, 3, 'On sent vraiment que l''équipe travaille dur à l''entraînement, ça se voit sur le terrain.', '2021-06-24');
insert into commentaire values (9, 14, 4, 'Le gardien a été le héros du match, ses arrêts étaient tout simplement incroyables!', '2022-09-10');
insert into commentaire values (10, 40, 2, 'Il y a eu quelques moments de suspense, mais l''équipe a su garder son sang-froid.', '2017-10-20');
insert into commentaire values (11, 48, 5, 'Ils ont su capitaliser sur chaque opportunité, c''était impressionnant.', '2018-03-01');
insert into commentaire values (12, 28, 1, 'C''est là que le jeu prenait vie, un véritable chef d''orchestre.', '2019-12-08');
insert into commentaire values (13, 50, 3, 'Ils étaient infranchissables, une vraie muraille défensive.', '2019-02-26');
insert into commentaire values (14, 12, 4, 'Chaque corner était une chance de marquer, c''était magnifique à voir.', '2023-09-24');
insert into commentaire values (15, 44, 4, 'L''entraîneur a vraiment fait la différence, un choix tactique brillant.', '2023-07-04');
insert into commentaire values (16, 32, 1, 'Les joueurs entrants ont vraiment fait la différence, de superbes substitutions.', '2018-08-14');
insert into commentaire values (17, 46, 2, 'Chaque dribble était un régal pour les yeux, un vrai showman!', '2017-05-10');
insert into commentaire values (18, 38, 3, 'Ils n''ont pas baissé les bras, c''est ça la vraie mentalité de gagnant.', '2017-12-11');
insert into commentaire values (19, 12, 4, 'Il a été le dernier rempart, un véritable héros du match.', '2023-05-01');
insert into commentaire values (20, 36, 5, 'Ils ont joué en une-deux de manière magistrale, la défense était dépassée.', '2020-12-24');
insert into commentaire values (21, 39, 2, 'Ils ont joué avec une intensité incroyable, l''adversaire était dépassé.', '2019-01-08');
insert into commentaire values (22, 22, 1, 'Ils ont gagné presque tous les duels aériens, une véritable force dans les airs.', '2018-12-10');
insert into commentaire values (23, 45, 1, 'Chaque contre-attaque était une menace, l''efficacité était au rendez-vous.', '2023-08-28');
insert into commentaire values (24, 27, 1, 'Ils ont eu du mal sur les corners, c''est un aspect à travailler.', '2020-03-26');
insert into commentaire values (25, 11, 3, 'Il faut éviter de donner des occasions sur coups francs.', '2017-03-21');
insert into commentaire values (26, 48, 1, 'Les fautes tactiques ont été un élément clé pour stopper les attaques adverses.', '2019-04-01');
insert into commentaire values (27, 47, 1, 'C''est dommage, certaines occasions étaient vraiment à saisir.', '2018-09-14');
insert into commentaire values (28, 3, 3, 'Il faut être plus incisif dans les phases offensives.', '2023-09-27');
insert into commentaire values (29, 45, 1, 'Les tirs de loin ont vraiment mis la pression sur la défense adverse.', '2017-06-06');
insert into commentaire values (30, 29, 2, 'C''est important d''avoir cette cohésion d''équipe, ça se ressent sur le terrain.', '2020-05-25');


--
-- TOC entry 4012 (class 0 OID 1213523)
-- Dependencies: 233
-- Data for Name: couleur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into couleur values (1, 'Rouge', 'ff0000');
insert into couleur values (2, 'Jaune', 'ffff00');
insert into couleur values (3, 'Orange', 'ed7f10');
insert into couleur values (4, 'Rose', 'fd6c9e');
insert into couleur values (5, 'Vert', '008000');
insert into couleur values (6, 'Blanc', 'ffffff');
insert into couleur values (7, 'Violet', '7f00ff');
insert into couleur values (8, 'Noir', '000000');
insert into couleur values (9, 'Bleu', '0000ff');
insert into couleur values (10, 'Gris', '808080');


--
-- TOC entry 4014 (class 0 OID 1213531)
-- Dependencies: 235
-- Data for Name: document; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into document values (1, NULL, 'MBAPPE Détourne de l''argent', NULL, '2023-10-15', 'https://exemple.com/pdf1');
insert into document values (2, NULL, 'La FIFA est corrompue', NULL, '2017-06-30', 'https://exemple.com/pdf2');
insert into document values (3, NULL, 'Le document secret', NULL, '2022-04-19', 'https://exemple.com/pdf3');


--
-- TOC entry 4018 (class 0 OID 1213550)
-- Dependencies: 239
-- Data for Name: imageproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into imageproduit values (1, 'storage/produits/1_1.jpeg');
insert into imageproduit values (2, 'storage/produits/2_2.jpeg');
insert into imageproduit values (3, 'storage/produits/3_2.jpeg');
insert into imageproduit values (4, 'storage/produits/4_3.jpeg');
insert into imageproduit values (5, 'storage/produits/5_3.jpeg');
insert into imageproduit values (6, 'storage/produits/6_3.jpeg');
insert into imageproduit values (7, 'storage/produits/7_4.jpeg');
insert into imageproduit values (8, 'storage/produits/8_5.jpeg');
insert into imageproduit values (9, 'storage/produits/9_5.jpeg');
insert into imageproduit values (10, 'storage/produits/10_6.jpeg');
insert into imageproduit values (11, 'storage/produits/11_6.jpeg');
insert into imageproduit values (12, 'storage/produits/12_7.jpeg');
insert into imageproduit values (13, 'storage/produits/13_7.jpeg');
insert into imageproduit values (14, 'storage/produits/14_8.jpeg');
insert into imageproduit values (15, 'storage/produits/15_8.jpeg');
insert into imageproduit values (16, 'storage/produits/16_8.jpeg');
insert into imageproduit values (17, 'storage/produits/17_9.jpeg');
insert into imageproduit values (18, 'storage/produits/18_9.jpeg');
insert into imageproduit values (19, 'storage/produits/19_9.jpeg');
insert into imageproduit values (20, 'storage/produits/20_10.jpeg');
insert into imageproduit values (21, 'storage/produits/21_10.jpeg');
insert into imageproduit values (22, 'storage/produits/22_11.jpeg');
insert into imageproduit values (23, 'storage/produits/23_11.jpeg');
insert into imageproduit values (24, 'storage/produits/24_11.jpeg');
insert into imageproduit values (25, 'storage/produits/25_12.jpeg');
insert into imageproduit values (26, 'storage/produits/26_12.jpeg');
insert into imageproduit values (27, 'storage/produits/27_13.jpeg');
insert into imageproduit values (28, 'storage/produits/28_13.jpeg');
insert into imageproduit values (29, 'storage/produits/29_14.jpeg');
insert into imageproduit values (30, 'storage/produits/30_14.jpeg');
insert into imageproduit values (31, 'storage/produits/31_15.jpeg');
insert into imageproduit values (32, 'storage/produits/32_15.jpeg');
insert into imageproduit values (33, 'storage/produits/33_16.jpeg');
insert into imageproduit values (34, 'storage/produits/34_16.jpeg');
insert into imageproduit values (35, 'storage/produits/35_17.jpeg');
insert into imageproduit values (36, 'storage/produits/36_17.jpeg');
insert into imageproduit values (37, 'storage/produits/37_18.jpeg');
insert into imageproduit values (38, 'storage/produits/38_18.jpeg');
insert into imageproduit values (39, 'storage/produits/39_18.jpeg');
insert into imageproduit values (40, 'storage/produits/40_19.jpeg');
insert into imageproduit values (41, 'storage/produits/41_19.jpeg');
insert into imageproduit values (42, 'storage/produits/42_20.jpeg');
insert into imageproduit values (43, 'storage/produits/43_20.jpeg');
insert into imageproduit values (44, 'storage/produits/44_20.jpeg');
insert into imageproduit values (45, 'storage/produits/45_21.jpeg');
insert into imageproduit values (46, 'storage/produits/46_21.jpeg');
insert into imageproduit values (47, 'storage/produits/47_22.jpeg');
insert into imageproduit values (48, 'storage/produits/48_22.jpeg');
insert into imageproduit values (49, 'storage/produits/49_23.jpeg');
insert into imageproduit values (50, 'storage/produits/50_23.jpeg');
insert into imageproduit values (51, 'storage/produits/51_24.jpeg');
insert into imageproduit values (52, 'storage/produits/52_24.jpeg');
insert into imageproduit values (53, 'storage/produits/53_25.jpeg');
insert into imageproduit values (54, 'storage/produits/54_25.jpeg');
insert into imageproduit values (55, 'storage/produits/55_26.jpeg');
insert into imageproduit values (56, 'storage/produits/56_26.jpeg');
insert into imageproduit values (57, 'storage/produits/57_27.jpeg');
insert into imageproduit values (58, 'storage/produits/58_28.jpeg');
insert into imageproduit values (59, 'storage/produits/59_29.jpeg');
insert into imageproduit values (60, 'storage/produits/60_29.jpeg');
insert into imageproduit values (61, 'storage/produits/61_30.jpeg');
insert into imageproduit values (62, 'storage/produits/62_30.jpeg');
insert into imageproduit values (63, 'storage/produits/63_31.jpeg');
insert into imageproduit values (64, 'storage/produits/64_32.jpeg');
insert into imageproduit values (65, 'storage/produits/65_32.jpeg');
insert into imageproduit values (66, 'storage/produits/66_33.jpeg');
insert into imageproduit values (67, 'storage/produits/67_34.jpeg');
insert into imageproduit values (68, 'storage/produits/68_35.jpeg');
insert into imageproduit values (69, 'storage/produits/69_36.jpeg');
insert into imageproduit values (70, 'storage/produits/70_37.jpeg');
insert into imageproduit values (71, 'storage/produits/71_37.jpeg');
insert into imageproduit values (72, 'storage/produits/72_38.jpeg');
insert into imageproduit values (73, 'storage/produits/73_39.jpeg');
insert into imageproduit values (74, 'storage/produits/74_40.jpeg');
insert into imageproduit values (75, 'storage/produits/75_41.jpeg');
insert into imageproduit values (76, 'storage/produits/76_41.jpeg');
insert into imageproduit values (77, 'storage/produits/77_41.jpeg');
insert into imageproduit values (78, 'storage/produits/78_42.jpeg');
insert into imageproduit values (79, 'storage/produits/79_42.jpeg');
insert into imageproduit values (80, 'storage/produits/80_42.jpeg');
insert into imageproduit values (81, 'storage/produits/81_43.jpeg');
insert into imageproduit values (82, 'storage/produits/82_43.jpeg');
insert into imageproduit values (83, 'storage/produits/83_44.jpeg');
insert into imageproduit values (84, 'storage/produits/84_44.jpeg');
insert into imageproduit values (85, 'storage/produits/85_44.jpeg');
insert into imageproduit values (86, 'storage/produits/86_45.jpeg');
insert into imageproduit values (87, 'storage/produits/87_45.jpeg');
insert into imageproduit values (88, 'storage/produits/88_46.jpeg');
insert into imageproduit values (89, 'storage/produits/89_46.jpeg');
insert into imageproduit values (90, 'storage/produits/90_47.jpeg');
insert into imageproduit values (91, 'storage/produits/91_48.jpeg');
insert into imageproduit values (92, 'storage/produits/92_48.jpeg');
insert into imageproduit values (93, 'storage/produits/93_49.jpeg');
insert into imageproduit values (94, 'storage/produits/94_50.jpeg');
insert into imageproduit values (95, 'storage/produits/95_50.jpeg');
insert into imageproduit values (96, 'storage/produits/96_51.jpeg');
insert into imageproduit values (97, 'storage/produits/97_51.jpeg');
insert into imageproduit values (98, 'storage/produits/98_52.jpeg');
insert into imageproduit values (99, 'storage/produits/99_52.jpeg');
insert into imageproduit values (100, 'storage/produits/100_53.jpeg');
insert into imageproduit values (101, 'storage/produits/101_53.jpeg');
insert into imageproduit values (102, 'storage/produits/102_53.jpeg');
insert into imageproduit values (103, 'storage/produits/103_54.jpeg');
insert into imageproduit values (104, 'storage/produits/104_54.jpeg');
insert into imageproduit values (105, 'storage/produits/105_55.jpeg');
insert into imageproduit values (106, 'storage/produits/106_55.jpeg');
insert into imageproduit values (107, 'storage/produits/107_56.jpeg');
insert into imageproduit values (108, 'storage/produits/108_56.jpeg');
insert into imageproduit values (109, 'storage/produits/109_57.jpeg');
insert into imageproduit values (110, 'storage/produits/110_58.jpeg');
insert into imageproduit values (111, 'storage/produits/111_59.jpeg');
insert into imageproduit values (112, 'storage/produits/112_59.jpeg');
insert into imageproduit values (113, 'storage/produits/113_60.jpeg');
insert into imageproduit values (114, 'storage/produits/114_60.jpeg');
insert into imageproduit values (115, 'storage/produits/115_61.jpeg');
insert into imageproduit values (116, 'storage/produits/116_61.jpeg');
insert into imageproduit values (117, 'storage/produits/117_61.jpeg');
insert into imageproduit values (118, 'storage/produits/118_62.jpeg');
insert into imageproduit values (119, 'storage/produits/119_62.jpeg');
insert into imageproduit values (120, 'storage/produits/120_63.jpeg');
insert into imageproduit values (121, 'storage/produits/121_63.jpeg');
insert into imageproduit values (122, 'storage/produits/122_64.jpeg');
insert into imageproduit values (123, 'storage/produits/123_64.jpeg');
insert into imageproduit values (124, 'storage/produits/124_65.jpeg');
insert into imageproduit values (125, 'storage/produits/125_65.jpeg');
insert into imageproduit values (126, 'storage/produits/126_66.jpeg');
insert into imageproduit values (127, 'storage/produits/127_66.jpeg');
insert into imageproduit values (128, 'storage/produits/128_67.jpeg');
insert into imageproduit values (129, 'storage/produits/129_67.jpeg');
insert into imageproduit values (130, 'storage/produits/130_67.jpeg');
insert into imageproduit values (131, 'storage/produits/131_68.jpeg');
insert into imageproduit values (132, 'storage/produits/132_69.jpeg');
insert into imageproduit values (133, 'storage/produits/133_69.jpeg');


--
-- TOC entry 4051 (class 0 OID 1213707)
-- Dependencies: 272
-- Data for Name: trophee; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into trophee values (1, 'Mondial 1998');
insert into trophee values (2, 'Mondial 1999');
insert into trophee values (3, 'Coupe du Monde U-20 Féminine');
insert into trophee values (4, 'Coupe du Monde U-17 Féminine');
insert into trophee values (5, 'Coupe des Confédérations');
insert into trophee values (6, 'Coupe du Monde Club de la FIFA');
insert into trophee values (7, 'Joueur de la FIFA');
insert into trophee values (8, 'Entraîneur de la FIFA pour le football masculin');
insert into trophee values (9, 'Entraîneur de la FIFA pour le football féminin');
insert into trophee values (10, 'Mondial 1930');
insert into trophee values (11, 'Mondial 1934');
insert into trophee values (12, 'Mondial 1938');
insert into trophee values (13, 'Mondial 1950');
insert into trophee values (14, 'Mondial 1954');
insert into trophee values (15, 'Mondial 1958');
insert into trophee values (16, 'Mondial 1962');
insert into trophee values (17, 'Mondial 1966');
insert into trophee values (18, 'Mondial 1970');
insert into trophee values (19, 'Mondial 1974');
insert into trophee values (20, 'Mondial 1978');
insert into trophee values (21, 'Mondial 1982');
insert into trophee values (22, 'Mondial 1986');
insert into trophee values (23, 'Mondial 1990');
insert into trophee values (24, 'Mondial 1994');
insert into trophee values (25, 'Mondial 2002');
insert into trophee values (26, 'Mondial 2006');
insert into trophee values (27, 'Mondial 2010');
insert into trophee values (28, 'Mondial 2014');
insert into trophee values (29, 'Mondial 2018');
insert into trophee values (30, 'Coupe du Monde Féminine 1991');
insert into trophee values (31, 'Coupe du Monde Féminine 1995');
insert into trophee values (32, 'Coupe du Monde Féminine 2003');
insert into trophee values (33, 'Coupe du Monde Féminine 2007');
insert into trophee values (34, 'Coupe du Monde Féminine 2011');
insert into trophee values (35, 'Coupe du Monde Féminine 2015');
insert into trophee values (36, 'Coupe du Monde Féminine 2019');


--
-- TOC entry 4021 (class 0 OID 1213570)
-- Dependencies: 242
-- Data for Name: joueurcontienttrophee; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into joueurcontienttrophee values (10, 4);
insert into joueurcontienttrophee values (5, 5);
insert into joueurcontienttrophee values (4, 6);
insert into joueurcontienttrophee values (6, 7);
insert into joueurcontienttrophee values (5, 8);
insert into joueurcontienttrophee values (2, 9);
insert into joueurcontienttrophee values (5, 10);
insert into joueurcontienttrophee values (10, 11);
insert into joueurcontienttrophee values (8, 12);
insert into joueurcontienttrophee values (10, 13);
insert into joueurcontienttrophee values (9, 14);
insert into joueurcontienttrophee values (3, 15);
insert into joueurcontienttrophee values (6, 16);
insert into joueurcontienttrophee values (3, 17);
insert into joueurcontienttrophee values (2, 18);
insert into joueurcontienttrophee values (8, 19);
insert into joueurcontienttrophee values (3, 20);
insert into joueurcontienttrophee values (6, 21);
insert into joueurcontienttrophee values (1, 22);
insert into joueurcontienttrophee values (4, 23);


--
-- TOC entry 4046 (class 0 OID 1213686)
-- Dependencies: 267
-- Data for Name: tailleproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into tailleproduit values (1, 'XS');
insert into tailleproduit values (2, 'S');
insert into tailleproduit values (3, 'M');
insert into tailleproduit values (4, 'L');
insert into tailleproduit values (5, 'XL');
insert into tailleproduit values (6, 'XXL');
insert into tailleproduit values (7, 'XXXL');
insert into tailleproduit values (8, 'Taille unique');


--
-- TOC entry 4058 (class 0 OID 1213747)
-- Dependencies: 279
-- Data for Name: variantecouleurproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into variantecouleurproduit values (1, 1, 1, 32.00);
insert into variantecouleurproduit values (2, 2, 1, 68.00);
insert into variantecouleurproduit values (3, 3, 2, 134.00);
insert into variantecouleurproduit values (4, 4, 3, 53.00);
insert into variantecouleurproduit values (5, 5, 1, 38.00);
insert into variantecouleurproduit values (6, 6, 3, 89.00);
insert into variantecouleurproduit values (7, 7, 4, 113.00);
insert into variantecouleurproduit values (8, 8, 5, 143.00);
insert into variantecouleurproduit values (9, 9, 6, 131.00);
insert into variantecouleurproduit values (10, 10, 2, 136.00);
insert into variantecouleurproduit values (11, 11, 1, 45.00);
insert into variantecouleurproduit values (12, 12, 3, 35.00);
insert into variantecouleurproduit values (13, 13, 7, 22.00);
insert into variantecouleurproduit values (14, 14, 2, 69.00);
insert into variantecouleurproduit values (15, 15, 1, 8.00);
insert into variantecouleurproduit values (16, 16, 2, 10.00);
insert into variantecouleurproduit values (17, 17, 2, 66.00);
insert into variantecouleurproduit values (18, 18, 8, 66.00);
insert into variantecouleurproduit values (19, 19, 8, 52.00);
insert into variantecouleurproduit values (20, 20, 6, 111.00);
insert into variantecouleurproduit values (21, 21, 4, 141.00);
insert into variantecouleurproduit values (22, 22, 5, 119.00);
insert into variantecouleurproduit values (23, 23, 5, 61.00);
insert into variantecouleurproduit values (24, 24, 3, 18.00);
insert into variantecouleurproduit values (25, 25, 4, 132.00);
insert into variantecouleurproduit values (26, 26, 9, 36.00);
insert into variantecouleurproduit values (27, 27, 9, 45.00);
insert into variantecouleurproduit values (28, 28, 8, 136.00);
insert into variantecouleurproduit values (29, 29, 1, 9.00);
insert into variantecouleurproduit values (30, 30, 6, 135.00);
insert into variantecouleurproduit values (31, 31, 2, 53.00);
insert into variantecouleurproduit values (32, 32, 9, 107.00);
insert into variantecouleurproduit values (33, 33, 7, 76.00);
insert into variantecouleurproduit values (34, 34, 2, 150.00);
insert into variantecouleurproduit values (35, 35, 10, 140.00);
insert into variantecouleurproduit values (36, 36, 4, 88.00);
insert into variantecouleurproduit values (37, 37, 2, 142.00);
insert into variantecouleurproduit values (38, 38, 2, 143.00);
insert into variantecouleurproduit values (39, 39, 7, 41.00);
insert into variantecouleurproduit values (40, 40, 9, 105.00);
insert into variantecouleurproduit values (41, 41, 6, 70.00);
insert into variantecouleurproduit values (42, 42, 7, 101.00);
insert into variantecouleurproduit values (43, 43, 9, 50.00);
insert into variantecouleurproduit values (44, 44, 8, 23.00);
insert into variantecouleurproduit values (45, 45, 8, 58.00);
insert into variantecouleurproduit values (46, 46, 6, 44.00);
insert into variantecouleurproduit values (47, 47, 4, 75.00);
insert into variantecouleurproduit values (48, 48, 3, 10.00);
insert into variantecouleurproduit values (49, 49, 9, 5.00);
insert into variantecouleurproduit values (50, 50, 1, 126.00);
insert into variantecouleurproduit values (51, 17, 9, 93.00);
insert into variantecouleurproduit values (52, 12, 5, 63.00);
insert into variantecouleurproduit values (53, 8, 1, 130.00);
insert into variantecouleurproduit values (54, 46, 2, 113.00);
insert into variantecouleurproduit values (55, 2, 4, 22.00);
insert into variantecouleurproduit values (56, 7, 10, 100.00);
insert into variantecouleurproduit values (57, 38, 8, 80.00);
insert into variantecouleurproduit values (58, 34, 7, 95.00);
insert into variantecouleurproduit values (59, 46, 4, 139.00);
insert into variantecouleurproduit values (60, 37, 8, 132.00);
insert into variantecouleurproduit values (61, 8, 7, 22.00);
insert into variantecouleurproduit values (62, 30, 9, 47.00);
insert into variantecouleurproduit values (63, 16, 9, 66.00);
insert into variantecouleurproduit values (64, 37, 9, 67.00);
insert into variantecouleurproduit values (65, 21, 7, 136.00);
insert into variantecouleurproduit values (66, 15, 4, 89.00);
insert into variantecouleurproduit values (67, 42, 8, 36.00);
insert into variantecouleurproduit values (68, 34, 4, 93.00);
insert into variantecouleurproduit values (69, 32, 5, 89.00);


--
-- TOC entry 4025 (class 0 OID 1213585)
-- Dependencies: 246
-- Data for Name: lignecommande; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into lignecommande values (1, 40, 8, 1, 3, 105.00);
insert into lignecommande values (2, 8, 1, 1, 1, 143.00);
insert into lignecommande values (3, 13, 3, 1, 1, 22.00);
insert into lignecommande values (4, 10, 3, 1, 2, 136.00);
insert into lignecommande values (5, 42, 1, 2, 1, 101.00);
insert into lignecommande values (6, 43, 8, 2, 1, 50.00);
insert into lignecommande values (7, 18, 4, 2, 1, 66.00);
insert into lignecommande values (8, 23, 4, 2, 1, 61.00);
insert into lignecommande values (9, 41, 1, 3, 1, 70.00);
insert into lignecommande values (10, 34, 8, 3, 4, 150.00);
insert into lignecommande values (11, 39, 8, 3, 1, 41.00);
insert into lignecommande values (12, 10, 3, 4, 1, 136.00);
insert into lignecommande values (13, 43, 8, 4, 1, 50.00);
insert into lignecommande values (14, 17, 1, 4, 1, 66.00);
insert into lignecommande values (15, 3, 8, 4, 1, 134.00);
insert into lignecommande values (16, 49, 8, 5, 1, 5.00);
insert into lignecommande values (17, 50, 4, 5, 1, 126.00);
insert into lignecommande values (18, 9, 1, 5, 3, 131.00);
insert into lignecommande values (19, 10, 4, 5, 1, 136.00);
insert into lignecommande values (20, 29, 1, 6, 1, 9.00);
insert into lignecommande values (21, 39, 8, 6, 1, 41.00);
insert into lignecommande values (22, 30, 1, 6, 1, 135.00);
insert into lignecommande values (23, 23, 3, 6, 1, 61.00);
insert into lignecommande values (24, 15, 8, 7, 1, 8.00);
insert into lignecommande values (25, 25, 8, 7, 1, 132.00);
insert into lignecommande values (26, 18, 4, 7, 5, 66.00);
insert into lignecommande values (27, 16, 8, 7, 1, 10.00);
insert into lignecommande values (28, 4, 4, 7, 1, 53.00);
insert into lignecommande values (29, 42, 1, 7, 1, 101.00);
insert into lignecommande values (30, 6, 8, 8, 1, 89.00);
insert into lignecommande values (31, 25, 8, 8, 1, 132.00);
insert into lignecommande values (32, 24, 8, 8, 1, 18.00);
insert into lignecommande values (33, 2, 1, 8, 1, 68.00);
insert into lignecommande values (34, 10, 4, 8, 1, 136.00);
insert into lignecommande values (35, 7, 8, 8, 1, 113.00);
insert into lignecommande values (36, 14, 1, 9, 1, 69.00);
insert into lignecommande values (37, 35, 1, 9, 3, 140.00);
insert into lignecommande values (38, 36, 1, 9, 1, 88.00);
insert into lignecommande values (39, 20, 1, 9, 1, 111.00);
insert into lignecommande values (40, 29, 1, 10, 1, 9.00);
insert into lignecommande values (41, 1, 4, 10, 1, 32.00);
insert into lignecommande values (43, 2, 1, 10, 1, 68.00);
insert into lignecommande values (44, 46, 8, 10, 1, 44.00);
insert into lignecommande values (45, 35, 1, 10, 1, 140.00);
insert into lignecommande values (46, 5, 8, 11, 1, 38.00);
insert into lignecommande values (47, 45, 1, 11, 1, 58.00);
insert into lignecommande values (48, 21, 8, 12, 1, 141.00);
insert into lignecommande values (49, 39, 8, 12, 1, 41.00);
insert into lignecommande values (50, 46, 8, 12, 1, 44.00);
insert into lignecommande values (51, 4, 3, 13, 1, 53.00);
insert into lignecommande values (52, 6, 8, 13, 1, 89.00);
insert into lignecommande values (53, 12, 8, 13, 1, 35.00);
insert into lignecommande values (54, 43, 8, 13, 1, 50.00);
insert into lignecommande values (55, 33, 8, 13, 1, 76.00);
insert into lignecommande values (56, 16, 8, 13, 1, 10.00);
insert into lignecommande values (57, 11, 1, 13, 1, 45.00);
insert into lignecommande values (58, 25, 8, 13, 1, 132.00);
insert into lignecommande values (59, 46, 8, 14, 1, 44.00);
insert into lignecommande values (60, 4, 3, 14, 1, 53.00);
insert into lignecommande values (61, 26, 8, 14, 1, 36.00);
insert into lignecommande values (62, 48, 8, 14, 1, 10.00);
insert into lignecommande values (63, 34, 8, 14, 1, 150.00);
insert into lignecommande values (64, 10, 4, 15, 1, 136.00);
insert into lignecommande values (65, 32, 1, 15, 1, 107.00);
insert into lignecommande values (66, 33, 8, 15, 2, 76.00);
insert into lignecommande values (67, 28, 8, 15, 1, 136.00);
insert into lignecommande values (68, 6, 8, 15, 1, 89.00);
insert into lignecommande values (69, 50, 3, 15, 2, 126.00);
insert into lignecommande values (70, 7, 8, 15, 1, 113.00);
insert into lignecommande values (71, 26, 8, 16, 1, 36.00);
insert into lignecommande values (72, 48, 8, 16, 1, 10.00);
insert into lignecommande values (73, 24, 8, 16, 1, 18.00);
insert into lignecommande values (74, 45, 1, 16, 1, 58.00);
insert into lignecommande values (75, 8, 1, 16, 1, 143.00);
insert into lignecommande values (77, 38, 3, 16, 3, 143.00);
insert into lignecommande values (78, 50, 4, 16, 1, 126.00);
insert into lignecommande values (79, 44, 8, 17, 1, 23.00);
insert into lignecommande values (80, 12, 8, 17, 1, 35.00);
insert into lignecommande values (81, 49, 8, 17, 1, 5.00);
insert into lignecommande values (83, 40, 8, 17, 1, 105.00);
insert into lignecommande values (84, 49, 8, 18, 1, 5.00);
insert into lignecommande values (85, 41, 1, 18, 1, 70.00);
insert into lignecommande values (86, 31, 8, 18, 1, 53.00);
insert into lignecommande values (87, 33, 8, 18, 1, 76.00);
insert into lignecommande values (88, 50, 4, 18, 1, 126.00);
insert into lignecommande values (89, 2, 1, 18, 1, 68.00);
insert into lignecommande values (90, 24, 8, 19, 1, 18.00);
insert into lignecommande values (91, 20, 1, 19, 1, 111.00);
insert into lignecommande values (92, 4, 3, 19, 1, 53.00);
insert into lignecommande values (93, 7, 8, 20, 3, 113.00);
insert into lignecommande values (94, 41, 1, 20, 1, 70.00);
insert into lignecommande values (95, 46, 8, 20, 1, 44.00);
insert into lignecommande values (96, 38, 4, 20, 1, 143.00);
insert into lignecommande values (97, 8, 1, 20, 1, 143.00);
insert into lignecommande values (98, 40, 8, 21, 1, 105.00);
insert into lignecommande values (99, 24, 8, 21, 1, 18.00);
insert into lignecommande values (101, 14, 1, 21, 1, 69.00);
insert into lignecommande values (102, 34, 8, 22, 1, 150.00);
insert into lignecommande values (103, 3, 8, 22, 2, 134.00);
insert into lignecommande values (104, 48, 8, 22, 1, 10.00);
insert into lignecommande values (105, 45, 1, 22, 1, 58.00);
insert into lignecommande values (106, 23, 4, 22, 1, 61.00);
insert into lignecommande values (107, 41, 1, 23, 1, 70.00);
insert into lignecommande values (108, 47, 8, 23, 1, 75.00);
insert into lignecommande values (109, 24, 8, 23, 1, 18.00);
insert into lignecommande values (110, 26, 8, 23, 1, 36.00);
insert into lignecommande values (111, 23, 4, 23, 1, 61.00);
insert into lignecommande values (112, 17, 1, 23, 2, 66.00);
insert into lignecommande values (113, 38, 3, 23, 3, 143.00);
insert into lignecommande values (114, 33, 8, 24, 1, 76.00);
insert into lignecommande values (115, 1, 4, 24, 1, 32.00);
insert into lignecommande values (116, 25, 8, 24, 1, 132.00);
insert into lignecommande values (117, 35, 1, 24, 1, 140.00);
insert into lignecommande values (118, 34, 8, 24, 1, 150.00);
insert into lignecommande values (119, 8, 1, 24, 1, 143.00);
insert into lignecommande values (120, 45, 1, 25, 3, 58.00);
insert into lignecommande values (121, 27, 8, 25, 1, 45.00);
insert into lignecommande values (122, 2, 1, 25, 1, 68.00);
insert into lignecommande values (124, 25, 8, 26, 2, 132.00);
insert into lignecommande values (125, 8, 1, 26, 2, 143.00);
insert into lignecommande values (126, 20, 1, 26, 1, 111.00);
insert into lignecommande values (127, 15, 8, 26, 1, 8.00);
insert into lignecommande values (128, 30, 1, 26, 1, 135.00);
insert into lignecommande values (129, 50, 3, 26, 1, 126.00);
insert into lignecommande values (130, 27, 8, 27, 1, 45.00);
insert into lignecommande values (131, 22, 8, 27, 1, 119.00);
insert into lignecommande values (132, 43, 8, 27, 1, 50.00);
insert into lignecommande values (133, 48, 8, 27, 1, 10.00);
insert into lignecommande values (134, 1, 3, 27, 1, 32.00);
insert into lignecommande values (135, 46, 8, 27, 1, 44.00);
insert into lignecommande values (136, 14, 1, 27, 5, 69.00);
insert into lignecommande values (137, 17, 1, 28, 1, 66.00);
insert into lignecommande values (138, 12, 8, 28, 3, 35.00);
insert into lignecommande values (139, 42, 1, 28, 1, 101.00);
insert into lignecommande values (140, 10, 4, 28, 1, 136.00);
insert into lignecommande values (142, 31, 8, 29, 2, 53.00);
insert into lignecommande values (143, 17, 1, 29, 1, 66.00);
insert into lignecommande values (144, 13, 3, 29, 1, 22.00);
insert into lignecommande values (145, 32, 1, 29, 1, 107.00);
insert into lignecommande values (146, 10, 3, 29, 2, 136.00);
insert into lignecommande values (147, 41, 1, 29, 1, 70.00);
insert into lignecommande values (148, 41, 1, 30, 1, 70.00);
insert into lignecommande values (149, 29, 1, 30, 2, 9.00);
insert into lignecommande values (150, 40, 8, 31, 1, 105.00);
insert into lignecommande values (151, 41, 1, 31, 1, 70.00);
insert into lignecommande values (152, 28, 8, 31, 1, 136.00);
insert into lignecommande values (153, 1, 3, 31, 1, 32.00);
insert into lignecommande values (154, 6, 8, 31, 1, 89.00);
insert into lignecommande values (155, 47, 8, 31, 1, 75.00);
insert into lignecommande values (156, 44, 8, 32, 3, 23.00);
insert into lignecommande values (157, 9, 1, 32, 1, 131.00);
insert into lignecommande values (158, 4, 3, 32, 1, 53.00);
insert into lignecommande values (159, 18, 3, 32, 1, 66.00);
insert into lignecommande values (160, 50, 4, 32, 5, 126.00);
insert into lignecommande values (161, 5, 8, 32, 1, 38.00);
insert into lignecommande values (162, 10, 3, 33, 1, 136.00);
insert into lignecommande values (163, 19, 1, 33, 1, 52.00);
insert into lignecommande values (164, 13, 4, 33, 1, 22.00);
insert into lignecommande values (165, 4, 4, 33, 3, 53.00);
insert into lignecommande values (166, 6, 8, 33, 1, 89.00);
insert into lignecommande values (167, 3, 8, 33, 2, 134.00);
insert into lignecommande values (169, 30, 1, 34, 1, 135.00);
insert into lignecommande values (170, 34, 8, 34, 1, 150.00);
insert into lignecommande values (171, 48, 8, 34, 1, 10.00);
insert into lignecommande values (172, 16, 8, 35, 1, 10.00);
insert into lignecommande values (173, 28, 8, 35, 1, 136.00);
insert into lignecommande values (174, 29, 1, 35, 1, 9.00);
insert into lignecommande values (175, 7, 8, 35, 1, 113.00);
insert into lignecommande values (176, 38, 4, 36, 1, 143.00);
insert into lignecommande values (177, 30, 1, 36, 1, 135.00);
insert into lignecommande values (178, 22, 8, 36, 1, 119.00);
insert into lignecommande values (179, 2, 1, 37, 1, 68.00);
insert into lignecommande values (180, 12, 8, 37, 1, 35.00);
insert into lignecommande values (181, 40, 8, 37, 1, 105.00);
insert into lignecommande values (182, 5, 8, 37, 1, 38.00);
insert into lignecommande values (183, 4, 3, 37, 1, 53.00);
insert into lignecommande values (184, 48, 8, 38, 1, 10.00);
insert into lignecommande values (185, 10, 4, 38, 1, 136.00);
insert into lignecommande values (186, 18, 4, 38, 1, 66.00);
insert into lignecommande values (187, 40, 8, 38, 1, 105.00);
insert into lignecommande values (188, 44, 8, 38, 1, 23.00);
insert into lignecommande values (189, 38, 3, 38, 1, 143.00);
insert into lignecommande values (190, 43, 8, 38, 2, 50.00);
insert into lignecommande values (191, 35, 1, 38, 3, 140.00);
insert into lignecommande values (192, 14, 1, 39, 1, 69.00);
insert into lignecommande values (193, 37, 8, 39, 2, 142.00);
insert into lignecommande values (194, 25, 8, 39, 1, 132.00);
insert into lignecommande values (197, 40, 8, 39, 3, 105.00);
insert into lignecommande values (199, 18, 3, 40, 1, 66.00);
insert into lignecommande values (200, 15, 8, 40, 5, 8.00);
insert into lignecommande values (201, 9, 1, 40, 1, 131.00);
insert into lignecommande values (202, 23, 4, 40, 1, 61.00);
insert into lignecommande values (203, 8, 1, 41, 1, 143.00);
insert into lignecommande values (204, 7, 8, 41, 1, 113.00);
insert into lignecommande values (205, 25, 8, 41, 1, 132.00);
insert into lignecommande values (206, 15, 8, 41, 4, 8.00);
insert into lignecommande values (207, 20, 1, 41, 1, 111.00);
insert into lignecommande values (208, 40, 8, 42, 1, 105.00);
insert into lignecommande values (209, 3, 8, 42, 4, 134.00);
insert into lignecommande values (210, 1, 3, 42, 1, 32.00);
insert into lignecommande values (211, 49, 8, 42, 1, 5.00);
insert into lignecommande values (212, 32, 1, 42, 1, 107.00);
insert into lignecommande values (213, 36, 1, 42, 1, 88.00);
insert into lignecommande values (214, 23, 4, 42, 1, 61.00);
insert into lignecommande values (215, 22, 8, 43, 1, 119.00);
insert into lignecommande values (216, 12, 8, 43, 3, 35.00);
insert into lignecommande values (217, 40, 8, 43, 1, 105.00);
insert into lignecommande values (218, 9, 1, 43, 1, 131.00);
insert into lignecommande values (219, 6, 8, 44, 1, 89.00);
insert into lignecommande values (220, 43, 8, 44, 1, 50.00);
insert into lignecommande values (221, 31, 8, 45, 1, 53.00);
insert into lignecommande values (222, 13, 4, 45, 1, 22.00);
insert into lignecommande values (223, 15, 8, 45, 5, 8.00);
insert into lignecommande values (224, 27, 8, 45, 1, 45.00);
insert into lignecommande values (225, 6, 8, 46, 1, 89.00);
insert into lignecommande values (226, 20, 1, 46, 1, 111.00);
insert into lignecommande values (227, 27, 8, 46, 4, 45.00);
insert into lignecommande values (228, 9, 1, 46, 1, 131.00);
insert into lignecommande values (229, 48, 8, 47, 1, 10.00);
insert into lignecommande values (230, 18, 4, 47, 1, 66.00);
insert into lignecommande values (231, 42, 1, 47, 1, 101.00);
insert into lignecommande values (232, 41, 1, 47, 1, 70.00);
insert into lignecommande values (234, 39, 8, 48, 1, 41.00);
insert into lignecommande values (235, 50, 3, 48, 1, 126.00);
insert into lignecommande values (236, 19, 1, 48, 1, 52.00);
insert into lignecommande values (237, 15, 8, 48, 1, 8.00);
insert into lignecommande values (238, 40, 8, 48, 1, 105.00);
insert into lignecommande values (239, 45, 1, 48, 1, 58.00);
insert into lignecommande values (240, 5, 8, 48, 3, 38.00);
insert into lignecommande values (241, 20, 1, 48, 2, 111.00);
insert into lignecommande values (242, 8, 1, 49, 5, 143.00);
insert into lignecommande values (243, 21, 8, 49, 1, 141.00);
insert into lignecommande values (244, 18, 4, 49, 1, 66.00);
insert into lignecommande values (245, 32, 1, 49, 1, 107.00);
insert into lignecommande values (246, 31, 8, 49, 5, 53.00);
insert into lignecommande values (248, 4, 3, 49, 2, 53.00);
insert into lignecommande values (249, 23, 4, 50, 1, 61.00);
insert into lignecommande values (250, 33, 8, 50, 1, 76.00);
insert into lignecommande values (251, 27, 8, 51, 1, 45.00);
insert into lignecommande values (252, 12, 8, 51, 5, 35.00);
insert into lignecommande values (253, 26, 8, 51, 1, 36.00);
insert into lignecommande values (254, 10, 4, 51, 4, 136.00);
insert into lignecommande values (255, 42, 1, 51, 1, 101.00);
insert into lignecommande values (256, 34, 8, 51, 1, 150.00);
insert into lignecommande values (257, 11, 1, 51, 1, 45.00);
insert into lignecommande values (258, 25, 8, 52, 3, 132.00);
insert into lignecommande values (259, 6, 8, 52, 1, 89.00);
insert into lignecommande values (260, 38, 3, 52, 4, 143.00);
insert into lignecommande values (262, 26, 8, 52, 1, 36.00);
insert into lignecommande values (263, 41, 1, 52, 1, 70.00);
insert into lignecommande values (264, 5, 8, 52, 2, 38.00);
insert into lignecommande values (265, 18, 4, 52, 1, 66.00);
insert into lignecommande values (266, 11, 1, 52, 1, 45.00);
insert into lignecommande values (267, 44, 8, 52, 1, 23.00);
insert into lignecommande values (268, 37, 8, 53, 1, 142.00);
insert into lignecommande values (269, 16, 8, 53, 1, 10.00);
insert into lignecommande values (270, 39, 8, 53, 1, 41.00);
insert into lignecommande values (271, 1, 3, 54, 1, 32.00);
insert into lignecommande values (272, 12, 8, 54, 1, 35.00);
insert into lignecommande values (273, 5, 8, 55, 1, 38.00);
insert into lignecommande values (274, 4, 3, 55, 1, 53.00);
insert into lignecommande values (275, 45, 1, 56, 1, 58.00);
insert into lignecommande values (276, 3, 8, 56, 1, 134.00);
insert into lignecommande values (277, 27, 8, 56, 1, 45.00);
insert into lignecommande values (278, 25, 8, 56, 1, 132.00);
insert into lignecommande values (279, 36, 1, 56, 1, 88.00);
insert into lignecommande values (280, 43, 8, 56, 1, 50.00);
insert into lignecommande values (281, 34, 8, 56, 1, 150.00);
insert into lignecommande values (282, 9, 1, 57, 4, 131.00);
insert into lignecommande values (283, 33, 8, 57, 1, 76.00);
insert into lignecommande values (284, 42, 1, 57, 1, 101.00);
insert into lignecommande values (285, 8, 1, 57, 1, 143.00);
insert into lignecommande values (286, 46, 8, 57, 4, 44.00);
insert into lignecommande values (287, 47, 8, 57, 4, 75.00);
insert into lignecommande values (288, 30, 1, 58, 1, 135.00);
insert into lignecommande values (289, 38, 4, 58, 1, 143.00);
insert into lignecommande values (290, 2, 1, 58, 1, 68.00);
insert into lignecommande values (291, 33, 8, 58, 1, 76.00);
insert into lignecommande values (292, 23, 3, 59, 1, 61.00);
insert into lignecommande values (293, 20, 1, 59, 1, 111.00);
insert into lignecommande values (294, 32, 1, 59, 1, 107.00);
insert into lignecommande values (295, 38, 3, 59, 1, 143.00);
insert into lignecommande values (296, 13, 4, 59, 1, 22.00);
insert into lignecommande values (297, 19, 1, 59, 1, 52.00);
insert into lignecommande values (298, 14, 1, 59, 1, 69.00);
insert into lignecommande values (299, 10, 4, 60, 1, 136.00);
insert into lignecommande values (300, 16, 8, 60, 5, 10.00);
insert into lignecommande values (301, 39, 8, 60, 1, 41.00);
insert into lignecommande values (302, 25, 8, 61, 1, 132.00);
insert into lignecommande values (303, 15, 8, 61, 1, 8.00);
insert into lignecommande values (304, 16, 8, 61, 1, 10.00);
insert into lignecommande values (305, 28, 8, 61, 2, 136.00);
insert into lignecommande values (306, 22, 8, 62, 2, 119.00);
insert into lignecommande values (307, 16, 8, 62, 4, 10.00);
insert into lignecommande values (308, 46, 8, 62, 1, 44.00);
insert into lignecommande values (309, 49, 8, 62, 1, 5.00);
insert into lignecommande values (310, 39, 8, 62, 1, 41.00);
insert into lignecommande values (311, 18, 4, 62, 5, 66.00);
insert into lignecommande values (312, 47, 8, 62, 1, 75.00);
insert into lignecommande values (313, 27, 8, 62, 1, 45.00);
insert into lignecommande values (314, 11, 1, 63, 1, 45.00);
insert into lignecommande values (315, 44, 8, 63, 1, 23.00);
insert into lignecommande values (316, 12, 8, 63, 1, 35.00);
insert into lignecommande values (317, 18, 4, 63, 3, 66.00);
insert into lignecommande values (319, 54, 8, 63, 1, 113.00);
insert into lignecommande values (320, 47, 8, 63, 1, 75.00);
insert into lignecommande values (321, 57, 3, 63, 1, 80.00);
insert into lignecommande values (322, 4, 4, 63, 1, 53.00);
insert into lignecommande values (323, 50, 3, 63, 1, 126.00);
insert into lignecommande values (324, 58, 8, 63, 1, 95.00);
insert into lignecommande values (325, 62, 1, 63, 1, 47.00);
insert into lignecommande values (326, 57, 4, 63, 2, 80.00);
insert into lignecommande values (327, 14, 1, 64, 1, 69.00);
insert into lignecommande values (328, 62, 1, 64, 1, 47.00);
insert into lignecommande values (329, 52, 8, 64, 1, 63.00);
insert into lignecommande values (330, 58, 8, 64, 1, 95.00);
insert into lignecommande values (331, 23, 4, 65, 1, 61.00);
insert into lignecommande values (332, 54, 8, 65, 1, 113.00);
insert into lignecommande values (333, 13, 4, 65, 1, 22.00);
insert into lignecommande values (334, 60, 8, 65, 1, 132.00);
insert into lignecommande values (335, 40, 8, 65, 1, 105.00);
insert into lignecommande values (336, 14, 1, 65, 1, 69.00);
insert into lignecommande values (337, 10, 4, 66, 1, 136.00);
insert into lignecommande values (338, 36, 1, 66, 1, 88.00);
insert into lignecommande values (339, 48, 8, 66, 1, 10.00);
insert into lignecommande values (340, 25, 8, 66, 1, 132.00);
insert into lignecommande values (341, 3, 8, 66, 1, 134.00);
insert into lignecommande values (342, 1, 4, 67, 1, 32.00);
insert into lignecommande values (343, 6, 8, 67, 1, 89.00);
insert into lignecommande values (344, 63, 8, 68, 1, 67.00);
insert into lignecommande values (345, 27, 8, 68, 1, 45.00);
insert into lignecommande values (346, 56, 8, 68, 1, 100.00);
insert into lignecommande values (347, 48, 8, 68, 1, 10.00);
insert into lignecommande values (348, 69, 1, 68, 1, 129.00);
insert into lignecommande values (349, 67, 1, 68, 1, 93.00);
insert into lignecommande values (350, 5, 8, 69, 1, 38.00);
insert into lignecommande values (351, 52, 8, 69, 1, 63.00);
insert into lignecommande values (352, 69, 1, 69, 1, 129.00);
insert into lignecommande values (353, 51, 1, 69, 1, 93.00);
insert into lignecommande values (354, 53, 1, 69, 1, 130.00);
insert into lignecommande values (355, 4, 4, 69, 1, 53.00);
insert into lignecommande values (356, 41, 1, 70, 3, 70.00);
insert into lignecommande values (357, 69, 1, 70, 1, 129.00);
insert into lignecommande values (358, 28, 8, 70, 1, 136.00);
insert into lignecommande values (359, 66, 8, 70, 1, 36.00);
insert into lignecommande values (360, 40, 8, 70, 1, 105.00);
insert into lignecommande values (361, 44, 8, 71, 1, 23.00);
insert into lignecommande values (362, 45, 1, 71, 5, 58.00);
insert into lignecommande values (363, 6, 8, 72, 1, 89.00);
insert into lignecommande values (364, 51, 1, 72, 1, 93.00);
insert into lignecommande values (365, 36, 1, 72, 1, 88.00);
insert into lignecommande values (366, 48, 8, 72, 1, 10.00);
insert into lignecommande values (367, 26, 8, 73, 4, 36.00);
insert into lignecommande values (368, 1, 3, 73, 1, 32.00);
insert into lignecommande values (369, 49, 8, 73, 4, 5.00);
insert into lignecommande values (370, 67, 1, 74, 1, 93.00);
insert into lignecommande values (371, 65, 8, 74, 1, 89.00);
insert into lignecommande values (372, 6, 8, 74, 2, 89.00);
insert into lignecommande values (373, 23, 3, 74, 1, 61.00);
insert into lignecommande values (374, 33, 8, 75, 1, 76.00);
insert into lignecommande values (375, 60, 8, 75, 1, 132.00);
insert into lignecommande values (376, 22, 8, 75, 1, 119.00);
insert into lignecommande values (377, 55, 1, 75, 1, 22.00);
insert into lignecommande values (378, 45, 1, 75, 2, 58.00);
insert into lignecommande values (379, 48, 8, 75, 1, 10.00);
insert into lignecommande values (380, 44, 8, 75, 1, 23.00);
insert into lignecommande values (381, 43, 8, 75, 1, 50.00);
insert into lignecommande values (382, 40, 8, 76, 3, 105.00);
insert into lignecommande values (383, 24, 8, 76, 3, 18.00);
insert into lignecommande values (384, 69, 1, 76, 3, 129.00);
insert into lignecommande values (385, 20, 1, 77, 5, 111.00);
insert into lignecommande values (386, 9, 1, 77, 5, 131.00);
insert into lignecommande values (387, 63, 8, 77, 1, 67.00);
insert into lignecommande values (388, 56, 8, 78, 4, 100.00);
insert into lignecommande values (389, 13, 3, 78, 1, 22.00);
insert into lignecommande values (390, 55, 1, 78, 1, 22.00);
insert into lignecommande values (391, 6, 8, 78, 1, 89.00);
insert into lignecommande values (392, 19, 1, 78, 1, 52.00);
insert into lignecommande values (393, 1, 3, 78, 1, 32.00);
insert into lignecommande values (394, 27, 8, 79, 1, 45.00);
insert into lignecommande values (395, 45, 1, 79, 1, 58.00);
insert into lignecommande values (396, 22, 8, 79, 1, 119.00);
insert into lignecommande values (397, 63, 8, 80, 1, 67.00);
insert into lignecommande values (398, 9, 1, 80, 1, 131.00);
insert into lignecommande values (399, 4, 3, 80, 1, 53.00);
insert into lignecommande values (400, 55, 1, 80, 1, 22.00);
insert into lignecommande values (401, 35, 1, 80, 1, 140.00);
insert into lignecommande values (402, 23, 3, 81, 1, 61.00);
insert into lignecommande values (403, 50, 4, 81, 1, 126.00);
insert into lignecommande values (404, 56, 8, 81, 1, 100.00);
insert into lignecommande values (405, 25, 8, 81, 1, 132.00);
insert into lignecommande values (406, 18, 3, 81, 1, 66.00);
insert into lignecommande values (407, 69, 1, 81, 2, 129.00);
insert into lignecommande values (408, 57, 4, 82, 1, 80.00);
insert into lignecommande values (409, 14, 1, 82, 1, 69.00);
insert into lignecommande values (410, 62, 1, 82, 1, 47.00);
insert into lignecommande values (411, 60, 8, 82, 1, 132.00);
insert into lignecommande values (412, 69, 1, 82, 1, 129.00);
insert into lignecommande values (413, 3, 8, 82, 1, 134.00);
insert into lignecommande values (414, 1, 4, 82, 4, 32.00);
insert into lignecommande values (415, 5, 8, 82, 1, 38.00);
insert into lignecommande values (416, 24, 8, 83, 1, 18.00);
insert into lignecommande values (417, 29, 1, 83, 3, 9.00);
insert into lignecommande values (418, 18, 3, 83, 1, 66.00);
insert into lignecommande values (419, 43, 8, 83, 1, 50.00);
insert into lignecommande values (420, 54, 8, 84, 1, 113.00);
insert into lignecommande values (421, 20, 1, 84, 1, 111.00);
insert into lignecommande values (422, 55, 1, 84, 1, 22.00);
insert into lignecommande values (423, 3, 8, 85, 1, 134.00);
insert into lignecommande values (424, 50, 3, 85, 1, 126.00);
insert into lignecommande values (425, 44, 8, 85, 2, 23.00);
insert into lignecommande values (426, 19, 1, 85, 1, 52.00);
insert into lignecommande values (427, 24, 8, 85, 1, 18.00);
insert into lignecommande values (428, 65, 8, 85, 1, 89.00);
insert into lignecommande values (429, 43, 8, 85, 1, 50.00);
insert into lignecommande values (430, 39, 8, 86, 1, 41.00);
insert into lignecommande values (431, 50, 4, 86, 1, 126.00);
insert into lignecommande values (432, 28, 8, 86, 1, 136.00);
insert into lignecommande values (433, 25, 8, 86, 4, 132.00);
insert into lignecommande values (434, 50, 3, 86, 1, 126.00);
insert into lignecommande values (435, 10, 3, 87, 5, 136.00);
insert into lignecommande values (436, 60, 8, 87, 1, 132.00);
insert into lignecommande values (437, 3, 8, 87, 1, 134.00);
insert into lignecommande values (438, 33, 8, 87, 4, 76.00);
insert into lignecommande values (439, 13, 3, 87, 1, 22.00);
insert into lignecommande values (440, 67, 1, 88, 1, 93.00);
insert into lignecommande values (441, 27, 8, 88, 1, 45.00);
insert into lignecommande values (443, 1, 3, 88, 1, 32.00);
insert into lignecommande values (444, 52, 8, 88, 1, 63.00);
insert into lignecommande values (445, 65, 8, 88, 1, 89.00);
insert into lignecommande values (446, 53, 1, 88, 1, 130.00);
insert into lignecommande values (447, 14, 1, 88, 1, 69.00);
insert into lignecommande values (448, 69, 1, 89, 1, 129.00);
insert into lignecommande values (449, 49, 8, 89, 1, 5.00);
insert into lignecommande values (450, 10, 4, 89, 1, 136.00);
insert into lignecommande values (451, 28, 8, 89, 1, 136.00);
insert into lignecommande values (452, 63, 8, 90, 1, 67.00);
insert into lignecommande values (453, 43, 8, 90, 1, 50.00);
insert into lignecommande values (455, 66, 8, 91, 1, 36.00);
insert into lignecommande values (456, 3, 8, 91, 1, 134.00);
insert into lignecommande values (457, 49, 8, 92, 1, 5.00);
insert into lignecommande values (458, 50, 4, 92, 1, 126.00);
insert into lignecommande values (459, 41, 1, 92, 1, 70.00);
insert into lignecommande values (460, 24, 8, 92, 1, 18.00);
insert into lignecommande values (461, 53, 1, 92, 3, 130.00);
insert into lignecommande values (462, 66, 8, 92, 1, 36.00);
insert into lignecommande values (463, 55, 1, 92, 1, 22.00);
insert into lignecommande values (464, 69, 1, 93, 1, 129.00);
insert into lignecommande values (465, 27, 8, 93, 1, 45.00);
insert into lignecommande values (466, 54, 8, 93, 1, 113.00);
insert into lignecommande values (467, 35, 1, 93, 1, 140.00);
insert into lignecommande values (468, 27, 8, 94, 1, 45.00);
insert into lignecommande values (469, 63, 8, 94, 1, 67.00);
insert into lignecommande values (470, 49, 8, 94, 1, 5.00);
insert into lignecommande values (471, 20, 1, 94, 1, 111.00);
insert into lignecommande values (472, 55, 1, 94, 1, 22.00);
insert into lignecommande values (473, 41, 1, 94, 1, 70.00);
insert into lignecommande values (474, 22, 8, 95, 2, 119.00);
insert into lignecommande values (475, 19, 1, 95, 1, 52.00);
insert into lignecommande values (476, 49, 8, 95, 2, 5.00);
insert into lignecommande values (477, 40, 8, 95, 1, 105.00);
insert into lignecommande values (478, 45, 1, 95, 1, 58.00);
insert into lignecommande values (479, 4, 4, 96, 1, 53.00);
insert into lignecommande values (480, 48, 8, 96, 3, 10.00);
insert into lignecommande values (481, 60, 8, 96, 1, 132.00);
insert into lignecommande values (482, 44, 8, 96, 4, 23.00);
insert into lignecommande values (483, 53, 1, 96, 1, 130.00);
insert into lignecommande values (484, 54, 8, 96, 3, 113.00);
insert into lignecommande values (485, 51, 1, 96, 5, 93.00);
insert into lignecommande values (486, 10, 4, 97, 1, 136.00);
insert into lignecommande values (487, 63, 8, 97, 1, 67.00);
insert into lignecommande values (488, 50, 4, 97, 1, 126.00);
insert into lignecommande values (489, 29, 1, 98, 1, 9.00);
insert into lignecommande values (490, 55, 1, 98, 1, 22.00);
insert into lignecommande values (491, 26, 8, 98, 1, 36.00);
insert into lignecommande values (492, 50, 3, 98, 1, 126.00);
insert into lignecommande values (493, 57, 4, 99, 3, 80.00);
insert into lignecommande values (494, 55, 1, 99, 1, 22.00);
insert into lignecommande values (495, 4, 4, 99, 1, 53.00);
insert into lignecommande values (496, 25, 8, 99, 1, 132.00);
insert into lignecommande values (497, 28, 8, 99, 1, 136.00);
insert into lignecommande values (498, 40, 8, 100, 1, 105.00);
insert into lignecommande values (499, 26, 8, 100, 1, 36.00);
insert into lignecommande values (500, 55, 1, 100, 1, 22.00);


--
-- TOC entry 4032 (class 0 OID 1213620)
-- Dependencies: 253
-- Data for Name: photocontientjoueur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into photocontientjoueur values (1, 16);
insert into photocontientjoueur values (2, 11);
insert into photocontientjoueur values (3, 2);
insert into photocontientjoueur values (4, 17);
insert into photocontientjoueur values (5, 38);
insert into photocontientjoueur values (6, 8);
insert into photocontientjoueur values (7, 8);
insert into photocontientjoueur values (8, 30);
insert into photocontientjoueur values (9, 33);
insert into photocontientjoueur values (10, 13);
insert into photocontientjoueur values (11, 1);
insert into photocontientjoueur values (12, 4);
insert into photocontientjoueur values (32, 17);
insert into photocontientjoueur values (33, 30);
insert into photocontientjoueur values (34, 38);
insert into photocontientjoueur values (35, 2);
insert into photocontientjoueur values (36, 11);
insert into photocontientjoueur values (37, 1);


--
-- TOC entry 4039 (class 0 OID 1213656)
-- Dependencies: 260
-- Data for Name: professionnel; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--



--
-- TOC entry 4033 (class 0 OID 1213625)
-- Dependencies: 254
-- Data for Name: prodemandeproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--



--
-- TOC entry 4036 (class 0 OID 1213641)
-- Dependencies: 257
-- Data for Name: produitcontientcouleur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into produitcontientcouleur values (1, 1);
insert into produitcontientcouleur values (2, 1);
insert into produitcontientcouleur values (3, 2);
insert into produitcontientcouleur values (4, 3);
insert into produitcontientcouleur values (5, 1);
insert into produitcontientcouleur values (6, 3);
insert into produitcontientcouleur values (7, 4);
insert into produitcontientcouleur values (8, 5);
insert into produitcontientcouleur values (9, 6);
insert into produitcontientcouleur values (10, 2);
insert into produitcontientcouleur values (11, 1);
insert into produitcontientcouleur values (12, 3);
insert into produitcontientcouleur values (13, 7);
insert into produitcontientcouleur values (14, 2);
insert into produitcontientcouleur values (15, 1);
insert into produitcontientcouleur values (16, 2);
insert into produitcontientcouleur values (17, 2);
insert into produitcontientcouleur values (18, 8);
insert into produitcontientcouleur values (19, 8);
insert into produitcontientcouleur values (20, 6);
insert into produitcontientcouleur values (21, 4);
insert into produitcontientcouleur values (22, 5);
insert into produitcontientcouleur values (23, 5);
insert into produitcontientcouleur values (24, 3);
insert into produitcontientcouleur values (25, 4);
insert into produitcontientcouleur values (26, 9);
insert into produitcontientcouleur values (27, 9);
insert into produitcontientcouleur values (28, 8);
insert into produitcontientcouleur values (29, 1);
insert into produitcontientcouleur values (30, 6);
insert into produitcontientcouleur values (31, 2);
insert into produitcontientcouleur values (32, 9);
insert into produitcontientcouleur values (33, 7);
insert into produitcontientcouleur values (34, 2);
insert into produitcontientcouleur values (35, 10);
insert into produitcontientcouleur values (36, 4);
insert into produitcontientcouleur values (37, 2);
insert into produitcontientcouleur values (38, 2);
insert into produitcontientcouleur values (39, 7);
insert into produitcontientcouleur values (40, 9);
insert into produitcontientcouleur values (41, 6);
insert into produitcontientcouleur values (42, 7);
insert into produitcontientcouleur values (43, 9);
insert into produitcontientcouleur values (44, 8);
insert into produitcontientcouleur values (45, 8);
insert into produitcontientcouleur values (46, 6);
insert into produitcontientcouleur values (47, 4);
insert into produitcontientcouleur values (48, 3);
insert into produitcontientcouleur values (49, 9);
insert into produitcontientcouleur values (50, 1);
insert into produitcontientcouleur values (17, 9);
insert into produitcontientcouleur values (12, 5);
insert into produitcontientcouleur values (8, 1);
insert into produitcontientcouleur values (46, 2);
insert into produitcontientcouleur values (2, 4);
insert into produitcontientcouleur values (7, 10);
insert into produitcontientcouleur values (38, 8);
insert into produitcontientcouleur values (34, 7);
insert into produitcontientcouleur values (46, 4);
insert into produitcontientcouleur values (37, 8);
insert into produitcontientcouleur values (8, 7);
insert into produitcontientcouleur values (30, 9);
insert into produitcontientcouleur values (16, 9);
insert into produitcontientcouleur values (37, 9);
insert into produitcontientcouleur values (21, 7);
insert into produitcontientcouleur values (15, 4);
insert into produitcontientcouleur values (42, 8);
insert into produitcontientcouleur values (34, 4);
insert into produitcontientcouleur values (32, 5);


--
-- TOC entry 4037 (class 0 OID 1213646)
-- Dependencies: 258
-- Data for Name: produitcontientimage; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into produitcontientimage values (1, 1);
insert into produitcontientimage values (2, 2);
insert into produitcontientimage values (2, 3);
insert into produitcontientimage values (3, 4);
insert into produitcontientimage values (3, 5);
insert into produitcontientimage values (3, 6);
insert into produitcontientimage values (4, 7);
insert into produitcontientimage values (5, 8);
insert into produitcontientimage values (5, 9);
insert into produitcontientimage values (6, 10);
insert into produitcontientimage values (6, 11);
insert into produitcontientimage values (7, 12);
insert into produitcontientimage values (7, 13);
insert into produitcontientimage values (8, 14);
insert into produitcontientimage values (8, 15);
insert into produitcontientimage values (8, 16);
insert into produitcontientimage values (9, 17);
insert into produitcontientimage values (9, 18);
insert into produitcontientimage values (9, 19);
insert into produitcontientimage values (10, 20);
insert into produitcontientimage values (10, 21);
insert into produitcontientimage values (11, 22);
insert into produitcontientimage values (11, 23);
insert into produitcontientimage values (11, 24);
insert into produitcontientimage values (12, 25);
insert into produitcontientimage values (12, 26);
insert into produitcontientimage values (13, 27);
insert into produitcontientimage values (13, 28);
insert into produitcontientimage values (14, 29);
insert into produitcontientimage values (14, 30);
insert into produitcontientimage values (15, 31);
insert into produitcontientimage values (15, 32);
insert into produitcontientimage values (16, 33);
insert into produitcontientimage values (16, 34);
insert into produitcontientimage values (17, 35);
insert into produitcontientimage values (17, 36);
insert into produitcontientimage values (18, 37);
insert into produitcontientimage values (18, 38);
insert into produitcontientimage values (18, 39);
insert into produitcontientimage values (19, 40);
insert into produitcontientimage values (19, 41);
insert into produitcontientimage values (20, 42);
insert into produitcontientimage values (20, 43);
insert into produitcontientimage values (20, 44);
insert into produitcontientimage values (21, 45);
insert into produitcontientimage values (21, 46);
insert into produitcontientimage values (22, 47);
insert into produitcontientimage values (22, 48);
insert into produitcontientimage values (23, 49);
insert into produitcontientimage values (23, 50);
insert into produitcontientimage values (24, 51);
insert into produitcontientimage values (24, 52);
insert into produitcontientimage values (25, 53);
insert into produitcontientimage values (25, 54);
insert into produitcontientimage values (26, 55);
insert into produitcontientimage values (26, 56);
insert into produitcontientimage values (27, 57);
insert into produitcontientimage values (28, 58);
insert into produitcontientimage values (29, 59);
insert into produitcontientimage values (29, 60);
insert into produitcontientimage values (30, 61);
insert into produitcontientimage values (30, 62);
insert into produitcontientimage values (31, 63);
insert into produitcontientimage values (32, 64);
insert into produitcontientimage values (32, 65);
insert into produitcontientimage values (33, 66);
insert into produitcontientimage values (34, 67);
insert into produitcontientimage values (35, 68);
insert into produitcontientimage values (36, 69);
insert into produitcontientimage values (37, 70);
insert into produitcontientimage values (37, 71);
insert into produitcontientimage values (38, 72);
insert into produitcontientimage values (39, 73);
insert into produitcontientimage values (40, 74);
insert into produitcontientimage values (41, 75);
insert into produitcontientimage values (41, 76);
insert into produitcontientimage values (41, 77);
insert into produitcontientimage values (42, 78);
insert into produitcontientimage values (42, 79);
insert into produitcontientimage values (42, 80);
insert into produitcontientimage values (43, 81);
insert into produitcontientimage values (43, 82);
insert into produitcontientimage values (44, 83);
insert into produitcontientimage values (44, 84);
insert into produitcontientimage values (44, 85);
insert into produitcontientimage values (45, 86);
insert into produitcontientimage values (45, 87);
insert into produitcontientimage values (46, 88);
insert into produitcontientimage values (46, 89);
insert into produitcontientimage values (47, 90);
insert into produitcontientimage values (48, 91);
insert into produitcontientimage values (48, 92);
insert into produitcontientimage values (49, 93);
insert into produitcontientimage values (50, 94);
insert into produitcontientimage values (50, 95);
insert into produitcontientimage values (51, 96);
insert into produitcontientimage values (51, 97);
insert into produitcontientimage values (52, 98);
insert into produitcontientimage values (52, 99);
insert into produitcontientimage values (53, 100);
insert into produitcontientimage values (53, 101);
insert into produitcontientimage values (53, 102);
insert into produitcontientimage values (54, 103);
insert into produitcontientimage values (54, 104);
insert into produitcontientimage values (55, 105);
insert into produitcontientimage values (55, 106);
insert into produitcontientimage values (56, 107);
insert into produitcontientimage values (56, 108);
insert into produitcontientimage values (57, 109);
insert into produitcontientimage values (58, 110);
insert into produitcontientimage values (59, 111);
insert into produitcontientimage values (59, 112);
insert into produitcontientimage values (60, 113);
insert into produitcontientimage values (60, 114);
insert into produitcontientimage values (61, 115);
insert into produitcontientimage values (61, 116);
insert into produitcontientimage values (61, 117);
insert into produitcontientimage values (62, 118);
insert into produitcontientimage values (62, 119);
insert into produitcontientimage values (63, 120);
insert into produitcontientimage values (63, 121);
insert into produitcontientimage values (64, 122);
insert into produitcontientimage values (64, 123);
insert into produitcontientimage values (65, 124);
insert into produitcontientimage values (65, 125);
insert into produitcontientimage values (66, 126);
insert into produitcontientimage values (66, 127);
insert into produitcontientimage values (67, 128);
insert into produitcontientimage values (67, 129);
insert into produitcontientimage values (67, 130);
insert into produitcontientimage values (68, 131);
insert into produitcontientimage values (69, 132);
insert into produitcontientimage values (69, 133);


--
-- TOC entry 4038 (class 0 OID 1213651)
-- Dependencies: 259
-- Data for Name: produitcontienttaille; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into produitcontienttaille values (1, 2);
insert into produitcontienttaille values (1, 3);
insert into produitcontienttaille values (1, 4);
insert into produitcontienttaille values (2, 1);
insert into produitcontienttaille values (2, 2);
insert into produitcontienttaille values (2, 3);
insert into produitcontienttaille values (2, 4);
insert into produitcontienttaille values (2, 5);
insert into produitcontienttaille values (2, 6);
insert into produitcontienttaille values (3, 8);
insert into produitcontienttaille values (4, 2);
insert into produitcontienttaille values (4, 3);
insert into produitcontienttaille values (4, 4);
insert into produitcontienttaille values (5, 8);
insert into produitcontienttaille values (6, 8);
insert into produitcontienttaille values (7, 8);
insert into produitcontienttaille values (8, 1);
insert into produitcontienttaille values (8, 2);
insert into produitcontienttaille values (8, 3);
insert into produitcontienttaille values (8, 4);
insert into produitcontienttaille values (8, 5);
insert into produitcontienttaille values (8, 6);
insert into produitcontienttaille values (9, 1);
insert into produitcontienttaille values (9, 2);
insert into produitcontienttaille values (9, 3);
insert into produitcontienttaille values (9, 4);
insert into produitcontienttaille values (10, 2);
insert into produitcontienttaille values (10, 3);
insert into produitcontienttaille values (10, 4);
insert into produitcontienttaille values (11, 1);
insert into produitcontienttaille values (11, 2);
insert into produitcontienttaille values (11, 3);
insert into produitcontienttaille values (11, 4);
insert into produitcontienttaille values (11, 5);
insert into produitcontienttaille values (12, 8);
insert into produitcontienttaille values (13, 2);
insert into produitcontienttaille values (13, 3);
insert into produitcontienttaille values (13, 4);
insert into produitcontienttaille values (14, 1);
insert into produitcontienttaille values (14, 2);
insert into produitcontienttaille values (14, 3);
insert into produitcontienttaille values (14, 4);
insert into produitcontienttaille values (14, 5);
insert into produitcontienttaille values (14, 6);
insert into produitcontienttaille values (15, 8);
insert into produitcontienttaille values (16, 8);
insert into produitcontienttaille values (17, 1);
insert into produitcontienttaille values (17, 2);
insert into produitcontienttaille values (17, 3);
insert into produitcontienttaille values (17, 4);
insert into produitcontienttaille values (17, 5);
insert into produitcontienttaille values (17, 6);
insert into produitcontienttaille values (17, 7);
insert into produitcontienttaille values (18, 2);
insert into produitcontienttaille values (18, 3);
insert into produitcontienttaille values (18, 4);
insert into produitcontienttaille values (19, 1);
insert into produitcontienttaille values (19, 2);
insert into produitcontienttaille values (19, 3);
insert into produitcontienttaille values (19, 4);
insert into produitcontienttaille values (19, 5);
insert into produitcontienttaille values (19, 6);
insert into produitcontienttaille values (20, 1);
insert into produitcontienttaille values (20, 2);
insert into produitcontienttaille values (20, 3);
insert into produitcontienttaille values (20, 4);
insert into produitcontienttaille values (21, 8);
insert into produitcontienttaille values (22, 8);
insert into produitcontienttaille values (23, 2);
insert into produitcontienttaille values (23, 3);
insert into produitcontienttaille values (23, 4);
insert into produitcontienttaille values (24, 8);
insert into produitcontienttaille values (25, 8);
insert into produitcontienttaille values (26, 8);
insert into produitcontienttaille values (27, 8);
insert into produitcontienttaille values (28, 8);
insert into produitcontienttaille values (29, 1);
insert into produitcontienttaille values (29, 2);
insert into produitcontienttaille values (29, 3);
insert into produitcontienttaille values (29, 4);
insert into produitcontienttaille values (29, 5);
insert into produitcontienttaille values (29, 6);
insert into produitcontienttaille values (30, 1);
insert into produitcontienttaille values (30, 2);
insert into produitcontienttaille values (30, 3);
insert into produitcontienttaille values (30, 4);
insert into produitcontienttaille values (30, 5);
insert into produitcontienttaille values (30, 6);
insert into produitcontienttaille values (31, 8);
insert into produitcontienttaille values (32, 1);
insert into produitcontienttaille values (32, 2);
insert into produitcontienttaille values (32, 3);
insert into produitcontienttaille values (32, 4);
insert into produitcontienttaille values (32, 5);
insert into produitcontienttaille values (33, 8);
insert into produitcontienttaille values (34, 8);
insert into produitcontienttaille values (35, 1);
insert into produitcontienttaille values (35, 2);
insert into produitcontienttaille values (35, 3);
insert into produitcontienttaille values (35, 4);
insert into produitcontienttaille values (36, 1);
insert into produitcontienttaille values (36, 2);
insert into produitcontienttaille values (36, 3);
insert into produitcontienttaille values (36, 4);
insert into produitcontienttaille values (36, 5);
insert into produitcontienttaille values (36, 6);
insert into produitcontienttaille values (36, 7);
insert into produitcontienttaille values (37, 8);
insert into produitcontienttaille values (38, 2);
insert into produitcontienttaille values (38, 3);
insert into produitcontienttaille values (38, 4);
insert into produitcontienttaille values (39, 8);
insert into produitcontienttaille values (40, 8);
insert into produitcontienttaille values (41, 1);
insert into produitcontienttaille values (41, 2);
insert into produitcontienttaille values (41, 3);
insert into produitcontienttaille values (41, 4);
insert into produitcontienttaille values (41, 5);
insert into produitcontienttaille values (42, 1);
insert into produitcontienttaille values (42, 2);
insert into produitcontienttaille values (42, 3);
insert into produitcontienttaille values (42, 4);
insert into produitcontienttaille values (43, 8);
insert into produitcontienttaille values (44, 8);
insert into produitcontienttaille values (45, 1);
insert into produitcontienttaille values (45, 2);
insert into produitcontienttaille values (45, 3);
insert into produitcontienttaille values (45, 4);
insert into produitcontienttaille values (46, 8);
insert into produitcontienttaille values (47, 8);
insert into produitcontienttaille values (48, 8);
insert into produitcontienttaille values (49, 8);
insert into produitcontienttaille values (50, 2);
insert into produitcontienttaille values (50, 3);
insert into produitcontienttaille values (50, 4);


--
-- TOC entry 4040 (class 0 OID 1213661)
-- Dependencies: 261
-- Data for Name: reponsecommentaire; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into reponsecommentaire values (11, 4);
insert into reponsecommentaire values (12, 9);
insert into reponsecommentaire values (13, 10);
insert into reponsecommentaire values (14, 4);
insert into reponsecommentaire values (15, 7);
insert into reponsecommentaire values (16, 10);
insert into reponsecommentaire values (17, 2);
insert into reponsecommentaire values (18, 6);
insert into reponsecommentaire values (19, 10);


--
-- TOC entry 4001 (class 0 OID 1213474)
-- Dependencies: 222
-- Data for Name: souscategorieproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into souscategorieproduit values (4, 5);
insert into souscategorieproduit values (4, 6);
insert into souscategorieproduit values (4, 7);
insert into souscategorieproduit values (4, 8);
insert into souscategorieproduit values (4, 9);
insert into souscategorieproduit values (4, 10);
insert into souscategorieproduit values (2, 11);
insert into souscategorieproduit values (2, 12);
insert into souscategorieproduit values (2, 13);
insert into souscategorieproduit values (2, 14);


--
-- TOC entry 4042 (class 0 OID 1213668)
-- Dependencies: 263
-- Data for Name: statistique; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into statistique values (1, 'Nombre de Matchs Joués');
insert into statistique values (2, 'Nombre de Buts');
insert into statistique values (3, 'Minutes Jouées');
insert into statistique values (4, 'Nombre de Titularisations');


--
-- TOC entry 4043 (class 0 OID 1213674)
-- Dependencies: 264
-- Data for Name: statistiquejoueur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into statistiquejoueur values (1, 1, 450);
insert into statistiquejoueur values (2, 1, 280);
insert into statistiquejoueur values (3, 1, 41000);
insert into statistiquejoueur values (4, 1, 450);
insert into statistiquejoueur values (1, 2, 500);
insert into statistiquejoueur values (2, 2, 380);
insert into statistiquejoueur values (3, 2, 45000);
insert into statistiquejoueur values (4, 2, 490);
insert into statistiquejoueur values (1, 3, 480);
insert into statistiquejoueur values (2, 3, 290);
insert into statistiquejoueur values (3, 3, 43000);
insert into statistiquejoueur values (4, 3, 460);
insert into statistiquejoueur values (1, 4, 440);
insert into statistiquejoueur values (2, 4, 120);
insert into statistiquejoueur values (3, 4, 40000);
insert into statistiquejoueur values (4, 4, 430);
insert into statistiquejoueur values (1, 5, 420);
insert into statistiquejoueur values (2, 5, 260);
insert into statistiquejoueur values (3, 5, 38000);
insert into statistiquejoueur values (4, 5, 410);
insert into statistiquejoueur values (1, 6, 440);
insert into statistiquejoueur values (2, 6, 100);
insert into statistiquejoueur values (3, 6, 40000);
insert into statistiquejoueur values (4, 6, 430);
insert into statistiquejoueur values (1, 7, 500);
insert into statistiquejoueur values (2, 7, 70);
insert into statistiquejoueur values (3, 7, 45000);
insert into statistiquejoueur values (4, 7, 490);
insert into statistiquejoueur values (1, 8, 430);
insert into statistiquejoueur values (2, 8, 280);
insert into statistiquejoueur values (3, 8, 39000);
insert into statistiquejoueur values (4, 8, 420);
insert into statistiquejoueur values (1, 9, 470);
insert into statistiquejoueur values (2, 9, 370);
insert into statistiquejoueur values (3, 9, 44000);
insert into statistiquejoueur values (4, 9, 470);
insert into statistiquejoueur values (1, 10, 460);
insert into statistiquejoueur values (2, 10, 50);
insert into statistiquejoueur values (3, 10, 42000);
insert into statistiquejoueur values (4, 10, 450);
insert into statistiquejoueur values (1, 11, 470);
insert into statistiquejoueur values (2, 11, 330);
insert into statistiquejoueur values (3, 11, 44000);
insert into statistiquejoueur values (4, 11, 460);
insert into statistiquejoueur values (1, 12, 450);
insert into statistiquejoueur values (2, 12, 170);
insert into statistiquejoueur values (3, 12, 41000);
insert into statistiquejoueur values (4, 12, 440);
insert into statistiquejoueur values (1, 13, 490);
insert into statistiquejoueur values (2, 13, 350);
insert into statistiquejoueur values (3, 13, 45000);
insert into statistiquejoueur values (4, 13, 480);
insert into statistiquejoueur values (1, 14, 460);
insert into statistiquejoueur values (2, 14, 20);
insert into statistiquejoueur values (3, 14, 42000);
insert into statistiquejoueur values (4, 14, 450);
insert into statistiquejoueur values (1, 15, 450);
insert into statistiquejoueur values (2, 15, 0);
insert into statistiquejoueur values (3, 15, 41000);
insert into statistiquejoueur values (4, 15, 440);
insert into statistiquejoueur values (1, 16, 440);
insert into statistiquejoueur values (2, 16, 60);
insert into statistiquejoueur values (3, 16, 40000);
insert into statistiquejoueur values (4, 16, 430);
insert into statistiquejoueur values (1, 17, 480);
insert into statistiquejoueur values (2, 17, 0);
insert into statistiquejoueur values (3, 17, 44000);
insert into statistiquejoueur values (4, 17, 470);
insert into statistiquejoueur values (1, 18, 470);
insert into statistiquejoueur values (2, 18, 160);
insert into statistiquejoueur values (3, 18, 43000);
insert into statistiquejoueur values (4, 18, 460);
insert into statistiquejoueur values (1, 19, 460);
insert into statistiquejoueur values (2, 19, 80);
insert into statistiquejoueur values (3, 19, 42000);
insert into statistiquejoueur values (4, 19, 450);
insert into statistiquejoueur values (1, 20, 440);
insert into statistiquejoueur values (2, 20, 0);
insert into statistiquejoueur values (3, 20, 40000);
insert into statistiquejoueur values (4, 20, 430);
insert into statistiquejoueur values (1, 21, 470);
insert into statistiquejoueur values (2, 21, 70);
insert into statistiquejoueur values (3, 21, 44000);
insert into statistiquejoueur values (4, 21, 470);
insert into statistiquejoueur values (1, 22, 460);
insert into statistiquejoueur values (2, 22, 50);
insert into statistiquejoueur values (3, 22, 42000);
insert into statistiquejoueur values (4, 22, 450);
insert into statistiquejoueur values (1, 23, 420);
insert into statistiquejoueur values (2, 23, 10);
insert into statistiquejoueur values (3, 23, 39000);
insert into statistiquejoueur values (4, 23, 420);
insert into statistiquejoueur values (1, 24, 460);
insert into statistiquejoueur values (2, 24, 240);
insert into statistiquejoueur values (3, 24, 42000);
insert into statistiquejoueur values (4, 24, 450);
insert into statistiquejoueur values (1, 25, 470);
insert into statistiquejoueur values (2, 25, 290);
insert into statistiquejoueur values (3, 25, 44000);
insert into statistiquejoueur values (4, 25, 470);
insert into statistiquejoueur values (1, 26, 420);
insert into statistiquejoueur values (2, 26, 20);
insert into statistiquejoueur values (3, 26, 39000);
insert into statistiquejoueur values (4, 26, 420);
insert into statistiquejoueur values (1, 27, 410);
insert into statistiquejoueur values (2, 27, 110);
insert into statistiquejoueur values (3, 27, 38000);
insert into statistiquejoueur values (4, 27, 410);
insert into statistiquejoueur values (1, 28, 400);
insert into statistiquejoueur values (2, 28, 60);
insert into statistiquejoueur values (3, 28, 37000);
insert into statistiquejoueur values (4, 28, 400);
insert into statistiquejoueur values (1, 29, 460);
insert into statistiquejoueur values (2, 29, 110);
insert into statistiquejoueur values (3, 29, 43000);
insert into statistiquejoueur values (4, 29, 460);
insert into statistiquejoueur values (1, 30, 380);
insert into statistiquejoueur values (2, 30, 40);
insert into statistiquejoueur values (3, 30, 35000);
insert into statistiquejoueur values (4, 30, 380);
insert into statistiquejoueur values (1, 31, 380);
insert into statistiquejoueur values (2, 31, 20);
insert into statistiquejoueur values (3, 31, 35000);
insert into statistiquejoueur values (4, 31, 380);
insert into statistiquejoueur values (1, 32, 460);
insert into statistiquejoueur values (2, 32, 90);
insert into statistiquejoueur values (3, 32, 42000);
insert into statistiquejoueur values (4, 32, 450);
insert into statistiquejoueur values (1, 33, 480);
insert into statistiquejoueur values (2, 33, 220);
insert into statistiquejoueur values (3, 33, 44000);
insert into statistiquejoueur values (4, 33, 470);
insert into statistiquejoueur values (1, 34, 380);
insert into statistiquejoueur values (2, 34, 80);
insert into statistiquejoueur values (3, 34, 35000);
insert into statistiquejoueur values (4, 34, 380);
insert into statistiquejoueur values (1, 35, 470);
insert into statistiquejoueur values (2, 35, 70);
insert into statistiquejoueur values (3, 35, 44000);
insert into statistiquejoueur values (4, 35, 470);
insert into statistiquejoueur values (1, 36, 380);
insert into statistiquejoueur values (2, 36, 100);
insert into statistiquejoueur values (3, 36, 35000);
insert into statistiquejoueur values (4, 36, 380);
insert into statistiquejoueur values (1, 37, 380);
insert into statistiquejoueur values (2, 37, 0);
insert into statistiquejoueur values (3, 37, 35000);
insert into statistiquejoueur values (4, 37, 380);
insert into statistiquejoueur values (1, 38, 380);
insert into statistiquejoueur values (2, 38, 90);
insert into statistiquejoueur values (3, 38, 35000);
insert into statistiquejoueur values (4, 38, 380);
insert into statistiquejoueur values (1, 39, 370);
insert into statistiquejoueur values (2, 39, 50);
insert into statistiquejoueur values (3, 39, 34000);
insert into statistiquejoueur values (4, 39, 370);
insert into statistiquejoueur values (1, 40, 370);
insert into statistiquejoueur values (2, 40, 30);
insert into statistiquejoueur values (3, 40, 34000);
insert into statistiquejoueur values (4, 40, 370);
insert into statistiquejoueur values (1, 41, 370);
insert into statistiquejoueur values (2, 41, 40);
insert into statistiquejoueur values (3, 41, 34000);
insert into statistiquejoueur values (4, 41, 370);
insert into statistiquejoueur values (1, 42, 360);
insert into statistiquejoueur values (2, 42, 40);
insert into statistiquejoueur values (3, 42, 33000);
insert into statistiquejoueur values (4, 42, 360);
insert into statistiquejoueur values (1, 43, 450);
insert into statistiquejoueur values (2, 43, 40);
insert into statistiquejoueur values (3, 43, 41000);
insert into statistiquejoueur values (4, 43, 440);
insert into statistiquejoueur values (1, 44, 360);
insert into statistiquejoueur values (2, 44, 10);
insert into statistiquejoueur values (3, 44, 32000);
insert into statistiquejoueur values (4, 44, 360);
insert into statistiquejoueur values (1, 45, 360);
insert into statistiquejoueur values (2, 45, 20);
insert into statistiquejoueur values (3, 45, 32000);
insert into statistiquejoueur values (4, 45, 360);
insert into statistiquejoueur values (1, 46, 460);
insert into statistiquejoueur values (2, 46, 0);
insert into statistiquejoueur values (3, 46, 42000);
insert into statistiquejoueur values (4, 46, 450);
insert into statistiquejoueur values (1, 47, 360);
insert into statistiquejoueur values (2, 47, 80);
insert into statistiquejoueur values (3, 47, 32000);
insert into statistiquejoueur values (4, 47, 360);
insert into statistiquejoueur values (1, 48, 370);
insert into statistiquejoueur values (2, 48, 70);
insert into statistiquejoueur values (3, 48, 34000);
insert into statistiquejoueur values (4, 48, 370);
insert into statistiquejoueur values (1, 49, 440);
insert into statistiquejoueur values (2, 49, 80);
insert into statistiquejoueur values (3, 49, 41000);
insert into statistiquejoueur values (4, 49, 440);
insert into statistiquejoueur values (1, 50, 20);
insert into statistiquejoueur values (2, 50, 0);
insert into statistiquejoueur values (3, 50, 1800);
insert into statistiquejoueur values (4, 50, 20);


--
-- TOC entry 4044 (class 0 OID 1213679)
-- Dependencies: 265
-- Data for Name: stockproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into stockproduit values (29, 1, 11);
insert into stockproduit values (29, 5, 11);
insert into stockproduit values (30, 4, 6);
insert into stockproduit values (14, 2, 4);
insert into stockproduit values (30, 3, 3);
insert into stockproduit values (61, 6, 6);
insert into stockproduit values (2, 2, 0);
insert into stockproduit values (20, 3, 0);
insert into stockproduit values (20, 1, 11);
insert into stockproduit values (59, 8, 10);
insert into stockproduit values (12, 8, 6);
insert into stockproduit values (29, 6, 0);
insert into stockproduit values (8, 3, 10);
insert into stockproduit values (30, 5, 3);
insert into stockproduit values (36, 1, 11);
insert into stockproduit values (61, 1, 11);
insert into stockproduit values (51, 7, 12);
insert into stockproduit values (27, 8, 9);
insert into stockproduit values (18, 3, 0);
insert into stockproduit values (30, 1, 4);
insert into stockproduit values (11, 2, 5);
insert into stockproduit values (10, 2, 7);
insert into stockproduit values (9, 3, 7);
insert into stockproduit values (36, 5, 7);
insert into stockproduit values (51, 5, 11);
insert into stockproduit values (10, 4, 3);
insert into stockproduit values (21, 8, 1);
insert into stockproduit values (48, 8, 2);
insert into stockproduit values (25, 8, 7);
insert into stockproduit values (32, 4, 12);
insert into stockproduit values (19, 3, 2);
insert into stockproduit values (1, 2, 5);
insert into stockproduit values (38, 4, 6);
insert into stockproduit values (32, 2, 11);
insert into stockproduit values (13, 3, 13);
insert into stockproduit values (24, 8, 12);
insert into stockproduit values (29, 3, 5);
insert into stockproduit values (17, 1, 5);
insert into stockproduit values (11, 5, 1);
insert into stockproduit values (5, 8, 12);
insert into stockproduit values (42, 1, 2);
insert into stockproduit values (55, 1, 7);
insert into stockproduit values (50, 2, 3);
insert into stockproduit values (8, 6, 4);
insert into stockproduit values (57, 3, 1);
insert into stockproduit values (3, 8, 5);
insert into stockproduit values (1, 4, 12);
insert into stockproduit values (39, 8, 7);
insert into stockproduit values (9, 2, 4);
insert into stockproduit values (45, 2, 12);
insert into stockproduit values (20, 2, 4);
insert into stockproduit values (35, 1, 2);
insert into stockproduit values (29, 2, 3);
insert into stockproduit values (53, 4, 7);
insert into stockproduit values (43, 8, 1);
insert into stockproduit values (41, 4, 4);
insert into stockproduit values (64, 8, 8);
insert into stockproduit values (55, 3, 7);
insert into stockproduit values (35, 3, 3);
insert into stockproduit values (9, 1, 0);
insert into stockproduit values (35, 4, 5);
insert into stockproduit values (32, 3, 1);
insert into stockproduit values (53, 1, 13);
insert into stockproduit values (11, 4, 0);
insert into stockproduit values (53, 6, 1);
insert into stockproduit values (19, 1, 2);
insert into stockproduit values (53, 3, 12);
insert into stockproduit values (17, 3, 13);
insert into stockproduit values (57, 2, 8);
insert into stockproduit values (17, 6, 11);
insert into stockproduit values (51, 3, 1);
insert into stockproduit values (44, 8, 9);
insert into stockproduit values (8, 5, 12);
insert into stockproduit values (38, 2, 10);
insert into stockproduit values (33, 8, 12);
insert into stockproduit values (51, 6, 5);
insert into stockproduit values (69, 3, 2);
insert into stockproduit values (8, 1, 6);
insert into stockproduit values (69, 5, 2);
insert into stockproduit values (34, 8, 1);
insert into stockproduit values (50, 3, 9);
insert into stockproduit values (55, 6, 5);
insert into stockproduit values (13, 4, 8);
insert into stockproduit values (14, 3, 6);
insert into stockproduit values (8, 4, 3);
insert into stockproduit values (55, 5, 0);
insert into stockproduit values (55, 2, 10);
insert into stockproduit values (68, 8, 3);
insert into stockproduit values (2, 4, 10);
insert into stockproduit values (69, 2, 13);
insert into stockproduit values (47, 8, 3);
insert into stockproduit values (41, 3, 6);
insert into stockproduit values (14, 6, 0);
insert into stockproduit values (14, 4, 6);
insert into stockproduit values (45, 1, 6);
insert into stockproduit values (16, 8, 1);
insert into stockproduit values (50, 4, 10);
insert into stockproduit values (36, 3, 12);
insert into stockproduit values (55, 4, 9);
insert into stockproduit values (51, 1, 11);
insert into stockproduit values (41, 5, 0);
insert into stockproduit values (19, 2, 4);
insert into stockproduit values (62, 3, 4);
insert into stockproduit values (49, 8, 3);
insert into stockproduit values (36, 6, 3);
insert into stockproduit values (69, 4, 13);
insert into stockproduit values (14, 1, 3);
insert into stockproduit values (36, 7, 12);
insert into stockproduit values (17, 5, 2);
insert into stockproduit values (67, 1, 11);
insert into stockproduit values (17, 7, 6);
insert into stockproduit values (4, 4, 6);
insert into stockproduit values (41, 1, 3);
insert into stockproduit values (66, 8, 0);
insert into stockproduit values (19, 4, 6);
insert into stockproduit values (2, 6, 9);
insert into stockproduit values (17, 2, 8);
insert into stockproduit values (23, 2, 8);
insert into stockproduit values (53, 5, 8);
insert into stockproduit values (54, 8, 2);
insert into stockproduit values (53, 2, 8);
insert into stockproduit values (8, 2, 10);
insert into stockproduit values (18, 2, 10);
insert into stockproduit values (42, 4, 8);
insert into stockproduit values (14, 5, 0);
insert into stockproduit values (31, 8, 1);
insert into stockproduit values (10, 3, 8);
insert into stockproduit values (9, 4, 7);
insert into stockproduit values (51, 4, 12);
insert into stockproduit values (13, 2, 0);
insert into stockproduit values (15, 8, 11);
insert into stockproduit values (23, 4, 1);
insert into stockproduit values (61, 4, 1);
insert into stockproduit values (40, 8, 11);
insert into stockproduit values (35, 2, 3);
insert into stockproduit values (63, 8, 10);
insert into stockproduit values (23, 3, 6);
insert into stockproduit values (19, 6, 9);
insert into stockproduit values (2, 1, 0);
insert into stockproduit values (19, 5, 1);
insert into stockproduit values (61, 5, 4);
insert into stockproduit values (2, 3, 1);
insert into stockproduit values (67, 2, 7);
insert into stockproduit values (36, 2, 5);
insert into stockproduit values (22, 8, 13);
insert into stockproduit values (11, 3, 6);
insert into stockproduit values (56, 8, 1);
insert into stockproduit values (37, 8, 4);
insert into stockproduit values (62, 1, 8);
insert into stockproduit values (41, 2, 6);
insert into stockproduit values (6, 8, 5);
insert into stockproduit values (4, 3, 3);
insert into stockproduit values (57, 4, 11);
insert into stockproduit values (42, 2, 1);
insert into stockproduit values (38, 3, 7);
insert into stockproduit values (42, 3, 13);
insert into stockproduit values (52, 8, 8);
insert into stockproduit values (29, 4, 4);
insert into stockproduit values (7, 8, 6);
insert into stockproduit values (1, 3, 12);
insert into stockproduit values (67, 4, 13);
insert into stockproduit values (32, 5, 0);
insert into stockproduit values (65, 8, 11);
insert into stockproduit values (18, 4, 10);
insert into stockproduit values (11, 1, 13);
insert into stockproduit values (51, 2, 1);
insert into stockproduit values (46, 8, 3);
insert into stockproduit values (36, 4, 9);
insert into stockproduit values (61, 3, 6);
insert into stockproduit values (62, 4, 10);
insert into stockproduit values (60, 8, 6);
insert into stockproduit values (62, 5, 11);
insert into stockproduit values (2, 5, 12);
insert into stockproduit values (61, 2, 3);
insert into stockproduit values (45, 3, 4);
insert into stockproduit values (17, 4, 12);
insert into stockproduit values (32, 1, 13);
insert into stockproduit values (62, 2, 12);
insert into stockproduit values (26, 8, 0);
insert into stockproduit values (45, 4, 3);
insert into stockproduit values (62, 6, 2);
insert into stockproduit values (67, 3, 0);
insert into stockproduit values (58, 8, 5);
insert into stockproduit values (69, 1, 6);
insert into stockproduit values (30, 2, 2);
insert into stockproduit values (30, 6, 6);
insert into stockproduit values (20, 4, 13);
insert into stockproduit values (28, 8, 2);
insert into stockproduit values (4, 2, 0);


--
-- TOC entry 4048 (class 0 OID 1213694)
-- Dependencies: 269
-- Data for Name: themevote; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into themevote values (1, 'The Best - Buteur de la FIFA');
insert into themevote values (2, 'The Best - Attaquant de la FIFA');
insert into themevote values (3, 'The Best - Gardien de la FIFA');
insert into themevote values (4, 'The Best - Defenseur');


--
-- TOC entry 4049 (class 0 OID 1213700)
-- Dependencies: 270
-- Data for Name: themevotecontientjoueur; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into themevotecontientjoueur values (1, 1);
insert into themevotecontientjoueur values (1, 2);
insert into themevotecontientjoueur values (1, 3);
insert into themevotecontientjoueur values (1, 4);
insert into themevotecontientjoueur values (1, 5);
insert into themevotecontientjoueur values (1, 6);
insert into themevotecontientjoueur values (1, 7);
insert into themevotecontientjoueur values (1, 8);
insert into themevotecontientjoueur values (1, 9);
insert into themevotecontientjoueur values (1, 10);
insert into themevotecontientjoueur values (2, 11);
insert into themevotecontientjoueur values (2, 12);
insert into themevotecontientjoueur values (2, 13);
insert into themevotecontientjoueur values (2, 14);
insert into themevotecontientjoueur values (2, 15);
insert into themevotecontientjoueur values (2, 16);
insert into themevotecontientjoueur values (2, 17);
insert into themevotecontientjoueur values (2, 18);
insert into themevotecontientjoueur values (2, 19);
insert into themevotecontientjoueur values (2, 20);
insert into themevotecontientjoueur values (3, 21);
insert into themevotecontientjoueur values (3, 22);
insert into themevotecontientjoueur values (3, 23);
insert into themevotecontientjoueur values (3, 24);
insert into themevotecontientjoueur values (3, 25);
insert into themevotecontientjoueur values (3, 26);
insert into themevotecontientjoueur values (3, 27);
insert into themevotecontientjoueur values (3, 28);
insert into themevotecontientjoueur values (3, 29);
insert into themevotecontientjoueur values (3, 30);
insert into themevotecontientjoueur values (4, 31);
insert into themevotecontientjoueur values (4, 32);
insert into themevotecontientjoueur values (4, 33);
insert into themevotecontientjoueur values (4, 34);
insert into themevotecontientjoueur values (4, 35);
insert into themevotecontientjoueur values (4, 36);
insert into themevotecontientjoueur values (4, 37);
insert into themevotecontientjoueur values (4, 38);
insert into themevotecontientjoueur values (4, 39);
insert into themevotecontientjoueur values (4, 40);


--
-- TOC entry 4056 (class 0 OID 1213740)
-- Dependencies: 277
-- Data for Name: utilisateurvote; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into utilisateurvote values (1, 1, 5, 1);
insert into utilisateurvote values (1, 1, 2, 2);
insert into utilisateurvote values (1, 1, 8, 3);
insert into utilisateurvote values (2, 1, 1, 1);
insert into utilisateurvote values (2, 1, 5, 2);
insert into utilisateurvote values (2, 1, 6, 3);
insert into utilisateurvote values (3, 1, 9, 1);
insert into utilisateurvote values (3, 1, 2, 2);
insert into utilisateurvote values (4, 1, 4, 3);
insert into utilisateurvote values (4, 1, 10, 1);
insert into utilisateurvote values (4, 1, 5, 2);


--
-- TOC entry 4061 (class 0 OID 1213764)
-- Dependencies: 282
-- Data for Name: visiteproduit; Type: TABLE DATA; Schema: fifa; Owner: batdyl
--

insert into visiteproduit values (42, 18);
insert into visiteproduit values (4, 3);
insert into visiteproduit values (10, 5);
insert into visiteproduit values (26, 5);
insert into visiteproduit values (38, 10);
insert into visiteproduit values (8, 23);
insert into visiteproduit values (19, 48);
insert into visiteproduit values (31, 40);
insert into visiteproduit values (6, 27);
insert into visiteproduit values (6, 7);
insert into visiteproduit values (33, 33);
insert into visiteproduit values (3, 28);
insert into visiteproduit values (32, 11);
insert into visiteproduit values (19, 30);
insert into visiteproduit values (47, 44);
insert into visiteproduit values (31, 39);
insert into visiteproduit values (38, 14);
insert into visiteproduit values (10, 6);
insert into visiteproduit values (48, 46);
insert into visiteproduit values (25, 17);
insert into visiteproduit values (8, 15);
insert into visiteproduit values (1, 42);
insert into visiteproduit values (20, 11);
insert into visiteproduit values (19, 15);
insert into visiteproduit values (21, 32);
insert into visiteproduit values (19, 34);
insert into visiteproduit values (33, 40);
insert into visiteproduit values (42, 7);
insert into visiteproduit values (3, 1);
insert into visiteproduit values (9, 12);
insert into visiteproduit values (17, 14);
insert into visiteproduit values (42, 42);
insert into visiteproduit values (43, 5);
insert into visiteproduit values (11, 1);
insert into visiteproduit values (18, 43);
insert into visiteproduit values (29, 26);
insert into visiteproduit values (4, 4);
insert into visiteproduit values (46, 22);
insert into visiteproduit values (12, 42);
insert into visiteproduit values (24, 34);
insert into visiteproduit values (19, 19);
insert into visiteproduit values (30, 44);
insert into visiteproduit values (30, 20);
insert into visiteproduit values (41, 17);
insert into visiteproduit values (16, 4);
insert into visiteproduit values (33, 34);
insert into visiteproduit values (19, 14);
insert into visiteproduit values (28, 21);
insert into visiteproduit values (11, 36);
insert into visiteproduit values (5, 35);
insert into visiteproduit values (37, 12);
insert into visiteproduit values (12, 19);
insert into visiteproduit values (13, 40);
insert into visiteproduit values (46, 4);
insert into visiteproduit values (40, 28);
insert into visiteproduit values (50, 34);
insert into visiteproduit values (32, 37);
insert into visiteproduit values (4, 22);
insert into visiteproduit values (4, 15);
insert into visiteproduit values (1, 28);
insert into visiteproduit values (5, 46);
insert into visiteproduit values (24, 28);
insert into visiteproduit values (47, 25);
insert into visiteproduit values (33, 28);
insert into visiteproduit values (34, 42);
insert into visiteproduit values (30, 35);
insert into visiteproduit values (16, 8);
insert into visiteproduit values (27, 7);
insert into visiteproduit values (39, 37);
insert into visiteproduit values (22, 10);
insert into visiteproduit values (26, 47);
insert into visiteproduit values (39, 36);
insert into visiteproduit values (38, 21);
insert into visiteproduit values (37, 14);
insert into visiteproduit values (33, 32);
insert into visiteproduit values (18, 30);
insert into visiteproduit values (24, 19);
insert into visiteproduit values (38, 23);
insert into visiteproduit values (33, 39);
insert into visiteproduit values (20, 36);
insert into visiteproduit values (30, 23);
insert into visiteproduit values (29, 2);
insert into visiteproduit values (36, 28);
insert into visiteproduit values (40, 8);
insert into visiteproduit values (24, 47);
insert into visiteproduit values (41, 7);
insert into visiteproduit values (10, 3);
insert into visiteproduit values (11, 20);
insert into visiteproduit values (6, 1);
insert into visiteproduit values (6, 6);
insert into visiteproduit values (22, 2);
insert into visiteproduit values (35, 2);
insert into visiteproduit values (37, 27);
insert into visiteproduit values (30, 25);
insert into visiteproduit values (19, 44);
insert into visiteproduit values (38, 2);
insert into visiteproduit values (32, 25);
insert into visiteproduit values (9, 44);
insert into visiteproduit values (2, 31);
insert into visiteproduit values (48, 31);
insert into visiteproduit values (34, 35);
insert into visiteproduit values (33, 37);
insert into visiteproduit values (50, 25);
insert into visiteproduit values (11, 32);
insert into visiteproduit values (33, 49);
insert into visiteproduit values (45, 1);
insert into visiteproduit values (33, 6);
insert into visiteproduit values (42, 40);
insert into visiteproduit values (1, 16);
insert into visiteproduit values (26, 25);
insert into visiteproduit values (45, 25);
insert into visiteproduit values (11, 49);
insert into visiteproduit values (22, 38);
insert into visiteproduit values (35, 26);
insert into visiteproduit values (15, 24);
insert into visiteproduit values (39, 44);
insert into visiteproduit values (13, 13);
insert into visiteproduit values (36, 31);
insert into visiteproduit values (34, 50);
insert into visiteproduit values (34, 48);
insert into visiteproduit values (23, 39);
insert into visiteproduit values (23, 26);
insert into visiteproduit values (20, 17);
insert into visiteproduit values (13, 19);
insert into visiteproduit values (48, 21);
insert into visiteproduit values (22, 25);
insert into visiteproduit values (33, 5);
insert into visiteproduit values (18, 27);
insert into visiteproduit values (38, 46);
insert into visiteproduit values (22, 24);
insert into visiteproduit values (41, 1);
insert into visiteproduit values (29, 4);
insert into visiteproduit values (26, 14);
insert into visiteproduit values (37, 23);
insert into visiteproduit values (10, 23);
insert into visiteproduit values (29, 16);
insert into visiteproduit values (11, 46);
insert into visiteproduit values (38, 9);
insert into visiteproduit values (11, 15);
insert into visiteproduit values (50, 47);
insert into visiteproduit values (36, 32);
insert into visiteproduit values (43, 22);
