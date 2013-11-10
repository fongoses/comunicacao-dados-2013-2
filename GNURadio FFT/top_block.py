#!/usr/bin/env python
##################################################
# Gnuradio Python Flow Graph
# Title: Top Block
# Generated: Tue Sep  3 02:12:04 2013
##################################################

from gnuradio import eng_notation
from gnuradio import gr
from gnuradio import window
from gnuradio.eng_option import eng_option
from gnuradio.gr import firdes
from gnuradio.wxgui import fftsink2
from grc_gnuradio import wxgui as grc_wxgui
from optparse import OptionParser
import wx

class top_block(grc_wxgui.top_block_gui):

	def __init__(self):
		grc_wxgui.top_block_gui.__init__(self, title="Top Block")
		_icon_path = "/usr/share/icons/hicolor/32x32/apps/gnuradio-grc.png"
		self.SetIcon(wx.Icon(_icon_path, wx.BITMAP_TYPE_ANY))

		##################################################
		# Variables
		##################################################
		self.samp_rate = samp_rate = 44000

		##################################################
		# Blocks
		##################################################
		self.wxgui_fftsink2_0 = fftsink2.fft_sink_c(
			self.GetWin(),
			baseband_freq=0,
			y_per_div=10,
			y_divs=10,
			ref_level=0,
			ref_scale=2.0,
			sample_rate=samp_rate,
			fft_size=32,
			fft_rate=15,
			average=False,
			avg_alpha=None,
			title="FFT Plot, with Size 32",
			peak_hold=False,
		)
		self.Add(self.wxgui_fftsink2_0.win)
		self.gr_throttle_0 = gr.throttle(gr.sizeof_gr_complex*1, samp_rate)
		self.gr_file_source_0 = gr.file_source(gr.sizeof_gr_complex*1, "/home/fongoses/Documentos/AULAS/INF01005U/GNURadio/fm_signal.bin", True)

		##################################################
		# Connections
		##################################################
		self.connect((self.gr_file_source_0, 0), (self.gr_throttle_0, 0))
		self.connect((self.gr_throttle_0, 0), (self.wxgui_fftsink2_0, 0))

	def get_samp_rate(self):
		return self.samp_rate

	def set_samp_rate(self, samp_rate):
		self.samp_rate = samp_rate
		self.wxgui_fftsink2_0.set_sample_rate(self.samp_rate)

if __name__ == '__main__':
	parser = OptionParser(option_class=eng_option, usage="%prog: [options]")
	(options, args) = parser.parse_args()
	tb = top_block()
	tb.Run(True)

