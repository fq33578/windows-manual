using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnabledUltimatePowerPlant
{
    internal class Program
    {

        
        #region 初始化CMD
        static Process cmd = new Process();
        static void SetCMD()
        {
            cmd.StartInfo.FileName = "cmd.exe";
            cmd.StartInfo.RedirectStandardInput = true;
            cmd.StartInfo.RedirectStandardOutput = true;
            cmd.StartInfo.RedirectStandardError = true;
            cmd.StartInfo.CreateNoWindow = true;
            cmd.StartInfo.UseShellExecute = false;
        }
        #endregion
        static void Main(string[] args)
        {
            //Enabled_UltimatePowerPlant();
            try
            {
                Search_UltimatePowerPlant();
                Console.WriteLine("Windows Ultimate Power Plant Enabled Success");
                Console.WriteLine("Press Anykey Exit...");
                Console.ReadKey();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error:"+ex.Message);
                Console.WriteLine("Press Anykey Exit...");
                Console.ReadKey();
            }
        }
        
        #region 檢查終極效能計畫(防止新增重複計畫)
        static void Search_UltimatePowerPlant()
        {
            #region CMD 指令
            SetCMD();
            cmd.StartInfo.Arguments =
                    "/c powercfg /list";//創建終極效能電源計畫
            cmd.Start();
            #endregion
            #region 資料處理與判斷
            string _out = cmd.StandardOutput.ReadToEnd();//獲取CMD輸出返回值

            string[] po = _out.Split('\n');//檢測換行並分割
            int PlanListLength = 0;
            int PlanRows;
            for (PlanRows = 0; PlanRows < po.Length; PlanRows++)
            {
                PlanListLength = po[PlanRows].IndexOf("終極效能");
                //Console.WriteLine(PlanListLength);
                if (PlanListLength != -1)
                {
                    break;
                }

            }
            #region 判斷是否執行開啟已創建的終極效能
            if (PlanListLength == -1)
            {
                Enabled_UltimatePowerPlant();
            }
            else
            {
                string[] PlanPin = po[PlanRows].Split(' ');
                #region 啟用已創建的計畫
                //Debug.Print(_out);
                //Debug.Print(PlanPin[2].ToString());
                //string GetGUID = po[2].Trim();

                #region CMD 指令
                SetCMD();
                cmd.StartInfo.Arguments =
                        "/c powercfg /setactive " + PlanPin[2].Trim();//創建終極效能電源計畫
                cmd.Start();
                #endregion
                //Debug.Print(PlanPin[2].ToString());
                #endregion

                //Console.ReadKey();//防止視窗關閉
                #endregion

            }
            #endregion
        }
        #endregion

        #region 新增並啟用終極效能
        static void Enabled_UltimatePowerPlant()
        {

            #region 創建終極效能電源計畫
            #region CMD 指令
            SetCMD();
            cmd.StartInfo.Arguments =
                "/c powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61";//創建終極效能電源計畫
            cmd.Start();
            #endregion
            #region 資料處理與判斷
            string _out = cmd.StandardOutput.ReadToEnd();//獲取CMD輸出返回值

            string[] po = _out.Split(' ');//檢測換行並分割
            string GetGUID = po[2].Trim();
            #endregion
            #endregion
            #region 啟用終極效能電源計畫
            #region CMD 指令
            SetCMD();
            cmd.StartInfo.Arguments =
                "/c powercfg /setactive " + GetGUID;//啟用終極效能電源計畫
            cmd.Start();
            #endregion
            #endregion


            //Console.ReadKey();//防止視窗關閉
        }
        #endregion

    }
}
