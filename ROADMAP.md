RHYMERA
===
 for api/scraper calls
[RhymeBrain](https://rhymebrain.com) for rhymes and portmanteaus

[cli-ui](https://github.com/shopify/cli-ui) to handsome up the ui
[clipboard](https://github.com/janlelis/clipboard) to copy result to clipboard

## basic outline:

present with
"Enter a word"
or "quit"

then, choose
1) rhyme
(type: getRhymes)
2) portmanteaus
(type: getPortmanteaus)

get a list of results back (possibly limit or paginate?)


detail view, common (module?)
- copy to clipboard
- search using word as query
- search previous query
- search a new query 
- back to list

detail view - rhyme
word
number of syllables

detail view - portmanteau
portmanteau (actually spelling[0])
root word 1
root word 2 (selectable with common menu)
alternative (spelling[1] if spelling[1])
 - selectable and switches with portmanteau name on selection (incl searchability)

## classes:

### Rhymera
- creates menu
- do i make everything extend it so i can call it from other stuff?

### Menu
- handles choices, relies on `CLI::UI`
- send word to clipboard with `Clipboard`
- displays `List` object as selectable menu
    - also: search new word/previous search/search {other type}
- selecting `Rhyme` or `Portmanteau` entry shows relevant details, option to search

### List
- init with type (rhyme or port) and query
- has many `Rhyme`, `Portmanteau`
- collects the prior for display from a rhymebrain call
- class instance variable with prior queries!

### Rhyme
- contains each rhyme entry from json object
- syllables

### Portmanteau
- contains each portmanteau entry from json object
- spelling (array of one or two)
- root 1
- root 2

### RhymeBrain
- uses input to structure api, scrapes rhymebrain results page, returns json

files:

