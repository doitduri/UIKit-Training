<img src="https://user-images.githubusercontent.com/26545623/133766216-11e617d6-50b3-4fa5-9300-028b95ff39f2.gif" width="30%"/>




### ✍ note 
UIStackView

- Axis : 스택 뷰의 방향
- Distribution : 스택 뷰들의 들어가는 사이즈
- Alignment : 스택 뷰의 요소를 정렬
- Spacing : 스택 뷰의 요소들의 간격



Aspect ratio : 해당 뷰의 가로세로 비율을 고정시키는 제약조건



키패드를 구성하는 버티컬 스택의 우선순위를

다른 뷰보다 버티컬 뷰의 바텀스페이스의 우선순위가 낮아짐

1. 버티컬 스택 뷰의 사이즈 만큼 화면을 구성하고, 
2. 바텀 스페이스의 간격을 정하겠다.



@**IBDesignable** : 스토리보드에서 실시간으로 확인 할 수 있게

@**IBInspectable** : 스토리보드 내에서 프로퍼티를 변경 시킬 수 있게 해줌



-> 버튼을 동그랗게 만들기 위해서 CustomView 정의,

- isRound 프로퍼티를 통해 UIButton 변경

