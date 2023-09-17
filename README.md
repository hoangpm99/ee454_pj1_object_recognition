# CMPEN/EE 454, PROJECT 1
The goal of this project is to implement the forward pass of a convolutional neural net (CNN) for
object recognition in Matlab. One of the eye-opening developments in computer vision in recent
few years is that a cascade or chain of very simple image processing operations can outperform
more complicated state-of-the-art object recognition algorithms. Of course, the specific image
processing operations used have to be well-chosen! The real magic in a CNN is learning the
underlying convolution filters, using a process called backpropagation (we’ll call this the backward
pass). Much of the heavy computational and big-data requirements for training CNNs (so-called
deep learning) are concentrated on this learning process, which is outside the scope of this course
and project. However, once learned, applying a CNN in the forward direction to map an input
image through a set of intermediate image processing transformations and finally to a set of object
class probabilities involves little more than convolution with linear filters, image size reduction,
and thresholding. This chain of operations is what we are going to implement in this project
