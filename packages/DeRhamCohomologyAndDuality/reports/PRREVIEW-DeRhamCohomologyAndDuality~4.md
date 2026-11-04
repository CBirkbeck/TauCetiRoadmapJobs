# Review of DeRhamCohomologyAndDuality (pull request #1768 at d5b0c05)

**Verdict:** accepted

🤖 Independent AI review, incremental: 20 changed README lines since b45d238 (the diff touches the Mathlib supplier contract, one new Check in §1.3 and the deletion of one *Downstream consumers* bullet; `Suggested.lean` is byte-identical to b45d238 and nothing changed outside the folder). No finding remains. The gate passes, the dependency check reports no problem, the Lean file elaborates with only the four `sorry` warnings, the five new Mathlib citations exist at the pin with the hypotheses the README states, and the new Check is correct and strictly separates Layer 1 from Mathlib's primitives API. Two conflicts with other open pull requests are settled as not actionable inside this folder (below): a human must still choose between the heads of the DifferentialGeometry revision and of the ComplexKahlerGeometry revision and this one; this verdict is conditional on that choice, which the acceptance hands to the human approver.

## Previous findings

- R01 — not repaired: `README.md:33–36, 359–370, 418–475, 487–512, 674–679` still own §§2.4, 3.1–3.3, 4.1 and name ComplexKahlerGeometry K6.1 as their consumer. The repair report marks it not actionable inside the folder (a revision of an existing roadmap is never a supplier; the choice between the two pull requests is a human's). The reason holds: on main (929496d) ComplexKahlerGeometry K6.1 (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1274, 1382, 1396`) cites "DG8.4's open-pair cone", "DG9.3's compactly supported relative integration formula" and "DG8.3's" relative-chain comparison, none planned by DifferentialGeometry on main, so this folder is the sole owner on main; the open ComplexKahlerGeometry revision (head 5f4f6e1) is unchanged, still with its "Relative integration contract" (`README.md:1953` at that head) and still citing the stale `DR.3.8` and `DR.4.4` (`:38`). Settled; not re-raised. Together with the settled inward-domination finding (the open DifferentialGeometry revision, head a565de6, unchanged: `Suggested.lean:1402` `structure InwardDomination`, consumer paragraph `README.md:1378–1386` at that head) and the settled folder-name finding, this is one human decision.
- R02 — repaired: the bullet naming unnamed Lie-group and arrangement consumers is gone; *Downstream consumers* (`README.md:674–679`) names ComplexKahlerGeometry K6.1 only, which exists on main; a grep of the README for "arrangement", "Lie group" and "singular-image" is empty.
- R03 — repaired: the Mathlib contract (`README.md:112–118`) lists `Complex.IsExactOn`, `Complex.IsConservativeOn`, `Complex.IsConservativeOn.isExactOn_ball`, `DifferentiableOn.isExactOn_ball` and `Complex.IsExactOn.differentiableOn` with their generality, and §1.3 gains the holomorphic-case Check (`README.md:261–270`). Both verified at the pin and computed below; the repair introduced no new problem.

## Verified sound

**Scope of this re-review.** The diff (`changes.md`, 17 insertions, 3 deletions, all in `README.md`) and everything that cites or depends on it: §1.1's `HasLocalPotentials` (README `:186–195`, `Suggested.lean:45–48`), §1.3 and its headline `exists_hasFDerivAt_of_simplyConnected` (`Suggested.lean:54–57`), the Mathlib contract, the *Downstream consumers* section and the ComplexKahlerGeometry K6.1 citation. The Lean file is unchanged since b45d238 (`git diff b45d2384 HEAD --stat` on it prints nothing); the diff outside the folder is empty (`git diff --stat origin/main...HEAD` restricted to the complement of the folder prints nothing). The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`). The worker's `roadmaps resolve` found no unresolved citation. The new lines contain no process word, pull-request number, LaTeX delimiter or Lean name of this roadmap's own (the Check names only Mathlib declarations, as a Check may). No gaps are declared; no `needs-references.toml` exists.

**Gate and dependency check.** The worker's gate at d5b0c05, quoted as data:

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I ran the dependency check with `--movable` against the board's merge order and main:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; the roadmap is listed at line 372 of 373. No `*Needs:*` line changed; none names a later roadmap or an open revision.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all eight declarations exits 0 with exactly the four `sorry` warnings (lines 54, 73, 109, 122). The elaborated types agree with the worker's dump and, target by target, with the README: §1.3 carries `IsOpen Ω`, `[SimplyConnectedSpace Ω]`, no completeness (`README.md:247–249`: "no completeness"); §2.2 carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`; §5.2 four `FiniteDimensional` instances and a Borel Haar measure; §5.3 three. The one dropped-binder lead (`incidenceEquation` without its four `NormedSpace ℝ` instances) is benign: its body `F (x, p) − j y` needs only the additive group on `V`, and both theorems that use it carry the instances explicitly. Since the file is byte-identical to the head of the previous report, the one-tactic padding probe of that report stands (all four sorried theorems fail `first | rfl | simp | infer_instance | aesop`); nothing restates a definition, mirrors a Check or computes a value. Headline treatment is unchanged: §§1.3, 2.2, 5.2–5.3 stated; §§2.3–2.4, 3.1–3.3, 4.1–4.2 named in the module docstring with the carriers they lack (no smooth singular chain complex, manifold de Rham complex, `deRhamHom`, top-form integral or fundamental class at either pin).

**Pinned declarations opened for the changed passages** (Mathlib `Analysis/Complex/HasPrimitives.lean`, paths relative to the library):

| File and line | What it gives, and what the README assumes of it |
| --- | --- |
| `:91` `variable {E} [NormedAddCommGroup E] [NormedSpace ℂ E]`; `:110` `IsConservativeOn f U`: for every rectangle in `U`, `wedgeIntegral z w f = −wedgeIntegral w z f`; `:116` `IsExactOn f U`: `∃ g, ∀ z ∈ U, HasDerivAt g (f z) z` | The README's "vanishing rectangle integrals" and "a complex primitive on a set"; neither definition needs completeness, as the README's phrasing allows. |
| `:136` `variable [CompleteSpace E]`; `:138` `IsExactOn.differentiableOn (hU : IsOpen U)` | "A function with a primitive on an open set is holomorphic": open set and completeness both as the README's bullet states ("complete complex normed space" governs the bullet). |
| `:275` `IsConservativeOn.isExactOn_ball (hf' : ContinuousOn f (ball c r)) (hf : IsConservativeOn f (ball c r))` | Morera on a disc: continuous and conservative, complete codomain, as stated. |
| `:291` `DifferentiableOn.isExactOn_ball`; `:299` `IsConservativeOn.isExactOn_univ`; `:310` `Differentiable.isExactOn_univ`; header `:28` "TODO: Extend to holomorphic functions on simply connected domains" | "Mathlib states these on discs and on `ℂ`"; the simply connected extension is open in Mathlib, so the Check's claim that §1.3 supplies it is not a duplication. |
| Mathlib `Analysis/Calculus/FDeriv/RestrictScalars.lean:89` `hasFDerivAt_of_restrictScalars`; `HasFDerivAt.restrictScalars` (elaborated in the probe) | The two directions the Check uses: a complex primitive is a real `C¹` potential with derivative `v ↦ v·f(w)`, and a real potential with `ℂ`-linear derivative is a complex primitive. |

**Cross-roadmap citations in the changed passages, resolved on main at 929496d or at the open head named.** ComplexKahlerGeometry K6.1 (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1274`, with `:1382`, `:1396–1397` citing DG8.4/DG9.3/DG8.3 for the open-pair cone, the compact-support relative integration formula and the relative-chain comparison, as the consumers bullet says); DifferentialGeometry 8.3, 8.4, 9.3 on main plan the absolute theory only (`TauCetiRoadmap/DifferentialGeometry/README.md:836–876`, unchanged since the previous report); the ComplexKahlerGeometry revision at 5f4f6e1 and the DifferentialGeometry revision at a565de6 are unchanged (settled findings above). Ownership of the holomorphic-primitive extension: no roadmap on main or at the open heads states primitives of holomorphic functions on simply connected domains as a target (the previous report's ownership grep for local potentials found only MorseNovikov's and ArithmeticDynamics' different objects; the new Check adds no target). Ownership against open pull requests without files was not checked beyond the sibling checkouts the brief lists and `roadmaps grep`.

**Sources.** Both cited books remain settled as uncertified and cited by locator; the diff cites no source. The seeded sample (§§1.1–1.3, 2.1–2.5, 3.1–3.2, 4.1–4.2, 5.1–5.3) falls in the diff only at §1.3 (and §1.1 through the Check's use of `HasLocalPotentials`); the other sampled targets are untouched and their rows are carried from the previous report.

**Adversarial table.** New rows computed at this head; the rows marked "(carried from the review at b45d238)" are that report's, for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §1.3 holomorphic Check, positive direction | `f(z) = 1/z` on the slit plane `ℂ ∖ (−∞, 0]`, `F = ℂ` | principal `Log` has `Log' = 1/z` there; covector `φ(z) = (v ↦ v/z)`; real derivative of `Log` at `w` is `v ↦ v/w = φ(w)`; `Log` is `C¹` (derivative continuous); so `HasLocalPotentials`, and the theorem's `g` is `Log + c`; `HasFDerivAt g (v ↦ v/w) w` with `ℂ`-linear derivative gives `HasDerivAt g (1/w) w` (`hasFDerivAt_of_restrictScalars`), i.e. `Complex.IsExactOn (1/z) Ω` | Pass |
| §1.3 holomorphic Check, obstruction | `f(z) = 1/z` on `ℂ ∖ {0}`, unit loop | `∫ dz/z = ∫₀^{2π} (i e^{it}/e^{it}) dt = 2πi ≠ 0`; §1.2's integral of a global potential over a loop is `0`; no primitive; `ℂ ∖ {0}` is not simply connected | Pass; hypothesis necessary |
| §1.3 holomorphic Check, local potentials from Mathlib | `f` holomorphic on a disc `B ⊆ Ω`, `F` complete | `DifferentiableOn.isExactOn_ball` gives `g` with `HasDerivAt g (f w) w` on `B`; `HasFDerivAt.restrictScalars ℝ` gives real derivative `v ↦ v • f(w)`; `w ↦ v ↦ v • f(w)` continuous since `f` is; so `ContDiffOn ℝ 1 g B` and `HasLocalPotentials` with this `B` | Pass; completeness enters only here, as the Check says |
| §1.3 holomorphic Check, negative control (non-holomorphic `f`) | `f(z) = z̄` (continuous), `φ(z) = (v ↦ v z̄)`, any disc | a local potential `g` would have `ℂ`-linear derivative `v ↦ v z̄`, so `HasDerivAt g z̄` on the disc, so `IsExactOn z̄ B`, so by `IsExactOn.differentiableOn` `z̄` is holomorphic on `B`: false (`∂z̄/∂z̄ = 1`); no local potentials | Pass; `ℂ`-linear covector fields with local potentials are exactly the holomorphic ones |
| §1.3 holomorphic Check, negative control (non-`ℂ`-linear `φ`) | `φ = dx = Re` | `Re(i · 1) = 0`, `i · Re(1) = i`: not `ℂ`-linear, so not of the form `v ↦ v f(z)`; yet `g = Re` is a potential | Pass; Layer 1 strictly wider |
| §1.3 holomorphic Check, degenerate | `Ω = ℂ`, `f = 1`; `F = 0` | potential `z`; `Differentiable.isExactOn_univ` agrees; `F = 0` forces `f = 0`, `g = 0` | Pass |
| Mathlib contract bullet | hypotheses of the five declarations | definitions `:110`, `:116` need no completeness; the three theorems sit under `:136` `[CompleteSpace E]`; `differentiableOn` needs `IsOpen U`; Morera needs `ContinuousOn` | Pass; matches the bullet |
| §1.1 `HasLocalPotentials` (carried) | `φ = dx`; `φ = x dy`; angular form on `ℂ ∖ {0}`; `φ = d(|x|^(3/2))` | `g = Re`; a `C¹` potential of `x dy` has `∂_x g = 0`, so `g = h(y)`, `h'(y) = x` for all `x`: impossible; `arg` branches local, loop integral `2π` blocks a global one; `(3/2)|x|^(1/2) sgn x` continuous, not `C¹` | Pass |
| §1.1 degenerate domains (carried) | `Ω = ∅`; `F = 0` | predicate vacuous on `∅`; `SimplyConnectedSpace ∅` false, so §1.3 not vacuous there; `F = 0` forces `φ = 0`, `g = 0` | Pass |
| §1.2 path integral (carried) | angular form on the unit loop, twice, reversed; `dx` along `t ↦ t + i·W(t)`; constant path | `2π`, `4π`, `−2π`; `Re(1) − Re(0) = 1` with no derivative of the path; `0` | Pass |
| §1.2 independence of potentials (carried) | `ω = dx`, subdivision `0 → 1 → 3`, potentials `x` and `x + 7` | `1 + 2 = 3`; `(1 − 0) + ((3 + 7) − (1 + 7)) = 3` | Pass |
| §1.3 headline, Lean generality (carried) | `Ω = ℂ`, `φ = dx`; slit plane, angular form; `ℂ ∖ {0}` | `g = Re + c`; `g = arg`; `2π` obstructs on the punctured plane | Pass; Lean carries `IsOpen Ω`, `[SimplyConnectedSpace Ω]`, no completeness |
| §2.1 strict inward cone (carried) | `C = [0, ∞)` at `0`; quadrant; `C = E` | `v = 1`: `ball(t, t/2) ⊆ C`; `v = 0`, `v = −1` fail; `(1, 0)` fails, `(1, 1)` passes; interior point: all of `E` | Pass |
| §2.1 constant local field (carried) | `‖y − x‖ < ε₀`, `ball(q, 2ε₀) ⊆ C`, `0 < t ≤ 1` | `ball(y + t(q − x), ε₀t) = (1 − t)y + t·ball(q + (y − x), ε₀) ⊆ C` by convexity | Pass |
| §2.2 headline, convexity (carried) | `C = {0} ∪ ⋃ₙ [1/(n+1) + εₙ, 1/n]` | component of `0` is `{0}`: theorem false; excluded by `convex_range'` | Pass |
| §2.2 Checks (carried) | `[0, ∞)`, `X = 1`; `[0, 1]`, `X = 1/2 − x`; boundaryless; `t = 3` | `Φ(t, x) = x + (1 − t)²`: `Φ(0, x) = x + 1`, `Φ(1, x) = x`, `Φ(3, x) = x + 4`; `ψ(s, x) = 1/2 + (x − 1/2)e^(−s)`, `r(x) ∈ [1/2 − 1/(2e), 1/2 + 1/(2e)]`; `r = id` | Pass |
| §2.2 persistence in the interior (carried) | boundary `x`, strictly inward `v`, `s > 0` | `x` the midpoint of `y ∈ C` and an interior point forces `x` interior: contradiction | Pass |
| §2.2 smoothness at `t = 1` (carried) | `s = (1 − t)²` | composite smooth, `Φ(1, x) = ψ(0, x) = x` | Pass |
| §2.3 transfer identities (carried) | `i_M ∘ j_* s r_*`, `j_* s r_* ∘ i_M` | `j_* i_N s r_* ~ j_* r_* ~ id` (singular prism); `j_* s i_N r_* ~ j_* r_* ~ id` (smooth prism); no `r ∘ j ~ id_N` used | Pass |
| §2.3 Checks (carried) | `N = M`, identity; `[0, ∞)`, `r(x) = x + 1`; `N` a point, `M = S¹` | inverse `s`; `[0] ↦ [1]`, `[1] − [0] = ∂(t ↦ t)`; composite `0` on `H₁(S¹) = ℝ` while `i_M` is iso | Pass |
| §2.4 relative chains (carried) | `W = ∅`; `W = X`; `(ℝ, ℝ ∖ {0})` | absolute; `0`; `H₁ ≅ ℝ`, `H₀ = 0` via `(a, b) ↦ a + b`; `2t − 1` has boundary `[1] − [−1]` | Pass |
| §2.5 retractions and collars (carried) | `t = 2, −1, 0.3`; `v = (3, 4)`; `θ ↦ (|sin θ|, 0)` | `1, 0, 0.3`; `(0.6, 0.8)`; `|sin θ|` not differentiable at `0, π` | Pass |
| §2.5 must-not-enter (carried) | faces `(y−z)², (x−z)², (x−y)²` into `[0, ∞)` | Hessian diag `2`, off-diag `−2`, along `(t, t, t)`: `−3t² < 0`; continuous filling `max(Q + ψ, 0)` exists | Pass |
| §3.1 differential and cocone signs (carried) | `(α, β)`; `d_fstX`, `d_sndX`, `⟦−1⟧` | `d² = 0`; cofiber `(a, g) ↦ (−da, φa + dg)`, shifted `(da, −φa − dg)`; `T(α, β) = (α, −β)` intertwines | Pass |
| §3.1 connecting map sign (carried) | `(ℝ, ℝ ∖ {0})`, `b = 1` on `(0, ∞)`, `c = [−1, 1]` | `∫_c 0 − (b(1) − b(−1)) = −1`, so `−[(0, b)]` evaluates to `1 = b(∂c)` | Pass |
| §3.1 degree zero and extremes (carried) | `H⁰(ℝ, ℝ ∖ {0})`; `W = ∅`; `W = X` | `0`; absolute; cone of identity, acyclic | Pass |
| §3.2 evaluation and cone-to-kernel (carried) | `α = ψ dx`, `β = Ψ|_W`; `Ψ(a, b) = a − d(sb) − s(ra − db)` | `1 − (1 − 0) = 0`, `(α, β) = d(Ψ, 0)`; `rΨ = 0`, `Ψd = dΨ`; `1/x` has no extension | Pass |
| §3.3 headline (carried) | `(ℝ, ℝ ∖ {0})`; `(ℝ², ℝ² ∖ {0})` | `H¹ ≅ ℝ`; `H² ≅ ℝ`, `H¹ = 0`; `−(0 − ∫_{∂D} θ) = 2π` | Pass |
| §4.1 headline (carried) | `S¹` both orientations; two points; `ℝ`, `ψ dx`, `K = [−1, 1]`; `K = ∅` | `±2π` both sides; `f(a) − f(b)`; pairing `1`; `0` | Pass |
| §4.2 boundary formula (carried) | `D¹`, `β = c₊, c₋`; `[0, 1]`, `α = dx`, `β = x`; `β = 0` near `∂M` | pairing `−(c₊ − c₋)` agreeing with Stokes; `1 − (1 − 0) = 0`; reduces to §4.1 | Pass |
| §5.1 definitions (carried) | `F = x + p`, `j = id`, `((1, 2), 3)`; `F = x² + p`, `j = 0`, `p = −1, 0, 1`; `W = ℝ`, `j = id` | `2`; regular, not regular (derivative `0`), regular (empty fibre); `(u, v) ↦ 2xu − v` onto | Pass |
| §5.1 avoidance (carried) | `dim E + dim W < dim V` | rank `≤ dim E + dim W < dim V`: a regular `p` has no incidence point | Pass |
| §5.2 headline (carried) | `F = x² + p`, `j = 0`; `F = x²`; `V = 0`; `P = 0`; `E = W = 0` | bad set `{0}` null; bad set `ℝ` when total surjectivity fails; `∅`; lone parameter regular; `{F = j(0)}` codimension `≥ 1`: null | Pass |
| §5.2 route (carried) | incidence manifold `Z`, `π : Z → P` | `dim Z = dim E + dim W + dim P − dim V`; `C^∞` meets `(dim Z)² + 1 ≤ ∞`; countably many charts | Pass |
| §5.3 universal transversality (carried) | `G((x, y), p) = f(x) + β(x)p − j(y)` | `β(x) > 0`: `q ↦ β(x)q` onto; `β(x) = 0`: `Dβ(x) = 0`, derivative `Df u − Dj v` onto by `hgood` | Pass |
| §5.3 headline and Checks (carried) | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β = 0`; `C = ∅`; `f = β = x²`, `j = 0`; `V = 0` | `4`, fixes `{0}`; `p = 0` works; universality from `β > 0`; `x²(1 + p)` has critical zero for every `p`: `hgood` necessary; `p = 0` | Pass |
| `relativeTranslate` (carried) | `f = x`, `β = x²`, `p = 2`, `x = 0, 1` | `0, 3`; `d_x = 1, 5`; `∂_p = 0, 1` | Pass |
| Conventions (carried) | point in degrees `0, 1`; relative degree `0`; `[CompleteSpace F]` | `Ω⁻¹ = 0`; completeness only at the `curveIntegral` comparison | Pass |

The table has 7 rows computed at this head and 33 carried rows; it covers the sampled targets, the five headlines and the one changed statement.

## Not verifiable

- **Lee, Introduction to Smooth Manifolds, 2nd ed.** and **Bott–Tu, Differential Forms in Algebraic Topology**: settled as uncertified in the manifest; the diff cites neither, and they are cited by locator alone as before.
- Ownership against open pull requests was checked in the sibling checkouts the brief lists and through the previous report's `roadmaps grep` passes; the board's package index names no package that builds the changed objects.

## Source issues

- none
