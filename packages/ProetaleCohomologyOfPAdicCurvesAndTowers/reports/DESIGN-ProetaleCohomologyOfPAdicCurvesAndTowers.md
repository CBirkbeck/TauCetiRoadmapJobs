# Design report: ProetaleCohomologyOfPAdicCurvesAndTowers

Deliverables: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md` (815 lines, eight layers, 50 targets), `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/plan.json` (the same 50 targets; every definition or construction has at least three tests), and an updated `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml` (18 entries).

## What the design covers

Each final target of `target.md` maps to targets as follows.

| Final target | Targets | Notes |
| --- | --- | --- |
| T1 affinoid curves | 2.4, 3.2–3.5 | (a) is 3.5; (b) is 2.4(a) for every ℓ and 3.3 for the syntomic regulator (p > 2; p = 2 injective with cokernel killed by 2); (c) is 3.4 |
| T2 overconvergent and Stein curves | 4.1, 4.2 | Proved here over every C with `v_p(C^×) = ℚ`; recorded as a kept variant of CstConjectureForDaggerVarieties CS.1 |
| T3 proper curves and Jacobians | 4.7, 4.8, 4.9 | 4.7 is proved by the curve route (CDN-CURVES Remarque 6.33(i)), not derived from CohomologyComparisons §4.11; agreement with §4.11 is a Check |
| T4 patterns, filtrations, WD | 2.3, 2.5, 3.2(d), 4.3–4.6 | (a) is 2.3, with the adoc geometry planned as a construction inside 2.3 |
| T5 semistable Stein spaces | 5.1–5.5 | |
| T6 Drinfeld half-spaces | 6.1–6.10 | (a) 6.2; (b) 6.3–6.4; (c) 6.2; (d) 6.10; (e) 6.5, 6.9; (f) 6.7–6.9 |
| T7 Drinfeld tower, dimension one | 7.1–7.8 | (a) 7.2; (b) 7.3–7.4; (c) 7.5; (d) 7.6–7.7; (e) 7.8 |
| Layer 0 foundations | 0.1–0.5, 1.1–1.3 | Graph cohomology, generalized Steinberg representations, coefficients, period spaces |

Decisions taken on the open points of `target.md`:

- **`v_p(C^×) = ℚ`.** The curve layers keep this hypothesis, which is the source's (CDN-CURVES line 92). The footnote at CDN-CURVES line 124 only says that a `B_cris` formulation would remove it; no such proof is in the source. The design does not state the curve theorems more generally than its sources support. Removing the hypothesis is proposed as part of the Part II below.
- **Adoc geometry.** CDN-CURVES uses it only to build a curve from its pattern (Théorèmes 3.17, 3.19) and for the Čech de Rham comparison (Proposition 3.20). The cohomological targets use standard semistable models and tubes. The adoc spectrum and the gluing of adoc curves are planned as constructions inside 2.3.
- **Route for T7(b).** The local route of CDN-CURVES Remarque 0.16(iii) is used. It needs §4.6, EndoscopicTransferAndUnitaryTraceComparison §12.20 (supercuspidal part only), curve duality and Fontaine's recipe. T7(b) is stated only for supercuspidal `M`, as CDN20 Théorème 0.4 is, so the special and one-dimensional JL-types flagged in the target's Risks are not needed. The source gives this argument as a remark only; the theorem itself is CDN20 Théorème 0.4, proved there by a global argument which, for `F ≠ ℚ_p`, needs CDN20 Théorème 0.6 (Part II scope). This is flagged for the reviewer.
- **Route for T6(e)–(f).** The integral `A_inf` route of CDN-DUKE is planned (6.7–6.9), and it also gives the rational étale statement. The pro-ordinarity route of CDN-STEIN §6 is named as an alternative in 6.9.
- **The "Iovita–Spiess regulator description"** of T6(b) is in 6.2 (regulators from distributions on tuples of hyperplanes) and 6.4 (the Hyodo–Kato regulator).

## Ownership

Ownership was checked by object against main, the board packages and the open roadmap pull requests, using `roadmaps grep` and reading the relevant sections. The searches covered: generalized Steinberg representations, Schneider–Stuhler, Drinfeld half-spaces, Iovita–Spiess, Strauch, cpcf/copresentation, ghost circles, curve patterns, symbol groups, pro-étale cohomology of rigid spaces (`Ẑ_p`), Banach–Colmez spaces, Katz–Messing, the universal vector extension and the Frobenius-fixed-point formula for `AΩ`.

- **Generalized Steinberg `Sp_J(A)` with arbitrary coefficients.** Nothing on main or in open pull requests. SmoothRepresentationsOfLocalGroups SR.3 has the complex Steinberg representation and complex segment representations; these are compared in Checks (0.3). LocallyAnalyticRepresentationsOfLocalGroups (board) mentions only the locally analytic variant, which it explicitly does not plan. Owned here.
- **Graph cohomology with legs and `N_µ`.** No owner; owned here (0.1–0.2).
- **Pro-étale `ℚ_ℓ(r)`.** `Ẑ_p` is ClassicalAdicEtaleCohomology §1.3; the rational coefficient and Stein limit statements are thin and stated here (1.1).
- **Hyodo–Kato over C for curves.** LocallyAnalyticDistributions §0.CR.6.6 owns Hyodo–Kato of Stein curves over a discretely valued base, and CohomologyComparisons §4.9a owns model-free rigid Hyodo–Kato with `C = Ĉ_K`. CDN-CURVES's `H¹_HK` over `C̆` from models over `O_C` is a different construction over a wider base; it is owned here (3.2), with agreement with LocallyAnalyticDistributions §0.CR.6.6 stated in 4.3.
- **Stein Hyodo–Kato in every dimension (5.2).** LocallyAnalyticDistributions §0.CR.6.6 has the finite-piece comparison in every dimension but the Stein limit only for curves. The limit is taken here.
- **Fontaine–Messing on formal schemes.** CohomologyComparisonsPartII §4 is for log schemes. Recorded as gap `formal-syntomic-period-comparison`.
- **CstConjectureForDaggerVarieties CS.1** owns the model-free diagram over `Ĉ_K`, `K` with countable residue field. 4.2 and 5.5 are kept, and the README says in one clause each how they differ: an arbitrary C with value group ℚ and the curve proof; the `G_K`-action and the model-dependent overconvergent Hyodo–Kato term.
- **PadicLocalLanglandsForGL2QpPartII** (board package, read at head `b81ec27` through the board index). Its §§3.4–3.5 plan, for `F = ℚ_p`, the equivariant semistable models, Hyodo–Kato structure and pro-étale cohomology of Stein curves; its §4.1 plans the tower fundamental diagram; its §4.2 plans the half-plane isomorphisms. This roadmap plans the same objects for every `F` (7.2–7.5) and every `d` (6.2, 6.5, 6.9). That package is not in the merge order and consumes ScholzeFunctor nodes, so it comes later; the README lists it as a consumer that should import 7.2–7.5 and 6.x. Until it is retargeted, the two designs overlap on the `F = ℚ_p` statements. This is recorded here and not in the README.
- **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** (board package): its gap `proetale-finite-presentation` is 7.7 (with 7.2), and its SZ.0 Strauch component theorem moves down (next section).

## Notions moved down from later roadmaps

- **Connected components of the Lubin–Tate and Drinfeld towers** (Strauch; planned in ScholzeFunctorAndModpCohomologyOfTheLubinTateTower SZ.0, which is later in the merge order). Layer 7 needs the fact that `Ǧ` acts on `π₀` through `Nrd`, to kill the locally constant functions in the multiplicity spaces. It is target 7.1, stated for the Lubin–Tate tower of `GL_n(F)` for all `n` (the generality of STR08 and of SZ.0's use) and transported to the Drinfeld tower through EndoscopicTransferAndUnitaryTraceComparison §12.11. SZ.0 should import 7.1.

## Proposed Part IIs

- **ProetaleCohomologyOfPAdicCurvesAndTowersPartII.** Poincaré duality and compactly supported pro-étale cohomology of curves (CGN23 Theorem 1.1), the compactly supported de Rham comparison of the two towers (CDN20 Théorème 0.6), and the `B_cris` reformulation of Layers 2–4 that removes `v_p(C^×) = ℚ` (CDN-CURVES footnote 1). It needs the solid formalism of VStackSheavesAndLisseCategories.
- Higher-rank Drinfeld towers are not planned: CDN23 Remarque 2.3 is only an expectation.

## Gaps against named suppliers

| Slug | Supplier and section | What it must provide | Needed by |
| --- | --- | --- | --- |
| `formal-syntomic-period-comparison` | CohomologyComparisonsPartII §§4.4–4.5 | The bounded Fontaine–Messing comparison, with the same exponent, for p-adic formal and weak formal semistable schemes over `O_K` | 5.3 |
| `period-rings-general-C` | PadicPeriodRings §§4.1, 4.3 | `A_cris`, `B_cris^+`, `B_st^+`, `θ`, `θ_0`, `φ`, `N` and the fundamental exact sequence over an arbitrary complete algebraically closed `C` | 1.2, 1.3, 3.2 |
| `endomorphism-characteristic-polynomials` | PadicDifferentialEquationsAndRigidCohomology §RD.7.7 | Equality of characteristic polynomials on `V_ℓ` and rational crystalline `H¹` for every endomorphism of an abelian variety over a finite field (Katz–Messing Theorem 2) | 4.6 |

## Sources

- Read in the cache: CDN-CURVES, CDN-STEIN, CDN20, CDN23, CDN-DUKE, DAT06, GK05, THO24, plus three new texts fetched through the service: STR08 (arXiv math/0611121v1), GK14 (arXiv:1408.3370) and GK07 (Numdam). I opened each cited statement at the lines quoted in the README.
- **Not read, cited by locator (`uncertified`):**
  - SS91 (already settled);
  - IS01 (Duke 2001, paywalled; restated in CDN-STEIN Theorem 5.10);
  - DS01 (Duke 2001, paywalled; restated in GK05 Proposition 6.5);
  - NAK84 (Invent. Math. 1984, as used in CDN23 Remarque 2.15(ii)). Its DOI was not verified, so none is recorded. It may be available on GDZ; this was not checked because the sources service was rate-limited (HTTP 429/503 from arXiv during this job).
- No text is listed in `needs-references.toml`. The service wrote an IS01 entry there; I deleted the file because IS01 is now settled as `uncertified` and its theorem is read through CDN-STEIN.
- Numbering: CDN23 theorem numbers agree with the journal. CDN-STEIN, CDN20, CDN-DUKE and GK05 are cited by their arXiv numbering, as recorded in `version_note`.

## Library checks at the pins

Mathlib `6b7abb3`, Tau Ceti `a91d3aa`.

- **Mathlib has:**
  - `LocallyConstant` and `LocallyConstant.comap` (`Mathlib/Topology/LocallyConstant/Basic.lean`, structure at line 212);
  - `Submodule.mkQ` (`Mathlib/LinearAlgebra/Quotient/Defs.lean:227`);
  - `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`);
  - `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`; no monodromy, no topology);
  - `AlgebraicGeometry.Scheme.EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75`, schemes only; a near miss).
- **Mathlib has no** Steinberg representation (grep for `Steinberg` gives no hit in Mathlib).
- **Tau Ceti:** `TauCeti/Algebra/Quaternion/Steinberg.lean` concerns the Steinberg symbol relation and is unrelated. Nothing at the pin covers rigid pro-étale or Hyodo–Kato cohomology.

## Adversarial pass

One row per statement, giving the instances tried and the values computed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 graph cohomology | loop; one vertex with one or two legs; Bruhat–Tits tree; finite `S` exact sequence | loop: `H¹ = H¹_c = H¹_c^* = L`. Two legs: `H¹_c = coker(x ↦ (−x, −x)) = L`, `H¹_c^* = {φ₁ + φ₂ = 0}`, sequence `0→0→L→L²→L→0→0`. One leg: all `0`. Tree: `H¹ = 0`, `H¹_c = LC(ℙ¹(K), L)/L` | holds | made explicit that a missing endpoint contributes `0`; added the finitely supported cochain non-example |
| 0.2 `N_µ` | Tate loop; segment with legs; scaling | loop: `N = µ`. Segment with two legs per end: `H¹ = 0`, so `N = 0` while `rank H¹_c^* = 5 − 2 = 3`. Lengths `2µ` give `N = 2µ` | holds | compactness hypothesis kept and tested |
| 0.3 `Sp_J` | `d = 1`; `A = 0`; `r > d`; `J = ∅, Δ`; congruence invariants | `Sp_0 = A`, `Sp_1 = LC(ℙ¹)/A`. `(1 + ϖM₂(O))`-invariants: `A^{q+1}/A`, rank `q`. Quotient over `i ∈ J` gives `0` at `J = Δ` | holds | indexing `Sp_r = Sp_{{1..d−r}}` pinned with the `d = 1` witness |
| 0.4 irreducibility, lattice, completion | characteristic 0, `p`, `ℓ` | GK14 Corollaries 4.3–4.5 read at GK14 lines 1300, 1328, 1362: char `p` with no exceptional factor (type A holds) | holds | `ℓ ≠ p` fields excluded (CDN-STEIN Remarque 5.2) |
| 0.5 cocycle presentation | `r = 0, 1, 2` with `d = 1` | `r = 0`: constants. `r = 1`: `f = g(H₁) − g(H₀)`; the cocycle identity at `H₀ = H₁ = H₂` forces `f(H,H) = 0`. `d = 1, r = 2`: three vectors in `K²` are dependent, so the group is `0 = Sp_2` | first draft wrong | a draft Check claimed the vanishing was needed at `r = 1`; it is automatic there. Replaced by the `r = 2` witness |
| 1.1 coefficients | point; open and closed disc; `ℓ ≠ p` | point: `H⁰ = ℚ_p(1)`. Open disc: étale→pro-étale not injective (CDN-STEIN Remark 1.4) | holds | quasi-compactness kept in (a) |
| 1.2 completed tensors | `H = C̆`; dense `W₂`; `∏_ℕ C̆` | `B_st^+`; `B_cris^+ ⊗̂ H^sep = 0`; `∏_ℕ B_st^+` | holds | none |
| 1.3 `X^r_st` | slopes 0, 1, 1/2; ordinary elliptic curve; `φ = p^{−r}` | slope 1: `(B_cris^+)^{φ=1} = ℚ_p`. Slope 0: `(B_cris^+)^{φ=p}`, `ker θ = ℚ_p t`. Ordinary: `(1,1) + (0,1) = (1,2)`. On `u`: `N(φu) = −p = pφ(Nu)` | holds | made explicit that `F′ ⊂ C̆` may replace `C̆` (needed in Layer 5) |
| 2.1 pieces and residues | `dT/T`, `dT^k`; leg orientation; ghost ring | `Res = 1, 0`; leg: `+1/−1`. `Σ_{k≥0} T^k ∈ O_C[[T,T^{−1}⟩ ∖ O_C⟨T,T^{−1}⟩`; `Σ_{k≥1} T^{−k}` in neither | first draft wrong | a draft Check claimed `Σ p^{1/k}T^{−k}` lies in the ghost ring; its coefficients tend to `1`, not `0`. Corrected |
| 2.2 pattern | disc, annulus, Tate curve | disc: one vertex, one leg. Annulus: `∂^*: L³ → L²`, kernel rank 1. Tate: circle of length `v_p(q)` | holds | lengths in `ℚ` tied to `v_p(C^×) = ℚ` |
| 2.3 reconstruction | annulus; twisted gluing; family over `O_C[[T_a]]` | twisting `ι` by `α` gives `T₁T₂ = αp^µ` (CDN-CURVES Remarque 0.10) | holds | singular fibres excluded |
| 2.4 symbols | disc, annulus, constants | disc: `Symb_ℓ = 0` for `ℓ ≠ p`. Annulus: `ℤ_ℓ`. Constants trivial since `C^×` is divisible | holds | none |
| 2.5 ℓ-adic filtration | Tate curve; good reduction | Tate: `ℤ_ℓ(1), 0, ℤ_ℓ`, `N = v_p(q)`. Good reduction: rank `2g` in the middle | holds | none |
| 3.1 de Rham | affinoid, disc, annulus | annulus: `C·dT/T`; disc: `0` | holds | none |
| 3.2 Hyodo–Kato | disc, annulus, good reduction, Tate, boundary slope | annulus: `φ(dT/T) = p·dT/T`, slope 1, `N = 0`. Tate: `N` of rank 1 | holds | `^{[1]}` on boundary components kept and tested |
| 3.3 syntomic regulator | `p = 2`; `H⁰`; unit symbol | `p = 2`: injective, cokernel killed by 2 (CDN-CURVES line 2195). `H⁰ = ℤ_p t`. `(1 + pT)` has differential `p·dT/(1+pT)` | first draft too strong | a draft Check claimed a nonzero cokernel on the disc at `p = 2`; that is unverified and was removed. The meaning of "presque" is pinned from footnote 32 |
| 3.4 `p²`-exact sequence | disc, annulus | annulus: `(T) ↦ dlog T`, `φ(dlog T) = p·dlog T` | first draft too strong | a draft Check claimed integral exactness fails; replaced by "only `p²`-exactness is asserted" |
| 3.5 affinoid diagram | disc; annulus; ℓ-adic finiteness; proper `Y` | disc: `∏(1 + p^{1/p^n}T)^{p^n}` converges in `O_C[[T]]`, not in `C⟨T⟩`. Annulus: `X^1_st(C̆(−1)) = ℚ_p` | holds | `H¹(Y,O)` term kept, so the proper case is included |
| 4.1 overconvergent | disc, annulus | `H¹_HK = 0`; `X^1_st = ℚ_p` | holds | none |
| 4.2 Stein curves | open disc, open annulus, countable union of annuli, Cst range | `C ⊗ ∏ C̆ ⊊ ∏ C`, so the completed tensor is needed | holds | stated over C with `v_p(C^×) = ℚ`; Cst agreement is a Check |
| 4.3 filtrations | half-plane; Mumford curve | half-plane: `H¹_HK = H¹_c(Γ)^*(−1)` and `H¹_proét(ℚ_ℓ(1)) = Sp_1(ℚ_ℓ)^*`, consistent with 6.2 at `d = r = 1` | holds | none |
| 4.4 special fibre, `WD_Y` | geometric vs arithmetic Frobenius | `deg Φ_geom = f` gives `NΦ = p^fΦN = qΦN`; arithmetic gives `q^{−1}` (CDN-CURVES Remarque 8.6(i): `deg γ = −n` for `x ↦ x^{p^n}`) | holds | convention pinned |
| 4.5 ℓ-adic WD | Tate; unramified | `N∘g = χ_ℓ(g)^{−1}g∘N` on `ℚ_ℓ[u]` | holds | none |
| 4.6 similarity | good elliptic over a finite field; half-plane | `X² − aX + q` on both sides; half-plane slope 1 before the twist and 0 after it | first draft wrong | a draft Check said "weight two after the twist"; corrected to slope 0 after the twist. Gap recorded for all endomorphisms |
| 4.7 proper curves | ordinary, supersingular, `g = 0` | `Dim X^1_st = Σ(1 − r_i, 1) = (g, 2g)`: ordinary `(1,2)`, supersingular `2·(1/2, 1) = (1,2)` | holds | none |
| 4.8 `Ĵ` | `g = 0`; Tate curve; drop `x_n → 0` | Tate: `Ĵ/V_p ≅ C` | holds | direction `x_n = p·x_{n+1}` checked at CDN-CURVES line 4044 |
| 4.9 integration | `x ∈ V_p`; change of lifts | lifts differ by bounded sequences, killed by `p^n` in the limit | holds | `C = ℂ_p`, `X` over finite `K` |
| 5.1 Stein semistable | half-plane model; affine space; proper models | proper model of positive dimension: tubes cannot form a Stein exhaustion | holds | none |
| 5.2 Stein Hyodo–Kato | `𝔸^d`; dimension 1; uniformizer change | `e₁ ↦ e₁ + log(u)e₀` on the Tate module; independent of `ϖ` if `N = 0` | holds | none |
| 5.3 Fontaine–Messing | `r = 0`; `p = 2, r = 2`; truncation | lattice `(p^a a!)^{−1} = 1/8` for `p = 2, r = 2` (`a = 2`), matching CDN-STEIN line 2198 and CohomologyComparisonsPartII §4.1 | holds | gap for formal schemes |
| 5.4 Bloch–Kato syntomic | affine space; `r = 0`; changing one of `ι_ϖ`, `ι_HK` | `H⁰ = ℚ_p^{π₀}` | holds | none |
| 5.5 Stein diagram | `𝔸^d`; `d = 1`; proper comparison | `𝔸^d`: `H^r_HK = 0` gives `H^r_proét = Ω^{r−1}/ker d`; `d = 1` gives `Ω⁰/ker d = O/C`, as in 4.2 | holds | normalization `p^{−r}` recorded |
| 6.1 standard model | `d = 1, 2` | `d = 1`: `ℙ¹` meeting `q + 1` components. `d = 2`: only points are blown up (last centres have dimension `r − 2 = 0`, GK05 lines 1250–1253) | first draft wrong | a draft Check also blew up lines for `d = 2`; corrected |
| 6.2 Schneider–Stuhler | `d = r = 1`; `r = 0`; `ℓ = p` | `δ_a − δ_b` has total mass 0 | holds | `ℓ = p` excluded |
| 6.3 Grosse-Klönne Frobenius | `s = 0`; `𝔸^r`; `ℙ¹` minus rational points | `Nφ = pφN` gives `Nφ^f = qφ^fN`; with `φ^f = q^s` this is `q^sN = q^{s+1}N`, so `N = 0` (`q ≠ 1`) | holds | N = 0 derived rather than asserted |
| 6.4 Hyodo–Kato = `Sp_r(F)^*` | `d = r = 1`; `r = 0` | linearized Frobenius `p^{rf} = q^r`, consistent with 6.3 | holds | none |
| 6.5 pro-étale | `d = r = 1`; `r = 0`; `r = d + 1` | `r = d + 1`: `Ω^d/ker d = 0` since `d: Ω^d → 0` | first draft imprecise | wrong reason ("exact") removed |
| 6.6 integral de Rham | `d = j = 1`; `j = 0`; `H¹(O)` | `d = 1`: `H⁰(O) = O_K` (CDN20 Remarque A.2) | holds | `j = 0` Check restricted to `d = 1`, where the source proves it |
| 6.7 `AΩ` fixed points | `i = 0`; point with `i = 1`; truncation | point: `H¹_ét(Spa C, ℤ_p(1)) = 0`, so `1 − φ^{−1}` is surjective on `A_inf{1}` (CDN-DUKE Lemma 2.11(b)) | first draft wrong | an unverified Check on `(μ^{−1}A_inf(1))^{φ^{−1}=1}` replaced |
| 6.8 `A_inf` cohomology | `i = 0`; `d = i = 1` | `H⁰(AΩ) = A_inf` | holds | none |
| 6.9 étale | Drinfeld `d = r = 1`; `r = 0` | `Sp^cont_1(ℚ_p)^*` (CDN20 Proposition 0.1) | holds | route via CDN-DUKE; the vanishing of `H^{r−1}(AΩ{r})/(1 − φ^{−1})` is cited to CDN-DUKE §5 |
| 6.10 Dat complex | `d = 1`; Poincaré duality; banality | `H¹_c = St`, `H²_c = Λ(−1)`. `H^{2d−r}_c ↔ H^r(d)^*` with `i = d − r` matches 6.2. `π_J ≅ Sp_J` through `g ↦ g^{−1}` | holds | Dat's `d − 1` translated to `d`; `(d+1)!` invertibility for the inertia formula |
| 7.1 components | `m = 1`; `n = 1`; scalars | `(q−1)q^{m−1} = q − 1` at `m = 1`. A scalar `b` acts by `Nrd(b)^{−1} = b^{−n}` | holds | none |
| 7.2 equivariant models | `n = 0`; `GL_n`, `n ≥ 3`; orbits | `n = 0`: even-determinant elements are transitive on vertices and odd ones swap the copies, so there is one orbit | first draft wrong | "one orbit per height class" corrected to a single orbit |
| 7.3 levelwise | `n = 0`; bounded vectors | `exp(f)` with `f` non-constant is not étale (bounded functions are constant) | holds | none |
| 7.4 Hyodo–Kato multiplicities | level 0; slopes; central characters | no supercuspidal at level 0, since `JL` would factor through `Ǧ/O_D^×`; slope `1/2` vs `1` | first draft too weak | an unverified dimension count was replaced by the central-character Check |
| 7.5 multiplicity diagram | `θ` injectivity; `F = ℚ_p` | `(B_cris^+ ⊗ M)^{φ=1} = 0` for slope `1/2` | first draft wrong | a draft Check claimed a nonzero kernel of `θ`, contradicting injectivity; removed |
| 7.6 cpcf | `ℤ/p^n`; `𝔽_p^{(ℕ)}`; `𝔽_p^s` | constant `𝔽_p^{(ℕ)}` is not profinite (its limit would be profinite) | first draft wrong | a malformed pro-system example replaced |
| 7.7 finite copresentation | `n = 0, q = 0`; rational coefficients | `𝔽_p²`; odd-determinant elements swap the two copies of `Ω` | first draft too strong | an unverified vanishing for `q ≥ 3` removed |
| 7.8 non-admissibility | `F = ℚ_p`; `n = 0`; `π = St` in Proposition 2.18 | `F = ℚ_p` admissible (CDN23 Remarque 2.15(i)); `St → Ŝt` is nonzero, so cuspidality is needed | holds | none |

Context (step 2): every theorem states its standing hypotheses: `v_p(C^×) = ℚ` for Layers 2–4, a discretely valued `K` with perfect residue field for Layer 5, a finite `K/ℚ_p` for Layer 6, rank two for Layer 7, supercuspidality, `ℓ ≠ p`, and the banality of `Λ`.

Generality (step 3): Layer 6 is stated for every `d ≥ 1` and every finite `K`; Layer 7 for every finite `F` and every `n ≥ 0`; Layer 5 for an arbitrary perfect residue field. The rank-two restriction in Layer 7 is the source's (CDN23 line 1172).

Unused hypotheses (step 7): none found that a Check shows to be unnecessary.

## Dependency check

```
candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines.

`roadmaps resolve` reports one lead: `PadicLocalLanglandsForGL2QpPartII §4.1` is not found on main or in an open roadmap pull request. That roadmap is a board package under review (index entry `#392`, head `b81ec27`), read at that head; it appears only in the Downstream consumers list and in one Check. No Lean names were flagged.

## Ownership against open pull requests

Checked for the sibling roadmaps named in the brief through `roadmaps grep` and `roadmaps show`. I read the relevant sections of:

- ClassicalAdicEtaleCohomology, CohomologyComparisons, CohomologyComparisonsPartII, LocallyAnalyticDistributions and CrystallineCohomology;
- EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves and TropicalAndBerkovichArithmetic;
- AInfCohomology, PadicPeriodRings, PadicHodgeTheory, VectorBundlesAndIsocrystals and PadicDifferentialEquationsAndRigidCohomology;
- SmoothRepresentationsOfLocalGroups, GL2AutomorphicRepresentationsAndTransfer and PadicLocalLanglandsForGL2Qp.

All were read at their open heads.

## Suspicious text

None of the issue text, board files, roadmaps or fetched sources contained instructions.
