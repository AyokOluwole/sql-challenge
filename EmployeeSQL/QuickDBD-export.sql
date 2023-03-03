-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [deparments] (
    [dept_no] VARCHAR(5)  NOT NULL ,
    [dept_name] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_deparments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR(4)  NOT NULL 
)

CREATE TABLE [dept_managers] (
    [dept_no] VARCHAR(4)  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title_id] VARCHAR(10)  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR(50)  NOT NULL ,
    [last_name] VARCHAR(50)  NOT NULL ,
    [sex] VARCHAR(1)  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] INT  NOT NULL ,
    [title] VARCHAR(50)  NOT NULL 
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [deparments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [deparments] ([dept_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_dept_no]

ALTER TABLE [dept_managers] WITH CHECK ADD CONSTRAINT [FK_dept_managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_managers] CHECK CONSTRAINT [FK_dept_managers_emp_no]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title_id] FOREIGN KEY([title_id])
REFERENCES [employees] ([emp_title_id])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title_id]

COMMIT TRANSACTION QUICKDBD