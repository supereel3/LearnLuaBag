using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ABTest : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //��һ�� ����AB��
        AssetBundle ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "model");
        //�ڶ��� ���� AB���е���Դ
        GameObject obj = ab.LoadAsset("Cube", typeof(GameObject)) as GameObject;
        Instantiate(obj);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
