import subprocess

def output():
	proc = subprocess.Popen(
		[
			"./db_converter.py", 
			"tests/fixtures/mysqldump_output.sql", 
			"-"
		],
		stdout=subprocess.PIPE
	)
	out = proc.communicate()[0]
	print out
	return out

def test_varchar_sizes_are_normal():
    assert '"path" varchar(1024) NOT NULL,' in output()

def test_non_primary_and_non_unique_indexes_are_kept():
    assert 'CREATE INDEX index_hits_on_mapping_id ON hits (mapping_id);' in output()

def test_defaults_are_kept_via_typecast():
    _output = output()
    assert "\"global_redirect_append_path\" int4 NOT NULL DEFAULT '0'" in _output
    assert "ALTER TABLE \"sites\" ALTER COLUMN \"managed_by_transition\" DROP DEFAULT, "\
           "ALTER COLUMN \"managed_by_transition\" TYPE boolean USING CAST(\"managed_by_transition\" as boolean);" in _output
    assert "-- Defaults --" in _output
    assert "ALTER TABLE \"sites\" ALTER COLUMN \"managed_by_transition\" SET DEFAULT 't';" in _output
