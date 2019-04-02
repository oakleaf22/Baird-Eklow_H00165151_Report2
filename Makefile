
# Make sure that main.tex is the first item of the
# following list.  Otherwise main.pdf target won't work.

SECTION_DIR = sections
FIGURE_DIR = figures
SRC := main.tex \
			 $(SECTION_DIR)/00-intro.tex\
			 $(SECTION_DIR)/01-en_storage_capacity.tex\
			 $(SECTION_DIR)/02-PHS_only.tex\
			 $(SECTION_DIR)/03-EnergyPLAN_scenario.tex\
			 $(SECTION_DIR)/04-critical_analysis.tex\
			 $(SECTION_DIR)/appendices.tex\
       references.bib

PICS = $(FIGURE_DIR)/Cruachan_Foyers_characteristics.png \
			 $(FIGURE_DIR)/HWlogo2016.jpg \
			 $(FIGURE_DIR)/Hydro_distribution.eps \
			 $(FIGURE_DIR)/installed-capacity-by-technology-q3-2018.jpg \
			 $(FIGURE_DIR)/map_potential_PHS.png \
			 $(FIGURE_DIR)/PHS_potential.png \
			 $(FIGURE_DIR)/storage_options.eps

paper.pdf: $(SRC) $(PICS)
	if which latexmk > /dev/null 2>&1 ;\
        then latexmk -pdf -f -pdflatex='pdflatex -halt-on-error' $< ;\
        else pdflatex $< && \
        bibtex $(patsubst %.tex,%,$<) && \
        pdflatex $< ;\
        pdflatex $< ;\
        fi

clean:
	$(RM) *.aux *.log *.out *.vrb paper.pdf \
              *.bbl *.blg *.fdb_latexmk *.toc *.fls *.cut
