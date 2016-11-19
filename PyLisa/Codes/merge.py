import numpy as np 
import scipy.io

infile="./Data/plo"
end=".npy"

A=np.zeros((730,730))
for i in range(71):
	ini=infile+str(i)+end
	A[:,i*10:i*10+10]=np.load(ini)


scipy.io.savemat('./Data/Phase_plot_two.mat', mdict={'phase_plot': A})

"""import matplotlib.pyplot as plt


fig = plt.figure()

ax = fig.add_subplot(111)
ax.set_title('colorMap')
plt.imshow(A)
ax.set_aspect('equal')

cax = fig.add_axes([0.12, 0.1, 0.78, 0.8])
cax.get_xaxis().set_visible(False)
cax.get_yaxis().set_visible(False)
cax.patch.set_alpha(0)
cax.set_frame_on(False)
plt.colorbar(orientation='vertical')
plt.show()"""