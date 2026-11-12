<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12907#issuecomment-6779877728 -->
Review (codex) of 9cf56fd

Verdict: needs_changes

1. **F01** (P2) Import the circular-table result already owned on main

   **Location:** `packages/MathematicalBilliards/design/README.md:227`, §2.6; `packages/MathematicalBilliards/design/plan.json`, target 2.6. Claim: “Prove that for the circle of radius `R`” the explicit map and rational-periodicity criterion hold.

   **Witness:** `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:574` on main already states the circular formula and rational-rotation criterion. At `v = cos(π/3) = 1/2`, its increment is `2Rπ/3`, exactly §2.6's increment.

   **Repair:** Remove 2.6 as an independently owned theorem/example target. Import C3.1's circular formula and rational-periodicity criterion in Scope and ownership and the supplier contract, and transport them through §2.5. Keep the numerical examples as Checks. §5.6 may retain the additional classification of *all* invariant curves, which C3.1 does not supply. A circle is smooth for every choice of its regularity label, so finite regularity does not distinguish this target from its supplier. The test `δ = π/3` still gives type `(1,3)` after transport.

2. **F02** (P1) The generating-function coordinate change is composed backwards

   **Location:** `packages/MathematicalBilliards/design/README.md:310`, §4.2: “`S` composed with `(x, y) ↦ (x, F₁(x, y))` is a generating function”.

   **Claim:** The displayed composition produces the two-endpoint generating function from the phase-space primitive.

   **Witness:** For `F(x,y)=(x+y,y)` and `S=y²/2`, that composition gives `h(x,X)=(x+X)²/2`. At `(x,X)=(1,2)`, its derivatives give `−∂₁h=−3`, `∂₂h=3`, whereas `y=Y=1`.

   **Repair:** Define `Q(x,y)=(x,F₁(x,y))`, specify its image as the domain of `h`, and write `h=S∘Q⁻¹`, equivalently `S=h∘Q`. Use the twist condition to obtain the inverse on that image. In the witness, `h=(X−x)²/2`, giving `−∂₁h=∂₂h=1` and `S(1,1)=h(1,2)=1/2`. Keep the existing sign convention; only the direction of composition changes.

3. **F03** (P2) The fibre-reflection API needs a domain for unbounded intervals

   **Location:** `packages/MathematicalBilliards/design/README.md:293` and `:298`; plan target 4.1. The carrier allows infinite endpoints, but the API uses “`(x, y) ↦ (x, a + b − y)`”.

   **Claim:** This is a conjugating self-homeomorphism for every admitted interval.

   **Witness:** On `J=(0,∞)`, `F(x,y)=(x+log y,y)` is a positive twist lift preserving both ends. The proposed `a+b−y` is not a real-valued self-map of `J`.

   **Repair:** Use `a+b−y` only for finite endpoints. State the general result for an explicitly chosen decreasing homeomorphism `r:J≃J`; conjugation by `(x,y)↦(x,r(y))` reverses the twist sign. For the witness choose `r(y)=1/y`; the conjugate is `(x−log y,y)`, with fibre derivative `−1/y<0`. This retains unbounded strips rather than narrowing the carrier.

4. **F04** (P2) Specify and reconcile the complex inner-product convention

   **Location:** `packages/MathematicalBilliards/design/README.md:795`, §12.1, and `:836`, §12.5. The expressions are “`⟨f ∘ F^t, g⟩ − ∫f ∫ḡ`” and “an atom at `ξ = 2πa`”.

   **Claim:** These formulas are to be used with the pinned Hilbert-space and Bochner interfaces, but no linear-first complex-inner-product convention or comparison is declared.

   **Witness:** `Mathlib/Analysis/InnerProductSpace/Basic.lean:107` conjugates the first scalar. On one point, `f=i,g=1` gives `⟨f,g⟩=−i`, while the displayed product of means is `i`; the asserted zero-correlation expression has absolute value `2`.

   **Repair:** Declare the native convention explicitly. In §12.1 use `⟨g,U_t f⟩−(∫f)·conj(∫g)`, or conjugate the product of means instead. In §12.5 use `⟨f,U_t f⟩` for the positive-exponential spectral transform. Then a unit eigenfunction of eigenvalue `a` has spectral measure `δ_(2πa)`, agreeing with the negative-exponential projection average. Tests: the one-point residual becomes `0`; on `AddCircle 1`, `f(x)=exp(2πix)`, at `t=1/4` the corrected correlation is `i`, whereas the original native-order correlation is `−i`. Alternatively a linear-first prose convention needs an explicit translation to the pinned API, with these same tests.

5. **F05** (P1) The continuous-time spectral projection is an unowned prerequisite

   **Location:** `packages/MathematicalBilliards/design/README.md:836`, §12.5; plan target 12.5: “mean ergodic theorem for the twisted group”. The only listed mean-ergodic supplier is `ContinuousLinearMap.tendsto_birkhoffAverage_orthogonalProjection`.

   **Claim:** The supplied theorem justifies convergence of `(1/T)∫₀ᵀ exp(−2πiat)U_t f dt` to the eigenprojection.

   **Witness:** `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89` concerns discrete iterates of one operator. For the circle mode `f=e₁`, `U₁f=f`, so its discrete averages equal `f`; continuous averages at positive integer `T` equal `0`.

   **Repair:** Own a named continuous-time mean-ergodic adapter before §12.5, with exact hypotheses: a strongly continuous unitary group on a complex Hilbert space, all vectors, and norm convergence to the projection onto vectors fixed by every real time. Include the twisted-group version and the identity between projection norm squared and spectral atomic mass. One route uses the closed span of `U_s v−v`: its time averages have norm at most `2|s|‖v‖/T`, and its orthogonal complement is the common fixed space. This needs no separability. The circle witness then gives projection `0` for the untwisted average and `f` after twisting by eigenvalue `1`. Add this target to both design files and §12.5's Needs. Consume native `Lp.compMeasurePreserving` and its composition/isometry laws for the pullback part; they need not be reconstructed.

6. **F06** (P2) The maximum proof omits wholly collapsed configurations

   **Location:** `packages/MathematicalBilliards/design/README.md:477`, §6.3: “some coinciding pair is adjacent to a nondegenerate chord, since the gaps sum to `pℓ`”.

   **Claim:** Every boundary configuration supplies the stated nondegenerate chord for the variation.

   **Witness:** Take `p=1,q=3`, `s₀=s₁=s₂=0`, `s₃=ℓ`. Gaps are `0,0,ℓ`, summing to `pℓ`, but all geometric chords have length `0`.

   **Repair:** First discard configurations with `W=0`, since every interior configuration has positive perimeter. In a remaining boundary configuration a maximal run of coincident vertices has a nondegenerate adjacent chord; state the allowed one-sided variation for both `0` and `ℓ` gaps. In the unit-circle witness the collapsed value `0` is strictly smaller than the interior equilateral value `3√3`, so the missing case is excluded without a nonexistent chord. Apply the same case distinction when explaining §6.4's boundary argument.

7. **F07** (P2) Corner escape must exclude trajectories stopped at the vertex

   **Location:** `packages/MathematicalBilliards/design/README.md:543`, §7.3; plan target 7.3: “a trajectory entering a corner … leaves it after at most `⌈π/α⌉` reflections”.

   **Claim:** Escape is asserted without a nonsingularity hypothesis on this second clause.

   **Witness:** In the unit square, start at `(ε,ε)` with velocity `−(1+i)/√2` inside a corner disc. It reaches the vertex after time `√2ε`, makes `0` reflections, and stops under the preceding definition; it never leaves.

   **Repair:** State the escape bound for a trajectory segment avoiding the vertex and not running along a side. Retain vertex-hitting trajectories in the singular-set theory. The radial witness is then correctly excluded; an avoiding line through the unfolded right-angle fan crosses at most `2=⌈π/(π/2)⌉` rays. Add the stopped radial trajectory as a negative-control Check.

8. **F08** (P2) Normalize the directional measure before using probability weak mixing

   **Location:** `packages/MathematicalBilliards/design/README.md:770` and `:846`, §§11.4 and 12.6; plan target 12.6. §12.6 uses “the measure of §11.4” in a predicate defined only for probability spaces.

   **Claim:** The restricted billiard action fits §12.1's probability-space weak-mixing definition with that measure.

   **Witness:** For the unit square, `Σ_g Leb_P⊗δ_(gθ)` has mass `4`, as does unfolded area. With `A=B` the whole space, the correlation residual is `|4−4²|=12`, independently of dynamics.

   **Repair:** Keep the unnormalized area identity of §11.4, and also state its normalized version. Use `ν_θ=(|G|area P)⁻¹Σ_g Leb_P⊗δ_(gθ)` and `area_(S_P)/area(S_P)` in §12.6. Say the comparison with an ordinary linear torus flow is on invariant conull subsets: marked regular vertices still generate fixed singular leaves under §10.4's convention. The whole-space residual becomes `|1−1|=0`, while a nonconstant torus character still disproves weak mixing for the intended dynamical reason.

9. **F09** (P3) The circle's vertical derivative is one, not zero

   **Location:** `packages/MathematicalBilliards/design/README.md:400`, §5.3; plan target 5.3 Check: “`∂_δF₂/∂_δF₁ = 0/(2R) = 0`”.

   **Witness:** `F(s,δ)=(s+2Rδ,δ)` has `∂_δF₂=1`; the inverse also has second component `δ` and derivative `1`.

   **Repair:** Replace the two ratios by `1/(2R)` and `−1/(2R)`, and their absolute maximum by `1/(2R)`. The graph's optimal Lipschitz constant remains `0`, so the theorem gives the valid, nonsharp bound `0≤1/(2R)`. For `R=1` this reads `0≤1/2`. This repairs both files without changing the theorem.

10. **F10** (P3) One pair of sets cannot certify the signed-average definition

   **Location:** `packages/MathematicalBilliards/design/README.md:801`, §12.1; plan target 12.1 Check: “a definition without the absolute value would accept this flow”.

   **Claim:** The horizontal flow on the two-torus passes the universally quantified signed-correlation condition.

   **Witness:** For `B=A={Im z mod 1∈[0,1/2)}`, the horizontal flow fixes `A`, and the signed residual is constantly `1/2−1/4=1/4`, not `0`.

   **Repair:** Keep the half-horizontal-coordinate computation, but say only that this *pair* has signed average `0` and absolute average `1/8`. For an actual ergodic/non-weak-mixing discriminator use the full real translation action on `AddCircle 1`: it is ergodic, while a half-circle has the same `1/8` absolute average and the character `e₁` is nonconstant. Or use the irrational-slope torus flow already mentioned in §12.2. Update the plan Check too.

11. **F11** (P3) Wiener's worked formula has a removable singularity at zero

   **Location:** `packages/MathematicalBilliards/design/README.md:832`, §12.4; plan target 12.4 Check: “`|σ̂(t)|² = (2 − 2cos t)/t²`”.

   **Witness:** For Lebesgue measure on `[0,1]`, `σ̂(0)=1`. The displayed ratio is undefined classically at `0`, and equals `0` under Lean's total real division.

   **Repair:** State this formula for `t≠0`, and state the value `1` at `0` separately, or use its continuous extension. The average limit is still `0`: changing a value at one point does not change the integral. At `t=π`, both sides equal `4/π²`; at `0`, the repaired value is `1`.

12. **F12** (P3) The singular-set Check does not witness nonclosedness

   **Location:** `packages/MathematicalBilliards/design/README.md:569`, §8.1: “`Σ` is not closed: states arbitrarily close to a singular one may avoid every vertex.”

   **Claim:** The stated approximation proves nonclosedness.

   **Witness:** Even the closed set `{0}⊂ℝ` has points outside it arbitrarily close to its member. The stated approximation addresses failure of openness, not closedness.

   **Repair:** Give a singular sequence with a regular limit. In the unfolded square fix `x=(1/2,1/4)` and let `v_n` point from `x` to `(n,n)`, `n≥1`. Each state hits a lattice vertex; `v_n→(1+i)/√2`. The limiting line has `y−x=−1/4`, so meets no lattice vertex and is regular. This supplies the required actual witness.

13. **F13** (P3) Infinite reflection groups still have invariant direction functions

   **Location:** `packages/MathematicalBilliards/design/README.md:641`, §9.3: “no invariant function of the direction alone exists there”.

   **Witness:** Constants are invariant. More strongly, the group generated by finitely many side reflections is countable, so the indicator of one orbit `G·θ` is Borel, pointwise nonconstant, and invariant, even when `G` is infinite.

   **Repair:** Delete the unsupported last clause; retain the valid statement that the finite-group theorem does not apply. If retaining a stronger assertion, say and prove that every *measurable* invariant direction function is *almost everywhere* constant for angular measure, using the dense irrational rotation subgroup. The orbit indicator then equals `0` almost everywhere, while taking both values `0,1` pointwise. No strengthening of the finite-group hypothesis is needed.

14. **F14** (P3) The excluded-stabilizer example reverses the quotient map

   **Location:** `packages/MathematicalBilliards/design/README.md:775`, §11.4; plan target 11.4 Check: “`Φ_θ` would be two-to-one onto its image”.

   **Witness:** For the square, `θ=1`, an interior `x`, and `g=id` or `g=conj`, both representations give direction `gθ=1`, but `[id,x]` and `[conj,x]` are distinct interior-copy points in `S_P`.

   **Repair:** Say that the proposed formula for `Φ_θ` is **not well defined** without the trivial-stabilizer hypothesis. The natural reverse projection `S_P→M_θ` is two-to-one over interior states in this example. The generic `θ=exp(iπ/6)` has a unique `g` and restores the stated map and bijection. Update both files.

15. **F15** (P3) Nine subsection dependency lists are missing

   **Location:** `packages/MathematicalBilliards/design/README.md:169`, `:293`, `:310`, `:451`, `:527`, `:609`, `:672`, `:734`, `:790` (§§2.1, 4.1, 4.2, 6.1, 7.2, 9.1, 10.2, 11.1, 12.1).

   **Claim:** The prose build supplies target-level Needs in the required form.

   **Witness:** §10.2 invokes the translation groupoid without a Needs line; its plan target explicitly lists `target:10.1`, `ChartedSpace`, `HasGroupoid`, and `StructureGroupoid.maximalAtlas`.

   **Repair:** Add each missing Needs line from its actual statement and route inputs, following the plan and the verified supplier contracts. In particular §2.1 needs §1.3; §4.2 needs §4.1; §6.1 needs §3.1; §7.2 needs §7.1; §9.1 needs §7.2; §11.1 needs §§9.1 and 7.1. State §4.1's elementary homeomorphism/quotient inputs and §12.1's measurable-action inputs explicitly. There are 89 internal plan edges and no missing internal IDs; these additions expose existing edges rather than change ownership or order. Re-run the direction gate afterward.

16. **F16** (P3) Bring claim locators into the prose and distinguish source settings from derived results

   **Location:** `packages/MathematicalBilliards/design/README.md:186`, `:573`, `:655`, `:688` (§§2.2, 8.2, 10.1, 10.3); additional examples include §§2.3, 4.2, 10.5 and 12.2.

   **Claim:** Every theorem/definition has its locator at the claim.

   **Witness:** §10.1 has no source locator; plan target 10.1 cites ChaikaForni2026 lines 168–176. Those lines describe charts obtained by integrating an Abelian differential; they do not state the groupoid construction.

   **Repair:** Add the available source/section locators from the plan at the corresponding claims. For new deductions, identify the cited source's precise input and label the intervening argument as this roadmap's construction, rather than imply the source states the stronger result. Examples: BialyMironov2022 §2, p.4 supplies the reflection coordinates; ChaikaForni2026 §2, p.5 supplies the translation-chart description; §1, p.3 supplies the area-preserving directional-flow setting. Use Herman's printed pp.41–46 for §5.2 and Hochman's printed pp.69–70 for §§12.4–12.5. Keep waived/uncertified works at their recorded locators; do not request or invent unavailable theorem/page numbers. The explicit proof routes can remain.

Reviewed the design, not a package implementation. There are 16 findings: 8 blocking (2 P1, 6 P2) and 8 P3. No previous review was supplied. The design is repairable without changing its mathematical scope. No design or source-manifest entry was edited.

## Verified sound

Read all 57 plan targets, their hypotheses, APIs and Checks, and all 12 README layers. The full scratch ledger has a computed row for each target; the table below includes the 15 seeded targets, the headline results and every finding's mathematical witness. All 18 definition/construction targets have API entries and at least three plan Checks (the problems with particular Checks are listed above). All 12 README layers end with Examples and Dependencies. All 89 internal plan prerequisite IDs resolve. There is no declared supplier gap.

The overall construction is general: it retains `C¹` tables, `C²` tables with zero curvature, polygonal holes, reflex and flat vertices, and general jointly measurable probability actions without a separability assumption. No route-specific prime restriction, computational algorithm, source-chapter plan, copied source passage, forbidden supplier, or circular cross-roadmap supply was found. The layer order is mathematical: collision geometry supplies twist/variational theory; polygon geometry supplies unfolding; spectral theory supplies weak mixing. The finite-regularity extensions and polygonal theory are new scope, so R01 is a local duplication repair, not grounds for rejecting the roadmap as a whole.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| §1.1 carrier; §1.2 curvature criterion (sample) | Circle antipodal cross product `2R>0`; clockwise `−2R<0`; stadium `0`; ellipse curvature at `(a,0)` is `a/b²>0`; double-turn example has curvature numerator `9+6cos u≥3`, but total turning `4π`, versus `2π` for a positive Jordan curve. | Orientation, strictness and injectivity discriminated. Superellipse curvature `0` remains allowed. |
| §1.4 lines; §1.5 smooth comparison | Unit-circle state `(0,π/2)` gives `(e,c)=(−1,0)`; reversed line `(1,0)`. Native real representation sends `exp(is)` to `(cos s,sin s)`, with tangency at `x=1` only at `(1,0)`. | Source/target and orientation correct. |
| §2.1 lift (sample) | Unit circle `F(0,π/3)=(2π/3,π/3)`; tangent at exit equals `exp(2πi/3)i`. Wrong `I∘F` has square `(s+2π,δ)`. | Reflection law passes; excludes involution convention. |
| §2.2 regularity (sample) | Circle `L/sinδ=2R`, `(κL−sinδ)/sinδ=1`; exit derivative of implicit equation `sinδ>0`, tending to `0` at grazing. | Interior nonvanishing established; boundary excluded. |
| §§2.3–2.4 extension/reversal | Boundary increments `0,ℓ`; `IFI(s,δ)=(s+ℓ−2Rδ,δ)=τℓF⁻¹(s,δ)`. Superellipse near an axis has increment asymptotic to `(4δ)^(1/3)`. | Topological boundary claim and deck translation correct. |
| §2.5 C3.1 comparison (sample); §2.6 | At `δ=π/3,R=1`, `ΨT=(s+2π/3,1/2)=βΨ`; derivative in `v` is `−4/√3`. Triangle perimeter `3√3`. | Comparison sound; import circular theorem, R01. |
| §§3.1–3.3 generating function/measure | Circle mixed derivative `sinδ/(2R)=sin²δ/L>0`. Ellipse exit `(6/5,4/5)` has `sinδ₁=5/√146`, `cosδ₁=11/√146`, determinant `√73/5`; product `sinδ₁ det=1/√2=sinδ`. Total mass `ℓ∫₀^π sinδ=2ℓ`. | Signs and invariant density correct; inverse Jacobian would be `5/√73`. |
| §4.1 twist carrier | Standard map derivative `[[1+a,1],[a,1]]` has determinant `1`; shear inverse twist `−1`. On `(0,∞)`, logarithmic shear has derivative `1/y>0`; reciprocal-fibre conjugation gives `−1/y`. | R03 supplies valid unbounded-domain conjugation. |
| §4.2 exactness | Shear `S=y²/2`; wrong composition at `(1,2)` gives `9/2`, correct one `1/2`; wrong derivative pair `−3,3`, correct pair `1,1`. Shifted shear has flux `c≠0`. | R02; nonexact area-preserving example is otherwise sound. |
| §4.3 billiard twist (sample) | At `δ=π/3,R=1`, fibre derivatives are `2`, `4/√3`, `−4/√3` in `δ,y,v`; primitive derivative `−1=(−1/2)·2`. | Correct positive/negative twist and primitive signs. |
| §§4.4–5.1 recurrence/curves | Translation on ℝ has no return for an interval of length `<1`; `y↦y²` fixes `0,1` and moves every interior height. Essential horizontal circle has degree `1`, two complementary components; small contractible circle has degree `0`. | Native recurrence and curve distinction respected. |
| §5.2 invariant regions (sample) | Shear on `0≤y<2`, region `0≤y<1`: frontier `y=1`. Whole ambient: frontier empty, relative compactness false. Rotation-invariant wavy curve has minimum horizontal derivative `1−0.8π<0`. | Fathi hypotheses exclude both controls. |
| §5.3 graph theorem (headline) | Circle derivative matrices `[[1,2R],[0,1]]` and `[[1,−2R],[0,1]]`; slope bound `1/(2R)` versus actual Lipschitz constant `0`. | Theorem survives; R09 corrects arithmetic. |
| §§5.4–5.6 rotation | `ρ(π/3)=1/3`, reversal `2/3`, deck-shifted value `−2/3`; rational diameter has `g²x=x+ℓ`. Wavy circular graph has height mismatch `ε(1−cos(2(c+ε)))≠0`. | Normalization and rational/irrational distinctions sound. |
| §6.1 configurations (sample) | Mean coordinate shifts by `pℓ/q` under `σ` and `ℓ` under `d`; relation `σ^q=d^p`; coprimality gives generated translation step `ℓ/q`. `(2,3)` circle configuration has perimeter `3√3`. | Cyclic free/proper action and circle deformation retract consistent. |
| §§6.2–6.4 periodic orbits (headline) | Equilateral critical cosines `1/2=1/2`; irregular `(0,π/2,π)` gives `0≠1/√2`. Collapsed `(1,3)` gaps `0,0,ℓ` have perimeter `0`, versus `3√3` inside. Ellipse major/minor axes have perimeters `8,4`. | R06 fixes proof gap; two-orbit statement survives. |
| §§7.1–7.2 tables/phase | Square angle sum `2π`; square-with-hole sum `8π=(8−2+2)π`. Reflections are `conj`, `−conj`; diagonal reflection sends `1` to `i`. Square quarter-position probability `1/4`. | Holes and reflection quotient retained. |
| §7.3 corner bound | Avoiding fan counts `2,2,1` for angles `π/2,2π/3,3π/2`. Radial right-corner hit stops after `0` reflections at time `√2ε`, without escape. | R07 adds necessary nonsingularity. |
| §8.1 singular set | From `(1/2,1/4)`, directions to `(n,n)` are singular and converge to slope `1`; limit line has offset `−1/4` and no lattice vertex. | R12 replaces invalid closedness witness. |
| §8.2 flow (sample/headline) | Square center, horizontal: at `t=1/2` right-side reflection class; at `t=1` center with velocity `−1`; at `t=2` original state. Singular extension displacement `0`. | Action and stated regular-subspace continuity are consistent. |
| §8.3 Liouville/reversal (sample/headline) | Free-flight Jacobian in position/angle is block triangular, determinant `1`; reflections have absolute determinant `1`; `JF¹J` of horizontal center state is center with velocity `−1`, equal to `F⁻¹`. | Measure and reversal formulas pass. |
| §§9.1–9.3 directions | Square group order `4`, equilateral `6`, `π/8` triangle `16`; square invariant `cos2φ` unchanged by `φ↦−φ,π−φ`, whereas `cosφ` sends `1→−1`. Infinite-group orbit indicator takes `0,1` but is `0` a.e. | Finite-group nonergodicity sound; R13 corrects infinite-group Check. |
| §10.1 translation groupoid (sample) | Translations have derivative `1`, dilation `2`, negative identity `−1`; conjugation has no complex derivative. Piecewise identity/translation on disjoint half-planes has disjoint images. | Correctly excludes dilation and half-translation charts. |
| §10.2 translation surfaces (sample) | Torus has `Σ=∅`; octagon angle `8·3π/4=6π=2π·3`; pillowcase angle `π` would require excluded `k=1/2`. At `k=1`, the cone coordinate is an ordinary translation coordinate. | Cone normalization sound. Use native connectedness, which includes nonemptiness. |
| §§10.3–10.4 area/flows (sample) | Side-one octagon area `2(1+√2)`; torus lattice `2ℤ+2iℤ` area `4`; an added atom has cone mass `c`, violating required `0`. Unmarked unit torus diagonal flow returns at `√2` since displacement `1+i`. | Null-set clause discriminates area; marking freezes the corresponding singular leaves. |
| §11.1 gluing; §11.2 charts (sample) | `π/8` triangle vertex counts `16/(2n_v)=4,1,1`. Right side of square: `x₀−(−conj x₀)=2`, independent of `Im x₀`; seam chart `2−conj x` agrees with `x` at `Re x=1`. Reflex vertex angle `4·3π/2=6π`. | Cosets, right multiplication, affine offset and cone angle pass. |
| §11.3 genus | Square `χ=4+4−8=0,g=1`; triangle `χ=16+6−24=−2,g=2`; hole table `χ=0+8−16=−8,g=5`; cone sum `4·(3−1)=8=2g−2`. | Both formulas agree, including holes. |
| §11.4 unfolding (headline) | Copy `g⁻¹` sends velocity `gθ` to `θ`; reflection changes copy to `g⁻¹σ`. At excluded `θ=1`, labels `id,conj` give same direction but two distinct interior-copy points. | Generic conjugacy passes; R14 corrects the nonexample. |
| §§12.1–12.2 weak mixing | One point: all set residuals `0`. Identity on two equiprobable points: residual `1/4`. Horizontal half-x torus: signed average `0`, absolute `1/8`; invariant half-y: signed residual `1/4`. Native one-point complex correlation: `−i−i=−2i`. | R04/R10; invariant-set proof `a−a²=0⇒a∈{0,1}` is sound. |
| §12.3 Koopman continuity | Circle mode has `U_t e_n=exp(2πint)e_n`, norm difference `\|exp(2πint)−1\|→0`; identity action difference `0`. | Joint measurability route does not require separability; use native pullbacks. |
| §12.4 Wiener (sample) | `δ₀`: average `1`, atomic sum `1`; half-sum of two atoms: `1/2+sinT/(2T)→1/2=1/4+1/4`; Lebesgue `[0,1]`: limit `0`, atomic sum `0`, but value at `t=0` is `1`. | The theorem and Fubini route pass; R11 fixes the pointwise Check. |
| §12.5 eigenfunctions (sample/headline) | Circle mode eigenvalue `1`: original native correlation at `t=1/4` is `−i`, claimed positive-frequency transform `i`. Discrete averages of `U₁` give `f`; continuous untwisted averages at integer `T` give `0`; twisted averages give `f`. | R04/R05 are required to connect the otherwise correct criterion to the suppliers. |
| §12.6 torus/rational applications | Raw square-direction measure has mass `4`, whole-space residual `12`; normalized mass `1`, residual `0`. Torus dual character with nonzero pairing has nonzero eigenvalue. | R08 removes artificial failure from wrong normalization. |

### Source sample and access status

All 12 cited works are recorded under their existing manifest keys. The six waived works and the one uncertified work remain settled; none was requested again. No new source was needed. There are no additional expressly flagged unverified locators in the design beyond these recorded access limitations. Source passages were read as data, and no source text was copied into this report.

| Seeded target | Source/locator actually inspected | What is and is not verified |
|---|---|---|
| 1.2 | BialyMironov2022 lines 96–98, §1.3 p.2, and lines 149–153, §2 p.4 | These give the positive-curvature setting, not the curvature criterion. The criterion's turning-theorem route resolves to RiemannianGeometry/Surfaces §3.1; Tabachnikov's chapter is waived. |
| 2.1 | BialyMironov2022 lines 154–161, §2 p.4 | Reflection map and `(cosδ,s)` coordinates verified in the source's positive-curvature setting. Its `C¹` extension is this design's work; Chernov–Markarian and Katok–Hasselblatt are waived. |
| 2.2 | Plan: KatokHasselblatt1995 §9.2; ChernovMarkarian2006 Ch.2 | Text unavailable under settled waivers. Derivative and implicit-function hypotheses independently checked, including the circle and flat-point boundary. |
| 2.5 | BialyMironov2022 lines 159–164; C3.1 on main, lines 527–555 | Coordinate meaning and exact supplier comparison verified. No source claims to compare these two planned APIs. |
| 4.3 | KatokHasselblatt1995 §9.2 | Waived. Signs and primitive verified directly from §§2–3 and the native supplier conventions. |
| 5.2 | Herman1983 lines 1150–1154, Appendix to Ch.I, printed p.41; proof lines 1159–1287, pp.42–46 | Orientation, vertical deviation, relative compactness, topology of `U`, invariance and nonwandering hypotheses all match. The homeomorphism type forces the ambient boundary to lie in `U`, as used at source line 1162. |
| 6.1 | KatokHasselblatt1995 §9.3 | Waived. Cyclic action, compact quotient and circle retract checked directly using the mean-coordinate shift and equal-gap deformation. |
| 8.2 | Plan: ChernovMarkarian2006 Ch.2; BoldrighiniKeaneMarchetti1978 §2 | Both waived. Identity extension and nonsingular quotient flow checked mathematically; source theorem/page cannot be certified. |
| 8.3 | Same two recorded locators | Both waived. Itinerary Jacobians, invariant measure and reversal were recomputed. |
| 10.1 | ChaikaForni2026 lines 168–176, §2 p.5 | Integrating the Abelian differential gives the charts. The derivative-one groupoid equivalence is a deduction, not a theorem stated there; R16. |
| 10.2 | ChaikaForni2026 lines 83–88, §1 p.3, and 168–176, §2 p.5 | Riemann-surface/differential setting checked. These lines alone do not state the full cone-chart normal form. MasurTabachnikov2002 §1 is uncertified, not silently verified. |
| 10.4 | ChaikaForni2026 lines 84–88, §1 p.3 | Directional flows and invariant normalized area are present. The fixed-singular-leaf representative, all-time construction and joint measurability are this roadmap's added construction. |
| 11.2 | MasurTabachnikov2002 §1 | Settled uncertified. Seam formulas and cone multiplicities independently computed, including a translated side and reflex vertex. |
| 12.4 | Hochman2012 Proposition 6.6.3, lines 3099–3140, printed p.70 | Discrete circle, atomless spectral computation verified. The real-line, all-atoms statement is correctly identified as a continuous-time extension; its bounded kernel has limit `1` at difference `0`, `0` otherwise. |
| 12.5 | Hochman2012 Theorem 6.4.7, lines 2854–2855, p.64; Lemma 6.6.2, lines 3076–3096, p.69; Corollary 6.6.4, lines 3141–3143, p.70; ChaikaForni2026 lines 95–100, p.3 | Hochman is discrete-time and explicitly assumes ergodicity in the eigenvalue-only formulation; this design's all-eigenfunctions formulation handles invariant functions too. Chaika–Forni states the directional eigenvalue result, not the general criterion. R04/R05 identify the missing convention/adapter. |

Also inspected Herman1983 Chapter I §§2.4.2–2.4.4, lines 277–319, printed pp.10–11, for rotation monotonicity and strictness under area preservation; §5.2, lines 803–807, printed p.28, for Lipschitz control; Hochman2012 Theorem 6.1.7, lines 2483–2487, p.57, and Proposition 6.2.1, lines 2627–2628, p.60, for the discrete mixing and product formulations. The continuous-time adaptations are not misrepresented here as directly certified source theorems.

### Pinned library declarations opened

The plan's pins agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Main is `5fc1aa8fb5158b49283293de7401899b6efc359b`. Declaration bodies/signatures, not just matching names, were read at those pins.

| Pinned file and line | Interface checked |
|---|---|
| `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean:129`, `:550`, `:638`, `:685`, `:694`, `:703`, `:706`, `:819` | `CircleDeg1Lift`, translation number, inverse, limit, monotonicity, upper/lower displacement bounds, rational iff. Native lift is monotone and degree one, with no continuity field; rational iff explicitly needs continuity and positive denominator. |
| `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean:69`, `:91`; `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean:421` | AddCircle total mass, measure-preserving quotient on `(t,t+T]`, and the `2π` homeomorphism. Changing to `[0,T)` uses the null endpoint difference. Positive period is required. |
| `Mathlib/MeasureTheory/Function/Jacobian.lean:1184`; `Mathlib/Dynamics/Ergodic/Conservative.lean:63`, `:196` | Injective measurable-domain Jacobian; finite measure implies conservativity; neighborhood recurrence has second-countability and measurable-open assumptions. |
| `Mathlib/Dynamics/Ergodic/Action/Basic.lean:43`; `Mathlib/MeasureTheory/Group/Defs.lean:59`; `Mathlib/MeasureTheory/Group/Arithmetic.lean:463` | Ergodic, invariant-measure and jointly measurable action classes; additive names are generated by `to_additive`, not missing declarations. |
| `Mathlib/Dynamics/Flow.lean:85`; `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:82`, `:91` | Native Flow requires joint continuity; implicit function regularity requires nonzero differentiability order and invertible partial derivative. |
| `Mathlib/Analysis/Convex/Strict.lean:37`; `Mathlib/Analysis/Convex/Hull.lean:48` | StrictConvex uses interior of ambient open segments; it does not impose positive curvature. Convex hull is not itself a closure operator for topological closure; the design explicitly takes the closed convex hull. |
| `Mathlib/Geometry/Manifold/StructureGroupoid.lean:90`, `:275`, `:293`; `Mathlib/Geometry/Manifold/ChartedSpace.lean:141`; `Mathlib/Geometry/Manifold/HasGroupoid.lean:34`, `:93`; `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:673` | Groupoid, pregroupoid and chart machinery. ChartedSpace alone does not supply Hausdorffness, compactness or nonemptiness; §10.2 adds the required ambient conditions. Native `ConnectedSpace` includes nonemptiness (`Mathlib/Topology/Connected/Basic.lean:705`). |
| `Mathlib/Topology/Homotopy/Contractible.lean:29`; `Mathlib/Geometry/Polygon/Basic.lean:29`, `:62`, `:72`; `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:31` | Nullhomotopy; cyclic polygon, edge sets and boundary; dihedral carrier. Simplicity is supplied separately. |
| `Mathlib/Analysis/InnerProductSpace/PiL2.lean:853`, `:860`; `Mathlib/Analysis/InnerProductSpace/Basic.lean:107` | Real basis `(1,i)` and its exact representation; complex inner product conjugates its first input, giving R04. |
| `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89`; `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:606`, `:611`, `:615`, `:631` | Discrete mean ergodic theorem; existing pullback, a.e. representative, norm, isometry and composition APIs. No continuous-time projection theorem is asserted by the first declaration. |
| `TauCeti/Geometry/Polygon/Simple.lean:109`, `:483`, `:614`, `:767` | Simple polygon, boundary parametrization, Jordan boundary and bundled nonzero-size carrier. Collinear consecutive edges are allowed. |
| `TauCeti/Topology/JordanCurve/Basic.lean:107`, `:282`; `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean:190`; `TauCeti/Analysis/Complex/PlaneSeparation/JordanCurve.lean:175` | Jordan carrier, bounded convex-set frontier, exactly two complementary components, frontier equality. The convex-frontier theorem requires nonempty interior. |
| `TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean:122`; `TauCeti/Analysis/Complex/Conformal/PrimeEnd/Crosscut/TwoSides.lean:137` | Plane Schoenflies and crosscut separation. The crosscut theorem explicitly requires an open simply connected domain. |
| `TauCeti/Analysis/Bochner/CharFun/Bochner.lean:101`; `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`; `TauCeti/Analysis/Semigroups/Group/Unitary.lean:107` | Positive-exponential Bochner formula; real-linear C₀-group carrier and complex-inner-product-preserving unitary predicate. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`; `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/MayerVietoris.lean:93` | Euler characteristic and open-union additivity, requiring finite CW type for the pieces, intersection and union. The intended polygonal/collar models supply those hypotheses. |

### Ownership, supplier drift and order

Read the board package index before making absence judgments. It lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; none supplies a named prerequisite here. Used `roadmaps grep` at the indexed open heads and main for billiards, twist maps, invariant curves, translation surfaces/groupoids, weak mixing, Wiener/spectral measures and Koopman/joint-measurability objects. Pinned source searches by these objects found no existing billiard/twist/translation-surface or weak-mixing carrier. Wiener–Ikehara and Paley–Wiener hits concern different theorems. Ordinary measure-preserving pullbacks already exist, as listed above.

All explicit roadmap contracts resolve on main:

- `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:527`–`:596`, C3.1: smooth collision map, tangential coordinate, exactness, circle and recurrence. The circle overlap is R01; the other finite-regularity statements have an explicit comparison and different hypotheses.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:426`, I5.0: `y=−∂₁S`, `Y=∂₂S`; `:650` and `:678`, I5.4: compact-pair Čech continuity and the general compact-metric Lyapunov cup-length bound. The cited compact-flow theorem really is present, not merely a result for its particular annulus construction.
- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:471`, §3.1: piecewise `C²` turning theorem, including no-corner case and reversed orientation.
- `TauCetiRoadmap/GeometricTopology/README.md:1049`, §1.7: smooth surface classification and genus; `:1386`, §2.3: annulus theorem, including dimension two.

The closest open heads were inspected: PlanarTopology #271 (`TauCetiRoadmap/PlanarTopology/README.md:29`, topology summits); TeichmullerGeometry #1169 (`TauCetiRoadmap/TeichmullerGeometry/README.md:6`, ownership); RiemannianGeometry and DifferentialGeometry #1187 (respective README ownership and turning/flow sections); Equidistribution #2112 (`TauCetiRoadmap/Equidistribution/README.md:34`, ownership). These concern topology, marked hyperbolic/complex moduli, smooth differential calculus, and discrete equidistribution, respectively. They do not own this general translation-surface/finite-regularity billiard theory. The generic topology is imported rather than replanned.

An additional object hit was UnboundedOperators #1027: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:13` limits ownership to Nelson's specific surface; `:415` and `:429` construct that surface and its operator example. This does not duplicate a general translation-surface carrier or the polygon-unfolding construction here. Continuous-action Koopman hits in the open number-theory roadmaps require a continuous action on a topological space; §12.3 instead addresses merely jointly measurable real actions. `Completed/Exchangeability/README.md:573` and the pinned pullbacks supply discrete/map-level Koopman infrastructure, not the missing real-time theorem of R05.

The overlap report records no conflicting head changing MathematicalBilliards, no cited dropped IDs and no IDs defined only by open revisions. The named main contracts were resolved independently rather than replaced with open-revision numbering. No forbidden roadmap was used as a supplier. No unconditional assertion is made about unrelated board-package content at heads that were not provided as local files; those three packages were screened by the index, not exhaustively read.

Dependency command output:

```text
candidate: MathematicalBilliards is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. The stage-appropriate provisional insertion is not a finding.

### Headline and acceptance-file audit

The summary's explicit end theorems are: Birkhoff's graph theorem; two disjoint Birkhoff periodic orbits of each coprime `0<p<q`; polygonal-flow measure preservation and reversibility; rational-polygon unfolding; the weak-mixing eigenfunction criterion. Other deep milestones named there are finite-regularity collision-map smoothness, boundary extension and exactness, the invariant-region theorem, and the cone/genus theorem.

This is a design-only directory: no `Suggested.lean` is supplied. Consequently there is no existing Lean declaration to run a one-tactic probe on, no actual section-variable type to compare, and no actual import/sorry/set_option defect to report. The 23 names promised at README line 91 are proposed declarations, not evidence of a compiled acceptance file. The citation scanner's own-name warnings are not treated as missing pinned suppliers; its two alleged roadmaps BoldrighiniKeaneMarchetti1978 and MasurTabachnikov2002 are bibliography keys, not roadmaps.

At package stage, the graph theorem is statable using native homeomorphisms, simple curve/twist predicates and Lipschitz continuity; weak mixing and its eigenfunction criterion are statable using native measurable actions, functions and integrals with simple predicates. The curvature criterion is similarly statable using native differentiability, periodicity and strict inequalities. The variational two-orbit statement has native curve/finite-configuration carriers and should be assessed in that form rather than replaced by two arbitrarily marked points of one orbit. Actual polygonal trajectory construction, the complete flow and unfolding surface are substantial constructions: if they cannot be expressed with only a few simple real-bodied definitions, name those missing carriers in the module docstring rather than adding sorry'd data or stand-ins. The intended list at line 91 must be reconciled with the eventual file, whose only admitted declarations are genuine headline theorems. R01's circle computations and the diagnostic Checks belong in the README, not as acceptance-file padding.

## Not verifiable

- Lean elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. Passing elaboration, `#check @name` outputs and “sorry is the only warning” cannot be claimed. The all-theorem one-tactic probe is inapplicable because there is no `Suggested.lean` to probe.
- Exact textual support in BoldrighiniKeaneMarchetti1978, KerckhoffMasurSmillie1986, ChernovMarkarian2006, KatokHasselblatt1995, Tabachnikov2005 and ZemlyakovKatok1975: the manifest marks each waived. Their recorded locators were preserved, and none was requested again.
- MasurTabachnikov2002 §1: the manifest marks it uncertified/paywalled. Its normal-form, unfolding and genus text was not read; the report's computations are independent mathematical checks, not source certification.
- ChaikaForni2026 is an OCR extraction. The prose at the cited lines and the theorem identities are readable; damaged displayed notation is not relied on for a convention or a source erratum. Its brief description of directional flows does not by itself verify the more detailed measurable representative construction.
- The five available source entries were not treated as equally relevant: Birkhoff1927 is background-only in this design, with no sampled target or proof input depending on a particular theorem there. It was not used to certify the variational proof.
- No actual acceptance-file padding, undeclared-own-name, binder-loss or import audit can be completed until the package file exists. These are recorded limitations of this stage, not invented missing-file findings.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9cf56fd0a135d990238bc674000d3d923a145e12", "job": "REV-DESIGN-MathematicalBilliards", "model": "gpt-6-astra", "worker": "chris-6"} -->
