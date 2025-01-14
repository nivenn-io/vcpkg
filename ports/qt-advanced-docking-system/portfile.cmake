vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO githubuser0xFFFF/Qt-Advanced-Docking-System
    REF d5fefaa35fb53e299b7f39b0d8f541954c710d94 #v3.8.2
    SHA512 fcafee34d4d5365b3677c648e0d9a1ea8afd5463ca682ae19b10661490aca44d4f010ba768ed9c639b8ada10106be7aff336c2b7b42f10dc12db6b51988b4e22 
    HEAD_REF master
    PATCHES
        config_changes.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS 
        -DBUILD_EXAMPLES=OFF
        -DADS_VERSION=3.8.2
)

vcpkg_cmake_install()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
file(INSTALL ${SOURCE_PATH}/gnu-lgpl-v2.1.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/license)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
vcpkg_cmake_config_fixup(PACKAGE_NAME qtadvanceddocking CONFIG_PATH lib/cmake/qtadvanceddocking)
