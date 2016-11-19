import multiprocessing


def foo():
	print("I'm running on CPU #%s" % multiprocessing.current_process().name)
	pass


print(multiprocessing.cpu_count())
for i in range(multiprocessing.cpu_count()):
    mp = multiprocessing.Process(target=foo, name=i).start()


