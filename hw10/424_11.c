#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

// ps r     get running processes
// ps -q    process ID quck mode or   pidof 424_11   then   (sudo) kill PID
// kill -15 or -9 PID

// typedef void handler_t(int);
// handler_t *Signal(int signum, handler_t *handler);

void handler1(int sig) { printf("Not so simple -- I can't be stopped with a ctr-c!\n"); }

void handler2(int sig) { printf("Nope -- I refuse to be put in the background!\n"); }

int main() {
    /* install the SIGINT handlers */
    /* only code changes go right here! */
    signal(SIGINT, handler1);
    signal(SIGTSTP, handler2);

    /* Don't change rest of code */
    printf("Just try to stop me!\n");
    while (1) {
        printf("still running\r\n");
        sleep(10);
    }
}