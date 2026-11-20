# Review of KhovanovHomology (pull request #2600 at e66cf27)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. This head repairs all three findings of the previous review: the Künneth and PID-cycle planning in §§5.2–5.3, the certificate interface in §6.1 and the K-flatness proofs in §5.11. Every Check, worked example and `Suggested.lean` headline recomputes, including `T(2, m)` for `m = 2, …, 8` against the Lean bidegree sets. Three small corrections remain, none of them blocking:
- the Check of §5.9 fails in characteristic two;
- §6.5 defines adequacy again instead of citing GeometricTopology §4.8.1;
- the overview's Euler-characteristic headline omits "nonempty".

There are no format notes, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands
- D02 — stands

## C01 — The Check of §5.9 that `X_p − X_q` is not a saddle composite holds over `ℤ` but fails in characteristic two

The roadmap admits every commutative coefficient ring, so a reader working over `𝔽₂` finds the last sentence of the Check false: "`X_p − X_q` is not of this form: on `1 ⊗ 1` it is `X ⊗ 1 − 1 ⊗ X`, which `Δm` never produces" (lines 1541–1542).

Over `ℤ` the image of `Δm` on `V ⊗ V` is spanned by `1 ⊗ X + X ⊗ 1` and `X ⊗ X`, and `X ⊗ 1 − 1 ⊗ X` is not in it. Over `𝔽₂`, however, `X ⊗ 1 − 1 ⊗ X = Δm(1 ⊗ 1)`, and the operators `X_p − X_q` and `X_p + X_q` coincide. The fix is to add "over `ℤ` (in characteristic two the two operators coincide)" to the Check.

## C02 — §6.5 defines adequacy again, although GeometricTopology §4.8.1 on main already defines it for link diagrams

§6.5 opens with "Define adequacy by the extreme resolutions" (line 1757). A reader is not told there that the notion belongs to GeometricTopology. Its §4.8.1 on main (lines 4718–4729) calls a nonempty link diagram adequate when the state graphs of the all-`A` and all-`B` states are loopless, where crossing `i` joins the circles of slots `0` and `2`. That is exactly `IsAdequate`, by `TauCeti.PDCode.card_circlesAt_eq_two_iff` (`TauCeti/KnotTheory/PDCode/ResolvedCircle/Adjacent.lean`, line 135).

The scope section already says that the two conditions agree (lines 2163–2165). §6.5's text, its *Needs:* line and the GeometricTopology contract (lines 2329–2332) do not say it. The fix has three parts:
- in §6.5, say that adequacy is GeometricTopology §4.8.1's;
- say that `IsAdequate` is its statement through `TauCeti.PDCode.circlesAt`, equivalent by that lemma;
- add GeometricTopology §4.8.1 to §6.5's *Needs:* line and to the contract.

`IsAdequate` stays in `Suggested.lean`, since the headline needs a definition at the pins.

## C03 — The overview's Euler-characteristic headline omits the hypothesis that the diagram is nonempty

The overview says the graded Euler characteristic "is `(q + q⁻¹)` times the Jones polynomial at `t^(1/2) = −q`" (lines 20–21), with no restriction on the diagram. With the Jones polynomial this roadmap uses, the statement fails for the empty diagram:
- `TauCeti.OrientedPDCode.jonesPolynomial` of the empty code is `1`: it has one state, and the truncated loop exponent is `0 − 1 = 0`;
- so the right side is `q + q⁻¹`, while the empty diagram has `χ = 1` (line 739).

§3.5 states the hypothesis (line 729). The fix is to add "for a nonempty diagram" to the overview's sentence.

## Earlier findings

- R01 — repaired. §5.2 now says the sequences "are Tau Ceti's theorems for chain complexes, reindexed" (line 1259) and cites the PID cycle lemmas, the Künneth sequence and `torOneIsoKernel` (lines 1270–1285). §5.3 cites `HomologicalComplex.homologyKunnethShortComplex_shortExact` (line 1330), and the scope section lists these under "Already in the library" (lines 2140–2144).
- R02 — repaired. §6.1 is now "Integral differentials and the Smith normal form" (lines 1642–1654) and states `Hⁱ(C) ≅ ℤ^(rank Cⁱ − rank dⁱ − rank dⁱ⁻¹) ⊕ ⨁ₖ ℤ/eₖ` through `Submodule.smithNormalForm`. §6.3 reads "Prove these from the integral differentials of §6.1" (line 1688), and no certificate wording remains.
- R03 — repaired. §5.11 cites `CochainComplex.isKProjective_of_projective`, `CochainComplex.isKFlat_of_bounded_flat` and `CochainComplex.quasiIso_id_tensorHom` (lines 1594–1602). The semi-free filtration is kept only for the DGAInfinity comparison (lines 1605–1608).
- C01 — repaired: "its printed `H^{i+2l, j+2l}(L)` should read `H^{i−2l, j−6l}(L)` in his conventions" (lines 1392–1393).
- N01 — not repaired: deferred (D02)
- N02 — repaired. §1.7's *Needs:* line is "§§1.5–1.6" (line 343), and the gluing comparison now sits in §1.8 (lines 354–356).

## Questions for the author

- In §8.3 (lines 925–928), which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are meant by "with the first slot `0` west and the second slot `1` west"? The pinned clasp joins slots `0, 1, 2, 3` of the second new crossing to slots `3, 2, 1, 0` of the first. Nothing at the pin carries a plane frame, so I could not check the clockwise and counterclockwise conclusions.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 adjacent states | nonplanar code `0–2, 1–3`; trefoil `σ₁³` | `V−E+F = 1−2+1 = 0`, one circle in both states; `#B+#circles` = 2, 2, 4, 6 / Adjacent.lean 135, 325; Planar.lean 368 | holds | none |
| §1.7 vertex resolution | positive kink at its crossing | `D₀` two circles, `D₁` one; the *Needs:* loop with §1.8 is gone (line 343) / `IsPlanar.resolveCrossing` at pin | holds | none |
| §2.3 circle tensors | three circles; X-count grading | `(q+q⁻¹)³ = q³+3q+3q⁻¹+q⁻³`; wrong grading gives `1+3q+3q²+q³`, not `q ↦ q⁻¹` symmetric | holds | none |
| §2.4 merge and split | bases of `V`, `V⊗V` | `X⊗X ↦ 0`, `1⊗X ↦ X`, `Δ1 = 1⊗X+X⊗1`, `mΔ1 = 2X` / BarNatan05 lines 1268–1275, `v₊ = 1` | holds | none |
| §§2.5–2.7 formal surfaces | tetrahedron; stellar move; pants; strips at `r = 2` | `4−6+4 = 2`; net `+1−3+2`; pants `χ = −1`, degree `−1`; strips `2−2 = 0`; disc `1−2 = −1` | holds | none |
| §3.1 signed cube | identity square; face `A = {2}`, `B = {1}` | `(1,1)` then `(−1,1)`, composite 0; shifted `−1`, whole `+1`, vertex sign `−1`; ratio `(−1)^#{a∈A : a>b₀}` | holds | none |
| §3.4 finiteness | trefoil; kink | support `[0,3] = [−n₋, n₊]`; kink homology only in degree 0 of `[0,1]` / Kho99 line 698 | holds | none |
| §3.5 χ and Jones | trefoil; Hopf; `T ↦ q` | `(q+q⁻¹)(q²+q⁶−q⁸) = q+q³+q⁵−q⁹` = calculator; Hopf `1+q²+q⁴+q⁶`; `T ↦ q` negates / Kho99 (25), Props 9, 27 | holds | none |
| §8.2 orientation | unit square; reversal; subdivision | shoelace `0+1+1+0 = 2`; `−2`; `½+½` replaces `1` / ConformalMapping §5.3 on main | holds | none |
| §5.1 skein | positive kink | `a₀=0, b₀=1, a₁=−1, b₁=2`; faces `(0,−1),(0,1),(0,3)` and `(1,1),(1,3)`; merge onto; leaves `(0,±1)` | holds | none |
| §5.2 coefficients | trefoil over `𝔽₂`; Hom differential | calculator `(0,1),(0,3),(2,5),(2,7),(3,7),(3,9)`; Mathlib `δ` (HomComplex.lean 407) gives `(−1)^(i+1) f d_C` | holds | none |
| §5.11 connected sum | two unknots; K-flat names | `W⟨1⟩⊗_W W⟨1⟩ = W⟨2⟩`, `⟨−1⟩` gives `V` / KFlat/Basic.lean 352, KProjective.lean 114; DerivedModuleAlgebra §0.2 laws | holds | none |
| §7.5 movie theorem | Jacobsson04 §§3.2, 4.2; BarNatan05 §8.3 | variants of moves 6, 15, 7 (lines 354–361); reformulated Carter–Saito (937–940); MM10 quadruple point (BN 1490–1502) | supported | none |
| §7.6 movie Euler count | sphere, pants, torus | `1−0+1 = 2`, `0−1+0 = −1`, `1−2+1 = 0`; saddles counted positively give `4` / AlgebraicTopology §§4.3, 7.1 | holds | none |
| §7.9 closed surfaces | sphere, torus | `ε∘η = ε(1) = 0`; `ε∘m∘Δ∘η = 2`; a map of quantum degree `χ ≠ 0` on `R` at `(0,0)` vanishes | holds | none |
| `nonempty_homotopyEquiv_…` | `D = D'`; zero ring; kink vs unknot; `σ₁σ₁⁻¹` vs unlink | trivial; zero; ranks `(4,2) = (2,0)+(2,2)`; both `(0,−2),(0,0)²,(0,2)`; probes fail | true | none |
| `nonempty_khovanovHomology_mirror_iso_dual` | trefoils over `𝔽₂`, `𝔽₃` | left-handed `𝔽₂` set is the right-handed set negated; `𝔽₃` gives `(0,1),(0,3),(2,5),(3,9)` and negatives | true | none |
| `eval₂_one_enhancedStateSum` | trefoil, Hopf, unlink, empty, figure-eight, nonplanar | `2, 4, 4, 1, 2`; nonplanar one-crossing code `2−2 = 0 ≠ 4`, so planarity is needed | true | none |
| `khovanovHomology_closure_replicate` | `m = 2, …, 8`; `m = 0` | calculator = Lean sets = table for each `m ≥ 2`; free and torsion sets disjoint; `m = 0` differs, excluded by `2 ≤ m` | true | none |
| `le_of_isAdequate_of_reidemeisterEquiv` | `n = 0`; trefoil; figure-eight; kink | vacuous; support `[0,3]`; `[−2,2]`, torsion `(−1,−3),(2,3)`; kink only A-adequate | true | none |
| headlines named as not statable | smooth invariance, functoriality, reduced theory | no realization, no movie category, no `X` action at pins; reduced trefoil `(0,2),(2,6),(3,8)` by calculator | named | none |
| §5.9 Check | `V⊗V` over `ℤ` and `𝔽₂` | over `ℤ` the image of `Δm` misses `X⊗1−1⊗X`; over `𝔽₂` it equals `Δm(1⊗1)` | false in characteristic 2 | C01 |
| §6.5 adequacy | GeometricTopology §4.8.1, main lines 4726–4729 | loopless state graph ⇔ slots `0, 2` on different circles ⇔ `#circlesAt = 2` | same notion | C02 |
| overview χ | empty diagram | `χ = 1`; native Jones of the empty code `1`, so `(q+q⁻¹)·1 ≠ 1`; §3.5 says nonempty | hypothesis missing | C03 |
| §5.5 reversal | Hopf, `l = 1` | positive `(0,0),(0,2),(2,4),(2,6)` minus `(2,6)` = negative Hopf (calculator) / Kho99 (45), (134) | holds | none |
| §6.1 Smith form | trefoil, `j = 7` | matrix `[[0,−1,1],[1,−1,0],[1,0,1]]`, Smith form `diag(1,1,2)`, `𝔽₂` rank 2; ranks `0,3,3` | holds | none |
| §5.3 Künneth | two right-handed trefoils | `(5,14)` is `ℤ² ⊕ ℤ/2`, the `ℤ/2` from `Tor₁(ℤ/2,ℤ/2)` / calculator on `σ₁³σ₃³` | holds | none |
| §6.4 Checks | `T(2,4)` | `(0,2),(0,4),(2,6),(3,10),(4,10),(4,12)`, `ℤ/2` at `(3,8)`; `χ = q²+q⁴+q⁶+q¹²` | holds | none |
| §7.1 vs GeometricTopology #1797 §6.5 | boundary conventions | `∂Σ = −L₀ ⊔ L₁` here / `L₀×{0} ∪ −L₁×{1}` there, related by `Σ ↦ −Σ` | two carriers | D01 |

- **Source locators checked against the text: 33.**
  - Kho99: §§2.1, 2.2 and 3.1; eqs. (25), (45) and (134); Theorems 1–2; Propositions 9, 22, 26–28, 30, 32, 33 and 35–37; Corollaries 11–13; Definitions 3–5.
  - BarNatan05: §4.1, Theorems 1, 2 and 4, Proposition 7.2, §8.3 and §9.1.
  - Bar02: Definitions 3.2–3.3.
  - Jacobsson04: Definition 5, §3.2, Theorem 2, the Carter–Saito reformulation and move 7.
  - KhovanovPatterns: §3.
- **Library declarations opened at the pins.**
  - Tau Ceti, knot theory: `IsReidemeisterMove` and `ReidemeisterEquiv` (Equivalence.lean 95–131); `rotateCrossing` (RotateCrossing.lean 66); `circlesAt` (Adjacent.lean 90, 135, 325); `componentCount` (Components.lean 164); `closure` and `crossingSign_closure` (BraidWord/PDCode.lean 390, 564); the five planarity iff lemmas; `KnotCobordism` (Cobordism.lean 149).
  - Tau Ceti, Khovanov: `enhancedStateSum` (EnhancedState.lean 199–274); `enhancedQuantumDegree_mod_two` (Parity.lean 57); the `khovanovEulerChar` theorems (EulerCharacteristic.lean 123–172).
  - Tau Ceti, homological algebra and analysis: the Künneth file (Sequence.lean 14–70, 729–793); `isKFlat_of_bounded_flat` (KFlat/Basic.lean 352); `interior_image_criticalPoints_eq_empty` (OutermostStratum.lean 389).
  - Mathlib: `isKProjective_of_projective` (KProjective.lean 114); `δ` and `linearHomComplex` (HomComplex.lean 407, 980); `Submodule.smithNormalForm` (FreeModule/PID.lean 508).
- **Cross-roadmap citations resolved.**
  - On main: GeometricTopology §§1.1, 1.3, 1.5, 4.2, 4.2.3, 4.5 and 4.8.1 and Layer 6; DifferentialGeometry Layers 2 and 5 and items 3.2, 3.3 and 3.5; ConformalMapping Layer 5; AlgebraicTopology §§4.3 and 7.1; DGAInfinity Layers 1 and 5; DerivedModuleAlgebra §0.2; ZigzagPreprojective Layer 8.
  - At open heads: GeometricTopology #1797 §6.5 and CombinatorialHeegaardFloer #2545.
  - All of these exist. The K1–K7 and G citations by other roadmaps follow the numbering sentence of lines 71–72.
- **Automatic checks:** all passed. The dependency check output is `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of all eight declarations matches the README statements: no binder is lost, `m - 2` elaborates in `ℤ`, and nothing needs to change.
- **One-tactic probes.** `rfl`, `simp`, `infer_instance`, `omega`, `trivial`, `decide` and `aesop` fail on all five theorems. Three sanity examples elaborate: at `m = 3`, `(0,1)` is free, and `(3,7)` is torsion and not free.
- **Independent calculator.** An integral calculator for braid closures (Bar-Natan conventions, Smith normal form over `ℤ`, ranks mod `p`) reproduces every Check and example value. It covered the trefoils, the Hopf links, the kinks, `σ₁σ₁⁻¹`, the unlinks, the figure-eight, `T(2, m)` for `m ≤ 8`, the reduced trefoil, `𝔽₂` and `𝔽₃` homology, and two trefoils.
- **The pull request's description** agrees with the head: 62 numbered sections, 53 Checks in 40 sections, a *Needs:* line in every section, six Tau Ceti imports, ten sorry'd definitions in the old file, and DerivedModuleAlgebra as the only supplier added.

Overlap check: read GeometricTopology (main, #1797, #1791), Foams and DiagrammaticCoherence (main, #2578) and CombinatorialHeegaardFloer (#2545). The objects shared with this roadmap, and their owners:
- link cobordisms: §7.1 here and GeometricTopology #1797 §6.5 (D01);
- adequacy: GeometricTopology §4.8.1, restated here in §6.5 (C02);
- `V_L(1)`: GeometricTopology §4.5, cited;
- the derived tensor product over `W`: DerivedModuleAlgebra §0.2, cited;
- the planar calculus, the formal surfaces and Layer 8: owned here, and consumed by Foams and DiagrammaticCoherence;
- the movie presentation: owned here (Layer 7), and consumed by CombinatorialHeegaardFloer.

Source independence: 40 passages compared with 5 sources (Kho99, BarNatan05, Bar02, Jacobsson04, KhovanovPatterns), none shared beyond forced formulas and standard names (`C₁₂ + C₃₄ = C₁₃ + C₂₄`, "moves 6 and 15"); largest share Kho99, about 20 of 38 locators; contents compared with Kho99 (§§2–8): independent, since Layers 1 and 8 have no counterpart, Layer 2 joins Kho99 §2.2 with BarNatan05 §4.1, Layer 5 mixes Kho99 §§6.1 and 7.2–7.4 with KhovanovPatterns §3, and the order 2 → 3 → 4 → 5 → 6 is forced by the *Needs:* lines.

Research link: the invariance and functoriality targets (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) underlie the Rasmussen invariant. GeometricTopology on main consumes that invariant, built on this roadmap, for Piccirillo's 2020 theorem that the Conway knot is not slice. This rests on the README's references and on GeometricTopology's README on main, lines 6520–6526.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 (§8.6): these are books outside the sample and the manifest, and I did not open them.
- Carter–Saito 1993, Roseman, and Carter–Rieger–Saito (§7.5): these are paywalled journal articles outside the manifest. §7.5's use of Carter–Saito was checked only through Jacobsson's reformulation.
- The clasp frame of §8.3: the pin has no plane data to check it against (see the question above).

## Source issues

- **Error** in Kho99 at Proposition 22 (eq. 135, p. 35) and Proposition 28 (eq. 155, p. 41): the source says reversing one component shifts the degrees by `(+2l, +2l)`; it should be `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`, as its equations (45) and (134) give; affects a stated result.
- **Misprint** in Kho99 at Proposition 37, proof, p. 46: the source says the chain groups of a minimal diagram vanish above `hl(L)`; it should say above `c(L)`, its number of crossings; affects the proof.

## For the human reviewers

- none
