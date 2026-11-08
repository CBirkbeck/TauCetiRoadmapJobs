# Review of ProbabilisticAndMetricNumberTheory (pull request #1421 at 6fdc62d)

**Verdict:** needs changes

This is a full re-review: 359 lines of the folder changed since e4c4e53. The change does two things. It moves the homogeneous-dynamics inputs and finite-label entropy into this roadmap (new §§4.9a, 4.9b and 5.1a, and 14 new declarations). It also adds a merge of main that moved the library pins. Three findings block. All three come from the first part: the new targets plan objects that earlier roadmaps in the merge order still own.

## Previous findings

- The previous review (r2, at e4c4e53) had no findings, so nothing in it needs repair.
- This head reverts two repairs that r2 had confirmed from r1:
  - r1 R01 ("import the existing finite Shannon entropy API" from GeometryOfNumbersAndQuadraticArithmetic §4.2) is undone. README:15 now reads "Section 5.1a owns finite-label Shannon entropy, conditional entropy, the chain rule, additivity for independent labels and the alphabet bound" (R03 below).
  - r1 R03's route through GeometryOfNumbersAndQuadraticArithmetic §4.2.1 is replaced. README:6354 now says "§4.1 and `modular_timeOne_mixing` give the pointwise and time-one ergodicity inputs", with Howe–Moore planned locally in §4.9a (R01 below). The Sarig2023 Theorem 2.2 locator from that repair is kept.

## R01 (P2) — §§4.9a–4.9b re-plan Howe–Moore, Moore ergodicity and Mahler's criterion, which GeometryOfNumbersAndQuadraticArithmetic owns

**Location.** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:
- line 7 (scope), quoted: "It also owns the homogeneous-dynamics inputs of Layer 4 (… Howe–Moore vanishing of matrix coefficients, Moore ergodicity, … and Mahler's compactness criterion, §§4.9a–4.9b)";
- lines 83–85 (new RepresentationTheory/LieGroups contract);
- lines 6178–6302.

`Suggested.lean` lines 603–659: `howe_moore_of_cartan`, `howe_moore`, `moore_ergodicity`, `mahler_relativelyCompact_iff`.

**Claim.** These are the objects of GeometryOfNumbersAndQuadraticArithmetic (open pull request #851), which is earlier in the merge order and was this roadmap's supplier at e4c4e53. The supplier still owns all of them at its head, under the same names:
- `howe_moore` (§4.2.1) and `moore_ergodicity` (§4.2.2);
- the machinery the new §4.9a route rebuilds step by step: contraction subgroups, commuting weak-operator limits, Cartan reduction, the quotient Koopman representation and `meanZeroL2`;
- `mahler_relativelyCompact_iff` (§4.5.8).

That makes two owners for each object, contrary to "imported by name and section, never planned again". The new Cartan-involution target ("semisimple groups with finite centre", README:6236) also re-plans the finite-centre case that RepresentationTheory/LieGroups Layer 9 already constructs (main, LieGroups README:1199–1238).

**Witness.** GeometryOfNumbersAndQuadraticArithmetic at head 102e668:
- README:1438 `howe_moore`, README:1448 `moore_ergodicity`, README:1370 and 1379 (contraction subgroups; `cartan_coefficient_reduction`), README:2045 `mahler_relativelyCompact_iff`;
- Suggested.lean:245, 253 and 461 declare those three theorems.

**Repair.**
1. Restore the e4c4e53 contract "From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic §§4.2, 4.5": `howe_moore` on the mean-zero quotient L², `moore_ergodicity`, and §4.5 Mahler compactness. GoN's statement uses the Euclidean norm; the max-norm form follows from ‖v‖∞ ≤ ‖v‖₂ ≤ √n‖v‖∞.
2. Restore the e4c4e53 scope sentence at README:11.
3. Delete from the README the targets `howe_moore_of_cartan`, "Koopman representations", "Cartan involutions of semisimple groups with finite centre", `howe_moore`, `moore_ergodicity` and `mahler_relativelyCompact_iff`.
4. Delete the RepresentationTheory (LieGroups) contract (README:83–85), which only §4.9a uses.
5. Delete the matching declarations from `Suggested.lean`, together with the `TauCeti.RepresentationTheory.Continuous.Unitary.Basic` import.
6. Delete the references used only by these targets: Ciobotaru2014, Morris2015, Benoist2019, Mahler1946 and Knapp2002. None of them is in `sources.toml`.
7. Keep `modular_timeOne_mixing` as a local application, since `IsStrongMixing` is owned here. Its *Needs:* line becomes GeometryOfNumbersAndQuadraticArithmetic §4.2.1 `howe_moore` plus §4.6.
8. Revert the *Needs:* lines of `homogeneous_birkhoff` and `bounded_digits_compact_orbit` to the e4c4e53 citations.

**Tested repair.**
- SL₂(ℝ) is connected and noncompact, has simple Lie algebra 𝔰𝔩₂ and centre {±1}, so it meets GoN §4.2.1's hypotheses.
- a₁ⁿ has top-left entry eⁿ (1, 2.718, 7.389 at n = 0, 1, 2), so it leaves every compact set, and Howe–Moore on L²₀ gives time-one mixing.
- With GoN's Mahler criterion at n = 2, the class of a_t has first minimum e^(−t) (0.368 at t = 1, 0.0067 at t = 5). The README Check still holds.
- e4c4e53 passed the gate with tex=0 and depcheck "0 problem(s)".

## R02 (P2) — The modular lattice's invariant probability and finite covolume are AdelicAlgebraicGroups targets

**Location.** README:6188–6196 (`lattice_invariant_probability_unique`), 6200–6204 (`lattice_quotient_ergodic`) and 6268–6282 (Iwasawa coordinates; `modularQuotient_existsUnique_invariant`, citing "Milne2017 Theorem 3.3(a), pp.33–34, for SL₂ over ℚ"). `Suggested.lean` lines 590–601 and 677–679.

**Claim.** AdelicAlgebraicGroups (open pull request #792) is earlier in the merge order and was a supplier at e4c4e53. It owns both objects:
- AA.2.2 *quotient-measure* (`HomogeneousMeasure.exists_unique_quotientMeasure`): every G-invariant Radon measure on a coset space is a multiple of the quotient measure, proved by the same Weil and BHV Appendix B.1 route cited here. A separate target converts left and right conventions.
- AA.3.4 `Reduction.arithmetic_finite_volume_iff`: finite covolume, with the Milne Theorem 3.3(a) locator and the explicit Check "SL₂(ℤ)\SL₂(ℝ) has finite volume".

Planning them again here creates a second owner.

**Witness.** AdelicAlgebraicGroups README at head 2ca91be:
- line 1808, "Invariant measure on a coset space", with *Lean:* `HomogeneousMeasure.exists_unique_quotientMeasure` at line 1823;
- line 3306, *Lean:* `Reduction.arithmetic_finite_volume_iff`;
- line 3311, the SL₂ Check.

**Repair.**
1. Restore the e4c4e53 contract "AdelicAlgebraicGroups AA.2 quotient-Haar integration and AA.3 `Reduction.arithmetic_finite_volume_iff` for SL₂(ℤ)", together with the quotient topology, Borel structure, normalized invariant probability and continuous left action.
2. Delete `lattice_invariant_probability_unique`, `lattice_quotient_ergodic`, the "Topology of the quotient" and "Iwasawa coordinates" paragraphs, and `modularQuotient_existsUnique_invariant` from the README and `Suggested.lean`.
3. Delete the references Milne2017 and BHV2007.
4. In `homogeneous_birkhoff` (README:6352), take μ to be "the normalized G-invariant Haar probability" again.

**Tested repair.**
- The Siegel set {|x| ≤ 1/2, y ≥ √3/2} has mass 2π·(2/√3) ≈ 7.255 in y⁻² dx dy dθ, which is finite, as AA.3.4 asserts for SL₂/ℚ.
- G = ℝ, Γ = {0} has no invariant probability (Haar measure is infinite), which matches the supplier's Check for G_m/ℚ.

## R03 (P2) — §5.1a re-plans the finite-label entropy that GeometryOfNumbersAndQuadraticArithmetic §4.2 owns (reverts r1 R01)

**Location.** README:15 (scope), 6578–6599 (§5.1a), and the uses at 6730–6734, 6749, 6776, 6951 and 6955. `Suggested.lean` lines 713–743: `labelEntropy`, `condLabelEntropy`, `labelEntropy_pair_eq_add`, `labelEntropy_nonneg_le_log_card`, `labelEntropy_pair_of_indepFun`.

**Claim.** GeometryOfNumbersAndQuadraticArithmetic §4.2, "Entropy and Haar measure on leaves", still defines the same objects at its head:
- `finitePartitionEntropy` = −Σ p_i log p_i;
- `conditionalPartitionEntropy` = Σ p_ij log(p_j/p_ij), with zero cells contributing zero;
- the chain rule, addition for independent labels, and the bound 0 ≤ H ≤ log(card).

ArithmeticDynamics already consumes that API. A second owner gives ArithmeticDynamics two entropy APIs to reconcile, and the README's Downstream consumers paragraph (README:6955) now points it at §5.1a. The three `Suggested.lean` theorems are also API lemmas of a definition, not headline theorems.

**Witness.**
- GeometryOfNumbersAndQuadraticArithmetic README:1513 at 102e668: definitions, chain rule, independence, log-card bound.
- ArithmeticDynamics README:296–299 at ae79f44 consumes that `finitePartitionEntropy`.
- The pins have only binary and topological entropy.

**Repair.**
1. Restore the e4c4e53 paragraph "Consume GeometryOfNumbersAndQuadraticArithmetic §4.2 … `finitePartitionEntropy` and the finite-label restriction of `conditionalPartitionEntropy`".
2. Delete §5.1a and the five declarations from `Suggested.lean`.
3. Define finiteMutualInformation through the supplier API, as at e4c4e53, and revert README:15, 6730–6734, 6749, 6776, 6951 and 6955.

**Tested repair.** On the joint law (1/2, 0, 1/4, 1/4) both formulas give the same values: H(X) = log 2 = 0.6931, H(Y) = 0.5623, H(X|Y) = 0.4774 and H(X,Y) = 1.0397 = H(Y) + H(X|Y). Independent fair bits give I = 0, and a bit paired with itself gives I = log 2. The mutual-information Checks are therefore unchanged.

## R04 (P3) — The push gate fails: 20 TeX-syntax hits

**Location.** README lines 6194, 6244, 6280, 6286, 6294, 6296, 6580, 6584 and 6592. Examples: "Σ_{γ∈Γ}F(xγ)", "lieExp(𝔤_{−α})", "∫_{y≥√3/2}y⁻²dy", "n_{(a−1)/c}", "λ_n≤ε^{1−n}", "Σ_{a,b}p_{ab}log(p_b/p_{ab})".

**Claim.** Rule `tex`: no `_{`/`^{` outside code spans. The rerun gate prints `tex=20 … FAIL`, and the gate must pass before the review can accept.

**Witness.** `gate ProbabilisticAndMetricNumberTheory: … tex=20 … FAIL`. The first hit is line 6194, "One route is Weil's argument … Σ_{γ∈Γ}F(xγ)".

**Repair.** Every hit lies in §§4.9a, 4.9b or 5.1a, so the deletions of R01–R03 remove all of them. Any sentence that is kept moves the formula into a code span, for example `Σ_{γ∈Γ} F(xγ)`, or uses Unicode subscripts.

**Tested repair.** At e4c4e53 these sections were absent and the gate reported tex=0.

## R05 (P3) — `modularLattice_discrete` is a pinned Mathlib instance (padding)

**Location.** `Suggested.lean`:673, "theorem modularLattice_discrete : DiscreteTopology Γ := sorry"; README:6262–6266, "Prove `modularLattice_discrete`. Γ is a discrete subgroup of G."

**Claim.** The statement is exactly Mathlib's instance at the pin. The one-tactic probe closes it, and it is the only one of the 70 admissions that closes. `infer_instance` fails only because of the local topology alias; a single `exact` works.

**Witness.** `Matrix.SpecialLinearGroup.discreteSpecialLinearGroupIntRangeSL : DiscreteTopology (SpecialLinearGroup.map (Int.castRingHom ℝ)).range`, in `Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean`:196 at Mathlib 1b1ccf4b.

**Repair.** Delete the theorem from `Suggested.lean` and the README target, and cite the Mathlib instance in "From Mathlib". R02 removes this target too.

**Tested repair.** In a scratch copy, `exact Matrix.SpecialLinearGroup.discreteSpecialLinearGroupIntRangeSL` closes the goal, and every other probe still fails.

## R06 (P3) — The README names superseded library pins

**Location.** README:21, "Use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` as implementation pins". The same hashes recur in the ML-* and TC-* reference URLs, on 15 README lines in all.

**Claim.** The merged `lake-manifest.json` pins Mathlib 1b1ccf4b088b and Tau Ceti 2fd255d99. The pin bump is commit a891cd19 on main. The convention therefore states the wrong library versions.

**Witness.** `lake-manifest.json` at 6fdc62d: TauCeti rev 2fd255d997f4, mathlib rev 1b1ccf4b088b.

**Repair.** Replace both hashes in the Conventions sentence and in the reference URLs with the manifest pins. I checked that every pinned line number the README cites is unchanged at the new pin:
- `Hausdorff.lean`:490 `le_mkMetric` and :541 `le_hausdorffMeasure`;
- `Gaussian/Real.lean`:503 `mgf_id_gaussianReal` and :512 `integrable_exp_mul_gaussianReal`;
- `NegMulLog.lean`:227 `concaveOn_negMulLog`.

Only the hashes change.

**Tested repair.** At 1b1ccf4b each of these five declarations sits at the cited line.

## R07 (P3) — §2.2 Check lists repeat themselves and restate the API

**Location.**
- README:2425–2431. "q = 1, r = 0: TotallyAsympEquidistributed x μ → AsympEquidistributed x μ" and "Total equidistribution implies equidistribution" both restate the API bullet. Line 2429 repeats 2420 and line 2431 repeats 2423.
- README:2466–2471 repeat 2458, 2461 and 2464.

**Claim.** After removing the repeats and restatements, `TotallyAsympEquidistributed` has only two discriminating Checks (the definition needs three). The restatements are also true of any notion that contains the q = 1 case.

**Witness.** Line 2429 ("n (1/2) … not totally") and line 2420 ("n ↦ n • (1/2) … totally equidistributed for no μ") are the same Check.

**Repair.** Delete lines 2425–2431 and 2466–2471. Add one discriminating Check to `TotallyAsympEquidistributed`: n√2 mod 1 is totally equidistributed for circle Haar, while a definition that allowed q = 0 would reject it.

**Tested repair.**
- For q ≥ 1 the progression has step q√2, which is irrational, so Weyl's criterion gives Haar.
- At q = 0 the sequence is constantly r√2, whose law is a Dirac mass, not Haar.
- The two kept Checks still give: along 2n the law is δ₀, along 2n+1 it is δ_{1/2}, and the full average is (δ₀ + δ_{1/2})/2.

## Verified sound

**Gate, build and dependencies.**
- I reran the gate:
  ```text
  gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=20 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  ```
  It agrees with the worker's record: only `tex` fails (R04).
- The dependency check (`--movable`) printed `depcheck: 237 roadmaps, 2424 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- The outside-folder diff against origin/main is empty, and the worktree is clean.
- `lake env lean` on `Suggested.lean` exits 0 with exactly 70 warnings, all `declaration uses 'sorry'`.
- `metadata.toml` contains one key: `topic = "math.NT"`.
- No `set_option`, no sorry'd data, a single `import Mathlib` plus two existing Tau Ceti modules.
- No route-specific shortcut: the sieve and short-interval targets keep the full prime ranges.

**Signatures.**
- A scratch file with `#check @name` for all 102 declarations elaborated once, and its types match `signatures.md`.
- The six flagged binder losses are false positives. `ha`/`hu` and `hΓn` occur as unnamed hypotheses in every elaborated type. `torusPolynomial` sums over degrees and does not need `Fintype d`; the theorems that use it keep it.
- `mahler_relativelyCompact_iff` has no `2 ≤ n` but is still true at n = 0 and 1: the quotient is one point, z ≠ 0 is impossible for n = 0, and the first minimum is 1 for n = 1.

**Padding probe.**
- Every admission was tried with rfl, `infer_instance`, simp, norm_num, decide and trivial, each required to close the goal, plus the one-lemma `exact` of R05. Only `modularLattice_discrete` closed.
- The three entropy lemmas are API lemmas; R03 deletes them.

**Headline theorems.**
- The README's headlines all appear in `Suggested.lean` on native carriers:
  - Hardy–Ramanujan, Erdős–Kac and the ω/Ω transfer;
  - Weyl's polynomial theorem with its criterion, Haar mixtures, Erdős–Turán/Koksma and Borel normality;
  - Duffin–Schaeffer, Catlin, Khinchin, mass transference, Jarník–Besicovitch and the simultaneous version;
  - pointwise Birkhoff, the Gauss exact, mixing and ergodic theorems, digit, word, Khinchin and Lévy laws, and Gauss–Kuzmin with its explicit 9/10 rate;
  - the homogeneous applications;
  - Matomäki–Radziwiłł, logarithmic Elliott and Chowla, and the nontrivial two-point bounds.
- The docstring names the one statement that cannot be stated (weighted GCD-graph compression: no native carrier), with no stand-in.

**Source sample (all 15 targets).** Statements, hypotheses and locators were checked against the cached texts.

| Target | Source lines checked | Result |
|---|---|---|
| §0.1 | ElsholtzTao2011 line 2179 (additive, p.37); lines 2183 and 2211 (Lemmas A.2, A.3, p.38) | Agrees. |
| §0.13 | Kubilius2021 lines 46–51, (1.1) p.2; line 107, (1.6) p.3 | Agrees; the summed form equals 2·d_TV at y = N^(1/β). |
| §1.3 | GS-SIEVING lines 131–156 (Prop. 2, p.3); lines 217–334 (proof, pp.4–6) | Agrees. G(q^α) ≤ v_q justifies V^s in R_k. |
| §2.2 | TAO-HOFA-1.1 lines 244–254 (printed p.4) | Agrees. |
| §3.2 | KM-2020 lines 42–47 (p.252); 90–122 ((1.5), Theorems 1–2, p.253); 290–311 (Case 2 and (2.2), p.257); 598–830 (§5, pp.264–268) | Agrees. The source's ψ > 0 widens to ψ ≥ 0 by Borel–Cantelli on the zero set. |
| §3.6 | KM-2020 Props 8.1–8.3 lines 1385–1404 (p.279); Lemma 8.4 line 1421 (p.280); §9 line 1620 (p.285); Lemma 12.1 line 1968 (p.291); Lemma 12.2 line 2059 (p.293); Lemma 13.1 line 2183 (p.296); Lemma 13.2 line 2227 (p.297); Lemma 14.1 line 2379 (p.300); proof of Prop 8.2 line 2599 (p.304) | All on the cited pages. |
| §3.8 | BeresnevichVelani lines 131–139 (§2.1, p.974); 252–271 (Theorem 2, Remark 3, p.977); 297–310 (Lemma 5, p.978) | Agrees. |
| §4.1 | Sarig2023 line 1841 (Thm 2.2, physical p.45); line 2111 (Thm 2.3, p.48); proof p.49 | Inv(T) is the strict σ-algebra `MeasurableSpace.invariants`. |
| §4.6 | SarigTransfer lines 1137–1196 (A.2, physical pp.32–33); lines 399–405 (Ex. 2.5, pp.12–13) | Agrees. |
| §4.8 | Sun2017 line 116 (Theorem 2, p.3) | G₁ = L and h_k at p = 1. |
| §4.9 | Sun2017 pp.3–6; SarigTransfer lines 325–329 (§2.3, p.11), line 92 (Prop. 1.1, p.6) | Agrees. |
| §4.10 | Smyth2020 line 2537 (Exercise 2.20, printed Lesson 10 p.52); Gorodnik2010 OCR, pp.3–8 | Agrees. |
| §5.1 | MatomakiRadziwill line 32 (Thm 1, p.1); 238 (Thm 3, p.7); 590 (Lemma 4, p.13); 638 (Lemma 5, p.15); 1059 (Lemma 14, p.21); 1215 (Prop. 1, p.23) | Agrees. |
| §5.2 | TaoLogChowla line 270 (p.6); MatomakiRadziwill line 520 (p.12) and line 109 (Cor. 2, p.3) | Agrees. |
| §5.3 | Harper lines 41–58 (p.2277), 60–76 (p.2278) | Agrees. |

**Cross-roadmap citations resolved.**
- AnalyticNumberTheoryPartI at ead4cdb: §§0.18, 0.19 (x ≥ 286, |E| < 1/(2 log² x)), 0.21, 1.5, 3.12a (README:2220), 3.18, 3.32, 3.33, 3.37 and 3.41, with `dirichlet_polynomial_mean_square`, `pretentiousDist`, `halasz_mean` and `restricted_squarefree_landau_count`.
- RepresentationTheory/LieGroups on main: Layers 7 and 9, `CartanInvolution` (LieGroups Suggested:483), `IwasawaData` (:508) and `kakDecomposition` (:604).
- ProbabilisticAndMetricNumberTheoryPartII (#1838) cites only §§4.4, 4.8 and 4.9, which are unchanged.
- The seven plan gaps: ANT1 and SieveMethodsAndPrimePatterns do not plan these statements. The README owns them locally (§§0.13, 3.7, 5.1–5.2), as settled in earlier rounds. This is a plan/README record mismatch, not a finding under the gap rules.
- §4.1 pointwise Birkhoff and §4.6 `IsStrongMixing` have no other owner: searches of main, the open heads and the pins found none. GeometryOfNumbersAndQuadraticArithmetic owns only Poisson samples, and FactorRigidity's mixing is operator-algebraic.

**Pinned declarations opened** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):
- `ArithmeticSubgroups.lean`:192 and 196;
- `NegMulLog.lean`:174, 177 and 227;
- `Haar/Quotient.lean`:114–118 (uniqueness only for normal Γ), 157 and 188;
- `Dynamics/Ergodic/Action/Basic.lean`:43 (`ErgodicSMul`);
- `Topology/Algebra/Group/Quotient.lean`:50 and 66;
- `Factorization/Basic.lean`:488 and 499;
- `WellApproximable.lean`:33;
- Tau Ceti `Unitary/Basic.lean`:49, `MeanErgodic.lean`:91, and `CondExpProjection.lean`:139 and 169 (L² and L¹ mean forms under an L² hypothesis only; no pointwise theorem);
- all 22 Mathlib and Tau Ceti names cited in §§4.9a–4.9b resolve.

**Adversarial table** (values computed on each side):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 IsAdditive (ω, Ω) | n=12=4·3 | ω: 2=1+1; Ω: 3=2+1 | Additive | — |
| §0.1 convolution unit | n=1 | ε(1)=1≠0 | Not additive, as the Check says | — |
| §0.1 strong additivity | Ω at 4 | Ω(4)=2, Ω(2)=1 | Ω excluded | — |
| §0.1 prime-power form | f=Ω, n=12; n=1 | f(4)+f(3)=3=Ω(12); empty sum 0=f(1) | OK | — |
| §0.1 distinct-prime form | f=ω vs Ω at 12 | ω: 1+1=2 ✓; Ω would give 2≠3 | Strong additivity needed | — |
| §0.13 summed rough comparison | N=4, y=2 | atom errors 0, 0, 1/8, tail 1/8 → 1/4 | OK | — |
| §0.13 `kubilius_small_prime_model` | N=4, β=2, p=2 | arithmetic 1/2, 1/4, 1/4 vs geometric 1/2, 1/4, 1/8 + tail; TV=1/8 | OK | — |
| §1.3 even-moment bound | P={2,3}, r=2 | V=17/36; model 4th moment 203/432; Gaussian 3V²=289/432; difference −43/216; collision term 145/432=0.336; R₄=17/3 | 0.199 ≤ bound | — |
| §1.3 odd-moment bound | P={3}, k=3, N=3 and 1 | 2/27=ν₃(3); −1/27; bound 3.375+2/3 | OK | — |
| §2.2 TotallyAsympEquidistributed | n·(1/2) | along 2n: δ₀; along 2n+1: δ_{1/2}; average (δ₀+δ_{1/2})/2 | Totally equidistributed for no μ | Checks deduplicated (R07) |
| §2.2 AsympEquidistributedInt | 0 for n≥0, n√2 for n<0 | positive half δ₀ ≠ Haar | Fails, as intended | — |
| §3.2 `volume_dsLimsup_eq_one` | ψ=1/q | Σ_{q≤10} φ/q² = 2.112; Σ_{q≤1000} = 4.897 (diverges) | Measure 1 | — |
| §3.2 totient comparison | x=100 | Φ(100)=60.83 ≥ (2−ζ(2))·100−1−log 100 = 29.90 ≥ 25 | OK | — |
| §3.2 `catlin` case 1 | q_{i+1} ≥ 2q_i² | (1/(2q_i))(q_i − q_i/2) = 1/4 | OK | — |
| §3.2 `khinchin` | 1/(q log q); 1/(q log² q) | qψ = 1/log q decreasing; the first series diverges, the second converges | 1 and 0 | — |
| §3.6 Lemma 12.1 | Σ_{j≠0} 2^(−\|j\|/20); x=1/2 | 56.71 ≤ 100; 0.758+0.2 = 0.958 ≤ 1 | OK | — |
| §3.6 Lemma 13.2 | p=2, r=6644; 15000¹⁰·2¹⁰ | 2^6644 = 10^2000.04; ≈5.9·10⁴⁴ ≤ 10⁵⁰ | OK | — |
| §3.6 Lemma 8.4 | t=300 | log 50 + 1/log² 300 = 3.943 ≤ 4; 0.99¹⁰ = 0.904 ≥ 1/2 | OK | — |
| §3.8 IsDimensionGauge | √r; 1; 0 | √0=0, √(1/16)=1/4; constant gives f(0)=1≠0; zero gives f(1)=0 | Checks discriminate | — |
| §3.8 radius vs diameter | f=√r, k=1 | f(r)/r → ∞; f(2r) = √2·f(r) ≤ 2f(r) | OK | — |
| §4.1 upperOrbitTruncation | successor, f(k)=k; c=3, L=2 | A_{n+1}(0) = n/2 → ∞ so U=L; min(3,2) = 2 | OK | — |
| §4.1 firstOrbitHit | Bool flip, f=(0,4), c=1 | τ(false): A₁=0, A₂=2 → 2; τ(true)=1 | OK | — |
| §4.1 `birkhoff_pointwise(_ergodic)` | one point, f=2; two-point swap, f=1_{0} | A₀=0, A_N=2=E[f\|I]; averages 1, 1/2, 2/3, 1/2, … → 1/2 = ∫f | OK | — |
| §4.6 IsStrongMixing | identity / swap on two atoms | identity: 1/2 vs 1/4; swap: 1/2, 0, 1/2, … no limit; swap is ergodic | Not mixing; Checks correct | — |
| §4.6 IsExact | swap | tail = full σ-algebra, μ{0} = 1/2 | Not exact | — |
| §4.6 cylinders | C_[1], C_[1,1] | (1/2,1) mass 1/2; (1/2,2/3) mass 1/6; 1/√2 has digit 1, √2−1 has digit 2 | OK | — |
| §4.6 constant-4 distortion | w=(1), B=[0,1/2) | J ∈ [1/4,1] (ratio 4 attained); m(C∩T⁻¹B)=1/3 vs m(C)m(B)=1/4, ratio 4/3 | Within [1/4,4] | — |
| §4.6 tail lower bound | density ∈ [1/(2 ln 2), 1/ln 2] | m(B_n) ≥ ln 2·μ(B) ≥ m(B)/2 → m(B)/8 | OK; avoids the source error | — |
| §4.8 L, P | L1(0); Lh; P1; Pid(0) | π²/6 = 1.645; Lh = h (telescoping); P1 = 1; π²/6 − 1 = 0.645 | OK | — |
| §4.9 contraction | c₁…c₄ on a 2001-point grid; tail | max 1/2, 0.0556, 7/216 (attained), 19/800 (attained); a²c_a ≤ 0.99 for a ≥ 5; total 18913/21600 = 0.8756; h₂′(1) = −1/72 | OK; both polynomial identities verified | — |
| §4.9 `density_uniform_error` | n=0, x=0, 1 | 0.4427, 0.2787 ≤ 1 | OK | — |
| §4.9 `gauss_kuzmin` | n=0, a=1, 2 | 1/2 vs 0.4150; 1/6 vs 0.1699 (difference 0.00326) | ≤ 1 | — |
| §4.10 short-vector bounds | golden x; δ=1/2 | inf q‖qx‖ = 0.382 (q=1) → min(1,√c) = 0.618; c = δ²/2 = 1/8 | OK | — |
| §4.10 column convention | t=log 2, x=1 | a_t u_x = [[2,2],[0,1/2]]; (−1,1) ↦ (0,1/2) | OK | — |
| §5.1 shortMean | f=1, h=2; h=0 | 3/2 = (h+1)/h; 0 | OK | — |
| §5.1 MR Lemma 4 Check | f=1, x=y=X | both means (X+1)/X | difference 0 | — |
| §5.1 inclusion–exclusion | intervals {2},{3}; n=6, 2, 1 | 1, 0, 0 | OK | — |
| §5.2 logCorrelation | λ, (n,n+1), x=w=2 and 4; same forms | 1/(2 log 2) = 0.7213; −1/12 → −0.0601; 13/12 | OK | — |
| §5.2 twisted Liouville | χ₀ mod 2, x=3 | 1/2 + 2/3 = 7/6 vs λ→1 gives 1/2 | OK | — |
| §5.2 conjugated coefficient | f(2)=i, g=1 | c₂ = −i; c₂f(2)g(4) = 1 = f(1)g(2) | OK | — |
| §5.3 random models | R(4), R(6), S(12); N=4 | 0, ξ₂ξ₃, ζ₂²ζ₃; second moments 3 (squarefree ≤ 4) and 4 | OK | — |
| `hardy_ramanujan`, `erdos_kac` | N=4, x=0 | log log 4 = 0.3266; ω=(0,1,1,1); F_N(0) = 1/4 vs Φ(0) = 1/2 | Finite law ≠ limit; statement is a limit | — |
| `weyl_polynomial` | α₂=1/2 vs √2 | 2·(1/2) = 0 so not irrational; n²/2 takes only 0, 1/2 | Hypothesis needed | — |
| `borel_normal` | x=1/3, b=3 | digit-0 frequency 1 ≠ 1/3 | Exceptional, null | — |
| `jarnik_besicovitch` | v=3 | dimension 2/3, critical measure ∞ | OK | — |
| `gauss_digit_frequency`, `levy_denominator` | a=1; golden ratio | 0.4150; π²/(12 log 2) = 1.1866 vs log φ = 0.4812 | Golden ratio exceptional | — |
| `matomaki_radziwill` | f=1, h=X | difference 0 for every x | Empty exceptional set | — |
| `logarithmic_elliott` | f=g=1, χ₀ mod 1, t=0 | distance sum 0 < A | Hypothesis fails, as it must | — |
| `liouville_two_point_nontrivial` | h=1, X=4 | −1+1−1−1 = −2; \|−2\|/4 = 1/2 | Below 1 | — |
| `howe_moore_of_cartan` | G=ℝ, K=0, A⁺=ℝ, e^{it} | contraction groups trivial, closure {0} not dense; \|coefficient\| = 1 | Hypothesis fails, as it should | Delete (R01) |
| `howe_moore` | L = SU(2) (compact, centre ±1) | cocompact = ⊥ | Vacuously true | Delete (R01) |
| `moore_ergodicity` | S = SO(2); S = {a_t} | compact (excluded); closed noncompact | OK | Delete (R01) |
| `mahler_relativelyCompact_iff` | n=2, a_t; n=0, 1 | first minimum e^(−t) = 0.368, 0.0067; n=0, 1 both sides true | OK | Delete (R01) |
| `modular_timeOne_mixing` | a_t⁻¹ n_x a_t; generation | n_{e^(−2t)x}, e^(−2) = 0.135; n_p[[1,0],[c,1]]n_q has entries a, b=(ad−1)/c, d | OK | Keep; cite GoN §4.2.1 |
| `lattice_invariant_probability_unique` | ℝ/ℤ; ℝ/{0} | unique Haar on the circle; no invariant probability | OK | Delete (R02) |
| `modularQuotient_existsUnique_invariant` | Siegel set | 2π·(2/√3) = 7.255 < ∞; fd area π/3 | OK | Delete (R02) |
| `modularLattice_discrete` | Mathlib instance | closes by `exact` | Padding | Delete (R05) |
| `labelEntropy` chain rule | (1/2, 0, 1/4, 1/4) | 1.0397 = 0.5623 + 0.4774 | OK | Use GoN API (R03) |
| `labelEntropy_nonneg_le_log_card` | (1/2, 1/2, 0) | log 2 ≤ log 3 | OK | Use GoN API (R03) |
| Conventions pins | README:21 vs manifest | 6b7abb3c / a91d3aaf vs 1b1ccf4b / 2fd255d9 | Stale | R06 |

## Not verifiable

- Seven sources are waived and cited by locator only: Koukoulopoulos2019, Kubilius1964, RS1962, Falconer1990, PollingtonVaughan1990, Rogozin1961a and Rogozin1961b. ANT1 §0.19 independently states the RS1962 bound used in §3.6.
- Gorodnik2010 is a scan of handwritten notes whose OCR is mostly garbled. Only its coverage of pp.3–8 (bounded semiorbits, badly approximable numbers, Mahler compactness on p.5) could be confirmed, not exact wording.
- The seven references added at this head (Ciobotaru2014, Morris2015, Benoist2019, Mahler1946, Milne2017, BHV2007, Knapp2002) are not in `sources.toml` and were not fetched. R01 and R02 delete the targets that cite them, and the owning roadmaps cite the same works for the same statements.
- Ownership was checked against the open heads indexed by the roadmap tools and the board packages, not against unindexed work.

## Source issues

- **Misprint** in GS-SIEVING at proof of Proposition 2, printed p.5 (lines 319–322): the source says that writing k as s parts each at least two can be done in binom(k−s, s) ways; it should be binom(k−s−1, s−1), compositions of k−s into s positive parts; affects nothing.
- **Error** in SarigTransfer at Appendix A.2, proof of Rényi's theorem, printed p.31 (lines 1189–1190): the source derives m(B_n) ≥ μ(B_n)/(2 ln 2) from its density bounds; it should be m(B_n) ≥ (ln 2)μ(B_n), since the density 1/ln 2 at 0 makes the ratio tend to ln 2; affects the proof.
