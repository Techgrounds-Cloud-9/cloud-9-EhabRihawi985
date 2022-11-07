# [Azure-01 Global Infrastructure]
[Everything in the cloud, from servers to networking, is virtualized. As a customer of a cloud provider, you don't have to worry about the underlying physical infrastructure. However, the physical location of your application or data can be important.]

## Key terminology
**Regions**
An Azure region is a set of datacenters deployed within an interval-defined perimeter and connected through a dedicated regional low-latency network.

**Availability Zones**
Azure availability zones are physically separate locations within each Azure region that are tolerant to local failures.

**Region Pairs**
An Azure Region Pair is a relationship between 2 Azure Regions within the same geographic region for disaster recovery purposes.
If one of the regions were to experience a disaster or failure, then the services in that region will automatically failover to that regions secondary region in the pair.

**Azure Compliance Manager** 
is a new service to help customers manage the compliance requirements of the workloads they deploy in the cloud, aligned with the concept of the cloud's shared responsibility model.

## Exercise
### Sources
- https://learn.microsoft.com/en-us/azure/availability-zones/az-overview

- https://learn.microsoft.com/en-us/azure/availability-zones/cross-region-replication-azure

- https://azure.microsoft.com/en-us/explore/global-infrastructure/geographies/#overvie

### Overcome challenges
[Give a short description of the challeges you encountered, and how you solved them.]

### Results
1. Wat is een Azure Region?

Each Azure region features datacenters deployed within a latency-defined perimeter. They're connected through a dedicated regional low-latency network. This design ensures that Azure services within any region offer the best possible performance and security.

2. Wat is een Azure Availability Zone?

Azure availability zones are physically separate locations within each Azure region that are tolerant to local failures. Failures can range from software and hardware failures to events such as earthquakes, floods, and fires. Tolerance to failures is achieved because of redundancy and logical isolation of Azure services. To ensure resiliency, a minimum of three separate availability zones are present in all availability zone-enabled regions.
Azure availability zones are highly available, fault tolerant, and more scalable than traditional single or multiple datacenter infrastructures.

3. Wat is een Azure Region Pair?
An Azure Region Pair is a relationship between 2 Azure Regions within the same geographic region for disaster recovery purposes. If one of the regions were to experience a disaster or failure, then the services in that region will automatically failover to that regions secondary region in the pair.

4. Waarom zou je een regio boven een andere verkiezen?
Each Azure geography contains one or more regions and meets specific data residency and compliance requirements. This lets you keep your business-critical data and apps nearby on fault-tolerant, high-capacity networking infrastructure

When customers move workloads to Azure, they face a number of choices, such as datacenter regions, high availability (HA) and disaster recovery (DR) architecture, and encryption models. To make the right decisions, customer need to consider both technical and regulatory requirements. To optimize latency, customers should determine the appropriate region based on the location of their users or customer base.
For regulatory compliance considerations, data residency considerations may support or even mandate the physical locations where data can be stored, and how and when it can be transferred internationally. These regulations can differ significantly depending on jurisdiction.

Also customers need to check for Service availability and ensure that the Azure services they need are available in the datacenter region that you're considering. and for that they can use the link: https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/

and as last customers have the pricing Factor cost into their decision-making process.
and to Meet the organization’s business needs and budget with competitive, pay-as-you-go pricing. Realize cost savings whether you’re migrating the first workload or fine-tuning complex deployments.
Substantial savings compared to other clouds: https://azure.microsoft.com/en-us/pricing/#product-pricing
Transparent and competitive pricing: https://azure.microsoft.com/en-us/pricing/#transparent-pricing
Free enterprise-grade cost management tools: https://azure.microsoft.com/en-us/pricing/#cost-management
