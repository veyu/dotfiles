# Test file for markdown syntax highlighting
Below are tests for cases in syntax hilighting.

## Code blocks
Empty code block
```
```
Empty code block with syntax definition
```python
```
End of section.

## Inline code with backticks
` ` Empty backticks  
`a` Not empty backticks  
` a ` Not empty backticks with spaces
`   a   ` Not empty backticks with more spaces (should render the same as above)
 ` abc` Space before inline
   ` abc` 3 spaces before inline

`` ``Double empty backticks  
`` ` ``Double backticks with signle backtick inside  
`` a` ` d `` Double backticks with two single backticks inside  
`` a``` d `` Triple backticks inside double ones  
``` as ``` Triple inline backticks  
``` f``g ``` Lorem ipsum dolor  
```` i```j ````Lorem ipsum dolor  
Text before ``` `` ``` inline backticks  

Multiline backticks
`` ``a ``b jump to previous cursor location  
``c d``e jump to previous cursor location  
``` as ``` jump to previous cursor location  
``` f``g ```h jump to previous cursor location  
```` i```j ````k jump to previous cursor location  
da ``` `` ``` jump to previous cursor location  
dsa l````m

FIXME: below should not be hilighted
```s r```` jump to previous cursor location  

dasdas

