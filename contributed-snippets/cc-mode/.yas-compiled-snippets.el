;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("do" "do\n{\n    $0\n} while (${1:condition});" "do { ... } while (...)" nil nil nil nil nil nil)
                       ("elseif" "} else if (${1:condition}) {\n     $0\n" "else if (...) { ... }" nil nil nil nil nil nil)
                       ("for" "for (${1:int i = 0}; ${2:i < N}; ${3:++i})\n{\n    $0\n}" "for (...; ...; ...) { ... }" nil nil nil nil nil nil)
                       ("if" "if (${1:condition})\n{\n    $0\n}" "if (...) { ... }" nil nil nil nil nil nil)
                       ("ife" "if (${1:condition}) {\n     $2\n} else {\n     $0\n}         \n" "if (...) { ... } else { ... }" nil nil nil nil nil nil)
                       ("ifei" "if (${1:condition}) {\n     $2\n} else if (${3:condition}) {\n     $0\n}         \n" "if (...) { ... } else if (...) { ... }" nil nil nil nil nil nil)
                       ("ifeie" "if (${1:condition}) {\n     $2\n} else if (${3:condition}) {\n     $4\n} else {\n     $0\n}         \n" "if (...) { ... } else if (...) { ... } else { ... }" nil nil nil nil nil nil)
                       ("inc," "#include <$1>\n" "#include <...>" nil nil nil nil nil nil)
                       ("inc." "#include \"$1\"\n" "#include \"...\"" nil nil nil nil nil nil)
                       ("main" "int main(int argc, char *argv[]) {\n     $0\n     return 0;\n}\n" "int main(argc, argv) { ... }" nil nil nil nil nil nil)
                       ("once" "#ifndef ${1:_`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}\n#define $1\n\n$0\n\n#endif /* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil nil)
                       ("pri" "println(\"${1:var}\" + $1);\n" "println (...)" nil nil nil nil nil nil)
                       ("struct" "struct ${1:name}\n{\n    $0\n};" "struct ... { ... }" nil nil nil nil nil nil)
                       ("swi" "switch(${1:condition}) {\ncase ${2:condition}:\n     $3\n     break;\ndefault:\n     $0\n     break;\n}\n" "switch (...) { ...}" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("beginend" "${1:v}.begin(), $1.end" "v.begin(), v.end()" nil nil nil nil nil nil)
                       ("class" "class ${1:Name}\n{\npublic:\n    $1($2);\n    virtual ~$1();\n};" "class ... { ... }" nil nil nil nil nil nil)
                       ("ns" "namespace " "namespace ..." nil nil nil nil nil nil)
                       ("using" "using namespace ${std};\n$0" "using namespace ... " nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("fopen" "FILE *${fp} = fopen(${\"file\"}, \"${r}\");\n" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sat Aug 18 22:05:42 2012
