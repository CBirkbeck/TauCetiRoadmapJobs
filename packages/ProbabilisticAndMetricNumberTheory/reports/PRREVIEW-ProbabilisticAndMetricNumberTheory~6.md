# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at 2b2cf8e)

**Verdict:** needs changes

This is an incremental re-review of the 39 README lines changed since 2c0cd98. `Suggested.lean` and `metadata.toml` are unchanged. All three previous findings are repaired. The changed text has two new P3 findings: R01 comes from the repair of the previous R01, and R02 from the new PNTPlus citation. Nothing blocks.

## R01 (P3) — The contract for `leftRegular` omits the hypotheses of its strong-continuity lemma

**Location.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:63: "is the left regular representation g↦(f↦f(g⁻¹·)) of a group on `Lp E p μ` for a left-invariant μ, unitary for p=2 (…) and strongly continuous for p≠∞ (`MeasureTheory.Measure.continuous_leftRegular_apply`)".

**Claim.** Read as written, the sentence says that every left-invariant μ gives a strongly continuous representation whenever p≠∞. That is false. The pinned lemma also needs:
- a topological group with its Borel σ-algebra;
- μ locally finite;
- μ inner regular on sets of finite measure by compact sets.

The definition itself also needs measurable multiplication on G. No target of this roadmap consumes the lemma: it is cited only for the comparison Check at README:6362, where all its hypotheses hold. Hence P3.

**Witness.** `TauCeti/RepresentationTheory/Continuous/LeftRegular.lean`:102–103 carries `[IsTopologicalGroup G] [BorelSpace G] [μ.InnerRegularCompactLTTop] [IsLocallyFiniteMeasure μ] (hp : p ≠ ∞)`, and line 50 carries `[MeasurableMul G]`. Counterexample: counting measure on Borel ℝ is left-invariant, yet with p=2, ‖λ(t)δ₀−δ₀‖₂=√2 for every t≠0.

**Repair.** Replace the clause with: "…of a group with measurable multiplication on `Lp E p μ` for a left-invariant μ, unitary for p=2 (`MeasureTheory.Measure.isUnitary_leftRegular`) and, for a topological group with its Borel σ-algebra, μ locally finite and inner regular on finite-measure sets by compact sets, and p≠∞, strongly continuous (`MeasureTheory.Measure.continuous_leftRegular_apply`)".

**Tested repair.**
- Counting measure on ℝ gives every neighbourhood of 0 infinite mass, so the repaired sentence no longer covers it.
- Lebesgue measure on ℝ meets every listed hypothesis, and ‖λ(t)1_[0,1]−1_[0,1]‖₂=√(2|t|)→0 for |t|≤1, as the lemma says.

## R02 (P3) — The PNTPlus citation for `IsAdditive` names a different predicate, has no fixed version and is missing from the manifest

**Location.**
- README:104: "[PNTPlus](#references) `IwaniecKowalskiCh1.lean`, `IsAdditive`".
- README:7164: "Lean formalisation, GitHub repository, file `PrimeNumberTheoremAnd/IwaniecKowalskiCh1.lean`; cited for §0.1".

**Claim.**
1. PNTPlus defines `IsAdditive` for an `AddZeroClass` codomain by the coprime law on nonzero inputs alone. It has no clause f(1)=0. README:206 itself says that this clause does not follow without additive cancellation. The cited declaration is therefore this roadmap's predicate only when R is cancellative.
2. The reference names no commit, unlike the pinned references at README:7150–7152, so the file and declaration can move.
3. The roadmap's `sources.toml` has 37 entries, from TAO-RESIDUES to IK2004, and none is PNTPlus. The README cites a work the manifest does not record.

**Witness.**
- PNTPlus lines 47–48, read at the repository's main branch, give the definition described in point 1.
- Take R=ℕ∞ and f(n)=⊤ for n≥1. Then f(mn)=⊤=⊤+⊤, so PNTPlus's predicate holds. This roadmap's predicate fails, because f(1)=⊤≠0.

**Repair.** Choose one of two:
- **Delete the citation.** Remove "; [PNTPlus](#references) `IwaniecKowalskiCh1.lean`, `IsAdditive`" and the PNTPlus reference. ElsholtzTao2011 Appendix A already locates the definition.
- **Keep it.** Pin the reference to a commit and a line, append "whose predicate omits f(1)=0 and agrees with this one when R is additively cancellative", and record PNTPlus in `sources.toml`.

**Tested repair.**
- For R=ℝ, PNTPlus gives f(1)=f(1·1)=2f(1), so f(1)=0 and the two predicates agree.
- For R=ℕ∞ with f≡⊤ on positive integers, the added clause records exactly the difference.

## Previous findings

- R01 — repaired: README:6355 "Define scalarLpKoopman p μ, the `ContRepresentation ℂ G (Lp ℂ p μ)` with π(g)f=`DomMulAct.mk g⁻¹ • f`. Only this packaging is new: its laws are the library's." The contracts are at README:53 and 63, the scope at README:7 and 11. The new contract sentence introduced R01.
- R02 — repaired: README:6610–6612 "which rest on the quotient measures of AnalyticNumberTheoryPartII §5.3k, Mathlib's fundamental-domain unfolding, modular character and domain action on Lᵖ, Tau Ceti's fundamental domains of properly discontinuous actions, unitary representations …".
- R03 — repaired: README:6361 "For the symmetric group S₃ acting on {1,2,3} with counting measure and p=2, π((12))δ₁=δ₂ and π((23))π((12))δ₁=δ₃=π((23)(12))δ₁ …". README:6362, the `leftRegular` comparison, is a third discriminating Check.

## Verified sound

**Gate, build, dependencies, elaboration.**
- The push gate, rerun on this head:
  ```text
  gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's gate on the same head adds `build=0`.
- The dependency check with `--movable` prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. Merge order:

  | Roadmap | Position |
  |---|---|
  | AnalyticNumberTheoryPartI | 49 |
  | AnalyticNumberTheoryPartII | 50 |
  | AdelicAlgebraicGroups | 51 |
  | SieveMethodsAndPrimePatterns | 55 |
  | this roadmap | 60 |
  | GeometryOfNumbersAndQuadraticArithmetic | 148 |

  DiophantineApproximationAndTranscendence is on main.
- `lake env lean` on `Suggested.lean`: exit 0, 66 warnings, all `declaration uses sorry`, no errors.
- `Suggested.lean` was last changed in 9c6663c (sha256 3089e163…), so the one-tactic probe of r4 still applies. The six signature leads of the worker's elaborated types are the same false positives as in r4–r5:
  - `torusPolynomial` needs no `Fintype d`.
  - `hΓn`, `ha` and `hu` survive as unnamed hypotheses, for example `mahler_relativelyCompact_iff`'s `(∀ g, g ∈ Γn ↔ …) →`.
- The change touches no file outside the folder; the gate agrees (outside-folder=0).

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).

Mathlib, `MeasureTheory/Function/LpSpace/DomAct/Basic.lean`:
- `DomMulAct.smul_Lp_ae_eq` (:43): c•f is a.e. f(mk.symm c • ·), so mk(g⁻¹)•f = f(g⁻¹•·) a.e.
- `DomMulAct.norm_smul_Lp` (:103).
- `SMulCommClass` with scalars (:69–75).
- `MulAction` (:130) and `DistribMulAction` (:132).
- The section variables (:33) are exactly `SMulInvariantMeasure` and `MeasurableConstSMul`.

Mathlib, `MeasureTheory/Function/LpSpace/DomAct/Continuous.lean`:
- `MeasureTheory.Lp.instContinuousSMulDomMulAct` (:57). Its variables (:47–54) are:
  - X: R₁ and Borel;
  - M: a topological monoid that also carries a measurable space with `OpensMeasurableSpace M`;
  - `ContinuousSMul M X`;
  - μ: locally finite, `InnerRegularCompactLTTop` and `SMulInvariantMeasure`;
  - `Fact (1 ≤ p)` and `Fact (p ≠ ∞)`.
- This matches README:53 and 6357 clause for clause, including the measurable structure on M that the conclusion does not involve.

Mathlib, other files:
- `DomMulAct.mk_mul` (`GroupTheory/GroupAction/DomAct/Basic.lean`:136): mk(ab)=mk b·mk a.
- `DomMulAct.continuous_mk` (`Topology/Algebra/Constructions/DomMulAct.lean`:41).
- `MeasureTheory.SMulInvariantMeasure` (`MeasureTheory/Group/Defs.lean`:59, inside `namespace MeasureTheory`).
- `MeasurableConstSMul` (`MeasureTheory/Group/Arithmetic.lean`:438). `ContinuousConstSMul.toMeasurableConstSMul` (`BorelSpace/Basic.lean`:547) supplies it in the continuous case.
- `MeasureTheory.Lp.compMeasurePreservingₗᵢ` (`MeasureTheory/Function/LpSpace/Basic.lean`:666). The previous remark that README:53 placed it in the wrong file is resolved.
- `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean`:55) is `G →* V →L[R] V`, with no topology on G.

Tau Ceti:
- `ContRepresentation.IsUnitary` (`Unitary/Basic.lean`:49) and `isUnitary_iff_norm_map` (:53). This is norm preservation, so unitarity at p=2 follows from `norm_smul_Lp`.
- `IsUnitary.norm_inner_map_le` (:114).
- `IsUnitary.continuous_apply_prod` (`Unitary/StronglyContinuous.lean`:29).
- `MeasureTheory.Measure.leftRegular` (`LeftRegular.lean`:57), whose convention is f(g⁻¹x). Also `isUnitary_leftRegular` (:94) and `continuous_leftRegular_apply` (:102); see R01.

**The new text of §4.9a.**
- The homomorphism law: with g=(12), h=(23), gh=(1 2 3) and (gh)⁻¹=(1 3 2). Then mk(g⁻¹)·mk(h⁻¹) = mk(h⁻¹g⁻¹) = mk((gh)⁻¹), so π(gh)=π(g)π(h) follows from `mul_smul`.
- The strong-continuity route: compose (`continuous_mk` ∘ inversion, const f) with the jointly continuous action. The statement needs no σ-algebra on G, because the proof may install the Borel σ-algebra.
- The Koopman paragraph (README:6368–6370, untouched) still meets the hypotheses of the repaired target: X=G/Γ is Hausdorff, μ is a finite Radon measure, and the action is continuous.

**§3.1 API bullets (README:3433–3437) against `Suggested.lean`:335–350.** `dsSet` ranges over `Finset.Icc 1 q` filtered by coprimality, and `khinchinSet` over `Finset.range (q+1)`. Both use closed intervals of radius ψ q / q intersected with [0,1]. Every bullet holds (rows below), and the previous remark about a sentence split across two bullets is resolved.

**Cross-roadmap citations resolved this round.**
- AnalyticNumberTheoryPartII at head 0717d3f: README:701 §5.3k with `exists_unique_quotientMeasure`.
- DiophantineApproximationAndTranscendence on main: §0.5 at README:429 and §0.6 at README:502 (`BadlyApproximable`). They match the new "§§0.5–0.6" at README:6608–6609 and the *Needs:* line at README:6471.
- Each supplier on a §§4.9a–4.9b *Needs:* line is now named in the Layer 4 Dependencies paragraph:
  - ANT II §5.3k (6347);
  - DAT §§0.5–0.6 (6471);
  - Tau Ceti's fundamental domain (6347) and `ZLattice` results (6457);
  - LieGroups (6400);
  - the Mathlib domain action (6366).
- The pull-request description now lists AnalyticNumberTheoryPartII under "Depends on" and in the merge-order line, which resolves the previous remark.

**Sources checked at their locators.**
- Morris2015 Example 11.1.3 at line 9085, printed p.214 (physical page 230). Its convention ϕ(h⁻¹x) is the README's π(g)f=f∘(g⁻¹•). Its hypotheses (Lie group, locally compact metrizable space, Radon measure) are a special case of the README's general statement, and the citation is for the convention.
- Ciobotaru2014 Definition 2.2 at line 118, p.3: a strongly continuous homomorphism into the unitary group.
- PNTPlus `IwaniecKowalskiCh1.lean` lines 47–48, fetched from the repository's main branch; see R02.

**Seeded sample.** None of the fifteen sampled targets lies in the changed passages, and none cites them: §§0.5, 0.7, 0.8, 1.4, 1.6, 2.5, 2.7, 3.3, 3.6, 3.10, 4.2, 4.3, 4.6, 4.7 and 5.2. The changed passages are §0.1's locator, the §3.1 API bullets, the §4.9a pullback representation, the Layer 4 Dependencies, the scope paragraph, the Mathlib and Tau Ceti contracts, and the references. Following the brief, the sample was not re-verified this round. The README flags no locator as unverified.

**Ownership.**
- `scalarLpKoopman` occurs only in this roadmap and in GeometryOfNumbersAndQuadraticArithmetic (`roadmaps grep` over main and 466 open heads).
- `IsAdditive` on `ArithmeticFunction` is not at the Mathlib pin (no `def IsAdditive` under `Mathlib/`).

**Remark on untouched text (no change requested).** GeometryOfNumbersAndQuadraticArithmetic at head 04dd46e (README:1259–1261) still builds scalarLpKoopman itself, from `Lp.compMeasurePreservingₗᵢ` and `Lp.compMeasurePreserving_continuous`. This roadmap comes earlier in the merge order (60 against 148) and owns the packaging. The citation of §4.9a and of the `DomMulAct` declarations belongs in GoN's own pull request. This folder's README:11 and 7114 are already correct.

**Adversarial table.** Rows marked (r5) are carried from the previous report (PRREVIEW-ProbabilisticAndMetricNumberTheory~5) for statements this change leaves untouched; they include the rows that report had carried from r4. The other rows were computed this round.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| scalarLpKoopman = mk(g⁻¹)• (README:6355) | S₃ on {1,2,3}, counting measure, p=2; g=(12), h=(23) | mk(g⁻¹)·mk(h⁻¹)=mk(h⁻¹g⁻¹)=mk((132))=mk((gh)⁻¹); π((12))δ₁=δ₂, π((23))δ₂=δ₃, π((23)(12))δ₁=δ₃ | homomorphism, laws hold | — |
| same, degenerate | G trivial; μ=0; non-invariant μ (Gaussian on ℝ, translations) | π(1)=id; Lp=0; Gaussian excluded by `SMulInvariantMeasure`, since ‖1_[0,1](·−t)‖ changes with t | OK | — |
| Check 1 (S₃) | π vs f∘(g•) vs trivial | δ₃=δ₃ for π; f∘(g•): composite δ₃, product δ₂; trivial: δ₁≠δ₂ | discriminating | — |
| Check 2 (`leftRegular`) | G=ℝ, Lebesgue, p=2, t=1, f=1_[0,1] | mk(−1)+f=f(·−1)=1_[1,2]=leftRegular(1)f, ‖·‖₂=1; without inverse 1_[−1,0] | discriminating, agrees with pin | — |
| a.e. formula | `smul_Lp_ae_eq`, c=mk g⁻¹ | f(mk.symm(mk g⁻¹)•·)=f(g⁻¹•·) | matches README | — |
| unitarity p=2 | S₃, δ₁, δ₂ | ⟨π(12)δ₁,π(12)δ₂⟩=⟨δ₂,δ₁⟩=0=⟨δ₁,δ₂⟩; norms 1=1 | `isUnitary_iff_norm_map` applies | — |
| scalarLpKoopman_strong hypotheses | instance variables :47–54 vs README:6357 | R₁, Borel Y, ContinuousSMul, locally finite, InnerRegularCompactLTTop, 1≤p<∞, OpensMeasurable G | equal lists | — |
| same, locally finite needed | counting measure on ℝ, δ₀, p=2 | ‖π(t)δ₀−δ₀‖₂=√2 for all t≠0 | discontinuous, so the hypothesis is needed | — |
| same, positive case | Lebesgue on ℝ, 1_[0,1], p=2 | ‖1_[t,t+1]−1_[0,1]‖₂=√(2|t|) for |t|≤1, →0 | continuous | — |
| `leftRegular` contract (README:63) | counting measure on Borel ℝ, p=2 | left-invariant, p≠∞, ‖λ(t)δ₀−δ₀‖₂=√2 | sentence false as written | R01 |
| §3.1 `dsSet` | q=0; q=1, ψ=1/2; q=3, ψ(3)=−1 | Icc 1 0=∅; [1/2,3/2]∩[0,1]=[1/2,1]; Icc(a/3+1/3, a/3−1/3)=∅ | bullets correct | — |
| §3.1 `khinchinSet` | q=0, any ψ(0); q=2, ψ=1/2 | Icc(0−ψ(0)/0, 0+ψ(0)/0)=Icc 0 0={0}; [0,1] vs 𝒜₂=[1/4,3/4] | 𝒦₀={0}, 0∈𝒦₂∖𝒜₂ | — |
| §3.1 limsup at one index | change s 0 | limsup atTop = {x : ∃ᶠ q, x∈s q}, unchanged by one index | correct | — |
| `IsAdditive` vs PNTPlus | R=ℕ∞, f≡⊤ on n≥1; R=ℝ | PNTPlus true, README false (f(1)=⊤); ℝ: f(1)=2f(1)⇒0, agree | citation fits only cancellative R | R02 |
| Layer 4 Dependencies | *Needs:* 6347, 6366, 6400, 6457, 6471 vs 6607–6612 | ANT II §5.3k, DAT §§0.5–0.6, Mathlib domain action, Tau Ceti fundamental domain, unitary, ZLattice, LieGroups: all named | complete | — |
| (r5) lattice_unimodular | G=ℝ, Γ=ℤ; G=SO(2), Γ={1} | periodization ∫₀¹Σf(x+n)dx=∫_ℝf, c=1; c=1/λ(G); Δ≡1 both | OK | — |
| (r5) lattice_unimodular, Check 1 | affine group, g=(2,0), S=[1,2]×[0,1] | λ(S)=∫₁²a⁻²da=1/2; λ(Sg⁻¹)=∫_{1/2}^1a⁻²da=1=2·λ(S); Δ(g)=2 under map(·*g)λ=Δ(g)λ | Check correct; ⟨x↦2x⟩ discrete, no lattice | — |
| (r5) lattice_unimodular, mass argument | t=Δ(h)=2 | push-forward masses of [2ⁿ,2ⁿ⁺¹) all equal: total 0 or ∞, never 1 | contradiction as stated | — |
| (r5) lattice_unimodular, Check 2 | ℝ/ℤ vs ℝ/{0} | Haar probability exists vs none; Δ=1 in both | not an equivalence, correct | — |
| (r5) `lattice_invariant_probability_unique` route | ℝ/ℤ, F=[0,1) and F′=[1/2,3/2); λ′=3·Leb | μ(image [0,1/2))=1/2 via F and via F′ (λ([1,3/2))=1/2); 3/2 ÷ 3 = 1/2 | formula independent of F and of the scaling of λ | — |
| (r5) same, null sets | E=ℚ/ℤ | μ(E)=0, λ(ℚ)=0 | Check correct | — |
| (r5) same, degenerate | G=ℝ, Γ={0}; G noncompact, Γ={1} | no invariant probability: vacuous | OK | — |
| (r5) same, SL₂ | F⊆Σ⁻¹ pieces | λ(F) ≤ 2π·2/√3 ≈ 7.255, c=1/λ(F) | finite, positive | — |
| (r5) §5.3k scaling as used | ℝ/ℤ, λ=2·Leb; counting on ℤ doubled | ν(X)=2=2·1; dġ halves (§5.3k's c⁻¹ law) | dg-law follows from uniqueness | — |
| (r5) §5.3k inversion | Γg·h ↦ h⁻¹g⁻¹Γ | right G-invariance on Γ\G becomes left invariance on G/Γ | consistent with README:6340 | — |
| (r5) scalarLpKoopman, Check 4 (p≠∞) | Lebesgue on ℝ, 1_[0,1]; p=1, p=∞ | ‖1_[t,t+1]−1_[0,1]‖₁=2|t|→0 (|t|≤1); ‖·‖_∞=1 for t≠0 | p≠∞ needed (Check 3 correct) | — |
| (r5) scalarLpKoopman, Check 3 (ℤ on the circle) | ℤ on circle, α=√2−1, k=1 | eigenvalue e(−0.4142) vs e(0.4142); 2α≈0.828∉ℤ, so they differ | Check correct | — |
| (r5) §4.9a Koopman paragraph | X=ℝ/ℤ, p=2 | 1↦1, ‖1‖=1, 1∉L²₀; fixed vectors in L²₀: 0 | OK | — |
| (r5) ANT I contract (README:73) | D(14); counts r=1,2 | {1,2,5,10,13}; 3, 1 | names exist at 70913eb | — |
| (r5) Ring/Finset lines | pin 1b1ccf4b | `prod_one_add` 199–200; docstring + `sum_pow_mul_eq_add_pow` 236–239 | correct | — |
| (r5) §3.4 Lemma 11.1 (`GCDGraph.quality_restrictPow`) | k=ℓ=1 vs k=1, ℓ=2 | local factor p^0/(1−1/p)²(1−p^(−31/30))¹⁰ vs p/(1−p^(−31/30))¹⁰ | matches KM p.288 | — |
| (r5) §0.1a IsCompletelyAdditive | Ω at 4; ω at 4; log; v_p at 0 | Ω(4)=2=1+1; ω(4)=1≠2; log 1=0; 0.factorization p=0 | Ω, log, v_p completely additive; ω not | — |
| (r5) §0.1a map_pow | f=Ω, n=2, k=0,3 | f(1)=0; Ω(8)=3 | OK | — |
| (r5) §0.1a factorization formula | n=12, f=Ω; n=1 | 3; 0 | OK | — |
| (r5) §0.1a powOfAdditive | k=1; f=0; k=0 | 1; k^0=1 | OK | — |
| (r5) §0.1a 2^ω multiplicativity | 12=4·3; 4=2·2 | 4=2·2; 2≠4 | multiplicative, not completely | — |
| (r5) §0.1a powOfAdditive_mul for Ω | 4=2·2 | 4=2·2 | completely multiplicative | — |
| (r5) §0.1a isMultiplicative_of_eq_monoidHom at 0 | m=0, n=1 | g(0)=g(0)·1 | OK | — |
| (r5) §0.2 primeDivisibilitySum | ({2,3},p) at 12, 0, 1; ({2},2) at 4 | 5; 0; 0; 2 vs 4 | OK | — |
| (r5) §0.3 divisibility, lcm | N=5,d=2; N=12,(4,6); N=5,(2,3) | 2/5, e=−1/10; 1/12; 0 vs 2/25 | OK | — |
| (r5) §0.4 moments | N=5, P={2,3}; N=6 | mean 7/5, pair −1/15; A=2, V=3, 9/5 | OK | — |
| (r5) §0.5 patterns | ({2,3},5), ({2,3},6), ({2,4},4); S={2},T={3},N=5; S=∅,T={2,3},N=6 | 0; 1/6; 1/4 vs 0; 2/5 (model 1/3); 1/3 | OK | — |
| (r5) §0.5 summed error | N=5, P={2,3} | 1/3 ≤ 9/5 | OK | — |
| (r5) §0.7 residues | N=5,d=3; N=2,d=5; A={1,2}; F=±1 | 1/5,2/5,2/5; 4/15; 6/5; 2/15; 4/15 | OK | — |
| (r5) §0.8 CRT | q=(2,3),N=5; q=(4,9),N=36; N=2 | 0, 1/5; 1/36; 17/9 | OK | — |
| (r5) §0.9 excess | D(72); means N=4,12,16; tails N=12 | 3; 1/4, 5/12, 1/2; 1/3, 1/12, 0 | OK | — |
| (r5) §0.11 Euler bounds | M=4; M=3; p=2,N=2; base 2; M=8 | 9/8; 1; 1/8; 9/4; 19/16; 5/8, 1/8, 5/32 | OK | — |
| (r5) §0.11 local term | p≥2 | 1/(p(2p−3)) ≤ 2/p² ⟺ 6 ≤ 3p | OK | — |
| (r5) §0.12 concentration | atoms 0,1; δ=1/2; Dirac | 1/2; 0 | OK | — |
| (r5) §0.13 rough comparison | N=4, y=2 | sum 1/4, TV 1/8 | OK | — |
| (r5) §1.1 ν_p | p=3, e=3,4; p=2 | 2/27, 2/27 ≤ 2/9; 0; 1/4 | OK | — |
| (r5) §1.1 M₄ | P={2,3} | 203/432 | OK | — |
| (r5) §1.3 even bound | P={2,3} | V=17/36, 3V²=289/432, diff −43/216; Q=145/1296 | OK | — |
| (r5) §1.4 cutoff | n=60,z=3,5; n=8,z=3/2; n=30,z=2 | 2,1; 0; 0,1; 2 log 2 ≤ log 30 | OK | — |
| (r5) `turan_kubilius` N=2 | f(2) | f(2)²/2 vs 30f(2)² | OK | — |
| (r5) §2.1–2.2 Checks | n•(1/2); two-sided | δ₀, δ_{1/2}; halves differ | discriminate | — |
| (r5) `weyl_polynomial` | α₂=1/2 vs √2 | 2•(1/2)=0 | hypothesis needed | — |
| (r5) `polynomial_haar_mixture` | s=0; d empty | S={0}; one point | OK | — |
| (r5) §2.6 subtorus | M=(2); M=(1,1)ᵀ | Haar; 1, 0 | OK | — |
| (r5) §2.7 Erdős–Turán | S–P Thm 1.11.2.1, s=1 | 3/(H+1); 3 | matches Lean | — |
| (r5) `starDiscrepancy` | {0}; {1/2}; ∅ | 1; 1/2; 0 | OK | — |
| (r5) §3.1 sets | ψ=1/2 | [1/2,1]; [1/4,3/4]; 0∈𝒦₂∖𝒜₂ | OK | — |
| (r5) §3.2 KM Lemma 5.3 | q=2,r=3,ψ=3/10 | M=9/10<1; overlap 1/6 | 2M ≥ gcd | — |
| (r5) `hausdorff_duffin_schaeffer` | f(r)=r², k=1 | 0=0 | true | — |
| (r5) `duffin_schaeffer_dimension` | all t<1 divergent; t₀ | min(⊤,1)=1; t₀ | OK | — |
| (r5) §3.9 Cantor | radii 1/16, 1/64, f=√r | 1/4, 1/8 | OK | — |
| (r5) §3.9 Lemma 7 | c=3 | 5 r_A | OK | — |
| (r5) §4.1 truncation | successor L=2; Bool flip | U=2; τ=2,1 | OK | — |
| (r5) `birkhoff_pointwise(_ergodic)` | one point; swap | 2; 1/2 | OK | — |
| (r5) §4.4 Gauss measure | (0,1]; (1/2,1] | 1; log(4/3)/log 2 | OK | — |
| (r5) §4.5 words | v_[1,2](0), v_[2,1](0) | 2/3, 1/3; det² 1 | OK | — |
| (r5) §4.6 mixing | identity; swap | 1/2 vs 1/4; no limit | OK | — |
| (r5) §4.6 density bounds | tail preimage | m(B_n) ≥ log 2·μ(B) | OK | — |
| (r5) §4.7 constants | digit 2; Lévy | log(9/8); 1.1866 vs 0.4812 | OK | — |
| (r5) §4.8 operators | L1(0); Lh; P1; P(id)(0) | π²/6; h; 1; π²/6−1 | OK | — |
| (r5) §4.9 contraction | c₁…c₄, tail, total | 1/2; 5/72; 7/216; 19/800; 1/4; 0.8756<0.9 | OK | — |
| (r5) `density_uniform_error`, `gauss_kuzmin` | n=0; a=1 | −0.4427; 1/2 vs 0.4150 | OK | — |
| (r5) `howe_moore_of_cartan` | G=ℝ, e^{it}; compact G | hypothesis fails; cocompact=⊥ | OK | — |
| (r5) `howe_moore`, `moore_ergodicity` | SU(2); S compact | vacuous; excluded | OK | — |
| (r5) `mahler_relativelyCompact_iff` | n=0,1; a_t | trivial; e^(−t) | OK | — |
| (r5) §4.9b Haar density | d₄ on [0,1]×[1,2] | 1/2; 16, 4 log 2 fail | OK | — |
| (r5) `modular_timeOne_mixing` | a₁; a_t⁻¹n_xa_t | e, e⁻¹; n_{e^(−2t)x} | OK | — |
| (r5) §4.10 conventions | t=log 2, x=1; golden x | [[2,2],[0,1/2]]; 0.618 | OK | — |
| (r5) `shortMean`, MR Check | f=1 | 3/2; difference 0 | OK | — |
| (r5) §5.1 inclusion–exclusion | {2},{3} at 6,2,1 | 1, 0, 0 | OK | — |
| (r5) `logCorrelation` | λ, x=w=2,4 | 1/(2 log 2); −1/12; 13/12 | OK | — |
| (r5) §5.2 twisted Liouville | χ₀ mod 2, x=3 | 7/6 vs 1/2 | OK | — |
| (r5) §5.1a entropy | (1/2,0,1/4,1/4) | 0.4774 + 0.5623 = (3/2) log 2 | OK | — |
| (r5) §5.3 models | R(4), R(6), S(12); N=4 | 0, ξ₂ξ₃, ζ₂²ζ₃; 3, 4 | OK | — |
| (r5) `liouville_two_point_nontrivial` | h=1, X=4 | −2; 1/2<1 | OK | — |

## Not verifiable

- PNTPlus was read at the main branch of its repository as fetched today, because the reference names no commit (R02). The cited lines 47–48 refer to that copy.
- These sources are waived and cited by locator only: BHV2007, Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a, Rogozin1961b and IK2004. None of their locators is in the changed text.
- Folland §2.6, the source behind AnalyticNumberTheoryPartII §5.3k, is that roadmap's citation and was not opened.
- Ownership was checked against main and the 466 open heads that the roadmap tools index; nothing unindexed was searched.

## Source issues

- none
