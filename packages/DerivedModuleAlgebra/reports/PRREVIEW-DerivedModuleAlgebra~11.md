# Review of DerivedModuleAlgebra (pull request #1701 at 8b3bc25)

**Verdict:** needs changes

This is an incremental re-review of the 3 lines of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` that changed since `402ded3`. `Suggested.lean` is unchanged. The gate passes and the dependency check reports no problem.

The repair fixes the previous R01 and introduces nothing new. Two P3 findings remain, both carried over unrepaired from the previous review.

## R01 (P3) — Row 75 of the cited-name table still leaves `isPerfect_baseChange` outside a code span

This is the previous R02, not repaired.

**Location.** `README.md:75`: “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |”.

**Claim.** The left column lists, as Lean names, the names other roadmaps cite.

**Witness.**
- Every other cited name in the table is in backticks.
- ArithmeticLocallySymmetricSpaces, at its open head #871, cites `isPerfect_baseChange` as a Lean name at README:511, 666 and 674. I re-ran `roadmaps grep 'isPerfect_baseChange'` on this round.

**Repair.** In row 75, write `` `isPerfect_baseChange` `` in backticks.

**Test.** The gate already accepts backticked cited names in this table that `Suggested.lean` does not declare:
- `derivedLimit_surjective` and `limOne_mul_p` (README:65);
- `ringCompletionUnit` (README:71).

On this head `readme-ids-missing` is 0.

## R02 (P3) — The pull-request description still does not match the change

This is the previous R03 (and before that R04 and R06). It is not repaired.

**Location.** The pull-request description (data):
- “README only; `Suggested.lean` is unchanged”;
- “Polynomial laws with Roby representability (`PD.robyRepresentability`)”;
- “Thirteen roadmaps consume it”.

**Claim.** The description matches the change.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `343 1227` for `Suggested.lean`.
- `robyRepresentability` occurs nowhere in this head's README or `Suggested.lean`, nor in main's README.
- README:2609–2614 list eighteen consumers.

**Repair.** This repair is an edit of the pull-request description on GitHub, not of the folder.
- Delete “README only; `Suggested.lean` is unchanged”.
- Say instead that the head replaces main's `Suggested.lean` with the 22 headline theorems and the definitions they need, and that cited names resolve through the table at README:41–76.
- Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`, as at README:114 and 267.
- Replace “Thirteen” with “Eighteen”.

**Test.** Re-read the description against `git diff --stat origin/main...HEAD` and README:2607–2614.

## Previous findings

- R01 — repaired: README:96 now reads “In Checks and examples, a coefficient ring written `k` is a field; in particular `k ≠ 0`.” README:2433 reads “For a field `k` and `A_n = k[t]/(t^(n+1))`, unit reflection holds”.
- R02 — not repaired: README:75 still reads “| `PerfectComplex.IsPerfect`, isPerfect_baseChange | §1.E.0: `DerivedDeRham.IsPerfect` and its derived scalar change |” (R01 above).
- R03 — not repaired: the description still reads “README only; `Suggested.lean` is unchanged”, still cites `PD.robyRepresentability` and still says “Thirteen roadmaps consume it” (R02 above).

## Verified sound

### Gate, dependencies, worktree

- The worktree is at `8b3bc25ad1e97203b2f11e3109ae38decd250f67`, clean.
- `git diff --stat 402ded3a HEAD` changes only `README.md`: 2 insertions, 1 deletion.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DerivedModuleAlgebra'` is empty.
- My gate run prints every counter as 0 and `OK`, and exits 0. The worker's record for this head also has `build=0`.
- Dependency check output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2367 edges, 0 problem(s)
```

- No supplier gap is declared. The only roadmap supplier is still AlgebraicTopology Stage 6 item 0, which is on main. The diff adds no `*Needs:*` line and no supplier citation.

### Elaboration and signatures

- `lake env lean` on `Suggested.lean` gives exactly 22 “declaration uses `sorry`” warnings and nothing else. They are at lines 105, 120, 143, 160, 183, 201, 223, 254, 263, 270, 276, 285, 304, 323, 360, 366, 372, 379, 392, 405, 429 and 442.
- I elaborated `#check @` for all 32 declarations in one scratch file, with no error.
- The elaborated `ringTowerLimit_jacobson` carries:
  - `∀ n, Function.Surjective (τ n)`;
  - `∀ (n : ℕ) (x : A (n + 1)), τ n x = 0 → IsNilpotent x`, which includes `n = 0` as the repaired Check requires;
  - the conclusion from `IsUnit (π 0 r)`.
- `Suggested.lean` is byte-identical to `402ded3`, so the one-tactic probe and the headline list are carried from the previous review: all 22 bodies resisted the probe, and no statable headline is absent.

### The new convention against every Check that uses `k`

I checked every occurrence of a lone `k` in the README and in `Suggested.lean`.

- **Coefficient rings.** `k` names a coefficient ring in 25 Checks and examples:
  - §0.4 README:1217;
  - §0.7 README:1324;
  - §0.12 README:1493;
  - §0.13 README:1511;
  - §0.25 README:1701 and 1740;
  - §1.1 README:1852 and 1860;
  - §1.5 README:2053;
  - §1.E.0 README:2328, 2358, 2360, 2401, 2427, 2431 and 2433;
  - §1.E.1 README:2469, 2471 and 2476;
  - §1.M.1 README:2527, 2544 and 2548;
  - §1.M.2 README:2587 and 2589;
  - Layer 5 Examples README:2596.
- **None conflicts with the convention.** None takes `k` to be `ℤ`, `ℤ/4` or any other non-field. Five already said “field”: README:1217, 1324, 1740, 1852 and 2471. In §1.M the `k` is the residue field.
- **Indices, not rings.** The other occurrences use `k` as an index: README:645–678, 911 and 1546, and `Suggested.lean`:102–108, 190 and 208. `Suggested.lean`:401–409 binds `[Field k]`.
- **The convention also fixes three Checks that needed `k ≠ 0`** (rows below):
  - README:2328, Euler ranks;
  - README:2427, nonzero Tor in every degree;
  - README:1701, distinct lifts.

### Seeded sample

None of the 15 sampled targets has a statement or locator in the changed lines. The convention governs the `k`-Checks of three of them (§0.4, §0.7, §0.25), which I computed below. For coverage I also computed one row each for the sampled §0.6, §0.9, §0.11 and §1.9, which the previous table did not cover. I re-read §1.9's locators against BMS19:

- Theorem 3.1 is at BMS19 line 751, on printed p.217. Assertion (1) of its proof (line 762) is descent for an arbitrary `M`.
- Remark 3.2 (line 784, p.218) leaves hyperdescent open. §1.9 likewise says hyperdescent is not asserted.
- Lemma 4.4 (line 872, p.220) and Lemma 4.5(2) (line 888, p.221) are the detection statements.
- Corollary 4.8(3) (line 958, p.223) gives flatness modulo every `p^n` under bounded torsion.
- Remark 4.9 (line 973, p.223) passes to the limit through `A/p^n`.

The pages and hypotheses (ordinary p-complete rings with bounded `p^∞`-torsion) agree with the target. The previous reviews read §§0.4, 0.8, 0.25, 1.3 and 0.2.2 against their sources and found them exact; that is not repeated here.

### Cross-roadmap citations and overlaps

- The changed lines cite no roadmap, section or Lean name. `citations.md` therefore has nothing new for them.
- `overlaps.md` reports no other open pull request changing this roadmap and no cited id dropped. The dropped §1.T.1 ids remain mapped at README:34–36, untouched by the change.

### Adversarial table

- Rows marked “this review” were computed for the changed lines, the Checks the new convention governs, and the sampled targets the previous table did not cover.
- Rows marked “r10” or “r9” are carried from the reviews of `402ded3` and `54b43a0`. The diff leaves those statements untouched.

| Statement | Instances | Values on each side; wrong model excluded | Result | Row |
| --- | --- | --- | --- | --- |
| Convention README:96, `k` a field | the 25 `k`-Checks listed above | none uses a non-field `k`; §1.M uses residue fields; index `k` at README:645–678, 911, 1546 is not a ring | Consistent | this review |
| §1.E.0 Check, unit reflection (README:2433–2437, changed) | `k` a field; `A_n = k[t]/(t^(n+1))`; shifted `A_n = k[t]/(t^n)` | `π₀(1+t) = 1`, `(1+t)⁻¹ = Σ(−t)^m`; `π₀(t) = 0` and `t` is not a unit (constant term 0, `k ≠ 0`). Shifted: `A₀ = 0`, `ker(A₁ = k → 0) ∋ 1`, `1^m = 1 ≠ 0`; later kernels `(t^n)/(t^(n+1))` square zero; so `hnil` fails only at `n = 0` | True (previously false at `k = 0`) | this review |
| §1.E.0 Check, `eA` over `k × k` (README:2328) | `k` a field; `k = 0` | ranks of `eA` at the two points: `(1, 0)`, so no bounded finite-free model; at `k = 0`, `A = 0` and `eA = 0` has the model `0` | Needs `k ≠ 0`; now given | this review |
| §1.E.0 Check, `k` over `k[ε]/(ε²)` (README:2427) | `k` a field | periodic resolution `⋯ →ε k[ε] →ε k[ε] → k`; after `⊗ k` differentials are 0, `Tor_i = k` for every `i ≥ 0`; at `k = 0` all vanish | True for `k ≠ 0` | this review |
| §0.25 Check, lifts to `k[ε]/ε²` (README:1701–1703) | `A = T = k`, `B = k[x]` | lifts `x ↦ aε`, `a ∈ k`; `x ↦ 0` and `x ↦ ε` distinct iff `ε ≠ 0` iff `k ≠ 0`; difference derivation `x ↦ ε`; `Der_k(k,k) = 0` | True | this review |
| §0.25 Check, `k[x]/(x³) → k[x]/(x²) → k` (README:1740–1744) | `k` a field | `J = (x²)/(x³)`, `J² = 0`; `H^−1(L_(A/A′) ⊗^L k) = J ⊗_A k = k`; next map `x² ↦ 0` in `(x)/(x²)`, so the connecting map is onto `k ≠ 0` | True | this review |
| §0.4 Check, `B = k[ε]/ε²` (README:1217–1222) | char `≠ 2`; char `2` | `L = [B·x² → B·dx]`, `x² ↦ 2ε dε`; `H^−1 = ker(2ε·) = εB ≅ k ≠ 0`; char 2: map 0, `H^−1 = H⁰ = B` | True | this review |
| §0.7 Check, `k[x,y]/(x,y)²` (README:1324) | Hilbert–Burch `0 → P² → P³ → P` | `Tor₂^P(B,B) = (𝔪B)²`, dimension 4; image of `∧²(I/I²)` spanned by `(0,x)`, `(x,−y)`, `(y,0)`, dimension 3; `H^−2(L) = k`; the naive truncation lives in `[−1,0]` | True | this review |
| §0.6 universal property (sample) | `ℤ → ℤ/p`, `M = ℤ/p`; `ℤ/9 → F₃` | `L = F_p[1]`: `Hom(L,M) = 0`, `Hom(L,M[1]) = Hom(F_p,F_p) = F_p`, realized by `ℤ/p²`; kernel inclusion `1 ↦ 3`: `3 mod 9 ↦ 1`; `1 ↦ 6`: `6·2 = 12 ≡ 3`, so `↦ 2`; order 3 | True | this review |
| §0.9 diagonal model (sample) | constant `ℤ → ℤ/2`; `R• = S•` | `L = (2)/(4)[1] ≅ F₂[1]`, `H₁ = ℤ/2`, whereas `Ω_(F₂/ℤ) = 0`; identity gives `0` | True | this review |
| §0.11 localization and colimits (sample) | `ℤ[X] → ℤ[X^±]`; `∪ A[X₁…X_n]` | relative `L = 0`, `L_(ℤ[X^±]/ℤ) = ℤ[X^±]·dX`; `Ω = ⊕_i A[X]·dX_i` (each element uses finitely many variables), not `∏` | True | this review |
| §1.9 descent (sample) | `ℤ_p → F_p`; `ℤ_p → ℤ_p × ℤ_p`; identity | `F_p ⊗^L_(ℤ_p) F_p` has `H^−1 = F_p ≠ 0`, not p-completely flat; the product map splits the Čech nerve; identity gives `M` | True | this review |
| `ringTowerLimit_jacobson`: is `hsurj` used? | `A₀ = ℚ`, `A_n = ℤ` for `n ≥ 1` | kernels `0`; limit `ℤ`; `π₀(2) = 2 ∈ ℚ^×`, `2 ∉ ℤ^×` | `hsurj` needed and present | r10 |
| §1.E.1 statement `(A_n)_(n≥0)` | StacksMA 13310–13326 | `A_2 → A_1` there, `A_1 → A_0` here | Same statement | r10 |
| §1.E.1 Checks (`M_n = A_n`; `[A_n →t A_n]`; the `B` tower) | `n = 0, 1, 2` | `k[[t]] ⊗^L A_n = k[[t]]/(t^(n+1))`; `H^−1(M_n) = (t^n) ≅ k`, `H^−1(M) = 0`; `f^(m+1) = 0` in `I`, `x₁⋯x_r ≠ 0` | True | r10 |
| Layer 4 Example `A_n = ℤ/p^(n+1)` | `p = 2` | `π₀(3) = 1`, `3 ∈ ℤ₂^×`; `π₀(2) = 0`, `2 ∉ ℤ₂^×` | True | r10 |
| `nonempty_bicomplexSecondPageIso` | `ℤ →2 ℤ`, index `k = 0` | page 3 `ℤ/2` at `(0,0)` = `H_0(Tot)` | True | r9 |
| `simplicialTensorComparison`, `bisimplicialDiagonalComparison` (§0.2.2) | `(1,1)`; constant `P`; `Γ₀(A[1])^⊠2` | the opposite sign is not a chain map; `A` in degree 2 on both sides | True | r9 |
| `quasiIso_whiskering_of_projective` | `Γ₀[ℤ →2 ℤ] → ℤ/2`, `(−)^⊗2` | `H₁ = ℤ/2` against `0` | Projectivity needed | r9 |
| `exteriorPower_decalage` / `symmetricPower_decalage` (§§0.15–0.16) | `R, R²`; `ℤ/2` | `H₂ = Γ²R`; kernel rank 3; `Γ²_ℤ(ℤ/2) = ℤ/4` | True for flat `N` | r9 |
| `derivedLimit_isTriangulated` | `×p` on `ℤ`; levelwise-split data | `H¹ = ℤ_p/ℤ`; `⊕k → ∏k` not onto | Levelwise data excluded | r9 |
| Derived completeness (§§1.2–1.3) | `I = 0, (1), (p)`; `ℤ_p ⊕ ℚ_p[−1]` | all complete; only `0`; `ℤ ↦ ℤ_p`, `ℤ[1/p] ↦ 0`; `H¹ = ℚ_p` fails at `f = p` | True | r9 |
| `IsCompletelyFlatModule`, §§1.7–1.8 | `ℤ/4` at 2; `ℤ_p`; `ℤ/2` over `ℤ/4` | `M[2] = {0,2}`; flat; `Tor₁ = ℤ/2` | True | r9 |
| `IsPerfect`, `isPerfect_*`, `pseudoCoherent_residueCriterion` | `eA`; `[k[[t]] →t k[[t]]]`; zero ring | ranks `(1,0)`; fibre `[k →0 k]`; `E = 0` | True | r9 |
| `Matlis.biduality_*` | `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)` | `End E = ℤ_p`; `D(E) = ℤ_p ≠ ℤ_(p)` | Completeness needed | r9 |
| 0.2, 0.2.1, 0.4, 0.8, 0.10, 0.12 | `F_p ⊗^L F_p`; `ℤ → ℤ → ℤ/3`; `ℤ → F_p` | `H^−1 = F_p`; iso on `ℤ/3`; `L = F_p[1]` | True | r9 |
| 0.14–0.16, 0.25, 0.7 Check | `ℤe`, `F₂e`; `ℤ/4 → F₂` | `∧²(ℤe) = 0`; `e·e = 2γ₂(e)`; `JB′ = 0`, not flat | True | r9 |
| 1.1, 1.1.1, 1.4, 1.5, 1.7, §S.1 Check | `×3` tower; `RHom(ℤ[1/p], ℤ)`; `[[1,1],[0,1]]` | `−1/8 ∉ ℤ`; `lim¹ = ℤ_p/ℤ`; `E₃ = 0` | True | r9 |

### Remarks on untouched text (no change requested)

- README:2433 now says “For a field `k`” even though README:96 already makes `k` a field. The repetition is harmless.
- The pull-request title names only the [AffineCrystalline] citations; earlier reviews did not raise it.

## Not verifiable

- **IllusieCC, Chapter II, 1.2.6.2 (§0.9).** The Springer volume has no open copy; this is carried from the previous reviews.
- **Ownership against open pull requests.** The changed lines introduce no object, so there was nothing new to check. For the rest of the roadmap it is carried from the previous reviews, which checked it with `roadmaps grep` over the open heads and main.

## Source issues

- none
