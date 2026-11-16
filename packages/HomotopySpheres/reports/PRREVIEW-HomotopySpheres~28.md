# Review of HomotopySpheres (pull request #284 at 64bdd7e)

**Verdict:** needs changes

## R01 (P2) — §3A.4 and GeneralizedCohomology G2 item 5 now supply each other

**Location:** `TauCetiRoadmap/HomotopySpheres/README.md` lines 1017–1030: "*Needs:* 3A.2–3; GeneralizedCohomology G2 item 5 … Apply GeneralizedCohomology G2 item 5 to the `(n−1)`-connected CW complex `Sⁿ`". Also lines 180–181.

**Claim:** §3A.4 can take the sphere suspension range from G2 item 5. This is the repair the previous review asked for in its R01; that request was wrong for a roadmap whose Stage 3A is G2's supplier, and it is withdrawn.

**Witness:** main `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37 lists "stable sphere stems and Freudenthal" of HomotopySpheres Stage 3A as G2's supplier, and this README (lines 3392–3394) says GeneralizedCohomology consumes 3A.2–3A.4. Lines 502–504 already take the range from RiemannianGeometry R3 item 4.

**Repair:** in line 1017 write "*Needs:* 3A.2–3; RiemannianGeometry R3 item 4; AlgebraicTopology Stage 4 item 4's raw sphere suspension." Replace lines 1023–1030 with "Thus for `n ≥ 2` the same map `π_q(Sⁿ) → π_(q+1)(S^(n+1))` is an isomorphism for `1 ≤ q ≤ 2n−2` and a surjection for `q = 2n−1` (Hatcher, Corollary 4.24, p. 360), and the colimit map from `π_(n+k)(Sⁿ)` is an isomorphism for `n ≥ k+2`." Delete the sentence "[GeneralizedCohomology G2 item 5] supplies general Freudenthal for connected pointed CW complexes." at lines 180–181. G2 items 4–5 stay in §3B.6, which nothing in Stage 3A needs.

## R02 (P3) — Three passages still describe the unoriented corollary and the Lean file as they were

**Location:** `README.md` lines 326–329: "keeps compactness and second countability as explicit hypotheses because the route of Sections 10.1–10.3 uses them"; lines 566–572: "this predicate at n = 6 for compact second-countable M … Both are kept"; lines 586–595.

**Claim:** the README's generality equals the Lean signature's, and the list at lines 586–595 is what `Suggested.lean` states.

**Witness:** `Suggested.lean` lines 370–372 carry only `[TopologicalSpace M] [T2Space M]`, and §10.4 (line 3344) says "for a Hausdorff space `M`". Lines 586–595 omit the three Wall theorems of `Suggested.lean` lines 288–299.

**Repair:**
- Lines 326–329: "The unoriented corollary is Mathlib's smooth Poincaré predicate at n = 6 on a Hausdorff space; compactness and second countability are derived from the homotopy equivalence in Section 10.1."
- Lines 566–572: replace from "Layer 10's unoriented corollary" to the end of the paragraph with "Layer 10's unoriented corollary is this predicate at n = 6. Compactness and second countability are not hypotheses: a homotopy equivalence with S⁶ makes M connected with H₆(M;ℤ) ≅ ℤ, a connected noncompact n-manifold has Hₙ = 0 (Hatcher, *Algebraic Topology*, Proposition 3.29, p.239, for manifolds that are only Hausdorff and locally Euclidean), and a compact charted space is second countable (`ChartedSpace.secondCountable_of_sigmaCompact`, `Mathlib/Geometry/Manifold/ChartedSpace.lean`, line 236)."
- Line 595: write "…, `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six`, `nonempty_evenWallGroup_two_mul_addEquiv_int`, `nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two` and `oddWallGroup_subsingleton`."

## R03 (P3) — Suppliers named in `*Needs:*` lines have no supplier contract

**Location:** `README.md` line 2702: "IntegralLattices 1I and 6A"; lines 2014–2015: "CharacteristicClasses C2.0 and GeneralizedCohomology G4 item 2 for the pointed Thom model"; line 627: "MorseTheory M3".

**Claim:** "Exact supplier contracts" (lines 331–572) names every section consumed and what is assumed of it.

**Witness:** the section has no IntegralLattices or MorseTheory paragraph, its CharacteristicClasses paragraph (lines 513–518) lists C1.2b, C6.2–C6.3, C7.3 and C7 only, and its GeneralizedCohomology paragraph (lines 549–558) lists G4.0a, G4.0b, G5 item 6 and G2 items 4–5 only.

**Repair:** add to the contracts:
- "**From TauCetiRoadmap.IntegralLattices.** 1I (Milgram) gives `8 ∣ t₊ − t₋` for an even unimodular lattice. 6A gives that an even indefinite unimodular lattice is determined by its signature `(t₊, t₋)`. Section 7C.2 applies 6A after adding a hyperbolic plane."
- "**From TauCetiRoadmap.MorseTheory.** M3 supplies Morse approximation relative to a protected collar (1.2, 2.2, 6B.3); M5 supplies the Morse–Bott normal-Hessian and negative-bundle attachment (4B.4–4B.5)."
- To the CharacteristicClasses paragraph: "C2.0 supplies the disc/sphere bundle relative CW pair behind the pointed Thom model of 5.1.3."
- To the GeneralizedCohomology paragraph: "G4 item 2 supplies Thom spaces with their suspension and compact-base comparisons, used in 5.1.3."

## R04 (P3) — The manifest status "uncertified" is written into the roadmap

**Location:** `README.md` line 1476: "cited as uncertified and distinguished from the integral group table"; lines 2915, 2929, 2937 and 2997; `Suggested.lean` lines 317–318 and 326: "cited as uncertified".

**Claim:** the text is timeless.

**Witness:** "uncertified" is the sources manifest's status for a text cited by locator alone, not a property of Toda's propositions. This pull request already removed the word at two places (former "These Toda locators are cited as uncertified." in 9.7 and the References entry).

**Repair:** delete ", uncertified" at README lines 2915, 2929 and 2937, " (uncertified)" at line 2997, and "cited as uncertified and " at line 1476. In `Suggested.lean` delete ", cited as\nuncertified" at lines 317–318 and ", cited as uncertified" at line 326.

## R05 (P3) — The finiteness of the signed monomial group is planned again; the pinned Tau Ceti proves it

**Location:** `README.md` lines 1460–1462: "Average a positive inner product over the finite signed monomial group generated by the A_i, proving its finiteness and the invariance of this metric".

**Claim:** the finiteness of that group is a target of §3C.5.

**Witness:** at the pin, `TauCeti/LinearAlgebra/CliffordAlgebra/MonomialGroup/Basic.lean` line 165 defines `CliffordAlgebra.monomialGroup`, and line 804 proves `CliffordAlgebra.finite_monomialGroup` for a finite orthogonal basis with `Q (b i) = 1 ∨ Q (b i) = -1`.

**Repair:** write "Average a positive inner product over the image of the signed monomial group `CliffordAlgebra.monomialGroup` of the generators, finite by `CliffordAlgebra.finite_monomialGroup` (`TauCeti/LinearAlgebra/CliffordAlgebra/MonomialGroup/Basic.lean`, lines 165 and 804), and prove the invariance of this metric". Add both declarations to "From Tau Ceti".

## R06 (P3) — Two theorems have no theorem-level locator and one reference gives the wrong pages

**Location:** `README.md` lines 1470–1471: "James, *Reduced Product Spaces*, Annals of Mathematics 62 (1955), Sections 1--6, supplies the filtered reduced product and equivalence"; lines 1136–1139 (§3B.3, no locator); lines 3502–3504: "§2, p.5 (forms, formations and their stable equivalence)".

**Claim:** every theorem has an exact locator.

**Witness:** `hatcher_at` line 20284 (Theorem 4J.1, p.471) is the James theorem for connected CW complexes, and line 12578 (Proposition 3C.8, p.288) the tensor-algebra calculation under the freeness hypothesis of §3B.3. `ranicki2002` lines 265 and 285–292 put lagrangians and formations on pp.6–7.

**Repair:**
- §3B.4, after "to obtain `J X ~=_h Omega Sigma X`": "(Hatcher, Theorem 4J.1, p.471, as a weak equivalence for connected CW complexes)".
- §3B.3, after "free over that ring": "(Hatcher, Proposition 3C.8, p.288)".
- Lines 3503–3504: "§2, pp.5–7 (forms on p.5, lagrangians on p.6, formations and their stable equivalence on pp.6–7)".

## R07 (P3) — The description does not say that IntegralLattices becomes a supplier

**Location:** pull-request description, the three bullets after "This PR updates the HomotopySpheres roadmap merged in #1287."

**Claim:** the description states every supplier the change adds.

**Witness:** the change adds "IntegralLattices 1I and 6A" to §7C.2's *Needs:* (README line 2702) and to the Layer 7 Dependencies (line 2761). The roadmap on main does not name IntegralLattices.

**Repair:** add the bullet "- Take the divisibility of the signature by eight and the classification of even indefinite unimodular lattices in §7C.2 from IntegralLattices 1I and 6A (a new supplier)." If R01 is repaired as written, the second bullet stays true: the Freudenthal range is RiemannianGeometry R3 item 4's.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.3 handle trading (sample) | n+1 = 6, 7 | Milnor 8.1 (line 2613, p.100): index 0 no dimension bound; index 1 needs W, V simply connected, n ≥ 5; 7.6 p.92; 7.8 p.97 | sound |
| §1.4 local Whitney move (sample) | r = 2, s = 3 | Thm 6.6 (line 1841, p.71): r+s ≥ 5, s ≥ 3, π₁ injectivity for r ≤ 2; Lemma 6.7 p.73, proof ends p.84 | sound |
| §1.5 Whitney discs (sample) | (p,q) = (3,3), (3,2) | fibre `O(p+q−2)/O(q−1)`: V₂(ℝ⁴), simply connected; V₂(ℝ³) = SO(3), π₁ = ℤ/2; Lemmas 6.8, 6.10–6.13 at pp.74, 79–83 | sound |
| §1.6 index two | m = 5, 6 | (dim P, dim Q) = (2,3), (2,4); fibre S², S³; circle codimension 4, 5 | sound |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | n = 5; W = ∅; M₀ = ∅; M₀ = ∂W | dim 6 meets Thm 9.1 (line 2784); ∅ not simply connected; ∅ ≃ₕ W false both ways | true |
| §2.1 finite codes (sample) | zero charts; (−1,1); D⁷ | empty realization; interval, not ℝ; D⁷ needs half-space charts (boundary S⁶ ≠ ∅) | sound |
| §2.2 connected sum (sample) | n = 1, 2, 3; T² | KM Lemma 2.2 (line 78) needs simply connected; Euler count χ(Σ)−2 = −c₁: S² gives 0, T² gives c₁ = 2; Θ₁ = Θ₂ = 0 (lines 30, 142–144) | sound |
| §3A.4 Freudenthal | n = 8, k = 6; n = 7, k = 6 | 14 ≤ 14 stable; 13 ≤ 12 false; Hatcher 4.24 (line 15686, p.360) | range sound; supply R01 |
| §3B James | X = S¹; M(ℤ/2,2) | π₁ = ℤ both sides; H̃₅(X∧X) = Tor(ℤ/2,ℤ/2) = ℤ/2, tensor algebra 0 in degree 5 | sound; locator R06 |
| §3C EHP, Toda brackets | n = 2, q = 4; ⟨id,0,0⟩ | ℤ →(×2) ℤ → ℤ/2 → 0 exact; indeterminacy id∘π_(m+1)(Sᵐ) + 0 = ℤ/2, bracket {0, η} | sound |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3 | n = 0 excluded by `hn`; n = 2 Euler number 2; 2ʳ ∣ 3ʳ−1: v₂ = 1, 3, 4 at r = 1, 2, 4; r = 3: 1 < 3 | true |
| `nonempty_orthogonalGroup_bottPeriodicity` | (k,n) = (0,11); (2,13) | π₉O(11) = ℤ/2 = π₁O(11); π₁₁ = ℤ = π₃; stable range i ≤ n−2 gives k+9 ≤ n−2 | true |
| Bott entries, degrees 2–8 | ranks 4…10 and one below | 0, ℤ, 0, 0, 0, ℤ, ℤ/2; below: π₃SO(4) = ℤ², π₄SO(5) = ℤ/2, π₅SO(6) = ℤ, π₇SO(8) = ℤ² | true; bounds sharp except degrees 2, 6 |
| §4B.6 index table | r = 1, 2, 8 | λ = 0,2,8,4,2,2; 2,6,12,6,3,3; 14,30,36,18,9,9 | Checks agree |
| §5.0 finite PT (sample) | empty cycle; ± point; Hopf map | degrees 0, +1, −1; source reflection H ↦ −H, target reflection H ↦ (−1)²H | consistent; Milnor TDV unread |
| §5.0b offsets (sample) | c = 1, 2, 3, 4 | π₃(S¹) = 0; π₄(S²) = π₄(S³) = ℤ/2; ∂ : π₆(S⁴) ≅ π₅(S³) as π₆(S⁷) = π₅(S⁷) = 0; Atiyah (4.1), Thm 3′ at line 419, 432, p.58 | sound |
| §6B E₈ plumbing | k = 1, 2 | −E₈: det 1, σ = −8, σ/8 = −1; pinned graph: vertex 7 attached to 2, weights −2 | agrees with `TauCeti.e8Plumbing` |
| `EvenWallForm` | q even: ⟨1⟩, H; q odd | ⟨1⟩: 1 ≠ 2Q; H: polar x₀y₁+x₁y₀; q odd: λ(x,x) = 0, `diagonal` reads 0 = 2Q in ℤ/2 | matches Ranicki line 263 |
| `EvenWallForm.Lagrangian` | q odd, ℤ(e+f) ⊂ H | λ(e+f, xe+yf) = y−x so L⊥ = L; Q(e+f) = 1 | excluded by `quadratic_zero` only |
| `nonempty_evenWallGroup_two_mul_addEquiv_int` | E₈, E₈², D₁₆⁺, H, rank 0 | σ/8 = 1, 2, 2, 0, 0; E₈² ⊕ H ≅ D₁₆⁺ ⊕ H (indefinite even, same rank and signature) so equal classes | true |
| `nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two` | (Qe,Qf) = (0,0), (1,1); two copies of (1,1) | Arf 0, 1, 1+1 = 0; (0,0) is `IsHyperbolicPlane` | true |
| `oddWallGroup_subsingleton` | (H;L,L*), (H;L,L), boundary (H(K);K,Γ) | complementary; common complement L*; K and graph Γ share complement K* | true (L₁(ℤ) = L₃(ℤ) = 0) |
| §8.1 forgetting a frame (sample) | n = 6, 7 | im J₆ = 0, A₆ = ℤ/2; A₇ = coker J₇ = 0; KM Lemmas 4.2, 4.5 (lines 257, 292), Remarks line 316, p.512 | sound |
| §8.2 extension obstruction (sample) | n = 6, 8 | π₅SO = 0, kernel all of A₆; n = 8: obstruction in ker J₇ = 240ℤ; KM proof of 3.1 ends line 211, p.509 | sound |
| §9.2 stems 4, 5 (sample) | n = 5, 6; n = 6, 7; p = 3, 5 | π₉S⁵ = ℤ/2, π₁₀S⁶ = 0; π₁₁S⁶ = ℤ, π₁₂S⁷ = 0; p-part: order 3 at k = 3, 7, zero at 4, 5, 6; KM table line 325 | values consistent; Toda, Gray unread |
| `sphere_homotopyGroup_fourthStem`, `…fifthStem` | n = 5; n = 6 | π₉(S⁵) = ℤ/2 ≠ 0; π₁₁(S⁶) = ℤ ≠ 0: bounds 6 and 7 sharp | true |
| §9.3, `nonempty_sphere_homotopyGroup_sixthStem` (sample) | n = 8; ν₄∘Σ³ν₄ | 14 = 2·8−2; source S¹⁰, target S⁴; group ℤ/2 | true; Toda 5.11 unread |
| §9.4 stem table (sample) | n = k+1 at k = 1, 3 | π₃(S²) = ℤ, π₇(S⁴) = ℤ ⊕ ℤ/12: bound n ≥ k+2 sharp; KM orders 2, 2, 24, 0, 0, 2 | sound |
| §9.5 framed product (sample) | S³×S³ | q(a) = q(b) = 1, Arf = 1; normal-bundle refinement gives 0 (π₂SO(3) = 0); Snaith Ex. 8.3 (line 1153): existence only | sound; Browder unread |
| `nonempty_sphere_homotopyGroup_seventhStem` | n = 8, 9 | π₁₅(S⁸) = ℤ ⊕ ℤ/120; π₁₆(S⁹) = ℤ/240; 16 = 2·9−2 | true |
| §9A.2–9A.3 | obstruction 240z; (h,j) = (2,−1), (1,0) | p₂ = 6·240z, σ = 7p₂/45 = 224z, σ/8 = 28z; μ = (36−4)/896 = 1/28 = μ(−E₈); (4−4)/896 = 0 | sound |
| §9A.4, `exists_homeomorph_isEmpty_diffeomorph_sphere` | k = 2, 3, 4 (README index) | 7p₂ = −360 impossible; d₃ = 992/63, v₂ = 5; d₄ = 2032/15, v₂ = 4; v₂(−8) = 3; pulled-back structure on Sⁿ is no witness | true |
| §10.1 orientation (sample) | M noncompact; M = S⁶ | Hatcher 3.29 (line 10370, p.239): H₆ = 0 if connected noncompact; Hatcher's manifolds are Hausdorff locally Euclidean (line 10023) | sound |
| §10.4, `smoothPoincareSix_oriented` (sample) | identity; reflection; B reversed | signs +1, −1, +1; M connected, so one reflection fixes the sign | true |
| `nonempty_diffeomorph_sphere_six` | Mathlib predicate at n = 6 | `PoincareConjecture.lean` 41: `[T2Space M]`, quantifies charts, `IsManifold (𝓡 6) ∞`, `M ≃ₕ 𝕊⁶`; no compactness needed (10.1) | true; README text R02 |

- **Previous review, finding by finding:** R02, R03, R04 (letter ids restored, Stage mapping at lines 582–584), R07, R09, R10, R11, R12, R13, R14, R15 and R16 repaired. R01 repaired as asked and withdrawn (R01 here). R06 repaired in `Suggested.lean` and §10.4, not in three README passages (R02 here). R08 partly (R06 here). R05 not repaired and no longer held: the entries in degrees 2–8 are the base of the table that §4B.8 names as its target, and §9.6 consumes degrees 5 and 6.
- **Gate at 64bdd7e:** every check 0, `OK`. Dependency check rerun: `depcheck: 264 roadmaps, 2582 edges, 0 problem(s)`. No change outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 20 `sorry` warnings and nothing else. The one-tactic probe (`infer_instance | rfl | simp | decide | exact ⟨⟩`) closes none of the 20 theorems. No `variable` block: every binder is in the declaration's own signature, and the 20 elaborated types match the README statements.
- **Source locators checked against the text (56):** `milnor_hcobordism` 22 (Thms 1.4, 3.4, 3.13, 3.14, 4.8, 5.4, 6.4, 6.6, 7.6, 7.8, 8.1, 9.1, 9.2, Cors 3.5, 3.15, Lemmas 6.7, 6.8, 6.10, 6.12, 6.13, Def 9.2, Prop B); `kervairemilnor1963` 14; `hatcher_at` 12; `hatcher_vbkt` 3 (Prop 1.14 p.25, Thm 2.16 p.59, Prop 4.1 p.108); `atiyah1971` 2; `ranicki2002` 2; Snaith 1.
- **Library declarations opened at the pins (37):** all 34 Mathlib and Tau Ceti declarations the README cites with a line number are at that line; also `TauCeti.SphereSurgery` (`Topology/Surgery/Basic.lean` 189), `TauCeti.realCliffordForm` (`RealForm/Basic.lean` 113) and `CliffordAlgebra.finite_monomialGroup` (R05).
- **Cross-roadmap citations resolved on main (14 opened):** GeneralizedCohomology G2 items 4–5, G4.0a–b, G4 item 2; IntegralLattices 1I (line 641), 6A (line 2019); CharacteristicClasses C2.0 (line 730); TangentialBordism B5.5 (line 1875); StringOrientation S2.3 (line 607); MorseTheory M3, M5; RiemannianGeometry R3 (line 2220). The worker's resolver lists no unresolved citation; its three "Lean names found nowhere" are declarations of this `Suggested.lean`.
- **Duplication:** no declaration name of `Suggested.lean` occurs in another roadmap's `Suggested.lean`, on main or at the 458 open heads. No roadmap on main or open states the simply connected Wall groups; this roadmap is their owner.
- Overlap check: read TangentialBordism, PositiveScalarCurvature, GeneralizedCohomology (main), FourManifolds, DGFloerPartII (open); shared: sphere Freudenthal range, owner RiemannianGeometry R3 item 4 (R01); stable framed Pontryagin–Thom, owner TangentialBordism B5.5 and StringOrientation S2.3; real Bott chain and James product, owner this roadmap (4B, 3B).
- Source independence: 12 passages compared with 6 sources, none shared beyond a five-word technical phrase (`ranicki2002` line 291); largest share `kervairemilnor1963`, about 35 of 115 locators; contents compared with `kervairemilnor1963` (§§1–8): independent, Layers 2 and 8 use its §§1–4 and no other layer maps to a section.

## Not verifiable

- Toda 1962 (Lemma 5.4, Propositions 5.6, 5.8, 5.9, 5.11, Chapter XIV): no legal open copy; cited by locator.
- Gray 2001 (Propositions 2.1–2.4) and Fomenko–Fuchs (§§27.3–27.4): Springer, paywalled; cited by locator.
- Bott 1959, Browder 1969, Smale 1961, James 1955, Adams–Atiyah 1966: paywalled; the equation numbers of §4B.6's table and Browder's Theorems 1.4 and 3.2 are unchecked.
- Wall 1999 (Theorems 1.2, 5.6, 5.8, 6.4, 6.5, 13A.1), Whitehead GTM 61, Milnor *Morse Theory* and *Topology from the Differentiable Viewpoint*: books with no legal open copy.
- Levine, Appendix, pp. 91–93: the sources service resolves it only to a paywalled publisher page; the copy the README links was not read.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` line 3465 links Levine's lectures (Springer Lecture Notes in Mathematics 1126) to a copy on a university seminar page; the host's right to distribute it could not be classified.
- **Not tested.** `README.md` §§9.2–9.3 rest on Toda and Gray, which could not be read; wording there was compared with no source.
