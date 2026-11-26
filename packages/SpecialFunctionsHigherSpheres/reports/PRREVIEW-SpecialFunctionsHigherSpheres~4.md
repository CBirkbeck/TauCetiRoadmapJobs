# Review of SpecialFunctionsHigherSpheres (pull request #2931 at 0b0f994)

**Verdict:** accepted

**Summary.** Accepted: the small correction of the previous review is repaired (the route of 3.1 now says how to pass from the defining sum of the Jacobi polynomial to its expansion in powers of `(1 − X)/2`), and the step it describes was recomputed and is right. The 26 changed lines introduce no defect; no statement and no line of `Suggested.lean` changed. One format note remains, not blocking. As before, none of the four books could be read legally; that, the reuse of names from the author's own formalization, and the ownership bounds of 4.6 are left to the human reviewers.

## N01 — "Prior formalization" still lists what an external repository proves

The commit hash is gone and the section now opens with the timeless sentence on shared names and conventions, but the list of targets that the repository "proves … without `sorry`" (lines 1157–1178) describes another project's state and will go out of date. It could move to the pull request's description, which already has it; this is the author's choice.

## Previous findings

The previous report had no finding; its two other remarks are accounted for.

- C01 — repaired: "LaguerreJacobi §3.2 defines `jacobi` by the sum DLMF 18.5.8 … passing to the form 18.5.7 … is a step of this route: write `X + 1 = 2 - (1 - X)`, expand binomially and sum … by Chu–Vandermonde" (3.1).
- N01 — partly repaired: the commit is no longer named and the section opens with "uses the conventions and names of this roadmap"; the list of proved targets stays (N01 above).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.1 route, the step from DLMF 18.5.8 to 18.5.7 (changed) | `α ∈ {−½, 0, ½, 1, 5/2, −⅓}`, `β ∈ {−½, 0, ½, 2, 7/3}`, `l ≤ 6`, `x ∈ {3/10, −2, 5/7}`, exact rationals | defining sum (as in `Suggested.lean`) = `(α+1)_l/l!` times the Gauss sum in all 630 cases; `α = β = ½`, `l = 3`, `x = 3/10`: `−861/1600` both sides | true | none |
| 3.1 route, the coefficient of `((1 − X)/2)^m` (changed) | same `α`, `β`, `l ≤ 6`, `m ≤ l` | `(−1)^m ∑_k C(l+α,k) C(l+β,l−k) C(k,l−m) = (−1)^m C(l+α,l−m) C(l+m+α+β,m)` in all 840 cases; `α = β = ½`, `l = 3`, `m = 2`: `105/2` both sides | the sum is Chu–Vandermonde after `C(l+α,k) C(k,l−m) = C(l+α,l−m) C(m+α,k−l+m)`, as the route says | none |
| 3.1 Gegenbauer form (cited by the changed route) | `n = 4`, `l = 3`, `t = 3/10` | `P_3^{(½,½)} = −861/1600 = (3/2)_3/3! · ω_{4,3}` with `ω_{4,3} = −123/500`; `C_3^{(1)} = −123/125 = 4 ω_{4,3}` | agrees | none |
| "Scope and ownership", the sentence on SpecialFunctionsLegendre (changed: a link added) | the link target and §3.2, §3.4 on main | the folder and its README exist on main; §3.2 "Orthonormality, the addition theorem and Herglotz's generating function", §3.4 "The Funk–Hecke formula" | resolves | none |

The rows for the statements the change does not touch stand as in the previous review, of `52cd1a7`.

- Source locators checked against the text: DLMF 18.5.7 (dlmf.nist.gov/18.5, text line 558: `(α+1)_n/n!` times the Gauss series in `(1 − x)/2`) and DLMF 18.5.8 (line 600: `2^{−n} ∑ C(n+α,ℓ) C(n+β,n−ℓ) (x−1)^{n−ℓ} (x+1)^ℓ`), both as the route describes them; 0 book locators (no book readable, as before). No target of the seeded sample falls in a changed passage.
- Library declarations opened: `Ring.add_choose_eq` (Mathlib, `Mathlib/RingTheory/Binomial.lean` line 525, the Chu–Vandermonde identity for binomial rings, with a Pochhammer version at line 495), so the identity the route names is at the pin.
- Cross-roadmap citations resolved (the changed ones): LaguerreJacobi §3.2 on main (definition by DLMF 18.5.8, README line 409; its local copy in `Suggested.lean` lines 64–68 has the coefficients `C(n+β,n−k) C(n+α,k)` of `(X − 1)^{n−k} (X + 1)^k`); SpecialFunctionsLegendre §3.2 and §3.4 on main. Both say what is claimed.
- Elaboration of `Suggested.lean`: no error, 60 `sorry` warnings, and the output of the `#check` lines that pin library declarations; nothing else. The file did not change, so the signature comparison and the one-tactic probe of the earlier reviews stand.
- Dependency check: `depcheck: 106 roadmaps, 1217 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- The pull request's text against this head: the change alters nothing the title or the description describes (no statement, supplier, section or declaration); the description already lists SpecialFunctionsLegendre under "Cited, not consumed". Nothing to correct.
- Automatic checks: the text scanners, the dependency check and the targeted build passed; one form check is set aside below.

Overlap check: read SpecialFunctionsMotionGroupsBessel, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsSU2MatrixElements, SpecialFunctionsGroupModels, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsLegendre, SpecialFunctionsBessel, SpecialFunctionsStruve (scopes as in the previous reviews; the changed passages reread against LaguerreJacobi and SpecialFunctionsLegendre on main); Jacobi and Gegenbauer polynomials: LaguerreJacobi; `Y_{l,m}` on `S²`, their addition theorem and Funk–Hecke on `S²`: SpecialFunctionsLegendre; the change moves no ownership; nothing owned twice.

Source independence: changed passages only; 2 passages compared with 1 source (DLMF 18.5.7 and 18.5.8, formulas; nothing shared); the four books were not readable, so no wording was compared with them; largest share Vilenkin–Klimyk Vol. 2, 28 of 61 locators; its contents were not read; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: The targets are the harmonic analysis of the compact rank-one pairs `(SO(n), SO(n−1))` and `(U(n), U(n−1))` as in Vilenkin–Klimyk 1993, Klimyk–Vilenkin 1995, Wawrzyńczyk 1984 and Dieudonné 1980; Hecke's identity of GeometryOfNumbersAndQuadraticArithmetic §4.3 is the Gaussian case of 4.6. This rests on the README and that roadmap, not on a source I read.

## Not verifiable

- Every locator into Vilenkin–Klimyk Vol. 2, Klimyk–Vilenkin (EMS 59), Wawrzyńczyk and Dieudonné, among them those of 3.1: no legal copy was found in the previous rounds and none is in the sources cache. The changed route was checked by computation and against DLMF instead.
- The list of the README's "Prior formalization" and the description's paragraph of that name: the external repository was not opened.

Automatic checks set aside as false positives: the section comment "Supplier declarations named in the README" at the end of `Suggested.lean` is followed by `#check` lines that pin library declarations, which the form rules allow, and not by nothing.

## Source issues

- none

## For the human reviewers

- Licence and reuse: the README ("Prior formalization") says the author's own public formalization lean-SFVK (stated there as Apache-2.0) uses the names and conventions of this roadmap; `Suggested.lean` was not compared with that repository.
- Not tested: Vilenkin–Klimyk Vol. 2 has the largest share of the locators (28 of 61); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, nor with the other three books.
- Scope of 4.6: `hasSum_cexp_inner_sphereEval` assumes `4 ≤ n` and `fourier_mul_eval_div_norm` assumes `1 ≤ l`, called ownership boundaries in "Scope and ownership"; the open sibling states `n = 3` in its own `Y_l^m` and the case `l = 0`.
