default:
	make serve

serve:
	mkdocs serve

build:
	mkdocs build --clean

VCS_REF := $(shell git rev-parse --short HEAD)
CURRENT_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
FILE_NAME_PDF := $(shell echo o2r-architecture-${VCS_REF}.pdf)

pdf: build
	# update version in cover page, if not already done
	sed -i 's/@@VERSION@@/${VCS_REF}/g' site/index.html
	sed -i 's/@@TIMESTAMP@@/${CURRENT_DATE}/g' site/index.html
	# fix protocol relative URLs, see https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2713
	find site/ -type f -name '*.html' | xargs sed -i 's|href="//|href="https://|g'
	find site/ -type f -name '*.html' | xargs sed -i 's|src="//|src="https://|g'
	# create PDF
	wkhtmltopdf --margin-top 20mm --load-error-handling ignore --no-background $(shell pwd)/site/index.html site/o2r-architecture.pdf
