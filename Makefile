
.PHONY: clean
.PHONY: init

clean:
	rm -rf *.csv

Report.pdf: Report.Rmd
	R -e "rmarkdown::render('Report.Rmd', output_format='pdf_document')"