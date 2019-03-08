VULKAN_SDK_PATH = /home/sandro/Downloads/1.1.101.0/x86_64

CFLAGS = -std=c++17 -I$(VULKAN_SDK_PATH)/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanBuild: main.cpp
	g++ $(CFLAGS) -o VulkanBuild main.cpp $(LDFLAGS)

.PHONY: build clean

build: VulkanBuild
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./VulkanBuild

clean:
	rm -f VulkanBuild