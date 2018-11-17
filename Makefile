CC     = g++
SRCDIR = src
OBJDIR = .objs
SRCS   = $(wildcard $(SRCDIR)/*.cpp)
OBJS   = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRCS))
TARGET = prog

.PHONY: all clean test

all: $(TARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CC) -c -o $@ $<

$(OBJDIR):
	@mkdir -p $@

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

clean:
	$(RM) -rf $(OBJDIR)
	$(RM) -rf $(TARGET)

test:
	./$(TARGET)2
