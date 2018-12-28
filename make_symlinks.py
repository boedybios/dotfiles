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

dotfiles = []
#  vim: vimrc
dotfiles.append(DotFile(fname='vimrc', target_fname='vimrc',
                        target_dname=os.path.join(HOME_DIR, '.vim')))
#  neovim: init.vim
dotfiles.append(DotFile(fname='init.vim', target_fname='init.vim',
                        target_dname=os.path.join(HOME_DIR, '.config/nvim')))
#  zsh: zshrc
dotfiles.append(DotFile(fname='zshrc', target_fname='.zshrc',
                        target_dname=HOME_DIR))
#  bash: bashrc
dotfiles.append(DotFile(fname='bashrc', target_fname='.bashrc',
                        target_dname=HOME_DIR))

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

print('Creating hard links of new dotfiles', end=' ')
for dotfile in dotfiles:
    os.link(src=os.path.join(DOTFILES_DIR, dotfile.fname),
            dst=os.path.join(dotfile.target_dname, dotfile.target_fname))
print('[DONE]')
