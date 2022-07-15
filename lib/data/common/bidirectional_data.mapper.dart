abstract class BidirectionalDataMapper<I, O> {
  O to(I data);

  I from(O data);
}
