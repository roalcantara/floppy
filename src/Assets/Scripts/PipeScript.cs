using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeScript : MonoBehaviour
{
  public float moveSpeed = 5;
  public float deadZone = -45;

  // Start is called before the first frame update
  void Start()
  {

  }

  // Update is called once per frame
  void Update()
  {
    this.movePipeToLeft();
    this.cleanUpPipesOutOfScreen();
  }

  // Moves the pipe to the left
  // Time.detalTime ensures that the pipe moves to the left
  // @see https://docs.unity3d.com/ScriptReference/Time-deltaTime.html
  private void movePipeToLeft()
  {
    transform.position = transform.position +
            (Vector3.left * moveSpeed * Time.deltaTime);
  }

  private bool isPipeOutOfScreen()
  {
    return transform.position.x < deadZone;
  }

  private void cleanUpPipesOutOfScreen()
  {
    if (this.isPipeOutOfScreen())
    {
      Debug.Log("Pipe is out of screen. Destroying..");
      Destroy(gameObject);
    }
  }
}
