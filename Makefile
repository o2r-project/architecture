default:
	make serve

serve:
	mkdocs serve

build:
	mkdocs build --clean

VCS_REF := $(shell git rev-parse --short HEAD)
CURRENT_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
FILE_NAME_PDF := $(shell echo o2r-architecture-${VCS_REF}.pdf)

pdf:
	# update version in cover page, if not already done
	sed -i 's/@@VERSION@@/${VCS_REF}/g' site/index.html
	sed -i 's/@@TIMESTAMP@@/${CURRENT_DATE}/g' site/index.html
	# create PDF
	wkhtmltopdf --margin-top 20mm --no-background file://$(shell pwd)/site/index.html site/o2r-architecture.pdf
