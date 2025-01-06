TEMPLATE = subdirs

CONFIG *= ordered

isEqual( QT_MAJOR_VERSION, 4 ) : \
    SUBDIRS *= \
        $${PWD}/project/qmake/features/pro/.qmake.qt4.pro \

SUBDIRS *= \
    $${PWD}/project/qmake/features/pro/.depends.cache.pro \
    $${PWD}/project/qmake/features/pro/features.pro \

SUBDIRS *= \
    $${PWD}/project/qmake/3rdparty.pro \
    $${PWD}/project/qmake/module.pro \
    $${PWD}/project/qmake/benchmark.pro \
    $${PWD}/project/qmake/example.pro \
    $${PWD}/project/qmake/test.pro \

OTHER_FILES *= \
    $${PWD}/.qmake.conf \
    $$files( $${PWD}/project/qmake/features/*.prf ) \
