CC=gcc
CFLAGS=-c -Wall -O3 -march=native
LDFLAGS=-lm -lpthread -O3 -march=native
SOURCES=skyplot.c compute.c culling.c fileio.c math.c memory.c gnuplot_i.c \
	statistics.c visual.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=skyplot

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@
clean:
	rm $(OBJECTS)
	rm $(EXECUTABLE)
cleandat:
	rm /dev/shm/skyplot/*.dat

