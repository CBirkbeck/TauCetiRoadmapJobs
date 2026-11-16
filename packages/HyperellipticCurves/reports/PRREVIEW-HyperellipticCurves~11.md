# Review of HyperellipticCurves (pull request #1707 at 9c4193b)

**Verdict:** needs changes

Incremental re-review of 82 changed lines since `ea85c21`: the Chabauty–Coleman bullet of "Not owned here" and the LeanPool/lean-pool entry of "Provenance" in `TauCetiRoadmap/HyperellipticCurves/README.md`, read against LeanPool/lean-pool at commit `f8b9b72` and against EffectiveDiophantineMethods at its open head. Two findings, both P3, both in the new Provenance entry.

## R01 (P3) — Provenance drops the hypotheses of the Abel–Jacobi class and of the reduced Mumford representative

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md` lines 2609–2614: "for `f` of odd degree, `ChabautyColeman.HypJac K f := ClassGroup (HypRing K f)`, the class `ChabautyColeman.aj` of the point ideal … and in each class a unique reduced Mumford ideal".

**Claim:** Only odd degree is stated, while the section says "The statements below are those of the declarations at the commits named". `aj`, `aj_inv`, `exists_mk0_mumfordIdeal_reduced` and `mumfordIdeal_reduced_unique` also assume `2 ≠ 0` and `f` squarefree; only `HypJac` needs odd degree alone.

**Witness:** lean-pool `f8b9b72`, `Curve/Jacobian.lean` line 109 and `Curve/MumfordReduction.lean` line 211: `variable [NeZero (2 : K)] [Fact (Squarefree f)]`, before `aj` (line 114) and both Mumford theorems (lines 320, 383). `ClassGroup.mk0` needs the Dedekind instance.

**Repair:** Replace by: "for `f` of odd degree, `ChabautyColeman.HypJac K f := ClassGroup (HypRing K f)`; for `f` moreover squarefree and `2 ≠ 0`, the class `ChabautyColeman.aj` of the point ideal `(x − x₀, y − y₀)`, inverted by the involution (`ChabautyColeman.aj_inv`), and in each class a unique reduced Mumford ideal …" (the rest unchanged).

## R02 (P3) — `ChabautyColeman.genus` is not in either file its bullet links

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md` lines 2603–2604, in the bullet headed by `Curve/HypRing.lean` and `Curve/IntegralClosure.lean`: "the genus there is the integer `deg f / 2` (`ChabautyColeman.genus`)".

**Claim:** The bullet attributes its declarations to the two linked files; `genus` occurs in neither.

**Witness:** lean-pool `f8b9b72`, `Disks/CurvePoint.lean` line 56: `def genus {R : Type*} [Semiring R] (f : R[X]) : ℕ := f.natDegree / 2`; no line of `Curve/HypRing.lean` or `Curve/IntegralClosure.lean` contains `genus`.

**Repair:** Write "the genus there is the integer `deg f / 2` (`ChabautyColeman.genus`, in `Disks/CurvePoint.lean`)".

## Previous findings

- none: the previous report, of `ea85c21`, accepted with no finding.

## Verified sound

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| `Δ(f, 0) = 2^{4g} formDiscr (2g+2) f` (0.3), used at line 2589 | `g = 1`, `x³ − x`: `disc₄ = 1²·4 = 4`, `2⁴·4 = 64 = Δ`. `g = 2`, `x⁵ − 1`: `disc₆ = 5⁵`, `2⁸·5⁵`, as in 0.3. | Holds; with `2` a unit, unit `discrOfDegree` gives unit `Δ`. |
| `discrOfDegree f n = formDiscr n f` for `natDegree f ≤ n` (line 2584) | `n = 2`, `f = bx + c`: `b²·discrOfDegree f 1 = b²`; `b² − 4ac` at `a = 0` is `b²`. `f = c`: `0` and `0`. `n = 1`: `1` and `1`. | Agree; both specialise the universal polynomial, by `discrOfDegree_map` and `discrOfDegree_natDegree`. |
| `HyperellipticCurve R` is a smooth `Model R g` with `h = 0` (line 2588) | `x³ − x`, `g = 1`: over `ℤ[1/2]` `disc₄ = 4` and `Δ = 64` are units; over `ℤ` neither `Invertible 2` nor `IsUnit 64`. | Consistent. |
| Two directions of `isSmooth_iff_separable`, `h = 0` (lines 2591–2594) | `x⁵ − 1` over `𝔽₇`: separable, degree `5 = 2·2 + 1`, `ofSeparable` genus `(5 − 1)/2 = 2`. Degree 6: `(6 − 1)/2 = 2`. Over `𝔽₅`: `(x − 1)⁵`, not separable. | Match `Separable ∧ 2g + 1 ≤ natDegree` of the Lean statement. |
| Class group against `J(K)` (lines 2614–2616) | `y² = x³ − x` over `ℚ`: reduced pairs are `u = 1` and `u = x − x₀`, `v = y₀` (`2·1 < 3`), giving `{O}` and the affine points: `E(ℚ)`, order 4. `genus = 3/2 = 1`. | Agrees with degree-zero classes for a rational point at infinity. |
| `#T + 2r` against Coleman's `2g − 2` (lines 2624–2631; scope bullet, line 112) | The example of EffectiveDiophantineMethods §4.13: `g = 2`, `r = 1`, `p = 7`, `e = 1`: `2r + e + 1 = 4 < 7`; `8 + 2 = 10` both ways. `r = 0`: `8 < 10`. | `2r ≤ 2g − 2` exactly when `r < g`; the hypotheses listed are those of the declaration. |
| Reduction keeps a unit discriminant; 3.5 (lines 2631–2634) | `x³ − x` over `ℤ₃`: `disc = 4`, a unit; reduction `x(x − 1)(x + 1)` over `𝔽₃`, separable. `x⁵ − 1` over `ℤ₅`: `disc = 5⁵`, no curve. | The `v(Δ) = 0 ⇒ W̃` smooth direction of 3.5 for `h = 0`. |

The rows for every other statement of the roadmap stand as in the previous review, of `ea85c21`; the diff changes no statement and no line of `Suggested.lean`.

- Declarations opened in lean-pool at `f8b9b72` (190 `.lean` files in the directory: 189 modules and `Imports.lean`), 26 in 10 files, among them `ForMathlib/Resultant.lean` lines 213, 224, 231, 258; `Curve/Basic.lean` lines 89, 124, 227; `Curve/HypRing.lean` lines 70, 134; `Curve/Jacobian.lean` lines 42, 114, 118; `Count/Main.lean` line 377 with its `variable` block; `ForMathlib/LocalRing.lean` line 85 (`IsUniformizer`: `p ∣ π^e`). Apart from R01 and R02 each statement of the entry is that of its declaration.
- Repository facts: `lean-toolchain` is `leanprover/lean4:v4.35.0`; `LICENSE` is Apache-2.0 and all 190 files carry the header; no file mentions Tau Ceti; the root module gives DOI 10.1112/S0010437X06002168, which Crossref resolves to Stoll, Compositio Math. 142 (2006), 1201–1214.
- Cross-roadmap citation resolved at the open head: EffectiveDiophantineMethods has "Layer 4: Chabauty–Coleman and residue discs" and "4.13 Coleman's effective Chabauty bound at a prime of good reduction" (`r₀ < g`, `p > 2g`, `#X̃(𝔽_p) + 2g − 2`); it is earlier in the merge order and already a supplier (§3.23). Sections 0.1, 0.3, 0.4, 0.6, 3.5, 5.1, 5.2 named by the entry exist at this head and say what it attributes to them.
- Pinned library: Mathlib `QuadraticAlgebra` exists at the pin (`Mathlib/Algebra/QuadraticAlgebra/Defs.lean` line 44), as "Mathlib `QuadraticAlgebra`s" requires.
- Gate at `9c4193b`, my run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also records `build=0`. Dependency check: `depcheck: 248 roadmaps, 2375 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/HyperellipticCurves/Suggested.lean`: 16 `declaration uses sorry` warnings, nothing else. Changes outside the folder: none.
- Title and description against this head: no sentence contradicted; the change adds no roadmap section, declaration or supplier (EffectiveDiophantineMethods is already in the description's list), so nothing is left unstated.
- Overlap check: read EffectiveDiophantineMethods, CurvesOverFiniteFields, CanonicalModelsAndGonality (the third list is empty); the one object the change touches, Chabauty–Coleman theory, is owned by EffectiveDiophantineMethods Layer 4 and only deferred here; nothing shared. No open pull request changes this roadmap, no dropped id, no revision-only id.
- Source independence: changed passages only; 6 passages compared with 2 sources (five docstrings of lean-pool, EffectiveDiophantineMethods §4.13), none shared (longest common run 3 words); the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "None of the four has …" for LeanPool/lean-pool outside `LeanPool/HyperellipticCurves/`: the repository holds 345 project directories; I checked file names only (none on Igusa invariants, minimal models, cluster pictures, conductors or Selmer groups of hyperelliptic curves), not their contents.
- The source locators of the seeded sample were not re-read: the change cites sections 0.1, 0.4, 0.6 and 3.5 but alters none of them and adds no source locator.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" and the AI-assistance line of the description: statements about the pull request series, not about this folder.

## Source issues

- none

## For the human reviewers

- none
