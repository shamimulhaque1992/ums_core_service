/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "academic_semester" (
    "id" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "startMonth" TEXT NOT NULL,
    "endMonth" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "academic_semester_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "academic_faculty" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "academic_faculty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "academic_department" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academicFacultyId" TEXT NOT NULL,

    CONSTRAINT "academic_department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNo" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academicSemesterId" TEXT NOT NULL,
    "academicDepartmentId" TEXT NOT NULL,
    "academicFacultyId" TEXT NOT NULL,

    CONSTRAINT "students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "faculties" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "middleName" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNo" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "bloodGroup" TEXT NOT NULL,
    "designation" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "academicDepartmentId" TEXT NOT NULL,
    "academicFacultyId" TEXT NOT NULL,

    CONSTRAINT "faculties_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "academic_department" ADD CONSTRAINT "academic_department_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "academic_faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_academicSemesterId_fkey" FOREIGN KEY ("academicSemesterId") REFERENCES "academic_semester"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "academic_department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "academic_faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "faculties" ADD CONSTRAINT "faculties_academicDepartmentId_fkey" FOREIGN KEY ("academicDepartmentId") REFERENCES "academic_department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "faculties" ADD CONSTRAINT "faculties_academicFacultyId_fkey" FOREIGN KEY ("academicFacultyId") REFERENCES "academic_faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
