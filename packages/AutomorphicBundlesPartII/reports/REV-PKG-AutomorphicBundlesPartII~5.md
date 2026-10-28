<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6402458025 -->
Review (claude) of 36e646b

Verdict: accepted
Conditional on the announced gaps: `integral-dual-weyl-lattices`, `coefficient-linear-coherent-comparison`, `gaga-duality-trace`, `boundary-spin-satake`, `coefficient-logarithmic-splitting`, `integral-small-weight-dual-bgg`, `classical-weight-one-realization`, `nonparallel-hilbert-realization`, `su-parabolic-regularization`

1. **F01** (P3) "fundamental classes" is over-listed in the SchemeAndStackFoundations contract

   **Location:** `packages/AutomorphicBundlesPartII/README.md:69`, "…ordinary support triangles and Cousin resolutions, depth vanishing, proper coherent upper shriek, fundamental classes, smooth-proper duality and formal functions".

   **Claim:** The contract says SchemeAndStackFoundations §§2.18–2.21 supply fundamental classes. On main that README contains no fundamental-class target; §2.19 supplies the lci upper-shriek identification (`upperShriek_lci`), and the class itself is constructed by AlgebraicModuliForArithmeticGeometry §7.5 (`fundamental_class_boundary`), which every use in this package already cites (lines 264, 564, 578, 1098). The same contract-list pattern as round-4 F01, but nothing is unowned, so P3.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` has zero occurrences of "fundamental class" (grep), and §2.19 (line 4094) lists `upperShriek_lci`; AlgebraicModuliForArithmeticGeometry §7.5 at its open head states `fundamental_class_boundary` with Θ : O_X → f^!O_Y.

   **Repair:** In line 69 replace "fundamental classes" by "the lci upper-shriek identification `upperShriek_lci` (§2.19) consumed by AlgebraicModuliForArithmeticGeometry §7.5's fundamental class". Tested: §3.4's *Needs:* line already pairs AlgebraicModuliForArithmeticGeometry §7.5 with SchemeAndStackFoundations §§2.18–2.21, so no edge changes and depcheck output is unchanged.

2. **F02** (P3) §0.18 is cited in a *Needs:* line but absent from the contract and the layer dependencies

   **Location:** `packages/AutomorphicBundlesPartII/README.md:901`, "*Needs:* the model above; SchemeAndStackFoundations §§0.18, 2.7–2.8; ShimuraCompactifications C5."; the Layer 5 `### Dependencies` at line 1188.

   **Claim:** §0.18 exists on main (so this is not drift) and is the right section for the Cohen–Macaulay thickenings of §5.0, but the SchemeAndStackFoundations contract (line 69: §§1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10) does not list it, and the Layer 5 Dependencies list omits §0.18 and also §§1.1, 2.23 cited at line 883.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1254` "### 0.18 Scheme-theoretic support and Cohen–Macaulay schemes"; README line 1188 lists only "§§2.6–2.8, 2.18–2.21; §§4.8–4.10" for that supplier.

   **Repair:** Add "0.18" to the section list in line 69 with the clause "scheme-theoretic support and Cohen–Macaulay schemes (§0.18)", and add "SchemeAndStackFoundations §§0.18, 1.1, 2.23" to the Layer 5 Dependencies. Tested: all three sections resolve on main; depcheck already counts SchemeAndStackFoundations as a supplier, so the edge count is unchanged.

3. **F03** (P3) §8.5's case split uses "nonparallel" where the source's first case is "scalar-parallel"

   **Location:** `packages/AutomorphicBundlesPartII/README.md:1508`, "The point contribution vanishes for nonparallel weights; the curve-type contribution vanishes unless the l_v are parallel … In the parallel scalar case use π_*O_D=O_∂".

   **Claim:** The source's dichotomy is "k_v = l_v = k independent of v" versus everything else. The README's two cases, "nonparallel" and "parallel scalar", leave a parallel non-scalar weight such as κ = (4,2) at every real place unassigned. The theorem statement (H⁰(D_C,ω_κ|D)_m = 0 for all admissible κ) is unaffected; only the proof-route wording has the hole.

   **Witness:** BCGP21 line 3323 (printed p. 237) opens the first case with k_v = l_v = k independent of v; lines 3329–3331 (p. 238) treat every other weight by vanishing on π⁻¹(∂₀X*).

   **Repair:** Replace "for nonparallel weights" by "unless k_v = l_v = k is independent of v (the scalar-parallel case)". Tested on κ = (4,2)_v: the second branch gives zero point contribution and a curve-type contribution of parallel Hilbert weight (4)_v, which §8.4 and the R18.3.29 contract then handle; on κ = ((4,4),(2,2)) both contributions vanish and H⁰(D)=0 outright.

4. **F04** (P3) Sch15 reference link points to a copy other than the one the locators and manifest use

   **Location:** `packages/AutomorphicBundlesPartII/README.md:1614`, "arXiv manuscript uses chapter V and Corollary V.1.7, p. 83 … [Sch15](… Bonn Torsion.pdf)".

   **Claim:** The page locator "manuscript p. 83" was verified in the arXiv v2 text (Sch15 line 3087 is the page-83 marker; Corollary V.1.7 at line 3089), and `sources.toml` records `url` and `fetched_from` as arXiv 1306.2070v2. The README link names a different host whose pagination is not the one certified.

   **Witness:** `packages/AutomorphicBundlesPartII/sources.toml:81–82` (arXiv url, fetched_from) versus README line 1614 (Bonn link).

   **Repair:** Point the reference link at the manifest's url (arXiv abs 1306.2070v2). Tested: the locator p. 83 / Corollary V.1.7 matches that copy at Sch15 line 3089.

5. **F05** (P3) ExteriorPower line number off by three

   **Location:** `packages/AutomorphicBundlesPartII/README.md:53`, "`SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean` (line 52)".

   **Claim:** At the pinned Tau Ceti the declaration starts at line 49.

   **Witness:** `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49` "def exteriorPower (n : ℕ) :". The other cited lines (Base.lean 45, 57, 110, 127; LongExactSequence.lean 242; Differentials/Basic.lean 85; TensorProduct.lean 63; Basic.lean 66, 80, 86; SerreDuality.lean 113; KProjective.lean 113 and 43) are exact.

   **Repair:** Change "(line 52)" to "(line 49)".

Both round-4 findings are repaired at the current head (witnesses below). The adversarial pass on the repaired passages, the fifteen seeded source targets, the headline and every passage a finding touches found no false statement, no vacuous target, no unowned prerequisite and no supplier drift. Five P3 notes remain; none blocks. The acceptance is conditional on the nine declared supplier gaps listed at the end of "Verified sound".

## Verified sound

Read: the whole README (1624 lines: scope, conventions, 23 supplier contracts, 69 numbered target subsections, every *Needs:* line, eight layer Dependencies, worked examples, references), `Suggested.lean` (84 lines), `metadata.toml`, `sources.toml` (16 entries), `design/plan.json` gaps, the round-4 review and the round-5 repair report. Principles: no route-specific shortcut (the general PEL theorem of §5.3 is retained beside the three GSp₄ ranges; coefficient statements are over an arbitrary complete DVR), no re-planned roadmap (Part II starts where AutomorphicBundles B5 ends, line 3), no upward or cyclic supply (depcheck below), no copied passage in the inspected statements, no computational algorithm, no sorry'd data, no `set_option`, no `lemma` keyword (the only grep hit is the prose "Dolbeault lemma", line 1223), no LaTeX delimiters, no process narrative (the three "removed" hits are mathematical), no pull-request numbers, no machine paths.

### Round-4 findings, checked individually at the current head

| Finding | Status | Repaired passage and verification |
|---|---|---|
| F01 (P1) perfect proper pushforward attributed to SchemeAndStackFoundations | Repaired | Line 69 no longer says "perfect proper pushforward". Line 9: "EnhancedDerivedSheaves E1.9 owns perfectness of proper-support pushforward and its arbitrary base change." Line 153 states E1.9 (`perfect_proper_pushforward`) with f finitely presented, E perfect, G• bounded, finitely presented, termwise flat over the target with proper support, used with G•=O_X[0]. Line 254 applies it to X→Spec O "under the proper, flat, finite-presentation hypotheses". Line 264 *Needs:* and line 346 Dependencies list E1.9. Line 271 adds the target-flatness negative control. Verified against main: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:925` (heading) and :1057–1070 (statement, including the specialization "Rf_∗E is perfect and commutes with arbitrary base change when f is proper, flat and finitely presented"). EnhancedDerivedSheaves is merge-order line 19, before the moved position (line 231). Pattern sweep: the remaining "perfect pushforward" mentions (line 259 API bullet, line 426 Check) claim no supplier. |
| F02 (P3) endpoint Check did not separate support from completion | Repaired | Line 474: "Ordinary local cohomology with support agrees with completion at both endpoints (A in the first case, 0 in the second), so these endpoints separate completion from the open-complement term but not from local cohomology; the k[x] Check below separates those two." Recomputed: RΓ_{V(0)}A = A = Λ_{(0)}A, RΓ_{V(1)}A = 0 = Λ_{(1)}A; for A=k[x], I=(x): completion k[[x]] in degree 0, local cohomology H¹ = k[x,x⁻¹]/k[x] ∋ x⁻¹ ≠ 0. |

No round-4 finding was marked "not actionable"; nothing is re-raised.

### Dependency check, merge order and the move

Output of the gate (`--movable`), unchanged by this review:

```text
moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The round-4 fix added EnhancedDerivedSheaves (merge-order line 19) as a supplier; the closure grew from 54 roadmaps/616 edges to 56/652 and the moved position is unchanged (after AutomorphicBundles, line 231 of ORDER.txt). Every cited supplier is on main (SchemeAndStackFoundations, EnhancedDerivedSheaves, AlgebraicVectorBundles) or earlier than the moved position (DerivedModuleAlgebra 7, CrystallineCohomology 23, SmoothRepresentationsOfLocalGroups 28, IntegralHeckeAndGaloisDeterminants 31, AlgebraicModuliForArithmeticGeometry 39, ComplexComparisonPartII 46, ArithmeticGaloisRepresentations 52, DeformationAndDerivedPatchingAlgebra 74, LanglandsParameterStacks 78, AutomorphicFormsOnReductiveGroups 80, ModularCurvesPartII 88, AutomorphicSpectralTheory 98, VStackSheavesAndLisseCategories 149, SolidAnalyticRings 150, WeightsInEtaleCohomology 164, EndoscopicTransferAndUnitaryTraceComparison 166, HilbertModularVarietiesAndShimuraCurves 176, ShimuraCompactifications 177, AutomorphicBundles 231). The only later roadmap named is OverconvergentAutomorphicForms (236), cited only as a downstream consumer.

### Supplier citations resolved this round

Every cross-roadmap section cited in the contracts and *Needs:* lines was resolved by heading on main or at the open head: AutomorphicBundles B0–B5, B3.10, B3.BGG.2–3 and `ClassicalHecke.operator` (B5.10); AlgebraicVectorBundles L0A–L0C; SchemeAndStackFoundations §§0.18, 1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10; DerivedModuleAlgebra §§0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1; DeformationAndDerivedPatchingAlgebra §§7.1, 7.3–7.10; ShimuraCompactifications C1, C3.3–C3.10, C4.1–C4.11, C4.16–C4.17, C5.3, C5.16–C5.17, C5.19–C5.21, C5.25–C5.26, C5.29, C5.31; LanglandsParameterStacks LP3.0; ComplexComparisonPartII C1.9, C2, C3.3; SmoothRepresentationsOfLocalGroups SR.0–SR.4.5; IntegralHeckeAndGaloisDeterminants §§2.2–2.3, 3a.1–3a.2, 3b.1–3b.2; AutomorphicFormsOnReductiveGroups §§1.1–1.3, 4.1–4.2, 6.1–6.7; AutomorphicSpectralTheory §§4.1–4.5, 4.10, 5.1–5.8, 5.7a; EndoscopicTransferAndUnitaryTraceComparison §11.1 with `GSp4ClassificationInputs`; ArithmeticGaloisRepresentations §§1.1–1.2, 1.7–1.12, 2.2, Layer 5 (5.1–5.3); WeightsInEtaleCohomology R34.5–R34.6; ModularCurvesPartII §§14.1–14.4a; HilbertModularVarietiesAndShimuraCurves R18.3.29; CrystallineCohomology CR.5, CR.5.1–CR.5.4, CR.DDR.6.11–6.14; EnhancedDerivedSheaves 0.1–0.3, E1.3, E1.9, E2:towers, E3.2–E3.3, E5:abstract; SolidAnalyticRings §§1.5, 2.2, 6.4, 7.1–7.2; VStackSheavesAndLisseCategories VS2.2; AlgebraicModuliForArithmeticGeometry §7.5. The citation resolver reports nothing found nowhere. The only mismatches are the two P3 contract-wording notes R01–R02.

### Declared supplier gaps

All nine gaps have the same slug in `design/plan.json` and in the README's "Exact supplier contracts", a named supplier earlier in the order, and a `needs` sentence with its hypotheses: integral-dual-weyl-lattices (LanglandsParameterStacks LP3.0), coefficient-linear-coherent-comparison (SchemeAndStackFoundations §2.18), gaga-duality-trace (ComplexComparisonPartII C1.9, C3.3), boundary-spin-satake (SmoothRepresentationsOfLocalGroups SR.4.5), coefficient-logarithmic-splitting (CrystallineCohomology CR.5.4), integral-small-weight-dual-bgg (AutomorphicBundles B3.BGG.2–3), classical-weight-one-realization (WeightsInEtaleCohomology R34.6), nonparallel-hilbert-realization (HilbertModularVarietiesAndShimuraCurves R18.3.29), su-parabolic-regularization (AutomorphicSpectralTheory §5.2). Minimality spot checks: LP3.0 is "Highest-weight modules and good filtrations" over fields (integral lattices are not there); AutomorphicSpectralTheory §5.2 regularizes the full (𝔪_G,K_∞) pair, not Su's (p_o,K_o) pair; CR.5.4 is the log Poincaré lemma and log crystalline cohomology, not the Lan–Suh relative vanishing (whose exact hypotheses the gap lists, verified at LanSuh lines 2012–2031). None asks for something Mathlib, Tau Ceti or an earlier roadmap already provides.

### Source sample: all fifteen seeded targets

All read in the cached extractions; no fetch was needed and the manifest was not changed. GK19 remains settled as uncertified and is not reopened.

| Target | Locator read | Verification |
|---|---|---|
| 1.5 Coherent homology over a DVR | CG18 §7.2, printed p. 395, line 3981; CG20 §7.2, p. 51, line 1986 | Source defines H_i := H^i(E^*⊗ω_Y⊗O/ϖⁿ)^∨ with Pontryagin dual; the package restates with the O-linear Matlis dual into E/O and separately records that the two differ over a ramified O (the ϖ²=p Check). Supported. |
| 2.1 Equivariant Čech model | CG18 pp. 397–398, lines 4048–4057 | Affine cover of X, inverse-image cover of Y, terms N⊗_A B with the Δ action, D⊗O/ϖⁿ computes H^i(Y,f*F⊗O/ϖⁿ). Supported; the package adds the infinite-rank caveat the source leaves implicit. |
| 2.2 Étale Galois projectivity | BP26 Lemma 2.6.11, p. 22, lines 1124–1131; CG18 proof of Lemma 7.7, p. 398, lines 4067–4070 | r_*O_Y finite locally projective over O_X[G]; A[G]-flat when X is A-flat. Characteristic-p freeness via Nakajima plus Kaplansky; no averaging. Supported. |
| 2.3 Integral Čech freeness | CG18 Lemmas 7.5–7.7, pp. 397–398, lines 4031–4061 | Lemma 7.7's hypotheses (finite Galois étale Spec B→Spec A of O-flat algebras, N O-flat, Δ abelian p-power order) and conclusion ((N⊗_A B)/ϖⁿ free over O[Δ]/ϖⁿ) match the target exactly. |
| 3.3 Composition of correspondences | BP26 §2.2.9, p. 14, lines 696–724; §2.3.12, p. 17, lines 854–869; P20 §4.3, p. 19, lines 809–828 | The sources construct the action of T on RΓ; composition is the package's formal consequence with the named inputs. Supported. |
| 3.6 Base change | BP26 §2.6.12, pp. 22–23, lines 1132–1150 | Finite S′→S, X and S′ Tor-independent, F A-flat, as the Conventions (line 27) and the target state. Supported. |
| 3.13 Coherent Hecke operators | BCGP21 Definitions 3.9.1–3.9.2 and §3.9.3, printed pp. 226–227, lines 2881–2900; CG18 pp. 398–400, lines 4140–4162; P20 §5.3, pp. 24–25, lines 1068–1085 | Correspondence T:p₂*F→p₁!G, action on RΓ, lift to the perfect model by the K-projective bijection. Supported; the "algebra action only after Layer 5" caveat is the package's own and is consistent with the sources. |
| 4.2 Integral divisibility | P20 Remark 4.3.3, p. 19, lines 837–840; §14.9, pp. 102–105, lines 4647–4783 | Factorization T:p₂*F→ϖ^k p₁!G→p₁!G over a DVR with flat X,Y,C; T_{p,2} and U_{Kli(p),2} act after ⊗Q_p (line 4678). Supported. |
| 4.4 GAGA and the tower | CG20 §5.3, pp. 24–25, line 994; BP26 §1.1, p. 2, lines 55–73 | Tower of smooth admissible G(A_f)-complexes, computed by automorphic forms after ⊗C. Supported. |
| 5.3 Lan–Suh general PEL vanishing | LanSuh §7, p. 40, line 1803; Prop. 7.21, pp. 41–42, lines 2012–2039; Thm 7.22, p. 42, line 2042; Cor. 7.24, p. 43, lines 2069–2073; CG20 lines 946–964 | Cor. 7.24(1)–(2) is exactly the two displayed vanishings with the i−ℓ(w) shift; hypotheses max(2,r_τ)<p, |μ|_L+d<p, positive parallel ν, condition (3.25) via Cor. 7.14, Assumption 1.4 and nilpotent residues all appear in Prop. 7.21's proof. Supported. |
| 5.5 Vanishing above degree one | CG20 Theorem 5.1(2), p. 22, lines 935–937; proof pp. 22–24 | a+b≥6, 2≤a−b≤p−2, i>1. Exact. |
| 5.6 Positive-degree vanishing | CG20 Theorem 5.1(3), p. 22, lines 938–940 | b≥4, 0≤a−b≤p−4, i>0. Exact. |
| 6.8 Holomorphic cusp eigensystems | P20 §5.3, pp. 24–25, lines 1057–1065 and Remark 5.3.1, line 1089; CG20 proof of Prop. 6.8, p. 39, lines 1560–1573; Sch15 Cor. V.1.7, p. 83, lines 3089–3103 | λ-dictionary (lines 1058–1059) gives (1−k−r,2−r;k+2r); line 1064's "1−k+r" is the misprint recorded below. Sch15: k>n totally real, k≥n CM; Petersson adjoints make the Hecke image a product of copies of C. Supported. |
| 7.3 Large singular-weight decomposition | P20 Theorem 15.2.2.1 and Theorem 15.2.3.1, p. 108, lines 4922–4951 | k=−λ₁−1, c=−λ₁+3=k+4, k≥R−1, multiplicities m_h, m_g in degrees 0 and 1. Supported; the λ₁ sign at line 4927 is recorded below. |
| 8.5 Degree-zero Hilbert–Siegel boundary | BCGP21 Remark 3.10.6 and Lemma 3.10.7, pp. 237–239, lines 3310–3357; BR16 Thm 1.12, pp. 10–11, line 523; Prop. 1.14, pp. 11–12, line 579; Remark 1.15, line 648 | Weight conditions, non-Eisenstein m, H⁰(D,ω_κ)_m⊗E=0; the π_*O_D=O_∂ route (lines 3328–3329); BR16's characteristic-zero caveat retained. Supported, with the wording note R03. |

Also read for §3.0a (not sampled before): CS19 Definition 9.1 (p. 62, line 2318), Theorem 9.8 (p. 65, line 2449), Proposition 11.2 (p. 73, line 2795), Definition 11.3 and Proposition 11.4 (p. 74, lines 2805, 2820), and footnote 18 (line 2801, derived fibre products when the square is not Tor-independent). All five locators are exact and support the paragraph.

### Adversarial pass (computed)

Aₙ = O/ϖⁿ, k a field, degrees cohomological unless stated. Rows cover the repaired passages, the headline, the sampled targets and every passage a finding touches.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, Aₙ ≃ (E/O)[ϖⁿ] by x↦x/ϖⁿ | O=ℤ₃, n=2 | 1↦1/9; 9·(1/9)=1≡0 in E/O; kernel (9) | Retained |
| `dvrCoefficientRing` at n=0 | any O | span{ϖ⁰}=⊤, quotient is the zero ring (probe elaborated) | Excluded by hn : 0<n |
| `integerCoherentCohomology` in negative degree | i=−1 | zero module (probe closed by `simp`); a toNat branch would return H⁰ | Retained |
| §1.1 polarization law | g=1, ψ₁=2, c=3 | ψ₂=3/2, ψ₁ψ₂=3; ψ₂=2 gives 4 | Retained |
| §1.2 left translation | m=(123) permutation matrix, f=m₂₁ | f(m′⁻¹m) at m′=1 gives 1; f(m⁻¹m′) gives (m⁻¹)₂₁=0 | Correct inverse position |
| §§1.3, 4.1, 6.7 normalization | (5,2), x=2; (4,2) | 2⁷=128, ν=4, 4⁻³=1/64, 128/64=2=2^(a+b−6); ν³ gives 8192; (4,2): 64/64=1 | Same ν⁻³ in each layer |
| §1.4 derived reduction | [O→O] with ϖ | H=(0,k); ⊗^L k gives (k,k); H⁰⊗k=0 | Retained |
| §1.4 E1.9 application (repaired) | ℙ¹_O, O(−2); Spec k→Spec k[ε]/ε² | H⁰=0, H¹=O, RΓ=O[−1], ⊗^L A₂ = A₂[−1]; G•=O_X[0] flat over O iff X flat; nonflat case Tor_j^A(k,k)=k ∀j | Perfect; nonflat excluded by E1.9's target flatness |
| §1.4 deck ring | k=𝔽₂, Δ=C₂, trivial module | Tor_j^{k[C₂]}(k,k)=k ∀j | Base perfectness ≠ deck perfectness |
| §1.5 dual conventions | O=ℤ_p[ϖ], ϖ²=p; 𝔽₅, δ=2, λ(1)=1 | different (2ϖ); (δλ)(1)=λ(3)=3, 3·2=6≡1; using δ gives 4 | Inverse action and inverse different retained |
| §1.6 headline | Spec Aₙ, d=0, F=O; ℙ¹_A, A=ℤ/9, F=O(2) | Hom(Aₙ,Aₙ)=Aₙ, i=±1: 0=0; Hom(F,ω)=O(−4): H¹=A³ dual A³=H⁰(O(2)); H⁰(O(−4))=0=H¹(O(2)) | Holds; d−i integer subtraction |
| §1.6 trace / coefficient controls | genus-one curve over k; B=k[ε,δ]/m², F=k | RΓ(ω)[1]: H⁻¹=k, H⁰=k ≠ k[0]; Hom_B(k,B) dim 2, bidual dim 4 ≠ 1 | Trace is a morphism; non-free F excluded |
| §1.6 completeness hypothesis | O=ℤ_(p), n=1 | Serre duality over 𝔽_p holds without completeness | Unused in the headline; matches the roadmap-wide convention (note only) |
| §2.1 model | trivial torsor, one open; Δ=1 | degree-0 term (Γ(F)⊗Aₙ)⊗Aₙ[Δ]; ordinary Čech | Retained |
| §2.2 freeness | 𝔽₂×𝔽₂ over 𝔽₂[C₂] | basis (1,0),(0,1)=σ(1,0); trace (1,0)↦1 with |C₂|=0 | No averaging |
| §2.3 flatness | Δ=1, N=O/ϖ, n=2; N=⊕O | k not free over O/ϖ²; ⊕Aₙ[Δ] infinite rank | Hypothesis necessary |
| §2.4 dual model | ℙ¹_k, F=O | (H⁰,H¹)=(k,0); F^∨⊗ω=O(−2): (0,k) | Degree reversal correct |
| §2.5 edge sequence | R=𝔽₂[t]/t², C=[R→R]·t | H₁=H₀=k; C⊗k zero differential; dim H₁(C⊗k)=1 forces Tor₂(k,k)→H₁⊗k iso and the next map zero | Tor₂ term retained |
| §3.0a endpoints (repaired) | I=(0),(1); k[x],(x) | A=A, 0=0 at endpoints; completion k[[x]] vs H¹=k[x,x⁻¹]/k[x] ∋ x⁻¹ | Corrected Check is true |
| §3.0a CS19 inputs | X=Spec A | X^ad=Spa(A,A) (CS19 line 2700); j! left adjoint of j* (line 2795); f!=f^{ad/Y}_*∘j! (line 2807); Prop. 11.4 finite Tor-dimension (line 2820) | Locators exact |
| §§3.1–3.2 action | identity legs, coefficient ×2, ×0; degree-r finite étale | 1↦2, 1↦0; f_*f* = ×r on H⁰(O) | Retained |
| §3.3 order | x↦x+1 then x↦2x | 2x+1 vs reversed 2x+2 | Order retained |
| §3.4 ramified chart | q=tᵖ | dq=pt^{p−1}dt, value 0 at t=0; identity chart 1↦1 | Retained |
| §3.5 descent | k[C₂]⊗^L k; k⊗^L_{k[C₂]}k over 𝔽₂ | k[0]; k in every degree | Flatness separates |
| §3.6 Tor-independence | ℤ₃→𝔽₃ along itself; identity | k⊗^L k in degrees −1,0; identity Tor₁=0 | Retained |
| §3.7 twist | transports 1,0,p | operators 1,0,p; inverse needs 1/p | No integral inverse |
| §3.9 transpose | Bl_pt ℙ²; point in 𝔸¹; (123); split double cover | b!O=O(E), coker O_E(−1) with H⁰=H¹=0, actions 1=1, fibre ℙ¹; i!O=k[−1], D_X(O[1])=O; ⟨σe₁,e₂⟩=1=⟨e₁,σ⁻¹e₂⟩, ⟨e₁,σe₂⟩=0; 2=2 (0=0 in char 2), averaged 1 | All four Checks true |
| §3.10 contraction | {0,1}, p₂≡0, Z={1}; t↦t², Z=V(t) | p₁⁻¹Z={1}⊄∅; supports equal, (t)⊄(t²) | Set-theoretic convention |
| §§3.11–3.12 completion | k[x], I=(x) | completion H⁰=k[[x]]; local cohomology H¹∋x⁻¹; identity filtered action 1↦1, ×2 scales | Triangles distinct |
| §3.13 detection | O[0]⊕O[−1] | projector: H⁰=0, H¹=id; zero: H⁰=H¹=0 | Degree zero insufficient |
| §4.1 factors | ℓ=2 | similitude 2 → 1/8; similitude 4 → 1/64 | Retained |
| §4.2 division | T=ϖ^k id on O; 𝔽₃ | U=id; 3^kU=0 for U=0 and U=id (k>0); k=0 identity | Torsion-freeness needed |
| §4.3 polynomial | similitudes; q=2,(1,3,2); q=1,(1,4,4) | ad=bc gives x²,x,x²; X⁴−3X³+14X²−24X+64; (X−1)⁴ | Retained |
| §4.4 invariants | C₂ on 𝔽₂, ℚ | H¹=𝔽₂ vs 0; 1+σ ↦ 2=0 | Char-0 exactness only |
| §5.0 geometry | [F:ℚ]=1; p=3,2; t↦−t; k[x,y]/(xⁿ), /(xy,x²) | dims 3,2,≤1; (1+σ)/2 idempotent only at p=3; 0 fixed in compactification; y injective, x zero-divisor; y kills x | Retained |
| §5.3 ranges and shifts | p=7, μ=0, t=2,1,0 | (4,2),(5,3),(5,5) vanish above 2,1,0; (3,1),(4,2),(4,4); t=0 excluded; smallness α+β<4; Levi (a+2)−(b+1)≤p | Matches LanSuh Cor. 7.24 and CG20 lines 966, 988 |
| §§5.4–5.6 with the worked-example substitutions | (4,2),(3,1),(6,1),(7,1),(7,4),(8,4),(4,4) | length-one (4,2): t=2,(0,0); (3,1): t=1,(0,0); length-two b≥2: t=b−1, α=a−b−2, β=0 (so a−b≥2 ⇒ a+b≥6); b=1: a≥5; b=0: a≥6; (6,1): (2,1,1) sum 3<4; (7,1): sum 4 fails; (7,4): (3,0,1); (8,4): fails; (4,4): (0,0,1) | Hypotheses of CG20 Thm 5.1 reproduced exactly |
| §§5.7–5.8 duality | (4,2); (a,3−a), p=5, a=3,4 | dual (1,−1), bidual (4,2); ω(a,3−a) is self-dual up to (−D), so H⁰_can dual to H³_sub; a=3: 2a−3=3≤p−2 and ≤p−1; a=4: 5>3 excluded | Range (p+1)/2 correct |
| §5.9 reduction | [O→O]·ϖ; O[0] | 0→k not surjective; O→k surjective | Retained |
| §5.14 idempotents | T=Aₙ×Aₙ; ℤ at (3) | (1,0),(0,1): e²=e, product 0, sum 1; ℤ_(3) not a summand | Retained |
| §5.16 congruence | O[t]/t(t−ϖ) | both characters reduce to (ϖ,t); M_(m,C)=C²; T⊗C has two maximal ideals | Retained |
| §6.1 image | (t)→k[t] | t in the image, 1 not | Retained |
| §§6.2, 6.3, 7.1 pairs | sl₂ trivial coefficient; central 2; f(y)=y | full H²=ℂ, parabolic H²=0; 2·(1/2)=1 vs 4; ∫(log y)^{−2n}dy=∞ | Parabolic gap and core/umg distinction necessary |
| §6.8 parameter | (k,r)=(0,2) | λ₂=2−r=0, λ₁=λ₂−1−k=−1, central k+2r=4: (−1,0;4) | Package sign correct |
| §7.0 orbits | (4,2); (5,2); (3,2;0) | {3/2,3/2,−3/2,−3/2}; w=1: {3/2,3/2,−5/2,−5/2} sum −2; coefficient (−2,−3;5), balanced (2,0;−5), dual (0,−2;5), orbit {7/2,7/2,3/2,3/2} sum 10; tensor weight 0 vs 10 | All Checks reproduce |
| §7.3 bound | R=5: k=4,3 | −λ₁=5 ≥ 5; −λ₁=4 < 5; c=−λ₁+3=k+4 | Correct sign (P20 lines 4933–4939) |
| §8.1 nerve sign | (1,1),(1,0) | 0; −1 | Retained |
| §8.3 scalar | k=0,1; T_ℓ=1 | ω²; ω³(−cusps); 2 over ℂ, 0 mod 2 | Retained |
| §8.4 factorization | q=2, α=1, β=2, u=4 | (X²−3X+2)(X²−12X+32)=X⁴−15X³+70X²−120X+64; uD=8=q³T₀ ⇒ T₀=1, T₁=15, 2T₂+10=70 ⇒ T₂=30; q³T₀T₁=120, q⁶T₀²=64; [ϖ,1,1,ϖ⁻¹]·[1,ϖ,1,ϖ]=[ϖ,ϖ,1,1], ·[1,1,ϖ,ϖ]=[ϖ,1,ϖ,1] | Four distinct monomials; source display repeats one |
| §8.5 case split | κ=(4,2)_v; ((4,4),(2,2)); k=l=2 | parallel non-scalar: unassigned by the README's wording (R03), source gives point vanishing + Hilbert weight (4)_v; nonparallel with l=(4,2): both contributions 0; scalar: π_*O_D=O_∂ | R03 |
| §§8.2, 8.6 exactness | H⁰(D)=0, H¹_sub=0, H¹_can=ℂ | H⁰ iso; H¹ injection with cokernel dim 1 | Retained |
| §8.8 gaps | R_sep=3, R_gap=5: (8,4),(12,6),(8,2),(10,6); z=2 | 5,7,9,2 fail; 7,11,15,4 pass; 7,7,7,0 allowed; k−l=4≤5 rejected; 4·(1/4)=1 vs 16; R_gap≥R_sep+2 ⇒ k−l+1>R_sep+3, l−2∈{0}∪(R_sep,∞) | Quantifier order and wall retained |
| §8.9 count | l₀=0,1,2, h⁰=3 | h¹=0,3,6 | Retained |

### Pinned declarations opened

Pins: Mathlib `6b7abb3c7686`, Tau Ceti `a91d3aafa8cd`. `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45` (`cohomologyBaseModule`), :57 (`cohomologyMapBaseLinear`), :110 (`cohomologyZeroBaseLinearEquiv`), :127 (its naturality); `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean:242` (`cohomologyδBaseLinear`, adjacent natural degrees); `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:66, 80, 86`; `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49` (R05); `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`; `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:63`; `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:113` (field, curve, divisor sheaf: not the headline's carrier); `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127` (`SmoothOfRelativeDimension`, fixed relative dimension on affine charts); `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:47`; `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:238`; `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113`; `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43`.

### Elaboration, binders, padding and headline coverage

`lake env lean` on `packages/AutomorphicBundlesPartII/Suggested.lean` from the pinned content checkout: exit 0, the only output `67:8: warning: declaration uses sorry`. A scratch copy with `#check @dvrCoefficientRing`, `#check @integerCoherentCohomology`, `#check @finiteCoefficientSerreDuality` elaborated; the printed types carry every README hypothesis of §1.6 (CommRing, IsDomain, IsDiscreteValuationRing, IsAdicComplete at the maximal ideal, Irreducible ϖ, 0<n, X.Over Spec Aₙ, SmoothOfRelativeDimension d, IsProper, IsLocallyFree, IsFinitePresentation, i : ℤ) and both definitions keep their base ring and scheme data; nothing changed. One-tactic probes on the sorried theorem: `simp` made no progress, `rfl` fails (not a relation), `infer_instance` fails, `exact?` finds only the sorried theorem itself; the two pinned curve dualities have different carriers. Not padding. The two definitions are the simple ones the headline needs (a quotient ring; cohomology extended by zero). Imports are `import Mathlib` plus four existing `TauCeti.*` modules.

Headline coverage: the README's headlines are §1.6 (stated), Layer 2 equivariant perfect models and deck descent, Layer 3 composition/base change/transpose and the solid completion spectral sequence, Layers 3–4 normalized Hecke action and GAGA, §5.2, §§5.3–5.8, §§5.0, 5.10–5.16, §6.3, §§6.4–6.9, Layer 7, §8.2, §§8.5–8.6, §§8.7–8.8, §8.9. Each unstated one is named in the module docstring with the missing carrier (torsors and equivariant RΓ; coherent upper shriek; solid sheaves on schemes; Shimura towers and automorphic coefficients; PEL contractions; the integral Siegel model and its Hodge bundle; EO geometry; Su's compactification and parabolic pair; cusp/L² occurrence maps; archimedean (limit) discrete series; the toroidal boundary with residual ideals; multiplicity spaces and packets). I found no other headline statable at the pins and no stand-in.

### Shape, Checks, duplication and ownership

Every definition has an API list and at least three discriminating Checks (73 `**Checks.**` blocks; the smallest definition lists are the three for `dvrCoefficientRing`, `integerCoherentCohomology` and §3.0b); every target has a locator; every layer ends with Examples and Dependencies; cross-roadmap citations use roadmap name and section. Duplication by name: `finiteCoefficientSerreDuality`, `integerCoherentCohomology`, `dvrCoefficientRing` match nothing on main or in any indexed open roadmap pull request. Duplication by object: Matlis duality (DerivedModuleAlgebra 1.M, DeformationAndDerivedPatchingAlgebra §7.6, ArithmeticGaloisDuality) and Cousin complexes (SchemeAndStackFoundations §2.8) are cited, not restated; "equivariant Čech", "Lan–Suh", "(A,A)■" and "finite-coefficient Serre duality" occur in no other roadmap; Ekedahl–Oort strata appear only in IgusaVarietiesAndTorsionConcentration, a later consumer; "cohomological correspondence" elsewhere is étale (EtaleDualityAndPerverseSheaves §6.2) or function-field (GlobalShtukas), with different coefficients. This roadmap is the owner of §3.0a's scheme solid six operations and of the integral higher coherent application, as its Scope states.

## Not verifiable

- GK19 (Layer 7, §7.1) is settled as uncertified; cited by locator, not reopened.
- The board-package index lists nineteen packages; the READMEs of HigherHidaAndColemanTheory (519048f), PELModuliPartII (d4bb48d), ShimuraVarietiesPartII (55ec9e7), SchemeAndStackFoundationsPartII (9022ef2), CrystallineCohomologyPartII (3808b1d) and ArithmeticLocallySymmetricSpacesPartII (c1b8f80) return HTTP 404 at the listed heads, as in round 4. Ownership against those six package files is not certified; no claim that any object is absent from them is made.
- The open roadmap pull requests the brief names were not supplied as sibling checkouts; ownership against them was checked only through the roadmap service's indexed heads (the name and object greps above).

## Source issues

- **Misprint** in BP26 at §1.1, printed p. 2 (line 62): the source says M_μ is the unipotent radical of the Siegel parabolic; it should be the Levi quotient whose representations index the automorphic bundles; affects nothing.
- **Error** in CG18 at §7.2, printed p. 400 (line 4144): the source says the duality map RHom(O_Y, ω_Y[d]) → A[0] is an isomorphism; it should be the trace morphism, since RΓ(ω)[d] has other cohomology (genus-one curve: H⁻¹=k); affects the proof.
- **Misprint** in P20 at §5.3, printed p. 24 (line 1064): the source says the holomorphic parameter is (1−k+r, 2−r; k+2r); it should be (1−k−r, 2−r; k+2r), as its own Remark 5.3.1 and λ-dictionary give; affects a stated result.
- **Misprint** in P20 at Theorem 15.2.2.1(2), printed p. 108 (line 4927): the source says λ₁ ≥ R; it should be −λ₁ ≥ R, consistent with k=−λ₁−1 and k ≥ R−1 in Theorem 15.2.3.1; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238 (line 3352): the source says the spin element maps to a sum in which [1,ϖ,1,ϖ] appears twice and [1,1,ϖ,ϖ] is missing; it should list the four distinct monomials; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "36e646b", "job": "REV-PKG-AutomorphicBundlesPartII~5", "model": "fable", "worker": "fable-rev133"} -->
