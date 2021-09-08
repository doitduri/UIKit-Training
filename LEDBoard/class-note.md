



### UINavigationViewController 

: 계층구조로 구성 되어 있는 컨텐츠를 순차적으로 보여주는 컨테이너 뷰 

- navigation stack 이라는 정렬된 배열을 사용하여 자식 뷰 컨트롤러를 관리함
- FIFO 특성 (스택에 나중에 들어온게 먼저 나감)



### 화면전환 방법

1. View Controller 의 View 위에 다른 View를 가져와 바꿔치기
   - 메모리 누수의 위험 (사용 지양)

2. View Controller에서 다른 View Controller 를 호출하여 전환하기
   - 이동하려는 뷰 컨트롤러 인스턴스를 전달해줘서 화면 전환 

3. Navigation Controller 를 사용하여 화면 전환하기
   - push 메소드 파라미터에 이동하려는 인스턴스를 넘겨줘서 화면 전환 

4. 화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기
   - 스토리보드에서 뷰 컨트롤러 신들끼리 연결하여 화면 전환



### ViewController life-cycle

뷰 계층을 관리하는 메소드들이 미리 정의되어 있고, ios 시스템에 의해 자동으로 호출됨



```markdown
viewDidLviewDidLoad : **메모리에 뷰가 로드 되었을 때**, 딱 1번 호출

↓

viewWillAppear : 뷰가 **뷰 계층에 추가되고 화면에 보이기 직전에** 호출

↓

viewDidAppear : 뷰 컨트롤러의 **뷰가 뷰 계층에 추가되면** 호출

↓

viewWillDisappear : 뷰 컨트롤러의 뷰가 **뷰 계층에서 사라지기 전**에 호출 

↓ 

viewDidDisappear : 뷰 컨트롤러의 **뷰가 뷰 계층에서 완전히 사라진 뒤**에 호출  
```



화면간 데이터 전달

1. 코드로 구현된 화면 전환 방법

   - 스토리보드에 있는 뷰 컨트롤러가 인스턴스화 되면 전달

2. 세그웨이 

   - prepare 메소드 오버라이드
   - 전환하려는 뷰 컨트롤러의 인스턴스를 가져오고 프로퍼티에 접근해서 데이터 전달

3. delegate (이전 화면) : 가장많이 사용!

   - delegate pattern 

     `weak`  키워드를 안 붙이면, 메모리 누수 발생 + 강한 순한참조가 발생함

에셋 카탈로그

- 1x / 2x / 3x .. 
  - 다양한 해상도에서 꺠지지 않는 이미지 제공하기 위해 각각 해상도에 맞춰 제공



