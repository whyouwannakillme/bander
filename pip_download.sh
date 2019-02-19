#!/bin/bash
#echo $NAME
"""list_ список проектов"""
"""list___ список версий"""


function pip_download {

#       cat list_ | xargs -P 2 -I NANA  echo $1 + "plus"
   cat  list___ | xargs -P 2 -I VERS sh -c "pip download -d tmp/$i $i==VERS"
}


for i in `cat list_`
do
        echo "=="$i"=="
        mkdir -p tmp/$i
        pip_download
        ls -1 tmp/$i >  main/$i/list_dep_and_project
        ls -1 tmp/$i | egrep -v ^$i | xargs -P 2 rm -f
        du -sh tmp/$i/ > main/$i/size


        rm -rf tmp/$i
done

#pip_download $NAaME

