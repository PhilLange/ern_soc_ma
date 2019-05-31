import sys
import glob
import mne

from mne import io
import os
import pandas as pd

data_path = "/Users/philipplange/Desktop/DataMa/eeg/bdf/"

fname = data_path + '1005_ern_soc.bdf'

exclude = ["EXG3", "EXG4",
           "EXG4", "EXG5",
           "EXG5", "EXG6",
           "EXG7", "EXG8"]


montage = io.

raw = io.read_raw_bdf(fname,
                      preload=True,
                      exclude=exclude)
sfreq = raw.info['sfreq']

raw.set_eeg_reference(['Cz'], projection=False)

# Give the sample rate
print('sample rate:', raw.info['sfreq'], 'Hz')

# Give the size of the data matrix
print('%s channels x %s samples' % (raw.info['nchan'], len(raw.times)))
# high pass filter
raw.filter(0.1, 50., n_jobs=1, fir_design='firwin')
#raw.set_annotations(mne.Annotations([1], [10], 'BAD'))

raw.plot(n_channels=73, scalings=dict(eeg=50e-6))

events = mne.find_events(raw,
                         stim_channel='Status',
                         output='onset',
                         min_duration=0.002)
print(events)
mne.write_events("raw-eve.txt", events)

# --- 5) GET EVENTS REPRESENTING START AND END OF BLOCK ----
# # Latency of starts and end markers
starts = events[events[:, 2] == 65663, ]
ends = events[events[:, 2] == 245, ]
print('There are', len(starts), 'starts and', len(ends), 'ends.')

# Latency of target events
evs = events[(events[:, 2] >= 70) & (events[:, 2] <= 75),]
latencies = events[(events[:, 2] >= 70) & (events[:, 2] <= 75), 0]

# --- 6) SAVE START AND END OF EXP. BLOCKS -----------------
    # If 1248 events found, i.e., 48 practice + 3 x 400 for exp. conditions (solo, cooperation,
    # and competition). Then keep data from experimental conditions.
    if len(latencies) == 1248:
        # Save start and end latencies of blocks (+/- 2 secs).
        # Solo condition
        b1s = (latencies[48] / sfreq) - 2
        b1e = (latencies[447] / sfreq) + 2
        # First exp. condition
        b2s = (latencies[448] / sfreq) - 2
        b2e = (latencies[847] / sfreq) + 2
        # Second exp. condition
        b3s = (latencies[848] / sfreq) - 2
        b3e = (latencies[1247] / sfreq) + 2
        # Print summary
        print('Got', len(latencies), 'event latencies.')
    else:
        # If trials less than 1248 --> something is wrong.
        sys.exit('ERROR, number of trials not 1248; script stop.')

# Print start and end of task blocks and duration.
print('Solo block from', round(b1s, 3), 'to', round(b1e, 3),
      '/   Block length:',
      round(b1e - b1s, 3), 'sec.')
print('First exp. condition from', round(b2s, 3), 'to', round(b2e, 3),
      '/   Block length:',
      round(b2e - b2s, 3), 'sec.')
print('Second exp. condition from', round(b3s, 3), 'to', round(b3e, 3),
      '/   Block length:',
      round(b3e - b3s, 3), 'sec.')

# --- 7) EXTRACT BLOCK DATA --------------------------------
# Block 1
raw_bl1 = raw.copy().crop(tmin=b1s, tmax=b1e)
# Block 2
raw_bl2 = raw.copy().crop(tmin=b2s, tmax=b2e)
# Block 3
raw_bl3 = raw.copy().crop(tmin=b3s, tmax=b3e)

# Concatenate extracted blocks
    raw_blocks = mne.concatenate_raws([raw_bl1, raw_bl2, raw_bl3])

    # Find events in the blocks data set
    evs_blocks = mne.find_events(raw_blocks,
                                 stim_channel='Status',
                                 output='onset',
                                 min_duration=0.002)

    # Number of events in blocks data set
    print(len(evs_blocks[(evs_blocks[:, 2] >= 70) &
                         (evs_blocks[:, 2] <= 75), 0]), 'events found.')


raw_blocks.plot(n_channels=73, scalings=dict(eeg=50e-6), events=events)
