# Review of Orbifolds (pull request #2624 at ea71841)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings: the Yang–Cairns headline (§3.1 and its Lean statement) carries a finite-stabilizer hypothesis that Yang's theorem does not have; Orbifolds and the two symplectic roadmaps on main name each other as suppliers, so the comparisons of §7.3 have two owners; and §1.2 restates as a target a theorem that LieGroupoidsPoisson §G3.5 already owns. The Checks and worked examples I recomputed are all correct. There are also six small corrections and one format note, none blocking. Nothing is left for the human reviewers to decide beyond one source that could not be read.

## R01 (P2) — The Yang–Cairns headline adds a finite-stabilizer hypothesis that Yang's theorem does not have

The library would get only the special case of a named theorem that the frame-bundle route needs. Yet the route the README plans (finitely many orbit types near each compact set, linear slices, Cairns' locally polyhedral triangulation) is Yang's general proof, and the same proof gives the general statement. Yang1963 lines 119–121 (Theorem, p. 407) states that M/G is triangulable for every compact Lie group G acting differentiably on a differentiable manifold M (lines 12–14: separable metric, components possibly of different dimensions). The proof (lines 122–155) works through the orbit types M_(H), with the stabilizer G_x acting orthogonally on a slice, and never uses finiteness of G_x. The hypothesis excludes cases Yang covers: for S¹ rotating S² about an axis, the stabilizers at the poles are S¹, so `hfin` fails, while the orbit space is the interval [−1, 1], which is triangulable. The narrowing is at §3.1, lines 571–572 ("acts smoothly and locally freely (all stabilizers finite)"), in the summary at lines 21–23, and in `Suggested.lean` at line 68 (`hfin`).

The smallest change is to drop the finite-stabilizer hypothesis in §3.1, in the summary and in the Lean statement. The declaration name would then lose its `_of_locallyFree` suffix. In the route, replace the finite stabilizer acting linearly with the compact stabilizer acting orthogonally on a slice. SmoothBundlesConnections B1.4 already supplies that slice: equivariant linear charts for compact group actions and the slice theorem with a compact stabilizer (lines 584–596 of its README on main). The application to the frame actions `(F_n, O(n))` in §3.1's second paragraph is a special case and does not change.

## R02 (P2) — Orbifolds and HamiltonianReduction/ConvexityToric name each other as suppliers, and the comparisons of §7.3 have two owners

This breaks the single direction of supply: neither side can be built first. It also means two roadmaps plan the same comparisons.

- **This roadmap's side.** Orbifolds names HamiltonianReduction R3 and ConvexityToric Layer 4 as suppliers: the §7.3 *Needs:* line (line 1610) and the supplier contracts (lines 1948–1958). It also lists ConvexityToric §1.1 in the *Needs:* line of §4.9c (line 1276). Its own scope, however, says that "ConvexityToric Layer 4 consumes §§4.3–4.9c and Layer 5" (line 1716).
- **The other roadmaps on main.** HamiltonianReduction's README (line 258) gives R3 "the comparison with Orbifolds O4.2" and asks it (line 260) to identify its level form with that invariant-form carrier. ConvexityToric (line 802) asks to "Prove that T4's concrete level bundle and R3's restricted symplectic form identify with these carriers" and lists Orbifolds as a supplier (line 176).
- **The overlap.** §7.3 (lines 1595–1608) asks for the same identifications of R3's forms and of ConvexityToric's torus bundles, classes and volumes.

The smallest change leaves these comparisons with the consumers, who already state them:

- §7.3 becomes a sentence saying that HamiltonianReduction R3 and ConvexityToric Layer 4 make these comparisons on their models.
- The two `From TauCetiRoadmap.SymplecticGeometry.*` supplier contracts are dropped.
- ConvexityToric §1.1 leaves the *Needs:* line of §4.9c, which already takes the isomorphism `T ≃ (S¹)^m` as a given datum (lines 1154–1155).
- The summary's "Layer 7 compares the constructions" (line 42) is adjusted to match.

## R03 (P2) — §1.2 restates as its own target a theorem that LieGroupoidsPoisson §G3.5 owns on main

Two owners for one theorem means it gets proved twice. §1.2 (lines 185–187) asks to prove that "a Morita equivalence induces a homeomorphism of coarse spaces and isomorphisms of the isotropy groups at corresponding points". LieGroupoidsPoisson §G3.5 (line 1110 of its README on main) already states this for all Lie groupoids: Morita-equivalent groupoids have homeomorphic orbit spaces and isomorphic isotropy Lie groups at corresponding points. The coarse space of Convention 3 is that orbit space. The fix is to cite §G3.5 for these two facts in §1.2, where it is already on the *Needs:* line. The targets that stay in §1.2 are the continuity and functoriality of coarse maps along generalized maps and the topological properties of the coarse space.

## C01 — The README does not map the old numbering, which roadmaps on main still cite

Several roadmaps on main cite the old item numbers:

- HamiltonianReduction (lines 258 and 260) cites Orbifolds O1.4/O2 and O4.2.
- StringOrientation (line 89 and six more) cites O2 item 6.
- ConvexityToric (line 802) cites O4 item 1.
- GromovWittenTheory (lines 278, 290, 402 and 580) cites O5 items 1, 4 and 5.

The headings keep the lettered blocks (line 706), but nothing in the README says that item n of Ok is now §k.n. The pull request's description says so ("Old `Ok.n` is new §k.n throughout"). One such sentence in the README, for instance after the guide to the layers, would let these citations resolve.

## C02 — Three source citations need repair

1. §2.1 (line 331) cites Moerdijk §2 for the linear-chart theorem. Moerdijk2002 §2 (from line 148) covers maps and Morita equivalence. The statement is in §3.4, p. 8 (Moerdijk2002 lines 347–355).
2. §4.9 (line 997) attributes the model `BG = δ*(NG)` to van den Berg and Moerdijk, but the References have no entry for it. The source is van den Berg–Moerdijk, *Univalent completion*, Math. Ann. (2018), §2.3 (vandenBergMoerdijk2018 lines 126–129).
3. The headline rational comparison of §4.4 and the Morita invariance of properness used in §1.1 carry no locator, although Moerdijk states both: §4.4, p. 12 (Moerdijk2002 lines 505–514) and §2.7, p. 7 (Moerdijk2002 lines 287–289).

## C03 — The summary says FuchsianOrbifolds applies this roadmap, but it cites no part of it

Line 41 reads "HamiltonianReduction, ConvexityToric and FuchsianOrbifolds apply the roadmap to their quotients". The FuchsianOrbifolds README on main does not cite this roadmap. The dependency runs one way: §7.4 consumes FuchsianOrbifolds. Drop FuchsianOrbifolds from that sentence.

## C04 — §5.3 uses "the open unit ball" for an arbitrary finite linear group, which need not preserve it

Lines 1384–1385 take a finite group acting linearly on `ℝ^n` and the open unit ball B. Here is a counterexample: let `g = A R A⁻¹`, with `A = diag(2, 1)` and R the quarter turn. Then g has order 4 and sends the unit vector `(0, 1)` to `(−2, 0)`, so `B/G` is not defined. Say that G acts orthogonally, or take B to be the unit ball of an invariant inner product, as §2.1 does.

## C05 — Five declarations of `Suggested.lean` are not headline theorems, and two of them hold by unfolding

- `pointGroupIntegral_one` is proved by `simp` from two definitions, and `weightedFunctional_apply` by `rfl`, so neither asks anything of an implementer.
- `invariant_lift`, `weightedFiniteSum_eq_orbitWeightedSum` and `pointWeight_mul_invariant_of_same_orbit` did not close with one tactic. They are still API lemmas of the finite model, not results the finished roadmap is tested against. `invariant_lift` follows in three steps from Tau Ceti's `Representation.IntertwiningMap.map_averageMap` and Mathlib's `Representation.averageMap_invariant` and `Representation.averageMap_id`.
- The six §5.1 definitions serve only these lemmas.

If the author keeps them as sanity checks of the chart weight, the docstrings and the module docstring could say so. Otherwise §§2.4 and 5.1 of the README already carry them as targets.

## C06 — Two sentences of the description do not match the change

- "Four declarations that the pin already has are removed": the change removes five (`stabilizerAutEquiv`, its two label lemmas, `reynolds_idempotent` and `reynolds_natural`).
- "From each roadmap cited: … each by section": TopologicalKTheory, LieGroups and FuchsianOrbifolds are cited without a section, and so are GeometricTopology's triangulations (N01).

The right text would say "Five declarations …" and "each by section, except TopologicalKTheory, LieGroups, FuchsianOrbifolds and GeometricTopology's triangulations".

## N01 — Four supplier citations name no section

Each of these is cited only by roadmap name:

- TopologicalKTheory: the §4.7 *Needs:* line (line 901), line 1306 and its supplier contract.
- LieGroups: line 499 and its supplier contract.
- FuchsianOrbifolds: the §7.4 *Needs:* line (line 1624) and its supplier contract. The elliptic charts are its Layer 1.
- GeometricTopology's simplicial complexes and smooth triangulations: line 591 and its supplier contract. These are its §§11.1 and 11.3 on main; the collars are §1.1.

## Questions for the author

- Convention 1 lets dimensions differ between components of `Γ₀`, and §§2.5 and 3.3 are written for that case. LieGroupoidsPoisson §G0.2 builds Lie groupoids on "a manifold of objects", and its bullets use a single `dim M`. Does that carrier allow components of different dimensions? A Mathlib charted space has one model space. §G0.2 does not say, which is what stopped me from deciding whether the convention and its carrier agree.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed check | Result |
|---|---|---|---|---|
| §1.1 proper étale presentations | `[*/(ℤ/2)]`; ℤ on ℝ; irrational ℤ on S¹; pair groupoid ℝ×ℝ | Checks: proper; proper; not proper; equivalent to point, not étale | 2 arrows, isotropy ℤ/2; infinitely many arrows between fixed small sets; `s` has rank 1 on ℝ² | holds; Morita closure true (Moerdijk2002 lines 287–289); locator missing (C02) |
| §1.2 Morita and coarse space | Čech groupoid of cover vs `M`; `[*/(ℤ/2)]` vs point | same coarse space; not Morita equivalent | isotropy orders 2 vs 1 differ | holds; homeomorphism duplicates LieGroupoidsPoisson §G3.5 (R03) |
| §2.1 linear charts (headline) | `ℤ/4` on ℂ, generator `z↦−z`, at 0 | chart group ℤ/4, every label kept | effective quotient ℤ/2; kernel {0,2} | holds; locator is Moerdijk2002 §3.4, not §2 (C02) |
| §2.3 face kernel | shear `(x,y)↦(x,y+x)` | `N≠0, N²=0`, infinite order | `(Id+N)^m = Id+mN ≠ Id` for every m ≥ 1 | Check true; finite order needed |
| §2.4 averaging | ℤ/2 swapping ℤ², map `(a,b)↦a+b` | image of invariants 2ℤ; over ℚ, (½,½)↦1 | invariants {(a,a)}, image {2a} | holds; `invariant_lift` hypotheses suffice |
| §2.4 cutoff | `[*/G]`, \|G\| = 3 | c = 1/\|G\| | 3 · 1/3 = 1; constant 1 gives 3 | Check true |
| §2.5 frame bundles | ℤ/3 rotating ℝ²; ℤ/3 × ℤ/2 with ℤ/2 trivial | O(2)-stabilizer ℤ/3 over 0, free elsewhere | `e⁻¹ℤ/3 e` ≅ ℤ/3; ℤ/2 fixes all frames | holds; effective reduction needed |
| §2.6 coarse diffeology | ℤ/2 on ℝ: x², \|x\| | x² descends `DSmooth`, \|x\| not | x ↦ \|x\| is not smooth at 0 | Check true |
| §3.1 Yang (headline, Lean) | S¹ on S³ weights (2,3); irrational ℝ-flow on T²; S¹ rotating S² | locally free → triangulable | S²; indiscrete, not T2; [−1,1] triangulable but excluded by `hfin` | true but narrowed (R01) |
| §3.3 star covers | dimension-n component | multiplicity ≤ n+1 | carrier simplex has ≤ n+1 vertices | holds |
| §3.5 face signs | cylinder, m = 0, 1; square | ends `(−1)^m`, `(−1)^(m+1)` | m = 1: −1 at t=1, +1 at t=0; vertex terms +1, −1 | Checks true |
| §4.2 invariant forms | `[ℝ/(ℤ/2)]`, `x↦−x` | g dx invariant iff g odd | pullback `−g(−x)dx`; `d(x²)=2x dx` invariant, dx not | Check true |
| §4.3 fat model | unit groupoid M; `[*/K]` | BΓ ≃ M; BΓ ≃ BK | fat point chain complex: d_n = 1 (n even), 0 (n odd), acyclic | holds |
| §4.4 rational comparison (headline) | `[*/(ℤ/2)]` | iso over ℚ, ℝ; not ℤ | H²(Bℤ/2;ℚ) = 0 = H²(pt); H²(Bℤ/2;ℤ) = ℤ/2 | holds; Moerdijk2002 §4.4 |
| §4.4a collared pairs | `[*/K] × [0,1]` | rational iso on pairs | H¹(BK×I, BK×∂I; ℚ) = ℚ = H¹(I, ∂I; ℚ) | holds |
| §4.5 de Rham (headline) | ℤ ⋉ ℝ; ℤ/m on ℝ² | H¹ = ℝ; H^{>0} = 0 | dx closed, not d(periodic); invariant Poincaré | Checks true |
| §4.7 / §4.8 represented bundle | `[*/(ℤ/n)]`, nontrivial character χ | c₁ ≠ 0, real image 0 | c₁ = χ ∈ ℤ/n ≅ H²(Bℤ/n;ℤ); forms vanish on a point | Checks true |
| §4.9 latching | `[*/K]`, N_p = K^p | L_p clopen | tuples with some entry 1: finite union, discrete | holds |
| §4.9a paracompactness | `U_n=(−n,n)`, `V_n=(−n+½,n−½)` | W₂ = (−2,2)∖[−½,½] | covers ℝ; V_m meets only W_n with n ≤ m; open variant not open | Check true |
| §4.9b stalk | ℤ/2 on (−1,1) | ℚ in degree 0 only; 𝔽₂[w] | EG×_G B ≃ ℝP^∞; coarse stalk [0,1) | Check true |
| §4.9c torus classifier | `[*/(ℤ/n)]`, T = S¹; m = 0 | class ±χ, torsion; trivial | `F_j(xg) = χ_j(g)F_j(x)` by substitution; F_j(e) = 1 | holds |
| §5.1 weighted integration (headline) | `[*/K]`; ℤ/2 on {a,b,c}; ℤ/2 half-turn; ℤ/m on disc | 1/\|K\|; 3/2; π; π/m | ½·3 = 1 + ½; ½·2π; area π/m | Checks true |
| §5.2 Stokes | `[*/K] × [0,1]`, f | ∫ df = (f(1) − f(0))/\|K\| | both sides carry 1/\|K\| | holds |
| §5.3 local homology | ℤ/2 reflection on ℝ; ℤ/m on ℝ²; `A R A⁻¹` | 0; H₂ = ℚ | `[0,1)` rel `(0,1)` acyclic; (0,1) ↦ (−2,0) leaves B | holds; ball needs invariance (C04) |
| §5.4 duality (headline) | `[*/ℤ/3]`; S²/(ℤ/m); K × N | (1/3)[pt]; 4π/m; (1/\|K\|)[N] | ⟨1, class⟩ = 1/3 = ∫1; area 4π/m | Checks true |
| §5.5 Thom | `[*/K]`, trivial ℝ^r; sign line | weights cancel; pair acyclic | ∫_E Φ = 1/\|K\|; E∖0 ≃ E(ℤ/2) contractible | Checks true |
| §6.1 cobordism | cylinder, m odd | ends ±Γ need reversal | base-first: +Γ at 0, −Γ at 1 for m odd | Check true |
| §7.2 trivial gerbes | K = ℤ/2, N = S¹ | weighted class ½[S¹]; ratio k | ∫_full dθ = π, ∫_eff = 2π | holds |
| §7.3 Hamiltonian | trivial gerbe | ∫_eff = k·∫_full | 2π = 2·π | true; ownership duplicated (R02) |
| §7.4 Fuchsian charts | elliptic point of order m | weighted area = area/m | matches §5.1 π/m | holds; section missing (N01) |
| Lean §5.1 block | probe, one tactic each | finite chart weights | `_one` by simp, `_apply` by rfl; other two not closed | padding (C05) |

- Source locators checked against the text: Yang1963 lines 119–155; Moerdijk2002 lines 148–294, 298–307, 347–355, 505–514; MoerdijkPronk1999 lines 111–223; vandenBergMoerdijk2018 lines 106–129.
- Library declarations opened at the pins: every Tau Ceti name in the supplier contracts found in its named file (about 65). Hypotheses read for `t2Space_isomorphismClasses` and `paracompactSpace_isomorphismClasses` (`Topology/CategoryTheory/IsomorphismClasses.lean` lines 92 and 104), `exists_isotropy_action_of_proper_source_target` (`Topology/CategoryTheory/Etale.lean` line 222), `ActionGroupoid.invariantForms` (`…/ActionGroupoid/InvariantForm.lean` line 131), `ActionGroupoid.coarseMap` (`Topology/CategoryTheory/ActionGroupoid/Nerve.lean` line 164), `IsTriangulable`, `TopCat.singularCohomology` (`AlgebraicTopology/Cohomology/Basic.lean` line 129).
- Mathlib declarations opened: `IsOpenQuotientMap.locallyCompactSpace` (`Topology/Compactness/LocallyCompact.lean` line 190), `Topology.IsOpenQuotientMap.secondCountableTopology` (`Topology/Bases.lean` line 1137), `Diffeology.dTopology` (`Geometry/Diffeology/Basic.lean` line 191), the averaging lemmas (`RepresentationTheory/Invariants.lean` lines 131–141). Mathlib and Tau Ceti have no Lie groupoid carrier, and the coarse map exists only for action groupoids, as the module docstring says.
- Cross-roadmap citations resolved on main: about 40 sections in LieGroupoidsPoisson, SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, GeometricTopology, ComplexKahlerGeometry, HamiltonianReduction and ConvexityToric. All suppliers are on main.
- Automatic checks: the full gate rerun passes. The dependency check reports "depcheck: 200 roadmaps, 2201 edges, 0 problem(s)"; the two-way supply of R02 is between roadmaps that are all on main and was found by reading.
- Elaboration: `Suggested.lean` elaborates with four `sorry` warnings only (lines 46, 60, 116, 124). A `#check @name` file for every sorried declaration showed every binder present and the types matching the README statements; nothing changed.
- Counts in the description verified: 29 Check lists, 45 Checks and 42 *Needs:* lines.

Overlap check: read StringOrientation, ConvexityToric, ImplicitAtlases, TangentialBordism, LieGroupoidsPoisson and CharacteristicClasses. Shared objects: the Morita invariance of orbit spaces and isotropy is owned by LieGroupoidsPoisson §G3.5 (R03). The comparisons of R3's level form and ConvexityToric's level bundle with this roadmap's carriers are claimed by HamiltonianReduction R3, ConvexityToric Layer 4 and §7.3 (R02). The manifold diffeology is owned by Tau Ceti (`TauCeti.manifoldDiffeology`), and StringOrientation cites it as Orbifolds O2 item 6 (C01). ImplicitAtlases, TangentialBordism and CharacteristicClasses share nothing. The open pull requests touching these roadmaps drop none of the ids cited here.

Source independence: 12 passages compared with 4 sources (Yang1963, Moerdijk2002, MoerdijkPronk1999, vandenBergMoerdijk2018); no wording is shared beyond forced formulas. The largest share of the in-text locators is Yang1963 (2 of 8, tied with Cairns1941). Contents compared with Moerdijk2002 (§§1–6) and Yang1963: independent. Layers 3 and 5–7 have no counterpart in Moerdijk, and Layer 4 puts bundles before the classifying space; the order of Layers 1–2 is forced by the *Needs:* lines.

Research link: the roadmap builds the groupoid model of orbifolds with ineffective isotropy (Moerdijk–Pronk 1997; Moerdijk 2002, §§3–4), the rational comparison of BΓ with the coarse space (Moerdijk 2002, §4.4), adapted triangulations (Moerdijk–Pronk 1999, §1.2) and Yang's 1963 triangulation. GromovWittenTheory consumes its weighted pairing. This rests on the README's References and Moerdijk2002, which I read.

## Not verifiable

- AdemLeidaRuan2007 (Chapters 1–2, cited in §5.1): only the Cambridge landing page was found, with no open copy.
- Cairns1941 (*Lectures in Topology*, pp. 143–157, cited in §3.1): no legal copy found.
- MoerdijkPronk1997 (K-Theory 12, cited in the References only): only publisher and Portico landing pages were found.
- Sampled sections 1.1, 1.2, 2.4, 2.5, 4.2, 4.3, 4.4a, 4.7, 4.9a, 4.9c, 5.2, 5.4 and 7.2 cite no source text, so there is no locator to verify. Their statements were checked by computation (table above). §3.5 cites DifferentialGeometry §5.1, which resolves; §7.4 cites FuchsianOrbifolds without a section.

## Source issues

- **Misprint** in Moerdijk2002 at §2.5, p. 6: the source says one may think of H′ as a cover of H′; it should be a cover of H; affects nothing.
- **Misprint** in MoerdijkPronk1999 at §1.2, p. 5: the source refers to good covers "as in Proposition 1.2.5"; the statement is numbered Corollary 1.2.5; affects nothing.

## For the human reviewers

- Not tested: Cairns1941 (*Lectures in Topology*, pp. 143–157) is tied with Yang1963 for the largest share of the README's in-text locators (2 of 8) and could not be read legally. Wording and arrangement were not checked against it.
