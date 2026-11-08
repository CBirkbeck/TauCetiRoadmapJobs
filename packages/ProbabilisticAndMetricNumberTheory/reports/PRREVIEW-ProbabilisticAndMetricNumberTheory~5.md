# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at 2c0cd98)

**Verdict:** needs changes

Incremental re-review of the 120 README lines changed since 9c6663c (`Suggested.lean` and `metadata.toml` are unchanged). All five previous findings are repaired. The repair of the previous R02 introduces two P3 findings: the new general Lᵖ pullback representation re-derives what the pinned Mathlib and Tau Ceti already provide (R01), and one of its three Checks does not discriminate (R03). One P3 concerns text the change makes incomplete: the Layer 4 dependency paragraph (R02). Nothing blocks.

## R01 (P3) — `scalarLpKoopman` restates Mathlib's `DomMulAct` action on Lᵖ and Tau Ceti's `Measure.leftRegular` without citing them

**Location.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:6355–6357: "Define scalarLpKoopman p μ … π(g)=`MeasureTheory.Lp.compMeasurePreservingₗᵢ ℂ (fun y => g⁻¹ • y) (hμ g⁻¹)` … The algebraic laws are the identity and composition laws of `compMeasurePreserving` … the curried action … (Mathlib `ContinuousMap.curry`)". The scope paragraph at README:7 and 11 also claims ownership of the representation.

**Claim.** At the pinned Mathlib, every law listed for this target is already a declaration about the action of `Gᵈᵐᵃ` on `Lp E p μ`, defined for `[SMulInvariantMeasure G Y μ] [MeasurableConstSMul G Y]`, which is equivalent to the README's `hμ`. The action is `DomMulAct.mk c • f`, represented by `f(c • ·)`. Put π(g)f = `DomMulAct.mk g⁻¹ • f`. Then:

- `scalarLpKoopman_apply_ae` is `DomMulAct.smul_Lp_ae_eq` (`DomAct/Basic.lean`:43).
- `scalarLpKoopman_norm` is `DomMulAct.norm_smul_Lp` (:103).
- `_one`, `_mul` and `_inv` are the laws of the `MulAction`/`DistribMulAction` instances (:130, :132), together with `DomMulAct.mk_mul`.
- ℂ-linearity is the `SMulCommClass` instance (:69–75).
- `scalarLpKoopman_strong` is `MeasureTheory.Lp.instContinuousSMulDomMulAct` (`DomAct/Continuous.lean`:57). Its hypotheses are R₁, Borel, `ContinuousSMul`, `IsLocallyFiniteMeasure`, `InnerRegularCompactLTTop` and `p ≠ ∞`. Its proof is the one the README writes out: `ContinuousMap.curry` composed with `compMeasurePreservingLp`.

The pinned Tau Ceti already defines the same `ContRepresentation` for G acting on itself: `MeasureTheory.Measure.leftRegular`. Neither file is mentioned in the README. The genuinely new content is only the packaging of the Mathlib action as a `ContRepresentation ℂ G (Lp ℂ p μ)` for an arbitrary action.

The previous review's repair text pointed only at `Lp.compMeasurePreservingₗᵢ` and missed these declarations as well.

**Witness.**
- `Mathlib/MeasureTheory/Function/LpSpace/DomAct/Continuous.lean`:57, `instance Lp.instContinuousSMulDomMulAct : ContinuousSMul Mᵈᵐᵃ (Lp E p μ)`.
- `TauCeti/RepresentationTheory/Continuous/LeftRegular.lean`:57, `def leftRegular : ContRepresentation 𝕜 G (Lp E p μ)`, with `isUnitary_leftRegular` (:94) and `continuous_leftRegular_apply` (:102).

**Repair.**
1. Define scalarLpKoopman as g ↦ (f ↦ `DomMulAct.mk g⁻¹ • f`). `DomMulAct.mk_mul` gives mk((gh)⁻¹)=mk(g⁻¹)·mk(h⁻¹), so this is a homomorphism.
2. Replace the derivation paragraph (README:6357) with the citations listed above. For `_strong`, add a Borel σ-algebra on G, as the instance requires `OpensMeasurableSpace G`.
3. Add `Mathlib/MeasureTheory/Function/LpSpace/DomAct/Basic.lean` and `DomAct/Continuous.lean` to the "From Mathlib" contract, and Tau Ceti `MeasureTheory.Measure.leftRegular` to the "From Tau Ceti" contract.
4. Narrow the scope sentence to "the `ContRepresentation` packaging of Mathlib's domain action on Lᵖ".
5. Add a Check that for Y=G with a left-invariant μ, scalarLpKoopman p μ = `μ.leftRegular ℂ ℂ p`.

**Tested repair.** G=ℝ acting on itself, μ Lebesgue, p=2, f=1_[0,1], t=1:
- mk(−1)•f = f(·−1) = 1_[1,2], which is `leftRegular` at t=1, with ‖·‖₂=1.
- The other convention f(·+1)=1_[−1,0] differs.
- On S₃ acting on {1,2,3}: mk(((23)(12))⁻¹) = mk((12)⁻¹)·mk((23)⁻¹). So π((23)(12))δ₁ = δ₃ = π((23))π((12))δ₁.

## R02 (P3) — The Layer 4 dependency paragraph omits AnalyticNumberTheoryPartII §5.3k

**Location.** README:6607–6609: "Homogeneous applications consume DiophantineApproximationAndTranscendence §0.6 and the lattice-quotient, Howe–Moore and Mahler targets of §§4.9a–4.9b, which rest on Mathlib quotient measures, Tau Ceti's Minkowski second theorem and reduced bases, and, for general simple Lie groups, RepresentationTheory/LieGroups."

**Claim.** After this change, `lattice_invariant_probability_unique` rests on AnalyticNumberTheoryPartII §5.3k. This is its *Needs:* line at README:6347, the new contract at README:75–77, and the route at README:6340. Layer 4's `### Dependencies` still names only Mathlib quotient measures, so the layer's supplier list is incomplete. The change made this paragraph wrong.

**Witness.** README:6347, "*Needs:* lattice_unimodular; … AnalyticNumberTheoryPartII §5.3k (`exists_unique_quotientMeasure`, …)". AnalyticNumberTheoryPartII is absent from README:6601–6609.

**Repair.** Replace "which rest on Mathlib quotient measures" with "which rest on the quotient measures of AnalyticNumberTheoryPartII §5.3k and Mathlib's fundamental-domain unfolding".

**Tested repair.** Each supplier named in a §§4.9a–4.9b *Needs:* line then appears in the paragraph:
- AnalyticNumberTheoryPartII §5.3k (README:6347).
- Tau Ceti's fundamental domain (6347, 6435) and `ZLattice` results (6456).
- RepresentationTheory/LieGroups (6399).
- Mathlib (throughout).

## R03 (P3) — The first Check of `scalarLpKoopman` holds for the wrong objects too

**Location.** README:6361: "The identity element fixes every class, and π(g⁻¹)π(g) is the identity, including for the zero measure, where the space is zero."

**Claim.** This restates `scalarLpKoopman_one` and `scalarLpKoopman_inv`. It holds equally for the trivial representation π(g)=id, and for the opposite convention π′(g)f=f∘(g•), which is an antirepresentation on a non-abelian group. The new definition therefore has two discriminating Checks (README:6362, 6363), not three.

**Witness.** Take π(g)=id: π(1)=id, and π(g⁻¹)π(g)=id. Take π′ on S₃ acting on {1,2,3}: π′(1)=id, and π′(g⁻¹)π′(g)f = f∘g⁻¹∘g = f. Both pass the Check.

**Repair.** Replace the Check with this one. For S₃ acting on {1,2,3} with counting measure and p=2:
- π((12))δ₁=δ₂, and π((23))π((12))δ₁=δ₃=π((23)(12))δ₁, with ‖δ₁‖₂=1.
- The convention f∘(g•) gives δ₃ for the composite but δ₂ for (23)(12), so it violates the product law.
- The trivial representation leaves δ₁ fixed.

(The `leftRegular` comparison proposed in R01 would also serve as a third discriminating Check.)

**Tested repair.**
- (12)(1)=2. τσ(1)=(23)(2)=3. (τσ)⁻¹(1)=σ⁻¹(τ⁻¹(1))=σ⁻¹(1)=2, so π′(τσ)δ₁=δ₂.
- π′(τ)π′(σ)δ₁: π′(σ)δ₁=δ_{σ⁻¹(1)}=δ₂, then π′(τ)δ₂=δ_{τ⁻¹(2)}=δ₃.
- Hence δ₃≠δ₂.

## Previous findings

- R01 — repaired: README:75–77 contract "Consume `exists_unique_quotientMeasure` …"; README:6327 "Prove lattice_unimodular"; README:6340 "This is the normalized lattice case of the quotient measure of AnalyticNumberTheoryPartII §5.3k." The Weil re-derivation is gone.
- R02 — repaired on this roadmap's side: README:6355 "Scalar Lᵖ pullback representations. Let a group G act on a measurable space Y …" at every p≥1 with strong continuity; README:11 records that GoN §4.2 consumes it. The repair introduced R01 and R03.
- R03 — repaired: README:73 "… the fixed-A restricted squarefree Sathe–Selberg bounds `restricted_sathe_selberg` on the counts `restrictedSquarefreeCount` of §3.41"; §3.32 is cited in prose with no Lean name.
- R04 — repaired: README:672, 697, 723, 753, 782 "prod_one_add, lines 199–200, and sum_pow_mul_eq_add_pow, lines 236–239".
- R05 — repaired: 0 occurrences of `TauCeti.DuffinSchaeffer`; README:3433–3435 "- `dsLimsup`: …", "- `khinchinSet`: …", "- `khinchinLimsup`: …", and the §§3.1, 3.4 targets are written bare.

## Verified sound

**Gate, build, dependencies, elaboration.**
- The push gate rerun with `--build` on this head:
  ```text
  gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
  ```
- Dependency check with `--movable`: `depcheck: 237 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Merge order:

  | Roadmap | Position |
  |---|---|
  | AnalyticNumberTheoryPartI | 49 |
  | AnalyticNumberTheoryPartII | 50 |
  | AdelicAlgebraicGroups | 51 |
  | SieveMethodsAndPrimePatterns | 55 |
  | this roadmap | 60 |
  | GeometryOfNumbersAndQuadraticArithmetic | 148 |
  | ArithmeticDynamics | 336 |

  The new supplier ANT II comes before this roadmap, and GoN now sits after it. ANT II's README and Lean do not cite this roadmap, so there is no cycle.
- `lake env lean` on `Suggested.lean`: exit 0, 66 warnings, all `declaration uses sorry`, one for each of the 66 sorried declarations.
- `Suggested.lean` is byte-identical to 9c6663c.
  - The one-tactic probe of r4 carries forward (no declaration closes).
  - The six signature leads in the worker's elaborated types are the same false positives as in r4. `torusPolynomial` needs no `Fintype d`. `hΓn`, `ha` and `hu` survive as unnamed hypotheses, for example `mahler_relativelyCompact_iff`'s `(∀ g, g ∈ Γn ↔ …) →`.
- The change lists no file outside the folder; the gate agrees (outside-folder=0).

**Headline theorems.** The list is unchanged from r4 and is stated in the unchanged `Suggested.lean`. `lattice_unimodular` and scalarLpKoopman are inputs, not headlines, and are correctly README-only (unbackticked). The Lean statement of `lattice_invariant_probability_unique` (Suggested.lean:589) is general, with no unimodularity binder. The README now supplies unimodularity through lattice_unimodular, so the signature equals the README statement.

**Supplier citations resolved at their heads this round.**

- **AnalyticNumberTheoryPartII at #1167 head 0717d3f.** README:701 §5.3k states:
  - G second countable locally compact Hausdorff, H closed with matching modular characters, right Haar measures.
  - Exactly one right-invariant Radon dġ with the unfolding identity, extended to nonnegative Borel and to integrable f.
  - "Replacing dh by c·dh replaces dġ by c⁻¹dġ".
  - The unimodular countable-discrete inversion Γ\G≅G/Γ carried to Mathlib's right-orbit unfolding.

  `exists_unique_quotientMeasure` is at Suggested.lean:313, under `[LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]`. The contract at README:75–77 matches it clause for clause. One clause at README:6340, "replacing λ by c·λ replaces ν_λ by c·ν_λ", is not §5.3k's dh-law, but it follows from its uniqueness clause in one line: c·ν_λ is right-invariant, Radon, and satisfies the identity for c·λ.
- **AnalyticNumberTheoryPartI at #1126 head 70913eb.**
  - §3.12a at README:2368.
  - §3.32 at README:3100: D(X), strict cutoff, prose only, Check D(14)={1,2,5,10,13}.
  - §3.41 at README:3283.
  - `restrictedSquarefreeCount` at Suggested.lean:886 and `restricted_sathe_selberg` at :891.
  - §1.6 here (README:2296–2319) agrees: ω-values 0,1,1,2,1 at N=14; slice counts r=1: {2,5,13}=3 and r=2: {10}=1, as in ANT I's own Check.
- **GeometryOfNumbersAndQuadraticArithmetic at #851 head 5180edf.**
  - README:219, 259–260, 1299, 1301, 1890 and 1894 consume `howe_moore_of_cartan`, `howe_moore`, `moore_ergodicity` (4.2.1–4.2.2) and `mahler_relativelyCompact_iff` (4.5.8), as the Downstream consumers paragraph (README:7111) says.
  - GoN README:1256–1258 still states scalarLpKoopman as its own construction and declares no Lean name for it.
  - With GoN at 148 and this roadmap at 60, that paragraph has to become a citation in GoN's own pull request, together with the Mathlib/Tau Ceti citations of R01. This is not a defect of this folder.
- **AdelicAlgebraicGroups at #792 head 734ad39.**
  - README:131–135, 1734–1741, 3026 and 3035 assign the normalized lattice uniqueness and the SL₂(ℤ) covolume to this roadmap.
  - AA's own target "every G-invariant Radon measure on H\G is a scalar multiple of dġ" (README:1736) presupposes the modular condition. This roadmap's periodization step in lattice_unimodular runs before unimodularity is known, so it is not a second owner of AA's target.

**Library declarations opened at the pins.**

Mathlib 1b1ccf4b:
- `MeasureTheory.Measure.modularCharacter` (`Group/ModularCharacter.lean`:130). `map_right_mul_eq_modularCharacterFun_smul` (:93–94) gives map (·*g) μ = Δ(g)•μ, the README's normalization, and so λ(Sg)=Δ(g)⁻¹λ(S).
- `RealRMK.integral_rieszMeasure` (RieszMarkovKakutani/Real.lean:341).
- `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_regular` (Haar/Unique.lean:906, regular measures).
- `MeasureTheory.IsFundamentalDomain.measure_eq` (FundamentalDomain.lean:317).
- `QuotientGroup.integral_eq_integral_automorphize` (Haar/Quotient.lean:378).
- `Lp.compMeasurePreservingₗᵢ` (LpSpace/Basic.lean:666; signature `(𝕜) (f) (hf : MeasurePreserving f μ μb) : Lp E p μb →ₗᵢ[𝕜] Lp E p μ`, needs `Fact (1 ≤ p)`), with `coeFn_compMeasurePreserving` :606, `norm_compMeasurePreserving` :611, `compMeasurePreserving_id` :623 and `compMeasurePreserving_comp` :631.
- `Lp.compMeasurePreserving_continuous` (ContinuousCompMeasurePreserving.lean:54; R₁ Borel X, Y, `InnerRegularCompactLTTop` on the source, `IsLocallyFiniteMeasure` on the target, `p ≠ ∞`; "exactly the listed hypotheses" holds).
- `ContinuousMap.curry` (CompactOpen.lean:430, continuous with no local compactness).
- `InnerRegularCompactLTTop` (Regular.lean:336).
- `ContRepresentation` (RepresentationTheory/Continuous/Basic.lean:55): `G →* V →L[R] V`, with no topology on G, so the algebraic part needs none.
- The DomAct declarations of R01.

Tau Ceti 2fd255d9:
- `ContRepresentation.IsUnitary` (Unitary/Basic.lean:49, inner-product preservation; `isUnitary_iff_norm_map` :53).
- `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul` (MeasureTheory/Group/ProperlyDiscontinuous.lean:100).
- `MeasureTheory.Measure.leftRegular` (R01).

**Sources checked at their locators.**

Morris2015:
- Definition 4.1.16 at line 1940, printed p.46.
- Proposition 4.1.18 at line 1944, pp.46–47 (running head "4.1. DEFINITION 47" at 1949).
- Proposition A3.4 at line 17940, p.432.
- Corollary A3.7 at line 17955, p.433. Its part (2), μ(Ah)=Δ(h⁻¹)μ(A) for left Haar μ, is the README's λ(Sg)=Δ(g)⁻¹λ(S).
- The README's own proof of lattice_unimodular is sound: positive left-invariant periodization functional, c>0 from full support, Δ trivial on Γ, the push-forward of μ by Δ̄ invariant under multiplication by t>1, and equal masses on [tⁿ,tⁿ⁺¹). Morris's own proof has the gap recorded below.

KM-2020, for the §3.4 lines this change touched (sampled target):
- Definitions 6.1 (line 877) and 6.2 (897) on printed p.269; 6.4 (935) on p.270; 6.5 (954) and 6.6 (981) on p.271.
- Lemma 6.7 (1039) on p.273; Lemma 11.1 (1776) on p.288.
- Lemma 11.1's ratio formula and Definition 6.5(c)'s hypothesis p∉𝒫 agree with README:3808–3811. The OCR renders ≥ as > in the indicator k=ℓ≥1.

**Sampled targets inside the changed text.**
- §1.6: through the ANT I contract, above.
- §3.4: KM-2020 above.
- §§0.3, 0.4, 0.10, 1.3, 2.5, 3.2, 4.2–4.4, 4.9, 4.10, 5.2 and 5.3: untouched. They were checked in r4. §4.10 cites §4.9a only through `modularQuotient_existsUnique_invariant` and `modular_timeOne_mixing` (README:6505, 6523), whose statements did not change.

**Ownership.** For lattice_unimodular, a grep over main and the 466 indexed open heads for a group with a lattice being unimodular finds only this README. AA has local and adelic unimodularity (README:1385–1392), not this. For scalarLpKoopman, `scalarLpKoopman` and `compMeasurePreservingₗᵢ` occur only here, in GoN, and in Completed/Exchangeability (a single-map isometry, a different object).

**Remarks on untouched text (no change requested).**
- README:3435–3436: the §3.1 API bullets split one sentence ("The definitions admit arbitrary real ψ / measure and monotonicity conclusions …") across two bullets.
- README:53: the "From Mathlib" homogeneous paragraph places the composition isometries in `ContinuousCompMeasurePreserving.lean`; they are in `LpSpace/Basic.lean`.
- The pull-request description's "Depends on" and "Merge order" blocks name only AnalyticNumberTheoryPartI. The README now also consumes AnalyticNumberTheoryPartII §5.3k, which is still open as #1167 (a new roadmap, merge-order 50). The worker should add it there.

**Adversarial table.** Rows marked (r4) are carried forward unchanged from the previous report (PRREVIEW-ProbabilisticAndMetricNumberTheory~4) for statements this change leaves untouched. The other rows are computed this round.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| lattice_unimodular | G=ℝ, Γ=ℤ; G=SO(2), Γ={1} | periodization ∫₀¹Σf(x+n)dx=∫_ℝf, c=1; c=1/λ(G); Δ≡1 both | OK | — |
| lattice_unimodular, Check 1 | affine group, g=(2,0), S=[1,2]×[0,1] | λ(S)=∫₁²a⁻²da=1/2; λ(Sg⁻¹)=∫_{1/2}^1a⁻²da=1=2·λ(S); Δ(g)=2 under map(·*g)λ=Δ(g)λ | Check correct; ⟨x↦2x⟩ discrete, no lattice | — |
| lattice_unimodular, mass argument | t=Δ(h)=2 | push-forward masses of [2ⁿ,2ⁿ⁺¹) all equal: total 0 or ∞, never 1 | contradiction as stated | — |
| lattice_unimodular, Check 2 | ℝ/ℤ vs ℝ/{0} | Haar probability exists vs none; Δ=1 in both | not an equivalence, correct | — |
| `lattice_invariant_probability_unique` route | ℝ/ℤ, F=[0,1) and F′=[1/2,3/2); λ′=3·Leb | μ(image [0,1/2))=1/2 via F and via F′ (λ([1,3/2))=1/2); 3/2 ÷ 3 = 1/2 | formula independent of F and of the scaling of λ | — |
| same, null sets | E=ℚ/ℤ | μ(E)=0, λ(ℚ)=0 | Check correct | — |
| same, degenerate | G=ℝ, Γ={0}; G noncompact, Γ={1} | no invariant probability: vacuous | OK | — |
| same, SL₂ | F⊆Σ⁻¹ pieces | λ(F) ≤ 2π·2/√3 ≈ 7.255, c=1/λ(F) | finite, positive | — |
| §5.3k scaling as used | ℝ/ℤ, λ=2·Leb; counting on ℤ doubled | ν(X)=2=2·1; dġ halves (§5.3k's c⁻¹ law) | dg-law follows from uniqueness | — |
| §5.3k inversion | Γg·h ↦ h⁻¹g⁻¹Γ | right G-invariance on Γ\G becomes left invariance on G/Γ | consistent with README:6340 | — |
| scalarLpKoopman laws | S₃ on {1,2,3}, p=2, δ₁ | π((12))δ₁=δ₂; π((23))δ₂=δ₃=π((23)(12))δ₁; ‖δ₁‖₂=1 | laws hold; opposite convention gives δ₂ | R03 |
| scalarLpKoopman vs pins | DomMulAct mk(g⁻¹); G=ℝ on ℝ | mk((gh)⁻¹)=mk(g⁻¹)mk(h⁻¹); t=1: 1_[0,1]↦1_[1,2]=leftRegular | already Mathlib/Tau Ceti | R01 |
| `scalarLpKoopman_strong` | Lebesgue on ℝ, 1_[0,1]; p=1, p=∞ | ‖1_[t,t+1]−1_[0,1]‖₁=2|t|→0 (|t|≤1); ‖·‖_∞=1 for t≠0 | p≠∞ needed (Check 3 correct) | — |
| scalarLpKoopman, Check 2 | ℤ on circle, α=√2−1, k=1 | eigenvalue e(−0.4142) vs e(0.4142); 2α≈0.828∉ℤ, so they differ | Check correct | — |
| scalarLpKoopman, Check 1 | trivial rep; f∘(g•) | both satisfy π(1)=id, π(g⁻¹)π(g)=id | non-discriminating | R03 |
| §4.9a Koopman paragraph | X=ℝ/ℤ, p=2 | 1↦1, ‖1‖=1, 1∉L²₀; fixed vectors in L²₀: 0 | OK | — |
| Layer 4 Dependencies | *Needs:* at 6347 vs 6607–6609 | ANT II §5.3k cited at 6347, absent at 6607 | incomplete | R02 |
| ANT I contract (README:73) | D(14); counts r=1,2 | {1,2,5,10,13}; 3, 1 | names exist at 70913eb | — |
| Ring/Finset lines | pin 1b1ccf4b | `prod_one_add` 199–200; docstring + `sum_pow_mul_eq_add_pow` 236–239 | correct | — |
| §3.1 backticked names | Suggested.lean | `dsSet` 335, `dsLimsup` 340, `khinchinSet` 344, `khinchinLimsup` 349 | declared | — |
| §3.4 Lemma 11.1 (`GCDGraph.quality_restrictPow`) | k=ℓ=1 vs k=1, ℓ=2 | local factor p^0/(1−1/p)²(1−p^(−31/30))¹⁰ vs p/(1−p^(−31/30))¹⁰ | matches KM p.288 | — |
| (r4) §0.1a IsCompletelyAdditive | Ω at 4; ω at 4; log; v_p at 0 | Ω(4)=2=1+1; ω(4)=1≠2; log 1=0; 0.factorization p=0 | Ω, log, v_p completely additive; ω not | — |
| (r4) §0.1a map_pow | f=Ω, n=2, k=0,3 | f(1)=0; Ω(8)=3 | OK | — |
| (r4) §0.1a factorization formula | n=12, f=Ω; n=1 | 3; 0 | OK | — |
| (r4) §0.1a powOfAdditive | k=1; f=0; k=0 | 1; k^0=1 | OK | — |
| (r4) §0.1a 2^ω multiplicativity | 12=4·3; 4=2·2 | 4=2·2; 2≠4 | multiplicative, not completely | — |
| (r4) §0.1a powOfAdditive_mul for Ω | 4=2·2 | 4=2·2 | completely multiplicative | — |
| (r4) §0.1a isMultiplicative_of_eq_monoidHom at 0 | m=0, n=1 | g(0)=g(0)·1 | OK | — |
| (r4) §0.2 primeDivisibilitySum | ({2,3},p) at 12, 0, 1; ({2},2) at 4 | 5; 0; 0; 2 vs 4 | OK | — |
| (r4) §0.3 divisibility, lcm | N=5,d=2; N=12,(4,6); N=5,(2,3) | 2/5, e=−1/10; 1/12; 0 vs 2/25 | OK | — |
| (r4) §0.4 moments | N=5, P={2,3}; N=6 | mean 7/5, pair −1/15; A=2, V=3, 9/5 | OK | — |
| (r4) §0.5 patterns | ({2,3},5), ({2,3},6), ({2,4},4); S={2},T={3},N=5; S=∅,T={2,3},N=6 | 0; 1/6; 1/4 vs 0; 2/5 (model 1/3); 1/3 | OK | — |
| (r4) §0.5 summed error | N=5, P={2,3} | 1/3 ≤ 9/5 | OK | — |
| (r4) §0.7 residues | N=5,d=3; N=2,d=5; A={1,2}; F=±1 | 1/5,2/5,2/5; 4/15; 6/5; 2/15; 4/15 | OK | — |
| (r4) §0.8 CRT | q=(2,3),N=5; q=(4,9),N=36; N=2 | 0, 1/5; 1/36; 17/9 | OK | — |
| (r4) §0.9 excess | D(72); means N=4,12,16; tails N=12 | 3; 1/4, 5/12, 1/2; 1/3, 1/12, 0 | OK | — |
| (r4) §0.11 Euler bounds | M=4; M=3; p=2,N=2; base 2; M=8 | 9/8; 1; 1/8; 9/4; 19/16; 5/8, 1/8, 5/32 | OK | — |
| (r4) §0.11 local term | p≥2 | 1/(p(2p−3)) ≤ 2/p² ⟺ 6 ≤ 3p | OK | — |
| (r4) §0.12 concentration | atoms 0,1; δ=1/2; Dirac | 1/2; 0 | OK | — |
| (r4) §0.13 rough comparison | N=4, y=2 | sum 1/4, TV 1/8 | OK | — |
| (r4) §1.1 ν_p | p=3, e=3,4; p=2 | 2/27, 2/27 ≤ 2/9; 0; 1/4 | OK | — |
| (r4) §1.1 M₄ | P={2,3} | 203/432 | OK | — |
| (r4) §1.3 even bound | P={2,3} | V=17/36, 3V²=289/432, diff −43/216; Q=145/1296 | OK | — |
| (r4) §1.4 cutoff | n=60,z=3,5; n=8,z=3/2; n=30,z=2 | 2,1; 0; 0,1; 2 log 2 ≤ log 30 | OK | — |
| (r4) `turan_kubilius` N=2 | f(2) | f(2)²/2 vs 30f(2)² | OK | — |
| (r4) §2.1–2.2 Checks | n•(1/2); two-sided | δ₀, δ_{1/2}; halves differ | discriminate | — |
| (r4) `weyl_polynomial` | α₂=1/2 vs √2 | 2•(1/2)=0 | hypothesis needed | — |
| (r4) `polynomial_haar_mixture` | s=0; d empty | S={0}; one point | OK | — |
| (r4) §2.6 subtorus | M=(2); M=(1,1)ᵀ | Haar; 1, 0 | OK | — |
| (r4) §2.7 Erdős–Turán | S–P Thm 1.11.2.1, s=1 | 3/(H+1); 3 | matches Lean | — |
| (r4) `starDiscrepancy` | {0}; {1/2}; ∅ | 1; 1/2; 0 | OK | — |
| (r4) §3.1 sets | ψ=1/2 | [1/2,1]; [1/4,3/4]; 0∈𝒦₂∖𝒜₂ | OK | — |
| (r4) §3.2 KM Lemma 5.3 | q=2,r=3,ψ=3/10 | M=9/10<1; overlap 1/6 | 2M ≥ gcd | — |
| (r4) `hausdorff_duffin_schaeffer` | f(r)=r², k=1 | 0=0 | true | — |
| (r4) `duffin_schaeffer_dimension` | all t<1 divergent; t₀ | min(⊤,1)=1; t₀ | OK | — |
| (r4) §3.9 Cantor | radii 1/16, 1/64, f=√r | 1/4, 1/8 | OK | — |
| (r4) §3.9 Lemma 7 | c=3 | 5 r_A | OK | — |
| (r4) §4.1 truncation | successor L=2; Bool flip | U=2; τ=2,1 | OK | — |
| (r4) `birkhoff_pointwise(_ergodic)` | one point; swap | 2; 1/2 | OK | — |
| (r4) §4.4 Gauss measure | (0,1]; (1/2,1] | 1; log(4/3)/log 2 | OK | — |
| (r4) §4.5 words | v_[1,2](0), v_[2,1](0) | 2/3, 1/3; det² 1 | OK | — |
| (r4) §4.6 mixing | identity; swap | 1/2 vs 1/4; no limit | OK | — |
| (r4) §4.6 density bounds | tail preimage | m(B_n) ≥ log 2·μ(B) | OK | — |
| (r4) §4.7 constants | digit 2; Lévy | log(9/8); 1.1866 vs 0.4812 | OK | — |
| (r4) §4.8 operators | L1(0); Lh; P1; P(id)(0) | π²/6; h; 1; π²/6−1 | OK | — |
| (r4) §4.9 contraction | c₁…c₄, tail, total | 1/2; 5/72; 7/216; 19/800; 1/4; 0.8756<0.9 | OK | — |
| (r4) `density_uniform_error`, `gauss_kuzmin` | n=0; a=1 | −0.4427; 1/2 vs 0.4150 | OK | — |
| (r4) `howe_moore_of_cartan` | G=ℝ, e^{it}; compact G | hypothesis fails; cocompact=⊥ | OK | — |
| (r4) `howe_moore`, `moore_ergodicity` | SU(2); S compact | vacuous; excluded | OK | — |
| (r4) `mahler_relativelyCompact_iff` | n=0,1; a_t | trivial; e^(−t) | OK | — |
| (r4) §4.9b Haar density | d₄ on [0,1]×[1,2] | 1/2; 16, 4 log 2 fail | OK | — |
| (r4) `modular_timeOne_mixing` | a₁; a_t⁻¹n_xa_t | e, e⁻¹; n_{e^(−2t)x} | OK | — |
| (r4) §4.10 conventions | t=log 2, x=1; golden x | [[2,2],[0,1/2]]; 0.618 | OK | — |
| (r4) `shortMean`, MR Check | f=1 | 3/2; difference 0 | OK | — |
| (r4) §5.1 inclusion–exclusion | {2},{3} at 6,2,1 | 1, 0, 0 | OK | — |
| (r4) `logCorrelation` | λ, x=w=2,4 | 1/(2 log 2); −1/12; 13/12 | OK | — |
| (r4) §5.2 twisted Liouville | χ₀ mod 2, x=3 | 7/6 vs 1/2 | OK | — |
| (r4) §5.1a entropy | (1/2,0,1/4,1/4) | 0.4774 + 0.5623 = (3/2) log 2 | OK | — |
| (r4) §5.3 models | R(4), R(6), S(12); N=4 | 0, ξ₂ξ₃, ζ₂²ζ₃; 3, 4 | OK | — |
| (r4) `liouville_two_point_nontrivial` | h=1, X=4 | −2; 1/2<1 | OK | — |

## Not verifiable

- BHV2007 (Appendix B.1, cited for lattice_unimodular and `lattice_invariant_probability_unique`) is waived and cited by its locator only. The same holds for Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a, Rogozin1961b and IK2004 (all carried from r4).
- Folland §2.6, the source behind ANT II §5.3k, is that roadmap's citation and was not opened. The contract here was checked against §5.3k's text.
- Ownership was checked against main and the 466 open heads the roadmap tools index. Nothing unindexed was searched.

## Source issues

- **Gap** in Morris2015 at Proposition 4.1.18, printed pp.46–47: the source says the proof applies Exercise 14, semi-invariance of the fundamental-domain measure built from right Haar measure, to the given finite invariant measure, which corresponds to left Haar measure. It should be: prove that the fundamental domain has finite right Haar mass, or push the invariant measure forward by the modular function. Affects the proof.
- **Misprint** in Morris2015 at Proposition 4.1.18, printed p.46 (line 1946): the source says ν(A/Λ)=ν(A∩F) for Borel A in G. It should be μ(A∩F), for a Haar measure μ and Borel A in H. Affects nothing.
