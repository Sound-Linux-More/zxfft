PROJECT = zx
PROGFFT = $(PROJECT)-test-fft
PROGXCORR = $(PROJECT)-test-xcorr
PROGS = $(PROGFFT) $(PROGXCORR)
SRCS = src
SRC_FFT = $(SRCS)/main.c $(SRCS)/zx_fft.c $(SRCS)/zx_math.c
SRC_XCORR = $(SRCS)/xcorr.c $(SRCS)/zx_fft.c $(SRCS)/zx_math.c
CC = gcc
CFLAGS = -Wall
LDFLAGS = -lm -s
RM = rm -f

all: $(PROGS)

$(PROGFFT): $(SRC_FFT)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(PROGXCORR): $(SRC_XCORR)
	$(CC) $(CFLAGS)  $^ -o $@ $(LDFLAGS)

.PHONY: clean run
run:
	./$(PROGFFT) > $(PROGFFT).txt
	./$(PROGXCORR) > $(PROGXCORR).txt
clean:
	$(RM) $(PROGFFT) $(PROGXCORR) $(PROGFFT).txt $(PROGXCORR).txt
