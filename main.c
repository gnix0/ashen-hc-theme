#include <stddef.h>
#include <stdio.h>
#include <stdint.h>

#define SV_FMT "%.*s"
#define SV_ARG(sv) (int)(sv).count, (sv).data
#define LIMIT 64

typedef struct String_View {
    const char *data;
    size_t count;
} String_View;

enum Status { STATUS_OK, STATUS_EMPTY };

static String_View sv_trim_left(String_View sv)
{
    while (sv.count > 0 && (*sv.data == ' ' || *sv.data == '\t')) {
        sv.data += 1;
        sv.count -= 1;
    }
    return sv;
}

static enum Status print_view(String_View sv, uint32_t limit)
{
    if (sv.count == 0) {
        return STATUS_EMPTY;
    }
    if (sv.count > limit) {
        sv.count = limit;
    }
    printf("view: " SV_FMT "\n", SV_ARG(sv));
    return STATUS_OK;
}

int main(void)
{
    const char text[] = "  Hello, Ashen!";
    String_View sv = {text, sizeof(text) - 1};
    uint32_t limit = LIMIT;
    double scale = 1.5;
    char marker = '\n';

    sv = sv_trim_left(sv);
    enum Status status = print_view(sv, limit);
    printf("status=%d, scale=%.1f, bytes=%zu%c",
           status, scale, sizeof(sv), marker);
    return status == STATUS_OK ? 0 : 1;
}
