
# 2. část semestrální práce - ELK Stack

## Vydaná stavební povolení

Analýza stavebních povolení a projektů v Austinu za roky 2013 až 2023. Data obsahuji informace o povoleních, projektech, zhotovitelích a žadatelích. Chci ukázat počty a typy projektu která proběhla v městě Austin.

### Data

1. **Informace o povoleních**
"Permit Num" pro propojení základních a podrobných informací o povolení.
- **permits**
Obsahuje základní informace o stavebních povoleních – číslo povolení, číslo projektu, číslo pozemku, rok vydání a stav.
-  **details**
Detailní popis povolení – datum podáni, vypršení a dokončení, způsob vydání, jurisdikce, okres.

2. **Projekty a zhotovitelé**
"Contractor Company" pro propojení projektů a jejich zhotovitelů.
-   **projects**
    Informace o projektech – číslo projektu, zhotovitel, typ povolení, třída povolení, typ práce a hodnota projektu.
-   **contractors**
    Seznam zhotovitelů  - jméno firmy, jméno vlastníka firmy, odborné zaměření firmy a PSČ firmy.

3. **Místo a žadatelé**
"Applicant Name" pro propojení žadatelů s lokalitami na které se vztahuje povolení.
-   **locations.csv**
    Informace o místě – číslo pozemku, jméno žadatele, PSČ, hodnota stavby, velikost pozemků.
-   **owners.csv**
    Seznam žadatelů – jméno, organizace a PSČ.

"Project ID" – propojuje projekty s povoleními.

"TCAD ID" - propojuje míst s povoleními.

Spolu mi kolekce dávají dobrý pohled na stavební aktivitu ve městě. Múžu tak sledovat kdy, kde, žadatele a zhotovitele projektů.

#### Zdroje dat

Issued Construction Permits
https://data.austintexas.gov/Building-and-Development/Issued-Construction-Permits/3syk-w9eu/about_data

#### Formát dat

**permits**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
Permit Num  | Text | Číslo povolení | Klíč
Project ID | Text | Číslo projektu | Klíč na projects
TCAD ID  | Text  | Číslo pozemku | Klíč na locations
Year Issued| Date | Rok vydání povolení | Formát YYYY/MM/DD
Status Current| Text | Aktuální stav povolení | Omezený výběr (např. „Issued“, „Completed“)

**details**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
Permit Num  | Text | Číslo povolení | Klíč
Issued Date | Date | Datum vydání povolení | Formát YYYY/MM/DD
Expires Date | Date | Datum expirace povolení | Formát YYYY/MM/DD
Completed Date | Date | Datum dokončení projektu | Formát YYYY/MM/DD
Issuance Method| Text | Způsob vydání povolení | "Permit Center", "Online"
Jurisdiction|Text| Jurisdikce povolení majetku | 
Council District|Integer| Číslo obvodu | 1–10

**projects**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
Project ID  | Text | Číslo projektu | Klíč
Contractor Company| Text | Firma zhotovitele | 
Permit Type | Text | Typ povolení | "Mechanical Permit", "Electrical Permit", ...
Permit Class | Text | Klasifikace povolení | "Residential", "Commercial“
Work Class | Text | Typ práce | "New", "Remodel", ...
Total Job Valuation | Integer | Hodnota projektu | 

**contractors**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
Contractor Company | Text | Název firmy | Klíč
Contractor Name | Text | Jméno zhotovitele | 
Contractor Trade |Text|Odborné zaměření|"General Contractor", "Electrical Contractor", ...
Contractor Zip | Text | PSČ zhotovitele | 

**locations**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
TCAD ID  | Text | Číslo pozemku | Klíč
Applicant Name | Text | Jméno žadatele | 
Original Zip | Text | PSČ pozemku | 
Building Valuation | Integer | Hodnota stavby | Kladné číslo
Total Lot SQFT | Integer | Celková plocha pozemku | Kladné číslo

**owners**
Sloupec  | Formát | Popis | Integritní omezení
--|--|--|--
Applicant Name | Text | Jméno žadatele | Klíč
Applicant Organization | Text | Organizace žadatele | 
Applicant Zip | Text | PSČ žadatele | 

#### Provedené úpravy dat

Původní dataset byl jeden souboru s 2.28 miliony rádky a 68 sloupci. Data setbyl rozdělen na 6 menších a redukován na roky 2013 - 2023. V data se nachází jupyter notebook s provedenými úpravami.  

### Konfigurace

**docker-compose.yml**
Definuje kontejnerovou infrastrukturu pro ELK stack.

Obsahuje:
- elasticsearch: indexovací engine
- logstash: připojuje Logstash konfiguraci a vstupní CSV data
- kibana: vizualizační nástroj a přístup k webovému rozhraní
- volumes: ukládání dat
- networks: kontejnery jsou připojeny na společnou síť pro vzájemnou komunikaci

**elasticsearch.yml**
Definuje nastavení pro Elasticsearch uzel, jméno clusteru, IP adresu, typ uzlu.

**kibana.yml**
Konfigurace pro Kibanu, nastavuje připojení na Elasticsearch a základní parametry rozhraní.

**logstash.yml**
Nastavení Logstash, připojení k Elasticsearch.

**pipelines.yml**
Určuje, které pipelines Logstash načte a spustí, přičemž každá pipeline odkazuje na svůj konfigurační soubor (.conf).

**logstash.conf**
Obsahuje logiku zpracování dat (vstupy, filtry a výstupy) pro každou pipeline a odesíla je do Elasticsearch.

**logstash.json**
Mappings pro Elasticsearch index, definuje datové typy polí.

Funkčnost celého systému:
1. docker-compose spustí všechny služby.
2. Elasticsearch vytvoří indexy na základě dat z Logstash.
3. Logstash přečte CSV soubory, transformuje je a odešle do Elasticsearch.
4. Kibana umožní vizualizaci dat.

Výsledkem je ELK stack pro analýzu a vizualizaci dat.

### Dotazy

Filtrování:

GET permits/_search
{
  "query": { "match": { "Status Current": "VOID" }}
}

Třídění:

GET projects/_search
{
  "sort": {"Total Job Valuation": {"order": "desc"}}
}

Wildcard hledání:

GET applicants/_search
{
  "query": { "wildcard": { "Applicant Full Name.keyword": "John\*" }}
}

### Vizualizace

Vizualizace  | Typ 
--|--
Applicant Zip | Metric
Contractors Trade Companies | Pie
Contractors Trades | Pie
Contractors Zip | Metric
Details Completed Permits Per Year | Line
Locations Applicants SQFT | Horizontal Bar
Locations Values | Vertical Bar
Locations Zip | Metric
Permits Non Finished Per Year | Vertical Bar
Permits Per Year | Line
Projects Class, Type and Work | Heat Map
Projects Values | Metric

## Závěr

Podíval jsem se na stavební povoleni z Austinu v letech 2013 - 2023.
vypadá to ,že město má velkou poptávku po bydlení a nachází se tady několik velkých projektu a hodně malých.  

## Zdroje

Issued Construction Permits
https://data.austintexas.gov/Building-and-Development/Issued-Construction-Permits/3syk-w9eu/about_data