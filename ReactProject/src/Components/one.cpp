// Your First C++ Program

// #include <iostream>

// int main() {
//     std::cout << "Hello World!";
//     return 0;
// }

#include <iostream>
#include <string>

bool isPalindrome(std::string str) {
    int start = 0;
    int end = str.length() - 1;

    while (start < end) {
        if (str[start] != str[end]) {
            return false;
        }
        start++;
        end--;
    }
    return true;
}

int main() {
    std::string str;
    std::cout << "Enter a string: ";
    std::cin >> str;

    if (isPalindrome(str)) {
        std::cout << "The string is a palindrome." << std::endl;
    } else {
        std::cout << "The string is not a palindrome." << std::endl;
    }

    return 0;
}