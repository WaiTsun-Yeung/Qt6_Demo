set(SOURCES 
    private/colour_models.cpp 
)

add_library(colour_models_lib STATIC ${SOURCES})

target_include_directories(colour_models_lib PUBLIC
    public
)