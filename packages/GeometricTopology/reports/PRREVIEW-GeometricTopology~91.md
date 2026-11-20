# Review of GeometricTopology (pull request #1797 at 6b9e684)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence of mathematics: 4.1 defines the `n`-component unlink as `n` great circles in disjoint balls, and no such configuration exists for `n ≥ 2`, since two disjoint great circles of `S³` always form a Hopf link. The two findings of the previous review are repaired: AlgebraicTopology is no longer a supplier, and Layer 10.3 no longer plans the Euler classes that CharacteristicClasses C2 owns; its two small corrections are repaired as well. There is one format note and one question for the author, both carried over, and three points for the human reviewers.

## R01 (P2) — For `n ≥ 2` there are no `n` great circles of `S³` in disjoint balls, so the definition of the `n`-component unlink in 4.1 defines nothing

An implementer who writes this definition down gets an empty carrier for every `n ≥ 2`, and the unlink is used as an object afterwards: the all-zero pretzel of 4.7.8 "is the `r`-component unlink", 4.6 gives the HOMFLY polynomial of the `n`-component unlink, and the Checks of 4.1, 4.2 and 4.3.4 compare with the two-component unlink.

In 4.1 (line 1542): "the `n`-component unlink is a set of `n` great circles in disjoint balls". Two disjoint great circles are `S³ ∩ P` and `S³ ∩ Q` for 2-planes with `P ∩ Q = 0`; their linking number is the intersection number of the flat discs `D⁴ ∩ P` and `D⁴ ∩ Q`, which meet once, transversally, at the origin, so it is `±1`. Two circles in disjoint balls have linking number `0`, each bounding a singular disc inside its own ball. So already for `n = 2` the configuration does not exist. The same section says so itself, in the Check *Unknot framings* (lines 1604–1605): "Every great circle disjoint from the unknot forms a Hopf link with it".

The smallest change is one word: "a set of `n` round circles, one in each of `n` pairwise disjoint balls" (or: `n` circles bounding pairwise disjoint embedded discs).

## N01 — One locator in 5.2 still points to the wrong section of Hatcher's notes

In the lens-space item of 5.2 (line 6337) both descriptions of `L_{p/q}` are cited to Section 2.1. The gluing of two solid tori is there (`hatcher-3m` line 1204); the quotient of `S³` by the rotation `(e^{2πi/q}z, e^{2πip/q}w)` is in Section 1.1 (`hatcher-3m` lines 333–335).

## Questions for the author

- In 4.14, the last paragraph before the Checks (line 6007) lists `e^n` among "the lower bounds … stated each with its own count convention and threshold". Which count is bounded below by `e^n`, from which `n`, and by which target or source? The section's own argument gives `liminf ≥ 2` for the `n`-th roots of the prime counts, and `e > 2`; no target or cited text in the section proves an `e^n` bound, so I could not check it. (Asked in the previous review as well; the passage is unchanged.)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 smooth collars | interval, disc, `(1−t²)e^{iθ}`, `x+t` | `t/2`, `1−t/2`: image `[0,½)∪(½,1]`; radial derivative `−2t=0` at `t=0`; `x+t` leaves `[0,1]` at `x=1` | holds | none |
| 2.2 generalized Schoenflies | `n=1,2`; horned sphere | Brown Theorem 5 is the bicollared statement, Theorem 4 its cellularity step; `n=1`: two points, two arcs | holds | none |
| 3.1 `Diff(M)`, degree (changed text) | `S¹⊔S¹` with id ⊔ reflection; `θ+k⁻²sin kθ` | signed count `+1` on one circle, `−1` on the other; `f'=1+k⁻¹cos kθ>0`, `sup|f''|=1` | holds | none |
| 3.2 smooth families | `F_k=exp(i sin(kθ)/k)z`; `−1∈O(n+1)` | `∂_θF_k(0,z)=iz` for all `k` while `F_k→id`; `det(−1)=(−1)^{n+1}`: `+1` in `O(2)`, `−1` in `O(3)` | holds | none |
| 3.3 isotopy extension | `x↦±x` on `D¹`; rotation of `S¹⊂ℝ²` | a diffeotopy of `ℝ` is increasing, so cannot carry `id` to `−id`; rotation cut off outside a disc | holds | none |
| 4.1 knot types, unlink, framings | two disjoint great circles; granny, square; push-offs | flat discs meet once: `lk=±1`; disjoint balls: `lk=0`; signatures `−4`, `0`; disc push-off `lk=0`, Hopf fibre `±1` | unlink definition empty for `n≥2` | R01 |
| 4.2 diagrams, Reidemeister, Markov | words `1212`, `1122`; trefoil code; one-crossing code | one symbol between the two `1`s: odd, non-planar; `3−6+5=2`; `1−2+1=0` | holds | none |
| 4.2.8 Artin action | `A_0` on `x_0x_1`; wrong-side map; `σ_0²`; inverse | `x_0x_1x_0⁻¹·x_0=x_0x_1`; `x_a⁻¹x_bx_a²`; `x_0x_1x_0x_1⁻¹x_0⁻¹`; `A∘A⁻¹` fixes `x_a`, `x_b` | holds | none |
| 4.3.1 Arf algebra, proper links | `xy`, `x²+xy+y²`, their sums; `V` of `σ₁⁴` closure; `m=0` | Gauss sums `2`, `−2`, `4`; zeros `10=2³+2`; `q` zeros 2 of 8, sum `−4`; radical `e₁+e₃`, `q=0`; Arf 1 | holds | none |
| 4.3.4 compression, genus additivity | `T#T`; annulus; punctured torus; unlink annulus | `χ=−1−1−1=−3`, `g=2`; `χ: 0→2`, `−1→1`; `β=2·0+2−1=1` | holds | none |
| 4.4.4 four-band example | the matrix `V` of Hypothesis 4.4.4 | `det(V−tVᵀ)=64−272t+417t²−272t³+64t⁴`; `1` at `1`, `1089` at `−1`; pivots `4, −41/4, 180/41, −121/20`; `(8t−17+8t⁻¹)²` | holds | none |
| 4.4.6 fourteen Seifert surfaces | rows `3₁`, `5₁`, `7₁`, `7₂`, `5₂`; `∇(2i)` | `(n−s+1)/2`: `1,2,3,1`; braid form of `5₂`: `(6−3+1)/2=2`; `|1−4|=3`, `|1+4|=5`, `|1−16|=15`; 6+7+1=14 rows | holds | none |
| 4.5.5 Jones candidates | `E`, `F`, `G`, `R_c` at `±1`; `b41` | `E(−1)=9`, `F(1)=1`, `F(−1)=49`, `G(−1)=−7`; `R_c(1)=3+c`, `R_c'(1)=2+c`, `R_c(−1)=15−c`; writhe `5−7=−2`; spans 9, 9, 6, 7 | holds | none |
| 4.7.8 signed pretzels | `P(2,2,2)`, `P(1,1)`, `P(a₀)`, `P(a₀,a₁)` | 3 components; 2 (Hopf); 1; knot iff `a₀+a₁` odd, matching `e=1`; bands orientable iff equal parities | holds | none |
| 4.8.3 Gordian distance | `b`, `b'`; `T(2,7)`; `P_n`; Feller `n=7,m=5` | 20 letters, exponent sum 0, one 5-cycle; `3+3=6>5`; `5n+2+(n−4)=2(3n−1)`; `7≤(4·5+1)/3=7` | holds | none |
| 7.2 Mostow rigidity, `mostow_rigidity` | genus 2; `sin(2πx)dy` on `[0,¼]²`; `Σi⁻²δ_{σ_i}`; `0,1,∞` | `4π/π=4=2|χ|`; `∫=¼`; variation `π²/6`, `∫dθ/2π=Σ1/i=∞`; fourth vertex `e^{±iπ/3}`; pinned predicate has `3≤finrank` | holds | none |
| 5.2 sign witness (changed text) | `p=7,q=2`; `p=5,q=2` | `−2=5`, `2⁻¹=4`, `5∉{2,4}`; `−2=3=2⁻¹` mod 5 | holds | none |
| 10.3 Thurston, Yazdi; three Lean statements | `Σ₂×S¹`; leaf ⊔ sphere; tubed torus in `S²×S¹` | `|⟨e,leaf⟩|=2=−χ`; `χ=0`, pairing 2; torus: `2>0`; pinned predicates quantify over connected `S`, `χ≤0` | holds | none |
| `markov_theorem` | `σ₀∈B₂` vs `1∈B₁`; trivial braids on 1 and 2 strands | one stabilization, one first move; closures with 1 and 2 crossing-free circles, not Markov equivalent | holds | none |
| `kneser_prime_decomposition`, `milnor_prime_decomposition` | `S³`; `L(2,1)#L(3,1)`; non-orientable `N` | `k=0`; two factors, `π₁=C₂*C₃`; pinned statements carry `Orientable`, `ConnectedSpace`, `CompactSpace` | holds | none |
| `smale_conjecture`, `nonempty_homeomorph_sphere_of_simplyConnected` | pinned proposition; binders | homotopy equivalence with underlying map the pinned inclusion of `O(4)`; compact, `T2`, second countable, simply connected all present | holds | none |
| `moise_triangulation`, `manolescu_triangulation_conjecture_false`, `manolescu_theorem` | `n=3,4,5` | `n=4` not asserted; `5≤n` in both Manolescu statements; connected form in `Type` | holds | none |
| Supply between roadmaps | AlgebraicTopology, CharacteristicClasses, RibbonKnots, FourManifolds | seven `From TauCetiRoadmap.…` contracts, the seven of main; no AlgebraicTopology contract; consumers cite sections that exist (4.3, 4.10, 5.1, 8.3.1, 8.5.2) | holds | none |

- Previous review, finding by finding. R01 (supply both ways with AlgebraicTopology): repaired; the contract is gone, and the layers cite the pin instead ("the van Kampen theorem `TauCeti.isPushout_fundamentalGroup`", "Nothing of AlgebraicTopology is consumed here"). R02 (10.3 planning C2's Euler classes): repaired; 10.3 is now "Thurston's inequality and Yazdi's theorem" on the pinned Euler classes of foliations, and the scope says C2 owns "the Thom class of an orientation and its sign under reversal (C2.1)". C01 (sign witness): repaired, "The witness is `p = 7`, `q = 2`". C02 (description): repaired, "AlgebraicTopology and CharacteristicClasses consume this roadmap and supply nothing to it". N01 and the question on `e^n`: not addressed, kept above.
- Source locators checked against the text: 47 (`thurston-gt3m` Lemma 5.9.1, Proposition 5.9.2, Corollaries 5.9.3 and 5.9.5, Proposition 6.1.4, Corollary 6.1.7, Definition 6.1.8, Theorem 6.2, Lemmas 6.3.1 and 6.3.2, §3.2 and the opening of §6.3; `loeh2006` Theorems 1.2, 3.3, 3.5, 4.1, 5.7, 5.9, Remark 3.6, Definitions 3.7–3.9, 5.1, 5.2, 5.6, Lemmas 3.10, 3.11, Propositions 5.3, 5.5, Corollary 6.2; `zastrow1998` Theorem 3.4; `pyronneau2024` Lemmas 2.11–2.13, Corollary 2.14, Theorem 2.15, pp. 4–5; `hatcher-at` Theorem 3.44, Corollary 3.45; `fyhlmo1985` p. 244; `hatcher-3m` lens spaces; Brittenham–Hermiller Theorem 1.2, §2, Figures 3–6, Corollaries 2.1, 2.2 (arXiv 2506.24088v2); Feller Theorems 2, 3 (arXiv 1301.5248v2); Brown 1960 Theorems 4, 5).
- Library declarations opened at the pin: 20 (`TauCeti.isPushout_fundamentalGroup`, `AlgebraicTopology/FundamentalGroup/VanKampen/Basic.lean` line 349; `TauCeti.finsum_finrank_singularHomology_mayerVietoris`, `AlgebraicTopology/Singular/MayerVietoris/Finrank.lean` line 53; `TopCat.mayerVietorisδ` and `mayerVietoris_exact₁`–`₃`, `Singular/MayerVietoris/Basic.lean` lines 152, 196, 210, 224; `TauCeti.UniversalCover.SubgroupQuotient`, `Classification/SubgroupQuotient.lean` line 58; `isCoveringMap_subgroupQuotientProj`, `Classification/Existence.lean` line 61; `TauCeti.degreeAtRegularValue`, `Geometry/Manifold/Degree/Basic.lean` line 76; `EulerClassBounded`, `eulerClassBounded_neg_iff`, `not_eulerClassNormOne_zero`, `EulerClassNormOne`, `ThurstonEulerClassInequality`, `Foliation/EulerClass.lean` lines 218, 263, 315, 231, 330; `IsMostowRigid`, `MostowRigidity`, `Hyperbolic/Mostow.lean` lines 40, 72; `KneserPrimeDecompositionTheorem`, `MilnorPrimeDecompositionTheorem`, `LowDimTopology/PrimeDecomposition.lean` lines 79, 91; `SmaleConjecture`, `Geometry/Diffeomorphism/Smale.lean` line 46; `IsLocallyFlat`, `LocallyFlat/Basic.lean` line 390).
- Cross-roadmap citations resolved: the seven supplier contracts are those of main; RibbonKnots, FourManifolds, KhovanovHomology and HomotopySpheres cite sections of this roadmap that exist at this head; the citation search over main and the open heads lists nothing unresolved.
- Automatic checks: all passed, the targeted build included. Dependency check, run again: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing outside the folder is changed.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 34 warnings, all `declaration uses sorry`, for 34 theorems; no `variable`, `set_option`, definition or instance. Elaborated types read against the README for the declarations in the table; no binder lost. One-tactic probe (`rfl`, `trivial`, `decide`, `infer_instance`, `assumption`, `simp`) on a copy of the file: all 34 remain `sorry`.

Overlap check: read FourManifolds, KhovanovHomology, HomotopySpheres (main), RibbonKnots, TeichmullerGeometry, PlanarTopology (open); shared: Radó's theorem and the two-dimensional Hauptvermutung (owner here, Layer 11.2.1, on main; PlanarTopology is open and cites Layer 11); knots, sliceness and concordance (owner here, RibbonKnots consumes them); path smoothing in `Diff(M)` (owner TeichmullerGeometry §0.2, deferred here). The other open pull request that changes this folder merges with this head without conflict.

Source independence: 12 passages compared with 9 sources (`thurston-gt3m`, `loeh2006`, `zastrow1998`, `pyronneau2024`, `hatcher-at`, `fyhlmo1985`, Brittenham–Hermiller, Feller, Brown), none shared beyond statements of a dozen words and one set-builder formula; largest share lickorish1997, 66 of about 600 locators; contents compared with lickorish1997 by the chapter numbers the README cites only (Layer 4 uses Chapters 1, 2, 6, 3, 15–16, 9–10 in that order): independent; its text could not be read.

Research link: the end theorems are resolved problems of Kirby's list with their published proofs: Agol–Groves–Manning 2012, Gabai–Meyerhoff–Milley 2009, Li 2011, Kronheimer–Mrowka 2003, Levine 2014, Watanabe 2018, Yazdi 2016, Manolescu 2016; 4.8.3 uses Brittenham–Hermiller 2025. Rests on the README's references and the texts read.

## Not verifiable

- Hirsch (Chapter 2 §1; Chapter 4, Theorem 6.1 and §6; Chapter 8, Theorems 1.3 and 3.1), Lickorish (Chapters 1, 2, Theorem 2.4, Proposition 16.10, p. 187), Ratcliffe (Theorem 11.8.5), Haagerup–Munkholm, Monod (Theorem 7.4.5, Lemma 7.2.6), Rolfsen: recorded as uncertified or not in the cache, no text.
- Lee (Theorems 9.25, 9.26), Palais 1960, Cerf 1961, Birman (Theorem 2.3), Burde–Zieschang, Menasco 1984 (Theorem 1(b)), Kawamura 1998 (Theorem 1.3), Rasmussen 2010 (Corollary 1), Baader, Lecuona–Wand §2: not in the manifest's cache and not read in this run.
- Artin, *Theory of braids* (Theorems 1–16, the Lemma on p. 103), cited throughout 4.2.8: the README links a copy on a third party's university page, which I did not open, its legal status not being clear.
- The tabulated identifications behind Hypotheses 4.4.6, 4.5.5a, 4.5.5b, 4.8.3a and 4.8.3c (Knot Atlas and SnapPy names of diagrams): premises by the README's own convention, not checked.

## Source issues

- **Misprint** in pyronneau2024 at Lemma 2.13, proof, p. 5: the source says the counts of ones and zeros of `φ + q₀` are three times those of `φ` plus `q₀(v)`; it should be `p(φ+q₀) = 3p(φ) + n(φ)` and `n(φ+q₀) = 3n(φ) + p(φ)`; affects the proof.
- **Misprint** in pyronneau2024 at Lemma 2.13, proof, p. 5: the source says `dim V = 2n` where `n` is also its count of zeros; it should be `dim V = 2m`; affects nothing.

## For the human reviewers

- **Supply.** 4.8.3 (lines 5082–5087) consumes the Milnor conjecture "as stated", its proof being CombinatorialHeegaardFloer's, a roadmap that consumes Layer 4 and is no supplier here; the same text is on main. Whether a premise proved downstream is acceptable is yours to decide.
- **Not tested.** `lickorish1997`, the source with the largest share of locators, is uncertified: wording and arrangement were not compared with its text.
- **Licence.** The README links copies the sources manifest does not record: Artin 1947 on a third party's university page (line 2281), Kauffman's and Friedl's author pages; 4.8.3 and 4.5.5 state braid words and DT codes as printed in Brittenham–Hermiller and the Knot Atlas.
