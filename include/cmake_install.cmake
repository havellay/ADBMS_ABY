# Install script for directory: /home/hari/ADBMS_PROJECT/ADBMS_ABY/include

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql_com.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql_time.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_list.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_alloc.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/typelib.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql/plugin.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql/plugin_audit.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql/plugin_ftparser.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql/plugin_validate_password.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_dbug.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/m_string.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_sys.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_xml.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql_embed.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_pthread.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/decimal.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/errmsg.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_global.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_net.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_getopt.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/sslopt-longopts.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_dir.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/sslopt-vars.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/sslopt-case.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/sql_common.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/keycache.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/m_ctype.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_attribute.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_compiler.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql_com_server.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_byteorder.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/byte_order_generic.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/byte_order_generic_x86.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/byte_order_generic_x86_64.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/little_endian.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/big_endian.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql_version.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/my_config.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysqld_ername.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysqld_error.h"
    "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/sql_state.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE DIRECTORY FILES "/home/hari/ADBMS_PROJECT/ADBMS_ABY/include/mysql/" REGEX "/[^/]*\\.h$" REGEX "/psi\\_abi[^/]*$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

