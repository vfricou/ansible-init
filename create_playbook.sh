#!/usr/bin/env bash

read -p "Role author ? " AUTHOR
read -p "Role galaxy namespace ? " NAMESPACE
read -p "Path to ansible playbook project ? " PROJECTDIR

i=0
while true
do
  read -p "Role name to create ? " ROLENAME
  read -p "Role description ? " ROLEDESC
  DESCRIPTION="${DESCRIPTION}{ \"name\": \"${ROLENAME}\", \"description\": \"${ROLEDESC}\"},"
  read -p "Would you create another role ? (y/n) " CONTINUE
  if [ "${CONTINUE}" == "y" ]
  then
    let "i=i+1"
  else
    break
  fi
done

JSON_OUTPUT="{
  \"roles\": [
    ${DESCRIPTION}
  ],
  \"project_dir\": \"${PROJECTDIR}\",
  \"author\": \"${AUTHOR}\",
  \"galaxy_namespace\": \"${NAMESPACE}\"
}
"

ansible-playbook \
    init.yml \
    -i production \
    --connection=local \
    --extra-vars="${JSON_OUTPUT}"