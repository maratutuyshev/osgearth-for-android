IF(NOT EXISTS "D:/TDDOWNLOAD/gwaldron-osgearth-osgearth-2.1.1-646-g7bac0cc/gwaldron-osgearth-7bac0cc/build/install_manifest.txt")
  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"D:/TDDOWNLOAD/gwaldron-osgearth-osgearth-2.1.1-646-g7bac0cc/gwaldron-osgearth-7bac0cc/build/install_manifest.txt\"")
ENDIF(NOT EXISTS "D:/TDDOWNLOAD/gwaldron-osgearth-osgearth-2.1.1-646-g7bac0cc/gwaldron-osgearth-7bac0cc/build/install_manifest.txt")

FILE(READ "D:/TDDOWNLOAD/gwaldron-osgearth-osgearth-2.1.1-646-g7bac0cc/gwaldron-osgearth-7bac0cc/build/install_manifest.txt" files)
STRING(REGEX REPLACE "\n" ";" files "${files}")
FOREACH(file ${files})
  MESSAGE(STATUS "Uninstalling \"${file}\"")
  IF(EXISTS "${file}")
    EXEC_PROGRAM(
      "D:/Program Files/CMake 2.8/bin/cmake.exe" ARGS "-E remove \"${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    IF("${rm_retval}" STREQUAL 0)
    ELSE("${rm_retval}" STREQUAL 0)
      MESSAGE(FATAL_ERROR "Problem when removing \"${file}\"")
    ENDIF("${rm_retval}" STREQUAL 0)
  ELSE(EXISTS "${file}")
    MESSAGE(STATUS "File \"${file}\" does not exist.")
  ENDIF(EXISTS "${file}")
ENDFOREACH(file)
