project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	
	targetdir ("%{wks.location}/Binaries/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",

		"include/**.h",
	}
	
	includedirs 
	{
		"include"
	}

	defines
    {
        "YAML_CPP_STATIC_DEFINE"
    }
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

		--4244: conversion warnings (like int to float, size_t to int);
		--4267: conversion from size_t to smaller type
		disablewarnings { "4244", "4267" }  

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"
