# Checkin which subfolders lack a subtitles .srt file.
## I use this scritp to check which movies I have without subtitles
import os

def set_dir(path):
	try:
		os.chdir(r''+path)
		print("Change Dir done.\n")
	except:
		print("Error! Couldn't change Dir to %s" % (r''+path))
		return -1

def check_no_subs_current_path():	
	no_subs = []

	for folder in [real_folder for real_folder in os.listdir() if os.path.isdir(real_folder)]:	
		files = os.listdir(folder)	
		
		#The '.srt' in the following line could be switched to check for any other extension or substring in the filenames
		if all('.srt' not in f for f in files):  
			no_subs.append(folder)
	
	return no_subs

if __name__ == "__main__":
	my_movies_path = r"G:\Peliculas\00 THE NEW"  #My external Hard drive movies folder
	set_dir(my_movies_path)
	movies_no_subs = check_no_subs_current_path()
	print("###################################")
	[print(movie) for movie in movies_no_subs]
	print("###################################")	
