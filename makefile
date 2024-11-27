

# How to use variables
# https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html

TEMPLATE = "./templates/essential-guide-to-sqlite-template.tex"
TOP_LEVEL_DIVISION = "chapter"
TITLEPAGE_COLOR = "EEEEEE"
TITLEPAGE_RULE_HEIGHT = 8
TITLEPAGE_BACKGROUND = "./templates/figures/titlepage-background-template.pdf"
PAGE_BACKGROUND = "./templates/figures/page-background-template.pdf"
PAGE_BACKGROUND_OPACITY = 0.8
FOOTER_RIGHT = "Page \thepage"
INSTITUTE = "Ibon Martínez-Arranz"
AUTHOR = "Ibon Martínez-Arranz"
TITLE = "Essential Guide to SQLite"
INTERMEDIATE_OUTPUT = "book"
INFO = "book.info"

all: generatebook

generatebook:
	pandoc pdf/000_title.md \
		pdf/01_introduction/011_overview_of_sqlite.md \
		pdf/01_introduction/012_key_features.md \
		pdf/01_introduction/013_use_cases.md \
		pdf/02_installing/021_installation_on_linux.md \
		pdf/02_installing/022_first_steps.md \
		pdf/03_command/031_launching_sqlite_console.md \
		pdf/03_command/032_basic_commands.md \
		pdf/04_northwind/041_overview_of_the_northwind_database.md \
		pdf/04_northwind/042_schema_and_relationships.md \
		pdf/05_basic/051_creating_tables.md \
		pdf/05_basic/052_inserting_data.md \
		pdf/05_basic/053_selecting_data.md \
		pdf/05_basic/054_examples.md \
		pdf/06_advanced/061_updating_data.md \
		pdf/06_advanced/062_deleting_data.md \
		pdf/06_advanced/063_using_where_clause.md \
		pdf/06_advanced/064_sorting_results_with_order_by.md \
		pdf/06_advanced/065_examples.md \
		pdf/07_complex/071_aggregate_functions.md \
		pdf/07_complex/072_grouping_results_with_group_by.md \
		pdf/07_complex/073_filtering_groups_with_having.md \
		pdf/07_complex/074_examples.md \
		pdf/08_joins/081_understanding_joins.md \
		pdf/08_joins/082_inner_join.md \
		pdf/08_joins/083_left_join.md \
		pdf/08_joins/084_right_join.md \
		pdf/08_joins/085_full_join.md \
		pdf/08_joins/086_examples.md \
		pdf/09_python/091_setting_up_sqlite_in_python.md \
		pdf/09_python/092_performing_basic_operations.md \
		pdf/09_python/093_handling_transactions.md \
		pdf/09_python/094_error_handling.md \
		pdf/09_python/095_examples.md \
		pdf/10_jupyter/101_installing_libraries.md \
		pdf/10_jupyter/102_running_sqlite_queries_in_jupyter.md \
		pdf/10_jupyter/103_visualizing_data_with_sqlite_and_pandas.md \
		pdf/11_resources/111_official_documentation.md \
		pdf/11_resources/112_community_resources.md \
		pdf/11_resources/113_books_and_tutorials.md \
		--output $(INTERMEDIATE_OUTPUT)".pdf" \
		--from markdown \
		--template $(TEMPLATE) \
		--toc \
		--variable book=True \
		--top-level-division $(TOP_LEVEL_DIVISION) \
		--listings \
		--variable titlepage=True \
		--variable titlepage-color=$(TITLEPAGE_COLOR) \
		--variable titlepage-rule-height=$(TITLEPAGE_RULE_HEIGHT) \
		--variable titlepage-background=$(TITLEPAGE_BACKGROUND) \
		--variable page-background=$(PAGE_BACKGROUND) \
		--variable page-background-opacity=$(PAGE_BACKGROUND_OPACITY) \
		--variable footer-right=$(FOOTER_RIGHT) \
		--variable linkcolor=primaryowlorange \
		--variable urlcolor=primaryowlorange \
		--variable institute=$(INSTITUTE) \
		--filter pandoc-latex-environment \
		--metadata=title:$(TITLE) \
		--metadata=author:$(AUTHOR)

	pdftk templates/figures/essential-guide-to-sqlite-cover.pdf \
	      templates/figures/page-white-template.pdf \
	      templates/figures/page-authors-template.pdf \
	      templates/figures/page-white-template.pdf \
	      $(INTERMEDIATE_OUTPUT)".pdf" cat output $(INTERMEDIATE_OUTPUT)"2.pdf"
	pdftk $(INTERMEDIATE_OUTPUT)"2.pdf" update_info_utf8 $(INFO) output $(TITLE)".pdf"
	rm $(INTERMEDIATE_OUTPUT)".pdf" $(INTERMEDIATE_OUTPUT)"2.pdf"

# REFERENCES
# https://github.com/Wandmalfarbe/pandoc-latex-template
# https://pypi.org/project/pandoc-latex-environment/
# https://pandoc-latex-tip.readthedocs.io/en/latest/index.html
# https://pandoc-latex-environment.readthedocs.io/en/latest/
