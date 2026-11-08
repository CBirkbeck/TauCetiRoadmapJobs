# Review of DerivedModuleAlgebra (pull request #1701 at 402ded3)

**Verdict:** needs changes

This is an incremental re-review of the 25 lines of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` that changed since `54b43a0`; `Suggested.lean` is unchanged. The gate passes and the dependency check reports no problem. There are three findings, all P3:

- R01 is new. It comes from the repair: one of the new Checks needs `k ≠ 0`.
- R02 carries forward the half of the previous R02 that is still open.
- R03 is the previous R03, not repaired.

## R01 (P3) — The new unit-reflection Check fails for `k = 0`

**Location.** `README.md:2432–2436`: “For `A_n = k[t]/(t^(n+1))`, unit reflection holds: … `t` maps to `0` and is not. … the kernel of `A_1 = k → A_0 = 0` contains the non-nilpotent `1`”.

**Claim.**
- `t` is not a unit of `k[[t]]`.
- `1 ∈ k` is not nilpotent.
- So the shifted tower is excluded only by `hnil` at `n = 0`.

**Witness.** Nothing in the Check or in the Conventions (README:87–98) says that `k` is nonzero. For `k = 0`:
- every `A_n` and `k[[t]]` is the zero ring;
- `t = 0 = 1` is a unit;
- `1 = 0` is nilpotent.

So both claims fail. The §1.E.1 Check at README:2470 does say “for a field `k`”.

**Repair.** Start the Check with “For a field `k` and `A_n = k[t]/(t^(n+1))`, …”.

**Test.** Take `k` a field.
- `1 ≠ 0`, so `1^m = 1 ≠ 0` and `1` is not nilpotent.
- `t` has constant term `0`, so it is not invertible in `k[[t]]`.
- `(1 + t)⁻¹ = Σ (−t)^m`.
- With `hnil` for every `n`, the elaborated `ringTowerLimit_jacobson` excludes the shifted tower.

## R02 (P3) — Row 75 of the cited-name table still leaves `isPerfect_baseChange` outside a code span

This is the part of the previous R02 that is not repaired.

**Location.** `README.md:75`: “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |”.

**Claim.** The left column lists the Lean names other roadmaps cite.

**Witness.**
- Every other cited name in the table is in backticks.
- ArithmeticLocallySymmetricSpaces cites `isPerfect_baseChange` as a Lean name, at its open head #871: README:511, 666, 674.

**Repair.** Write `` `isPerfect_baseChange` `` in row 75.

**Test.** The gate already accepts backticked cited names in this table that `Suggested.lean` does not declare: `derivedLimit_surjective` and `limOne_mul_p` (README:65), `ringCompletionUnit` (README:71). On this head `readme-ids-missing` is 0.

## R03 (P3) — The pull-request description still says the change is README only

This is the previous R03 (before that R04 and R06). It is not repaired.

**Location.** The pull-request description (data):
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Claim.** The description matches the change.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `343 1227` for `Suggested.lean`.
- `robyRepresentability` occurs in neither main's nor this head's README or `Suggested.lean`.
- README:2608–2613 now lists eighteen consumers.

**Repair.**
- Delete “README only; `Suggested.lean` is unchanged”.
- Say instead that the head replaces main's `Suggested.lean` by the 22 headline theorems and the definitions they need, and that cited names resolve through the table at README:41–76.
- Replace `PD.robyRepresentability` by `DividedPowerAlgebra.homogeneousLawEquiv` (README:113, 266).
- Replace “Thirteen” by “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2608–2613.

## Previous findings

- **R01 — repaired.** README:2468 reads “`A_n = k[t]/(t^(n+1))` and `M_n = A_n`”; README:2470–2472 read “`A_n = k[t]/(t^(n+1))` … `H^−1(M_n) = (t^n) ≅ k`”; README:2476 reads “`A₀ = B/I = k`, `A_n = B` for `n ≥ 1`”. The new Check at 2432–2436 is R01 above.
- **R02 — partly repaired.** README:2612–2616 now list AdicEtaleGeometry and PurityOfBranchLocus (§0.K.1), AdicSpacesPartIII (§1.1 and §S.1), AdicSpacesPartIV (§S.1) and RepresentationTheory (§1.M.2). README:75 still reads “`PerfectComplex.IsPerfect`, isPerfect_baseChange” (R02 above).
- **R03 — not repaired.** The description still reads “README only; `Suggested.lean` is unchanged” and still cites `PD.robyRepresentability` (R03 above).

## Verified sound

### Gate, dependencies, worktree

- The worktree is at `402ded3aad2437bc3191b672c04648ab01e6e756`, clean.
- `git diff --stat 54b43a05 HEAD` changes only `README.md`, with 17 insertions and 8 deletions.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- My gate run prints every counter as 0 and `OK`. The worker's record for this head has `build=0`.
- Dependency check output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2367 edges, 0 problem(s)
```

- The only roadmap supplier is still AlgebraicTopology Stage 6 item 0, which is on main. No supplier gap is declared.

### Elaboration and signatures

- `lake env lean` on `Suggested.lean` gives exactly 22 “declaration uses `sorry`” warnings, at lines 105, 120, 143, 160, 183, 201, 223, 254, 263, 270, 276, 285, 304, 323, 360, 366, 372, 379, 392, 405, 429 and 442, and nothing else.
- I elaborated `#check @` of all 32 declarations in one scratch file, with no error.
- The elaborated `ringTowerLimit_jacobson` carries `hsurj` and `∀ (n : ℕ) (x : A (n + 1)), τ n x = 0 → IsNilpotent x`. That includes `n = 0`, as the new Check requires, and concludes from `π 0`, as §1.E.0 now indexes.
- `Suggested.lean` is unchanged since `54b43a0`, so the one-tactic probe and the headline list are carried from the previous review: all 22 bodies resisted the probe, and no statable headline is absent.

### The source of the re-indexed §1.E.1

- StacksMA 13279–13297 is Lemma 15.99.1, Tag 0CQF; StacksMA 13310–13326 is Lemma 15.99.3, Tag 0CQG, p.288.
- Stacks indexes from `A_1`: its first transition is `A_2 → A_1`, and the unit-reflection step (line 13320) goes to `A_1`.
- Here these are `A_1 → A_0` and `A_0`, a pure re-indexing of the same statement.

### Seeded sample

- None of the 15 sampled targets falls in the changed passages. The sample is 0.1, 0.2.2, 0.4, 0.7, 0.8, 0.9, 0.10, 0.17, 0.25, 1.2, 1.3, 1.4, 1.5, 1.6 and 1.8. The changed passages are the §1.E.0 Checks, §1.E.1, the Layer 4 Examples and Downstream consumers.
- As the incremental brief directs, I did not re-read the sample.
- The previous review read 0.4, 0.8, 0.10, 0.25, 1.3 and 1.4 against their sources, BMS19 4.7 for §1.8 and DoldPuppe for 0.2.2, and found them exact.

### Cross-roadmap citations in the changed text

All resolved on main at `a8eadd4`.

- **New consumers:**
  - AdicEtaleGeometry README:489, 8123, 8145 (§0.K.1);
  - PurityOfBranchLocus README:32, 87, 219, 231 (§0.K.1);
  - AdicSpacesPartIII README:406–439 (“§§1.T.1 and 1.1”, including §1.1's cofinal comparison) and 14 citations of §S.1;
  - AdicSpacesPartIV README:243, 2366, 2899 (§S.1);
  - RepresentationTheory/ArtinAlgebras README:61, 210, 594 (§1.M.2).
- **Main has no other consumer.** It has nine other READMEs that mention this roadmap. Eight are consumers, all now listed. SchemeAndStackFoundations (README:144, 7385) names this roadmap only as downstream of itself.
- **Section ids.** The sections the new sentence names exist in this README: §0.K.1 (:640), §S.1 (:877), §1.1 (:1771), §1.M.2 (:2551).
- **Overlaps.**
  - `overlaps.md` reports no other pull request changing this roadmap.
  - Its dropped §1.T.1 ids are still mapped at README:34–36, which this change does not touch.
  - `roadmaps grep 'isPerfect_baseChange'` over main and the 466 open heads finds only ArithmeticLocallySymmetricSpaces (#871) and main's old `Suggested.lean`.

### Adversarial table

- Rows marked “this review” were computed for the statements and Checks the diff adds or changes.
- Rows marked “r9” are carried from the review of `54b43a0`. The diff leaves those statements untouched.

| Statement | Instances | Values on each side; wrong model excluded | Result | Row |
| --- | --- | --- | --- | --- |
| New §1.E.0 Check, unit reflection (README:2432–2436) | `k` a field, `A_n = k[t]/(t^(n+1))`; shifted `A_n = k[t]/(t^n)`; `k = 0` | `π₀(1+t) = 1`, `(1+t)⁻¹ = Σ(−t)^m`; `π₀(t) = 0`, `t` not a unit. Shifted: `A₀ = 0`, `ker(A₁ = k → 0) ∋ 1`, `1^m = 1 ≠ 0`, so `hnil` fails at `n = 0`. `k = 0`: `t = 0 = 1` a unit, `1` nilpotent | True for a field `k`; false for `k = 0` (R01) | this review |
| `ringTowerLimit_jacobson`: is `hsurj` used? | `A₀ = ℚ`, `A_n = ℤ` for `n ≥ 1`, `τ₀` the inclusion, identities after | all kernels `0`, so `hnil` holds; the limit is `ℤ`; `π₀(2) = 2 ∈ ℚ^×` but `2 ∉ ℤ^×` | `hsurj` is needed, and the statement carries it | this review |
| `ringTowerLimit_jacobson`, route | general tower | `τ(y)` a unit and `τ(z) = τ(y)⁻¹` give `yz ∈ 1 + nil`, a unit. The family `π_n(r)⁻¹` is compatible, and uniqueness in `IsRingTowerLimit` gives `rs = 1` | True | this review |
| §1.E.1 statement, `(A_n)_(n≥0)` | StacksMA 13310–13326 | `A_2 → A_1` and the unit step to `A_1` there; `A_1 → A_0` and `π 0` here | Same statement | this review |
| §1.E.1 Check, `M_n = A_n` | `A_n = k[t]/(t^(n+1))`, `n = 0, 1` | `Rlim = k[[t]][0]` (surjective transitions, `lim¹ = 0`); `k[[t]] ⊗^L A_n = k[[t]]/(t^(n+1))`, which is `k` and `k[t]/(t²)` | True | this review |
| §1.E.1 Check, `[A_n →t A_n]` | `n = 0, 1, 2` | `H^−1(M₀) = k = (t⁰)`, `H^−1(M₁) = (t)/(t²) ≅ k`; `H^−1(M₂) → H^−1(M₁)` sends `t² ↦ 0`; `H^−1(M) = ker(t on k[[t]]) = 0`; `H⁰ = k` at every stage; termwise reduction `[A_n →t A_n]` | True | this review |
| §1.E.1 Check, the `B` tower | `A₀ = k`, `A_n = B` for `n ≥ 1` | `f ∈ I` in `x₁…x_m` has `f^(m+1) = 0`; `x₁⋯x_r ∈ I^r` is nonzero; kernels `I`, then `0`; limit `B`; `π₀(1+x₁) = 1`, `(1+x₁)(1−x₁) = 1` | True | this review |
| Layer 4 Example, `A_n = ℤ/p^(n+1)` | `p = 2` | `A₀ = F₂`; kernels `2^(n+1)ℤ/2^(n+2)ℤ`, square zero; `ℤ₂ ⊗ ℤ/2^(n+1) = ℤ/2^(n+1)`; `π₀(3) = 1` and `3 ∈ ℤ₂^×`; `π₀(2) = 0` and `2 ∉ ℤ₂^×` | True | this review |
| Downstream consumers (README:2608–2618) | main at `a8eadd4` | 9 other READMEs mention this roadmap; the 8 consumers are all listed; the cited sections exist | Complete | this review |
| `nonempty_bicomplexSecondPageIso` | `K_(1,0) = ℤ --2→ K_(0,0) = ℤ`, `k = 0` | page 3 is `ℤ/2` at `(0,0)`, equal to `H_0(Tot)` | True | r9 |
| `simplicialTensorComparison` (1,1) | `x ∈ X₁`, `y ∈ Y₁` | `d(s₁x⊗s₀y − s₀x⊗s₁y) = ∇(dx⊗y − x⊗dy)`; the opposite sign is not a chain map | True | r9 |
| `bisimplicialDiagonalComparison` | constant `P`; `Γ₀(A[1])^⊠2` | `P` in degree 0; `A` in degree 2 on both sides | True | r9 |
| `quasiIso_whiskering_of_projective` | `Γ₀[ℤ →2 ℤ] → ℤ/2`, `F = (−)^⊗2` | `H₁ = ℤ/2` against `0` | Projectivity is needed | r9 |
| `exteriorPower_decalage` / `symmetricPower_decalage` | `N = R, R²`, `n = 0, 1, 2`; `N = ℤ/2` | `H₂ = R = Γ²R`; `R⁴ → ∧²R²` has kernel of rank 3; `Γ²_ℤ(ℤ/2) = ℤ/4` | True for flat `N` | r9 |
| `derivedLimit_isTriangulated` | `ℤ` with `×p`; levelwise-split data | `H¹ = ℤ_p/ℤ`; the levelwise model would force `⊕k → ∏k` onto, which fails | Levelwise data is excluded | r9 |
| Derived completeness (§§1.2–1.3) | `I = 0`, `(1)`, `(p)`; `ℤ_p ⊕ ℚ_p[−1]` | all complete; only `0`; `ℤ ↦ ℤ_p`, `ℤ[1/p] ↦ 0`; `H¹ = ℚ_p` fails at `f = p` | True | r9 |
| `IsCompletelyFlatModule` and §1.8 | `ℤ/4` at `2`; `ℤ_p`; `ℤ/2` over `ℤ/4` | `c = 2`, `M[2] = {0,2}`; flat; `Tor₁ = ℤ/2`, so `hflat` is needed | True | r9 |
| `IsPerfect`, `isPerfect_*`, `pseudoCoherent_residueCriterion` | `eA` over `k×k`; `[k[[t]] →t k[[t]]]`; zero ring | Euler ranks `(1,0)`; fibre `[k →0 k]`, so `[−1,0]` is needed; `E = 0` | True | r9 |
| `Matlis.biduality_*` | `ℤ_p` with `E = ℚ_p/ℤ_p`; `ℤ_(p)` | `End E = ℤ_p`; for `ℤ_(p)`, `D(E) = ℤ_p ≠ ℤ_(p)` | Completeness is needed | r9 |
| 0.2, 0.2.1, 0.4, 0.8, 0.10, 0.12 | `F_p ⊗^L F_p`; `ℚ`; `k[ε]/ε²` in characteristic 2; `ℤ → ℤ → ℤ/3`; `ℤ → F_p` | `H^(−1) = F_p`; `a ↦ a/d`; zero map with `H^(−1) = H⁰ = B`; iso on `ℤ/3`; `L = F_p[1]` | True | r9 |
| 0.14–0.16, 0.25, 0.7 Check | `ℤe`, `F₂e`, `n = 2`; `ℤ/4 → F₂`; `k[x,y]/(x,y)²` | `∧²(ℤe) = 0`; `e·e = 2γ₂(e)`; `JB′ = 0`, not flat; `H^(−2) = k` | True | r9 |
| 1.1, 1.1.1, 1.4, 1.5, 1.7, §S.1 Check | `×3` tower; `RHom(ℤ[1/p], ℤ)`; `ℤ_p ⋉ ℚ_p/ℤ_p`; matrix `[[1,1],[0,1]]` | `−1/8 ∉ ℤ`; `lim¹ = ℤ_p/ℤ`; Koszul limit `T_p`; `E₃ = 0` | True | r9 |

### Remarks on untouched text (no change requested)

- The previous report remarked that `ringTowerLimit_jacobson` does not use `hsurj`. The `ℤ ⊂ ℚ` row above refutes that remark, and the statement is right to carry `hsurj`.
- The §1.E.0 Checks at README:2359 and 2400 also leave `k` unqualified. Both are true for every ring `k`.

## Not verifiable

- **IllusieCC, Chapter II, 1.2.6.2 (§0.9).** The Springer volume has no open copy; this is carried from the previous review.
- **Ownership against open pull requests.** I checked it for the objects this change touches, with `roadmaps grep` over the 466 open heads and main. For the rest of the roadmap it is carried from the previous review.

## Source issues

- none
