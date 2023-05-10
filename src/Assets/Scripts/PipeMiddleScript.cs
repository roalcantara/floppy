using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeMiddleScript : MonoBehaviour
{
  public LogicScript logic;
  private const int BIRD_LAYER = 3;
  private const string LOGIC_TAG = "Logic";

  // Start is called before the first frame update
  void Start()
  {
    this.logic = this.getLogic();
  }

  // Update is called once per frame
  void Update()
  {

  }

  /// Retrieves the Logic component from the Logic GameObject in runtime
  // it alows to access the public methods and properties of the Logic class
  private LogicScript getLogic()
  {
    return GameObject.FindGameObjectWithTag(LOGIC_TAG).GetComponent<LogicScript>();
  }

  private void OnTriggerEnter2D(Collider2D collision)
  {
    if (this.isBird(collision))
    {
      this.logic.increaseScore(1);
    }
  }

  /// Checks if the collision is with a bird
  private bool isBird(Collider2D collision)
  {
    return collision.gameObject.layer == BIRD_LAYER;
  }
}
