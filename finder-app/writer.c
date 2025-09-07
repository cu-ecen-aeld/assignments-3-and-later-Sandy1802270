#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    openlog(NULL, 0, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Invalid number of arguments: expected 2, got %d", argc - 1);
        closelog();
        return 1;
    }

    FILE *fp = fopen(argv[1], "w");

    if (!fp)
    {
        syslog(LOG_ERR, "Failed to open the file");
        closelog();
        return 1;
    }

    if (fprintf(fp, "%s", argv[2]) < 0)
    {
        syslog(LOG_ERR, "Failed to write to the file");
        fclose(fp);
        closelog();
        return 1;
    }

    fclose(fp);
    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
    closelog();

    return 0;
}
