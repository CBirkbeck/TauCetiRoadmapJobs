# Review of MorseNovikov (pull request #1854 at 50c1eef)

**Verdict:** needs changes

## R01 (P3) — The description omits the pinned geometry and topology this head consumes

**Location.** Pull-request description. The summary block says only "MorseNovikov takes the degree-one Hurewicz isomorphism and its naturality from the pinned library instead of from DGFloer". The paragraph "MorseNovikov, pinned algebra consumed." names only the algebra, §2.2's covers, §4.1, §4.6 and §6.4.

**Claim.** Against main, the head also consumes pinned Tau Ceti declarations in Layers 2, 3, 5, 6 and 7 in place of constructions it used to plan. It also takes the maximal flow and the circle's angular form from Tau Ceti instead of DifferentialGeometry. The description states neither change.

**Witness.** Main line 173 consumes DifferentialGeometry's `flowOf`, `toFlow`; head line 572 uses `TauCeti.flowOf`, `TauCeti.globalFlow`. Main line 114 "must prove finite-dimensionality"; head line 149 "takes" it. `TauCeti.SmoothMappingTorus`: 0 mentions on main, 25 at head.

**Repair.**
1. In the summary block, replace the MorseNovikov sentence with:
   > MorseNovikov takes the degree-one Hurewicz isomorphism from the pinned library instead of from DGFloer, and consumes by name the pinned algebra, geometry and topology its sections had planned to build.
2. In the paragraph "MorseNovikov, pinned algebra consumed.", insert after the sentence ending "the chain maps on collapsed or reordered faces.":
   > The geometric sections consume what the pinned Tau Ceti proves in the same way:
   > - the Morse lemma, stable and unstable sets, connecting orbits, the breaking theorem and the gradient energy identity (§§2.1 and 2.4);
   > - pulled-back and quotient smooth structures, the smooth mapping torus with its suspension flow, closed orbits and time form, and the covering space of local primitives (§§2.2–2.3 and 6.4);
   > - kernel-map homotopies, coordinate base change, and locally finite chains with their subdivision (§§3.2–3.3);
   > - the determinant line of a linear map, finite-index domain subrings, the norm on total quotients, series orders and the unit rescaling of torsion (Layer 4);
   > - hitting times, the global flow, the degree at a regular value, the local homology system and the real-eigenvalue parity lemmas (Layer 5);
   > - smooth triangulations, PL star charts, the Wang cone, knot exteriors, Dehn fillings and zero surgery on the unknot (§6.4);
   > - the existence of Morse functions, the Morse inequalities of a compact manifold, homotopy invariance, and the linearization of a section (§§6.5 and 7.1–7.3).
   >
   > The maximal flow, the global flow and the circle's angular form now come from Tau Ceti instead of DifferentialGeometry. DifferentialGeometry still supplies forms, orientations, integration, degree and metrics.

   Tested: each item names pinned declarations absent from main and present at the head. Examples (main/head mentions): `TauCeti.IsManifoldNondegenerateCriticalPoint.nonempty_morseChart` 0/3, `TauCeti.PrimitiveSpace` 0/9, `TauCeti.NovikovModule.kernelMap_sub_kernelMap` 0/2, `Algebra.fractionNorm` 0/6, `TauCeti.degreeAtRegularValue` 0/3, `TauCeti.knotExterior` 0/3, `TauCeti.exists_isMorse` 0/5, `TauCeti.sectionLinearization` 0/3.

## R02 (P3) — Three words run into their numerals

**Location.** `TauCetiRoadmap/MorseNovikov/README.md`: line 929 "Prove B has order2"; line 958 "with product0"; line 2075 "the volume at ξ₀ is1".

**Claim.** Each drops the space between a word and a numeral, so the text reads as identifiers.

**Witness.** README lines 929, 958 and 2075 as quoted. They are the only run-together word–numeral tokens outside code spans, URLs and source ids.

**Repair.** Write "order 2", "product 0" and "is 1".

## Previous findings

- **R01 (pinned simplicial constructions planned as own): repaired.**
  - §6.4, lines 1849–1856: "consume Tau Ceti's `TauCeti.orderedSimplicialChainComplex` … and build here the sign −1 of an orientation reversal".
  - Lines 599–602 now read "the orientation signs and simplicial-map functoriality of the pinned ordered simplicial chains".
  - From Tau Ceti, lines 316–348, names the five declarations, "for an abstract simplicial complex K with linearly ordered vertices".
- **R02 (pinned Morse inequalities re-derived): repaired.** §4.6, lines 1429–1433, its *Needs:* line (1441–1445) and From Tau Ceti (lines 301–310) cite the three pinned theorems.
- **R03 (missing supplier contracts): repaired.**
  - (a) Lines 295–301 and §4.1's *Needs:* line (1250).
  - (b) Lines 312–316. Line 1805 reads "the downward deck t, with N(t)=1, is its inverse".
  - (c) Lines 288–295 and §2.2's *Needs:* line (918). UniversalCovers is no longer named.
- **R04 (slide class): repaired.** Line 1744 reads "h=(−2,1), N(h)=2>0 and d=2", and Worked examples (line 2190) reads "h=(−2,1)".

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| §1.3 positive series | (1−t)Σtᵏ with N(t)=1; t⁴ in Π(1−tⁿ)⁻¹; N(t)=−1 | 1,0,0; 5=p(4); (1−t)(−t⁻¹Σt^(−k))=1 | holds; rt3 (1.1)–(1.2), Rem. 1.4, lines 162–212, p.212 |
| §1.4 Laurent, Hahn, domain | t⁻²+3+t³; H=ℤ/2; ℤ² with a+√2b | least exponent −2 on both sides; (1−g)(1+g)=0; unique least exponent | holds; `isDomain_of_fg` needs FG and `HasUniqueDiv` (LeadingTerm.lean:266); rt3 line 148 p.211, line 1925 p.240 |
| §1.5 orbit modules | one orbit with F(s)=0; lift change by h; t²·U₃ | F(e^h s)=−N(h), matching f̃(hx)=f̃(x)+P(h) with N=−P; basis ×e^h; lands in U₅ | holds; rt3 §1.4 lines 213–257, pp.212–213 |
| §2.2 periods and covers | universal cover of S¹; Klein cover C | H₁(ℝ)=0→ℤ≅ℤ, kernel 0; H₁(C)=ℤ→H₁(X) is the zero map | exact, first arrow not injective; Choice 1.2 line 133 p.211; Bijection.lean:99, DeckGroup.lean:95 |
| §2.3 Klein-bottle cover | A, B on ℝ×ℝ/2ℤ; aba⁻¹=b⁻¹; pinned mapping torus of y↦−y | AB−BA=(0,−2)≡0; [a,b]=b⁻²; π₁/⟨b²⟩=ℤ⊕ℤ/2; (s,y)∼(s+1,−y); N(A⁻¹)=1 | holds; Hat02 lines 2338–2347, pp.51–52 |
| §4.1 torsion convention | ℚ—2→ℚ; A₀=3, A₁=5; degree-0 basis swap | ½ (pinned a⁻¹, Basic.lean:502, j=−1); 10/3 and 3/10=½·3·5⁻¹; −1=1·(−1) | holds; rt3 Prop. A.2 line 1862 p.239 |
| §4.3 total-quotient topology | (2+t^m)⁻¹; a=0 against a=t^m; `isField_iff` | ½−t^m/4+⋯; 0 against t^(−m); IsField R ∧ Injective N (Field.lean:95) | holds; rt3 lines 604–748, pp.220–221 |
| §4.5 partial acyclicity | d=1−g over ℤ[ℤ/2]; lift change by t in degree 0, 1; two-cell circle | (0,2)→(0,½); ×t, ×t⁻¹ (exponent (−1)^i, Basic.lean:451); det[[−1,t],[1,−1]]=1−t | holds; rt3 Def. A.1 line 1851, A.3 line 1886, Def. 1.5 line 305 |
| §4.6 Novikov inequalities | differential 2, c=(1,1); zero differential; a point | b=(0,0): 0≤1, 0=0; b=(1,1): 1≤1, 0=0; 1=1 | holds; signs (−1)^(n−i) (MorseInequalities.lean:62); equality needs d(n+1,n)=0 (ChainComplex.lean:120) |
| §5.1 return germ | P=2x, h=3x; transverse dimension 0 | hPh⁻¹=2x, det(1−2)=−1 in both sections; empty determinant 1 | holds; rt3 §1.1 lines 67–82, p.210 |
| §5.2 local index | x/2 and 2x; x+x²−ε; x+x³∓εx | +1, −1; ±√ε with signs −,+, sum 0; 0(+), ±√ε(−,−) sum −1; 0 alone (−), −1 | holds; rt3 Def. 1.1 line 119 p.211, Lemma 3.2 line 855 p.223 |
| §5.3 product exponent | Klein torus f=−θ+ε sin θ: orbits 0 (i₀=1), π (i₋=1) | log ζ=Σtᵏ/k+Σ(−1)^(k+1)tᵏ/k, ζ=(1+t)/(1−t); rt2 (2) gives (1−t)^(+1) | README (−1)^(dim X−i₀) holds; DetSign.lean:102, 126 |
| §6.2 slide class | h=(−2,1), N(n,e)=−n | N(h)=2; μ(h)≡1 mod 3; ν(h)=2 mod 4, ν(nh)=0 iff n even; b₁=(−1)^(i+1)a₁ | holds; rt3 Lemma 3.7 line 1241 p.229, Lemma 3.8 line 1289 p.230 |
| §6.3 cutoff limits | d=2+t^m; t^m→0; drops 1,2,3,… | first change in degree m; t^(−m)↛0; finitely many below C | holds; rt3 Def. 2.6 line 632, Lemma 4.1 line 1634 p.235, Rem. 4.3 line 1712 p.237 |
| §6.4 calculations | critical-free circle; reflection monodromy; trefoil; `MappingTorus.deck`; Sd(e) | (1−t)⁻¹; (1+t)/(1−t); (t⁻¹−1+t)/(1−t)², ×t⁻² under t↦t⁻¹; deck (x,s)↦(φx,s+1), return φ; λ#Sd(e)=e | holds; rt3 lines 354–417 pp.215–216; rt2 line 150 p.372; rt1 line 80 p.863 |
| `lefschetz_fixed_point_formula` (§6.5) | ∅; dimension-0 point; S¹ reflection; z↦z²; ℝP² rotation; translation of ℝ; id of S¹ | 0=0; 1=1; 2=1−(−1); −1=1−2; 1=1; 0≠1 needs compactness; hypothesis fails | holds; Gra72 Thm. 10.1 line 545 p.224, (I),(II),(VII) lines 206–226 p.214; Hat02 line 7787 p.179 |
| §7.1 Euler chains | S² gradient; T² Morse; ℝP²; maximum in dimension n | 2=χ; +1−1−1+1=0; +1−1+1=1; ∇f gives (−1)ⁿ, −∇f gives +1 | holds without orientation; rt3 lines 1947–2064, pp.241–242 |
| `poincare_hopf` (§7.3) | ∅; two points in dimension 0; S¹ with sin θ∂θ; S² height; constant field on ℝ | 0=0; 1+1=2; +1−1=0=1−1; 2=1+1; 0≠1, excluded by `CompactSpace` | holds; Hat02 Cor. A.8–A.9 lines 22832–22845 p.527, Lemma 3.27(b) line 10259 p.236 |
| `fixedPointDet`, `zeroDet` | f=2x conjugated by 3x; V=(−x,y) conjugated by diag(−1,1); infinite-dimensional model | −1, −1; −1, −1; det=1 junk, excluded by `FiniteDimensional ℝ E` | chart-independent at fixed points and zeros |
| R01 description | pinned names, main against head | `SmoothMappingTorus` 0/25; `flowHittingTime` 0/4; `exists_isMorse` 0/5; `IsSmoothTriangulation` 0/5; the description names none | fails (R01) |
| R02 wording | README lines 929, 958, 2075 | "order2", "product0", "is1" | fails (R02) |

- **Gate:** the worker's gate is 0 on every check. My `gate … --base origin/main` fails only `outside-folder=5`, all in this pull request's own folders (BanachSpaceTheory, SelfAdjointSpectralTheory, the OperatorTheory index). `git diff --stat` outside them is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1903 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. MorseTheory M1, M2 and M6 do not depend on DGFloer, so DGFloer is not reached through MorseTheory either.
- **Elaboration:** `lake env lean TauCetiRoadmap/MorseNovikov/Suggested.lean` exits 0, with only `declaration uses sorry` at 109:8 and 156:8.
  - `#check @` on all 8 declarations matches signatures.md and README §§6.5 and 7.3 binder for binder.
  - `simp`, `rfl`, `infer_instance` and `decide` each fail on both theorems.
  - There is no `set_option` and no sorry'd data.
- **Source locators checked against the text:** 56 (rt3 40, rt2 5, rt1 1, Hat02 6, Gra72 4). Every seeded target matches. rt2 was read from the author's page.
- **Library declarations:** 271 of the 275 backticked README names resolve to the cited file at the pins. The other four are `Fin`, the two `Suggested.lean` theorems, and the instance `AffineAddMonoid.to_twoUniqueSums` (Algebra/AffineMonoid/UniqueSums.lean:28). I opened 70 and compared their hypotheses, map directions and constants with the README; among them: energy is half the drop, the deck direction, the (−1)^i exponents, T₁, FG, domain.
- **Cross-roadmap citations resolved:**
  - On main: MorseTheory M1, M2, M4 and M6; HeegaardFloer Lane M, M.5 (467), M.9 (1162), F0 and F0.6 (1913); DifferentialGeometry Layers 0–3, 5–6, 8, 10 and 12; AlgebraicTopology Stages 1–7 (869–883); GeometricTopology Layers 1, 3–5 and 11, and §4.4 (2740; line 3873 at #1797's head).
  - Consumers: DGFloer §7.C and §7.T (1157, 1375); FukayaTheory #1045 (27, 65); CharacteristicClasses #1808 (51–54); K3Surfaces #1285 (191).
- **Overlap check:** read DGFloer (main, #1798), GeometricTopology (main, #1797), DeRhamCohomologyAndDuality (#2085), GromovWittenTheory (#990), FukayaTheory (#1045), and MorseTheory, HeegaardFloer and DifferentialGeometry (main). The results-and-headings list is empty. Shared objects and their owners:
  - Novikov completion: Tau Ceti `TauCeti.NovikovSeries` (#990 uses it directly; #1045 and DGFloer go through N1).
  - Period homomorphism and `TauCeti.PrimitiveSpace`: Tau Ceti (#2085 consumes them too).
  - Ordinary Morse moduli and the F0.6 return germ: HeegaardFloer.
  - Lefschetz formula, fixed-point index and Poincaré–Hopf: MorseNovikov (#1808 and #1285 defer to it).
  - GeometricTopology §5.4.2 on main cites MorseNovikov's cellular torsion, but there is no layer-level loop (GT 5.4.2 → MN §4.5 → GT Layer 11), and #1797 moves that proof out of GeometricTopology's scope.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3, and the `zeroSign` docstring): not in the manifest, the publisher's copy is paywalled, and it was not fetched.
- Hopf 1929 (`Hop29`): settled as uncertified, and cited by its locator.
- Dold, *Lectures on Algebraic Topology*, Chapter VII (References only): paywalled and not in the manifest.
- Turaev 2001 and 1990, and Pajitnov 2006: paywalled; no target relies on a locator into them.

## Source issues

- **Error** in rt2 at equation (2), p. 371: the source gives each irreducible orbit the exponent −(−1)^(i₀); it should be (−1)^(n−i₀)=−(−1)^(i₊+i₋), which agrees only for odd n (Klein-bottle torus: (1−t)⁺¹ instead of (1−t)⁻¹); affects a stated result.
- **Gap** in rt3 at Lemma A.4, proof, p. 240: the source infers that L_j⊗Q(ℤF) and L_j⊗Q(Nov(F,N)) are fields only from ℤF and Nov(F,N) being domains; it should also use that ℚ is algebraically closed in those fraction fields; affects the proof.
- **Error** in rt3 at §2.1, p. 220: the source identifies each field component F_j of Q(Nov(G,N)) with a tensor product of Nov(G/Ker N, N) with a field; it should say F_j embeds in a Novikov ring over G/Ker N with field coefficients, since Frac ℤ((t)) is not ℚ⊗ℤ((t)); affects the proof.
