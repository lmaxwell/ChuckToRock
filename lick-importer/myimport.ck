
/*
  my import module.
  Li Xian 2013
  */


/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/
me.arg(0)=>string lickpath;
// functors, package functor
Machine.add(lickpath + "/BinaryFunction.ck");
Machine.add(lickpath + "/BinaryPredicate.ck");
Machine.add(lickpath + "/BinaryProcedure.ck");
Machine.add(lickpath + "/FloatFloatFloatFloatFunction.ck");
Machine.add(lickpath + "/FloatFloatFloatFloatPredicate.ck");
Machine.add(lickpath + "/FloatFloatFloatFloatProcedure.ck");
Machine.add(lickpath + "/FloatFloatFloatFunction.ck");
Machine.add(lickpath + "/FloatFloatFloatPredicate.ck");
Machine.add(lickpath + "/FloatFloatFloatProcedure.ck");
Machine.add(lickpath + "/FloatFloatFunction.ck");
Machine.add(lickpath + "/FloatFloatPredicate.ck");
Machine.add(lickpath + "/FloatFloatProcedure.ck");
Machine.add(lickpath + "/FloatFunction.ck");
Machine.add(lickpath + "/FloatPredicate.ck");
Machine.add(lickpath + "/FloatProcedure.ck");
Machine.add(lickpath + "/Function.ck");
Machine.add(lickpath + "/IntFunction.ck");
Machine.add(lickpath + "/IntIntFunction.ck");
Machine.add(lickpath + "/IntIntIntFunction.ck");
Machine.add(lickpath + "/IntIntIntIntFunction.ck");
Machine.add(lickpath + "/IntIntIntIntPredicate.ck");
Machine.add(lickpath + "/IntIntIntIntProcedure.ck");
Machine.add(lickpath + "/IntIntIntPredicate.ck");
Machine.add(lickpath + "/IntIntIntProcedure.ck");
Machine.add(lickpath + "/IntIntFloatProcedure.ck");
Machine.add(lickpath + "/IntIntPredicate.ck");
Machine.add(lickpath + "/IntIntProcedure.ck");
Machine.add(lickpath + "/IntFloatProcedure.ck");
Machine.add(lickpath + "/IntFloatFloatProcedure.ck");
Machine.add(lickpath + "/IntPredicate.ck");
Machine.add(lickpath + "/IntProcedure.ck");
Machine.add(lickpath + "/Predicate.ck");
Machine.add(lickpath + "/Procedure.ck");
Machine.add(lickpath + "/QuaternaryFunction.ck");
Machine.add(lickpath + "/QuaternaryPredicate.ck");
Machine.add(lickpath + "/TernaryFunction.ck");
Machine.add(lickpath + "/TernaryPredicate.ck");
Machine.add(lickpath + "/TernaryProcedure.ck");
Machine.add(lickpath + "/UnaryFunction.ck");
Machine.add(lickpath + "/UnaryPredicate.ck");
Machine.add(lickpath + "/UnaryProcedure.ck");

// functions
Machine.add(lickpath + "/Acos.ck");
Machine.add(lickpath + "/Asin.ck");
Machine.add(lickpath + "/Atan.ck");
Machine.add(lickpath + "/Ceil.ck");
Machine.add(lickpath + "/Cos.ck");
Machine.add(lickpath + "/Cosh.ck");
Machine.add(lickpath + "/Exp.ck");
Machine.add(lickpath + "/Floor.ck");
Machine.add(lickpath + "/Identity.ck");
Machine.add(lickpath + "/Inverse.ck");
Machine.add(lickpath + "/Log.ck");
Machine.add(lickpath + "/Log10.ck");
Machine.add(lickpath + "/Log2.ck");
Machine.add(lickpath + "/Negate.ck");
Machine.add(lickpath + "/Round.ck");
Machine.add(lickpath + "/Sin.ck");
Machine.add(lickpath + "/Sinh.ck");
Machine.add(lickpath + "/Sqrt.ck");
Machine.add(lickpath + "/Tan.ck");
Machine.add(lickpath + "/Tanh.ck");
Machine.add(lickpath + "/Trunc.ck");
Machine.add(lickpath + "/Uniform.ck");

// composite functions
Machine.add(lickpath + "/CompositeFloatFunction.ck");
Machine.add(lickpath + "/CompositeFunction.ck");
Machine.add(lickpath + "/CompositeIntFunction.ck");

// function convenience classes
Machine.add(lickpath + "/Functions.ck");
Machine.add(lickpath + "/FloatFunctions.ck");
Machine.add(lickpath + "/IntFunctions.ck");

// interpolation, package interpolate
Machine.add(lickpath + "/Interpolation.ck");
Machine.add(lickpath + "/BackIn.ck");
Machine.add(lickpath + "/BackOut.ck");
Machine.add(lickpath + "/BackInOut.ck");
Machine.add(lickpath + "/AbstractBounce.ck");
Machine.add(lickpath + "/BounceIn.ck");
Machine.add(lickpath + "/BounceOut.ck");
Machine.add(lickpath + "/BounceInOut.ck");
Machine.add(lickpath + "/CircularIn.ck");
Machine.add(lickpath + "/CircularInOut.ck");
Machine.add(lickpath + "/CircularOut.ck");
Machine.add(lickpath + "/CubicIn.ck");
Machine.add(lickpath + "/CubicInOut.ck");
Machine.add(lickpath + "/CubicOut.ck");
Machine.add(lickpath + "/ElasticIn.ck");
Machine.add(lickpath + "/ElasticOut.ck");
Machine.add(lickpath + "/ElasticInOut.ck");
Machine.add(lickpath + "/ExponentialIn.ck");
Machine.add(lickpath + "/ExponentialInOut.ck");
Machine.add(lickpath + "/ExponentialOut.ck");
Machine.add(lickpath + "/Linear.ck");
Machine.add(lickpath + "/QuadraticIn.ck");
Machine.add(lickpath + "/QuadraticInOut.ck");
Machine.add(lickpath + "/QuadraticOut.ck");
Machine.add(lickpath + "/QuarticIn.ck");
Machine.add(lickpath + "/QuarticInOut.ck");
Machine.add(lickpath + "/QuarticOut.ck");
Machine.add(lickpath + "/QuinticIn.ck");
Machine.add(lickpath + "/QuinticInOut.ck");
Machine.add(lickpath + "/QuinticOut.ck");
Machine.add(lickpath + "/Random.ck");
Machine.add(lickpath + "/GaussianRandom.ck");
Machine.add(lickpath + "/RandomFloor.ck");
Machine.add(lickpath + "/RandomThreshold.ck");
Machine.add(lickpath + "/SinusoidalIn.ck");
Machine.add(lickpath + "/SinusoidalInOut.ck");
Machine.add(lickpath + "/SinusoidalOut.ck");
Machine.add(lickpath + "/Interpolate.ck");
Machine.add(lickpath + "/Constrain.ck");

// duration providers, package duration
Machine.add(lickpath + "/DurProvider.ck");
Machine.add(lickpath + "/Humanize.ck");
Machine.add(lickpath + "/HumanizedDurProvider.ck");

// procedures, package loop
Machine.add(lickpath + "/Append.ck");
Machine.add(lickpath + "/Prepend.ck");
Machine.add(lickpath + "/Repeat.ck");
Machine.add(lickpath + "/Sleep.ck");
Machine.add(lickpath + "/Loop.ck");
Machine.add(lickpath + "/Loops.ck");
Machine.add(lickpath + "/LoopBuilder.ck");

// list, package collect
Machine.add(lickpath + "/Comparator.ck");
Machine.add(lickpath + "/Iterator.ck");
Machine.add(lickpath + "/List.ck");
Machine.add(lickpath + "/ListIterator.ck");
Machine.add(lickpath + "/ArrayList.ck");

// int list
Machine.add(lickpath + "/IntComparator.ck");
Machine.add(lickpath + "/IntIterator.ck");
Machine.add(lickpath + "/IntList.ck");
Machine.add(lickpath + "/IntListIterator.ck");
Machine.add(lickpath + "/IntArrayList.ck");

// float list
Machine.add(lickpath + "/FloatComparator.ck");
Machine.add(lickpath + "/FloatIterator.ck");
Machine.add(lickpath + "/FloatList.ck");
Machine.add(lickpath + "/FloatListIterator.ck");
Machine.add(lickpath + "/FloatArrayList.ck");

// set
Machine.add(lickpath + "/Set.ck");
Machine.add(lickpath + "/ArraySet.ck");

// graphs
Machine.add(lickpath + "/Node.ck");
Machine.add(lickpath + "/Edge.ck");
Machine.add(lickpath + "/Graph.ck");
Machine.add(lickpath + "/Graphs.ck");

// intervals, chords, scales, arpeggiator
Machine.add(lickpath + "/TimeSignature.ck"); // package duration?
Machine.add(lickpath + "/Interval.ck");
Machine.add(lickpath + "/Intervals.ck");
Machine.add(lickpath + "/Chord.ck");
Machine.add(lickpath + "/Chords.ck");
Machine.add(lickpath + "/Scale.ck");
Machine.add(lickpath + "/Scales.ck");
Machine.add(lickpath + "/Arpeggiator.ck");
Machine.add(lickpath + "/Arpeggiators.ck");

// unit test, package test
Machine.add(lickpath + "/Assert.ck");

// simulators, package simulator
Machine.add(lickpath + "/Animoog.ck");
Machine.add(lickpath + "/GarageBand.ck");
Machine.add(lickpath + "/Loopy.ck");
Machine.add(lickpath + "/MeeBlip.ck");
// Machine.add(lickpath + "/DroneLab.ck");
Machine.add(lickpath + "/SooperLooper.ck");
Machine.add(lickpath + "/VoiceOfSaturn.ck");
Machine.add(lickpath + "/TwoPots.ck");

// midi, package midi
Machine.add(lickpath + "/ControlChangeMidiMsg.ck");
Machine.add(lickpath + "/NoteOffMidiMsg.ck");
Machine.add(lickpath + "/NoteOnMidiMsg.ck");
Machine.add(lickpath + "/AnimoogMidi.ck");
Machine.add(lickpath + "/GarageBandMidi.ck");
Machine.add(lickpath + "/LoopyMidi.ck");
Machine.add(lickpath + "/MeeBlipMidi.ck");
Machine.add(lickpath + "/EuclidMidi.ck");
Machine.add(lickpath + "/StompMidi.ck");
Machine.add(lickpath + "/TwoPotsMidi.ck");

// devices, package device
Machine.add(lickpath + "/Keyboard.ck");
Machine.add(lickpath + "/Joystick.ck");
Machine.add(lickpath + "/LogitechGamepadF310.ck");
Machine.add(lickpath + "/Monome.ck");
Machine.add(lickpath + "/Mouse.ck");
Machine.add(lickpath + "/NanoPad.ck");
Machine.add(lickpath + "/MAudioOzone.ck");
Machine.add(lickpath + "/AlesisQX25.ck");
Machine.add(lickpath + "/StompKeyboard.ck");

// osc, package osc
Machine.add(lickpath + "/ControlOscServer.ck");
Machine.add(lickpath + "/EuclidOsc.ck");
Machine.add(lickpath + "/IanniXOsc.ck");
Machine.add(lickpath + "/SooperLooperOsc.ck");
Machine.add(lickpath + "/TouchOscServer.ck");

// sample-based drum machines, package sample
Machine.add(lickpath + "/Sample.ck");
Machine.add(lickpath + "/CompositeSample.ck");
Machine.add(lickpath + "/RandomSample.ck");
Machine.add(lickpath + "/PitchSensitiveSample.ck");
Machine.add(lickpath + "/VelocitySensitiveSample.ck");
Machine.add(lickpath + "/HandedSample.ck");
Machine.add(lickpath + "/Samples.ck");
Machine.add(lickpath + "/AkaiMpc60.ck");
Machine.add(lickpath + "/EmuDrumulator.ck");
Machine.add(lickpath + "/OberheimDmx.ck");
Machine.add(lickpath + "/RolandCr78.ck");
Machine.add(lickpath + "/RolandTr66.ck");
Machine.add(lickpath + "/RolandTr606.ck");
Machine.add(lickpath + "/RolandTr808.ck");
Machine.add(lickpath + "/RolandTr909.ck");
Machine.add(lickpath + "/BigMono.ck");

// delay stuff
Machine.add(lickpath + "/SinTrem.ck");
Machine.add(lickpath + "/SqrTrem.ck");
Machine.add(lickpath + "/TriTrem.ck");
Machine.add(lickpath + "/Trem.ck");
Machine.add(lickpath + "/Tremolo.ck");
Machine.add(lickpath + "/MonoDelay.ck");
Machine.add(lickpath + "/MonoDelayA.ck");
Machine.add(lickpath + "/MonoDelayL.ck");
Machine.add(lickpath + "/StereoDelay.ck");
Machine.add(lickpath + "/StereoDelayA.ck");
Machine.add(lickpath + "/StereoDelayL.ck");
Machine.add(lickpath + "/FeedbackMachine.ck");
Machine.add(lickpath + "/FeedbackMachines.ck");
Machine.add(lickpath + "/FeedbackMachineA.ck");
Machine.add(lickpath + "/FeedbackMachineL.ck");
Machine.add(lickpath + "/StereoFeedbackMachine.ck");
Machine.add(lickpath + "/StereoFeedbackMachines.ck");
Machine.add(lickpath + "/StereoFeedbackMachineA.ck");
Machine.add(lickpath + "/StereoFeedbackMachineL.ck");
Machine.add(lickpath + "/Smear.ck");
Machine.add(lickpath + "/Swirl.ck");

// dist stuff
Machine.add(lickpath + "/GainShaper.ck");
Machine.add(lickpath + "/WaveShaper.ck");
Machine.add(lickpath + "/Clip.ck");
Machine.add(lickpath + "/Dist.ck");
Machine.add(lickpath + "/AtanDist.ck");
Machine.add(lickpath + "/TanhDist.ck");
Machine.add(lickpath + "/RibbonDist.ck");
Machine.add(lickpath + "/FrostburnDist.ck");
Machine.add(lickpath + "/KijjazDist.ck");
Machine.add(lickpath + "/KijjazDist2.ck");
Machine.add(lickpath + "/KijjazDist3.ck");
Machine.add(lickpath + "/KijjazDist4.ck");
Machine.add(lickpath + "/Thicken.ck");

// chugen stuff
Machine.add(lickpath + "/Module.ck");
Machine.add(lickpath + "/Module2.ck");
Machine.add(lickpath + "/Module3.ck");
Machine.add(lickpath + "/Module4.ck");
Machine.add(lickpath + "/Module5.ck");
Machine.add(lickpath + "/Module6.ck");
Machine.add(lickpath + "/Module7.ck");
Machine.add(lickpath + "/Module8.ck");

// chubgraph stuff
Machine.add(lickpath + "/Mesmerizer.ck");

<<<"LiCK imported.">>>;
