# Review of Orbifolds (pull request #2624 at c80fb4f)

**Verdict:** accepted

**Summary.** Accepted: no finding. The previous finding is repaired: §3.1 now states the triangulation in its stratified form (every orbit-type stratum a union of open simplices), proves it by Verona's theorem on Thom–Mather spaces instead of the false theorem of Cairns, and §§3.2 and 3.4 consume that form; the three earlier small corrections are repaired as well. There are one small correction (a sentence of the proof sketch of §3.4) and three format notes, none blocking, and nothing is left for the human reviewers to decide.

## C01 — In §3.4 the stabilizer of a frame over a face point does not contain the reflection itself, only an element whose reflection component is that reflection

An implementer who follows the sketch literally ("Near a point of the face, the points of its orbit type have its stabilizer, which contains the reflection", lines 695–696) looks for the reflection in a stabilizer of the frame action, where it is not: §3.1 is applied to the frame manifold of the double with the group `O(n) × (ℤ/2)^k`, and a reflection `r_i` moves a frame `f` over a face point `x` to `d(r_i)_x ∘ f ≠ f`. The stabilizer contains `(A, r_i)` with `A = f⁻¹ ∘ d(r_i)_x ∘ f ≠ 1`, and along the stratum it is only conjugate, not equal. The sentence is true as written only for a group acting on the object manifold itself, which is Illman's case (Illman1983 lines 563–570).

The conclusion stands. The image of a stabilizer in `(ℤ/2)^k` is unchanged by conjugation, and it is the set of reflections fixing the coarse point; `r_i` fixes a coarse point exactly on the face `F_i`, because an arrow of the double stays in one copy of the domain unless its ends lie on the face. So the orbit type determines the set of labelled faces through a point. The sentence could read: "The stabilizer of a frame over a point of the face contains an element whose component in the reflection group is that reflection, a property of the orbit type, and no stabilizer over a point off the face does; so every orbit-type stratum meeting the face lies in it."

## N01 — The stratified form of §3.1 is statable at the pins and could be stated beside `isTriangulable_orbitRel_quotient`

§3.1 says itself that the Lean statement "states triangulability only, which does not give this" (lines 601–602), so the acceptance test is passed by a proof that leaves §§3.2–3.4 without their input. The stronger statement elaborates at the pins with no new definition: there are a complex `C` on `ι : Type` and a homeomorphism `e : AbstractSimplicialComplex.Realization C ≃ₜ MulAction.orbitRel.Quotient K M` such that, whenever `AbstractSimplicialComplex.carrier C (e.symm ⟦x⟧) = AbstractSimplicialComplex.carrier C (e.symm ⟦y⟧)`, the stabilizers of `x` and `y` are conjugate in `K` (`carrier` is in `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`, line 362). It would be a second declaration; the present one is true and stays.

## N02 — Verona's bounded-dimension hypothesis is on p. 429, not p. 428

"Verona, §1, p. 428" (line 613) is cited for Thom–Mather spaces whose strata have bounded dimension. Page 428 defines `d(A)`; the standing assumption `d(A) < ∞` is the first sentence of p. 429 (Verona1980 lines 138 and 145–146). "§1, pp. 427–429" would cover the definition and the hypothesis.

## N03 — Two theorems that §4.9 proves again still carry no locator

The lemma that realization preserves levelwise weak equivalences of proper simplicial spaces, and the fat–thin comparison (lines 1028–1030 and 821–823), are published results stated here without a citation; one each would let an implementer check the cofibration hypotheses against a source. The other locators asked for in the previous round are now present (§1.3, §3.4; §4.9a cites the library).

## Verified sound

| Statement | Instances tried | Roadmap side | Computed | Result |
|---|---|---|---|---|
| §1.3 weak fibre products (sample) | objects and arrows; `x²−y²` against a point | triples `(x, h, y)`, pairs of arrows; transversality required | Moerdijk2002 lines 174–178, 193–196; fibre `{x² = y²}` is a cross, not a manifold | holds; hypothesis needed and stated |
| §1.4 locally free actions (sample) | `S¹` on `S³`, weights `(a, b)` coprime positive; weights `(2, 2)` | stabilizers `ℤ/a`, `ℤ/b`, trivial; `ℤ/2` trivial on slices | `λ^a = 1 = λ^b ⇒ λ = 1`; `λ = −1` fixes all of `S³` | Check true |
| §2.1 linear charts (headline) | `[*/K]`; reindexing `g ↦ gh⁻¹` | `K ⋉ {0}`; `A(hy) = L_h A(y)` | `L_{gh⁻¹}⁻¹ = L_h L_g⁻¹`; Moerdijk2002 lines 347–355 | holds |
| §2.3 face kernel (touches §5.2, §4.4a) | shear `(x, y+x)`; finite order `m` | `N ≠ 0`, `N² = 0`; `N = 0` | `(Id+N)^m − Id = mN`; shear has infinite order | holds; hypothesis used |
| §2.5 frame bundles (sample) | `ℤ/m` on `ℝ²`; `ℤ/m × ℤ/2` | `O(2)`-stabilizer `ℤ/m` over origin; not free | stabilizer of `[(0, A)]` is `A⁻¹(ℤ/m)A`; second factor fixes every frame | Check true |
| §3.1 Yang, plain form (headline, Lean) | trivial `K`; `dim E = 0`; empty `M`; irrational flow | triangulable; compactness used | Yang1963 lines 119–121; discrete countable quotient; empty complex; indiscrete quotient | holds; Lean binders complete |
| §3.1 stratified form (sample; previous R01) | `ℤ/m` on `ℝ³` with axis bent to `{(0, −t², t)}`; both directions of "equivalently" | not stratified; strata unions of open simplices ⇔ conjugacy class constant | parabola uncountable, contains no segment; open simplex connected, lies in one component | Check true; Verona1980 lines 379–390, 509–519; Illman1983 lines 540–543 |
| §3.1 route | bounded dimension; Cairns | Verona Thm 3.5, Cor 3.7, Lemma 3.4; Cairns false | Verona1980 lines 66–67, 79–81, 146, 417–428, 442–453; Illman1983 lines 100–107 | holds; page of hypothesis N02 |
| §3.2 (previous R01) | `ℤ/m` on `ℝ²` | origin a vertex; isotropy constant on open simplices | one-point stratum is a 0-simplex; stabilizers on a connected lift have equal order and are nested | holds; MoerdijkPronk1999 lines 111–129 |
| §3.4 faces and quadrant diffeology (sample) | double with `(ℤ/2)^k`; frame over a face point | face a union of open simplices; `DSmooth` ⇔ corner-smooth | stabilizer contains `(A, r_i)`, `A ≠ 1`; image in `(ℤ/2)^k` conjugation-invariant; GurerIglesiasZemmour2019 lines 142–143, 207–209 | conclusion holds; wording C01 |
| §3.5, §6.1 signs (sample) | cylinder base first, `m = 0, 1`; interval first | `(−1)^m` at `t = 1`, `(−1)^(m+1)` at `0`; `−Γ`, `+Γ` | `(∂_t, e₁…e_m) = (−1)^m (e₁…e_m, ∂_t)`; `m = 0`: `{1} − {0}` | Checks true |
| §4.1 orbibundles (sample) | sign line over `[*/(ℤ/2)]` | no nonzero invariant section | `v = −v ⇒ v = 0` | Check true |
| §4.3 fat model (sample) | unit groupoid of `M`; `[*/K]` | `BΓ ≃ M`, `q` the equivalence; `BK` | fat realization of constant `M` is `M × ‖*‖`, `‖*‖` contractible | holds |
| §§4.4–4.5 comparison, de Rham (headline) | `[*/(ℤ/2)]`; `ℤ ⋉ ℝ` | iso over `ℚ`, not `ℤ`; `H¹ = ℝ` | `H²(Bℤ/2; ℤ) = ℤ/2`; `dx` not `d` of a periodic function | holds; Moerdijk2002 lines 505–514 |
| §4.7 represented bundle (sample) | character `χ` of `K` over `[*/K]` | `E_B = EK ×_K ℂ_χ`, torsion `c₁`, real image `0` | `H²(BK; ℤ) ≅ Hom(K, U(1))`; `H²(BK; ℝ) = 0` | consistent with §§4.8, 7.1 |
| §4.9 thin and diagonal models (sample) | `[*/K]`; unit set | `L_pS` clopen; `diag` is `NK` | section of étale `s` is open; `{g : u(s(g)) = g}` closed in Hausdorff; `Sing(K^p)` constant | holds; vandenBergMoerdijk2018 lines 126–129 |
| §4.9a topology (sample) | pushout of normal T1 along closed `A`; countable colimit | normal T1, Lindelöf, paracompact | Urysohn on `X`, Tietze on `Y`; image of countable coproduct; library instance needs regular and Lindelöf only | holds |
| §4.9b stalks (sample) | `ℤ/2` on `(−1, 1)` | `ℚ` in degree 0; `𝔽₂[w]` | `EG ×_G B ≃ ℝP^∞`; `N_n = G^n × B = (G^(n+1) × B)/G` | Check true |
| §5.1 weighted integration (headline) | `[*/K]`; `ℤ/2` on three points; disc; index formula | `1/|K|`; `3/2`; `π/m`; `|H|⁻¹∫_V` | `½·3 = 1 + ½`; `|G|⁻¹[G:H] = |H|⁻¹` | holds |
| §5.2 Stokes (sample) | `m = 0` cylinder; face chart `(U ∩ F)/G` | signed face sum; same weight | `∫₀¹ f′ = f(1) − f(0)`; both sides carry `|G|⁻¹` | holds |
| §§5.3–5.4 duality (headline) | `ℤ/2` reversing `ℝ`; `ℤ/m` on `ℝ²`; football | zero; `H₂ = ℚ`; `4π/m`, `k = 1` | pair `([0,1), (0,1))` acyclic; coinvariants of `H_n(B, B∖0; ℚ)`; `(1/m)·4π` | holds |
| §6.2 families (sample) | `xy = a` at `a = 0` | nodal fibre kept singular, not asserted an orbifold | node `{xy = 0}` is not a manifold at `0` | consistent |
| §7.3 effective reduction (sample) | trivial gerbe; chart `G` with kernel of order `k` | `∫_eff = k · ∫_full` | `(|G|/k)⁻¹ = k·|G|⁻¹`; gerbe: `∫_N = |K|·(1/|K|)∫_N` | holds |

- Previous review: R01 repaired (§3.1 "The triangulation can be chosen so that every orbit-type stratum is a union of open simplices", §3.2 "Transport the stratified triangulation of §3.1"); C01 repaired ("coprime positive integers", line 633); C02 repaired (§7.3 "it is not planned here"); C03 repaired (§2.4 "averaged metrics for finite groups"); N01 partly (N03 above); the question on Cairns is settled by the new route.
- Source locators checked against the text: 17 (Verona1980 at 7 places, Illman1983 at 3, Yang1963 at 2, Moerdijk2002 at 4 sections with their pages, MoerdijkPronk1999 §1.2, vandenBergMoerdijk2018 §2.3, GurerIglesiasZemmour2019 §2 Theorem 1 and §3 Theorem).
- Library declarations opened at the pin: `TauCeti.IsTriangulable` (`Topology/Triangulable/Basic.lean`, lines 37–41), `TauCeti.paracompactSpace_of_regularSpace_lindelofSpace` (`Topology/Compactness/Paracompact.lean`, lines 34–36), `AbstractSimplicialComplex.carrier` (`AlgebraicTopology/SimplicialComplex/Realization/Basic.lean`, line 362); the other backticked library names resolve at the pins.
- Cross-roadmap citations resolved on main: AlgebraicTopologyPartII §§16.1a–16.1b (lines 1539, 1571: smooth stratified spaces, control data, "Thom–Mather space"), GeometricTopology §§1.1, 11.1, 11.3 (lines 788, 7740, 7887), CharacteristicClasses C1.1b, C1.2b, C1.5, C2.1, C4.1, C4.3, SmoothBundlesConnections B1.0, B1.4, B2.5, B3.1, B4.1, B6.1–B6.3; the rest as in the previous round. Every supplier is on main and none is on the list of roadmaps never to cite.
- Dependency check: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)`; no UPWARD or CYCLE line. The other automatic checks passed. No change outside the folder.
- Elaboration: `TauCetiRoadmap/Orbifolds/Suggested.lean` gives one warning, the `sorry` at line 45. `#check @isTriangulable_orbitRel_quotient` keeps every binder of §3.1 (compact Lie group, Hausdorff second-countable boundaryless manifold, smooth action); nothing changed. One-tactic probes (`simp [TauCeti.IsTriangulable]`, `rfl`, `infer_instance`, `exact TauCeti.isTriangulable_of_discreteTopology _`, `exact?`) all fail: not padding. The four other headlines are named in the module docstring as not statable.
- Description: 45 Checks in 28 lists, 42 *Needs:* lines, 16 declarations removed and 1 added, AlgebraicTopologyPartII among the suppliers, Cairns dropped: all agree with the head.
- Ownership: searched every open head and main for Verona's theorem, triangulations of Thom–Mather spaces and of orbit spaces; only this roadmap plans them, so it is the owner. AlgebraicTopologyPartII owns the stratified foundations (cited); StratifiedSpacesAndTameTopology (open) plans o-minimal and semialgebraic triangulations and an unfolding of Thom–Mather spaces, not this theorem.

Overlap check: read StringOrientation, ImplicitAtlases, ConvexityToric, StratifiedSpacesAndTameTopology, TangentialBordism (open list), CharacteristicClasses, HamiltonianReduction (main list); the results-and-headings list is empty. Shared objects: Thom–Mather spaces, owner AlgebraicTopologyPartII §§16.1a–16.1b (cited); Morita invariance of orbit spaces, owner LieGroupoidsPoisson §G3.5 (cited); Hamiltonian level identifications, owners HamiltonianReduction R3 and ConvexityToric Layer 4. Nothing else shared.

Source independence: 11 passages compared with 7 sources (§§1.1, 1.3, 2.1, 3.1 at three places, 3.2, 3.4 at two places, 4.9 and the `Suggested.lean` docstring), none shared beyond the forced definition of the fibre-product objects; largest share Moerdijk2002 and Verona1980, 4 of 17 locators each; contents compared with Moerdijk2002 §§1–6 and Verona1980 §§1–3: independent (Verona's three sections feed one section, §3.1; Layers 3, 5 and 6 have no counterpart in Moerdijk; the order of Layers 1–2 is forced by the *Needs:* line of §2.1).

Research link: the layers build the groupoid model of orbifolds with ineffective isotropy and the rational comparison of `BΓ` with the coarse space (Moerdijk–Pronk 1997; Moerdijk 2002, §§3.4, 4.4), the triangulation of orbit spaces (Yang 1963; Verona 1980; Illman 1983) and weighted integration (Adem–Leida–Ruan 2007); HamiltonianReduction and ConvexityToric consume them. Rests on the README's References and on the four texts read.

## Not verifiable

- AdemLeidaRuan2007 (Chapters 1–2, the locator of §5.1): not among the cached texts; only the publisher's page is known. §5.1 was checked by computation.
- MoerdijkPronk1997 (*K-Theory* 12, References only): not opened.
- Putz, *Triangulation of fibre bundles* (Canad. J. Math. 19, 1967), named in §3.1 through Verona's Lemma 3.4: not opened; its use was checked in Verona1980 lines 417–441 only.
- Sampled §§1.4, 2.5, 3.5, 4.1, 4.3, 4.7, 4.9a, 5.2, 6.2 and 7.3 cite no source text; they were checked by computation and against the supplier sections and declarations they name.

Automatic checks set aside as false positives: the overlap listing reports that this change drops the id O4.2, which HamiltonianReduction cites; the numbering paragraph maps it in a sentence ("O4.2 is §4.2", line 62) that the listing does not read.

## Source issues

- **Misprint** in Moerdijk2002 at §2.3, p. 5: the source says the arrows `(h, k)` of the fibered product satisfy `g′φ(h) = ψ(h)g`; it should be `g′φ(h) = ψ(k)g`; affects nothing.
- **Misprint** in MoerdijkPronk1999 at §1.2, p. 5: the source refers to good covers "as in Proposition 1.2.5", but that statement is numbered Corollary 1.2.5; it should cite Corollary 1.2.5; affects nothing.
- **Error** in Yang1963 at Lemma 2, p. 406: the source says its differentiable n-spaces are triangulable because a theorem of Cairns triangulates regular locally polyhedral spaces; it should not rely on that theorem, which is false; affects the proof; corrected in print at Verona, Manuscripta Math. 30 (1980), Corollary 3.8, p. 443.

## For the human reviewers

- none
