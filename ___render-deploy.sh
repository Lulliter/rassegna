# ====== Font Awesome Extension for Quarto
quarto add quarto-ext/fontawesome # https://github.com/quarto-ext/fontawesome#readme
#quarto install extension shafayetShafee/bsicons # https://icons.getbootstrap.com/#icons
quarto install extension schochastics/academicons # https://jpswalsh.github.io/academicons/
#quarto add mcanouil/quarto-iconify

#=========================================== (Render site Locally) ================================================#

# ====== RENDER the entire site
# quarto preview
quarto preview

# ====== RENDER the entire site
quarto render
# 1a find files that have been *modified* in the last 24 hours
find . -name '*.qmd' -mtime -1 -exec ls -l {} \;
# 1b render only those files (absolute path)
quarto render $(find "$PWD" -name '*.qmd' -mtime -1)
# 2.a render only files that have been *created* in the last 24 hours
quarto render $(find . -name '*.qmd' -newerct "yesterday")

#===========================  (Push to Github repo)  ================================#
# --- Check status
git status

# --- Add changes to git Index.
git add -A # ALL
git add -u # tracked
git add posts/*
git add docs/* # specific
git add images/*
git add _R/template.qmd


# --- git commit
# git commit -m "theme 🎨"
git commit -m "_slides/*AC.qmd 👇🏻"
# # --- git push
git push origin master

# --- git commit + push
git commit -m " posts/2025-02-13-spunti-ac/*" && git push origin master

# --- git add u + commit + push
git add -u && git commit -a -m "small rev" && git push origin master

#=========================================== FIle pubblico  ================================================#
# https://quarto.org/docs/publishing/quarto-pub.html
#  from ./
cd .
quarto publish quarto-pub 10_Validazione.qmd   # Published at https://lulliter.quarto.pub/validazione-dati-in-regis/
#-->>>>>>>  (dare ENTER x farlo partire)

# ====== Run Script that copies things
# PRIMA CHIUDO TUTTO WORD
Rscript R/salvo_output_li.R


#=========================================== (IGNORE a file accidentally committed in the past) ================================================#
# add .env file to .gitignore
echo "accident.txt" >> .gitignore
# tell Git NOT to track this file (it gets removed from the index, but stays local system)
git rm --cached accident.txt
