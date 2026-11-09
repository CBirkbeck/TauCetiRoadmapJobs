# Review of LatticePackingsAndPerfectForms (pull request #1723 at 48b5b50)

**Verdict:** needs changes

This is an incremental re-review. It covers the 35 lines changed since 5f707c6 (README 80, 117–122, 134–139, 290, 1031–1033, 1047, 1600, 1616; `Suggested.lean` 31–37) and every passage that cites them or that they cite.

## R01 (P2) — The branch is still pinned to Tau Ceti 358314d; the README's "at the pin" Leech, rank-one and kissing-number citations resolve only at main's pin 2fd255d

Re-raised: R01 of the previous two reviews. Neither repair report gave it a "not actionable" reason.

**Location:**
- `lake-manifest.json`: Tau Ceti `358314d`, Mathlib `f6090c7`.
- README 80: "**From Tau Ceti at the pin**, the declarations tabulated under *From Tau Ceti*".
- README 121: "The Leech kissing number is Tau Ceti's `TauCeti.kissingNumber_leechLattice`".
- README 134–138, table row 353, 3.4 Needs (1031–1033) and row 1047, 5.7 Needs (1600) and row 1616.

**Claim:** The merge of main has still not happened. Every Leech name the README cites, including the two this change adds to 3.4 (`isPosDef_leechLattice`, `finrank_leechLattice`) and the two it adds to 5.7 (`isPosDef_leechLattice`, `kissingNumber_leechLattice`), is absent from the Tau Ceti the branch pins. The 7.5 rank-one normalization (`⟨m⟩` with Gram entry `m`) is the 2fd255d one; at 358314d `rankOne` has Gram entry `2m`.

**Witness:**
- At 358314d (`.lake/packages/TauCeti` of this branch): no directory `TauCeti/LinearAlgebra/IntegralLattice/Rank24/`; a grep for `leechLattice` over the whole package is empty.
- At 2fd255d (main's pin): `Rank24/Leech/Basic.lean` 236, 285, 289, 295, 299, 304; `Rank24/Leech/Minimum.lean:173`; `Rank24/Leech/MinimalVectors.lean:758` (`kissingNumber_leechLattice : leechLattice.kissingNumber = 196560`).
- `git merge-tree --write-tree origin/main HEAD` succeeds at main `3090489`: the merge is clean.

**Repair:** Merge origin/main into the branch (it brings Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`), re-run the gate, then apply R02. Nothing in the README needs to change for this finding: every cited name was checked at 2fd255d and resolves there.

## R02 (P2) — The Leech covering radius is still not stated, and the new docstring gives an import choice as the reason

**Location:** `Suggested.lean` 31–36: "The Leech covering radius `μ(Λ₂₄) = √2` (README §3.4) is a statement about Tau Ceti's `TauCeti.leechLattice` and `TauCeti.isPosDef_leechLattice`, from the module `TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`, which is not among this file's imports".

**Claim:** The previous R02 asked, after the merge, for the import and the statement. The change rewrites the docstring instead. The rule is that a headline not statable at the pins is named in the docstring with the carrier that is missing. The new wording names no missing carrier: at main's pin the module exists and could be imported, so the headline is statable and absent; at the branch's pin the module does not exist, which is not what "not among this file's imports" says. Either way the docstring is not the reason the rule allows.

**Witness:**
- `Rank24/Leech/Basic.lean` exists at 2fd255d (236 `leechLattice`, 299 `isPosDef_leechLattice`) and not at 358314d.
- The file already has `gramForm (hL : L.IsPosDef) (b : Basis (Fin n) ℤ L)` and `PosDefForm.coveringRadius`, so no new definition is needed.
- No roadmap on main or at an open head and no Tau Ceti declaration states a covering radius (`roadmaps grep 'coveringRadius|covering radius|deep hole'` returns only this roadmap; the Tau Ceti grep at both pins is empty).

**Repair:** After R01's merge:

1. Add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`.
2. In `section Lattice`, state

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

3. Name it in 3.4's API and delete the covering-radius sentence from the docstring. The sentence on the hole classification (a README target, not a headline) can stay.

Values: `μ² = 2`, `ρ = 1`, `Θ = 2¹²π¹²/12! ≈ 7.90354 ≥ 1`. Not elaborated here, because the branch's pin lacks the module.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d`; README 134 still says "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`". Raised again as R01.
- R02 — partly repaired: the docstring no longer contradicts README 134 (both now say the Leech lattice is Tau Ceti's), but the headline is not stated and the docstring's reason is an import choice, not a missing carrier. Raised again as R02.
- R03 — repaired: 3.4 Needs now reads "T `TauCeti.leechLattice`, `TauCeti.isPosDef_leechLattice` (…), `TauCeti.finrank_leechLattice` (…)"; 5.7 Needs adds `isPosDef_leechLattice`, `kissingNumber_leechLattice` and cites "TS 8B" only; lines 80, 137 and 139 say *From Tau Ceti* / *From Mathlib*. The rows 1047 and 1616 match their Needs lines.

## Verified sound

**Gate.**
- The worker's gate at 48b5b50 reports every check 0, `build=0`, OK.
- Re-run with the brief's command it prints one failure, `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`, the default-order false positive recorded since r5; every other check is 0.
- The dependency check against the candidate order prints

      depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

  with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all `declaration uses sorry`, and no other output.
- The Lean diff is confined to module-docstring lines 31–37, so the 112 elaborated types of `signatures.md` stand; the single binder lead is still `polynomialsOfDegreeLE`, whose consumers keep every binder. The r6 one-tactic padding probe carries over: no sorried theorem closes in one tactic.

**Library declarations opened for the changed lines.**
- Tau Ceti 2fd255d: `Rank24/Leech/Basic.lean` 236 (`leechLattice : IntegralLattice (Fin 24 → ℚ)`), 285 `isEven_`, 289 `isUnimodular_`, 295 `discriminant_ … = 1`, 299 `isPosDef_`, 304 `finrank_ … = 24`; `Minimum.lean:173` (`minimum = 4`); `MinimalVectors.lean:758` (`kissingNumber = 196560`); `NumberTheory/ModularForms/LevelOne/GradedRing.lean:541` `mvPolynomialEquivModularForms`.
- Tau Ceti 358314d: no `Rank24/`; `GradedRing.lean` has `mvPolynomialEquivModularForms`.
- Mathlib, both pins: `CuspForm.rank_eq_zero_of_weight_lt_twelve` (`LevelOne/DimensionFormula.lean:155` at f6090c7, 167 at 1b1ccf4b) and `discriminantEquiv` (line 65 at both).

**Cross-roadmap citations resolved (4).**
- ThetaSeries (main) 8B, line 949: `Θ_{E₈} = E₄` with `r_{E₈}(2) = 240` as a corollary. Matches README 120 and 290.
- ThetaSeries (main) 8D, lines 966–976 and table row 1134: the carrier is `SpherePacking/Dim24/LeechLattice/*` (`leech_rootless`, `leech_evenNormSq`, `leech_covolume`). README 121's statement that TS 8D's `Λ` is the sphere-packing model is correct, and dropping it as 5.7's source of 196560 is right: `kissingNumber_leechLattice` is on the carrier 5.7 names.
- IntegralLattices (main) 6C (line 2054, rank at most 9) and 6D (line 2076, rank 16), both cited in the 5.7 Needs line.
- Rank24LatticeConstructions (main) Layer 6, line 312, named at README 135 (unchanged; checked in r8).

**Headings.** `### From Mathlib` (312) and `### From Tau Ceti` (340) exist under `## Exact supplier contracts` (270); the three renamed pointers at 80, 137 and 139 now resolve. No "What Tau Ceti supplies", "What Mathlib supplies" or "(8D)" remains; the only "8D" is the negation at 121.

**Ownership.** `overlaps.md` lists no other open pull request changing this roadmap and no dropped id; the change adds no owned object.

**Seeded sample.** None of the 15 sampled targets (1.1, 1.5, 1.7, 1.9, 2.2, 2.3, 3.3, 4.3, 4.6, 4.9, 5.1, 5.4, 5.6, 6.2, 7.1) falls in the changed passages; their locators were checked in r6–r8 and the text is unchanged.

**Adversarial pass.**

New rows for the changed statements, computed this round:

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 80, 137, 139 heading pointers | the three headings | `### From Mathlib` 312, `### From Tau Ceti` 340, under `## Exact supplier contracts` 270 | Pass |
| 121, source of 196560 | TS 8D vs Tau Ceti | TS 8D: `SpherePacking/Dim24/LeechLattice` (`leech_rootless`, row 1134); `kissingNumber_leechLattice : leechLattice.kissingNumber = 196560` at 2fd255d; absent at 358314d | Pass at 2fd255d; R01 |
| 290, TS consumer bullet | 8B | `Θ_{E₈} = E₄`, `r_{E₈}(2) = 240` (TS 949–951) | Pass |
| 3.4 Needs, `gramForm` inputs | `Λ₂₄` | `gramForm (hL : L.IsPosDef) (b : Basis (Fin 24) ℤ L)`: `hL` = `isPosDef_leechLattice` (299), `Fin 24` from `finrank_leechLattice` (304); det 1 from `discriminant_leechLattice` (295); `μ² = 2`, `Θ = 2¹²π¹²/12! ≈ 7.90354` | Pass at 2fd255d; R01 |
| 5.7 Needs, Leech corollary | n = 24 | `24 = 24·1 + 8·0`, `t = 11`; `hmin`: `2·1 + 2 = 4 = minimum_leechLattice`; `hL` = `isPosDef_leechLattice`; design on 196560 vectors = `kissingNumber_leechLattice` | Pass at 2fd255d; R01 |
| 5.7 Needs, cusp inputs | d = 2..14 at n = 24 | weights 12 + d = 14..26; `discriminantEquiv` (both pins, line 65) gives `S_{12+d} ≅ M_d` with dims 0, 1, 1, 1, 1, 2, 1 for d = 2, 4, 6, 8, 10, 12, 14; `rank_eq_zero_of_weight_lt_twelve` (155 at f6090c7, 167 at 1b1ccf4b) supplies the vanishing below weight 12 the dimension count rests on; all < m + 1 = 2 except d = 12 | Pass |
| `Suggested.lean` docstring 31–37 | both pins | 358314d: module `Rank24.Leech.Basic` absent; 2fd255d: present, statable with existing `gramForm`, `coveringRadius` | R02 |

Rows carried forward from the r8 report (`PRREVIEW-LatticePackingsAndPerfectForms~8`), for statements this diff leaves untouched:

| Statement | Instances | Values (r8, r7 or r6 via r8) | Result |
| --- | --- | --- | --- |
| Scope 134–138, Leech facts | 9 names at both pins | 2fd255d: rank 24, even, unimodular, pos. def., disc 1, min 4, no norm-2 vectors, kissing 196560; 358314d: no `Rank24/` | R01 |
| 135, R24 Layer 6 | odd shift `s` | `B(s,s) = (9/4 + 23/4)/2 = 4`; `2s = (−3,1,…,1)`, coordinate sum 20 ≡ 0 mod 4 | Pass |
| 4.11 lower witness | `Λ₂₄` | `δ = (√4/2)²⁴/√1 = 1`; `γ = 4/1^{1/24} = 4`; disc 1 and pos. def. give det `+1` | Pass at 2fd255d |
| 7.5 `rankOne` normalization | m = 6, 15 | 2fd255d: Gram [6], index 1; Gram [15], index 2. 358314d: Gram [12], index 2; Gram [30], index 2 | Pass at 2fd255d; R01 |
| 7.5 discriminant inputs | m = 6 | `#A`: 6 at 2fd255d, 12 at 358314d; `b(g,g)`: 1/6 vs 1/12; `q(g)`: 1/12 vs 1/24 | R01 |
| 7.5 Checks | Gram [15]; ⟨6⟩; [12] | unit squares mod 15 give {1,4,11,14}, index 2; ⟨6⟩ mod 12 gives {1,5}, index 1; [12] mod 24 gives {1,5,7,11}, index 2 | Pass |
| `fvIndex_rankOne` (Lean formula) | m = 3, 4, 5, 6, 8, 12, 15, 30 | 1, 1, 1, 1, 1, 2, 2, 2 | Pass |
| SM upper half | `A₂`, `I₂` | `2π ≤ 4√3`; `π ≤ 4` | Pass at 2fd255d (R01) |
| OT deferral | E₈, E₈², Λ₂₄ | 696729600, 2·696729600², 8315553613086720000 | Pass |
| 0.1 action, polarization | I₂, U, Uᵀ; A₂ | [[5,3],[3,2]] vs [[2,3],[3,5]]; 6 = 2+2+2 | Pass |
| 0.2 `isPosDef_ofGramMatrix_iff` | A₂ over ℚ; [0] | 3/2 > 0; 0 > 0 fails | Pass |
| 0.3 covolume | [4]; I₂; rank 0 | 2; 1; 1 | Pass |
| 0.4 shells | [1], t = −1, 0; [2] | `√(−1) = 0`; 1 = 1; 2 = 2 | Pass |
| 0.5 contragredient | I₂, U | [[2,−1],[−1,1]] vs [[1,−1],[−1,2]] | Pass |
| 1.1 minima | diag(1,4); I₂; [1] | min 1, kiss 2; kiss 4; ∅, {0}, {−1,0,1} | Pass |
| 1.2 comparison | [2]; diag(1,4); rank 0 | 2 = 2; 1, 4; 0 = 0 | Pass |
| 1.4 densities | V₁…V₂₄; I₂, 4I₂ | 2, π, 4π/3, π²/2, π⁴/24, π¹²/12!; π/4 | Pass |
| 1.5 Hermite | diag(1,4); diag(1,1,4); A₂ | 1/2; 4^(−1/3); 2/√3 | Pass |
| 1.6 integral comparisons | [4]; diag(1,4); A₂ | 4 vs 2; (1,4) vs (1,2); 2 | Pass at 2fd255d (R01) |
| 1.7 Minkowski | [4]; I₂; n = 1, 2, 3, 8 | 4 ≤ 4; π < 4; 1, 1.27324, 1.53934, 2.81814 | Pass |
| 1.8 Hermite; `IsPrimitive.exists_basis` | [4]; A₂; I₂; (2,3), (2,4) | 1 ≤ 1; 2/√3; 1 < 1.15470; det −1; even det | Pass |
| 1.9 constants, bounds | n = 0..8; A₂, A₃, I₃ | `cₙⁿ` = 1, 1.62114, 3.64756, 3978.354; 4 ≤ 4.8634; 8 ≤ 58.361; 1 ≤ 14.590 | Pass |
| 2.1 Mordell | n = 2..8 | 1 ≤ 1 … 64 = 64 | Pass |
| 2.2 attainment | ε = γₙ | η = 0 admits diag(1/t,t) | Pass |
| 2.3 values | [a]; A₂; A₃; I₃ | 1; 4/3; 2; 1 < 2 | Pass |
| 3.1 cell | [4]; I₂; A₂ | vol 2; 4 vectors not relevant; norm 2 vs 6 | Pass |
| 3.2 ρ < μ | I₂; [4]; rank 0 | 1/2 < √2/2; 1 = 1; 0 = 0 | Pass |
| 3.3 Jarník | diag(1,4); [4] | 1 ≤ 1.11803 ≤ 3/2 ≤ 2; 1 = 1 | Pass |
| 3.4, other covering values | ℤ³; A₂; A₃, D₄, E₈ | √3/2; μ² = 2/3; 1, 1, 1 | Pass |
| 4.1 perfection | I₂; A₂; rank 0 | dim 2 < 3; 3 = 3; 0 = 0 | Pass |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | c = 1/2; c = 1/6; 2/5 ≠ 0 | Pass |
| 4.3 extreme | [[1,t],[t,1]] | γ = 1/√(1−t²) > 1 | Pass |
| 4.4 strongly eutactic | A₂, U | QA = 6I; UQ ≠ QU | Pass |
| 4.5–4.6 Voronoi | ranks 0–2 | T↔T∧T; A₂ T∧T; I₂ F∧T; 1 class | Pass |
| 4.9 neighbours | A₂, N | ρ = 2, det 3 | Pass |
| 4.10 counts, ADE | ranks 2–8; D₄…E₈ | 1, 1, 2, 3, 7, 33, 10916; γⁿ = 4, 8, 64/3, 64, 256 | Pass |
| 4.11 Cohn–Elkies scaling | f scaled by 3 | 3/3 = 1 | Pass |
| 5.1–5.3 designs, moments | {±1}; {1}; j = 0, 1, 2; A₂; I₂ | 0 = 0; 1 ≠ 0; 1, 1/n, 3/(n(n+2)); 9/4; 2 vs 3/2 | Pass |
| 5.4 Gram Laplacian | diag(1,4); E₈ | 3/2; shell sums 120, 0 | Pass |
| 5.5 Hecke–Bochner | n = 1, P = x | `−iξe^{−πξ²}` | Pass |
| 5.6 harmonic theta | E₈, P = 2, 0 | 480; 0 | Pass |
| 5.7 cusp dimensions | n = 24, d = 2..14 | 0, 1, 1, 1, 1 < 2; S₂₄ = 2 | Pass |
| 6.1–6.4 | ⟨1⟩⁴; diag(1,2,5,5); diag(1,2,5,10) | 7 = 4+1+1+1; misses 15 only; universal | Pass |
| 7.1–7.3 tensor, Kitaoka | A₂⊗A₂; A₂⊗D₄; `scale` | det 81, min 4, kiss 18; 1296; [2]·4 = [8] | Pass |
| 7.4 | [8]; [0] | O(b) = {1,3,5,7}, O(q) = {1,7}; [0] excluded | Pass |
| Worked rows | bcc; [[2,1],[1,3]]; E₈; ⟨15⟩ | det 128, min 6, Θ ≈ 1.46350; #Aut 4; Δ = π⁴/384; δ = 1/2, μ = √15/2, Θ = 1 | Pass |

**Remarks on unchanged text (no change asked).**
- At 2fd255d, Tau Ceti's `ThetaSeries/Leech.lean:80` states `Θ_Λ = E₄³ − 720Δ` for `TauCeti.leechLattice`; ThetaSeries' 8D still names the sphere-packing carrier. That is ThetaSeries' row to update, and README 121 describes TS 8D as it stands on main.
- The 7.5 Festi–Veniani citation could carry "Theorem 2.8, p. 9".

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, Ch. 21 and 23; Conway–Parker–Sloane | 3.1, 3.4 (Leech covering radius) | publisher paywall; the values were checked by computation |
| B. Venkov, *Réseaux et designs sphériques* | 4.4, 5.2–5.7 | r6: the sources service found no legal copy (text unchanged) |
| M. Bhargava, Contemp. Math. 272 | 6.2, 6.3 | r6: AMS landing page only |
| Kitaoka, Thm 7.1.1 | 7.2 | paywall; checked through Coulangeon–Nebe in r6 |
| Schürmann, Ch. 2 | 1.9 | AMS paywall; checked against the Tau Ceti declarations |
| LMFDB knowls | Summary | CAPTCHA |

## Source issues

- none
