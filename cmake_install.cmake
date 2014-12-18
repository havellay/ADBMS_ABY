# Install script for directory: /home/hari/ADBMS_PROJECT/ADBMS_ABY

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local/mysql")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE OPTIONAL FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/Docs/mysql.info")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE OPTIONAL FILES
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/COPYING"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/LICENSE.mysql"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/README")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE FILES
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/Docs/INFO_SRC"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/Docs/INFO_BIN"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/Docs/INSTALL-BINARY")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE DIRECTORY FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/Docs/" REGEX "/INSTALL\\-BINARY$" EXCLUDE REGEX "/Makefile\\.[^/]*$" EXCLUDE REGEX "/glibc[^/]*$" EXCLUDE REGEX "/linuxthreads\\.txt$" EXCLUDE REGEX "/myisam\\.txt$" EXCLUDE REGEX "/mysql\\.info$" EXCLUDE REGEX "/sp\\-imp\\-spec\\.txt$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/zlib/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/extra/yassl/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/extra/yassl/taocrypt/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/cmd-line-utils/libedit/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/libevent/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/aby/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/myisam/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/perfschema/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/archive/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/example/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/federated/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/myisammrg/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/blackhole/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/heap/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/innobase/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/ndb/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/storage/csv/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/fulltext/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/password_validation/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/audit_null/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/innodb_memcached/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/semisync/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/daemon_example/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/plugin/auth/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/dbug/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/strings/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/vio/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/regex/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/mysys/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/mysys_ssl/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/libmysql/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/unittest/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/unittest/examples/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/unittest/mytap/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/unittest/mytap/t/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/unittest/gunit/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/extra/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/client/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql/share/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/libservices/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/man/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/tests/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/libmysqld/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/libmysqld/examples/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/scripts/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/mysql-test/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/mysql-test/lib/My/SafeProcess/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/support-files/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/sql-bench/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/packaging/rpm-oel/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/packaging/rpm-fedora/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/packaging/WiX/cmake_install.cmake")
  INCLUDE("/home/hari/ADBMS_PROJECT/ADBMS_ABY/packaging/solaris/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/hari/ADBMS_PROJECT/ADBMS_ABY/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/hari/ADBMS_PROJECT/ADBMS_ABY/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
