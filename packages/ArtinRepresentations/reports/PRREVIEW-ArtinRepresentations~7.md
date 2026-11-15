# Review of ArtinRepresentations (pull request #1711 at 9054814)

**Verdict:** accepted

Incremental re-review of 26 changed lines since 3595fc9, and a check of the title and description against this head. No finding.

## Previous findings

- R01 — repaired: README lines 1817–1825 prove `(1 − a_p p^{−s})^{−1} = L(s, π_{f,p})` from R16.6.6 (exact conductor, finite newvector), AL.2.2.4–AL.2.2.5, R16.5.1 and AL.3.3.5 at `n = 2`; the supplier list, the `*Needs:*` line and the description name the same ids.

## Verified sound

| Statement | Instance | Values computed on each side | Result; change |
|---|---|---|---|
| §8.2, factor at `p ∣ N`, one ramified character | `η(z)η(23z)` at 23: `π_{f,23} = π(μ₁, μ₂)`, `μ₁` unramified, `c = 1` | Newvector `W(diag(ϖ^j,1)) = q^{−j/2} μ₁(ϖ)^j`, `j ≥ 0`; zeta integral `Σ μ₁(ϖ)^j q^{−js} = (1 − μ₁(ϖ)q^{−s})^{−1} = L(s, π_p)`; `a₂₃ = μ₁(ϖ) = 1`. Artin side `1 − X`. | Equal; none. |
| same, supercuspidal component | `v_p(N) ≥ 2`, `a_p = 0` | Newvector supported on units of the torus: integral `1`; `L(s, π_p) = 1`; Tau Ceti factor `(1 − 0)^{−1} = 1`; Artin side `V^I = 0`, polynomial `1`. | Equal; none. |
| same, variable at `k = 1` | R16.5.3's shift `(k − 1)/2` | `k = 1`: shift `0`, `L(s, π_f) = L_f(s)`; `k = 2`: shift `1/2`. README: “classical and unitary variables coincide” at `k = 1`. | Agrees; none. |
| R16.5.1 as cited | open head of GL2AutomorphicRepresentationsAndTransfer | States the unfolding of `∫ φ(diag(a,1)) χ(a) |a|^{s−1/2}` into AL.2 local Whittaker integrals for factorizable cusp `φ`; its caveat concerns ramified twists; README uses `χ = 1`. | Supports the step; none. |
| AL.2.2.4, AL.2.2.5, AL.3.3.5 as cited | open head of AutomorphicLFunctionsAndLocalFactors | AL.2.2.4: `dim π^{K₁(pⁿ)} = max(0, n − c + 1)`, line at `c`, `W(1) ≠ 0`. AL.2.2.5: `W(1) = 1`. AL.3.3.5: at `n = 2` the spherical-twist test “including the equality with the standard local factor”. | Each states what the README assigns to it; none. |
| R16.6.6 as cited | same head | Classes “of exact conductor N”, and “the finite newvector condition” ties the conductor to `N`; parameter `1 ⊕ sgn`. | Supports “exact conductor `N` … finite newvector”; none. |
| Description, last §8.2 paragraph | head, README lines 1811–1825 and 1877–1879 | Description: R17.5.5, R16.6.6, R16.5.1, AL.2.2.4–AL.2.2.5, AL.3.3.5, R16.5.3 “only in weight at least two”. README: the same ids; R16.5.3 at its head: `k ≥ 2`. | Agrees; none. |
| Description, “9 layers and 44 milestones” | heading count at the head | 9 `## Layer` headings; 44 numbered `###` sections. | Correct. |

The diff changes no Lean statement; the rows of the untouched statements stand as in the previous review, of `3595fc9`.

- Gate at 9054814 (the worker's run): every scanner 0, `depcheck=0`, `build=0`, `outside-folder=0`, `stray-files=0`, OK.
- Dependency check with `--movable` and the candidate order: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. AutomorphicLFunctionsAndLocalFactors and GL2AutomorphicRepresentationsAndTransfer, the suppliers of the new citations, precede this roadmap in the order.
- Elaboration of `TauCetiRoadmap/ArtinRepresentations/Suggested.lean` at the pins: eleven `declaration uses sorry` warnings, nothing else. The file is unchanged since `3595fc9`.
- Cross-roadmap citations resolved at the open heads: 7 (GL2AutomorphicRepresentationsAndTransfer R16.5.1, R16.5.3, R16.6.6, with R16.6.2 read for comparison; AutomorphicLFunctionsAndLocalFactors AL.2.2.4, AL.2.2.5, AL.3.3.5). Library declarations opened: 1 (`HeckeRing.GL2.Newform.L_eulerProduct_tprod`, `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean:234`).
- Title and description read against the head and the change against the base: the pull request adds the roadmap (2674 insertions, no deletion, nothing outside the folder); the summary block, the supplier sentences, the file list and the layer and milestone counts agree with the head.
- Source locators checked this round: 0; the changed passages carry no source locator and the seeded sample falls in unchanged text.
- Overlap check: read GL2AutomorphicRepresentationsAndTransfer (R16.5–R16.6) and AutomorphicLFunctionsAndLocalFactors (AL.2.2, AL.3.3); the scopes of ArithmeticGaloisRepresentations, ZerosOfLFunctions, FiniteGroupInvariants, HilbertModularForms, NumberFieldArithmetic and LFunctions were not read again, the change touching none of their objects. The weight-one identification of the newform's factor at `p ∣ N`, newly listed as owned here, has no other owner: R16.5.3 and R16.6.2 state it for `k ≥ 2` only, and a search of the open heads and main found no weight-one statement of it. No other pull request changes this roadmap, no cited id is dropped, no second copy.
- Source independence: changed passages only; 4 passages compared with 0 sources, none shared, since none of them restates a source (they cite supplier roadmaps); no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The items of the earlier reviews stand: `neukirch1999`, `serrerep`, `serrelocal`, `tate1979`, `tate1984`, `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`, `frohlich1985`, `klein1884` are publisher-only or unresolved; none is touched by this round.
- The LMFDB column name `conductor_primes` (README, §7.8) is not in the cached display code.

## Source issues

- none

## For the human reviewers

- Not tested: the publisher-only sources listed under “Not verifiable” (among them `neukirch1999`, `serrerep`, `tate1984`) were not read by any review round; wording and arrangement were not compared with them.
