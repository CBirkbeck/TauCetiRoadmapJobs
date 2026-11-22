# Review of GluedTargetAndDivisionInequality (pull request #2922 at 5cb15ba)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 15 lines changed since `54c521b`: the route of 8.7 (b) now derives the bound for the branching integer, linear in `N_m`, from the cited supplier sections, and I recomputed every step of it; the description now agrees with the head. There are one small correction (the statement of 8.7 (b) does not name the hypotheses of the lemma its route now cites), one format note and one question, none blocking. The scope and the licence of the formal proof remain for the human reviewers.

## C01 — The second bound of 8.7 (b) is stated "under `SizeT_u`" with `a⁻_τ ≤ 2b′`, but its route now uses ThetaChainsOnDefiniteUnitaryGroups §2.3b (f), which holds for an adapted datum under `Size(x, ε)` and `SizeSc`.

A reader who applies 8.7 (b) alone has a constant `C₂` whose bound needs more than the statement names. The new sentences of the route (lines 703–708) use that the entries `u_1(τ), …, u_{k−2}(τ)` lie in `[0, Sc]` and that the step weights lie in a window of width `ϑ + 1` (the definition of an adapted datum, §2.3b), that `u_0(τ) ≤ 2a` (§2.3b (f), "for an adapted datum and `x ≥ x₀(ε)` (under `Size(x, ε)` and `SizeSc`)"), and, for `w_m(τ) ≤ 2a` at a thick place and `log(4a + N_m) ≤ C·La`, the bounds `ϑ ≤ b/(t³fk³)` of `SizeTheta` and the polynomial bounds on `k`, `t` of `SizeK`, `SizeT`. The consumers 8.9 and 8.22 carry `Size(x, ε)`, so nothing downstream changes. In the statement of (b), before "under `SizeT_u`", add "for a weight datum adapted in the sense of ThetaChainsOnDefiniteUnitaryGroups §2.3b, under `Size(x, ε)` and `SizeSc`".

## N01 — The Conventions, 8.1 and 8.5c cite BernoulliBoundsForClassGroupEigenspaces §6.17, ArithmeticKTheory §6.9 and HeightsAndUnits §0.3 for comparison; none is in the supplier contracts or a Dependencies list. One line saying that they are comparisons and not inputs would let a reader tell them from suppliers (as in the previous review; the text is unchanged).

## Questions for the author

- The References give "L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897)". Is that title not Lerch's paper alone, with Kronecker's limit formula a separate work? I did not open either text.

## Previous findings

- none: the review of `54c521b` had no finding (R). Its small correction on the branching integer of 8.7 (b) is repaired: "`D₁(τ) ≤ 3D₀(τ) + Sc + ϑ + 1`; and `sp(τ) = u_0(τ) + w_m(τ) + t/2 + 1 ≤ 4a + N_m`", with the clause removed from the list of routes not given. Its small correction on the description is repaired ("of every word"). Its format note stands (N01).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 8.7 (b), number of factors of `c_{Br,τ}` | IntegralWeyl §1.1; `λ = (3,1,0)`, `σ = (2,0)` | `D₀ = 1`, `D₁ = min(2,1) + min(1,1) = 2`, `(N−1)·D₁ = 4` factors, `c_Br = 4`; supplier (d): `≤ spread^{(N−1)D₁}` | holds |
| 8.7 (b), the gaps of `Λ_m(τ)` | all `N_m − 1` gaps of `HC_m − ρ` | inside a segment `1 − 1 = 0`; between segments `w_{j+1} − w_j − t − 1`, sum `w_m − w_1 − (m−1)(t+1) ≤ ϑ + 1`; `u_1 − u_{k−2} − (k−3) ≤ Sc`; count `(k−1) + 1 + (m−1) + mt = N_m − 1` | holds |
| 8.7 (b), `D₁(τ) ≤ 3D₀(τ) + Sc + ϑ + 1` | three remaining gaps | each term is `min(gap, D₀) ≤ D₀`; total `3D₀ + Sc + ϑ + 1` | holds |
| 8.7 (b), the spread | ends of `Λ_m(τ)` | `Λ_{m,0} = u_0 − (N_m−1)/2`, `Λ_{m,N_m−1} = −w_m − t/2 + (N_m−1)/2`; `sp = u_0 + w_m + t/2 + 1`; `u_0 ≤ 2a`, `w_m ≤ b + ϑ + 1 ≤ 2a`, `t/2 + 1 ≤ N_m` | holds under §2.3b (f), see C01 |
| 8.7 (b), the top term `t_u` | sum over `τ` | `(N_m − 1)(3D₀ + Sc + ϑ + 1)·log(4a + N_m) ≤ C·N_m(D₀ + Sc + ϑ)La`; with `D₀ ≤ Sc + mϑ + 2b′[top]`: `C·N_m(2\|Φ_top\|b′ + f(2Sc + (m+1)ϑ))La` | equals the stated `t_u` |
| `pairing_integral_of_localDivision` (headline 1) | elaboration | type unchanged since `54c521b`; `sorry` the only warning | holds |

The rows for the statements the change does not touch stand as in the previous review, of `54c521b`.

- Source locators checked against the text: 1 ([FormalProof], `Development/AbelianVarietyTheory/BlockTheory/DivisorBase/ScaledCoisometryNorms.lean`, declaration `BrNorm` in the namespace the README names, of the sampled target 8.7; the other sampled targets lie outside the changed passages).
- Cross-roadmap citations resolved at the open heads, read in text: ThetaChainsOnDefiniteUnitaryGroups §§2.1 (scale, `SizeTheta`), 2.3 (`HC_j`, `Λ_j`, segments), 2.3b (adapted data, lemma (f)), 3.9 (`D₀`, `D₁`, `c_{Br,τ}`, spread); IntegralWeylModulesOfGeneralLinearGroups §1.1 (`D₁`, (d), (e)).
- Library declarations opened: none new (the change touches no Lean statement).
- Dependency check: `depcheck: 168 roadmaps, 1964 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with the `sorry` warning only; single `import Mathlib`.
- The pull request's text: title and description read against the head; no sentence contradicted (new folder, one Lean declaration, hypotheses of 7.13, 7.14, 8.9 as in the README).
- No change outside the roadmap folder and the family index.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, RowTowerAndRallisIdentities, LocalGainOfThetaChains, CongruenceModulesOfThetaLifts; nothing shared (as in the previous review; the change adds no object, and `D₁`, `c_{Br,τ}` and the spread are cited from ThetaChainsOnDefiniteUnitaryGroups §3.9 and IntegralWeylModulesOfGeneralLinearGroups §1.1).

Source independence: changed passages only; 2 passages compared with 2 supplier sections and no external source (the change adds no source locator), none shared; largest share [FormalProof], 112 of 115 locators; arrangement not compared again (no layer added, removed or reordered).

Research link: Layers 7–8 give the integrality, heights and target slopes that the slope inequality for chains of theta lifts needs in Alpöge's formal proof (announced 2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3). Rests on the README's Routes paragraph, Announcement and Bost1996.

## Not verifiable

- [FormalProof]: one declaration was located by name in a copy of the public repository; the remaining file and declaration locators were not opened in this round.
- 8.19e (b), (c), 8.20 (vii) (a)–(h), step (3) of 8.20a at the orbits that do not alternate, 8.24b (i), (iii) and 8.24c: stated without routes, on [FormalProof] alone (unchanged).

## Source issues

- none

## For the human reviewers

- Scope: the README follows a formal proof announced on 20 November 2026 (Routes paragraph; References). Announcement is a four-page unrefereed note; no refereed source states the targets 8.9 or 8.22.
- Licence: [FormalProof] is a public repository whose host the sources service does not classify and whose licence status I did not settle. Announcement line 53 gives the Lean source as archive parts on the author's site, not the repository in the References.
- Not tested: [FormalProof] has 112 of the README's 115 locators; wording and arrangement were not compared with it.
