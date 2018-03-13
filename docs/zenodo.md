# Zenodo integration

Zenodo, and other data repositories, provide a way to create a collection of records.
At Zenodo these are called _communities.
In the context of o2r, we have created a community [`o2r`](https://zenodo.org/communities/o2r) (also in the [sandbox](https://zenodo.org/communities/o2r)).

**Issues**

- There is no semi-automated workflow for adding a Zenodo record to a community
- A curation policy should guide the community management

## Workflow

- communities metadata element in [Zenodo metadata](http://developers.zenodo.org/#representation) can be used to trigger the workflow only:
> _List of communities you wish the deposition to appear. The owner of the community will be notified, and can either accept or reject your request. Each array element is an object with the attributes:_
- someone needs to curate and "accept" / "approve" ERCs as Zenodo records upon submission, there is no API function for that.
- [UI integration](https://github.com/o2r-project/o2r-platform/issues/180)

## Curation policy

We need to write a policy for that community where all ERC are collected by default when shipped to Zenodo.
They must be in line with http://about.zenodo.org/policies/ and http://about.zenodo.org/terms/.

**Content for the policy**

- the records must be a valid ERC
