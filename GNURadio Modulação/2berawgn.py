#!/usr/bin/env python
#
# Copyright 2012,2013 Free Software Foundation, Inc.
# 
# This file is part of GNU Radio
# 
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

"""
BER simulation for QPSK signals, compare to theoretical values.
Change the N_BITS value to simulate more bits per Eb/N0 value,
thus allowing to check for lower BER values.

Lower values will work faster, higher values will use a lot of RAM.
Also, this app isn't highly optimized--the flow graph is completely
reinstantiated for every Eb/N0 value.
Of course, expect the maximum value for BER to be one order of
magnitude below what you chose for N_BITS.
"""


import math
import numpy
from gnuradio import gr, digital
from gnuradio import analog
from gnuradio import blocks

try:
    from scipy.special import erfc
except ImportError:
    print "Error: could not import scipy (http://www.scipy.org/)"
    sys.exit(1)

try:
    import pylab
except ImportError:
    print "Error: could not import pylab (http://matplotlib.sourceforge.net/)"
    sys.exit(1)

# Best to choose powers of 10
N_BITS = 1e6
RAND_SEED = 42

def berawgn(EbN0):
    """ Calculates theoretical bit error rate in AWGN (for BPSK and given Eb/N0) """
    return 0.5 * erfc(math.sqrt(10**(float(EbN0)/10)))

class BitErrors(gr.hier_block2):
    """ Two inputs: true and received bits. We compare them and
    add up the number of incorrect bits. Because integrate_ff()
    can only add up a certain number of values, the output is
    not a scalar, but a sequence of values, the sum of which is
    the BER. """
    def __init__(self, bits_per_byte):
        gr.hier_block2.__init__(self, "BitErrors",
                gr.io_signature(2, 2, gr.sizeof_char),
                gr.io_signature(1, 1, gr.sizeof_int))

        # Bit comparison
        comp = blocks.xor_bb()
        intdump_decim = 100000
        if N_BITS < intdump_decim:
            intdump_decim = int(N_BITS)
        self.connect(self,
                     comp,
                     blocks.unpack_k_bits_bb(bits_per_byte),
                     blocks.uchar_to_float(),
                     blocks.integrate_ff(intdump_decim),
                     blocks.multiply_const_ff(1.0/N_BITS),
                     self)
        self.connect((self, 1), (comp, 1))

class BERAWGNSimuQAM16(gr.top_block):
    " This contains the simulation flow graph "
    def __init__(self, EbN0):
        gr.top_block.__init__(self)
        self.const = digital.qam_constellation(16)
        # Source is N_BITS bits, non-repeated
        data = map(int, numpy.random.randint(0, self.const.arity(), N_BITS/self.const.bits_per_symbol()))
        src   = blocks.vector_source_b(data, False)
        mod   = digital.chunks_to_symbols_bc((self.const.points()), 1)
        add   = blocks.add_vcc()
        noise = analog.noise_source_c(analog.GR_GAUSSIAN,
                                      self.EbN0_to_noise_voltage(EbN0),
                                      RAND_SEED)
        demod = digital.constellation_decoder_cb(self.const.base())
        ber   = BitErrors(self.const.bits_per_symbol())
        self.sink  = blocks.vector_sink_f()
        self.connect(src, mod, add, demod, ber, self.sink)
        self.connect(noise, (add, 1))
        self.connect(src, (ber, 1))

    def EbN0_to_noise_voltage(self, EbN0):
        """ Converts Eb/N0 to a single-sided noise voltage (assuming unit symbol power) """
        return 1.0 / math.sqrt(2.0 * self.const.bits_per_symbol() * 10**(float(EbN0)/10))


class BERAWGNSimuQAM64(gr.top_block):
    " This contains the simulation flow graph "
    def __init__(self, EbN0):
        gr.top_block.__init__(self)
        self.const = digital.qam_constellation(64)
        # Source is N_BITS bits, non-repeated
        data = map(int, numpy.random.randint(0, self.const.arity(), N_BITS/self.const.bits_per_symbol()))
        src   = blocks.vector_source_b(data, False)
        mod   = digital.chunks_to_symbols_bc((self.const.points()), 1)
        add   = blocks.add_vcc()
        noise = analog.noise_source_c(analog.GR_GAUSSIAN,
                                      self.EbN0_to_noise_voltage(EbN0),
                                      RAND_SEED)
        demod = digital.constellation_decoder_cb(self.const.base())
        ber   = BitErrors(self.const.bits_per_symbol())
        self.sink  = blocks.vector_sink_f()
        self.connect(src, mod, add, demod, ber, self.sink)
        self.connect(noise, (add, 1))
        self.connect(src, (ber, 1))

    def EbN0_to_noise_voltage(self, EbN0):
        """ Converts Eb/N0 to a single-sided noise voltage (assuming unit symbol power) """
        return 1.0 / math.sqrt(2.0 * self.const.bits_per_symbol() * 10**(float(EbN0)/10))




class BERAWGNSimuGMSK(gr.top_block):
    " This contains the simulation flow graph "
    def __init__(self, EbN0):
        gr.top_block.__init__(self)
        self.const = digital.gmsk_mod()
        # Source is N_BITS bits, non-repeated
        data = map(int, numpy.random.randint(0, self.const.samples_per_symbol(), N_BITS/self.const.bits_per_symbol()))
        src   = blocks.vector_source_b(data, False)
        mod   = digital.gmsk_mod()
        add   = blocks.add_vcc()
        noise = analog.noise_source_c(analog.GR_GAUSSIAN,
                                      self.EbN0_to_noise_voltage(EbN0),
                                      RAND_SEED)
        demod = digital.gmsk_demod()
        ber   = BitErrors(self.const.bits_per_symbol())
        self.sink  = blocks.vector_sink_f()
        
        #print 'Arity: ',self.const.samples_per_symbol(),' NBITS ',N_BITS, 'bits_per_symbol ',self.const.bits_per_symbol()
        self.connect(src, mod, add, demod, ber, self.sink)
        self.connect(noise, (add, 1))
        self.connect(src, (ber, 1))

    def EbN0_to_noise_voltage(self, EbN0):
        """ Converts Eb/N0 to a single-sided noise voltage (assuming unit symbol power) """
        return 1.0 / math.sqrt(2.0 * self.const.bits_per_symbol() * 10**(float(EbN0)/10))





def simulate_ber16QAM(EbN0):
    """ All the work's done here: create flow graph, run, read out BER """
    print "Eb/N0 = %d dB" % EbN0
    fg = BERAWGNSimuQAM16(EbN0)
    fg.run()
    return numpy.sum(fg.sink.data())

def simulate_ber64QAM(EbN0):
    """ All the work's done here: create flow graph, run, read out BER """
    print "Eb/N0 = %d dB" % EbN0
    fg = BERAWGNSimuQAM64(EbN0)
    fg.run()
    return numpy.sum(fg.sink.data())


def simulate_berGMSK(EbN0):
    """ All the work's done here: create flow graph, run, read out BER """
    print "Eb/N0 = %d dB" % EbN0
    fg = BERAWGNSimuGMSK(EbN0)
    fg.run()
    return numpy.sum(fg.sink.data())



if __name__ == "__main__":
    EbN0_min = 0
    EbN0_max = 15
    EbN0_range = range(EbN0_min, EbN0_max+1)
   
    #teorico nao utilizado 
    #ber_theory = [berawgn(x)      for x in EbN0_range]
    
    print "Simulating 16-QAM..."
    ber_simu_16QAM   = [simulate_ber16QAM(x) for x in EbN0_range]

    print "Simulating 64-QAM..."
    ber_simu_64QAM   = [simulate_ber64QAM(x) for x in EbN0_range]
    
    print "Simulating GMSK..."
    ber_simu_GMSK   = [simulate_berGMSK(x) for x in EbN0_range]

    #plotagem
    f = pylab.figure()
    s = f.add_subplot(1,1,1)
    #s.semilogy(EbN0_range, ber_theory, 'b-o', label="Teorico") #nao utilizado
    s.semilogy(EbN0_range, ber_simu_16QAM, 'r-o', label="16-QAM")
    s.semilogy(EbN0_range, ber_simu_64QAM, 'g-o', label="64-QAM")   
    s.semilogy(EbN0_range, ber_simu_GMSK, 'b-o', label="GMSK")
    s.set_title('BER Simulation')
    s.set_xlabel('Eb/N0 (dB)')
    s.set_ylabel('BER')
    s.legend()
    s.grid()
    pylab.show()

