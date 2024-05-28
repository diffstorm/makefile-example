# Functions
define find_files
  $(shell find $(1) -type f -name '$(2)')
endef

# Variables
DIR_INC = include
DIR_SRC = src
DIR_BUILD = build
INC_C = $(call find_files,$(DIR_INC),*.h)
INC_CPP = $(call find_files,$(DIR_INC),*.hpp)
SRC_C = $(call find_files,$(DIR_SRC),*.c)
SRC_CPP = $(call find_files,$(DIR_SRC),*.cpp)
OBJ_C = $(SRC_C:$(DIR_SRC)/%.c=$(DIR_BUILD)/%.o)
OBJ_CPP = $(SRC_CPP:$(DIR_SRC)/%.cpp=$(DIR_BUILD)/%.o)
TARGET = bin/project

# Flags
CC = gcc
CXX = g++
CFLAGS = -I$(DIR_INC) -O1 -Wall
CXXFLAGS = -I$(DIR_INC) -O1 -Wall
LDFLAGS = -lm

# Rules
all: $(TARGET)

$(TARGET): $(OBJ_C) $(OBJ_CPP)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJ_C) $(OBJ_CPP) $(LDFLAGS)

$(DIR_BUILD)/%.o: $(DIR_SRC)/%.c | $(DIR_BUILD)/%.d
	$(CC) $(CFLAGS) -c $< -o $@

$(DIR_BUILD)/%.o: $(DIR_SRC)/%.cpp | $(DIR_BUILD)/%.d
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(DIR_BUILD)/%.d:
	mkdir -p $(dir $@)

run: all
	@./$(TARGET)

clean:
	$(RM) -r $(DIR_BUILD) $(TARGET)

.PHONY: all clean run