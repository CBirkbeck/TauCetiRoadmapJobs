<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2474#issuecomment-6676714037 -->
Review (claude) of 303f60e

Verdict: needs_changes

1. **F01** (P3) Three target names cited in VStackSheavesAndLisseCategories do not exist at its head

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md` lines 60, 61, 63 (supplier contract: "§VS0.2 (… *point-to-classifying-stack-not-smooth*)", "§VS1.1 (… *ula-relative-adjoints-and-calculus*)", "§VS5.2 (*ula-equals-admissibility*): ULA objects on [∗/G] are the admissible complexes"), and the `*Needs:*` lines 358 (VS6.8), 1289 (VS9.9), 1649 (VS11.1).

   **Claim:** every cited supplier target exists at the supplier's current head.

   **Witness:** VStackSheavesAndLisseCategories at its open head (README of pull request #1230, read with `roadmaps show`) names its targets as `VSk/<slug>` links; its complete slug list has no `point-to-classifying-stack-not-smooth`, no `ula-relative-adjoints-and-calculus` and no `ula-equals-admissibility` (the VS5 slugs are `torsion-kunneth`, `bernstein-zelevinsky-duality`, `lisse-ula-equals-admissibility`, `torsion-bun-homology-and-haar-dualizing`, `lisse-ula-definition`, `lisse-kunneth`, `lisse-bernstein-zelevinsky-duality`). The content is there under other labels: the non-smoothness of the point of `[∗/ℤ_p]` is a Check bullet of §VS0.2 (supplier line 177); the relative adjoints are the sub-target "Relative adjoints and ULA calculus" of §VS1.1 (line 282); the admissibility criterion is the sub-target "Torsion ULA and perfect invariants" of §VS5.2 (lines 1352–1360), stated for `Bun_G` (ULA iff every stratum restriction has perfect derived pro-p invariants), not for `[∗/G]`.

   **Exact repair:** (1) Line 60 and line 358: replace "*point-to-classifying-stack-not-smooth*" by "the Check that the point of `[∗/ℤ_p]` is not a smooth atlas". (2) Line 61 and line 1289: replace "*ula-relative-adjoints-and-calculus*" by "the sub-target *Relative adjoints and ULA calculus*". (3) Line 63 and line 1649: replace "(*ula-equals-admissibility*): ULA objects on [∗/G] are the admissible complexes" by "(sub-target *Torsion ULA and perfect invariants*): an object of D_ét(Bun_G, Λ) is ULA iff every stratum restriction has perfect derived pro-p invariants; VS11.1 adapts the argument to [S/G_S]" (VS11.1's proof sketch, step 3, already says this). Test: `grep -c` of the three old slugs in the README returns 0; each remaining VStackSheaves citation names a slug or a sub-heading present in the supplier's head.

2. **F02** (P3) The direction of the conjugation action on C_c(G, Λ) is not pinned, and the invariance of tr.dist depends on it

   **Location:** `README.md` line 1655 (VS11.2, "with G acting on C_c(G, Λ) by conjugation and on Haar(G, Λ) by χ_G"), line 1675 (VS11.3, "G acts on C_c(G, Λ) by conjugation … and tr.dist(M) is invariant"), and the VS8.10 Check "For T = G with the conjugation action, H^0 is Hom_G(C_c(G, Λ) ⊗ Haar(G, Λ), Λ)" (line 1014).

   **Claim:** the Conventions pin every direction of a map by a computed two-term witness; VS11.10 fixes the action on `G` as `g ↦ hgh⁻¹`, but neither Conventions nor VS11.2–VS11.3 says which of the two left actions on functions is meant, and only one makes tr.dist invariant when G is not unimodular.

   **Witness:** G the affine group of the Conventions witness over ℚ_p, Λ = F_5, p = 2, M = Λ trivial, h = 1_K for a compact open K, g = diag(2, 1), so χ_G(g) = 2 and g·μ = 2μ. With (g·h)(x) = h(g⁻¹xg): tr I_(g·h, μ) = μ(gKg⁻¹) = μ(Kg⁻¹) = 2⁻¹μ(K), and tr I_(g·h, g·μ) = 2·2⁻¹μ(K) = μ(K): invariant. With (g·h)(x) = h(gxg⁻¹): tr I_(g·h, μ) = μ(g⁻¹Kg) = μ(Kg) = 2μ(K), and tr I_(g·h, g·μ) = 4μ(K) ≠ μ(K) in F_5: not invariant. (Both formulas define left actions, so "by conjugation" does not single one out.)

   **Exact repair:** In Conventions, after the Haar-action bullet, add: "G acts on C_c(G, Λ) through its conjugation action on G, g·x = gxg⁻¹, by (g·h)(x) = h(g⁻¹xg)." In VS11.3 add the Check: "For the affine group over ℚ_p, Λ = F_5, p = 2, M = Λ trivial, h = 1_K and g = diag(2, 1): tr.dist(Λ)(g·h ⊗ g·μ) = 2 · 2⁻¹ · μ(K) = tr.dist(Λ)(h ⊗ μ); with (g·h)(x) = h(gxg⁻¹) the value would be 4μ(K) ≠ μ(K)." Test: the two values above.

3. **F03** (P3) The Lean docstring attributes perfectoid rings to Mathlib; at the pins they are in Tau Ceti

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/Suggested.lean` lines 13–15 ("Mathlib has perfectoid rings and their tilts (`Mathlib/RingTheory/Perfectoid/`), and Tau Ceti has pre-adic and adic spaces").

   **Claim:** every statement that a library "has" something is checked at the pin.

   **Witness:** `Mathlib/RingTheory/Perfectoid/` at the pin holds `Untilt.lean` (`PreTilt.untilt`, line 49), `FontaineTheta.lean` and `BDeRham.lean`; `PreTilt` is `Mathlib/RingTheory/Perfection.lean` line 623; no `PerfectoidRing`, `IsPerfectoid` or tilting equivalence exists in Mathlib (grep over the pinned tree). Tau Ceti has `IsPerfectoidTateRing` (`TauCeti/RingTheory/Perfectoid/Basic.lean` line 86) and `IsPerfectoidField` (`TauCeti/RingTheory/Perfectoid/Field.lean` line 68).

   **Exact repair:** Replace the clause by "Mathlib has pretilts, the untilt map and Fontaine's θ (`Mathlib/RingTheory/Perfectoid/`), and Tau Ceti has perfectoid Tate rings and fields (`TauCeti/RingTheory/Perfectoid/`) and pre-adic and adic spaces (`TauCeti/AlgebraicGeometry/AdicSpace/`), but neither has perfectoid spaces, their v-site or étale sheaves on it". The conclusion (nothing statable) is unchanged. Test: `lake env lean` on the file still exits 0 with no output.

4. **F04** (P3) Two Mathlib line locators are off

   **Location:** `README.md` line 47 ("`Module.IsReflexive` (same file, line 212)") and line 50 ("`RightRigidCategory (FGModuleCat K)` instance … line 264").

   **Claim:** cited declarations are given at their file and line at the pin.

   **Witness:** `class IsReflexive` is `Mathlib/LinearAlgebra/Dual/Defs.lean` line 203 (line 212 is `theorem erange_coe`); `instance rightRigidCategory : RightRigidCategory (FGModuleCat K)` is `Mathlib/Algebra/Category/FGModuleCat/Basic.lean` line 265 (line 264 is blank, after `instance rightDual`). The other line locators (`Module.instIsReflexiveOfFiniteOfProjective` line 262, `Module.instFiniteDimensionalOfIsReflexive` line 284 of Dual/Lemmas.lean) are exact.

   **Exact repair:** "line 212" → "line 203"; "line 264" → "line 265". Test: `sed -n 203p` and `sed -n 265p` of the two files show the declarations.

Four findings, all P3 (locator, convention and policy); nothing blocking. The elaboration passes, the sampled locators are all supported by the texts, the dependency gate is clean, and no object of this roadmap is owned elsewhere. The repairs below are small and each is tested on the instance that exposed it.

## Verified sound

### Principles

No route-specific shortcut: every statement is at the generality of its source or wider (VS7.6 derives (P4), (P5), (BC2) for all fine maps; VS10.5–10.6 over decent bases where HKW22 §5.3 has a small v-sheaf base, justified through VS7.6). The base roadmap is imported, never re-planned: the Summary says where VStackSheavesAndLisseCategories stops (no Rf_! for non-representable maps), and the six VStackSheaves citations are to its VS0.1, VS0.2, VS1.1, VS1.2, VS4.2, VS5.2 (R01 only renames three sub-target labels). No copied passages (the source paragraphs are paraphrases with locators; spot-compared at HKW22 lines 1215–1228, 1294–1305, 1657–1662, 2360–2373 and GHW22 lines 704–705, 1594–1600). No algorithms. `Suggested.lean`: one `import Mathlib`, no `set_option`, no sorry'd data, no declarations. Fetched text was treated as data; nothing in any text read asked for an action.

### Seeded sample (15 targets) and the flagged locators

No locator is flagged unverified in the README or the manifest (all 8 entries `certified`). Line numbers are those of the cached texts.

- **7.2:** GHW22 Proposition 3.7 line 704 (p. 14), Lemma 3.8 line 732 (p. 15), Corollary 3.9 line 758, Lemma 3.10 line 781 (p. 15). Statement, the `3·dim.trg` bound, the Krull-dimension bound for `|X|^h`, amplitude zero for quasicompact injections of small v-stacks, and the factorisation `Rf_! = Rf̄_* ∘ j_!` all match.
- **7.8:** GHW22 Proposition 4.14 lines 1594–1619 (p. 31): conditions (1)–(3) exactly as stated, (1)⇔(3) via FS21; FS21 Proposition IV.2.33 line 4983 (p. 129, page marker 4958) with the "invertible and commutes with any base change" reformulation at 4987–4991; HKW22 lines 1170–1175 (p. 24) for (4.1.2) and the smooth base change analogue.
- **8.1:** HKW22 Definition B.2.1 lines 3587–3592, Lemmas B.2.2–B.2.3 lines 3593–3597 (p. 74; the §B.2 heading and the ring conventions are on p. 73, lines 3578–3583). Smooth (two equivalent conditions), complete, projectors and the equivalence match.
- **8.2:** HKW22 Lemmas B.2.4–B.2.5 lines 3604–3622 (p. 74): surjectivity of restriction, `1_U·F(S) ≅ F(U)`, `F(S) = lim F(U)`, the equivalences, `F_M(S) = M^c`.
- **8.4:** HKW22 Example 4.2.1 lines 1215–1228 (p. 25): representable in nice diamonds, the smooth-module identification, the four operations, `H^0(T_S, f^!Λ) = Dist(T, Λ)`.
- **8.7:** HKW22 Example 4.2.2 lines 1229–1252 (pp. 25–26): the four values, `q^!Λ = Haar(G, Λ)`, the 2-morphisms `α_g`; FS21 Theorem V.1.1 line 6484 (p. 168, markers 6465/6501).
- **8.8:** HKW22 Example 4.2.3 lines 1254–1290 (p. 26): restriction, smooth and compact induction, the two cases of `q^!`.
- **8.9:** HKW22 Example 4.2.4 lines 1294–1305 (p. 27): fine, smooth, the four functors, `K = Haar(G, Λ)^∗`, and the derivation `M = q^!f^!M = Haar ⊗ f^!M`.
- **9.2:** LZ22 Construction 1.7 lines 225–272 (pp. 5–6), Construction 1.8 lines 299–350 (pp. 6–7), Remark 1.9 lines 351–353 (p. 7); the functor `End(C) → ΩC` at 269–272; HKW22 proof of Theorem 4.3.8 lines 1602–1614 (p. 33) applies Construction 1.7.
- **9.9:** HKW22 lines 1511–1516 (p. 31); FS21 Theorem IV.2.23 line 4801 (p. 124), Proposition IV.2.24 line 4841 (p. 125), Proposition IV.2.32 line 4972 (p. 129). The README's own statement cites Theorem IV.2.23, which is the dualizability criterion (ii) in FS21 v4; see Source issues for HKW22's "IV.2.24".
- **9.10:** HKW22 lines 1517–1561 (pp. 31–32) and footnote 5 line 1588: `ΩCoCorr_S`, `Fix(c)`, the displayed chain (P5), (4.0.1), α, ev, (BC2); LZ22 Notation 2.20 line 856 (p. 18).
- **9.12:** HKW22 Lemma 4.3.7 lines 1567–1571 (p. 32).
- **10.5:** HKW22 lines 2337–2354 (p. 48): `Fix(c)_T = Fix(c_T)`, `u_T` through `a_C^*Rc_2^! → Rc_{2,T}^!a_X^*`, the mate description; line 2372 (p. 49) for symmetric monoidality of base change.
- **11.3:** HKW22 (4.4.1) lines 1696–1701 (p. 35); proof of Proposition 4.4.1 lines 1677–1693 (pp. 34–35): `I_{h,μ}`, factorisation through `M^K` for bi-K-invariant h.
- **11.10:** HKW22 §4.6 lines 1999–2050 (pp. 41–42): `c = (pr_X, α)`, G-stability of `Fix(c)`, `In_S(Y) ≅ [Fix(c)/G]`, the map to `[G//G]`, `c̃`, `Fix(c) ≅ Fix(c̃)`, fibres `Fix(g)`, the Cartesian square.

Also read for the Corrections section and the adversarial rows: GHW22 Definition 1.1 and Remark 1.2 lines 67–83 (p. 2), p. 3 lines 90–101 (Spd ℤ_p and Div¹ decent with the stated chart), Definition 1.3 lines 102–127, Theorem 1.4 (1)–(5) lines 133–155 (pp. 3–4), §1.2 item (3) line 219 (p. 5: "[LZ12b, Proposition 1.4.4]" with LZ12b the gluing paper, bibliography line 1637), Definition 3.11–Scholium 3.13 lines 788–815 (p. 16); HKW22 Example 4.1.1 lines 1053–1057 (p. 22), Definition 4.1.7 lines 1133–1148 (p. 23, citing GHW22 Definitions 4.3 and 4.1 "strictly surjective"), Theorem 4.1.8 lines 1165–1169, Definition 4.1.9–Lemma 4.1.11 lines 1178–1195 (p. 24), Definitions 4.3.3–4.3.4 lines 1358–1436 (pp. 28–30, footnote 4 at 1377 citing GHW22 Proposition 4.10; tensor-product target "(c₂ ×_S d₂)^!(A₂ ⊠ A′₂)" at 1482), Proposition 4.3.5 lines 1490–1510, Theorem 4.3.8–Definition 4.3.11 lines 1572–1647 (Example 4.3.10 assumes only X proper at 1625), Lemma 4.5.2 and Theorem 4.5.3 lines 1802–1844, (4.5.8)–(4.5.9) and "straightforward but tedious" lines 1955–1960 (p. 40), "In_S(T₁)" line 1990 (p. 41), §4.6 closing remark lines 2134–2143 (p. 44), §5.3 setup lines 2298–2309 (p. 47), "discussion immediately before Definition 4.3.5" line 2320 (p. 48), Propositions 5.3.1–5.3.2 lines 2360–2404 (pp. 49–50), Lemma B.1.1 lines 3512–3544 (pp. 72–73, "𝔪^{m−1}" at 3534 and 3543), Lemma B.1.2 lines 3545–3556 (p. 73); Sch17 Definition 10.7 line 2109 and Remark 10.8 line 2118 (p. 51), Proposition 10.9 line 2129, Definition 18.1 line 4118 (p. 100), Proposition 18.3 line 4132 (p. 101); FS21 Remark IV.1.10 line 4198, Definition IV.1.11 line 4205, Corollary V.1.4 line 6578 (p. 170), Theorem V.7.1 line 7065 (p. 183). All eleven Corrections bullets are supported by these passages.

### Adversarial table

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, χ_G witness | affine group {(a,b)} over ℚ_p, μ = \|a\|⁻² da db, g = diag(p,1) | (a,b)·g = (ap, b); μ(Eg) = \|p\|⁻¹μ(E) = pμ(E); χ_G(g) = p; SmoothRepresentationsOfLocalGroups §SR.2.2 at its head (line 2037) defines the modular character as μ(Ep⁻¹)/μ(E), so δ_SR(g) = \|p\| = p⁻¹ = χ_G(g)⁻¹ | holds |
| VS6.2 Checks | Spd ℤ_p; q : S → [S/ℤ_p] | chart Spd ℤ_p × Spd F_p((t^{1/p^∞})) is GHW22 p. 3; base change ℤ_p × S → S has f^!Λ = Dist(ℤ_p, Λ), not invertible (FS21 Remark IV.1.10) | consistent |
| VS6.9 2-morphisms | f₁ = f₂ = id_H; S = Spd ℚ_p, G = 1, H = ℤ/2 | 2-cells = centre of H(S); the unramified quadratic torsor is a map B1 → BH with trivial-torsor image nontrivial, not φ_f | correction of Example 4.1.1 stands |
| VS7.2 | proper prespatial curve, dim.trg 1; j = id; T × S → S, T profinite (dim.trg 0) | bound 3; Rj_* amplitude 0; bound 0, matching exactness of sections on a profinite set | consistent |
| VS7.5 (headline) | f : [S/G] → S, G = ℤ/ℓ, Λ = F_ℓ; projection formula with B | Rf_!Λ has H_1(ℤ/ℓ, F_ℓ) = F_ℓ in degree −1, Rf_*Λ has F_ℓ in degree +1: the two differ, so (P3) and (BC1) are the content and Rf_! ≠ Rf_* for stacky maps; Rf_!(Λ ⊗ f^*B) = Haar_G ⊗ B | consistent; Corrections bullet 3 justified |
| VS7.8 | f = [S/ℤ_p] → S, p ∈ Λ^×; q : S → [S/ℤ_p], M = C(ℤ_p, F_ℓ) | Rf^!F_ℓ = Haar^∗ ≅ F_ℓ, (1) holds; Rq^!F_ℓ = Haar ≅ F_ℓ invertible but Rq^!M = Hom_{ℤ_p}(C(ℤ_p,F_ℓ), C(ℤ_p,F_ℓ)) ⊋ Haar ⊗ M, so (2) fails; the base change ℤ_p × S → S has R^!F_ℓ = Dist ≠ F_ℓ, so (3) fails | (1)⇔(2)⇔(3) consistent on both sides |
| VS8.1 | T finite; T = ∅; T = ℕ, Λ = ℤ, M = ℤ^ℕ; wrong model "smooth = finitely generated" | all smooth (1_T = 1); ring 0; 1 ∉ ⋃_U 1_U·M, M^s = ℤ^{(ℕ)}, M^c = lim_U ℤ^U = M; C_c(T, Λ) smooth and not f.g. for infinite T excludes the wrong model | consistent |
| VS8.2 | T finite; T = ℕ | Λ^T-modules; global sections of the constant sheaf = lim_U Λ^U = C(ℕ, Λ) = C_c(ℕ, Λ)^c | consistent |
| VS8.4 | T finite; T = ℤ_p | f^*M = M^T, Rf_* = Rf_! = product, Rf^!M = M^T; H^0(T_S, Rf^!Λ) = Hom(C(ℤ_p, Λ), Λ) = Dist, agreeing with DiamondSixOperations §S5.4 "Rq^! is a sheaf of distributions" (its head, line 1031 ff.) | consistent |
| VS8.5 | G = ℤ_p, Λ = F_p; affine group, Λ = F_5, p = 2 | μ(ℤ_p) = p·μ(pℤ_p) = 0 forces μ = 0: hypothesis needed and present; scalar χ_G(diag(2,1)) = 2 ≠ 1 in F_5 | consistent |
| VS8.7 | G finite; G = ℤ_p, M = Λ | Rq_*M = C(G, M) = Λ[G] ⊗ M = Rq_!M, Rq^!M = Hom_G(Λ[G], M) = M; Rq_*Λ = C(ℤ_p, Λ), Rq^!Λ = Hom_{ℤ_p}(C(ℤ_p, Λ), Λ) = Haar | consistent |
| VS8.8 | H = 1; G = H × H′, H′ finite; H open | VS8.7; Hom_{H′}(Λ[H′], M)^{H-sm} = M; q étale so Rq^! = q^* (fibre (G/H)_S discrete) | consistent |
| VS8.9 | G finite, \|G\| ∈ Λ^×; G = ℤ_p, p ∈ Λ^× | (M ⊗ Λ)_G = M_G ≅ M^G; H^{>0}(ℤ_p, Λ) = 0 so Rf_*Λ = Λ, K = Haar^∗ ≅ Λ | consistent |
| VS8.10 / VS11.2 (R02) | T = G conjugation, non-unimodular G, g = diag(2,1), Λ = F_5 | the module Hom_G(C_c(G) ⊗ Haar, Λ) depends on the direction of the action on functions: (g·h)(x) = h(g⁻¹xg) gives χ_G(g)·χ_G(g)⁻¹ = 1 on the trace distribution, h(gxg⁻¹) gives χ_G(g)² = 4 | direction must be stated (R02) |
| VS9.1 / VS9.4 | (S, Λ ⊕ Λ[1]); Λ = ℤ/6, P = 3Λ; ℚ[0] over ℤ | 1 − 1 = 0 with the Koszul sign (Mathlib `ExactPairing` orientation); 3² = 9 ≡ 3 so e = 3 is idempotent, tr_proj(id_P) = 3, `LinearMap.trace` = 0 since P ≅ ℤ/2 is not free; ℚ not compact | consistent |
| VS9.2 | f an isomorphism in a 1-category; f = id (split case); empty correspondence on P¹ | tr(e) = tr(e′); the morphism is the 2-cell alone; both integrals 0 | consistent |
| VS9.5 (R04 line) | k = 1, M = κ²; Λ = ℤ/ℓ², M = ℤ/ℓ ⊕ ℤ/ℓ²; Λ = F_ℓ, M = Λ^{(ℕ)} | evaluation iso; (ℤ/ℓ)^∗ = Hom(ℤ/ℓ, ℤ/ℓ²) ≅ ℤ/ℓ so M ≅ M^{∗∗}; M^{∗∗} has dimension ℓ^{2^{ℵ₀}}, evaluation injective not surjective; Mathlib has no reflexive-iff-finite result over Artinian rings (grep for `IsArtinian`/`IsSelfInjective` with `IsReflexive`: 0 hits), so VS9.5 is this roadmap's | consistent |
| VS9.9 (headline) | Λ_X on smooth fine X; closed disc D̄, j the open disc, A = j_!Λ | ULA; stalk at the Gauss point η is 0, at its rank-2 specialisation inside the open disc Λ, the specialisation map Λ → 0 is not an isomorphism, so not overconvergent, not ULA, not dualizable | consistent in both directions |
| VS9.10 | S = X = C, A = Λ², u a matrix; u = 0; permutation σ of finite T; wrong model "trace without σ" | matrix trace; 0; Fix = (T^σ)_S, x ↦ tr(u_x); the wrong model agrees in degree 0 and is excluded by the Λ ⊕ Λ[1] Check (0, not 2) | consistent |
| VS9.11 / VS9.12 | A = Λ³ ⊕ Λ[1]; X = [S/(ℤ/2)]; U = X; U = ∅ | cc = 3 − 1 = 2; In_S(X) = (ℤ/2) × X, two components; identity; In_S(∅) = ∅, cc = 0 | consistent |
| VS10.1 (headline) | X = P¹_C, X′ = C′ = S, C = ∅; c = id, p = q | pushed endomorphism 0 on RΓ(P¹, Λ), trace 0 = ∫_∅; reduces to VS10.2 | consistent |
| VS10.2 (headline) | X′ = S, X = P¹; p an isomorphism | ∫_{P¹} cc(Λ) = χ(P¹) = 2; In_S(P¹) = P¹; transport of structure | consistent; In_S(p) proper nice via closed immersion into X ×_{X′} In_S(X′) |
| VS10.3 (headline) | P¹, g = az, a ≠ 1 (any characteristic, p = 2 included); closed disc, char 0, g = T + p | Fix = {0, ∞}, multipliers a, a⁻¹, local terms 1 + 1 = 2 = tr(g \| H⁰ ⊕ H²); Fix = ∅ but tr = 1 on RΓ(D, Λ) = Λ | properness hypothesis needed and present; Corrections bullet 6 justified |
| VS10.4 | X = S, F = Λⁿ; β = ∅; g = id on P¹ | n; 0; no pointwise term, only ∫ = 2 | consistent |
| VS10.5 | a = id; Spd C → Spd C′; without the mate | identity; A ↦ A; a_C^*c₂^!F → c_{2,T}^!a_X^*F is the mate of (BC1), not an isomorphism for non-smooth c₂ (profinite projections) | consistent |
| VS10.6 (headline) | a = id; C ⊂ C′, P¹, g = az; T → S a geometric point | identity; fixed points 0, ∞ over both, 2 = 2; local terms over S determined at points | consistent |
| VS10.8 (headline) | X = Spec k, c = id; perfection of A¹, x ↦ x + 1; Λ = F_ℓ[t] | χ(F) both sides; Fix = ∅ both sides (x + 1 = x impossible in char p); outside EtaleDualityAndPerverseSheaves §6.2's finite-ring range (its head, lines 6292–6294), so the two gaps are exactly what is missing | consistent |
| VS11.1 | M in degree 0, M^K finite projective; C_c(ℚ_p, Λ), K = ℤ_p | pro-p invariants exact since p ∈ Λ^× (nΛ = 0, p ∤ n), so admissible; C_c(ℚ_p)^{ℤ_p} = C_c(ℚ_p/ℤ_p) of infinite rank, not admissible | consistent |
| VS11.3 | G = ℤ/2, Λ = F_3, sign, μ counting; G = ℤ_p, M = Λ; M[1]; R02 witness | I_{1_1,μ} = id, trace 1; I_{1_σ,μ} = σ = −1, trace −1; ∫ h dμ; sign flips; 2·2⁻¹μ(K) = μ(K) versus 4μ(K) | consistent; direction to be pinned (R02) |
| VS11.4 (headline) | G finite, μ counting; G = ℤ_p, M = Λ | cc(M)(1_g ⊗ μ) = tr(g \| M), the character; cc(Λ) = the Haar distribution | consistent |
| VS11.6 | T = S; T = [S/G], G finite étale | cc_{S/S}(Λ) = 1; In_S(T) = ⊔_{[g]} [S/Z_G(g)], K ≅ Λ | consistent |
| VS11.9 (headline) | T = S; X_i = T, A_i = Λ | tr(A ⊗ B) = tr(A)tr(B) on Euler characteristics; cc(Λ_T) ⊗ cc(Λ_T) ⊗ cc(Λ_T)⁻¹ = cc(Λ_T) | consistent |
| VS11.10 | X = S; trivial action; ℤ/2 swapping {a, b} | Fix(c) = G, In = [G//G]; Fix(c) = X × G, In = X × [G//G]; Fix(c̃) = {(a,1),(b,1)}, nothing over σ | consistent |
| VS11.12 (headline) | X = S | Y = [S/G], Fix(c̃) = G, tr_{c̃}(ũ, Λ_G) = 1 ∈ H^0(G, Λ); ι sends the canonical trivialisation cc_{[S/G]/S}(Λ) to 1 | consistent |
| VS11.13 | g = az near 0 and ∞; affine group a ∈ 1 + ϖO, b ∈ O on P¹, U = G ∖ {1} | linear terms (a − 1)z, (a⁻¹ − 1)w nonzero, étale; in w = 1/z the fixed equation is w(bw + a − 1) = 0, double root at w = 0 when a = 1, b ≠ 0, so Fix_U → U is a degree-2 cover branched along a = 1, not étale, although every element of U has isolated fixed points | étaleness hypothesis needed; Corrections bullet 2 justified |

Context: `Suggested.lean` declares nothing, so no `variable`/`include` or `#check @name` question arises. Generality: README statements are at the sources' generality or wider as noted above; no Lean signature to compare.

### Supplier citations resolved this round

- VStackSheavesAndLisseCategories (head of #1230): §VS0.1 `VS0/artin-v-stack-definition`, §VS0.2 `VS0/enhanced-smooth-descent` and `VS0/shriek-pullback-for-smooth-stacky-maps`, §VS1.1 `VS1/ula-definition-with-constructibility`, `VS1/ula-descent-and-smooth-locality`, `VS1/ula-dualizability-criterion`, §VS1.2 `VS1/smooth-ula-criterion`, `VS1/ula-for-artin-v-stacks`, §VS4.2 `VS4/classifying-stack-equivalence`: all present. Three labels absent: R01.
- DiamondSixOperations (head of #927): §§S0.1, S0.2, S0.4, S1.1–S1.5, S2.3, S2.4, S3.1–S3.4, S4.1–S4.5, S5.4, S5.5 all headings (lines 120–1071); S5.4 contains "Rq^! is a sheaf of distributions"; S1.2 is the definition of Rf_! with independence of the compactification.
- DiamondsAndVStacks (head of #820): D4.1, D4.6, D4.7, D4.10, D5.1, D5.2, D5.12, D5.14, D6.4, D6.5 headings and all ten cited slugs present (lines 5781–9039).
- EnhancedDerivedSheaves (main): §E1.4 (line 580), §E2.6 (2293), §E3.2 (1153), §E3.4 (1229), §E5:abstract.1 (1440).
- EtaleDualityAndPerverseSheaves (head of #1040): §§6.1–6.3 (lines 6219, 6284, 6563); `TauCeti.EtaleDuality.CohCorr.pullbackAlong` and `.restrictOpen` (6428–6430); §6.2's range is `D^b_ctf` with Λ a finite ring killed by a power of ℓ or an adic field extension (6292–6294), so the two declared gaps ask exactly for what is absent.
- AdicCoefficientsAndComparisons (head of #965): the six L1/L3 target headings (lines 788, 932, 1444, 1469, 1499, 1544).
- SchemeAndStackFoundations (main): §0.23a (1508), §0.24 (1565) with `perfection_universalHomeomorphism` (1577).
- SmoothRepresentationsOfLocalGroups (head of #1688): §SR.0.3 with *compact-open-invariants* (762), *averaging-projector* (827), *unit-pro-order* (786); §SR.0d.2 with *derived-invariants* (1721), *derived-smooth-dual* (1795), *compact-generation* (1779); §SR.1.1 with *locally-constant-compact-support* (1047), *a-valued-haar-measure* (1098, `HaarMeasureWithValues` at 1100), *integration* (1125), *convolution-algebra* (1157); §SR.2.1 with *smooth-induction* (1900), *compact-induction* (1919), *frobenius-reciprocity* (1937); §SR.2.2 with *modulus-character* (2029).
- PivotalSpherical (main) Layers 2 and 7 (trace definitions, `FGModuleCat` rigidity); AdicSpacesPartIII (main) §R3.8 with *projective-module-trace* and *projective-trace-realization* (lines 11858–11860, table line 662); DGAInfinity (main) Layer 5 (compact objects are the perfect modules, line 462).
- Direction: every supplier is on main or earlier in the merge order (ORDER.txt lines 2, 9, 15, 17, 25, 89, 113, 115, 143 against this roadmap's 144); no citation of a later roadmap; no `*Needs:*` edge uses anything the Scope excludes.

### Declared gaps

Six gaps, same slugs in `design/plan.json` `gaps` (each with `slug`, `id`, `supplier`, `section`, `needs`) and in the README's supplier subsections as `What <Supplier> must provide (gap:<slug>)`. Each `needs` sentence is self-contained with its hypotheses (F03 of the design review applied). EnhancedDerivedSheaves §E3.4 on main has ringed diagrams and coherent mates only (no restricted nerves, partial adjoints or DESCENT), and EtaleDualityAndPerverseSheaves §§6.2–6.3 at its head has the finite-ring, `D^b_ctf` range, so none of the six asks for something already provided. Suppliers named, so none is unowned.

### Dependency gate

    depcheck: 242 roadmaps, 2482 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line (the roadmap is in the merge order at line 144, after all its suppliers).

### Ownership and duplication

`roadmaps grep` over main and all open heads: "decent v-stack", "prespatial", "universal local term", "CoCorr", "module of Haar measures", "Haar(G" match nothing; "cohomological correspondence" and "Lefschetz–Verdier" occur in EtaleDualityAndPerverseSheaves (the scheme version, cited as supplier) and in automorphic or function-field consumers; "trace distribution" only as complex automorphic distributions; "inertia stack" only in PELModuli and ComplexMultiplicationAndExplicitReciprocityPartII (Shimura moduli, not v-stacks). Mathlib at the pin: no monoidal bicategory (grep `MonoidalBicategory`: 0 files), `DerivedCategory` without a monoidal instance (grep in `Algebra/Homology/DerivedCategory/`: 0 hits), no reflexive-iff-finite over Artinian rings. This roadmap is therefore the owner of decent v-stacks, the stacky exceptional functors, `Corr_S`/`CoCorr_S` of v-stacks, trace classes, local terms on v-stacks and the torsion-coefficient trace distribution. Ownership against open pull requests was checked with the roadmaps tools over all open heads.

### Library declarations at the pins

A scratch file with `#check @name` for all 24 cited Mathlib declarations elaborated with no error: `CategoryTheory.MonoidalCategory` (Monoidal/Category.lean 161), `SymmetricCategory` (Braided/Basic.lean 364), `ExactPairing` (Rigid/Basic.lean 78), `.coevaluation` (104), `.evaluation` (107), `HasRightDual` (237), `Bicategory` (Bicategory/Basic.lean 61), `Bicategory.Adjunction` (Adjunction/Basic.lean 89), `Pseudofunctor` (Functor/Pseudofunctor.lean 57), `LocallyConstant` (LocallyConstant/Basic.lean 212), `LocallyConstant.charFn` (Algebra.lean 92), `TopologicalSpace.CompactOpens` (Sets/Compacts.lean 777), `Module.Dual` (Dual/Defs.lean 61), `Module.Dual.eval` (70), `Module.IsReflexive` (203, R04), `Module.instIsReflexiveOfFiniteOfProjective` (Dual/Lemmas.lean 262), `Module.instFiniteDimensionalOfIsReflexive` (284), `IsDiscreteValuationRing` (DiscreteValuationRing/Basic.lean 56), `IsLocalRing.maximalIdeal` (MaximalIdeal/Defs.lean 30), `Module.Finite` (Finiteness/Defs.lean 121), `LinearMap.trace` (Trace.lean 75), `FGModuleCat` (FGModuleCat/Basic.lean 57), `FGModuleCat.rightRigidCategory` (265, R04), `DerivedCategory` (DerivedCategory/Basic.lean 87). `TauCeti.IsSmoothDiscrete` is in `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean`.

### Lean form, elaboration, headlines and padding

`lake env lean packages/VStackSheavesAndLisseCategoriesPartII/Suggested.lean` from the content checkout: exit 0, no output (2.5 s). Form: one module docstring titled "…: target signatures", `import Mathlib` only, the namespace, no declarations, no `set_option`, no `lemma`, no process text. Headline theorems from the README Summary: VS10.1, VS10.2, VS11.4, VS11.9, VS11.12, with the deep inputs VS7.5 and VS9.9; the docstring names each of these (and VS10.3, VS10.6, VS10.8) with the missing carrier (small v-stacks, `D_ét`, `CoCorr_S`, symmetric monoidal bicategories, inertia stacks). Each is checked not statable: Mathlib and Tau Ceti at the pins have no perfectoid spaces, v-site, diamonds or v-stacks (Tau Ceti's adic spaces stop at `AdicSpace`; its perfectoid rings are R03), and no monoidal bicategory. VS9.4 and VS9.5 are statable in part but are auxiliary lemmas (HKW22 Lemma B.1.1–B.1.2), not headlines; stating them would be API padding, so their absence is correct. No sorried declaration exists, so the one-tactic probe is empty and there is no padding.

### README shape and style

Headings as upstream: Summary, Scope and ownership, Conventions, Exact supplier contracts (per supplier), How to read the build, six layers with `### k.n` subsections, each layer ending in Examples and Dependencies, Corrections to the sources, Downstream consumers, References. Every subsection carrying "The API of" (26 definitions and constructions) has at least three Checks and every subsection has at least two (counted mechanically); every theorem has its "Throughout this subsection" hypotheses and a source paragraph with theorem and page; `*Needs:*` lines are per target. No LaTeX delimiters, no process words, no pull-request numbers or dates, no machine paths, no HTML anchors (grep). All eight cited works are in `sources.toml` with `certified` status; the two design-review residues (duplicated "§S1.5, §S1.5" and "§S4.4 and §S4.4") are gone (grep: 0 hits).

## Not verifiable

- none. Every cited text is in the cache and was opened; GHW22 Theorem 3.14, Propositions 3.15–3.16 and 4.12–4.13 and Sch17 Propositions 22.3, 22.7 and Theorems 27.1–27.4 were not individually re-read this round (they are not in the sample and no finding touches them).

## Source issues

- **Misprint** in HKW22 at §4.3, paragraph after Proposition 4.3.5, printed page 31: the source says the dualizability-equals-ULA criterion for maps representable in nice diamonds is Fargues–Scholze Theorem IV.2.24; it should be Theorem IV.2.23 of arXiv:2102.13459v4 (IV.2.24 is the relative proposition for proper Y/S), as the source itself cites in the proof of Proposition 4.4.1; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "303f60ecf42b3c2d185513667f13c0d7b31625fa", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII", "model": "fable", "worker": "chris-x17"} -->
