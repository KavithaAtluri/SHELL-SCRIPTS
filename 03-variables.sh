#! /bin/bash
## Normal Variable
a=10
echo value a = $a

## ********************************

## Environment Variable
echo Environemnt Variable CLASS = $CLASS
## can use export CLASS = "DevOps"

## **********************************

## Scalar Variable
##Normal Array -- Like List
Student=("Kavi" "Sri" "Laxmi")
echo student array = ${Student[@]}
echo student array Students = ${#Student[*]}
echo first student = ${Student[0]}
## Another type like using index as per our choice --Map
declare -A Emp
Emp["Name"]="kavi"
Emp["Desg"]="AC"
echo Emp Array = ${#Emp[@]}
echo Emp Array Count = ${#Emp[*]}
echo Emp Array Count = ${#Emp[@]}
echo Emp Name = ${Emp[Name]}

## *********************************************

##Command Substitutions
List_Of_Files=$(ls)
echo $List_Of_Files
