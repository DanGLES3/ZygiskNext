project(external)

option(LSPLT_BUILD_SHARED "Build LSPLT shared library" OFF)
option(USEASAN "Use Address Sanitizer" ON)

add_subdirectory(lsplt/lsplt/src/main/jni)

set(XDL_SOURCE_FILES
    _xDL/xdl/src/main/cpp/xdl.c
    _xDL/xdl/src/main/cpp/xdl_iterate.c
    _xDL/xdl/src/main/cpp/xdl_linker.c
    _xDL/xdl/src/main/cpp/xdl_lzma.c
    _xDL/xdl/src/main/cpp/xdl_util.c
)

set(SYSTEM_PROPERTIES_SOURCE_FILES
    system_properties/context_node.cpp
    system_properties/contexts_serialized.cpp
    system_properties/contexts_split.cpp
    system_properties/prop_area.cpp
    system_properties/prop_info.cpp
    system_properties/system_properties.cpp
    system_properties/system_property_api.cpp
    system_properties/system_property_set.cpp
    system_properties/property_info_parser.cpp
)

add_library(phmap INTERFACE)
target_include_directories(phmap INTERFACE parallel-hashmap)
target_compile_options(phmap INTERFACE -Wno-unused-value)

add_library(xdl STATIC ${XDL_SOURCE_FILES})
target_include_directories(xdl PUBLIC _xDL/xdl/src/main/cpp/include)

add_library(systemproperties STATIC ${SYSTEM_PROPERTIES_SOURCE_FILES})
target_include_directories(systemproperties PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/system_properties/include)
