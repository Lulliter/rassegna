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

# render a single file only
project:
  render:
    - section1.qmd
    - section2.qmd
    - "*.qmd"
    - "!ignored.qmd"
    - "!ignored-dir/"

# ====== PUBLISH
# quarto publish  # quasto stronzo mi crea la git branch "gh-pages" -->  FIX delete branch
			#git branch -d branch_to_delete # { not allowed IF I am on it}
			#git branch -D branch_to_delete # { -D if you have changes that are not merged and STILL delete}

#=========================================== (Push to Github repo) ================================================#
# check status
git status

# Add changes to git Index.
git add -A # ALL
git add -u # tracked
git add posts/*
git add docs/* # specific
git add images/*
git add _R/template.qmd


=======

# Create Std commit "message"....
msg="rebuilt on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
# ... Commit Those changes.
git commit -m "$msg"

		# git commit -m "theme 🎨"
git commit -m "added posts/2025-02-11-EDCTP/"
# git commit -m "revision + addition of DRAFT post"  -m "01_... + 00_carico_tab-contesto.qmd "

# Push source and build repos.
#cd .
git push origin master

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
