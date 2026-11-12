# Review of Yamabe (pull request #2248 at 9711109)

**Verdict:** needs changes

## R01 (P2) — Y4.1 claims the scalar normalization at every order N

**Location:** `TauCetiRoadmap/Yamabe/README.md` 4.1, lines 798–801: "For any pole and prescribed finite order N construct a positive global conformal factor … `det g=1+O(r^N)`. Prove … vanishing scalar/first scalar derivative at the pole".

**Claim:** At orders below 5 the scalar conclusions are false, and Lee–Parker's Theorem 5.1 gives them only for N ≥ 5. The target is missing this hypothesis.

**Witness:** Take the unit S³ with factor 1 and N=2. Then `det g=(sin r/r)⁴=1−2r²/3+O(r⁴)` (4.1's own Check), yet Scal(p)=6≠0. LeeParker1987 lines 875–880 (p. 58) give `Scal=O(r²)` and the Weyl identity only when N≥5.

**Repair:** Lines 798–802: replace with "For any pole and prescribed finite order N≥2 construct a positive global conformal factor, normalized at the pole, for which geodesic normal coordinates have `det g=1+O(r^N)`. Prove the transformation of the curvature jets and, for N≥5, that `Scal=O(r²)` at the pole, so that Scal and dScal vanish there, with the contracted second scalar derivative/Weyl-norm identity with the sign converted to Δ⁺ (Lee–Parker, Theorem 5.1, p. 58)." In the Check at line 815, replace "After normalization" with "After normalization with N≥5,".

## R02 (P3) — GeometricMeasureTheory G3 is cited for a change of variables it does not contain

**Location:** README lines 76–77: "GeometricMeasureTheory G2–G3 own the area and change of variables formulas". The contract at lines 297–298 has the same, and "G2–G3" recurs at lines 423, 508, 671 and 713.

**Claim:** G3 is distributional BV. The area formula, spherical surface measure and polar integration are all in G2, so the contract assigns G3 statements it does not make.

**Witness:** `TauCetiRoadmap/GeometricMeasureTheory/README.md` line 183 heads G3 "Distributional BV and variation measures". Lines 158–181, in G2, state the area and coarea formulas, spherical surface measure and polar integration.

**Repair:**
- Lines 76–77: "[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) G2 owns the area formula, spherical surface measure and polar integration."
- Lines 297–298: "[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) G2: the area and coarea formulas, spherical surface measure and polar integration, for spherical and stereographic integration."
- Replace "G2–G3" with "G2" at lines 423, 508, 671 and 713.

## R03 (P3) — The Mathlib contract names the wrong file for two carriers

**Location:** README lines 134–137: "`Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`, `IsContinuousRiemannianBundle` and `IsRiemannianManifold` (`Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`, `Mathlib/Geometry/Manifold/Riemannian/Basic.lean`)".

**Claim:** Neither listed file declares `Bundle.RiemannianBundle` or `IsContinuousRiemannianBundle`.

**Witness:** At the pinned Mathlib, `class RiemannianBundle` is at `Mathlib/Topology/VectorBundle/Riemannian.lean` line 420 and `class IsContinuousRiemannianBundle` at line 60 of the same file.

**Repair:** Replace the parenthesis with "(`Mathlib/Topology/VectorBundle/Riemannian.lean`, `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`, `Mathlib/Geometry/Manifold/Riemannian/Basic.lean`)".

## R04 (P3) — The description misstates the References and omits the removed declarations

**Location:** The pull-request description, Changes: "works not checked (Aubin, Talenti, Schoen, Schoen–Yau, Obata, Kobayashi, Eisenhart) are marked uncertified and carry no theorem numbers."

**Claim:** At the head only Eisenhart, Obata 1962, Obata 1971, Schoen 1989 and Kobayashi are marked uncertified. The description also never says that the 11 declarations of main's `Suggested.lean` are removed.

**Witness:** README lines 1282–1294 (Aubin 1976a, Aubin 1976b, Talenti, Schoen 1984, Schoen–Yau 1988) carry no mark; lines 1281, 1296, 1299, 1305 and 1308 do. Main's `sharpSobolev_smoothCompact` is absent at the head.

**Repair:**
- End the sentence with: "Eisenhart, Obata 1962 and 1971, Schoen 1989 and Kobayashi are marked uncertified and carry no theorem numbers, and Aubin 1976a and 1976b, Talenti, Schoen 1984 and Schoen–Yau 1988 are cited only beside a checked Lee–Parker locator."
- Append to the `Suggested.lean` bullet: "It removes main's 11 declarations. The local `Euclidean`, `criticalExponent`, `conformalCoefficient`, `bubble`, `roundSphereVolume` and `sphereYamabeConstant` give way to Mathlib's `EuclideanSpace` and Tau Ceti's declarations. Their lemmas `conformalCoefficient_pos`, `bubble_pos`, `bubble_conformalLaplacian` and `exists_smoothCompact_eq_one` are dropped, and `sharpSobolev_smoothCompact` is restated as `sphereYamabeConstant_mul_le`."

## Verified sound

| Statement | Instances | This roadmap's side | Computed or source side | Result |
| --- | --- | --- | --- | --- |
| Previous R01 (W^(k,p) carrier) | 1.1, lines 516–517 | "Consume PseudodifferentialOperators 5.2's W^(k,p) carrier on the trivial real line" | contract at lines 284–286; Needs at 545; deps at 625 | repaired |
| Previous R02 (rearrangement) | 2.2, line 651 | "Consume Isoperimetry I2's Schwarz rearrangement and I5's estimate" | contract at lines 299–301; Needs at 671; scope at 77–79 | repaired |
| Previous R03 (`letI`) | lines 122, 137, 260 | `(hg : RiemannianBundle.g = g.toRiemannianMetric)` | gate statement-hygiene=0 | repaired |
| Previous R04 (anchor) | line 1261 | "cites Y9 as the owner of Obata's theorem (Y9.3)" | no `<a id`; residue=0; heading slug `y9-existence-uniqueness-and-rigidity` unchanged | repaired |
| Previous R05 (Layer 6↔8 cycle) | line 474; 6.2's Needs | "### 0.6 The developing map"; "*Needs:* 6.1; 0.5–0.6" | Layer 6 deps "Layers 0, 1 and 4"; lines 321–322 name Layers 0, 2, 4 | repaired |
| Previous R06 (locators) | 1.1, 4.4, 6.2, 0.6, 8.4, 9.4, 0.5, 9.2, 10.2, 10.3 | Thm 2.2; Lemma 6.4(a); Prop 7.1, Thm 7.2; Thm 10.4; Cotton p. 412; BM §1; ADH §1 | each checked below; Obata cited by article, uncertified (no legal copy) | repaired |
| Previous R07 (scalar law) | line 57 | "the mass shift under a conformal factor (0.4)" | scalar law only from Tau Ceti (line 155) | repaired |
| Previous R08 (Y=0) | lines 752–753 | "left-continuous at p_n when Y≥0 (Lee–Parker, Lemma 4.3, p. 54)" | LeeParker1987 lines 696–708, 756–759 | repaired |
| 0.1 conformal laws | u≡c on unit Sⁿ; n=3, 4, 6 | `c^(−(n+2)/(n−2))·n(n−1)c`; exponents (4,−5), (2,−3), (1,−2) | sphere of radius `c^(2/(n−2))`: `n(n−1)c^(−4/(n−2))`; LeeParker1987 lines 287–288, 73 | agree |
| 0.3 Euler–Lagrange | unit S³, `u=\|S³\|^(−1/6)`; hyperbolic, volume V | λ=6(2π²)^(2/3)=43.823=Q(u); Y=−6V^(2/3) | Hölder `∫u²≤‖u‖₆²V^(2/3)`; (1.2)–(1.4), LeeParker1987 lines 77–108 | agree |
| 1.1 Sobolev carriers | n=3: \|x\|^(−1/4), \|x\|^(−1/2) | first in H¹ and L⁶, not L^∞; second in neither | `∫r^(−1/2)dr<∞`, `∫r^(−1)dr=∞`; Thm 2.2, LeeParker1987 lines 356–363 | agree |
| 1.2 λ₁(L_g) | S²(1)×S¹; two unit S³ | λ₁=2; λ₁=6 with multiplicity 2 | `8·μ₁(Δ⁺+1/4)=2`; R5c item 1 at #2222 needs D connected | agree |
| 2.1 sharp inequality | n=3 bubble; Gaussian e^(−\|x\|²); u=0 | 12π²=118.44 on both sides; 31.71≤47.25; 0≤0 | `8·3π²/2`; `43.823·(π/6)^(1/2)=31.71`; Thm 3.3, LeeParker1987 lines 554–559 | agree |
| 2.2 equality cases | −3U_(1,0); `U_(2,b)`; two distant bubbles | equality; equality; quotient tends to 69.565 | `2^(2/3)·43.823=69.565>Y(S³)`; LeeParker1987 lines 558–559 with (3.2), line 478 | agree |
| 4.1 conformal normal coordinates | unit S³, N=2, factor 1 | det g=1+O(r²); README claims Scal(p)=0 for every N | Scal(p)=6; LeeParker1987 lines 875–880 need N≥5 | R01 |
| 4.2 cutoff-bubble bounds | weight r² (k=2); n=5, 6, 7 | ε³, ε⁴log(1/ε), ε⁴ | integrand ~s^(5−n); Lemma 3.5, LeeParker1987 lines 603–617 | agree |
| 4.3 Green expansions | n=3, 4, 5; n=6 | `r^(2−n)+A+O″(r)`; \|W(p)\|²log r term | Lemma 6.4(a), (b), LeeParker1987 lines 1126–1134 | agree |
| 4.4 LCF poles | inversion z=x/\|x\|² | `(1+Aρ^(2−n)+O(ρ^(1−n)))^(4/(n−2))δ` | (6.4) and Thm 6.5(a), LeeParker1987 lines 1150–1159; order n−2 | agree |
| 6.2 glued test function | T³ and T² punctured; unit S³ | π₁: ℤ³ versus free of rank 2; A=0, identity | Prop 7.1, Thm 7.2, LeeParker1987 lines 1302–1308, 1352–1354; p. 85, lines 1972–1974 | agree |
| 8.3 positivity on the cover | lifted S^(n−1)×S¹; unit Sⁿ | ℤ-orbit of poles, so A>0; one pole, A=0 | CecchiniZeidler2021 lines 113–116; AmmannHumbert2005 lines 115–118 (compact LCF spin) | agree |
| 9.2 uniqueness when Y≤0 | c₁<0; c₁=0; unit S³ | `u_max^(p−2)≤c₁/c₂≤u_min^(p−2)`, so u=1; harmonic u is constant | BrendleMarques2010 lines 106–107 (p. 3); the Möbius family shows c₁≤0 is needed | agree |
| 9.3 Obata, Lichnerowicz | unit S², S³; RP²; ℝ with sin | λ=2=nk, 3=nk; first eigenvalue 6≠2; n=1 excluded | CavallettiMondinoSemola2019 lines 50–52; LeeParker1987 lines 492–526; BrendleMarques2010 lines 137–144 | agree |
| 10.2 product cylinder | n=3, L=4π | `(n−2)²/4`, `n(n−2)/4`; `v″+(n−2)v`; `(2π/L)²=1/4<1` | `(n−1)(n−2)/a_n`; `−(n−2)²/4+(n+2)(n−2)/4=n−2`; BrendleMarques2010 lines 109–114 | agree |
| `sphereYamabeConstant_mul_le` | n=3 bubble; Gaussian; u=0 | 118.44=118.44; 31.71≤47.25; 0≤0 | `∫\|∇e^(−r²)\|²=5.906`; `(∫e^(−6r²))^(1/3)=0.7236` | sound |
| `exists_ae_eq_mul_bubble_of_mul_norm_sq_eq` | n=3; hexp; two bubbles | p⋆ forced to 6; `‖u‖=‖∇u‖₂` | D1p0 norm is the gradient L² norm (`D1p0/Basic.lean` doc, line 246); a two-bubble sum has quotient 69.565≠43.823 | sound |
| `isLocallyConformallyFlat_of_weylTensor_eq_zero` | flat T⁴; S²×S²; Heisenberg | W=0, LCF; W(X,Y,Y,X)=−1/3; W=0 but not LCF | `hn : 4 ≤ n` excludes n=3; definition at `ConformallyFlat.lean` line 100 | sound |
| `isLocallyConformallyFlat_of_cottonTensor_eq_zero` | S²×ℝ; Heisenberg | P=diag(½,½,−½) parallel, C=0; C(e₃,e₁,e₂)=1 | S²×ℝ conformal to ℝ³∖{0}; Cotton1899 lines 834–838 (p. 412) | sound |
| `exists_yamabeQuotient_lt` | unit S³, u=1; S²×S¹ of length 2π | 43.823<43.823+ε; 36.809 | Lemma 3.4, LeeParker1987 lines 566–567 | sound |
| `exists_isMinOn_yamabeQuotient_of_lt` | hyperbolic 3-manifold; unit S³ | constant minimizes, Y=−6V^(2/3); hypothesis fails at Y=Y(S³) | Thm 4.5, LeeParker1987 lines 746–759 | sound |
| `…_of_weylTensor_ne_zero` (Theorem B) | S²×S⁴; round S⁶ | W(X,Y,Y,X)=−3/10≠0; W=0, hypothesis fails | Scal=14, P=−g/10 and 2g/5; Y(S⁶)=96.297; LeeParker1987 line 133 | sound |
| `…_of_not_conformal` (Theorem C) | RP³; flat T⁶; unit S³ | 27.607<43.823; 0<96.297; excluded by `hconf` | LeeParker1987 lines 142–144; the sphere's inner product is Tau Ceti's round instance (`Sphere/Basic.lean` line 77) | sound |
| `exists_isMinOn_yamabeQuotient` | unit S³; T³ | u=1 attains 43.823; u=1 attains 0 | Yamabe theorem, LeeParker1987 lines 1957–1964 | sound |
| `exists_rescale_scalarCurvature_eq_const` | unit S³; S³⊔hyperbolic | f=1, c=6; no single c | the second is excluded by `ConnectedSpace`; README 9.1 Check | sound |
| `eq_of_scalarCurvature_rescale_eq_of_nonpos` | hyperbolic, c₁=−6; torus, c₁=0 | `u=(c₁/c₂)^(1/(p−2))`, and unit volume gives u=1 | sign invariance of λ₁ forces c₂<0 when c₁<0 | sound |
| `exists_forall_eq_of_ricciTensor_eq_smul` | S²×S², κ=1; unit S³ | homotheties only; nonconstant `U_(λ,b)` excluded by `hconf` | the κ≤0 case follows from 9.2, so `hκ` loses nothing | sound |
| `forall_le_yamabeQuotient_iff` | unit S³; RP³ | both sides true; 27.607<43.823 and not conformal, both false | Theorems B, C and 3.2 | sound |
| `nonempty_riemannianIsometry_sphere_of_hessian_eq` | unit S², f=x₁; ℝ, f=sin; f≡c≠0 | isometric; excluded by `hn : 2 ≤ n`; Hess c=0≠−cg | Obata 1962, uncertified | sound |
| `nonempty_riemannianIsometry_sphere_of_laplaceBeltrami_eq` | unit S³; RP²; circle of length 4π | Ric=2g, λ=3; first eigenvalue 6≠2; n=1 excluded | CavallettiMondinoSemola2019 lines 50–52; `Lichnerowicz.lean` line 82 | sound |
| `exists_diffeomorph_of_conformalLaplacian_eq` | u≡1 on S³; c≤0 | c=6, Φ=id, a=1; `∫uLu>0` rules out c≤0 | Prop 3.1 and Thm 3.2, LeeParker1987 lines 492–526 | sound |
| R02: GMT G3 | 0.4, stereographic change of variables | "G2–G3 own the area and change of variables formulas" | GMT README line 183: G3 is BV; lines 158–181, in G2, hold the formulas | misattributed |
| R03: Mathlib contract | `RiemannianBundle`, `IsContinuousRiemannianBundle` | in `Geometry/Manifold/VectorBundle/Riemannian.lean` or `Riemannian/Basic.lean` | `Topology/VectorBundle/Riemannian.lean` lines 420, 60 | wrong file |
| R04: description | References entries | "Aubin, Talenti, Schoen, Schoen–Yau … marked uncertified" | README lines 1282–1294 unmarked | contradicted |

- **Source locators:** 34 checked in LeeParker1987 (printed page N is text page N−36), at pp. 38–40, 43–45, 47–55, 58–59, 63–65, 69–70, 79, 81–82 and 85. Also checked: Cotton1899 n° 18 (p. 412); BrendleMarques2010 pp. 3–4; CavallettiMondinoSemola2019 Thm 1.1; AmmannDahlHumbert2008 pp. 4–5; CecchiniZeidler2021 Thm B; AmmannHumbert2005 Thm 2.2. All agree except R01.
- **Library declarations at the pins:**
  - 16 opened at Tau Ceti: `Sphere/Basic.lean` 61, 77; `ConformalLaplacian.lean` 92; `Quotient.lean` 97; `SphereConstant.lean` 41; `Bubble/Basic.lean` 84, 116, 132; `ConformallyFlat.lean` 100, 237; `D1p0/Basic.lean` 246; `Riemannian/Sobolev.lean` 185; `Lichnerowicz.lean` 82; `Euclidean/Volume/Sphere.lean` 376; `Bubble/Cutoff.lean` 319.
  - 5 opened at Mathlib.
  - All 43 contract files exist, and 42 named Tau Ceti declarations are in their stated files.
- **Cross-roadmap citations resolved (34):**
  - PositiveMass 0.2, 0.4, 3.0–3.2, 8.1, 8.3 and 8.4, on main, with 8.4 also checked at #2247.
  - RiemannianGeometry R1–R4, R1.1 item 3 and R7.0 on main; R5c items 1–2 at #2222 (90a5c6a), which the description names. The overlap tool did not list R5c.
  - DifferentialGeometry 2, 4.3 and 12.2–12.5; PDE A1–A7, C12–C15, D16–D19 and E20–E26; PseudodifferentialOperators 5.2; K5a with `RealBundleSobolev`; Isoperimetry I2 and I5; GeometricMeasureTheory G2 (R02); AlgebraicTopology Layer 1; B1.4; C1; SpinGeometry G3–G5 and G4.2; UniversalCovers Stages 1–4.
- **Gate:** rerun at 9711109, every check is 0 and the result is OK. The dependency check gives `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean TauCetiRoadmap/Yamabe/Suggested.lean` gives 16 `sorry` warnings and nothing else. The `#check @` types of all 16 declarations match the README: no binder is lost, so nothing changed. On a scratch copy, `first | rfl | trivial | infer_instance | simp` closes none of the 16.
- **Duplication:** the pinned Tau Ceti was searched for Obata, the sharp Sobolev constant, Aubin's bound, the converse of Weyl–Schouten and the Riemannian volume of the sphere. Nothing there proves a target. The nearest, `isBigO_cutoff_bubble_sobolev_quotient_sub_sphereYamabeConstant` and the non-sharp `exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`, are consumed.
- **Overlap check:** read PositiveMass (main, #2247), RiemannianGeometry (main, #2222) and RicciFlow (main), plus YangMillsConnectionsAndCaloricGauge (#2164) and SobolevMapsBetweenManifolds (#2230). Owners:
  - PositiveMass: ADM mass, positive mass theorems, the positive-scalar metric (3.0).
  - RiemannianGeometry: principal eigenfunction (R5c), Lichnerowicz equality (R7.0).
  - Yamabe: Obata, `m = 2A`, the sharp Sobolev inequality (YangMills cites Y2 item 1).
  - RicciFlow shares nothing.

## Not verifiable

- Obata 1962 (J. Math. Soc. Japan 14, 333–340): the Project Euclid landing page has no PDF link, and the J-STAGE PDF URL returns 404.
- Obata 1971 (J. Differential Geom. 6, 247–258): the Project Euclid landing page has no PDF link.
- Eisenhart 1926 §28, Aubin 1976a and 1976b, Talenti 1976, Schoen 1984, Schoen–Yau 1988, Schoen 1989 and Kobayashi 1987: publisher copies only, not fetched. Each is either marked uncertified or cited beside a checked Lee–Parker locator.

## Source issues

- none
