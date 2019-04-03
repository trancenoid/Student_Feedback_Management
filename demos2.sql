

create or replace package body assign1 AS
    procedure insert_teacher(f_c Tab_Teacher.fac_code%type, f_n Tab_Teacher.first_name%type, l_n Tab_Teacher.last_name%type, des Tab_Teacher.designation%type, dept Tab_Teacher.dept%type, exitc out varchar2) is
    begin
        insert into Tab_Teacher values(f_c, f_n, l_n, des, dept);
        dbms_output.put_line('Operation was a success');
        exitc := 'Insert Success';
        commit;
    exception
        When value_error then
            exitc := 'Insert failed';
        WHEN others then
            dbms_output.put_line('Error in inserting values');
            exitc := 'Insert failed';

    end;


    procedure insert_student(s_id Tab_Student.enroll_id%type, f_n Tab_Student.first_name%type, ln Tab_Student.last_name%type, deg Tab_Student.degree%type, jy Tab_Student.join_year%type, exitc out varchar2) is
    begin
        insert into Tab_Student values (s_id,f_n,ln,deg,jy);
        dbms_output.put_line('Operation was a sucess');
        exitc := 'Insert Success';
        commit;
    exception
        WHEN others then
            dbms_output.put_line('Error in inserting values');
            exitc := 'Insert Success';
    end;


    procedure insert_course(c_c Tab_Course.course_code%type, c_n Tab_Course.course_name%type, c_s Tab_Course.sessions%type, l_t_p Tab_Course.l_t_p%type) is
    begin
        insert into Tab_Course values(c_c, c_n, c_s, l_t_p);
        dbms_output.put_line('Operation was a sucess');
    exception
        WHEN others then
            dbms_output.put_line('Error in inserting values');
    end;


    procedure update_course(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        ) is
        condition_name varchar2(50);
        sql_statement varchar2(200);
    begin
        case condition
            when 1 then  condition_name:= '<' ;
            when 2 then  condition_name:= '>' ;
            when 3 then  condition_name:= '<=' ;
            when 4 then  condition_name:= '>=';
            when 5 then  condition_name:= '=' ;
            when 6 then  condition_name:= '<>';
            else dbms_output.put_line('Error - Invalid condition symbol');
        end case;
        if(condition>=1 and condition<=6) then
            if(column_to_update = 'course_id') then
                dbms_output.put_line('Primary key . cant be updated');
            else    
                sql_statement := 'UPDATE Tab_Course SET ' || column_to_update || ' = ''' || new_column_value || ''' where '||condition_Column||' '||condition_name||''''||condition_Value||'''';
                EXECUTE IMMEDIATE sql_statement;
                dbms_output.put_line('Operation was a sucess');
                commit;
            end if;
         end if;
    exception
        WHEN others then
            dbms_output.put_line('Error while updating values');
    end;
    
    procedure update_teacher(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        ) is
        condition_name varchar2(50);
        sql_statement varchar2(200);
    begin
        case condition
            when 1 then  condition_name:= '<' ;
            when 2 then  condition_name:= '>' ;
            when 3 then  condition_name:= '<=' ;
            when 4 then  condition_name:= '>=';
            when 5 then  condition_name:= '=' ;
            when 6 then  condition_name:= '<>';
            else dbms_output.put_line('Error - Invalid condition symbol');
        end case;
        if(condition>=1 and condition<=6) then
            if(column_to_update = 'faq_code') then
                dbms_output.put_line('Primary key . cant be updated');
            else    
                sql_statement := 'UPDATE Tab_Teacher SET ' || column_to_update || ' = ''' || new_column_value || ''' where '||condition_Column||' '||condition_name||''''||condition_Value||'''';
                EXECUTE IMMEDIATE sql_statement;
                dbms_output.put_line('Operation was a sucess');
                commit;
            end if;
         end if;
    exception
        WHEN others then
            dbms_output.put_line('Error while updating values');         
    end;
    
    procedure update_student(condition_column varchar2,
        condition number,
        condition_value varchar2,
        column_to_update varchar2,
        new_column_value varchar2
        ) is
        condition_name varchar2(50);
        sql_statement varchar2(200);
    begin
        case condition
            when 1 then  condition_name:= '<' ;
            when 2 then  condition_name:= '>' ;
            when 3 then  condition_name:= '<=' ;
            when 4 then  condition_name:= '>=';
            when 5 then  condition_name:= '=' ;
            when 6 then  condition_name:= '<>';
            else dbms_output.put_line('Error - Invalid condition symbol');
        end case;
        if(condition>=1 and condition<=6) then
            if(column_to_update = 'enroll_id') then
                dbms_output.put_line('Primary key . cant be updated');
            else    
                sql_statement := 'UPDATE Tab_Student SET ' || column_to_update || ' = ''' || new_column_value || ''' where '||condition_Column||' '||condition_name||''''||condition_Value||'''';
                EXECUTE IMMEDIATE sql_statement;
                dbms_output.put_line('Operation was a sucess');
                commit;
            end if;
         end if;
    exception
        WHEN others then
            dbms_output.put_line('Error while updating values');         
    end;
    

    procedure delete_student(condition_column varchar2,
     condition number,
     condition_value varchar2
     ) is
     condition_name varchar2(50);
     sql_statement varchar2(1000);
     begin
        case condition
                when 1 then condition_name:= '<' ;
                when 2 then condition_name:= '>' ;
                when 3 then condition_name:= '<=' ;
                when 4 then condition_name:= '>=';
                when 5 then condition_name:= '=' ;
                when 6 then condition_name:= '<>';
                else dbms_output.put_line('Error - invalid condition symbol');
            end case;
            if(condition>=1 and condition<=6) then
                    sql_statement := 'Delete from Tab_Student where '||condition_column||' '||condition_name||''''||condition_Value||'''';
                    EXECUTE IMMEDIATE sql_statement;
                    dbms_output.put_line('Operation was a sucess');
                    commit;
             end if;   
     end;   
     
    
    procedure delete_course(condition_column varchar2,
     condition number,
     condition_value varchar2
     ) is
     condition_name varchar2(50);
     sql_statement varchar2(1000);
     begin
        case condition
                when 1 then condition_name:= '<' ;
                when 2 then condition_name:= '>' ;
                when 3 then condition_name:= '<=' ;
                when 4 then condition_name:= '>=';
                when 5 then condition_name:= '=' ;
                when 6 then condition_name:= '<>';
                else dbms_output.put_line('Error - invalid condition symbol');
            end case;
            if(condition>=1 and condition<=6) then
                    sql_statement := 'Delete from Tab_Course where '||condition_Column||' '||condition_name||''''||condition_Value||'''';
                    EXECUTE IMMEDIATE sql_statement;
                    dbms_output.put_line('Operation was a sucess');
             end if;   
     end;
     
     
    procedure delete_teacher(condition_column varchar2,
     condition number,
     condition_value varchar2
     ) is
     condition_name varchar2(50);
     sql_statement varchar2(1000);
     begin
        case condition
                when 1 then condition_name:= '<' ;
                when 2 then condition_name:= '>' ;
                when 3 then condition_name:= '<=' ;
                when 4 then condition_name:= '>=';
                when 5 then condition_name:= '=' ;
                when 6 then condition_name:= '<>';
                else dbms_output.put_line('Error - invalid condition symbol');
            end case;
            if(condition>=1 and condition<=6) then
                    sql_statement := 'Delete from Tab_Teacher where '||condition_Column||' '||condition_name||''''||condition_Value||'''';
                    EXECUTE IMMEDIATE sql_statement;
                    dbms_output.put_line('Operation was a sucess');
             end if;   
     end;
     
     procedure feedback_summary (
        fc varchar,
        cc varchar,
        result out varchar

    ) is
        cursor feedback_cursor is select * from tab_course_feedback where Tab_Course_feedback.teacher_id = fc and Tab_Course_feedback.course_id = cc;
        single_row Tab_Feedback%rowtype;
        field1_max int;
        field1_min int;
        field1_avg int;
        field2_max int;
        field2_min int;
        field2_avg int;
        field3_max int;
        field3_min int;
        field3_avg int;
        c varchar2(50);
        
        begin
            select max(field1), min(field1), avg(field1), max(field2), min(field2), avg(field2), max(field3), min(field3), avg(field3)
            into field1_max, field1_min, field1_avg, field2_max, field2_min, field2_avg, field3_max, field3_min, field3_avg from Tab_Feedback
            inner join Tab_Course_feedback on Tab_Feedback.feedback_id = Tab_Course_feedback.feedback_id
            where  Tab_Course_feedback.teacher_id = fc and  Tab_Course_feedback.course_id = cc;
            result := 'Field 1 Statistics ' || 'Max : ' || field1_max || ' Min : ' || field1_min || ' Avg : ' || field1_avg || ' ' || 'Field 2 Statistics '|| 'Max : ' || field2_max || ' Min : ' || field2_min || ' Avg : ' || field2_avg || ' ' || 'Field 3 Statistics '|| 'Max : ' || field3_max || ' Min : ' || field3_min || ' Avg : ' || field3_avg;
                for i in feedback_cursor
            loop
                select * into single_row from Tab_Feedback where feedback_id = i.feedback_id;
                result :=  result || ' ' || 'Comment : ' || single_row.comment1;
            end loop;
            
            for i in feedback_cursor
            loop
                select * into single_row from Tab_Feedback where feedback_id = i.feedback_id;
                result :=  result || ' ' || 'Comment : ' || single_row.comment2;
            end loop;
        end;
        
        procedure feedback_review (
        fc varchar,
        cc varchar
    ) is
        cursor feedback_cursor is select * from tab_course_feedback where Tab_Course_feedback.teacher_id = fc and Tab_Course_feedback.course_id = cc;
        single_row Tab_Feedback%rowtype;
        field1_max int;
        field1_min int;
        field1_avg int;
        field2_max int;
        field2_min int;
        field2_avg int;
        field3_max int;
        field3_min int;
        field3_avg int;
        
        begin
            select max(field1), min(field1), avg(field1), max(field2), min(field2), avg(field2), max(field3), min(field3), avg(field3)
            into field1_max, field1_min, field1_avg, field2_max, field2_min, field2_avg, field3_max, field3_min, field3_avg from Tab_Feedback
            inner join Tab_Course_feedback on Tab_Feedback.feedback_id = Tab_Course_feedback.feedback_id
            where  Tab_Course_feedback.teacher_id = fc and  Tab_Course_feedback.course_id = cc;
            dbms_output.put_line('Field 1 Statistics');
            dbms_output.put_line('Max : ' || field1_max || ' Min : ' || field1_min || ' Avg : ' || field1_avg);
            dbms_output.put_line('Field 2 Statistics');
            dbms_output.put_line('Max : ' || field2_max || ' Min : ' || field2_min || ' Avg : ' || field2_avg);
            dbms_output.put_line('Field 3 Statistics');
            dbms_output.put_line('Max : ' || field3_max || ' Min : ' || field3_min || ' Avg : ' || field3_avg);
            for i in feedback_cursor
            loop
                select * into single_row from Tab_Feedback where feedback_id = i.feedback_id;
                dbms_output.put_line('Comment : ' || single_row.comment1);
            end loop;
            
            for i in feedback_cursor
            loop
                select * into single_row from Tab_Feedback where feedback_id = i.feedback_id;
                dbms_output.put_line('Comment : ' || single_row.comment2);
            end loop;
        end;
        
    procedure feedback_insert(course_id varchar2,
        fac_code varchar2,
        enroll_id varchar2,
        field1 int,
        field2 int,
        field3 int,
        comment1 varchar2,
        comment2 varchar2
     ) is
     maximum int;
     tes int;
     begin
        select Tab_Course_feedback.Feedback_ID into tes from Tab_Course_feedback where Tab_Course_feedback.Teacher_ID = fac_code and Tab_Course_feedback.Course_ID = course_id and Tab_Course_feedback.Student_ID = enroll_id;
            
        if sql%found then
            dbms_output.put_line('Feedback already exists');
        end if;
        exception 
        when no_data_found then
        select max(feedback_id) into maximum from Tab_Course_feedback; 
        insert into Tab_Feedback values(maximum+1,field1,field2,field3,comment1,comment2);
        insert into Tab_Course_feedback values(fac_code,course_id,enroll_id,maximum+1);
        
        commit; 
     end;
END assign1;
/ 