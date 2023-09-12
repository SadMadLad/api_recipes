-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "dob" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nationality" TEXT NOT NULL,
    "programming_language" TEXT NOT NULL DEFAULT 'javascript/express'
);
