# Review of LatticePackingsAndPerfectForms (pull request #1723 at 5f707c6)

**Verdict:** needs changes

This is an incremental re-review. It covers the 68 lines changed since f1e5683, and every passage that cites them or that they cite.

## R01 (P2) — The branch is still pinned to Tau Ceti 358314d, and the repair cites ten more declarations that exist only at main's pin

Re-raised: R01 of the previous review. That review gave it no "not actionable" reason, and the repair report gives none either.

**Location:**
- `lake-manifest.json` still pins Tau Ceti `358314d` and Mathlib `f6090c7`.
- README 134–138: "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice` …".
- Table rows 350–352.
- The 3.4, 4.11 and 5.7 Needs lines and dependency rows (1031, 1045, 1371, 1391, 1598, 1614).
- 7.5 at 1902–1910 and its Needs and row (1933, 1947).

**Claim:** The previous R01 is not repaired: there is still no merge of main, and the pins are unchanged. The repair also adds citations that are written against main's pin `2fd255d`:
- Nine Leech names and `ofGramMatrix_singleton_eq_rankOne` do not exist at `358314d`.
- Three rankOne discriminant names do exist at `358314d`, but there they state the old `⟨2m⟩` normalization. So 7.5's "`b(kg, lg) = kl/m`", "`q(kg) = k²/(2m)`" and "`A_⟨m⟩` with `ℤ/m`" are false at this branch's pin.

**Witness:**
- At 358314d:
  - there is no `IntegralLattice/Rank24/` directory and no `RankOne/` directory;
  - `RankOne.lean:311` maps to `ZMod (2 * m).natAbs`;
  - `:347` gives `k*l/(2*m)`;
  - `:365` gives `k^2/(4*m)`.
- A name-by-name check of the scope bullets and the *From Tau Ceti* table finds 20 cited declarations absent at 358314d and present at 2fd255d. Ten of them are new in this change.

**Repair:**
1. Merge origin/main into the branch. `git merge-tree --write-tree origin/main HEAD` exits 0 at main `1bea835` (tree `8637b9f`). The merge moves `lake-manifest.json` to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`.
2. Re-run the gate. All nine `TauCeti.*` imports of `Suggested.lean` exist at 2fd255d.
3. Then apply R02.

Tested: every name in rows 350–352 and in 134–138 resolves at 2fd255d:
- `Rank24/Leech/Basic.lean:236` (`leechLattice`, namespace `TauCeti`);
- `Minimum.lean:173, 189`;
- `MinimalVectors.lean:758`;
- `RankOne/Basic.lean:118`;
- `RankOne/Discriminant.lean:157, 184, 202`.

## R02 (P2) — The new `Suggested.lean` docstring contradicts README 134, and after the merge the Leech covering radius is a statable headline left unstated

**Location:**
- `Suggested.lean` 31–35: "both need Tau Ceti's Leech lattice `TauCeti.leechLattice` … which the Tau Ceti revision this file elaborates against does not contain".
- README 134: "**From Tau Ceti at the pin**, the Leech lattice … as `TauCeti.leechLattice`".

**Claim:** Both passages are new in this change, and they disagree about what the pin contains.
- At this branch's pin, the docstring is right and README 134–138 is wrong (R01).
- At main's pin, which R01's merge brings in, the README is right and the docstring is false.

After the merge, `μ(Λ₂₄) = √2` can be stated with the definitions the file already has. A statable headline that is absent is P2.

**Witness:**
- The file already has `gramForm (hL : L.IsPosDef) (b : Basis (Fin n) ℤ L)` at line 448 and `PosDefForm.coveringRadius` at line 275.
- At 2fd255d, `TauCeti.isPosDef_leechLattice` is at `Rank24/Leech/Basic.lean:299`.
- Neither Tau Ceti nor any roadmap states a covering radius. A grep for `coveringRadius`, "covering radius" and "deep hole" at 2fd255d is empty, and `roadmaps grep` returns only this roadmap.

**Repair:** After R01's merge:

1. Add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`.
2. In `section Lattice`, add:

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

3. Name it in 3.4's API.
4. Delete the covering radius from the docstring sentence. If the deep-hole classification stays unstated, say what it lacks at 2fd255d. The carrier is no longer the reason: `Rank24/{RootSystems,Niemeier}.lean` exist there.

Not elaborated here, because this branch's pin lacks the module. The values are in the table: `μ² = 2`, `Θ = 2¹²π¹²/12! ≈ 7.90354 ≥ 1`.

## R03 (P3) — The new Leech Needs lines omit `isPosDef_leechLattice`, and 5.7 takes 196560 from a different Leech carrier

**Location:**
- 3.4 Needs (1031–1032) and row 1045: "T `TauCeti.leechLattice`, `TauCeti.minimum_leechLattice` and `TauCeti.discriminant_leechLattice`".
- 5.7 Needs (1598) and row 1614: "… `TauCeti.minimum_leechLattice`; TS 8B, 8D".
- Line 137: "tabulated under *What Tau Ceti supplies*".

**Claim:**
- 3.4 reads `Λ₂₄` "in the real model of the Gram matrix of any `ℤ`-basis", with determinant 1. 5.7's Leech corollary applies `venkov_shell_isSphericalDesign`. Both pass through `gramForm`, which takes `hL : L.IsPosDef`, and 3.4 needs a basis indexed by `Fin 24`. Yet `isPosDef_leechLattice` is in neither Needs line, and `finrank_leechLattice` is missing from 3.4's.
- 5.7 keeps TS 8D for "the 196560 minimal vectors". TS 8D's `Λ` is the sphere-packing project's `LeechLattice`, not `TauCeti.leechLattice`.
- No heading is named *What Tau Ceti supplies*.

**Witness:**
- `Suggested.lean:448` (`gramForm … (hL : L.IsPosDef)`) and `:613` (`venkov_shell_isSphericalDesign {L} (hL : L.IsPosDef)`).
- README 1343–1345 itself takes determinant 1 from the discriminant "with `TauCeti.isPosDef_leechLattice`".
- ThetaSeries (main) lines 966–968 and 1134 name `SpherePacking/Dim24/LeechLattice/*`.
- The table heading is `### From Tau Ceti` (line 339).

**Repair:**
- 3.4 Needs and row 1045: add T `TauCeti.isPosDef_leechLattice` and `TauCeti.finrank_leechLattice`.
- 5.7 Needs and row 1614:
  - add T `TauCeti.isPosDef_leechLattice` and `TauCeti.kissingNumber_leechLattice` (`Rank24/Leech/MinimalVectors.lean:758` at 2fd255d);
  - change "TS 8B, 8D" to "TS 8B";
  - drop "(8D)" and "8D `r_Λ(4) = 196560`" from the TS bullets at 121 and 290, since 5.7 was their only consumer.
- At 137, and at 80 and 139 which have the same slip, write *From Tau Ceti*.

Tested on the instances:
- `venkov_shell_isSphericalDesign` at `n = 24`, `m = 1`, `r = 0` requires `hmin : L.minimum = 4` (`minimum_leechLattice`) and `hL`.
- `kissingNumber_leechLattice : leechLattice.kissingNumber = 196560` is about the carrier 5.7 names.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d`. README 134 says "**From Tau Ceti at the pin**, the Leech lattice `Λ₂₄` as `TauCeti.leechLattice`", which is absent there. Raised again as R01, with ten more such names.
- R02 — repaired:
  - README 1903–1904 reads "Tau Ceti's `rankOne m` (`…/RankOne/Basic.lean`) is the lattice `⟨m⟩` itself: its singleton basis has Gram entry `m`".
  - The Check at 1928–1931 separates `⟨6⟩` (index 1) from Gram [12] (index 2).
  - Both are true at 2fd255d. At this branch's pin they are R01.

## Verified sound

**Gate.**
- The worker's gate at 5f707c6 reports every check 0, `build=0`, OK.
- Re-run with the brief's command, it prints one failure: `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. This is the default-order false positive that r5–r7 recorded. Every other check is 0.
- The dependency check against the candidate order prints:

      depcheck: 235 roadmaps, 2261 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The R24 supplier edge is gone; README 135 still names Rank24LatticeConstructions (on main) as the specification of the construction.
- No file outside the folder changed.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 warnings, all `declaration uses 'sorry'`.
- The `Suggested.lean` diff is confined to module-docstring lines 31–35. The 112 elaborated `#check @name` types of `signatures.md` therefore stand unchanged, and the single binder lead is still `polynomialsOfDegreeLE`, whose consumers keep all binders.
- The r6 padding probe carries over: no sorried theorem closes in one tactic.

**Library declarations opened.**
- Tau Ceti at 2fd255d:
  - `Rank24/Leech/Basic.lean`: `leechLattice : IntegralLattice (Fin 24 → ℚ)` at 236, `isEven_` at 285, `isUnimodular_` at 289, `discriminant_ … = 1` at 295, `isPosDef_` at 299, `finrank_ … = 24` at 304;
  - `Minimum.lean`: `minimum_leechLattice … = 4` at 173, `vectorsOfNorm_two_leechLattice … = ∅` at 189;
  - `MinimalVectors.lean:758`: `kissingNumber … = 196560`;
  - `RankOne/Basic.lean`: `rankOne a` with Gram entry `a` at 45, `ofGramMatrix_singleton_eq_rankOne` at 118;
  - `RankOne/Discriminant.lean`, with `[NeZero a]`: `rankOneDiscriminantEquiv … ≃+ ZMod a.natAbs` at 157, pairing `k*l/a` at 184, quadratic map `k^2/(2*a)` with `(ha : Even a)` at 202;
  - `Gram.lean:355`: `Isometry.ofGramMatrixEq`;
  - `PosDef/Minimum.lean:83`: `minimum` is the least integral norm.
- Tau Ceti at 358314d: `RankOne.lean` 98, 311, 347, 365, with the `⟨2m⟩` normalization; `Gram.lean:326` `ofGramMatrixEq`.

**Cross-roadmap citations resolved (2).**
- Rank24LatticeConstructions (main) Layer 6, line 312: "the Leech lattice by Construction B and an odd shift", with `s = (−3/2, 1/2, …)`. It matches README 135 and Tau Ceti's file docstring.
- ThetaSeries (main) 8D, lines 966–974: on the sphere-packing carrier (R03).

**Ownership.**
- `overlaps.md` lists no other open pull request changing this roadmap and no dropped id.
- `roadmaps grep` for the Leech covering radius and deep holes finds only this roadmap.
- The change adds no owned object.

**Seeded sample, where it falls in the changes.**
- 4.11: the lower witness now rests on Tau Ceti's `minimum_leechLattice` and `discriminant_leechLattice` with `isPosDef_leechLattice`, which is correct.
- 7.5: FestiVeniani was fetched (arXiv:2102.09411v2):
  - Theorem 2.8, p. 9 (FestiVeniani lines 401–403), gives the multiplicity as a double-coset count.
  - The proof of Theorem 3.4, p. 14 (lines 619–622), reads it as the index of the image of `O(W)` in the discriminant-form group when Hodge isometries act trivially.
  - This supports "the role of the index".
- The rank-one formula is the roadmap's own computation and is checked in the table.

**Remarks on unchanged text (no change asked).**
- The 7.5 Festi–Veniani citation could carry "Theorem 2.8, p. 9".
- At 2fd255d, Tau Ceti's `ThetaSeries/Leech.lean:80` states `Θ_Λ = E₄³ − 720Δ` for `TauCeti.leechLattice`. That is ThetaSeries' 8D to update.

**Adversarial pass.**

New rows for the changed statements, computed this round:

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Scope 134–138, Leech facts | 9 names at both pins | 2fd255d: rank 24, even, unimodular, pos. def., disc 1, min 4, no norm-2 vectors, kissing 196560; 358314d: no `Rank24/` | R01 |
| 135, R24 Layer 6 | odd shift `s` | `B(s,s) = (9/4 + 23/4)/2 = 4`; `2s = (−3,1,…,1)`, coordinate sum 20 ≡ 0 mod 4 | Pass |
| 3.4, `μ(Λ₂₄) = √2` | min 4 | `ρ = 1`, `μ² = 2`; `Θ = 2¹²·π¹²/12! = 4096·0.00192957 = 7.90354 ≥ 1` | Pass; Needs R03; Lean R02 |
| 4.11 lower witness | `Λ₂₄` | `δ = (√4/2)²⁴/√1 = 1`; `γ = 4/1^{1/24} = 4`; disc 1 and pos. def. give det `+1` | Pass at 2fd255d |
| 5.7 Leech corollary | n = 24 | `24 = 24·1 + 8·0`, `hmin`: `2·1+2 = 4 = min`, `t = 11 − 0 = 11`; `hL` needed | R03 |
| 5.7, 196560 | TS 8D vs Tau Ceti | TS's `Λ` is `SpherePacking…LeechLattice`; `kissingNumber_leechLattice` is on `TauCeti.leechLattice` | R03 |
| 7.5 `rankOne` normalization | m = 6, 15 | 2fd255d: Gram [6], index 1; Gram [15], index 2. 358314d: Gram [12], index 2; Gram [30], index 2 | Pass at 2fd255d; R01 |
| 7.5 discriminant inputs | m = 6 | `#A`: 6 at 2fd255d, 12 at 358314d; `b(g,g)`: 1/6 vs 1/12; `q(g)`: 1/12 vs 1/24 | R01 |
| 7.5 Checks | Gram [15]; ⟨6⟩; [12] | unit squares mod 15 give {1,4,11,14}, index 2; ⟨6⟩ mod 12 gives {1,5}, index 1; [12] mod 24 gives {1,5,7,11}, index 2 | Pass |
| `fvIndex_rankOne` (Lean formula) | m = 3, 4, 5, 6, 8, 12, 15, 30 | 1, 1, 1, 1, 1, 2, 2, 2 | Pass |
| `Suggested.lean` docstring 31–35 | both pins | 358314d: module absent; 2fd255d: `Rank24/Leech/Basic.lean:236` | R02 |

Rows carried forward from the r7 report (`PRREVIEW-LatticePackingsAndPerfectForms~7`), for statements this diff leaves untouched:

| Statement | Instances | Values (r7, or r6 via r7) | Result |
| --- | --- | --- | --- |
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
