# Repair report: SobolevMapsBetweenManifolds design, round 3

One review with four findings (F01 P2, F02–F04 P3). All four check out. F02, F03 and F04 are
applied as asked, and F04 is also repaired at five other places with the same pattern. F01 is
applied by the reviewer's own fallback: RiemannianGeometry R4.6 is stated under smooth
conventions, so §3.1 stays here as the continuous-metric variant. The Scope bullet is rewritten,
and a supplier contract and an agreement Check are added. Files changed:
`packages/SobolevMapsBetweenManifolds/design/README.md` and
`packages/SobolevMapsBetweenManifolds/design/plan.json`. `sources.toml` is unchanged: no new work
is cited.

## F01 (P2) — applied differently

Verified in part. The old Scope bullet was accurate for main but wrong at the head of
RiemannianGeometry's open revision. That head says R4.6 owns the transfer of chartwise nullity to
the Riemannian volume (`TauCetiRoadmap/RiemannianGeometry/README.md` lines 42–43, 136–137 and
1225–1233), for every subset and in both directions on chart sources. The finding is right on
that point.

The reviewer's main repair is not mathematically available: consume R4.6 for both directions and
reduce §3.1 to a one-line consequence. RiemannianGeometry's standing conventions are
"Hausdorff, second-countable, boundaryless smooth manifolds and smooth positive-definite
Riemannian metrics" (`IsContMDiffRiemannianBundle`). That is lines 51–52 at the revision's head,
and the first lines of "Conventions and suppliers" on main and at the two other open heads. R4.6
states nothing for a merely continuous metric, a `C¹` manifold, a model with boundary or a
non-Hausdorff manifold. §3.1 needs all four. Its hypotheses are `[IsManifold I 1 M]`,
`[LindelofSpace M]`, a model with boundary allowed and `IsContinuousRiemannianBundle`, and §3.2,
§5.3 and Layers 5–6 apply it to arbitrary continuous metrics. Consuming R4.6 would narrow §3.1
below what it is used for. The general transfer also exists only at an open revision, which the
brief says is never a dependency. So the reviewer's fallback applies.

Change: Scope bullet "R4.6 and R6 prove … comparison for arbitrary sets … is §3.1 here" → "R4.6
owns the comparison … under its conventions (smooth, boundaryless, Hausdorff, second-countable,
smooth metrics) …; §3.1 differs in asking only a continuous metric on a `C¹` Lindelöf manifold,
possibly with boundary … (a Check); its consequences are owned here". Also added: a §3.1 Check
(agreement with R4.6 for smooth metrics, plus a computed continuous non-smooth example), a
supplier contract `### From TauCetiRoadmap.RiemannianGeometry` (R4.6, agreement Check only), a
`plan.json` supplier entry and the 3.1 test `riemannian_geometry_agreement`. No `*Needs:*` line
cites R4.6.

## F02 (P3) — applied

Verified. `Orientation.volumeForm_neg_orientation`: for `(o_V, o_W) = (+, −)`,
`id^*(o_W.volumeForm) = −o_V.volumeForm`, so `J(id) = −1`. Change: §6.1 "`J(id_V) = 1`" →
"`J(id_V) = 1` when `o_W = o_V` and `J(id_V) = −1` when `o_W = −o_V`". `plan.json`
`orientedJacobian_comp` has the same change. Pattern: §6.1's orthonormal-basis Check also asserts
`J(id) = 1` and now states "with the standard orientation on both sides" (README and `plan.json`
`non_orthonormal_bases`). The other identity Jacobians are already correct: §6.2's `(M, o) → (M, −o)`
gives `−1`, and §7.1's `id_Ω` carries the model orientation on both sides.

## F03 (P3) — applied

Verified at the pin. `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` is
`¬ AbsolutelyContinuousOnInterval cantorFunction 0 1` (`CantorFunction.lean:245`), and the
interval lemma takes `HasWeakLineDerivOn volume ⟨Ioo a b, _⟩` (`Interval.lean:302–306`).
`TauCeti.cantorFunction : ℝ → ℝ` is already `0` on `(−∞, 0]` and `1` on `[1, ∞)` (`:162`, `:167`).
Change: the Check moves from "on `(0, 1)` … not in `W^{1,1}_loc((0, 1))`" to `c` on `ℝ`, not in
`W^{1,1}_loc(ℝ)`. The proof goes by restriction to `(0, 1)`, the interval lemma on `[0, 1]` and the
pinned lemma. The Check also keeps the `(0, 1)` statement through `[1/4, 3/4]`, with
`c(1/4) = 1/3` and `c(3/4) = 2/3`. `plan.json` `cantor_not_member` has the same change. The
§4.4 and §5.2 Cantor Checks cite §1.2 on `ℝ` and stay consistent.

## F04 (P3) — applied

Verified. §4.3 defines `Df` as a total choice of a weak differential, and a field equal to one
off a null set is one, so `{1}` can be changed freely. Change: "for `t ≠ 0`" → "for almost every
`t`", plus a clause that changing the field at `t = 1` gives another weak differential (README,
`plan.json` `circle_map_differential`). The same pattern is repaired at these places:

- the Conventions' Totality bullet now says that values computed for particular maps hold almost
  everywhere, and that pointwise linear-algebra identities hold everywhere;
- §4.4: "`Df(t) = 2|t|` everywhere" → "`mfderiv f t = 2|t|` at every `t`, so `Df(t) = 2|t|` for
  almost every `t`", and `Df = sign(t)` almost everywhere (`t_abs_t`, `abs_not_C1`);
- §5.1: the circle-map norm holds for almost every `t` (`circle_radius`);
- §6.2: `J_f = −1` almost everywhere for `(M, o) → (M, −o)` (`identity_reversed`);
- the circle-map worked example.

## Checks run

**Dependency gate** (after the edits):

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2391 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The new supplier, RiemannianGeometry, is on main.

**`roadmaps resolve`** on the README: no cross-roadmap citation found nowhere, and no Lean name
found nowhere.

**Overlaps.** `R4.6` exists on main and at all three open RiemannianGeometry heads (#1187, #1327,
#1683). None renumbers it. The agreement Check and the
supplier contract describe R4.6 in terms true on main ("Prove chart nullity and its canonical-volume
comparison") and at the revision's head. So no id this roadmap cites is defined only by an open
revision. Ownership was checked against open pull requests by object: `roadmaps grep` for the
nullity-to-volume transfer finds only RiemannianGeometry (main and its three heads).
DifferentialGeometry on main uses `IsNullSet` only for Sard (10.2) and its no-measurable-structure
convention.

**`Suggested.lean` / `#check` elaboration.** Not applicable: the package is at the design stage
and has no `Suggested.lean`. No Lean name was added or removed.

**Adversarial pass** on every added or changed statement:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope: R4.6's conventions | RG main "Conventions and suppliers" lines 1–6; head lines 51–52; #1327 line 39 | "boundaryless smooth manifolds and smooth … metrics", `IsContMDiffRiemannianBundle` | R4.6 is the smooth case of §3.1 | Scope rewritten |
| §3.1 new Check, continuous metric | `g = (1 + |x₁|^{1/2})δ` on `ℝ²` | Gram det `(1 + |x₁|^{1/2})²`, density `1 + |x₁|^{1/2} ≥ 1`; `vol([0,1]²) = 1 + 2/3 = 5/3`; `vol({0} × [0,1]) = 0`, identity-chart image a segment, Lebesgue-null | both sides agree; metric continuous, `∂₁|x₁|^{1/2}` unbounded at `0`, so not `C¹` | added |
| §3.1 Check, smooth case | flat `ℝ²`, `4(dx² + dy²)` | `1`, `4`; segment null for both (existing Check) | R4.6 and §3.1 agree | none |
| §3.1, dimension 0 | `0`-manifold | Haar charges `{0}`; counting measure | only `∅` null on both sides, unchanged | none |
| §6.1 `J(id)` | `n = 2`, `(o_V, o_W) = (+,+), (+,−)` | `id^*ω = ω` → `1`; `id^*(−ω) = −ω` → `−1` | holds as restated | restated |
| §6.1 `J(id)`, `n = 0` | `(+,+), (+,−), (−,+), (−,−)` | `±constOfIsEmpty 1` ratios `1, −1, −1, 1` | matches the dimension-0 Check | none |
| §6.1 composition with `id` | `J_{(o,−o)}(id) · J_{(−o,o)}(id)` | `(−1)(−1) = 1 = J_{(o,o)}(id)` | multiplicativity consistent | none |
| §6.1 orthonormal Check | `id`, standard orientations, bases `(2e₁, e₂)`, `(e₁, e₂)` | columns `(2,0)`, `(0,1)`, `det = 2`; `J(id) = 1` | holds with the orientation now named | restated |
| §1.2 Cantor on `ℝ` | `c` with `c = 0` on `(−∞,0]`, `1` on `[1,∞)` | member ⇒ `HasWeakFDerivOn` on `Ioo 0 1` (`.mono`), direction `1` (`hasWeakFDerivOn_iff`), `U · 1` integrable on `[0,1]` (local `L¹`), `c` continuous ⇒ AC on `[0,1]`; pinned lemma: not AC | contradiction, so not a member | restated |
| §1.2 Cantor on `(0,1)` | `[1/4, 3/4]` | `1/4 = 0.0202…₃ ↦ 0.0101…₂ = 1/3`; `3/4 = 0.2020…₃ ↦ 0.1010…₂ = 2/3`; AC with `c' = 0` a.e. gives increment `0 ≠ 1/3` | not a member | kept as second clause |
| §1.2 Cantor, wrong model | classical derivative a.e. | `c' = 0 ∈ L¹_loc` | wrong model accepts `c`; Check rejects | none |
| §4.3 circle map | field changed at `t = 1` | `{1}` Lebesgue-null, so still a weak differential | only a.e. determined | restated |
| §4.4 `t|t|` | `t = 0`, `t = ±1` | `mfderiv`: `0`, `2`; `Df` total choice may differ on a null set | everywhere for `mfderiv`, a.e. for `Df` | restated |
| §5.1 circle norm | radius `1`, `3` | `|∂_θ| = 1, 3`; `‖Df‖ = |t|^{−1/2}/2`, `3|t|^{−1/2}/2` a.e. | holds a.e. | restated |
| §6.2 `(M,o) → (M,−o)` | point off the class's null set; a point in it with `Df(x) = 0` | `J(id) = −1`; `J(0) = 0` | a.e. only (everywhere when `n = 0`) | restated |
| Conventions, Totality | discontinuous `f`; `0`-manifold; §6.2 `|J_f| = normDet(Df)`; §6.3 `|J_f| ≤ ‖Df‖ⁿ` | `Df = 0` everywhere off the class; `Df = 0` forced in dim 0; identities pointwise in `Df(x)` | consistent with every Check | added sentence |

**Convention witnesses recomputed.** The volume witness (unit square `1` and `4`) and the new
`5/3` agree with §3.1, §6.2 and §6.4. The sign witnesses of `J` (Conventions `diag(−1, 1)`,
§6.1 `J(id)` by orientation pair, §6.2 identity `−1`, §7.1 `id_Ω` with one orientation `1`)
agree. Circle-map values in §4.3, §5.1, §5.2, §8.2 and the worked example now all say "almost
everywhere" or follow the Totality convention.

## For the maintainer

- RiemannianGeometry is now a declared supplier (R4.6, agreement Check only). It is on main, so
  the gate is unaffected. If RiemannianGeometry's open revision merges, R4.6 owns the transfer for
  smooth metrics, and §3.1 is the stated continuous-metric, `C¹`, possibly-with-boundary variant.
  It would be cleanest for a later revision of RiemannianGeometry to state R4.6 for continuous
  metrics, but that is outside this package.
- No name that other roadmaps cite changed. QuasiregularMaps cites this roadmap by the headline
  labels T2–T4 and its gap slugs. Its use of `J(A)` (its README lines 118–122: `J(A) = det A`
  "when `V = W` with one orientation") already carries the hypothesis F02 adds to the identity
  clause.
- The previous review's note that this roadmap should be inserted before QuasiregularMaps in the
  merge order still stands. That is the intake's decision, not this package's.
