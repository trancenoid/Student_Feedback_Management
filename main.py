import cx_Oracle
import os

#connectString = os.getenv('db_connect')

con = cx_Oracle.connect('shivansh', '1234', cx_Oracle.makedsn('localhost', 1521, 'DBMS1'))


cur = con.cursor()
output = cur.var(str)
exitc = 0
print('DBMS Connected successfully')
while(exitc == 0):
	print('Enter the choice number:')
	print('[1]. INSERT')
	print('[2]. UPDATE')
	print('[3]. DELETE')
	print('[4]. VIEW TABLE')
	print('[5]. FEEDBACK SUMMARY')
	print('[6]. FEEDBACK SUBMIT')
	print('[0]. EXIT')
	iud = int(input())
	if(iud == 1):
		print('Enter the table for which you want to do the insertion in :')
		print('[1]. Tab_Student')
		print('[2]. Tab_Teacher')
		print('[3]. Tab_Course')
		stc = int(input())
		if(stc == 1):
			#student code
			print('Enter values in the format : enroll_id first_name last_name degree join_year')
			SIentry = input().split(' ')
			try :
				cur.callproc('assign1.insert_Student',(SIentry[0],SIentry[1],SIentry[2],SIentry[3],SIentry[4], output))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
			print(output)
			
		elif(stc == 2):
			#teacher code
			print('Enter values in the format : fac_code first_name last_name designation department ')
			TIentry = input().split(' ')
			try :
				cur.callproc('assign1.insert_Teacher',(TIentry[0],TIentry[1],TIentry[2],TIentry[3],TIentry[4], output))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
			print(output)
		elif(stc == 3):
			#cource code
			print('Enter values in the format : Course_code Course_name Session L_T_P')
			CIentry = input().split(' ')
			try:
				cur.callproc('assign1.insert_Course',(CIentry[0],CIentry[1],CIentry[2],CIentry[3], output))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
			print(output)
	elif(iud == 2):
		print('Enter the table for which you want to do the updation :')
		print('[1]. Tab_Student')
		print('[2]. Tab_Teacher')
		print('[3]. Tab_Course')
		stc = int(input())
		if(stc == 1):
			#student code
			print('The columns available to update are enroll_id, first_name, last_name, degree, join_year')
			print('enter the data in following format condition_column condition condition_value column_to_update new_column_value ')
			SUentry = input().split(' ')
			try:
				cur.callproc('assign1.update_Student',(SUentry[0], SUentry[1], SUentry[2], SUentry[3], SUentry[4]))
			except cx_Oracle.DatabaseError as e:
				error,= e.args
				input('Check input') 
				continue
		
			
		elif(stc == 2):
			#teacher code
			print('The columns available to update are fac_code first_name last_name designation department')
			print('condition_column condition condition_value column_to_update new_column_value ')
			SUentry = input().split(' ')
			try:
				cur.callproc('assign1.update_Teacher',(SUentry[0], SUentry[1], SUentry[2], SUentry[3], SUentry[4]))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue

		elif(stc == 3):
			#cource code
			print('The columns available to update are Course_code Course_name Session L_T_P')
			print('condition_column condition condition_value column_to_update new_column_value ')
			SUentry = input().split(' ')
			try:
				cur.callproc('assign1.update_Course',(SUentry[0], SUentry[1], SUentry[2], SUentry[3], SUentry[4]))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
	elif(iud == 3):
		print('Enter the table for which you want to do the deletion :')
		print('[1]. Tab_Student')
		print('[2]. Tab_Teacher')
		print('[3]. Tab_Course')
		stc = int(input())
		if(stc == 1):
			#student code
			print('Enter the enroll_id you want to delete: ')
			print('condition_column condition condition_value ')
			SDentry = input().split(' ')
			try :
				cur.callproc('assign1.delete_Student',(SDentry[0] , SDentry[1], SDentry[2]))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				print(error.message)
			    input('Check input') 

			continue
		elif(stc == 2):
			#teacher code
			print('Enter the fac_code you want to delete: ')
			TDentry = input()
			try : 
				cur.callproc('assign1.delete_Teacher',(TDentry[0]))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
		elif(stc == 3):
			#cource code
			print('The columns available to update are Course_code Course_name Session L_T_P')
			CDentry = input()
			try :
				cur.callproc('assign1.delete_Course',(CDentry[0]))
			except cx_Oracle.DatabaseError as e:
				error, = e.args
				input('Check input') 
				continue
	elif(iud == 4):
		print('Enter the table which you want to see :')
		print('[1]. Tab_Student')
		print('[2]. Tab_Teacher')
		print('[3]. Tab_Course')
		stc = int(input())
		if(stc == 1):
			#student code
			cur.execute(""" select * from tab_student """)
			print('enroll_id, first_name, last_name, degree, join_year')
			for a in cur.fetchall():
				print(a)
		elif(stc == 2):
			#teacher code
			cur.execute(""" select * from tab_teacher """)
			print('fac_code, first_name, last_name, designation, department')
			for a in cur.fetchall():
				print(a)
		elif(stc == 3):
			#cource code
			cur.execute(""" select * from tab_course """)
			print('Course_code, Course_name, Session, L_T_P')
			for a in cur.fetchall():
				print(a)
	elif(iud == 5):
		print('Enter Fac_code and Course_code')
		fc, cc = input().split(' ')
		output = cur.var(str)
		cur.callproc('assign1.feedback_summary',(fc, cc, output))
		print(output)
	elif(iud == 6):
		print('course_id fac_code enroll_id field1 field2 field3 comment1 comment2 ')
		fc = input().split(' ')
		cur.callproc('assign1.feedback_insert',(fc[0], fc[1],fc[2],fc[3],fc[4],fc[5],fc[6],fc[7]))
	elif(iud == 0):
		exitc = 1
		
	#cur.callproc('assign1.INSERTSTUDENT',('shivansh12', output))
	#print(output.getvalue())
cur.close()
con.close()