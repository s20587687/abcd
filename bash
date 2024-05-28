
#!/bin/bash

# Function to get string length
string_length() {
  local str="$1"
  echo "${#str}"
}

# Function to convert string to uppercase
to_uppercase() {
  local str="$1"
  echo "${str^^}"
}

# Function to convert string to lowercase
to_lowercase() {
  local str="$1"
  echo "${str,,}"
}

# Function to extract substring
extract_substring() {
  local str="$1"
  local start="$2"
  local length="${3:-}"  # Optional length parameter with default empty

  echo "${str:$start:$length}"
}

# Function to replace substring (all occurrences)
replace_all() {
  local str="$1"
  local pattern="$2"
  local replace="$3"
  echo "${str//${pattern}/${replace}}"
}

# Function to check if string starts with a substring
starts_with() {
  local str="$1"
  local prefix="$2"
  [[ "${str}" == "${prefix}"* ]] && echo "true" || echo "false"
}

# Function to check if string ends with a substring
ends_with() {
  local str="$1"
  local suffix="$2"
  [[ "${str}" == *"${suffix}" ]] && echo "true" || echo "false"
}


# Example usage
str="This is a test string"

# Get string length
length=$(string_length "$str")
echo "String length: $length"

# Convert to uppercase and lowercase
uppercase=$(to_uppercase "$str")
lowercase=$(to_lowercase "$str")
echo "Uppercase: $uppercase"
echo "Lowercase: $lowercase"

# Extract substring
substring=$(extract_substring "$str" 5 4)
echo "Extracted substring: $substring"  # Extract characters from index 5 (inclusive) with length 4

# Replace substring
replaced_str=$(replace_all "$str" "is" "was")
echo "Replaced string: $replaced_str"

# Check if string starts/ends with substring
echo "Starts with 'This': $(starts_with "$str" "This")"
echo "Ends with 'string': $(ends_with "$str" "string")"





//arithmetic operation

#!/bin/bash

# Function to perform addition
addition() {
    echo "Result: $(($1 + $2))"
}

# Function to perform subtraction
subtraction() {
    echo "Result: $(($1 - $2))"
}

# Function to perform multiplication
multiplication() {
    echo "Result: $(($1 * $2))"
}

# Function to perform division
division() {
    if [ $2 -ne 0 ]; then
        echo "Result: $(($1 / $2))"
    else
        echo "Error: Division by zero is not allowed."
    fi
}

# Main script starts here

echo "Enter first number:"
read num1

echo "Enter second number:"
read num2

echo "Select operation:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read choice

case $choice in
    1)
        addition $num1 $num2
        ;;
    2)
        subtraction $num1 $num2
        ;;
    3)
        multiplication $num1 $num2
        ;;
    4)
        division $num1 $num2
        ;;
    *)
        echo "Invalid choice"
        ;;
esac






//palindrome, prime, fibbocci

#!/bin/bash

# Function to check if a number is a palindrome
is_palindrome() {
    num=$1
    original_num=$num
    reverse=0

    while [ $num -gt 0 ]
    do
        remainder=$(($num % 10))
        reverse=$(($reverse * 10 + $remainder))
        num=$(($num / 10))
    done

    if [ $original_num -eq $reverse ]; then
        echo "$original_num is a palindrome."
    else
        echo "$original_num is not a palindrome."
    fi
}

# Function to check if a number is prime
is_prime() {
    num=$1
    if [ $num -le 1 ]; then
        echo "$num is not a prime number."
        return
    fi

    for (( i=2; i<=$num/2; i++ ))
    do
        if [ $(($num % $i)) -eq 0 ]; then
            echo "$num is not a prime number."
            return
        fi
    done

    echo "$num is a prime number."
}

# Function to generate Fibonacci series up to a given number
generate_fibonacci() {
    num=$1
    a=0
    b=1

    echo "Fibonacci series up to $num: "
    for (( i=0; i<$num; i++ ))
    do
        echo -n "$a "
        fn=$((a + b))
        a=$b
        b=$fn
    done
    echo
}

# Main script starts here

echo "Enter a number:"
read num

echo "Select operation:"
echo "1. Check if the number is a palindrome"
echo "2. Check if the number is a prime number"
echo "3. Generate Fibonacci series up to the given number"
read choice

case $choice in
    1)
        is_palindrome $num
        ;;
    2)
        is_prime $num
        ;;
    3)
        generate_fibonacci $num
        ;;
    *)
        echo "Invalid choice"
        ;;
esac








#1 string handling functions
concatenate_strings() {
    str1="Hello"
    str2="World"
    concatenated="$str1 $str2"
    echo "Concatenated string: $concatenated"
}

string_length() {
    str="Hello, World!"
    length=${#str}
    echo "Length of the string \"$str\" is $length"
}

substring_extraction() {
    str="Hello, World!"
    substring="${str:7:5}"
    echo "Substring of \"$str\" starting from index 7: $substring"
}

substring_replacement() {
    str="Hello, World!"
    new_str="${str/Hello/Hi}"
    echo "After Replacement: $new_str"
}

uppercase_conversion() {
    str="hello, world!"
    uppercase="${str^^}"
    echo "Uppercase string: $uppercase"
}

lowercase_conversion() {
    str="HELLO, WORLD!"
    lowercase="${str,,}"
    echo "Lowercase string: $lowercase"
}

echo "String Handling Function Demo"
echo "-----------------------------"
concatenate_strings
string_length
substring_extraction
substring_replacement
uppercase_conversion
lowercase_conversion

#2 arithmetic functions
add() {
    result=$(( $1 + $2 ))
    echo "Addition: $result"
}

subtract() {
    result=$(( $1 - $2 ))
    echo "Subtraction: $result"
}

multiply() {
    result=$(( $1 * $2))
    echo "Multiplication: $result"
}

divide() {
    if [ $2 -eq 0 ]; then
        echo "Cannot divide by zero"
    else
        result=$(awk "BEGIN {printf \"%.2f\", $1 / $2}")
        echo "Division: $result"
    fi
}

remainder() {
    result=$(( $1 % $2))
    echo "Remainder: $result"
}

echo "Arithmetic Function Demo"
echo "-----------------------"

read -p "Enter two numbers: " num1 num2

add $num1 $num2
subtract $num1 $num2
multiply $num1 $num2
divide $num1 $num2
remainder $num1 $num2

#3 ss palindrome, prime, fibonacci

#!/bin/bash
# Function to calculate factorial
factorial() {
 if [ $1 -eq 0 -o $1 -eq 1 ]; then
 echo 1
 else
 echo $(( $1 * $(factorial $(( $1 - 1 ))) ))
 fi
}
# Function to check if a number is even or odd
evenodd() {
 if [ $(( $1 % 2 )) -eq 0 ]; then
 echo "Even"
 else
 echo "Odd"
 fi
}
# Function to check if a number is prime
isprime() {
 for (( i=2; i<=$1/2; i++ )); do
 if [ $(( $1 % $i )) -eq 0 ]; then
 echo "Not Prime"
 return
 fi
 done
 echo "Prime"
}
# Function to print Fibonacci series
fibonacci() {
 a=0
 b=1
 echo -n "$a $b "
 for (( i=2; i<$1; i++ )); do
 c=$((a + b))
 echo -n "$c "
 a=$b
 b=$c
 done
 echo
}
# Function to print multiplication table
table() {
 for (( i=1; i<=10; i++ )); do
 echo "$1 x $i = $(( $1 * $i ))"
 done
}
#Function to check if a number is palindrome
is_palindrome() {
    num=$1
    reverse=0
    while [ $num -gt 0 ]; do
        remainder=$((num%10))
        reverse=$((reverse * 10 + remainder))
        num=$((num / 10))
    done
    if [ $1 -eq $reverse ]; then
        echo "Palindrome"
    else
        echo "Not Palindrome"
    fi
}
# Main script
read -p "Enter a number: " num
echo "Factorial: $(factorial $num)"
echo "Even/Odd: $(evenodd $num)"
echo "Prime or Not Prime: $(isprime $num)"
echo "Fibonacci Series up to $num terms: $(fibonacci $num)"
echo "Multiplication Table of $num:"
table $num
echo "Palindrome Check: $(is_palindrome $num)"

