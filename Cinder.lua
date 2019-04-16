-- scaffold geniefile for Cinder

Cinder_script = path.getabsolute(path.getdirectory(_SCRIPT))
Cinder_root = path.join(Cinder_script, "Cinder")

Cinder_includedirs = {
	path.join(Cinder_script, "config"),
	Cinder_root,
}

Cinder_libdirs = {}
Cinder_links = {}
Cinder_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { Cinder_includedirs }
	end,

	_add_defines = function()
		defines { Cinder_defines }
	end,

	_add_libdirs = function()
		libdirs { Cinder_libdirs }
	end,

	_add_external_links = function()
		links { Cinder_links }
	end,

	_add_self_links = function()
		links { "Cinder" }
	end,

	_create_projects = function()

project "Cinder"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		Cinder_includedirs,
	}

	defines {}

	files {
		path.join(Cinder_script, "config", "**.h"),
		path.join(Cinder_root, "**.h"),
		path.join(Cinder_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
