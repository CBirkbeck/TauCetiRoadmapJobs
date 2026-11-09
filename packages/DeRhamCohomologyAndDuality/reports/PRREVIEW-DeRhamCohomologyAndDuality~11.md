# Review of DeRhamCohomologyAndDuality (pull request #2085 at 435ed8b)

**Verdict:** needs changes

This is an incremental re-review of the 33 lines changed since 573d243: 27 in the README (the TangentialBordism paragraph of *Scope and ownership* and a locator sentence in the §5.3 *Manifold sources* bullet) and 6 in the `Suggested.lean` docstring of `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate`. Nothing outside the folder changes. The gate passes, the dependency check is clean, and the file elaborates with only its six `sorry` warnings. Two P3 findings remain and nothing blocks.

## R01 (P3) — The new TangentialBordism comparison states that roadmap's hypotheses inexactly

**Location.**

- `README.md:93–94`: "The Haar-null theorem of §5.3 on manifold sources is likewise the instance of that parametric theorem with the second-countable boundaryless source `M × N`".
- `README.md:86–87`: "relative transversality of a map into a compact manifold to a closed embedded submanifold `Z`".
- `README.md:101–102`: "which moves a map into a compact manifold, by a homotopy rel a closed set".

**Claim.** The previous R01 asked the scope section to say how the kept variant differs from TangentialBordism §2.1. The new text gets two of that roadmap's hypotheses wrong.

1. **Hausdorffness.** TangentialBordism §2.1 states every one of its theorems on Hausdorff manifolds. `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` assumes no `T2Space`; the README's own `:1101` says "On a Hausdorff such `M`". So the manifold theorem is an instance of §2.1's parametric theorem only when `M` and `N` are Hausdorff. Here it is strictly more general, and the paragraph does not say so.
   - This omission was already in the text the previous review proposed. That review's witness listed §2.1's hypotheses without the standing Hausdorff one.
2. **Compact targets.** §2.1's relative theorem is not limited to compact targets. It also moves maps from a compact source into a boundaryless, Hausdorff, second-countable non-compact target, `V` included. The difference that remains is the real one: a fixed map `j` against a closed embedded `Z`, and an explicit translate `f + βp` against a homotopy rel `C`.

**Witness.** TangentialBordism `README.md` at #942's head f212a45:

- `:459–461`: "Each is a smooth statement on Hausdorff manifolds".
- `:660–662`: "For a boundaryless Hausdorff second-countable target N that is not compact, and a compact source, apply both to the double".

**Repair.**

- At `:93–94`, write "is likewise, for Hausdorff `M` and `N`, the instance of that parametric theorem with the second-countable boundaryless source `M × N`, …".
- At the end of that sentence (`:99`), add "; it is stated here without Hausdorffness, which TangentialBordism §2.1 assumes of every manifold".
- At `:86–87`, write "relative transversality, rel a closed set, to a closed embedded submanifold `Z` of a map into a compact manifold, or of a map from a compact source into a boundaryless Hausdorff second-countable manifold".
- At `:101–102`, write "unlike TangentialBordism's relative theorem, which moves a map, by a homotopy rel a closed set, until it is transverse to a fixed closed embedded `Z`".

**Tested on.**

- *The non-Hausdorff case.* Take `M` the line with two origins (second countable, boundaryless, not Hausdorff), `N` a point, `V = ℝ`, `f = x²`, `β = 1` and `j = 0`.
  - The Lean statement applies, and its bad set is `{0}`, which is null.
  - §2.1's `:460` excludes this source.
  - The repaired sentence says exactly this.
- *Compact source, non-compact target.* Take `M = S¹ ⊂ ℂ`, `f(z) = z − 1`, `j = 0` from a point and `Z = {0} ⊂ ℝ²`.
  - §2.1's `:660–667` applies, which the current `:101–102` denies.
  - Under the repaired wording, the case that separates the two roadmaps is a figure-eight injective immersion `j : ℝ → ℝ²` with `M` a point. §5.3 applies, and its bad set `j(ℝ)` is null. §2.1 does not apply, because `j(ℝ)` is not an embedded submanifold.

## R02 (P3) — The pull-request title and description still contradict the head

**Location.**

- Title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- Description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.**

- At this head, `README.md:114` and `:1205` name ComplexKahlerGeometry K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1.
- There is no ComplexKahlerGeometry supplier contract. The contract headings at `:156, 215, 338, 347` are Mathlib, Tau Ceti, DifferentialGeometry and AlgebraicTopology.
- The description names none of the changes the pull request now makes.

No repair report marks this finding as not actionable.

**Witness.** `README.md:1205`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4,".

**Repair.** Nothing in the folder changes. Rewrite the title and description to describe this head. A possible title: "DeRhamCohomologyAndDuality: local primitives on Tau Ceti's covering space, manifold relative transversality". The description should list:

- K6.1 stays a consumer;
- Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
- §2.5 takes a real normed target;
- §5.2 has a local form;
- `IsTransverseAt` and the Haar-null theorem on boundaryless second-countable manifold sources are new, recorded against TangentialBordism §2.1.

This is the fifth review to ask for it.

## Previous findings

- R01 — partly repaired: `README.md:93–103` now records "the instance of that parametric theorem with the second-countable boundaryless source `M × N` … target `V × V`, `Z` its diagonal", and `:1114` cites "[Lee, Thm. 6.35]". It omits §2.1's Hausdorff hypothesis and restricts §2.1's relative theorem to compact targets (R01 above).
- R02 — not repaired: the title still reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", while `README.md:1205` names K6.1 as a consumer (R02 above).

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

My re-run printed no `build` field. The worker's gate on the same head records `build=0`, and the elaboration below exits 0.

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line. The roadmap is at line 397 of 400.
- TangentialBordism and AlgebraicTopology's revision are cited only as adjacent, never as suppliers.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0 in 10 s. Its six warnings are all `declaration uses 'sorry'`, at lines 62, 82, 121, 157, 171 and 215; the last moved from 213 because the docstring grew.
- The diff touches only docstring lines 211–214.
- `#check @addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` and `#check @IsTransverseAt` in a scratch copy give the same types as the worker's signature listing:
  - `BoundarylessManifold`, `SecondCountableTopology` and `IsManifold ∞` on `M` and on `N`;
  - `FiniteDimensional` on `EM`, `EN` and `V`;
  - no `T2Space`.
  This matches `README.md:1093–1097`.
- The `incidenceEquation` binder lead is harmless: the body uses only subtraction in `V`.
- The padding probe from the previous report still applies, because no statement changed: all six theorems survive `first | rfl | simp | infer_instance | trivial | aesop`.
- Pins, from `lake-manifest.json`: Mathlib 1b1ccf4 and Tau Ceti 2fd255d. The previous report called 1b1ccf4 the Tau Ceti pin; it is Mathlib's.

**Library declarations opened at the pins.**

- `TauCeti.IsNullSet` (`TauCeti/Geometry/Manifold/Measure.lean:36`) requires, at every point `x`, that the image under `extChartAt I x` have measure zero for every additive Haar measure on the model.
- A scratch `example` proving `extChartAt 𝓘(ℝ, V) x = PartialEquiv.refl V` by `simp` elaborates. So over `𝓘(ℝ, V)` the predicate is Haar-nullity in `V`, as `README.md:98–99` says.

**Cross-roadmap citations, resolved.**

- TangentialBordism §2.1 at #942's head f212a45:
  - `:457–476`, the standing hypotheses;
  - `:571–608`, the parametric theorem: a Lindelöf source, boundaryless `S` and `N`, a closed embedded `Z`, and a `TauCeti.IsNullSet` of bad parameters;
  - `:610–640`, smoothing into a compact `P`;
  - `:641–667`, the relative theorem, including non-compact targets for compact sources.
- AlgebraicTopology's revision at #1652's head 946a78a, `:92–101`: its 8.13 owns these theorems for compact targets and says this roadmap's Layer 5 is an analogue by its own route.
- TangentialBordism does not cite this roadmap.
- `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped ids.
- The citation tool's only lead, `SmoothSimplex.integral_mextDeriv`, is DifferentialGeometry 8.4's. This is carried from the previous report; that text is untouched.

**Sources.**

- The Lee locators in the changed text agree with every other place that cites them:
  - Thm. 6.35, parametric: `README.md:1017` and `:1114`, `Suggested.lean:212`, TangentialBordism `:575` and `:608` (pp. 145–146);
  - Thm. 6.36, relative: `README.md:1056` and `:1115`, `Suggested.lean:213`, TangentialBordism `:576` and `:672`.
- The Hatcher Props. 1.30, 1.33 and 1.34 of the seeded sample are still at `hatcher` lines 2676, 2723 and 2758. §§1.2–1.3 are untouched.
- The other seeded targets are untouched or have no textual locator. They are carried from the previous report.

**Remarks on untouched text** (not findings):

- The References gloss at `README.md:1223–1224`, "Thms. 6.35–6.36 (parametric transversality)", groups 6.36 with 6.35. The README's own `:1115` now treats 6.36 as the relative theorem.

**Adversarial table.** The rows marked "new" cover the changed statements. The others are carried from the review at 573d243 (r10), whose statements the diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| new: `:95–96`, the family is transverse to Δ iff it is universally transverse | `M = N = ℝ`, `V = ℝ²`, `f = (x, x²)`, `β = 1`, `j = (y, 0)`; also `β = 0` | `dG(u,w,q) + (a,a)` is onto iff `(u + q₁ − w, 2xu + q₂)` is onto. With `q` free it is onto, on both sides. With `β = 0` at `x = 0` the map `(u − w, 0)` has rank 1, and both sides fail. | holds | none |
| new: `:96–98`, the slice is transverse to Δ iff `IsTransverseAt` | same data at `p = 0` and `p = (0, −1)` | At `p = 0` the only incidence is `x = y = 0`. `(u − w, 0)` is not onto, and the Δ-sum forces `c₁₂ = c₂₂`; both fail. At `p = (0, −1)`, `x = y = ±1` and `(u − w, ±2u)` is onto; both hold. The bad set `{p₂ = 0}` is a line, which is null. | holds | none |
| new: `:98–99`, `IsNullSet` over `𝓘(ℝ, V)` is Haar-null | `V = ℝ²`, `s = {p₂ = 0}` | `extChartAt = refl` (simp probe), so `IsNullSet s ↔ ∀ μ, μ s = 0`. Lebesgue measure of `s` is `0`. | holds | none |
| new: `:93–94`, "the instance" | line with two origins, `N = pt`, `f = x²`, `β = 1`, `j = 0` | The Lean hypotheses hold (no `T2Space`) and the bad set is `{0}`, null. TangentialBordism `:460` requires Hausdorff, so this case is not an instance. | instance claim too broad | R01 |
| new: `:101–102`, relative theorem "into a compact manifold" | `S¹ → ℝ²`, `f = z − 1`, `Z = {0}` | TangentialBordism `:660–667` applies: compact source, non-compact boundaryless Hausdorff second-countable target. The README says it does not. | misstated | R01 |
| new: the distinction kept (map against submanifold) | figure-eight injective immersion `j : ℝ → ℝ²`, `M = pt`, `f = 0`, `β = 1` | §5.3: since `0 + 1 < 2`, `p` is bad iff `p ∈ j(ℝ)`, a null set. TangentialBordism: `j(ℝ)` is not embedded, so it does not apply. | holds | none |
| new: Lee attribution, `:1114–1116` and `Suggested.lean:211–214` | five citing places | 6.35 is parametric and 6.36 relative in all of them | consistent; text uncertified | none |
| §1.1 (r10) | `dx`; `x dy`; angular form; `\|x\|^{3/2}` | `d Re = dx`; `1 ≠ 0`; `2π`; `C⁰` but not `C¹` | holds | none |
| §1.2 (r10) | circle once, twice, reversed | `2π`, `4π`, `−2π`; junk `0` off `C¹` | holds | none |
| §1.3 (r10) | slit plane; `ℂ∖{0}`; a point | `arg`; `2π ≠ 0`; constant `g` | holds | none |
| §2.1 (r10) | `[0,∞)` with `v = 1, 0, −1` | `ball(t, t/2) ⊆ [0,∞)`; `−εt/2 ∉ C` | holds | none |
| §2.2 (r10) | `[0,1]` with `1/2 − x`; `dim E = 0` | `r(0) ≈ 0.316`; `r = id` | holds | none |
| §2.3 (r10) | `S¹` with a point | `0` on `H₁ = ℝ`, so the homotopy is needed | holds | none |
| §2.4 (r10) | `(ℝ, ℝ∖{0})`; non-open `W` | `H₁ = ℝ`, `H₀ = 0`; smooth ≠ singular | holds | none |
| §2.5 (r10) | `V = ℓ²`; error budget | `ρ‖e − f‖ < ε/2`, so the total is `< ε` | holds | none |
| §3.1 (r10) | `(ℝ, ℝ∖{0})`, `b = 1_{(0,∞)}` | `−1` against `1` fixes the sign | holds | none |
| §3.2 (r10) | `ψ dx` pair | `1 − 1 = 0` | holds | none |
| §3.3, not statable (r10) | `(ℝ², ℝ²∖{0})` | `H¹ = 0`, `H² = ℝ`, `2π` | holds | none |
| §4.1, not statable (r10) | `S¹ ±`; `ℤ` with `K = {0,1}` | `±2π`; `3` | holds | none |
| §4.2, not statable (r10) | `[0,1]`, `α = dx`, `β = x` | `1 − 1 = 0` | holds | none |
| §5.1 (r10) | `x² + p` at `p = −1, 0, 1` | regular, not regular, regular | holds | none |
| §5.2 and local form (r10) | `x² + p`; `x²`; `O = (1,2) × ℝ` | `{0}`; full measure; `∅` | holds | none |
| §5.3 flat (r10) | `f = β = x²` | `x²(1 + p)` has derivative `0` at its zero, so `hgood` is needed | holds | none |
| `IsTransverseAt` (r10) | `g = 1`; `g = 0, j = id`; `g = x²` | vacuous; onto; fails at `0` | holds | none |
| §5.3 manifold (r10) | `f = x²`, `β = 1`; discrete `N`; discrete `M` | `{0}` null; `ℝ`, measure `∞`; `ℝ`, measure `∞` | holds | none |
| §5.3 compact, finite order (r10) | `‖βp‖_{C^k}` | `‖β‖_{C^k}‖p‖` | holds | none |
| §5.3 with corners (r10) | `D = [0,1]`, `f = (x − 1/2)²` | zeros `1/2 ± √(−p)` with derivatives `±2√(−p)` | holds | none |

**Ownership against open pull requests.** I compared this roadmap with TangentialBordism #942 and AlgebraicTopology #1652 by object: parametric and relative transversality, and Haar- or chart-null bad sets. Neither builds transversality to a *map* or relative translation families. The overlap with TangentialBordism §2.1 is recorded at `README.md:84–103`; R01 corrects its wording.

## Not verifiable

`lee` and `bott-tu` are settled as `uncertified` (paywalled, cited by locator). I did not read either text, so these locators remain unverified:

- Lee Thm. 6.35, parametric transversality, for §§5.2–5.3;
- Lee Thm. 6.36, and the claim that the cutoff argument extends it, for §5.3;
- Lee Prop. 2.28, Thms. 9.24–9.26, Ch. 11, Thm. 18.7 and Thm. 18.14;
- Bott–Tu Ch. I §§5–6.

TangentialBordism cites 6.35 at pp. 145–146 and 6.36 at pp. 146–147, which agrees with this roadmap's numbering. That agreement is not a check against the text.

## Source issues

- none
