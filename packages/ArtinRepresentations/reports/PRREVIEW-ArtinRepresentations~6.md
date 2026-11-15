# Review of ArtinRepresentations (pull request #1711 at 3595fc9)

**Verdict:** needs changes

Incremental re-review of 79 changed lines since 67a9da9. The five findings of the previous report are repaired; the repair of the §8.2 route cites one supplier target for an identity that target does not state.

## R01 (P3) — §8.2: the ramified factor of `π_f` is cited to R16.6.6, which does not state it

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1810–1812`, “gives the factor `(1 − a_p p^{−s})^{−1}` at `p ∣ N`, the local factor of `π_f` at `p` through R16.6.6's newvector comparison.”

**Claim:** GL2AutomorphicRepresentationsAndTransfer R16.6.6 supplies `L(s, π_{f,p}) = (1 − a_p p^{−s})^{−1}` at `p ∣ N` for a weight-one newform.

**Witness:** R16.6.6 (open head) states the bijection, exact conductor `N` and the parameter `1 ⊕ sgn`; no bad-prime factor. The identity “the classical ramified factor is `(1−a_p p^(−t))⁻¹`” is R16.6.2, stated for the `k ≥ 2` adapter of R16.6.1.

**Repair:** Replace the sentence by: “On the newform side Tau Ceti's `HeckeRing.GL2.Newform.L_eulerProduct_tprod` gives the factor `(1 − a_p p^{−s})^{−1}` at `p ∣ N`. Prove that it is the local standard factor of `π_f` at `p`: by R16.6.6 `f` is the normalized newvector tensor of `π_f`, so `a_p` is the eigenvalue of `U_p` on the newvector line (AutomorphicLFunctionsAndLocalFactors AL.2.2.4–AL.2.2.5), and the ramified Hecke dictionary of GL2AutomorphicRepresentationsAndTransfer R16.6.2, whose argument is independent of the weight, applies at `k = 1` with `t = s`.” Add R16.6.2 and AutomorphicLFunctionsAndLocalFactors AL.2.2 to the `*Needs:*` line (README line 1865) and R16.6.2 to the supplier list (line 176), and in the description write “(GL2AutomorphicRepresentationsAndTransfer R17.5.5, R16.6.2 and R16.6.6)”. Tested on `η(z)η(23z)`: `v₂₃(N) = v₂₃(cond χ) = 1`, R16.6.2's one-ramified-character case, `a₂₃ = α(ϖ) = 1`, factor `1 − X`, equal to the Artin factor.

## Previous findings

- R01 — repaired: README lines 1803–1813 name §2.10 for `p ∤ N` only, ModularityAndLanglandsExtensions §1.2 with R17.5.5 for `p ∣ N`, and Tau Ceti's Euler product on the newform side; one citation in it is this report's R01.
- R02 — repaired: `finiteLocalPolynomial` is the `∑ᶠ` over the set of polynomials of all pairs `(Q, σ)`; no `choose` in the file; gate `statement-hygiene=0`.
- R03 — repaired: `finiteNPlus` is `⨅` over the places `w` above `v` of the dimension of the invariants of `MulAction.stabilizer (L ≃ₐ[F] L) w`; README lines 442–444 reworded to match.
- R04 — repaired: the description now says “Container labels in degree at most 5 cite `TransitiveGroupLabel` of PolynomialGaloisGroups Layer 6 (on main); above degree 5 … no numerical label.”
- R05 — repaired: the description now says “Conductors, scalar local constants, equal-characteristic local constants and the proved cases are consumed by name; the higher-rank local constants in characteristic zero are constructed in §2.4.”

## Verified sound

| Statement | Instance | Values computed on each side | Result; change |
|---|---|---|---|
| `finiteLocalPolynomial` (changed body) | `S₃` plane of conductor 23 at `p = 23` (`e = 2, f = 1, g = 3`) | Every pair `(Q, σ)`: `ρ(σ)e_Q` has eigenvalues 1, 0; charpoly `X² − X`, reversed `1 − X`. Set `{1 − X}`, finsum `1 − X`. | Agrees with `det(1 − X Frob | V^I)`; none. |
| same, unramified | same representation at `p = 2` | Inertia trivial, `∑ᶠ` over one element is `ρ(1)`, `e = 1`; Frobenius of order 3: `1 + X + X²`; singleton set. | Agrees; none. |
| same, junk value | no pair above `v` | Empty set, finsum `0`; unreachable by Tau Ceti `exists_isArithFrobAt` (`NumberField/Frobenius.lean:67`). | No effect. |
| `finiteNPlus` (changed body) | `χ₋₄` on `ℚ(i)/ℚ`; trivial line; `S₃` plane; totally real `L` | Stabilizer of order 2, 2, 2, 1; invariants of dimension 0; 1; 1 at each of three places; `dim V`. README `n₊`: 0; 1; 1; `dim V`. | Equal; none. |
| same, inside `exists_meromorphicContinuation` | `ζ_{ℚ(i)} = ζ · L(χ₋₄)` at `s = 0` | Order `n₊ − dim V^G`: trivial `1 − 1 = 0`, `χ₋₄` `0 − 0 = 0`; `ζ(0) = −1/2`, `L(0, χ₋₄) = 1/2`, both nonzero. | Agrees; none. |
| §8.2 route, good primes | `Eig(f)` against `Eig(ρ_f^∨)` at `p ∤ N`, `k = 1` | Newform: `t_p = a_p`, `p·s_p = ψ(p)`. `ρ_f^∨` at geometric Frobenius: trace `a_p`, `q⁻¹det = ψ(p)/p`. | Equal in both coordinates: R17.5.5's weak hypothesis holds. |
| §8.2 route, infinity | `ψ` odd | `ρ_f(c)` has eigenvalues `1, −1`, so does `ρ_f^∨(c)`: parameter `1 ⊕ sgn`; R16.6.6 gives `1 ⊕ sgn` for `π_f`. | Equal: R17.5.5's archimedean hypothesis holds. |
| §8.2 route, `p ∣ N` (R01) | `η(z)η(23z)` at 23 | Tau Ceti factor: `dirichletLift(23) = 0`, so `(1 − a₂₃ 23^{−s})^{−1}`, `a₂₃ = 1`. Artin side `1 − X`. Link `a_p ↔ π_{f,p}`: R16.6.2, not R16.6.6. | R01. |
| `HeckeRing.GL2.Newform.L_eulerProduct_tprod` as cited | pinned statement, `LFunction/EulerProduct.lean:234` | Hypotheses `0 < k`, `k/2 + 1 < Re s`; factor `1 − a_p p^{−s} + dirichletLift(p) p^{k−1} p^{−2s}` over all primes. README: same range, same factor. | Agrees; none. |
| Description, “9 layers and 44 milestones” | heading count at the head | 9 `## Layer` headings; 44 numbered `###` sections. | Correct. |

The rows of the untouched statements stand as in the previous review, of `67a9da9`.

- Gate at 3595fc9 (the worker's run): every scanner 0, `statement-hygiene=0`, `build=0`, `outside-folder=0`, `stray-files=0`, OK. A rerun without the candidate merge order prints `depcheck: NOT IN ORDER: ArtinRepresentations`, which is the placement after the last supplier and no defect.
- Dependency check with `--movable` and the candidate order: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ArtinRepresentations/Suggested.lean` at the pins: eleven `declaration uses sorry` warnings, nothing else. The elaborated types of the two changed definitions keep every binder of their signatures.
- Library declarations opened: 6 (`toEigenform`, `TauCeti/NumberTheory/ModularForms/Newforms/FullEigenform.lean:128`; `L_eulerProduct_tprod`, `TauCeti/NumberTheory/ModularForms/LFunction/EulerProduct.lean:234`; `dirichletLift`, `Newforms/Newform.lean:134`; `exists_isArithFrobAt`, `TauCeti/NumberTheory/NumberField/Frobenius.lean:67`; `comap_surjective` and `isUnramified_iff_stabilizer_eq_bot`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:86, 384`).
- Cross-roadmap citations resolved at the open heads: 5 (GL2AutomorphicRepresentationsAndTransfer R16.6.6, R17.5.5, R16.6.2; ModularityAndLanglandsExtensions §1.2, whose Checks include the weight-one match through the dual; AutomorphicGaloisRepresentations §2.10, good primes only). The README no longer cites the ModularForms roadmap; the worker's 26 unresolved names are own, supplier and database names, as before.
- Description read against the head: title, summary block, the supplier sentence of §8.2, the label sentence, the file list and `metadata.toml` (`math.NT`) agree with the head, except the id asked for in R01. The pull request adds the roadmap; nothing changes outside the folder against the base.
- Source locators checked this round: 0; the changed passages carry no new source locator and the seeded sample falls in unchanged text. Overlap check: the overlap tool's result at the current heads was read (no other pull request changes this roadmap, no cited id dropped, no second copy, none close by results or headings); the scopes of ArithmeticGaloisRepresentations, ZerosOfLFunctions, GL2AutomorphicRepresentationsAndTransfer, FiniteGroupInvariants, HilbertModularForms, NumberFieldArithmetic and LFunctions were not read again, the change touching no ownership; GL2AutomorphicRepresentationsAndTransfer owns the objects R01 names.
- Source independence: changed passages only; 6 passages compared (four README passages, two docstrings) with 0 sources, none shared, since none of them restates a source; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The items of the earlier reviews stand: `neukirch1999`, `serrerep`, `serrelocal`, `tate1979`, `tate1984`, `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`, `frohlich1985`, `klein1884` are publisher-only or unresolved; none is touched by this round.
- The LMFDB column name `conductor_primes` (README, §7.8) is not in the cached display code.

## Source issues

- none

## For the human reviewers

- Not tested: the publisher-only sources listed under “Not verifiable” (among them `neukirch1999`, `serrerep`, `tate1984`) were not read by any review round; wording and arrangement were not compared with them.
