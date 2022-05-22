# sample ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = True
c.InteractiveShellApp.log_level = 20
c.InteractiveShellApp.extensions = [
    'autoreload',
]
c.InteractiveShellApp.exec_lines = [
    '%autoreload 2'
]
#c.InteractiveShellApp.exec_files = [
    #'mycode.py',
    #'fancy.ipy'
#]
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'linux'
c.InteractiveShell.confirm_exit = False
#c.InteractiveShell.deep_reload = True # Deep reload unlikely to be compatible with autoreload
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.PromptManager.in_template  = 'In [\#]: '
c.PromptManager.in2_template = '   .\D.: '
c.PromptManager.out_template = 'Out[\#]: '
c.PromptManager.justify = True

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [
 ('la', 'ls -al')
]
