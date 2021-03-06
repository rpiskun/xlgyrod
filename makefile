# if CROSS_COMPILE is not defined - x86_64 gcc will be used
CC=$(CROSS_COMPILE)gcc
CFLAGS=-g -O0 -std=gnu99 -lpthread
DEPS = crc16.h main.h xlgyro_data_processor.h xlgyro_server.h \
       xlgyro_reader.h xlgyro_options.h
OBJ = crc16.o main.o xlgyro_data_processor.o xlgyro_server.o \
      xlgyro_reader.o xlgyro_options.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

xlgyrod: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o