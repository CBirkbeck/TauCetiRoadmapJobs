# Review of ArithmeticKTheory (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 67 changed lines since `592bdb1`. The new Layer 9 (Gabber's bound for the torsion in the homology of a based complex) was checked against Soulé's arXiv version 1 at Lemma 1 (p. 5) and Proposition 3 (p. 6). Its statement, proof route and both Checks were recomputed, and the layer record against the merge base, the supplier order and the elaboration of the unchanged `Suggested.lean` were checked. There is no finding. There are three small corrections: Hadamard's inequality is already proved in the pinned Tau Ceti, so 9.1 should cite that declaration and not a `sorry`'d roadmap statement; the opening overview's "last layer" sentence now points at Layer 9; and the description does not say that this roadmap gains a layer and a supplier. There is one format note, and nothing is left for a human to decide.

## C01 — Hadamard's inequality, which 9.1 takes from SuccessiveMinima §0.1, is already proved in the pinned Tau Ceti

Three places take Hadamard's inequality from `orthonormal_coordinate_hadamard`: the *Needs:* line of 9.1 (line 4543), the Dependencies of Layer 9 (line 4555) and the new subsection "From TauCetiRoadmap.SuccessiveMinima" (line 5133). On `main` that name is a `sorry` in `TauCetiRoadmap/SuccessiveMinima/Suggested.lean` (line 187). The pinned Tau Ceti already proves the same inequality, for any finite index type, as `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`, line 77). An implementer who follows the citation reaches an unproved statement, and the roadmap gains a roadmap supplier it does not need.

Naming `OrthonormalBasis.norm_det_le_prod_norm` in the *Needs:* line and the Dependencies, and under "From Tau Ceti", would fix this. The SuccessiveMinima subsection can then be dropped, or kept as a pointer to the statement's owner.

## C02 — The opening overview still calls Layer 8 "the last layer"

Line 56 reads "The last layer's examples include K₂ of two rings of integers". Now that Layer 9 exists, the last layer's examples are `ℤ/b` and the index-5 quotient of `ℤ²`, and the K₂ computations are in Layer 8. "Layer 8's examples include …" would be correct.

## C03 — The description does not say that this roadmap gains a layer and a supplier

The description says "The additions create 12 new supplier relations between general roadmaps" and names two of them. Nothing in it tells a reader of ArithmeticKTheory that the roadmap gains a ninth layer and a new supplier. One sentence would cover it: "ArithmeticKTheory gains Layer 9, Gabber's bound for the torsion in the homology of a based complex of free abelian groups (Soulé 1999, Proposition 3), with Hadamard's inequality from SuccessiveMinima §0.1". If C01 is applied, the end of the sentence would name Tau Ceti instead.

## N01 — The *Needs:* line of 9.1 names no carrier for the complex or its homology

The statement is about `H_k(C_•)`, but line 4543 lists only determinants, linear independence, torsion and the index–determinant theorem. Naming the intended carrier would tell an implementer which form the statement takes. Two options are Mathlib `ChainComplex` with `HomologicalComplex.homology` in `ModuleCat ℤ`, or the kernel of one ℤ-linear map modulo the range of another.

## Verified sound

| Statement | Instance | Values computed (left side / right side) | Result |
| --- | --- | --- | --- |
| 9.1 Gabber's lemma | `ℤ →(×b) ℤ`, degrees 1, 0 | `#H₀_tors = b` / `b^a = b¹ = b` | holds, sharp (Check 1) |
| 9.1 | `ℤ² → ℤ²`, columns `(2,1)`, `(−1,2)` | `#H₀` = absolute determinant `4+1 = 5` / `(√5)² = 5`; max-coordinate norm gives `2² = 4 < 5` | holds, sharp; sup norm fails (Check 2) |
| 9.1, degenerate | `C_(k+1) = 0`, or `d = 0` | torsion order 1 / `b⁰ = 1`, or `b^a ≥ 1` | holds |
| 9.1, `b ≥ 1` needed | `ℤ →0 ℤ`, `b = 1/2`, `a = 1` | torsion order 1 / `(1/2)¹ = 1/2` | fails without `b ≥ 1`; hypothesis present |
| 9.1, `k = 1` with cycles | `ℤ →(2,0) ℤ² →(0,1) ℤ` | `H₁ = ℤ/2`, order 2 / `b = 2`, `a = min(2,1) = 1`, bound 2 | holds, sharp; `tors(coker d₂) = ℤ/2` equals `tors H₁` |
| 9.1, `a` the minimum | `ℤ³ → ℤ²`, columns `(2,0),(0,2),(2,2)` | `#tors = 4` / `b = √8`, `a = 2`, bound 8; route's pair gives `2·2 = 4` | holds |
| 9.1 against Soulé Prop. 3 | `soule-perfect-forms` line 226–241 | Soulé: `b(k) = max(sup‖∂σ‖, 1)`, `a(k) = min` of basis sizes / README: any `b ≥ 1` bounding the norms | same theorem (`b ≥ b(k)` gives `b^a ≥ b(k)^a`) |
| 9.1 route step (Soulé Lemma 1) | `soule-perfect-forms` line 175–182 | Soulé: `#Q_tors ≤ ∏_(i∈I)‖ϕ(e_i)‖` / README: index of `L` = absolute determinant `≤ ∏‖d e_i‖·1`; `B_sat ∩ L = B′` | holds; `B_sat/B′ ↪ C_k/L ↠ tors` |
| Hadamard supplier | SuccessiveMinima 0.1.1 vs Tau Ceti | `‖det_b v‖ ≤ ∏‖v_i‖` (`Fin n`, sorry) / same for finite `ι`, proved, `Hadamard.lean:77` | C01 |
| Layer count, overview | line 69 "nine layers", line 56 "last layer" | headings: Layers 1–9 / "last layer" K₂ examples are in Layer 8 | count right; C02 |
| Layer record | merge base vs head | 8 layer ids at `592bdb1` / all 8 kept, titles unchanged, Layer 9 added | kept |
| `Suggested.lean` | unchanged since `592bdb1` | 7 declarations; elaboration: 4 `sorry` warnings, no error | unchanged; no headline added by the change |

- Source locators checked against the text: 2 (Soulé arXiv v1, cited here as `soule-perfect-forms`, a key the package manifest does not yet have; Lemma 1 p. 5 at `soule-perfect-forms` line 175; Proposition 3 p. 6 at line 240), plus the reference entry's journal data. The seeded sample falls in the change only at 9.1. The other fourteen sampled targets are in untouched, unaffected text and were not re-checked.
- Library declarations opened at the pins: `AddSubgroup.index_eq_natAbs_det` (Mathlib `LinearAlgebra/FreeModule/Finite/CardQuotient.lean:98`), `AddCommGroup.torsion` (additive form of `CommGroup.torsion`, `GroupTheory/Torsion.lean:371`), `InnerProductSpace.gramSchmidtOrthonormalBasis_det` (`Analysis/InnerProductSpace/GramSchmidtOrtho.lean:372`), `HomologicalComplex.homology` (`Algebra/Homology/ShortComplex/HomologicalComplex.lean:89`), Tau Ceti `OrthonormalBasis.norm_det_le_prod_norm` (`Analysis/InnerProductSpace/Gram/Hadamard.lean:77`). Mathlib at the pin has no Hadamard determinant inequality.
- Cross-roadmap citations resolved: SuccessiveMinima §0.1 / 0.1.1 on `main` (README line 195, `Suggested.lean` line 187). SuccessiveMinima does not cite ArithmeticKTheory, so there is no cycle. The consumer BernoulliBoundsForClassGroupEigenspaces §9.2 at this head cites ArithmeticKTheory §9.1 with the same hypotheses (`b ≥ 1`, `a` the smaller rank).
- Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`. Both ends of the new edge are on `main`. No files changed outside `TauCetiRoadmap/`.
- Automatic checks: all passed. `lake env lean TauCetiRoadmap/ArithmeticKTheory/Suggested.lean`: only `declaration uses sorry` (lines 67, 73, 98, 115).
- Overlap check: read ArithmeticKTheoryPartII, GeneralAlgebraicKTheoryPartII, HabiroNumberFields, KTheoryFiniteLocalFields, SchemeKTheoryOperations, CyclotomicClassGroupsAndStickelberger and K2SymbolsBrauerPartII. The list of closest roadmaps by results is empty. Nothing is shared with Layer 9. A search for Gabber's lemma across `main` and the open heads finds no other owner. BernoulliBoundsForClassGroupEigenspaces §9.1 states an ℓ¹ cokernel variant labelled as adapted to its formal proof, and it cites this §9.1 for the based-complex statement. Owner of Gabber's lemma: ArithmeticKTheory §9.1.
- Source independence: changed passages only; 6 passages compared (9.1's statement, its route, its Checks, the scope sentence, the supplier subsection, the reference entry) with 1 source (`soule-perfect-forms`, pp. 5–6). The longest shared run is 6 words ("be a chain complex of free"), which is forced phrasing. The largest share of locators is the K-book, 79 of 193 source-citing lines. The added Layer 9 has no counterpart in the K-book's contents (the K-book has no Gabber torsion bound): independent.
- Research link: §9.1 is the lemma Soulé (1999) combines with Voronoi's complex of perfect forms to bound torsion in `H_k(SL_N(ℤ))` and in `K_m(ℤ)` away from small primes, toward the Vandiver conjecture that the README's Layer 7 table assumes. This rests on Soulé 1999 §§2.2–2.3, pp. 6–9 (read), and the README overview.

## Not verifiable

- The page images of Soulé's arXiv PDF could not be rendered on this host. The locators and the misprint below are read from the PDF's text layer.

## Source issues

- **Misprint** in soule-perfect-forms at §2.2, the display before (15), p. 6: the source expands the boundary of a basis element as `∂(c)` summed over `c′ ∈ Σ_k`, with coefficients indexed by σ, σ′; it should read `∂(σ) = Σ_(σ′∈Σ_k) n_(σσ′) σ′`; affects nothing.

## For the human reviewers

- none
