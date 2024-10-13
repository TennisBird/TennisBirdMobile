import 'package:home/home.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key});

  @override
  _HomeBottomSheetState createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  bool _isExpanded = false;
  double _height = 100;
  double _maxHeight = 300;

  void _toggleSheet() {
    setState(() {
      _isExpanded = !_isExpanded;
      _height = _isExpanded ? _maxHeight : 100;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _height -= details.delta.dy;
      if (_height < 100) {
        _height = 100;
      } else if (_height > _maxHeight) {
        _height = _maxHeight;
      }
      _isExpanded = _height > 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    _maxHeight = MediaQuery.of(context).size.height * 0.7;
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _height,
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _toggleSheet,
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(Dimensions.size_10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Events for you', style: MainText.shellText, textAlign: TextAlign.start,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
