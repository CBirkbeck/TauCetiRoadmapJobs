# Review of KhovanovHomology (pull request #2600 at 373b4c5)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings, none of which says the mathematics is wrong: every Check, worked example and Lean headline recomputes, including the `T(2, m)` table for `m = 2, …, 7` and the figure-eight torsion. The README plans work it should cite or leave out: §§5.2–5.3 plan the Künneth sequence and the splitting of cycles, which the pinned Tau Ceti proves; §5.11 plans K-flatness, K-projectivity and the augmentation quasi-isomorphism, which the pinned Tau Ceti and Mathlib prove; and §6.1 plans a Smith-normal-form certificate interface and certified row reduction, which is computational infrastructure rather than mathematics. The previous review's derived-tensor finding and its seven small corrections are repaired, and its link-cobordism finding is deferred. There is one small correction (the note on Khovanov's Proposition 28) and two format notes, and nothing is left for a human to decide.

## R01 (P2) — §§5.2–5.3 plan the Künneth exact sequence and the freeness and splitting of cycles, which the pinned Tau Ceti already proves

An implementer of §§5.2–5.3 would rebuild the Künneth maps and prove their exactness, naturality and splitting, along with the freeness of cycles and boundaries of free `ℤ`-complexes. All of these are declarations at the pin. The scope section nonetheless lists "the complex-level universal coefficient, Hom/Ext and Künneth theorems for bounded finite free integral complexes" among what this roadmap owns (line 2072).

The pinned Tau Ceti has the following:
- `HomologicalComplex.homologyKunnethShortComplex_shortExact` (`TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean`, line 729). For `ℕ`-indexed chain complexes of modules over a commutative ring, where the second complex has projective cycles and projective quotients by its cycles, it proves that `0 → ⊕ Hₚ(K) ⊗ H_q(L) → Hₘ₊₁(K ⊗ L) → ⊕ Tor₁(Hₚ(K), H_q(L)) → 0` is exact, with Mathlib's `CategoryTheory.Tor`. The same file proves naturality (`HomologicalComplex.homologyToTor_naturality`, line 658, with `HomologicalComplex.homologyKunneth_naturality`) and a splitting when the cycles of `K` split off (`HomologicalComplex.homologyKunnethShortComplexSplitting`, line 793).
- `HomologicalComplex.free_cycles_of_isPrincipalIdealRing`, `HomologicalComplex.isSplitMono_iCycles_of_isPrincipalIdealRing` and `HomologicalComplex.free_cokernel_iCycles_of_isPrincipalIdealRing` (`TauCeti/Algebra/Homology/PrincipalIdealRing.lean`, lines 60–83). For complexes of any shape over a principal ideal domain, these give free cycles, split cycle inclusions and free quotients by the cycles. That is §5.2's request to "prove these submodules finite free, and split `0 → Zⁱ → Cⁱ → Bⁱ⁺¹ → 0`" (lines 1265–1266).
- `CategoryTheory.ShortComplex.ShortExact.torOneIsoKernel` (`TauCeti/CategoryTheory/Monoidal/Tor.lean`, line 66), which computes `Tor₁` from a projective presentation of length one.

I elaborated the Künneth theorem at the pin for chain complexes of `ℤ`-modules under these hypotheses. §5.2's tensor sequence is the case in which one factor is `M` in degree zero; the theorem puts no hypothesis on that factor, and the order of the `Tor` arguments differs only by the symmetry of `⊗`. Neither section, the supplier contracts nor the "Already in the library" list names any of these declarations.

The smallest change: cite them in §§5.2–5.3 and under the Tau Ceti contracts, and move the Künneth theorem from "This roadmap owns" to "Already in the library". The following stay here:
- the reindexing from bounded `ℤ`-indexed cochain complexes to `ℕ`-indexed chain complexes, with its tensor signs, as §5.2 already does for Hom/Ext ("the cochain form above is its reindexing");
- the comparison of `Tor'` with `Tor`;
- the `R`-linearity;
- the application to Khovanov homology.

SpectralSequencesAndConvergencePartII's citation of these sections still resolves after this change.

## R02 (P2) — §6.1 plans a Smith-normal-form certificate interface and certified row reduction, computational infrastructure rather than mathematics

Roadmaps state mathematics and leave executable procedures and certificates out. §6.1 instead asks to make the circle quotient, the enhanced-state differential and the maps of Layers 4 and 5 effective, and to build "a Smith-normal-form certificate interface" (lines 1606–1608). It goes on to "compute by certified row reduction" over a field and to prove that "the choice of certificate do not change the answer" (lines 1610–1612). §6.3 then routes its computations "from the actual diagrams and matrices of §6.1" (line 1646).

The smallest change is to state the mathematics §6.1 needs. In the enhanced-state basis of §3.3 the integral differentials are integer matrices. For a bounded complex of finite free `ℤ`-modules, `Hⁱ ≅ ℤ^(rank Cⁱ − rank dⁱ − rank dⁱ⁻¹) ⊕ ⨁ ℤ/eₖ`, where the `eₖ > 1` are the invariant factors of `dⁱ⁻¹` (Mathlib `Submodule.smithNormalForm`, `Mathlib/LinearAlgebra/FreeModule/PID.lean`, line 508). The quantum-degree-7 trefoil Check stays as it is, since it is exactly this computation. The words "effective" and "certificate interface", the certified row reduction and the independence of the certificate would go, and §6.3 would read "from the integral differentials of §6.1". The layer title "certified computations" would change with them.

## R03 (P2) — §5.11 plans K-flatness, K-projectivity and the augmentation quasi-isomorphism for the bounded free complexes, which the pins already prove

§5.11 asks to "construct the finite semi-free filtration … and prove K-flatness and K-projectivity from it" (lines 1563–1565). It also asks to "prove directly, by the finite filtration, that `P₁ ⊗_W C₂ → C₁ ⊗_W C₂` induced by an augmentation is a quasi-isomorphism" (lines 1568–1569). Each of these follows in one line from a declaration at the pins, and the text names none of them. It refers to "Mathlib's K-projectivity of bounded-above complexes of projectives" without naming the declaration.

The declarations are these:
- Mathlib's `CochainComplex.isKProjective_of_projective` (`Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean`, line 114): a bounded-above complex with projective terms is K-projective.
- Tau Ceti's `CochainComplex.isKFlat_of_bounded_flat` (`TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean`, line 352): a bounded complex with flat terms is K-flat.
- Tau Ceti's `CochainComplex.quasiIso_id_tensorHom` (same file, line 222): tensoring with a K-flat complex preserves quasi-isomorphisms.

I elaborated the last two at the pin for cochain complexes of `ModuleCat (DualNumber R)`. The augmentation statement is therefore `quasiIso_id_tensorHom` applied to the K-flat `C₂`, with `TauCeti.koszulSymmetricCategory` for the other variable. DerivedModuleAlgebra §0.2's law for bounded-above flat complexes, which this README already consumes, then identifies the ordinary tensor product with the derived one.

The smallest change: cite these three declarations in §5.11 and the contracts in place of the two "prove" clauses. Keep the semi-free filtration only for the comparison with DGAInfinity Layer 5's semi-free modules.

## Deferred findings

- D01 — stands

## C01 — The note on Khovanov's Proposition 28 in §5.5 corrects only the quantum shift, but his equations (45) and (134) reverse the sign of both shifts as well

A reader who applies the stated fix ("whose printed quantum shift `2l` should read `6l`", line 1360) gets `H^{i+2l, j+6l}(L)`, which the cited equations do not give. Khovanov's `[n]` has `N[n]ⁱ = Nⁱ⁺ⁿ` (Kho99 line 392), and his `{n}` lowers degrees by `n` (Kho99 lines 237–238). His equation (45) is `C(D) = C̄(D)[x]{2x − y}` (Kho99 line 697), and his equation (134) is `x(D₀) = x(D) − 2l`, `y(D₀) = y(D) + 2l` (Kho99 line 1303). Together they give `C(D₀) = C(D)[−2l]{−6l}`, hence `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`. The printed statement is `H^{i+2l, j+2l}(L)` (Kho99 line 1596). The README's own regrading, minus `(2l, 6l)` in its conventions, is unaffected and matches the Hopf-link Check. Would write: "(Khovanov, §7.2, Proposition 28; by his equations (45) and (134) its printed shift should read `H^{i−2l, j−6l}(L)` in his conventions)".

## N01 — Three anchors of the former headings are still linked from other roadmaps

Foams on main links `#k2-the-rank-two-frobenius-object-and-circle-tensors` (line 2887) and `#k3-signed-cubes-complexes-and-euler-characteristic` (line 2723). Foams (line 2888) and DiagrammaticCoherence (line 49) link `#g-plane-geometry-relative-extension-and-smooth-link-comparison`. These links now land at the top of the README. An HTML anchor with each old id, placed just before the headings of Layers 2, 3 and 8, would keep them pointing at the right layer, alongside the numbering sentence at line 70.

## N02 — The *Needs:* lines of §1.7 and §1.8 cite each other

§1.7 needs "§1.8 for the gluing comparison" (line 344), and §1.8 needs §§1.5–1.7 (line 360). Moving the one sentence about the gluing comparison (line 339) into §1.8 would remove the loop.

## Earlier findings

- R01 — repaired: §5.11 now takes "the bifunctor of DerivedModuleAlgebra §0.2, with its laws" (line 1566). The section has a contract (lines 2285–2290), and DerivedModuleAlgebra is no longer listed as a downstream consumer.
- R02 — not repaired: deferred (D01)
- C01 — repaired: "whose printed quantum shift `2l` should read `6l`" (line 1360). C01 of this report adds the sign.
- C02 — repaired: Convention 3 now gives Khovanov's `[n]` as the native shift by `n` and Bar-Natan's `[s]` as the native shift by `−s` (lines 108–114).
- C03 — repaired: "in the direction of the least index `⊥` is the totalization shifted by `⟦1⟧`" (lines 612–615).
- C04 — repaired: "sections K1, …, K7 are now Layers 1, …, 7, and section G is now Layer 8" (lines 70–71).
- C05 — repaired: §7.1 describes `TauCeti.KnotCobordism` and states the comparison (lines 1785–1792), with a contract entry (line 2257).
- C06 — repaired: §5.6 derives `E(D) = 2^c` from GeometricTopology §4.5 (lines 1397–1404), and the scope section and contracts follow (lines 2106–2109 and 2266–2268).
- C07 — repaired: the description says the file "imports `Mathlib` and six Tau Ceti modules".
- N01 — repaired: lines 113–126 of `Suggested.lean` are now within 100 characters.

## Questions for the author

- In §8.3 (lines 924–927), "with the first slot `0` west and the second slot `1` west": which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are meant? The pinned clasp joins slots `0, 1, 2, 3` of the second new crossing to slots `3, 2, 1, 0` of the first. Nothing at the pin carries a plane frame, so I could not check the clockwise and counterclockwise conclusions.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 circles of a state | trefoil `σ₁³`; kink | circles 2, 1, 2, 3 by `#B`; directed cycles 4, 6; kink 2 and 1 / `card_resolvedCircle` equals loop count | holds | none |
| §1.3 components and words | `σ₁³`, `σ₁²`; first move on a circle | strand permutations `(12)`, `id`: 1 and 2 orbits; crossing-free count 1 → 0 / `card_component` | holds | none |
| §1.4 marks | kink, mark on the loop arc | selects the cut-off circle in the 2-circle state, the only circle in the other / `Mark.resolvedCircle` | consistent | none |
| §1.5 adjacent states | nonplanar `0–2, 1–3`; trefoil | `V−E+F = 1−2+1 = 0`, one circle in both states; `#B+#circles` = 2, 2, 4, 6 | holds | none |
| §2.4 merge and split | basis of `V`, `V⊗V` | `X⊗X ↦ 0`, `1⊗X ↦ X`, `Δ1 = 1⊗X+X⊗1`, `mΔ(1) = 2X` / Split.lean basis formulas | holds | none |
| §2.6 formal Euler characteristic | tetrahedron; stellar move; flip; disc; pants | `4−6+4 = 2`; net `+1−3+2 = 0`; flip `0`; `1`; `−1` | holds | none |
| §3.3 enhanced-state model | trefoil | 30 generators `4+6+12+8`; my quantum-graded matrices give the §6.3 homology | holds | none |
| §3.5 χ and Jones | trefoil; Hopf; `T ↦ q` | `(q+q⁻¹)(q²+q⁶−q⁸) = q+q³+q⁵−q⁹`; Hopf `1+q²+q⁴+q⁶`; `T ↦ q` negates / Kho99 eq. (25), Props 9, 27 | holds | none |
| §4.6 smooth links | search of pinned Tau Ceti | no realization of PD-codes as smooth links / docstring names it as not statable | holds | none |
| §5.2 coefficients | trefoil over `𝔽₂` | `(0,1),(0,3),(2,5),(2,7),(3,7),(3,9)`; with `Tor(Hⁱ⁻¹)` the class moves to `(4,7)` | holds | R01 |
| §5.3 Künneth | two trefoils; two unknots | `Tor₁(ℤ/2,ℤ/2)` at `(5,14)`; ranks 1, 2, 1 / pinned Künneth sequence elaborated over `ℤ` | duplicated | R01 |
| §5.7 action at a mark | `V` | `X`: degree `1 → −1`; `X² = 0`; `Δ(Xa) = (X⊗1)Δa`; `m(Xa⊗b) = X·m(a⊗b)` | holds | none |
| §5.11 connected sum | two unknots; K-flatness | `(W⟨1⟩⊗_W W⟨1⟩)⟨−1⟩ = W⟨1⟩`; without the shift, degrees `2, 0` / K-flat lemmas elaborated over `DualNumber R` | duplicated | R03 |
| §6.1 certificates | trefoil, `j = 7` | ranks 0, 3, 3 in degrees 1–3; Smith `diag(1,1,2)`; `𝔽₂` rank 2 / calculator: `ℤ/2` at `(3,7)` | Check true | R02 |
| §7.3 affine chart | inverse; south pole; orientation | `‖2y‖²+(‖y‖²−1)² = (1+‖y‖²)²`; derivative `½·id`; `det(−e₃,e₀,e₁,e₂) = +1` | holds | none |
| §7.4 local events | birth beside a first move; Euler count | disjoint discs, maps commute; `1 + (−1) = 0` / Jac02 §4.2: distant critical points interchange | consistent | none |
| `nonempty_homotopyEquiv_…` | `D = D'`; zero ring; kink against unknot | trivial; zero; ranks `(4,2)` = `2 + Cone(id)(2,2)`; calculator: kink `(0,±1)` | true | none |
| `nonempty_khovanovHomology_mirror_iso_dual` | trefoil over `𝔽₂` | left set `(0,−1),(0,−3),(−2,−5),(−2,−7),(−3,−7),(−3,−9)` is the right set negated | true | none |
| `eval₂_one_enhancedStateSum` | trefoil, Hopf, empty, nonplanar | `2`, `4`, `1`; nonplanar `2−2 = 0 ≠ 4`; at `q = −1`: `−2 = −2·V(1)`, `4 = −2·(−2)` | true | none |
| `khovanovHomology_closure_replicate` | `m = 2, …, 7` | calculator equals the table for every `m`; `m = 7` torsion `(3,11),(5,15),(7,19)`; Kho99 Prop 35 mirrored | true | none |
| `le_of_isAdequate_of_reidemeisterEquiv` | `n = 0`; trefoil; figure-eight; kink | vacuous; support `[0,3]`; figure-eight `[−2,2]`, torsion `(−1,−3),(2,3)`; kink not adequate | true | none |
| functoriality (not statable) | torus, sphere | `ε∘m∘Δ∘η = 2`; `ε(1) = 0`; quantum degree `χ` / Jac02 Thm 2: `j + χ(Σ)` | holds | none |
| reduced theory (not statable) | trefoil; unknot | reduced `(0,2),(2,6),(3,8)`, `χ = q²+q⁶−q⁸`; unknot `(0,0)` | holds | none |
| §5.5 reversal | Hopf, `l = 1` | positive minus `(2,6)` = negative Hopf (calculator) / Kho99 (45), (134): `H^{i−2l, j−6l}` | README right | C01 |
| §1.7 and §1.8 | *Needs:* lines | §1.7 needs §1.8; §1.8 needs §§1.5–1.7 | loop | N02 |
| §7.1 link cobordisms | GeometricTopology revision #1797 §6.5 | `∂Σ = −L₀ ⊔ L₁` here / `L₀×{0} ∪ −L₁×{1}` there, relation stated | two carriers | D01 |

- Source locators checked against the text: 25. Kho99: §§2.1, 3.1, eqs. (45) and (134), Theorems 1–2, Propositions 9, 27, 28, 30, 32, 35, 36, 37, Corollaries 11 and 13, Definitions 3–5. Bar02: Definitions 3.2–3.3. Bar04: §4.1, Theorem 1, Proposition 7.2, Theorem 4. Jac02: §3.2, Theorem 2, the Carter–Saito reformulation. Kho02: §3.
- Declarations opened at the pins. Tau Ceti: `enhancedStateSum` and its Jones and power theorems (EnhancedState.lean 199–273), `PDCode.componentCount`, `circlesAt` and its card lemmas, the planar merge/split and parity lemmas, `card_resolvedCircle`, `card_component`, `even_seifertCircleCount_…`, `KnotCobordism` (Cobordism.lean 149), `cubeComplexMappingConeIso` (373), the K-flat lemmas (KFlat/Basic.lean 222, 352, 361), the Künneth file (729, 793), `torOneIsoKernel`, the PID cycle instances, `extToHomology`, `BraidWord.closure`. Mathlib: `isKProjective_of_projective`, `Tor'`, `Submodule.smithNormalForm`, `Module.Flat.iff_preservesFiniteLimits_tensorLeft`.
- Cross-roadmap citations resolved. On main: GeometricTopology §§1.1, 1.3, 1.5, 4.2, 4.2.3, 4.5, 4.8.1 and Layer 6; DifferentialGeometry Layer 2, items 3.2, 3.3, 3.5 and Layer 5; ConformalMapping Layer 5; AlgebraicTopology 4.3 and 7.1; DGAInfinity Layers 1 and 5; DerivedModuleAlgebra §0.2; ZigzagPreprojective Layer 8. At open heads: GeometricTopology #1797 §6.5, Foams and DiagrammaticCoherence #2578, CombinatorialHeegaardFloer #2545. All exist.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: five `sorry` warnings and nothing else. `#check @` of all eight declarations matches the README statements, with no binder lost and no change needed.
- One-tactic probes (`omega`, `simp_all`, `simp`, `rfl`) fail on the headlines, and `exact?` finds only the declarations themselves, so none of them is padding. Sanity examples elaborate: `(3,7)` torsion at `m = 3`, `(2,4)` free at `m = 2`, `(4,10)` free at `m = 4`, `(5,13)` torsion at `m = 5`.
- I wrote an independent integral Khovanov calculator for braid closures (cube with signs, Smith normal form over `ℤ`). It reproduces `T(2,2), …, T(2,7)`, the figure-eight, both trefoils, both Hopf links and the kink exactly as the README states them.

Overlap check: read GeometricTopology (main, #1797, #1791), Foams and DiagrammaticCoherence (main, #2578), CombinatorialHeegaardFloer (#2545), DerivedModuleAlgebra and SpectralSequencesAndConvergencePartII (main), and HopfologicalAlgebra (main). The shared objects and their owners are:
- the derived tensor product over `W`: DerivedModuleAlgebra §0.2, cited;
- link cobordisms: §7.1 here and GeometricTopology #1797 §6.5 (D01);
- `V_L(1)`: GeometricTopology §4.5, cited;
- adequacy: GeometricTopology §4.8.1 for knots and §6.5 here for links, distinguished in the scope section;
- the Künneth sequence: the pinned Tau Ceti (R01);
- the planar calculus, formal surfaces and Layer 8: owned here and consumed by Foams, DiagrammaticCoherence and CombinatorialHeegaardFloer;
- the Khovanov–Seidel braid actions: ZigzagPreprojective Layer 8.

HopfologicalAlgebra shares nothing with this roadmap.

Source independence: 15 passages compared with 5 sources (Kho99, Bar02, Bar04, Jac02, Kho02), and nothing is shared beyond forced formulas and standard names (the `4Tu` equation, "height shift", "movie moves"). The largest share is Kho99, 14 of about 30 locators. Contents compared with Kho99 (§§2–7): independent. Layers 1, 7 and 8 have no counterpart there, Layer 2 joins Kho99 §2.2 with Bar04 §4.1, and Layer 5 mixes Kho99 §§6.1 and 7.2–7.4 with Kho02 §3. The order 2 → 3 → 4 → 5 → 6 is the one the *Needs:* lines force.

Research link: the invariance and cobordism targets (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) underlie Rasmussen's invariant (Rasmussen 2010). GeometricTopology on main uses that invariant, built on this roadmap, for Piccirillo's 2020 proof that the Conway knot is not slice. This rests on the README's references and on the GeometricTopology README on main, line 6526.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 (§8.6): these are books outside the sample, and I did not open them.
- Roseman, Carter–Saito 1993 and Carter–Rieger–Saito (§7.5): paywalled papers outside the sample, which I did not open.
- The frame dictionary of §8.3: the pin has no plane data to check it against (see the question above).

## Source issues

- **Error** in Kho99 at Proposition 22 (eq. 135, p. 35) and Proposition 28 (eq. 155, p. 41): the source says reversing one component shifts the bidegrees by `(2l, 2l)`; it should be `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`, as its own equations (45) and (134) give; affects a stated result.
- **Misprint** in Kho99 at Proposition 37, proof, p. 46: the source says the chain groups of a minimal diagram vanish above `hl(L)`; it should be above `c(L)`, the number of crossings, which yields `hl(L) ≤ c(L)`; affects the proof.

## For the human reviewers

- none
