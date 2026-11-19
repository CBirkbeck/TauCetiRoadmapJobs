# Review of KhovanovHomology (pull request #2600 at 72b8f29)

**Verdict:** needs changes

**Summary.** The mathematics holds up: every Check and worked example recomputes, the five Lean headlines are true as stated, and the `T(2, m)` table is exactly the mirror of Khovanov's Proposition 35. Changes are needed for two ownership conflicts. The derived tensor product over the dual numbers in §5.11 is already owned by DerivedModuleAlgebra §0.2, which names this roadmap as its consumer. The link-cobordism carrier of §7.1 is also defined in the open GeometricTopology revision (§6.5), which names this roadmap as its consumer and uses the opposite boundary orientation. There are seven small corrections and one format note, none blocking. Nothing is left for a human to decide.

## R01 (P2) — The derived tensor product over `W = DualNumber R` has two owners: DerivedModuleAlgebra §0.2 and §5.11 here

An implementer of §5.11 would build a second derived tensor bifunctor, with its own functoriality, choice comparisons and unit, composition and balanced-tensor laws. DerivedModuleAlgebra (on main) already plans that object as `derivedTensor`, for every commutative ring.

The two texts hand the object to each other. DerivedModuleAlgebra says that "KhovanovHomology K5 consumes this bifunctor over `W = DualNumber R`" (`TauCetiRoadmap/DerivedModuleAlgebra/README.md` on main, lines 891–897, and lines 91–93, which leave only the bounded model, the dot actions and the connected-sum comparison to this roadmap). §5.11 here (lines 1541–1546) instead asks to "define the derived tensor product of bounded-above module complexes by bounded-above projective (K-projective) resolutions" and to prove its laws. The supplier contracts do not mention DerivedModuleAlgebra, and Downstream consumers (lines 2030–2031) lists it as a consumer of §5.11.

The smallest change keeps the bounded finite-free work and drops the second construction. In §5.11, take the derived tensor product and its laws from DerivedModuleAlgebra §0.2 (`W` is commutative, so that section applies). Keep here the finite semi-free filtration, the K-projectivity, and the explicit quasi-isomorphism `P₁ ⊗_W C₂ → C₁ ⊗_W C₂`, which identifies the ordinary balanced tensor with that bifunctor. Then add a `### From TauCetiRoadmap.DerivedModuleAlgebra` contract (§0.2) and the matching *Needs:* item, and remove DerivedModuleAlgebra from Downstream consumers. DerivedModuleAlgebra is on main, so it is an admissible supplier for this revision.

## R02 (P2) — The carrier of link cobordisms is owned by §7.1 here and by GeometricTopology §6.5 in the open revision #1797, with opposite boundary orientations

The two pull requests contradict each other on who builds link cobordisms in `S³ × [0, 1]`. Merged together, they would leave two carriers whose boundary orientations disagree.

The scope section here says that "GeometricTopology Layer 6 states concordance; the general collared link cobordisms are §7.1's" (lines 2086–2087), and §7.1 constructs the carrier (lines 1748–1753). At the head of #1797, `TauCetiRoadmap/GeometricTopology/README.md` lines 7369–7375 define a link cobordism as a compact oriented surface properly embedded in `S³ × [0, 1]`. Its line 9991 says that "KhovanovHomology also consumes … Layer 6.5's link cobordisms". The conventions differ as well: #1797 uses `∂Σ = L₀ × {0} ∪ −L₁ × {1}`, while this README uses `∂Σ = −L₀ ⊔ L₁` (the Conventions table, line 97, and §7.1).

Since GeometricTopology already supplies this roadmap (Layers 1 and 4), the consistent single owner is GeometricTopology §6.5. §7.1 would then cite it and keep only its decorations: the component-labelled boundary parametrizations, the product collars, the boundary-fixed equivalence and the `ℝ³` chart. It would also add one sentence translating between the two boundary conventions, and #1797 would be named as a dependency in the merge-order paragraph. Alternatively, if §7.1 stays the owner, #1797 must stop defining link cobordisms and drop its consumer line. Either way, one boundary convention should hold in both texts.

## C01 — The citation of Khovanov's Proposition 28 for the regrading `(2l, 6l)` says "in that paper's grading", but that paper's grading is this README's and its printed shift `2l` is a slip

A reader who checks the locator in §5.5 (line 1351) finds `H^{i,j}(L₀) = H^{i+2l, j+2l}(L)` (Kho99 line 1596; Proposition 22 at line 1308 likewise). The phrase "in that paper's grading" suggests a change of grading explains the difference, but nothing does. Khovanov's normalization `C(D) = C̄(D)[x(D)]{2x(D) − y(D)}` (Kho99 line 697), with braces that lower degrees, is Bar-Natan's `[−n₋]{n₊ − 2n₋}`. His own equation (134) (Kho99 line 1303) changes `2x − y` by `6l`. And the Hopf-link Check of §5.5 rules out `2l` under either sign of `l`: `(0, 0) − (2, 2) = (−2, −2)`, where the negative Hopf link has nothing. Would replace the parenthesis with "(Khovanov, §7.2, Proposition 28, whose quantum shift `2l` is a slip for `6l`; compare his equations (45) and (134))".

## C02 — Convention 3 does not say which way Bar-Natan's height shift goes relative to the native cochain shift

Bar-Natan's `C = C̄[s]` has `Cʳ = C̄^(r−s)` (Bar02 lines 167–170), so it moves degrees up by `s`. The native shift has `(K⟦n⟧)ⁱ = K^(i+n)`, as §5.1 and its Check use it: `[−1]` moves the unknot's degree `0` to `1`. So Bar-Natan's `[s]` is the native shift by `−s`; for example his `[−n₋]` is the `⟦n₋⟧` of `TauCeti.OrientedPDCode.khovanovComplexShiftIso`. The sentence "Bar-Natan's `{k}` and `[s]` are our `⟨k⟩` and the cochain shift" (line 106) invites the opposite reading. Would write "the native cochain shift by `−s`", and add that Khovanov's `[n]` (Kho99 line 392) is the native shift by `n`.

## C03 — §3.1 attributes to `CategoryTheory.Functor.cubeComplexMappingConeIso` a cone decomposition "in the direction of any index"; the declaration gives it only in the direction of the least index, up to a shift

At the pin the declaration takes a cube `F : Finset (WithBot ι) ⥤ C` and identifies the cone of the face map in the direction of `⊥` with `F.cubeComplex⟦1⟧` (`TauCeti/Algebra/Homology/Cube/MappingCone.lean`, lines 18–24 and 373). §5.1 already moves the chosen crossing to the front first. Would say at line 602: "in the direction of the least index, up to the shift `⟦1⟧`; another index is first moved to the front by the reordering isomorphism".

## C04 — Ids K1–K7 and G are dropped without an old-to-new numbering, while roadmaps cite them

The PR description gives the mapping, but the README does not, so these citations break at the merge:

- Foams on main: "KhovanovHomology K1/K2/K3/G" at lines 42, 291, 293, 658, 1112, 2591, 2653, 2708, 2769, 2784, and the anchors at lines 2723, 2887, 2888.
- DiagrammaticCoherence on main: the anchor at line 49, and "KhovanovHomology G" at lines 188, 449, 481 and later.
- SpectralSequencesAndConvergencePartII on main: "§K5" at lines 115, 1640, 1715, 1780.
- DerivedModuleAlgebra on main: "K5" at lines 91, 891.
- CombinatorialHeegaardFloer at the head of #2545: "K7" at lines 760, 838, 1360, 1559.

One sentence, for instance in How to read the build, would fix it: "Sections K1–K7 of the earlier numbering are Layers 1–7, and section G is Layer 8."

## C05 — §7.1 does not mention Tau Ceti's collared knot cobordism

`TauCeti.KnotCobordism` (`TauCeti/KnotTheory/Cobordism.lean`, line 149) already records a connected orientable surface embedded in `Sⁿ × ℝ` with cylindrical ends over two knots, with its genus, reversal and ambient transport. A reader of §7.1 and §7.2, whose cylindrical-end construction is the same device, cannot tell whether the knot case is to be rebuilt. Would add it to the supplier contracts and say in one clause how §7.1 differs: links with labelled components, surfaces not necessarily connected, and boundary parametrizations. Also state the comparison: a Tau Ceti knot cobordism is a §7.1 cobordism between one-component links.

## C06 — §5.6 plans a separate skein induction for the value `2^c`, which is GeometricTopology §4.5's `V_L(1) = (−2)^(μ−1)` in another normalization

GeometricTopology §4.5 on main (line 3346) owns `V_L(1) = (−2)^(μ−1)` for the native `TauCeti.OrientedPDCode.jonesPolynomial`, and this roadmap already consumes its Layer 4. The headline follows from it in a few lines. At `q = −1`, Tau Ceti's parity `TauCeti.OrientedPDCode.enhancedQuantumDegree_mod_two` gives `χ_q(−1) = (−1)^c E(D)`. Tau Ceti's comparison `enhancedStateSum_eq_mul_eval₂_jonesPolynomial` gives `χ_q(−1) = (−2)·V(1) = (−2)^c`. So `E(D) = 2^c`, and the empty diagram is `enhancedStateSum_empty`. Would cite GeometricTopology §4.5 in §5.6, either as the input or as an alternative route to the induction (which may stay as a proof sketch), so that the value is not owned twice. The scope sentence at line 734 ("§5.6 proves the value at `q = 1`") would change with it.

## C07 — The description says the new file imports "seven Tau Ceti modules"; it imports six

`Suggested.lean` lines 2–7 import `BraidWord.PDCode`, `Khovanov.EnhancedState`, `Khovanov.EulerCharacteristic`, `PDCode.Basic`, `PDCode.Oriented.Reidemeister.Equivalence` and `PDCode.ResolvedCircle.Adjacent`. The description should read "imports `Mathlib` and six Tau Ceti modules".

## N01 — Four lines of `khovanovHomology_closure_replicate` (`Suggested.lean` lines 113, 116, 119, 122) run to 103–107 characters; breaking them would keep the file under the 100-character limit.

## Questions for the author

- In §8.3 (lines 915–918), "with the first slot `0` west and the second slot `1` west" places two slots on the same side. Which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are meant, and is the frame fixed by the native slot order of the two new crossings? The logic is consistent: the same local direction is clockwise around a small lune and counterclockwise around an enclosing circle. But nothing at the pin carries a plane frame, so I could not check the stated conclusions against the native constructor.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 adjacent states | trefoil `σ₁³` states; one-crossing code `0–2`, `1–3` | circles 2,1,2,3; `#B+#circles` 2,2,4,6 / `V−E+F = 1−2+1 = 0`, both states one circle | holds | none |
| §1.7 vertex resolution | `resolveCrossing` at the pin | `PDCode (n+1) → PDCode n`, ≤ 2 detached circles, planar, circle equiv to `c.insertNth t s` / VertexResolution.lean 285–981 | holds | none |
| §2.4 merge and split | basis of `V`, `V⊗V` | `X⊗X↦0`, `1⊗X↦X`, `1↦1⊗X+X⊗1`, `mΔ(1)=2X` / Edge.lean:143 covers MM, MS, SM, SS | holds | none |
| §3.1 cube totalization | square cube; face `A={2},B={1}` and `A={1},B={2}` | `d⁰=(1,1)`, `d¹=(−1,1)`, composite 0 (2 unsigned); vertex sign −1 reconciles / declaration only in direction `⊥` | holds | C03 |
| §3.4 finiteness | zero ring; `R=ℤ` | support `[−n₋, n₊]` from `isStrictlyGE/LE`; finite free terms ⇒ f.g. over Noetherian `R`; zero ring all zero | holds | none |
| §8.3 orientation bits | small lune vs enclosing circle | top arc rightward = clockwise small; flipped bounded side = counterclockwise / no native frame | consistent | question |
| §8.7 braid closures | empty word, `k` strands | `closure_nil = unlink (replicate k true)`; up right, down left = counterclockwise; right return arcs = clockwise | holds | none |
| §4.2 planar move relation | all eight generators | every planarity lemma is an iff at the pin; clasp carries face/orbit condition; R1 `ΔV−ΔE+ΔF = 1−2+1 = 0` | holds | none |
| §4.6 smooth links | grep of pinned Tau Ceti | no realization of PD-codes as smooth links / docstring says not statable | holds | none |
| §5.2 universal coefficients | trefoil over `𝔽₂` | `(0,1),(0,3),(2,5),(2,7),(3,7),(3,9)`; `Tor(Hⁱ⁻¹)` variant gives `(4,7)`; Hom sign `(−1)^(i+1)` = Mathlib `δ` | holds | none |
| §5.3 Künneth | two trefoils; two unknots | `Tor(ℤ/2,ℤ/2)` at `(5,14)`; `V⊗V` ranks 1,2,1 / Kho99 Prop 33 index `k−i+1` | holds | none |
| §5.5 orientation reversal | Hopf link, `l = 1` | `(0,0),(0,2),(2,4),(2,6)` − `(2,6)` = negative Hopf / Kho99 Prop 28 `(2l,2l)` gives `(−2,−2)`: empty | README right | C01 |
| §6.3 trefoils and Hopf | right trefoil, Hopf `σ₁²` | `(q+q⁻¹)(q²+q⁶−q⁸) = q+q³+q⁵−q⁹`; Hopf `1+q²+q⁴+q⁶`; reduced `q², q⁶t², q⁸t³` via LES | holds | none |
| §6.5 adequacy | trefoil; positive kink | all-`X` at all-A a cycle, all-`1` at all-B not hit / Kho99 Prop 36: `H⁰ ≠ 0` iff −adequate | holds | none |
| §7.4 local events | definitions | changing discs as Jac02 Def 8; distant events disjoint discs; nothing numeric to compute | consistent | none |
| `nonempty_homotopyEquiv_…` | `D = D'`; zero ring; positive kink vs unknot | trivial; both zero; ranks `4,2` = `2 + Cone(id) 2,2`; planarity transfers along chains | true | none |
| `nonempty_khovanovHomology_mirror_iso_dual` | trefoil over `𝔽₂`; empty | negated right `𝔽₂` bidegrees = left `𝔽₂` from integral UCT; `F ≅ F*` | true | none |
| `eval₂_one_enhancedStateSum` | trefoil, Hopf, empty, nonplanar one-crossing code | `4−6+12−8 = 2`; `4`; `1 = 2⁰`; nonplanar `2−2 = 0 ≠ 4` (planarity needed) | true | C06 |
| `khovanovHomology_closure_replicate` | `m = 2,3,4,5`; sets | table `χ = q^(m−2)+q^m+q^(m+2)±q^(3m)` = `(q+q⁻¹)·V` (T(2,5): `V=t²+t⁴−t⁵+t⁶−t⁷`); free/torsion disjoint, rank ≤ 1 | true | none |
| `le_of_isAdequate_of_reidemeisterEquiv` | `n = 0`; trefoil; nonplanar `D'` | vacuous; `Kh` at 0 and 3 ⇒ `m ≥ 3`; nonplanar `D'` impossible by iff lemmas | true | none |
| functoriality (not statable) | torus, sphere, pants | `ε∘m∘Δ∘η = 2`, `ε(1) = 0`, degree `χ`; Jac02 Thm 2 degree `j+χ` | holds | R02 |
| Euler characteristic = Jones | trefoil, Hopf | `T↦−q`: `q+q³+q⁵−q⁹` = Tau Ceti lemma; Hopf `q+q⁵`; `T↦q` gives negative sum | holds | none |
| §5.11 derived tensor | ownership | README 1541–1546 defines one / DerivedModuleAlgebra main 891 says K5 consumes `derivedTensor` | two owners | R01 |
| §7.1 link cobordisms | ownership, `∂Σ` | `−L₀ ⊔ L₁`, owned here / #1797 §6.5 `L₀×{0} ∪ −L₁×{1}`, Khovanov consumer | two owners | R02 |
| Convention 3 shifts | `[−n₋]`, §5.1 `[−1]` | BN `Cʳ = C̄^(r−s)` / native `(K⟦n⟧)ⁱ = K^(i+n)`; BN `[s]` = native `−s` | ambiguous | C02 |
| §8.1 crossing sign; §7.3 chart | over `(1,0)`, under `(0,1)`; south pole | `det = 1 > 0`; `‖2y‖²+(‖y‖²−1)² = (1+‖y‖²)²`; `det(−e₃,e₀,e₁,e₂) = +1` | holds | none |

- Source locators checked against the text: 32 (Kho99 19: §§2.1, 2.2, 4.2, 6.2, 7.1–7.7, Props 9, 26–28, 30, 32, 33, 35–37, Cors 11–13, Defs 3–5; Bar04 8; Bar02 1; Jac02 3; Kho02 1).
- Tau Ceti declarations opened at the pin: `IsReidemeisterMove` and `ReidemeisterEquiv` (Equivalence.lean:95, 130), the eight planarity iff lemmas, `BraidWord.closure`, `crossingSign_closure`, `closure_nil`, `enhancedStateSum` and its Jones comparison, `khovanovHomology`, `khovanovEulerChar_*`, `circlesAt`, `resolveCrossing*`, `resolutionEdgeMap_comp_resolutionEdgeMap_comm`, `cubeComplex*`, `mirrorKhovanovBracketIso`, `extToHomology`, `linearHomComplexPostcomp`, `interior_image_criticalPoints_eq_empty` (hypothesis `dim² + 1`), `enhancedQuantumDegree_mod_two`, `KnotCobordism`; Mathlib `CochainComplex.linearHomComplex` (HomComplex.lean:980).
- Cross-roadmap citations resolved on main: GeometricTopology §§1.1, 1.3, 1.5, 4.2, 4.2.3, 4.5, 4.8.1, Layer 6; DifferentialGeometry Layer 2, 3.2, 3.3, 3.5, Layer 5; ConformalMapping Layer 5; AlgebraicTopology 4.3, 7.1; DGAInfinity Layers 1, 5; ZigzagPreprojective Layer 8; DerivedModuleAlgebra §0.2; SpectralSequencesAndConvergencePartII §4.1. All exist.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: five `sorry` warnings, nothing else. `#check @` of all eight declarations matches the README statements, with no binder lost.
- One-tactic probes (`rfl`, `simp`, `infer_instance`, `omega`) fail on the invariance, mirror, `q = 1` and adequacy theorems; `T(2, m)` was decided by reading. No padding. Sanity examples `(3,7)`, `(3,9)`, `(0,1)` at `m = 3` and `(2,4)` at `m = 2` elaborate against the two bidegree sets.

Overlap check: read GeometricTopology (main, #1797, #1791), Foams and DiagrammaticCoherence (main, #2578), CombinatorialHeegaardFloer (#2545), DerivedModuleAlgebra and SpectralSequencesAndConvergencePartII (main). Shared objects and their owners: the derived tensor over `W` (DerivedModuleAlgebra §0.2; R01); link cobordisms (disputed between GeometricTopology #1797 §6.5 and §7.1 here; R02); `V_L(1)` (GeometricTopology §4.5; C06); adequacy (GeometricTopology §4.8.1 for knots, §6.5 here for links, stated in the scope section); the length-one `Tor'`/`Tor` comparison (here, accepted by SpectralSequencesAndConvergencePartII §4.1); planar calculus, formal surfaces and plane geometry (here, consumed by Foams and DiagrammaticCoherence).

Source independence: 22 passages compared with 5 sources; nothing shared beyond forced formulas and standard names (changing disc, movie move numbers). Largest share Kho99, 16 of 33 locators. Contents compared with Kho99: independent. Layers 1 and 8 have no counterpart, Layer 5 mixes Kho99 §§6.1 and 7.2–7.4 with Kho02 §3, Layer 7 draws on Jac02 and Bar04, and the order 2 → 3 → 4 → 5/6 is the one the *Needs:* lines force.

Research link: the invariance and cobordism targets (Khovanov 2000, Bar-Natan 2005, Jacobsson 2004) underlie Rasmussen's invariant (Rasmussen 2010). GeometricTopology §6.3 says its Part II builds that invariant on this roadmap, for Piccirillo's 2020 proof that the Conway knot is not slice. This rests on the README's references and on the GeometricTopology README on main, line 6526.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5), Lickorish Ch. 1 (§8.6), Roseman, Carter–Saito 1993 and Carter–Rieger–Saito (§7.5): these are books or paywalled papers outside the sample, and I did not open them.
- The frame dictionary of §8.3: the pin has no plane data to check it against (see the question above).

## Source issues

- **Error** in Kho99 at Proposition 22 (eq. 135, p. 35) and Proposition 28 (eq. 155, p. 41): the source shifts the quantum degree by `2l` when one component is reversed; it should be `6l`, as its equations (45) and (134) give and the Hopf link confirms; affects a stated result.
- **Misprint** in Kho99 at Proposition 37, proof, p. 46: the source says the chain groups of a minimal diagram vanish above `hl(L)`; it should be above `c(L)`, the number of crossings, which yields `hl(L) ≤ c(L)`; affects the proof.

## For the human reviewers

- none
