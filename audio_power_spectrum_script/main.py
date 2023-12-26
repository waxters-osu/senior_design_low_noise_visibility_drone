import numpy as np
import matplotlib.pyplot as plt
import sounddevice as sd
import scipy

# Capture a recording
duration = 1  # seconds
frequency_sample = 44100  # std sample rate of 44100 Hz
channels_count = 1  # only care about 1 channel for this
N_samples = duration * frequency_sample
T_sample = 1.0 / frequency_sample

# print("Recording is starting...")
# recording_1 = sd.rec(
#     int(duration * frequency_sample), samplerate=frequency_sample, channels=channels_count, dtype="float64"
# )
# sd.wait()  # wait for recording to finish
#
# # Play the audio
# print("Audio is playing...")
# sd.play(recording_1, frequency_sample)
# sd.wait()

x = np.linspace()
y = * np.cos(2*np.pi*69*np.arange(N_samples))

# Graph the frequency response
y = scipy.fft.fft(recording_1)
freq = scipy.fft.fftfreq(len(y))#[:N_samples//2]
freq = scipy.fft.fftshift(freq)
plt.figure()
# plt.plot(normalized_freq[0:len(normalized_freq)//2], abs(y)[0:len(y)//2])
def SliceIt(thing):
    return thing#[0:len(thing)//2]
plt.plot(SliceIt(freq), abs(SliceIt(y)))
plt.show()
