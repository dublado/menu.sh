# menu.sh

A shell menu to display and select options.


## Usage

After sourcing the `menu.sh` file just call `menu` with the first
argument being the active (selected option) and all other arguments
being the whole list of options.

The menu selected option will be available on `$MENU_SELECTED`.

```
source menu.sh
menu v2 v1 v2 v3
echo $MENU_SELECTED
```

Ctrl+C or pressing `q` when the menu is shown will result in an unset
`$MENU_SELECTED`.


### Options

| Option                | Used for                                                  | Default                   |
|-----------------------|-----------------------------------------------------------|-------------------------- |
| MENU_COLOR_OPTIONS    | The not-highlighted colour of the options                 | bash color 2 (greyd out)  |
| MENU_COLOR_ACTIVE     | The colour of the highlighted option                      | bash color 0 (default)    |
| MENU_COLOR_ARROW      | The colour of the arrow next to the highlighted option    | bash color 36 (green)     |

