aufg_filename() {
    printf "ueb$ueb/aufg%02d.tex" "$1"
}

ueb=$(printf "%02d" "$1")
aufgno=$2

template='\\documentclass{exercisesheet}

\\title{Implementation of Databeses, Assignment %s}
\\author{
    Jan Uthoff
    \\and
    Yasaman Rahimi
    \\and
    Nowraj Farhan
}

\\renewcommand{\\Exercise}{Aufgabe}

\\begin{document}
\maketitle

\\pointtable

%s

\\end{document}
' 

mkdir ueb$ueb
inputtxt=""
for i in `seq 1 $aufgno`; do
    inputtxt+=$(printf '\\input{%s}\n' "$(aufg_filename $i)")
    printf '\\begin{exercise}{0}\n\n\\end{exercise}\n' >> "$(aufg_filename $i)"
#    git add "$(aufg_filename $i)"
done

printf "$template" "$ueb" "$inputtxt" > ueb$ueb.tex
#git add ueb$ueb.tex

#git commit -m "Skelett Uebung $ueb"

