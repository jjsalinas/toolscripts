# toolscripts
Some scripts I use for various tasks related with folders duplicties, check subfolders for certain extension files, etc.

##### remove_duplicated_subfolders.ps1
PowerShell script to check and remove folders redundancy for two dirs  parent/folders and parent/subfolder/folders. 
Keeping only the duplicated folders only in parent/folders.

##### check_folders_for_subtitles.py
python script to check and print subfolders in a path which do not contain a .srt subtitle file. 
It is easy to modify to check for any other extension or substring in the filenames.

##### random_10_movies.ps1
PowerShell script that picks n random folders from a route and places them in a separate folder.<br>
This script to pick folders from a given main route subfolder 'Peliculas\00 THE NEW'. <br>
So as a param it requires the full route), and picks a random amount (by default 10) from that subfolder to a new 'THE LIST' folder in the same main route given.<br>
The main route must contain a folder 'Peliculas' and a subfolder 'Peliculas\00 THE NEW' within it.<br>
A second optional param (number) can be given for the amount of movies to feed into the folder given (default: 10).
