# Script that picks up to ten random movies and place them in a separate folder
## I use this script to pick movies in my external hard drive
## So as a param it requires the letter the system assigned to that external hard drive, and it to contain de routes 'Peliculas' and 'Peliculas\00 THE NEW'
## or a string with route to a folder (the new folder to place the movies will be created there, take that on count)
## It also accept a number param for max movies to feed into the folder given
param (
    [Parameter(Mandatory=$true)]
    [string]$main_dir,
    [Parameter(Mandatory=$false)]
    [string]$max_movies=10
)

echo "###########################"
echo "###########################"

$movies_number = 0
if( -not (Test-Path "${main_dir}:\THE LIST" -PathType Container) ){
    mkdir "${main_dir}:\THE LIST"

}
$movies_number = (ls "${main_dir}:\THE LIST").Length
$movies_to_add_number = $max_movies - $movies_number
if($movies_to_add_number -lt 1){    
    echo "THE LIST folder already has the amount of movies asked!!!"
    return -1
}

echo "###########################"
echo "Movies will be placed in folder 'THE LIST' in --> ${main_dir}:"
echo "Missing ${movies_to_add_number}..."

if( (ls "${main_dir}:\Peliculas").Length -lt 1){    
    echo "Peliculas folder doesn't exists or it is empty!!!"
    return -1
}

$movies_in_new = ls "${letter}:\Peliculas\00 THE NEW" -Name
# $movies_random = ls "${letter}:\THE LIST" -Name -Exclude '00 THE NEW', *.txt, *.jpg, *.srt, *.ssa

while($movies_number -lt $max_movies){
    $some_movie = $movies_in_new[(Get-Random -Maximum ($movies_in_new.Length - 1) -Minimum 0)]
    if( -not(Test-Path "${letter}:\THE LIST\$some_movie" -PathType Container) ) {
        echo "Missing ${movies_to_add_number}..."
        cp "${letter}:\Peliculas\00 THE NEW\$some_movie\" "${letter}:\THE LIST" -Recurse
        $movies_number = (ls "${letter}:\THE LIST").Length
        $movies_to_add_number = $max_movies - $movies_number        
    }
}

echo "##############################"
echo "THE LIST is ready!"
echo "##############################"
echo "##############################"

Read-Host "Press any key to finish..." 