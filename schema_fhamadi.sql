-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/

CREATE TABLE IF NOT EXISTS public.departments
(
    dept_no character(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character(4) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS public.dept_manager
(
    dept_no character(4) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS public.employees
(
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    gender character(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
);

CREATE TABLE IF NOT EXISTS public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE IF NOT EXISTS public.titles
(
    emp_no integer NOT NULL,
    title character varying(50) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date,
    CONSTRAINT titles_pkey PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE IF NOT EXISTS public.newtable1
(
    dept_no character(4) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE IF EXISTS public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
    REFERENCES public.departments (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.titles
    ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no)
    REFERENCES public.employees (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;