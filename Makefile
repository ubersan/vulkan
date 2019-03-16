VULKAN_SDK_PATH = /home/sandro/Downloads/1.1.101.0/x86_64
CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

.PHONY: run build clean release add-release-flags

run: build
	@LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./bin/build

release: build-release
	@LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./bin/build

add-release-flags:
	ADDITIONAL_FLAGS = 3

build: main.cpp
	@mkdir -p bin
	@g++ $(CFLAGS) $(ADDITIONAL_FLAGS) -o bin/build main.cpp $(LDFLAGS)

build-release: main.cpp
	@mkdir -p bin
	@g++ $(CFLAGS) -O4 -DNDEBUG -o bin/build main.cpp $(LDFLAGS)

clean:
	@rm -rf bin/
