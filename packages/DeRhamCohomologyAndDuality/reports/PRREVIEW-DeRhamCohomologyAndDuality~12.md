# Review of DeRhamCohomologyAndDuality (pull request #2085 at 5d70ccb)

**Verdict:** needs changes

This is an incremental re-review of the 81 lines changed since 435ed8b. The changes are:

- **README:**
  - the TangentialBordism paragraph of *Scope and ownership* (`:84–108`);
  - "not necessarily Hausdorff" in the §5.3 *Manifold sources* bullet (`:1098–1099`);
  - a new §5.3 Check on the line with two origins (`:1164–1167`);
  - the Lee gloss in *References* (`:1233–1234`).
- **`Suggested.lean`:** the docstring of `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` (`:204–215`).

Nothing outside the folder changes. The gate passes, the dependency check is clean, and the file elaborates with only its six `sorry` warnings. The previous R01 is repaired. One P3 finding remains, the stale pull-request title and description, and nothing blocks.

## R01 (P3) — The pull-request title and description still contradict the head

**Location.**

- Title: "DeRhamCohomologyAndDuality: ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- Description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.**

- At this head, `README.md:119–120` and `:1215` name ComplexKahlerGeometry K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1.
- There is no ComplexKahlerGeometry supplier contract.
- The description names none of the changes the pull request now makes, including this round's TangentialBordism comparison and the Hausdorff-free manifold theorem.

This is the previous R02, carried. No repair report marks it as not actionable.

**Witness.** `README.md:1215`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4,".

**Repair.** Nothing in the folder changes. Rewrite the title and description to describe this head.

- A possible title: "DeRhamCohomologyAndDuality: local primitives on Tau Ceti's covering space, relative transversality on manifold sources".
- The description should list:
  - K6.1 stays a consumer;
  - Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
  - §2.5 takes a real normed target;
  - §5.2 has a local form;
  - `IsTransverseAt` is new;
  - the Haar-null theorem on second-countable boundaryless manifold sources is new and needs no Hausdorff property;
  - the overlap with TangentialBordism §2.1 is recorded in *Scope and ownership*.

**Tested on.** The repaired title no longer contradicts `README.md:1215`. This is the sixth review to ask for this change.

## Previous findings

- R01 — repaired: `README.md:84–88` now reads "TangentialBordism §2.1 proves, on Hausdorff manifolds, … of maps into a compact boundaryless manifold and of maps from a compact source into a boundaryless second-countable manifold". `:94` adds "for Hausdorff `M` and `N`", and `:102–104` adds that the theorem is stated without Hausdorffness.
- R02 — not repaired: the title still reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", while `README.md:1215` names K6.1 as a consumer (R01 above).

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on the same head also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line. The roadmap is at line 397 of 400.
- TangentialBordism and AlgebraicTopology are cited only as adjacent roadmaps, never as suppliers.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0. Its six warnings are all `declaration uses 'sorry'`, at lines 62, 82, 121, 157, 171 and 216. The last moved from 215 because the docstring gained a line.
- The diff touches only docstring lines 204–215. No statement changed.
- In a scratch copy, `#check @addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` gives:
  - `BoundarylessManifold`, `SecondCountableTopology` and `IsManifold ∞` on `M` and on `N`;
  - `FiniteDimensional` on `EM`, `EN` and `V`;
  - no `T2Space`.

  This matches the new "not necessarily Hausdorff" at `README.md:1098–1099` and `Suggested.lean:205`. `#check @IsTransverseAt` is unchanged.
- One-tactic probe of the manifold theorem (`first | rfl | simp | infer_instance | trivial | aesop`): unsolved goals, so it is not padding. The other five theorems are unchanged and carry the previous probe.

**Library declarations opened at the pins** (Mathlib 1b1ccf4, Tau Ceti 2fd255d).

- `exists_contMDiff_zero_iff_one_iff_of_isClosed`, `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797`, sits under `variable [SigmaCompactSpace M] [T2Space M]` at `:583`. So `README.md:1107` rightly keeps "On a Hausdorff such `M`" for the cutoff, while the Haar-null theorem itself drops Hausdorffness.
- `BoundarylessManifold.prod`, `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:531`, makes `M × N` boundaryless, as the instance claim at `:95` needs.
- `TauCeti.IsNullSet`, `TauCeti/Geometry/Manifold/Measure.lean:36`: its reading over `𝓘(ℝ, V)` as Haar-nullity is carried from r11, where a `simp` probe gave `extChartAt 𝓘(ℝ, V) x = PartialEquiv.refl V`.

**Cross-roadmap citations, resolved.**

- **TangentialBordism §2.1** at #942's head f212a45, unchanged since r11:
  - `:459–460`: every statement is on Hausdorff manifolds. This matches `README.md:84` and `:102–103`.
  - `:571–608`: the parametric theorem. The source is Lindelöf, `S` and `N` are boundaryless, `Z` is closed and embedded, and the bad parameters form a `TauCeti.IsNullSet`. This matches `:84–86` and `:94–100`.
  - `:610–640`: relative smoothing into a compact boundaryless target `P`, rel `C`.
  - `:641–659`: relative transversality into the same compact `P`, rel `C`.
  - `:660–667`: "apply both" for a compact source into a non-compact boundaryless Hausdorff second-countable `N`.

  Together these match `README.md:86–88`.
- **AlgebraicTopology** at #1652's head 946a78a, `:100`: it names this roadmap's Layer 5 as an analogue. TangentialBordism does not cite this roadmap.
- **Overlaps.** `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped ids.
- **Citation lead.** The tool's only lead, `SmoothSimplex.integral_mextDeriv` at `README.md:348`, is in untouched text and is DifferentialGeometry 8.4's (carried from r11).

**The route of the Hausdorff-free claim** (`README.md:102–104`), checked step by step.

- A second-countable space is Lindelöf without any separation axiom, so countably many shrunk chart domains cover `M`, and likewise `N`.
- The local form of §5.2 (`:1025–1032`) restricts both `x` (to `O`) and `y` (to `W₀`). So each product of chart domains is handled without values off the charts.
- Outer measure is countably subadditive.
- No step needs a separation axiom.
- The compact-source corollary (`:1124–1134`) needs only finitely many charts with compact `K_a` covering compact `M`. Every point has a compact chart neighbourhood whether or not `M` is Hausdorff, so it holds too.

**Sources.**

- Lee Thm. 6.35 is called parametric and Thm. 6.36 the theorem the cutoff argument extends in all nine citing places: `README.md:1022`, `:1061`, `:1120–1121` and `:1233–1234`; `Suggested.lean:155` and `:213–214`; and TangentialBordism `:576`, `:608` and `:672` (pp. 145–147).
- The new gloss "transversality by a homotopy" fits that use. The text is uncertified (see *Not verifiable*).
- The seeded sample falls in the changed text only at §5.3. Its new locators are the Lee pair, which is uncertified, and the Mathlib cutoff above, which I verified.
- Hatcher Props. 1.30, 1.33 and 1.34 are still at `hatcher` lines 2676, 2723 and 2758. §§1.1–5.2 are untouched and carried from r11.

**Ownership against open pull requests.** The changed text concerns only the TangentialBordism comparison above. I compared this roadmap with TangentialBordism #942 and AlgebraicTopology #1652 by object: transversality to a map, relative translation families, and Haar- or chart-null bad sets.

- Neither builds transversality to a map or relative translation families.
- Their scopes are unchanged since r11.

**Adversarial table.** Rows marked "new" cover the changed statements. The others are carried from the review at 435ed8b (r11), whose statements this diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| new: `:84–88`, TangentialBordism §2.1's relative theorems | `S¹ → ℝ²`, `f(z) = z − 1`, `Z = {0}`; `S² → S²`, `Z` the equator | Compact source into non-compact boundaryless Hausdorff second-countable `ℝ²`: TangentialBordism `:660–667` applies, and `:87–88` now says so. Compact target: `:641–659` applies, and `:87` says so. | holds | none |
| new: `:94–100`, the instance for Hausdorff `M`, `N` | `M = N = ℝ`, `V = ℝ²`, `f = (x, x²)`, `β = 1`, `j = (y, 0)` | Family `((x+p₁, x²+p₂), (y, 0))` against `Δ ⊂ ℝ⁴`. At an incidence, the slice is transverse to `Δ` iff `(u − w, 2xu)` is onto, iff `x ≠ 0`. Bad set `{p₂ = 0}` on both sides: `IsNullSet` and Lebesgue measure `0`. | holds | none |
| new: `:97–98`, the family is transverse to `Δ` iff it is universally transverse | same data; also `β = 0` | `β = 1`: `((u+q₁+a₁, 2xu+q₂+a₂), (w+a₁, a₂))` is onto `ℝ⁴`, and `(u + q₁ − w, 2xu + q₂)` is onto `ℝ²`; both hold. `β = 0` at `x = y = 0`: coordinates 2 and 4 are both `a₂`, and `(u − w, 0)` has rank 1; both fail. | holds | none |
| new: `:102–104`, Hausdorff not used | line with two origins `M`, `N = pt`, `f = x²`, `β = 1`, `j = 0` | 2 charts on `M` × 1 on `N` give 2 coordinate pieces. Each is `u² + p` with bad set `{0}`, so the union is `{0}`, measure `0`. TangentialBordism `:460` excludes this source. | holds | none |
| new: `:104–108`, `j` need not be an embedding | `j(t) = (sin 2t, sin t)`, `t ∈ (−π, π)`; `M = pt`, `f = 0`, `β = 1` | `j' = (2cos 2t, cos t) ≠ 0`, since `cos 2t = −1` where `cos t = 0`. `j` is injective, and its image is compact, so it is not an embedding. Bad set `j((−π, π))` has measure `0`. TangentialBordism does not apply: the image is not embedded. | holds | none |
| new: `:1098–1099` and `Suggested.lean:204–210`, "not necessarily Hausdorff" | `#check` | The elaborated type has no `T2Space`. `:1107` keeps Hausdorff only for the cutoff, matching `PartitionOfUnity.lean:583`. | holds | none |
| new: Check `:1164–1167` | `p = 0, −1, 1` | `p = 0`: zeros at both origins, derivative `0`, not onto. `p = −1`: zeros `±1`, derivatives `±2`, onto. `p = 1`: no zero, vacuous. Bad set `{0}`. | holds | none |
| new: Lee gloss `:1233–1234` | nine citing places | 6.35 parametric, 6.36 by a homotopy, in every place | consistent; text uncertified | none |
| §5.2 to `IsNullSet` over `𝓘(ℝ, V)` (r11) | `V = ℝ²`, `s = {p₂ = 0}` | `extChartAt = refl`, so `IsNullSet s ↔ ∀ μ, μ s = 0`, and `0` here | holds | none |
| §1.1 (r11) | `dx`; `x dy`; angular form; `\|x\|^{3/2}` | `d Re = dx`; `1 ≠ 0`; `2π`; `C⁰` but not `C¹` | holds | none |
| §1.2 (r11) | circle once, twice, reversed | `2π`, `4π`, `−2π`; junk `0` off `C¹` | holds | none |
| §1.3 (r11) | slit plane; `ℂ∖{0}`; a point | `arg`; `2π ≠ 0`; constant `g` | holds | none |
| §2.1 (r11) | `[0,∞)` with `v = 1, 0, −1` | `ball(t, t/2) ⊆ [0,∞)`; `−εt/2 ∉ C` | holds | none |
| §2.2 (r11) | `[0,1]` with `1/2 − x`; `dim E = 0` | `r(0) ≈ 0.316`; `r = id` | holds | none |
| §2.3 (r11) | `S¹` with a point | `0` on `H₁ = ℝ`, so the homotopy is needed | holds | none |
| §2.4 (r11) | `(ℝ, ℝ∖{0})`; non-open `W` | `H₁ = ℝ`, `H₀ = 0`; smooth ≠ singular | holds | none |
| §2.5 (r11) | `V = ℓ²`; error budget | `ρ‖e − f‖ < ε/2`, so the total is `< ε` | holds | none |
| §3.1 (r11) | `(ℝ, ℝ∖{0})`, `b = 1_{(0,∞)}` | `−1` against `1` fixes the sign | holds | none |
| §3.2 (r11) | `ψ dx` pair | `1 − 1 = 0` | holds | none |
| §3.3, not statable (r11) | `(ℝ², ℝ²∖{0})` | `H¹ = 0`, `H² = ℝ`, `2π` | holds | none |
| §4.1, not statable (r11) | `S¹ ±`; `ℤ` with `K = {0,1}` | `±2π`; `3` | holds | none |
| §4.2, not statable (r11) | `[0,1]`, `α = dx`, `β = x` | `1 − 1 = 0` | holds | none |
| §5.1 (r11) | `x² + p` at `p = −1, 0, 1` | regular, not regular, regular | holds | none |
| §5.2 and local form (r11) | `x² + p`; `x²`; `O = (1,2) × ℝ` | `{0}`; full measure; `∅` | holds | none |
| §5.3 flat (r11) | `f = β = x²` | `x²(1 + p)` has derivative `0` at its zero, so `hgood` is needed | holds | none |
| `IsTransverseAt` (r11) | `g = 1`; `g = 0, j = id`; `g = x²` | vacuous; onto; fails at `0` | holds | none |
| §5.3 manifold (r11) | `f = x²`, `β = 1`; discrete `N`; discrete `M` | `{0}` null; `ℝ`, measure `∞`; `ℝ`, measure `∞` | holds | none |
| §5.3 compact, finite order (r11) | `‖βp‖_{C^k}` | `‖β‖_{C^k}‖p‖` | holds | none |
| §5.3 with corners (r11) | `D = [0,1]`, `f = (x − 1/2)²` | zeros `1/2 ± √(−p)` with derivatives `±2√(−p)` | holds | none |

**Headline theorems** (carried, since no statement changed): §§1.3, 2.2, 2.4, 5.2, flat §5.3 and manifold §5.3 are stated. §§3.3, 4.1 and 4.2 are named in the module docstring as not statable, each with the missing carrier.

## Not verifiable

`lee` and `bott-tu` are settled as `uncertified` (paywalled, cited by locator). I did not read either text, so these locators remain unverified:

- Lee Thm. 6.35 (parametric transversality), for §§5.2–5.3;
- Lee Thm. 6.36 (transversality by a homotopy), and the claim that the cutoff argument extends it, for §5.3;
- Lee Prop. 2.28, Thms. 9.24–9.26, Ch. 11, Thm. 18.7 and Thm. 18.14;
- Bott–Tu Ch. I §§5–6.

TangentialBordism cites the same numbering and pages for 6.35 and 6.36. That agreement is not a check against the text.

## Source issues

- none
