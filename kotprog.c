#include <stdio.h>


int word_count(char *text);

int main() {
	    
    char *text = "Hello test! string for longest word";
    int result = word_count(text);
    
    printf("%s -> %d\n", text, result);
    
    
    return 0;
}

