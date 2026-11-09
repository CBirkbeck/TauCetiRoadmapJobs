# Review of DeRhamCohomologyAndDuality (pull request #2085 at 41e3a4c)

**Verdict:** needs changes

This is an incremental re-review of the 14 lines of `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md` that changed since 5d70ccb. `Suggested.lean` and the files outside the folder did not change.

- The three README repairs (R02, R03 and R04 of the previous review) are correct and introduce no new problem.
- One P3 finding remains, carried from the previous review: the pull request's title and description are unchanged. Nothing is blocking.
- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — The title and description still contradict the head and do not record the order with ComplexKahlerGeometry's revision

**Location.** This is in the pull request's title and description, not in the folder.

- The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". Its merge-order block is empty.

**Claim.** The head says the reverse:

- `README.md:1217` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1".
- `README.md:114–116` makes this roadmap the single owner.

The head agrees with main here. On main, `DeRhamCohomologyAndDuality/README.md:72` and `:695` already say the same.

The open revision of ComplexKahlerGeometry, still at a6ec295, claims the same statements for K6.1.RelativeIntegration. If both merge as they stand, each roadmap hands §§2.4, 3.1–3.3 and 4.1 to the other.

The description also lists none of the changes this pull request makes.

**Witness.** ComplexKahlerGeometry at a6ec295, `README.md:1979–1982`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances."

The description quoted above is the PR's current text.

**Repair.** The folder does not change.

1. Rewrite the title and description to describe this head:
   - K6.1 stays a consumer;
   - Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
   - §2.5 takes a real normed target;
   - §5.2 has a local form;
   - `IsTransverseAt` and the Haar-null theorem for relative perturbations of maps between boundaryless manifolds are new;
   - the §1.1, §3.3 and DifferentialGeometry 8.4 edits of this round.
2. In the merge-order paragraph, state that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here instead of owning their boundaryless instances. This roadmap owns them on main, and the open revision must cite it.

## Previous findings

- R01 — not repaired: the title still reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", and the description and its empty merge-order block are unchanged, while `README.md:1217` keeps K6.1 as a consumer.
- R02 — repaired: `README.md:418–420` "A closed `C^r` form with `1 ≤ r`, the hypothesis of `TauCeti.exists_contMDiff_isPrimitiveOn`, is strictly stronger; continuity is neither necessary (this form) nor sufficient (`x dy` above)."
- R03 — repaired: `README.md:830–831` "compatible with enlargement of `W` (the identity of `X` as a map of pairs `(X, W) → (X, W′)` for open `W ⊆ W′`), by §3.2's naturality."
- R04 — repaired: `README.md:348–349` "8.4: `chainIntegral`, Stokes for smooth simplices and chains, and `deRhamHom` into real singular cohomology with its naturality."

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate on this head also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check (`--movable`).**

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0. Its only output is six `sorry` warnings, at lines 62, 82, 121, 157, 171 and 216.
- The file is byte-identical to 5d70ccb, since the diff touches only `README.md`. The previous review's results therefore carry over:
  - the `#check @` comparison of all 13 declarations;
  - the one-tactic padding probe, which closed none of the six theorems;
  - the headline coverage: 1.3, 2.2, 2.4, 5.2 and 5.3 are stated, and 3.3, 4.1 and 4.2 are named as not statable.
- The regenerated signatures at this head flag only `incidenceEquation`, which lacks the `NormedSpace` binders. Its body uses only subtraction in `V`, as the previous review found.
- The docstring's reason why 3.3 is not statable ("`deRhamHom`, DifferentialGeometry 8.4 … no Stokes' theorem for smooth simplices") still matches the edited contract.

**The changed passages and what depends on them.**

- **§1.1 Check (`README.md:416–420`).**
  - `TauCeti.exists_contMDiff_isPrimitiveOn` is at the pinned `Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:265`, with `hr : 1 ≤ r`. Its standing context at :262 is `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]`, which matches the bullet at `README.md:396–397`.
  - The new "`1 ≤ r`" matters. With `r = 0`, closedness through `mextDeriv` would not be the intended condition.
  - The Check now agrees with `README.md:411` (`x dy` has none) and with `README.md:1210–1211` ("Continuity alone gives no primitives").
- **§3.3 enlargement clause (`README.md:827–834`).**
  - The identity of `X` is a map of pairs `(X, W) → (X, W′)` exactly when `W ⊆ W′`. The reverse map `(X, X) → (X, ∅)` is not a map of pairs.
  - The clause names its input, §3.2's naturality for smooth maps of open pairs. The singular-side factor, §2.4's comparison, states naturality under enlargement of `W` at `README.md:662–664`, and §2.4 is in §3.3's *Needs:* line. Both inputs are therefore owned.
  - §4.1's independence of `K` (`README.md:881–884`) is this clause for `W = N ∖ K′ ⊆ W′ = N ∖ K`, and it cites the same §3.2 naturality.
  - The downstream-consumer list (`README.md:1217–1224`) names "enlargement of `W`" and no compact-support class.
  - No other line mentions "compactly supported relative".
- **DifferentialGeometry 8.4 contract (`README.md:348–349`).**
  - On main: `DifferentialGeometry/README.md:845–851` has `chainIntegral`, Stokes for the simplex and for chains, and `deRhamHom` into `realSingularCohomology`, "natural and compatible with connecting maps".
  - At DifferentialGeometry's open revision (473c4df): `README.md:2092–2110` has the chain integral (cited as chainIntegral), Stokes for a smooth simplex and for chains, and the de Rham homomorphism (cited as deRhamHom), natural in smooth maps.
  - The contract now resolves on both. The summary line `README.md:61` uses the same wording.
  - The citation resolver finds no unresolved name at this head.
- **Overlaps.** The overlap report at this head lists no dropped ids, no ids defined only by an open revision, and no other open pull request that changes this roadmap. ComplexKahlerGeometry's revision is still at a6ec295 (see R01).

**Sources.** Of the seeded sample, the changed passages fall in 1.1 and 3.3.

- §1.1's Check has no external locator; its library facts were checked above.
- §3.3 cites [Lee, Thm. 18.14], which is uncertified (see Not verifiable).
- Spot check of the carried Hatcher locators: `hatcher` line 2676 is Prop. 1.30, line 2723 is Prop. 1.33 and line 2758 is Prop. 1.34, as in the previous review.

**Adversarial pass.**

The rows for the changed statements are new, with values computed this round:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 Check `README.md:416–420`, "closed `C^r`, `1 ≤ r`, strictly stronger" | `d(|x|^(3/2))`; `dx` | `φ = (3/2)·sgn(x)·|x|^(1/2) dx` is continuous; `φ′ = (3/4)|x|^(−1/2)` is unbounded at `0`, so `φ` is not `C¹`; it has the primitive `|x|^(3/2)`. Closed `C¹` forms have local primitives by :265 | holds | none |
| §1.1 Check, "continuity not necessary" | `g = x² sin(1/x)`, `g(0) = 0` | `g′(0) = lim h·sin(1/h) = 0`; `g′(1/(2πn)) = −1`; `g′(1/((2n+1)π)) = +1`; so `φ = dg` is discontinuous at `0` and has a primitive | holds | none |
| §1.1 Check, "continuity not sufficient" | `x dy` on a disc | a primitive `g` has `∂x g = 0` and `∂y g = x`, and it is `C^∞`; `∂y∂x g = 0` but `∂x∂y g = 1` | holds | none |
| §3.3 enlargement clause `README.md:830–831` | `(ℝ, ℝ∖[−3,3]) → (ℝ, ℝ∖[−1,1])`, `ψ dx` with `supp ψ ⊆ (−1,1)` and `∫ψ = 1` | on `(ℝ, W′)`, `(ψ dx, 0)` against `t ↦ 4t−2` gives `1 − 0 = 1`; pulled back to `(ℝ, W)` against `t ↦ 8t−4` it gives `1`. The two simplices differ by chains in `W′`, so the square commutes, `1 = 1` | holds | none |
| §3.3 enlargement clause | `ℝ² ∖ D̄(0,1) ⊆ ℝ² ∖ {0}` | `H¹` restriction sends `[dθ]` to `[dθ|_W]`, with `∮ dθ = 2π` on both; `δ[dθ]` against a radius-2 disc gives `2π` on both sides; `H²` is `ℝ → ℝ`, an isomorphism | holds | none |
| §3.3 enlargement clause, direction | `W = ∅`, `W′ = X` | `(X, ∅) → (X, X)` is a map of pairs and induces `0 = H^q(X, X) → H^q(X)`; the reverse `(X, X) → (X, ∅)` is not a map of pairs | holds | none |
| DifferentialGeometry 8.4 contract `README.md:348–349` | main vs 473c4df | `chainIntegral`, Stokes for simplex and chains and `deRhamHom` with naturality: main :847–851 ✓; revision :2100, :2103–2106 ✓; the dropped name `SmoothSimplex.integral_mextDeriv` no longer cited | holds | none |
| Ownership of §§2.4, 3.1–3.3 and 4.1 | head :116, :1217 vs ComplexKahlerGeometry a6ec295 :1979–1982 vs main :72, :695 | this head and main: this roadmap owns and K6.1 consumes; ComplexKahlerGeometry's revision says the reverse; the description says K6.1 is a supplier | conflict unrecorded | R01 |

The rows for statements the diff leaves untouched are carried from the previous review. The values below are as computed there.

| Statement | Values (carried) | Result |
| --- | --- | --- |
| §1.1 `IsPrimitiveOn` | `d Re = dx`; for `x dy`, mixed partials `0` and `1`; `isOpen` field excludes `U = {x}` | holds |
| §1.2 monodromy integral | angular loop `2π`, twice `4π`, reversed `−2π`; split primitives give `3`; `pathClassIntegral` junk `0` | holds |
| §1.3 exactness | `|x|^(3/2)` global; `ℂ∖{0}` loop `2π ≠ 0` and not simply connected | holds |
| §2.1 strict inward cone | `ball(t, εt) ⊆ [0,∞)` for `ε < 1`; `(t, −εt/2) ∉ Q` | holds |
| §2.2 inward deformation | `Φ(2,x) = x+1 > 0`; `r(0) ≈ 0.316` and `r(1) ≈ 0.684`; the field `x(1−x)` gives `r(0) = 0` | holds |
| §2.3 transfer | `∂(t↦t) = [1]−[0]`; `j_*sr_* = 0` on `H₁(S¹)` | holds |
| §2.4 relative comparison | `W = ∅` gives the absolute case; `(ℝ, ℝ∖0)` gives `H₁ = ℝ` and `H₀ = 0`; the graph counterexample needs `IsOpen W` | holds |
| §2.5 approximation | `r(2) = 1`, `r((3,4)) = (0.6, 0.8)`; `Q(t,t,t) = −3t²` | holds |
| §3.1 sign of `δ` | `(0,b)` over `[−1,1]` gives `−1`, so `δ[b]` gives `+1`, the same as the singular `1` | holds |
| §3.2 cocone | `t`-family of inverses on `H⁰`; `1 − 1 = 0 = d(Ψ,0)` | holds |
| §3.3 isomorphism (statement minus clause) | `H¹(ℝ, ℝ∖0) = ℝ`; `(ℝ², ℝ²∖0)` gives `2π` and `H¹ = 0` | holds |
| §4.1 comparison | `S¹` gives `2π`; two points give `f(a)±f(b)`; `ℤ` gives `1+2 = 3`; `∫_{−2}^{2} ψ = 1` | holds |
| §4.2 boundary | `D¹`: `0 − (c₊ − c₋)`; `[0,1]` with `(dx, x)` gives `1 − 1 = 0` | holds |
| §5.1 definitions | `1+3−2 = 2` (a sign-flipped model gives `−2`); `x²+p` gives `±2`, `0` | holds |
| §5.2 Haar-null | bad set `{0}` for `x²+p`; `∅` for `P = 0` and for the local form | holds |
| §5.3 flat | `f=0, β=x², p=1` gives `4` at `2` and `0` at `0`; `x²(1+p)` fails `hgood` | holds |
| `IsTransverseAt` | `g=1, j=0` vacuous; `g=0, j=id` onto; `x²` not onto at `0` | holds |
| §5.3 manifold | `{0}` for `ℝ` with `x²` and for the line with two origins; discrete `N` gives `∞`, excluded by `SecondCountableTopology N` | holds |
| §5.3 corners estimate | `‖g−f‖ < ε/2 + ε/2` | holds |
| Face-data counterexample | Hessian entries sum to `−6`, giving `−3t²` | holds |

**Remarks on untouched text.** None.

## Not verifiable

- [Lee] *Introduction to Smooth Manifolds*, Thm. 18.14, cited in the changed §3.3 paragraph (`README.md:831–832`). The manifest settles Lee as uncertified (paywalled), so it is cited by locator only and was not read.
- The other Lee and Bott–Tu locators are outside the changed passages and stand as listed in the previous review.

## Source issues

- none
