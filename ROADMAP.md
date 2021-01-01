RHYMERA
===
 for api/scraper calls
[RhymeBrain](https://rhymebrain.com) for rhymes and portmanteaus
[OneLook](https://onelook.com) for thesaurus and aliteration

[cli-ui](https://github.com/shopify/cli-ui) to handsome up the ui
[clipboard](https://github.com/janlelis/clipboard) to copy result to clipboard

## basic outline:

present with
"Enter a word"
or "quit"

then, choose
1) rhyme
2) alliterate[1]
3) related
4) portmanteaus

[1] asks for a number of letters
get a list of results back (possibly limit or paginate?)

select result or return to home
1) copy to clipboard
2) search this word
3) search a new word

## classes:

### Menu
- handles choices, relies on `CLI::UI`
- send to clipboard

### Lister
- formats data for interacting with

### Rhymer
- pulls from RhymeBrain

### OneLook
- calls onelook api

### RhymeBrain
- scrapes rhymebrain page, returns
