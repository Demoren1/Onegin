all : Faust_faust
SRC = src/
OBJ = obj/
##all : mkdir Faust_faust
## make basics

CFLAGS=-D _DEBUG -ggdb3 -std=c++20 -O0 -Wall -Wextra -Weffc++ -Waggressive-loop-optimizations \
-Wc++14-compat -Wmissing-declarations -Wcast-align -Wcast-qual -Wchar-subscripts -Wconditionally-supported \
-Wconversion -Wctor-dtor-privacy -Wempty-body -Wfloat-equal -Wformat-nonliteral -Wformat-security -Wformat-signedness -Wformat=2 -Winline -Wlogical-op \
-Wnon-virtual-dtor -Wopenmp-simd -Woverloaded-virtual -Wpacked -Wpointer-arith -Winit-self -Wredundant-decls -Wshadow -Wsign-conversion -Wsign-promo \
-Wstrict-null-sentinel -Wstrict-overflow=2 -Wsuggest-attribute=noreturn -Wsuggest-final-methods -Wsuggest-final-types -Wsuggest-override -Wswitch-default \
-Wswitch-enum -Wsync-nand -Wundef -Wunreachable-code -Wunused -Wuseless-cast -Wvariadic-macros -Wno-literal-suffix -Wno-missing-field-initializers -Wno-narrowing \
-Wno-old-style-cast -Wno-varargs -Wstack-protector -fcheck-new -fsized-deallocation -fstack-check -fstack-protector -fstrict-overflow -flto-odr-type-merging \
-fno-omit-frame-pointer -fPIE -fsanitize=address,alignment,bool,bounds,enum,float-cast-overflow,float-divide-by-zero,integer-divide-by-zero,leak,nonnull-attribute,null,object-size,return,returns-nonnull-attribute,shift,signed-integer-overflow,undefined,unreachable,vla-bound,vptr \
-pie -Wlarger-than=8192 -Wstack-usage=8192

#objs -> macro
Faust_faust : $(OBJ)main.o $(OBJ)input_output.o $(OBJ)comparators.o $(OBJ)MySort.o 
	@g++ $(CFLAGS)  $(OBJ)main.o $(OBJ)input_output.o $(OBJ)comparators.o $(OBJ)MySort.o -o Faust_faust

$(OBJ)input_output.o : $(SRC)input_output.cpp
	@g++ $(CFLAGS) $(SRC)input_output.cpp -c -o $(OBJ)input_output.o

$(OBJ)main.o : $(SRC)main.cpp
	@g++ $(CFLAGS) $(SRC)main.cpp -c -o $(OBJ)main.o 

$(OBJ)comparators.o : $(SRC)comparators.cpp
	@g++ $(CFLAGS) $(SRC)comparators.cpp -c -o $(OBJ)comparators.o

$(OBJ)MySort.o : $(SRC)MySort.cpp
	@g++ $(CFLAGS) $(SRC)MySort.cpp -c -o $(OBJ)MySort.o

# g++ $(CXX)
# $^ $@ g++

##mkdir:
#	mkdir -p obj 

clean:
	rm $(OBJ)*.o *.save Faust_faust

