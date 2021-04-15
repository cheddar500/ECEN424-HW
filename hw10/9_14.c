// gcc 9_14.c -o 9_14
// ./9_14 hello.txt 1

#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

void main(int argc, char *argv[]) {
    // needed variables
    int fd, i;
    char *file, *mod_string = "Hello, World!";
    struct stat buffer;

    // open the file and check for errors
    if ((fd = open(argv[1], O_CREAT | O_RDWR, 0666)) < 0) {
        printf("Error opening the file %s\n", argv[1]);
        exit(1);
    }
    // get the size of the file we're mapping
    write(fd, mod_string, strlen(mod_string));

    if (fstat(fd, &buffer) < 0) {
        printf("File has fstat error %s\n", argv[1]);
        exit(1);
    }
    // mapping is established
    if ((file = mmap(0, (size_t)buffer.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0)) ==
        (caddr_t)-1) {
        printf("Failure of mmap\n");
        exit(1);
    }
    // print out the final results
    printf("Original file:\n %s \n", file);
    *(file) = 'J';
    printf("Updated file:\n %s \n", file);
    exit(0);
}

// void main(int argc, char *argv[]) {
//     int fd, changes, i;
//     struct stat buffer;
//     char *file, *mod_string = "Hello, World!";
//     if (argc != 3) {
//         printf("Usage: %s file_name #_of_changes\n", *argv);
//         exit(1);
//     }
//     if ((changes = atoi(argv[2])) < 1) {
//         printf("#_of_changes < 1\n");
//         exit(1);
//     }
//     if ((fd = open(argv[1], O_CREAT | O_RDWR, 0666)) < 0) {
//         printf("open error on file %s\n", argv[1]);
//         exit(1);
//     }
//     write(fd, mod_string, strlen(mod_string));
//     /* Obtain size of file to be mapped */
//     if (fstat(fd, &buffer) < 0) {
//         printf("fstat error on file %s\n", argv[1]);
//         exit(1);
//     }
//     /* Establish the mapping */
//     if ((file = mmap(0, (size_t)buffer.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0)) ==
//         (caddr_t)-1) {
//         printf("mmap failure\n");
//         exit(1);
//     }
//     printf("Original file:\n %s \n", file);
//     *(file) = 'J';
//     printf("Updated file:\n %s \n", file);
//     exit(0);
// }
