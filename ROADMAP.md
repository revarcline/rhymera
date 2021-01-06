RHYMERA
===
 for api/scraper calls
[RhymeBrain](https://rhymebrain.com) for rhymes and portmanteaus
[clipboard](https://github.com/janlelis/clipboard) to copy result to clipboard

HEY OK DITCHING CLI/UI BECAUSE THEN YOU WON'T NEED THE DAMN HASH
like then you can just return objects
as cool as interactivity is it's not what they're looking for

make sure you go back to initializing list as array!

please research how to
a) take args from cli
b) paginate (should be easy) (also, its own method)


should probably review revision history of this document for blog post
of note:
initially wanted to add in scraper for OneLook but it was unscrapable (no js)
tried building with cli-ui gem from shopify so i could get a nice interactive prompt
however returning a string hobbled this - if i could understand the handlers better, maybe?

this way i can generate my list by iterating through each object enumerable

maybe switch to [TTY::Prompt](https://github.com/piotrmurach/tty-prompt)
i can keep my objects as arrays (clean, no redundancy)
and make my menus return the object value itself!
should be able to do this as a block!

ok! so blogpost about "picking the right depedencies"
- shopify's looked pretty fresh, liked the vi-keys functionality
- only returned string value though, meaning i would need to do some dumb iterations
- tty-prompt allowed me to more easily pass a hash

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

## classes (and tests):

### Rhymera
- creates menu
- do i make everything extend it so i can call it from other stuff?

### Menu
- handles choices, relies on `TTY::Prompt`
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
- source 1
- source 2
test:
make sure it parses input correctly, and `:alternative` is conditional on original object

### RhymeBrain
- uses input to structure api, scrapes rhymebrain results page, returns json
