# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html). One notable difference is that for this project, semantic versioning is used in reference to user facing experience.

## [Unreleased]

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [v1.21.0] - 2018-08-16

### Removed
- Some locale files from upstream Spotlight removed #1228
### Fixed
- Long versioned pages cannot be saved now fixed #1225
### Security
- Updates dependencies #1232 

## [v1.20.0] - 2018-08-09

### Added
- Adds Chinese Spotlight locale files #1229
### Fixed
- Fix post-Shibboleth sign out redirect path #1224

## [v1.19.1] - 2018-07-31

### Fixed
 - Updates "Create new exhibit" link to get previous behavior #1214
 - Fixes an issue where reindexing jobs were not properly working #1221
### Security
 - Updates dependencies #1215, #1219

## [1.19.0] - 2018-07-10

### Added
### Changed
- Migrate from webauth to Shibboleth #1205
### Deprecated
### Removed
- Remove outdated information from README #1204
### Fixed
- Skip `selenium-webdriver` v3.13.0 due to unresolved upstream bug that causes Travis builds to fail #1207
- Only add `@stanford.edu` to user names when necessary #1209
### Security

## [1.18.3] - 2018-06-19

### Added
- Make exhibit tags searchable #1198
### Changed
- Upgrade to Rails 5.2 #1186
### Deprecated
### Removed
### Fixed
- Fix a bug where external IIIF records did not render a viewer
### Security
- Address sprockets security vulnerability and update other dependencies #1201

## [1.18.2] - 2018-05-31

### Added
### Changed
### Deprecated
### Removed
### Fixed
- Fixes issue where you can page browse category records into negative numbers (via Spotlight)
- Fixes issue where really large sir-trevor widget pages cannot be saved (via Spotlight)
### Security

## [1.18.1] - 2018-05-15

### Added
### Changed
### Deprecated
### Removed
### Fixed
- Fixes issue preventing adding/editing titles/dates for uploaded documents #1177
- Upgrade to mirador_rails v0.8.0 to deal with translation route parameter [mirador_rails#9](https://github.com/sul-dlss/mirador_rails/pull/9)
### Security

## [1.18.0] - 2018-05-04

### Added
- Added ability to translate user provided labels/content in exhibits (by updating to Spotlight 2.0.0) #1164
### Changed
- Put a border around thumbnail images that are linked #1161
- Updated to Spotlight 2.0.0 [release notes](https://github.com/projectblacklight/spotlight/releases/tag/v2.0.0)
### Deprecated
### Removed
### Fixed
- Fixes thumbnail indexing for virtual objects #1166
- Fixes issue with slideshow thumbnails not taking up entire available area #1165
### Security

## [1.17.5] - 2018-04-24

### Added
- Added ability to load javascript asynchronously to improve initial paint time. #1153
### Changed
- Updated styling of exhibit Analytics UI. #1155
### Deprecated
### Removed
### Fixed
- Fixes memory leak issue by updating to Spotlight 1.5.1. #1154  (temporary fix already in production)
- Fixes issue causing results to not be returned for some fielded searches. #1156
### Security

## [1.17.4] - 2018-04-18

### Added
### Changed
 - Updates Spotlight to v1.15.0 #1149
### Deprecated
### Removed
### Fixed
 - Fixes an issue in gallery metadata display #1802
 - Fixes sidekiq running on prod web servers #1144
### Security


## [1.17.3] - 2018-04-04

### Fixed
 - Use the correct parameter that sul-embed expects for canvas id #1145


## [1.17.2] - 2018-04-04

### Security
 - Update dependencies (no user facing changes) #1131

## [1.17.1] - 2018-04-04

### Changed
 - Solr 7 compatibility changes (no user facing changes) #1126
### Fixed
 - Fixes an issue where embed widgets in pages does not load when some files are not shelved #1139
 - More consistent stemming behavior for Portuguese and other languages #1129
 - Solr schema consistency with prod (no user facing changes) #1134
### Security
 - Update generic dependencies (no user facing changes) #1124

## [1.17.0] - 2018-03-12

### Added
### Changed
- Deduplicate results for fulltext snippets #1120
- Upgrade to Sidekiq Pro for background jobs #1076
- Update Solr configuration to use the Unified Highlighter #1106
- Update testing and deployment dependecies #1119, #1117
### Deprecated
### Removed
### Fixed
- Prevent list view titles from overlapping image thumbnails #1116
- Use `ERB::Util.url_encode` for escaping file URLs #1121, #1122
### Security

## [1.16.2] - 2018-03-07

### Added
### Changed
- Updates Exhibits to Spotlight v1.4.1 #1111
- Update "Embed + Text" intro text with examples of resources #1111
- Restricting ALTO OCR indexing to files with the role attribute "transcription". #1104
### Deprecated
### Removed
### Fixed
- Fixes bug #1103: browse categories displaying the wrong item count #1111
- Limit max-width of iframe in "Embed + Text" widget #1111
### Security

## [1.16.1] - 2018-02-23

### Added
### Changed
- No longer rendering the protocol (e.g. http/https) in the PURL link text. #1094
- Background color for parker thumbnails to match body background. #1098
### Deprecated
### Removed
### Fixed
- Handling multiple date/time formats from the public object xml's published attribute. #1105
- Prevent stretched images in Item Row widget. #1099
### Security

## [1.16.0] - 2018-02-13

### Added
- Added support for indexing, searching, and displaying snippets of Portuguese and Indonesian full text content (in addition to the existing English support). #1060
- Added a link to the PURL beneath the SUL Embed viewer (hidden in the Parker theme) #1074
### Changed
- Update styling and default label for fulltext snippets #1075
- Updated to Spotlight version 1.4.0 ([release notes](https://github.com/projectblacklight/spotlight/releases/tag/v1.4.0))
- Updated the SUL Embed viewer to take the full width of the record view page #1074
### Deprecated
### Removed
### Fixed
### Security

## [1.15.0] - 2018-01-30

### Added
- Added support for an exhibit-specific feature flag to point to the PURL UAT environment for Embeds. #1055
- Added basic (english) indexing support for full text OCR in ALTO (2 & 3) XML. #1043
- Added a border around document thumbnails in normal search results view (list). #1064
### Changed
- Adds i18n keys bibliography resources and metadata display modal  #983
### Deprecated
### Removed
- Removes i18n keys for deprecated bibliography service #983
### Fixed
- Fixed bug that caused feature pages using the search results widget to throw an error #1073
### Security

## [1.14.1] - 2018-01-17

### Added
### Changed
### Deprecated
### Removed
- Removed support for using the exhibit specific manifest URL configuration to configure the SUL Embed environment to be used
### Fixed
### Security

## [1.14.0] - 2018-01-16

### Added
- Added support for highlighting matching query terms from full-text content in search results #1030
- Only allow the full-text highlight field to be rendered in List view (and disabled by default) #1045
- Adds Stanford-specific helptext to the add admin/curator form #1040
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [1.13.0] - 2017-12-19

### Added
- Updates Exhibits to Spotlight v1.2.0 #1012
- Added ability to view the index status individual items in an exhibit by autocompleting for druid (only applies to exhibits with > 10 item druids) #1013
### Changed
- Masonry, Gallery, and Slideshow views only display title by default #1011
- Changes text of confirmation email for new curators / admins #976
- Changes configuration of Mirador viewers to have the sidepanel close by default. Layers and Search tab have been disabled. #296
### Deprecated
### Removed
### Fixed
- Fixed timeout issue on Add Items page for exhibits with large number of items #1013
- Fixes a bug where newly created admins and curators were not receiving invitations #1012
### Security

## [1.12.1] - 2017-12-13

### Added
- Added date range slider above date range distribution chart #1014
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [1.12.0] - 2017-12-12

### Added
- Adds the ability for when embedding SDR items in a page, the selected page will persist for the embedded image view #970
- Adds a date range facet #994
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [1.11.0] - 2017-12-07

### Added
- Adds an "Expand all" link to nested related items in the full metadata display #960
- Adds a Slack notification when an Exhibit's publish stage changes #975
- Adds "Place Created" field and facet #989
- Adds "Repository" field and facet #990
### Changed
- BibTeX upload form is now only shown for Exhibits in which it is explicitly enabled through a feature flag #946
- Changes text of "View all metadata" link to "More details" #969
### Deprecated
### Removed
### Fixed
- Fixes a bug in the metadata modal where nested related items toggle was unavailable #965
- Improves the performance when clicking the "More details" link when a document has many related items #974
### Security

## [1.10.0] - 2017-11-27

### Added
- Users can now quickly navigate pages in Mirador using a drop down selection #937
- Users can now see nested related item metadata in the full metadata display as well as toggle the nested metadata #938
- Page detail pages open mirador to show annotations on the correct page #898
- Access conditions are now available under metadata details page #920
### Changed
- Metadata details page updates its style to look more like Purl and SearchWorks #918
- Display labels are now indexed, subject genres are indexed into genre, place is indexed, physical location is indexed #917
- Search fields that are Parker specific don't show up in other exhibits (enabled by a feature flag) #927
- Date qualifiers and ranges are now indexed for display (also imprint) #906
- Removed "Metadata: " from metadata modal title #943
- The item embed widget no longer displays a custom viewer, but displays the default one #930
### Removed
- Manuscript title was removed for more general "title" (manuscript title was redundant) #919
- Table of contents will not be displayed in the Parker exhibit metadata modal #944
- Remove extra Title field from metadata modal #931
### Fixed
- Page details related object wasn't displaying correctly, now fixed #909

## [1.9.0] - 2017-11-17

### Added
- Updates Exhibits to Rails 5.1 #873
- Updates Exhibits to Spotlight v1.1.0 #900
- Scrolling in metadata modal body #902
- Add the ability to download Mods metadata #896
- Adds metadata show modal with basic mods rendering #890
- Adds manuscript title link to Page details #848
### Changed
- Single entry in TOC is displayed without show/hide #907
- Refactoring dor traject code #880
- TOC list should be ul/li not line separated #895
- Text title field moved to TOC #891
- Adds frozen_string_literal to all Ruby files #882
### Fixed
- Fixes a bug in TOC show/hide #892
- Fixes a bug where errors stored were sometimes too big #881
- Fixes a bug in indexing collections #909
- Fixes a bug where modal-body height wasn't being calculated #915

## [1.8.0] - 2017-11-13
### Added
- Collapsible table of contents to manuscript metadata section #821,
- A default thumbnail to annotation records #839
- The ability to add a manifest to Mirador instances with a pasted URL #840
- A dedicated sort field for page detail titles #850
- A feature flag for resource type indexing field #852
- The Solr document id of canvases to indexing #851
- "Page_details" rendering added (making annotations visible) #857
- A reference to the parent manifest on canvas objects #862
- A button to toggle/collapse large bibliography sections #866

### Changed
- Marketing and Exhibit documentation links in the site sidebar have been combined #802
- Manuscript lables/titles now use merged "page detail title" #844, #860
- Canvas format has been changed to "page details" from "annotation," etc. #845
- FactoryGirl out for FactoryBot #852
- CSS made generic for all record metadata fields #857
- DOR objects now use traject for indexing #847

### Deprecated
- gdor-indexer #847

### Removed
- Dependency on GDOR-indexer, configuration, etc. #847

### Fixed
- Leaflet-rails and dependencies updated #852
- A bug with the number of arguments in the "resource type" index field #867
- Rubocop has been updated to a more recent version #868
- BlacklightHeatmaps updated to fix map marker zoom bug #859
- Unwrap single note `ul`/`li`s #871
- Bulk updates for many dependecies #868
- Assign unique ids to table of contents sections #863
- Expose document id as passed option instead of instance variable for search results display fix #876

## [1.7.0] - 2017-11-06
## Added
- Support for indexing related annotations identified in the object's IIIF manifest #806
  - _Note: This is being released behind a feature flag for parker-2 only_

## Fixed
- No longer indexing empty annotation strings #813
- Responsive behavior of search results display at small screen resolutions #820
- Updated Spotlight which addressed two user facing issues: #822
  - Prevent throwing an error on the edit screen of a page when an embedded browse category changes its title. projectblacklight/spotlight#1856
  - Truncate exhibit descriptions to deal with responsive issue projectblacklight/spotlight#1853

Full Exhibits Changes: https://github.com/sul-dlss/exhibits/compare/v1.6.0...v1.7.0
Full Spotlight Changes: https://github.com/projectblacklight/spotlight/compare/e9f3771b063ae7f9991c6e6ecf89a634bdd2011a...0929af4e831604ca4aa4847d1efd6782f2ebc34c

## [1.6.0] - 2017-10-30

### Added
- On citation pages, show the cited resources they refereence #692
- Adds the ability to index "Pages/Canvases" as first class objects (non-user facing) #800

### Removed
- "Annotation" model in favor of canvas/pages (non-user facing) #800

## [1.5.0] - 2017-10-25

### Added
- Adds an Annotation data model #765
- Spotlight updates - search fields are configurable now to be turned "off" by default #796
- Adds search_field for TOC, incipit, manuscript title, manuscript number, text_title #792
### Changed
- Updates mod indexing - incipit #782, displayLabel/title #785, collection format #793
### Fixed
- Enforce IIIF manifest availability by using contentMetadata type, fixes indexing performance issue #794
- Spotlight updates - unusable Sir Trevor widgets are not shown to users #796

## [1.4.0] - 2017-10-19
### Added
- Adds Manuscript Number and tableOfContents to MODS indexing #721, #723

### Changed
- Style general notes as an unordered list #742

### Fixed
- Only display the Bibliography section when the async process returns documents #738
- Only add IIIF logos to SDR objects with manifests #745
- Add missing migration from Spotlight related to tagging #753
- Permit up to 1000 hits for JSON API (results in full listing of bibliographies) #700
- Remove media-query to help results thumbnail alignment #735
- Configure sidekiq processes to account for concurrency and nCPUs in stage #711

## [1.3.0] - 2017-10-12
### Added
- Adds placeholder thumbnails for bibliography documents #651, #698
- Adds a IIIF Drag and Drop badge to Mirador viewer pages #680, #693, #707
- Adds IIIF drag-n-drop icon to search results #681, #732
- Adds support for multiple notes per bibliography resource #605, #685, #715
- Adds View on Zotero site to bibliography show page #539, #670

### Changed
- Updates BibTeX file upload UI #695, #699
- Refactor BibTeX field extraction into Traject Macro #669, #671, #686
- Refactor BibTeX extraction macros #671, #706
- Refactor to use BibTeX prefix for Traject pipeline throughout #712
- Drop the `.json` from our manifest urls (for SDR objects) #710
- Add rails config to `.gitignore` (not added on install) #719
- Updates mirador to v2.6.0 fixes #599, #730
- Configure sidekiq processes on stage to better match prod #711
- Remove the mirador configuration that prevents the Add Slot control #667, #733

### Fixed
- View full reference goes to Reference show page #702, #705
- Updates Spotlight to enable delete email fixes #704, #708
- Does not store a search result to reduce pollution of search session #701, #717

## [1.2.0] - 2017-10-06
### Added
- Adds a Bibliography for a show page with related BibTeX records #660
- Adds exhibit based feature flag pattern for releasing certain features to specific exhibits #674
- Adds the ability for an exhibit editor to add a custom manifest pattern for a given exhibit #668

### Changed
- Adds additional Zotero fields to BibTeX indexing  #664, #675, #682
- Replaces SUL brand logos with SVGs #673
- Generalizes how BibTeX keys are converted to SolrDocument id's #666

### Fixed
- Fixes an issue where home page tags were showing now exhibits #690
- When reindexing BibTeX data, a total count is now shown #655

## [1.1.0] - 2017-10-04

### Added
- Adds basic ~~CSLJSON and~~ bibtex converter using Traject #596 (partially removed in #601)
- Indexes bibliography documents #601
- Enable sidebar in embedded Mirador viewer #598
- Configure a Parker theme (behind a feature flag) #604
- Use citeproc to rendered a sorted bibliography from BibTeX #602
- Enhances bibliography indexing to support relating citation to an exhibit #608
- Add resource index spotlight metadata + benchmarking to BibTeX indexing #617
- Add format type to bib records "Reference" #618
- Add the allowfullscreen attribute to the mirador iframe. #620
- Add BibTeX and formatted bibliography to ingest pipeline #621
- Add flash messages for bibliography resource creation #624
- Add title_full_display for show page #622
- Adds a changelog #627
- Adds accessors and convenience methods for related documents to SolrDocument #653
- Adds Chrome Headless for JavaScript testing #665

### Changed
- Indexes an author for a BibTeX file #628
- Enhances BibTeX indexing to add parent druids #626
- Enhances BibTeX indexing to skip records without a title #637
- Enhances BibTeX indexing to skip records without keywords #644
- Allows a user to upload a BibTeX file to index #639
- Improve BibTeX indexing when BibTeX.parse lexer throws warnings #646
- Improve BibTeX indexing by caching the title #645
- Updates BibTeX fixtures to use minimum set of Zotero fields #656
- Improve BibTeX indexing to add volume and pages to index #633
- Add BibTeX fields for indexing for sorting #657

### Removed
- Removed old demo environment #487
- Removed legacy BibliographyService (never shown to a user in production) #642

### Fixed
- Use simplecov string not glob to shut up warnings #597
- Fixes a misspelling in our feature flag #615
- Skip legacy bib service specs (aims to fix flappy Travis) #619
- Moves Exhibits::Bibliography to Bibliography to fix a production indexing error #630
- Updates Spotlight to fix JavaScript errors and production theme thumbs #643
- Fixes Mirador vertical styling #610
- Only show mirador when a manifest is available #658

### Security
- Updates Blacklight, Spotlight, and Rails #606


## [1.0.0] - 2017-09-26

We have been in production for a while, but never tagged a release. This starts the first of many releases for Stanford's Exhibits.

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
