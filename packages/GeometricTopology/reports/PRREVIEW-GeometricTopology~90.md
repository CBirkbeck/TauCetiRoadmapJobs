# Review of GeometricTopology (pull request #1797 at a8416b3)

**Verdict:** needs changes

**Summary.** Changes are needed, for two points of ownership and supply; no stated theorem was found false. This revision makes AlgebraicTopology a supplier of GeometricTopology while AlgebraicTopology, on main, already takes GeometricTopology as its supplier, so supply runs both ways; and Layer 10.3 plans again, in rank two, the Thom class, the obstruction description and the `χ` identity that CharacteristicClasses C2 on main owns in every rank, while saying of C2 something its text does not say. There are two small corrections and one format note, one question for the author, and three points for the human reviewers.

## R01 (P2) — GeometricTopology and AlgebraicTopology each list the other as a supplier, so supply between the two roadmaps runs both ways

An implementer cannot place the two roadmaps in an order: each one's supplier contract asks for the other to be there first, and a reader of *Downstream consumers* and of *Exact supplier contracts* finds AlgebraicTopology in both.

At this head the README has a new subsection `### From TauCetiRoadmap.AlgebraicTopology` (line 11013) consuming Stages 1–8 in Layers 1.4, 2.1, 3.1, 3.2, 4.1, 5.1, 5.2, 6.4, 7.4, 8.2, 8.6, 9.1, 9.2, 10.3, 10.4 and 11.1; the README on main has no such contract and names AlgebraicTopology only as a consumer. AlgebraicTopology on main has `### From TauCetiRoadmap.GeometricTopology` (its line 5573) with `*Needs:* GeometricTopology §11.3` (line 3336) and Layer 1 tubes (line 4130), and uses Layer 1's collars in its 6.3–6.4. The head says so itself: "AlgebraicTopology provides van Kampen's theorem, homology and cohomology, and in turn uses the smooth triangulations built here" (lines 51–52), and *Downstream consumers* (line 9959) and *Scope and ownership* ("every one of which consumes this roadmap", line 10319) still list it as a consumer. I traced the targets and found no cycle among them (1.6 → 11.1 → 11.3 → AlgebraicTopology 8.7 → its Stage 8 → 10.4; 1.1 and 1.5 → AlgebraicTopology 6.3–6.4; its Stages 1 and 7 → 1.4), which is what "the graph of targets is acyclic" claims; but Layer 1 and Layer 11 each both supply and consume AlgebraicTopology, and the two roadmaps cite each other. The automatic dependency check is silent here because it does not report a cycle between two roadmaps that are both on main. The Milnor conjecture has the same shape on a smaller scale: 4.8.3 (lines 5081–5085) "consume[s] as stated" a theorem whose proof is CombinatorialHeegaardFloer's Lane G, and that roadmap consumes Layer 4 (its line 329); main's 4.8.3 already uses it, so that edge is not new.

The smallest change is the author's choice of direction, stated once. Either the few targets AlgebraicTopology takes from here (collars 1.1, tubes 1.5, the realization of 11.1, the smooth triangulation 11.3, none of which needs AlgebraicTopology except 11.1's cellular chains) move to an owner both roadmaps can cite, and this roadmap is then a pure consumer of AlgebraicTopology; or the new `From TauCetiRoadmap.AlgebraicTopology` contract goes and the targets that need Stages 1–8 are left to GeometricTopology, Part II. Whichever is chosen, AlgebraicTopology should then stand in only one of *Downstream consumers* and *Exact supplier contracts*.

## R02 (P2) — Layer 10.3 plans the rank-two Thom class, the obstruction description, the sum formula and `⟨e(TS), [S]⟩ = χ(S)`, which CharacteristicClasses C2 on main already owns, and says C2 compares with them, which C2 does not say

Two roadmaps would each prove the same four statements, and a reader who follows the README's pointer into CharacteristicClasses finds no comparison there.

10.3 (new in this revision, lines 9116–9130) asks to prove that an oriented plane bundle over a CW complex has exactly one integral Thom class compatible with the orientation, with `−u` for the opposite one; that `e(E)` is the primary obstruction to a nowhere-vanishing section; `e(E ⊕ F) = e(E) ∪ e(F)`; and `⟨e(TS), [S]⟩ = χ(S)`. CharacteristicClasses on main has each of these in every rank: existence and uniqueness of the Thom class of an oriented bundle and its sign under orientation reversal (C2.1, its lines 1083–1100, and C2.2), "direct sums and products" and the identification of Euler with the primary section obstruction by the degree of the attaching section (C2.2, lines 1167–1189), and the `χ` identity for closed oriented manifolds (C2.3, lines 1232–1234). The README says "CharacteristicClasses C2 compares its rank-two Euler class with them" (line 9125), "its C2 compares its rank-two Euler class with that plane construction" (line 9975) and the same at line 10236. CharacteristicClasses at main cites this roadmap only for §1.5 and §11.3, a search of main and of every open roadmap head finds no citation of Layer 10.3, and C2.3 says the opposite: "No separate plane-field Euler class enters" (its line 1238).

Since CharacteristicClasses consumes this roadmap, 10.3 cannot simply import C2. The smallest repair keeps in 10.3 what is this roadmap's alone (the orientation of `TF` from a transverse orientation, `F.IsEulerClass e ⇔ e = ±e(F)` on connected `M`, the pairing with an embedded surface) and, for the four bundle statements, either states them as the rank-two cases that C2.1–C2.3 will cite, in the future tense and with the description saying that a revision of CharacteristicClasses follows, or moves 10.3–10.5's use of them behind CharacteristicClasses (GeometricTopology, Part II). The three sentences about what C2 "compares" should say what C2's text says today.

## C01 — The sign witness of 5.2 is the one lens space on which the sign cannot be seen

In the Check *Sign witness* of 5.2 (line 6403) the slope-`5/2` filling is `LensSpace 5 ![1, −2] = LensSpace 5 ![1, 3]`, set against `LensSpace 5 ![1, 2]`. But `2 · 3 ≡ 1 (mod 5)`, so `L(5, 3)` and `L(5, 2)` are homeomorphic preserving orientation (exchange the two coordinates), and `2² ≡ −1 (mod 5)` makes `L(5, 2)` its own mirror. A convention with the opposite sign therefore gives the same oriented manifold at `p = 5`, `q = 2`, and the Check tells the two conventions apart no better than the `ℝP³` Check before it, which the text itself calls invisible. Nothing in it is false. `p = 7`, `q = 2` separates them: `−2 = 5`, and `5 ∉ {2, 4} = {2, 2⁻¹}`, so `LensSpace 7 ![1, 5]` and `LensSpace 7 ![1, 2]` are homeomorphic only reversing orientation.

## C02 — The description does not say that AlgebraicTopology becomes a supplier

The description lists the carriers consumed from Tau Ceti and the proofs handed to other roadmaps, but not that the revision adds a supplier: main's README has seven `From TauCetiRoadmap.…` contracts and this head has eight, the new one being AlgebraicTopology, Stages 1–8. A sentence such as "AlgebraicTopology is now a supplier (van Kampen, homology, Mayer–Vietoris, cohomology and fundamental classes)" would say it; its wording depends on how R01 is settled. The new sections 6.5 and 10.3 could be named in the same sentence.

## N01 — One locator in 5.2 points to the wrong section of Hatcher's notes

In the lens-space item of 5.2 (line 6335) both descriptions of `L_{p/q}` are cited to Section 2.1. The gluing of two solid tori is there (`hatcher-3m` line 1204); the quotient of `S³` by the rotation `(e^{2πi/q}z, e^{2πip/q}w)` is in Section 1.1 (`hatcher-3m` lines 333–335).

## Questions for the author

- In 4.14, the last paragraph before the Checks lists `e^n` among "the lower bounds … stated each with its own count convention and threshold". Which count is bounded below by `e^n`, from which `n`, and by which target? The section's own argument gives `liminf ≥ 2` for the `n`-th roots of the prime counts, and `e > 2`; I found no target or source in the section that proves an `e^n` bound, so I could not check it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 collars, Checks | interval, disc, `(1−t²)e^{iθ}` | `t/2`, `1−t/2`: image `[0,½)∪(½,1]`; without `½` both give `½` at `t=½`; normal derivative `−2t=0` at `0` | holds | none |
| 2.3 annulus, `annulus_conjecture` | `n=0`; equal radii; horned sphere | `[a,b]∖(c,d)=[a,c]∪[d,b] ≅ S⁰×I`; `r=R` fails hypothesis; pinned `coboundAnnulus_smul_coe_sphere` exists | holds | none |
| 3.2 smooth families | `F_k=exp(i sin(kθ)/k)z`; `−1∈O(n+1)` | `∂_θF_k(0,z)=iz` for all `k`, `F_k→id`; `det(−1)=(−1)^{n+1}` | holds | none |
| 4.3.4 genus additivity | `T#T`; annulus; punctured torus | `χ=−1−1−1=−3`, `b=1`, `g=2`; `χ: 0→2`, `−1→1`; `β(U₂)=1`; `β` additive | holds | none |
| 4.4.1 determinants | empty matrix, `[[0,1],[0,0]]`, trefoil, figure-eight | `det V`: `1,0`; `det S`: `1,−1`; trefoil `det S=3`, `Δ(−1)=−3`; figure-eight `−5`, `5` | holds | none |
| 4.4.7 two-strand links | `n=1,2,3,5`; `a=xyxyx`, `b=xy` | `φ²(x)=CxC⁻¹`; `x=b⁻²a`, `y=a⁻¹b³` inverse; `D₂=1−t+t²=F₃`; `C₄=z³+2z`; `C₃=z²+1` | holds | none |
| 4.6.1 Kauffman `F`, `Q` | trefoil, Hopf, `Λ_n` recursion | `Λ₂=(a+a⁻¹)(x−x⁻¹)+1`; `Λ₃` gives stated `F`; image `A⁻⁴+A⁻¹²−A⁻¹⁶`; `d↦−A²−A⁻²`; mirror `=a⁴F` | holds | none |
| 4.7.7 pretzels | `P(±1,±1,±1)`, `P(3,3,3)`, `P(−3,5,7)`, `P(3,5,−7)` | `det(W−tWᵀ)=A(1−t)²+t`; `B=27`, Smith `(3,9)`, `243` at `n=9`; `B=−1`; `B=−41`, `Δ(−1)=41` | holds | none |
| 4.10.3 Nakanishi–Bleiler | `[5,1,4]`, nine switch triples, `E` | pair `(29,5)`; `|p|∈{29,19,9,11,17,5,5,11,3}`; `(1,1,1)↦(−1,−1)`; `E↦(29,6)`, switched `(1,2)`; `5·6≡1` | holds | none |
| 4.10.4 Whitehead exchange | `[2,1,2]`; reorientation | `2+1/(1+½)=8/3`; `(o₀s₀o₁)(o₁s₁o₀)=s₀s₁` | holds | none |
| 4.13 Kondo | `n=1,2,3`; `V₁`, `V₂` | `β=(−1,2)`, `α=(−1,3)`; `β=(1,−4,6)`, `α=(1,−4,8)`; `D₃=−(1−t)³`, `D₄=−(1−t)⁴+t²` | holds | none |
| 4.14 counting | `m=0..6`; `n=4,6,8` | `a_m=0,2,2,6,10,22,42`; `3a_m=2^{m+1}−2(−1)^m`; `C₁C₂=2=Σ`; `N₆=3<5`, `N₈=21<64/3` | holds | question on `e^n` |
| 5.2 fillings | framing change, Hopf `(a,b)`, `1/n`, `p=5` | `λ₀=λ−6μ`, value `−6`; `L(ab−1,b)`: `S³`, `S¹×S²`, `L(5,2)`; `2²≡−1 (5)` | holds; witness weak | C01, N01 |
| 8.5.2 prime-knot groups | trefoil and mirror; granny, square | signatures `±2`; `|σ|=4` and `0`, same group | holds | none |
| 11.5 collapse | `Δ²`, `∂Δ²`, dunce hat | edges of dunce hat in 2 or 3 triangles; `aaa⁻¹` has degree one | holds | none |
| 6.5 boundary convention (changed text) | `L×[0,1]`, orientation `(τ,∂_t)` | at `t=1`: `(∂_t,v)` positive iff `v=−τ`; at `t=0`: `v=τ`; so `∂Σ=L×0 ∪ −L×1` | holds | none |
| 10.3–10.5 Euler class, norm | `S²×S¹`, `Σ₂×S¹`, tubed torus | `⟨e,[S²]⟩=2`, `x=0`; torus `T`: `2>0=−χ`; fibre: `−2`, `x=2`; fibre ⊔ sphere: `χ=0`, pairing `2` | holds | R02 (ownership) |
| `smale_conjecture`, `watanabe_theorem` | pinned propositions | Watanabe: `A₂≅ℚ` gives `π₂BDiff⊗ℚ≠0` (`watanabe2018` lines 32–36); neither proved at the pin | holds | none |
| `markov_theorem` | empty words on 1 and 2 strands | closures record `crossinglessComponentCount` 1 and 2; component count is invariant on both sides; forward half pinned | holds | none |
| `property_P`, `property_R`, `gordon_luecke_theorem`, `cyclic_surgery_theorem` | unknot; meridian slope; `p/q` | `H₁=ℤ/p`; unknot `5/2` is `L(5,2)`, cyclic, excluded by Seifert hypothesis; `km2004` Theorem 2 is `+1` only | holds | none |
| `mathieu_chirally_cosmetic_theorem` | `k=0` | `(18k+9)/(3k+1)=9`, `/(3k+2)=9/2`; `gcd(18k+9,3k+1)=gcd(3,3k+1)=1` | holds | none |
| `freedman_slice_theorem`, `levine_homology_concordance_theorem` | pinned propositions | Levine: with `Y=S³` every knot is concordant to itself, so the witness has `Y≠S³` | holds | none |
| `mostow_rigidity`, `gabai_meyerhoff_milley`, `virtual_fibering_conjecture` | pinned propositions | `gmm2009` line 52: unique smallest, `0.9427…`; `agol2013` line 29 | holds | none |
| `agol_virtually_haken_of_aspherical`, `virtual_haken_conjecture` | `S³`, `ℝP³`, `S²×S¹`; nonorientable `M` | `π₃(S³)=ℤ`, `π₂(S²×S¹)=ℤ` excluded; pinned Haken predicate allows nonorientable covers; `agol2013` line 27 | holds | none |
| `alexander_sphere_bounds_ball`, `sphere_theorem`, `smoothAmbientIsotopic_unknot_of_knotGroup`, `gordon_luecke` | `S¹×ℝP²`; disconnected `M` | `π₂=ℤ` but irreducible; nontrivial class is not freely null-homotopic; `hatcher-3m` line 2152 | holds | none |
| `kneser_prime_decomposition`, `milnor_prime_decomposition`, `waldhausen_theorem`, `jsj_theorem` | `S³` | empty sum; `hatcher-3m` lines 166 and 531 | holds | none |
| `geometrization_conjecture`, `nonempty_homeomorph_sphere_of_simplyConnected` | binders | compact, Hausdorff, second countable, simply connected all in the signature | holds | none |
| `li_rank_genus_theorem` | `n=0` | `rank+0<genus` refutes rank = genus; `li2013` lines 66–68 | holds | none |
| `thurston_euler_class_inequality_of_isSphereBoundsBall`, `thurston_euler_class_inequality` | `S³`; `S²×S¹`; non-co-orientable `F`; wild `f` | no taut foliation; fails without irreducibility (`2>0`); `IsEulerClass` forces co-orientation; Bing approximation keeps genus | holds | none |
| `yazdi_infinite_family` | `k=0` | equals pinned `YazdiEulerClassOneTheorem`; sharpness passes to one component with `χ<0`; `yazdi2016` line 111 | holds | none |
| `rado_triangulation`, `moise_triangulation`, `manolescu_triangulation_conjecture_false`, `manolescu_theorem` | `n=0,4,5`; empty `M` | `n=0` pinned true; `n=4` false, not asserted; dim-5 examples non-orientable (`manolescu2016` line 257) | holds | none |
| Supply between roadmaps | AlgebraicTopology, CombinatorialHeegaardFloer, CharacteristicClasses | both `From` contracts exist; target chain acyclic; C2 has no citation of 10.3 | defect | R01, R02 |

- Source locators checked against the text: 19 (`hatcher-at` Example 1.24; `hatcher-3m` Theorems 1.5, 1.9, 3.8, lens spaces; `agol2013` 9.1, 9.2; `gmm2009` 1.1; `li2013` 1.1; `watanabe2018` 1.1 and Remark 1.2; `manolescu2016` 1.1 and line 257; `km2004` Theorem 2; `yazdi2016` Main Theorem, (1), (2), Theorem 1.2, Proposition 3.12; `lickorish-millett1987` Example 16; `ng2005` §8.6; Kondo, Theorem 3, (*), (8), pp. 557–559; Balm–Friedl–Kalfagianni–Powell §7.2).
- Library declarations opened at the pin: 14 (`IsAspherical`, `EilenbergMacLane/Basic.lean` line 59; `IsVirtuallyHaken`, `VirtuallyHaken.lean` line 63; `IsPossiblyNonorientableClosedHakenThreeManifold`, `Haken.lean` line 204; `EulerClassBounded`, `EulerClassNormOne`, `ThurstonEulerClassInequality`, `YazdiEulerClassOneTheorem`, `Foliation/EulerClass.lean` lines 218, 231, 330, 387; `IsSphereBoundsBall`, `Irreducible.lean` line 42; `IsClosedConnectedManifold`, `Manifold/Basic.lean` line 57; `IsTriangulable`, `Triangulable/Basic.lean` line 38; `TriangulationConjecture`, line 77; `BraidWord.closure`, `BraidWord/PDCode.lean` line 390; `IsReidemeisterMove`, `Reidemeister/Equivalence.lean` line 95; `MathieuChirallyCosmeticTheorem`, `Cosmetic.lean` line 316).
- Cross-roadmap citations resolved: AlgebraicTopology (Stages and its contract from this roadmap), CharacteristicClasses C2.1–C2.3, CombinatorialHeegaardFloer Lane G items 7 and 10 and Lane K, TeichmullerGeometry §0.2 (open head), Poincare3D 15.2; the citation search over main and the open heads lists nothing unresolved.
- Automatic checks: all passed, the targeted build included. Dependency check, run again: `depcheck: 199 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (see R01 for what it does not report). Nothing outside the folder is changed.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 34 warnings, all `declaration uses sorry`, for 34 theorems; no `variable`, no `set_option`, no definition. `#check @name` on all 34 in one scratch copy: types as in the file, no binder lost. One-tactic probe (`rfl`, `trivial`, `decide`, `infer_instance`, `simp`, `assumption`): all 34 remain `sorry`; none of the pinned propositions is proved at the pin.
- Previous review (at `5cb54fc`): no finding to re-check. The text new since then is the opening overview, the boundary-convention sentences of 6.5 and three consumer lines; the rest of the 6475 changed lines is the scope and supplier sections moved to the end.
- Overlap check: read FourManifolds, KhovanovHomology, HomotopySpheres, RibbonKnots, TeichmullerGeometry, PlanarTopology, and AlgebraicTopology, CharacteristicClasses and CombinatorialHeegaardFloer; shared: Thom class, obstruction description and `χ` identity (owner CharacteristicClasses C2, R02); path smoothing in `Diff(M)` (owner TeichmullerGeometry §0.2, deferred here); link cobordisms with labels (owner KhovanovHomology, 6.5 relates conventions); Radó's theorem (owner here, Layer 11.2.1, on main; PlanarTopology is open).
- Source independence: 21 passages compared with 12 sources, none shared (statements are restated with their own hypotheses and notation); largest share lickorish1997, about 32 of some 600 locators; contents compared with lickorish1997's chapter list as the README's reference entry gives it (Layer 4 uses Chapters 1, 2, 6, 3, 15–16, 9–10 in that order): independent; its text is not in the cache.
- Research link: the end theorems are resolved problems of Kirby's list and their proofs' statements: Agol–Groves–Manning 2012 (virtual Haken), Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016; rests on the README's references and the cached texts read.

## Not verifiable

- Hirsch (Chapter 4, Theorem 6.1; Chapter 2 §1), Lickorish (Theorem 2.4, Chapters 2 and 12), Thurston 1986 (Theorems 1, 2, Section 3), Gabai 1983 (Corollary 6.18), Farb–Margalit (Theorem 2.5): recorded as uncertified, no text.
- Lee (Theorems 9.25, 9.26), Kirby 1969, Quinn 1982, Rolfsen (Chapters 2, 9), Milnor–Stasheff (Theorem 10.4, Corollary 11.12), Whitten 1987, Friedl (Theorem 16.11, footnote 115), Bleiler 1984, Zeeman 1964, Manolescu's J. Amer. Math. Soc. paper (Corollary 1.3), Kauffman–Lambropoulou, Bernardi: not in the manifest's cache and not fetched in this run.
- That `Q(8₈) ≠ Q(10₁₂₉)` and that 11a255 and 11a257 have different `P`, Conway and Alexander polynomials (4.6.1, "by evaluation"): the cited texts state only the equalities.
- The description's sentence that the head of #1791 conflicts with this one: that head was not among the checkouts I could read.
- Ownership against open pull requests was checked through the search over open heads; of the closest open roadmaps only TeichmullerGeometry was read in a checkout.

## Source issues

- none

## For the human reviewers

- **Scope of the supply rule.** R01 rests on reading "a single direction of supply" between roadmaps and layers; the README argues acyclicity of targets only ("How to read the build"), and the automatic dependency check does not report cycles between roadmaps both on main.
- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified: wording and arrangement were not compared with its text, only with the chapter numbers the README cites.
- **Licence.** The README links works that the sources manifest (52 entries) does not record, among them Kondo 1979 (Osaka repository), Balm–Friedl–Kalfagianni–Powell and Friedl's notes (author page), Kauffman's and Millett's author-page files.
