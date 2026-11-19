# Review of ComplexKahlerGeometry (pull request #2536 at 1b8217e)

**Verdict:** needs changes

**Summary.** Moving soft-sheaf acyclicity to SmoothBundlesConnections B6.1 is mathematically sound. B6.1 on main proves exactly what 2.5 and 4.5 now cite, under hypotheses that this roadmap's Conventions satisfy. One finding blocks: the paragraph of 2.5 that this revision edits still tells the implementer to construct the Čech refinement maps and prove that they are independent up to homotopy. Tau Ceti pins these, and TopologicalSheafCohomology on main owns them, so the object still has two owners in the paragraph this pull request sets out to clean up. There are two small corrections: the description misstates what 4.5 proves and omits the target 2.5 drops, and TopologicalSheafCohomology's scope sentence still names K2 as the owner of fine-sheaf acyclicity. There are no format notes. Licence questions about three lecture-note sources are left to the humans.

## R01 (P2) — Section 2.5 plans the Čech refinement maps and their homotopy independence, which Tau Ceti pins and TopologicalSheafCohomology owns

An implementer of 2.5 would rebuild a pinned construction. The roadmap would also keep two owners for one object in the paragraph whose second owner this revision exists to remove. In 2.5, lines 508–509, the route to the paracompact Čech/derived comparison reads "Construct refinement maps, prove independence up to cochain homotopy, use paracompact shrinking for exactness after refinement".

At the Tau Ceti pin, `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/Basic.lean` declares three of these objects, for every presheaf with values in a preadditive category with products:
- `cechComplexMap` (line 278): the map of Čech complexes induced by a refinement, that is, a morphism of families;
- `cechComplexMapHomotopy` (line 377): two refinements induce homotopic maps;
- `cechComplexHomologyMap_eq` (line 419): they induce the same map on cohomology.

`…/Cech/Colimit.lean` line 92 declares `cechCohomologyDiagram`, the Čech cohomology diagram over a preorder of covers. SmoothBundlesConnections B6.1 on main already consumes all four. TopologicalSheafCohomology on main owns, in §§1.1–1.2, the raw refinement maps with their prism homotopy and the cover colimit on arbitrary spaces, including the comparison of cofinal cover systems. The README's "From Tau Ceti" contract names none of these.

The smallest change is to replace the clause in lines 508–509 by: "Consume Tau Ceti's refinement maps of Čech complexes and their independence up to homotopy (`TauCeti.CategoryTheory.cechComplexMap`, `TauCeti.CategoryTheory.cechComplexMapHomotopy`, `TauCeti.CategoryTheory.cechComplexHomologyMap_eq`) and the diagram `TauCeti.CategoryTheory.cechCohomologyDiagram` over the locally finite open covers; prove here the paracompact shrinking for exactness after refinement". Then add the four names to "From Tau Ceti". If you would rather take the colimit itself from TopologicalSheafCohomology §1.2, whose cofinal-system comparison covers the locally finite covers of a paracompact space, cite it there. In that case, update its scope sentence on K2 in the same round (C02), so that the two roadmaps do not cite each other.

## C01 — The description misstates what 4.5 proves and omits the target 2.5 drops

The description says "4.5 still proves that its two function sheaves are soft". At this head, 4.5 proves only that `C⁰_ℂ` is soft, by continuous partitions of unity. It takes the softness of `C^∞_ℂ` from B6.1's module form (lines 1106–1108; `*Needs:*`, lines 1171–1172).

"No statement of this roadmap changes" leaves out that 2.5 no longer states fine-implies-acyclic as its own target; main's line 503 reads "Prove fine-implies-acyclic on the paracompact Hausdorff manifolds here". Also, the "Not owned here" list is the list under Scope and ownership (line 3445).

The description would be accurate as: "4.5 proves that the sheaf of continuous functions is soft, takes the softness of the smooth one from B6.1's module form, and cites B6.1 for the acyclicity of both." Add: "2.5 no longer states fine-implies-acyclic as its own target; no other statement and no Lean declaration changes." The last bullet would name "the Scope and ownership entry" in place of "the Not owned here list".

## C02 — TopologicalSheafCohomology still names ComplexKahlerGeometry K2 as the owner of fine-sheaf acyclicity

TopologicalSheafCohomology's scope, at `TauCetiRoadmap/TopologicalSheafCohomology/README.md` line 12 on main, says that ComplexKahlerGeometry K2 "owns analytic resolutions, fine-sheaf acyclicity and Čech/derived comparison on paracompact Hausdorff manifolds". The head of its open revision, pull request #2533, says the same at line 12. After this merge, K2 cites SmoothBundlesConnections B6.1 for acyclicity, so that sentence becomes false. Nothing breaks, because TopologicalSheafCohomology does not consume K2.

Say in the description that this ownership moved, so that the TopologicalSheafCohomology revision can read: "SmoothBundlesConnections B6.1 owns soft-sheaf acyclicity; ComplexKahlerGeometry K2 owns analytic resolutions and the Čech/derived comparison on paracompact Hausdorff manifolds".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 type calculus, Nijenhuis | X, Y of type (0,1); real v, w | `N(X,Y)=−4[X,Y]^(1,0)`, so `∂̄²f(v,w)=−¼∂f(N(v,w))`; pin `delBar_delBar_apply` (Dolbeault/Basic.lean 405) has `−(4)⁻¹` | sound | none |
| 2.1 ∂̄ calculus, Cauchy transform | `T=π⁻¹∫(w−z)⁻¹f` | pin gives `∂̄∫(w−z)⁻¹f=πf` (Pompeiu/Basic.lean 261), so `∂̄Tf=f`; derivative lemma at line 219 | sound | none |
| 2.3 parameter solver, `exists_mixed_parameter_dbar_solution` | `f=q̄`; shells | `∂̄_qT(χq̄)=T(χ)≠0`, excluded by `hfhol`; `K_j=C_(2j)⊂int C_(2j+1)⊂int K_(j+1)`; Rainer Thm 12.2 p. 31 on a domain | sound | none |
| 2.2 Runge Checks | annulus `2≤|z|≤3` in `|z|<4`, `f=1/z` | `∮(f−Af)=2πi`, length 4π, sup ≥ 1/2; collar `3/2≤|z|≤7/2`: `sup_L|f|=2/3`, so none for ε<3/4 | sound | none |
| 2.5 soft acyclicity (this change) | type forms over `C^∞_ℝ` | module over a soft ring ⇒ soft (Demailly IV (4.18), p. 205) ⇒ acyclic ((4.15)); B6.1's module form needs f.d. T2 second-countable, as Conventions give | sound | none |
| 2.5 refinement maps | Tau Ceti pin; TopologicalSheafCohomology §§1.1–1.2 | `cechComplexMap` 278, `cechComplexMapHomotopy` 377, `cechComplexHomologyMap_eq` 419, `cechCohomologyDiagram` 92 | duplicated | R01 |
| 2.5 locators | (5.17), (5.21), (6.13)–(6.15), V (11.7) | Leray p. 209; paracompact Čech p. 211; Dolbeault p. 216; bundle Dolbeault p. 268 | sound | none |
| 3.2 Weierstrass, three theorems | `w²−z`; `w³`; `d=0` | `u=1`, `a=(−z,0)`; `w³=w(w²−z)+zw`; `d=0` gives `u=f`; (2.1)–(2.4) p. 80 | sound | none |
| 3.4 local algebra, `ruckert_nullstellensatz`, `oka_coherence`, `cartan_coherence_reducedIdeal` | `k=0`; `(z₁,z₂)`; `(zw)²`; node | `g≡0`, `m=1`; relation `(z₂,−z₁)`; generator `zw`; `t↦(t(t²−1),t²−1)` gives `z²=w²+w³` | sound | none |
| 3.4 locators | (2.7), (2.10), (3.19), (4.19), (4.22), (4.24), (4.26), (4.29), (4.31) | pp. 80, 82, 89, 95, 97, 98, 98, 99, 100: each statement matches | sound | none |
| `riemann_extension`, `hartogs_extension_across_point` | `k=0`; `1/z`; doubled origin | `U=∅`; unbounded, excluded by `hbdd`/`hE`; charted space is T1, so `{p}ᶜ` open, extension in p's chart | sound | none |
| `isRegularLocalRing_holomorphicStalk`, `uniqueFactorizationMonoid_holomorphicStalk` | `E=0`; `E=ℂ` | field of dimension 0; DVR of dimension 1; `M : Type` forced by ℂ-valued sheaf | sound | none |
| 4.1 section sheaves | trivial line on ℂP¹; `F=0`; ideal of 0 in ℂ² | constants; zero module; `dim 𝔪/𝔪²=2`; V (8.1) p. 263, (11.1) p. 267 | sound | none |
| 4.2 Chern connection | `h=e^(−|z|²)`; `g=e^z` | `A=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz`; (12.1)–(12.4) pp. 268–269 | sound | none |
| 4.5 softness (this change) | `C⁰_ℂ`, `C^∞_ℂ`; S¹ | Urysohn φ=1 near S, supp in W, φs extends by 0; smooth case is B6.1 module form; constant ℂ on S¹ has `H¹=ℂ` | sound | C01 |
| 5.1 star type law | `(p,q)` in dimension 2n | `p′+q′=2n−p−q`, `p′−q′=p−q` give `(n−q,n−p)`; barStar `(n−p,n−q)`; pin Complex.lean 219, 233 | sound | none |
| 5.2 distribution structure | `H_m`; `z^β∂^βδ`; `1/(1+2x)` | `D^mH_m=δ`, `C^(m−2)`; factor `(−1)^|β|β!`; `(−1)^n(−2)^n=2^n` (DeltaSeries.lean 68); H–S 4.22 pp. 89–90, 1.70 p. 35 | sound | none |
| 5.3 Fréchet, Montel | `sin(nθ)`; `Σφ(n)` | seminorms 1, n; bump at `n>R+1` pairs 1 while seminorms on `[−R,R]` vanish; Montel.lean 46, 104 | sound | none |
| 5.9 Hermitian identities | standard metric on ℂ | `|dz|²=2`; `dz♯=∂_x−i∂_y=2∂_z`; `∂̄*(f dz̄)=−2∂_zf`; symbol ½|ξ|²; Demailly VI §7 p. 309, # at line 14356 | sound | none |
| `hodge_theorem_deRham` | circle; m≠dim | `d*(f dθ)=−f′`, kernel a line; excluded by the `Fin m` orientation | sound | none |
| `finiteDimensional_dolbeaultCohomology`, `finrank_dolbeaultCohomology_serre` | Hopf; ℂP¹; `p>n` | `h^(0,1)=1=h^(2,1)`; `1,0,0,1`; ℕ-subtraction junk excluded by `hp`, `hq` | sound | none |
| `IsKahler`, `del_delBar_lemma`, `…_eq_sum_dolbeault`, `…_symm`, `even_…_odd` | κ on ℂ²; Kodaira–Thurston; curve; ℂP¹ | `κ(v,Jv)=|v|²+a₂b₁−a₁b₂≥|v|²/2`, `κ(∂y₁,∂y₂)=0≠1`; `b₁=3`; `2=1+1`; `b₂=0+1+0` | sound | none |
| `lefschetzMap`, `hard_lefschetz` | ℂP²; S²×S² | `[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`, `σ₁²=0` | sound | none |
| ℂPⁿ: Hodge, Betti, `integralCohomology_…`, `integralCupPow` | n=0,1,2; S²∨S⁴ | `u=0`, `u⁰` generates H⁰; `h^(2,2)(ℂP¹)=0`; `u²=0` fails the ring condition | sound | none |
| `finrank_dolbeaultCohomology_complexTorus` | n=0,1,2; `L=ℤ⊂ℂ` | 1; `h^(2,0)=0`; `1+4+1=6=C(4,2)`; excluded by `IsZLattice ℝ L` | sound | none |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves | `2=2`, `4=2·2`; no connectedness needed | sound | none |
| 6.4 analytic cycles | cuspidal cubic; `xy=0`; k=0 | `[V]=3[ℂP¹]`; `2[ℂP¹]`; point sum; III (2.6)–(2.7) p. 140; Łojasiewicz Thm 2 p. 464 | sound | none |
| 6.1 normal coordinates | ℂP¹ chart scaled by √π; `diag(1+z₂+z̄₂,1)` | `H=(1+π|w|²)^(−2)`, `|H−1|≤2π|w|²`; `dω(0)=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0`; Ballmann 4.17 pp. 47–48 | sound | none |
| 7.4 incidence blowup | chart change i→k; d=2, k=1 | `a′=az_k`, `z′_i=1/z_k`, `z′_j=z_j/z_k`; character `t⁻¹`; `F(tv)=t⁻¹F(v)` forces F=0; Knutson §1 p. 1 | sound | none |
| 7.9 Hopf surface | weights on `Ω¹`; functions | `2^(a+b+1)`, `2^(1−m−n)`: none 1, so `h^(1,1)=0`; constants give `h^(0,1)=1`; VI (4.7) p. 297 | sound | none |
| 8.1 Frölicher, `finrank_deRhamCohomology_le_sum_dolbeault` | `E₁^(1,0)`; Iwasawa; stable page | native `(3,−2)→(5,−3)=E₁^(2,0)`; `4≤5`; `r>max(p,n−p)`; IV (10.8)–(11.6) pp. 226–228, VI (11.1)–(11.7) pp. 322–323 | sound | none |
| `newlander_nirenberg`, `dolbeault_grothendieck_polydisc` | n=0; `r_k≤0`; `q+1>n` | a point, φ constant; empty polydisc; form zero | sound | none |

- Previous review, finding by finding:
  - R01 repaired: the contract (lines 3618–3621) reads "B6.1–B6.3 (… and the rank-one Chern–Weil comparison)", and the `*Needs:*` lines of 7.3 (2762–2763) and 4.5 (1171) name B6.3.
  - R02 repaired: Checks stand at 896–909 (4.1), 1431–1445 (5.3) and 1995–2005 (5.8).
  - R03–R05 concerned the description of the earlier pull request, merged as 4306cc7, and do not apply here.
- Source locators checked against the text: 49. `demailly-agbook` accounts for 42: Ch. I–VII at lines 3794–3936, 4286, 4399, 4613–4935, 6997, 7027, 10196–10272, 10439, 10512, 10730–10742, 11208–11287, 12975, 13017–13051, 13157, 13215–13254, 14583, 14702, 14858–14868, 15370–15395, 15523, 15946–16006. The rest: `hormann-steinbauer-distributions` 1522, 3744–3771; `rainer-advanced-complex-analysis` 1630; `ballmann-kahler` 1829–1872, 1990–2002; `lojasiewicz-triangulation` 512; `knutson-borel-weil` 12–43.
- Library declarations opened at the pins: 24.
  - Tau Ceti: Dolbeault/Basic.lean 405, 414; Nijenhuis.lean 158, 170, 346; Eigenbundle.lean 96; AlmostComplexStructure.lean 221; Pompeiu/Basic.lean 219, 261; DeltaSeries.lean 68, 97; HodgeStar/Complex.lean 161, 219, 233; HodgeStar/Basic.lean 236; VolumeDensity/Volume.lean 179; Cech/Basic.lean 278, 377, 419; Cech/Colimit.lean 92.
  - Mathlib: Montel.lean 46, 104; TestFunction.lean 335.
  - A further 14 names of 2.1 and 2.3 were each found declared.
- Cross-roadmap citations resolved:
  - SmoothBundlesConnections B6.1 (main 1710–2051), B6.3 (2101);
  - GlobalHolomorphicFunctions Layer 2.5 (1380; `exists_finite_rank_runge_operator`, Suggested 177, with `IsRungeCompactPair` at 141 matching `IsFilledIn`), 7.1 (2268; 290) and 7.2 (2339; 327);
  - TopologicalSheafCohomology (main 12, §§1.1–1.3), CalibratedGeometry 4.2–4.3, ComplexComparisonPartII 146–149.
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Gate rerun on this head: every scanner reports 0, including the check for changes outside the folder; result OK.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 27 `sorry` warnings and nothing else.
  - I ran `#check @name` on all 34 declarations: every theorem keeps its `FiniteDimensional`, `T2Space`, `CompactSpace` and `Boundaryless` binders. `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap` drop only binders their bodies do not use.
  - One-tactic probe (`first | rfl | infer_instance | simp | trivial | decide`) on a scratch copy: none of the 27 closes.
- Headlines: the Summary's headlines are all stated (Newlander–Nirenberg, the polydisc lemma, the regular factorial stalk, finiteness, Serre symmetry, Hodge decomposition in dimension form, Hodge symmetry, even odd Betti numbers, Hard Lefschetz, the Frölicher inequality). The module docstring names the unstatable ones (Hopf diamond, Iwasawa manifold, Frölicher degeneration) with the carrier each lacks. No padding.

Overlap check: I read TopologicalSheafCohomology, SmoothBundlesConnections, CalibratedGeometry and ComplexComparisonPartII on main, and TeichmullerGeometry, SchrodingerOperatorsAndSpectralTypes and RelativisticQuantumFieldTheory at their open heads.
- Soft-sheaf acyclicity and module softness: owner SmoothBundlesConnections B6.1, now cited.
- Čech refinement maps and their homotopy: owners Tau Ceti at the pin and TopologicalSheafCohomology §§1.1–1.2; still planned in 2.5 (R01).
- Wirtinger equality on complex planes: owner CalibratedGeometry 4.2. 6.4 obtains it on `V_reg` from its own 5.9 normalization `dvol=ωⁿ/n!`.
- ComplexComparisonPartII's "K2's fine Dolbeault resolution" still holds.
- The three open roadmaps only consume K1, K3, K4, K5a and K5b.

Source independence: 21 passages compared with 7 sources: the sampled locators plus six further passages (2.5's new acyclicity sentence, 4.5's softness paragraph, 6.1's normal-coordinate route, 7.2's Fubini–Study invariance, 8.1's Frölicher adapter and the `weierstrass_preparation` docstring). None share wording beyond statements the mathematics forces. Largest share: `demailly-agbook`, 58 of 116 source mentions. Contents compared with `demailly-agbook` (Chapters I–IX): independent.
- Layers 1, 5 (K5a), 7 and 8 match no chapter.
- Layer 2 draws on Chapters I and IV, Layer 3 on II, Layer 4 on V, and Layer 6 on III, VI and VII.
- The order is forced by 3.1 preceding Layer 1, 4.1 using 3.1's sheaf, 5.9 using Layer 4 and 6.3 using 5.10.

Research link: Layer 8's Iwasawa-manifold computation and nilmanifold comparisons are the base of Angella (2012)'s study of the cohomologies of the Iwasawa manifold and its small deformations. K7.FlatDegreeZero's unitary-character lines are the elliptic input of Berwick-Evans and Tripathy (2021)'s de Rham model of equivariant elliptic cohomology. This rests on the README's References and `angella-iwasawa` §4.

## Not verifiable

- `koszul-malgrange` pp. 102–109 (4.2) and `hormander-alpdo1` Theorems 2.3.4–2.3.5 (5.2): settled as uncertified; cited by locator only.
- `webster-nn`, `griffiths-harris`, `wells-dacm`: settled as uncertified; cited by locator only.
- `raghunathan-discrete-subgroups`, `nomizu-nilmanifolds`: settled as uncertified; outside this round's sample.

Automatic checks set aside as false positives: the citation scan's two "names found nowhere" are module paths (`TauCeti.Analysis.Distribution.DeltaSeries`, `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`) whose files exist at the Tau Ceti pin. The scan searches declarations, not modules.

## Source issues

- none

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes read from their authors' university pages. `hormann-steinbauer-distributions` is a dated draft of lecture notes on an author's page.
- **Licence.** `ballmann-kahler` (EMS, 2006) is read from a third party's course page (people.maths.ox.ac.uk), not from the publisher or the author.
