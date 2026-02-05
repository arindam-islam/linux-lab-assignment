#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    for(int i = 0; i < 3; i++) {
        if(fork() == 0) {
            _exit(0);
        }
    }

    while(wait(NULL) > 0) {
        printf("Cleaned up a child process\n");
    }

    return 0;
}
