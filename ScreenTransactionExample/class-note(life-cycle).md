## ViewController Life Cycle

-> View 객체를 관리하는 메소드, iOS 시스템에 의해 자동으로 호출됨



<img src="https://user-images.githubusercontent.com/26545623/132379457-fcef9ad5-2c1c-44c4-950e-caed8beb3ff7.png" width="500" />

1. Appearing : 뷰가 화면에 나타내는 중
2. Appeard : 뷰가 화면에 나타나는게 완료 된 상태
3. Disappearing : 뷰가 화면에서 사라지는 중 
4. Disappeared : 뷰가 화면에서 사라진 상태 





### viewDidLoad()

- 뷰 컨트롤러의 모든 뷰들이 메모리에 로드 되었을 때 호출
- 메모리에 처음 로드될 때 한 번만 호출
- 보통 딱 1번 호출될 행위들을 이 메소드 안에 정의 함
- 뷰와 관련된 추가적인 초기화 작업, 네트워크 호출



### viewWillAppear()

- 뷰가 뷰 계층에 추가되고, 화면에 보이기 직전에 매번 호출
- 다른 뷰로 이동했다가 돌아오면 재호출
- 뷰와 관련된 추가적인 초기화 작업



### ViewDidAppear()

- 뷰 컨트롤러의 뷰가 뷰 계층에 추가된 후 호출
- 뷰를 나타낼 때 필요한 추가 작업
- 애니메이션을 시작하는 작업



### viewWillDisappear()

- 뷰 컨트롤러의 뷰가 뷰 계층에서 사라지기 전에 호출
- 뷰가 생성된 뛰 작업한 내용을 되돌리는 작업
- 최종적으로 데이터를 저장 해야 하는 경우



### viewDidDisappear()

- 뷰 컨트롤러의 뷰가 뷰 계층에서 사라진 뒤에 호출
- 뷰가 사라진 것과 관련된 추가 작업



--> 영상에서 `viewDidLoad()`가 호출 안된 이유는

이미 메모리에 root viewController가 탑재 되었기 때문에 호출 안됨



segue push view controller에서 이전화면으로 돌아가게 되면 메모리에서 삭제됨


<img src="https://user-images.githubusercontent.com/26545623/132379710-809cdab8-da85-4f01-a79e-ad846b842a56.gif"/>
