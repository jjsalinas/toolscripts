#Check movie folders in "00 THE NEW" folder which already exist in parent dir "Peliculas"
## I use this script to check duplicities in movies in my external hard drive
param (
    [Parameter(Mandatory=$true)]
    [string]$letter
)
$letter = $letter.ToUpper()
if ($letter.Length -eq 0 -or $letter.Length > 1){
    echo "Wrong hard drive letter given!!"
    return -1
}

if( (ls "${letter}:\Peliculas").Length -lt 1){    
    echo "Peliculas folder doesn't exists or it is empty!!!"
    return -1
}


$movies_in_new = ls 'G:\Peliculas\00 THE NEW' -Name
$movies_all = ls 'G:\Peliculas' -Name -Exclude '00 THE NEW', *.txt, *.jpg, *.srt, *.ssa

foreach($movie in $movies_in_new){
    if($movies_all.Contains($movie)){        
        echo "Deleting $movie from '00 THE NEW'..."
        Write-Host "Sure you want to delet it? (y/n): " -ForegroundColor Red -NoNewline
        $confirmn = Read-Host
        $confirmn = $confirmn.ToLower()
        if ($confirmn -eq "y" -or $confirmn -eq "yes"){
            rm -Recurse -Confirm -Verbose "${letter}:\Peliculas\00 THE NEW\$movie\"
            echo "done!"
        }
    }
}
echo "##############################"
echo "All duplicates removed!"
echo "##############################"
echo "##############################"

Read-Host "Press any key to finish..." 