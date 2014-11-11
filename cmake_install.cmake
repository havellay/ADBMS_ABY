# Install script for directory: /home/adbms/mysqlsrc/mysql-5.6.21

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE OPTIONAL FILES "/home/adbms/mysqlsrc/mysql-5.6.21/Docs/mysql.info")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE OPTIONAL FILES
    "/home/adbms/mysqlsrc/mysql-5.6.21/COPYING"
    "/home/adbms/mysqlsrc/mysql-5.6.21/LICENSE.mysql"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/adbms/mysqlsrc/mysql-5.6.21/README")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE FILES
    "/home/adbms/mysqlsrc/mysql-5.6.21/Docs/INFO_SRC"
    "/home/adbms/mysqlsrc/mysql-5.6.21/Docs/INFO_BIN"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/adbms/mysqlsrc/mysql-5.6.21/Docs/INSTALL-BINARY")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE DIRECTORY FILES "/home/adbms/mysqlsrc/mysql-5.6.21/Docs/" REGEX "/INSTALL\\-BINARY$" EXCLUDE REGEX "/Makefile\\.[^/]*$" EXCLUDE REGEX "/glibc[^/]*$" EXCLUDE REGEX "/linuxthreads\\.txt$" EXCLUDE REGEX "/myisam\\.txt$" EXCLUDE REGEX "/mysql\\.info$" EXCLUDE REGEX "/sp\\-imp\\-spec\\.txt$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/zlib/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/extra/yassl/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/extra/yassl/taocrypt/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/cmd-line-utils/libedit/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/libevent/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/archive/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/blackhole/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/example/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/csv/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/ndb/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/myisammrg/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/perfschema/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/innobase/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/aby/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/federated/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/myisam/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/storage/heap/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/fulltext/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/semisync/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/innodb_memcached/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/audit_null/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/password_validation/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/daemon_example/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/plugin/auth/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/include/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/dbug/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/strings/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/vio/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/regex/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/mysys/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/mysys_ssl/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/libmysql/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/unittest/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/unittest/examples/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/unittest/mytap/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/unittest/mytap/t/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/unittest/gunit/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/extra/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/client/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/sql/share/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/libservices/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/man/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/tests/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/sql/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/libmysqld/examples/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/scripts/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/mysql-test/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/mysql-test/lib/My/SafeProcess/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/support-files/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/sql-bench/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/packaging/rpm-oel/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/packaging/rpm-fedora/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/packaging/WiX/cmake_install.cmake")
  INCLUDE("/home/adbms/mysqlsrc/mysql-5.6.21/packaging/solaris/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/adbms/mysqlsrc/mysql-5.6.21/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/adbms/mysqlsrc/mysql-5.6.21/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
