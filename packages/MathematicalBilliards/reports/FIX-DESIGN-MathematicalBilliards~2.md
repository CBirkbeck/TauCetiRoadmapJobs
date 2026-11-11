# MathematicalBilliards design repair

Settles all sixteen findings of REV-DESIGN-MathematicalBilliards. Changes are confined to the design README, plan, source manifest and this requested report. No commit was made.

## REV-DESIGN-MathematicalBilliards/F01 (P2) — applied

Independent circular target §2.6 → C3.1 import through §2.5. Its numerical Checks now accompany that comparison; §5.6 consumes §2.5 and retains classification of all invariant curves. Scope, supplier contract, plan prerequisites and source usage agree. C3.1 on main, “Convex planar billiards,” states both imported results; `v=1/2` gives increment `2Rπ/3`.

## REV-DESIGN-MathematicalBilliards/F02 (P1) — applied

Reversed composition → `Q:ℝ×J→D`, its explicit open image, and `h=S∘Q⁻¹`, equivalently `S=h∘Q`. The differential twist supplies the inverse. README and plan use endpoint derivatives at `Q(x,y)`. The shear gives `h=(X−x)²/2`, derivatives `−∂₁h=∂₂h=1` at `(1,2)`, and primitive value `1/2`.

## REV-DESIGN-MathematicalBilliards/F03 (P2) — applied

Unrestricted endpoint reflection → conjugation by a chosen decreasing self-homeomorphism of `J`; the affine expression requires finite endpoints, and differentiable twists require a `C¹` diffeomorphism. Both design files include the half-line test: reciprocal reflection sends the logarithmic shear to `(x−log y,y)`, with derivative `−1/y<0`. Unbounded strips remain included.

## REV-DESIGN-MathematicalBilliards/F04 (P2) — applied

Unspecified inner-product order → native conjugate-linear-first convention in Conventions, supplier contracts, §§12.1, 12.4.1 and 12.5, and the plan. Correlation now uses `⟨g,U_t f⟩`; spectral correlation uses `⟨f,U_t f⟩`. One point gives `i−i=0`; the circle mode gives `i` at quarter time and spectral atom at `2π`.

## REV-DESIGN-MathematicalBilliards/F05 (P1) — applied

Discrete mean-ergodic citation → owned §12.4.1, the continuous-time mean ergodic projection theorem, with completeness, unitarity, strong continuity, all vectors, twists, atomic mass and three Checks. §12.5 consumes it. §12.3 imports native pullbacks and their laws. Mathlib’s cited discrete theorem averages iterates of one operator; it cannot replace common-real-time projection.

## REV-DESIGN-MathematicalBilliards/F06 (P2) — applied

Gap-sum argument → separate zero-perimeter configurations from positive-perimeter boundary runs in §§6.3–6.4 and both plan targets. Zero and full-period gaps receive opposite permitted variations. The minimax construction also treats fully collapsed limits by equal-gap interpolation, of derivative `2p(q−p)ℓ/q>0`. Added Checks distinguish collapsed `W=0` from equilateral `W=3√3`.

## REV-DESIGN-MathematicalBilliards/F07 (P2) — applied

Unconditional corner escape → a segment avoiding the vertex and not running along a side, in the README and plan. Added the stopped radial negative control: time `√2ε`, zero reflections, no escape. The right-angle Check now concerns an avoiding line crossing at most two fan rays; vertex hits remain in §8.1.

## REV-DESIGN-MathematicalBilliards/F08 (P2) — applied

Raw directional area in the probability predicate → explicit normalized unfolding measures in §11.4 and their use in §12.6. The raw area identity remains. Torus comparisons, including the equilateral Check in both files, specify invariant conull subsets because marked regular leaves are fixed. Square mass `4→1` changes whole-space residual `12→0`.

## REV-DESIGN-MathematicalBilliards/F09 (P3) — applied

Both zero vertical derivatives → derivatives `1`, ratios `1/(2R)` and `−1/(2R)`, absolute bound `1/(2R)`, in README and plan. The actual graph constant remains zero. At unit radius the theorem gives the valid nonsharp inequality `0≤1/2`.

## REV-DESIGN-MathematicalBilliards/F10 (P3) — applied

One pair asserted to certify every signed correlation → a pair-specific computation in §12.1 and its plan Check. The invariant half-y torus set instead has signed residual `1/4`. Full real translation on the circle supplies an ergodic example satisfying signed limits but having half-circle absolute average `1/8` and a nonconstant eigenfunction.

## REV-DESIGN-MathematicalBilliards/F11 (P3) — applied

Unqualified Fourier quotient → formula only for `t≠0`, with value `1` separately at zero and `4/π²` at `π`, in README and plan. A single point does not affect the average integral. This also tests the incorrect zero obtained from total division at the removable singularity.

## REV-DESIGN-MathematicalBilliards/F12 (P3) — applied

Regular points approaching a singular point → singular points approaching a regular point. Both files use directions from `(1/2,1/4)` to unfolded lattice vertices `(n,n)`. Their limit is `(1+i)/√2`, whose line has `y−x=−1/4` and meets no lattice vertex. This proves actual nonclosedness in the square example.

## REV-DESIGN-MathematicalBilliards/F13 (P3) — applied

“No invariant direction function” → finite-group theorem inapplicable, with constants and a countable-orbit indicator as counterexamples. The README and plan distinguish pointwise nonconstancy from almost-everywhere constancy: the indicator has values `1` and `0` but is zero angular-almost-everywhere. No stronger dense-rotation theorem is added.

## REV-DESIGN-MathematicalBilliards/F14 (P3) — applied

“Φ is two-to-one” → “Φ is not well defined,” in both files. At an interior square point, labels `id` and `conj` represent the same direction and different surface points. The reverse projection is two-to-one there. The generic direction `exp(iπ/6)` has a unique label and recovers the bijection.

## REV-DESIGN-MathematicalBilliards/F15 (P3) — applied

Missing subsection inputs → explicit Needs in §§2.1, 4.1, 4.2, 6.1, 7.2, 9.1, 10.2, 11.1 and 12.1. Homeomorphism/quotient and measurable-action inputs are named. §4.1’s plan adds its native prerequisites; the other existing internal edges remain. Every numbered README subsection now has Needs. The dependency gate reports zero problems.

## REV-DESIGN-MathematicalBilliards/F16 (P3) — applied

Implicit locators/source generality → claim-level locators and explicit identification of deductions constructed here. Updated §§1.5, 2.1–2.3, 2.5, 3.3, 4.2, 5.2, 5.6, 6.2, 8.2, 10.1–10.5, 12.2 and 12.4–12.6, with matching plan locators. Herman’s printed pages and Hochman’s discrete setting are explicit. Settled source-access statuses remain unchanged.

## Verification and dependency outcome

The prescribed dependency command exited successfully, with the following exact output:

```text
candidate: MathematicalBilliards is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. There were no additional gate failures in the brief. JSON and TOML parse; all 57 target IDs are distinct; all 91 internal prerequisite edges resolve. The 18 definition/construction targets retain APIs and at least three plan Checks. All numbered README subsections have Needs; all twelve layers retain Examples and Dependencies. `git diff --check` passes.

There is no `Suggested.lean` in this design deliverable, and that file is outside the editable scope. No Lean command was authorized for this lane or run. Accordingly declaration elaboration, `#check @name` binder comparison, one-tactic probes, import validation and proof warnings cannot be claimed. No acceptance-file declarations were added or padded. The README’s existing prospective Lean-name list remains a package-stage obligation, not evidence of elaboration.

The citation resolver was run again. Its five alleged missing roadmaps are bibliography keys BialyMironov2022, KatokHasselblatt1995, BoldrighiniKeaneMarchetti1978, MasurTabachnikov2002 and ChaikaForni2026, all present in the manifest. Its native-name check was skipped by that tool because it did not locate Lake packages from the board. Native inputs were instead inspected in the actual pinned content checkout; no inference of their absence was drawn from the scanner.

## Mathematical verification ledger

These are computations and short mathematical checks, not claims of formal proofs. The rows cover each retained plan target, the imported circle result and every standing convention. Only the indicated repair loci were changed. Constraints such as positive period, interior angle, nonzero chord and `T>0` exclude their zero-denominator boundary cases; the new projection theorem includes the zero Hilbert space and every vector. Ring, prime and ramification tests do not apply to these real/complex geometric statements.

| Statement | Instances and computed values | Result and change |
|---|---|---|
| Plane convention | `1×i=1`, `i×1=−1`; real inner product of `1,i` is `0`. | Left orientation fixed; unchanged. |
| Table convention | Circle antipodal tangent/chord cross product `2R`; clockwise `−2R`. | Positive orientation discriminated; unchanged. |
| Phase convention | At unit-circle `s=0`, tangent `i`; `exp(iπ/2)i=−1`. | Inward radial direction; unchanged. |
| Lift convention | At `(0,π/3)`, exit `2πR/3`, chord `√3 R`; at grazing endpoints increments `0,2πR`. | Normalized lift retained. |
| Cylinder convention | Circle derivatives in `δ,y,v` are `2R,2R/sinδ,−2R/sinδ`. | Positive versus negative twists retained. |
| Measure convention | `∫₀^π sinδ dδ=2`, `∫₀^(π/2) sinδ dδ=1`; cylinder masses `2ℓ,ℓ`. | Raw collision measure consistent. |
| Generating convention | Circle `L=2Rsinδ`; endpoint derivatives `−cosδ,cosδ`; `h=−L` gives momenta `y=Y=−cosδ`. | Endpoint/primitive distinction repaired in §4.2. |
| Rotation convention | `q` circle steps shift `2Rqδ`; for `δ=π/3`, displacement divided by `qℓ` is `1/3`. | Period normalization retained. |
| Orbit-type convention | Three increments `2πR/3` total `2πR=ℓ`; backward triangle total `2ℓ`. | Types `(1,3)` and `(2,3)` agree. |
| Polygon convention | Horizontal reflection sends `(1+i)/√2` to `(1−i)/√2`; angular mass `2π` gives Liouville mass `1`. | Sign and probability retained. |
| Identity-extension convention | Square center/right state at time `1` returns to center pointing left, time `2` pointing right; a singular radial state stays fixed. | Honest action with fixed singular states retained. |
| Cone convention | Four `3π/2` sectors give `6π=2π·3`; four `π/2` sectors give `2π=2π·1`. | Marked regular points retained. |
| Complex convention | One point: corrected residual `i−i=0`, old order `−i−i=−2i`; circle quarter-time spectral coefficient `i`. | Native order and frequency sign repaired throughout Layer 12. |
| Weak-mixing convention | Half-x overlap on a period is `abs(1/2−t)`; its centered signed integral is `0`, absolute integral `1/8`. | Pair-level witness retained; universal claim corrected. |
| §1.1 carrier and API | Circle cross product `2R>0`; stadium tangent segment gives `0`; superellipse curvature at axes `0`; circle–ellipse join has curvatures `1,4`. | Strictness, regularity and orientation distinguished. |
| §1.2 curvature criterion | Ellipse axes `a/b²>0`; double-turn curve has curvature numerator `9+6cos u≥3` but turning `4π` rather than Jordan turning `2π`. | Injectivity and positivity essential to the route. |
| §1.3 exit | Circle exits at `π` and `2π/3` for `δ=π/2,π/3`; major-axis ellipse exit is `(−2,0)`. | Unique exit and monotonicity agree. |
| §1.4 oriented lines | Unit-circle radial state maps to `(e,c)=(−1,0)`; reversal to `(1,0)`; tangent state gives boundary-only intersection. | Orientation and open domain agree. |
| §1.5 C3.1 adapter | `exp(is)` maps to `(cos s,sin s)`; tangent `x=1` intersects only at `(1,0)`; stadium tangent has infinitely many intersections. | Comparison hypotheses agree; setting locator added. |
| §2.1 reflection map | Circle sends `(0,π/3)` to `(2πR/3,π/3)`; wrong reflected-angle map has square `(s+ℓ,δ)`. | Collision map differs from the involution; Needs/source setting added. |
| §2.2 derivatives | Circle gives `(∂δs₁,∂ss₁)=(2R,1)`; exit-equation derivative `sinδ₁>0`, with grazing limit `0`. | Interior regularity valid; locator added. |
| §2.3 extension | Circle boundary values `(s,0)` and `(s+ℓ,π)`; superellipse increment behaves as `(4δ)^(1/3)`, derivative unbounded at zero. | Topological boundary statement retained; locator added. |
| §2.4 reversal | `IFI(s,δ)=(s+ℓ−2Rδ,δ)`; `F⁻¹(s,δ)=(s−2Rδ,δ)`. | Deck translation exactly `ℓ`. |
| §2.5 comparison, including imported circle result | At `v=1/2`, C3.1 increment `2R arccos(1/2)=2Rπ/3`; three steps give `ℓ`; irrational `δ/π=√2/2` never gives integral winding; equilateral perimeter `3√3 R`. | Former §2.6 ownership removed; all computations transported. |
| §3.1 chord derivatives | Circle mixed derivative `sinδ/(2R)=sin²δ/L`; diagonal length has one-sided slopes `−1,+1`. | Nonzero chord denominator and diagonal distinction retained. |
| §3.2 exactness/Jacobian | Circle determinant `1`; off-axis ellipse exit `(6/5,4/5)`, `sinδ₁=5/√146`, determinant `√73/5`, inverse ratio `5/√73`. | Correct Jacobian and primitive sign retained. |
| §3.3 measure definition | Full mass `2ℓ`, lower-half-angle mass `ℓ`; cosine coordinate has absolute Jacobian `sinδ`. | Image measure and source setting agree. |
| §3.3.1 preservation | Off-axis ellipse: `(5/√146)(√73/5)=1/√2=sin(π/4)`. | Weighted measure invariant; unweighted area fails. |
| §4.1 twist carrier/API | Shear fibre derivative `1`, inverse `−1`, rotation `0`; standard-map determinant `1`; half-line reciprocal conjugate derivative `−1/y`. | General reflection and new Needs repaired; unbounded ends preserved. |
| §4.2 exactness/generator | Shear at `(x,X)=(1,2)`: correct endpoint derivatives `−1,1`, momenta `1,1`, primitive `1/2`; wrong generator gives derivatives `3,3`. Shifted shear flux on one period is `c≠0`. | Inverse coordinate change repaired; exact/nonexact examples distinguish flux. |
| §4.3 billiard twist | Circle `S=−2Rsinδ`, `∂δS=−2Rcosδ=g(F)∂δF₁`; deck-shifted boundary increments `−ℓ,0`. | Agrees with repaired `S=h∘Q`. |
| §4.4 nonwandering set | Translation by `1` on the line has no return for intervals of width `<1`; `y↦y²` fixes `0,1` and strictly lowers `0<y<1`. | Empty versus boundary-only cases distinguish definition. |
| §4.4.1 recurrence consequence | Irrational circle rotation has all points nonwandering; two fixed atoms have masses `1/2,1/2`, total `1`, but zero mass on wandering intervals. | Full support matters; C3.1 contract resolves. |
| §5.1 invariant curve | Circle level has projection degree `1`; contractible small circle degree `0`; two distinct levels have two connected components. | Essential embedded-circle condition discriminates. |
| §5.1.1 complement | Level `c` has two components `y<c,y>c`, both frontier `y=c`; small contractible loop bounds a disc containing neither annular end. | Two-end separation retained. |
| §5.2 invariant region | Shear and `U=[0,1)` give frontier height `1`; whole half-open annulus gives empty frontier; wavy curve has derivative `1−0.8π<0` at the indicated points. | Relative compactness and vertical deviation discriminated; printed locator added. |
| §5.3 graph theorem | Circle second-coordinate derivatives both `1`; ratios `±1/(2R)`; optimal Lipschitz constant `0`; at `R=1`, bound `0≤1/2`. | False zero numerator repaired in both files. |
| §5.3.1 billiard graph theorem | Level `δ=π/3` becomes `v=1/2`; both graphs have Lipschitz constant `0`; fibre Jacobian magnitude `sin(π/3)=√3/2`. | Coordinate change preserves graph and Lipschitz conclusions on compact interior curves. |
| §5.4 rotation definition | Levels `π/3,2π/3` give `1/3,2/3`; changing lift by `−ℓ` gives `−2/3,−1/3`. | Chosen lift, not just annulus map, fixes the real rotation number. |
| §5.4.1 rotation properties | Reversal sends `1/3` to `2/3=1−1/3`; displacement bounds `εℓ,(1−ε)ℓ` give `ε≤ρ≤1−ε`. | Limit, sign and order retained. |
| §5.5 rational rotation | Diameter rotation `1/2` has two steps per period; irrational `√2/2` has none; two fixed-point atoms give invariant mass `1` but support only two points. | Both rational implications and full-support qualification retained. |
| §5.6 all circle invariant curves | Wavy graph point has original height `c+ε`, image-graph height `c+εcos(2(c+ε))`; since `0<c+ε<π`, cosine is not `1`. Half-rotation-range measure `ℓ`. | Stronger classification remains owned here; prerequisite redirected. |
| §6.1 configuration/perimeter | `(1,2)` gives `W=2L`; `(2,3)` equal gaps `4π/3` give `3√3`; excluded `p=q` forces every gap `ℓ`, perimeter `0`. | Compact closure and open configuration distinguished; Needs added. |
| §6.2 chain dictionary | Equilateral cosines `1/2,1/2`; noncritical `(0,π/2,π)` at zero gives `0,1/√2`; a smaller least period would require `p/q=j/m`. | Critical/reflection equivalence and coprimality agree; locator added. |
| §6.3 maximum | Collapsed gaps `(0,0,ℓ)` give `W=0`; equilateral `3√3`, square `4√2`, doubled diameter `8`. Run-end variation rates `1±cosδ`; at `δ=π/3`, rates `1/2,3/2`. | Zero perimeter excluded separately; both boundary-gap signs repaired. |
| §6.4 minimax field/two orbits | At collapsed `(1,3)` or `(2,3)`, interpolation derivative `4ℓ/3`; at `(1,2)`, derivative `ℓ`. For unit circle these are `8π/3,2π`. Ellipse orbit perimeters `8,4`. | Fully collapsed inward field repaired, without changing orbit theorem. |
| §7.1 polygon carrier | Square angle sum `2π`; square with square hole sum `4·π/2+4·3π/2=8π=(8−2+2)π`; touching squares have nondisjoint boundaries. | Holes, flat vertices and excluded pinches retained. |
| §7.2 phase quotient | Horizontal/vertical reflections send diagonal direction to angles `−π/4,3π/4`; diagonal-side reflection sends `1` to `i`; square half-size position square has mass `1/4`. | Quotient and probability examples agree; Needs added. |
| §7.3 corner bound | Angles `π/2,2π/3,3π/2` give ceilings `2,2,1`; radial square state stops at `√2ε` with `0` reflections and no exit. | Nonsingularity added to escape; stopped case retained in singular theory. |
| §8.1 singular set | At `x=(1/2,1/4)`, directions to `(n,n)` are singular; their slopes are `(n−1/4)/(n−1/2)→1`; limit line has offset `−1/4`, versus integral offsets at lattice vertices. | Actual singular sequence with regular limit replaces invalid closure argument. |
| §8.2 flow | Square center/right: time `1` center/left, time `2` center/right; singular state at every time equals initial state. | Group law and extension consistent; construction attribution added. |
| §8.3 preservation/reversibility | Free-flight determinant `1`; reflection angular Jacobian absolute value `1`; `JF¹J` and `F⁻¹` send center/right to center/left. | Product measure and reversal retained. |
| §9.1 reflection group | Square has order `4`, triangle order `6`; in triangle, rotation/reflection compositions on `1` give `exp(±2πi/3)`, different values. Irrational-angle rotation has infinite order. | Nonabelian dihedral case tested; Needs added. |
| §9.2 rational criterion | `lcm(2,8,8)=8`, group order `16`; L-table denominators `2`, order `4`; irrationally rotated square hole gives rotation angle `2θ∉2πℚ`. | Hole counterexample correctly excludes interior-angle-only criterion. |
| §9.3 invariant directions | Square invariant `cos2φ` takes `1,−1`; wrong `Re v` changes from `1` to `−1` under vertical reflection. Infinite countable orbit indicator takes `1,0` but angular integral `0`. | Unsupported nonexistence clause repaired. |
| §10.1 translation groupoid | Derivatives of `z+3i,2z,−z` are `1,2,−1`; conjugation has no complex derivative on an open disc. Disconnected translation increments `0,1` are permitted. | Derivative-one object distinguished; source charts separated from construction. |
| §10.2 surface/cones | Unmarked torus `Σ=∅`, marked torus `k=1`; octagon corners sum `8·3π/4=6π`, `k=3`; pillowcase angle `π` gives excluded `k=1/2`. | Integrality/nonemptiness and charts agree; Needs/attribution repaired. |
| §10.3 flat area | Side-two torus area `4`; side-one octagon area `2(1+√2)`; adding an atom of mass `c>0` gives cone mass `c` rather than required `0`. | Uniqueness includes the no-atom law; setting locator added. |
| §10.4 directional flows | Unmarked unit torus: time `√2` in diagonal unit direction gives displacement `1+i≡0`; marked singular leaf instead is fixed, displacement `0`. | Distinction needed by normalized conull comparison; attribution repaired. |
| §10.5 flat tori | Lattice `2ℤ+2iℤ` has covolume `4`; unit horizontal lattice displacement at time `1` is `1≡0`; marking adds one `k=1` point without changing area or genus. | Structural torus comparison retained; flow comparison with marks is conull in §12.6. |
| §11.1 gluing | Square vertex classes per vertex `4/(2·2)=1`; π/8 triangle classes `16/4,16/16,16/16=4,1,1`. | Finite quotient counts agree; Needs added. |
| §11.2 charts/cone angles | Square right seam offset `x₀−(−conj x₀)=2`; chart `2−conj x` equals `x` at `Re x=1`. Four reflex sectors give `6π`. | Affine offset and right multiplication verified. |
| §11.3 genus | Square `χ=4+4−8=0,g=1`; π/8 triangle `χ=16+6−24=−2,g=2`; hole table `χ=0+8−16=−8,g=5`, cone excess `8=2g−2`. | Both Euler and cone formulas agree, including holes. |
| §11.4 unfolding | Copy `g⁻¹` sends velocity `gθ` to `θ`; square θ=1 has two copy representatives; generic θ=π/6 has one. Raw mass `4`, normalized mass `1`; π/8 triangle area `8(√2−1)`. | Map-direction error and normalization repaired. |
| §12.1 weak mixing/eigenfunctions/API | Two-point identity residual `1/4`; one-point residual `0`; half-x signed average `0`, absolute `1/8`; invariant half-y residual `1/4`. Circle character eigenvalue `1`, quarter-time factor `i`. | Correlation order and signed-condition discriminator repaired. |
| §12.2 ergodicity implication | An invariant set of mass `r` gives `r−r²`; at `r=0,1` this is `0`, at `r=1/2` it is `1/4`; complement pair gives `r(1−r)`. | Both null/conull possibilities forced; locator added. |
| §12.3 Koopman continuity | Mode `e_n`: norm difference from time zero is `abs(exp(2πint)−1)→0`; identity action difference `0`. Pullback by times `s,t` multiplies mode by `exp(2πin(s+t))`. | Native composition/isometry reused; joint-measurability continuity remains owned. |
| §12.4 Wiener | Zero measure gives `0=0`; δ₀ gives `1=1`; half-sum of δ₀,δ₁ gives average `1/2+sinT/(2T)→1/2`; interval Lebesgue has value `1` at zero, `4/π²` at π, atomic sum `0`. | Removable singularity repaired; all-atoms theorem retained. |
| §12.4.1 mean ergodic projection | Circle mode: `A_N^0=0`, `P₀=0`, but discrete U₁-average `e₁`; twisted `A_T^1=e₁`, squared projection `1=δ_(2π)({2π})`. Identity group gives `P₀v=v`, `P_av=0` for nonzero a; zero vector gives mass `0`. | New real-time theorem excludes discrete aliasing and fixes twist sign. |
| §12.4.1 auxiliary estimates/atomic identity | Scalar group `U_t=e^(2πit)`, `s=1/4,T=1,v=1`: average of `U_s v−v` is `0`, upper bound `1/2`. Twisted a=1: kernel at `ξ−2πa=0` is `1`, squared integral `1`; at a=0, T=1 it is `0`. | Bound, common fixed decomposition and atom identity consistent; no separability needed for compact vector orbits. |
| §12.5 eigenfunction criterion | `e₁` has mean `0`, correlation `i` at quarter time, spectral atom `2π`, twisted projection norm `1`; constants have eigenvalue `0`; two-point identity has nonconstant eigenfunction of eigenvalue `0`. | Absence of nonconstant eigenfunctions includes ergodicity; measurable-to-L² step explained. |
| §12.6 applications | Square whole-space residual `12` with raw mass, `0` with normalized mass; torus dual character has norm `1` and nonzero eigenvalue for a nonorthogonal dual vector. Removing null marked leaves changes its L² class by norm `0`. | Probability normalization and invariant conull comparison repaired. |

For the new collapsed-gap derivative, the general computation is `p·(q−p)ℓ/q + (q−p)·pℓ/q`, with the two terms coming from gaps decreasing from `ℓ` and increasing from zero. Thus it is strictly positive for every admitted `0<p<q`, not only the circular example. At a positive-perimeter boundary endpoint, one allowed parameter change affects one collapsed and one nondegenerate chord; the rates are `1` and a number strictly between `−1` and `1`. A small additional equal-gap inward direction makes all active faces inward while preserving positivity. These are the inputs used for the repaired minimax field.

For §12.4.1, time shifting changes an average of `V_s w−w` into two end-interval integrals of total length at most `2 abs(s)`; unitarity gives the displayed bound. The orthogonal complement of their closed span consists precisely of vectors fixed by every `V_s`, since the adjoint is `V_(−s)`. Contraction extends convergence from this span and the common fixed space to every vector. The spectral squared-norm identity follows by Fubini from `⟨U_s v,U_t v⟩=⟨v,U_(t−s)v⟩`; its kernel is bounded by `1` and converges to the singleton indicator. This establishes the stated real-time argument independently of the discrete source and without circular use of weak mixing.

## Sources, pins and ownership

The source passages used for these repairs were read from the supplied legal extractions: BialyMironov2022 line 149 for the positive-curvature setting, line 154 for reflection, line 159 for coordinates and line 182 for the chord primitive; Herman1983 line 762 for global canonical exactness, line 1150 for the invariant-region theorem and line 1159 for its proof; ChaikaForni2026 line 83 for directional flows/normalized area and line 168 for integrated translation charts; Hochman2012 line 2439 for the discrete ergodicity implication, line 2474 for bounded-average equivalences, line 2483 for correlations, line 2854 for the ergodic eigenvalue criterion, line 3076 for discrete spectral atoms and line 3099 for the discrete atomless computation. The intervening real-time and chart/groupoid constructions are identified as this roadmap’s deductions, not quoted source theorems.

All twelve manifest keys remain unique. The six waived books/papers and the uncertified MasurTabachnikov2002 entry retain their settlements and locators; no new request or renamed source was introduced. Their unavailable passages were not silently certified. The manifest removes the deleted §2.6 usage and records §12.4.1 under Hochman2012, whose discrete setting is explicit. No source passages were copied. No source access remains newly outstanding.

The plan’s Mathlib revision `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti revision `2fd255d997f47c0b5d834ee416c7015d55444ce5` match the content manifest. The decisive inspected native interfaces are:

| Pinned file and locator | Mathematical input |
|---|---|
| `Mathlib/Analysis/InnerProductSpace/Basic.lean:107` | `inner_smul_left` conjugates the first scalar. |
| `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean:89` | Discrete contraction iterates, not a real-time common fixed space. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:606`, `:611`, `:615`, `:631` | Native pullback, a.e. representative, norm, isometry and composition; the unitary structure uses invertibility of action times. |
| `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:120` | Orthogonal projection lands in the subspace; the convergence statement includes its inclusion into H. |
| `Mathlib/MeasureTheory/Group/Arithmetic.lean:456` | `MeasurableVAdd₂` is joint measurability, not merely separate measurability. |
| `TauCeti/Analysis/Semigroups/Group/Basic.lean:74` | Real-linear group operators, all real times and strong continuity at zero; completeness is separate. |
| `TauCeti/Analysis/Semigroups/Group/Unitary.lean:107` | Inner-product preservation forces complex linearity; it does not impose separability. |
| `TauCeti/Analysis/Bochner/CharFun/Bochner.lean:101` | Positive-exponential transform of a unique finite Borel measure, without a unit-vector normalization. |

The native quotient, chart, translation-number, implicit-function and recurrence declarations in the contracts remain inputs rather than rebuilt targets. Object searches in the pins found no continuous-time common-fixed projection theorem; Tau Ceti’s probability mean-ergodic module likewise concerns iterates of one measure-preserving map. The new §12.4.1 owns precisely the missing real-time result, not native pullbacks or projections.

All named roadmap supplier contracts were read on main: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`, C3.1 (collision map, circle, recurrence); `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`, I5.0 (signs), I5.4 (compact-pair Čech continuity and compact-metric Lyapunov cup length); `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`, §3.1 (turning); and `TauCetiRoadmap/GeometricTopology/README.md`, §§1.7 and 2.3 (genus and annulus). These supplied the three main-roadmap shape comparisons as well. No citation was replaced by revision-only numbering.

Ownership against open heads was checked with object searches using `roadmaps grep`; the scopes of the closest PlanarTopology, TeichmullerGeometry, RiemannianGeometry, DifferentialGeometry and Equidistribution roadmaps were read with `roadmaps show`, as was the translation-surface occurrence in UnboundedOperators. Their generic topology, marked hyperbolic geometry, smooth differential calculus, discrete rotations and Nelson-specific surface do not own the real-time theorem added here. Exchangeability’s completed Layer 5 and the pinned implementation supply discrete mean-ergodic operators. Continuous topological-action Koopman targets differ from the merely jointly measurable action of §12.3. Searches in the board packages and main found no other owner for the new common-real-time projection/atomic-mass adapter.

The supplied overlap audit has no conflicting head, dropped cited ID or revision-only supplier ID. Its closest-scope leads were checked. No other roadmap needs an edit to supply these repairs, and no supplier gap was invented. No merge-order file, other roadmap, tooling or pull-request text was changed.

## Maintainer notes

The independent circular target `Billiards.ConvexTable.circle_billiardMap` leaves the plan; its mathematics is imported from C3.1 and its Checks live in §2.5. §5.6’s classification remains. The added plan target is `Billiards.continuousTimeMeanErgodicProjection`, §12.4.1; existing section numbers and headline names are otherwise retained. The plan still has 57 targets because the imported circle target was replaced by the necessary spectral prerequisite. No known external citation of the removed §2.6 was reported by the overlap audit.

The design remains general in finite regularity, zero-curvature convex tables, unbounded twist strips, polygonal holes and nonseparable Hilbert spaces. These repairs do not constitute acceptance; the fresh independent mathematics review remains necessary.
