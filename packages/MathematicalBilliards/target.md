Verdict: design
Name: MathematicalBilliards
Base: none
Owner: none

## Scope

The roadmap owns the two classical planar billiard systems as dynamical systems: the billiard ball
map of a strictly convex table as a monotone twist map of the phase cylinder, with its rotational
invariant curves, and the billiard flow of a polygonal table as a measure-preserving flow, with the
reduction of the rational case to straight-line flows on a translation surface.

**What is already planned, and is imported, not planned again.** SymplecticGeometry
(`TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`, on main), section C3.1,
paragraph "Convex planar billiards", already plans, for a **smooth** `L`-periodic unit-speed
boundary `χ` of a strictly convex table:

- the next-collision map `β̃` on the strip `ℝ × (−1, 1)` in the coordinates `(s, v)`, `v` the
  tangential component of the outgoing unit velocity (so `v = cos δ`: these are the Birkhoff
  coordinates of the filed statement), its existence, uniqueness, smoothness, smooth inverse and
  equivariance, and the induced homeomorphism `β` of `AddCircle L × (−1, 1)`;
- the generating function `S(s, t) = −‖χ(t) − χ(s)‖` with `v = ∂_s S`, `w = −∂_t S`, the twist
  inequality `∂_s ∂_t S < 0`, the identity `β̃*λ − λ = dℓ` for `λ = v ds`, hence `β̃*ω = ω` for
  `ω = ds ∧ dv`, and `MeasureTheory.MeasurePreserving β` for the product measure;
- critical inscribed `N`-gons as `N`-periodic states, and the existence theorem
  `exists_billiard_periodic_reflection` (in its `Suggested.lean`);
- the circular table `β(s, v) = (s + 2R arccos v mod L, v)` and finite-volume recurrence.

SymplecticGeometry/IntegrableSystems I5 owns the Poincaré–Birkhoff fixed-point theorem for smooth
area-preserving diffeomorphisms of the closed annulus, with Mathlib's `CircleDeg1Lift`
translation number on the boundary lifts. None of this is at the pinned Tau Ceti as a declaration
(no declaration of either library mentions billiards); it is roadmap text on main, and this
roadmap cites it by name and section.

**What this roadmap owns.**

1. *Convex tables at finite regularity.* The table of regularity `C^k`, `1 ≤ k ≤ ∞`, as a
   carrier; the theorem that a `C²` simple closed unit-speed curve of positive curvature is such a
   table; the billiard ball map on the phase cylinder in the coordinates `(s, δ)`; its regularity
   `C^{k−1}`; the extension to the closed cylinder; the comparison with C3.1's `β` when `k = ∞`.
   C3.1 is smooth only, and the consumers need `C²` (BialyMironov2022 line 97), so the
   finite-regularity statements are new and are proved here once, at `C^k`; the smooth case is
   then read off through the comparison, not proved a second time.
2. *Twist maps of the annulus.* The definition of a monotone twist map of an open annulus through
   its lift, exactness and area preservation, time reversal, and the proof that the billiard ball
   map is one.
3. *Rotational invariant curves.* Their definition, the rotation number through Mathlib's
   `CircleDeg1Lift.translationNumber`, Birkhoff's theorem that they are Lipschitz graphs, Birkhoff
   periodic orbits of type `(p, q)`, and the circular table as the totally integrable example.
4. *Polygonal tables.* Tables bounded by finitely many simple polygons (one outer boundary and
   finitely many polygonal holes), the phase space, trajectories, the singular set, the billiard
   flow and the Liouville measure.
5. *Rational tables.* The finite reflection group, invariance of the direction orbit, the
   translation surface of Katok–Zemlyakov with its straight-line flows, and non-ergodicity.
6. *Weak mixing of measure-preserving flows*, as a definition with its first properties.

**Boundaries.** Not in this roadmap: caustics, the string construction and the ellipse (a consumer
states the Birkhoff–Poritsky results); Aubry–Mather sets and KAM curves (Lazutkin); dispersing and
semi-dispersing billiards, hyperbolicity and the Sinai billiard; billiards in dimension three and
higher and on Riemannian surfaces; outer and symplectic billiards; the moduli of translation
surfaces, strata, the `SL₂(ℝ)` action, Veech groups, and the theorems that need them (ergodicity
in almost every direction, the weak-mixing theorems). The translation surface of item 5 is built
only as far as the reduction needs: a compact surface with a flat atlas off finitely many cone
points and its directional flows. A general roadmap on translation surfaces, if one is filed,
consumes that construction or takes ownership of it by moving it earlier in the merge order.

## Final targets

Notation: `ℓ > 0`; `γ : ℝ → ℝ²` (`EuclideanSpace ℝ (Fin 2)`); `τ(s) = γ′(s)`; `R_δ` the rotation
by `δ` counterclockwise; `A = (ℝ/ℓℤ) × (0, π)`, `Ā = (ℝ/ℓℤ) × [0, π]`.

**T1. Convex tables.** A *convex billiard table of class `C^k`* is an `ℓ`-periodic `C^k` map `γ`
with `‖γ′‖ = 1`, injective on `[0, ℓ)`, whose image is the boundary of a compact strictly convex
set `Ω` with nonempty interior lying to the left of every tangent line. Prove: (a) if `γ` is `C²`,
`ℓ`-periodic, unit-speed, injective on `[0, ℓ)` and has positive signed curvature, then it is a
convex billiard table of class `C²` (Tabachnikov2005, Chapter 3; a standard fact of plane
differential geometry); (b) for every table, `s`, and `δ ∈ (0, π)`, the ray from `γ(s)` in the
direction `R_δ τ(s)` meets the image of `γ` in exactly one further point, and its open chord lies
in the interior of `Ω`; (c) `A` is in bijection with the oriented lines meeting the interior of
`Ω`; (d) a table of class `C^∞` satisfies the hypotheses of C3.1's
`exists_billiard_periodic_reflection`. The filed statement assumes positive curvature; the general
hypothesis is strict convexity, and positive curvature is the case (a).

**T2. The billiard ball map.** For a table of class `C^k`, `k ≥ 2`, define `T(s, δ) = (s₁, δ₁)`
with `γ(s₁)` the exit point of T1(b), `u` the unit vector from `γ(s)` to `γ(s₁)` and
`cos δ₁ = ⟨u, τ(s₁)⟩`, `δ₁ ∈ (0, π)`; equivalently the outgoing direction at `γ(s₁)` is the
reflection of `u` in the tangent line. Prove that `T` is a `C^{k−1}` diffeomorphism of `A`
(BialyMironov2022 lines 154–157 for the phase cylinder; ChernovMarkarian2006, Chapter 2;
KatokHasselblatt1995, Section 9.2), that for `k = 1` it is a homeomorphism, that it extends to a
homeomorphism of `Ā` fixing both boundary circles pointwise, and that `T⁻¹ = I ∘ T ∘ I` for
`I(s, δ) = (s, π − δ)`. For `k = ∞`, `(s, δ) ↦ (s, cos δ)` conjugates `T` to C3.1's `β`.

**T3. Generating function and invariant area.** With `L(s, s₁) = ‖γ(s) − γ(s₁)‖` on
`{s < s₁ < s + ℓ}`: `∂L/∂s = −cos δ` and `∂L/∂s₁ = cos δ₁` along the graph of the lift of `T`, so
`T*(cos δ₁ ds₁) − cos δ ds = dL` (BialyMironov2022 lines 159–161 and 182–185;
Tabachnikov2005, Chapter 3). Hence `T` preserves the measure `sin δ dδ ds` on `A`, of total mass
`2ℓ`, as `MeasureTheory.MeasurePreserving`; in the coordinates `(s, cos δ)` this is Lebesgue
measure on `(ℝ/ℓℤ) × (−1, 1)`. For `k = 2` the map is only `C¹`, and the statement is the
Jacobian identity, with no differential forms required.

**T4. Twist.** Define a *monotone twist map* of an open annulus `(ℝ/ℓℤ) × (a, b)`: a `C¹`
diffeomorphism preserving orientation and each end, with a lift `F = (F₁, F₂)` to `ℝ × (a, b)` commuting
with the deck translation and with `∂F₁/∂y > 0` everywhere; and the *exact* ones, those with a
generating function invariant under the diagonal deck translation. Prove that `T` is an exact
area-preserving monotone twist map in both coordinate systems, with `∂s₁/∂δ = L / sin δ₁ > 0`,
and that the lift normalised by `s < s₁ < s + ℓ` extends continuously by the identity at `δ = 0`
and by the deck translation at `δ = π` (KatokHasselblatt1995, Section 9.2).

**T5. Rotational invariant curves and Birkhoff's theorem.** A *rotational invariant curve* of a
homeomorphism `f` of an open annulus is an `f`-invariant subset that is the image of a continuous
injective map of the circle not homotopic to a constant (BialyMironov2022 lines 103–104: simple
and winding once). Prove **Birkhoff's theorem**: a rotational invariant curve of an
area-preserving monotone twist map is the graph of a Lipschitz function `ℝ/ℓℤ → (a, b)`
(KatokHasselblatt1995, Chapter 13; used in BialyMironov2022 lines 261–263). For the billiard map
it is a graph over `s` in both coordinate systems. The filed statement asks only for the statement
of this theorem; a roadmap proves its headline theorems, so the proof is a target. Whether area
preservation can be weakened to the hypotheses the proof uses is for the design to settle from the
source.

**T6. Rotation numbers and periodic orbits.** For a rotational invariant curve `C` that is a
graph, the restriction of the normalised lift to `C` is a `CircleDeg1Lift` after the graph
parametrisation; its `translationNumber` divided by `ℓ` is the *rotation number* of `C`. Prove that
it exists as the limit `lim (F₁ⁿ(x) − x₁)/(nℓ)` for every `x ∈ C`, is independent of `x`, lies in
`[0, 1]` for the billiard lift of T4, and is taken to `1 − ρ` by the time reversal `I`. Define
periodic orbits of type `(p, q)` (`F^q(x) = x + (pℓ, 0)` for the normalised lift `F`) and Birkhoff's theorem for them: for
coprime `0 < p < q` a convex table of class `C²` has at least two geometrically distinct periodic
billiard orbits of type `(p, q)` (Birkhoff1927, §§1–3; KatokHasselblatt1995, Section 9.3), the
first by maximising the perimeter over inscribed `q`-gons of winding number `p`, which refines
C3.1's `exists_billiard_periodic_reflection` by the winding number. A rotational invariant curve of
rational rotation number `p/q` on which `T` preserves a measure of full support consists of
periodic orbits of type `(p, q)` (BialyMironov2022 lines 116–119).

**T7. The circular table.** For the circle of radius `R`, `ℓ = 2πR`: `T(s, δ) = (s + 2Rδ, δ)`;
every circle `δ = const` is a rotational invariant curve of rotation number `δ/π`; the phase
cylinder is foliated by them; the orbit of `(s, δ)` is periodic exactly when `δ/π` is rational,
of type `(p, q)` for `δ/π = p/q` in lowest terms. This agrees with C3.1's formula under
`v = cos δ`.

**T8. Polygonal tables and trajectories.** A *polygonal table* `P` is a compact connected subset
of the plane, the closure of its interior, whose boundary is a finite disjoint union of simple
closed polygons (Tau Ceti's `TauCeti.SimplePolygon`); `V` is its finite vertex set. For a side
`S`, `σ_S` is the linear reflection in the direction of `S`. The phase space is
`T₁(P) = (P × S¹)/∼`, where `(x, v) ∼ (x, σ_S v)` for `x` in the relative interior of the side `S`
(ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, §2). The trajectory of a state
moves at unit speed along its direction, reflects at interior points of sides, and stops at a
vertex. Prove that a trajectory makes finitely many reflections in every bounded time interval on
which it meets no vertex, with the explicit corner bound: a trajectory entering a corner of
interior angle `α ∈ (0, 2π)` leaves it after at most `⌈π/α⌉` reflections, by unfolding the corner
(Tabachnikov2005, Chapter 7). The filed statement is for one simple polygon and records holes as
an afterthought; the table with holes is the general object, and the simple polygon is the case
of no holes.

**T9. The singular set and the flow.** Let `Σ ⊂ T₁(P)` be the set of states whose forward or
backward trajectory reaches a vertex or is tangent to a side. Prove that `Σ` is Borel and null
for the push-forward of `Leb_P ⊗ dθ` (inside the three-dimensional phase space, a countable union of images
of two-dimensional sets under piecewise smooth maps, one for each finite itinerary of sides ending
at a vertex). On `X_P = T₁(P) ∖ Σ` define the billiard flow `F^t`, `t ∈ ℝ`: prove
`F^{s+t} = F^s ∘ F^t`, `F⁰ = id`, joint measurability of `(t, x) ↦ F^t x`, and
`MeasureTheory.MeasurePreserving (F^t) μ_P μ_P` for the Liouville probability measure `μ_P`
(the normalised push-forward of `Leb_P ⊗ dθ`), together with reversibility
`F^{−t} = J ∘ F^t ∘ J` for `J(x, v) = (x, −v)` (ChernovMarkarian2006, Chapter 2;
BoldrighiniKeaneMarchetti1978, §2).

**T10. Rational tables.** `P` is *rational* when the group `G_P ≤ O(2)` generated by the `σ_S` is
finite; for a simple polygon this holds exactly when every interior angle is a rational multiple
of `π`, and then `G_P` is dihedral of order `2N`, `N` the least common denominator of the
`angle/π` (MasurTabachnikov2002, §1; ZemlyakovKatok1975). Prove: the map
`X_P → S¹/G_P`, `(x, v) ↦ G_P v`, is measurable, `F`-invariant and not almost everywhere constant,
so `F` is not ergodic for `μ_P`; for every `θ` the set `M_θ` of states with direction in `G_P θ`
is invariant. Construct the Katok–Zemlyakov surface `S_P`, glued from the `|G_P|` reflected copies
of `P` along sides: a compact connected oriented surface with a translation atlas off the finite
set of vertex classes, cone angle `2π m_i` at a vertex class of angle `π m_i / n_i` (in lowest
terms), and, for a simple polygon, genus `1 + (N/2) Σ_i (m_i − 1)/n_i` (MasurTabachnikov2002, §1;
ZemlyakovKatok1975, pp. 291–300). Prove that, for `θ` with trivial stabiliser in `G_P`, the
restriction of `F` to `M_θ ∖ Σ` is conjugate, by a measure-preserving bijection, to the
straight-line flow of direction `θ` on `S_P` off its singular leaves, and that this flow preserves
the flat area.

**T11. Weak mixing of flows.** For a jointly measurable measure-preserving action `F` of `ℝ` on a
probability space, define weak mixing by `(1/T) ∫₀ᵀ |μ(F^t A ∩ B) − μ(A) μ(B)| dt → 0` for all
measurable `A`, `B`. Prove that weak mixing implies ergodicity, that the linear flow of a flat
torus is never weakly mixing, and that weak mixing is equivalent to the absence of non-constant
measurable eigenfunctions (`f ∘ F^t = e^{2πi a t} f` almost everywhere for all `t` forces `a = 0`
and `f` constant), the form in which ChaikaForni2026 works (lines 99–100, Theorem 1.3, on
eigenvalues of directional flows of a translation surface). A rational table is not
weakly mixing, by T10.

**Checks** (special cases the filed wording singled out, and tests of the definitions): the
positive-curvature `C²` table (T1(a)); the unit square, whose surface `S_P` is the flat torus of
side 2 and whose flow in direction `θ` is the linear flow; the right triangle with angle `π/8`,
with `N = 8` and `S_P` of genus 2 (the regular octagon surface); the equilateral triangle, `N = 3`,
genus 1; the `L`-shaped hexagon, with one angle `3π/2`, a cone point of angle `6π` and genus 2; a
square with a square hole, rational, of genus 5 by the cone-angle count; the circular table has
no periodic orbit of type `(p, q)` on the curve `δ = π√2/2`.

## Suppliers

- **Mathlib** (pinned): `CircleDeg1Lift` and `translationNumber`
  (`Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`); `AddCircle` and its Haar
  measure; `MeasureTheory.MeasurePreserving`, `Ergodic`, `Conservative`; `MeasurableVAdd₂` for
  joint measurability of an action; `ContDiff`, the implicit function theorem; `StrictConvex`;
  `Polygon` (`Mathlib/Geometry/Polygon/Basic.lean`). Mathlib has no weak mixing, no signed
  curvature of a plane curve and no rotation index.
- **Tau Ceti** (pinned): `TauCeti.SimplePolygon`, `Polygon.IsSimple` and the circle
  parametrisation of the boundary (`TauCeti/Geometry/Polygon/Simple.lean`); `IsJordanCurve` and the
  Jordan curve and Schoenflies theorems in the plane (`TauCeti/Topology/JordanCurve/`,
  `TauCeti/Analysis/Complex/PlaneSeparation/`); `TauCeti/Dynamics/Flow/` (continuous flows only).
- **SymplecticGeometry** (on main), CotangentLagrangian C3 (generating functions) and C3.1 (the
  smooth billiard map, its area form, periodic polygons, the circle), as listed under Scope;
  IntegrableSystems I5 and I5.0 (annulus conventions, boundary rotation numbers), for conventions
  and as a possible route to the second orbit of T6.
- **GeometricTopology** (on main), Layer 1.7 (compact surfaces) and its Tau Ceti supplier
  contract for the Jordan and Schoenflies theorems, for the interior of a polygon and for `S_P` as
  a compact surface; **TeichmullerGeometry** (#1169, earlier in the merge order), §0.0f (polygon
  schemas and the genus of a glued surface), for the genus of `S_P`.
- No roadmap supplies translation surfaces, twist maps of the open annulus, rotational invariant
  curves or almost-everywhere flows of polygons: `roadmaps grep` finds none (see the report).

## Consumers

- A roadmap stating and proving the Birkhoff–Poritsky theorem for centrally symmetric tables
  (BialyMironov2022 lines 96–109, Theorem 1.1) consumes T1–T6.
- A roadmap on weak mixing of polygonal billiards (ChaikaForni2026 line 28, Theorem 1.1: some
  polygon has a weakly mixing billiard flow; lines 89–100, Theorems 1.2 and 1.3, on products and
  eigenvalues of directional flows of a translation surface) consumes T8–T11.
- A roadmap on translation surfaces and Teichmüller dynamics (strata, the `SL₂(ℝ)` action, the
  theorem of KerckhoffMasurSmillie1986, Theorem 1) consumes T10 and, with TeichmullerGeometry,
  the quadratic differentials of that roadmap.
- HardSphereDynamicsAndKineticLimits (design in progress on the board) shares no object, but a
  later roadmap on dispersing billiards would consume both, as its own target file records; the
  same holds for HyperbolicDynamicsAndThermodynamicFormalism (board package).
- SymplecticGeometry is a supplier only: nothing in it changes, and the comparison of T2 is
  proved here.

## Sources

Keys are those of `packages/MathematicalBilliards/sources.toml`.

- `Tabachnikov2005`: S. Tabachnikov, *Geometry and Billiards*, AMS Student Mathematical Library
  30 (2005), Chapters 3, 5, 7. Waived; cited by locator. (T1, T3, T8.)
- `KatokHasselblatt1995`: A. Katok, B. Hasselblatt, *Introduction to the Modern Theory of
  Dynamical Systems* (1995), Sections 9.2–9.3 and Chapter 13. Waived; cited by locator; the
  theorem numbers inside these sections were not read and are for the design to fix only if a
  legal text appears. (T2, T4, T5, T6.)
- `Birkhoff1927`: G. D. Birkhoff, *On the periodic motions of dynamical systems*, Acta Math. 50
  (1927), 359–379, §§1–3. Recorded as certified, but the cached extraction is not the paper (see
  Risks); cited by locator only. (T6.)
- `ChernovMarkarian2006`: N. Chernov, R. Markarian, *Chaotic Billiards* (2006), Chapter 2. Waived;
  cited by locator. (T2, T8, T9.)
- `ZemlyakovKatok1975`: A. N. Zemlyakov, A. B. Katok, Mat. Zametki 18 (1975), 291–300. Waived;
  cited by locator. (T10.)
- `BoldrighiniKeaneMarchetti1978`: C. Boldrighini, M. Keane, F. Marchetti, *Billiards in
  polygons*, Ann. Probab. 6 (1978), 532–540, §2. Waived; cited by locator. (T8, T9.)
- `KerckhoffMasurSmillie1986`: Ann. of Math. 124 (1986), 293–311, Theorem 1. Waived; cited by
  locator. (Consumers.)
- `BialyMironov2022`: M. Bialy, A. E. Mironov, *The Birkhoff–Poritsky conjecture for
  centrally-symmetric billiard tables*, Ann. of Math. 196 (2022), 389–413; read as arXiv
  2008.03566v4 (open repository). Lines 96–109 (setting and Theorem 1.1), 116–119, 149–185
  (phase cylinder, the two symplectic descriptions, the generating function), 261–263. (T2, T3,
  T5, T6, Consumers.)
- `ChaikaForni2026`: J. Chaika, G. Forni, *Weakly mixing polygonal billiards*, Annals of
  Mathematics; read as arXiv 2003.00890v2 (open repository; 59 of its 103 pages were recognised by
  OCR). Lines 9–17, 28, 89–100. The filed statement names the article only by volume and issue;
  the journal lists this title, the subject and the description in the filed statement (a theorem
  about the associated translation flows) match, but the volume and issue were not confirmed.
  (T11, Consumers.)
- `MasurTabachnikov2002`: H. Masur, S. Tabachnikov, *Rational billiards and flat structures*,
  Handbook of Dynamical Systems 1A (2002), Chapter 13, §1. Paywalled; cited by locator. (T10.)

## Risks

- **Two owners of the convex billiard map.** C3.1 states the map for smooth tables in the
  coordinates `(s, v)`; this roadmap needs it at `C²`. The design must keep one construction: the
  `C^k` one here, with C3.1's smooth map identified with it (T2), and must not restate C3.1's
  smooth theorems as its own targets. If the design finds that the cleanest result is for C3.1 to
  be restated at `C^k`, that is an erratum for SymplecticGeometry, not a second plan.
- **Plane convexity from curvature.** T1(a) needs the turning of the tangent of a simple closed
  curve (the rotation index is ±1) or an equivalent argument; neither library has signed
  curvature of plane curves or the rotation index. This is elementary but is real work, and it
  is why the carrier of T1 assumes convexity and T1(a) is a separate theorem.
- **Boundary behaviour.** The extension of `T` to `Ā` is only a homeomorphism in general; its
  differentiability at the boundary depends on the coordinates. IntegrableSystems I5 needs a
  smooth diffeomorphism of the closed annulus, so the second periodic orbit of T6 may not follow
  from it and may need its own minimax argument. If that proves far above the library, the
  design should keep the maximising orbit as the headline and record the second as a stated
  consequence with its obstruction.
- **Birkhoff's theorem.** The proof is topological (accessible boundary points of an invariant
  region) and uses plane topology beyond what T1–T4 need. The only texts for it are behind
  paywalls and waived; the design writes its own proof and cannot check it against a source.
- **Almost-everywhere flows.** Mathlib's `Flow` is continuous and everywhere defined. T9 avoids a
  new structure by making `X_P` a measurable space carrying an honest `ℝ`-action;
  HardSphereDynamicsAndKineticLimits faces the same choice (its target file, Risks). The two
  designs should use the same shape; neither owns it yet.
- **Translation surfaces without a host.** T10 builds `S_P` by gluing polygons; the library has
  polygon schemas only through TeichmullerGeometry §0.0f, which is still an open pull request. If
  that supplier moves, the genus formula of T10 moves with it; the conjugacy with the
  straight-line flow does not depend on it.
- **Sources.** Six of the ten works are waived or paywalled and cited by locator alone, so
  theorem-level locators inside KatokHasselblatt1995, Tabachnikov2005 and ChernovMarkarian2006
  cannot be checked. The cached text of `Birkhoff1927` is a refusal page of the host, not the
  article, although the manifest records it as certified; no line of it is quoted, and no
  statement here depends on reading it.
