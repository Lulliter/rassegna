#=========================================== (Render site Locally) ================================================#

# ====== RENDER the entire site
# quarto preview
quarto preview


# ====== RENDER the entire site
quarto render
# render a single file only

# ====== PUBLISH
# quarto publish  # quasto stronzo mi crea la git branch "gh-pages" -->  FIX delete branch
			#git branch -d branch_to_delete # { not allowed IF I am on it}
			#git branch -D branch_to_delete # { -D if you have changes that are not merged and STILL delete}

#=========================================== (Push to Github repo) ================================================#
# check status
git status

# Add changes to git Index.
git add docs/* # specific
git add -A # ALL
git add -u # tracked



 git add 02_carico_ind.qmd
 git add  03_analisi_PE.qmd
 git add  R/*
 git add  data_raw/AL_Anagr_Impegno.csv
 git add  data_raw/AL_IndProg.csv
 git add  data_raw/AL_mappa_IC_mis.csv
 git add  data_raw/AL_mappa_ind_mis.csv
 git add  data_raw/RAN_Localizz.csv

=======

# Create Std commit "message"....
msg="rebuilt on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
# ... Commit Those changes.
git commit -m "$msg"
		# git commit -m "01"
		# git commit -m "revision + addition"   -m "01_... + 00_carico_tab-contesto.qmd "

# Push source and build repos.
#cd .
git push origin master


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
