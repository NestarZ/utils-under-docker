#!/bin/bash
if [ $(git rev-parse --is-bare-repository) = true ]
then
    REPOSITORY_BASENAME=$(basename "$PWD") 
else
    REPOSITORY_BASENAME=$(basename $(readlink -nf "$PWD"/..))
fi
REPOSITORY_BASENAME=${REPOSITORY_BASENAME%.git}


TARGET="/home/user/drive/git/$REPOSITORY_BASENAME/"
GIT_DIR=$PWD
BRANCH="master"

echo TARGET is $TARGET
echo GIT_DIR is $GIT_DIR

while read oldrev newrev ref
do
	# only checking out the master (or whatever branch you would like to deploy)
	if [ "$ref" = "refs/heads/$BRANCH" ];
	then
    	mkdir -p $TARGET
		echo "Ref $ref received. Deploying ${BRANCH} branch to production..."
		git --work-tree=$TARGET --git-dir=$GIT_DIR checkout -f $BRANCH
	else
		echo "Ref $ref received. Doing nothing: only the ${BRANCH} branch may be deployed on this server."
	fi
done
