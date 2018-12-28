import os
import shutil
from pathlib import Path
from typing import NamedTuple
from datetime import datetime


class DotFile(NamedTuple):
    fname: str
    target_fname: str
    target_dname: str


HOME_DIR = str(Path.home())
DOTFILES_DIR = os.path.join(HOME_DIR, 'dotfiles')
OLD_DOTFILES_DIR = os.path.join(HOME_DIR, 'old_dotfiles')
print('wee')
dotfiles = []
dotfiles.append(DotFile(fname='vimrc', target_fname='vimrc',
                        target_dname=os.path.join(HOME_DIR, '.vim')))
dotfiles.append(DotFile('zshrc', '.zshrc', HOME_DIR))
#  dotfiles.append(DotFile('init.vim', 'init.vim',
#                          os.path.join(HOME_DIR, '.vim')))


print('Creating ~/old_dotfiles/ directory', end=' ')
if not os.path.exists(OLD_DOTFILES_DIR):
    os.mkdir(OLD_DOTFILES_DIR)
print('[DONE]')

print('Moving old dotfiles to ~/old_dotfiles/ directory', end=' ')
timestamp = str(datetime.now())
for dotfile in dotfiles:
    shutil.move(src=os.path.join(dotfile.target_dname, dotfile.target_fname),
                dst=os.path.join(OLD_DOTFILES_DIR,
                                 f'{dotfile.target_fname}[{timestamp}]'))
print('[DONE]')

print('Creating symlinks of new dotfiles to the targeted directories', end=' ')
for dotfile in dotfiles:
    os.symlink(src=os.path.join(DOTFILES_DIR, dotfile.fname),
               dst=os.path.join(dotfile.target_dname, dotfile.target_fname))
print('[DONE]')
