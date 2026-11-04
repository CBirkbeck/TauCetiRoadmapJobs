# GATE-ZerosOfLFunctions~2: answers to the review of 6328e1c

Commit `787d1de1` on the pull-request branch (not pushed). `TauCetiRoadmap/ZerosOfLFunctions/README.md` is
rewritten in the house shape (2060 → 1533 lines) with every repair below folded in;
`TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` gains `OrderLE`, `hadamard_of_orderLE_one` and
`riemannZeta_weilExplicitFormula`.

**Two Tau Ceti revisions.** The branch's `lake-manifest.json` pins Tau Ceti `e8af08d0` and Mathlib
`05ae0103`, the revisions the review used and the ones `lake build` compiles against. The content
repository's main pins Tau Ceti `358314d4` and Mathlib `f6090c70`. Some findings come out differently
at the two pins, and each section below says which pin it uses.

## H01 (CBirkbeck) — applied

Old README 7.2: the conclusion was `(2πi)⁻¹ ∮ logDeriv f = ∑ s ∈ S, ord_s f`. New 7.2: the conclusion is the weighted sum `∑_{s ∈ S} windingNumber · ord_s f` given by `TauCeti.Contour.argumentPrinciple_nullHomologous`, and 7.1's winding numbers collapse it to `∑_{s ∈ S ∩ R} ord_s f`. The reviewer's witness is now a Check: `f z = z − 2`, `S = {2}`, `R = [−1,1]²` gives `0 = 0`, and `f z = z`, `S = {0}` gives `1 = 1`.

## H02 (CBirkbeck) — applied

The supplier row identifying the 8.7 coefficient with `GlobalNumberFields.rayClassIdealMainTerm`, the claim in old 8.7 that the main term is "corrected by `finiteEulerCorrection`", and the matching source-table sentence are all deleted. New 8.7 states the main coefficient `1/#Cl_𝔪`: deleting the Euler factors at the primes of `𝔪` changes the logarithmic derivative by a function regular at `s = 1`, which moves the prime-power sum by `O(log x)` only. The witness is a Check: `K = ℚ`, `𝔪 = (3)∞` gives coefficient `1/2`, while `rayClassIdealMainTerm = (1/2)(1 − 1/3) = 1/3` is the coefficient of the all-ideal count.

## H03 (CBirkbeck) — applied differently

- **Tau Ceti part: disputed.** At Tau Ceti `358314d4`, the brief's pin, every cited declaration exists:
  - `TauCeti.Real.logIntegral` (`Analysis/SpecialFunctions/LogIntegral.lean:133`);
  - `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`NumberTheory/ArithmeticDirichletSeries/AbelSummation.lean:329`);
  - `TauCeti.truncatedPerron_LSeries` (`…/Perron/Formula.lean:130`);
  - `NumberField.Chebotarev.frobeniusPrimeSet` (`NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93`);
  - `frobeniusPrimeCount` (`…/PrimeCounting/VonMangoldt.lean:177`);
  - `hasNaturalDensity_frobeniusPrimeSet` (`…/PrimeCounting/FrobeniusPrimeCount.lean:108`).

  The finding holds at `e8af08d0`, the branch's stale manifest pin. The new supplier contracts cite each declaration with its file at the Tau Ceti pin.
- **LFunctions part: applied.** `HasAverageCoefficientBound` and `coeff_avg` do not exist at the LFunctions head; nor do `Presents`, `exists_unique_primitive`, `conductorOf`, `analyticOnNhd_dedekindZetaC`, `analyticOnNhd_completedDedekindZeta`, the two `meromorphicOrderAt_*_nonneg`, `dedekindZetaC_cyclotomic_four`, `degree_dedekindZetaData`, `dual_dual` and `dual_degree`. All are deleted.
  - The average bound is imported as LFunctions Layer 0's prose "average coefficient growth" predicate. What is consumed is stated: absolute convergence on `Re s > 1`, and a bound on `Re s ≥ 1 + δ`.
  - Every remaining LFunctions name was checked against that roadmap's `Suggested.lean`.

## H04 (CBirkbeck) — answered

The obstruction is gone at the current merge order: LFunctions is at #23, this roadmap at #76 and ComputationalNumberTheory at #178, so the chain LFunctions → ZerosOfLFunctions → ComputationalNumberTheory is in supply order. The dependency check with `--movable` now prints `depcheck: 204 roadmaps, 1544 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line, and the gate reports `depcheck=0`; the README keeps its LFunctions supplier section unchanged.

The edge is a real supplier edge, and LFunctions is its only owner (searched by object on main and in the open heads):
- Neither pinned library continues the Dedekind zeta function to `ℂ` or has a Hecke L-function. Mathlib's `NumberField.dedekindZeta` is the Dirichlet series; Tau Ceti's `NumberField/DedekindZeta.lean` reaches only a neighbourhood of `Re s ≥ 1`.
- ArithmeticGaloisRepresentations §2.7 restates LFunctions Layer 5 (its supplier table credits LFunctions Layers 0, 5–6).
- AutomorphicLFunctionsAndLocalFactors AL.1 proves Hecke continuation, but its AL.2 consumes this roadmap's Layer 0 `OrderLE` and Layers 5.1–5.6, so citing it would close a cycle.

## H05 (CBirkbeck) — applied

Layer 0 (vertical-strip growth) and the 3.3 wide-strip corollary now require `T₀` strictly larger than every pole height, with constants depending on the margin. The shifted record with `H = 5` is a Check: it passes with `T₀ = 6` and fails with `T₀ = 5` (as `σ → 1` at `t = 5`).

## H06 (CBirkbeck) — applied

New 6.4d states the first bound for a nontrivial primitive `χ`. The trivial-character bound keeps `1/(σ − 1)` and `½ log |d_K|`. The witness is in the text: at `K = ℚ`, `t = 0`, `σ = 1 + u`, the left side is `1/u + O(1)` while the right side stays bounded.

## H07 (CBirkbeck) — applied

Layer 7 now consumes three Tau Ceti declarations (all present at both pins):
- `TauCeti.Contour.argumentPrinciple_nullHomologous` (`Argument/Cycle.lean:110`), an ordinary interval integral over an `IsPiecewiseC1On` curve;
- `exists_continuousOn_arg_lift_with_partition`;
- `windingNumber_comp_eq_integral_logDeriv`.

What was dropped follows from that:
- the principal-value bridge (old 2b) and the Hungerbühler–Wasem immersion route;
- the "*Rect.Nondegenerate* or no contour" rule. Constant edges are `C¹`, so the boundary of a degenerate rectangle is a valid curve on which both sides vanish; this is now a 7.1 Check.

Old 1.6's reciprocal gamma factor now consumes Mathlib's `Complex.differentiable_Gammaℝ_inv` and `differentiable_Gammaℂ_inv`.

## H08 (CBirkbeck) — applied

`Suggested.lean` now defines `OrderLE` and states two new headlines:
- `hadamard_of_orderLE_one`, the general factorization at order at most one; `zetaEntireCompletion_hadamard` is kept as its instance.
- `riemannZeta_weilExplicitFormula`: summability of the zero side, and `∑' m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (2π)⁻¹∫ (Γℝ'/Γℝ)(2+it)(φ̃(2+it) + φ̃(−1−it)) dt − ∑' Λ(n)(φ(n) + φ(1/n)/n)`, for `φ` smooth with compact support in `(0, ∞)`.

Applying the same rule to the rest of the roadmap: the ray-class count (8.7) and abelian Chebotarev (8.8) headlines are statable at Tau Ceti `358314d4` but not at the branch's build pin `e8af08d0`. The docstring says so; the drafted statements are under "Notes" below.

## H09 (CBirkbeck) — applied

- **Sector at `δ = 0`.** It is simply connected, and new 1.1 says so: `δ > 0` is the angular margin that keeps the Stirling error uniform.
- **Weil Check.** The error from using the signed divisor is `P = φ̃(0) + φ̃(1)`, not `2P`.
- ***IsExceptionalZero*.** It is now described as a zero "lying in the region".
- **Mellin vanishing claim.** The claim that `φ̃` vanishes at only finitely many zeros is deleted, replaced by "the summand family has infinite support in general".

## H10 (CBirkbeck) — applied differently

`trudgian2015 line 22` and `line 27` (the AMS open copy) give `0.315 log kT + 6.455` and `0.316(log d_K + n_K log T) + 5.872 n_K + 3.655`. The README now carries no decimal constants: it gives the theorem shapes, the counting range `0 < β < 1`, `|γ| ≤ T`, and the restriction of Theorem 1 to nonprincipal `χ`.

The Titchmarsh text could not be read legally, so the README makes no claim about what Theorem 9.3 covers. Boundary heights are now derived in 7.4 from right-continuity of `N` and discreteness of the ordinates. Each target now carries its own locator (Davenport §§11–20, Titchmarsh Theorems 9.2–9.4, Kadiri Theorem 1.1 and §2.1.2, Lang XVII §3).

## H11 (CBirkbeck) — applied

The README now follows the house shape:
- `**Summary.**`; Scope and ownership; Conventions; Exact supplier contracts; How to read the build;
- `## Layer k` with `### k.n` subsections, a `*Needs:*` line on every target, and `### Examples` and `### Dependencies` closing each layer;
- Downstream consumers and References.

Every definition has prose API bullets and at least three Checks; `E₁`, for instance, gets the vanishing linear term, the simple zero at `1` with derivative `−e`, and the quadratic bound at `−1/2`. Internal names not declared in Lean are italic. The process passage of old lines 412–416 is deleted, and so are the target tables.

## Notes

- **Further defects found and repaired.**
  - Old 8.4 fixed the Weil test class as `ContDiff ℝ ⊤ φ`. In Mathlib's `WithTop ℕ∞` indexing that means real-analytic, and a compactly supported real-analytic `φ` on `ℝ` is `0`, so the class was trivial. It is now `ContDiff ℝ ∞`, with a Conventions entry and a Check.
  - The first draft of `riemannZeta_weilExplicitFormula` parsed `− ∑' n, …` inside the integral. `#check` exposed this, and the integral is now parenthesised.
  - Old 4.11's comparison and old 1.1's Checks are recomputed.
  - The "degenerate rectangle has no contour" Check was false at the Tau Ceti carrier and is replaced.
- **Elaborated signatures.** I ran `#check @name` on all 14 declarations in one scratch file and compared each with its README statement. The only change it produced is the Weil parenthesisation above. All theorem binders are explicit, and no definition has section variables.
- **Ownership.** I searched for Hadamard/order-of-entire-function and Weil-explicit-formula owners (`roadmaps grep`) and found none on main or in the open heads. The contour material is consumed from Tau Ceti, not owned. No declaration reuses another roadmap's fully qualified name.
- **Notion moves.** No notion moved down from a later roadmap.
- **Drafted 8.7 and 8.8 headlines** (for when the branch's manifest reaches Tau Ceti `358314d4`): `rayClassPrimeCount_effective (K) (𝔪 : TauCeti.GlobalNumberFields.Modulus K) (c : RayClassGroup 𝔪) : ∃ c₀ > 0, (ncard {P | absNorm P ≤ x ∧ ∃ h : P ∈ integralIdealsPrimeTo 𝔪, idealClass 𝔪 ⟨P, h⟩ = c} − logIntegral x / Nat.card (RayClassGroup 𝔪)) =O[atTop] x·exp(−c₀√log x)`. The second, `frobeniusPrimeCount_effective`, takes a surjective `Φ : RayClassGroup 𝔪 →* (L ≃ₐ[K] L)` with the splitting law `NumberField.artinSymbol 𝔭 hur = ConjClasses.mk (Φ (idealClass 𝔪 ⟨𝔭, h⟩))` and concludes `frobeniusPrimeCount K L C x − (#C/#G)·logIntegral x = O(x exp(−c₀√log x))`.
- **Sources.** Two sources were fetched and read:
  - `kadiri2012` (arXiv 1106.1868v1; Theorem 1.1 at line 79, §2.1.2 at line 230; the numbering matches the published version);
  - `trudgian2015` (AMS publisher-open PDF).

  Davenport, Titchmarsh, Lang, Iwaniec–Kowalski and Lagarias–Odlyzko are cited by locator only (paywalled). `needs-references.toml` is not needed. `sources.toml` is outside the files this job may edit, so the two fetched sources are not recorded there yet.
- **Suspicious text.** None in the review.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result |
|---|---|---|---|
| `OrderLE` | `exp(z²)`, `1/Γ`, `exp z`, `1−z`, const | `exp(r²)/exp(r^{3/2})→∞`; `‖1/Γ(−x)‖≈exp(x log x)`, so order 1 but not exponential type; `exp r/exp(r^{3/4})→∞`; const passes at `A<0` | the order-1 versus order-2 and exponential-type versus order-1 cases are told apart |
| `hadamard_of_orderLE_one` | `1−z`; `exp(cz)`; `cos z`; constant `c` | `a=0,b=−1`; `a=0,b=c`, product `1`; `±ρ` pairs give `1−z²/ρ²`, `b=0`; `a=log c`; at a zero `s=ρ₀` partial products are eventually `0` and `f s = 0` | holds |
| Weil formula at ℚ | `φ=0`; sign of the archimedean term | `0=0`; `(2π)⁻¹∫(−½logπ)(φ̃(2+it)+φ̃(−1−it))dt=−(logπ)φ(1)`, as in the standard form; residues `−φ̃(0),−φ̃(1)`; reflection via `Λ'/Λ(s)=−Λ'/Λ(1−s)` | holds; the integral is now parenthesised |
| 7.2 rectangle | `z−2,S={2}`; `z,S={0}`; `1/z`; degenerate `R` | `0=0`; `1=1`; `−1` (signed); `S∩R=∅` and both sides `0` | holds |
| 0.4 threshold | shifted record, `H=5` | `T₀=5`: unbounded as `σ→1`; `T₀=6`: margin `1` | strict margin required |
| 6.4d | `K=ℚ,χ=1,t=0,σ=1+u` | LHS `1/u+O(1)`, RHS bounded | `χ≠1` required |
| 8.7 coefficient | `ℚ,(3)∞`; `ℚ,1`; `ℚ(√−5),1` | `1/2` vs `rayClassIdealMainTerm=1/3`; `Chebyshev.psi`; `1/2` per class | `1/#Cl_𝔪` |
| 8.6 conjugation | quartic `χ` mod 5, `φ(1/2)=1` | `−(i log2)/2` vs `+(i log2)/2` | conjugate on `φ̌` |
| 1.1 branch | `δ=0`; `s=3` | `log S_0` convex; `logGamma 3=log 2` (`+2πi` if shifted) | "not simply connected" claim deleted |
| 4.3 trailing form | `f=z`, `r=1/4`, `R=1/2`, `M=1` | count `1`, bound `2`, naive bound `0` | holds |
| 7.3 `S(T)` | `T→0⁺` | `S→−1`; `θ(0)=0`, `N=0` | Check corrected (the old `|S|<1` claim was false near 0) |
| 8.4 test class | `ContDiff ℝ ⊤` | analytic with compact support, so `φ=0` | now `ContDiff ℝ ∞` |
| 5.2 `E₁` | `z=0,1,−1/2` | `E₁(0)=1`, `E₁′(0)=0`; `E₁′(1)=−e`; `‖E₁(−1/2)−1‖≈0.090`, against `1/2` for `1−z` | holds |
| 9 certificate | `ξ` on `[0,1]×[−1,1]`; `Λ` there | `Bs=[]`, count `0`; poles on the boundary, so no certificate | holds |

## Build and gate

The earlier unsubmitted repair (tree of commit `2d27b11b`) was restored unchanged and committed as `787d1de1`. The only problem listed against it was the `depcheck=1` UPWARD line, which came from the merge order then in force; the order now lists LFunctions (#23) before this roadmap (#76), and the line is gone without a README edit.

`lake build TauCetiRoadmap.ZerosOfLFunctions.Suggested` at `787d1de1`: `Build completed successfully (8702 jobs).`, exit 0; the only diagnostics are `declaration uses 'sorry'` warnings, one per admitted theorem.

Gate summary line:

```text
gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check with `--movable`:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

**Pins.** The build compiles against the branch manifest (Tau Ceti `e8af08d0`, Mathlib `05ae0103`); the content repository's manifest pins Tau Ceti `358314d4`. The three contour declarations consumed in Layer 7 exist at both (`Argument/Cycle.lean:110`, `Argument/Lift.lean:412`, `LogDerivFTC.lean:226`); the ray-class and Frobenius carriers exist only at `358314d4`, which is why 8.7 and 8.8 are named in the docstring as not statable at the build pin.

**Elaborated signatures.** `Suggested.lean` has no `variable` block; every theorem carries its binders in its own signature, and the three definitions (`OrderLE`, `zeroCount`, `zetaEntireCompletion`) take only explicit arguments. The `#check @name` pass over all 14 declarations, compared with the README statements, found one defect (the Weil integral's parenthesisation, fixed); the restored file is identical to the one checked.

**Ownership against open work.** Hadamard / order-of-an-entire-function and Weil explicit formula owners were searched with `roadmaps grep` on main and in the open heads; none was found other than AnalyticNumberTheoryPartI, which consumes them from this roadmap. No declaration reuses another roadmap's fully qualified name. No notion moved down.

**Sources.** `kadiri2012` (arXiv 1106.1868) and `trudgian2015` (AMS open copy) are cited by locator; `sources.toml` is outside the files this job may edit, so they are not recorded there. No text is missing, so there is no `needs-references.toml`.
