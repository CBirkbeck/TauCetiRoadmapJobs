# Review of MorseNovikov (pull request #1854 at 77fef84)

**Verdict:** needs changes

## R01 (P2) — §6.4 plans pinned simplicial constructions as its own

**Location.** `TauCetiRoadmap/MorseNovikov/README.md` §6.4, lines 1454–1456 and 1470: "Build the finite-triangulation chain adapter here. For each finite simplicial complex K and commutative coefficient ring R, construct the native `ChainComplex (ModuleCat R) ℕ` free on the q-simplices … Construct the canonical affine homeomorphism `b_r:|sd^r K|≃ₜ|K|`".

**Claim.**
- The pinned Tau Ceti already has four of these objects:
  - the ordered simplicial chain complex with the alternating deleted-vertex boundary, over any ring;
  - its isomorphism with the cellular complex of |K|;
  - the resulting isomorphism of simplicial homology with singular homology;
  - barycentric subdivision, with the canonical homeomorphism |sd K| ≃ₜ |K| that sends each face-vertex to its barycentre.
- §6.4, and lines 323–324 ("Layer 6 below constructs … the finite simplicial chain adapter"), plan them again. "From Tau Ceti" names none of them.
- Pinned smooth triangulations are built on the same carriers, so these declarations apply directly: `TauCeti.IsSmoothTriangulation` (Geometry/Manifold/SmoothTriangulation/Basic.lean:191) takes a `Realization K ≃ₜ M`.

**Witness.**
- `TauCeti.orderedSimplicialChainComplex` (AlgebraicTopology/SimplicialComplex/ChainComplex.lean:186).
- `TauCeti.cellularChainComplexRealizationIso` and `TauCeti.orderedSimplicialHomologyIsoSingularHomology` (…/Realization/CWComplex/OrderedChainComplex.lean:132, 184).
- `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph` (…/Subdivision/Homeomorph.lean:221).

**Repair.**
1. Replace the clause from "construct the native `ChainComplex (ModuleCat R) ℕ`" through "extension by zero to `ChainComplex (ModuleCat R) ℤ`" with:
   > consume Tau Ceti's `TauCeti.orderedSimplicialChainComplex` of K with linearly ordered vertices, and build here the sign −1 of an orientation reversal, scalar extension and the extension by zero to `ChainComplex (ModuleCat R) ℤ`
2. Replace "Prove this native chain adapter agrees with that structure and AT4.2's cellular complex and chain maps. Compose with AT4.3's cellular/singular comparison to obtain the homology isomorphism." with:
   > Its isomorphism with the cellular complex of `AbstractSimplicialComplex.realizationCWComplex` is `TauCeti.cellularChainComplexRealizationIso`, and its isomorphism with the singular homology of |K| is `TauCeti.orderedSimplicialHomologyIsoSingularHomology`. Identify the cellular chain maps of simplicial maps here.
3. Replace the "Construct the canonical affine homeomorphism" sentence with:
   > Take `b_r` to be the r-fold composite of `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph` for `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision`.
4. At lines 323–324, replace "and the finite simplicial chain adapter" with "and the sign, scalar-extension and simplicial-map extensions of the pinned ordered chains".
5. Add the five declarations to "From Tau Ceti", with their files and the `LinearOrder` hypothesis. Keep the Checks.

Tested on the triangle boundary with vertices 0<1<2:
- the pinned boundary gives ∂[0,1]=[1]−[0];
- the cycle [0,1]−[0,2]+[1,2] spans H₁=R, and H₀=R;
- these are the values §6.4's Check states.

## R02 (P3) — §4.6 re-derives the pinned Morse inequalities

**Location.** §4.6, lines 1073–1077: "Prove b_i≤c_i and, for each q≥0, Σ(i=0,…,q)(−1)^(q−i)b_i≤Σ(i=0,…,q)(−1)^(q−i)c_i, with equality for q=dim X. … the inequalities follow from splitting the resulting finite field complex)".

**Claim.**
- §§3.3 and 4.2 give a finite complex of vector spaces in each field component.
- For that complex, the weak inequality, the strong inequality and the top-degree equality are all pinned, with the same signs.
- §4.6, its *Needs:* line and "From Tau Ceti" do not name them, and the route proves them again.

**Witness.**
- `HomologicalComplex.finrank_homology_le_finrank_X` (Algebra/Homology/ModuleCat/Finrank.lean:48).
- `ChainComplex.sum_range_neg_one_pow_mul_finrank_homology_le` (Algebra/Homology/EulerCharacteristic/MorseInequalities.lean:62), with signs (−1)^(n−i).
- `ChainComplex.sum_range_finrank_X_eq_sum_range_finrank_homology` (…/EulerCharacteristic/ChainComplex.lean:120).

**Repair.**
1. Replace "the inequalities follow from splitting the resulting finite field complex" with:
   > for the finite field complex of each component they are Tau Ceti's `HomologicalComplex.finrank_homology_le_finrank_X` and `ChainComplex.sum_range_neg_one_pow_mul_finrank_homology_le`, and at q=dim X `ChainComplex.sum_range_finrank_X_eq_sum_range_finrank_homology`
2. Add the three declarations to the *Needs:* line and to "From Tau Ceti".

Tested on Check 1 (differential 2, so c=(1,1) and b=(0,0)): the pinned strong inequality at n=1 reads −0+0 ≤ −1+1, an equality, as the Check states.

## R03 (P3) — Three pinned carriers the routes use are missing from the supplier contracts

**Location.**
- §4.1, line 877: "Build the determinant line of a bounded finite-dimensional chain complex over F". Its *Needs:* line names only Mathlib exterior powers.
- §6.4, line 1431: "Mapping torus of a diffeomorphism of a closed connected fiber S".
- Lines 309–310: "Consume UniversalCovers Stage 2 items 7–8".

**Claim.**
- (a) Pinned: the determinant line of a module, and the short-exact determinant isomorphism with the subspace factor first. §4.1's "subspace-first lifts" need both.
- (b) Pinned: the mapping torus of a homeomorphism, with its infinite cyclic cover and deck generator.
- (c) UniversalCovers is in `Completed/`, and its Stage 2 items 7–8 are pinned declarations.
- None of (a)–(c) is named in "From Tau Ceti".

**Witness.**
- (a) `TauCeti.detLine` (LinearAlgebra/Determinant/Line.lean); `TauCeti.exteriorPower.shortExactEquiv` (LinearAlgebra/ExteriorPower/ShortExact.lean:140).
- (b) `TauCeti.MappingTorus`, `TauCeti.MappingTorus.isAddQuotientCoveringMap_coverMap` and `TauCeti.MappingTorus.deck` (Topology/MappingTorus/Basic.lean:90; Covering.lean:56, 82).
- (c) `TauCeti.UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient` and `TauCeti.UniversalCover.deckSubgroupQuotientProjEquivOfNormal` (AlgebraicTopology/UniversalCover/Classification/Bijection.lean:99; DeckGroup.lean:95).

**Repair.**
1. Add to "From Tau Ceti", with their files:
   - for §4.1: `TauCeti.detLine`, `LinearEquiv.detLineCongr` and `TauCeti.exteriorPower.shortExactEquiv`;
   - for §6.4: `TauCeti.MappingTorus` with `TauCeti.MappingTorus.isAddQuotientCoveringMap_coverMap` and `TauCeti.MappingTorus.deck`; §6.4 states which of `deck` and its inverse is the downward t.
2. Replace "Consume UniversalCovers Stage 2 items 7–8 …" with the two `TauCeti.UniversalCover` declarations above.
3. Put each item into the *Needs:* line of §4.1, §6.4 or §2.2 respectively.

Tested on Bᵢ ⊂ Zᵢ: `shortExactEquiv` gives det Bᵢ ⊗ det Hᵢ ≃ det Zᵢ, which is rt3's order in (A.1) (rt3 lines 1824–1830, p. 239).

## R04 (P3) — §6.2's worked self-slide class flows upward under the roadmap's own N

**Location.**
- §6.2 Checks, line 1375: "For H=ℤ⊕ℤ/2 and h=(2,1), d=2. With k=3, μ(n,e)=2n mod 3 sends h to 1; with k=2, ν(n,e)=n mod 4".
- Worked examples, line 1762: "H=ℤ⊕ℤ/2 and h=(2,1)".

**Claim.**
- On this H the roadmap fixes N(n,e)=−n (§2.3, and §4.2's Check). That gives N(h)=−2<0.
- A downward flow line from p̃ to h·p̃ would therefore increase f̃.
- x=1+Σa_n e^(nh) has infinitely many terms below every cutoff, so x is not in Nov(ℤ,H,N).

**Witness.**
- f̃(h·x)=f̃(x)+P(h)=f̃(x)+2 (Conventions, lines 88–89).
- N(nh)=−2n, so {n : N(nh)<0} is infinite, which breaks §1.1's support condition.

**Repair.**
1. Replace the Check with:
   > For H=ℤ⊕ℤ/2 with §2.3's N(n,e)=−n and h=(−2,1), N(h)=2>0 and d=2. With k=3, μ(n,e)=n mod 3 sends h to 1; with k=2, ν(n,e)=−n mod 4 sends h to 2 and nh lies in its kernel exactly for even n.
2. In Worked examples, write "h=(−2,1)".

Tested:
- The functional λ(n,e)=−n is 1 on h̄/d=−1.
- μ=2λ mod 3 = n mod 3, so μ(h)=−2≡1.
- ν=λ mod 4, so ν(h)=2, and ν(nh)=2n mod 4 vanishes exactly for even n.

## Previous findings

- **R01 (pinned algebra planned as own constructions): repaired.**
  - Scope, lines 31–48, now begins "The pinned Tau Ceti also has, and this roadmap consumes…".
  - "From Tau Ceti" (lines 174–270) names every declaration in the previous table.
  - §4.2 (lines 924–940) consumes them and keeps the Nov(ℤ,H,N) half as a target.
  - Worked examples (line 1766) cites `TauCeti.NovikovSeries.IrrationalExample.series`.
- **R02 (external carrier comparisons): repaired.** Lines 61–66 cite `TauCeti.NovikovSeries.continuousDomCongr` and `TauCeti.NovikovSeries.hahnSeriesEquiv`. No construction target remains in Scope.
- **R03 (locators): repaired.**
  - (a) §6.5 (lines 1545–1549) and `Suggested.lean` (lines 98–100) cite Granas, Theorem 10.1, p. 224, with (I), (II), (VII) and §6.
  - (b) Line 1441 adds "(Hopf, Math. Z. 29 (1929), 493–524)".
  - (c) Line 1271 adds "(rt3 Lemma 2.11(a), equation (2.1), p. 222, and its proof, p. 223)", and line 1281 reads "§2, pp. 218–223".
- **R04 (wording and section order): repaired.**
  - (a) Line 1509 reads "The chain adapter of the mapping-torus item and §5.2's local index supply the comparisons."
  - (b) Downstream consumers (line 1743) precedes Worked examples (line 1754). The build-order paragraph is in "How to read the build" (lines 328–342).

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| §1.3 positive series | (1−t)Σtᵏ; t⁴ in Π(1−tⁿ)⁻¹; N(t)=−1 | 1,0,0; 5=p(4); (1−t)⁻¹=−t⁻¹Σt^(−k) | holds; rt3 (1.1)–(1.2), Rem. 1.4, l.166–212 (p.212) |
| §1.4 Laurent, Hahn, domain | t⁻²+3+t³; H=ℤ/2; a+√2b on ℤ² | min exponent −2 both sides; (1−g)(1+g)=0; unique least exponent, so a domain | holds; rt3 Ex. 1.3 l.148 (p.211), A.4 proof l.1925 (p.240) |
| §2.4 cutoff moduli | index pairs (1,0), (0,0); exact closed trajectory | dimensions 0, −1; drop >0 and =0 at once | holds; rt3 l.114–117 (p.211), l.179 (p.212), l.243 (p.213), Lemma 2.2 l.538 (pp.218–219) |
| §3.2 continuation | constant family; lift change t²; fixed function path | [1]; [t²][t⁻²]=[1]; common critical point kills transversality | holds; rt3 Lemmas 2.2, 2.5 (pp.218–219); erratum §2.2, Prop. 3.4 |
| §3.3 large gradient | −∇(cosθ+θ/C), C=2; C=½ | zeros π/6, 5π/6, no orbit; sinθ−2<0, so the circle is an orbit | holds; rt3 Lemma 4.1 l.1634 (p.235), proof p.236, Rem. 4.3 l.1712 (p.237) |
| §3.4 top degree | T², α=dx; exact α on S¹; duality argument | 1−t a unit: H₂^Nov=0≠ℤ; H₁=ℤ; e^h a=±a with N(h)>0 forces a=0 | holds, nonorientable included; rt3 (1.4) l.254 (p.213) |
| §4.1 torsion convention | ℚ—2→ℚ; A₀=3, A₁=5; degree-0 swap | rt3 ½, Milnor 2; 3/10=½·3·5⁻¹; −1=1·(−1) | holds; rt3 A.2 l.1862 (p.239); Mil66 §3 l.258–287 (p.365); pinned exponent (−1)^i |
| §4.2 total quotients | ℤ/2; ℤ/3; ℤ⊕ℤ/2 with N=−n | ℚ×ℚ, 1−g↦(0,2); ℚ×ℚ(ζ₃); F×F, exp t∉F, 1/(2−t)∈F | holds; rt3 A.3–A.4 l.1886–1931 (p.240) |
| §4.3 continuity | (2+t^m)⁻¹; a=0 against a=t^m | ½−t^m/4+⋯; 0 against t^(−m) | holds; rt3 Def. 2.6, Lemmas 2.7–2.9 l.632–737 (pp.220–221) |
| §4.4 norms | s=t²; 1+t²; 1+ct; ℤ/2 idempotent | Norm(1−t)=1−s; Tr=2+2s; log(1−c²s)=2·even part; norm 0 | holds; rt3 Lemma 3.5 l.1090 (p.227), Prop. 3.6 l.1146 (p.228) |
| §5.3 zeta and product | multiplier −2; Klein-bottle torus, f=−θ+ε sinθ | signs +,−,+…: factor 1+t; orbits 0, π: (1+t)/(1−t)=exp Σ(1−(−1)ᵏ)tᵏ/k | holds; rt3 (1.1)–(1.2) (p.212); rt2 (2) fails for n=2 |
| pinned product formula | ε(γᵏ)=ε₁σ^(k−1), σ=±1 | Σε₁σ^(k−1)xᵏ/k=−ε₁σ·log(1−σx) | agrees with `orbitZeta_eq_eulerProduct` (OrbitZeta.lean:220) and `sign_det_one_sub_pow` |
| §6.1 Cerf form | sign +, t<t₀ | zeros ∓√(t₀−t), indices i, i−1; x₁ increases along −V_t | holds; rt3 (2.1) l.783 (p.222), l.815 (p.223) |
| §6.3 cutoff limits | d=2+t^m; t^m→0 | first change in degree m; t^(−m) does not tend to 0 | holds; rt3 Def. 2.6 l.632 (p.220), Lemma 4.1 (pp.235–236) |
| §6.4 calculations | critical-free circle; unknot; trefoil; reflection monodromy | τcell=(1−t)⁻¹; (1−t)⁻²; (t⁻¹−1+t)/(1−t)²; (1+t)/(1−t) | holds; rt3 Ex. 1.7–1.9 l.354–417 (pp.215–216); rt2 Ex. 1.4 l.150 (p.372); rt1 Ex. 1.9 l.80 (p.863) |
| §6.4 chain adapter (R01) | triangle boundary, 0<1<2 | ∂[0,1]=[1]−[0]; H₀=R, H₁=R on both models | pinned (R01) |
| §6.2 slide class (R04) | h=(2,1) against (−2,1), N=−n | N(h)=−2, so x∉Nov; N(h)=2, μ(h)=1, ν(h)=2 | fails as stated (R04) |
| §4.6 (R02) | differential 2; zero differential | b=(0,0): 0≤1, 0=0; b=(1,1): 1≤1, 0=0 | holds; pinned (R02) |
| `lefschetz_fixed_point_formula` | ∅; S¹ reflection; z↦z²; ℝP² rotation; translation of ℝ | 0=0; 2=1−(−1); −1=1−2; 1=1; 0≠1 | holds; compactness needed; Gra72 Thm. 10.1 l.545 (p.224); Hat02 2C.3 (p.179) |
| `poincare_hopf` | ∅; two points; S¹, sinθ∂θ; ℝP² Morse; ℝ, constant field | 0=0; 2=2; +1−1=0; +1−1+1=1; 0≠1 | holds without orientation; compactness needed |
| `fixedPointDet`, `zeroDet` | f=2x, conjugated by 3x; V=(−x,y), conjugated by diag(−1,1) | −1, −1; −1, −1 | chart-independent |
| §7.1 Euler chains | S² gradient; T² gradient; maximum in dimension 3 | 2=χ; +1−1−1+1=0; ∇f gives −1=(−1)³, −∇f gives +1 | holds; rt3 B.1 l.1983, B.3 l.2009 (p.241), B.4 l.2050 (p.242) |
| Theorem B (not statable) | circle: critical-free; one maximum and one minimum | τζ=1·(1−t)⁻¹; (1−t)⁻¹·1; τcell=(1−t)⁻¹ | holds; rt3 Thm. B l.338 (p.215) |
| §2.2 H₁ sequence | Klein-bottle cover C | H₁(C)=ℤ→H₁(X) is zero; H₁(X)≅H, kernel 0 | exact, first arrow not injective |

- **Gate:** the worker's gate is 0 on every check including the build; my `gate … --base origin/main` fails only `outside-folder=5`, all in BanachSpaceTheory, SelfAdjointSpectralTheory and the OperatorTheory index (this pull request's own folders); `git diff --stat` outside them is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1903 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/MorseNovikov/Suggested.lean` exits 0 with only `declaration uses sorry` at 103:8 and 150:8; `#check @` on all 8 declarations matches `signatures.md` and §§6.5, 7.3 binder for binder; `simp` closes neither theorem; no `set_option`, no sorry'd data.
- **Locators checked against the text:** 70 (rt3 49, rt2 5, rt1 1, Mil66 2, Hat02 6, Gra72 5, family-Floer erratum 2); every seeded target matches.
- **Library declarations:** 136 backticked README names resolved to their declaring file at the pins; 44 opened and compared with the README's hypotheses (c>0, T₁, `IsDomain`, `AddGroup.FG`, ℚ-algebra, torsion sign), plus the 18 pinned declarations cited in R01–R03.
- **Cross-roadmap citations resolved on main:** MorseTheory M1–M4, M6; HeegaardFloer Lane M (217), §1.5 (467), §1.9 (1162), §2.8 (1913), F0 §§2.1–2.7; DifferentialGeometry `closedForms`, `RoughForm`, `flowOf`, `toFlow`, `circleAngularForm`; AlgebraicTopology stage map (851–884); GeometricTopology Layers 1, 3–5, 11, §4.4 (2740); Completed/UniversalCovers Stage 2; consumers DGFloer #1798 (218), FukayaTheory #1045 (26, 64), AlgebraicTopologyPartII #1694 (419), K3SurfacesAndSymplecticBoundedness #1375 (198), TaubesGromov (15), HamiltonianFloerOperations (16).
- **Overlap check:** read DGFloer (#1798, main), GromovWittenTheory (#990), FukayaTheory (#1045), AlgebraicTopology (#1807, main), DeRhamCohomologyAndDuality (#2085), HeegaardFloer and MorseTheory (main), results-and-headings list empty; Novikov completion: owner Tau Ceti `TauCeti.NovikovSeries` (consumed via N1 or directly); period homomorphism: owner Tau Ceti `TauCeti.periodHom`; ordinary Morse moduli: owner HeegaardFloer Lane M; compact-band Morse theory: owner MorseTheory; Lefschetz formula, local index and Poincaré–Hopf: owner MorseNovikov N5–N7 (CharacteristicClasses main lines 138–139 and #1808, K3Surfaces #1285, AlgebraicTopologyPartII #1694 defer).

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3, and the `zeroSign` docstring). It is not in the manifest, the publisher copy is paywalled, and I found no open or author copy.
- Dold, *Lectures on Algebraic Topology*, Chapter VII (References only). It is paywalled and not in the manifest.
- Hopf 1929 (`Hop29`). Settled as uncertified, and cited by its locator.
- Turaev 2001 and 1990, and Pajitnov 2006. They are paywalled, and no target relies on a locator into them.

## Source issues

- **Error** in rt2 at equation (2), p. 371: the source gives each irreducible orbit the exponent −(−1)^(i₀); it should be (−1)^(n−i₀)=−(−1)^(i₊+i₋), which agrees only for odd n (Klein-bottle torus: (1−t)⁺¹ instead of (1−t)⁻¹); affects a stated result.
- **Gap** in rt3 at Lemma A.4, proof, p. 240: the source infers that L_j⊗Q(ℤF) and L_j⊗Q(Nov(F,N)) are fields only from ℤF and Nov(F,N) being domains; it should also use that ℚ is algebraically closed in those fraction fields; affects the proof.
- **Error** in rt3 at §2.1, p. 220: the source identifies each field component F_j of Q(Nov(G,N)) with a tensor product of Nov(G/Ker N, N) with a field; it should say F_j embeds in a Novikov ring over G/Ker N with field coefficients, since Frac ℤ((t)) is not ℚ⊗ℤ((t)); affects the proof.
