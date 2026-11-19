# Review of Isoperimetry (pull request #2597 at aeab290)

**Verdict:** accepted

**Summary.** Accepted, with no findings, no small corrections and no format notes. The repair fixes both degenerate-case sentences of the earlier P2 finding: they are now true, including in dimension one and in codimension two. It also fixes all four earlier small corrections and the format note. The new locators say what the text attributes to them: Tao's Theorem 2, Cufí–Verdera's Theorem, Bianchi–Gardner–Gronchi–Kiderlen's Theorem 6.3, Fusco–Maggi–Pratelli's (1.4) and Wiedijk's entry 43. Tau Ceti's reduced boundary and outer normal are cited with the properties the pin proves. For the humans, the licence questions of the earlier review remain: two public formalizations and the Maggi extract.

## Previous findings

- R01 — repaired: line 181 now reads "Nonemptiness cannot be dropped when the other set has positive volume". Lines 293–295 now read "neither the perimeter `0` nor the boundary area `Hⁿ⁻¹(K)`; when its affine span has dimension at most `n − 2`, the derivative, the perimeter and `Hⁿ⁻¹(K)` all vanish".
- C01 — repaired: the new locators are §1.1 "Tao's exposition, Theorem 2", §3.1 "Cufí–Verdera, the Theorem of §1 applied to `f(z) = z̄`", §5.4 "(Bianchi–Gardner–Gronchi–Kiderlen, Theorem 6.3)", §5.5 "(Fusco–Maggi–Pratelli, §1, inequality (1.4) and its equality case …)" and §6.4 "(Wiedijk's entry, …)".
- C02 — repaired: line 424 now reads "measure-theoretic outer normal, Tau Ceti's `TauCeti.reducedBoundary volume ⊤ s` and `TauCeti.outerNormal volume ⊤ s`". The Tau Ceti contracts list both carriers (lines 1091–1095), and G5 keeps only the structure theorem.
- C03 — repaired: lines 641–644 now read "G5's bound `P(E) ≤ Hⁿ⁻¹(frontier E)` applied to the open set `{h > t}`, whose frontier lies in `{h = t}` because `h` is continuous". The G5 contract (lines 1166–1169) says the same.
- C04 — repaired: the description now reads "ball rigidity for every Lebesgue-measurable set of finite positive volume (equality only for sets agreeing a.e. with a ball)".
- N01 — repaired: §4.1 (line 433), §4.2 (lines 460–461) and the G2 contract (line 1164) now speak of "the tangential area formula" for the projection onto `e⊥`.

<details><summary>What was checked</summary>

**Changed passages:** §1.1, the Layer 1 examples, §2.3, §3.1, §4.1, §4.2, §5.2, §5.4, §5.5 and §6.4. Also the overview's supplier sentence, the scope lists, the Tau Ceti, G2 and G5 contracts, and the new references. Each new locator was read at its place in the source. Each new library claim was opened at the pinned Tau Ceti. Each changed G2/G5 attribution was read in GeometricMeasureTheory on main.

**Automatic checks:** every check passed on this head. The supplier-order check finds no upward citation and no cycle: every supplier (GeometricMeasureTheory, DifferentialGeometry, PDE, ConformalMapping) is on main. The pull request changes nothing outside the roadmap folder.

**Lean:** `Suggested.lean` has not changed since dd8a03c. It elaborates at the pins with nine `sorry` warnings and nothing else. The previous review's `#check` comparison and one-tactic probe still apply.

**Pull request text:** the description agrees with this head. This includes its list of locators, its list of GeometricMeasureTheory sections (G1, G2, G5, G6), the reduced boundary listed among the inputs at the pin, and its count of 50 Checks in 20 sections and 18 worked examples (recounted).

**Not verifiable:** the theorem statements inside Maggi's book (only its front matter is open). The displayed formulas of Tao's Theorem 2, which the HTML extraction drops. Barchiesi–Cagnetti–Fusco's Theorem 2.4. Whether the published equation numbering of Fusco–Maggi–Pratelli matches the preprint.

</details>

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 1 example, nonemptiness (line 181) | `A=∅, B=ball 0 1` in ℝ²; `A=∅, B={0}`; `A=∅`, `B` a segment | `0 ≥ √π ≈ 1.77` fails; `0 ≥ 0` holds; `0 ≥ 0` holds | true as now scoped to positive volume | none |
| §2.3 empty-interior remark (lines 291–295) | segment `ℓ` in ℂ; point in ℂ; unit disc in a plane of ℝ³; point in ℝ | derivative 2ℓ, P=0, H¹=ℓ; 0=0=0; 2π, 0, π; 2, 0, H⁰=1 | true, including n=1; `μHE` normalization (`Parallel.lean:206`) | none |
| §1.1 Tao Theorem 2 locator | Tao's form `h(x+y)`, θ=½, n=1; rescale `F(x/(1−θ))`, `G(y/θ)` | factor `(1−θ)^{−n(1−θ)}θ^{−nθ} = 2` cancels `∫f=(1−θ)ⁿ∫F`, `∫g=θⁿ∫G` | equivalent for 0<θ<1; endpoints separate | none |
| §3.1 Cufí–Verdera with `f(z)=z̄` | unit circle once, reversed, twice | `∮z̄dz = 2πi = 2i·π`; `−2πi`, Ind −1; `4πi`, Ind 2 | true; `∂̄z̄ = 1 ∈ L²(D)`, D bounded; double circle not simple | none |
| §4.1 Tau Ceti carriers | `(a,b) ⊂ ℝ`; unit disc in ℂ, `e=1` | `Dχ=δ_a−δ_b`, σ(a)=1, ν(a)=−1, ν(b)=1; section boundary ±√(1−y²), ν₁=±√(1−y²) | sign outward; agrees with §4.1 Check | none |
| §4.2 route, tangential area formula | unit disc, `e=1`, `G=e⊥` | `∫_{−1}^{1} 2(1−y²)^{−1/2} dy = 2π = P(disc)` | equality for a set equal to its symmetral | none |
| §5.2 route and G5 contract, `frontier {h>t} ⊆ {h=t}` | `(1−‖x‖)⁺` in ℝ², t=½; `min(1,(2−‖x‖)⁺)`, t=1 and t=½ | P=π=H¹(sphere ½); P(∅)=0 ≤ H¹(closedBall 0 1)=∞; P=3π=H¹ | true; inclusion can be strict | none |
| §5.4 corollaries via BGGK Thm 6.3 | Φ(t)=t, `u=(1−‖x‖)⁺` in ℝ²; ball indicator | `∫‖∇u*‖ = π = ∫‖∇u‖`; indicator not `W¹,¹_loc`, jump mass 2π on circle | `W¹,¹_loc` membership excludes singular parts | none |
| §5.5 FMP (1.4) | `f=1_{B_r}` in ℝ²; `a=0` | `2√π·(πr²)^{1/2} = 2πr = ‖Df‖`; FMP admits a=0, README treats zero separately | consistent with §5.5 | none |
| §6.4 Wiedijk entry 43 | circle radius r; unit square | `πr² = (2πr)²/(4π)`; `1 < 16/(4π) ≈ 1.27` | entry states inequality and circle equality, as both routes reach | none |
| Tau Ceti reduced-boundary contract (lines 1091–1095) | `norm_outerNormal`, `ae_mem_reducedBoundary`, Gauss–Green at the pin | unit on ∂*s; \|Dχ_s\|-a.e. in ∂*s; Gauss–Green needs local integrability and locally finite variation | as stated | none |
| G2 and G5 contracts (lines 1164–1169) | GeometricMeasureTheory main lines 166–168, 177, 256–262, 267 | tangential area formula; graph surface measure; structure theorem; `P(E) ≤ Hⁿ⁻¹(frontier E)` for measurable E | as stated; open revision states structure theorem for `TauCeti.reducedBoundary` | none |
| Description opening (C04) | complement of a ball; punctured ball | finite perimeter, infinite volume, outside the text; equality, a.e. a ball | wording now matches §4.3 | none |

The rows for statements this change does not touch, including all nine Lean declarations, stand as in the previous review of dd8a03c.

- **Source locators checked against the text (6):** Tao2011BrunnMinkowskiNilpotent lines 48–54 (Theorem 2 and its dilation-free form); CufiVerdera2015GreenFormula lines 29–36 (the Theorem of §1); BianchiGardnerGronchiKiderlen2022 lines 1610–1618 (Theorem 6.3) and line 35 (the class V(ℝⁿ)); FuscoMaggiPratelli2007SobolevBV lines 41–45 ((1.4) and its equality statement); Wiedijk100 lines 409–420 (entry 43).
- **Library declarations opened at the pin (8):** `Analysis/BoundedVariation/ReducedBoundary.lean:95`, `:106`, `:139`, `:255`, `:261`, `:271`; `Geometry/Euclidean/Volume/Parallel.lean:206` and `:226`.
- **Cross-roadmap citations resolved:** GeometricMeasureTheory on main, G2 (lines 154, 166–168, 177) and G5 (lines 256–262, 267). GeometricMeasureTheory's open revision, lines 101 and 708–722: its structure theorem is stated for `TauCeti.reducedBoundary`. GaussianIsoperimetryAndClusters on main, lines 91 and 115: its contract with §4.1 agrees with this head.
- **Automatic checks:** all passed on this head when re-run. Supplier-order check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The pull request changes nothing outside the folder.
- **Elaboration:** `Suggested.lean` is byte-identical to dd8a03c and gives nine `sorry` warnings only.
- **Counts in the description:** recounted at 50 Checks in 20 sections and 18 worked examples.

Overlap check: I read GeometricMeasureTheory (G2 and G5 on main, and the reduced-boundary targets of its open revision) and GaussianIsoperimetryAndClusters (main, its contract with this roadmap). For Surfaces, GeometricCurrents and ConformalMapping, the previous review's reading stands, since this change touches nothing they own. The owners of the shared objects are as follows. The reduced boundary and the outer normal are Tau Ceti's at the pin. De Giorgi's structure theorem and `P(E) ≤ Hⁿ⁻¹(frontier E)` are GeometricMeasureTheory G5's. The slicing theorem (§4.1) is owned here, and GaussianIsoperimetryAndClusters cites it. Nothing else is shared.

Source independence: changed passages only. I compared 8 passages with 5 sources: §1.1 and the Tao reference with Tao lines 48–54; §3.1 and the Cufí–Verdera reference with lines 10–36; §5.4 with BGGK lines 1610–1618; §5.5 and the FMP reference with FMP lines 8–9 and 41–69; §6.4 with Wiedijk lines 409–420. None shares more than two consecutive words beyond formulas and standard names. The Tau Ceti contract paraphrases the pinned library's own docstring. Largest share: Maggi2012, 6 of 22 in-text locators. No layer was added, removed or reordered, so the contents were not compared again; the previous review found them independent of Maggi2012.

Research link: Layers 2 and 4 formalize De Giorgi's 1958 rigidity proof through Steiner's inequality and the analysis of its equality cases by Chlebík–Cianchi–Fusco (2005), as Cagnetti–Colombo–De Philippis–Maggi (2014, §1.2) recall it. Layer 5 is the Pólya–Szegő theory of Bianchi–Gardner–Gronchi–Kiderlen (2022). GaussianIsoperimetryAndClusters and Yamabe use §4.1 and §5.2. This rests on the README and CCDM lines 128–136.

## Not verifiable

- Maggi2012: the theorem statements behind §2.1, §4.1 and §4.3–§4.6. The open cvgmt extract holds only the front matter; the sections were checked against the table of contents in the previous review.
- Tao2011BrunnMinkowskiNilpotent: the HTML extraction drops the displayed formulas of Theorem 2. The "form that avoids dilations" was checked against the prose at lines 50–54 and by rescaling.
- Barchiesi–Cagnetti–Fusco 2013, Theorem 2.4, the source of CCDM's Theorem C: not opened.
- FuscoMaggiPratelli2007SobolevBV: the cvgmt author preprint was read. I did not check that its equation numbering matches J. Funct. Anal. 244.

## Source issues

- none

## For the human reviewers

- **Licence.** `kim-em/isoperimetric` (Apache-2.0, `Isoperimetric/Statement.lean`, `ClassicalIsoperimetric`) states the same inequality and circle-equality iff as `simple_closed_rectifiable_isoperimetric` and `_eq_iff`, on `[0, 1]` rather than `[a, b]`, under other names. The README cites it as prior work.
- **Licence.** Humanfia's `problems/isoperimetric_inequality/Challenge.lean` (`isoperimetric`, no licence header) has the same `μHE[n − 1] (frontier _)` bound as `isoperimetric_frontier`. The name, binders and hypotheses differ: bounded measurable sets in `E n` there, finite volume here.
- **Licence.** Maggi2012 was read from the cvgmt extract `Maggi_extract.pdf`, which states no licence. The book itself is behind the publisher's paywall.
- **Not tested.** Maggi2012 has the largest share of locators. Its wording beyond the introduction could not be compared with the README; only the arrangement was compared, against its table of contents.
