class Grade < ActiveHash::Base
  self.data = [
    {code: 'ELEMENTARY_1', name: '小１', next_grade_code: 'ELEMENTARY_2'},
    {code: 'ELEMENTARY_2', name: '小２', next_grade_code: 'ELEMENTARY_3'},
    {code: 'ELEMENTARY_3', name: '小３', next_grade_code: 'ELEMENTARY_4'},
    {code: 'ELEMENTARY_4', name: '小４', next_grade_code: 'ELEMENTARY_5'},
    {code: 'ELEMENTARY_5', name: '小５', next_grade_code: 'ELEMENTARY_6'},
    {code: 'ELEMENTARY_6', name: '小６', next_grade_code: 'JUNIOR_HIGH_1'},
    {code: 'JUNIOR_HIGH_1', name: '中１', next_grade_code: 'JUNIOR_HIGH_2'},
    {code: 'JUNIOR_HIGH_2', name: '中２', next_grade_code: 'JUNIOR_HIGH_3'},
    {code: 'JUNIOR_HIGH_3', name: '中３', next_grade_code: 'HIGH_1'},
    {code: 'HIGH_1', name: '高１', next_grade_code: 'HIGH_2'},
    {code: 'HIGH_2', name: '高２', next_grade_code: 'HIGH_3'},
    {code: 'HIGH_3', name: '高３', next_grade_code: 'GRADUATED'},
    {code: 'GRADUATED', name: '卒業生', next_grade_code: 'GRADUATED'}
  ]
end
