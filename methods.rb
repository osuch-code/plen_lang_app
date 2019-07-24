#Methods - talk to the database
def startup
@conn = PG.connect(dbname: 'plendb', user: 'louise', password: 'tidalfire')
end

def category(cate)
    startup()
    @rows = @conn.exec_params('select * from plentable where plencat = $1', ["#{cate}"])
	return @rows 
end

def detail(det)
	startup()
    @rows = @conn.exec_params('select * from plentable where enword = $1', ["#{det}"])
	return @rows 
end