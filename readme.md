# [MDT] Editplus Dark Theme
Inspired by the theme Monokai this is an attempt to replicate the colors of that theme to editplus. 

```diff
- This theme is applicable for editplus versions 4 and higher 
```

## Screenshots

| **HTML**                                                    | 
|-------------------------------------------------------------|
| ![html](/Documentation/html.png?raw=true "Screenshot HTML") |
<br />
| **PL/SQL**                                                      |  |
|----|-----|
|mdt theme|idt theme|
| ![plsql1](/Documentation/plsql.png?raw=true "Screenshot PL/SQL") | ![plsql2](/Documentation/plsql2.png?raw=true "Screenshot PL/SQL") |
<br />
| **Java**                                                    | 
|----|
| ![java](/Documentation/java.png?raw=true "Screenshot JAVA") |
<br />
| **Python**                                                      |  |
|----|----|
|mdt theme|idt theme|
| ![python1](/Documentation/python.png?raw=true "Screenshot Python") |![python2](/Documentation/python2.png?raw=true "Screenshot Python") |


## Instructions:

### Step 1: Download and Copy files
Download the url from github and copy the files to editplus's [respective syntax file/ini files] folder

### Step 2: Import the theme
- Open Editplus 
- Menu -> Tools -> Preferences
- General -> Colors -> Import -> **mdt.ini** -> Apply

![colors](/Documentation/colors.png?raw=true)



### Step 3: Select syntax for plsql or python
- Open editplus. Goto Menu -> Tools -> Preferences
- General -> Settings & syntax -> 
	-	Add -> SQL
	-	File extensions -> sql
	-	Syntax file -> open -> **mdtOracle.stx** or **mdtPython.stx** -> Apply

![syntax](/Documentation/syntax.png?raw=true)	