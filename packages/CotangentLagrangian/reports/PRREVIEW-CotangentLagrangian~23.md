# Review of CotangentLagrangian (pull request #2687 at 2544fed)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

**Summary.** Accepted: there are no findings. The eight headline statements were each tested on explicit instances and hold, the 41 Checks were recomputed and are true, all 15 locator sites in the README match Cannas da Silva at the stated theorem and page, `Suggested.lean` elaborates with `sorry` as its only warning, and the dependency check shows no upward or cyclic supplier. There are five small corrections and one format note, none blocking: the README still has no old → new numbering for the ids C1–C4 that other roadmaps cite; §4.8 is narrower than the cited Thm. 8.6 without saying so; two consumer attributions for §4.8 are unsupported; §4.1 plans a relative Poincaré lemma whose coordinate form the pinned Tau Ceti already proves and the README does not cite; and one consumer citation uses an id that an open revision renumbers. Nothing is left for a human to decide. The head is the one the previous review read, so its three small corrections stand unrepaired (C01–C03 below); it had no findings.

## C01 — The ids C1–C4 that other roadmaps cite are renumbered, and the README gives no old → new numbering

After the merge, a reader who follows "CotangentLagrangian C3.1" or "C4" from another roadmap finds no such heading. On main, LieGroups cites C2.0 and C2.1 (its lines 904, 1235, 1422–1423), IntegrableSystems C3.1 (line 544), MathematicalBilliards C3.1 (some twenty places), HamiltonianReduction C4 (lines 73, 276), FukayaTheory C1, C2 and C4 (lines 33, 672, 852, 890), HeegaardFloer C4 (lines 2569, 4854) and TaubesGromov C4 (line 16); the open revisions of IntegrableSystems, MathematicalBilliards, LieGroups, HamiltonianReduction and HeegaardFloer cite the same ids. The mapping is in the pull request's description only. One sentence in the README repairs it, for instance under Scope and ownership: "In the former numbering, Ck.n is §k.n here, C1 item n is §1.n, the opening of C2 is §2.3, the body of C3 is §3.0 and §3.0a, and C4 is §4.1–§4.8."

The family index `TauCetiRoadmap/SymplecticGeometry/README.md`, which this pull request may change, still links to the removed anchors `#c21-…` and `#c20-…` (line 35) and `#c22-…` (line 72); pointing them at §2.1, §2.0 and §2.2 repairs them.

## C02 — §4.8 cites Cannas da Silva Thm. 8.6 for a narrower statement than the source makes, and does not say so

Thm. 8.6 (p. 49, CannasDaSilvaLSG lines 2030–2040) has no compactness hypothesis on the submanifold, and the source gives no proof: it refers to its references [47, 58, 107] (line 2029; [47] is Gotay, Proc. Amer. Math. Soc. 84 (1982)). The target of §4.8 and `exists_diffeomorph_opens_of_isCoisotropicMap` assume `CompactSpace Q`, while the locator (line 1125) says only "for two forms on one ambient manifold". A reader cannot tell that compactness is the roadmap's choice for its route (uniform neighbourhoods) and not a hypothesis of the cited theorem. Nothing stated is false. Either add "stated there without compactness and without proof; see Gotay" to the locator, or drop compactness from the target if the route can shrink the neighbourhood by a positive function along Q, as the source indicates for the non-compact case of its Thm. 8.5 (line 2022).

## C03 — §4.8 and the Downstream consumers attribute a use of the coisotropic kernel API to roadmaps that do not cite it

The last sentence of §4.8 (line 1129) and the consumers bullet at line 1176 say that HamiltonianReduction R3 and ConvexityToric Layer 4 use the kernel, leaf and quotient tangent API of §4.8. ConvexityToric's README does not mention this roadmap, on main or at any open head that carries it. HamiltonianReduction cites it for the cotangent forms (main line 286), for the relative germ at the diagonal (line 73) and for the tubular fibre-homotopy of the former C4 (line 276; its open revision adds the Weinstein neighbourhood of the diagonal), never for a coisotropic kernel API. A reader looking for the consumer of that API finds none. Drop "ConvexityToric Layer 4" from both sentences and replace R3's claimed use by what R3 cites, or add the citations in those roadmaps. The description's list of "the roadmaps that cite this one" should lose ConvexityToric for the same reason.

## C04 — §4.1 plans the relative Poincaré lemma on an adapted coordinate box, which the pinned Tau Ceti already proves and the README does not cite

An implementer reading §4.1 ("On a fibrewise star-shaped tube, or an adapted coordinate box … construct β with dβ = η − r*(i*η) and with β zero as a full ambient tensor along Q", lines 957–960) would prove the coordinate-box case again. At the pin, `TauCeti/Analysis/Calculus/DifferentialForm/Relative.lean` defines `TauCeti.fiberwisePoincareHomotopy` on a product E × N of normed spaces and proves that it vanishes on the zero section as a full ambient tensor (`fiberwisePoincareHomotopy_zeroSection`, line 96), that `dKω = ω − r*ω` for a closed form on an open convex set stable under scaling the normal coordinate (`Convex.extDeriv_fiberwisePoincareHomotopy`, line 192), and the lemma itself with the regularity of the primitive (`Convex.exists_contDiffOn_relative_primitive`, line 269). These are the statement of §4.1 in adapted coordinates and the input of the route of §4.4. The tube version on a manifold and the parameter version are not at the pin and remain targets.

The repair is a citation: name these three declarations in §4.1 and in the Layer 4 supplier contract, say that the target is their transport to a tubular neighbourhood, and add them to the "In the library at the pins" sentence, which lists for Layer 4 only "the tubular neighbourhood theorem and the symplectic Witt extension" (line 1226). The description's sentence that "all of Layer 4" was searched for at the pins and is not there should except this case.

## C05 — The consumer citation "IntegrableSystems I5.2" uses an id that the open revision of IntegrableSystems renumbers

The Downstream consumers bullet at line 1179 cites "IntegrableSystems I5.2". On main that heading exists (IntegrableSystems line 534); the open revision of IntegrableSystems renames it "5.2 Finite action, quotient and periodic-orbit dictionary" (its line 933) and gives no mapping from the old id, so the citation stops resolving when that revision merges. Writing "IntegrableSystems §5.2 (I5.2), the finite action and periodic-orbit dictionary", in the style the README already uses for "HeegaardFloer §4.1 (F2.1)", survives either order of merging.

## N01 — Several targets carry no locator, although the cited text or a standard one has the statement

The Kodaira–Thurston target of §2.2 has none, and Cannas da Silva gives the example with b₁ = 3 at p. 102 (CannasDaSilvaLSG lines 4158–4167, citing Thurston 1976). The symplectic neighbourhood theorem of §4.6, the transverse composition of §3.0 and the polar diffeomorphisms of §2.0 have none either; a locator into a standard text for each would let a reader check the hypotheses.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 chart change (sampled) | M = ℝ, φ(q) = 2q | p ↦ p∘(dφ)⁻¹ = p/2 at 2q; (p/2)(2v) = p(v); pushforward 2p gives 4p(v) | true; Check separates wrong variant | none |
| §1.2 forms and signs (sampled) | T*ℝ; translation action, H = p | ω = −d(p dq) = dq∧dp, ω(∂q,∂p) = 1; ι_∂q ω = dp = dH; 2dq∧dp gives 2 ≠ 1 | true | none |
| §1.3 lift, relation | f = 2x; constant map; covering of the circle | (2q, p/2) pulls p dq to p dq; (2q, 2p) to 4p dq; constant: p = q∘0 = 0 only | Checks true | none |
| §1.4 translation, dilation (sampled) | α = x dy, α = dy on T*ℝ² | p_y ↦ p_y + x: ω ↦ ω + dy∧dx = ω − π*dα, λ ↦ λ + x dy; dy preserves ω | true | none |
| §2.0 polar package (sampled) | A = [[0,−2],[½,0]] | AAᵀ = diag(4,¼), P = diag(2,½), U = [[0,−1],[1,0]], UᵀPU = diag(½,2) = (AᵀA)^½; wrong left factor gives [[0,−4],[¼,0]] | true; det P = det U = 1 | none |
| §2.0 equivariance | A ↦ VAW | VAW = (VPV*)(VUW), VPV* positive, VUW unitary; uniqueness gives the formula | true | none |
| §2.1 intersections, Killing form (sampled) | n = 1, 2; diag(1,−1), diag(2,½), 2I | diag(1,−1)J ≠ J diag(1,−1); AᵀJA = J and AJ = JA give AᵀA = I; B = 4 tr (n = 1), 6 tr ≠ 8 tr (n = 2) | true | none |
| §2.1 maximality argument | P = diag(2,½) | tr Pᵏ = 2ᵏ + 2⁻ᵏ unbounded, so P in no compact subgroup; θ(A) = A⁻ᵀ = JAJ⁻¹ from AᵀJA = J | sound | none |
| §2.2 two-point theorem (sampled) | circle, f = cos θ; ℝ, f = x; dθ on circle; finite discrete Q | zeros of −sin θ: {0, π}; dx never 0; dθ never 0; dimension 0: df = 0 on ≥ 2 points | true; compact and exact both needed | none |
| §2.2 Liouville field, Kodaira–Thurston, cosphere | T*ℝ; H(3,ℤ) × ℤ; Q = ℝ | ι_(p∂p)(dq∧dp) = −p dq; ι_(q∂q)ω = q dp, d(q dp) = ω; ℤ² × ℤ = ℤ³, b₁ = 3; Reeb ±∂q on p = ±1 | true; agrees with source p. 102 | N01 |
| §2.3 tangent-image facts | planes in ℝ⁴, point in ℝ² | {q₂ = p₂ = 0} symplectic; {p = 0} Lagrangian; 2·0 ≤ 2 holds, 2 ≤ 2·0 fails | Checks true | none |
| §3.0 composition (sampled) | dimensions; {p=0}∘{p=0}; {p=0}∘{q=0} | ½(d₁+d₂) + ½(d₂+d₃) − d₂ = ½(d₁+d₃); kernel (π₂TL₁₂ + π₂TL₂₃)^ω = 0 if transverse; excess dim 1 vs 0; point | true | none |
| §3.0a generating function (headline, sampled) | free particle; F₂; oscillator; S = qQ; dim 0 | p = P = (Q−q)/t, Q = q+tp; F₂ = ⟨q,P⟩ + t‖P‖²/2; Q = q cos t + p sin t, P = −q sin t + p cos t; λ − φ*λ = d(qp) | true; Lean local statement holds, also in dimension 0 | none |
| §3.0a kinds, composition | dS = p dq − P dQ | d(S+PQ) = p dq + Q dP; d(S−pq) = −q dp − P dQ; d(S−pq+PQ) = −q dp + Q dP; q₂ = (tq₁+sq₃)/(s+t), value −‖q₁−q₃‖²/(2(s+t)) | true | none |
| §3.1 chain dictionary (headline, sampled) | S = qQ, N = 1, 2, 4; general vertex equation; Q = ∅ | ∂A/∂qᵢ = d₁Sᵢ + d₂Sᵢ₋₁ = pᵢ − pᵢ; ψ = q²; A₂ = 2q₀q₁; A₄ = (q₀+q₂)(q₁+q₃) critical on a plane ↔ φ⁴ = id | bijection both ways; both sides empty for Q = ∅ | none |
| §3.1 billiards (headline, sampled) | circle radius R; N = 2, 3, 4; general chord | ∂s∂tℓ = −(χ′(s)·n)(χ′(t)·n)/ℓ > 0; circle: −sin(u)/2R < 0 for S; β̃*λ − λ = dℓ; 8R > 4√2R; ½ = ½; 0 ≠ 1/√2 | true; N = 2 gives a double normal; maximizer has distinct consecutive vertices | none |
| §3.1 recurrence | x ↦ x+1 on ℝ | infinite mass, no return to (0, ½); total mass of AddCircle L × (−1,1) is 2L | finiteness needed and stated | none |
| §4.1 relative Poincaré (sampled) | ℝ², Q the x-axis, η = dx∧dy | fibre scaling: β = −y dx, dβ = dx∧dy, β = 0 on y = 0; x dy ≠ 0 on Q | true; coordinate case is at the pin | C04 |
| §4.2 relative Moser (headline, sampled) | ω₁ = (1+y²)dx∧dy; Q = ∅ | (1+g²)g′ = 1 with g + g³/3 = y, g′(0) = 1; empty Q: U₀ = U₁ = ∅ | true; matches Thm. 7.4 with compact X | none |
| §4.3 first jet | ω₁ = 2dx∧dy, ω₀ = dx∧dy | pullbacks to Q both 0; φ*ω₁ = ω₀ forces det dφ = ½; ι_Y ω_t = −β with β of zero 1-jet | full ambient equality needed and stated | none |
| §4.4 point-germ Darboux (headline, sampled) | same pair; route at q₀ | linear Witt map fixes TQ, realized by a linear chart map fixing Q; then η(q₀) = 0, primitive zero on Q, Moser field zero on Q | true without compactness or constant rank | none |
| §4.5 prescribed derivative (headline, sampled) | T²×ℝ², A = id ⊕ (−id); Q a point; Q = ∅ | −id preserves the area form of ℝ²; realized by (x, −y); point case is Darboux with given differential | true | none |
| §4.6 symplectic neighbourhood (sampled) | ℝ²×{0} ⊂ ℝ⁴; a point | TQ^ω = {0}×ℝ², meets TQ in 0; for a point TQ^ω = T_pM | Checks true | N01 |
| §4.7 Weinstein (headline, sampled) | unit circle in ℝ² | p = (1−r²)/2: dθ∧dp = r dr∧dθ = dx∧dy; p = 1−r: (1/r)dx∧dy; [n] ↦ ω(·,n) well defined since TQ = TQ^ω | true; source uses ω(n,·), also an isomorphism | none |
| §4.8 coisotropic (headline, sampled) | S³ ⊂ ℂ²; σ = 0; dimensions | kernel ℝ·iz, rank 1 = codimension; σ = 0 gives T*Q; dim M = dim Q + rank ker = dim N | true; compactness stricter than Thm. 8.6 | C02 |
| Consumers of §4.8 (lines 1129, 1176) | ConvexityToric, HamiltonianReduction, main and open heads | ConvexityToric: no mention; HamiltonianReduction: lines 73, 276, 286 on main, none for a kernel API | unsupported | C03 |
| Renumbered ids | READMEs on main and open heads | C2.0, C2.1, C3.1, C4, C1, C2 cited by seven roadmaps on main; README has no mapping | citations break at merge | C01 |
| IntegrableSystems I5.2 (line 1179) | main and open revision | main line 534 "I5.2."; open revision line 933 "5.2", no mapping | breaks when that revision merges | C05 |

- Source locators: all 15 locator sites of the README (20 theorem or section references) and the eight docstring locators were read in CannasDaSilvaLSG (lines 601–659, 1089–1128, 1300–1360, 1361–1418, 1420–1436, 1558, 1639–1669, 1845–1869, 1875–1885, 1974–1985, 2030–2040, 2093, 2107–2121, 4158–4167, 4267–4271); printed pages follow from the page markers (PDF page minus 8). All match, with the compactness difference of C02.
- Library declarations opened at the pins: `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:76,115`, `Lagrangian/Manifold.lean:115,120`, `Lagrangian/Embedding/Basic.lean:47`, `Cotangent/GeneratingFunction/MixedHessian.lean:78`, `WittExtension.lean:212`, `Geometry/Manifold/TubularNeighborhood/Existence.lean:53`, `Analysis/Calculus/DifferentialForm/Relative.lean:67,96,192,269`, `Analysis/Calculus/Moser.lean:59,101,148`, `Geometry/Manifold/Distribution/VectorBundle.lean:191`, `Analysis/Matrix/Polar.lean:76`, `Symplectic/MaximalCompact.lean:81`, `Geometry/Lie/Subgroup/Embedded.lean:157`, `Hurewicz/One/Basic.lean:705`, `Cotangent/Bundle/Conormal.lean:109`, `CosphereRadial.lean:181`, `DifferentialForm/HomotopyOperator.lean:100`; Mathlib `LinearAlgebra/SymplecticGroup.lean:59`, `MeasureTheory/Integral/IntervalIntegral/Periodic.lean:69`. No headline is proved at the pin; the files next to each remaining target (Lagrangian, Liouville, Cotangent/Bundle) were listed and hold none of them.
- Cross-roadmap citations resolved on main: HeegaardFloer §4.1 (line 2437), §4.6h (3320), §5.1 (3476); ComplexKahlerGeometry §6.3 (2283); SmoothBundlesConnections B1.2 (502), B1.4 (578), B2.1 (829, dual bundles at 833), Layers 2–5; DifferentialGeometry Layers 3, 4, 8 and 5.4; GeometricTopology §1.5 (974); LieGroups Layers 2, 7, 9; Completed UniversalCovers Stages 1–2; ContactGeometry CG1, CG3–CG5; HamiltonianReduction R1, R3; IntegrableSystems I5.2.
- Automatic checks: the worker's checks all passed on this head. Dependency check output: `depcheck: 186 roadmaps, 2087 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with eight `declaration uses sorry` warnings (lines 103, 135, 164, 181, 199, 221, 258, 277) and no other message. `#check @` on all 11 declarations: every theorem keeps its finite-dimension, boundaryless, Hausdorff, second-countable and compactness binders, as in its README statement; nothing changed. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `exact?`) closes none of the eight theorems.
- Headlines: generating functions, the chain dictionary, periodic billiard trajectories, relative Moser, point-germ Darboux, Weinstein, coisotropic uniqueness and the prescribed-derivative theorem are stated; the docstring names the five that cannot be stated (Kodaira–Thurston not Kähler, composition of correspondences, the billiard map theorems, the symplectic neighbourhood theorem, coisotropic existence), each with its missing carrier, and the carriers it names were found at the pin as described.

Overlap check: read ContactGeometry (open head), SymplecticGeometry (the family index at this head) and IntegrableSystems (open head and main), and searched HamiltonianReduction and ConvexityToric at their heads; shared objects and owners: the contact predicate is ContactGeometry's and the cosphere and conormal constructions are §2.2's, which ContactGeometry's Layer 5 consumes for its unit conormals; the chain dictionary is §3.1's and IntegrableSystems instantiates it; the relative germs are Layer 4's and HamiltonianReduction applies them. Nothing is owned twice.

Source independence: 15 passages compared with 1 source, none shared beyond forced formulas (the tangent-line convexity condition); largest share CannasDaSilvaLSG, 15 of 15 locator sites; contents compared with CannasDaSilvaLSG: independent (Layers 1–4 run in the order of Lectures 2, 3, 4–5 and 6–9, which the Needs lines force: §3.0a needs §1.1–§1.2, §4.7 needs §1.2, §2.2 and §4.5; the scope of each layer is the roadmap's own, with §2.0–§2.1, §3.0, §4.3, §4.5 and §4.6 having no counterpart section).

Research link: Layer 4 is Weinstein's Lagrangian neighbourhood theorem (Weinstein, 1971) and Gotay's coisotropic embedding theorem (Gotay, 1982), as CannasDaSilvaLSG pp. 48–49 cites them; §2.2's example is Thurston's (1976). FukayaTheory, HeegaardFloer and TaubesGromov consume Layer 4. Rests on CannasDaSilvaLSG and the README's Downstream consumers.

## Not verifiable

- none: every locator was read in CannasDaSilvaLSG, and every open head consulted was read at its head.

## Source issues

- **Misprint** in CannasDaSilvaLSG at §5.2, printed p. 32: the source equates the cyclic sum of f(x, y) = −|χ(x) − χ(y)| with the sum of the side lengths; it should be minus the perimeter; affects nothing.
- **Misprint** in CannasDaSilvaLSG at Prop. 6.8, printed p. 39: the statement takes a closed ℓ-form but places its primitive in the forms of degree d − 1; it should be degree ℓ − 1; affects nothing.

## For the human reviewers

- none
