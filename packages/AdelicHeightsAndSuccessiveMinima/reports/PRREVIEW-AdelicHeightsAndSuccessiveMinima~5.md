# Review of AdelicHeightsAndSuccessiveMinima (pull request #2883 at 70287a7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** Accepted, with no finding: the four theorems of `Suggested.lean` hold on every instance I computed, including the empty index type, the zero subspace and bodies with empty interior, and the two halves of Minkowski's second theorem over `K` follow from the two real halves in the pinned Tau Ceti by the three comparisons, which I rederived for a general balanced body. Every Check of 2.5a and 3.1 was recomputed and is true, the three Bombieri–Vaaler locators agree with the text, and every cross-roadmap citation resolves. Four small corrections and one format note remain, none blocking: the description describes an earlier head, the family index credits this roadmap with duality and extension behaviour that it cites, one clause of 2.5a has a supplier that no *Needs:* line names, and one hypothesis of the lower bound is implied by another. The human reviewers are asked about the family's end theorem and about two roadmaps carrying one proof.

## C01 — The description describes an earlier head

Three passages of the description are contradicted by this head, so a reader of the pull request gets the wrong deliverables.

- The second paragraph ends "Its headline theorems are these." and nothing follows. It would read: "Its headline theorems are the values of the adelic subspace height at `A = 1` and on the whole space, and the two halves of Minkowski's second theorem over `K` for balanced bodies."
- "`Suggested.lean` states 6 headline theorems … (`adelicSubspaceHeight_span_image`, `adelicSubspaceHeight_eq_mul_euclideanDual` and others); its docstring says which other headlines are not statable". The file declares four theorems and four definitions, neither of the two names quoted, and its docstring (lines 12–14) says both headlines are statable. It would read: "`Suggested.lean` states 4 theorems with `sorry` proofs (`adelicSubspaceHeight_one`, `adelicSubspaceHeight_top` and the two halves of Minkowski's second theorem over `K`) and 4 definitions with real bodies; its docstring lists the clauses of 2.5a and 3.1 that it does not state."
- "This roadmap gives that height a name and its elementary API, and it extends Minkowski's second theorem …" is accurate, but the description names no supplier. The suppliers at this head are DiophantineApproximationAndTranscendence §§0.0, 2.5, 2.8 and SubspaceTheorem §§4.1–4.2, both on main, and the comparison clause of 2.5a reads ArakelovGeometryAndAbelianHeights §§1.12, 1.14; a sentence saying so would replace "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first", which is true of no supplier of this roadmap.

## C02 — The family index credits this roadmap with the duality and the behaviour under extension

The entry for this roadmap in the family index (family `README.md`, lines 56–58) reads "adelic heights of vectors and subspaces for an adelic presentation, with their duality and behaviour under extension". A reader of the index therefore looks here for the dual-height identity and the extension invariance. This README says the opposite in its scope section (line 196): both "are DiophantineApproximationAndTranscendence §2.5", and "2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity and adds nothing to them".

The entry would read, for instance: "the adelic heights of vectors and subspaces written out over every finite extension, with their elementary properties, and Minkowski's second theorem over number fields for balanced bodies."

## C03 — The comparison with the Arakelov height is a target of 2.5a whose supplier no *Needs:* line names

The *Standard data* bullet of 2.5a (lines 45–48) asks, under "Provide:", for the identification of `log adelicHeight A x` with the height of ArakelovGeometryAndAbelianHeights §1.12 for `O(1)`, and for `A = 1` with the Fubini–Study degree of its §1.14 divided by `[K:ℚ]`. The *Needs:* line of 2.5a (lines 81–82), the Dependencies of Layer 2 (line 99) and the supplier contracts do not name ArakelovGeometryAndAbelianHeights, and the list of what 2.5a owns (line 194) does not mention the clause. An implementer reading the dependencies does not learn that this clause needs §1.12's height of points.

The clause itself is true where I computed it: for `K = ℚ`, `A = 1`, `x = (1, 1)`, `log adelicHeight = ½ log 2`, and §1.14 gives the Fubini–Study degree `log √2` with `[K:ℚ] = 1`; for `K = ℚ(i)` the degree is `2·log √2` and the quotient by `[K:ℚ] = 2` is again `½ log 2`. The supplier is on main and earlier in the merge order. The smallest repair is to add "ArakelovGeometryAndAbelianHeights §§1.12, 1.14 (the comparison only)" to the *Needs:* line and the Dependencies, with a `### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights` line in the contracts; or, if the sentence is a remark, to move it out of the list under "Provide:".

## C04 — In the lower bound, symmetry is implied by balancedness

In 3.1 (line 107) and in `covolume_le_prod_successiveMinimum_pow_mul_measure_of_isBalancedOverCompletions` (`hBsymm`, line 129 of `Suggested.lean`), the hypothesis that `B` is symmetric follows from `IsBalancedOverCompletions B` with `a = −1`, whose norm at every infinite place is `1`. The statement is true with or without it. It could be dropped from the lower bound, or kept with a clause saying that balancedness implies it.

## N01 — The ordering `μ_0 ≤ ⋯ ≤ μ_{n−1}` in the overview needs `0` interior to `B`

Headline (2) of the overview (line 7) writes the minima as ordered for every compact convex symmetric `B`, before the interior hypothesis is added. For `K = ℚ`, `Λ = ℤ²` and the segment `B = [−1, 1] × {0}`, the definition gives `μ_0 = 1` and, no dilate holding two independent vectors, `μ_1` the infimum of the empty set, which the Lean definition reads as `0`. The upper bound still holds there, as `0 ≤ 4`, because `vol B = 0`. A clause such as "ordered when `0` is interior to `B`; otherwise `vol B = 0` and the bound is trivial" would say so.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.5a (sample), definition of `adelicHeight` | `ℚ`, `n = 2`, `A_∞ = diag(1, e^(−c))`, `x = e₂`; `ℚ(i)`, `A = 1`, `x = (1,1)`; `ℚ`, `n = 1`, `A_∞ = 2` | `e^(−c)`; `(√2)^(2/2) = √2` (exponent `1/[K:ℚ]` would give `2^(1/4)`); `2·|x|·∏_p |x|_p = 2` | Checks hold |
| `adelicHeight`, Lean body against the display of 2.5a | exponent at infinite `w`; finite norm; `x = 0`; empty row index | `(Σ‖·‖²)^(mult/(2[L:ℚ])) = ‖·‖₂^(mult/[L:ℚ])`; Mathlib's norm is `N(v)^(−v(x))`; value `0`, as `height2 0 = 0`; `⨆ ∅ = 0`, excluded since `finrank U ≤ card ι` | agrees |
| `adelicSubspaceHeight_one` | `U = ⊥`; `U = ⊤`; `ℚ·(1,1)`; minors of `1` | `1` vs `subspaceHeight ⊥ = 1`; `1` vs `1`; `√2` vs `√2`; `det 1[I,J] = δ_IJ`, so the height is `height2` of the Plücker vector | holds |
| `adelicSubspaceHeight_top` | `ι` empty; `ℚ`, `A_∞ = diag(1, e^(−c))`; `L/K` general; `A = 1` | `1` vs `ideleNorm 1 = 1`; `e^(−c)` both; `Σ_{w∣v} mult(w) = [L:K]·mult(v)`, `∏_{w∣v}|a|_w = |a|_v^[L:K]`, exponent `mult(v)/[K:ℚ]`; `1 = subspaceHeight ⊤` | holds |
| 2.5a, `Λ^p A` acts on Plücker vectors as written in Lean | Cauchy–Binet on `X·Aᵗ`; `p = 1` | `det((XAᵗ)[·,I]) = Σ_J det A[I,J]·y_J`; `p = 1` gives `A x`, so a line has the height of its vector | agrees |
| 2.5a, first absolute minimum from the product bound | `n = 2, 3`; `μ_1^n ≤ ∏μ_i ≤ 2^(n(n−1)/2)·|det A|` | constant `2^((n−1)/2)`: `√2 = √2` at `n = 2`; `2 > √3` at `n = 3` | "not a consequence for `n ≥ 3`" holds |
| 2.5a, comparison with Arakelov §§1.12, 1.14 (C03) | `ℚ`, `x = (1,1)`; `ℚ(i)`, `x = (1,1)` | `½ log 2` vs `log √2 / 1`; `½ log 2` vs `2 log √2 / 2` | holds |
| 3.1 (sample), definition of `μ l` against SubspaceTheorem §4.2 | `ℤ ⊂ ℚ`, `[−1,1]`; `l ≥ card ι`; segment in `ℝ²` | `μ_0 = 1`; `sInf ∅ = 0`, §4.2's value; `μ_1 = 0` (N01) | agrees |
| 3.1, `λ l ≤ μ l` and `μ l ≤ λ (d l)` | `ℚ(i)`, `ℤ[i]`, rectangle `ε < 1` | `λ_0 = 1 ≤ μ_0 = 1 ≤ λ_0`; `d·l + 1` real-independent vectors span `K`-dimension `≥ l + 1` | holds |
| 3.1, `λ (d(l+1) − 1) ≤ c_K·μ l` | general balanced `B`; `ℚ(i)`, rectangle | `ω_j/c_K` has norm `≤ 1` at each place, so `ω_j x ∈ c_K t·B`; rectangle: `1/ε ≤ 1` fails for `ε < 1` | needs balancedness, as stated |
| Lower bound (Lean) | `ℤ`, `[−1,1]`; `ℤ²`, disc; `ℤ[i]`, rectangle; `ι` empty | `2 ≤ 2`; `2²/2! = 2 ≤ π`; `2 ≤ 4ε` fails for `ε < ½` (not balanced); `covol = vol{0}` | holds; negative control correct |
| Upper bound (Lean) | `ℤ`, `[−1,1]`; disc; `B` with empty interior; `ι` empty | `2 ≤ 2`; `π ≤ 4`; `vol B = 0`, so `0 ≤ 2^(dn)·covol`; equality | holds without interior |
| 3.1, Bombieri–Vaaler comparison (sample) | Theorem 3; (3.16); Theorem 6; convex product body | open, bounded, convex, symmetric factors, p. 18; (3.16) p. 22; Theorem 6 p. 23; convex and circled gives `a·x = |a|·(αx) ∈ S` | matches lines 126–130 |
| Closed disc is balanced and not an approximation body | `K = ℚ`, two variables | `|a| ≤ 1` keeps the disc; Tau Ceti's `approxBody` is `{|L_i z| ≤ Q^(c_i)}`, a parallelogram for two independent forms | holds |
| `IsBalancedOverCompletions` implies symmetry (C04) | `a = −1` | `normAtPlace w (−1) = 1 ≤ 1`, so `−x ∈ B` | redundant hypothesis |

- Source locators checked against the text: 3 (BombieriVaaler1983 lines 325–356, 511, 517–523: Theorem 3 on p. 18, condition (3.16) on p. 22, Theorem 6 on p. 23).
- Library declarations opened at the pins: Tau Ceti `NumberTheory/Height/Arakelov/Basic.lean:65` (`height2`), `Height/Arakelov/Absolute.lean:52`, `Height/Arakelov/Subspace/Basic.lean:86, :292, :322, :349`, `LinearAlgebra/ExteriorPower/Plucker.lean:104`, `Global/Ideles/Norm/Basic.lean:283`, `Global/Adeles/Extension.lean:184`, `Height/Twisted/Determinant.lean:45`, `Algebra/Module/ZLattice/SuccessiveMinima.lean:111`, `GeometryOfNumbers/MinkowskiSecond.lean:626, :728`, `LinearIndependent/Extraction/Basic.lean:106`, `CanonicalEmbedding/MixedImage.lean:120`, `Subspace/ApproximationDomain.lean:141, :224`; Mathlib `NumberField/Completion/FinitePlace.lean:156, :183`, `NumberField/House.lean:38`, `NumberField/ProductFormula.lean:98`, `CanonicalEmbedding/Basic.lean:319`.
- Cross-roadmap citations resolved: DiophantineApproximationAndTranscendence §§0.0, 2.5 (both paragraphs on adelic heights), 2.8 on main; SubspaceTheorem §§4.1–4.3 on main and §4.2 at its open revision; ArakelovGeometryAndAbelianHeights §§1.12, 1.14 on main; GlobalNumberFields Layers 6 and 8 on main and at its open head; SuccessiveMinima §2.1 on main; SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.1, 4.3, 4.3a and HeightsForLogSingularMetrics §4.3b at their open heads.
- The pinned Tau Ceti has no successive minimum over `K`, no adelic height and no Minkowski theorem over `K`; only this pull request declares `adelicHeight`, `adelicSubspaceHeight` or `IsBalancedOverCompletions` among the open roadmaps.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else. The eight elaborated types were compared with the README; no binder is lost. One-tactic probe: `simp` and `rfl` close none of the four theorems.
- Outside the roadmap folder the pull request changes only the three files of the family index.
- No `set_option`, no sorried data, one `import Mathlib` followed by five Tau Ceti modules that exist at the pin.

Overlap check: read SlopesOfHermitianVectorBundles (#2880), SubspaceTheorem (main and #2678), HeightsForLogSingularMetrics (#2894, §4.3b), GlobalNumberFields (main and #1339), SuccessiveMinima (main), DiophantineApproximationAndTranscendence (main); ChowFormsAndHeightsOfSubvarieties (#2891) was not read. The height `H_A`, its extension invariance, the absolute minima and the dual identity: DiophantineApproximationAndTranscendence §2.5, cited. The `K`-minimum and Minkowski's theorem over `K` for approximation bodies: SubspaceTheorem §4.2, cited, unchanged at its open revision. The real Minkowski halves and the extraction lemma: DiophantineApproximationAndTranscendence §§0.0, 2.8, in Tau Ceti, cited. The single-vector bound with constant `√n`: HeightsForLogSingularMetrics §4.3b, named and not stated here. The balanced-body statements of 3.1 and the elementary properties of 2.5a: this roadmap only.

Source independence: 7 passages compared with 1 source (BombieriVaaler1983) and with the two roadmap texts they cite, none shared beyond formulas; largest share BombieriVaaler1983, 3 of 4 locators; contents compared with BombieriVaaler1983: independent (its section III is one adelic theorem with its proof; Layer 2 has no counterpart there and Layer 3 is organised by the comparison with the real minima).

Research link: 3.1 extends the adelic Minkowski second theorem of Bombieri and Vaaler (1983, Theorems 3 and 6) to bodies balanced over the completions; 2.5a writes out the twisted height of Roy and Thunder's absolute Siegel lemma (1996). Rests on the README's References and on the Bombieri–Vaaler text.

## Not verifiable

- Roy and Thunder, An absolute Siegel's lemma (1996): not in the manifest and not in the sources cache; cited only through DiophantineApproximationAndTranscendence §2.5, so the remark of 3.1 on the fixed-field basis estimate (lines 137–140) was checked against §2.5's text only.
- Bombieri and Gubler, Heights in Diophantine Geometry (2006), Appendix C.2: no legal copy; cited only through SubspaceTheorem §4.2.
- The sentence of 3.1 on what the formal proof the family follows uses (lines 141–142): that proof was not read.
- The existence of a vector with `adelicHeight A x ≤ e^ε·√n·|det A|_𝔸^(1/n)` (lines 62–64): stated as a fact owned by HeightsForLogSingularMetrics §4.3b, whose source was not opened; only the comparison of constants was computed.

Automatic checks set aside as false positives: none.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 3–17) takes the Riemann hypothesis for Dirichlet L-functions as its end theorem and follows a formal proof announced on 20 November 2026, linked as a remark and a repository; no refereed source is given.
- Scope: this sub-roadmap's own statements rest on Bombieri–Vaaler (1983), Roy–Thunder (1996), Bombieri–Gubler (2006) and roadmaps on main; README line 141 says the formal proof needs none of 3.1's statements over `K`.
- Ownership: SubspaceTheorem §4.2 (main) proves Minkowski's second theorem over `K` for approximation bodies and 3.1 proves it for all balanced bodies by the same route (README lines 103, 134–136); whether 3.1 belongs in a second part of SubspaceTheorem is yours to decide.
- Not tested: Roy–Thunder (1996) and Bombieri–Gubler (2006) could not be read; they are cited only through other roadmaps' sections.
