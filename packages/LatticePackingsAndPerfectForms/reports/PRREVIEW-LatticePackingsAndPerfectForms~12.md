# Review of LatticePackingsAndPerfectForms (pull request #1723 at e69d885)

**Verdict:** needs changes

Incremental re-review of the 137 lines changed since `8cc4a64`. Seven of the nine previous findings (R03–R09) are repaired and the repairs introduce no mathematical defect. Two findings remain: the stale Tau Ceti pin (carried, with the Leech headline it blocks) and one the Mahler repair introduced in the pull request's dependency list.

## R01 (P2) — 23 Tau Ceti declarations cited "at the pin" are absent at the branch's pin; the Leech covering-radius headline waits on the same merge

Re-raised: H01 of the last available repair report (R01 of the previous report), together with its H02 (R02 of the previous report), which has the same cause.

**Location:**
- `lake-manifest.json` pins Tau Ceti `358314d` (unchanged at this head); main pins `2fd255d`.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md` 80, 87, 108, 140: "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`"; the *From Tau Ceti* table; the Needs lines of 1.6, 1.9, 3.4, 4.11, 5.7, 6.4, 7.2, 7.5.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean` 31–37: "is absent from the Tau Ceti revision this file is elaborated against".

**Claim:** the README says these declarations exist at the pin; at the only pin the branch records they do not. The Lean docstring says the Leech carrier is absent, which contradicts README 140 and becomes false the moment the folder is on main, where the headline `μ(Λ₂₄) = √2` is statable and so must be stated.

**Witness:** a grep of both package trees, repeated this round on eight of the 23 names (`leechLattice`, `IsMinkowskiReduced`, `kissingNumber_typeE₈RootLattice`, `ofGramMatrix_singleton_eq_rankOne`, `checkerboardPlusLattice`, `minimum_le_mul_determinant_rpow`, `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, `qExpansion_coeff_prime_sq_of_factorization_eq_one`): 0 files at `358314d`, between 1 and 6 files at `2fd255d`. `TauCeti/LinearAlgebra/IntegralLattice/Rank24/` does not exist at `358314d`.

**Why the "not actionable inside the roadmap folder" answer does not settle it.** The repair report confirms the facts and says only the branch owner's merge can fix them. That is a reason the repair job could not act, not a reason the finding is void: this report is addressed to the pull request's author, who can merge. `git merge-tree --write-tree origin/main HEAD` exits 0 at main `3090489`, and the diff against main stays confined to the folder.

**Repair:**
1. Merge `origin/main` into the branch. No README line changes.
2. Then apply the three hunks the repair report already tested at main's pins (exit 0, 53 `sorry` warnings):
   - add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`;
   - state in `section Lattice`

     ```lean
     /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
     any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
     theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
         (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
     ```

   - delete the docstring text from "The Leech covering radius" to "indexed by `Fin 24`." and name the theorem in the API of README 3.4.

If the merge cannot be made before the next review, the README half has an in-folder repair that main already uses (PDE, AlgebraicVectorBundles): one sentence at the top of *Exact supplier contracts* saying that every Tau Ceti and Mathlib declaration named in the README is cited as it is at Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. The Lean half still needs the merge.

## R02 (P3) — The pull request's dependency list does not name ProbabilisticAndMetricNumberTheory, which the Mahler repair made a supplier

**Location:** the pull request description, "**Depends on** (suppliers still open; they merge first)": it lists #851 GeometryOfNumbersAndQuadraticArithmetic and #1001 WeightsInEtaleCohomology only. README 135–139, 304–306, and the Needs lines of 2.2 (880) and 4.7 (1254) now consume ProbabilisticAndMetricNumberTheory §4.9b.

**Claim:** ProbabilisticAndMetricNumberTheory is not on main; it is the new roadmap of open pull request #1421 (head `d311ebe`). The description lets this pull request merge before the roadmap that owns `mahler_relativelyCompact_iff`.

**Witness:** `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/` is absent from main `3090489`; §4.9b is at README line 6419 of #1421's head. The dependency check counts the new edges (2266 edges, up from 2262).

**Repair:** add `- [ ] #1421 ProbabilisticAndMetricNumberTheory` to the depends-on block of the description. The README needs no change (it rightly cites the roadmap by name and section).

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins `358314d`; README 140 still reads "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`". Raised again as R01.
- R02 — not repaired: `Suggested.lean` 34–35 still reads "is absent from the Tau Ceti revision this file is elaborated against". It cannot be repaired before the merge; folded into R01's repair, step 2.
- R03 — repaired: 3.4 now reads "the deep holes, form `23` classes … (Conway–Sloane, Ch. 23). The vertices at squared distance below `2`, the shallow holes, play no part in the value"; Ch. 25 is in References and in the scope exclusions.
- R04 — repaired: "ProbabilisticAndMetricNumberTheory §4.9b `mahler_relativelyCompact_iff`" in the supplier bullet, the contract list, 2.2, 4.7, both dependency rows and the ordering paragraph; no "4.5.8" remains. The repair's missing dependency line is R02.
- R05 — repaired: "Page numbers here are those of the version on J. Martinet's page, paginated from 1 (pp. 1–80), which is the version used; section, theorem and equation numbers are the article's".
- R06 — repaired: 2.3 cites "Dutour Sikirić–Schürmann–Vallentin, arXiv:math/0609388v3, §1, Table 1, p.3"; 7.5 cites "arXiv:2102.09411v2, §2.1, p.3" and "Theorem 2.8, p.9"; the reference carries volume 75, no. 4, 1195–1225.
- R07 — repaired: "*Needs:* M `ZSpan.setFinite_inter`, `Set.exists_min_image` (applied to the finite nonempty set `{x ∈ ℤⁿ | x ≠ 0, A[x] ≤ A[e₁]}`, finite by `finite_setOf_eval_le`)", and the dependency row.
- R08 — repaired: docstring and README bullet both read "A deep hole is, up to a lattice translation, a vertex (extreme point) of the Voronoi cell."
- R09 — repaired: "the fourth moment `∑ ⟪a, x⟫⁴` of the `12` minimal vectors is `8`, while 5.2's `4`-design value is `3 · 12 · 2² / (3 · 5) = 48/5`".

## Verified sound

**Gate and dependency check.**
- The worker's gate at `e69d885` reports every check 0, `build=0`, OK. Re-run with the brief's command it fails only `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`, the default-order report for a roadmap not yet in the order; with the candidate merge order every check is 0 and the line ends OK.
- Dependency check against the candidate order:

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. GeometryOfNumbersAndQuadraticArithmetic is line 55, ProbabilisticAndMetricNumberTheory line 62, WeightsInEtaleCohomology line 147, this roadmap line 148: the new edge points downward.
- No file is changed outside the folder (`git diff --stat origin/main...HEAD` lists the folder's three files only).

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 52 messages, all `declaration uses sorry`. The diff changes docstrings only (ten theorems and the module docstring); no signature, binder or statement changed, so the 112 elaborated types and the padding probe of the previous report stand.

**Library declarations opened (Mathlib `f6090c7`).**
- `Set.exists_min_image` (`Mathlib/Data/Set/Finite/Lemmas.lean:75`): for a finite nonempty `s` and `f : α → β` into a linear order there is a minimiser in `s`. It applies to real values, which `Nat.sInf_mem` did not. `finite_setOf_eval_le` is this roadmap's own declaration (`Suggested.lean` 187), named in the 1.1 API.

**Cross-roadmap citations resolved (changed passages).**
- ProbabilisticAndMetricNumberTheory §4.9b at `d311ebe` (README 6419, 6455): `mahler_relativelyCompact_iff` for every `n`, on `SL_n(ℝ)/SL_n(ℤ)`, column lattices `gℤⁿ`, first minimum in the max norm; relatively compact exactly when the minimum is bounded below; the classes with minimum at least ε form a compact set. This is what README 135–139 and 304–306 say of it, and its Downstream paragraph (7121) names GoN §4.5 as a consumer, so there is one owner.
- GoN 4.4.1, 4.4.2, 4.5.1, 4.5.2, 5.1 remain cited as in the previous report; no citation of 4.5.8 remains.
- `overlaps.md`: no open pull request changes this roadmap, no dropped id. No new object is stated, so the ownership search of the previous report stands.

**Seeded sample.** Two targets fall in changed passages; both pass.
- 1.1: the new attainment route (above). The README flags no locator as unverified.
- 2.2: the transport to `SLₙ(ℝ)` and the norm comparison, computed in the table below.
- The other thirteen targets (0.3, 0.4, 1.5, 1.6, 1.7, 1.9, 4.1, 4.5, 4.6, 5.1, 5.2, 6.1, 6.2) are untouched by the diff.

**Sources read for the changed locators.**
- dsv2007 lines 86–97 (Table 1, p.3, inside §1 which starts at line 18): ranks 2 and 3 have one perfect form each, maximum of `γ` at `A₂` (Lagrange) and `A₃` (Gauss); rank 4 is Korkine–Zolotarev with `D₄`, rank 5 Korkine–Zolotarev with `D₅`, then `E₆`, `E₇`, `E₈`. This supports the 2.3 locator and the reworded 4.10 docstrings.
- festiveniani lines 109–120 (§2.1, p.3): `O♯(L)` is the image of `O(L) → O(L♯)`, quadratic form for even `L`, bilinear otherwise. Lines 401–403 (Theorem 2.8, p.9): the multiplicity of a frame is a number of double cosets with `O♯(W)` on one side. The journal data (J. Math. Soc. Japan 75, no. 4, 1195–1225, 2023) agree with the zbMATH record.
- venkov2001: the file ends on the article's page 80 (line 10726); the plan (lines 199–220) puts §6 at p.20, §16 at p.58, the bibliography at p.77; Theorem 16.4 is at line 8394 and Remark 16.5 follows it at line 8401, on p.61.
- leechholesk3 (arXiv:1502.02099v3) lines 234, 290, 297, 305: maximal hole radius `√2` and the deep-hole classification are Conway–Sloane Ch. 23; the shallow holes are Ch. 25; 23 deep and 284 shallow classes. This is what 3.4 now says.

**Adversarial pass.** Rows marked "new" were computed this round for the changed passages; rows marked "r11" are carried from the previous report (pull request #1723 at `8cc4a64`), whose statements the diff leaves untouched.

| Statement | Instances | Values computed on each side | Result | Round |
| --- | --- | --- | --- | --- |
| 1.1 attainment via `Set.exists_min_image` | diag(1,4); [√2]; A₂; rank 0 | sets `{x ≠ 0, A[x] ≤ A[e₁]}`: {±e₁}, min 1; {±1}, min √2 (not a natural number); the 6 roots, min 2; rank 0 has no `e₁`, `min = sInf ∅ = 0`, no attainment claimed | Pass | new |
| 2.2 transport and norms | n = 2, η = 1/4, diag(1/t,t); g = diag(−1,1); v = (1,1) | Euclidean min² = 1/t ≥ 1/4 iff t ≤ 4; max-norm min t^(−1/2) = 0.5 ≥ √(η/n) = 0.35355 at t = 4; U = diag(−1,1) gives det(gU) = +1 and UᵀAU = I₂; 1 ≤ √2 ≤ √2·1 | Pass | new |
| 2.3 docstrings | A₂; A₃ | γ(A₂)² = 4/3; γ(A₃)³ = 8/4 = 2 | Pass | new |
| 3.2 docstring | elaborated type | conclusion `∃ v ∈ stdLattice A, x − v ∈ extremePoints`; no covering-radius term, matching the shortened text | Pass | new |
| 3.4 Leech holes | Λ₂₄ | ρ = 1 ≤ μ = √2; 23 deep classes at squared radius 2, 284 shallow classes below 2; Θ = 2¹²π¹²/12! = 7.90354 | Pass | new |
| 4.7 compactness input | well-rounded, det 1 | Hadamard on n independent minimal vectors: 1 ≤ det of their Gram ≤ minⁿ, so min ≥ 1 and the max-norm minimum is ≥ 1/√n | Pass | new |
| 4.10 docstrings | D₄, D₅, E₆, E₇, E₈ | γⁿ = 2⁴/4 = 4, 2⁵/4 = 8, 2⁶/3 = 64/3, 2⁷/2 = 64, 2⁸/1 = 256 | Pass | new |
| 4.11 docstring | Λ₂₄ | min 4, det 1: γ = 4/1^(1/24) = 4 | Pass | new |
| 5.3 witness | 12 roots `±eᵢ ± eⱼ` of D₃, a = e₁ | second moment 8 = 12·2/3 (2-design holds); fourth moment 8 ≠ 3·12·4/15 = 48/5 | Pass | new |
| 7.5 Festi–Veniani split | [8]; [12] | `O(b)` = {1,3,5,7} vs `O(q)` = {1,7}; index 1 for m = 8, 2 for m = 12 | Pass | new, values r11 |
| 0.1 action order | I₂, U = [[1,1],[0,1]], V = Uᵀ | V•(U•I₂) = [[5,3],[3,2]]; reverse order [[2,3],[3,5]] | Pass | r11 |
| 0.5 contragredient, sums, duals | I₂, U; [2]⊕[3]; [4] | (U•A)⁻¹ = [[2,−1],[−1,1]]; det 6, value 5 at (1,1); dual generator has squared norm 1/4 | Pass | r11 |
| 1.3 normalized half | I₂; A₂ | S⁺ sizes 2 = 4/2 and 3 = 6/2 | Pass | r11 |
| 1.4–1.5 densities | [4]; I₂; diag(1,4); A₂ | δ: 1/2, 1/4, 1/8, 1/(2√3); Δ: 1, π/4, π/8, 0.90690; γ: 1, 1, 1/2, 2/√3 | Pass | r11 |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 8 | 1.00000 ≥ 1; 1.27324 ≥ 1.15470; 2.81814 ≥ 2 | Pass | r11 |
| 1.8 `hermite_le_pow` | [4]; A₂; E₈ | 1 ≤ 1; 1.15470 = 1.15470; 2 ≤ 2.73707 | Pass | r11 |
| 1.9 bounds | A₂; rank 1 | A₁₁A₂₂ = 4 ≤ 48/π² = 4.86342; c₁ = 1 | Pass | r11 |
| 2.1 `hermiteConstant_pow_le` | n = 2, 3, 8 | 1 ≤ 1; 1.25992 ≤ 4/3; 64 = 64 | Pass | r11 |
| 3.1–3.3 cells, covering, Jarník | [4]; I₂; A₂; diag(1,4) | cell volumes 2 and 1; μ(I₂) = √2/2 > ρ = 1/2, Θ = π/2; 1 ≤ 1.11803 ≤ 1.5 ≤ 2 | Pass | r11 |
| 4.1 perfection | I₂; A₂; D₄; E₈; rank 0 | span 2 < 3; 3 = 3; 24 ≥ 20; 240 ≥ 72; 0 = 0 | Pass | r11 |
| 4.2–4.4 eutaxy, extremality | I₂; A₂; [[2,1],[1,3]]; A(t) | c = 1/2; Q = 6A₂⁻¹, c = 1/6; second diagonal 2/5 vs 0; γ(A(t)) = 1/√(1−t²) > 1 | Pass | r11 |
| 4.5 `isExtreme_iff` | A₂; I₂; [[2,1],[1,3]]; ranks 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 1 both sides true | Pass | r11 |
| 4.6–4.7 finiteness | rank 2 | 1 perfect class (A₂); 2 eutactic classes (I₂, A₂) | Pass | r11 |
| 4.9 neighbours | A₂, N = [[0,−1],[−1,0]] | ρ = 2, neighbour [[2,−1],[−1,2]], det 3, min 2 | Pass | r11 |
| 4.10 counts | ranks 4–8 | 2, 3, 7, 33, 10916 (dsv2007 lines 91–95) | Pass | r11 |
| 4.11 Cohn–Elkies | f ↦ 3f; f ↦ f(a·) | ratio unchanged in both | Pass | r11 |
| 5.1–5.2 moments | {±1}; square; hexagon | 2 = 2; fourth moment 2 ≠ 3/2; 9/4 = 9/4 | Pass | r11 |
| 5.4–5.6 harmonic theta | diag(1,4); E₈ | Laplacians 4 and 0; shell sums 120 and 0; weight 4 + 2 = 6, `S₆ = 0` | Pass | r11 |
| 5.7 Venkov | n = 8, 16, 24 | t = 7, 3, 11; dim S at weights 14–22 is 0,1,1,1,1 < 2 | Pass | r11 |
| 6.1–6.2 universality, escalation | ℤ³; ℤ⁴; [1] by 2 | ℤ³ misses 7, 15, 23, 28; 7 = 4+1+1+1; escalators diag(1,2), I₂ | Pass | r11 |
| 6.3–6.4 15 and 290 | ⟨1,2,5,5⟩; 2I₄ | misses only 15 below 2000; 29 of 29 critical integers | Pass | r11 |
| 7.1–7.3 tensor, Kitaoka | A₂⊗A₂; [√2]⊗[3] | det 81, min 4 = 2·2, kiss 18; 3√2 | Pass | r11 |
| 7.4 discriminant groups | 2I₃ | (f∘g)(e₁/2) = e₂/2, (g∘f)(e₁/2) = e₃/2; q(eᵢ/2) = 1/4 | Pass | r11 |
| 7.5 `fvIndex_rankOne` | m = 3, 4, 5, 6, 8, 12, 15, 24, 30 | 1, 1, 1, 1, 1, 2, 2, 2, 2 | Pass | r11 |

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, *SPLAG*, Ch. 23 and 25 | 3.4, References | Springer, behind a paywall. The chapter attributions and the counts 23 and 284 were read in arXiv:1502.02099v3, which cites both chapters; the value `√2` is taken from the citation. |
| Published Venkov volume (Monogr. Enseign. Math. 37) | References | Only the author-hosted version is readable; the README now says its page numbers are that version's, so nothing rests on the printed pagination. |
| Gruber–Lekkerkerker, Kitaoka, Schürmann, Martinet, Hanke | 3.3, 7.2, 1.9, 2.1, 4.9, 6.4 | Untouched by this diff; as in the previous report. |

## Source issues

- none
