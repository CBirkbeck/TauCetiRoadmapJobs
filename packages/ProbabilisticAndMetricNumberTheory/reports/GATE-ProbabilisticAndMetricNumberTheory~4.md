## H01 (CBirkbeck) — disputed

At its current head 6143cad, GeometryOfNumbersAndQuadraticArithmetic no longer owns Howe–Moore, Moore ergodicity or Mahler's criterion: it consumes them from this roadmap's §§4.9a–4.9b (`TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:217`, 249–250, 1287 "4.2.1. `howe_moore` is ProbabilisticAndMetricNumberTheory §4.9a `howe_moore`", 1289, 1294, 1878, 1882; `Suggested.lean:31`, 173–175, 374–375), and it declares none of `howe_moore`, `moore_ergodicity`, `mahler_relativelyCompact_iff`, `cartan_coefficient_reduction` or `meanZeroL2`. The review read the older head 102e668. With GoN as a consumer, the requested repair (restore a GoN supplier contract) would close a cycle; GoN's dependency check at 6143cad moves it from #52 to #61, right after this roadmap, with 0 problems.

## H02 (CBirkbeck) — applied

The §4.9a paragraph "Cartan involutions of semisimple groups with finite centre" (README:6380–6384 at 4cea849) is deleted, because RepresentationTheory/LieGroups Layer 9 on main builds that datum from the adjoint image for connected semisimple groups with finite centre (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1199`, 1209–1217; `CartanInvolution` at `Suggested.lean:484`). The `howe_moore` route and *Needs:* line (README:6367–6371), the LieGroups contract (README:85, "Layer 7 for compact real forms" dropped) and the scope (README:11) now cite Layer 9 for the Cartan datum, `IwasawaData` and `kakDecomposition`.

## H03 (CBirkbeck) — disputed

At its current head d2e6304, AdelicAlgebraicGroups keeps only the general statements and assigns these special cases to this roadmap: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:130` ("the lattice targets of ProbabilisticAndMetricNumberTheory §§4.9a–4.9b are special cases of statements here"), 1725 (the normalized form of the coset-space uniqueness "is ProbabilisticAndMetricNumberTheory §4.9a (`lattice_invariant_probability_unique`)"), 3015 and 3024 (the SL₂(ℤ) covolume "is ProbabilisticAndMetricNumberTheory §4.9b (`modularQuotient_existsUnique_invariant`)"). AA declares neither theorem, and its dependency check at d2e6304 shows 0 problems and no edge to this roadmap; each statement therefore has one owner, and deleting them would break AA's citations.

## H04 (CBirkbeck) — disputed

GeometryOfNumbersAndQuadraticArithmetic at 6143cad no longer has `finitePartitionEntropy` anywhere in its README or `Suggested.lean`. It defines the countable-label `countablePartitionEntropy` and `conditionalPartitionEntropy` and states that on finite labels "these are ProbabilisticAndMetricNumberTheory §5.1a … used without restatement" (`TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1346`, also 217 and 251), so §5.1a is the single owner. ArithmeticDynamics at ae79f44 (`README.md:296–300`) still cites GoN's dropped `finitePartitionEntropy`; that citation is ArithmeticDynamics' to update, and this roadmap's Downstream consumers paragraph (README:7081) already points it to §5.1a.

## H05 (CBirkbeck) — applied

`labelEntropy`, `condLabelEntropy`, `labelEntropy_pair_eq_add`, `labelEntropy_nonneg_le_log_card` and `labelEntropy_pair_of_indepFun` are deleted from `Suggested.lean` (lines 755–785 at 4cea849): no headline theorem mentions the two definitions, and the three theorems are textbook API. All five stay as named prose targets in §5.1a and §5.2 (README:6703–6725, 6856–6860), so GoN's citations by name still resolve to targets. The same defect was repaired in §0.1a, added after the reviewed head: `IsCompletelyAdditive`, `powOfAdditive` and six API lemmas are removed from the Lean file and kept as README targets (README:195–338). One of the six, `IsCompletelyAdditive.isAdditive`, closes by the term `⟨hf.1, fun m n hm hn _ => hf.2 m n hm hn⟩`.

## H06 (CBirkbeck) — applied differently

§§4.9a, 4.9b and 5.1a stay (H01, H03, H04), so their formulas move into code spans instead of being deleted. Examples are `F ↦ ∫_X Σ_{γ∈Γ} F(xγ) dν(xΓ)`, `∫_{y≥√3/2} y⁻² dy = 2/√3`, `n_{(a−1)/c} · [[1,0],[c,1]] · n_{(d−1)/c}`, `λ_n ≤ ε^(1−n)` and `Σ_{a,b} p_ab · log(p_b / p_ab)`. The 22 further hits that 4cea849 added in §0.1a (`2^{ω(12)}`, `k^{f(n)}`, …) are repaired the same way, so the count of `_{`/`^{` outside code spans goes from 20 at 6fdc62d and 42 at 4cea849 to 0, and the gate reports `tex=0`.

## H07 (CBirkbeck) — applied

`modularLattice_discrete` is deleted from `Suggested.lean` (old line 715) and from §4.9b. The README now cites Mathlib's instance `Matrix.SpecialLinearGroup.discreteSpecialLinearGroupIntRangeSL` (`Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:196`, every n) in the "From Mathlib" contract (README:53), in §4.9b (README:6387) and in the *Needs:* lines of `modularQuotient_existsUnique_invariant` and `mahler_relativelyCompact_iff`. The local `homogeneousGroupTopology` alias, which made `infer_instance` fail, has the same body as Mathlib's `TopologicalSpace (SpecialLinearGroup n R)` instance (`Mathlib/Topology/Algebra/Group/Matrix.lean:84`, the determinant-one subtype topology), so it is deleted too; with it gone, `inferInstance` proves the discreteness.

## H08 (CBirkbeck) — applied

At README:21 and in the reference URLs (15 lines), Mathlib `6b7abb3c…` → `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `a91d3aaf…` → `2fd255d997f47c0b5d834ee416c7015d55444ce5`, matching `lake-manifest.json`; no old hash remains. All 12 linked files exist at the new pins, and the cited lines are unchanged: `Hausdorff.lean`:490 `le_mkMetric` and :541 `le_hausdorffMeasure`, `Gaussian/Real.lean`:503 `mgf_id_gaussianReal` and :512 `integrable_exp_mul_gaussianReal`, and `NegMulLog.lean`:227 `concaveOn_negMulLog`.

## H09 (CBirkbeck) — applied

`TotallyAsympEquidistributed`: the four repeated or restating Checks (reviewed lines 2425–2431) are deleted, and README:2569 adds the requested discriminating Check: n ↦ n•√2 is totally equidistributed for circle Haar (step q√2 is irrational for q ≥ 1), while a definition admitting q = 0 would reject it (constant r√2, a Dirac law). `AsympEquidistributedInt`: the three repeats (reviewed lines 2466–2471) are replaced by README:2602, the sequence 0 on n ≥ 0 and 1/2 on n < 0, whose symmetric-window averages tend to `(δ₀ + δ_{1/2})/2` while its halves tend to δ₀ and δ_{1/2}; this rules out a symmetric-window definition.

## Further repairs in the kept sections

- `howe_moore_of_cartan` locator (README:6349): "Ciobotaru2014 Theorems 1.1 and 3.2" → "Theorem 1.2, p.2, proved as Theorem 3.2, p.9". Theorem 1.1 (Ciobotaru2014 line 54) is the application to simple groups; the K₁A⁺K₂ criterion is Theorem 1.2 (line 67), which is Theorem 3.2 (line 359). The source asks the contraction groups to generate G; the README's dense generation is covered by its step 3, and the locator now says so.
- `mahler_relativelyCompact_iff` locator (README:6419): "Mahler1946 §7, Theorem 8, printed p.159" → "§3, Definitions 1–2 and Theorem 2, printed pp.155–156" (Mahler1946 lines 176–196). §7 (line 299) proves the existence of critical lattices and uses Theorem 2.
- Iwasawa coordinates on SL₂(ℝ) (README:6389): the locator "Knapp2002 Chapter VIII, §3", a work absent from the source manifest, → Morris2015 Theorem 7.1.1, p.154 (line 6675), Exercise 7.1#5, p.156 (line 6770, G = NAK), Example 7.2.3, p.157 (line 6824) and Exercise 7.2#12, pp.159–160 (line 6910). Morris2015 is cached and in the manifest, and the Knapp2002 reference entry is deleted. A Check now pins the density y⁻² (README:6395, values in the table below).
- `condLabelEntropy` (README:6723): a Check pins the argument order and sign on an asymmetric joint law.

## Validation

Commit `9c6663c4` — `ProbabilisticAndMetricNumberTheory: review repairs (cite LieGroups Cartan datum, drop Lean API lemmas, Mathlib duplicates, fix TeX, pins, locators, Checks)`. Only `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` and `Suggested.lean` changed. Nothing was pushed.

`lake build TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.Suggested` exited 0 with 66 `declaration uses 'sorry'` warnings and no errors. Its only other warning is the toolchain's notice that the file imports Mathlib without the `module` keyword; that notice was already present at 4cea849. The final line:

```text
Build completed successfully (18246 jobs).
```

Gate on the committed head (exit 0):

```text
gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`--movable`) of this README printed no UPWARD, CYCLE or moved line:

```text
depcheck: 236 roadmaps, 2420 edges, 0 problem(s)
```

The citation resolver, run on the edited README against main (eb5fa41) and the open heads, finds no unresolved cross-roadmap citation and no unresolved Lean name. The three leads in the brief's list (`IsAdditive.isMultiplicative_of_eq_monoidHom`, `IsAdditive.isMultiplicative_powOfAdditive`, `IsCompletelyAdditive.powOfAdditive_mul`) were this roadmap's own Lean declarations at 4cea849. They are now unbackticked README targets (H05).

## Signature check

One scratch file elaborated `#check @name` once for all 96 declarations of the new `Suggested.lean`, with the file's `open` lines, and each type was compared with `signatures.md` (110 declarations at 4cea849).
- 90 types are identical.
- `kolmogorov_rogozin`, `howe_moore_of_cartan`, `howe_moore` and `moore_ergodicity` differ only in pretty-printing under the scoped notations opened in the check file: `«ω»` quoting, `⟪·,·⟫_ℂ` for `inner ℂ`, and `∞` for `↑⊤`.
- `bounded_digits_compact_orbit` and `typical_unbounded_semiorbit` change from `closure[QuotientGroup.instTopologicalSpace …]` to `closure`. Both instances are the determinant-one subtype topology (H07), so the statements are unchanged.
- 14 declarations are removed: the 12 of H05, `modularLattice_discrete` (H07), and `IsCompletelyAdditive.isAdditive`, which is counted among the six §0.1a lemmas of H05.
- The six binder-loss leads of `signatures.md` are false positives:
  - `hΓn` occurs in `mahler_relativelyCompact_iff`;
  - `ha` occurs in `modular_timeOne_mixing`, `homogeneous_birkhoff` and both semiorbit theorems, and `hu` in the semiorbit theorems;
  - `torusPolynomial` sums `n^j • α j` over degrees and needs no `Fintype d`, while `polynomial_haar_mixture`, which uses it, keeps `[Fintype d]`.

## Ownership, merge order and consequences for other roadmaps

- On the pull request at 6fdc62d, the owner asked that the analytic-number-theory cluster depend only on Mathlib, main and itself. This roadmap therefore owns §§4.9a–4.9b and §5.1a:
  - GeometryOfNumbersAndQuadraticArithmetic (6143cad) and AdelicAlgebraicGroups (d2e6304) cite these sections and declare none of their names;
  - this roadmap cites neither of them;
  - GoN's own dependency check moves it to #61, which is a move for GoN's submission, not a defect here.
- RepresentationTheory/LieGroups Layer 9 (main) owns the Cartan datum (H02).
- GoN `README.md:217` says that the names it cites "are in the namespace TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.MetricNumberTheory". That no longer holds for the five entropy names of H05. They remain §5.1a targets under the same names, and GoN should cite them as README targets.
- ArithmeticDynamics (ae79f44) cites GoN's dropped `finitePartitionEntropy` (H04).
- No other roadmap, on main or at an open head, cites `modularLattice_discrete`, `homogeneousGroupTopology`, Knapp2002, the deleted Cartan paragraph or any §0.1a name. No id this roadmap cites is dropped by an open pull request, and no cited id exists only in an open revision.
- Ownership against open pull requests was checked by searching all open roadmap heads for the objects and names involved. GoN, AA and ArithmeticDynamics were read at their heads; none of them has a checkout among the brief's sibling paths.

## Sources

- Opened at the cited places in the cached texts:
  - Ciobotaru2014 lines 54, 67, 359 and 405;
  - Mahler1946 lines 176–196 and 299;
  - Benoist2019 line 171 (Fact 1.5, physical p.7);
  - Milne2017 line 1483 (Theorem 3.3(a), pp.33–34);
  - Morris2015 lines 6675, 6770, 6824, 6860 and 6910–6939.
- Morris2015 page numbers are printed pages, which are physical pages minus 16 (line 6717 is physical page 171, printed 155).
- Only Exercise 7.2#12 is cited for the Haar measure. For upper unipotent N, a⁻¹n_x a = n_{x·a₂/a₁}, so the modulus defined there is a₁/a₂, whereas Exercise 13's displayed product appears to give the reciprocal. In the order NAK, Exercise 12 gives density y⁻¹ against dx (dy/y) dθ, which is the README's y⁻² dx dy dθ.
- The manifest entries should record the new locators: Morris2015 "Theorem 7.1.1, p.154; Exercise 7.1#5, p.156; Example 7.2.3, p.157; Exercise 7.2#12, pp.159–160", and Ciobotaru2014 "Theorem 1.2, p.2". This job may not edit `sources.toml`.
- BHV2007 and IK2004 are waived and cited by their locators. Knapp2002 is no longer cited.
- No text is missing, so no `needs-references.toml` was written.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `TotallyAsympEquidistributed`, new Check | n•√2 with q = 1, 2, 3; q = 0, r = 1 | steps 1.41421, 2.82843, 4.24264 (irrational) → Haar; q = 0: constant 0.41421 → Dirac | separates q ≥ 1 from q ≥ 0 | Check added |
| `TotallyAsympEquidistributed`, kept Check | n•(1/2) | along 2n: 0 (δ₀); along 2n+1: 1/2 (δ_{1/2}); full average (δ₀+δ_{1/2})/2 | equidistributed but not totally | kept |
| `AsympEquidistributedInt`, new Check | 0 on n ≥ 0, 1/2 on n < 0 | window −N..N: N=1 → 2/3, 1/3; N=10 → 0.524, 0.476; limit 1/2, 1/2; halves δ₀ vs δ_{1/2} | rejected here, accepted by a window definition | Check added |
| `howe_moore` via LieGroups Layer 9 | SL₂(ℝ); universal cover of SL₂(ℝ); SU(2) | SL₂(ℝ): centre {±1}, θ(g)=(gᵀ)⁻¹ fixes SO(2) (LieGroups README:1251); universal cover: centre ≅ ℤ, and a nontrivial central character has no invariant vector but coefficient modulus ‖v‖² = 1 along the centre; SU(2): `cocompact = ⊥` | finite centre needed and present; compact case vacuous | Cartan paragraph replaced by Layer 9 citation |
| `howe_moore_of_cartan` | G = ℝ, K = {0}, A⁺ = ℝ, χ(t) = e^{it} | contraction groups {0}, closure not dense; coefficient modulus 1 | the hypothesis fails exactly where the conclusion fails | locator Theorem 1.2 = 3.2 |
| Iwasawa Haar density, new Check | box [0,1]×[1,2] and its d₄-image [0,4]×[4,8] | y⁻²: 0.5 and 0.5; density 1: 1 and 16; density y⁻¹: 0.6931 and 2.7726 | only y⁻² is invariant | Check added, locator Morris2015 |
| `modularQuotient_existsUnique_invariant` | Siegel set \|x\| ≤ 1/2, y ≥ √3/2, θ ∈ [0,2π) | 1 · (2/√3 = 1.1547) · 2π = 7.255 < ∞; trivial Γ in noncompact G: infinite Haar, no lattice | finite covolume | discreteness now cites Mathlib |
| `modular_timeOne_mixing` route | a_t⁻¹ n_x a_t; [[2,1],[1,1]]; general [[a,b],[c,d]], c ≠ 0 | n_{e^(−2t)x}, e^(−2) = 0.1353; p=(a−1)/c=1, q=(d−1)/c=0 gives n_1·[[1,0],[1,1]] = [[2,1],[1,1]]; general top-right (ad−1)/c = b | unipotents generate SL₂(ℝ) | code spans only |
| `mahler_relativelyCompact_iff` | n = 2, a_t; n = 0; n = 1 | first minimum e^(−t): 0.368 (t=1), 0.0067 (t=5); n=0: no z ≠ 0, quotient a point; n=1: minimum 1, quotient a point | both directions consistent | locator §3 Theorem 2 |
| `modularLattice_discrete` | `inferInstance` and Mathlib instance at the pin | closes for Fin 2 once the alias is gone; Mathlib instance is for every n | duplicate of Mathlib | deleted |
| Semiorbit theorems (topology) | old alias vs Mathlib instance | both `inferInstanceAs (TopologicalSpace (Subtype _))` on {A // det A = 1} | same topology | none needed |
| `condLabelEntropy`, new Check | law p(0,0)=1/2, p(1,0)=p(1,1)=1/4, p(0,1)=0 | H(X\|Y) = 0.5·log 1.5 + 0.25·log 3 = 0.4774; H(Y\|X) = 0.5·log 2 = 0.3466; H(Y) = 0.5623; H(X,Y) = 1.0397 = 1.5·log 2 = H(Y)+H(X\|Y); reversed ratio −0.4774 | order and sign pinned | Check added |
| `labelEntropy_nonneg_le_log_card` (README target) | (1/2,1/2,0); constant label | log 2 = 0.6931 ≤ log 3 = 1.0986; constant: 0 | bound and zero cell hold | Lean declaration removed |
| `labelEntropy_pair_of_indepFun` (README target) | two independent fair bits; (X, X) | 2·log 2 = 1.3863 = 0.6931 + 0.6931; (X,X): log 2 ≠ 2·log 2 | independence is needed | Lean declaration removed |
| `IsCompletelyAdditive.isAdditive` (README target) | term proof; ω at 4 | `⟨hf.1, fun m n hm hn _ => hf.2 m n hm hn⟩` elaborates; ω(4) = 1 ≠ ω(2)+ω(2) = 2 | restates the definitions; converse fails | Lean declaration removed |
| §0.1a `powOfAdditive` Checks (code spans) | 2^ω at 12, 4, 3, 2; 2^Ω at 4, 2 | ω(12)=2 → 4 = 2·2; 2^ω(4) = 2 vs 2^ω(2)·2^ω(2) = 4; Ω(4)=2 → 4 = 2·2 | values unchanged | TeX repaired, unbackticked |
| §0.1a library names | `#check` at the pin | `ArithmeticFunction.cardFactors_mul`, `cardDistinctFactors_mul`, `prodPrimeFactors_apply`, `IsMultiplicative.prodPrimeFactors`, `powersHom`, `powersHom_apply`, `List.card_toFinset`, `Nat.coprime_zero_left`, `Real.rpow_add` all elaborate | all exist | none |
| Pins | five cited lines at 1b1ccf4b; 12 linked files | lines 490, 541, 503, 512, 227 hold the cited declarations; all 12 files exist | unchanged | hashes updated |
