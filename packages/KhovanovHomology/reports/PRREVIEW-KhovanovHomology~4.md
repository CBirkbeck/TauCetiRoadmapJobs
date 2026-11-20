# Review of KhovanovHomology (pull request #2600 at e66cf27)

**Verdict:** accepted

**Summary.** The verdict is accepted, with no findings. The head is the one the previous review read, and an independent recomputation of every Check, sign convention and `Suggested.lean` headline, with the sampled source locators and the pinned declarations opened again, found nothing false in a stated result. Three small corrections remain, none blocking: the Check of §5.9 fails in characteristic two, §6.5 defines adequacy without citing GeometricTopology §4.8.1, and the overview's Euler-characteristic headline omits "nonempty". There are no format notes, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands
- D02 — stands

## C01 — The Check of §5.9 that `X_p − X_q` is not a saddle composite is true over `ℤ` and false when `2 = 0`

The roadmap takes coefficients in every commutative ring and the Check names none, so a reader over `𝔽₂` meets a false sentence: "`X_p − X_q` is not of this form: on `1 ⊗ 1` it is `X ⊗ 1 − 1 ⊗ X`, which `Δm` never produces" (lines 1541–1542).

The image of `Δm` on `V ⊗ V` is spanned by `1 ⊗ X + X ⊗ 1` and `X ⊗ X`. Writing `X ⊗ 1 − 1 ⊗ X = a(1 ⊗ X + X ⊗ 1) + b·X ⊗ X` forces `a = 1` and `a = −1`, so the element lies in the image exactly when `2 = 0` in `R`; then it equals `Δm(1 ⊗ 1)` and the two operators `X_p ± X_q` coincide. Adding "over `ℤ` (when `2 = 0` the two operators coincide)" makes the Check true as written.

## C02 — §6.5 defines adequacy without saying that the notion is GeometricTopology §4.8.1's

§6.5 opens "Define adequacy by the extreme resolutions" (line 1757), and neither its *Needs:* line (lines 1780–1781) nor the GeometricTopology contract (lines 2329–2332) names §4.8.1, so an implementer reading the section does not learn that the definition already has an owner. GeometricTopology §4.8.1 on main (lines 4726–4729) calls a diagram adequate when the state graphs of the all-`A` and all-`B` states are loopless, crossing `i` joining the circles of slots `0` and `2`; by `TauCeti.PDCode.card_circlesAt_eq_two_iff` (`TauCeti/KnotTheory/PDCode/ResolvedCircle/Adjacent.lean`, line 135) that is `IsAdequate`.

The scope section already says the two conditions agree (lines 2160–2165). The smallest change is one clause in §6.5 saying that adequacy is GeometricTopology §4.8.1's and that `IsAdequate` states it through `TauCeti.PDCode.circlesAt`, with §4.8.1 added to the *Needs:* line and to the contract. `IsAdequate` stays in `Suggested.lean`: the headline needs a definition at the pins, and GeometricTopology's own crossing-minimality statement is for knots, while this one is for links.

## C03 — The overview's Euler-characteristic headline omits the hypothesis that the diagram is nonempty

The overview says the graded Euler characteristic "is `(q + q⁻¹)` times the Jones polynomial at `t^(1/2) = −q`" (lines 20–21) with no restriction, while the same roadmap treats the empty diagram as a diagram throughout. For the empty code the left side is `1` (line 739), and the Jones polynomial this roadmap uses is `1` there as well: `TauCeti.OrientedPDCode.jonesPolynomial_def` (`TauCeti/KnotTheory/PDCode/Jones/Basic.lean`, line 114) has one state with loop exponent `0 − 1 = 0` in `ℕ`. So the right side is `q + q⁻¹ ≠ 1`.

§3.5 states the hypothesis (line 729), and the pinned theorem carries it as `0 < componentCount`. Adding "for a nonempty diagram" to the overview's sentence makes it the statement the layer makes.

## Questions for the author

- In §8.3 (lines 925–928), which half-edges of `TauCeti.OrientedPDCode.insertCircleClasp` are "the first slot `0` west and the second slot `1` west"? The conclusions are consistent with each other (upper arc traversed eastward gives a clockwise small lune and a counterclockwise enclosing circle), but the pinned constructor (`TauCeti/KnotTheory/PDCode/Oriented/Reidemeister/Two/Basic.lean`, line 35) carries no plane frame, so the dictionary to its orientation bit `o` could not be checked.

## Earlier findings

The previous review read this same head and raised no finding. Its three small corrections are unchanged in the text and are restated above as C01, C02 and C03; its one question is repeated above.

- N01 (of the review before it) — not repaired: deferred (D02)

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 circles | trefoil `σ₁³`; kink | circles `2, 1, 2, 3` by `#B`; kink loop: two half-edges, both fixed by the state permutation, one circle | holds | none |
| §1.2 transport (sample) | mirror of trefoil | `SmoothingEquiv.mirror` needs `t i = !s i` (Transport.lean 389); all-`A` 2 circles ↔ mirror all-`B` 2; all-`A` of mirror 3 | holds | none |
| §1.5 adjacent states (sample) | code `0–2, 1–3`; trefoil | `V−E+F = 1−2+1 = 0`; one circle in each state; `#B + #circles = 2, 2, 4, 6` | holds | none |
| §1.6 disc/band | trefoil | 3 vertices, 6 edges, tree 2 edges, 4 bands, `1−4+5 = 2`; genus ≥ 1 forces `F ≤ 3` | holds | none |
| §2.1 Frobenius algebra (sample) | basis `1, X`; wrong counit | `mΔ(1) = 2X`, `mΔ(X) = 0`; torus `2`, sphere `ε(1) = 0`; neck cut returns `1`, `X` / Kho99 lines 264–277 at `c = 0` | holds | none |
| §2.2 grading | `m`, `Δ`, `η`, `ε` | degrees `−1, −1, +1, +1`; with `|1| = 0, |X| = 2`: `m` 0, `Δ` `+2` / Kho99 line 284 | holds | none |
| §2.4 merge and split (sample) | bases of `V`, `V⊗V` | `X⊗X ↦ 0`, `1⊗X ↦ X`, `Δ1 = 1⊗X + X⊗1`, `ΔX = X⊗X`, `mΔ1 = 2X` | holds | none |
| §2.7 `S`, `T`, `4Tu` (sample) | `r = 0`, `r = 2` | degrees: birth `1`, saddle `−1`, sphere `2`, torus `0`; strips `2−2 = 0`, disc `1−2 = −1`; `4Tu` terms all `χ − 2` / BarNatan05 lines 555–581 | holds | none |
| §2.8 envelope (sample) | `CategoryTheory.Mat_` | named declarations exist at the pin; no computed claim in the section | cited | none |
| §3.1 cube signs | `A={2},B={1}`; `A={1},B={2}`; identity square | whole `+1`·vertex `+1` = vertex `−1`·shifted `−1`; second case `−1 = −1`; square `(1,1)`, `(−1,1)`, composite `0` | holds | none |
| §3.2 complex | trefoil | ranks `4, 6, 12, 8`; `4−6+12−8 = 2` | holds | none |
| §3.5 χ and Jones | trefoil; Hopf; `T ↦ q` | `(q+q⁻¹)(q²+q⁶−q⁸) = q+q³+q⁵−q⁹`; Hopf `(q+q⁻¹)(q+q⁵) = 1+q²+q⁴+q⁶`; `T ↦ q` negates | holds | none |
| §3.6 insertion sign | two blocks, `n₋ = 1` each | `(-1)^(n₋(T₁)|S₂|)`: `−1, −1, +1` on both, second only, first only; edge ratio `(-1)^(n₋(T₁))` per edge of factor 2 | holds | none |
| §3.7 evaluation | torus, sphere, genus 2, pants; gluing | `g = 1, 0, 2, 0`; values `2, 0, 0`; `g_out = Σg_v + E − V + 1` from `χ` additivity; exchanged counits give trace `0` | holds | none |
| §8.1 crossing sign (sample) | over `(1,0)`, under `(0,1)`; standard picture `(1,1)`, `(−1,1)` | determinants `1` and `2`, both positive | holds | none |
| §8.2 shoelace | unit square; subdivision | `0+1+1+0 = 2`; reversed `−2`; `½ + ½ = 1` | holds | none |
| §8.4 Sard bound | `TauCeti.interior_image_criticalPoints_eq_empty` | README `dim(source)² + 1` / pin `finrank E * finrank E + 1 ≤ n` (OutermostStratum.lean 389–391) | agrees | none |
| §4.2 planar moves (sample) | all eight generators; three clasp cases | each planarity lemma is an iff at the pin; `insertClasp` carries the face-or-other-component hypothesis (Equivalence.lean 110–114); counts `+1−2+1 = 0`, `+2−4+0 = −2` | holds | none |
| §4.4 cancellation (sample) | positive kink | ranks `4, 2` = `(2,0) + (2,2)` | holds | none |
| §4.5 Check | `σ₁σ₁⁻¹`; kink unnormalized | `V⊗V`: `1, 2, 1` in `−2, 0, 2`; kernel of `m` in degrees `0, −2`, shift `+1` gives `±1` | holds | none |
| §4.6 smooth links (sample) | carriers | uses §§4.3, 4.5, 8.6, 8.8 only; no plane realization at the pins, so not statable | consistent | none |
| §5.1 skein (sample) | positive kink; general degrees | `i = deg_r − a_r`, quantum difference `b_r`; `a₀=0, b₀=1, a₁=−1, b₁=2`; `(0,−1),(0,1)²,(0,3)` and `(1,1),(1,3)`; sign ratio `(-1)^(r−a_r)` | holds | none |
| §5.2 coefficients | trefoil over `𝔽₂`; Hom/Ext indexing | six classes `(0,1),(0,3),(2,5),(2,7),(3,7),(3,9)`; chain degree `i−1` is cochain degree `1−i` | holds | none |
| §5.3 Künneth (sample) | two trefoils; pin hypotheses | `Tor₁(ℤ/2,ℤ/2)` at `(3+3−1, 14)`; projective cycles and cokernels on the second factor only (Sequence.lean 270, 307, 729) / Kho99 lines 1669–1682 | holds | none |
| §5.4 mirror | left-handed trefoil; degree of dual cube | torsion `(3,7) ↦ (1−3,−7)`; label degree `j−n+|S|` dualizes to `(n−j)−|S|` (Mirror.lean 179) / Kho99 lines 1656–1661 | holds | none |
| §5.5 reversal | Hopf, `l = 1`; Kho99 (45), (134) | `n₋ + 2l`, `n₊ − 2l`: shift `(−2l, −6l)`; Hopf minus `(2,6)` is the negative Hopf link / Kho99 lines 697, 1303 | holds | none |
| §5.6 recurrence and `q = −1` | kink, Hopf, trefoil | `2 = −(−1)[4−2]`; `4 = −[−2−2]`; `2 = −(−1)[4−2]`; `−2·V(1) = (−2)^c`; unsigned sum `30` | holds | none |
| §5.8 reduced | unknot; sequence | `(X·C)⟨1⟩_j = (C/XC)_{j+1}`; unknot at `0`; `XC = C̃⟨−1⟩`, `C/XC = C̃⟨1⟩` | holds | none |
| §5.9 periodic resolution | `id + K` | coefficients of `[X]^(n−1)` and `[X]^(n−2)` give `a − b = dH + Hd`, `Ha = −bH` | holds | none |
| §5.9 Check | `V⊗V` over `ℤ`, `𝔽₂` | image of `Δm` contains `X⊗1 − 1⊗X` iff `2 = 0` | false when `2 = 0` | C01 |
| §5.11 connected sum | two unknots | `W⟨1⟩ ⊗_W W⟨1⟩ = W⟨2⟩`; `⟨−1⟩` gives `V` | holds | none |
| §6.1 Smith form | trefoil, `j = 7` | ranks `0, 3, 3`; column signs `+, −, +`; `|det| = 2`; `diag(1,1,2)`; `𝔽₂` rank `2` | holds | none |
| §6.3 trefoils and Hopf (sample) | Euler characteristics; reduced | `q+q³+q⁵−q⁹`; reduced `q²+q⁶−q⁸` is `t+t³−t⁴` at `t = q²` | holds | none |
| §6.4 table | `m = 2, 3, 4, 5`; Kho99 Prop. 35 mirrored | Hopf; trefoil; `m = 4` χ `q²+q⁴+q⁶+q¹²`; `(−2j,−4j−k) ↦ (2j+1, 4j+k)` / Kho99 lines 1768–1776 | holds | none |
| §6.5 adequacy | all-`X` at all-`A`; all-`1` at all-`B`; kink | merges kill `X⊗X`; image of a split has no all-`1` term; positive kink is `A`-adequate only / Kho99 lines 1778–1815 | holds | none |
| §6.5 against GeometricTopology §4.8.1 | main, lines 4726–4729 | loopless state graph ⇔ slots `0, 2` on different circles ⇔ `#circlesAt = 2` | same notion | C02 |
| §7.2 collars and ends (sample) | carriers and inputs | `TauCeti.Diffeotopy` and DifferentialGeometry items 3.2, 3.3, 3.5 exist; no computed claim | cited | none |
| §7.3 chart | inverse; south pole; orientation | `4‖y‖² + (‖y‖²−1)² = (1+‖y‖²)²`; `1 − w = 2/(1+‖y‖²)`; `(−e₃, e₀, e₁, e₂)` has determinant `(−1)(−1) = 1` | holds | none |
| §7.5 movie theorem (sample) | Jacobsson04; BarNatan05 | reformulated Carter–Saito (lines 937–940); variants of moves 6, 15, 7 (354–361, 1106–1108); `MM10` with eight third moves (BN 1490–1493) | supported | none |
| §§7.6, 7.9 | sphere, pants, torus | `2, −1, 0`; `ε(1) = 0`, `ε m Δ η = 2`; nonzero degree on `R` at `(0,0)` is zero | holds | none |
| `nonempty_homotopyEquiv_khovanovComplex_of_reidemeisterEquiv` | kink vs unknot; `σ₁σ₁⁻¹` vs unlink; `D'` planarity | homology `(0,±1)` both; `(0,−2),(0,0)²,(0,2)` both; every generator preserves planarity both ways | true | none |
| `nonempty_khovanovHomology_mirror_iso_dual` | trefoils over a field | right `(0,1),(0,3),(2,5),(3,9)` plus `(2,7),(3,7)` in char 2; left is the negation in both cases | true | none |
| `eval₂_one_enhancedStateSum` | trefoil, Hopf, kink, empty, nonplanar | `2, 4, 2, 1`; nonplanar one-crossing code gives `2 − 2 = 0 ≠ 2`, so planarity is needed | true | none |
| `khovanovHomology_closure_replicate` | `m = 2, …, 5`; disjointness | Lean sets equal the table; torsion `i` odd with `j = m+4r`, free odd `i` has `j = m+4r+2`; `r = m/2` excluded by `2r+1 ≤ m` | true | none |
| `le_of_isAdequate_of_reidemeisterEquiv` | `n = 0`; trefoil; figure-eight | vacuous; support `[0,3]`; support `[−2,2]` with `ℤ/2` at `(−1,−3)`, `(2,3)`; length `n ≤ n'` | true | none |
| headlines named not statable | smooth invariance, functoriality, reduced theory | no plane realization, no cobordism or movie category, no `X` action on the complex at the pins | named | none |
| overview χ | empty diagram | `χ = 1`; pinned Jones of the empty code `1`; `(q+q⁻¹)·1 ≠ 1` | hypothesis missing | C03 |
| §7.1 against GeometricTopology's open revision §6.5 | boundary conventions | `−L₀ ⊔ L₁` here / `L₀×{0} ∪ −L₁×{1}` there, related by `Σ ↦ −Σ` | two carriers | D01 |

- Source locators checked against the text: 30 (Kho99 §§2.1, 2.2, eqs. (45), (134), Theorems 1–2, Propositions 9, 22, 26–28, 30, 32, 33, 35–37, Corollaries 11–13, Definitions 3–5; BarNatan05 §4.1.2, Theorems 1, 2, 4, Proposition 7.2, §8.3; Bar02 Definitions 3.2–3.3; Jacobsson04 §3.2, Theorem 2 and the Carter–Saito reformulation; KhovanovPatterns §3).
- Library declarations opened at the pins: `IsReidemeisterMove` and `ReidemeisterEquiv` (Equivalence.lean 95–131); the eight planarity lemmas and `not_isPlanar_insertClasp_of_face_ne`, `faceCount_insertClasp_of_face_ne`; `SmoothingEquiv.mirror` (Transport.lean 389); `card_circlesAt_eq_two_iff` (Adjacent.lean 135); `jonesPolynomial_def` (Jones/Basic.lean 114); the Jones comparisons (EnhancedState.lean 257, EulerCharacteristic.lean 164); `mirrorKhovanovBracketIso` (Mirror.lean 179); the Künneth file (Sequence.lean 270–793); `isKFlat_of_bounded_flat`, `quasiIso_id_tensorHom` (KFlat/Basic.lean 222, 352); `crossingSign_closure` (BraidWord/PDCode.lean 564); `interior_image_criticalPoints_eq_empty` (OutermostStratum.lean 389); `KnotCobordism` (Cobordism.lean 149); `insertCircleClasp` (Oriented/Reidemeister/Two/Basic.lean 35).
- Cross-roadmap citations resolved on main: GeometricTopology §§1.1, 1.3, 1.5, 4.2, 4.2.3, 4.5 (the value `(−2)^(μ−1)`, line 3346), 4.8.1 and Layer 6; DifferentialGeometry Layers 2, 5 and items 3.2, 3.3, 3.5; ConformalMapping Layer 5; AlgebraicTopology §§4.3, 7.1; DGAInfinity Layers 1, 5; DerivedModuleAlgebra §0.2 (which names this roadmap as consumer, line 891); ZigzagPreprojective Layer 8. All exist.
- Automatic checks: all passed. Dependency check output: `depcheck: 198 roadmaps, 2179 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of the declarations agrees with the README statements; no binder is lost and nothing needed changing.
- One-tactic probes on a scratch copy: `rfl`, `simp`, `infer_instance`, `trivial`, `omega`, `decide` and `exact?` close none of the five theorems. Three scratch examples elaborate: at `m = 3`, `(0,1)` is free, `(3,7)` is torsion and not free.
- The description agrees with the head: 62 numbered sections each with a *Needs:* line, 53 Checks in 40 sections, six Tau Ceti imports, a revision of the roadmap on main with the K1–K7 and G numbering mapped (lines 71–72), DerivedModuleAlgebra the supplier added.

Overlap check: read GeometricTopology (main and its two open revisions), Foams and DiagrammaticCoherence (main and their open revision) and CombinatorialHeegaardFloer (open). Shared objects and owners: link cobordisms, §7.1 here and §6.5 of GeometricTopology's open revision (D01); adequacy, GeometricTopology §4.8.1, restated here (C02); `V_L(1)`, GeometricTopology §4.5, cited; the derived tensor product over `W`, DerivedModuleAlgebra §0.2, cited; the planar calculus, formal surfaces and Layer 8, owned here and consumed by Foams and DiagrammaticCoherence; the movie presentation, owned here and consumed by CombinatorialHeegaardFloer.

Source independence: 12 passages compared with 5 sources (Kho99, BarNatan05, Bar02, Jacobsson04, KhovanovPatterns), none shared beyond forced formulas and standard names (`C₁₂ + C₃₄ = C₁₃ + C₂₄`, the relation names, the numbered moves); largest share Kho99, 9 of 19 parenthetical locators in the layers; contents compared with Kho99 (§§2–8): independent, since Layers 1, 8 and 7 have no counterpart there, Layer 2 joins Kho99 §2.2 with BarNatan05 §4.1, Layer 5 draws on Kho99 §§7.2–7.4 and KhovanovPatterns §3, and the order 2, 3, 4, 5, 6 is forced by the *Needs:* lines.

Research link: Reidemeister invariance and functoriality (Khovanov 2000; Bar-Natan 2005; Jacobsson 2004) are what Rasmussen's invariant (2010) is built on; GeometricTopology on main names that invariant, built on this roadmap, for Piccirillo's theorem that the Conway knot is not slice. Rests on the README's references and GeometricTopology's README on main, lines 203 and 6515–6522.

## Not verifiable

- Golubitsky–Guillemin §II.4 Theorem 4.13 (§8.4), Hirsch Ch. 8 §1 Theorems 1.3–1.4 (§8.5) and Lickorish Ch. 1 (§8.6): books outside the sample and the manifest; not opened.
- Carter–Saito 1993, Roseman and Carter–Rieger–Saito (§7.5): paywalled articles outside the manifest; §7.5's use of Carter–Saito was checked only through Jacobsson's reformulation.
- The clasp frame of §8.3: the pin has no plane data to check it against (see the question).

## Source issues

- **Error** in Kho99 at Proposition 22 (eq. 135, p. 35) and Proposition 28 (eq. 155, p. 41): the source says reversing one component shifts the bidegree by `(+2l, +2l)`; it should be `H^{i,j}(L₀) = H^{i−2l, j−6l}(L)`, which its equations (45) and (134) give (`[x−2l]{2x−y−6l}`); affects a stated result.
- **Misprint** in Kho99 at Proposition 37, proof, p. 46: the source says the chain groups of a minimal diagram vanish above `hl(L)`; it should be above `c(L)`, the number of crossings; affects the proof.

## For the human reviewers

- none
