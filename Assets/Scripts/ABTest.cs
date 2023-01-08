using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ABTest : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //第一步 加载AB包
        AssetBundle ab = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/" + "model");
        //第二部 加载 AB包中的资源
        GameObject obj = ab.LoadAsset("Cube", typeof(GameObject)) as GameObject;
        Instantiate(obj);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
