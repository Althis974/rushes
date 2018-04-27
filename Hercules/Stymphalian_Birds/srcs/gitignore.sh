# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    gitignore.sh                                     .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/03/15 11:17:05 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/03/15 13:37:04 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/bash

if [ "$#" -ne 1 ] ; then
	echo "usage: sh $0 dir_path"
else
	DIR=$1
	{
		echo "# Prerequisites\n" > $DIR/.gitignore
		echo "*.d" >> $DIR/.gitignore

		echo "\n# Object files\n" >> $DIR/.gitignore
		echo "*.o" >> $DIR/.gitignore
		echo "*.ko" >> $DIR/.gitignore
		echo "*.obj" >> $DIR/.gitignore
		echo "*.elf" >> $DIR/.gitignore

		echo "\n# Linker output\n" >> $DIR/.gitignore
		echo "*.ilk" >> $DIR/.gitignore
		echo "*.map" >> $DIR/.gitignore
		echo "*.exp" >> $DIR/.gitignore

		echo "\n# Precompiled Headers\n" >> $DIR/.gitignore
		echo "*.gch" >> $DIR/.gitignore
		echo "*.pch" >> $DIR/.gitignore

		echo "\n# Libraries\n" >> $DIR/.gitignore
		echo "*.lib" >> $DIR/.gitignore
		echo "*.a" >> $DIR/.gitignore
		echo "*.la" >> $DIR/.gitignore
		echo "*.lo" >> $DIR/.gitignore

		echo "\n# Shared objects (inc. Windows DLLs)\n" >> $DIR/.gitignore
		echo "*.dll" >> $DIR/.gitignore
		echo "*.so" >> $DIR/.gitignore
		echo "*.so.*" >> $DIR/.gitignore
		echo "*.dylib" >> $DIR/.gitignore

		echo "\n# Executables\n" >> $DIR/.gitignore
		echo "*.exe" >> $DIR/.gitignore
		echo "*.out" >> $DIR/.gitignore
		echo "*.app" >> $DIR/.gitignore
		echo "*.i*86" >> $DIR/.gitignore
		echo "*.x86_64" >> $DIR/.gitignore
		echo "*.hex" >> $DIR/.gitignore

		echo "\n# Debug files\n" >> $DIR/.gitignore
		echo "*.dSYM/" >> $DIR/.gitignore
		echo "*.su" >> $DIR/.gitignore
		echo "*.idb" >> $DIR/.gitignore
		echo "*.pdb" >> $DIR/.gitignore

		echo "\n# Kernel Module Compile Results\n" >> $DIR/.gitignore
		echo "*.mod*" >> $DIR/.gitignore
		echo "*.cmd" >> $DIR/.gitignore
		echo ".tmp_versions/" >> $DIR/.gitignore
		echo "modules.order" >> $DIR/.gitignore
		echo "Module.symvers" >> $DIR/.gitignore
		echo "Mkfile.old" >> $DIR/.gitignore
		echo "dkms.conf" >> $DIR/.gitignore

		echo "\n# Logs and databases\n" >> $DIR/.gitignore
		echo "*.log" >> $DIR/.gitignore
		echo "*.sql" >> $DIR/.gitignore
		echo "*.sqlite" >> $DIR/.gitignore

		echo "\n# OS generated files\n" >> $DIR/.gitignore
		echo ".DS_Store" >> $DIR/.gitignore
		echo ".DS_Store?" >> $DIR/.gitignore
		echo "._*" >> $DIR/.gitignore
		echo ".Spotlight-V100" >> $DIR/.gitignore
		echo ".Trashes" >> $DIR/.gitignore
		echo "ehthumbs.db" >> $DIR/.gitignore
		echo "Thumbs.db" >> $DIR/.gitignore
	}
fi
exit 0
