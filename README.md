## textobj-blanklines

A plugin that provides a text object for groups of empty lines.

![demonstration gif](https://cloud.githubusercontent.com/assets/7629614/17120720/f57fa5ee-5293-11e6-950e-8c067dffd737.gif)

`a<Space>` selects all of the blank lines on either side of the current one (assuming the current one is blank);
`i<Space>` selects all blank lines starting with the current until the next non-blank line. For the purposes of this
plugin, "blank" means contains _only_ whitespace. (A line with spaces and/or tabs, but no other characters, is
considered blank.)

This plugin depends on [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user). Install using your favorite
plugin manager. I like [Vim-Plug](https://github.com/junegunn/vim-plug).
