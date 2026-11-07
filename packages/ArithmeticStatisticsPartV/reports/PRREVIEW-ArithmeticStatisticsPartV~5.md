# Review of ArithmeticStatisticsPartV (pull request #1175 at e95c80e)

**Verdict:** needs changes

Incremental re-review of the 107 lines changed since 2a319ea. The gate passes and `Suggested.lean` elaborates with 41 `sorry` warnings and nothing else. The previous findings R01–R04 are repaired at the places they named. R05 was repaired as requested, but the numbering that report prescribed belongs to the arXiv version of [95], not to the published version the README cites. That is R01 below. The other three findings are supplier citations in the same passages. All four are P3.

## R01 (P3) — Lemma 2.5 and Remark 2.7 do not exist in the cited version of [95]

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1242`, "The source's Lemma2.5 invokes Brauer–Siegel for `h(L)/h(K)`, and its Remark2.7, p.8, recovers an effective constant by a case split on an exceptional zero of `ζ_K`".

Claim: README:2803 cites [95] as the Forum of Mathematics, Pi 13 (2025) e19 article, with publisher pagination. Section 2 of that version contains Lemmas 2.1, 2.3 and 2.4 and Remark 2.2, and nothing else. The Brauer–Siegel step is Lemma 2.4 on p.8, and §2 has no remark about effectivity. "Lemma 2.5" and "Remark 2.7" are the numbering of arXiv:2110.07712v2. The previous report read that preprint and prescribed this sentence from it. The same target's other locators (Lemma 2.1, Remark 2.2, Lemma 2.4 p.8) and README:2112 (Lemma 2.3) use the publisher numbering. So the sentence mixes the two numberings and credits the cited text with an effective case split that it does not contain.

Witness: in the ref95 publisher text, Lemma 2.4 and its proof (lines 375–387, p.8) invoke Brauer–Siegel, and lines 316–469 (pp.7–10) contain no Lemma 2.5 and no Remark 2.7. In the ref95 arXiv v2 text, Lemma 2.5 is line 393 and Remark 2.7 lines 403–427.

Repair: replace the sentence with: "The source's Lemma2.4, p.8, bounds `(R_L/R_K)h(L/K)` through the Brauer–Siegel theorem and states no effective constant; here the effective residue upper bound for `L` and the effective residue lower bound for `K` make every constant effective." Checked against the publisher text: Lemma 2.4 is at line 375, after the page-8 marker at line 366, and its proof cites Brauer–Siegel at lines 383–384.

## R02 (P3) — The effective residue lower bound is AnalyticNumberTheoryPartII §5.7a, not §5.7

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md`, lines 22, 54, 56, 88, 1242, 1244, 1427, 1429, 1443, 1447, 1486 and 2741. Line 56 reads: "The same section supplies the effective residue lower bound: for each `k≥2` an effective `c_k>0` with `κ_F≥c_k/log D_F` for every number field `F` of degree `k`". Lines 1244, 1447 and 1486 link this to the §5.7 anchor.

Claim: at its open head, AnalyticNumberTheoryPartII has moved the target out of §5.7 into a separate §5.7a, and §5.7 now only refers to it. Twelve lines of this README cite §5.7 for it. The supplier states the bound for every field with `2≤[K:ℚ]≤n`, and both consequences are part of its target. The contract's step `c_n=min_(2≤k≤n)c_k` and its own derivations of the two consequences therefore restate what the supplier already provides.

Witness: `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` at 480e1c2. Line 732: "the residue lower bound is §5.7a". Line 747: heading "5.7a Effective fixed-degree residue lower bound". Line 749: "every number field `K` with `2≤[K:ℚ]≤n`" … "Two consequences belong to the target."

Repair:
- Wherever the residue lower bound is meant, cite "AnalyticNumberTheoryPartII §5.7a" with the link `../AnalyticNumberTheoryPartII/README.md#57a-effective-fixed-degree-residue-lower-bound`.
- Keep §5.7 for the pointwise field bound: README:12, the §5.7 list at the start of line 56, and the first §5.7 items of 1429 and 1486.
- At line 56, state the contract in the supplier's form: "§5.7a supplies, for every `n≥2`, an effective `c_n>0` with `κ_K≥c_n/log D_K` for every number field `K` with `2≤[K:ℚ]≤n`, together with the subpower form `κ_K≥e·a·c_n D_K^(−a)` and the class-number–regulator form `h_K R_K≥(2c_n/(2π)^n)D_K^(1/2)/log D_K`; `κ_ℚ=1`."

Check of the repair: the two Checks at README:1253–1254 agree with §5.7a's own Checks (for ℚ(√−3), `κ log 3=0.6642`, and the hR form gives `0.0527≤1` at `c₂=0.66`).

## R03 (P3) — The relative regulator-ratio bound in the small-split-prime comparison has no named supplier

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1242`, "The regulator/class-number comparison is part of this target, using the relative regulator lower bound, the effective residue upper bound for `L` … and the effective residue lower bound … for `K`". The *Needs:* line at 1244 names suppliers only for the two residue bounds.

Claim: the comparison needs the Friedman–Skoruppa lower bound `R_L/R_K≫_N 1`. In [95]'s proof of Lemma 2.1, this bound turns `(R_L/R_K+1)|Cl(L/K)|` into `O((R_L/R_K)|Cl(L/K)|)`. Nothing in this roadmap provides it: no target, no *Needs:* item and no pinned declaration. AnalyticNumberTheoryPartII §5.7 states exactly this bound as a local target, with an effective constant. GeometryOfNumbersAndQuadraticArithmetic, which the same *Needs:* line cites, never mentions regulators (`roadmaps show` at its head).

Witness: `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` at 480e1c2, line 730: "The relative regulator-ratio bound: the uniform lower bound `R_E/R_F≳_m 1` … with an effective constant". ref95 publisher text, line 459: "(by [FS99])". For `ℚ(√5)/ℚ`, `R_L/R_K=0.4812<1`.

Repair: in the sentence, write "the relative regulator-ratio bound `R_L/R_K≫_N 1` (Friedman–Skoruppa, effective) of AnalyticNumberTheoryPartII §5.7". Add "[AnalyticNumberTheoryPartII §5.7](../AnalyticNumberTheoryPartII/README.md#57-uniform-small-degree-field-discriminant-count) (relative regulator-ratio bound)" to the *Needs:* line at 1244. Check: the supplier's bound, with constant at most 0.4812, covers ℚ(√5)/ℚ.

## R04 (P3) — Three §3.25 targets use the residue upper bound but cite only §2.32

Location: `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md`:
- README:1404: "Expand the maximum, use `κ_F≪_(n,ε)D_F^ε`".
- README:1364: "In particular `N_{O_F,3}(X)≪_{[F:ℚ],ε}D_F^εX` once `X≥D_F³h^{2/3}`", which comes from the `κ_F X` term.
- README:1350: `h₂(F)D_F^εX`, whose ideal-count main term is `κ_F X`.
- The *Needs:* lines of these three targets (1354, 1368, 1410) read "AnalyticNumberTheoryPartI §§2.5, 2.21 and 2.32".

Claim: README:54 now says that every residue upper bound in this part comes from §2.31e or §2.15, but none of these three *Needs:* lines lists either section. §2.32 states only the `h R` asymptotic and keeps possible ineffectivity explicit. The piecewise bound at 1425, which consumes propagation and the Shintani bound, asserts effective constants. This is the defect of the previous R04, at three sites that report did not list.

Witness: `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` at 20d500c. Line 1641 (§2.32): "`log(h_K R_K)=(1/2+o(1)) log D`. Keep … possible ineffectivity explicit". Line 1341 (§2.15): `κ_K≤(e log D_K/(2(d−1)))^(d−1)`. For `ℚ(√5)`, §2.15 gives `κ=0.4304≤2.187`; §2.32 gives no constant.

Repair: add "AnalyticNumberTheoryPartI §2.31e or §2.15 (effective residue upper bound)" to the *Needs:* lines at 1354, 1368 and 1410. Keep §2.32 only where a target uses the `h R` asymptotic itself. Checked on ℚ(√5) as above.

## Previous findings

- R01 — repaired: `Suggested.lean:1` is `module`, followed by `import Mathlib`. The worker's gate at e95c80e reports `build=0`, and my rerun prints `OK`. Two `Suggested.lean` files on main begin with the same `module`/`import Mathlib` header.
- R02 — repaired: the local target "Effective fixed-degree residue lower bound" is deleted. README:56 now reads "The same section supplies the effective residue lower bound…", and the *Needs:* lines at 1244, 1429, 1447 and 1486 cite AnalyticNumberTheoryPartII. The supplier has since moved the target to §5.7a (R02 of this report).
- R03 — repaired: no signature contains `letI` or `haveI` (gate `statement-hygiene=0`). `Suggested.lean:54` declares `instance numberField_of_mem (F : Type*) [Field F] [NumberField F] (K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L}) : NumberField K.val`, and the 48 earlier declarations elaborate to identical types.
- R04 — repaired: README:54 reads "Every residue upper bound in this part is the effective subpower bound `κ_K≤C_(n,a)D_K^a` of §2.31e … or the explicit bound … of §2.15". The *Needs:* lines at 1244, 1447 and 1486 read "§2.31e or §2.15 (effective residue upper bound)". Three other *Needs:* lines remain (R04 of this report).
- R05 — repaired: README:1242 no longer calls the source's constant ineffective. Its replacement cites "Lemma2.5" and "Remark2.7, p.8", which are arXiv v2 numbering and absent from the published [95] (R01 of this report). The previous report's witness used that preprint.

## Verified sound

Scope of this round: the 107-line diff (`scratch/changes.md`, read as data), everything it cites, and the targets that depend on the changed contract sentences at README:54 and :56. Outside the folder the diff is empty: `git diff --stat origin/main...HEAD` with the folder excluded prints nothing. The pins are unchanged since 2a319ea: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` in `lake-manifest.json`.

### Gate, elaboration and signatures

- My gate rerun at e95c80e prints `set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 … OK`, and the worker's run adds `build=0`.
- `lake env lean` on a scratch copy of `Suggested.lean`, with a `#check @name` for each of the 49 declarations, exits 0 with exactly 41 ``declaration uses `sorry` `` warnings and no other diagnostic.
- I did the same for `Suggested.lean` at 2a319ea and diffed the two outputs. The printed types of all 48 earlier declarations are identical, so deleting the 53 `letI` lines changed no statement.
- The new instance elaborates to `∀ (F : Type u_1) [inst : Field F] [NumberField F] (K : { L // FiniteDimensional F ↥L }), NumberField ↥↑K`, matching the worker's `signatures.md`, with no lost binder.
- `NumberField` is a `Prop`-valued class, so there is no instance diamond. The inner `IntermediateField` sums now find Mathlib's `NumberField.of_intermediateField`.
- The one-tactic probe of the previous round carries over: the 41 headline statements are unchanged. The instance is a definition the headlines need, not padding.
- Headline coverage is unchanged: 41 headline theorems, 7 real-bodied definitions and 1 instance. README:76 names the instance, and the gate's `readme-ids-missing=0` confirms README and Lean agree.

### Library declarations opened at the pins

- `NumberField.of_module_finite`: `Mathlib/NumberTheory/NumberField/Basic.lean:65`, a theorem, not an instance.
- `NumberField.of_intermediateField`: `Mathlib/NumberTheory/NumberField/Basic.lean:72`, an instance, and only when the ambient field is a number field. `AlgebraicClosure F` is not one, so the new instance is needed.
- `NumberField.dedekindZeta_residue` and `dedekindZeta_residue_def`: `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57,61`. The body is `2^r₁(2π)^r₂·R·h/(w·√|disc|)`, with `torsionOrder` as `w`, which gives the class-number–regulator form used at README:56.
- `NumberField.abs_discr_gt_two`: `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`.
- `FiniteGaloisIntermediateField.instNumberField`: `TauCeti/NumberTheory/NumberField/FiniteGaloisIntermediateField.lean:30`. It covers Galois subextensions only, so it does not duplicate `numberField_of_mem`.
- `roadmaps grep` finds no other roadmap's Lean file declaring this instance.

### Cross-roadmap citations resolved at the heads

- AnalyticNumberTheoryPartI at 20d500c (open pull request, earlier in the merge order at position 90):
  - §0.31b `.siegel_gap`, line 774.
  - §0.32 `siegel_walfisz` (effective, `q≤(log x)^B`), heading line 780.
  - §0.34 `landau_siegel_exclusion`, heading line 804.
  - §2.7, the quadratic zeta factorization, heading line 1170.
  - §2.15 `dedekindZeta_residue_le`, line 1341.
  - §2.31e, effective subpower upper bound via Thorner–Zaman and the two Stark interfaces, line 1603.
  - §2.32, the `h R` asymptotic, line 1641.
  - The three anchors `#034-…`, `#032-…` and `#031-…` match their headings.
- AnalyticNumberTheoryPartII at 480e1c2 (position 91): §5.7, the pointwise count, with the regulator-ratio local target at line 730; §5.7a, the residue lower bound, lines 747–764 (R02, R03).
- LocalFieldsRamification Layer 3 (README:277, 2330, 2630) exists on main at `Completed/LocalFieldsRamification/README.md:724`. The overlap report says #617 drops it, but #617 revises an existing roadmap, which is cited as it is on main, so this is not a finding.
- Dependency check: `depcheck: 240 roadmaps, 2446 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. This roadmap is at position 110, after both suppliers.

### Sources read this round

- ref95, publisher text of Forum Math. Pi 13 (2025) e19, from the open-access PDF the README links. This is the text earlier rounds cited with publisher page numbers; its Lemma 3.14 is at line 845, as they recorded. Read:
  - Lemma 2.1 (line 323, p.7): `θ<1/(4ℓ(d−1))` with `d:=[L:ℚ]`, matching the README's `N=[L:ℚ]`.
  - Remark 2.2 and Lemmas 2.3–2.4 (pp.7–8).
  - The proof of Lemma 2.1 (pp.8–10).
  - Theorem 3.1, Corollary 3.2 and Remark 3.3 (p.10).
  - Theorem 5.1 (p.22), Lemmas 5.7 (p.23) and 5.8–5.9 (p.25).
  - Lemma 6.3 and Theorem 6.4 (p.31), and Theorem 6.5 (p.32).
  - The locators at README:1242 ("Lemma2.4, p.8"), 1246, 1431, 1449 and 1488 match.
- ref95, arXiv:2110.07712v2 text, to identify the numbering of R01.
- Seeded sample: of the sampled targets, only §3.26 (thin two-group torsion) falls in the diff. Its locator "Lemma6.3 and Theorems6.4–6.5, pp.31–33" and its statement shapes (`D^εD_k^{α_m}`, `X^{1/2+ε}`, `X^{1−δ}`) match the publisher text, lines 1729–1764. The other sampled targets are outside the diff and were not rechecked this round.

### Computed adversarial pass

The 13 rows for statements the diff adds or changes are new. The other 156 rows are carried from the previous report (marked r4). "As r3" inside a carried row refers to the round before that.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| Effective residue lower bound, supplier contract (README:56) | ℚ(√−3), ℚ(√5), cubic Δ=−23, K=ℚ | κ=0.6046, 0.4304, 0.3684; κ·log D=0.6642, 0.6927, 1.1551; ℚ has log D=0 and is excluded, κ_ℚ=1 | Statement passes; cited at §5.7, owned at §5.7a (R02) |
| `c_n=min_(2≤k≤n)c_k` versus the supplier's `c_n` | n=2; n=3 | n=2: identical; n=3: quadratic fields force c≤0.6642, the −23 cubic only c≤1.1551, so the minimum equals the supplier's c_3 form | Pass; restates the supplier (R02) |
| Subpower consequence `κ_K≥e·a·c_n D_K^(−a)` | a=1, D=3; a=1/2, D=e² | log 3=1.0986≤3/e=1.1036; at D=e^(1/a) equality 2=2, so the factor e·a is sharp | Pass |
| Class-number–regulator consequence | ℚ(√−3), c₂=0.66; ℚ(√5), c₂=0.6642; signatures (2,0),(0,1),(1,1) | 0.0527≤hR=1; 0.0467≤hR=0.4812; 2^r₁(2π)^r₂=4, 6.283, 12.566 versus (2π)^n=39.48, 39.48, 248.05; w≥2 | Pass |
| Residue upper-bound contract (README:54), §2.15 form | ℚ(√5), ℚ(√−3), cubic −23 | (e log D/(2(d−1)))^(d−1)=2.187, 1.493, 4.540 against κ=0.4304, 0.6046, 0.3684 | Pass |
| Moved Checks (README:1253–1254) | ℚ(√−3); K=ℚ | 0.6642 (README ≈0.664); 0.0527 (README ≈0.053); κ_ℚ=1 | Pass |
| Relative small-split-prime bound: θ range and exponents | N=[L:ℚ]=4, ℓ=3; K=ℚ; M=1 | θ<1/36=0.02778, as in publisher Lemma 2.1 (d:=[L:ℚ]); Disc(K) exponent (d−1)/2 with d=[L:K] from Lemma 2.4; K=ℚ gives factor 1 | Pass; locators (R01) |
| Same target: regulator input | K=ℚ with L=ℚ(√5), L=ℚ(√−3) | R_L/R_K=0.4812 and 1; absorbing (R_L/R_K+1) needs a bound ≫_N 1, not ≥1 | Supplier unnamed (R03) |
| Piecewise bound, factor κ_F^(−2) | F=ℚ; F=ℚ(√−3); ε=0.1 | 1; κ^(−2)=2.7357=(log 3/0.6642)², equality at the extremal c₂; max of (log D)²/D^ε is (2/(eε))²=54.1 | Pass; citation (R02) |
| Propagation, Shintani and uniform quadratic bounds: residue upper bound | F=ℚ(√5) | ideal-count main term 0.4304X; §2.15 gives κ≤2.187; §2.32 gives no constant | Needs lines (R04) |
| Quadratic tower tail and thin two-group torsion | m=1 case of Lemma 6.3; regular V₄; D₄ | count≪h₂(k)D^ε≤D^ε Disc(k)^(1/2+ε); V₄ inertia index ≥2, so discriminants are powerful, O(X^(1/2)) of them; D₄ has a transposition and is excluded | Pass; locators pp.22–29, 31–33 match |
| Instance `numberField_of_mem` | F=ℚ, K=⊥; F=ℚ(i), [K:F]=2; K=AlgebraicClosure F | ⊥≅ℚ is a number field; a finite K is one by `of_module_finite`; the closure is infinite-dimensional and excluded by the subtype's property | Pass; Prop-valued, no diamond with `of_intermediateField` |
| The 48 earlier declarations after deleting every `letI` | `#check` at 2a319ea and at e95c80e | printed types identical (empty diff); 41 sorry warnings at both heads | Pass |
| Fouvry–Klüners moments, effectivity | FK Lemma 13 versus §0.32 | √q x(log x)^(−A)≥x once q>(log x)^(2A); x=e^100, A=1 gives q>10⁴ trivial; below it §0.32 with B=2A | Pass; effective (r4) |
| Fk maximal unlinked support, effectivity | k=1 | error exponent −1/2+ε; mesh 1+(log X)^(−2); inputs §0.32, ANT-II §5.29, §3.26 all effective | Pass (r4) |
| Fk narrow wide moment comparison | D=12, D=5 (as r3) | both four-rank pairs (0,0); constant inherited from the moment bounds | Pass; §3.3 locator repaired (r4) |
| Quartic invariant convention | x⁴−y⁴ | I=−12, J=0, Δ=−256; 4I³−J²=−6912=27Δ | Pass; none (r4) |
| Elliptic/invariant height conversion | A=−1,B=0; invariant scaling | H_E=4,H_IJ=27; 27·4=4·27=108; scaling multiplier 4096 | Pass; none (r4) |
| Cutoffs, empty sums, automorphism weights | X<1; degree 3 S₃ and C₃ | Empty numerator=denominator=0, Lean ratio=0; S₃ has 3·(1/3)=1; C₃ has 1·(3/3)=1 | Pass; limiting positive denominators retained (r4) |
| Cubic splitting-symbol partition | p=2,3 | Five nonzero counts (1,3,2,6,3), sum 15; (8,24,16,24,8), sum 80 | Pass; zero form excluded (r4) |
| Cubic reduction versus maximality | maximal Δ=−83 and index-two order Δ=−332 | Δ_order=4Δ_field; mod 2 algebras F₂×F₄ versus F₂×F₂[ε]/ε² | Pass; maximality is necessary (r4) |
| Splitting densities | p=2 | (1,3,2,6,3)/16; total 15/16, zero mass 1/16 | Pass; none (r4) |
| Maximal splitting densities | p=2 | Total maximal density 21/32; no-total-ramification density 9/16; difference 3/32 | Pass; no omitted dyadic factor (r4) |
| Maximal/nonmaximal cubic local test | y³+2x³; y³+4x³ | First Eisenstein cubic is maximal at 2; second has index divisible by 2; discriminant valuations 2 versus 4 | Pass; none (r4) |
| Irreducible cubic ring to field | x³−x−1; split cubic algebra | Field discriminant −23, domain; split algebra has nonzero zero divisors | Pass; irreducibility retained (r4) |
| Davenport–Heilbronn cubic count | both signs | Positive constant 1/(12ζ(3)), negative 1/(4ζ(3)); ratio 3, sum 1/(3ζ(3)) | Pass; none (r4) |
| Resolvent correspondence | Δ=−23; Δ=−3,−4 | h₃=3 gives (3−1)/2=1; h₃=1 gives 0 | Pass; trivial character removed (r4) |
| Three-torsion fibre formula | same fields, positive Δ=229 | x³−x−1 has −23; x³−4x+1 has 229; signs are distinct, no absolute-value collapse | Pass; none (r4) |
| Large-prime total-ramification tail | cutoff Y, smallest q=2 | Σ_{m>Y}m⁻²≤1/(Y−1) for Y>1; q=2 has finite nonzero contribution | Pass; tail is summed, not primewise discarded (r4) |
| Quadratic discriminant count | squarefree n<1000 by n mod 4 | Counts (0,200,204,204), versus densities (0,2/π²,2/π²,2/π²); total 608 | Pass; Part I specialization (r4) |
| DH three-torsion means | negative −25<D<0 | 10 fields, torsion sum 12, finite ratio 6/5; limiting target 2, not a finite-X equality | Pass; real target 4/3 distinct (r4) |
| Acceptable versus strongly acceptable specifications | unrestricted, maximal, empty at one place | Local density 1, 21/32 at p=2, 0 respectively; empty local set forces global count 0 | Pass; positivity needed for ratios (r4) |
| Local cubic mass normalization | p=2, split algebra | #GL₂(F₂)/2⁴=3/8; split mass 1/6 gives 1/16 | Pass; stabilizer factor retained (r4) |
| All-order and maximal local masses | p=2 | All-order mass 8/3 gives 1; maximal mass 7/4 gives 21/32 | Pass; none (r4) |
| Local specification global formula | unrestricted archimedean signs | Real factors 1/6 and 1/2 have ratio 3; empty selector multiplies either by 0 | Pass; none (r4) |
| Roberts secondary term | ± signs | Leading ratio 3; secondary ratio √3; exponents 1,5/6,13/16 are distinct | Pass; none (r4) |
| Secondary three-torsion mean | quadratic sign coefficients | Leading 4/3 and 2; secondary scale X^(5/6)/X=X^(−1/6) in the average | Pass; no constant-term substitution (r4) |
| Secondary local-specification refinement | change one local selector to empty | Both leading and secondary local factors vanish; resulting main terms 0 | Pass; strong acceptability kept (r4) |
| Mertens positive definite count | X=10⁴,10⁵,4·10⁵ | Reduced counts 172131,5494441,44054144; normalized 0.172131,0.173750,0.174139 versus π/18=0.174533 | Pass; all three README counts reproduced (r4) |
| Positive definite boundary and content | D=−3,−4,−12,−16 | Class counts 1,1,2,2; including negative definite forms doubles them | Pass; native orbit convention (r4) |
| Quadratic-character interval estimate | χ₃, interval and progression | Sum on {1,2,3}=0; {1}=1; progression 1 mod 3 of length H sums H | Pass; coprime step essential (r4) |
| Siegel primitive regulator mean | D=5,20; q and 2q | ε₅=(3+√5)/2; ε₂₀=ε₅³; stabilizer of 2q still has period log ε₅ | Pass; primitive-part regulator retained (r4) |
| All-order L-value coefficient | square indices m=1,2 | ρ(1)=1/2,ρ(4)=1/4; sum ρ(m²)/m²=ζ(2)/(2ζ(3)); Abel factor 2/3 gives π²/(18ζ(3)) | Pass; none (r4) |
| Quoted quadratic/cubic classical constants | primitive/all forms; maximal/all cubic orders | ζ(3)·π²/(18ζ(3))=π²/18; (π²/72)/(1/(12ζ(3)))=ζ(2)ζ(3) | Pass; conventions not mixed (r4) |
| Rigid field definition and forgetful maps | degree 1, quadratic, S₃ cubic | Rigid counts per class 1,2,18; S₃ embedded count 3 and each embedded labelling count 6 | Pass; three different carriers distinguished (r4) |
| Relative torsion splitting | degree 2, ℓ=3 and ℓ=2; identity | 2·2=1 mod 3 gives section; 2=0 mod 2 has no inverse; identity norm kernel has size 1 | Pass; coprimality retained (r4) |
| S-integral étale dictionary | degree 2, v=4,8 | ℚ×ℚ versus ℚ(√2); both étale, only second a field | Pass; previous R05 repaired (r4) |
| L_β membership | β=1, S={∞} and {∞,2} | Zero belongs to both; coefficient 1/2 fails first and belongs to second | Pass; not all V(ℚ) (r4) |
| Γ_β membership | identity, diag(2,1), S as above | Identity in both; determinant 2 not a ℤ-unit but is a ℤ[1/2]-unit | Pass; not all G(ℚ) (r4) |
| β-twisted lattice/action | β=diag(2,1) on cubics | β·y³=y³/2; β·4x³=16x³; β⁻¹·x³=x³/4 | Pass; determinant twist direction fixed (r4) |
| Global field versus local algebra selector | split completion of a quadratic field | Global field degree 2; local algebra can be F_v×F_v with two idempotents | Pass; no all-local-fields restriction (r4) |
| S-integral maximal sieve | empty selector; one nonmaximal prime | Empty family count 0; index-p order has Δ multiplied by p² and leaves maximal locus | Pass; all β-components retained (r4) |
| Jacobian and archimedean mass | degrees 4 and 5 | Quartic factors 1/48,1/8,1/16 sum 5/24; quintic 1/240,1/24,1/16 sum 13/120 | Pass; no factor-two loss (r4) |
| Quartic/quintic Euler constants | p=2 | Quartic 1+1/4−1/8−1/16=17/16; quintic 1+1/4−1/16−1/32=37/32 | Pass; none (r4) |
| Quartic class-group fibre | trivial versus nontrivial quadratic characters | Trivial character gives split quadratic algebra; nonzero C₂ character determines a quadratic field; resolvent multiplicities 1 for S₄ and 3 for A₄ | Pass; full algebra fibre precedes field restriction (r4) |
| Relative class-group mass ratios | F=ℚ, real cubic types | Ordinary means 1+1/4=5/4 and 1+1/2=3/2; totally real narrow mean 2 | Pass; ordinary/narrow not conflated (r4) |
| S₄ field theorem | all signatures | Weighted archimedean sum 5/24; S₄ field has 4 embedded representatives, each weight 1/4 | Pass; unweighted class contribution 1 (r4) |
| S₅ field theorem | all signatures | Weighted archimedean sum 13/120; 5 representatives each weight 1/5 | Pass; contribution 1 (r4) |
| BSW number-field theorem | n=2,F=ℚ; F=ℚ(i) residue | Weighted quadratic constant 3/π² versus unweighted 6/π²; κ_ℚ(i)=π/4 | Pass; reciprocal automorphism convention (r4) |
| Cubic two-torsion mean | F=ℚ, a=0,1; complex base | Formula gives 3/2,5/4; r₁=0,r₂=1 gives 5/4 | Pass; all base signatures retained (r4) |
| Four-rank definition | C₂,C₄,C₈, trivial group | Two-torsion in squares has cardinal 1,2,2,1; ranks 0,1,1,0 | Pass; not full two-torsion (r4) |
| Conic four-rank formula | D=5 | b=1,5 give two soluble conics; half-count 1=2⁰; adding negative b would give 2 | Pass; divisor sign fixed (r4) |
| Negative odd Jacobi expansion | D=−3,−39; k=1,2 | Exact factor-assignment sums (1,1) and (2,4), respectively; equal 2^(k·rank) for ranks 0,1 | Pass; none (r4) |
| Positive odd Jacobi expansion | D=5; k=1,2 | Exact sums 1,1, including the −1 character; equal 2⁰,2⁰ | Pass; none (r4) |
| Negative 8-family expansion | D=−8; k=1,2 | Exact sums 1,1; inserting the absent 2^(−k) would give 1/2,1/4 | Pass; none (r4) |
| Positive 8-family expansion | D=8; k=1,2 | Γ-sum gives 1,1; its 2^k empty-prime terms cancel the prefactor | Pass; none (r4) |
| Negative 4-family expansion | D=−4; k=1,2 | Γ-sum gives 1,1, with empty odd-prime product 1 | Pass; none (r4) |
| Positive 4-family expansion | D=12; k=1,2 | Exact sums 1,1 with odd product 3 mod 4 | Pass; none (r4) |
| Maximal unlinked support | k=1, points 00,01 | Their linkage is 0; cardinal 2=2¹; all four points contain linked pairs | Pass; no full-space support (r4) |
| FK main coefficients | k=0,1,2 | N(k,2)=1,2,5 and N(3,2)=16; imaginary 1,2,5; real 1,3/2,11/4 | Pass; none (r4) |
| Narrow/ordinary comparison | D=12 and D=5 | Both pairs of four-ranks (0,0); D=12 has a 3 mod 4 divisor, D=5 merely lies in candidate family | Pass; R02 locator only (r4) |
| Rank-grid zero lemma | zero function; constant; Euler product | Zero satisfies bounds; nonzero constant has g(1)≠0; product has ω=0,α=1/2 and 0>0 is false | Pass; strict threshold necessary (r4) |
| Rank moment determinacy | p=2,u=0,1; rank-zero point mass | Prescribed moments at k=0,1 are (1,2),(1,3/2); point mass gives (1,1) | Pass; nonvacuous moment hypothesis (r4) |
| FK moment/law headlines | p=2,r=0,u=0,1 | η∞≈0.288788095; rank-zero probabilities ≈0.288788095,0.577576190; not equal | Pass; sign parameter matters (r4) |
| Malle index and cyclotomic orbit definitions | S₃ natural/regular; C₃; identity | Transposition indices 1/3; C₃ index 2; identity index 0 excluded from minimum | Pass; action recorded (r4) |
| Malle a,b and conjectural status | C₃ over ℚ and ℚ(ζ₃); V₄ regular | (a,b)=(1/2,1),(1/2,2); V₄=(1/2,3), predicting log² | Pass; no unconditional conjecture (r4) |
| Abelian conductor series | simple/double pole at a | Residue c gives coefficient c/a; double pole adds log X; trivial group has singleton count 1 | Pass; trivial group excluded from pole assertion (r4) |
| Klüners obstruction | C₃≀C₂ in degree 6 | Group order 18, minimum index 2; X^(1/2)log X divided by X^(1/2) tends to ∞ | Pass; original prediction really fails (r4) |
| Cubic conductor–discriminant | x³−3 and x³−2 | −243=(−3)·9²; −108=(−3)·6² | Pass; wild and nonsquarefree conductors retained (r4) |
| Quadratic order three-torsion bound | conductor 9 over ℚ(√−39) | Local 3-primary kernel can have order 9; replacing wild factor by 3 is too small | Pass; corrected wild bound (r4) |
| Relative small-split-prime torsion estimate | d=2,ℓ=3 | θ range 0<θ<1/(12(N−1)); zero split-prime count cannot enter a denominator | Pass; positivity conditions retained (r4) |
| Integer-lattice largest minimum | ℚ(i); arbitrary diag(1,T²) | Arithmetic minima (1,1); generic last minimum T and covolume T do not imply T≤C√T | Pass; ring multiplication essential; R01 locator (r4) |
| Small square-ideal generators | principal unit ideal and square ideal | Unit ideal gives norm 1=1²; squaring ideal norm 2 gives norm 4, not 2 | Pass; square condition distinguished (r4) |
| Square-norm curve estimate | degrees 3,4, P₁=P₂=B | Imported curve exponent B^(1/3),B^(1/4); resulting torsion exponents 1/3,3/8 | Pass; coefficient-independent supplier (r4) |
| General two-torsion saving | n=3,4 | 1/2−1/(2n)=1/3,3/8; degree 1 is outside stated n≥3 signature | Pass; none (r4) |
| Elliptic integral-point bound | nonsingular cubic; singular discriminant 0 | β=0.2782386677; Δ=0 would kill a positive-power discriminant bound and is excluded | Pass; native nonsingularity retained (r4) |
| Cubic torsion feedback | β above | a=1/[6(1−β/log 2)]=0.2784337427<1/3; replacing log 2 by 1 changes a | Pass; all cubic fields included (r4) |
| Uniform quadratic field count | F=ℚ,X≥1; X<1 | D_F=h₂(F)=1 gives O(X); relative discriminant norms below 1 count 0 | Pass; constant chosen before F (r4) |
| Shintani cubic order estimate | D=h=1; X=D³h^(2/3) | First becomes O(X+X^(−1/2−ε)); at threshold error has X-scale up to D^ε | Pass; degree-one contour handled separately (r4) |
| Relative torsion propagation | F=ℚ | Bound becomes O(√X+X); unit ideal contributes 1, not 0 | Pass; no all-conductor equality assumed (r4) |
| Local cubic order factors | q=3,s=1 | Totally ramified 2187/1936; split 675/484; denominator retains 1−3/9³ | Pass; page-image formula agrees (r4) |
| Order mass versus generic stabilizer | ℚ×ℚ(√5), index 11 | Embedded orders 3; orbits of sizes 2,1; masses 1+1/2=3/2 versus erroneous generic-class mass 1 | Pass; source error repaired (r4) |
| Cubic character Euler cancellation | χ³=1, formal u | (1−χ²u²)/(1−χu)=1+χu; constant coefficient 1 | Pass; no tame restriction needed (r4) |
| Five-range torsion bound | four transition cutoffs | Adjacent values D²; D^(5/2)h^(2/3); D³h^(2/3); D³h^(2/3) | Pass; ranges join (r4) |
| Quadratic tower tail | tower top bound X, base D>√X | D_top≥D²>X gives empty tail; at D=h=1 the large-range estimate is X | Pass; order of cutoffs retained (r4) |
| Wreath transposition fibre | d=1,2 | C₂≀1=C₂; C₂≀C₂=D₄ of order 8; block labellings 2^d=2,4 | Pass; quadratic blocks distinguished (r4) |
| Thin two-group torsion | zero tower length; positive length | Degree-one family is singleton with three-torsion 1; positive-length estimates are asymptotic families | Pass; no m=0 extrapolation (r4) |
| Two-extension field count | k=ℚ,m=1 | Coefficient specializes to 6/π², the quadratic count; quadratic automorphism count 2 cancels degree 2 | Pass; none (r4) |
| Two-extension three-torsion mean | k=ℚ,m=1, real/imaginary mix | Equal leading family sizes give (4/3+2)/2=5/3 | Pass; not 2 or 4/3 universally (r4) |
| Relative wreath mean | signature parameter u=0,1 | 1+3^(−u)=2,4/3; identity relative norm kernel has size 1 | Pass; relative numerator retained (r4) |
| Embedded quadratic-wreath type | G=C₃,C₂,1 | Inverse graph gives S₃, V₄, C₂ respectively; outside-involution classes 1,2,1 | Pass; good/bad types distinguished (r4) |
| Moment normalization | (A₃,S₃), real/imaginary | Unrigid means 1/6,1/2; rigid factors 6,2 give 1,1 | Pass; maps are not unmarked counts (r4) |
| Admissibility and abelianization | C₃ inversion; C₂ trivial inversion | S₃ abelianization C₂; V₄ has two-dimensional elementary quotient | Pass; good-type condition restrictive (r4) |
| Embedded-type/Goursat classification | #G=12,#N=4 | Ambient type size 2·12·4=96; changing N to 1 gives 24 | Pass; quotient data retained (r4) |
| Elementary-two T definition | k=1,s=1,2 | Dyadic factors 2,19/16; naive odd-prime rule at s=2 gives 3/2 | Pass; three discriminating local tests (r4) |
| Elementary-two U definition | k=1,s=1; p=3,5 | Dyadic 1/2; odd factors 1/3,7/5; opposite dyadic sign gives 3/2 | Pass; mod-four selector retained (r4) |
| Elementary-two V definition | k=1,s=1; p=3,5 | Dyadic 5/4; odd factors 1,7/5; adding absent dyadic term gives 7/4 | Pass; none (r4) |
| T,U,V continuation and selectors | k=1 | Zeta pole orders 2,0,1; normalized dyadic factors 1/2,1/2,5/8; real/imaginary constant coefficients 1,0 | Pass; not evaluation of divergent series (r4) |
| Elementary-two divergence | k=1 versus k=0 | Leading scale X log X versus X; divided by quadratic X gives log X versus constant | Pass; k≥1 essential (r4) |
| Low-degree alternating moments | n=3,4,5 over ℚ | Imaginary 1/2,1/4,1/12; real 1/6,1/24,1/120 | Pass; native headline matches (r4) |
| Q₈ residue factors | p=3; χ(2)=±1 | A₃=20/27, lower B₃=16/27; dyadic 1/4,3/4; extending lower product to p=2 gives 0 | Pass; separate dyadic factor essential (r4) |
| Restricted L-value mean/divergence | fixed R=5·13·17 | R=1105 forces at least 3 primes; 2√(3/5)>1; harmonic lower sum grows C_R log T | Pass; restricted mean supplied separately (r4) |
| A₄ kernel/field correspondence | two eligible kernels; sample size m=2 | Labels 2·24=48; bootstrap values 0,48,48,96 have mean 48 | Pass; kernel count not labelled-surjection count (r4) |
| Small trace-zero element | ℚ(√d); biquadratic field | Tr(√d)=0; in degree 4 a quadratic-subfield element still has degree 2 | Pass; generator exclusion needed (r4) |
| Schmidt uniform field bound | n=2,4 | Exponents (n+2)/4=1,3/2; uniform constant precedes the varying base | Pass; no fixed-base constant summed (r4) |
| Mixed-trace finite fibres | r=3,n=6,d=4,5 | Monomial counts 15≤18,21>18; map (x,y)↦(x,xy) has infinite fibre at (0,0) but singleton at x≠0 | Pass; excluded determinant locus retained (r4) |
| Mixed-trace interpolation exception | r=4,n=9,d=4 | 35<36, so this exceptional double-point configuration cannot satisfy the selected dimension inequality | Pass; no generic-rank overclaim (r4) |
| Lemke Oliver–Thorne headline | n=2,3,4,5 | Least d=2,3,3,4; stated flexible exponents 3,11/3,17/4,24/5 | Pass; small degrees not dropped (r4) |
| Cyclic-prime counts | p=2,3; V₄ | Exponents 1,1/2; p−1 character labels 1,2; V₄ has log² and is not cyclic prime | Pass; no pure-power overclaim (r4) |
| Finite-simple large subgroup | A₅,A₄; C₂; r=0,2 | 144>60; 1<2; r=0 yields 1=1, r=2 gives 20736>3600 | Pass; nonabelian and r≥1 retained (r4) |
| Conditional/unconditional Galois bounds | h=60; small abelian branch | 1/4+1/(2√60)+1/60≈0.331216<3/8; 17/48<18/48 | Pass; owned group input closes implication (r4) |
| Fixed quadratic resolvent | F=ℚ(√−3) | log √X=(1/2)log X; conversion gives 7/(60√3), not 7/(30√3) | Pass; exceptional logarithm retained (r4) |
| Baily quartic bound | empty and singleton family | Empty sum=count=0; singleton retains h₂(K)log²(2D_K)/√D_K | Pass; arbitrary subfamilies permitted (r4) |
| Square-norm ideal subsets | local types 111,12,3,1²1,1³ | Subset/degree-one counts (3,3),(1,1),(0,0),(1,2),(0,1) | Pass; ramified cases included (r4) |
| Dyadic discriminant comparison | c divides 2O_K | v(d)=2v(2)+v(a)−2v(c)≥v(a); equality when v(c)=v(2) | Pass; no odd-only conductor (r4) |
| Uniform cubic ideal count | T=D² | Error D^(1/2)T^(1/4)=D≤D²=T; below threshold log(2T)≤2log(2D) | Pass; uniformity proved in route (r4) |
| Weighted partial summation | b=0,1; a=0 negative control | Both positive-a cases give exponent 1/2+a+ε; at a=0 dyadic shells add a logarithm | Pass; a>0 retained (r4) |
| Quartic torsion applications | computed cubic exponent a | 1/2+a=0.7784337427; exceptional resolvent adds log before ε-absorption | Pass; cyclic cubics included (r4) |
| Governing-field definition | same Frobenius class, excluded ramified prime | Class function must give equal ranks on that class; ramified Frobenius is undefined, hence finite exceptional set necessary | Pass; domain specified (r4) |
| Eight-rank governing example | p=5,17 | h(−20)=2,h(−68)=4, so eight-rank 0 in both; four-ranks differ 0,1 | Pass; rank level not confused (r4) |
| Principality computation | degree-eight auxiliary field | 2³⁶/128²=2²²; Minkowski bound ≈12.935; prime-ideal norms 81,25,49,14641 all exceed it | Pass; integral index matters (r4) |
| Sixteen-rank spin criterion | split vs nonsplit prime | Split primes enter the residue-symbol criterion; nonsplit primes fail the splitting hypothesis, not a forced zero spin | Pass; condition retained (r4) |
| Conditional joint-spin bound | Q=27,d=3,χ₃ | Allowed N≤3; N=1 sum 1,N=3 sum 0; principal sums grow 2N/3 | Pass; δ and ε quantifiers explicit (r4) |
| No sixteen-rank governing field | fixed field, Chebotarev class | Positive-density class gives cX/log X; spin cancellation gives o(X/log X), incompatible for c>0 | Pass; explicitly conditional (r4) |
| Restricted Pell radicands | d=1,2,3,5 | 1 has (0,1), gives ℚ; 2 has (1,1), field Δ=8; 3 forbidden; 5 has (2,1), field Δ=5 | Pass; radicand not discriminant (r4) |
| Historical Pell bounds | α and upper bound | α≈0.419422442<2/3≈0.666666667; 1−α≈0.580577558 lies between | Pass; no density conclusion (r4) |
| Fixed-prime-factor Pell law | t=1,2,3,4 | q_t=1,1/2,1/2,7/16; 2×2 symmetric matrices: 4/8 invertible, general matrices: 6/16 | Pass; symmetric law required (r4) |
| Pell graph criterion | primes 5,13 and 5,41 | Symbols −1,+1; first Laplacian rank 1 and 8²−65=−1; second rank 0 gives no conclusion | Pass; graph criterion one-way (r4) |
| Pell pattern equidistribution route | t=2, off-diagonal pair | Diagonal character sum O(PQ); off-diagonal conductor q₁q₂ gives O(Q log(2Q)); Cauchy yields P√Q+√P Q^(3/2)√log(2Q) | Pass; hyperbolic cutoff handled (r4) |
| Polynomial embedding metric | X²+1; X²−2 | Gram diag(1,1) and diag(2,4); counting both complex embeddings would double first | Pass; unweighted complex-pair convention (r4) |
| General reduced Gram basis | diag(1,2),diag(2,1),diag(1,1) | First reduced and strong; second fails first minimum; third reduced but swap gives a second basis | Pass; signs and ties retained (r4) |
| Monic quasi-reduction | X²+1/4; dilation ρ=2,3 | Gram diag(1,1/4) fails fixed-first minimum; at ρ=2 tie diag(1,1), at ρ=3 strong diag(1,9/4) | Pass; not universal quasi-reduction (r4) |
| Binary quasi-reduction | x²+2xy+3y²; x²+y²/4 | Substitution x↦x−y gives x²+2y²; second has discriminant −1 and a primitive vector of norm²≤1/2<1 | Pass; restricted change group (r4) |
| Polynomial/binary dilation laws | ρ=2 | Monic basis scales (1,2,4,…); binary order basis scales (1,2,2,…), not overall homothety | Pass; none (r4) |
| Squarefree field discriminant implies S_n | quadratic Δ=5; cubic Δ=−23 | Normal-closure degrees 2!=2,3!=6; ramified inertia is transposition | Pass; degree≥2 and squarefree required (r4) |
| Monic finite-modulus sieve | H=10,q=4,residue 0 in second coefficient | Count 49 versus length/q main term 50; q=1 gives 199 versus 200 | Pass; fixed-modulus boundary O(1) (r4) |
| Weak quasi-reduction | root expansion on compact separated set | Gram–Schmidt degree-j lengths scale ρ^j; X²+1/4 crosses first-minimum obstruction only after ρ≥2 | Pass; threshold depends on region (r4) |
| Strong reduction ring fibres | independent signs; tied X²+1 | At least 2^n sign variants; tied quadratic also admits swap, so literal basis uniqueness fails | Pass; quotient by signs stated (r4) |
| Trace-slice translation | X²−9 translated by 1 | X²+2X−8 has Δ=36; modulo 4 and 9 both sides 0; repeated roots give 0=0 | Pass; owned identity uses real pinned inputs (r4) |
| Trace-slice local squarefree density | n=2,a=0 and a=1 | Δ=−4b gives κ₂=0; Δ=1−4b gives κ₂=1 and odd factors 1−p⁻²; product 8/π² | Pass; positive density not assumed on trace zero (r4) |
| Trace-slice tail | fixed polynomial with Δ=36 | No p>6 has p² dividing Δ; translation preserves Δ, averaging loses exactly one height power | Pass; no arbitrary-lattice tail assumed (r4) |
| Short-generator upper bound | n=2,3 | Trace normalization leaves growth exponents 2,5 rather than full polynomial-box exponents 3,6 | Pass; translations accounted for (r4) |
| Regular monic region and dilation | roots ±1,±i; repeated roots; D₂D₃ | C=1,c=2 for both simple examples; c=0 for repeated roots; coefficient pair (1,2) maps to (6,72) | Pass; signature/open-region controls (r4) |
| Root-separation junk cases | n=0,1 | Empty tuple makes separation vacuous; lone zero root satisfies upper bound 0 but not −1 | Pass; n≥2 in field theorem (r4) |
| Regular monic sieve | degree 2,3; forced p² divisibility | Dilation volumes Y³,Y⁶; forced bad residue gives local density 0 | Pass; positivity hypothesis discriminates (r4) |
| Separated-generator multiplicity | n=3,Y>K | abs(m₂)≤K/Y<1 gives integer m₂=0; m₀ has O(Y) choices, not O(1) | Pass; integrality and separation essential (r4) |
| Monogenic field lower bounds | n=2,3 | Discriminant exponents 1,5/6; generator exponents 2,5; Y⁶/O(Y)=Y⁵ | Pass; signatures and full region retained (r4) |
| Monogenic prediction | n=2 negative control | C₂=1/2 would give 1/(2ζ(2)), true quadratic coefficient 1/ζ(2) | Pass; conjecture restricted to n≥3 (r4) |
| Binary local factors and sieve | discriminant scale t, n=3,4 | Δ scales t⁴,t⁶; polynomial counts scale t⁴,t⁵; local forced p² factor gives 0 | Pass; all-prime sieve contract (r4) |
| Binary arithmetic Bertini | nonsquarefree local residue | Density 0 when one p² is forced; nonzero local densities are required before field conclusions | Pass; no arbitrary local prescription (r4) |
| Regular binary region | nonzero discriminant compact set | Root collisions force Δ=0 and leave compact region; bounded positive minimum of abs(Δ) excludes them | Pass; none (r4) |
| Binary invariant-order fibres | fixed n, ±equivalent models | Integral order is unchanged under permitted action; number of distinct generator orbits bounded by C_n, not one | Pass; finite-rank unit-equation input (r4) |
| Compact binary transporters | n=2,xy; n≥3 | diag(u,u⁻¹) fixes xy for arbitrarily large u; for n=3,4 vanishing high weights would force repeated roots | Pass; n≥3 essential (r4) |
| Binary field lower bound | n=3,4,5 | Exponents (n+1)/(2n−2)=1,5/6,3/4; even n=4 remains conditional | Pass; no unsupported even theorem (r4) |
| Alternating-extension transfer | n=3; complex conjugation | A₃=C₃; sign kernel has index 2; two disjoint transpositions are even but nontrivial at infinity | Pass; totally real condition in real route (r4) |
| Unramified alternating lower bound | n=3,5; finite multiplicity | Exponents 1,3/4; at n=3 coarse field-label multiplicity bound 2^(3!)=64 is finite | Pass; no infinite fibre division (r4) |
| All fields degree≤5 | n=2,3,4,5 | n=2 quadratic coefficient 6/π²; cubic 1/(3ζ(3)); quartic D₄ adds a linear term; quintic bad local mass decays (11/12)^k→0 | Pass; S_n not substituted for all quartics (r4) |
| Tame nonabelian local mass | G=S₃,V₄,1 at s=0 | Pair counts/automorphisms 12/6=2,12/4=3,1; N+1=2,3,1 | Pass; nonabelian/trivial controls (r4) |
| Support character and marking arguments | singleton involution, identity, empty set | Singleton involution may satisfy disjointness; identity and empty spin set violate the stated nontriviality conditions; group marking changes label count by Aut factor | Pass; not unrestricted sets (r4) |

### Ownership

- The deleted local target and AnalyticNumberTheoryPartII §5.7a no longer duplicate each other. This roadmap now owns no residue bound.
- The relative class-torsion bound of AnalyticNumberTheoryPartII §5.7, `|ker Nm|≪…`, is the unweighted form. The small-split-prime target needs the regulator-weighted comparison `(R_L/R_K)h(L/K)≪…` (publisher Lemma 2.4, first statement), which the supplier does not state. Owning that comparison here is therefore not a duplication; only its regulator-ratio input is owned elsewhere (R03).
- `scratch/overlaps.md` lists no other open pull request that changes this roadmap.

## Not verifiable

- Stark, *Some effective cases of the Brauer–Siegel theorem*, Invent. Math. 23 (1974). The README no longer cites it, because the target that cited it is deleted. The board manifest's entry `stark1974`, recorded as `uncertified` (paywalled), still names that target in its `cited_for`. Nothing in this roadmap depends on the text now.
- Friedman–Skoruppa [FS99], the source of the regulator-ratio bound in R03, was not read. The finding rests on [95]'s use of it (publisher line 459) and on the supplier's statement.

## Source issues

- **Misprint** in ref95 at Lemma 2.1, publisher p.7 (line 324), and its proof on p.9 (lines 431, 460): the source defines d as [L:ℚ] in the statement, but the proof sets d=[L:K], and the final bound through Lemma 2.4 gives the Disc(K) exponent with [L:K]; it should use [L:ℚ] in the θ range and [L:K] in the exponent of (2.1); affects nothing.
- **Gap** in ref95 at Lemma 2.4, publisher p.8 (lines 380–387): the proof bounds h(L)R(L)/(h(K)R(K)) by the Brauer–Siegel theorem without saying it needs an upper bound for κ_L and a lower bound for κ_K, the latter ineffective in general; it should name both residue bounds; affects nothing. (The previous round recorded this under the preprint's numbering, Lemma 2.5.)
