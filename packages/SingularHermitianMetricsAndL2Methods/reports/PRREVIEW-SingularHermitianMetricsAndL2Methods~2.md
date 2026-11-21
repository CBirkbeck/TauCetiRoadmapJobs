# Review of SingularHermitianMetricsAndL2Methods (pull request #2884 at 13a1d61)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** needs changes

**Summary.** One finding blocks: 3.3(a) claims that X ∖ Z is complete Kähler for every weakly pseudoconvex Kähler manifold X and every closed analytic subset Z. Its source proves less, and the route of 4.2 relies on the global form. Every other sampled statement I checked against Demailly's two books, Demailly's 1982 paper and Berman's paper holds as written, and every Check value I recomputed is correct. There are eight small corrections: missing theorem-level locators, two Lean names attributed to a supplier that does not declare them, a second definition of Nakano positivity, a `*Needs:*` line, a Check whose numbers cannot be reproduced, two statements narrower than their sources, the description's validation sentence, and dangling links in the family index. There are no format notes. The human reviewers have one provenance question about the formal proof that the family cites.

## R01 (P2) — 3.3(a) claims that X ∖ Z is complete Kähler for every weakly pseudoconvex Kähler X and every closed analytic Z; its sources prove this only on relatively compact sublevel sets or for compact or Stein X

An implementer is asked to prove a global statement that its own source says needs a stronger hypothesis. Two other passages inherit it: the route of 4.2 ("on `X ∖ {s = 0}`, which carries complete Kähler metrics (3.3)", line 1232) and the parenthetical example of 3.5 ("X weakly pseudoconvex and Z arbitrary", line 882).

What the sources prove:
- Demailly1982, Théorème 1.5 (p. 464, line 282): X′ ∖ Z is complete Kähler for a relatively compact open set X′ ⋐ X that carries a complete Kähler metric. Remarque 1.6 applies this to the sublevel sets X(c).
- Lines 300–306 of the same paper: for a global result Demailly says a stronger hypothesis is needed. His Proposition 1.6 assumes an exhaustion that is strictly plurisubharmonic outside a compact set, which gives the compact and Stein cases of Théorème 0.2 (p. 458, line 66).
- The paper handles X ∖ Z as an increasing union of complete manifolds (line 122) and never proves the global form.
- DemaillyCADG Lemma VIII.7.2 (p. 380, line 18596) is likewise stated for X_c ∖ Y. It gives X ∖ Y only when X is already complete and the curvature of the defining bundle is bounded.

The route of 3.3(a) leaves open the step these sources avoid. It chooses the terms `−ε·i∂∂̄log(−log|g|²)` sublevel set by sublevel set and "patches with `χ(ψ)`". But `i∂∂̄χ(ψ)` is only semipositive when ψ is weakly plurisubharmonic, so it cannot absorb the negative curvature that the cut-offs between sublevel sets introduce.

The smallest change is to restate 3.3(a) as follows: for every c, `X_c ∖ Z` carries a complete Kähler metric `≥ ω`; X carries one; and X ∖ Z carries one when the exhaustion is strictly plurisubharmonic outside a compact set, in particular for X compact or Stein (Demailly1982, Th. 1.5, Rem. 1.6 and Prop. 1.6, p. 464). Then:
- in 3.5, replace the parenthetical by these cases;
- in 4.2's route, solve on `X_c ∖ {s = 0}` and let `c → ∞`, as Demailly's own proof does (DemaillyAMAG, proof of Th. 13.6, p. 129, line 6450).

8.1's route already works on `X_c` and is covered by Théorème 1.5 as it stands.

## C01 — Theorems cited without proof carry no theorem or page locator

The References attribute whole works to ranges of layers ("chapters I, III, V, VIII: Layers 0–3"), and only 4.1 gives a theorem number. For the targets whose proof is "not given here" (1.2(a) for `n ≥ 2`, 4.2, 6.6, 7.3, 7.4), an implementer is sent to a whole book. 9.5 cites no source at all. 0.4 (quasi-plurisubharmonic and γ-plurisubharmonic functions, `L¹`-compactness) is attributed to DemaillyCADG chapter I, but the book never mentions quasi-psh or almost psh functions.

Locators I checked at the text:
- 0.3: CADG I, Th. 5.5, 5.8, 5.11 (pp. 39–40).
- 0.5: CADG I, Def. 5.22 and Th. 5.24 (pp. 44–45).
- 2.2: AMAG Def. 1.10 (p. 8).
- 2.3: AMAG (3.11) (p. 26).
- 4.2: AMAG Th. 13.6 (pp. 125–126).
- 7.1: AMAG Th. 14.2 (p. 136).
- 7.2: AMAG Cor. 14.3 (p. 138).
- 7.3: AMAG Th. 14.12 (p. 142, compact X).
- 8.1: AMAG Cor. 5.3 (p. 35).
- 8.2: AMAG Th. 5.11 (p. 39).
- 8.3: AMAG Cor. 5.12 (p. 40).
- 8.4: AMAG Th. 13.6 with Cor. 13.9 (p. 132; the domain case).
- 9.3: Berman 2004, Th. 1.1 with `q = 0` (p. 3).
- 9.5: AMAG Def. 6.16(d) with Th. 6.17(b) (pp. 46–47).

Adding these, and the theorem numbers of Skoda 1972, Guan–Zhou 2015 and Demailly 1992 for 1.2, 6.6 and 7.4, would let each cited target be found in minutes.

## C02 — Two Lean names are attributed to MultiplierIdealsOfPairsAndPointSeparation, which declares neither

The README attributes `multiplierIdealOfPair` (§9.10b) and `nadelVanishingPair` (§9.10c) to that roadmap (lines 1462, 1495, 2116, 2471). At that roadmap's head, §9.10b defines `J(X, Δ)` and §9.10c proves Nadel vanishing for pairs, but neither its README nor its `Suggested.lean` uses these names; they occur only in this README. A reader who searches for them finds nothing. Would you cite the objects in prose ("the multiplier ideal `J(X, Δ)` of §9.10b", "Nadel vanishing for pairs, §9.10c"), or have that roadmap adopt the names?

## C03 — 3.2a's notation defines Nakano positivity, which ComplexKahlerGeometry K6.0 already defines

K6.0 on main says "Define Nakano positivity by its Hermitian form on `T^(1,0)M⊗E`" and proves the eigenvalue calculation on `(n,k)`-forms. 3.2a's notation paragraph (lines 765–770) defines the Nakano form and Nakano semipositivity a second time. Would you cite K6.0 for the Nakano form, and keep the Griffiths form, which is this roadmap's own?

## C04 — 1.2's route for `n ≥ 2` uses 4.1, which its `*Needs:*` line omits

The route ("One way to see it", line 462) extends `1` along a flag by the Ohsawa–Takegoshi theorem 4.1, but the `*Needs:*` line (line 473) lists only 0.3a, 1.1 and ComplexHessianEquations Layer 7. Adding 4.1 creates no cycle, since 4.1 needs only 0.1–0.3, 3.1 and 3.2. Alternatively, say that this route is an alternative to the cited proof of Skoda.

## C05 — The fifth Check of 7.4 gives numerical values for a function it leaves unspecified

The Laplacian values `−6.5·10^{−3}` and `−6.5·10^{−5}` at `d = 10^{−2}, 10^{−3}` (line 1730) are given for "a smooth compactly supported radial function equal to `|z|²` near `0`". At leading order the Laplacian is `−(24/π)·d²·∫f` for the kernel `ρ ∝ (1 − |w|²)²` (expand `ρ(du/r)` and integrate `Δf` against `|u|²` and `|u|⁴`), so it depends on `∫f`. Would you name `f`, or keep only the order `O(d²)`, which is what the Check needs?

## C06 — Two statements are narrower than their sources: 2.2 requires the coefficient c to be rational, and 8.2 requires a constant ε

DemaillyAMAG Def. 1.10 (p. 8) allows any real `α ≥ 0`, and every statement proved in 2.2 (polar set, smoothness off `V(g_j)`, Lelong number `2c·min_j ord_x g_j`) holds for real `c`. Rationality is needed only in 6.3, which states it as its own hypothesis.

Likewise, DemaillyAMAG Th. 5.11 (p. 39) proves Nadel vanishing on a weakly pseudoconvex Kähler manifold under `iΘ_h ≥ εω` for a continuous positive function ε, whereas 8.2 asks for a constant (the two agree on compact X).

Would you allow real `c ≥ 0` in 2.2 and a continuous positive ε in 8.2?

## C07 — The description's validation sentence describes an earlier head

The description's validation sentence says that one of the repository's automatic checks fails, the one that flags files changed outside the roadmap folder (it lists the three files of the family index), and that the build of `Suggested.lean` warns only about `sorry`. At this head every automatic check passes, since the family index's files belong to this pull request, and the file declares nothing, so it builds with no warning at all. A reader who trusts the sentence looks for a failure and for sorried statements that are not there. Suggested text: "Validation at this head: every automatic check passes; the targeted Lake build succeeds without warnings (`Suggested.lean` declares nothing); the dependency check reports no upward or cyclic edge."

## C08 — The family index links to 40 sub-roadmap folders that are neither on main nor in this pull request

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` links 41 subfolders. Only this roadmap's folder is present at this head, and main has no folder of the family. Merged as is, the index on main would point at missing folders until the other pull requests land (39 of them after MultiplierIdealsOfPairsAndPointSeparation). Would each copy of the index list only the sub-roadmaps that are on main or in that pull request, with each later pull request adding its own line?

## Questions for the author

- The References say that the formal proof "proves 7.8 ... in this form" and constructs the almost monotone regularisations of 7.7's second route. Which files and declarations are they? I could not open the cited repository from a host I can classify as a legal source. The announcement's footnote points to archive parts on the author's site, not to that repository.

## Verified sound

| Statement | Instances tried | README side | Source or computation | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 0.3 regularisation, distributional characterisation | `log|z|` mollified; `log|z₁|+log|z₂|` | `u_ε(0)` finite; `i∂∂̄T = π([z₁=0]+[z₂=0])` | CADG I Th. 5.5, 5.8, 5.11; `u_ε(0) = log ε − 11/12` for `ρ ∝ (1−|w|²)²`; `i∂∂̄log|z| = πδ₀` | holds | locator (C01) |
| 0.4 quasi-psh, `PSH(X,γ)` | `u_a` on ℙ¹; `f_j = 2^{−j}(3+cos 4^j x)`; `a − √(x²+a²)` | `sup u_a = log(1+|a|²)`; `∂²f_j(0) = −2^{3j}` | Cauchy–Schwarz gives `1+|a|²`; `f_j ≥ 2^{1−j} ≥ f_{j+1}`; second derivative `−2^{−j}16^j` | holds | source attribution (C01) |
| 0.5 pluripolar sets, extension | segment; disconnected witness | capacity `ℓ/4`; connected neighbourhood required | CADG I Def. 5.22 requires a connected W; Th. 5.24 | holds | locator |
| 2.2 analytic singularities | `log max(|z₁|²,|z₂|²)`; `log|z|² − |Re z|` | `ν = 2 = 2c·min ord` | AMAG Def. 1.10 (real α) | holds | real c (C06) |
| 2.3 Poincaré–Lelong, singular h | `h = 1/|s|²` | `c₁ = [div s]` | AMAG (3.11) with `dd^c = (i/π)∂∂̄`; linear in φ | holds | locator |
| 3.3 complete metrics off Z | `ℙ²∖pt`; punctured disc | (a) global for weakly pseudoconvex X | Dem82 Th. 1.5 only relatively compact; Prop. 1.6 strictly psh outside a compact | (a) overclaim; (b) holds | R01 |
| 3.5 estimate off Z | `ℙ²∖pt`, `Z = ∅` | example "X weakly pseudoconvex, Z arbitrary" | depends on 3.3(a) | statement holds; example overclaims | R01 |
| 6.3 algebraic comparison | `(x²)`, c = ½; `(xy)`, 1; `(x,y)`, 1 | `(x)`; `(xy)`; `O` | `⌊cD⌋` computation; AMAG Rem. 5.9 log-resolution formula | holds | — |
| 7.2 Siu | `T = [D]` | `E_c` = components and points of multiplicity `≥ c` | AMAG Cor. 14.3; `ν(φ_m) ≥ 2c − 2n/m ⇔ ord σ ≥ m(2c−2n/m)/2` | holds | — |
| 7.7 log-log regularisation | Check 4 on ℙ¹; `|z₁|^{1/2} + Re z₂` | `φ_t(D) = −1/t + o(1)`; loss 0 | `i∂∂̄φ_t ≥ −γ/(e+L_t)`; `Δr^{1/2} = r^{−3/2}/4` | holds | Demailly 1992 not read |
| 7.8 energy, boundary mass | model weight; ℙ¹ with `u_b` | mass `1/log(1/ρ)`; `Σ(j+1)(j+2)2^{−j} = 16`; mass ½ on `|z| ≤ b` | `r f′(r)/2 = 1/log(1/r²)`; `2/(1−½)³ = 16`; `b²/(2b²) = ½` | holds | — |
| 8.4 OT with psh weight on Stein | `φ_k ↓ φ` smooth | hypotheses of 4.2 kept; `e^{−φ_k} ≤ e^{−φ}` | AMAG Th. 13.6, Cor. 13.9 (domain case) | holds | locator |
| 9.3 local Morse bound | model weight with some `λ_j ≤ 0` | limit 0 | `∫_{|w|<R}e^{−Σλ_j|w_j|²} → ∞`; Berman Th. 1.1, `q = 0` | holds | locator |
| 9.4 singular h, smooth locus | peak sections at `x ∈ U` | `k^{−n}B → c₁^n/(n!dV)` | curvature `≥ (kδ − C)ω`; datum supported in U | holds | Ma–Marinescu not read |
| 9.5 big iff Kähler current | blow-up of ℙ² at a point, `H+E` | `L·E = −1`, big | AMAG Def. 6.16(d), Th. 6.17(b) | holds | no source cited (C01) |
| 9.6 Poincaré-type Bergman | Fano with KE metric, trivial L | `B ≡ 1/vol` | flag OT constant `(πr²)^n`; `‖s‖² ≤ C r^{2n}(1 + 1/(kεr²))` | holds | — |
| Headline 8.1 | `φ = |z|² + log|z|²` on ℂ | `ε = 1`, `u(0) = 0` | AMAG Cor. 5.3, constant `1/(qε)`, weight `e^{−φ}` | holds | — |
| Headline 6.2/8.2 Nadel | ℙ¹, `h_FS^{1−a}|s|^{−2a}` | `a<1`: `H¹(O(−1)) = 0`; `a=1`: `H¹(O(−2)) = ℂ` | `ν = 2a < 2 ⇒ J = O`; `J = O(−p)` at `a = 1` | holds | — |
| Headline 4.1/4.2 OT | polydisc; disc of radius r; `s = z/e` on disc | constant π; `πr²`; `C₁ ≥ 4π` | `G = log(|w|/r)`; `2e²|c|²·2π·∫_0^∞(1+t)^{−2}dt / (e²|c|²) = 4π` | holds | 4.2 route (R01) |
| Headline 9.1/9.2 Bergman | Fock `φ = k|z|²`; ℙ¹ `O(k)` | `B = k/π`; `B_k = k+1` | `∫|f|²e^{−k|z|²}` basis; `∫B dV = h⁰` | holds | — |
| 1.2 Skoda integrability | `c log|z₁|²`, `c log|z|²` | integrable iff `c < 1`, resp. `c < n` | radial exponents `−2c > −2`, `2n−1−2c > −1` | holds | `*Needs:*` (C04) |
| 7.4 Check 5 | `ρ ∝ (1−|w|²)²` | `−6.5·10^{−3}` at `d = 10^{−2}` | `−(24/π)d²∫f`, depends on f | unreproducible | C05 |
| 3.2a Skoda inequality | `g = (1, z₁, z₂)` at 0 | `|tr M|² = 4 = 2‖M‖²` | `b_j = e_{j+1}`, rank 2 | holds | Nakano notation (C03) |

- Source locators checked against the text: 27 (CADG 7, AMAG 14, Demailly1982 5, Berman 1). They cover every sampled target except 7.7, 7.8, 9.4 and 9.6, whose sources could not be read.
- Library declarations opened at the pins: Mathlib `Distribution` (`Analysis/Distribution/Distribution.lean:166`), `TestFunction` (`Analysis/Distribution/TestFunction.lean:67`), `circleAverage` (`MeasureTheory/Integral/CircleAverage.lean:55`), `RiemannHypothesis` (`NumberTheory/LSeries/RiemannZeta.lean:185`); no subharmonic functions anywhere in Mathlib. Tau Ceti `SubharmonicOn` (`Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `leviForm` (`Analysis/Complex/LeviForm.lean:119`), `IsStrictlyPlurisubharmonicAt` (`Analysis/Complex/Pseudoconvex.lean:82`), `IsManifoldStrictlyPlurisubharmonicAt` (`Geometry/Manifold/Complex/LeviForm.lean:343`), `holomorphicStructureSheaf` (`.../StructureSheaf/Basic.lean:68`), `delBar` (`.../Dolbeault/Basic.lean:95`), `planarGreenKernelDisk` (`Analysis/PDE/GreenFunction/Disk.lean:35`), the two sub-mean-value lemmas (`MeasureTheory/Integral/SubMeanValue.lean:117, 129`). Tau Ceti has no psh functions with value −∞, no pseudoconvex domains and no Bergman spaces, so the docstring's statability claims hold.
- Cross-roadmap citations resolved: ComplexComparisonPartII C-1.1, C0, C1.3, C1.4, C1.5, C2.2, C5.4 and all nine named declarations; ComplexKahlerGeometry K2, K3, K3.0, K4, K5a, K6.0, K7.2; RealAnalyticGeometry R3.0, R3.1; ComplexHessianEquations §§5.4, 7.1; CharacteristicClasses C4.1, C4.2; AlgebraicModuliForArithmeticGeometry §1.6 `bigLineBundle`, §9.10 `algebraicMultiplierIdeal`; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2, 7.7; ArakelovGeometryAndAbelianHeights §5.1; MultiplierIdealsOfPairsAndPointSeparation §§9.10b, 9.10c at its head (names: C02). Downstream sections DiscreteSeries… §§10.1–10.2, ProjectiveModels… §6.2a, ArithmeticVolumes… §8.18a, HeightsForLogSingularMetrics §§0.4, 4.3a, 14.1, BallQuotients… §9.1 all exist.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line. Suppliers on main or earlier in the merge order; MultiplierIdealsOfPairsAndPointSeparation is named in the description's merge order.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check @name` comparison and the one-tactic padding probe had nothing to test. There is a single `import Mathlib`, no `set_option` and no sorry'd data.
- Headline theorems: 8.1, 6.2 with 8.2, 4.1 with 4.2, and 9.1 with 9.2. None is statable at the pins: each needs psh weights with value −∞, singular metrics, `L`-valued forms, coherent analytic ideal sheaves, the Green function and capacity of a planar domain, or Bergman spaces. The docstring names each with its missing carriers.
- Automatic checks: all passed at this head; none set aside.
- Overlap check: I read HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and RealAnalyticGeometry (open), and ComplexHessianEquations, ComplexComparisonPartII and ComplexKahlerGeometry (main). Shared objects and their owners:
  - the C² exponential-integrability and `L¹` bounds belong to ComplexHessianEquations §§5.4 and 7.1, and are cited;
  - the local convolution of psh functions and Skoda–El Mir belong to ComplexComparisonPartII C5.4, and are cited;
  - the smooth-weight `∂̄` theorem on complete Kähler manifolds belongs to RealAnalyticGeometry R3.1 and ComplexComparisonPartII C1.4, and is cited;
  - Nakano positivity belongs to ComplexKahlerGeometry K6.0 and is restated here (C03);
  - multiplier ideals of pairs belong to MultiplierIdealsOfPairsAndPointSeparation §9.10b, and are cited;
  - log-log metrics on arithmetic varieties belong to HeightsForLogSingularMetrics §0.4, which consumes 7.7 and 7.8.
  Ownership was also checked against the 163 listed open pull requests and the roadmap search tool, by object (Lelong numbers, multiplier ideals, Ohsawa–Takegoshi, Nadel, Skoda, Bergman kernels, good metrics, log-log metrics, Hörmander): no second owner.
- Source independence: 19 passages compared with 4 sources (the 14 sampled locators, the definitions of 0.1 and 6.1, the Lelong-number convention, and the routes of 7.1 and 8.2 against the proofs of AMAG Th. 14.2 and 5.11). None reproduces source wording beyond what the statements force. 4.2 lists the hypotheses of AMAG Th. 13.6 in the same order (about 11 consecutive words shared, a hypothesis list that can be written in one way only). The largest share is DemaillyCADG: the References attribute Layers 0–3 and 7.2 to it, 29 of 60 subsections; almost no in-text locators exist. Contents compared with CADG (chapters I, III, V, VIII; the README moves OT after Skoda, against CADG VIII §§7, 9, and adds Layers 2 and 4–9) and with AMAG (§§1–6, 12–14; the README splits multiplier ideals from Nadel and inserts Layers 5 and 9): independent. The order of Layers 0–3 is forced by the `*Needs:*` lines (1.1 needs 0.x; 2.1 needs 0.1–0.4; 3.x need 0–2).
- Research link: Layers 4, 6 and 8 hold the Ohsawa–Takegoshi theorem with Błocki's optimal constant (2013), Guan–Zhou's strong openness (2015) and Nadel vanishing (1990). Layer 9 holds the Bergman asymptotics of Tian (1990) and Berman (2004). 7.7–7.8 feed the arithmetic intersection theory of log-log singular metrics (HeightsForLogSingularMetrics). This rests on the README's References and Downstream consumers.

## Not verifiable

- Demailly 1992 (*Regularization of closed positive currents*; 7.3, 7.4, 7.7): no legal copy found. AMAG Th. 14.12 was used for 7.3.
- Błocki 2013 (4.1, 4.3): no legal copy found; Theorem 1 and its constant were not checked at the text.
- Demailly 2000 (*On the Ohsawa–Takegoshi–Manivel L² extension theorem*): no copy found; AMAG Th. 13.6 was used for 4.2.
- Siu 1974: paywalled (recorded uncertified). AMAG Cor. 14.3 was used for 7.2.
- Ma–Marinescu 2007, chapter 6 (9.4, 9.6) and Lazarsfeld, *Positivity II*, chapter 9 (6.3): paywalled books, not opened.
- [FormalProof] repository: its host is not a recognised legal source; not opened.

## Source issues

- **Gap** in DemaillyAMAG at Remark 5.17, p. 41: the source says the complement of a proper analytic subset of a weakly pseudoconvex Kähler space is complete Kähler, citing Demailly 1982; it should say this holds on relatively compact sublevel sets, or for compact or Stein spaces (Demailly 1982, Th. 1.5, Prop. 1.6); affects a stated result.

## For the human reviewers

- Provenance: the family index and the References cite a formal proof of the Riemann hypothesis announced 20 November 2026. The announcement (Announcement, 4 pages) contains no mathematics. 7.8 "in this form" and the second route of 7.7 rest on that proof, which I could not open.
- Licence: the cited repository's host could not be classified and its licence was not read. The announcement points to archive parts on the author's site, not to that repository.
