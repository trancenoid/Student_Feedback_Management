create or replace package assign1 is  
	procedure insert_teacher(f_c Tab_Teacher.fac_code%type, f_n Tab_Teacher.first_name%type, l_n Tab_Teacher.last_name%type, des Tab_Teacher.designation%type, dept Tab_Teacher.dept%type, exitc out varchar2);
	procedure insert_student(s_id Tab_Student.enroll_id%type, f_n Tab_Student.first_name%type, ln Tab_Student.last_name%type, deg Tab_Student.degree%type, jy Tab_Student.join_year%type, exitc out varchar2);
	procedure insert_course(c_c Tab_Course.course_code%type, c_n Tab_Course.course_name%type, c_s Tab_Course.sessions%type, l_t_p Tab_Course.l_t_p%type);
	procedure update_course(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        );
	procedure update_teacher(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        );

	procedure update_student(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        );
	procedure delete_student(condition_column varchar2,
     condition number,
     condition_value varchar2
     );
	procedure delete_course(condition_column varchar2,
     condition number,
     condition_value varchar2
     );

	procedure delete_teacher(condition_column varchar2,
     condition number,
     condition_value varchar2
     );
	procedure feedback_summary (
        fc varchar,
        cc varchar,
        result out varchar
    );
    procedure feedback_review (
        fc varchar,
        cc varchar
    );
    procedure feedback_insert(course_id varchar2,
        fac_code varchar2,
        enroll_id varchar2,
        field1 int,
        field2 int,
        field3 int,
        comment1 varchar2,
        comment2 varchar2
     );
    end assign1;
    /