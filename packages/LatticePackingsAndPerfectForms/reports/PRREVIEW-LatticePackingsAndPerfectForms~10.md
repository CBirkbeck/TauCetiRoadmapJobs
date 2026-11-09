# Review of LatticePackingsAndPerfectForms (pull request #1723 at 8cc4a64)

**Verdict:** needs changes

This is an incremental re-review. It covers the 14 lines changed since 48b5b50 (`Suggested.lean` module docstring, lines 31–38) and the README passages that the changed sentence cites or contradicts (135, 353, 3.4, 4.11, 5.7, 7.5).

Both findings have one cause and one fix: the branch has not merged main. That is not an edit of `README.md` or `Suggested.lean`; it needs whoever owns the branch to run the merge. The post-merge form of the file is tested below and elaborates.

## R01 (P2) — The branch still pins Tau Ceti 358314d; 15 Tau Ceti names the README cites "at the pin" exist only at main's pin 2fd255d

Re-raised: R01 of the previous three reviews. No repair report with a "not actionable" reason was available to this review.

**Location:**
- `lake-manifest.json`: Tau Ceti `358314d`, Mathlib `f6090c7` (unchanged since 48b5b50). Main pins Tau Ceti `2fd255d`.
- README 135: "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`".
- README 353 (supplier table), 1032–1034 and 1047 (3.4), 1345–1347, 1373–1374 and 1393 (4.11), 1600 and 1616 (5.7), and the 7.5 rank-one normalization.

**Claim:** The README says these declarations are at the pin. At the pin the branch records they are not, and the changed docstring now says so itself ("absent from the Tau Ceti revision this file is elaborated against"). The folder therefore contradicts itself on whether `TauCeti.leechLattice` is available.

**Witness:** A declaration grep of every backticked `TauCeti.*` name of the README under both package trees gives 15 names present at 2fd255d and absent at 358314d:
- the nine Leech names of README 353 (`leechLattice`, `finrank_`, `isEven_`, `isUnimodular_`, `isPosDef_`, `discriminant_`, `minimum_`, `vectorsOfNorm_two_`, `kissingNumber_leechLattice`);
- `IsMinkowskiReduced` and its four lemmas;
- `ofGramMatrix_singleton_eq_rankOne`.

`rankOneMatrix m` is `2 * m` at 358314d (`IntegralLattice/RankOne.lean:98`) and `a` at 2fd255d (`RankOne/Basic.lean:36`), so `fvIndex_rankOne` means something different at the two pins (m = 6: index 2 at 358314d, 1 at 2fd255d; README 7.5 says 1).

**Repair:** Merge origin/main into the branch. `git merge-tree --write-tree origin/main HEAD` succeeds at main `3090489`, so the merge is clean. No README line needs to change: every cited name resolves at 2fd255d. Then apply R02.

## R02 (P3) — The Leech covering radius docstring is true only until the merge; after it the headline is statable and must be stated

**Location:** `Suggested.lean` 31–37: "is not stated: its carrier, Tau Ceti's `TauCeti.leechLattice` … is absent from the Tau Ceti revision this file is elaborated against. With that module the headline reads `(gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = √2`".

**Claim:** The repair now names a missing carrier, and at 358314d the sentence is true. It has two defects:
- it contradicts README 135 and the 3.4 Needs line, which cite the same carrier "at the pin" (R01);
- it writes the headline out inside a docstring instead of stating it, and "the revision this file is elaborated against" describes the state of the branch, not the mathematics. After R01's merge the sentence is false.

**Witness:** A scratch copy of this head's `Suggested.lean` with the import and the theorem below, elaborated with `lake env lean` against main's pins (Tau Ceti 2fd255d): exit 0, 53 `declaration uses sorry` warnings, nothing else. The other 52 statements survive the pin move unchanged.

**Repair:** After the merge:

1. Add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`.
2. After `kissingNumber_eq_kissingNumber` in `section Lattice`, state

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

3. Name it in the API of README 3.4, and delete the docstring text from "The Leech covering radius" to "indexed by `Fin 24`." The sentence on the hole classification stays.

Values: `μ² = 2`, `ρ = √4/2 = 1 < √2`, `Θ = 2¹²π¹²/12! ≈ 7.90354 ≥ 1`.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d`; README 135 still reads "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`". Raised again as R01.
- R02 — partly repaired: the docstring now names the missing carrier ("`TauCeti.leechLattice` … is absent from the Tau Ceti revision this file is elaborated against"), true at 358314d; the headline is still unstated and the sentence contradicts README 135. Raised again as R02 (P3).

## Verified sound

**Gate.**
- The worker's gate at 8cc4a64 reports every check 0, `build=0`, OK.
- Re-run with the brief's command it prints one failure, `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`, the default-order false positive recorded since r5; every other check is 0.
- The dependency check against the candidate order prints

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

  with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty; `changes.md` lists no file changed outside the folder.

**Elaboration.**
- `lake env lean` on `Suggested.lean` at this head exits 0 with 52 warnings, all `declaration uses sorry`.
- The Lean diff is confined to the module docstring, so the 112 elaborated types of `signatures.md` stand; the single binder lead is still `polynomialsOfDegreeLE`. The r6 one-tactic padding probe carries over.
- The post-merge probe (R02) elaborates against main's pins: 53 `sorry` warnings, exit 0.

**Library declarations opened for the changed sentence.**
- Tau Ceti 2fd255d, `Rank24/Leech/Basic.lean`: 236 `leechLattice : IntegralLattice (Fin 24 → ℚ)`, 285 `isEven_`, 289 `isUnimodular_`, 295 `discriminant_ … = 1`, and `isPosDef_leechLattice` (used by the probe, which elaborates).
- Tau Ceti 358314d: no `Rank24/` directory; a grep for `leechLattice` over the package is empty. The docstring's "absent" is correct at this pin.
- `Suggested.lean` 451: `gramForm {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ} (b : Basis (Fin n) ℤ L) : PosDefForm n`; 278 `PosDefForm.coveringRadius`. The docstring's expression type-checks with `V = Fin 24 → ℚ`, `n = 24`.

**Cross-roadmap citations.** The change adds none. The four resolved in r9 (ThetaSeries 8B and 8D, IntegralLattices 6C and 6D, on main) are in untouched text.

**Ownership.** `overlaps.md` lists no other open pull request changing this roadmap and no dropped id. The change adds no owned object.

**Seeded sample.** None of the 15 sampled targets (0.2, 0.4, 0.5, 1.2, 1.7, 3.1, 3.3, 4.1, 5.5, 5.6, 5.7, 6.3, 6.4, 7.1, 7.5) falls in the changed docstring lines. Their text is unchanged since the rounds that checked their locators (r6–r9). The README flags no locator as unverified.

**Adversarial pass.**

New rows for the changed passage, computed this round:

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Docstring 32–35, "carrier absent" | both pins | 358314d: `Rank24/` absent, 0 hits for `leechLattice`; 2fd255d: `Leech/Basic.lean:236` | True at the branch pin; contradicts README 135 (R01) |
| Docstring 36, headline form | `Λ₂₄`, `b : Basis (Fin 24) ℤ leechLattice` | elaborates at 2fd255d (53 sorries, exit 0); `μ² = 2`, det 1, `ρ = 1`, `Θ = 2¹²π¹²/12! ≈ 7.90354` | Pass at 2fd255d; R02 |
| Basis independence of the headline | `b' = U·b`, `U ∈ GL₂₄(ℤ)` | `gramForm_eq_actGL` (line 492) gives `UᵀAU`; covering radius is `GLₙ(ℤ)`-invariant (README 3.2); ℤ, basis 1 vs −1: both [4]→ μ = 1 | Pass |
| 7.5 `fvIndex_rankOne` at the two pins | m = 6 | Gram [12], index 2 at 358314d; Gram [6], index 1 at 2fd255d; README 7.5: 1 | R01 |

Rows carried forward from the r9 report (`PRREVIEW-LatticePackingsAndPerfectForms~9`), for statements this diff leaves untouched:

| Statement | Instances | Values (r9, or earlier rounds via r9) | Result |
| --- | --- | --- | --- |
| 80, 137, 139 heading pointers | three headings | `### From Mathlib` 312, `### From Tau Ceti` 340 | Pass |
| 121, source of 196560 | TS 8D vs Tau Ceti | TS 8D is the sphere-packing model; `kissingNumber_leechLattice = 196560` at 2fd255d | Pass at 2fd255d; R01 |
| 290, TS consumer bullet | 8B | `Θ_{E₈} = E₄`, `r_{E₈}(2) = 240` | Pass |
| 3.4 Needs, `gramForm` inputs | `Λ₂₄` | `isPosDef_`, `finrank_ = 24`, disc 1 | Pass at 2fd255d; R01 |
| 5.7 Needs, Leech corollary | n = 24 | `24 = 24·1 + 8·0`, `t = 11`, min `2·1 + 2 = 4` | Pass at 2fd255d; R01 |
| 5.7 cusp inputs | d = 2..14 | dims 0, 1, 1, 1, 1, 2, 1; all < 2 except d = 12 | Pass |
| Scope 134–138, Leech facts | 9 names | rank 24, even, unimodular, disc 1, min 4, kissing 196560 | R01 |
| 135, R24 Layer 6 | odd shift `s` | `B(s,s) = 4`; coordinate sum 20 ≡ 0 mod 4 | Pass |
| 4.11 lower witness | `Λ₂₄` | `δ = 1`; `γ = 4` | Pass at 2fd255d |
| 7.5 Checks | Gram [15]; ⟨6⟩; [12] | {1,4,11,14}, index 2; {1,5}, index 1; {1,5,7,11}, index 2 | Pass |
| `fvIndex_rankOne` (formula) | m = 3, 4, 5, 6, 8, 12, 15, 30 | 1, 1, 1, 1, 1, 2, 2, 2 | Pass at 2fd255d |
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
| 1.8 Hermite; `IsPrimitive.exists_basis` | [4]; A₂; I₂ | 1 ≤ 1; 2/√3; 1 < 1.15470 | Pass |
| 1.9 constants, bounds | n = 0..8; A₂, A₃, I₃ | 4 ≤ 4.8634; 8 ≤ 58.361; 1 ≤ 14.590 | Pass |
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
| 6.1–6.4 | ⟨1⟩⁴; diag(1,2,5,5); diag(1,2,5,10) | 7 = 4+1+1+1; misses 15 only; universal | Pass |
| 7.1–7.3 tensor, Kitaoka | A₂⊗A₂; A₂⊗D₄; `scale` | det 81, min 4, kiss 18; 1296; [2]·4 = [8] | Pass |
| 7.4 | [8]; [0] | O(b) = {1,3,5,7}, O(q) = {1,7}; [0] excluded | Pass |
| Worked rows | bcc; [[2,1],[1,3]]; E₈; ⟨15⟩ | det 128, min 6, Θ ≈ 1.46350; #Aut 4; Δ = π⁴/384; δ = 1/2, μ = √15/2, Θ = 1 | Pass |

**Remarks on unchanged text (no change asked).**
- The 7.5 Festi–Veniani citation could carry "Theorem 2.8, p. 9".

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, Ch. 21 and 23; Conway–Parker–Sloane | 3.1, 3.4 (Leech covering radius `√2`, the value in the changed docstring) | publisher paywall; the densities were checked by computation, the value `√2` itself is taken from the citation |
| B. Venkov, *Réseaux et designs sphériques* | 4.4, 5.2–5.7 | r6: the sources service found no legal copy (text unchanged) |
| M. Bhargava, Contemp. Math. 272 | 6.2, 6.3 | r6: AMS landing page only |
| Kitaoka, Thm 7.1.1 | 7.2 | paywall; checked through Coulangeon–Nebe in r6 |
| Schürmann, Ch. 2 | 1.9 | AMS paywall; checked against the Tau Ceti declarations |
| Repair report for 48b5b50 | R01, R02 | not among the files given to this review, so whether either finding was answered "not actionable" is unknown |

Ownership against open pull requests was checked only through `overlaps.md` and the r9 grep (`coveringRadius`, "covering radius", "deep hole": this roadmap only); the change adds no object.

## Source issues

- none
