# Review of GravitationalLensing (pull request #2953 at 22655aa)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the design note D.3 says that a minimum or maximum of the time delay has positive Jacobian, which is false for degenerate critical points and is contradicted by the Einstein-ring Check of the same section. Every stated theorem, formula and Check of Layers 1–4 was recomputed and holds, the twelve Lean statements match the README and elaborate with `sorry` as the only warning, and all source locators were read at the text. There are three small corrections and no format notes; the questions left to a human are about scope and about 4.1 being stated more generally than any cited source.

## R01 (P2) — The sentence of D.3 on minima, maxima and saddles is false without "nondegenerate", and the second Check of D.3 refutes it

An implementer who takes the sentence as an API fact ("a local minimum of the time delay off the positions has positive Jacobian") would set out to prove something false. The sentence, in D.3 (README lines 95–98), reads: "a minimum or a maximum of the time delay has positive Jacobian and a saddle negative Jacobian", and goes on to say the signed magnification is "positive for minima and maxima".

Two witnesses. (i) The roadmap's own: for one mass `M > 0` at `a` and the source `a`, the time delay is `|z − a|²/2 − M log |z − a|`, whose radial derivative `r − M/r` changes sign from negative to positive at `r = √M`; so every point of the Einstein ring is a minimum, and the second Check of D.3 says the Jacobian vanishes exactly there. The same happens on the unit circle in the third Check of 4.1 (Plummer lens, source `0`). (ii) With no point masses, `ψ₀(z) = |z|²/2 − |z|⁴` and `w = 0`: the time delay is `|z|⁴`, with a strict global minimum at `0`; the lens map is `4|z|² z`, its derivative at `0` is `0`, the Jacobian is `0` and `magnification` has the junk value `0`, not a positive value.

The smallest repair is to restrict the sentence to nondegenerate critical points: "a minimum or a maximum of the time delay at which the Jacobian is nonzero has positive Jacobian, and a saddle at which it is nonzero has negative Jacobian; at such images the signed magnification is Petters–Werner's `(−1)^{Ind} / |det Jac η|`". Step 5 of the route of 4.1 already argues this way (positive semidefinite and invertible, hence positive definite), so nothing downstream changes.

## C01 — The locator of 2.4 points at the wrong sentence for the single-image case

In 2.4 (line 238) the three cases are cited to "equation (46) and the sentence after it". In Narayan–Bartelmann the sentence after (46) is about the images being collinear with the lens and about a zero-flux image at the centre; the single image for a source outside the Einstein ring is the sentence after equation (47) (NarayanBartelmann1997 line 822), stated there for `β > θ_E` only, and the ring for a centred source is §2.1.4 with equation (20). The boundary case `|w| = b` and the exclusion of the centre are this roadmap's own (and are correct: the candidate `w − b w/|w|` is `0`). Would read: "equation (46) for `|w| < b`, the sentence after equation (47) for `|w| > b`; the case `|w| = b` and the ring are computed here".

## C02 — The scope section does not name ConformalMapping §§5.4–5.5, the neighbour that bears on why Layer 3 is restricted to continuously differentiable maps

The introduction of Layer 3 (lines 282–285) explains the restriction to `C¹` maps and circles by the winding number at the pins being the index integral. ConformalMapping, on main, §5.4 defines the topological index of a continuous closed loop and §5.5 compares it with `TauCeti.Contour.windingNumber` and proves proximity invariance for continuous loops; with that index, Sète–Luce–Liesen's Theorem 2.6 is statable for continuous maps. The pinned Tau Ceti has no such declaration yet, so the choice made here is defensible and the Lean statements are right as they stand; but a reader of "Neighbouring roadmaps" (lines 625–631), which names three roadmaps further from Layer 3, is not told of the closest one. One sentence there would do: that ConformalMapping §§5.4–5.5 plans the index of continuous loops, and that Layer 3 uses the index integral for `C¹` composites and does not depend on it. (ConformalMapping §5.7 is for holomorphic `f` and is no overlap.)

## C03 — The sentence on PlanarTopology describes a roadmap that is not on main, and not as its open head has it

Lines 629–631 say that PlanarTopology, Layer 1, "defines an integer winding number of polygonal loops by a signed ray-crossing count". PlanarTopology is not on main; at the head of its open pull request the Layer 1 object I found is a ray-crossing count modulo two (`crossingParity`, valued in `ZMod 2`), and I did not find an integer-valued one. Since the sentence only asserts a non-dependence, the simplest repair is to delete it; otherwise describe the object as that head has it.

## Questions for the author

- In 3.2, is continuous differentiability of `f` on all of `U` intended, or only what `Suggested.lean` can state today? The route uses differentiability only along the circles (step 1) and mere continuity of the filled map `G` (steps 2–3), so the statement holds for `f` continuous on `K` and `C¹` near the `|S| + 1` circles. I did not check whether a consumer wants the weaker hypothesis.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| D.1 lens map, images | unit mass at 0, w=3/2; masses at ±1, z=1 | 2−1/2=3/2, −1/2+2=3/2; junk gives 1−1/2=1/2 | holds; exclusion needed |
| D.2 sign of time delay | unit mass, z=2, w=0 | ∇(‖z‖²/2−log‖z‖)(2)=3/2=lensMap; opposite sign 5/2 | holds |
| D.3 sentence on minima | M>0, w=a, ring; ψ₀=‖z‖²/2−‖z‖⁴ | ring points are minima with Jacobian 0; T=‖z‖⁴, Jacobian(0)=0 | false: R01 |
| D.4 SIS | b=1; w=1/2, w=2 | images 3/2, −1/2; μ=3, −1; image 3, μ=3/2 | holds |
| 1.1 Fermat | general; ψ₀=‖z‖ at 0 | ∇T=(z−w)−∇ψ₀−Σ m(z−p)/‖z−p‖²; non-differentiable control | holds |
| 1.2 Jacobian | masses 1/2 at ±1/2, z=0 | det(v−conj(f′)conj v)=1−‖f′‖²; Σ=4, 1−16=−15 | holds |
| 2.1 point-mass images | M=1, a=0, w=3/2; w=a | t²−ut−M=0: t=2, −1/2; w=a gives circle | holds |
| 2.2 Einstein ring | M=4, z=2i | 2i−4/conj(2i)=0; ‖z−a‖²=M | holds |
| 2.3 magnifications | M=1, u=3/2; u=√M | t⁴/(t⁴−M²): 16/15, −1/15; formula 1/2±17/30; total 3/√5 | holds |
| 2.4 SIS images | ‖w‖<b, =b, >b, w=0 | t=‖w‖+b; t=‖w‖−b<0 iff ‖w‖<b; at ‖w‖=b candidate is 0 | holds |
| 2.5 SIS magnifications | general | J=‖w‖/(‖w‖+b), −‖w‖/(b−‖w‖); μ=1±b/‖w‖; sum 2 | holds |
| 3.1 index of regular zero | z, conj z, 2z+conj z, z², z+1 | 1, −1, 1 (det 3); z² gives 2 with det 0; z+1 gives 0 | holds |
| 3.2 argument principle | z(z−4), R=10, ε=1; q=1, ε=2; R=−1; ε=−1; S outside | 2=1+1; 2≠4; 1≠0; 0≠1; 0≠1 | holds; each hypothesis needed |
| 4.1 counting formula | masses 1/2 at ±1/2 and at ±2, w=0; Plummer w=1/10; mass −1 | N₋=3,N₊=2; N₋=2,N₊=1; 3 roots, caustic radius ≈0.300; 0=0+1−1, 1=1+1−1 | holds |
| 4.1 negative controls | 2(x sin x+cos x); eˣ+y²; double mass at 0 | g″=2x sin x≠0, infinitely many images; no image, 0≠−1; N₋=N₊=1≠N₊+1 | hypotheses needed |
| 4.1 route, steps 1–5 | n=0, n=1, pole index | convex radial function; pole term −(m/ε²)(z−p) winds 1; 1=N₊−N₋+n | sound |
| 4.2 Witt's bound | masses 1/2 at ±1/2, w=0; n=1; masses (1,0); double mass | H=z(z²−1/4)−z³+z(z²−1/4)²/4, degree 5, five images; circles in the three controls | holds |
| 4.3 parity, lower bound | n=0, 1, 2; mass −1 | N=1; N=2; N∈{3,5}; N=0 and 2, both even | holds |
| Lean vs README | all 12 theorems, 11 definitions | binders explicit; n=0 gives ℤ equation N₋=N₊−1; negative R, ε excluded by `hR`, `hε` | agree |

- Source locators checked against the text: 25 of 25 (Petters–Werner 13, Narayan–Bartelmann 7, Sète–Luce–Liesen 4, Luce–Sète–Liesen 1), plus Khavinson–Neumann Theorem 1, Corollary 1 and Fact 1; one imprecise (C01).
- Library declarations opened at the pin: 14 Tau Ceti lemmas under `TauCeti/Analysis/Contour/Winding/` (for example `windingNumber_circleMap_center`, `Number/Circle.lean` line 232; `windingNumber_eq_of_pathHomotopy`, `Number/Homotopy.lean` line 107; `IsPiecewiseC1On.windingNumber_eq_of_notMem_segment`, `Proximity.lean` line 164; `IsPiecewiseC1On.exists_int_windingNumber`, `Integer.lean` line 70) and 13 Mathlib declarations; all exist with the content the supplier contracts give.
- Duplication by object: no lens map, index of a regular zero of a planar map, or argument principle for non-holomorphic maps in the pinned Mathlib or Tau Ceti, on main or in an open roadmap pull request.
- Cross-roadmap citations resolved: DifferentialGeometry Layer 10 and MorseNovikov 7.1, 7.3 on main (both as described); PlanarTopology only at an open head (C03).
- Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap declares no roadmap supplier.
- Elaboration: `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else; no `set_option`, no sorry'd data, imports `Mathlib` and one Tau Ceti module. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) closes none of the twelve: no padding. All headline theorems of the Summary are stated.
- Pull request text read against the head: title, counts (12 theorems, 11 definitions), imports, suppliers and locators agree; no change outside the folder.

Overlap check: read ConformalMapping (main and its open revision), ContourIntegration, GlobalHolomorphicFunctions; nothing shared (ConformalMapping owns the index of continuous loops and the holomorphic boundary argument principle, this roadmap the argument principle for `C¹` planar maps; see C02).

Source independence: 14 passages compared with 5 sources, none shared beyond a forced seven-word run in the statement of Khavinson–Neumann's Fact 1; largest share PettersWerner2009, 13 of 25 locators; contents compared with PettersWerner2009: independent (only 4.1–4.3 touch its §§2.1–2.2, in the order the dependency of 4.3 on 4.1 and 4.2 forces; Layers 1–3 have no counterpart run there).

Research link: Layer 4 states the image-counting results surveyed in Petters–Werner 2009 (Petters 1991, Burke 1981, Witt 1990) and the index count of Luce–Sète–Liesen 2014; Layer 3 is the argument principle used by Sète–Luce–Liesen 2014 and Khavinson–Neumann 2004 for rational harmonic functions. Rests on the README's references and the five texts read.

## Not verifiable

- The primary sources behind the attributions (Burke, Witt, Schneider and Weiss, Petters 1991): not opened; the README cites them only through Petters–Werner, which was read.

Automatic checks set aside as false positives: none (the one flagged line, naming a roadmap that is not on main, is C03).

## Source issues

- **Error** in NarayanBartelmann1997 at equation (27), printed page 11: the source says the right-hand side with the lower sign, a positive number, equals the signed magnification of the inner image, which the next sentence calls negative; it should be `μ± = 1/2 ± (u² + 2)/(2u√(u² + 4))`; affects nothing.
- **Misprint** in PettersWerner2009 at §2.1, application to microlensing, printed page 4: the source says the subcriticality condition twice with the same sign of the shear; it should be `1 − κ_c + γ > 0` and `1 − κ_c − γ > 0`; affects nothing.
- **Misprint** in PettersWerner2009 at the proof of Theorem 2, part (2), printed page 5: the source says that in the saddle case one gets at least one image; it should be at least three, as the argument given shows; affects nothing.

## For the human reviewers

- **Scope.** The subject is the mathematical theory of thin-lens gravitational lensing; main sources are a review article and lecture notes on arXiv (PettersWerner2009, NarayanBartelmann1997). Layer 2 consists of closed-form computations cited to the lecture notes. The metadata topic is `math.CV`.
- **Scope.** Statement 4.1 is more general than any cited source (no genericity, masses of either sign); it rests on the README's own route, which this review checked step by step, not on a refereed proof.
- **Licence.** All five texts were read from arXiv; none of the primary papers the README attributes results to was opened.
