**Contrainer View Controller**

화면을 구성하는 뷰를 직접 구현하고 관련된 이벤트를 처리하는 뷰 컨트롤러



Container View Controller

- 하나 이상의 Child View Controller를 가지고 있음
- 하나 이상의 Child View Controller를 관리하고 레이아웃과 화면 전환을 담당
- 화면 구성과 이벤트 관리는 Child View Controller에서 함
- Contrainer View Controller는 대표적으로 Navigation Controller와 TabBar Controller가 있음



**Navigation View Controller**

<img src="https://user-images.githubusercontent.com/26545623/132375325-e396bbf3-8c07-4aa1-b6ef-af0daca69db7.png" width="300"/>

- 네비게이션 스택 사용
- 현재 화면에 보여주는 것 : 스택의 최상단
- 세그웨이를 사용하거나 UI네비게이션 컨트롤러 메소드 이용



Navigation =  나중에 들어오는게 먼저 나가는 구조 (FIFO)

<img src="https://user-images.githubusercontent.com/26545623/132375360-e2e7c665-5e92-4ff5-b296-4107cf91aed9.png" width="300">


화면A : 네비게이션 1번째 화면 (root view)

화면B: child view controller 화면 (네비게이션 스택에 push)

-> 트리구조처럼 상위 카테고리에서 하위 카테고리로 퍼져가는 구조



<img src="https://user-images.githubusercontent.com/26545623/132375733-a81be20b-e3c9-4d64-892e-94e2ac2ebbfe.png" width="200">
left edge swipe를 하거나 백버튼을 눌러 나가기 (pop)





<img src="https://user-images.githubusercontent.com/26545623/132375754-9e4a249d-c26e-4a58-bf7c-9ff21ae172b1.png" width="300">

- 네비게이션 바
- 버튼 아이템 (root 제외 백버튼 잇음)
- 타이틀
- 네비게이션 바 프롬프트 



### 화면전환 방법

1. ~~View Controller의 View 위에 다른 View를 가져와 바꿔치기 -> 되도록 사용하지 말아야 함 (메모리 누수의 위험)~~

2. View Controller에서 다른 View Controller를 호출하여 전환하기
   
   <img src="https://user-images.githubusercontent.com/26545623/132376090-33655034-3801-42c8-96d4-bb1fe881f60d.png" width="400">
   
   present 방법이라고도 함


   `dismiss` :  이전화면으로 넘어가는 함수

   

3. navigation controller를 사용하여 화면 전환하기
   객층적인 
   네비게이션 스택으로 관리함

   - `pushViewControlloer` / `popViewController`

   

4. 화면 전환용 객체 세그웨이(segueway)를 사용하여 화면 전환하기

   - 세그웨이(화면 전환용 객체) : 
     - 두 개의 뷰 컨트롤러 사이에 연결된 화면 전환 객체, 
     - 출발지와 목적지를 직접 지정
     - 스토리보드 만으로도 화면을 전환 할 수 있음 
       
       
   - action segueway : 출발점이 버튼, 셀 등인 경우 
    <img src="https://user-images.githubusercontent.com/26545623/132376164-ed3cac06-a70e-4a6d-a462-1966a2442e89.png" width="200">

     - Show : 네비게이션 컨트롤러를 사용하면, 화면 전환 시 뷰 컨트롤러가 네비게이션 스택에 쌓이고 
       만약 사용하지 않으면 뷰컨이 freezed됨  
     - Show Detail : 스플릿 뷰에서 사용하는 세그웨이 (ipad), 아이폰인 경우 show와 동일
     - Present Modally : 이전 뷰 컨트롤러를 덮으면서 새로운 뷰가 보임
     - Present As Popover : 팝업창을 띄울 때 
     - Custom : 세그웨이를 사용자가 원하는 방식으로 하는 경우 
   - manual segueway : 출발점이 뷰 컨트롤러 자체인 경우 




<img src="https://user-images.githubusercontent.com/26545623/132376250-2ebd3e64-84e7-4704-a77b-808536dfcd38.png" width="500">

**Is initial View Controller** : 스토리보드의 시작점을 알려주는 속성





1. Sugue로 push

  <img src="https://user-images.githubusercontent.com/26545623/132376326-aba678ee-dee8-4c4b-a485-50af5679bb7f.png" width="300">
   - 스토리보드에서 화면전환용 세그웨이를 사용해서 네비게이션 스택에 새로운 화면 푸시

     ```swift
     @IBAction func tabBackButton(_ sender: UIButton) {
       self.navigationController?.popViewController(animated: true)
       // pop 
       
       self.navigationController?.popToRootViewController(animated: true) 
       // root로 pop
      }
     ```

     

2. Sugue로 present

   
<img src="https://user-images.githubusercontent.com/26545623/132376341-e18a313c-06c0-4d9e-820a-4cdcb8e5e9ab.png" width="300">
   - 세그웨이를 사용해서 네비게이션 컨트롤러에 루트 뷰 컨트롤러 화면에 새로운 화면이 덮어지게끔 presentCode로 push

   - instactor > 속성 > presentaion 값으로 화면 값 조정 가능

     - 모달리 / full screen .. 등등

       

3. 코드 이용해서 네비게이션 스택에 새로운 화면 푸시

4. Code로 present

   - 코드 이용, 루트 뷰 컨트롤러에 새로운 화면이 덮어지게끔 present





