# Review of SchubertGeometry (pull request #1224 at 3cffcc8)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/SchubertGeometry/README.md` (2115 lines) and `TauCetiRoadmap/SchubertGeometry/Suggested.lean` (135 lines) at 3cffcc8, 303 changed lines since 368c92d. The manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`; every library name below was opened at those pins. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty). The six findings of the previous review are all repaired (checked one by one under "Previous findings"). Two new P3 findings remain: one target without a locator, and supplier citations that the rewrite of AlgebraicVectorBundles on main (today, 47e423e0) has outdated.

## R01 (P3) — S2.3's all-word image theorem has no locator

**Location:** `README.md:815–819`: “define δ(Q) by δ(∅)=e and δ(Qi)=max(δ(Q),δ(Q)s_i) in the fixed right-word convention. Prove that the actual scheme-theoretic image of π_Q is X(δ(Q))”. Its *Needs:* line (834) names the native Coxeter declarations and S5.6 only.

**Claim:** A theorem target carries no source locator. Both inputs are stated in sources the manifest already records.

**Witness:** LLM §3.1, p. 312 (LLM lines 804–806) defines w_max(i) as the Bruhat-maximal product of a subword of i, which is δ(i). KnutsonBottSamelson §4, p. 4 (lines 141–148) says that the images of the initial segments of an arbitrary word form a weakly increasing chain of Schubert varieties, jumping exactly at the letters that increase the length.

**Repair:** Append to S2.3's *Needs:* line: “The element δ(Q) is the Bruhat-maximal product of a subword of Q, LLM §3.1, p. 312 (LLM lines 804–806), written w_max there; the weakly increasing chain of images of the initial segments of an arbitrary word, jumping at the letters that increase the length, is KnutsonBottSamelson §4, p. 4 (lines 141–148). The identification of the scheme-theoretic image with X(δ(Q)), with its base change, is the target.”

**Tested:** The recursion agrees with the subword maximum. Q=(i,i): subword products {e,s_i}, maximum s_i; recursion max(max(e,s_i),s_i·s_i)=s_i. Q=(1,2,1) in A₂: maximum w₀; recursion s₁→s₁s₂→w₀. Q=(1,1,2): subword products {e,s₁,s₂,s₁s₂}, maximum s₁s₂; recursion s₁→max(s₁,e)=s₁→s₁s₂.

## R02 (P3) — The AlgebraicVectorBundles citations describe that roadmap before its rewrite on main

**Location:** `README.md:65`: “which AlgebraicVectorBundles (Successor roadmaps, §3) describes for a further roadmap”; `README.md:487`: “using AlgebraicVectorBundles L2A's single graded quasicoherent algebra and affine-ring interfaces”; `README.md:494–495`: “supplies, in L2A, the graded quasicoherent algebra and affine-ring interfaces on which StableReduction's relative Proj is built, and its tensor, dual, exterior and determinant sheaves”.

**Claim:** AlgebraicVectorBundles on main (33196b1; its README last changed at 47e423e0, 2026-11-09) has Layers 1–4 (pullback stalks and strong monoidal pullback; flat pullback and internal Hom; symmetric and exterior powers and the determinant; linear schemes) and no “Successor roadmaps” section and no Betti cycle-class paragraph. Its numbering note maps L2A to Layer 4 (module-scheme recognition) and says the graded quasi-coherent algebras are native. So “L2A” remains followable but is cited for an object that is native at the pin, and “Successor roadmaps, §3” resolves nowhere.

**Witness:** `AlgebraicVectorBundles/README.md:364–367` on main: “L2A (structured linear schemes) is Layer 4 for the module-scheme recognition; graded algebras, graded relative Spec … are Tau Ceti's Modules/Quasicoherent/GradedAlgebra/”. `grep -c Successor` and `grep -ci betti` on that file both return 0. At the pin, `TauCeti/AlgebraicGeometry/Modules/Quasicoherent/GradedAlgebra/Basic.lean:19` defines `GradedQuasicoherentAlgebra X`.

**Repair:**

1. From AlgebraicVectorBundles (494–498): cite Layers 1–3 by content: §1.2 (strong monoidal pullback) for tensor pullbacks, §2.2 (base change of internal Hom) for duals, §§3.1–3.2 (stalks and pullback of symmetric and exterior powers; the determinant of an extension) for exterior and determinant sheaves. Delete the sentence attributing the graded quasi-coherent algebra to L2A.
2. From Tau Ceti: add one sentence naming `GradedQuasicoherentAlgebra` (`TauCeti/AlgebraicGeometry/Modules/Quasicoherent/GradedAlgebra/Basic.lean`) as the graded quasi-coherent algebra on which StableReduction Layer 2's relative Proj is built; reword line 487 accordingly (“using the native graded quasi-coherent algebra”). StableReduction on main (its lines 321 and 440) still writes “L2A”; the AlgebraicVectorBundles numbering note keeps that id followable, so S5.6 and S6.1's citation of StableReduction Layer 2 needs no change.
3. Scope (63–66): end the sentence at “the general Betti cycle-class map of complex varieties, which is not a target here”; no roadmap on main owns it (a grep for “cycle class map” over main's READMEs matches only this roadmap and DifferentialGeometry).

**Tested:** S1.4's “AlgebraicVectorBundles exterior powers” (696) is Layer 3 §3.1; S1.1's and S3.1's “tensor/dual sheaves” (647, 926) are §1.2 and §2.2; the determinant of S1.1 is §3.2. Each heading was read on main (lines 416, 499, 622, 669).

## Previous findings

- **R01 (previous) — repaired.** `Suggested.lean:114–133` states `finsum_mul_finsum_eq_finsum_finsum_of_minHeight` exactly as proposed; `README.md:1169` gives the decomposition formula its own sentence with the quantifier “min_t⟨η(t),α_i∨⟩≥−⟨λ,α_i∨⟩ for every simple root” and the locator “Introduction, p. 500; proof in §10, p. 521”; the phrase “translated-chamber multiplicity rule” is gone (grep: 0). The file elaborates with five `sorry` warnings and nothing else. Values retested in the table.
- **R02 (previous) — repaired by the second route.** S9.0 (`README.md:1661–1676`) now owns the classical topology, built from the native `TauCeti.SchemePointTopology.topology`, `affineHomeomorph`, `TauCeti.PointTopology.isOpenEmbedding_localization`, `instT2Space` and `instSecondCountableTopology`, each described correctly (From Tau Ceti 152–167; declarations at `Scheme.lean:49,165,218`, `Localization.lean:92`, `Separation.lean:59,89`). The §3A.5 contract (455–464) is now restricted to the closed-orbit part, which is what main's `ReductiveGroups/README.md:335–372` supplies; `grep -c 'classical topology'` on that file is 0.
- **R03 (previous) — repaired.** S8.2 (`README.md:1587`) cites MerkurjevEquivariant Corollary 6.8, Theorem 6.6, Corollary 1.12 and Theorem 5.1; read at lines 676, 668, 200 and 408 (pp. 16, 16, 5, 10).
- **R04 (previous) — repaired.** From Tau Ceti (280–298) names `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`, `TauCeti.weylNumerator` and `TauCeti.tensorMultiplicity_eq_sum_weylSign_mul_formalCharacter_coeff` with the right hypotheses (`Weyl/Character.lean:87–95,226–228,324`: IsKilling, finite-dimensional, algebraically closed characteristic 0, module generated by a highest-weight vector; `RacahSpeiser.lean:51–57,92`; `Numerator.lean:100–109`: domain, 2 invertible). S4.4 (1169) and S3.4 (1003–1005) consume them.
- **R05 (previous) — repaired.** S4.1's Checks (1100–1124) are four Checks on the dictionary (values in the table). An awk scan of every `**Checks.**` block in the README finds no backtick: the eight bullets named before are now prose.
- **R06 (previous) — repaired.** `README.md:1892` reads “**Type A.** The Plücker coordinates of a two-frame in k⁴ are native” with the four names, which From Tau Ceti (167–182) describes correctly (`ExteriorPower/Plucker.lean:99–104,163,250`; `Projectivization/Plucker.lean:52–56`).

## Verified sound

**Gate, build and dependencies.**

- My own gate run on 3cffcc8: every check 0 and `OK`; the worker's run agrees.
- `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`: five `declaration uses sorry` warnings (lines 68, 79, 91, 107, 123), nothing else, 9 s.
- Dependency check: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `scratch/overlaps.md`: no open pull request changes this folder, no cited id is dropped, no dropped id is cited elsewhere.

**Lean form.** One module docstring naming each headline that is not statable with its missing carrier; `import Mathlib` plus five existing `TauCeti.*` modules; no `set_option`, no sorry'd data, no `lemma`, no declaration outside the namespace. I elaborated `#check @name` for all five declarations in a scratch copy: each elaborated type equals `scratch/signatures.md`, keeps every binder its statement uses (`[Fintype P.weylGroup]` only where `dotAlternatization` needs it), and matches the README's generality (any coroot-compatible realization for S4.2–4.3, an injective one for S4.4). One-tactic probe on a scratch copy, 1 min 25 s: `simp` fails on all five (no progress, or unsolved goals), `rfl` fails on all five, and `exact?` finds for each only the identical copy of the same statement in the probe file, no library lemma. None is padding.

**Library declarations opened at the pins (file:line):** `PointTopology/Scheme.lean:49` (`Points`), `:165` (`affineHomeomorph`), `:218` (`topology`, final for affine charts; the header says charts are not proved open embeddings); `PointTopology/Localization.lean:92` (`isOpenEmbedding_localization`: `Units.val` an embedding and the units open); `PointTopology/Separation.lean:59,89`; `ExteriorPower/Plucker.lean:99–104,163,250` (`plucker` over a commutative ring with `LinearOrder ι`; `plucker_ne_zero_iff` over a domain with finite ι); `Projectivization/Plucker.lean:52–56`; `HighestWeight/Weyl/Character.lean:324`; `HighestWeight/RacahSpeiser.lean:92`; `RootSystem/Weyl/Numerator.lean:100–109`; `RootSystem/Weyl/Denominator/Basic.lean:72` (Δ=∏(1−e^(−α)) for a root pairing over a characteristic-zero ring); `LSPath/RootOperator.lean:249,272` (`minHeight`, and `minHeight_nonpos`, so the minimum includes t=0); `LSPath/Basic.lean` (`LSPath.finite` needs dominance, as `#check` shows); `Modules/Quasicoherent/GradedAlgebra/Basic.lean:19`.

**Cross-roadmap citations, resolved on main 33196b1.** ReductiveGroups §3A.5 (335–372: compact Hausdorff complex points of a proper scheme, smooth reduced orbit model, holomorphic submersion, local sections, G(ℂ)/H(ℂ)≃O_x(ℂ)), Layer 10 §10B (1759–1775: “characteristic-zero complete reducibility makes Δ=∇=L”), Layers 7, 7b, 9, §§9A, 9C; ModularCurves §0G (15 mentions); GroebnerGeometry G5; SchemeAndStackFoundations §§2.2, 2.6, 4.12, 5.7; StableReduction Layers 2 and 4; TopologicalKTheory T1.5; LieGroups Layers 6 and 8; ComplexKahlerGeometry K3–K4; RealAnalyticGeometry R3.2; AlgebraicTopology Stage 5 (item 3 at line 1588, the finite-cover transfer); MorseTheory M2; HamiltonianReduction R2a; CharacteristicClasses C5a; FlagVarieties §6.1; QuantumEnvelopingAlgebras §8.2; KacMoody §§5.4, 6.4, 7.2, 7.3; TensorProductCombinatorics §§6.3, 8.3 and Layer 6; ReflectionInvariantTheory §§1–3 (headings 1–3). AlgebraicVectorBundles: R02. SpringerResolutionAndCharacteristicCycles (#1828, lines 12, 222, 229) consumes S1 and S2.3 without restating them. The five `resolve` leads are manifest source ids.

**Ownership.** The classical topology on X(ℂ) is now built in S9.0 from the native point-topology files. Two open ReductiveGroups revisions also build it in their §3A.5 (#1332 `README.md:20,943`; #1676 `README.md:25,1363`), and ComplexComparisonPartII C−1.1 (open; cited by main's ReductiveGroups 342 and by #1828 line 13) owns scheme analytification. SchubertGeometry is on main, so under the ownership rule the open roadmaps cite S9.0 or the native file, and nothing changes here; the previous review named this route. S9.1 applies §3A.5's closed-orbit theorem, stated on main on C−1.1's complex points, with S9.0's topology: both are the topology that is the coordinate topology on affine opens and is glued along them, and S9.0 proves exactly these two properties, so they coincide. ShimuraData, AlgebraicModuliForArithmeticGeometry and ComplexComparisonPartII: the earlier result stands (this roadmap is the on-main owner).

**Seeded sample.** Each locator was read at the text. SGA1 printed page = PDF page − 16 (the running head “245” at line 9610, PDF page 261).

| Target | Locator read | Result |
|---|---|---|
| S1.2 | ConradReductive Thm 5.1.13 (line 6011, p. 143); Thm 2.3.6 (2993), Cors 5.2.8–5.2.9 (6512, 6551) | correct: split open cell and Par_G/S with det(Lie P)* ample |
| S1.3 | BrionFlags §1.1 (line 184, p. 5): C_I≅ℂ^{Σ(i_j−j)} | correct; Prop. 1.1.3 at line 189 keeps the strict-inequality misprint the README avoids |
| S1.4 | no source; deductions from exterior powers of universal maps | sound; values in the table |
| S2.3 | native Coxeter declarations; LLM 804–806; KnutsonBottSamelson 141–148 | inputs exist in the sources; the image theorem itself is uncited: R01 |
| S4.1 | Littelmann1995 §1 | correct |
| S4.2 | Littelmann1995 Prop. 4.7 (502, pp. 511–512), Cor. 2 (520), Cor. 3 (524) | correct |
| S4.4 | Littelmann1995 Introduction (89–94, p. 500), Thm 6.3 (726), Thm 7.1 (747), §9 ρ (811), Thm 9.1 (815), §10 (848–865) | correct; the decomposition formula is stated with π=π₁*η, π dominant throughout |
| S5.6 | Ramanathan1987 proof of Thm 3.11 (960–974, p. 86), Thm 4.2 (1042–1045, p. 88); LRPT2006 Lemma 1.2 (115), Prop. 2.1 (165), Thm 2.2 (190); BrionFlags §1.3 (469–477), Prop. 1.3.2 (476) | correct |
| S6.1 | Ramanathan1987 Thm 3.11(i)–(ii) (950–959) | correct, for a line bundle with nonzero sections on G/Q |
| S7.2 | BrionFlags Prop. 1.4.5 (667–685, pp. 17–18), Prop. 1.3.5 (501–509, p. 13; 683) | correct |
| S8.1 | BrionFlags §3.3 (1345–1362, pp. 37–38) | correct: K₀ of coherent sheaves and K⁰ of bundles |
| S8.2 | MerkurjevEquivariant Cor. 1.12 (200), Thm 5.1 (408), Prop. 6.5 (644), Thm 6.6 (668), Cor. 6.8 (676); Steinberg1975 uncertified | correct, at the simply-connected-commutator hypothesis |
| S9.0 | SGA1 XII Thm 1.1 (9399, p. 239), Prop. 1.3.1 (9479, p. 241), Prop. 3.1(iii),(iv),(viii) (9594–9608, p. 244), Prop. 3.2(v) (9639–9650, p. 245), §4.1 (9721, pp. 247–248), Thm 4.2 (9738, p. 248), Cor. 4.3 and Thm 4.4 (9801, 9805, p. 249); SerreGAGA §12 Thms 1–3 (735, 741, 746, pp. 19–20) | correct; proper analytic means proper and separated (footnote at 9649) |
| S9.6 | KnutsonSymplectic §4 (131–158, pp. 4–5) | correct: the theorem on K/N(T) and the BN(T)/BT statements |
| S9.8 | SGA1 XII Prop. 1.3.1 (9479): exact, faithful, conservative | correct |

**Adversarial table.** Every value was computed this round.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Lean thm 5 (decomposition) | SL₂ λ=μ=ω | η: minimal heights 0, −1 ≥ −1; right (e^(2ω)+1+e^(−2ω))+1; left (e^ω+e^(−ω))²=e^(2ω)+2+e^(−2ω) | pass |
| Lean thm 5 | SL₂ λ=ω, μ=2ω | heights 0, −1, −2; −2 fails −1; right char B(3ω)+char B(ω)=e^(3ω)+2e^ω+2e^(−ω)+e^(−3ω); left (e^ω+e^(−ω))(e^(2ω)+1+e^(−2ω)) | pass |
| Lean thm 5 | PGL₂ λ=μ=α | heights 0, −1, −2 ≥ −2; 5+3+1 terms = (e^α+1+e^(−α))² | pass |
| Lean thm 5 | SL₂ λ=0, μ=2ω | only the straight encoding has height ≥ 0; right char B(2ω); endpoint-only test would add char B(0) | pass |
| Lean thm 5 | empty root system; λ=μ=0 | singletons; e^λ·e^μ=e^(λ+μ); 1·1=1; `wt η` pinned by injectivity of f | pass |
| Lean thm 5 domain | condition at t=1 | ⟨λ+η(1),α_i∨⟩ ≥ ⟨λ,α_i∨⟩+min H ≥ 0, so λ+wt η is dominant and the inner type is finite | pass |
| Lean thm 4 | PGL₂ λ=α; SL₂ λ=ω | (1−e^(−α))(e^α+1+e^(−α))=e^α−e^(−2α)=J(e^α); e^ω−e^(−3ω) | pass |
| Lean thms 1–3 | SL₂ shape 2, straight path | H=2t; lowering gives (s₁,1;0,1/2,1), endpoint 0, then (s₁;0,1), endpoint −2; raising reverses; three encodings reached by 0, 1, 2 lowerings | pass |
| S1.2 | S₃; torus; GL₃ | (123)⁻¹=(132), twice (123); one point, dimension 0; 6 and 3 fixed points | pass |
| S1.3 | Gr(2,4) pivots (1,2),(1,3),(3,4); N=0; k² pivot 2 | Σ(p_i−i)=0,1,4, |λ|=4,3,0; point and empty; dim V∩F₁=0, V∩F₂=1 | pass |
| S1.4 | k[ε]; oversize minors; k² | incidence value ε, ideal (ε); no generators, ideal 0; closed locus the line, longest ℙ¹ | pass |
| S1.5 | m=1 | Q_src gives ω(u₁,f₁)=+1, Gram −J; native partner −f₁+cu₁ gives −1 | pass |
| S2.3 | Q=∅, i, ii | δ=e, s_i, s_i; fixed sections of ii map to e,s_i,s_i,e; tangent weights ±α_i; fibres λ, s_iλ | pass; R01 for the locator |
| S3.3 | m=0, −1, −2, 1 | e^λ (1); 0 (0); −e^(λ+α_i) (−1); Δ_i(e^λ)=0 against D_i=e^λ+e^(λ−α_i) | pass |
| S3.4 char 0 | SL₂ λ=ω | D_(w₀)e^ω=e^ω+e^(−ω)=char L(ω), with Δ=∇=L by §10B | pass |
| S4.1 Check 1 | SL₂ {tω, −tω} | heights 0, −1; pairings 1, −1; (ε,φ)=(0,1),(1,0); swapped would give φ−ε=−1≠1 | pass |
| S4.1 Check 2 | path −ω/2 then 3ω/2 | H: 0→−1/2→1, min −1/2; H reaches 1/2 at t=5/6 after the min at 1/2; reflect [1/2,5/6] (displacement ω→−ω), translate the rest: −ω/2,−ω,ω/2 merges to −3ω/2 then ω/2, endpoint −ω, min −3/2; strings (0,1) and (1,0) against (1/2,3/2),(3/2,1/2) | pass |
| S4.1 Check 3 | kω then −kω | min 0, H(1)=0, so ε=φ=0 for every k≥1; infinitely many highest elements | pass |
| S4.1 Check 4 | S = B(2ω) ∪ {constant} | all heights and pairings integral, closed; σ swaps π₁ and c: σ(f π₀)=c but f(σ π₀)=f π₀=π₁; ε(π₁)=1, ε(c)=0 | pass |
| S4.2 Checks | SL₂ straight; lower endpoint; GL₂ (t,t) | lowers to −tω (endpoint −1); H(1)−min H=−1+1=0<1 so f undefined; height x−y=0, strings 0 | pass |
| S4.3 Check 1 | bond 2 | 2·(1/2)=1, 2·(1/3)=2/3 | pass |
| S4.4 characters | PGL₂, SL₂, λ=0 | as thm 4; J(1)=Δ gives char B(0)=1; unshifted alternant gives 0 at λ=0 and e^α−e^(−α)≠e^α−e^(−2α) at λ=α | pass |
| S4.4 Lie comparison | ρ−wρ | a sum of positive roots, carried by X→H* to the same; N(λ)=Σsgn(w)e^(w(λ+ρ)−ρ) at `Numerator.lean:109` | pass |
| S5.6 | ℙ¹/ℤ; empty union; k[ε] chart | ranks 1,2,3 over ℤ, 𝔽₂, 𝔽₃; 0; ε≠0 | pass |
| S6.1 | ℙ¹ O(1), O(2), O | 1,2,3; 3 in degree 1; 1 in every degree, Proj a point | pass |
| S7.2 | ℙ¹ O(m); Gr(2,4) X_(1) | m·[e]; p₃₄=0 ∧ p₁₃p₂₄=p₁₄p₂₃, vertex p₁₂; p₂₄=0 gives the planes p₂₃=0 (pivots (1,4), λ=(2)) and p₁₄=0 (pivots (2,3), λ=(1,1)); X_(1) has pivots (2,4), λ=(1,0), dimension 1+2=3; X_(2,1) pivots (1,3), dimension 1 | pass |
| S8.1 | ℙ¹; point; Gr(2,4) | [O]−[O(−1)]: rank 0, χ=1; ℤ with unit 1; six classes, each χ=1 | pass |
| S8.2 | SL₂ | ℤ⊗_(ℤ[z+z⁻¹])ℤ[z^(±1)]=ℤ[z]/(z−1)², rank 2 = rank K₀(ℙ¹), z↦t⁻¹ with (1−t)²=0 | pass |
| S9.0 points | 𝔸ⁿ, n=0,1,2; G_m; doubled origin; dual numbers; node | point, ℂ, ℂ² Euclidean, stalks ℂ, ℂ[[z]], ℂ[[z₁,z₂]]; ℂ^×⊂ℂ open embedding, while over the adeles the units are not open and inversion is not continuous, so the restriction is not an open embedding; non-Hausdorff; one point, ring of dimension 2; ℂ[[x,y]]/(xy) | pass |
| S9.0 GAGA | id; O(−2) on ℙ¹; ℙ¹_(ℂ[t]) class t | identity, zero higher images; H⁰=0, H¹=ℂ; complex [A→A] with differential t, H⁰=0 over A, ℂ at t=0 | pass |
| S9.6 | SU₂; torus; SU₃ | ℝP²: H⁰=ℤ, H¹=0, H²=ℤ/2; point; χ=2/2=6/6=1 | pass |
| S9.8 | SL₂ weight 1; 0; torus | O(1), degree +1; trivial line; one point, distinct fibres | pass |
| Worked: type A | rows (1,0,2,0),(0,1,0,3); frame change rows (1,1),(0,2) | minors 1,0,3,−2,0,6; 6−0−6=0; new rows (1,1,2,3),(0,2,0,6): p₁₂=2, p₃₄=12 | pass |

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only; I read no text of them, so S8.2's freeness locator (Theorem 2.2, p. 173) is unchecked.
- Library names in modules without prebuilt object files were confirmed by declaration grep in the pinned source, not elaborated (the five new point-topology, Plücker and Lie-algebra names were read at their definitions).
- Ownership against ComplexComparisonPartII (#848) and GeometricQuantization (#1186) was checked only through what main's ReductiveGroups, main's SchubertGeometry and #1828 say of them, not through their files, which this brief does not list.
- The fully qualified names of `Suggested.lean` were not re-searched across all open pull requests this round; the previous review found the first four in no other roadmap, and the fifth is specific to this file.

## Source issues

- **Misprint** in BrionFlags at Proposition 1.1.3(i)–(ii), p. 5 (line 189): the source counts the indices k with i_k strictly less than j; it should count those with i_k at most j, since ⟨e₁,e₂⟩ meets ⟨e₁⟩ in dimension 1; affects a stated result.
- **Misprint** in BrionFlags at §1.4, p. 15 (line 593): the source lets B act on G×ℂ through λ(b), which leaves dominant λ without sections; it should act through λ(b)⁻¹, as Proposition 1.4.3's degree λ_i−λ_j requires; affects a stated result.
- **Misprint** in LLM at Proposition 14, p. 312 (line 810): the source requires the initial direction strictly below w; it should allow equality, since only the straight chain indexes V_λ(e); affects a stated result.
- **Gap** in MerkurjevEquivariant at Theorem 6.6, p. 16 (line 671): the draft derives the spectral sequence from Theorem 5.7 with a marginal note asking for a proof; it should give the argument that Corollary 6.8 rests on; affects the proof.
