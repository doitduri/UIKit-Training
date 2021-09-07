### 명언 제조기


<img src="https://user-images.githubusercontent.com/26545623/132352394-1d1487f5-1b41-4b69-a067-2c2c6519364a.gif" width="30%">

UIKit : 사용자의 인터페이스를 관리하고, 이벤트를 처리하는 것이 주목적

어플리케이션을 구성하는 많은 요소들이 **UIKIt** 사용!

- UIView : 화면을 구성하는 기본 클래스
  - 많은 컴포넌트들이 UIView를 상속 받고 있음
  - 앱의 근간을 이루는 객체
  - 데이터의 변화에 따라 View content들을 업데이트, 뷰들과 함께 사용자와 상호작용을 함
  - 전체적인 인터페이스의 레이아웃을 관리
  - 다른 viewcontroller와 함께 앱을구성함 
- UIViewController : 간단하게 화면 하나를 관리하는 단위 
- AutoLayout : 아이폰의 다양한 해상도를 관리하기 위한 것
  - 제약조건을 이용해서 뷰의 위치나 크기를 지정
  - 화면간의 마진, 뷰 간의 정렬이나 마진 등을 제약조건으로 구성 할 수 있음
  - Content Hugging & Compression Resistance : UILabel, UIButton 등 크기가 결정되는 뷰에게서 발생
    - **Content Hugging**: content 고유의 사이즈보다 더 늘어나는 것에 대해 저항하는 것
      - 우선순위⬆ - 크기를 유지
      - 우선순위⬇ - 크기가 늘어남
    - **Compression Resistance**: 반대로 줄어드는 것에 대해서 저항하는 것
      - 우선순위⬆ - 자신의 크기 유지
      - 우선순위⬇ - 크기가 줄어듬
- IBOutlet & IBAction 
  - IBOutlet: storyboard에 등록한 UI Object를 코드의 변수로 접근 할 수 있게끔 해주는 것 
    - 뷰 컨트롤러에 선언
  - IBAction: 버튼과 연결시켜 이벤트를 처리하는 함수를 만들어 줌 
