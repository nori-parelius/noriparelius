;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-gather-items (parent-section-name index)
  "Gather all items with a given PARENT-SECTION-NAME into an INDEX alist of the same form as nori-site-entry-index."
  ;; Gather items
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (alist-get 'sections-slugs metadata)))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and date (equal parent-section-name parent))))
		 items))
    ;; Sort by date descending
    (sort items (lambda (a b) (string> (alist-get 'date (cdr a)) (alist-get 'date (cdr b)))))
    ;; Only return slugs in the right order
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    
   ; items))
					;(nori-site-gather-items "2026" nori-site-entry-index)

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-gather-items (parent-section-name index)
  "Gather all items with a given PARENT-SECTION-NAME into an INDEX alist of the same form as nori-site-entry-index."
  ;; Gather items
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (alist-get 'sections-slugs metadata)))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and date (equal parent-section-name parent))))
		 items))
    ;; Sort by date descending
    (sort items (lambda (a b) (string> (alist-get 'date (cdr a)) (alist-get 'date (cdr b)))))
    ;; Only return slugs in the right order
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    
   ; items))
					;(nori-site-gather-items "2026" nori-site-entry-index)

(defun nori-site-paginate (index)
  (let ((new-index nil))
    (cl-loop for entry in index
	     for slug = (car entry)
	     for meta-orig = (cdr entry)
	     for file-name = (alist-get 'file-name meta-orig)
	     ;; Check if we need to paginate
	     ;; index files that have paginations set
	     for page-size-entry = (alist-get 'page-size meta-orig)
	     when (and (string= file-name "_index") page-size-entry)
	     do
	     (let* ((page-size (string-to-number page-size-entry))
		    (sections-slugs (alist-get 'sections-slugs meta-orig))
		    (file-path-dir (alist-get 'file-path-dir meta-orig))
		    (file-path-file (alist-get 'file-path-file meta-orig))
		    (list-items (alist-get 'list-items meta-orig))
		    (total-pages (ceiling (/ (length list-items) page-size)))
		    (pages nil))
	       ;; Create each paginated page in a loop
	       (dotimes (i total-pages) ;for each page from 0 to total-pages
		 (let* ((meta (copy-alist meta-orig))
			(page-number (1+ i))
			(start-index (* i page-size))
			(end-index (min (+ start-index page-size) (length list-items))))
		   (unless (= 0 i)
		     (setf (alist-get 'sections-slugs meta)
			   (push (int-to-string page-number) sections-slugs))
		     (setf (alist-get 'slug meta)
			   (concat slug (format "page/%d/" (1+ i))))
		     (setf (alist-get 'file-path-dir meta)
			   (concat file-path-dir (format "page/%d/" (1+ i))))
		     (setf (alist-get 'file-path-file meta)
			   (concat (alist-get 'file-path-dir meta) "index.html")))
		   (setf (alist-get 'base-slug meta) slug)
		   (setf (alist-get 'page-number meta) page-number)
		   (setf (alist-get 'total-pages meta) total-pages)
		   (setf (alist-get 'list-items meta)
			 (seq-subseq list-items start-index end-index))
		   (push (cons slug meta) pages)))
	       (setq pages (nreverse pages))
	       (dolist (p pages)
		 (push p new-index)))
	     else
	     do (push entry new-index))
    (nreverse new-index)))


(defun nori-site-extract-headline-meta (headline)
  "Extract metadata alist from one HEADLINE node.
Assumes to only get headlines that have an export_file_name, in order not to include subheadings and not even sections, those will be handled through files." 
  ;; Extract everything
  (let* ((begin (org-element-property :begin headline))
	 (props (org-entry-properties begin 'all))
	 (file-name (alist-get "EXPORT_FILE_NAME" props nil nil #'string=))
	 (contents-begin (org-element-property :contents-begin headline))
	 (contents-end (org-element-property :contents-end headline))
	 (title (substring-no-properties
		 (org-element-interpret-data
		  (org-element-property :title headline))))
	 (date (alist-get "EXPORT_DATE" props nil nil #'string=))
	 (layout (alist-get "EXPORT_LAYOUT" props nil nil #'string=))
	 (f-image (alist-get "EXPORT_FEATURED_IMAGE" props nil nil #'string=))
	 (f-alt (alist-get "EXPORT_FEATURED_ALT" props nil nil #'string=))
	 (description-get (alist-get "DESCRIPTION" props nil nil #'string=))
	 (description (if description-get description-get
			nori-site-description))
	 (page-size (alist-get "PAGINATION" props nil nil #'string=))
	 (todo (org-entry-get begin "TODO" :inherit))
	 (tags (org-entry-get begin "ALLTAGS" :inherit))

	 (wordcount (count-words contents-begin contents-end))
	 (ancestors (org-element-lineage-map headline
			(lambda (parent)
			  (when (eq (org-element-type parent) 'headline) parent))))
	 (ancestors-begin (mapcar (lambda (parent)
				    (org-element-property :begin parent))
				  ancestors))
	 (ancestors-props (mapcar (lambda (an-begin)
				    (org-entry-properties an-begin 'all))
				  ancestors-begin))
	 (sections-names (mapcar (lambda (parent)
				   (substring-no-properties
				    (org-element-interpret-data
				     (org-element-property :title parent))))
				 ancestors))
	 (sections-slugs (mapcar (lambda (an-prop)
				   (alist-get "EXPORT_SECTION" an-prop nil nil #'string=))
				 ancestors-props))
	 (section-slug (concat (string-join (reverse sections-slugs) "/") "/"))
	 (slug  (if (or (string= file-name "_index") (string= file-name "index")) section-slug
		  (concat section-slug file-name "/")))
	 (file-path-dir (concat nori-site-publish-directory slug))
	 (file-path-file (concat file-path-dir "index.html"))
	 
	 ;; Build the metadata alist for the headline
	 (meta `((begin . ,begin)
		 (file-name . ,file-name)
		 (contents-begin . ,contents-begin)
		 (contents-end . ,contents-end)
		 (title . ,title)
		 (date . ,date)
		 (layout . ,(when layout (concat layout ".html")))
		 (f-image . ,(if f-image f-image
			       nori-site-default-featured-image))
		 (f-alt . ,(if f-alt f-alt
			     description))
		 (description . ,description)
		 (page-size . ,page-size)
		 (todo . ,todo)
		 (tags . ,tags)
		 (wordcount . ,wordcount)
		 (sections-names . ,sections-names)
		 (sections-slugs . ,sections-slugs)
		 (section-slug . ,section-slug)
		 (slug . ,slug)
		 (file-path-dir . ,file-path-dir)
		 (file-path-file . ,file-path-file)
		 (list-items . ,nil)
		 (list-all-items . ,nil)
		 (prev-item . ,nil)
		 (next-item . ,nil)
		 )))
    meta
    ))
(defun nori-site-traverse-ast-for-index (ast)
  "Traverse AST and return an INDEX as alist of (TITLE . METADATA-ALIST).
The INDEX contains only headlines with file-name and no TODO."
  (let ((index '()))
    (org-element-map ast 'headline
      (lambda (headline)
	(let* ((begin (org-element-property :begin headline))
	       (props (org-entry-properties begin 'all))
	       (file-name (alist-get "EXPORT_FILE_NAME" props nil nil #'string=))
	       (todo (org-entry-get begin "TODO" :inherit)))
	  ;; Only process files, not subnodes or sections, and exclude todos
	  (when (and file-name (not (and todo (string= todo "TODO"))))
	    (let* ((meta (nori-site-extract-headline-meta headline))
		   (slug (alist-get 'slug meta)))
					; Push to index
	      (push (cons slug meta) index))))))
    index))

(defun nori-site-add-listings-data-to-index (index)
  "Add data about which entries are on a listing entry and how pages are."
  (cl-loop for entry in index
	   for metadata = (cdr entry)
	   for file-name = (alist-get 'file-name metadata)
	   when (string= file-name "_index")
	   do
	   (let* ((parent-section (car (alist-get 'sections-slugs metadata)))
		  (list-items (reverse (nori-site-gather-items parent-section index))))
	     (setf (alist-get 'list-items metadata) list-items)
	     (setf (alist-get 'list-all-items metadata) list-items)))
  
  index)

(defun nori-site-find-adjacent-entries (index)
  (cl-loop for entry in index
	   for metadata = (cdr entry)
	   for file-name = (alist-get 'file-name metadata)
	   unless (or (string= file-name "_index") (string= file-name "index")) ; only for entries
	   do
	   (let* ((current-slug (car entry))
		  (section-slug (alist-get 'section-slug metadata))
		  (parent-section-entry (assoc section-slug index))
		  (list-all-items (alist-get 'list-all-items (cdr parent-section-entry)))
		  (position (cl-position-if (lambda (item)
					      (string= current-slug item))
					    list-all-items))
		  (prev-pos (when (and position (> position 0)) (- position 1)))
		  (next-pos (when (and position (< position (1- (length list-all-items)))) (+ position 1))))
	     (when prev-pos (setf (alist-get 'prev-item metadata) (nth prev-pos list-all-items)))
	     (when next-pos (setf (alist-get 'next-item metadata) (nth next-pos list-all-items)))))
  index)

(defun nori-site-add-tags-to-index (index)
  ;; Build the listing/section page for tags
  (let* ((sections-slugs '("tag"))
	 (section-slug (concat (string-join (reverse sections-slugs) "/") "/"))
	 (slug section-slug)
	 (file-path-dir (concat nori-site-publish-directory slug))
	 (meta `((file-name . "_index")
		 (title . "Tags")
		 (layout . "default-section.html")
		 (page-size . "50")
		 (sections-names . ("Tags"))
		 (sections-slugs . ,sections-slugs)
		 (section-slug . ,section-slug)
		 (slug . ,slug) 
		 (file-path-dir . ,file-path-dir)
		 (file-path-file . ,(concat file-path-dir "index.html"))
		 (list-items . ,nil)
		 (list-all-items . ,nil)
		 (f-image . ,nil)
		 (f-alt . ,nil)
		 (description . ,nil)
		 (date . ,nil)
		 (tags . ,nil)
		 (wordcount . ,nil)
		 (prev-item . ,nil)
		 (next-item . ,nil))))
    (push (cons slug meta) index))

  ;; Go through index and add tags
  (cl-loop for entry in index
	   for entry-slug = (car entry)
	   for metadata = (cdr entry)
	   for tag-string = (alist-get 'tags metadata)
	   when tag-string
	   do
	   (let* ((tags-interm (split-string tag-string ":" t))
		  (tags (mapcar (lambda (tag)
				  (replace-regexp-in-string "__" " " tag))
				tags-interm)))
					;(message "tags %s, length %d" tags (length tags))
	     (dolist (tag tags)
	       (let* ((sections-slugs `(,tag "tag"))
		      (sections-slugs-formatted (mapcar (lambda (tag)
				       (replace-regexp-in-string " " "-" tag))
				     sections-slugs))
		      (section-slug (concat (string-join (reverse sections-slugs-formatted) "/") "/"))
		      (slug section-slug)
		      (file-path-dir (concat nori-site-publish-directory slug))
		      (title (capitalize tag))
		      )
					;(message "%s" sections-slugs)
		 (unless (assoc slug index)
		   (let ((meta `((file-name . "_index")
				 (title . ,title)
				 (layout . "default-section.html")
				 (page-size . "50")
				 (sections-names . (,title "Tags"))
				 (sections-slugs . ,sections-slugs)
				 (section-slug . ,section-slug)
				 (slug . ,slug) 
				 (file-path-dir . ,file-path-dir)
				 (file-path-file . ,(concat file-path-dir "index.html"))
				 (list-items . ,nil)
				 (list-all-items . ,nil)
				 (f-image . ,nil)
				 (f-alt . ,nil)
				 (description . ,nil)
				 (date . ,nil)
				 (tags . ,nil)
				 (wordcount . ,nil)
				 (prev-item . ,nil)
				 (next-item . ,nil)
				 )))
		     (push (cons slug meta) index)
		     (push slug (alist-get 'list-items (cdr (assoc "tag/" index))))
		     (push slug (alist-get 'list-all-items (cdr (assoc "tag/" index))))))
		 (let ((tag-entry (assoc slug index)))
		   (push entry-slug (alist-get 'list-items (cdr tag-entry)))
		   (push entry-slug (alist-get 'list-all-items (cdr tag-entry)))
		   )))))
  ;; Arrange alphabetically on tag/ list and date-wise on the tags themselves
  (let ((tags (alist-get 'list-all-items (cdr (assoc "tag/" index)))))
    (sort tags (lambda (a b) (string< a b)))
    (sort (alist-get 'list-items (cdr (assoc "tag/" index))) (lambda (a b) (string< a b)))
    (dolist (tag tags)
      (let* ((tag-entry (assoc tag index))
	     (all-items (alist-get 'list-all-items (cdr tag-entry)))
	     (items (alist-get 'list-items (cdr tag-entry))))
	(sort all-items (lambda (a b) (string> (alist-get 'date (cdr (assoc a index))) (alist-get 'date (cdr (assoc b index))))))
	(sort items (lambda (a b) (string> (alist-get 'date (cdr (assoc a index))) (alist-get 'date (cdr (assoc b index))))))
	)))
  
  index)


(defun nori-site-build-entry-index (&optional org-file)
  "Scan the ORG-FILE or current buffer and build a global index of metadata."
  (interactive)
  (let* ((o-buffer
	  (if org-file (find-file-noselect org-file)
	    (current-buffer))))
    (with-current-buffer o-buffer
      (let* ((ast (org-element-parse-buffer))
	     (index (nori-site-traverse-ast-for-index ast)))
	(setq index (nori-site-add-listings-data-to-index index))
	(setq index (nori-site-find-adjacent-entries index))
	(setq index (nori-site-paginate index))
	(setq index (nori-site-add-tags-to-index index))
	(setq nori-site-entry-index index)
	(message "Indexed %d entries." (length index))
	index))))

;(nori-site-build-entry-index nori-site-source-org-filename)
(defun nori-site-export-subtree-to-html (buffer begin)
  "Export a subtree contents to HTML with debugging."
  (with-current-buffer buffer
    (save-excursion ;saves buffer selection and point
      (save-restriction ;saves narrowing state
	(goto-char begin)
					;(message "DEBUG: At point: %s" (buffer-substring (line-beginning-position) (line-end-position)))
	(let ((exported-html nil)
	      (export-buffer
	       (org-html-export-as-html
		nil       ; async
		t         ; subtreep
		nil       ; visible-only
		t         ; body-only
		'(:with-toc nil
			    :section-numbers nil)       ; ext-plist default nil
		)))
	  (unwind-protect
              (setq exported-html
		    (with-current-buffer export-buffer
		      (buffer-string)))
	    (kill-buffer export-buffer))
					;(message "DEBUG: Exported html length: %d" (length exported-html))
	  ;; Fix image links, they need and extra / src="img -> src="\img
	  (setq exported-html (replace-regexp-in-string "src=\"img" "src=\"\\\\img" exported-html))
	  
	  exported-html
	  )))))
(defun nori-site-load-template (name)
  "Load template NAME from the templates directory."
  (with-temp-buffer
    (insert-file-contents
     (expand-file-name (concat name) nori-site-templates-dir))
    (buffer-string)))
(defun nori-site-render-template (template-string replacements)
  "Replace PLACEHOLDERS in TEMPLATE_STRING using REPLACEMENTS alist.
REPLACEMENTS is a list of (PLACEHOLDER . VALUE) pairs."
  (let ((result template-string))
    (dolist (pair replacements)
      (setq result (replace-regexp-in-string
		    (car pair)
		    (or (cdr pair) "")
		    result
		    t t))) ; case-sensitive, literal match
    result)) 
(defun nori-site-build-menu (page-slug)
  "Build a flat HTML menu.
CURRENT-FILE is the EXPORT_FILE_NAME of the page being rendered,
used to add the active class."
  (let ((menu-items '(("Home" . "/")
		      ("Posts" . "/post/")
		      ("Fiction" . "/alphabet-superset/")
		      ("Microblog" . "/microblog/2026/")))
	(html "  <nav class=\"site-nav\">\n    <ul>\n")
	)

    ;; Build the HTML string
    (dolist (item menu-items)
      (let* ((title (car item))
	     (menu-url (cdr item))
	     (is-active (and page-slug (string= page-slug menu-url)))
	     (attrs (if is-active
                        "aria-current=\"page\" class=\"active\""
                      "")))
        (setq html
              (concat html
                      (format "    <li>\n      <a %s href=\"%s\">%s</a>\n    </li>\n"
                              attrs menu-url title)))))
    (setq html (concat html "    </ul>\n  </nav>"))
    html))
(defun nori-site-generate-tag-list (tags)
  "Generate the html for the tag list from a TAGS list for a given item."
  (let* ((html "")
	 (tag-list (split-string tags ":" t))
	 (formatted-tag-list (mapcar (lambda (tag)
				       (replace-regexp-in-string "__" " " tag))
				     tag-list)))
    (dolist (tag formatted-tag-list)
      (let* ((url-tag (replace-regexp-in-string " " "-" tag))
	     (url (concat "/" "tag" "/" url-tag)))
					;(message "tag is %s and url is %s" tag url)
	(setq html (concat html "<li><a href=\"" url "\">" tag "</a></li>\n"))))
    html))
(nori-site-generate-tag-list ":one__one:two:three:")
(defun nori-site-render-pagination (metadata)
  (let* ((page-number (alist-get 'page-number metadata))
         (total-pages (alist-get 'total-pages metadata))
	 (base-slug (concat "/" (alist-get 'base-slug metadata)))
         (slug (concat "/" (alist-get 'slug metadata)))
	 (prev-slug (if (= page-number 2) base-slug
		      (concat base-slug "page/" (int-to-string (- page-number 1)) "/")))
	 (next-slug (concat base-slug "page/" (int-to-string (+ page-number 1)) "/"))
	 (last-slug (concat base-slug "page/" (int-to-string total-pages) "/"))
         (slots 5) ;; Number of page numbers to show
         (start-page (max 1 (- page-number (floor (/ slots 2)))))
         (end-page (min total-pages (+ start-page slots 1)))
         html)
    (message "page-number %s" page-number)
    ;; Adjust start/end if we don't have enough slots
    (when (< (- end-page start-page) slots)
      (setq start-page (max 1 (- end-page slots))))
    
    ;; Build pagination HTML
    (setq html "<ul class=\"pagination pagination-default\">")
    
    ;; First button
    (if (equal page-number 1)
        (setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"First\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">««</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"First\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">««</span></a></li>" base-slug))))
    
    ;; Previous button
    (if (equal page-number 1)
	(setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Previous\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">«</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Previous\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">«</span></a></li>" prev-slug)))
      )
    
    ;; Page numbers
    (cl-loop for page from start-page to end-page do
             (if (= page page-number)
                 (setq html (concat html (format "<li class=\"page-item active\"><a aria-current=\"page\" aria-label=\"Page %d\" class=\"page-link\" role =\"button\">%d</a></li>" page page)))
               (let* ((page-slug (if (= page 1) base-slug
                                   (concat base-slug "page/" (int-to-string page) "/"))))
                 (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Page %d\" class=\"page-link\" role=\"button\">%d</a></li>" page-slug page page))))))
    
    ;; Next button
    (if (equal page-number total-pages)
	(setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Next\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">»</span></a></li>"))
      (setq html (concat html (format  "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Next\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">»</span></a></li>" next-slug)))
      )
    
    ;; Last button
    (if (equal page-number total-pages)
        (setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Last\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">»»</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Last\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">»»</span></a></li>" last-slug))))
    
    (setq html (concat html "</ul>"))
    html)
  )

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-get-microblog-years (index)
  "Gather all microblog year section pages into an INDEX alist of the same form as nori-site-entry-index."
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (last (alist-get 'sections-slugs metadata))))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and (not date) (equal "microblog" parent))))
		 items))
    (sort items (lambda (a b) (string< (alist-get 'title (cdr a)) (alist-get 'title (cdr b)))))
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    ;items))

;; (let ((years (nori-site-get-microblog-years nori-site-entry-index)))
;;   (length years)
;;   (dolist (year years)
;;     (message "title %s" (alist-get 'title (cdr year)))))

(defun nori-site-render-microblog-pagination (metadata index subtlep)
  (let* ((micro-years (nori-site-get-microblog-years index))
	 (current-title (alist-get 'title metadata))
	 (link-class (if subtlep "page-link-subtle"
		       "page-link"))
         html)
    (if subtlep (setq html "<nav class=\"pagination-subtle\">")
      (setq html "<nav class=\"pagination\">"))
    
    (dolist (year-slug micro-years)
      (let* ((year (assoc year-slug index))
	     (year-title (alist-get 'title (cdr year)))
	     (year-slug (concat "/" (alist-get 'slug (cdr year)))))
	(if (string= year-title current-title)
	    (setq html (concat html (format "<a href=\"%s\" class=\"%s\">%s</a>" year-slug link-class year-title)))
	  (setq html (concat html (format "<a href=\"%s\" class=\"%s\">%s</a>" year-slug link-class year-title))))))
    (setq html (concat html "</nav>"))
    html)
  )

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-get-microblog-years (index)
  "Gather all microblog year section pages into an INDEX alist of the same form as nori-site-entry-index."
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (last (alist-get 'sections-slugs metadata))))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and (not date) (equal "microblog" parent))))
		 items))
    (sort items (lambda (a b) (string< (alist-get 'title (cdr a)) (alist-get 'title (cdr b)))))
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    ;items))

;; (let ((years (nori-site-get-microblog-years nori-site-entry-index)))
;;   (length years)
;;   (dolist (year years)
;;     (message "title %s" (alist-get 'title (cdr year)))))


(defun nori-site-generate-page (index metadata html archive-html tag-cloud-html org-buffer)
  "Generate a page using the template."
  (let* ((layout (alist-get 'layout metadata))
	 (title (alist-get 'title metadata))
	 (file-name (alist-get 'file-name metadata))
	 (slug (alist-get 'slug metadata))
	 (f-image (alist-get 'f-image metadata))
	 (f-alt (alist-get 'f-alt metadata))
	 (description (alist-get 'description metadata))
	 (sections-slugs (alist-get 'sections-slugs metadata))
	 (section-slug (alist-get 'section-slug metadata))
	 (sections-names (alist-get 'sections-names metadata))
	 (template (if layout
		       (nori-site-load-template layout)
		     (nori-site-load-template (car sections-slugs))))
	 (date (alist-get 'date metadata))
	 (tags (alist-get 'tags metadata))
	 (wordcount (alist-get 'wordcount metadata))
	 (list-items (alist-get 'list-items metadata))
	 (menu-html (nori-site-build-menu slug))
	 (prev-item (alist-get 'prev-item metadata))
	 (next-item (alist-get 'next-item metadata))
	 
	 (replacements
	  `(("{{TITLE}}" . ,title)
	    ("{{CONTENTS}}" . ,html)
	    ("{{LANGUAGE_CODE}}" . ,nori-site-language-code)
	    ("{{CANONICAL_URL}}" . ,(concat nori-site-base-url slug))
	    ("{{URL}}" . ,(concat "/" slug))
	    ("{{SECTION_TITLE}}" . ,(car sections-names))
	    ("{{SECTION_URL}}" . ,(concat "/" section-slug))
	    ("{{DATE}}" . ,date)
	    ("{{DATE_HUMAN}}" . ,(when date (format-time-string "%B %d, %Y" (date-to-time date))))
	    ("{{WORDCOUNT}}" . ,(when wordcount (int-to-string wordcount)))
	    ;; Average reading speed is about 238 words/min
	    ("{{READING_TIME}}" . ,(when wordcount (int-to-string (/ wordcount 238))))
	    ("{{MENU_HTML}}" . ,menu-html)
	    ("{{ARCHIVE}}" . ,archive-html)
	    ("{{TAGCLOUD}}" . ,tag-cloud-html)
	    ("{{CURRENT_YEAR}}" . ,(format-time-string "%Y"))
	    ("{{FAVICON}}" . ,nori-site-favicon)
	    ("{{SITE_NAME}}" . ,nori-site-title)
	    ("{{FEATURED_IMAGE}}" . ,f-image)
	    ("{{FEATURED_ALT}}" . ,f-alt)
	    ("{{HOME_URL}}" . "/")
	    ("{{SITE_LOGO_URL}}" . ,nori-site-logo)
	    ("{{SITE_TITLE}}" . ,nori-site-title)
	    ("{{PRIVACY_POLICY_LINK}}" . ,(concat "/" "privacy-policy"))
	    ("{{DESCRIPTION}}" . ,description)
	    ("{{PAGINATION}}" . "")
	    ("{{PREVIOUS_LINK}}" . ,(if prev-item (concat "/" (alist-get 'slug (cdr (assoc prev-item index))))
				      ""))
	    ("{{NEXT_LINK}}" . ,(if next-item (concat "/" (alist-get 'slug (cdr (assoc next-item index))))
				  ""))
	    ("{{PREVIOUS_TITLE}}" . ,(if prev-item (concat "🡠  " (alist-get 'title (cdr (assoc prev-item index))))
				       ""))
	    ("{{NEXT_TITLE}}" . ,(if next-item (concat (alist-get 'title (cdr (assoc next-item index))) " 🡢")
				   ""))
	    ("{{TAGS}}" . ,(if tags (nori-site-generate-tag-list tags)
			     ""))
	    ("{{LAST_MICROBLOG_DESCRIPTION}}" . ,(when (string= slug "/")
						   (let* ((micro-years (nori-site-get-microblog-years index))
							  (last-year (assoc (car micro-years) index))
							  (last-item-name (car (alist-get 'list-all-items (cdr last-year))))
							  (last-item (assoc last-item-name index))
							  (desc (alist-get 'description (cdr last-item))))
						     desc)))
	    ("{{RECENT_POSTS}}" . ,(when (string= slug "/") (nori-site-render-list index "summary-with-image-item.html" (take nori-site-featured-post-number (alist-get 'list-items (cdr (assoc "post/" index)))) org-buffer nil nil )))
				     
	    )))
    (when (alist-get 'list-items metadata) ;; Only if it's a listing page

      (let ((listing-template-name "")
	    (microblogp nil))
	(cond
	 ((string= layout "default-section.html")
	  (setq listing-template-name "default-listing-item.html"))
	 ((string= "Poems" (car sections-names))
	  (setq listing-template-name "poem-listing-item.html"))
	 ((string= "Posts" (car sections-names))
	  (setq listing-template-name "summary-with-image-item.html"))
	 ((string= "Alphabet Superset" (car sections-names))
	  (setq listing-template-name "summary-with-image-item.html"))
	 ((string= layout "microblog-section.html")
	  (setq listing-template-name "microblog-listing-item.html")
	  (setq microblogp t)))
	(setq replacements (append replacements `(("{{LIST}}" . ,(nori-site-render-list index listing-template-name list-items org-buffer microblogp nil)))))
	
	(when microblogp
	  (setq replacements (append replacements `(("{{MICRO_PAGINATION}}" . ,(nori-site-render-microblog-pagination metadata nori-site-entry-index nil)))))
	  (setq replacements (append replacements `(("{{MICRO_PAGINATION_SUBTLE}}" . ,(nori-site-render-microblog-pagination metadata nori-site-entry-index t)))))))
      (when (and (alist-get 'total-pages metadata) (> (alist-get 'total-pages metadata) 1)) ;; Only if it has pagination
	(setf (alist-get '"{{PAGINATION}}" replacements) (nori-site-render-pagination metadata))))
    (nori-site-render-template template replacements)))

(defun nori-site-render-list (index listing-template-name list-items org-buffer get-htmlp get-im-size-p)
  (let* ((listing-template (nori-site-load-template listing-template-name))
	       (list-html ""))
	  (dolist (item-slug list-items)
	    (let* ((item (assoc item-slug index))
		   (item-html (if get-htmlp (nori-site-export-subtree-to-html org-buffer (alist-get 'begin (cdr item)))
				""))
		   (item-date (alist-get 'date (cdr item)))
		   (item-wordcount (alist-get 'wordcount (cdr item)))
		   (f-image (alist-get 'f-image (cdr item)))
		   (item-replacements
		    `(("{{ITEM_URL}}" . ,(concat "/" (alist-get 'slug (cdr item))))
		      ("{{ITEM_CANONICAL_URL}}" . ,(concat nori-site-base-url (alist-get 'slug (cdr item))))
		      ("{{ITEM_TITLE}}" . ,(alist-get 'title (cdr item)))
		      ("{{ITEM_FEATURED_IMAGE}}" . ,(alist-get 'f-image (cdr item)))
		      ("{{ITEM_FULL_FEATURED_IMAGE}}" . ,(when f-image (concat nori-site-base-url (substring f-image 1))))
		      ("{{IMAGE_EXT}}" . ,(when f-image (file-name-extension f-image)))
		      ("{{ITEM_FEATURED_ALT}}" . ,(alist-get 'f-alt (cdr item)))
		      ("{{ITEM_DATE}}" . ,item-date)
		      ("{{ITEM_DATE_HUMAN}}" . ,(when item-date (format-time-string "%B %d, %Y" (date-to-time item-date))))
		      ("{{ITEM_DATE_RFC822}}" . ,(when item-date (format-time-string "%a, %d %b %Y %H:%M:%S %Z" (apply #'encode-time (decode-time (date-to-time item-date))) "GMT")))
		      ("{{ITEM_READING_TIME}}" . ,(when item-wordcount (int-to-string (/ item-wordcount 238))))
		      ("{{ITEM_WORDCOUNT}}" . ,(when item-wordcount (int-to-string item-wordcount)))
		      ("{{ITEM_DESCRIPTION}}" . ,(alist-get 'description (cdr item)))
		      ("{{ITEM_CONTENTS}}" . ,item-html)
		      ("{{SITE_TITLE}}" . ,nori-site-title)
		      ("{{HOME_URL}}" . "/")
		      ("{{IM_SIZE}}" . ,(when (and get-im-size-p f-image)
					  (int-to-string (nth 7 (file-attributes (concat nori-site-publish-directory (substring f-image 1)))))))
		      )))
	      (setq list-html (concat list-html "\n" (nori-site-render-template listing-template item-replacements)))))
	  list-html))
;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-gather-items (parent-section-name index)
  "Gather all items with a given PARENT-SECTION-NAME into an INDEX alist of the same form as nori-site-entry-index."
  ;; Gather items
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (alist-get 'sections-slugs metadata)))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and date (equal parent-section-name parent))))
		 items))
    ;; Sort by date descending
    (sort items (lambda (a b) (string> (alist-get 'date (cdr a)) (alist-get 'date (cdr b)))))
    ;; Only return slugs in the right order
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    
   ; items))
					;(nori-site-gather-items "2026" nori-site-entry-index)

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-gather-items (parent-section-name index)
  "Gather all items with a given PARENT-SECTION-NAME into an INDEX alist of the same form as nori-site-entry-index."
  ;; Gather items
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (alist-get 'sections-slugs metadata)))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and date (equal parent-section-name parent))))
		 items))
    ;; Sort by date descending
    (sort items (lambda (a b) (string> (alist-get 'date (cdr a)) (alist-get 'date (cdr b)))))
    ;; Only return slugs in the right order
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    
   ; items))
					;(nori-site-gather-items "2026" nori-site-entry-index)

(defun nori-site-paginate (index)
  (let ((new-index nil))
    (cl-loop for entry in index
	     for slug = (car entry)
	     for meta-orig = (cdr entry)
	     for file-name = (alist-get 'file-name meta-orig)
	     ;; Check if we need to paginate
	     ;; index files that have paginations set
	     for page-size-entry = (alist-get 'page-size meta-orig)
	     when (and (string= file-name "_index") page-size-entry)
	     do
	     (let* ((page-size (string-to-number page-size-entry))
		    (sections-slugs (alist-get 'sections-slugs meta-orig))
		    (file-path-dir (alist-get 'file-path-dir meta-orig))
		    (file-path-file (alist-get 'file-path-file meta-orig))
		    (list-items (alist-get 'list-items meta-orig))
		    (total-pages (ceiling (/ (length list-items) page-size)))
		    (pages nil))
	       ;; Create each paginated page in a loop
	       (dotimes (i total-pages) ;for each page from 0 to total-pages
		 (let* ((meta (copy-alist meta-orig))
			(page-number (1+ i))
			(start-index (* i page-size))
			(end-index (min (+ start-index page-size) (length list-items))))
		   (unless (= 0 i)
		     (setf (alist-get 'sections-slugs meta)
			   (push (int-to-string page-number) sections-slugs))
		     (setf (alist-get 'slug meta)
			   (concat slug (format "page/%d/" (1+ i))))
		     (setf (alist-get 'file-path-dir meta)
			   (concat file-path-dir (format "page/%d/" (1+ i))))
		     (setf (alist-get 'file-path-file meta)
			   (concat (alist-get 'file-path-dir meta) "index.html")))
		   (setf (alist-get 'base-slug meta) slug)
		   (setf (alist-get 'page-number meta) page-number)
		   (setf (alist-get 'total-pages meta) total-pages)
		   (setf (alist-get 'list-items meta)
			 (seq-subseq list-items start-index end-index))
		   (push (cons slug meta) pages)))
	       (setq pages (nreverse pages))
	       (dolist (p pages)
		 (push p new-index)))
	     else
	     do (push entry new-index))
    (nreverse new-index)))


(defun nori-site-generate-archive-sidebar (index posts)
  "Generate the HTML for the year archive sidebar using an alist of sorted POSTS"
  ;; Create the archive html
  (let* ((html "<div class=\"year-archive\">")
         (prev-year nil)
         (first-group t))
    
    (dolist (post-slug posts)
      (let* ((post (assoc post-slug index))
	     (meta (cdr post))
	     (date (date-to-time (alist-get 'date meta)))
             (year-str (format-time-string "%Y" date))
             (date-display (format-time-string "%d %b" date))
             (title (alist-get 'title meta))
             (file-name (alist-get 'file-name meta))
	     (slug (alist-get 'slug meta))
	     (url (concat "/" slug)))

        ;; Check if year changed
        (if (not (string= year-str prev-year))
            ;; New Year Group
            (progn
	      ;; Close previous group if not the first one
	      (unless first-group
                (setq html (concat html "    </ul>\n  </details>\n")))
	      
	      ;; Open new group
	      (setq html (concat html
                                 "  <details class=\"year-panel\">\n"
                                 "    <summary class=\"year-header\">" year-str "</summary>\n"
                                 "    <ul class=\"post-list\">\n"))
	      
	      (setq prev-year year-str)
	      (setq first-group nil))
          ;; Same year, just continue
	  
	  )
        
        ;; Add list item
        (setq html (concat html
                           "    <li class=\"post-item\">\n"
                           "      <a href=\"" url "\">" date-display " – " title "</a>\n"
                           "    </li>\n"))))
    
    ;; Close the final group
    (setq html (concat html "    </ul>\n  </details>\n</div>"))
    html))
					;(nori-site-generate-archive-sidebar)
(defun nori-site-render-tag-cloud (index)
  (let* ((tag-slug-list (alist-get 'list-all-items (cdr (assoc "tag/" index))))
	 (largest-font-size 1.5)
   	 (smallest-font-size 0.7)
	 (font-spread (- largest-font-size smallest-font-size))
	 (count-per-tag (mapcar (lambda (tag-slug)
				  (length (alist-get 'list-all-items (cdr (assoc tag-slug index)))))
				tag-slug-list))
	 (max-item-count (apply #'max count-per-tag))
	 (min-item-count (apply #'min count-per-tag))
	 (count-spread (- max-item-count min-item-count))
	 (font-step (/ (float font-spread) count-spread))
	 (html "<div class=\"tagcloud\">\n"))

    (cl-loop for tag-slug in tag-slug-list
	     for count in count-per-tag
	     do
	     (let* ((slug (concat "/" tag-slug))
		    (title (alist-get 'title (cdr (assoc tag-slug index))))
		    ;; pick one
		    ;; linear scaling
		    (font-size (+ smallest-font-size (* (- count min-item-count) font-step)))
		    ;; logarithmic scaling
		    (weight (/ (- (log count) (log min-item-count)) (- (log max-item-count) (log min-item-count))))
		    ;(font-size (+ smallest-font-size (* (- largest-font-size smallest-font-size) weight))) 
		    )
	       (setq html (concat html
				  (format "<a href=\"%s\"\n class=\"tagcloud-item\" style=\"font-size: %.2frem;\">%s<sup>%d</sup></a>\n" slug font-size title count)))
	       )
	     )
    (setq html (concat html "</div>"))
    html
  ))
;(nori-site-render-tag-cloud nori-site-entry-index)
(defun nori-site-generate-404 (layout publish-dir archive-html tag-cloud-html)
  (let* ((file-name "404")
	 (file-path-file (concat publish-dir "404.html"))
	 (slug "404/")
	 (template (if layout
		       (nori-site-load-template layout)
		     (nori-site-load-template (car sections-slugs))))
	 (menu-html (nori-site-build-menu slug))
	 (replacements
	  `(("{{TITLE}}" . "404 - Page not found")
	    ("{{FEATURED_IMAGE}}" . ,nori-site-default-featured-image)
	    ("{{FEATURED_ALT}}" . ,nori-site-description)
	    ("{{DESCRIPTION}}" . ,nori-site-description)
	    ("{{LANGUAGE_CODE}}" . ,nori-site-language-code)
	    ("{{CANONICAL_URL}}" . ,(concat nori-site-base-url slug))
	    ("{{URL}}" . ,(concat "/" slug))
	    ("{{MENU_HTML}}" . ,menu-html)
	    ("{{ARCHIVE}}" . ,archive-html)
	    ("{{TAGCLOUD}}" . ,tag-cloud-html)
	    ("{{CURRENT_YEAR}}" . ,(format-time-string "%Y"))
	    ("{{FAVICON}}" . ,nori-site-favicon)
	    ("{{SITE_NAME}}" . ,nori-site-title)
	    ("{{HOME_URL}}" . "/")
	    ("{{SITE_LOGO_URL}}" . ,nori-site-logo)
	    ("{{SITE_TITLE}}" . ,nori-site-title)
	    ("{{PRIVACY_POLICY_LINK}}" . ,(concat "/" "privacy-policy"))
	    ))
	 (page (nori-site-render-template template replacements)))
    (with-temp-file file-path-file
      (insert page)))
  (message "Published 404"))
(defun nori-site-load-template (name)
  "Load template NAME from the templates directory."
  (with-temp-buffer
    (insert-file-contents
     (expand-file-name (concat name) nori-site-templates-dir))
    (buffer-string)))
(defun nori-site-load-template (name)
  "Load template NAME from the templates directory."
  (with-temp-buffer
    (insert-file-contents
     (expand-file-name (concat name) nori-site-templates-dir))
    (buffer-string)))
(defun nori-site-render-template (template-string replacements)
  "Replace PLACEHOLDERS in TEMPLATE_STRING using REPLACEMENTS alist.
REPLACEMENTS is a list of (PLACEHOLDER . VALUE) pairs."
  (let ((result template-string))
    (dolist (pair replacements)
      (setq result (replace-regexp-in-string
		    (car pair)
		    (or (cdr pair) "")
		    result
		    t t))) ; case-sensitive, literal match
    result)) 
(defun nori-site-build-menu (page-slug)
  "Build a flat HTML menu.
CURRENT-FILE is the EXPORT_FILE_NAME of the page being rendered,
used to add the active class."
  (let ((menu-items '(("Home" . "/")
		      ("Posts" . "/post/")
		      ("Fiction" . "/alphabet-superset/")
		      ("Microblog" . "/microblog/2026/")))
	(html "  <nav class=\"site-nav\">\n    <ul>\n")
	)

    ;; Build the HTML string
    (dolist (item menu-items)
      (let* ((title (car item))
	     (menu-url (cdr item))
	     (is-active (and page-slug (string= page-slug menu-url)))
	     (attrs (if is-active
                        "aria-current=\"page\" class=\"active\""
                      "")))
        (setq html
              (concat html
                      (format "    <li>\n      <a %s href=\"%s\">%s</a>\n    </li>\n"
                              attrs menu-url title)))))
    (setq html (concat html "    </ul>\n  </nav>"))
    html))
(defun nori-site-generate-tag-list (tags)
  "Generate the html for the tag list from a TAGS list for a given item."
  (let* ((html "")
	 (tag-list (split-string tags ":" t))
	 (formatted-tag-list (mapcar (lambda (tag)
				       (replace-regexp-in-string "__" " " tag))
				     tag-list)))
    (dolist (tag formatted-tag-list)
      (let* ((url-tag (replace-regexp-in-string " " "-" tag))
	     (url (concat "/" "tag" "/" url-tag)))
					;(message "tag is %s and url is %s" tag url)
	(setq html (concat html "<li><a href=\"" url "\">" tag "</a></li>\n"))))
    html))
(nori-site-generate-tag-list ":one__one:two:three:")
(defun nori-site-render-pagination (metadata)
  (let* ((page-number (alist-get 'page-number metadata))
         (total-pages (alist-get 'total-pages metadata))
	 (base-slug (concat "/" (alist-get 'base-slug metadata)))
         (slug (concat "/" (alist-get 'slug metadata)))
	 (prev-slug (if (= page-number 2) base-slug
		      (concat base-slug "page/" (int-to-string (- page-number 1)) "/")))
	 (next-slug (concat base-slug "page/" (int-to-string (+ page-number 1)) "/"))
	 (last-slug (concat base-slug "page/" (int-to-string total-pages) "/"))
         (slots 5) ;; Number of page numbers to show
         (start-page (max 1 (- page-number (floor (/ slots 2)))))
         (end-page (min total-pages (+ start-page slots 1)))
         html)
    (message "page-number %s" page-number)
    ;; Adjust start/end if we don't have enough slots
    (when (< (- end-page start-page) slots)
      (setq start-page (max 1 (- end-page slots))))
    
    ;; Build pagination HTML
    (setq html "<ul class=\"pagination pagination-default\">")
    
    ;; First button
    (if (equal page-number 1)
        (setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"First\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">««</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"First\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">««</span></a></li>" base-slug))))
    
    ;; Previous button
    (if (equal page-number 1)
	(setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Previous\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">«</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Previous\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">«</span></a></li>" prev-slug)))
      )
    
    ;; Page numbers
    (cl-loop for page from start-page to end-page do
             (if (= page page-number)
                 (setq html (concat html (format "<li class=\"page-item active\"><a aria-current=\"page\" aria-label=\"Page %d\" class=\"page-link\" role =\"button\">%d</a></li>" page page)))
               (let* ((page-slug (if (= page 1) base-slug
                                   (concat base-slug "page/" (int-to-string page) "/"))))
                 (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Page %d\" class=\"page-link\" role=\"button\">%d</a></li>" page-slug page page))))))
    
    ;; Next button
    (if (equal page-number total-pages)
	(setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Next\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">»</span></a></li>"))
      (setq html (concat html (format  "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Next\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">»</span></a></li>" next-slug)))
      )
    
    ;; Last button
    (if (equal page-number total-pages)
        (setq html (concat html "<li class=\"page-item disabled\"><a aria-disabled=\"true\" aria-label=\"Last\" class=\"page-link\" role=\"button\" tabindex=\"-1\"><span aria-hidden=\"true\">»»</span></a></li>"))
      (setq html (concat html (format "<li class=\"page-item\"><a href=\"%s\" aria-label=\"Last\" class=\"page-link\" role=\"button\"><span aria-hidden=\"true\">»»</span></a></li>" last-slug))))
    
    (setq html (concat html "</ul>"))
    html)
  )

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-get-microblog-years (index)
  "Gather all microblog year section pages into an INDEX alist of the same form as nori-site-entry-index."
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (last (alist-get 'sections-slugs metadata))))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and (not date) (equal "microblog" parent))))
		 items))
    (sort items (lambda (a b) (string< (alist-get 'title (cdr a)) (alist-get 'title (cdr b)))))
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    ;items))

;; (let ((years (nori-site-get-microblog-years nori-site-entry-index)))
;;   (length years)
;;   (dolist (year years)
;;     (message "title %s" (alist-get 'title (cdr year)))))

(defun nori-site-render-microblog-pagination (metadata index subtlep)
  (let* ((micro-years (nori-site-get-microblog-years index))
	 (current-title (alist-get 'title metadata))
	 (link-class (if subtlep "page-link-subtle"
		       "page-link"))
         html)
    (if subtlep (setq html "<nav class=\"pagination-subtle\">")
      (setq html "<nav class=\"pagination\">"))
    
    (dolist (year-slug micro-years)
      (let* ((year (assoc year-slug index))
	     (year-title (alist-get 'title (cdr year)))
	     (year-slug (concat "/" (alist-get 'slug (cdr year)))))
	(if (string= year-title current-title)
	    (setq html (concat html (format "<a href=\"%s\" class=\"%s\">%s</a>" year-slug link-class year-title)))
	  (setq html (concat html (format "<a href=\"%s\" class=\"%s\">%s</a>" year-slug link-class year-title))))))
    (setq html (concat html "</nav>"))
    html)
  )

;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-get-microblog-years (index)
  "Gather all microblog year section pages into an INDEX alist of the same form as nori-site-entry-index."
  (let ((items (copy-alist index))
	(items-slugs nil))
    (setq items (cl-remove-if-not
		 (lambda (item)
		   (let* ((metadata (cdr item))
			  (parent (car (last (alist-get 'sections-slugs metadata))))
			  (date (cdr (assoc 'date metadata)))
			  )
		     (and (not date) (equal "microblog" parent))))
		 items))
    (sort items (lambda (a b) (string< (alist-get 'title (cdr a)) (alist-get 'title (cdr b)))))
    (dolist (item items)
      (push (car item) items-slugs))
    items-slugs))
    ;items))

;; (let ((years (nori-site-get-microblog-years nori-site-entry-index)))
;;   (length years)
;;   (dolist (year years)
;;     (message "title %s" (alist-get 'title (cdr year)))))


(defun nori-site-generate-page (index metadata html archive-html tag-cloud-html org-buffer)
  "Generate a page using the template."
  (let* ((layout (alist-get 'layout metadata))
	 (title (alist-get 'title metadata))
	 (file-name (alist-get 'file-name metadata))
	 (slug (alist-get 'slug metadata))
	 (f-image (alist-get 'f-image metadata))
	 (f-alt (alist-get 'f-alt metadata))
	 (description (alist-get 'description metadata))
	 (sections-slugs (alist-get 'sections-slugs metadata))
	 (section-slug (alist-get 'section-slug metadata))
	 (sections-names (alist-get 'sections-names metadata))
	 (template (if layout
		       (nori-site-load-template layout)
		     (nori-site-load-template (car sections-slugs))))
	 (date (alist-get 'date metadata))
	 (tags (alist-get 'tags metadata))
	 (wordcount (alist-get 'wordcount metadata))
	 (list-items (alist-get 'list-items metadata))
	 (menu-html (nori-site-build-menu slug))
	 (prev-item (alist-get 'prev-item metadata))
	 (next-item (alist-get 'next-item metadata))
	 
	 (replacements
	  `(("{{TITLE}}" . ,title)
	    ("{{CONTENTS}}" . ,html)
	    ("{{LANGUAGE_CODE}}" . ,nori-site-language-code)
	    ("{{CANONICAL_URL}}" . ,(concat nori-site-base-url slug))
	    ("{{URL}}" . ,(concat "/" slug))
	    ("{{SECTION_TITLE}}" . ,(car sections-names))
	    ("{{SECTION_URL}}" . ,(concat "/" section-slug))
	    ("{{DATE}}" . ,date)
	    ("{{DATE_HUMAN}}" . ,(when date (format-time-string "%B %d, %Y" (date-to-time date))))
	    ("{{WORDCOUNT}}" . ,(when wordcount (int-to-string wordcount)))
	    ;; Average reading speed is about 238 words/min
	    ("{{READING_TIME}}" . ,(when wordcount (int-to-string (/ wordcount 238))))
	    ("{{MENU_HTML}}" . ,menu-html)
	    ("{{ARCHIVE}}" . ,archive-html)
	    ("{{TAGCLOUD}}" . ,tag-cloud-html)
	    ("{{CURRENT_YEAR}}" . ,(format-time-string "%Y"))
	    ("{{FAVICON}}" . ,nori-site-favicon)
	    ("{{SITE_NAME}}" . ,nori-site-title)
	    ("{{FEATURED_IMAGE}}" . ,f-image)
	    ("{{FEATURED_ALT}}" . ,f-alt)
	    ("{{HOME_URL}}" . "/")
	    ("{{SITE_LOGO_URL}}" . ,nori-site-logo)
	    ("{{SITE_TITLE}}" . ,nori-site-title)
	    ("{{PRIVACY_POLICY_LINK}}" . ,(concat "/" "privacy-policy"))
	    ("{{DESCRIPTION}}" . ,description)
	    ("{{PAGINATION}}" . "")
	    ("{{PREVIOUS_LINK}}" . ,(if prev-item (concat "/" (alist-get 'slug (cdr (assoc prev-item index))))
				      ""))
	    ("{{NEXT_LINK}}" . ,(if next-item (concat "/" (alist-get 'slug (cdr (assoc next-item index))))
				  ""))
	    ("{{PREVIOUS_TITLE}}" . ,(if prev-item (concat "🡠  " (alist-get 'title (cdr (assoc prev-item index))))
				       ""))
	    ("{{NEXT_TITLE}}" . ,(if next-item (concat (alist-get 'title (cdr (assoc next-item index))) " 🡢")
				   ""))
	    ("{{TAGS}}" . ,(if tags (nori-site-generate-tag-list tags)
			     ""))
	    ("{{LAST_MICROBLOG_DESCRIPTION}}" . ,(when (string= slug "/")
						   (let* ((micro-years (nori-site-get-microblog-years index))
							  (last-year (assoc (car micro-years) index))
							  (last-item-name (car (alist-get 'list-all-items (cdr last-year))))
							  (last-item (assoc last-item-name index))
							  (desc (alist-get 'description (cdr last-item))))
						     desc)))
	    ("{{RECENT_POSTS}}" . ,(when (string= slug "/") (nori-site-render-list index "summary-with-image-item.html" (take nori-site-featured-post-number (alist-get 'list-items (cdr (assoc "post/" index)))) org-buffer nil nil )))
				     
	    )))
    (when (alist-get 'list-items metadata) ;; Only if it's a listing page

      (let ((listing-template-name "")
	    (microblogp nil))
	(cond
	 ((string= layout "default-section.html")
	  (setq listing-template-name "default-listing-item.html"))
	 ((string= "Poems" (car sections-names))
	  (setq listing-template-name "poem-listing-item.html"))
	 ((string= "Posts" (car sections-names))
	  (setq listing-template-name "summary-with-image-item.html"))
	 ((string= "Alphabet Superset" (car sections-names))
	  (setq listing-template-name "summary-with-image-item.html"))
	 ((string= layout "microblog-section.html")
	  (setq listing-template-name "microblog-listing-item.html")
	  (setq microblogp t)))
	(setq replacements (append replacements `(("{{LIST}}" . ,(nori-site-render-list index listing-template-name list-items org-buffer microblogp nil)))))
	
	(when microblogp
	  (setq replacements (append replacements `(("{{MICRO_PAGINATION}}" . ,(nori-site-render-microblog-pagination metadata nori-site-entry-index nil)))))
	  (setq replacements (append replacements `(("{{MICRO_PAGINATION_SUBTLE}}" . ,(nori-site-render-microblog-pagination metadata nori-site-entry-index t)))))))
      (when (and (alist-get 'total-pages metadata) (> (alist-get 'total-pages metadata) 1)) ;; Only if it has pagination
	(setf (alist-get '"{{PAGINATION}}" replacements) (nori-site-render-pagination metadata))))
    (nori-site-render-template template replacements)))

(defun nori-site-render-list (index listing-template-name list-items org-buffer get-htmlp get-im-size-p)
  (let* ((listing-template (nori-site-load-template listing-template-name))
	       (list-html ""))
	  (dolist (item-slug list-items)
	    (let* ((item (assoc item-slug index))
		   (item-html (if get-htmlp (nori-site-export-subtree-to-html org-buffer (alist-get 'begin (cdr item)))
				""))
		   (item-date (alist-get 'date (cdr item)))
		   (item-wordcount (alist-get 'wordcount (cdr item)))
		   (f-image (alist-get 'f-image (cdr item)))
		   (item-replacements
		    `(("{{ITEM_URL}}" . ,(concat "/" (alist-get 'slug (cdr item))))
		      ("{{ITEM_CANONICAL_URL}}" . ,(concat nori-site-base-url (alist-get 'slug (cdr item))))
		      ("{{ITEM_TITLE}}" . ,(alist-get 'title (cdr item)))
		      ("{{ITEM_FEATURED_IMAGE}}" . ,(alist-get 'f-image (cdr item)))
		      ("{{ITEM_FULL_FEATURED_IMAGE}}" . ,(when f-image (concat nori-site-base-url (substring f-image 1))))
		      ("{{IMAGE_EXT}}" . ,(when f-image (file-name-extension f-image)))
		      ("{{ITEM_FEATURED_ALT}}" . ,(alist-get 'f-alt (cdr item)))
		      ("{{ITEM_DATE}}" . ,item-date)
		      ("{{ITEM_DATE_HUMAN}}" . ,(when item-date (format-time-string "%B %d, %Y" (date-to-time item-date))))
		      ("{{ITEM_DATE_RFC822}}" . ,(when item-date (format-time-string "%a, %d %b %Y %H:%M:%S %Z" (apply #'encode-time (decode-time (date-to-time item-date))) "GMT")))
		      ("{{ITEM_READING_TIME}}" . ,(when item-wordcount (int-to-string (/ item-wordcount 238))))
		      ("{{ITEM_WORDCOUNT}}" . ,(when item-wordcount (int-to-string item-wordcount)))
		      ("{{ITEM_DESCRIPTION}}" . ,(alist-get 'description (cdr item)))
		      ("{{ITEM_CONTENTS}}" . ,item-html)
		      ("{{SITE_TITLE}}" . ,nori-site-title)
		      ("{{HOME_URL}}" . "/")
		      ("{{IM_SIZE}}" . ,(when (and get-im-size-p f-image)
					  (int-to-string (nth 7 (file-attributes (concat nori-site-publish-directory (substring f-image 1)))))))
		      )))
	      (setq list-html (concat list-html "\n" (nori-site-render-template listing-template item-replacements)))))
	  list-html))
;;; -*- lexical-binding: t -*-
(require 'org)
(require 'ox-html)

(defvar nori-site-base-url "https://www.noriparelius.com/"
  "URL of the site.")
(defvar nori-site-language-code "en"
  "The language of the site.")
(defvar nori-site-title "nori parelius"
  "Title of the site.")
(defvar nori-site-publish-directory "~/Documents/noriparelius/public/"
  "Directory where published HTML files are stored.")
(defvar nori-site-source-org-filename "~/Documents/noriparelius/noriparelius.org"
  "Filepath of the org file that holds the posts")
(defvar nori-site-templates-dir "~/Documents/noriparelius/templates/"
  "Filepath to the dir with the html templates.")
(defvar nori-site-img-dir "~/Documents/noriparelius/img-global/"
  "Filepath to global img directiory.")
(defvar nori-site-content-img-dir "~/Documents/noriparelius/img/"
  "Filepath to the img dir which contains all the images referenced straight from the org file.")
(defvar nori-site-css-dir "~/Documents/noriparelius/css/"
  "Filepath to css directory.")
(defvar nori-site-fonts-dir "~/Documents/noriparelius/fonts/"
  "Filepath to the fonts directory.")
(defvar nori-site-logo "/img/logo.svg"
  "Name of the file with logo.")
(defvar nori-site-description "Mess and wonder - Nori's digital notebook"
  "Description of the site.")
(defvar nori-site-favicon "/img/favicon.ico"
  "Favicon.")
(defvar nori-site-default-featured-image "/img/noriparelius.png"
  "Default featured image.")
(defvar nori-site-featured-post-number 5
  "Number of posts included on the home page.")
(defvar nori-site-post-pagination-page-size 10
  "Number of posts included on each /post list page.")
(defvar nori-site-entry-index nil
  "Alist of (SLUG . METADATA-ALIST) for all entries.")

(defun nori-site-concat-to-dir (dir filename)
  "Concat filename to another path interpreted as a directory."
  (concat (file-name-as-directory dir) filename)) ; file-name-as-directory appends / if not there
(defun nori-site-generate-rss (index)
  (let* ((file-name "index.xml")
	 (file-path-file (concat nori-site-publish-directory "post/" file-name))
	 (slug "post/index.xml")
	 (layout "rss.xml")
	 (item-layout "rss-item.xml")
	 (template (nori-site-load-template layout))
	 (list-items (reverse (alist-get 'list-all-items (cdr (assoc "post/" index)))))
	 (replacements
	  `(("{{LAST_BUILD_DATE}}" . ,(format-time-string "%a, %d %b %Y %H:%M:%S %Z" (apply #'encode-time (decode-time (current-time))) "GMT"))
	    ("{{RSS_LIST}}" . ,(nori-site-render-list index item-layout list-items (find-file-noselect nori-site-source-org-filename) t t))
	    ))
	 (page (nori-site-render-template template replacements)))
    (setq page (replace-regexp-in-string "\img" (concat nori-site-base-url "img") page))
    (with-temp-file file-path-file
      (insert page))
    (message "Published RSS index.xml"))
    )
;(nori-site-generate-rss nori-site-entry-index)
(defun nori-site-generate-sitemap (index)
  (let* ((file-name "sitemap.xml")
	 (file-path-file (concat nori-site-publish-directory file-name))
	 (xml (concat
   "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
   "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">")))
    (dolist (entry (reverse index))
      (let* ((slug (alist-get 'slug (cdr entry)))
	     (url (if (string= (substring slug 0 1) "/") (concat nori-site-base-url (substring slug 1))
		    (concat nori-site-base-url slug)))
	     (date (alist-get 'date (cdr entry)))
	     ;;(date-string (when date (format-time-string "%Y-%m-%d" (date-to-time date))))
	     )
	(if date (setq xml (concat xml (format "<url><loc>%s</loc><lastmod>%s</lastmod></url>" url date)))
	  (setq xml (concat xml (format "<url><loc>%s</loc></url>"
				  url))))
	  ))
    (setq xml (concat xml "</urlset>"))
    (with-temp-file file-path-file
      (insert xml))
    (message "Published sitemap")
    )
  )
;(nori-site-generate-sitemap nori-site-entry-index)
(defun nori-site-delete-contents-of-dir (dir)
  "Delete all files and subdirs in DIR."
  (when (file-directory-p dir)
    (dolist (file (directory-files dir t "\\`[^.]")) ;; Exclude . and ..
      (if (file-directory-p file)
	  (delete-directory file t) ;; Delete subdir
	(delete-file file)))))

(defun nori-site-render-all-pages ()
  "Iterate over 'nori-site-entry-index', which contains all the entries parsed from org-file, and render each page."
  (interactive)
  ;; Parse the org-source if not parsed yet
  ;(unless nori-site-entry-index
    (nori-site-build-entry-index nori-site-source-org-filename);)

  ;; Run the css compilation and minification
  (shell-command "bash /home/nori/Documents/noriparelius/process-css.sh")

  (let* ((publish-dir (expand-file-name nori-site-publish-directory))
	 (org-buffer (find-file-noselect nori-site-source-org-filename))
	 (posts (nori-site-gather-items "post" nori-site-entry-index))
	 (archive-html (nori-site-generate-archive-sidebar nori-site-entry-index posts))
	 (tag-cloud-html (nori-site-render-tag-cloud nori-site-entry-index)))

    ;; Ensure publish directory exists, remove old one if there was one
    (if (file-exists-p publish-dir)
	;(delete-directory publish-dir t nil)
	(nori-site-delete-contents-of-dir publish-dir)
      (make-directory publish-dir t))
	
    ;; Copy assets to publish-dir
    (copy-directory nori-site-content-img-dir publish-dir t t nil)
    (copy-directory nori-site-img-dir (concat publish-dir "img/") t t t) ; args are keep-time parents and copy-contents
    (copy-directory nori-site-css-dir publish-dir t t nil)
    (copy-directory nori-site-fonts-dir publish-dir t t nil)
    (copy-file (concat nori-site-templates-dir "robots.txt") (concat publish-dir "robots.txt"))
    
    ;; Loop through index to render
    (dolist (entry nori-site-entry-index)
      (let* ((meta (cdr entry))
	     (file-name (alist-get 'file-name meta))
	     (begin (alist-get 'begin meta))
	     (file-path-file (alist-get 'file-path-file meta))
	     (file-path-dir (alist-get 'file-path-dir meta))
	     (html (when begin (nori-site-export-subtree-to-html org-buffer begin)))
	     (title (alist-get 'title meta)))
	;; Ensure directory exists
	(unless (file-exists-p file-path-dir)
	  (make-directory file-path-dir t))
	;; Render
	(let ((page (nori-site-generate-page nori-site-entry-index meta html archive-html tag-cloud-html org-buffer)))
	  (with-temp-file file-path-file
	    (insert page))

	  (message "Published: %s -> %s" title file-name))
	))
    (nori-site-generate-404 "404.html" publish-dir archive-html tag-cloud-html)
    (nori-site-generate-rss nori-site-entry-index)
    (nori-site-generate-sitemap nori-site-entry-index)
    ))


;;(nori-site-render-all-pages)
