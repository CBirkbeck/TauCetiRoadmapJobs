# Review of LatticePackingsAndPerfectForms (pull request #1723 at ba416b6)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed since `e69d885`. The README half of the previous R01 is repaired and is correct: every library name the README cites exists at the two revisions it now names. Two findings remain, and neither can be closed by editing the folder's prose: the branch has to merge main (then state the Leech headline), and the description has to name one more supplier.

## R01 (P2) — The branch still pins Tau Ceti `358314d`; the Leech covering-radius headline is statable at the revisions the README names and is absent

Re-raised: the merge step of R01 of the previous report (H01/H02 of the earlier repair reports, answered "not actionable inside the roadmap folder").

**Location:**
- `lake-manifest.json` (unchanged at this head): Tau Ceti `358314d4`, Mathlib `f6090c70`. Main `f8836c4` pins `2fd255d9` and `1b1ccf4b`.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md` 282–285: "The pins are Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`"; 384: `Suggested.lean` states its targets against "the pinned Tau Ceti".
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean` 31–37: the carrier "exists at the Tau Ceti revision `2fd255d9…` that README.md cites and is absent from the earlier revision this file is elaborated against".

**Claim:** the folder now names two different pins. At the one the README declares, `μ(Λ₂₄) = √2` is statable, so the acceptance test must state it; the docstring instead describes the branch's state at the time of writing ("the earlier revision this file is elaborated against"), which is false the moment the folder is on main and is not timeless text.

**Witness:** `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean:236` (`leechLattice`) and `:299` (`isPosDef_leechLattice`) at `2fd255d9`; the directory `Rank24/` does not exist at `358314d4`. The file with the three hunks below elaborates at main's pins: exit 0, 53 `sorry` warnings, nothing else.

**Why the "not actionable inside the folder" answer does not settle it.** It is a reason a repair confined to the folder could not act; the report is addressed to the pull request's author, who can merge. `git merge-tree --write-tree origin/main HEAD` exits 0 at main `f8836c4`, and the diff against main stays the folder's three files.

**Repair:**
1. Merge `origin/main` into the branch. No README line changes: 282–285 become true as written.
2. In `Suggested.lean`:
   - add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic` after the `Discriminant.Quadratic` import;
   - after `kissingNumber_eq_kissingNumber` in `section Lattice`, state

     ```lean
     /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
     any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
     theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
         (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
     ```

   - delete the module-docstring text from "The Leech covering radius" to "indexed by `Fin 24`." and name the theorem in the API of README 3.4.

## R02 (P3) — The description's dependency list still omits ProbabilisticAndMetricNumberTheory

**Location:** the pull request description, "**Depends on** (suppliers still open; they merge first)": #851 and #1001 only. README 2.2 and 4.7 consume ProbabilisticAndMetricNumberTheory §4.9b `mahler_relativelyCompact_iff`.

**Claim:** the description lets this pull request merge before the roadmap that owns Mahler's criterion.

**Witness:** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/` is absent from main `f8836c4`; it is the new roadmap of open pull request #1421 (head `d311ebe`), merge-order line 62 against this roadmap's line 148.

**Repair:** add `- [ ] #1421 ProbabilisticAndMetricNumberTheory` to the depends-on block. The README needs no change.

## Previous findings

- R01 — partly repaired: README 282–285 now reads "The pins are Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…` … cited as it is at those revisions" (correct, see below); the manifest still pins `358314d4` and the Leech headline is unstated. Raised again as R01.
- R02 — not repaired: the description's depends-on block still lists "#851 GeometryOfNumbersAndQuadraticArithmetic" and "#1001 WeightsInEtaleCohomology" only. Raised again as R02.

## Verified sound

**The changed README passage (282–285).** The sentence claims every Tau Ceti and Mathlib declaration, module and file the README names is cited as it is at `2fd255d9` / `1b1ccf4b`. Checked mechanically against those two trees:
- 68 backticked names qualified `TauCeti.…` or `Mathlib.…`: 68 found at `2fd255d9` / `1b1ccf4b`, 0 missing. 18 of them are absent at the branch's `358314d4` (the Leech family of nine, six `IsMinkowskiReduced` declarations, `IsPosDef.minimum_le_mul_determinant_rpow`, `kissingNumber_typeE₈RootLattice`, `ofGramMatrix_singleton_eq_rankOne`), which is exactly why the sentence was needed.
- 204 backticked identifiers containing `.` or `_`: all are declared in `Suggested.lean` or occur in the two trees, except 12 that are not library names: six LMFDB knowl ids (`lattice.covering_radius` and five siblings, README 17–19), `Esc_k` (notation), and five supplier-roadmap target names (`mahler_relativelyCompact_iff`, `minkowski_second_lower`, `lll_short_vector_factor`, `polynomial_fischer_decomposition` with `polynomial_sphere_harmonic_span`), cited with their roadmap and section.
- The five paths at README 41–46 are introduced as "Suggested homes" for this roadmap's own code; they are proposals, not citations, and the sentence's scope (Scope and ownership, supplier tables, Needs lines) does not reach them.
- Declarations opened at `2fd255d9`: `TauCeti.leechLattice` (`Rank24/Leech/Basic.lean:236`, an `IntegralLattice (Fin 24 → ℚ)`), `TauCeti.isPosDef_leechLattice` (`:299`).

**The changed docstring (`Suggested.lean` 31–37).** Its two factual claims are true at this head (carrier present at `2fd255d9`, absent at `358314d4`); the headline it names, `(gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = √2`, is the statement of README 3.4. What is wrong with it is R01. No declaration changed.

**Gate and dependency check.**
- The worker's gate at `ba416b6`: every check 0, `build=0`, OK.
- Dependency check against the candidate order:

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line (GeometryOfNumbersAndQuadraticArithmetic line 55, ProbabilisticAndMetricNumberTheory 62, WeightsInEtaleCohomology 147, this roadmap 148).
- No file is changed outside the folder.

**Elaboration.** `lake env lean` on `Suggested.lean` at the branch's pins: exit 0, 52 messages, all `declaration uses sorry`. The diff changes the module docstring only, so the 112 elaborated types and the one-tactic padding probe of the earlier reports stand. A scratch copy with the R01 hunks, elaborated at main's pins: exit 0, 53 `sorry` warnings.

**Cross-roadmap citations and overlaps.** The diff adds no cross-roadmap citation. ProbabilisticAndMetricNumberTheory §4.9b is still at README 6419 of `d311ebe`. `overlaps.md`: no other open pull request changes this roadmap, no dropped id, no id that only an open revision defines; `citations.md` lists no unresolved cross-roadmap citation, and the five own Lean names it lists as leads are declared in `Suggested.lean`. No new object is stated, so the ownership search of the earlier reports stands.

**Seeded sample.** None of the fifteen targets (0.2, 0.3, 2.2, 3.1, 4.1, 4.4, 4.5, 4.6, 4.7, 4.10, 4.11, 5.2, 5.7, 6.3, 7.4) lies in a changed passage; their Needs lines depend on the new pin sentence only through the library names, all of which resolve as above. The README flags no locator as unverified.

**Headlines.** The list is unchanged from the previous report; every headline statable at the branch's pins is stated, and the one that is not (3.4, the Leech covering radius) is named in the module docstring with its missing carrier. It becomes statable with the merge (R01).

**Adversarial pass.** No statement changed. Rows marked "new" were computed this round; rows marked "r12" are carried from the previous report (pull request #1723 at `e69d885`), which itself carried some from r11.

| Statement | Instances | Values computed on each side | Result | Round |
| --- | --- | --- | --- | --- |
| Supplier contracts, pin sentence | the 68 qualified library names; the branch pin | at `2fd255d9`/`1b1ccf4b`: 68 found, 0 missing; at `358314d4`: 50 found, 18 missing | Pass (README); R01 (manifest) | new |
| 3.4 Leech headline as the docstring words it | Λ₂₄, b : Basis (Fin 24) ℤ | min 4, so ρ = 1 and ρ² = 1 ≤ μ² = 2; carrier rank 24 = `Fin 24`; elaborates at `2fd255d9` (53 sorries), unknown constant at `358314d4` | Pass at the README's pins; R01 | new |
| 1.1 attainment via `Set.exists_min_image` | diag(1,4); [√2]; A₂; rank 0 | sets `{x ≠ 0, A[x] ≤ A[e₁]}`: {±e₁}, min 1; {±1}, min √2 (not a natural number); the 6 roots, min 2; rank 0 has no `e₁`, `min = sInf ∅ = 0`, no attainment claimed | Pass | r12 |
| 2.2 transport and norms | n = 2, η = 1/4, diag(1/t,t); g = diag(−1,1); v = (1,1) | Euclidean min² = 1/t ≥ 1/4 iff t ≤ 4; max-norm min t^(−1/2) = 0.5 ≥ √(η/n) = 0.35355 at t = 4; U = diag(−1,1) gives det(gU) = +1 and UᵀAU = I₂; 1 ≤ √2 ≤ √2·1 | Pass | r12 |
| 2.3 docstrings | A₂; A₃ | γ(A₂)² = 4/3; γ(A₃)³ = 8/4 = 2 | Pass | r12 |
| 3.2 docstring | elaborated type | conclusion `∃ v ∈ stdLattice A, x − v ∈ extremePoints`; no covering-radius term, matching the shortened text | Pass | r12 |
| 3.4 Leech holes | Λ₂₄ | ρ = 1 ≤ μ = √2; 23 deep classes at squared radius 2, 284 shallow classes below 2; Θ = 2¹²π¹²/12! = 7.90354 | Pass | r12 |
| 4.7 compactness input | well-rounded, det 1 | Hadamard on n independent minimal vectors: 1 ≤ det of their Gram ≤ minⁿ, so min ≥ 1 and the max-norm minimum is ≥ 1/√n | Pass | r12 |
| 4.10 docstrings | D₄, D₅, E₆, E₇, E₈ | γⁿ = 2⁴/4 = 4, 2⁵/4 = 8, 2⁶/3 = 64/3, 2⁷/2 = 64, 2⁸/1 = 256 | Pass | r12 |
| 4.11 docstring | Λ₂₄ | min 4, det 1: γ = 4/1^(1/24) = 4 | Pass | r12 |
| 5.3 witness | 12 roots `±eᵢ ± eⱼ` of D₃, a = e₁ | second moment 8 = 12·2/3 (2-design holds); fourth moment 8 ≠ 3·12·4/15 = 48/5 | Pass | r12 |
| 7.5 Festi–Veniani split | [8]; [12] | `O(b)` = {1,3,5,7} vs `O(q)` = {1,7}; index 1 for m = 8, 2 for m = 12 | Pass | r12 |
| 0.1 action order | I₂, U = [[1,1],[0,1]], V = Uᵀ | V•(U•I₂) = [[5,3],[3,2]]; reverse order [[2,3],[3,5]] | Pass | r12 (from r11) |
| 0.5 contragredient, sums, duals | I₂, U; [2]⊕[3]; [4] | (U•A)⁻¹ = [[2,−1],[−1,1]]; det 6, value 5 at (1,1); dual generator has squared norm 1/4 | Pass | r12 (from r11) |
| 1.3 normalized half | I₂; A₂ | S⁺ sizes 2 = 4/2 and 3 = 6/2 | Pass | r12 (from r11) |
| 1.4–1.5 densities | [4]; I₂; diag(1,4); A₂ | δ: 1/2, 1/4, 1/8, 1/(2√3); Δ: 1, π/4, π/8, 0.90690; γ: 1, 1, 1/2, 2/√3 | Pass | r12 (from r11) |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 8 | 1.00000 ≥ 1; 1.27324 ≥ 1.15470; 2.81814 ≥ 2 | Pass | r12 (from r11) |
| 1.8 `hermite_le_pow` | [4]; A₂; E₈ | 1 ≤ 1; 1.15470 = 1.15470; 2 ≤ 2.73707 | Pass | r12 (from r11) |
| 1.9 bounds | A₂; rank 1 | A₁₁A₂₂ = 4 ≤ 48/π² = 4.86342; c₁ = 1 | Pass | r12 (from r11) |
| 2.1 `hermiteConstant_pow_le` | n = 2, 3, 8 | 1 ≤ 1; 1.25992 ≤ 4/3; 64 = 64 | Pass | r12 (from r11) |
| 3.1–3.3 cells, covering, Jarník | [4]; I₂; A₂; diag(1,4) | cell volumes 2 and 1; μ(I₂) = √2/2 > ρ = 1/2, Θ = π/2; 1 ≤ 1.11803 ≤ 1.5 ≤ 2 | Pass | r12 (from r11) |
| 4.1 perfection | I₂; A₂; D₄; E₈; rank 0 | span 2 < 3; 3 = 3; 24 ≥ 20; 240 ≥ 72; 0 = 0 | Pass | r12 (from r11) |
| 4.2–4.4 eutaxy, extremality | I₂; A₂; [[2,1],[1,3]]; A(t) | c = 1/2; Q = 6A₂⁻¹, c = 1/6; second diagonal 2/5 vs 0; γ(A(t)) = 1/√(1−t²) > 1 | Pass | r12 (from r11) |
| 4.5 `isExtreme_iff` | A₂; I₂; [[2,1],[1,3]]; ranks 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 1 both sides true | Pass | r12 (from r11) |
| 4.6–4.7 finiteness | rank 2 | 1 perfect class (A₂); 2 eutactic classes (I₂, A₂) | Pass | r12 (from r11) |
| 4.9 neighbours | A₂, N = [[0,−1],[−1,0]] | ρ = 2, neighbour [[2,−1],[−1,2]], det 3, min 2 | Pass | r12 (from r11) |
| 4.10 counts | ranks 4–8 | 2, 3, 7, 33, 10916 (dsv2007 lines 91–95) | Pass | r12 (from r11) |
| 4.11 Cohn–Elkies | f ↦ 3f; f ↦ f(a·) | ratio unchanged in both | Pass | r12 (from r11) |
| 5.1–5.2 moments | {±1}; square; hexagon | 2 = 2; fourth moment 2 ≠ 3/2; 9/4 = 9/4 | Pass | r12 (from r11) |
| 5.4–5.6 harmonic theta | diag(1,4); E₈ | Laplacians 4 and 0; shell sums 120 and 0; weight 4 + 2 = 6, `S₆ = 0` | Pass | r12 (from r11) |
| 5.7 Venkov | n = 8, 16, 24 | t = 7, 3, 11; dim S at weights 14–22 is 0,1,1,1,1 < 2 | Pass | r12 (from r11) |
| 6.1–6.2 universality, escalation | ℤ³; ℤ⁴; [1] by 2 | ℤ³ misses 7, 15, 23, 28; 7 = 4+1+1+1; escalators diag(1,2), I₂ | Pass | r12 (from r11) |
| 6.3–6.4 15 and 290 | ⟨1,2,5,5⟩; 2I₄ | misses only 15 below 2000; 29 of 29 critical integers | Pass | r12 (from r11) |
| 7.1–7.3 tensor, Kitaoka | A₂⊗A₂; [√2]⊗[3] | det 81, min 4 = 2·2, kiss 18; 3√2 | Pass | r12 (from r11) |
| 7.4 discriminant groups | 2I₃ | (f∘g)(e₁/2) = e₂/2, (g∘f)(e₁/2) = e₃/2; q(eᵢ/2) = 1/4 | Pass | r12 (from r11) |
| 7.5 `fvIndex_rankOne` | m = 3, 4, 5, 6, 8, 12, 15, 24, 30 | 1, 1, 1, 1, 1, 2, 2, 2, 2 | Pass | r12 (from r11) |

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, *SPLAG*, Ch. 23 and 25 | 3.4, References | Springer, behind a paywall; untouched by this diff, as in the previous report. |
| Published Venkov volume (Monogr. Enseign. Math. 37) | References | Only the author-hosted version is readable; the README says its page numbers are that version's. |
| Gruber–Lekkerkerker, Kitaoka, Schürmann, Martinet, Hanke | 3.3, 7.2, 1.9, 2.1, 4.9, 6.4 | Untouched by this diff; as in the previous report. |

## Source issues

- none
