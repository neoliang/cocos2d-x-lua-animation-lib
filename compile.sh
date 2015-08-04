currentdir=`pwd`
echo ${currentdir}

moonc ${currentdir}/moon -t ${currentdir}/


rsync -av --include='*.lua' --include='*/' --prune-empty-dirs --exclude='*' ${currentdir}/moon/ ${currentdir}/lua
rm ${currentdir}/moon/*.lua
