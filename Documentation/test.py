'''
Created on Sep 4, 2017 
@author: Vidya Thotangare
@purpose: This program will create directory, write text to file 
          and replace strings in file

'''

import os

class writetofile:
	def __init__(self):
		self.testdir = os.path.join(os.getcwd() , 'test')
		self.testfile = os.path.join(self.testdir, 'nfile.txt') 

	def replace_all(self, text, dic):
		for i, j in dic.iteritems():
			text = text.replace(i, j)
		return text

	def makefiles(self):
		if not os.path.exists(self.testdir):
			os.makedirs(self.testdir)
		f = open(self.testfile,'a')
		f.write('hello world')
		f.close()

	def replacetxt(self):
		f1 = open(self.testfile, 'r')
		f2 = open(os.path.join(self.testdir, 'nfile2.txt') , 'w')
		rdic = {'hello':'Welcome', 'world':'User'}
		for line in f1:
		    line2 = self.replace_all(line, rdic)
		    print line2
		    f2.write(line2)
		f1.close()
		f2.close()


#===========================================================
wrf = writetofile()

#wrf.makefiles()
wrf.replacetxt()