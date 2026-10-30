# Review of TemperleyLiebOperatorAlgebras (pull request #867 at 07aa343)

**Verdict:** accepted

No findings. This is an incremental re-review of 73 changed lines since 1b7e786. All five previous findings are repaired; no blocking regression was found in the changed passages or their dependent statements. The gate, targeted build, direct elaboration and dependency check pass. This verdict means ready for human final approval, not AI approval or merger.

## Previous findings

- R01 — repaired: README lines 720–723 and 738–739 give two simples at δ = 1, distinguish them by odd Hom vanishing, and retain the ℤ/2 fusion rule. Lines 580–581 and 684–690 distinguish the strand category and its envelope.
- R02 — repaired: README lines 776–783 restrict the ordinary adjacent-generator relation to n ≥ 3. Lines 797–802 give the two-strand essential-circle-square law, its standard-module action and the zero action on the top-through-string module.
- R03 — repaired: README lines 219–225 distinguish the supplier's weighted trace from this roadmap's normalized trace and give both Markov factors correctly. Line 434 now tests the unnormalized trace against unit weights.
- R04 — repaired: README lines 604–606 place the cup-then-cap composite in End(0) and separately give the cap-then-cup values in End(2). Both signs and domains agree with the declared composition convention.
- R05 — repaired: README lines 878–883 separate the Erdmann–Green citation from the exceptional zero head, now checked directly. Lines 985–989 use w for the source's twist v, distinguish its u, and derive Z = w³.

## Verified sound

**Scope and counts.** 27 inherited adversarial rows and 18 fresh rows; 0 findings.  Reviewed the README's 49 inserted and 24 deleted lines, their trace, dagger, fusion, affine-module and determinant dependencies, and the unchanged Lean acceptance test. All five prior findings were revisited. Of the fifteen seeded targets, changed portions of 1.4, 3.1, 3.4, 4.1, 4.4 and 4.6 were checked afresh; other portions retain the explicitly attributed evidence from [the preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md). No full re-review of untouched sections is claimed. Read the repository-root README and CONTRIBUTING and the main-branch PivotalSpherical and GrothendieckEulerForms roadmaps for form and contracts.

**Gate and elaboration.** The worker's gate records all checks, including build, as zero failures. The fresh rerun reports:

```text
gate TemperleyLiebOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Built the imported module `TauCeti.Algebra.TemperleyLieb.MarkovTrace` first. Then `lake build TauCetiRoadmap.TemperleyLiebOperatorAlgebras.Suggested` and direct `lake env lean` elaboration both exited 0, with only the intended `sorry` warning at `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/Suggested.lean:56`. There is one theorem, no local definition or instance, no sorry'd data and no option override. Imports, namespace and module docstring satisfy the form rules. The outside-folder diff is empty; the worktree remains clean at the requested head.

A scratch copy with `#check @TauCetiRoadmap.TemperleyLiebOperatorAlgebras.markovTrace_neg_one_pow_nonneg_iff` elaborated successfully. All binders survive: δ < 0, the unit q and its loop equation, star-ring and conjugate-scalar instances at every level, and generator fixation. Its conclusion is signed trace nonnegativity iff the stated Jones parameter condition. No binder or generality changed. Three scratch one-tactic attempts, `simp`, `rfl` and `infer_instance`, all failed to close the theorem. The inspected library has no positivity-classification theorem supplying it by a single `exact`.

**Headlines.** README lines 21–29 name negative-parameter positivity; the unitary category with C*-tensor structure, duality and fusion; affine simple-module classification; and the affine Gram determinant and composition factors. The first is stated at Suggested.lean:56. The docstring names the unavailable diagram, cell, quotient, C*-category, Bratteli and affine carriers for the others and the Layer 1 comparisons. No new stand-in or padding was introduced. Unchanged headline-coverage judgments are carried from the preceding review.

**Dependency check.** Reran the prescribed movable check against the supplied order and main checkout:

```text
depcheck: 203 roadmaps, 1360 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All seventeen Needs paragraphs were reread. The repair changes no supplier direction or ownership. It imports Subfactors' weighted path trace and translates its normalization.

**Supplier resolution and ownership.** Reopened all seven named supplier roadmaps using `roadmaps show` against their provided open heads or main. Locations below refer to each supplier's `TauCetiRoadmap/<Name>/README.md`, without the tool's extra header line.

- Subfactors 3.1–3.3, lines 676–830: conjugate-linear adjoint, positivity, path models, weighted trace, Jones quotients, expectations and C*-tower. Lines 788–790 give the weighted trace; lines 799–802 give both Markov normalizations, including δ⁻² for the normalized trace. The repaired contract matches.
- TemperleyLieb Layers 0–7, lines 254–905: quantum integers, matchings, diagram category, reflection, presentation comparison, trace, cellular forms, negligible ideal and fusion quotient. Lines 708–710 contain the planned `IsMarkovTrace.apply_jonesWenzl`, resolving the worker's sole citation lead: it is a supplier target, not a claimed pinned declaration. Lines 934 and 937–940 agree on cup/cap order and two simples at δ = 1.
- CategoricalOperatorAlgebras CA1a, lines 152–181, and CA2a, lines 302–326: C*-Hom norms, linking algebras, additive/projection completion and balanced unitary duals. General constructions remain there; this roadmap supplies the Temperley–Lieb instance.
- CStarAlgebras C1–C5, especially lines 546–607: matrix and CP interfaces, spatial tensor products, matrix amplification and directed C*-inductive limits. CStarClassification 2.1–2.2, lines 351–384: AF presentations and Bratteli diagrams.
- PivotalSpherical Layers 0–4, lines 257–403 on main: dual functors, pivotal/spherical structures and explicit fusion hypotheses. GrothendieckEulerForms Layer 2, lines 238–270 on main: abelian Grothendieck groups and short-exact relations.

Fresh `roadmaps grep` searches by weighted path traces, unitary Temperley–Lieb categories, affine Temperley–Lieb algebras and positivity signatures agree with the preceding ownership audit. Subfactors leaves the unitary category and affine theory here; TemperleyLieb leaves annular/affine material outside its ordinary diagram development. Positive-parameter headlines belong to Subfactors; this folder alone declares the negative-parameter headline. The local board-package search and supplied package index reveal no competing owner for the changed objects. No new fully qualified Lean name was introduced.

**Pinned declarations.** At Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, declarations used to check the repairs and Lean statement were opened or located directly:

- `TauCeti/Algebra/TemperleyLieb/Basic.lean`: presented carrier 132, `lift` 196, `lift_e` 209, `hom_ext` 215, `adjoin_range_e` 222, `strandIncl` 233, `strandIncl_e` 239, `aug` 246, `algEquivOfLeOne` 270 and `e_ne_zero_two` 305. These provide the ordinary presented algebra, not the affine carrier.
- `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`: `markovTrace` 452, `markovTrace_one` 462, `markovTrace_mul_comm` 468, `markovTrace_strandIncl` 486, `markovTrace_strandIncl_mul_e_last` 494. Scaling its generator and unnormalized trace gives the repaired factors.
- `Mathlib/Algebra/Star/Basic.lean`: `StarRing` 292 and `StarModule` 420; the latter conjugates scalars. `Mathlib/Analysis/Complex/Order.lean`: `Complex.le_def` 57 and `Complex.nonneg_iff` 63; nonnegative complex numbers have zero imaginary part.
- Reconfirmed unchanged carrier references: `AbelianK0`, `of`, `of_shortExact`, `of_biprod` at `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`:79,94,108,127; `IsDiscreteValuationRing` at `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56; Chebyshev T and S at `Mathlib/RingTheory/Polynomial/Chebyshev.lean`:67,627; Karoubi at `Mathlib/CategoryTheory/Idempotents/Karoubi.lean`:43; Mat_ at `Mathlib/CategoryTheory/Preadditive/Mat.lean`:62; TwoSidedIdeal at `Mathlib/RingTheory/TwoSidedIdeal/Basic.lean`:36; RingCon.Quotient at `Mathlib/RingTheory/Congruence/Defs.lean`:190.

**Sources checked afresh.** Four legal texts were retrieved through the sources service, without editing a manifest or copying source text into the worktree.

- erdmann-green-1999 line 90–94: positive-loop convention and n ≥ 3; line 164–171: Proposition 2.2.4, preprint p. 5; line 338–352: 2.5.5–2.5.6, preprint p. 9. These verify the sign correction and restricted generator and winding-root citations. Its standing δ ≠ 0 makes it auxiliary support, not certification of the full zero-parameter classification. That remains assigned to Graham–Lehrer and the direct zero-Gram computation.
- graham-lehrer-2003 line 346–380, printed p. 488: negative-loop convention, generator relations and rotation. The two-strand essential-circle law is checked by gluing and the matrices below, not inferred from an ordinary adjacent-generator relation.
- chen-tl-skein line 1723–1735, Theorem 5.4.4, printed p. 44, and line 1940–1941, Theorem 5.4.5, printed p. 47: truncated range and labels 0 through m−2. Line 2032 explicitly gives the m = 3 labels. UTL here is the strand wrapper of 3.1; End(n) = ℂ is not applied to arbitrary sums in its envelope.
- morinduchesne-saintaubin-2013 line 22, line 1275–1296 (Proposition 4.3, equation (29), printed p. 24) and line 1606: u determines the loop value, v is the per-site twist, α = vᴺ + v⁻ᴺ for positive defect number. With v renamed w and N = 3, this gives Z = w³. The added factor conversion is computed below.

For unchanged seeded locators, retain the preceding review's evidence: 1.1 and 1.4, penneys-uqsl-ch4 line 557–608; 1.2, ridout-saintaubin-2014 line 1120–1162; 1.3, penneys-uqsl-ch4 line 712–749 and iohara-lehrer-zhang line 122–128; 2.2, penneys-uqsl-ch4 line 941–1009; 3.2–3.3, named supplier interfaces and explicit diagram calculations; 4.2, graham-lehrer-2003 line 398–400 and the uncertified Graham–Lehrer definitions; 4.3, erdmann-green-1999 line 344–347 and Gram anchors; 4.5, the settled uncertified locator; 4.6, morinduchesne-saintaubin-2013 line 1115–1119,1275–1296 and chen-przytycki-2008 line 33–99. No new textual certification of untouched passages is claimed.

**Adversarial table — changed passages and immediate dependencies.** Matrices act on column vectors. Put A = [[δ,a],[0,0]], B = [[0,0],[a,δ]], a = z + z⁻¹ for the two-strand standard module. Exact rational computations were saved in scratch; other displayed computations are direct diagram or scalar calculations.

| Statement | Instances tried | Values on both sides | Result | Change |
|---|---|---|---|---|
| Loop-parameter conventions, 115–118 | q = −2, q′ = 2 | −(q+q⁻¹) = 5/2 = q′+q′⁻¹; using q instead of q′ gives −5/2 | correct | repaired convention |
| Weighted path trace, 219–220 | δ = 2,3; n = 2 | weights (1,3), (1,8); sums 4 = 2² and 9 = 3² | agrees with T, not τ | repaired notation |
| Unnormalized Markov law, 222 | n = 1, x = 1, δ = 1,2,3 | T₂(p₁) = 1 = δ⁻¹T₁(1) in each case | holds | repaired R03 |
| Normalized Markov law, 223–225 | same inputs | τ₂(p₁) = 1,1/4,1/9 = δ⁻²τ₁(1); old factor gives 1,1/2,1/3 | holds | repaired R03 |
| Unit-weight negative control, 434 | δ = 2, n = 1,2 | unit weights give 1 and 2; required T gives 2 and 4 | distinguishes wrong trace | repaired R03 |
| Dagger and composition, 603–606 | f = i·cup, δ = 2 | f† = −i·cap; f†† = f; f≫f† = 2·id₀; linear dagger gives −2·id₀; other order gives +e versus −e in End(2) | signs and domains correct | repaired R04 |
| Two simples and fusion, 720–723 | m = 3, δ = 1 | labels {0,1}, dimensions (1,1); upper bound min(2,0) = 0; dim X₁² = 1 = dim X₀; dim Hom(0,1) = 0, dim End(1) = 1 | X₁ neither unit nor negligible | repaired R01 |
| Strand-category parity, 738–739 | (n,m) = (0,0),(0,1),(1,3),(2,4), δ = 1 | Hom dimensions 1,0,1,1; each End(n) dimension 1; separately End(X₀⊕X₀) dimension 4 in envelope | wrapper distinguished | repaired R01 |
| Generator squares and rotation, 776–777 | δ = 2, z = 2; τ swaps basis | A² = 2A = [[4,5],[0,0]]; τAτ⁻¹ = B = [[0,0],[5/2,2]]; B² = 2B | holds; this representation need not detect infinite rotation order | added range |
| Ordinary adjacent/distant relations, 777–780 | ordinary three-strand cell block δ = 3,a = 1; disjoint cups on four strands | ABA = A = [[3,1],[0,0]], BAB = B; e₁e₃ = e₃e₁ is the same two cup-cap pairs with loop factor 1 | holds at allowed counts | repaired range |
| Two-strand essential-circle law, 781–783,797–802 | δ = 2,z = 2 | ABA = a²A = [[25/2,125/8],[0,0]], BAB = a²B = [[0,0],[125/8,25/2]]; old A has first entry 2, not 25/2 | two essential circles give 25/4 | repaired R02 |
| Top-through-string control, 801 | W_(2,z)(2), z nonzero | e₁ = e₂ = 0; triple and corrected right side both 0; ordinary TL₂ has one generator and zero adjacent pairs | holds | expanded R02 Check |
| Exceptional even head, 881–883,899–903 | v = z = i; n = 2,4,6 | δ = a = 0; Gram sizes 2²,6²,20²; all 4,36,400 entries 0; ranks and head dimensions 0 | every gluing has a closed component | expanded R05 Check |
| Boundary exclusions | n = 0,z = i; n = 1,3 | empty Gram [1] gives head dimension 1 at n = 0; n = 1,3 have no t = 0 label | n > 0 and even necessary | dependent check |
| Nonzero singular head, 904–905 | v = z = 2,n = 2 | δ = −5/2,a = 5/2; Gram [[−5/2,5/2],[5/2,−5/2]], determinant 0, rank 1, head dimension 1 | singular does not mean zero head | dependent check |
| Twist and loop letters, 985–989 | u = exp(πi/6); (X,w) = (3,2),(2,1) | u²+u⁻² = 1 = −2cos(2π/3); Z = 8,1; X³−3X+Z²+Z⁻² = 5249/64,4 = (w³+w⁻³)²−2−2C₃; wrong Z = w gives 89/4 for first input | adapter correct | repaired R05 |
| Standard-module sizes, 4.2 | (n,t) = (0,0),(1,1),(2,0),(3,1),(4,0) | dimensions 1,1,2,3,6 = C(n,(n−t)/2); top-through-string Gram [1] | agrees with repaired examples | sampled dependency |
| Composition factors, 4.7 headline | n = 2,v = z = 2; v = z = i | dimensions 2 = 1+1 with successor y = 1; at i, 2 = 0+1+1 with successors ±1 and zero t = 0 head | consistent; full theorem remains uncertified | dependent check |

**Adversarial table — inherited rows.** Each following row is carried from [PRREVIEW-TemperleyLiebOperatorAlgebras~2](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md), not claimed as a new computation. The four rows refuted there are superseded above. Numeric examples and exact identities are retained; the two formerly implicit numeric sequences and the quantum-integer lists are made explicit here.

| Statement | Instances | Computed values | Result | Change / evidence |
|---|---|---|---|---|
| `markovTrace_neg_one_pow_nonneg_iff` (headline) | n = 0, 1; δ = −2; δ = −1/2; δ = 0 | n = 0: `T_0(x̄x) = \|x\|²`; n = 1: `−T_1(x̄x) = −δ\|x\|² ≥ 0`; δ = −2: `−T_1(1) = 2`, `T_2(e†e) = δ² = 4`, `−δ = 2` admissible; δ = −1/2: `f_2 = 1 + 2e`, `T_2(f_2) = δ² + 2δ = −3/4 < 0`, `1/2 ∉ J`; δ = 0: all `T_n = 0` for n > 0 yet `0 ∉ J`, excluded by `hδ` | holds, hypotheses exact | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Reduction through `s` | formal | `T^(−δ)_n((sx)†(sx)) = T^(−δ)_n(s(x†x)) = (−1)^n T^δ_n(x†x)`; `s` bijective, so `∀x` on one side iff on the other | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Trace relation `markovTrace(−q)(s x) = (−1)^n markovTrace q x` | n = 1, x = 1; n = 2, x = e | `δ` vs `(−1)(−δ) = δ`; `δ` vs `(+1)·T^(−δ)(−e) = −(−δ) = δ` | holds; the unsigned relation fails at n = 1 | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `s` is a *-isomorphism | generators | `s(e_i)† = (−e_i)† = −e_i = s(e_i†)`; uniqueness of generator-fixing conjugate-linear anti-automorphisms (Subfactors 3.1) | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Gram formula (1.2) with exponent `d_(n,p−j)` | n = 5, t = 1, δ = 7/3 | formula `= 79360000/59049 = [3]⁴(δ²−2)`; wrong exponents `d_(n,j)` give `73290626560000/387420489` | holds; Check discriminates | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `det G_(3,1) = [3]` | δ = 7/3 | `40/9 = 40/9` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `Σ_t #paths_(n,t)[t+1] = δ^n` | n = 0..7, δ = 7/3 | both sides: 1, 7/3, 49/9, 343/27, 2401/81, 16807/243, 117649/729, 823543/2187 | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `#paths_(4,t) = halfCount 4 t` | t = 0, 2, 4 | `2, 3, 1` both; `4 + 9 + 1 = 14` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Bratteli sizes at m = 4 | n = 0..5 | `(1),(1),(1,1),(2),(2,2),(4)`; `dim Q_n = 1,1,2,4,8,16` | holds, `2^(n−1)` | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Weights at m = 5 | — | `[1..5] = 1, 1.618, 1.618, 1, 0`; 3-step paths end at 1 twice, at 3 once; `2δ + 1 − δ³ = 0` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `[1..m]` at `δ = 2cos(π/m)` | m = 3..6 | m = 3: (1,1,0); m = 4: (1,√2,1,0); m = 5: (1,φ,φ,1,0), φ = (1+√5)/2; m = 6: (1,√3,2,√3,1,0) | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 2.2 weights | δ = 2, 3 at level 2 | `(1/4, 3/4)`, `(1/9, 8/9)`, both summing to 1 | holds; two traces on one AF algebra | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Unique trace at `δ = 2cos(π/m)` | m = 4, 5 | `A²` on the parity class `{0,2}` is `[[1,1],[1,1]]`, on `{0,2}` of `A_4` is `[[1,1],[1,2]]`: primitive; `[t]+[t+2] = δ[t+1]` makes `([t+1])` the Perron vector | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `Hom(1,3)` at δ = 1 | — | `dim = 2` (matchings of 4 points), radical spanned by the image of `f_2`, unitary Hom one-dimensional | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `‖e‖ = δ`, `‖e_1 e_3‖ = δ²` | — | `e² = δe`, `(e_1e_3)² = δ² e_1e_3`, projections `e/δ`, `e_1e_3/δ²` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Truncated fusion rule | m = 3: (1,1); m = 4: (1,1), (1,2), (2,2); m = 5: (2,2), (3,3) | `{0}`; `{0,2}`, `{1}`, `{0}`; `{0,2}`, `{0}`; untruncated (2,2) gives `{0,2,4}` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 4.3 Gram n = 2 zero set | `z ∈ {v, v⁻¹, −v, −v⁻¹}`, 5 random `v` | `(z+z⁻¹)² − d² = 0` for all four | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| n = 3, t = 1 determinant | 6 random `(X, Z)` | `det[[X,Z,1],[Z⁻¹,X,Z],[1,Z⁻¹,X]] = X³ − 3X + Z² + Z⁻² = σ F_3^E` with `σ_(3,1) = 1`, `E_(3,3) = 1` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 6×6 affine Gram at n = 4, t = 0 | 8 + 6 random `(d,a)`/`(X,Z)`; `(3,0)`; `(3,3)`; `(3+h,3)` | `det = (d²−a²)⁴((d²−2)²−a²) = σ F_2^4 F_4` with `σ_(4,0) = −1`; `321489 = 9⁴·49`; rank 2; coefficients `h^0..h^5 = 0,0,0,0,51840,143424`, `51840 = 1296·40` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| n = 2, t = 0 formula | 6 random | `σ F_2^1 = X² − (Z+Z⁻¹)²`, `σ_(2,0) = −1` | holds, matches 4.3 | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Telescoping and leading-term identities | all `(n,t)`, n ≤ 11 | `Σ_s a_(n,s) = E_(n,r)`; `Σ_r r E_(n,r) = m·C(n,m)`; n = 4: `2+3+1 = 6`, `2·4 + 4·1 = 12` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))` | r ≤ 8, 5 random `v` | supplemental v = 2, r = 0..8: both sides 2, -5/2, 17/4, -65/8, 257/16, -1025/32, 4097/64, -16385/128, 65537/256 | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 4.7 valuation Check | `F_2(x,v)` at `x = δ` | value `0`; derivative `−2x`, nonzero iff `δ ≠ 0`; at `v = i`: `−x²`, order 2 | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Successor Check n = 2 | `z = ±v^(±1)` | `y = z v^(∓1) = ±1`; coincides with the zero set above | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 1.3 Check δ = 1, n = 3 | quotient by the ideal of `f_2 ⊗ 1 = 1 − e_1` | in the quotient `e_1 = 1`, so `e_2 = e_1e_2e_1 = 1`: the quotient is ℂ, the ideal has codimension 1; `dim Q_3 = 1` (one path of each length on `A_2`), so `R_3` has codimension 1 too, and the ideal, contained in `R_3`, equals it | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| 1.3 Check δ = √2 | n = 3 | 3-step paths on `A_3` from 0 by endpoint `t = 0..3`: `0, 2, 0, 0`; `dim Q_3 = 2² = 4 = 5 − 1` | holds | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |
| Penneys `d < 0` adjoint | `(n,n)`-diagram with k cups, k caps | factor `(−1)^(2k) = 1` | generator-fixing | unchanged; [preceding review](PRREVIEW-TemperleyLiebOperatorAlgebras~2.md) |

## Not verifiable

- graham-lehrer-1998, DOI 10.5169/seals-63902, remains explicitly uncertified and settled. The preceding review records unsuccessful checks of Crossref, e-periodica and legal author/repository copies. Definitions 2.5–2.6, Theorem 2.8, Theorem 3.4, Corollary 4.7 and Theorem 5.1 were not verified against its text this round. The repaired zero-head assertion has the independent computation above; it does not certify the full classification, intertwiner or composition-factor theorems. No duplicate source request was made.
- Carry forward the preceding review's limitation concerning ridout-saintaubin-2014 printed pp. 20–21; that unchanged source was not reopened. The old Erdmann–Green page uncertainty for Proposition 2.2.4 is resolved by the fresh extraction: erdmann-green-1999 line 154–155 marks preprint p. 5, and line 311–312 marks preprint p. 9 for 2.5.5–2.5.6. Journal pagination differs; the checked locators are the cited arXiv preprint's.

## Source issues

- **Misprint** in morinduchesne-saintaubin-2013 at Proposition 4.3, equation (29), printed p. 24: the source gives an unsigned product, yielding α²−β² at N = 2, d = 0; it should include the leading-term sign, yielding β²−α² there; affects nothing (the roadmap supplies the sign; carried from the preceding review).
