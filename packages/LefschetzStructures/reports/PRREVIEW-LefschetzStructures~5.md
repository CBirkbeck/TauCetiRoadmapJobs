# Review of LefschetzStructures (pull request #1061 at d664ca3)

**Verdict:** needs changes

An incremental re-review of 0 changed lines since 50625f3. The head `d664ca3` merges main into the branch: the roadmap folder is byte-for-byte the one the previous review accepted, `git diff --stat origin/main...HEAD` outside the folder is empty, and the only effect on this roadmap is that `lake-manifest.json` now carries main's pins (Mathlib `f6090c70`, Tau Ceti `358314d4`, previously `6b7abb3c`/`a91d3aa`). At the new pin the worker's gate fails its build check (`build=1`, every other scanner 0), and the brief admits no acceptance while the gate fails: that is the single finding below, mechanical and tested. The mathematics, the suppliers and the library declarations were re-resolved at the new pins and at the suppliers' current heads; nothing else changed. Severity: P1 false, vacuous or unowned; P2 overclaim or missing hypothesis; P3 locator, Check, style or policy.

## R01 (P1) — The gate's build check fails at the merged Mathlib pin (Lake module-system warning)

Location: `TauCetiRoadmap/LefschetzStructures/Suggested.lean` line 1, `import Mathlib`; `lake-manifest.json` after the merge (`mathlib` rev `f6090c70`).

Claim: the gate's build of `TauCetiRoadmap.LefschetzStructures.Suggested` passes with `sorry` the only warning. Witness: the worker's gate at `d664ca3` reports `build=1 FAIL` with the one message "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". At the previous head the manifest pinned Mathlib `6b7abb3c`, whose Lake does not emit this warning, and the gate passed; the merge from main moved the pin. The file itself is sound: `lake env lean` on it at the new pin exits 0 with exactly the twelve `declaration uses 'sorry'` warnings (lines 104, 110, 116, 122, 129, 182, 190, 199, 206, 215, 225, 235) and nothing else, so no declaration broke under the pin change.

Repair: replace the first line by the module-system header, that is `module`, a blank line, `public import Mathlib`, a blank line, `public section`, and leave the rest of the file unchanged (the `public section` is needed: without it every declaration of a `module` file is private to the module and the gate's name check would no longer see the theorems). Tested: a scratch copy with exactly that header elaborates under `lake env lean` at the new pin with the same twelve `sorry` warnings and no other message. I could not run the gate's own `lake build` on the scratch copy (the gate builds the worktree's module), so the disappearance of the Lake warning is what the header is documented to do, not what I observed; the worker's gate on the repaired head settles it.

## Previous findings

- R01 — not repaired: lines 438–440, 450–454, 464–467 unchanged; 2.1, 2.2 and 2.3 still carry one Check each (the repair text of the previous review stands; P3, the author's to take or leave).
- R02 — not repaired: line 433 still reads "`structure WeilCohomologyLefschetz k K` extending …" with no such declaration in `Suggested.lean`; line 458 still writes `L = γ(ξ) ∪ −` on `H(X)` without saying that the twists are trivialised through the marking `e` (P3).
- R03 — not repaired: `grade_eq_iSup_primitive` (Lean line 104) still has no `[FiniteDimensional K H]`; the four Layer 0 statements (lines 110, 116, 122, 129) still carry `[CharZero K]` while the README's standing hypotheses (lines 105–106) make no exception (P3).
- R04 — not repaired: lines 242–244 and 311 still name EtaleDualityAndPerverseSheaves §5.7 (`gradedLefschetz_vectorSpace_compat`) in the `*Needs:*` of 0.2 and in Layer 0's Dependencies without using it (P3).

None of the four blocks; none was raised again above because the diff is empty and each remains exactly as the previous review stated it.

## Verified sound

**The change set.** `git diff --stat 50625f3..HEAD -- TauCetiRoadmap/LefschetzStructures`: empty. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzStructures'`: empty (the files the change summary lists outside the folder are main's own commits brought in by the merge, not the pull request's). `git diff --stat 50625f3..HEAD -- lake-manifest.json lean-toolchain`: the manifest only, 2 lines, the pins moving to main's (`f6090c70`, `358314d4`). The shared packages directory the worktree uses holds Mathlib at `f6090c70` and Tau Ceti at `358314d4`, so the build and every check below ran at the manifest's pins.

**Gate.** Worker's gate at `d664ca3`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=1 FAIL` (R01). Dependency check, run this round:

```
depcheck: 205 roadmaps, 1422 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: MotivesAndAlgebraicCycles #69, DeligneWeightsAndPurity #75, EtaleDualityAndPerverseSheaves #91, LefschetzStructures #92.

**Elaboration at the new pin.** `lake env lean` on `Suggested.lean`: exit 0, twelve `sorry` warnings, no error, no other warning. The worker's `signatures.md` lists 25 declarations with no dropped binder; its one "elaboration error" (`Unknown identifier of`, "structure `of`, line 37") is an artefact of its scanner reading the docstring phrase "the Lefschetz structure of `H(X)`" at line 37 as a declaration, and does not occur in the file's own elaboration. The elaborated types are those the previous review compared with the README (the file is unchanged), so the comparison stands: `existsUnique_isLefschetzInverse`, `lambda_pow_L_pow`, `L_pow_lambda_pow`, `exists_sl2`, `projectorsAlgebraic_of_lambdaAlgebraic`, `pairingNondegenerate_of_lambdaAlgebraic_of_positive` keep `[CharZero K] [FiniteDimensional K H]`; the three 1.3 theorems and `lambdaAlgebraic_of_inverses` keep `[FiniteDimensional K H]`.

**One-tactic probe at the new pin** (`first | rfl | simp | simp_all | infer_instance | aesop | (intros; simp_all) | trivial` in place of each of the twelve `sorry`, on a scratch copy): all twelve fail (ten `assumption failed`, two `unsolved goals`, at lines 106, 112, 119, 125, 131, 187, 195, 201, 209, 222, 231, 238). No padding; the pin change closed nothing.

**Library declarations at Mathlib `f6090c70`** (re-opened this round, since the pin moved): `IsSl2Triple` (`Mathlib/Algebra/Lie/Sl2.lean` line 38, `h_ne_zero` line 39), `IsSl2Triple.symm` (line 49, `IsSl2Triple (-h) f e`), `HasPrimitiveVectorWith` (line 79), `HasPrimitiveVectorWith.lie_e_pow_succ_toEnd_f` (line 167, conclusion `⁅e, ψ (n + 1)⁆ = ((n + 1) * (μ − n)) • ψ n` at line 168), `LinearMap.charpoly` (`LinearAlgebra/Charpoly/Basic.lean` line 44), `LinearMap.aeval_self_charpoly` (line 89), `LinearMap.restrict` (`Algebra/Module/Submodule/LinearMap.lean` line 209), `LinearMap.BilinForm` (`LinearAlgebra/BilinearMap.lean` line 529), `LinearMap.BilinForm.Nondegenerate` (`LinearAlgebra/BilinearForm/Properties.lean` line 291), `DirectSum.IsInternal` (`Algebra/DirectSum/Basic.lean` line 440). All ten exist with the statements the README's supplier contract assumes; the `𝔰𝔩₂` contract through `IsSl2Triple.symm` and `lie_e_pow_succ_toEnd_f` reads as before. Duplication at the pins: `grep -ril` for "hard lefschetz", "weil cohomology", "primitive decomposition" over Mathlib `f6090c70` finds nothing; "lefschetz" over Tau Ceti `358314d4` hits only `TauCeti/AlgebraicTopology/Cohomology/Twisted/Relative.lean` (an unrelated use of the word). Nothing at the new pins owns a Lefschetz structure, a Lefschetz inverse, a Weil cohomology theory or a correspondence category, so the module docstring's statement that Layer 2 is not statable remains true.

**Cross-roadmap citations re-resolved this round.** DeligneWeightsAndPurity is still an open pull request at head `6045677` (the head the previous review read): §9.6 (line 3045, hard Lefschetz), §9.7 (line 3055; `primitivePiece 𝒱 λ n r = 𝒱(n−r) ∩ ker(λ^(r+1))` line 3064; `lefschetzDecomposition` line 3065; `lefschetzPairings` line 3068; the `ℕ → ℤ` grading extension and `primitivePiece 𝒱 λ n (n−j)` lines 3078–3080). EtaleDualityAndPerverseSheaves at head `d1fab8f` (unchanged): §5.7 line 5742, `gradedLefschetz_vectorSpace_compat` line 5798, `abstractPrimitiveDecomposition` line 5811. MotivesAndAlgebraicCycles moved to head `57b8fe4` since the previous review (`79b02f6`); re-read there: §0.1 (line 80), §0.2 (line 94), §0.5 (line 133), §2.2 (line 353), §2.3 (line 370; the `ℙ¹` degrees `1` and `−1` Check at line 382), §7.3 (lines 1309–1333: `A_H(X,η)`, `B_H(X)` with representative in `CH^i(X×X)_ℚ` of degree `i−d` and the equivalence with algebraicity of the lowering operator and the projectors, `C_ℚ,H(X)`, `D_ℚ,H(X)` with "nondegeneracy of the rational algebraic-image pairing", Hodge positivity `(−1)^j deg(a·b·η^{d−2j})` on `PA_H^j = A_H^j ∩ ker L^{d−2j+1}`, the implications `B ⇒ A, C`, `D ⇒ A`, `A` + positivity `⇒ D`), §7.4 (line 1335: curves, surfaces, abelian varieties, flag varieties, products, Arapura's cases); its Scope (line 10) and Downstream consumers (line 1675) still name this roadmap under its former name as the consumer of §§0.1–0.2, 0.5, 2.2–2.4, 7.3–7.4, with `L` from correspondence degree `1` and `Λ` from degree `−1`. The 2.4 dictionary of the README (lines 469–485) matches §7.3 at the new head row by row (B, C, D, Hodge positivity) exactly as the previous review's table records. On main: LieHighestWeight (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, Layer 0 the `𝔰𝔩₂` engine), ComplexKahlerGeometry K6.1 (line 1274), EtaleCohomologyFoundations §F.5 (line 1179), §F.6 (line 1200), §F.7 (line 1239), SchemeAndStackFoundations §5.1 (line 6567), §5.6 (line 6921), §5.10 (line 7175), HodgeStructures under `Completed/`. The worker's resolver found no unresolved citation or Lean name; I found none.

**Ownership against open pull requests.** Unchanged from the previous review (the folder and the index of open pull requests' relevant heads, DeligneWeightsAndPurity and EtaleDualityAndPerverseSheaves, are unchanged; MotivesAndAlgebraicCycles at `57b8fe4` still leaves the abstract Lefschetz-structure theory to this roadmap, lines 10 and 1675). No roadmap on main or at an open head cites LefschetzStructures: "Downstream consumers: none known" stands.

**Adversarial pass.** Every statement is untouched by the diff; each row carries forward the values computed in the review at `50625f3` (report PRREVIEW-LefschetzStructures~4), re-read against the unchanged file this round. `ℚ[ξ]/(ξ³)` has basis `1, ξ, ξ²` in degrees `0, 2, 4`, `n = 2`, `L = E₂₁ + E₃₂`, `Λ = E₁₂ + E₂₃`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `LefschetzStructure` (0.1) | `n = 0`; `K[ξ]/(ξ^{n+1})`; 0.1 Check 2; odd example | `n = 0`: `L = 0`, `L⁰` bijective on `H⁰`; `L²: 1 ↦ ξ²`; Check 2: `L²: e₀ ↦ e₄` bijective, `L: Ke₁ → 0` not; odd: `P² = W`, `P¹ = V` (review ~4) | sound | none |
| `primitive`, 0.1 Check 3 | `n = 1`, `H = Ke₀ ⊕ Ke₂`, `i = 2` | `P² = ⊥`; natural subtraction would give `H² ∩ ker L = H²` (review ~4) | Check correct | none |
| `IsGradeProjector`, `LowersDegreeBy`, 0.1 Check 5 | `π₀` on `K[ξ]/(ξ^{n+1})` | `LowersDegreeBy 2 π₀` needs `π₀ 1 ∈ ⊥`, but `π₀ 1 = 1` (review ~4) | Check correct | none |
| `grade_eq_iSup_primitive` (0.2) | `i = 0, 2, 4` on `ℚ[ξ]/(ξ³)`; `i = 2n+1`; `i > 2n`; infinite dimension | `H² = 0 ⊕ ℚξ`, `H⁴ = L²P⁰`; `i = 2n+1`: all terms `⊥`; `i > 2n`: `2k ≤ i` and `k ≥ i − n` impossible; holds without finite dimension (review ~4) | sound | previous R03 (P3) |
| `IsLefschetzInverse`, `existsUnique_isLefschetzInverse` (0.3) | `n = 1`; `ℚ[ξ]/(ξ³)`; `𝔽₂[ξ]/(ξ²)` | `Λe₂ = e₀`, `Λe₀ = 0`; `Λ = E₁₂ + E₂₃`; the clause `j + 2(k+1) ≤ 2n − j` is `k + 1 ≤ n − j`, so `Λ` exists and is unique over any field (review ~4) | sound | previous R03 (P3) |
| 0.3 "`ΛL = 1` on `H^i`, `i < n`; `LΛ = 1`, `i > n`" | `x = Σ L^k p_k` | `i < n`: `i + 1 ≤ n + k`; `i > n`: `k ≥ 1`; `i = n`, `x ∈ P^n`: `ΛLx = 0 ≠ x` (review ~4) | sound, sharp | none |
| `lambda_pow_L_pow`, `L_pow_lambda_pow`, 0.3 Check 1 | `i = 0, 2` on `ℚ[ξ]/(ξ³)` | `ΛL²1 = ξ ≠ 1`, `Λ²L²1 = 1`; `Λ⁰L⁰ = 1` (review ~4) | sound | none |
| 0.3 Check 3 | odd example | `Λ` kills `H⁰, H¹, W`; `ξ ↦ 1`, `ξ² ↦ ξ`; on `H³`, `Λ = (x ↦ φ(·,x))⁻¹` (review ~4) | correct | none |
| `IsWeightOperator`, `exists_sl2` (0.4) | `f(L^{k+1}x) := (k+1)(n−j−k)L^k x`; `𝔽₂[ξ]/(ξ²)` | `⁅L,f⁆L^k x = (j + 2k − n)L^k x`; `⁅h,L⁆ = 2L`, `⁅h,f⁆ = −2f`; uniqueness via `L^{n−j+2}` injective (review ~4) | sound over any field | previous R03 (P3) |
| 0.4 Checks | `x ∈ P^j`; `ℚ[ξ]/(ξ³)`; `H = H^n` | `fLx = (n−j)x` vs `ΛLx = x`; `fξ = 2`, `fξ² = 2ξ`, `Λξ = 1`, `Λξ² = ξ`; `h = 0` iff `H = H^n`, excluded by `h_ne_zero` (Sl2.lean line 39 at `f6090c70`) | correct | none |
| `IsCompatiblePairing`, 0.5 Checks | odd example; `n = 1`, `⟨e₀,e₂⟩ = 1` | `⟨Lc, c′ξ+w′⟩ = cc′ = ⟨c, c′ξ²⟩`; `⟨Lx,y⟩ = φ(x,y) = ⟨x,Ly⟩`; `⟨Le₀,e₀⟩ = 1`, `⟨e₀,Λe₀⟩ = 0` (review ~4) | correct | none |
| `AlgebraicStructure`, 1.1 Checks 1–3 | `𝒜 = End`, odd degree present; `F[L]`; `K = ℚ(√2)`; `⟨1,ξ⟩ = ±1` | `A_stable` fails with an odd `H^a ≠ 0`; `A^{n+1} = 0`; `√2·id` excluded; `−1`: `⟨L1,1⟩ = −1` (review ~4) | definitions determine their object | none |
| `projectorsAlgebraic_of_inverses` (1.2) | induction; `n = 2` six-dimensional example | `π_i = w_i(π_{2n−i} + M)L^{n−i}(1 − Σ_{a<i}π_a)`; `π₃ = Lw₁ − L²Λ²`, `π₁ = w₁π₃L` (review ~4) | true as stated | none |
| 1.2 Checks 1–3 | both inverse conditions; `w₀ = Λ`; `𝒜 = F[L]` | `ΛL²1 = ξ ≠ 1`; `(a₀ + a₁L + …)ξ^n = a₀ξ^n ≠ 1`; `π₀ ∉ F[L]` (review ~4) | correct | none |
| `lambdaAlgebraic_of_inverses` (1.2) | the displayed sum on `ℚ[ξ]/(ξ³)` | `q₂ = π₂ − LΛπ₂`, `p_{0,1} = LΛπ₂`, sum `= E₁₂ + E₂₃ = Λ` (review ~4) | true | none |
| `projectorsAlgebraic_of_lambdaAlgebraic` | `w_i = Λ^{n−i}` | lowers by `2(n−i)`; `h₁`, `h₂` from 0.3 (review ~4) | true | none |
| `inv_mem_of_charpoly` (1.3) | `w = 1 + L`; `w = L`; `H = 0` | `(T−1)³`, `w⁻¹ = 1 − L + L²`; `L` not a unit; `H = 0`: `g = 0 = 1` (review ~4) | true | none |
| `exists_inverse_L_pow_of_charpoly` (1.3) | `v = uL^{n−i}`; 1.3 Check; `H^i = 0` | `g = −c₀⁻¹(v^{d−1} + … + c₁)`, `w = gu`; Check: `uL²|_{H⁰} = 2`, `w = ½u = Λ²`; `w = 0` (review ~4) | true | none |
| `lambdaAlgebraic_of_charpoly` (1.3) | `w′_i = π_iw_iπ_{2n−i}` | lowers by `2(n−i)`; both inverse identities; then 1.2 (review ~4) | true | none |
| `PositiveOnAlgebraicPrimitive` vs MAC §7.3 | `(−1)^i⟨L^{n−2i}x,x⟩` vs `(−1)^j deg(a·b·η^{d−2j})` | equal through `Tr`; `PA_H^j = A^i ∩ P^{2i}` (MAC §7.3 at `57b8fe4`, lines 1317–1319) | dictionary row holds | none |
| `PairingNondegenerateOnAlgebraic` | `ℙ¹×ℙ¹` | `a − b` pairs to `0` with `a + b`, `−1` with `a` (MAC §7.3 Check 4 at `57b8fe4`, line 1328) | sound | none |
| `pairingNondegenerate_of_lambdaAlgebraic_of_positive` (1.4) | `2i ≤ n`; `2i > n`; `n = 0` | cross terms vanish, diagonal `(−1)^{i−k}q`; `z = Λ^{2i−n}x`; `n = 0` direct (review ~4) | true as stated | none |
| 1.4 Check 2 | `A¹ = ℚξ ⊕ ℚu` or `ℚξ ⊕ ℚ(u−v)` | Gram `[[1,0,0],[0,0,1],[0,1,0]]`; `−⟨u,u⟩ = 0`; `−⟨u−v,u−v⟩ = 2` (review ~4) | correct | none |
| 2.2 Check, 2.3 `L = (Δ_*ξ)_*`, Poincaré pairing | degrees; projection formula; `⟨b,a⟩ = (−1)^i⟨a,b⟩` | `(Δ_*ξ)_*α = ξ ∪ α`, degree `1`; `Λ` degree `−1` (MAC §2.3 Check at `57b8fe4`, line 382) | correct, modulo previous R02 (P3) | none |
| 2.4 curve Check, Checks 3–4, dictionary rows | `[X×X]`, `[pt×X]`; `ℙ¹×ℙ¹`, `ξ = a+b`; MAC §7.3 | `(deg ξ)⁻¹[X×X]_*ξ = 1`, `[pt×X]_* = π₀`; `A¹ ∩ P² = ℚ(a−b)`, `−deg((a−b)²) = 2`; B, C, D as at lines 1313–1317 of MAC at `57b8fe4` | consistent | none |
| Research context vs Beilinson 2012 (b), Arapura 2006 | sources read in review ~4 | unchanged text, unchanged locators | exact | none |

**Not stated in Lean, checked in prose.** Layer 2 is not statable at the new pins either (grep above); the docstring (lines 34–39) names the missing carriers.

## Not verifiable

- Montpellier fonds, folder 16 (pp. 4–12, 24–28, 47–48) and folder 14 (pp. 43–46): not reachable by the sources service in the two previous rounds and not retried this round, since the folder is unchanged; the mathematics of 1.2 and 1.3 is verified from the hypotheses in the table.
- Kleiman 1994 (Theorem 4.1, pp. 14–15; §5, pp. 16–19), Kleiman 1968, Grothendieck 1969, Lieberman 1968, André 2004: no legal copy found by the service in the previous rounds; the statements of 1.2 and 1.4 are proved from their hypotheses in the table.
- The disappearance of the Lake warning under the module-system header (R01): the gate's own `lake build` runs on the worktree, not on a scratch copy; only elaboration of the repaired copy was observed.

## Source issues

- none
