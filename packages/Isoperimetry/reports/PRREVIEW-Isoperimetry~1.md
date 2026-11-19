# Review of Isoperimetry (pull request #2597 at d813130)

**Verdict:** needs changes

**Summary.** Changes are needed for two P2 findings. Every headline statement is true as stated, and every `Suggested.lean` declaration matches its README statement. However, four sentences outside the stated results are false in a degenerate case they omit: three recall Tau Ceti theorems in Layers 2 and 3, and one is a Check of §4.3. Separately, the equality case of the parametrized planar theorem is a headline that can be stated at the pins, but `Suggested.lean` leaves it out. There are also seven small corrections and one format note, none of them blocking. For the humans: the licence status of the open extract of Maggi's book, and a prior formalization close to the frontier form.

## R01 (P2) — Four sentences drop a finiteness hypothesis or a degenerate case, and are false as written

Why it matters: an implementer or a consumer who reads these recalls takes them as the library's statements, and each fails on an explicit instance.

(a) Layer 2's opening paragraph, line 197, says Steiner symmetrization "fixes, in every direction, exactly the sets a.e. equal to centred balls". By Convention 8 an infinite section becomes the whole line, so the whole space is fixed by every `S_e` and is a.e. equal to no ball. The Tau Ceti theorem assumes finite volume: `TauCeti.forall_steinerSymmetrization_ae_eq_iff_exists_ae_eq_ball` has `volume s ≠ ∞` (`MeasureTheory/Measure/Lebesgue/Steiner/Ball.lean:156`).

(b) The same paragraph, line 196, says the second moment is not increased, "with equality exactly for sets a.e. fixed by it". Counterexample: the half-plane `{Re z > 0}` in `ℂ` with `e = 1`. Both second moments are `∞`, but the symmetral is all of `ℂ`. The Tau Ceti theorem `TauCeti.lintegral_norm_sq_steinerSymmetrization_eq_iff` assumes a finite second moment (`Steiner/Moment.lean:111`).

(c) Layer 3's opening paragraph, line 336, says the sharp inequality for the geometric signed area holds "with equality exactly for a circle traversed once at constant speed relative to arclength". A constant curve has `L = 0` and signed area `0`, so it attains equality. Tau Ceti's `TauCeti.eVariationOn_toReal_sq_eq_four_pi_mul_abs_rectifiableSignedArea_iff` includes it (`w = 0`; `Analysis/Fourier/AreaEnergy.lean:373`). The sentence on the area–energy inequality a few lines earlier does mention constant curves.

(d) The third Check of §4.3, line 497, says two disjoint balls of radius `r` give twice the right side "in every dimension". In dimension one, `(−2r, 0) ∪ (0, 2r)` is a.e. `(−2r, 2r)`, so `P(s) = 2 = 1 · ω_1 · |s|⁰`: this is equality, not twice.

The repairs, in the same order:
- (a) add "among sets of finite volume";
- (b) add "for sets of finite second moment";
- (c) add "or is constant";
- (d) write "separated" (as the Layer 4 Examples already do) or "for `n ≥ 2`".

## R02 (P2) — The equality case of the parametrized planar theorem is a headline that can be stated at the pins, but `Suggested.lean` does not state it

Why it matters: the acceptance test omits a headline that the overview and §6.2 promise. The module docstring says every headline is statable and that the planar theorem appears "in its geometric and parametrized forms", so a reader assumes it is tested.

How I know: the overview (line 22) says of the parametrized curve that "the same holds", meaning the inequality and its circle equality case. §6.2 (lines 775–778) asks to prove that equality holds exactly when `C = sphere c r` with `r > 0`. However, `simple_closed_rectifiable_isoperimetric` (`Suggested.lean`, lines 126–134) states only the inequality.

The smallest repair is to add the statement below, with the same hypotheses. I elaborated it at the pins, and it produces only the `sorry` warning:

```lean
theorem simple_closed_rectifiable_isoperimetric_eq_iff {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : ContinuousOn γ (Icc a b)) (hclosed : γ a = γ b)
    (hinj : InjOn γ (Ico a b)) (hrect : BoundedVariationOn γ (Icc a b)) :
    4 * Real.pi * (volume (TauCeti.filledHull (γ '' Icc a b) \ γ '' Icc a b)).toReal =
        (eVariationOn γ (Icc a b)).toReal ^ 2 ↔
      ∃ c : ℂ, ∃ r : ℝ, 0 < r ∧ γ '' Icc a b = Metric.sphere c r
```

## C01 — The route of §2.1 credits GeometricMeasureTheory G6 with a Minkowski-content identity that G6 does not state

The route (lines 215–217) needs the perimeter of a bounded smooth set to equal its lower outer Minkowski content `liminf |thickening ε s_j \ s_j| / ε`. It calls this "the smooth-domain comparison of GeometricMeasureTheory G6".

G6 compares perimeter with the Hausdorff measure of the boundary on Lipschitz and `C¹` domains (GeometricMeasureTheory on main, line 287). Neither G6 nor the open revision of GeometricMeasureTheory mentions Minkowski content. Tau Ceti's `MinkowskiContent.lean` gives only the bound of perimeter by the content, not the identity for smooth sets.

Under Convention 10 the missing step is already a target of §2.1. Would you say so: that the content of a bounded smooth set equals `Hⁿ⁻¹` of its boundary is a step of this section, and G6 supplies only `P(s_j) = Hⁿ⁻¹(∂s_j)`?

## C02 — Three routes wait on GeometricMeasureTheory G4 for results the pinned Tau Ceti already proves

As written, these `*Needs:*` lines block §2.1, §2.2 and §5.3 behind G4, which is unnecessary:
- smooth approximation of sets of finite volume in volume and perimeter, used in §2.1 (line 224), is `MeasureTheory.NullMeasurableSet.exists_smooth_perimeter_approximation` (`Analysis/BoundedVariation/SmoothApproximation.lean:143`);
- compactness of families bounded in `L¹` and in variation, used in §2.2 (line 257), is `TauCeti.isCompact_closure_of_setLIntegral_le_of_totalVariationOn_le` (`Analysis/BoundedVariation/Compactness.lean:170`);
- lower semicontinuity of variation under `L¹_loc` convergence, used in §5.3 (line 647), is `TauCeti.totalVariationOn_le_liminf` (`Analysis/BoundedVariation/TotalVariation.lean:375`).

Citing these declarations, and adding them to the Tau Ceti contracts, would remove the G4 edge from these three sections.

## C03 — The locator for the slicing theorem of §4.1 points to the wrong part of Cagnetti–Colombo–De Philippis–Maggi

Line 411 cites "§1.2". That section contains Steiner's inequality and Theorem A (CagnettiColomboDePhilippisMaggi2014 lines 95–149), not the slicing theorem. The statement of §4.1 (finite-perimeter sections, `∂*(s_y) = (∂*s)_y`, normal not orthogonal to `e`) is Theorem C in §4.4 (arXiv v1, p. 44; CagnettiColomboDePhilippisMaggi2014 lines 2621–2624). That paper quotes it as Vol'pert's theorem from Barchiesi–Cagnetti–Fusco, Theorem 2.4.

Theorem C asserts the identity only for `y` with sections of positive length. The README's "almost every `y ∈ e⊥`" is still true, because the derivative measure along `e` vanishes over null sections. Would you cite Theorem C there?

## C04 — Eleven targets carry no exact locator

Maggi is cited with no chapter or theorem in §2.1, §2.2, §4.1 and §4.3–§4.6, and §3.1, §5.1, §5.5 and §6.4 cite no source at all. A reader cannot check these statements against a text.

Maggi's public table of contents gives at least chapter-level locators:
- Steiner's inequality: §14.1, p. 158;
- the proof of the isoperimetric theorem, including the characterization of balls as the unique minimizers: §14.2, p. 165;
- the coarea formula and approximation by smooth open sets: Chapter 13;
- slicing of perimeters: Chapter 18.

Would you add theorem-level locators where you hold the text?

## C05 — §6.1 and §4.6 phrase as their own targets two facts that the scope assigns to GeometricMeasureTheory

§6.1 (line 755) asks to "prove ... that `γ` is rectifiable exactly when `H¹(C) < ∞`", with `eVariationOn = H¹(C)`. That is G1's target (GeometricMeasureTheory on main, line 128), and the route of §6.1 says so.

§4.6 (line 552) includes the agreement of the measure-theoretic and classical normals on `C¹` domains. That is G6's (line 287).

Since the scope section already names G1 and G6 as owners, rewording these clauses as citations ("by G1", "(G6)") would remove the appearance of a second owner.

## C06 — The equality clause of §4.6 needs a nonempty domain and a positive radius

Line 551 says equality holds "exactly when `Ω` is a ball". `Set.IsLipschitzDomain` quantifies over frontier points only (`Analysis/Sobolev/LipschitzDomain/Basic.lean:290`), so `∅` is a bounded open Lipschitz domain and attains `0 = 0`. It is a "ball" only with radius `0`, which §4.3 and §4.5 exclude. Adding "nonempty" (or `|Ω| > 0`, as §4.5 does) and "of positive radius" makes the clause match §4.5.

## C07 — The description says citations of the old layer labels still resolve, but one anchored link breaks

RiemannianGeometry on main (lines 974 and 3008), and its open revision, link to `../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility`. The heading behind that anchor is now "Layer 6: …", so the link lands at the top of the README. The sentence "Ik is Layer k" (line 879) keeps the label meaning, but not the anchor.

Either of these would fix it:
- an HTML anchor with that id just before the Layer 6 heading;
- a sentence in the description saying that the RiemannianGeometry link now opens the README at its top.

## N01 — `isoperimetric_frontier` is stated only on `EuclideanSpace ℝ (Fin n)` and names its set `E`

The other Layer 4 and 5 statements are on a general finite-dimensional inner product space, and `μHE[d]` is defined on any metric space (Mathlib `Geometry/Euclidean/Volume/Measure.lean:69`). Optionally, state it on the general space too. Renaming the set (for example `s`) would also avoid a clash with Convention 1's `E` for the space.

<details><summary>What was checked</summary>

The worker's automatic checks all passed. The check that every supplier this roadmap cites comes earlier in the merge order, with no two roadmaps citing each other, read 200 roadmaps and 2195 citations between them and found no upward citation and no cycle. `Suggested.lean` elaborates at the pins with only the eight `sorry` warnings. `#check` of all eight declarations matches their README statements. The one-tactic probe (`simp`, `rfl`, `infer_instance`) fails on every declaration, so none is padding.

Sources were read at their locators:
- Cagnetti–Colombo–De Philippis–Maggi: §1.2, Theorems A and C;
- Bianchi–Gardner–Gronchi–Kiderlen: Theorems 5.8 and 6.3, Corollary 6.5;
- Tao's post: Theorem 2;
- Tropp: Lecture 8;
- Wiedijk: entry 43.

Only the contents and introduction of Maggi's book are open, so the theorem statements behind the bare "Maggi" citations were not read. There are no earlier findings.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 real Prékopa–Leindler | θ=½, f=1_[0,1], g=1_[2,3]; f=g=1_[0,1], h=1 | h≥1 on [1,2] so ∫h≥1=LHS; Bochner ∫h=0 < 1 | true; integrability of h needed | none |
| Layer 1 examples | balls; A=∅; A={0}; [0,1]∪[2,3]+[0,1] | B̄(r)+B̄(s)=B̄(r+s); 0≥ω_n^{1/n} fails; equality; |A+B|=4>3 | true | none |
| §2.1 Steiner perimeter | two unit discs at ±3e; diameter variant | ellipse with semi-axes 1 and 2, area 2π, P≈9.69<4π≈12.57; area 12+π≈15.14 | true | C01, C02 |
| §2.2 iterated symmetrization | ball c r with ONB; centred box; two balls | s_n=ball 0 r; box fixed; limit radius 2^{1/n} | true | C02 |
| §2.3 convex surface area | unit square; segment of length ℓ | 1+4t+πt², derivative 4=P=H¹; P=0, H¹=ℓ, derivative 2ℓ | true; interior needed | none |
| Layer 2 recall | whole space; half-plane Re z>0, e=1 | E fixed, not a ball; both moments ∞, symmetral ℂ≠half-plane | false as written | R01(a,b) |
| Layer 3 recall | constant curve | L=0, signed area 0: equality, not a circle | false as written | R01(c) |
| §3.1 signed area | circleMap; twice; figure-eight cos t, sin t cos t | πr², −πr² reversed; 2πr²; xy′−yx′=cos³t, ∫=0 | true | none |
| Layer 3 examples | ellipse a,b; sin(4πt/T) | 4π²ab≤2π²(a²+b²); ratio ¼ of (T/2π)² | true | none |
| §4.1 slicing | unit disc, e=1; square (0,1)² | section length 2√(1−y²), normal x-part ±√(1−y²)≠0; horizontal sides over {0,1}, null | true | C03 |
| §4.2 Steiner equality | squares (0,1)² and (2,3)×(5,6), e=i | sections intervals; P=8 for both; no translation | true; CCDM Thm A matches | none |
| §4.3 rigidity (Lean) | punctured ball; |s|=0; two balls, n≥2 and n=1 | equality, not literally a ball; 0=0; ratio 2 for n≥2, ratio 1 for tangent intervals | statement true; Check false at n=1 | R01(d) |
| §4.4 frontier form (Lean) | punctured ball; ball minus ℚⁿ; ball complement | H^{n−1}({c})=0; frontier closed ball, H^{n−1}=∞; LHS ∞ > n ω_n | true; hypotheses needed | N01 |
| §4.5 regular open | punctured ball; closed ball | int cl = ball ≠ U; not open | true | none |
| §4.6 Lipschitz domains | unit square; ∅ | H¹=4=P, 4π<16; IsLipschitzDomain vacuous, 0=0 | degenerate | C05, C06 |
| Layer 4 examples | ball in ℝ³; annulus r<|z|<R | (4πr²)³=64π³r⁶=27(4π/3)(4πr³/3)²; P²−4πA=8π²r(R+r) | true | none |
| §5.1 Pólya–Szegő BV | 1_{ball c r}; two unit balls, plane | both nω_n r^{n−1}; 2π√2≈8.89<4π≈12.57 | true | none |
| §5.2 convex integrand | Φ(t)=t²; (1−‖x−c‖)⁺ | sΦ(P/s)=P²/s decreasing; equality | true; BGGK Thm 5.8 matches | none |
| §5.3 PS W¹,¹ (Lean) | (1−‖x−c‖)⁺; ball indicator | ∫‖G‖=∫‖U‖=ω_n; no integrable weak derivative, excluded | true; BGGK Cor 6.5 (n≥2) | none |
| §5.4 radial profile | (1−‖x‖)⁺; (‖x‖^{−α}−1)⁺, α<n−1 | nω_n∫₀¹r^{n−1}=ω_n; r^{n−1}v(r)~r^{n−1−α}→0 | true | none |
| §5.5 sharp BV Sobolev (Lean) | 1_{B_r}; 1_{B1}−1_{B2}; 2·1_{B(0,1)}+1_{B(0,2)} in ℂ | ω_n^{(n−1)/n}r^{n−1} on both sides; ratio 2^{−1/n}; √(12π)≈6.14<4√π≈7.09 | true | none |
| §5.5 equality (Lean) | c·1_B; |Du|=∞; Lipschitz approximants ε=0.1, 0.01, 0.001 | equality; ∞=∞ possible without hV; ratios 0.9844, 0.9983, 0.9998 | true; hV needed | none |
| §6.1 Jordan curves | circleMap once and twice | 2πr=H¹; variation 4πr≠H¹=2πr | true | C05 |
| §6.2 parametrized (Lean) | unit square; circle twice; Cantor reparametrized circle | 4π<16; 4π²r²<16π²r²; L=2π, A=π, ½∫(xy′−yx′)=π/2 | true; equality absent from Lean | R02 |
| §6.3 geometric (Lean, two) | sphere c r; rectangle a×b; Koch curve; no hrect | 4π·πr²=(2πr)²; 4πab<4(a+b)²; H¹=∞ excluded; toReal ∞=0 makes it false | true; hrect needed | none |
| §6.4 compatibility | sphere 0 1; L-shaped hexagon | P(ball 0 1)=2π=H¹; area 3, L=8, 12π<64 | true | none |

- **Source locators checked against the text (10):**
  - CagnettiColomboDePhilippisMaggi2014: §1.2 and Theorem A (lines 95–149), Theorem C (lines 2621–2624);
  - BianchiGardnerGronchiKiderlen2022: Theorem 5.8 (line 1270), Theorem 6.3 (line 1610), Corollary 6.5 (line 1827), standing n ≥ 2 (line 245);
  - Tao2011BrunnMinkowskiNilpotent: Theorem 2 (line 50);
  - Tropp2018ConvexGeometry: Lecture 8 (lines 2843–3080);
  - Wiedijk100: entry 43 (lines 409–420);
  - Maggi2012: contents and introduction only (lines 82–101, 483–493).
- **Tau Ceti declarations opened at the pin (29):**
  - Steiner: `Ball.lean:96`, `:156`; `Moment.lean:100`, `:111`; `Perimeter.lean:177`, `:220`; `Basic.lean:55`;
  - perimeter and isoperimetry: `Isoperimetric.lean:465`; `BrunnMinkowski/Isoperimetric.lean:103`, `:118`;
  - convexity: `EssentialConvexity.lean:280`; `Convex/Measure.lean:258`;
  - variation: `TotalVariation.lean:100`, `:375`; `Perimeter.lean:64`; `Compactness.lean:170`; `SmoothApproximation.lean:143`; `Slicing.lean:190`; `OrthogonalSlices.lean:119`;
  - Sobolev and rearrangement: `WeakDeriv/Basic.lean:251`; `SchwarzRearrangement.lean:129`; `LipschitzDomain/Basic.lean:290`;
  - curves: `IsoperimetricTrace.lean:72–246`; `AreaEnergy.lean:373`; `Parallel.lean:206`; `JordanCurve/Basic.lean:107`; `Wirtinger/Periodic.lean:102`; `Fourier/Wirtinger.lean:253`; `MinkowskiContent.lean:166`.
- **Further names resolved by search:** 28 Tau Ceti and 11 Mathlib names (Mathlib checks include `Geometry/Euclidean/Volume/Measure.lean:69` and `Analysis/Convex/Basic.lean:571`).
- **Cross-roadmap citations resolved:**
  - suppliers: GeometricMeasureTheory G1–G6 and acceptance examples on main (the open revision keeps the G1–G6 labels, line 1010); DifferentialGeometry 5.6 (line 2049); ConformalMapping §5.3 (Completed, line 787); PDE Layer 1 and §1.6 (lines 675, 905);
  - downstream: GaussianIsoperimetryAndClusters (lines 113–117), Yamabe (300, 652), SieveMethodsAndPrimePatterns (113–115), PDE (79), RiemannianGeometry (974, 3008).
- **Automatic checks:** all passed; the supplier-order check (suppliers earlier in the merge order, no cycles) read 200 roadmaps and 2195 citations and found no upward citation and no cycle.
- **Elaboration:** `Suggested.lean` gives only 8 `sorry` warnings; the `#check` types match the README statements; the one-tactic probe fails on all 8 declarations; the proposed `simple_closed_rectifiable_isoperimetric_eq_iff` elaborates.

Overlap check: I read GeometricMeasureTheory (main and the open revision), GaussianIsoperimetryAndClusters (main) and Surfaces (open head).
- Smooth approximation, compactness, lower semicontinuity, De Giorgi's theorem and the Jordan-curve perimeter identity are owned by GeometricMeasureTheory and cited here (see C02 for those the pin now proves).
- Finite-perimeter line slicing is owned here (§4.1). GaussianIsoperimetryAndClusters §6.2 builds its locally-finite version on it and cites §4.1.
- Weighted and Gaussian perimeter belong to GaussianIsoperimetryAndClusters.
- Surfaces shares nothing.

Ownership against open pull requests was checked against the open heads of the three closest roadmaps above.

Source independence: 10 passages compared with 6 sources; no wording is shared beyond formulas and standard names. The largest share is Maggi2012, with 7 of 18 locators. Contents compared with Maggi2012's public table of contents: independent. Layers 1–6 (Prékopa–Leindler and Brunn–Minkowski, symmetrization, curves, rigidity, `BV` Sobolev, planar theorem) do not map onto its Chapters 12–18. The route of §5.3 differs from Bianchi–Gardner–Gronchi–Kiderlen's Orlicz-space proof of their Theorem 6.3.

Research link: Layers 4–5 formalize De Giorgi's (1958) equality theory through the Steiner-equality analysis that Chlebík–Cianchi–Fusco (2005) completed and Cagnetti–Colombo–De Philippis–Maggi (2014) extend to rigidity. §5.2–§5.3 are the Pólya–Szegő theorems of Bianchi–Gardner–Gronchi–Kiderlen (2022). GaussianIsoperimetryAndClusters consumes Layer 4. This rests on the README's references and on CagnettiColomboDePhilippisMaggi2014 §1.2.

## Not verifiable

- Maggi2012 (Cambridge Studies in Advanced Mathematics 135): the open cvgmt extract holds only the contents, preface, introduction, bibliography and index. The theorems behind §2.1, §2.2, §4.1 and §4.3–§4.6 were not read.
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4 (the source CagnettiColomboDePhilippisMaggi2014 quotes for Theorem C): not opened.

## Source issues

- none

## For the human reviewers

- **Licence.** Maggi2012 was read from the cvgmt.sns.it extract (`Maggi_extract.pdf`), which states no licence. It holds only the front matter, introduction and index; the book itself is behind the publisher's paywall.
- **Licence.** `isoperimetric_frontier` has the shape of the theorem `isoperimetric` in Humanfia's lean-eval archive (`problems/isoperimetric_inequality/Challenge.lean`): the same `μHE[n − 1] (frontier _)` bound with `2 ≤ n`. It differs in name, binders and hypotheses (bounded measurable sets there, finite volume here). The README cites the archive as prior work, and that file has no licence header.
- **Not tested.** The wording of the targets citing Maggi2012, the source with the largest share of locators, could not be compared with its text beyond the introduction; the arrangement was compared with its table of contents.
