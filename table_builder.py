
"""This script reads the working directory and a file containing grade
information. It combines the grade information with the text of the
essays in the directory to create a dataframe where each row corresponds
to a paper by a particular student and includes information about the
student's section assignment and grade. It also extracts information from
the grade field to create a binary columns that represent whether or not
the paper was assigned a particular grade category.

The script returns a pickled version of this dataframe."""


from os import listdir
from os.path import isdir, join
import pandas as pd
import pickle
from paper_reader import *

INPUT_PATH = '/Users/Tom/Desktop/IntroSoc/data/'

LOOKUP = {'week1': 'M1','week2': 'M2','week3': 'M3','week4': 'M4',
'week5': 'M5','week6': 'M6','week7': 'M7','week8': 'M8','week9': 'M9',
'week10': 'M10','week11': 'M11'}

def get_weeks(INPUT_PATH):
    """Returns a list of weeks where a week exists iff there is a folder
    in the path with respect to that week, e.g. 'week1'.
    """
    weeks = [w for w in listdir(INPUT_PATH) if isdir(join(INPUT_PATH, w))]
    weeks = [x for x in weeks if x.startswith('week')] #additional check
    return weeks

def get_main_grading_table(INPUT_PATH):
    filename = raw_input("Please enter the name of the file \
    containing all grade info: ")
    path = INPUT_PATH+filename
    main_df = pd.read_csv(path)
    main_df = main_df.fillna(value=0) #due to understandarized grading
    main_df.index  = main_df['Username'] #Set net IDs as idx
    return main_df

def get_colname_by_week(main_df, week, LOOKUP):
    """Get the name of the column in the main grade dataframe corresponding
    to a particular week, as denoted in the weeks list"""
    col = [x for x in main_df.columns if x.startswith(LOOKUP[week]+' ')]
    colname = col[0]
    return colname

def get_section_col(main_df):
    """Blackboard names columns dumb stuff. This returns the name of
    the column denoting a student's assigned section."""
    return [x for x in main_df.columns if x.startswith('Section')][0]

def get_week_df(INPUT_PATH, week, students, LOOKUP, main_df):
    """Gets the texts & grades for each student in a given week.
    Returns a dataframe where each row contains a
    student, text, week, grade.
    """
    grade_col = get_colname_by_week(main_df, week, LOOKUP)
    files = get_files(INPUT_PATH, week)
    texts = get_text(INPUT_PATH, week, files, students)
    essays = []
    grades = []
    sections = []
    section_col = get_section_col(main_df)
    for s in students:
        essay = texts[s]

        grade = main_df.loc[s, grade_col]
        if grade == "Needs Grading":
            grade = 66
        else:
        #need to convert float then int as can't
        #directly convert "100.0" into an int!
            grade = int(float(grade))
        essays.append(essay)
        grades.append(grade)
        section = main_df.loc[s, section_col]
        sections.append(section)
    df = pd.DataFrame()
    df['student'] = students
    df['essay'] = essays
    df['week'] = int(week.split('week')[1])
    df['grade'] = grades
    df['section'] = sections
    return df

def get_model_df(INPUT_PATH, weeks,students, LOOKUP, main_df, ):
    """Gets the texts & grades for all past weeks and
    concats them into a single dataframe"""
    model_df = pd.DataFrame()
    dfs = []
    for week in weeks:
        week_df = get_week_df(INPUT_PATH, week, students, LOOKUP, main_df, )
        dfs.append(week_df)
    return pd.concat(dfs)

def binary_grade_representation(df):
    """Takes the final dataframe and adds columns that represent
    a binary outcome for each grade.
    e.g. Column 100 = 1 if grade = 100 and 0 if not."""
    NA = []
    satisfactory = []
    good = []
    excellent = []
    NG = []
    grades = list(df['grade'])
    for g in grades:
        if g == 0:
            NA.append(1)
            satisfactory.append(0)
            good.append(0)
            excellent.append(0)
            NG.append(0)
        elif g == 80:
            NA.append(0)
            satisfactory.append(1)
            good.append(0)
            excellent.append(0)
            NG.append(0)
        elif g == 90:
            NA.append(0)
            satisfactory.append(0)
            good.append(1)
            excellent.append(0)
            NG.append(0)
        elif g == 100:
            NA.append(0)
            satisfactory.append(0)
            good.append(0)
            excellent.append(1)
            NG.append(0)
        elif g == 66: #Needs grading
            NA.append(0)
            satisfactory.append(0)
            good.append(0)
            excellent.append(0)
            NG.append(1)
        else: #If grade is not one of these categories
            NA.append(0)
            satisfactory.append(0)
            good.append(0)
            excellent.append(0)
            NG.append(0)
    df['na'] = NA
    df['satisfactory'] = satisfactory
    df['good'] = good
    df['excellent'] = excellent
    df['needs_grading'] = NG
    return df

if __name__ == '__main__':
    weeks = get_weeks(INPUT_PATH)
    main_df = get_main_grading_table(INPUT_PATH)
    students = list(main_df['Username'])
    df = get_model_df(INPUT_PATH, weeks,students, LOOKUP, main_df)
    name = weeks[-1] + '_model_table.p'
    df.index = df['student'] #setting index to net_id
    df = binary_grade_representation(df)
    pickle.dump( df, open(name, "wb" ) )
