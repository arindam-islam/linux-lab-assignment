#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

void handler(int sig) {
    if(sig == SIGTERM)
        printf("SIGTERM received. Exiting gracefully.\n");
    if(sig == SIGINT)
        printf("SIGINT received. Exiting gracefully.\n");
    exit(0);
}

int main() {
    signal(SIGTERM, handler);
    signal(SIGINT, handler);

    if(fork() == 0) {
        sleep(5);
        kill(getppid(), SIGTERM);
        exit(0);
    }

    if(fork() == 0) {
        sleep(10);
        kill(getppid(), SIGINT);
        exit(0);
    }

    while(1)
        pause();

    return 0;
}
