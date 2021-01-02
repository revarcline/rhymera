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
2) prefix
3) suffix
4) related
5) portmanteaus

get a list of results back (possibly limit or paginate?)

select result or return to home
1) copy to clipboard
2) search this word
3) search a new word

## classes:

### Menu
- handles choices, relies on `CLI::UI`
- send to clipboard with `Clipboard`

### List
- formats data for interacting with
- possibly paginates?

### Rhymes < List
- determines nature of query, converts relevant json object to conform to list

### Prefix < List
- converts relevant scrape data to list, formats relevant query

### Suffix < List
- converts relevant scrape data to list, formats relevant query

### Related < List
- converts relevant scrape data to list, formats relevant query

### Portmanteau < List
- determines nature of query, converts relevant json object to list

### OneLook
- calls onelook api, returns json object

### RhymeBrain
- uses input to structure api, scrapes rhymebrain results page, returns word list

files:

