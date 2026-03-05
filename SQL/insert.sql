set echo on
create or replace 
PROCEDURE ZAPNI_CIZI_KLICE AS 
BEGIN
  FOR cur IN (select CONSTRAINT_NAME, TABLE_NAME 
             from USER_CONSTRAINTS
       where CONSTRAINT_TYPE = 'R' ) 
  LOOP
   execute immediate 'ALTER TABLE '||cur.table_name||' MODIFY CONSTRAINT "'||cur.constraint_name||'" ENABLE VALIDATE';
  END LOOP;
END ZAPNI_CIZI_KLICE;
/
create or replace 
PROCEDURE VYPNI_CIZI_KLICE AS 
BEGIN
  for CUR in (select CONSTRAINT_NAME , TABLE_NAME 
       from USER_CONSTRAINTS
       where CONSTRAINT_TYPE = 'R' ) 
   LOOP
    execute immediate 'ALTER TABLE '||cur.table_name||' MODIFY CONSTRAINT "'||cur.constraint_name||'" DISABLE ';
   END LOOP;
END VYPNI_CIZI_KLICE;
/
create or replace 
PROCEDURE VYMAZ_DATA_VSECH_TABULEK IS
BEGIN
  VYPNI_CIZI_KLICE;
  FOR V_REC IN (SELECT DISTINCT(TABLE_NAME) FROM USER_TABLES)
      LOOP
      EXECUTE IMMEDIATE 'truncate table '||V_REC.TABLE_NAME||' drop storage';
      END LOOP;
  ZAPNI_CIZI_KLICE;
END VYMAZ_DATA_VSECH_TABULEK;
/
set echo on
set autocommit on
execute VYMAZ_DATA_VSECH_TABULEK()
--
-- nĂˇsledujĂ­cĂ­ pĹ™Ă­kaz zapne reĹľim automatickĂ©ho zaĹ™azovĂˇnĂ­ pĹ™Ă­kazu COMMIT za kaĹľdĂ˝ nĂˇsledujĂ­cĂ­ pĹ™Ă­kaz SQL.  
set autocommit on
-- nĂˇsledujĂ­cĂ­ pĹ™Ă­kaz zapne zobrazovĂˇnĂ­ odezvy na kaĹľdĂ˝ pĹ™Ă­kaz SQL
SET ECHO ON
SET DEFINE OFF;
-- jestliĹľe nemĂˇte nĂˇsledujĂ­cĂ­ inserty ve sprĂˇvnĂ©m poĹ™adĂ­, ale jste si jisti, Ĺľe na konec budou data konzistentnĂ­,
-- potom vypnÄ›te kontrolu platnosti integritnĂ­ch omezenĂ­ odkomentovĂˇnĂ­m nĂˇsledujĂ­cĂ­ho pĹ™Ă­kazu, 
-- nezapomÄ›Ĺte ale na konci dĂˇvky zase kontrolu zapnout.
-- EXECUTE VYPNI_CIZI_KLICE;
SET DEFINE OFF;


REM INSERTING into odberatel
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (1, 'Massimiliano Raylton', '148 Katie Junction', '147 826 6439' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (2, 'Jessalyn Denizet', '2 Del Sol Drive', '929 782 7553' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (3, 'Rubie Rustan', '14776 Park Meadow Drive', '679 934 0308' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (4, 'Calida Bartolomeotti', '17951 Schlimgen Center', '351 462 2229' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (5, 'Ryan Seres', '6 Manufacturers Terrace', '749 988 6524' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (6, 'Aldo Burdass', '2171 Dwight Crossing', '765 450 8899' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (7, 'Callie Gabbitis', '2 Pennsylvania Center', '586 627 1881' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (8, 'Verene Dunmuir', '65370 Chive Trail', '960 475 8914' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (9, 'Aaron Drewitt', '39261 Nobel Avenue', '730 678 9957' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (10, 'Olia Quarry', '9 Kedzie Lane', '643 673 1438' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (11, 'Angelita Chinnery', '48186 Eagle Crest Pass', '584 371 9945' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (12, 'Odelle Heinssen', '94 Sheridan Alley', '201 896 2082' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (13, 'Mendel Wohlers', '65425 Annamark Place', '622 203 9416' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (14, 'Celene Laydel', '34987 Mayfield Center', '115 503 4281' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (15, 'Pegeen O''Dooghaine', '09139 Dennis Avenue', '125 537 8211' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (16, 'Roxanne Aumerle', '917 Stoughton Terrace', '466 526 1607' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (17, 'Faustina De Anesy', '259 Packers Hill', '270 501 4015' );
insert into odberatel (id_odb, meno_odb, adresa_odb, kontakt_odb) values (18, 'Frans Albasiny', '37708 Mcguire Circle', '507 484 9246' );


REM INSERTING into material
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'uhlie nespracovane', 80.0, 43.0, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'uhlie netriedene', 73.0, 39.0, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'uhlie hrasok', 33.0, 24.0, 18.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'uhlie orech', 38.0, 26.0, 29.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'strk piesok', 93.0, 44.0, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'strk netriedeny', 68.0, 44.0, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'piesok vlhky', 18.0, 18.0, 22.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'piesok', 60.0, 17.0, 23.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'strk 0/4', 21.0, 25.0, 15.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('29.04.2017', 'strk 4/8', 22.0, 25.0, 9.0);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'uhlie nespracovane', 76.0, 46.0, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'uhlie netriedene', 72.8, 49.8, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'uhlie hrasok', 56.5, 23.5, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'uhlie orech', 55.0, 26.0, 9.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'strk piesok', 86.2, 43.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'strk netriedeny', 40.3, 22.3, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'piesok vlhky', 27.6, 27.6, 18.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'piesok', 50.1, 14.4, 24.3);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'strk 0/4', 31.1, 18.1, 8.2);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('01.05.2017', 'strk 4/8', 40.2, 31.1, 12.9);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'uhlie nespracovane', 70.7, 44.7, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'uhlie netriedene', 71.4, 48.6, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'uhlie hrasok', 65.9, 24.5, 15.1);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'uhlie orech', 62.9, 24.0, 16.1);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'strk piesok', 79.4, 43.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'strk netriedeny', 21.3, 21.3, 40.3);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'piesok vlhky', 28.6, 28.6, 27.6);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'piesok', 27.3, 23.3, 46.1);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'strk 0/4', 48.2, 17.1, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('02.05.2017', 'strk 4/8', 57.4, 17.2, 0.0);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'uhlie nespracovane', 65.9, 45.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'uhlie netriedene', 73.2, 51.8, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'uhlie hrasok', 69.3, 18.3, 14.9);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'uhlie orech', 72.4, 25.5, 16.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'strk piesok', 76.6, 47.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'strk netriedeny', 22.2, 22.2, 21.3);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'piesok vlhky', 26.9, 26.9, 28.6);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'piesok', 39.7, 23.4, 11.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'strk 0/4', 49.8, 10.2, 8.6);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('03.05.2017', 'strk 4/8', 60.7, 9.1, 5.8);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'uhlie nespracovane', 63.2, 47.3, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'uhlie netriedene', 71.6, 48.4, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'uhlie hrasok', 90.6, 22.7, 1.4);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'uhlie orech', 82.7, 26.5, 16.2);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'strk piesok', 70.8, 44.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'strk netriedeny', 24.9, 24.9, 22.2);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'piesok vlhky', 24.9, 24.9, 26.9);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'piesok', 44.6, 21.8, 16.9);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'strk 0/4', 59.8, 10.0, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('04.05.2017', 'strk 4/8', 43.9, 10.0, 26.8);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'uhlie nespracovane', 61.9, 48.7, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'uhlie netriedene', 68.5, 46.9, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'uhlie hrasok', 115.0, 24.4, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'uhlie orech', 106.2, 23.5, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'strk piesok', 70.0, 49.2, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'strk netriedeny', 24.1, 24.1, 24.9);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'piesok vlhky', 23.4, 23.4, 24.9);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'piesok', 64.3, 19.7, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'strk 0/4', 70.9, 11.1, 0.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('05.05.2017', 'strk 4/8', 40.8, 12.3, 15.4);

insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'uhlie nespracovane', 60.5, 48.6, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'uhlie netriedene', 64.9, 46.4, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'uhlie hrasok', 155.1, 23.4, 16.7);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'uhlie orech', 113.2, 24.5, 17.5);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'strk piesok', 68.1, 48.1, 50.0);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'strk netriedeny', 11.0, 11.0, 24.1);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'piesok vlhky', 10.2, 10.2, 23.4);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'piesok', 72.6, 19.6, 11.3);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'strk 0/4', 63.7, 10.1, 17.3);
insert into material (datum, material, hmotnost_sklad, zisk, vydaj) values ('06.05.2017', 'strk 4/8', 52.1, 11.3, 0.0);


REM INSERTING into lom
insert into lom (meno_lom, rozloha) values ( 'Puf', 1.6 );
insert into lom (meno_lom, rozloha) values ( 'Muf', 2.1 );


REM INSERTING into zamestnanec
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (1, 'Cherey Treat', '20119 Miller Plaza', '446 259 5310');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (2, 'Dorita Hub', '7 Judy Street', '513 781 9326');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (3, 'Eloisa Deane', '615 5th Alley', '461 186 7202');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (4, 'Curtice Whiffen', '46 Sloan Street', '205 793 9063');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (5, 'Pepe Nickoles', '6 Sundown Way', '119 323 5339');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (6, 'Tann Bowkett', '0 Sutherland Way', '610 931 6837');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (7, 'Kimmie Parmer', '6 Badeau Point', '244 336 0499');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (8, 'Saunders Ellings', '0 Weeping Birch Junction', '604 516 4465');

insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (9, 'Putnam Trenfield', '87 Del Mar Alley', '502 353 5988');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (10, 'Sybilla Brixey', '31 Maywood Junction', '310 544 4864');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (11, 'Clemmie Athridge', '77606 Reindahl Trail', '950 886 7843');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (12, 'Vivianna Jalland', '22045 American Ash Hill', '443 661 0756');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (13, 'Ginnifer Westmoreland', '20739 Paget Road', '247 167 7933');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (14, 'Revkah MacNeely', '96 Morning Parkway', '326 530 8190');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (15, 'Rowan Loddon', '47713 Knutson Park', '722 690 5174');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (16, 'Manon Linfitt', '304 Eggendart Avenue', '591 345 3553');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (17, 'Izaak Di Biasi', '109 Forest Park', '935 435 4763');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (18, 'Eyde Bailiss', '22 Dorton Way', '802 514 3056');

insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (19, 'Emmalyn Wardall', '7 Gulseth Drive', '603 748 2674');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (20, 'Ara Studeart', '2 Swallow Terrace', '924 220 6522');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (21, 'Skipton Stickells', '698 2nd Center', '713 742 7170');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (22, 'Hadrian Officer', '704 Del Sol Parkway', '472 136 8081');

insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (23, 'Milt Hughs', '5896 Dorton Circle', '881 575 4080');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (24, 'Agnesse Curtois', '4314 Scott Alley', '464 899 2987');

insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (25, 'Harold Kleinsmuntz', '2 Continental Avenue', '669 256 6003');
insert into zamestnanec (id_zam, meno_zam, adresa_zam, kontakt_zam) values (26, 'Tann Loddon', '28 Dorton Sol', '812 514 3156');

REM INSERTING into sofer
insert into sofer (id_zam, skupina_vodickeho_preukazu) values (19, 'C1E');
insert into sofer (id_zam, skupina_vodickeho_preukazu) values (20, 'C1');
insert into sofer (id_zam, skupina_vodickeho_preukazu) values (21, 'C');
insert into sofer (id_zam, skupina_vodickeho_preukazu) values (22, 'C1');


REM INSERTING into vozidlo
insert into vozidlo (spz, id_zam, nosnost) values ('bn3 60gu', 19, 10);
insert into vozidlo (spz, id_zam, nosnost) values ('agv 02k8', 19, 7);
insert into vozidlo (spz, id_zam, nosnost) values ('whg 99fh', 20, 7);
insert into vozidlo (spz, id_zam, nosnost) values ('ivs 9s53', 21, 3);
insert into vozidlo (spz, id_zam, nosnost) values ('kxa xqe4', 22, 7);
insert into vozidlo (spz, id_zam, nosnost) values ('7j1 4zi2', 22, 3);
insert into vozidlo (spz, id_zam, nosnost) values ('ege 127s', null, 2);
insert into vozidlo (spz, id_zam, nosnost) values ('n0b l33t', null, 7);


REM INSERTING into pracovnik
insert into pracovnik (id_zam, pozicia) values (1 , 'veduci lomu');
insert into pracovnik (id_zam, pozicia) values (2 , 'banik');
insert into pracovnik (id_zam, pozicia) values (3 , 'banik');
insert into pracovnik (id_zam, pozicia) values (4 , 'banik');
insert into pracovnik (id_zam, pozicia) values (5 , 'vodic');
insert into pracovnik (id_zam, pozicia) values (6 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (7 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (8 , 'obsluha strojov');

insert into pracovnik (id_zam, pozicia) values (9 , 'veduci lomu');
insert into pracovnik (id_zam, pozicia) values (10 , 'banik');
insert into pracovnik (id_zam, pozicia) values (11 , 'banik');
insert into pracovnik (id_zam, pozicia) values (12 , 'banik');
insert into pracovnik (id_zam, pozicia) values (13 , 'vodic');
insert into pracovnik (id_zam, pozicia) values (14 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (15 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (16 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (17 , 'obsluha strojov');
insert into pracovnik (id_zam, pozicia) values (18 , 'obsluha strojov');

insert into pracovnik (id_zam, pozicia) values (23 , 'vratnik');
insert into pracovnik (id_zam, pozicia) values (24 , 'vratnik');

REM INSERTING into vybavenie
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (1, 'Puf', 'drticka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (2, 'Puf', 'triedicka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (3, 'Puf', 'sklapac');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (4, 'Puf', 'nakladac');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (5, 'Puf', 'bager');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (6, 'Puf', 'buldozer');

insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (7, 'Muf', 'susicka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (8, 'Muf', 'triedicka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (9, 'Muf', 'triedicka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (10, 'Muf', 'sklapac');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (11, 'Muf', 'nakladac');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (12, 'Muf', 'bager');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (13, 'Muf', 'bager');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (14, 'Muf', 'drticka');
insert into vybavenie (id_vybavenie, meno_lom, typ_vybavenie) values (15, 'Muf', 'buldozer');


REM INSERTING into objednavka
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (1, 10, 'strk 4/8', 13.8, '04.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (2, 4, 'piesok', 11.0, '03.05.2017', '05583 Killdeer Hill');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (3, 11, 'strk 0/4', 8.3, '03.05.2017', '22186 Kim Hill');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (4, 10, 'piesok', 14.4, '02.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (5, 6, 'uhlie orech', 16.0, '03.05.2017', '3 Mockingbird Pass');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (6, 18, 'strk 0/4', 9.5, '05.05.2017', '632 Westend Point');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (7, 10, 'uhlie hrasok', 4.4, '12.05.2017', '0605 Dottie Circle');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (8, 15, 'uhlie orech', 11.2, '04.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (9, 10, 'strk 4/8', 13.0, '04.05.2017', '97300 Arapahoe Park');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (10, 1, 'strk 4/8', 3.7, '15.05.2017', '053 Dixon Junction');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (11, 13, 'strk 4/8', 5.8, '13.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (12, 12, 'uhlie orech', 5.0, '04.05.2017', '95 Eastlawn Plaza');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (13, 14, 'strk 0/4', 16.8, '05.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (14, 6, 'piesok', 14.0, '01.05.2017', '009 Debs Trail');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (15, 18, 'piesok', 18.9, null, null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (16, 6, 'uhlie hrasok', 4.9, '02.05.2017', '67 Manufacturers Junction');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (17, 9, 'piesok', 10.3, '01.05.2017', '8 Cherokee Pass');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (18, 11, 'strk 0/4', 8.2, '11.05.2017', '410 Burrows Hill');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (19, 2, 'uhlie hrasok', 7.0, '03.05.2017', '25338 Graceland Alley');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (20, 3, 'uhlie hrasok', 2.0, '03.05.2017', '52 Tomscot Avenue');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (21, 13, 'uhlie hrasok', 10.2, '02.05.2017', '3 Bunting Junction');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (22, 16, 'strk 0/4', 17.3, '06.05.2017', '40 La Follette Pass');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (23, 12, 'uhlie orech', 9.0, '01.05.2017', '04580 Norway Maple Road');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (24, 12, 'piesok', 11.3, '06.05.2017', '1658 Delaware Hill');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (25, 2, 'strk 4/8', 12.9, '01.05.2017', '7971 Monument Center');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (26, 15, 'piesok', 3.3, '02.05.2017', '3 Vernon Crossing');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (27, 12, 'uhlie orech', 16.1, '02.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (28, 9, 'strk 4/8', 15.4, '05.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (29, 1, 'strk 0/4', 18.0, '05.05.2017', '2 Mallard Trail');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (30, 4, 'strk 0/4', 8.2, '01.05.2017', '44 Mifflin Point');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (31, 1, 'uhlie orech', 17.5, '06.05.2017', '64461 Fulton Park');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (32, 18, 'piesok', 9.5, '02.05.2017', '6 Loomis Place');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (33, 6, 'uhlie hrasok', 1.4, '04.05.2017', '5088 Cardinal Way');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (34, 5, 'uhlie hrasok', 16.7, '06.05.2017', '822 Mendota Terrace');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (35, 1, 'piesok', 16.9, '04.05.2017', null);
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (36, 4, 'uhlie orech', 8.7, '14.05.2017', '107 Bayside Crossing');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (37, 17, 'uhlie hrasok', 5.9, '03.05.2017', '55 Beilfuss Road');

insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (38, 3, 'strk 4/8', 2.4, '12.05.2017', '08 Spohn Crossing');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (39, 7, 'strk 4/8', 6.5, '09.05.2017', '16 Ronald Regan Alley');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (40, 14, 'strk 4/8', 3.4, '10.05.2017', '53845 Loftsgordon Park');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (41, 10, 'strk 0/4', 10.1, '11.05.2017', '0 Arizona Junction');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (42, 18, 'piesok', 14.1, '12.05.2017', '5457 Delaware Pass');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (43, 1, 'strk 4/8', 11.7, '09.05.2017', '845 Blaine Crossing');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (44, 9, 'strk 0/4', 4.5, '09.05.2017', '1 Everett Plaza');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (45, 4, 'piesok', 6.5, '12.05.2017', '12467 East Drive');
insert into objednavka (id_obj, id_odb, material_obj, hmotnost_obj, datum_obj, adresa_obj) values (46, 10, 'strk 4/8', 1.2, '08.05.2017', '5 Spohn Crossing');


REM INSERTING into vydaj
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (1, null, '01.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (2, null, '01.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (3, null, '01.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (4, null, '01.05.2017', 'strk netriedeny', 50.5, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (5, null, '01.05.2017', 'piesok vlhky', 18, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (6, 14, '01.05.2017', 'piesok', 9.0, 5.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (7, 14, '01.05.2017', 'piesok', 5.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (8, 17, '01.05.2017', 'piesok', 6.0, 4.3);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (9, 17, '01.05.2017', 'piesok', 4.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (10, 23, '01.05.2017', 'uhlie orech', 9.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (11, 25, '01.05.2017', 'strk 4/8', 9.0, 3.9);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (12, 25, '01.05.2017', 'strk 4/8', 3.9, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (13, 30, '01.05.2017', 'strk 0/4', 2.8, 5.4);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (14, 30, '01.05.2017', 'strk 0/4', 2.8, 2.6);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (15, 30, '01.05.2017', 'strk 0/4', 2.6, 0.0);


insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (16, null, '02.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (17, null, '02.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (18, null, '02.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (19, null, '02.05.2017', 'strk netriedeny', 40.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (20, null, '02.05.2017', 'piesok vlhky', 27.6, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (21, 4, '02.05.2017', 'piesok', 14.4, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (22, 16, '02.05.2017', 'uhlie hrasok', 4.9, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (23, 21, '02.05.2017', 'uhlie hrasok', 9.0, 1.2);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (24, 21, '02.05.2017', 'uhlie hrasok', 1.2, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (25, 26, '02.05.2017', 'piesok', 3.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (26, 15, '02.05.2017', 'piesok', 18.9, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (27, 27, '02.05.2017', 'uhlie orech', 6.0, 10.1);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (28, 27, '02.05.2017', 'uhlie orech', 6.0, 4.1);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (29, 27, '02.05.2017', 'uhlie orech', 4.1, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (30, 32, '02.05.2017', 'piesok', 9.5, 0.0);


insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (31, null, '03.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (32, null, '03.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (33, null, '03.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (34, null, '03.05.2017', 'strk netriedeny', 21.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (35, null, '03.05.2017', 'piesok vlhky', 28.6, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (36, 2, '03.05.2017', 'piesok', 9.0, 2.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (37, 2, '03.05.2017', 'piesok', 2.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (38, 3, '03.05.2017', 'strk 0/4', 6.0, 2.3);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (39, 3, '03.05.2017', 'strk 0/4', 2.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (40, 5, '03.05.2017', 'uhlie orech', 9.0, 7.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (41, 5, '03.05.2017', 'uhlie orech', 6.0, 1.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (42, 5, '03.05.2017', 'uhlie orech', 1.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (43, 13, '03.05.2017', 'strk 4/8', 5.8, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (44, 19, '03.05.2017', 'uhlie hrasok', 7.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (45, 20, '03.05.2017', 'uhlie hrasok', 2.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (46, 37, '03.05.2017', 'uhlie hrasok', 5.9, 0.0);


insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (47, null, '04.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (48, null, '04.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (49, null, '04.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (50, null, '04.05.2017', 'strk netriedeny', 22.2, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (51, null, '04.05.2017', 'piesok vlhky', 26.9, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (52, 1, '04.05.2017', 'strk 4/8', 13.8, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (53, 8, '04.05.2017', 'uhlie orech', 11.2, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (54, 9, '04.05.2017', 'strk 4/8', 9.0, 4.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (55, 9, '04.05.2017', 'strk 4/8', 4.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (56, 12, '04.05.2017', 'uhlie orech', 5.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (57, 33, '04.05.2017', 'uhlie hrasok', 1.4, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (58, 35, '04.05.2017', 'piesok', 16.9, 0.0); 


insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (59, null, '05.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (60, null, '05.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (61, null, '05.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (62, null, '05.05.2017', 'strk netriedeny', 24.9, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (63, null, '05.05.2017', 'piesok vlhky', 24.9, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (64, 6, '05.05.2017', 'strk 0/4', 8.0, 1.5);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (65, 6, '05.05.2017', 'strk 0/4', 1.5, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (66, 13, '05.05.2017', 'strk 0/4', 16.8, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (67, 28, '05.05.2017', 'strk 4/8', 15.4, 0.0); 
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (68, 29, '05.05.2017', 'strk 0/4', 9.0, 9.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (69, 29, '05.05.2017', 'strk 0/4', 6.5, 2.5);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (70, 29, '05.05.2017', 'strk 0/4', 2.5, 0.0);


insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (71, null, '06.05.2017', 'uhlie nespracovane', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (72, null, '06.05.2017', 'uhlie netriedene', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (73, null, '06.05.2017', 'strk piesok', 50.0, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (74, null, '06.05.2017', 'strk netriedeny', 24.1, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (75, null, '06.05.2017', 'piesok vlhky', 23.4, 0.0);

insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (76, 22, '06.05.2017', 'strk 0/4', 9.0, 8.3);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (77, 22, '06.05.2017', 'strk 0/4', 6.0, 2.3);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (78, 22, '06.05.2017', 'strk 0/4', 2.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (79, 24, '06.05.2017', 'piesok', 9.0, 2.3);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (80, 24, '06.05.2017', 'piesok', 2.3, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (81, 31, '06.05.2017', 'uhlie orech', 6.0, 11.5);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (82, 31, '06.05.2017', 'uhlie orech', 6.0, 5.5);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (83, 31, '06.05.2017', 'uhlie orech', 5.5, 0.0);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (84, 34, '06.05.2017', 'uhlie hrasok', 9.0, 7.7);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (85, 34, '06.05.2017', 'uhlie hrasok', 6.0, 1.7);
insert into vydaj (id_vydaj, id_obj, datum, material, hmotnost_vydaj, novy_zostatok_obj) values (86, 34, '06.05.2017', 'uhlie hrasok', 1.7, 0.0);



REM INSERTING into dodanie
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (6, 14, 'bn3 60gu', 43.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (7, 14, 'whg 99fh', 43.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (8, 17, 'kxa xqe4', 33.8);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (9, 17, 'whg 99fh', 33.8);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (10, 23, 'bn3 60gu', 54.4);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (11, 25, 'bn3 60gu', 20.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (12, 25, 'kxa xqe4', 54.4);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (13, 30, 'ivs 9s53', 10.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (14, 30, 'ivs 9s53', 10.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (15, 30, 'ivs 9s53', 10.0);

insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (21, 16, 'kxa xqe4', 9.9);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (22, 21, 'bn3 60gu', 24.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (23, 21, 'ivs 9s53', 24.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (25, 26, 'kxa xqe4', 41.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (27, 27, 'kxa xqe4', 22.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (28, 27, 'agv 02k8', 22.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (29, 27, 'kxa xqe4', 22.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (30, 32, 'bn3 60gu', 8.7);

insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (36, 2, 'bn3 60gu', 29.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (37, 2, 'ivs 9s53', 29.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (38, 3, 'whg 99fh', 9.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (39, 3, 'ivs 9s53', 9.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (40, 5, 'bn3 60gu', 72.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (41, 5, 'kxa xqe4', 72.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (42, 5, 'ivs 9s53', 72.7);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (44, 19, 'bn3 60gu', 61.4);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (45, 20, 'whg 99fh', 21.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (46, 37, 'ivs 9s53', 18.1);

insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (54, 9, 'bn3 60gu', 18.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (55, 9, 'whg 99fh', 18.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (56, 12, 'kxa xqe4', 38.2);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (57, 33, 'ivs 9s53', 34.4);

insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (64, 6, 'bn3 60gu', 36.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (65, 6, 'ivs 9s53', 36.0);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (68, 29, 'bn3 60gu', 85.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (69, 29, 'whg 99fh', 85.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (70, 29, 'ivs 9s53', 85.1);

insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (76, 22, 'bn3 60gu', 55.5);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (77, 22, 'whg 99fh', 55.5);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (78, 22, 'ivs 9s53', 55.5);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (79, 24, 'bn3 60gu', 62.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (80, 24, 'ivs 9s53', 62.1);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (81, 31, 'kxa xqe4', 37.9);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (82, 31, 'whg 99fh', 37.9);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (83, 31, 'kxa xqe4', 37.9);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (84, 34, 'bn3 60gu', 9.8);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (85, 34, 'whg 99fh', 9.8);
insert into dodanie (id_vydaj, id_obj, spz, vzdialenost) values (86, 34, 'ivs 9s53', 9.8);


REM INSERTING into praca
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (1, '01.05.2017', 'Puf', 'uhlie nespracovane', 46.0, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (2, '01.05.2017', 'Puf', 'uhlie netriedene', 49.8, null, 'drtenie', 1, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (3, '01.05.2017', 'Puf', 'uhlie hrasok', 23.5, null, 'triedenie', 2, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (4, '01.05.2017', 'Puf', 'uhlie orech', 26.0, null, 'triedenie', 2, -1);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (5, '01.05.2017', 'Muf', 'strk piesok', 43.2, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (6, '01.05.2017', 'Muf', 'strk netriedeny', 22.3, null, 'triedenie', 3, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (7, '01.05.2017', 'Muf', 'piesok vlhky', 27.6, null, 'triedenie', 3, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (8, '01.05.2017', 'Muf', 'piesok', 14.4, null, 'susenie', 4, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (9, '01.05.2017', 'Muf', 'strk 0/4', 18.1, null, 'triedenie', 5, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (10, '01.05.2017', 'Muf', 'strk 4/8', 31.1, null, 'triedenie', 5, null);


insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (11, '02.05.2017', 'Puf', 'uhlie nespracovane', 44.7, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (12, '02.05.2017', 'Puf', 'uhlie netriedene', 48.6, null, 'drtenie', 16, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (13, '02.05.2017', 'Puf', 'uhlie hrasok', 24.5, null, 'triedenie', 17, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (14, '02.05.2017', 'Puf', 'uhlie orech', 24.0, null, 'triedenie', 17, null);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (15, '02.05.2017', 'Muf', 'strk piesok', 43.2, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (16, '02.05.2017', 'Muf', 'strk netriedeny', 21.3, null, 'triedenie', 18, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (17, '02.05.2017', 'Muf', 'piesok vlhky', 28.6, null, 'triedenie', 18, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (18, '02.05.2017', 'Muf', 'piesok', 23.3, null, 'susenie', 19, 1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (19, '02.05.2017', 'Muf', 'strk 0/4', 17.1, null, 'triedenie', 20, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (20, '02.05.2017', 'Muf', 'strk 4/8', 17.2, null, 'triedenie', 20, null);


insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (21, '03.05.2017', 'Puf', 'uhlie nespracovane', 45.2, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (22, '03.05.2017', 'Puf', 'uhlie netriedene', 51.8, null, 'drtenie', 31, 1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (23, '03.05.2017', 'Puf', 'uhlie hrasok', 18.3, null, 'triedenie', 32, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (24, '03.05.2017', 'Puf', 'uhlie orech', 25.5, null, 'triedenie', 32, null);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (25, '03.05.2017', 'Muf', 'strk piesok', 47.2, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (26, '03.05.2017', 'Muf', 'strk netriedeny', 22.2, null, 'triedenie', 33, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (27, '03.05.2017', 'Muf', 'piesok vlhky', 26.9, null, 'triedenie', 33, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (28, '03.05.2017', 'Muf', 'piesok', 23.4, null, 'susenie', 34, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (29, '03.05.2017', 'Muf', 'strk 0/4', 10.2, null, 'triedenie', 35, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (30, '03.05.2017', 'Muf', 'strk 4/8', 9.1, null, 'triedenie', 35, null);


insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (31, '04.05.2017', 'Puf', 'uhlie nespracovane', 47.3, 1, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (32, '04.05.2017', 'Puf', 'uhlie netriedene', 48.4, null, 'drtenie', 47, -1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (33, '04.05.2017', 'Puf', 'uhlie hrasok', 22.7, null, 'triedenie', 48, -1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (34, '04.05.2017', 'Puf', 'uhlie orech', 26.5, null, 'triedenie', 48, -1);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (35, '04.05.2017', 'Muf', 'strk piesok', 44.2, null, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (36, '04.05.2017', 'Muf', 'strk netriedeny', 24.9, null, 'triedenie', 49, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (37, '04.05.2017', 'Muf', 'piesok vlhky', 24.9, null, 'triedenie', 49, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (38, '04.05.2017', 'Muf', 'piesok', 21.8, null, 'susenie', 50, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (39, '04.05.2017', 'Muf', 'strk 0/4', 10.0, null, 'triedenie', 51, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (40, '04.05.2017', 'Muf', 'strk 4/8', 10.0, null, 'triedenie', 51, null);


insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (41, '05.05.2017', 'Puf', 'uhlie nespracovane', 48.7, 1, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (42, '05.05.2017', 'Puf', 'uhlie netriedene', 46.9, null, 'drtenie', 59, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (43, '05.05.2017', 'Puf', 'uhlie hrasok', 24.4, null, 'triedenie', 60, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (44, '05.05.2017', 'Puf', 'uhlie orech', 23.5, null, 'triedenie', 60, null);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (45, '05.05.2017', 'Muf', 'strk piesok', 49.2, 1, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (46, '05.05.2017', 'Muf', 'strk netriedeny', 24.1, null, 'triedenie', 61, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (47, '05.05.2017', 'Muf', 'piesok vlhky', 23.4, null, 'triedenie', 61, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (48, '05.05.2017', 'Muf', 'piesok', 19.7, null, 'susenie', 62, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (49, '05.05.2017', 'Muf', 'strk 0/4', 11.1, null, 'triedenie', 63, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (50, '05.05.2017', 'Muf', 'strk 4/8', 12.3, null, 'triedenie', 63, null);


insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (51, '06.05.2017', 'Puf', 'uhlie nespracovane', 48.6, -1, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (52, '06.05.2017', 'Puf', 'uhlie netriedene', 46.4, null, 'drtenie', 71, -1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (53, '06.05.2017', 'Puf', 'uhlie hrasok', 23.4, null, 'triedenie', 72, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (54, '06.05.2017', 'Puf', 'uhlie orech', 24.5, null, 'triedenie', 72, null);

insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (55, '06.05.2017', 'Muf', 'strk piesok', 48.1, -1, null, null, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (56, '06.05.2017', 'Muf', 'strk netriedeny', 11.0, null, 'triedenie', 73, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (57, '06.05.2017', 'Muf', 'piesok vlhky', 10.2, null, 'triedenie', 73, 1);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (58, '06.05.2017', 'Muf', 'piesok', 19.6, null, 'susenie', 74, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (59, '06.05.2017', 'Muf', 'strk 0/4', 10.1, null, 'triedenie', 75, null);
insert into praca (id_praca, datum, meno_lom, material, hmotnost_praca, cas_tazba, typ_spracovanie, id_vydaj, cas_spracovanie) values (60, '06.05.2017', 'Muf', 'strk 4/8', 11.3, null, 'triedenie', 75, null);

REM INSERTING into sichta
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (1, 1, null, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (1, 2, 6, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (1, 3, 5, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (1, 4, 4, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (1, 5, 3, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (2, 6, 1, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (3, 7, 2, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (4, 8, 2, null); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (5, 9, null, 1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (5, 10, 11, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (5, 11, 13, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (5, 12, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (5, 13, 10, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (6, 17, 8, -2); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (7, 16, 8, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (8, 15, 7, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (9, 14, 9, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (10, 18, 9, null); 


insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (11, 1, null, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (11, 3, 6, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (11, 2, 4, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (11, 4, 5, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (11, 5, 3, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (12, 7, 1, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (13, 6, 2, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (14, 8, 2, null); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (15, 9, null, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (15, 11, 11, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (15, 10, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (15, 12, 13, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (15, 13, 10, -1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (16, 17, 8, null);  
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (17, 15, 8, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (18, 16, 7, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (19, 14, 9, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (20, 18, 9, null); 


insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (21, 1, null, 1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (21, 4, 5, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (21, 3, 6, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (21, 2, 4, -1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (21, 5, 3, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (22, 6, 1, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (23, 8, 2, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (24, 7, 2, 1); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (25, 9, null, 2);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (25, 12, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (25, 11, 11, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (25, 10, 13, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (25, 13, 10, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (26, 16, 8, null);  
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (27, 18, 8, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (28, 14, 7, 2); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (29, 17, 9, -2); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (30, 15, 9, null); 


insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (31, 1, null, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (31, 2, 4, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (31, 3, 6, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (31, 4, 5, -3);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (31, 5, 3, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (32, 8, 1, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (33, 7, 2, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (34, 6, 2, null); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (35, 9, null, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (35, 11, 11, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (35, 12, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (35, 10, 13, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (35, 13, 10, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (36, 15, 8, null);  
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (37, 14, 8, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (38, 16, 7, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (39, 17, 9, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (40, 18, 9, null);


insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (41, 1, null, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (41, 2, 6, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (41, 3, 4, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (41, 4, 5, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (41, 5, 3, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (42, 6, 1, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (43, 8, 2, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (44, 7, 2, 1); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (45, 9, null, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (45, 10, 11, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (45, 12, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (45, 11, 13, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (45, 13, 10, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (46, 14, 8, null);  
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (47, 15, 8, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (48, 18, 7, 1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (49, 17, 9, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (50, 16, 9, null);


insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (51, 1, null, 1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (51, 4, 4, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (51, 2, 6, 1);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (51, 6, 5, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (51, 5, 3, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (52, 6, 1, -2); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (53, 8, 2, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (54, 7, 2, -1); 

insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (55, 9, null, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (55, 10, 12, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (55, 11, 13, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (55, 12, 11, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (55, 13, 10, null);
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (56, 14, 8, null);  
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (57, 15, 8, null); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (58, 17, 7, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (59, 16, 9, -1); 
insert into sichta (id_praca, id_zam, id_vybavenie, cas_sichta) values (60, 18, 9, null);


EXECUTE ZAPNI_CIZI_KLICE()


