# Review of SchubertGeometry (pull request #1224 at a9b73a3)

**Verdict:** accepted

## Previous findings

- R01 — repaired: “ComplexKahlerGeometry K3–K4 … and RealAnalyticGeometry R3.2 … become direct suppliers; on main they entered only as inputs of ComplexComparisonPartII.” Matches the contracts at `TauCetiRoadmap/SchubertGeometry/README.md:550` and `:554`.
- R02 — repaired: The description explicitly removes S9.1’s FormalConnectionsOpers F2.4 comparison and assigns the coordinate-path/tableau comparison to TensorProductCombinatorics; S9.5 retains root-datum specialization. Matches `TauCetiRoadmap/SchubertGeometry/README.md:1823`, `:1839` and `:2060`.

## Verified sound

| Statement cited by repaired prose | Instance | Computed on one side | Computed on the other | Result; change |
|---|---|---|---|---|
| S9.0 coherent comparison (`README.md:1806`) | ℙ¹ over ℂ, O(−2) | Algebraic Čech quotient: basis z⁻¹; dim H⁰=0, dim H¹=1 | Analytic Laurent quotient: basis z⁻¹; dim H⁰=0, dim H¹=1 | Equal; no change |
| S9.5 type-A specialization (`README.md:1839`) | GL₃, π(t)=(t,0,0), central shift t(1,1,1) | Heights (t,0); f₁π(t)=(0,t,0), endpoint (0,1,0) | Shifted heights (t,0); f₁(π+shift)(t)=(t,2t,t), endpoint (1,2,1) | Lowering commutes with central shift; no change |

Rows for untouched statements stand as in the previous review, of `a9b73a3`.

- 0 changed folder lines; 0 of the 15 seeded source targets require reopening; 0 new source locators checked.
- Title, description prose and `roadmap-summary` checked against base/head: 2 previous findings repaired, 0 remaining contradictions or omissions; 2237 insertions/179 deletions and 8 removed/5 added declarations agree.
- 3 supplier/ownership references resolved on main: ComplexKahlerGeometry K3–K4 (`README.md:829`, `:952`, `:1093`), RealAnalyticGeometry R3.2 (`README.md:728`), TensorProductCombinatorics §8.3 (`README.md:2277`).
- All 5 declarations checked with `#check @name` in a scratch copy and compared with README S4.2–S4.4: 0 lost binders or changed types.
- Worker gate and rerun: all checks 0, `OK`; targeted build succeeds, with 5 `sorry` warnings and a repeated module-system advisory; direct elaboration and signature probe exit 0 with only 5 `sorry` warnings each.
- Dependency check output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- 0 files changed outside the folder; worktree clean; overlap data records 0 conflicting heads or dropped cited ids.
- Generated `depends-on` and `merge-order` blocks remain outside this round’s text check.

Overlap check: read KacMoody, TensorProductCombinatorics and RootSystems scopes on main; finite-root-datum path crystals belong to SchubertGeometry S4, coordinate-path comparison to TensorProductCombinatorics §8.3, and root-system foundations to RootSystems and the pins. Other overlap checks stand from the previous review.

Source independence: changed passages only; 0 roadmap passages changed, so 0 passages compared with 0 sources; locator shares and arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 remain settled as uncertified, cited by locator only; no changed roadmap passage cites them.

## Source issues

- **Error** in KnutsonBottSamelson at §4, proof of the subword result, p. 4 (lines 141–148): the source says the image-growth letters have the original word’s product; it should be the Demazure product, which for ii is s rather than e; affects the proof.

## For the human reviewers

- none
