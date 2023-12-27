import numpy as np
import matplotlib.pyplot as plt
import sounddevice as sd
import scipy.signal as signal

# Audio Capture Constants
audio_duration_s = 3  # seconds
audio_sample_freq_hz = 44100  # std sample rate of 44100 Hz
audio_channel_count = 1  # only care about 1 channel for this
audio_sample_count = audio_duration_s * audio_sample_freq_hz
audio_sample_period_s = 1.0 / audio_sample_freq_hz

def CaptureRecording():
    print("Recording is starting...")
    recording = sd.rec(
        int(audio_duration_s * audio_sample_freq_hz),
        samplerate=audio_sample_freq_hz,
        channels=audio_channel_count,
        # dtype="float64",
    )
    sd.wait()  # wait for recording to finish
    return recording

def PlayRecording(recording):
    print("Audio is playing...")
    sd.play(recording, audio_sample_freq_hz)
    sd.wait()

def EstimatePowerSpectralDensity(recording):
    # Estimate the Power Spectral Density (PSD) of the recorded audio--note that the
    # estimate is proportional to the real PSD since the microphone's sensitivity is
    # unknown.
    recording_channel_1 = recording[:,0]
    f, Pxx_den = signal.welch(recording_channel_1, audio_sample_freq_hz)
    plt.semilogy(f, Pxx_den)
    plt.xlabel("frequency [Hz]")
    plt.ylabel("**proportional** PSD [W/Hz]")
    plt.show()

if __name__ == "__main__":
    recording = CaptureRecording()
    PlayRecording(recording)
    EstimatePowerSpectralDensity(recording)
