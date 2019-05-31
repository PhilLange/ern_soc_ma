import glob
import os
import mne
from mne import io
from mne.preprocessing import ICA

ica_path = "/Users/philipplange/Desktop/DataMa/eeg/ica"
summary_path = "/Users/philipplange/Desktop/DataMa/eeg"
# --- 1) Set up paths and file names -----------------------
filepath, filename = os.path.split(fname)
filename, ext = os.path.splitext(filename)
print('Ready for ' + filename)
# --- 2) READ IN THE DATA --------

# ICA parameters
n_components = 25
method = 'fastica'
# decim = None
reject = dict(eeg=4e-4)


# Pick electrodes to use
picks = mne.pick_types(raw.info,
                           meg=False,
                           eeg=True,
                           eog=False,
                           stim=False)

# ica parameters
ica = ICA(n_components=n_components,
          method=method)

#Fit ICA

ica.fit(raw_blocks.copy().filter(1, 50),
        picks=picks,
        reject=reject)

ica.save(ica_path + filename.split('-')[0] + '-ica.fif')

# Plot components
ica_fig = ica.plot_components(picks=range(0, 25), show=False)
ica_fig.savefig(summary_path + filename.split('-')[0] + '_ica.pdf')
