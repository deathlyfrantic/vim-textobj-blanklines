## textobj-blanklines

A plugin that provides a text object for groups of empty lines.

**UPDATE 2017-01-14**: The behavior of this plugin has changed a bit.
Previously, `a<Space>` selected all of the blank lines between two non-blank
lines; both lines before _and_ after the current line. However, I discovered
that the `inner paragraph (ip)` text object built in to Vim does this already.
Rather than duplicate existing functionality, I have changed `a<Space>` to
select only blank lines before the current one. So now you can choose lines
above with `a<Space>`, lines below with `i<Space>`, or all lines with `ip`.

`a<Space>` selects all of the blank lines from the current one to the previous
non-blank line (assuming the current one is blank); `i<Space>` selects all blank
lines starting with the current until the next non-blank line. For the purposes
of this plugin, "blank" means contains _only_ whitespace. (A line with spaces
and/or tabs, but no other characters, is considered blank.)

This plugin depends on [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user).
