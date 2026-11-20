# Review of Isoperimetry (pull request #2597 at aeab290)

**Verdict:** accepted

**Summary.** Accepted: a full second reading of this head found no false or unsupported statement. Every theorem, Check and worked example was recomputed, including the degenerate cases (dimension one, volume zero, the empty set, empty-interior convex sets), and each sampled locator says what the text attributes to it. There is one small correction (Wiedijk's entry proves one direction of the planar equality case, not both) and one format note, neither blocking. For the humans, the licence questions of the earlier reviews remain: two public formalizations cited as prior work, and the Maggi extract.

## C01 — Wiedijk's entry states that equality forces a circle, not that equality holds exactly for circles

In §6.2 (line 811) and §6.3 (line 829) the sentence "equality holds exactly when `C = sphere c r` … (Wiedijk's entry)" attributes both directions to the entry. The entry (Wiedijk100 lines 413–420) states the inequality for a rectifiable simple closed path and the implication from equality to the path image being a sphere; it does not state the converse. A reader who opens the source for the "if" direction finds nothing.

The converse is at the pinned Tau Ceti, as the opening of Layer 6 already says (`ContinuousOn.eVariationOn_toReal_sq_eq_four_pi_mul_volume_real_filledHull_sdiff_of_image_eq_sphere`). It would be enough to write, in both places, "(Wiedijk's entry, for the inequality and for equality forcing a circle; the converse is Tau Ceti's)".

## N01 — The hypothesis `2 ≤ Module.finrank ℝ E` is not needed for the truth of two of the Lean statements

`perimeter_pow_eq_iff_exists_ae_eq_ball` holds in dimension one (it is the pinned `TauCeti.Real.perimeter_eq_two_iff`, as the last Check of §4.3 says), and `exists_hasWeakFDerivOn_schwarzRearrangement` holds in dimension one as well (`∫ |u*′| = 2 sup u ≤ ∫ |u′|`). The roadmap's scope is `n ≥ 2`, so this is a choice; the two signatures would also be true with `Module.finrank ℝ E ≠ 0`, should a consumer want them.

<details><summary>What was checked</summary>

**Previous findings.** The previous review of this same head raised no finding, no small correction and no format note, so there was nothing to recheck finding by finding; the roadmap was reviewed again in full.

**Automatic checks.** All passed on this head. The check that every supplier comes earlier in the merge order than its consumer, which keeps the supply in a single direction, read 200 roadmaps and 2195 supplier edges and reported 0 problems: no upward citation and no cycle; every supplier (GeometricMeasureTheory, DifferentialGeometry, PDE, ConformalMapping) is on main. The pull request changes nothing outside the roadmap folder.

**Lean.** `Suggested.lean` elaborates at the pins with nine `sorry` warnings and nothing else. Replacing each `sorry` by `simp`, by `rfl` and by `infer_instance` closes none of the nine. The elaborated type of each declaration was compared with its README statement (§4.3, §4.4, §5.3, §5.5, §6.2, §6.3): same hypotheses, same generality; nothing changed.

**Renamed headings.** RiemannianGeometry links to the former anchor of the Layer 6 heading. The scope section gives the former numbering (I1–I6 are Layers 1–6) and the description names the anchor and its replacement, so no remark is made.

**Pull request text.** The description agrees with the head: it says the roadmap is revised, gives the removed declaration (`periodic_wirtinger`), the five added and the one restated, the suppliers, and its counts (50 Checks in 20 sections, 18 worked examples; recounted).

**Not verifiable.** The statements inside Maggi's book behind §14.1, §14.2 and §18.3 (only front matter and contents are open); the displayed formulas of Tao's Theorem 2; Barchiesi–Cagnetti–Fusco's Theorem 2.4; the published equation numbering of Fusco–Maggi–Pratelli.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 real Prékopa–Leindler | θ=½, `1_[0,1]`, `1_[2,3]`; Gaussians; `h=1`; θ=0 with `g=0` | `h≥1` on `[1,2]`, `1≤∫h`; equality; Bochner `∫1=0<1`; `(∫f)·0⁰=∫f≤∫h` | true; integrability of `h` needed | none |
| §2.1 Steiner perimeter | two unit discs at `±3e`; diameter variant; n=1 | ellipse 1×2, area 2π, perimeter ≈9.688 < 4π; area 12+π; `2 ≤ P(s)` | true; route's pin lemma needs a closed set, closure used | none |
| §2.2 convergence to the ball | centred box, coordinate directions; unbounded `s` | box fixed; `|S_e t ∆ B| ≤ |t ∆ B|` since `S_e B = B`, so distance to `B` never increases | true beyond the source's bounded case | none |
| §2.3 `P(K)=Hⁿ⁻¹(frontier K)` | unit square; segment ℓ in ℂ; point in ℝ; `[a,b]` in ℝ | derivative 4=P=H¹; 2ℓ, 0, ℓ; 2, 0, 1; P=2=H⁰ | true; nonempty interior needed | none |
| §3.1 signed area | circle, reversed, twice; figure eight | πr², −πr², 2πr²; `x y′−y x′=cos³t`, integral 0 | σ=±1 needs injectivity | none |
| §4.1 slicing | unit disc, `e=1`; square; sections of length zero | normal component `±√(1−y²)`; exceptional heights `{0,1}`; `∫#(∂*s)_y = ∫#∂*(s_y)` forces a.e. equality | true for a.e. `y`, also where the source is silent | none |
| §4.2 interval sections | squares `(0,1)²`, `(2,3)×(5,6)`, `e=i`; two discs | both perimeters 8, not translates; pairs of intervals on `|y|<1`, strict | true | none |
| §4.3 rigidity (`perimeter_pow_eq_iff_exists_ae_eq_ball`) | punctured ball; volume 0; two balls; n=1 | equality, a.e. ball; `0=0`, no ball; ratio `2ⁿ/2ⁿ⁻¹=2`; `P=2` iff a.e. interval | true; `|s|>0` needed | N01 |
| §4.4 (`isoperimetric_frontier`) | ∅; punctured ball; ball minus rationals; ball complement; n=1, ∅ | `0≤0`; equality; right side ∞; volume ∞; `2≤0` false | true for n≥2 with finite volume | none |
| §4.5 regular open | punctured ball; closed ball | interior of closure is the ball, not regular; not open | regularity needed | none |
| §4.6 Lipschitz domains | unit square; ∅; one-sided chart at the pin | `4π<16`; frontier empty, definition vacuous, `0=0`; `{γ<t}` so regular open | true; nonempty needed | none |
| §5.1 total-variation Pólya–Szegő | ball indicator; two unit balls, plane; `t<0` | `nω_n rⁿ⁻¹` both; `2π√2≈8.89<4π`; both levels whole space, P=0 | true | none |
| §5.2 convex integrand | `(1−‖x−c‖)⁺`; Φ=t²; singular part of `μ_h` | equality; `P²/s` decreasing; image of `{v′=0}` null, derivative 0 a.e. | true | none |
| §5.3 (`exists_hasWeakFDerivOn_schwarzRearrangement`) | cone `(1−‖x−c‖)⁺`; ball indicator; n=1 | `∫‖G‖=∫‖U‖=ω_n`; excluded, no integrable weak derivative; `2 sup u ≤ ∫|u′|` | true | N01 |
| §5.4 radial profile | `(1−‖x‖)⁺`; `(‖x‖^(−α)−1)⁺`, `0<α<n−1`; n=1 | `nω_n∫₀¹rⁿ⁻¹=ω_n`; `r^(n−1−α)→0`; `r⁰v(r)→v(0⁺)≠0` | limit needs n≥2 | none |
| §5.5 (`eLpNorm_le_…`, `eLpNorm_eq_…_iff`) | `1_B`; `1_{B₁}−1_{B₂}`; `2·1_{B(0,1)}+1_{B(0,2)}`; `u=1`; ramps ε=0.1, 0.01, 0.001 | equal; ratio `2^(−1/n)`; `√(12π)≈6.14<4√π≈7.09`; `∞≤0` false, not integrable; 0.9844, 0.9983, 0.9998 | true; integrability needed | none |
| §6.1 Jordan curves | circle; doubled circle | `2πr=H¹`; variation `4πr`, not injective | true | none |
| §6.2 (`simple_closed_rectifiable_isoperimetric`, `_eq_iff`) | unit square; doubled circle; Cantor-reparametrized circle | `4π<16`; `4π²r²<16π²r²`; length 2π, area π, derivative integral π/2 | true; equality for the non-AC circle | C01 |
| §6.3 (`jordan_isoperimetric`, `_eq_iff`) | circle; rectangle a×b; L-hexagon | `4π·πr²=(2πr)²`; `4πab<4(a+b)²`; `12π<64` | true | C01 |
| §6.4 compatibility | unit circle; inside regular open | `P(ball)=2π=H¹`; closure is the filled hull, its interior the inside | both routes agree | none |

- **Source locators checked against the text (13):** Tao2011BrunnMinkowskiNilpotent lines 48–54; Volcic2009RandomSymmetrizations lines 39–47, 378–380, 411–416, 446–449; Tropp2018ConvexGeometry lines 70–76, 2892–2898, 3051–3055; CagnettiColomboDePhilippisMaggi2014 lines 95–149, 2620–2624; Burchard2009Rearrangement lines 1373–1374, 1415; BianchiGardnerGronchiKiderlen2022 lines 338–340, 1270–1280, 1610–1618, 1827–1830; FuscoMaggiPratelli2007SobolevBV lines 41–45; Wiedijk100 lines 409–420; Maggi2012 lines 82–84, 98–101 (contents only).
- **Library declarations opened at the pin (22):** among them `TauCeti/MeasureTheory/Measure/Lebesgue/Steiner/Perimeter.lean:177`, `Steiner/Basic.lean:55`, `Steiner/Ball.lean:156`, `Steiner/Moment.lean:116`; `TauCeti/Analysis/BoundedVariation/SmoothApproximation.lean:143`, `Isoperimetric.lean:468`, `Real.lean:325` and `:347`, `Coarea.lean:397`, `WeakDerivative.lean:240`, `Compactness.lean:229`, `TotalVariation.lean:100`, `Perimeter.lean:64`; `TauCeti/MeasureTheory/Measure/Lebesgue/EssentialConvexity.lean:280`, `Isodiametric.lean:200`; `TauCeti/Analysis/Sobolev/LipschitzDomain/Basic.lean:315`; `TauCeti/Topology/EMetricSpace/CurveLength.lean:173`; `TauCeti/Analysis/Fourier/IsoperimetricTrace.lean:234`; `TauCeti/Analysis/Green/Examples/CurveArea/Winding.lean:61`; `TauCeti/MeasureTheory/Integral/PrekopaLeindler.lean:114`; `TauCeti/MeasureTheory/Function/SchwarzRearrangement.lean:129` and `:138`. Every library name in code font resolves at the pins.
- **Cross-roadmap citations resolved (8):** GeometricMeasureTheory on main, G1 (line 118), G2 (lines 154–175), G5 (lines 255–269), G6 (lines 277–304) and the Cantor–Lebesgue example (lines 309–315), and its open revision, which keeps the labels G1–G6 by a former-numbering table; DifferentialGeometry 5.6; PDE §1.6; ConformalMapping §5.3. The consumers named (GaussianIsoperimetryAndClusters, Yamabe, PDE, RiemannianGeometry, ConformalMapping) cite the layers the README says they cite.
- **Automatic checks:** all passed; supplier-order check `0 problem(s)`; nothing changed outside the folder.
- **Elaboration:** nine `sorry` warnings only; one-tactic probes (`simp`, `rfl`, `infer_instance`) close none of the nine.
- **Counts in the description:** 50 Checks in 20 sections and 18 worked examples, recounted.

Overlap check: read GeometricMeasureTheory (main and its open revision), GaussianIsoperimetryAndClusters (main), Surfaces (main) and GeometricCurrents (main). The reduced boundary and outer normal are Tau Ceti's; De Giorgi's structure theorem, the frontier bound and the perimeter of a rectifiable Jordan domain are GeometricMeasureTheory's (G5, G6); the slicing theorem (§4.1) and the signed-area identification (§3.1) are owned here, and GaussianIsoperimetryAndClusters and GeometricMeasureTheory cite them. Surfaces and GeometricCurrents share nothing.

Source independence: 14 passages compared with 9 sources (§1.1, §2.2, §2.3, §4.1, §4.2, §4.3, §5.1, §5.2, §5.3, §5.5, §6.2, §6.3 and the docstrings of the rigidity and Sobolev statements), none shared beyond formulas and standard names; largest share Maggi2012, 6 of 22 locators; contents compared with Maggi2012 (chapters 14, 15 and 18 against Layers 2 and 4): independent. Maggi2012's text beyond its front matter could not be read.

Research link: Layers 2 and 4 follow De Giorgi's 1958 rigidity proof through Steiner's inequality and the equality analysis of Chlebík–Cianchi–Fusco (2005), as Cagnetti–Colombo–De Philippis–Maggi (2014, §1.2) recall it; Layer 5 is the Pólya–Szegő theory of Bianchi–Gardner–Gronchi–Kiderlen (2022) and the inequality of Fusco–Maggi–Pratelli (2007). Rests on the README and CCDM lines 128–136.

## Not verifiable

- Maggi2012, §14.1, §14.2 and §18.3: the open extract holds only the front matter and the contents; the section titles match (lines 83, 84, 101), the statements were not read.
- Tao2011BrunnMinkowskiNilpotent, Theorem 2: the extraction drops the displayed formulas; the form "avoiding dilations" was checked against the prose at lines 50–54.
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4, the source of CCDM's Theorem C: not opened.
- FuscoMaggiPratelli2007SobolevBV: the author preprint was read; its equation numbering was not compared with J. Funct. Anal. 244.

## Source issues

- none

## For the human reviewers

- **Licence.** The README (lines 1243–1253) cites three public formalizations as prior work: Humanfia's archive, `hojonathanho/isoperimetric` and `kim-em/isoperimetric`. They were not opened in this round; earlier reviews found the same inequality under other names and binders in the first and third.
- **Licence.** Maggi2012 was read from the cvgmt file `Maggi_extract.pdf`, which states no licence; the book is behind the publisher's paywall.
- **Not tested.** Maggi2012 has the largest share of locators (6 of 22). Its wording beyond the front matter could not be compared with the README; only the arrangement was compared, against its contents.
