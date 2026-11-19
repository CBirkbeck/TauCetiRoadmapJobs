# Review of Isoperimetry (pull request #2597 at dd8a03c)

**Verdict:** needs changes

**Summary.** Changes are needed for one P2 finding. Every headline statement and every `Suggested.lean` declaration is true as stated and matches the README. However, two sentences of commentary are false in a degenerate case: an example in Layer 1 and the remark on lower-dimensional convex sets in §2.3. All earlier findings are repaired except one small correction, which is only partly repaired (missing locators). There are four small corrections and one format note, none blocking. For the humans: two public formalizations close to the Lean statements, and the licence of the Maggi extract.

## R01 (P2) — Two sentences of commentary are false in a degenerate case

An implementer who reads these sentences as stated facts is misled. Each one fails on an explicit instance.

(a) The second example of Layer 1 (line 179) says nonemptiness "cannot be dropped even when the other volume is zero or positive". When the other volume is zero it can be dropped. For `A = ∅` and `B = {0}`, `|A + B| = 0`, and the unweighted inequality reads `0 ≥ 0 + 0`, which is true. Only a set `B` of positive volume, such as the ball in the example, gives a failure. A wording that is true: "Nonemptiness cannot be dropped when the other set has positive volume".

(b) In §2.3 (lines 289–292), the remark on a nonempty compact convex `K` with empty interior ends "for such K the derivative is neither the perimeter nor, in general, the boundary area". This fails in codimension at least two. For a point `K = {p}` in `ℂ`, `|K + t • closedBall 0 1| = πt²` has right derivative `0`, and `P(K) = 0 = H¹(frontier K)`, so all three numbers agree. The same holds whenever the affine span has dimension at most `n − 2`: Tau Ceti's `TauCeti.hasDerivWithinAt_volume_real_add_smul_closedBall_of_finrank_add_two_le` gives derivative `0`, and such a set is `Hⁿ⁻¹`-null. A wording that is true: "when the affine span is a hyperplane, the derivative `2 Hⁿ⁻¹(K)` is neither the perimeter `0` nor the boundary area `Hⁿ⁻¹(K)`; in smaller dimension all three vanish".

## C01 — Four sections still lack an exact locator, and §5.4 credits a paper with statements it does not make

This is the earlier locator correction, partly repaired. §3.1, §5.5 and §6.4 cite no source. §5.4 ends "(Bianchi–Gardner–Gronchi–Kiderlen)" with no theorem. That paper has no statement about jump parts, Cantor parts or mass at the origin. What it proves, and what these three corollaries follow from, is `W¹,¹_loc` membership of the rearrangement: Theorem 6.3, BianchiGardnerGronchiKiderlen2022 lines 1610–1618. Would you cite Theorem 6.3 there, and add locators to §3.1, §5.5 and §6.4?

In §1.1 the citation of Tao's exposition could also name its Theorem 2 (Tao2011BrunnMinkowskiNilpotent line 50).

## C02 — §4.1 credits the reduced boundary and outer normal to GeometricMeasureTheory G5, but the pinned Tau Ceti already has both carriers

§4.1 (lines 418–419) takes `∂*s` and `ν_s` from GeometricMeasureTheory G5. Tau Ceti defines both at the pin: `TauCeti.reducedBoundary` and `TauCeti.outerNormal` (`Analysis/BoundedVariation/ReducedBoundary.lean:95` and `:106`). GaussianIsoperimetryAndClusters already uses these two carriers together with §4.1 (§6.2 there). Naming them in §4.1 and in the Tau Ceti contracts would fix which objects the slicing theorem is about. G5 stays needed for the structure theorem, which is not at the pin.

## C03 — The G5 contract and the route of §5.2 credit G5 with a level-set comparison it does not state

The route of §5.2 (lines 635–636) and the G5 contract (lines 1152–1153) speak of "G5's comparison of the perimeter of `{h > t}` with `Hⁿ⁻¹({h = t})`". G5 on main states only `P(E) ≤ Hⁿ⁻¹(frontier E)` for measurable `E` (GeometricMeasureTheory on main, lines 266–268). The level-set form follows from it because `frontier {h > t} ⊆ {h = t}` for continuous `h`. Would you say so in both places?

## C04 — The description's opening overstates the scope of ball rigidity

The description says the main results include "ball rigidity for every set of finite perimeter". The head states rigidity (§4.3) for Lebesgue-measurable sets with `0 < |E| < ∞`, and does not assume finite perimeter. The complement of a ball has finite perimeter and infinite volume, so it lies outside the theorem. The description's own later bullet on §4.3 is correct. Suggested wording: "ball rigidity for every Lebesgue-measurable set of finite positive volume (equality only for sets agreeing a.e. with a ball)".

## N01 — §4.1 and §4.2 call the area formula for the projection of `∂*s` onto `e⊥` "the coarea formula"

In §4.1 and §4.2 (lines 427–428 and 454–455) the map goes from an `(n − 1)`-rectifiable set to an `(n − 1)`-dimensional space, so this is G2's tangential area formula, which is how G2 and GaussianIsoperimetryAndClusters §6.2 name it.

<details><summary>What was checked</summary>

**Earlier findings (review of d813130):**
- R01(a) repaired: line 198 now reads "among Lebesgue-measurable sets of finite volume".
- R01(b) repaired: line 197 now reads "with equality, when that moment is finite".
- R01(c) repaired: lines 344–345 now read "equality exactly for a constant curve and for a circle".
- R01(d) repaired: line 508 now reads "Two separated balls of radius `r` (closures disjoint)". It is true for `n = 1` too, with `P = 4` against `2`.
- R02 repaired: `simple_closed_rectifiable_isoperimetric_eq_iff` is stated (`Suggested.lean` lines 143–149) and elaborates.
- C01 repaired: the Minkowski-content identity is now part of the §2.1 target (lines 217–226), and G6 supplies only `Hⁿ⁻¹(frontier s_j) = P(s_j)`.
- C02 repaired: §2.1, §2.2 and §5.3 cite Tau Ceti's smooth approximation, compactness and lower semicontinuity, and no longer cite G4.
- C03 repaired: §4.1 cites Theorem C in §4.4 (lines 419–421).
- Earlier C04 (locators) partly repaired: Maggi sections are now cited in §2.1, §4.1 and §4.3–§4.6, Volčič in §2.2 and Burchard in §5.1; the rest is C01 above.
- C05 repaired: §6.1 now asks only for the Jordan-curve facts; the length identity is recalled as Tau Ceti's, and §4.6 cites G6.
- C06 repaired: §4.6 now requires a nonempty domain and a positive radius.
- C07 repaired: the description now states that RiemannianGeometry's anchored link to the old Layer 6 heading opens the README at its top.
- N01 repaired: `isoperimetric_frontier` is stated on a general space, with its set named `s`.

**Automatic checks:** every check passed. The supplier-order check confirms that every roadmap this one draws on comes earlier in the merge order and that no chain of citations returns to this roadmap, so that it can merge after its suppliers. Across 200 roadmaps and 2195 citation edges it found no upward citation and no cycle. All suppliers (GeometricMeasureTheory, DifferentialGeometry, PDE, ConformalMapping) are on main.

**Lean:** `Suggested.lean` elaborates with nine `sorry` warnings and nothing else. The `#check @name` types of all nine declarations match their README statements. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `exact le_top`) closes none of them.

**Not verifiable:** the theorem statements inside Maggi's book (only its front matter is open) and Barchiesi–Cagnetti–Fusco's Theorem 2.4.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 real Prékopa–Leindler | θ=½, f=1_[0,1], g=1_[2,3]; f=g=1_[0,1], h=1; θ=0 | h≥1 on [1,2], ∫h≥1=LHS; Bochner ∫h=0<1; h≥f gives ∫f≤∫h | true; h integrable needed | none |
| Layer 1 examples | A=∅,B={0}; A=∅,B=ball; A={0}; [0,1]∪[2,3]+[0,1] | 0≥0+0 holds; 0≥ω^{1/n} fails; equality; \|A+B\|=4>3 | first example's "zero" clause false | R01(a) |
| §2.1 Steiner perimeter | two unit discs at ±3e; diameter variant; ball c r | ellipse 1×2, area 2π, P≈9.69<12.57; area 12+π≈15.14; S_e ball = ball(c−⟪e,c⟫e) r | true; matches `steinerSymmetrization_vadd` | none |
| §2.2 iterated symmetrization | ball c r with ONB; centred box; two unit balls; unbounded s | s_n=ball 0 r; box fixed; radius 2^{1/n}; \|s_k∆B\| nonincreasing, block argument converges | true beyond Volčič's bounded case | none |
| §2.3 convex surface area | unit square; segment ℓ; point in ℂ | 1+4t+πt², derivative 4=P=H¹; 0, ℓ, 2ℓ; πt², derivative 0=P=H¹=0 | statement true; remark false in codimension ≥2 | R01(b) |
| §3.1 signed area | circleMap once, reversed, twice; figure eight | πr², −πr², 2πr²; xy′−yx′=cos³t, integral 0 | true | none |
| §4.1 slicing | unit disc e=1; square (0,1)²; null sections | normal x-part ±√(1−y²)≠0; sides over {0,1}; \|D_e1_s\|(Y₀×ℝ)=0 so (∂*s)_y=∅ a.e. | true | C02, N01 |
| §4.2 Steiner equality | (0,1)²∪(2,3)×(5,6), e=i; two discs | P=8 for both, no translate; P(S_e s)≈9.69<12.57 | true; matches CCDM (1.1) and Theorem A | none |
| §4.3 rigidity (Lean) | punctured ball; \|s\|=0; separated balls n=1, n≥2; P=∞ | equality; 0=0; P=4 against 2, ratio 2; ∞≠finite right side | true | none |
| §4.4 frontier form (Lean) | punctured ball; ball minus rational points; ball complement | H^{n−1}({c})=0, equality; frontier closed ball, ∞; left side ∞ | true; hypotheses needed | none |
| §4.5 regular open | punctured ball; closed ball; ball c r | int cl = ball ≠ U; not open; H^{n−1}(sphere)=nω_n r^{n−1} | true | none |
| §4.6 Lipschitz domains | unit square; ∅ | 4π<16; chart condition vacuous, 0=0, nonempty needed | true; predicate local epigraph, so regular | none |
| §5.1 Pólya–Szegő BV | 1_{ball c r}; two unit balls in plane | nω_n r^{n−1} both sides; 2π√2≈8.89<12.57 | true; Burchard Thm 4.7 | none |
| §5.2 convex integrand | Φ=t; Φ=t²; (1−‖x−c‖)⁺ | gives §5.1; P²/s decreasing; equality | true; BGGK Thm 5.8, finite Young Φ | C03 |
| §5.3 PS in W¹,¹ (Lean) | (1−‖x−c‖)⁺; ball indicator | ∫‖G‖=∫‖U‖=ω_n; no integrable weak derivative, excluded | true | none |
| §5.4 radial profile | (1−‖x‖)⁺; (‖x‖^{−α}−1)⁺, α<n−1 | nω_n∫₀¹r^{n−1}=ω_n; r^{n−1}v~r^{n−1−α}→0 | true; locator absent | C01 |
| §5.5 sharp BV Sobolev (Lean) | 1_{B_r}; 1_{B1}−1_{B2}; \|Du\|=∞ | ω^{(n−1)/n}r^{n−1} both; ratio 2^{−1/n}; right side ∞ | true | none |
| §5.5 equality (Lean) | 2·1_{B(0,1)}+1_{B(0,2)} in ℂ; u∈L¹∖L^p; c<0 | √(12π)≈6.14<4√π≈7.09; ∞=∞ without hV; \|c\| both sides | true; hV needed | none |
| Layer 5 examples | ε=0.1, 0.01, 0.001 approximants | ratios 0.9844, 0.9983, 0.9998 | true | none |
| §6.2 parametrized (Lean) | unit square; circle twice | 4π<16; 4π²r²<16π²r² | true; Wiedijk entry 43 | none |
| §6.2 equality (Lean) | sphere c r; circle twice; Cantor-reparametrized circle | 4π·πr²=(2πr)²; trace a circle, no equality; L=2π, A=π, equality | true | none |
| §6.3 geometric (Lean, both) | sphere c r; rectangle a×b; Koch curve | 4π²r² both sides; 4πab<4(a+b)²; H¹=∞ excluded | true | none |
| Description opening | complement of a ball | finite perimeter, infinite volume, outside §4.3 | overstated | C04 |

- **Source locators checked against the text (12):**
  - Maggi2012: contents, lines 82–84 and 98–101; synopsis, lines 483–493 and 605–607;
  - CagnettiColomboDePhilippisMaggi2014: §1.2 and Theorem A, lines 95–149; Theorem C, lines 2621–2624;
  - Volčič2009RandomSymmetrizations: Theorems 3.4–3.5, lines 378–427;
  - Tropp2018ConvexGeometry: Lecture 8, lines 2837–3055;
  - Burchard2009Rearrangement: Theorem 4.7, lines 1373–1415;
  - BianchiGardnerGronchiKiderlen2022: Theorem 5.8 (line 1270), Theorem 6.3 (1610), Corollary 6.5 (1827), Young function (338);
  - Tao2011BrunnMinkowskiNilpotent: Theorem 2, line 50;
  - Wiedijk100: entry 43, lines 409–420.
- **Library declarations opened at the pin (27):**
  - Steiner: `Steiner/Ball.lean:156`, `Moment.lean:111`, `Perimeter.lean:177` and `:220`, `Basic.lean:55` and `:139`;
  - definitions: `SchwarzRearrangement.lean:129`, `TotalVariation.lean:100`, `Perimeter.lean:64`, `WeakDeriv/Basic.lean:251`, `ReducedBoundary.lean:95` and `:106`;
  - rigidity inputs: `Isoperimetric.lean:465`, `BrunnMinkowski/Isoperimetric.lean:103` and `:118`, `EssentialConvexity.lean:280`, `Convex/Measure.lean:258`, `Real.lean:347`;
  - variation and Sobolev: `Compactness.lean:223`, `WeakDerivative.lean:234`, `Coarea.lean:392`, `Sobolev.lean:72`, `LipschitzDomain/Basic.lean` (`IsLipschitzDomain`);
  - curves: `CurveLength.lean:173`, `IsoperimetricTrace.lean:107–260`, `AreaEnergy.lean:352` and `:373`, `Fourier/Wirtinger.lean:253`;
  - Brunn–Minkowski: `BrunnMinkowski/Basic.lean:175`, `BrunnMinkowski/Real.lean:45–104`;
  - Mathlib: `Geometry/Euclidean/Volume/Measure.lean:68` and `:191`.
- **Names resolved:** all 195 backticked tokens of the README searched; every library name exists at the pinned Tau Ceti or Mathlib.
- **Cross-roadmap citations resolved:**
  - GeometricMeasureTheory on main: G1 (106), G2 (148), G5 (248), G6 (275), acceptance examples (306); the open revision maps G1–G6 (line 1027);
  - DifferentialGeometry 5.6 (line 2049); ConformalMapping §5.3 (Completed, line 787); PDE Layer 1 (line 675) and §1.6 (line 905);
  - consumers: Yamabe 300 and 652, SieveMethodsAndPrimePatterns 113–115, PDE 79, RiemannianGeometry 974, 2854 and 3008, ConformalMapping 83, GaussianIsoperimetryAndClusters 13, 505 and 576.
- **Automatic checks:** all passed; supplier-order check `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- **Elaboration:** 9 `sorry` warnings only; `#check` types match the README; the one-tactic probe fails on all 9 declarations.

Overlap check: I read GeometricMeasureTheory (main and the open revision), GaussianIsoperimetryAndClusters (main and its open head), Surfaces, GeometricCurrents and ConformalMapping (open heads).
- GeometricMeasureTheory owns the GMT inputs; its open revision says this roadmap owns the sharp constants, ball rigidity, rearrangements and the planar curve inequality.
- Slicing (§4.1) is owned here; GaussianIsoperimetryAndClusters cites it with matching hypotheses. Essential convexity is Tau Ceti's.
- ConformalMapping cites "Isoperimetry, I6", which still resolves through the label mapping.
- Surfaces shares nothing. GeometricCurrents' isoperimetric filling is a different object (currents).

Source independence: 18 passages compared with 8 sources, none shared beyond formulas and standard names. The comparisons include the §2.2 route against Volčič's proof of Theorem 3.4, the §5.3 route against BGGK's proof of Theorem 6.3, and the parametrized docstrings against Wiedijk's entry 43. Largest share: Maggi2012, 6 of 19 locators. Contents compared with Maggi2012's table of contents: independent. Layers 1, 3, 5 and 6 have no counterpart in its Chapters 12–18; Layers 2 and 4 draw on §14.1, §14.2 and §18.3 only in part.

Research link: Layers 2 and 4 formalize De Giorgi's 1958 rigidity proof through Steiner's inequality and its equality analysis by Chlebík–Cianchi–Fusco (2005), as recalled by Cagnetti–Colombo–De Philippis–Maggi (2014, §1.2). Layer 5 is the Pólya–Szegő theory of Bianchi–Gardner–Gronchi–Kiderlen (2022). GaussianIsoperimetryAndClusters and Yamabe consume §4.1 and §5.2. Rests on the README and CCDM lines 128–136.

## Not verifiable

- Maggi2012: the theorem statements behind §2.1, §4.1 and §4.3–§4.6. The open cvgmt extract holds only the front matter, introduction and index; the sections were checked against the contents (§14.1 p. 158, §14.2 p. 165, §18.3 p. 225).
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4, the source of CCDM's Theorem C: not opened.
- Tao2011BrunnMinkowskiNilpotent: the HTML extraction drops the displayed formulas of Theorem 2, so only its hypotheses in words were compared.

## Source issues

- none

## For the human reviewers

- **Licence.** `kim-em/isoperimetric` (Apache-2.0, `Isoperimetric/Statement.lean`, `ClassicalIsoperimetric`) states the same inequality and circle-equality iff as `simple_closed_rectifiable_isoperimetric` and `_eq_iff`. It works on `[0, 1]` rather than `[a, b]`, and its names differ. The README cites it as prior work.
- **Licence.** Humanfia's `problems/isoperimetric_inequality/Challenge.lean` (`isoperimetric`, no licence header) has the same `μHE[n − 1] (frontier _)` bound as `isoperimetric_frontier`. It differs in name, binders and hypotheses: bounded measurable sets in `E n` there, sets of finite volume in a general space here.
- **Licence.** Maggi2012 was read from the cvgmt extract `Maggi_extract.pdf`, which states no licence. The book itself is behind the publisher's paywall.
- **Not tested.** Maggi2012, the source with the largest share of locators: its wording beyond the introduction could not be compared; the arrangement was compared with its table of contents.
