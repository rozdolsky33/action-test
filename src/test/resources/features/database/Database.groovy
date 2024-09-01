package features.database

databases = [
    'h2': [
        driver  : "org.h2.Driver",
        url     : "jdbc:h2:mem:test;DB_CLOSE_DELAY=-1", // jdbc:h2:~/test
        user    : 'sa',
        password: ''
    ],

    'sqlite': [
        driver  : "org.sqlite.JDBC",
        url     : "jdbc:sqlite::memory:",
        user    : 'sa',
        password: ''
    ],
]

// TODO: add named queries
