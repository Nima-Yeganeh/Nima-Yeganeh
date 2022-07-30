import shutil
import os
import tarfile

print('creating archive')
shutil.make_archive('worktarfile', 'tar', root_dir='..', base_dir='worktarfile',)

print('\nArchive contents:')
with tarfile.open('worktarfile.tar', 'r') as t_file:
	for names in t_file.getnames():
		print(names)

os.system('touch sampletarfile.txt')
print('adding sampletarfile.txt')
with tarfile.open('worktarfile.tar', mode='a') as t:
	t.add('sampletarfile.txt')

print('contents:',)
with tarfile.open('worktarfile.tar', mode='r') as t:
	print([m.name for m in t.getmembers()])
