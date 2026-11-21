# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #2904 at 9127baa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding. 0.5d, 0.5e and 0.5f still rest on neither a source nor a complete route: the repair gave 0.18a (a)–(b) and 0.5h (4′) complete routes, which I checked step by step, but left these three as they were. The other repairs are correct: the sign of `c₁(L_λ)` with its nefness proof and Check, the hypothesis at ramified primes in headline 3, the corrected remark after 0.5e with its new Check, and the citation of HodgeTateAndCanonicalSubgroups §2.4 in the route of 2.4. There is one small correction (the targets that still carry no locator) and one format note; the human reviewers still have to decide on scope and on the licence of [FormalProof].

## R01 (P2) — 0.5d, 0.5e and 0.5f are still supported by neither a source nor a complete route

An implementer who cannot prove one of these targets, or finds it false, has nothing to check it against. Yet GluedTargetAndDivisionInequality §8.20a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ and TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c build on them (Downstream consumers, lines 662–663). This is what remains of the earlier point on unsupported targets. Each of the three routes still ends with "The remaining steps of the route are not given here" (0.5d line 226, 0.5e line 245, 0.5f line 260). None of the three carries a locator, and the [FormalProof] entry (line 750) names no file or declaration.

The steps left out are not routine. In 0.5d (b) they include "the two statements on the Hopf algebra". These give `X(τ)^p ≤ X(Frob τ)·|p|^{r(Frob τ)}`, the inequality on which the recursion for `X(τ)` rests. In 0.5e they include the bound `X_w ≤ |c_p|^{rk Lie_{B,w}}` with its three inputs and the two colength facts for `O[α]`. The smallest repair: for each of 0.5d, 0.5e and 0.5f, name the file and declaration of [FormalProof] that proves it, at a fixed commit, or a published theorem with its locator. Writing out the listed steps would also do.

## C01 — Apart from 3.2 and the Lubin–Tate Check of 0.5d, no target carries a locator, and [FormalProof] is cited without a file

The other targets taken from the formalisation now have routes complete enough to check: 0.5a–0.5c, 0.5g, 0.5h, 0.17a, 0.17b, 0.18a, 2.4, 3.1 and 3.3–3.6. So no stated result is left unsupported, but a reader still cannot compare a statement with the declaration it comes from. The Katz–Mazur reference (line 748), given for the models of the Checks of 0.17a and 0.5c, also has no chapter or theorem number. Naming the [FormalProof] file or declaration for each target it supplies, and a theorem number for Katz–Mazur, would close the rest of the earlier point.

## N01 — Layers 0 and 2 still depend on each other

Layer 0's Dependencies (line 461) list 2.4 of Layer 2, and Layer 2's Dependencies (line 491) list 0.5b of Layer 0. The item order given at line 461 has no cycle; only the layer numbering is out of build order. Either move 2.4 into Layer 0 after 0.5b, or move the targets that use it after Layer 2.

## Questions for the author

- [FormalProof] gives `github.com/leanprover-community/riemann-hypothesis`, while the announcement's footnote (Announcement line 53) points to archives on the author's own page. Are these the same development? I could not open the repository from a legal source here.

## Previous findings

- R01 — repaired: 0.17b (d) now defines "`L_λ = ⊗_i (F_{i+1}/F_i)^{⊗(−λ_i)}`, so that `c₁(L_λ) = −Σ_i λ_i x_{σ,i}`" and proves nefness by global generation of the `(det F_k)^{−1}`. 0.17a (c), headline 3 and a new Check of 0.17b follow this convention.
- R02 — repaired: headline 3 reads "At primes ramified in `E`, if moreover the eigen-quotients of `ω^{HT}_R` are locally free near the fibre (as on the model of 0.5c (b)), the same holds with a twist by the different".
- R03 — repaired: "When `r⁻·(1/(p − 1) + vd/2) < r⁺/(p − 1)`, for instance when `r⁻ < r⁺` and `E_w/ℚ_p` is unramified, this improves the bound". The counterexample is now a Check of 0.5e.
- R04 — partly repaired: 0.18a (a)–(b) and 0.5h (4′) now have complete routes, and the 0.5d Check cites "Schneider–Teitelbaum, Appendix, Theorem (c), with `e = 1` and `q = p^h`". The routes of 0.5d, 0.5e and 0.5f still end "The remaining steps of the route are not given here" (R01, C01).
- C01 — repaired: "it is also a left inverse, `g_x(λ) = T_x`".
- C02 — repaired: "Integrally `α_G∘(α_{G^D})^∨ = 0`, and the sequence is exact over `C`: HodgeTateAndCanonicalSubgroups §2.4, which states both with no restriction on `p`."
- C03 — repaired: "Tau Ceti has finite flat commutative group schemes over any base (`TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`) … but no semi-abelian schemes and no quasi-finite torsion `G[p^R]`."
- C04 — repaired: the description now says "Its suppliers still in open pull requests, HodgeTateAndCanonicalSubgroups and LubinTateFormalModulesAndQuasiCanonicalLifts, merge first."
- N01 — not repaired: Layer 0's Dependencies still begin "Layer 2 (2.4, which needs only 0.5b)", and Layer 2's still list "Layer 0 (0.5b)" (N01 above).
- N02 — repaired: "*image*", "*not*" and "*trivial*" are now in italics (lines 61, 361, 367, 373).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.17b (d), sign of `c₁(L_λ)` | `N = 2`, flag variety `P¹`, `λ = (1, 0)` | stated sign: `L = F_1^{−1} = O(1)`, degree `+1`, nef; opposite sign: `O(−1)`, degree `−1` | holds |
| 0.17b (d), nefness route | general `N`; `N = 3`, `λ = (2,1,0)` | exponent of `gr_i`: `Σ_{k>i}(λ_k−λ_{k−1}) − λ_{N−1} = −λ_i`; `N = 3`: `(det F_1)^{−1}⊗(det F_2)^{−1}`, `c₁ = −2x₀ − x₁` | holds |
| 0.17b, new sign Check | Katz–Mazur blow-up `X′`, curve contracted to supersingular `y` | `𝓘O_{X′}` relatively ample: `deg ω^{HT}_R > 0`, `deg Lie^{HT}_R < 0`; such curves exist (ZMT, `𝓘` not invertible, `X` normal) | holds |
| 0.17a (c), numbering | against 0.17b (d), `𝔡_σ = O` | `Lie_σ ⊗ μ ⊂ T_σ ↠ ω_{σ̄}`: `Lie` pieces first, then `ω_{σ̄}` pieces, as `F_i` | consistent |
| Headline 3, ramified clause | against 0.17b hypothesis (line 393) | both: `ω^{HT}_R` and every `ω^{HT}_{R,σ}` locally free near the fibre over `ℓ` | consistent |
| 0.5e remark | `E_w/ℚ_p` unramified, `vd = 0` | `n·r⁻/(p−1) < n·r⁺/(p−1)` iff `r⁻ < r⁺` | holds |
| 0.5e new Check | `p = 3`, `E_w = ℚ_3(ζ_9)` | `v_3(disc) = 3(6−2−1) = 9`, `vd = 3/2`; 0.5e: `6(1/2+3/4) = 15/2`; 0.5f: `6`; `3 = (1+√−2)(1−√−2)` swapped by `c` | holds |
| 0.5e Check, signature `(1,1)` | split quadratic place, `n = 1` | 0.5e: `1/(p−1)`; 0.5f: `1/(p−1)`; no improvement when `r⁻ = r⁺` | consistent with remark |
| 0.5d Check, Lubin–Tate height `h` | SchneiderTeitelbaum2001 line 1234, `e = 1`, `q = p^h` | source `s = 1/(p−1) − 1/(e(q−1))`; README `1/(p−1) − 1/(p^h−1)` | locator correct |
| 0.5d (a), R01 | height 2, `𝒪_w = ℤ_{p²}` | `S(τ_0) = p⁻¹ + p⁻³ + ⋯ = p/(p²−1)`; Hopf-algebra step of route absent | consistent; unsupported → R01 |
| 0.5f, R01 | Tate curve over `O` | `ω` generated by `dT/T`, so `κ = 1` works; route stops after one sentence | consistent; unsupported → R01 |
| 0.5h (4′), new route | ordinary `E` over `O_C`, `H = μ_p` | `u∘f = [p]`, `deg u = p`; `E[p]/μ_p ≅ ℤ/p ⊂ A′[p]`; `x ↦ x̃` additive mod `p`; Vandermonde `∏_{i<j<p}(j−i)` a unit, generates | holds |
| 0.18a (a), orders | Tate curve (`g = r = 1`); abelian (`r = 0`) | `|G[p^n]^f| = p^n` (`μ_{p^n}`), `T_n/H_n ≅ ℤ/p^n`, `rk 𝒜_n = p^{2n}`; `r = 0`: `H_n = T_n` | holds |
| 0.18a (a), quotient `T_n/H_n` | `pt ∈ H_n` | `pt ∈ H_n ∩ T_{n−1} = H_{n−1} = pH_n`; `p`-torsion order `p^{2g}/p^{2g−r} = p^r`, hence `(ℤ/p^n)^r` | holds |
| 0.18a (b), `𝔊_{n+1}[p^n] = 𝔊_n` | coset `t + H_{n+1}` | kernel meets it iff `p^n t ∈ H_1 = p^nH_{n+1}`; `𝔊_{n+1}/𝔊_1`, `𝔊_n` both rank `p^{2gn}` | holds |
| 0.18a (a), finite part | henselian `O_C`, quasi-affine `G[p^n]` | open-closed complement of finite part has empty closed fibre; group law preimage clopen in finite scheme, nonempty only if meeting closed fibre | holds |
| 0.18a route, Mathlib input | `Scheme.Hom.toNormalization` | instance: locally quasi-finite, locally finite type, separated, quasi-compact gives `IsOpenImmersion` (ZariskisMainTheorem.lean line 358) | as cited |
| 2.4 (a), route via supplier | `μ_{p^∞}`, `ℚ_p/ℤ_p` | HodgeTateAndCanonicalSubgroups §2.4: composite zero, exact over `C`, odd `p` only for the cokernel; `0→C(1)→C(1)→0`, `0→0→C→C→0` | holds |
| 3.1, left inverse | `Suggested.lean` lines 107, 110 | line 107 `λ_x(g) = T_x` (right inverse); line 110 `g_x(λ) = T_x` (left inverse) | wording matches |
| `Suggested.lean` docstring | Tau Ceti at the pin | `FiniteFlatCommGroupScheme (S : Scheme)` (FiniteFlat.lean line 58); Cartier duality in HopfAlgebra/FiniteDual/CartierDuality | true |

The rows for the statements the change leaves untouched stand as in the previous review, of `9f0abc7`.

- Source locators checked against the text: 1 (SchneiderTeitelbaum2001 lines 1230–1234, Appendix, Theorem (c), arXiv v1 p. 33); Announcement line 53 for the question.
- Library declarations opened at the pins: Mathlib `AlgebraicGeometry.Scheme.Hom.toNormalization` (Mathlib/AlgebraicGeometry/Normalization.lean line 132) and its open-immersion instance (Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean line 358); Tau Ceti `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean line 58) and TauCeti/Algebra/HopfAlgebra/FiniteDual/CartierDuality/Basic.lean.
- New or changed cross-roadmap citations resolved: 9 in total. On main: AbelianSchemesAndArithmeticModuli §§A2.3, A2.5 (with `Polarization.ofAmple`) and A3.3, PadicDifferentialEquationsAndRigidCohomology §RD.5.116, and SchemeAndStackFoundations §0.14 (its quasi-finite splitting over a henselian local ring). At the open head of HodgeTateAndCanonicalSubgroups: §§0.13, 0.18 and 2.4. All are present with the cited subjects.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 171 roadmaps, 1997 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings (lines 66, 102). The Lean declarations are unchanged since `9f0abc7`, so the earlier signature comparison and one-tactic probe stand.
- No file outside the folder changed since `9f0abc7`. Against the base, only the family index changed outside the folder, and the pull request carries it as its own.
- Pull request text: checked against this head; every sentence holds, including the list of suppliers on main and the remark on where routes stop.

Overlap check: the closest roadmaps (TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, LocalGainOfThetaChains, HeightsForLogSingularMetrics open; ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, FiniteFlatGroupsAndIntegralPadicHodgeTheory on main) stand as read in the previous review, and the change adds no owned object. Read now for the new citations:
- AbelianSchemesAndArithmeticModuli owns quotients by finite locally free subgroups and polarisations (§§A2.3, A2.5, A3.3).
- PadicDifferentialEquationsAndRigidCohomology owns Zarhin's trick (§RD.5.116), which ShimuraCompactifications and FaltingsFinitenessAndIsogenyTheorems also cite.
- SchemeAndStackFoundations owns the splitting of quasi-finite algebras over a henselian local ring (§0.14).
- HodgeTateAndCanonicalSubgroups owns the integral vanishing of the composite at every prime (§2.4).

This roadmap cites each of them and restates none.

Source independence: changed passages only. Three passages were compared with 2 sources: the 0.5d Check and the References entry with SchneiderTeitelbaum2001, Appendix, Theorem (c) (the formula only), and the [FormalProof] entry with the Announcement. Three further changed passages were compared with the supplier sections they cite: the routes of 0.18a (a)–(b), of 0.5h (4′) and the nefness step of 0.17b (d). None shares wording. The largest share of locators is Hazewinkel 1978, with 3 of 4 (all in 3.2). The change adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: 0.5b extends Fargues' cokernel bound for the Hodge–Tate map (Fargues 2010–2011, through HodgeTateAndCanonicalSubgroups §0.5) to `p = 2`. 0.5a–0.5c are integral Hodge–Tate lattices of the kind behind Pilloni–Stroh's modified Hodge bundles (HodgeTateAndCanonicalSubgroups §5.5). Layer 3 extends Hazewinkel's functional-equation lemma (1978) to several variables. The family follows Alpöge's formal proof announced in 2026. This rests on the README and on HodgeTateAndCanonicalSubgroups.

## Not verifiable

- Hazewinkel, Formal Groups and Applications, 1978 (the locators of 3.2: I.2, II.10, §2.2): the sources service found no legal copy.
- Katz–Mazur, Arithmetic Moduli of Elliptic Curves, 1985 (the Checks of 0.17a and 0.5c): the sources service found no legal copy.
- [FormalProof] (0.5b steps (i)–(iii)): the repository's host is not a legal place the sources service knows. The Announcement points to archives on the author's page, which I did not fetch.

Automatic checks set aside as false positives: when I re-ran the checks myself, they flagged the three files of the family index as changes outside the folder, though this pull request carries the index as its own. They also flagged the roadmap's absence from the merge order, which places it after its last supplier. The automatic checks as run on this head passed both.

## Source issues

- none

## For the human reviewers

- Scope: the statements new to this roadmap (0.5b at `p = 2`, 0.5d–0.5h, 0.17b, 0.18a, 2.4, 3.1–3.6) rest on [FormalProof], a Lean formalisation announced on 20 November 2026. Announcement lines 45–49 say no written account exists yet. HodgeTateAndCanonicalSubgroups notes that every written proof of the cokernel bound assumes `p ≠ 2`.
- Licence: [FormalProof] is cited at `github.com/leanprover-community/riemann-hypothesis`, whose licence I could not read. Announcement line 53 points to archives on the author's page instead.
- Not tested: Hazewinkel 1978, the source with the most locators (3 of 4, all in 3.2), could not be read, so the wording and arrangement checks were not run against it.
