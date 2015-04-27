using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace HitCounter
{
    [HubName("hitCounter")]
    public class HitCounterHub : Hub
    {
        private static int _hitCount = 0;
        public void RecordHit()
        {
            _hitCount += 1;
            this.Clients.All.onHitRecorded(_hitCount);
        }
        public override System.Threading.Tasks.Task OnDisconnected(bool stopCalled)
        {
            _hitCount -= 1;
            this.Clients.All.onHitRecorded(_hitCount);
            return base.OnDisconnected(stopCalled);
        }
    }
}