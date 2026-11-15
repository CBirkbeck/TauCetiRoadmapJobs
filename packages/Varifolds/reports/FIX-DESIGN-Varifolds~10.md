# FIX-DESIGN-Varifolds~10: repair of the Varifolds design

The review REV-DESIGN-Varifolds~9 has three findings: F01 (P2), F02 (P3) and F03 (P3). All three
are right.

- F02 and F03 are applied as the review asks. F03 is also applied to Layers 7 and 9, which had the
  same omission.
- F01 is applied differently. The review asks for the 4.4 law to hold for isometries of class C².
  The connection transport that this needs is pinned in Tau Ceti for smooth maps only. So 4.4 and
  9.2 now use smooth isometries and cite the pinned declarations.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`

`packages/Varifolds/sources.toml` is unchanged: no new source is cited.

## F01 (P2) — applied differently

**Verified.** 4.1 defines δV(X) only for C¹ fields X. If f is only C¹, the pulled-back field
f^*Y = df⁻¹(Y ∘ f) is only C⁰, so the identity δ(f_#V)(Y) = δV(f^*Y) behind the law has no meaning.

That a C¹ isometry is smooth is the Myers–Steenrod theorem. No supplier owns it:

- `Completed/HopfRinow/README.md` line 527–529 names it as a separate, unowned milestone.
- Pinned Tau Ceti has only the compactness part (`TauCeti/Topology/MetricSpace/Isometry/Group.lean`
  line 30–33).

**Why the requested repair was changed.** For a C² isometry the law needs two facts:

- f^*Y is C¹. This is pinned: Mathlib `ContMDiff.mpullback_vectorField`,
  `Mathlib/Geometry/Manifold/VectorField/Pullback.lean` line 608, with C^m fields, C^n maps and
  m + 1 ≤ n.
- f carries the Levi-Civita connection of g to that of g'. This is not pinned for C² maps.

The pinned `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`
(`TauCeti/Geometry/Manifold/Riemannian/Isometry/LeviCivita.lean` line 130) is stated for
`TauCeti.IsLocalRiemannianIsometry`, whose field `contMDiff` requires `ContMDiff I J ∞ f`
(`Isometry/Local.lean` line 70–72).

A C² version would be a new prerequisite with no owner. No generality is lost by using smooth
isometries: every C¹ isometry between smooth metrics is smooth (Myers–Steenrod), and the
roadmap applies the law only to smooth maps (rotations, and 4.5's λ⁻¹exp_x⁻¹).

**Changes** (old → new):

- **4.4, isometry bullet.** Old: "for an isometry f of W onto an open W' (1.2)". New: the bullet is
  stated for a smooth isometry. It gives δ(f_#V)(Y) = δV(f^*Y), citing the two declarations above.
  It adds ‖δ(f_#V)‖ = f_*‖δV‖, keeps H, σ and η transported by df, and says why C¹ is not enough
  and that Myers–Steenrod is not used. *Needs* gains those two declarations and
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`.
- **4.4, new Check.** It fixes the direction of the law with a rotation by π/2 of the unit circle.
- **9.2.** "isometry f … (1.2)" → "smooth isometry f … (1.2 with f smooth)". New text:
  - VarTan(f_#V, f(x)) = (df_x)_# VarTan(V, x), through `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`
    (the pinned form of HopfRinow's transport across smooth isometries) and 3.1's chain rule;
  - for a C¹ isometry only the bundle-level statements of 1.2 and 3.1 survive.

  *Needs* gains HopfRinow Layer 1, `TauCeti.RiemannianIsometry.riemannianExp_mfderiv` and
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`.
- **Same pattern elsewhere:**
  - 4.5: "by the isometry y ↦ λ⁻¹exp_x⁻¹(y)" → "by the smooth isometry …, to which 4.4's isometry
    law applies". *Needs* gains Layer 4.3–4.4: the exact identity for ‖δ_{g̃_λ}Ṽ_λ‖ uses them,
    and it was missing before.
  - Scope and ownership, and How to read the build: "isometry invariance" → "invariance under
    smooth isometries".
  - Supplier contracts: From Mathlib gains `ContMDiff.mpullback_vectorField`. From Tau Ceti gains
    `TauCeti.IsLocalRiemannianIsometry`, its connection transport, the restricted metric,
    `TauCeti.RiemannianIsometry` and `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`. From
    HopfRinow, Layer 1 now also names local existence and uniqueness of geodesics.
  - plan.json:
    - 4.4: statement, prerequisites, a new API entry "smooth isometries" and a new test;
    - 4.5: prerequisites `target:4.3` and `target:4.4`;
    - 9.2: statement, the hypothesis "f smooth isometry …", prerequisites `target:3.2`,
      `roadmap:HopfRinow Layer 1` and the two Tau Ceti declarations;
    - HopfRinow supplier entry.
- **Kept as they are:**
  - 1.2: the C¹ definition and the bundle homeomorphism (x, P) ↦ (f(x), df_x P df_x⁻¹), which is
    continuous for C¹ f;
  - 3.1: J_S f = 1 for C¹ isometries;
  - 9.1: C^r diffeomorphisms for reg^r;
  - 5.2's isometric embedding, which is smooth.

## F02 (P3) — applied

**Verified.** Simon1983 line 8001–8011 (42.10) proves the bound for a fixed number N of points,
with ε depending on N. It then bounds N "a priori", which needs Θ ≥ 1 at those points. Off R only
the ratio bound at the point itself is known, and 6.3's lower bound needs a ratio bound on an open
set. The review's argument fills the gap correctly.

**Change.** Step (iii) of 7.5 now says:

- the induction gives the bound for n points with a threshold ε_n;
- it also lowers δ, which is harmless (line 8010–8011);
- at y ∈ (spt‖V‖ ∩ B_2(0)) ∖ R, monotonicity gives ρ^{1−k}‖δ_hV‖(B_ρ(y)) ≤ CΛερ → 0, so 7.2
  applies;
- each tangent varifold C has Θ ≥ 1 on spt‖C‖ (by 7.1, then 6.3's upper semicontinuity), so
  Θ(y) ∈ {0} ∪ [1, ∞);
- with n_0 the integer part of (1 + δ)Λ(ω_k2^k)⁻¹ + δ, the (n_0 + 1)-point bound excludes
  n_0 + 1 points of positive density, and ε ≤ min(ε_1, …, ε_{n_0+1}).

Also:

- *Needs* gains Layer 7.1–7.2; plan.json 7.5 gains `target:7.1` and `target:7.2`. Neither 7.1 nor
  7.2 uses 7.5, so there is no cycle.
- New Check "density ½ on R": the boundary of a small disc.
- The first Check now records n_0 ≥ m.

**Statement of 7.5:** unchanged.

## F03 (P3) — applied

**Verified.** Each item the review lists is used in its layer's *Needs* lines and was missing from
the layer's Dependencies line:

- 2.1–2.3: Besicovitch, Vitali, `LinearMap.normDet_comp`, `TauCeti.riemannianVolume`,
  `TauCeti.eq_riemannianVolume_iff`;
- 3.1, 3.3: `LinearMap.normDet`, `MeasureTheory.Measure.condKernel`, the Besicovitch and Vitali
  families;
- 4.1–4.4: `CovariantDerivative.leviCivitaConnection`, `RealRMK.rieszMeasure`, `Measure.rnDeriv`,
  `Measure.singularPart`;
- 5.1: `MeasureTheory.integral_divergence_eq_zero`.

**Change.** The Dependencies lines of Layers 2, 3, 4 and 5 now list these by name. Layer 4 also
lists the F01 inputs.

**Same pattern elsewhere:**

- Layer 7 lacked `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported` (used by 7.2) and
  `LipschitzWith.hausdorffMeasure_image_le` (used by 7.5 and 7.6). Both are added.
- Layer 9 gains HopfRinow Layer 1 and the Tau Ceti inputs of 9.2.
- Layers 1, 6 and 8 already listed everything.

## Checks run

**Dependency check** (command of the brief):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. Every supplier is on main (GeometricMeasureTheory,
GeometricCurrents, RiemannianGeometry, Completed HopfRinow) or a pin.

**`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name was found missing.
The tool did not check names outside TauCetiRoadmap, because the host has no pinned packages, so I
checked them myself:

- All 71 backticked identifiers of the README were grepped as declarations in pinned Mathlib
  (`1b1ccf4b`) and Tau Ceti (`2fd255d9`).
- Every one is found. `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` is a named
  instance (`Mathlib/MeasureTheory/Measure/Regular.lean` line 1183).
- The new names were checked by hand at the pins:
  - `ContMDiff.mpullback_vectorField`: Pullback.lean line 608;
  - `TauCeti.IsLocalRiemannianIsometry`: Isometry/Local.lean line 70;
  - `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`:
    Isometry/LeviCivita.lean line 130, with `[IsManifold I 2 M]`, `[IsManifold J 2 N]`, C¹ metrics
    and finite-dimensional models in scope;
  - `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`: Restriction.lean line 130;
  - `TauCeti.RiemannianIsometry`: Isometry/Basic.lean line 44;
  - `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`: Isometry/Exponential.lean line 117, with
    smooth metrics, `Boundaryless` and `T2Space`.

**Other checks.**

- `plan.json` parses, and every new prerequisite is an earlier target, a pin or a supplier section.
- `gaps` stays empty.
- Grep of the README for LaTeX delimiters, machine paths and process words: none.

**Suggested.lean:** there is none at the design stage. No `#check` comparison was possible or
needed, and no Lean name of this roadmap's own was added.

**Gate failures listed in the brief:** none.

**Ownership.**

- No new construction is owned. The new route inputs are pinned Tau Ceti declarations; the exp
  transport is HopfRinow Layer 4's milestone as delivered in Tau Ceti.
- Overlap report: no open pull request changes this roadmap, and no id is dropped.
- No source was fetched and `needs-references.toml` was not written.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.4 isometry law | rotation R by π/2, V = [C] | H_{f_#V}(e_2) = −e_2; df(H_V(e_1)) = R(−e_1) = −e_2; without df: −e_1 (tangent at e_2) | holds; the df-free model is excluded | new Check |
| 4.4 isometry law | reflection x_1 ↦ −x_1, half hyperplane {x_N = 0, x_1 > 0} | image {x_1 < 0}: η' = +e_1 = df(−e_1); σ' = H^{N−2}⌞edge = f_*σ | holds | none |
| 4.4 isometry law | f = id; V = 0; k = N, V = vol | trivial; 0 = 0; H = 0 both sides | holds | none |
| 4.4 ‖δ(f_#V)‖ = f_*‖δV‖ | rotation, [C] | H¹⌞C on both sides | holds | added |
| 4.4 class of f | C¹ isometry | f^*Y is C⁰ and div_S(f^*Y) undefined; no counterexample exists (Myers–Steenrod) | hypothesis changed to smooth | done |
| 4.5 smooth isometry | φ(z) = λ⁻¹exp_x⁻¹(z) | φ^*g̃_λ(u, u) = λ⁻²g(z)(u, u); smooth on a normal ball | holds | "smooth" added |
| 9.2 exp naturality | rotation R of S², x ↦ Rx | R(cos\|v\| x + sin\|v\| v/\|v\|) = exp_{Rx}(Rv) | holds | cited at the pin |
| 9.2 VarTan | rigid motion y ↦ Ry + b of E | η_{f(x),λ}(f(y)) = λ⁻¹R(y − x) = Rη_{x,λ}(y), so VarTan maps by R; crossing lines: Θ(0) = 2 both | holds | none |
| 7.5 count, m-plane | Λ = mω_k3^k | n_0 ≥ ⌊(1 + δ)m(3/2)^k + δ⌋ ≥ m; one fibre point of density m | holds | Check extended |
| 7.5 count, two planes | Λ ≈ 2ω_k3^k | n_0 ≥ ⌊2(3/2)^k(1 − o(1))⌋ ≥ 2; two points of density 1 | holds | none |
| 7.5 count, small Λ | k = 2, Λ = 1 | n_0 = ⌊(1 + δ)/(4π) + δ⌋ = 0; a point off R with Θ ≥ 1 would give ‖V‖(B_1(y)) ≳ π > Λ | consistent | none |
| 7.5 dichotomy | disc of radius r, 2πr < ε², y ∈ ∂D | Θ(y) = ½; ratio ≥ 2ρ/(πρ²/2) = 4/(πρ) > ε for ρ ≤ r, so y ∈ R ∩ Z | dichotomy fails on R only | new Check |
| 7.5 dense discs | Check of 7.5 | R = B_2(0); no point off R; count 0 | holds | none |
| 7.5 degenerate | V = 0 | spt empty, R = ∅, sums 0 | holds | none |
| 7.5 route inputs | 7.1, 7.2 after 7.5? | 7.1 needs 1.2, 1.4, 4.3, 4.5, 6.2–6.3; 7.2 needs 1.4, 3.2, 4.5, 6.1, 6.3 | no cycle | Needs updated |

## For the maintainer

- No id, heading or name that other roadmaps cite was changed or dropped. 9.2's heading is kept.
- The design now consumes the following pinned Tau Ceti declarations; no other roadmap is affected:
  - `TauCeti.IsLocalRiemannianIsometry` and
    `TauCeti.IsLocalRiemannianIsometry.mfderiv_leviCivitaConnection_mpullback`;
  - `TauCeti.RiemannianIsometry` and `TauCeti.RiemannianIsometry.riemannianExp_mfderiv`;
  - `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`.
- The README names the Myers–Steenrod theorem only to say it is not used, as
  `Completed/HopfRinow/README.md` does; no locator is given for it.
- The review's "Source issues" and "For the human reviewers" sections list no finding. Nothing was
  changed because of them.
