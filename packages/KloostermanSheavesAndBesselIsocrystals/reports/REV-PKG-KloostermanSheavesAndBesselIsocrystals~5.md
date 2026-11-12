<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6786851138 -->
Review (codex) of ec4e225

Verdict: needs_changes

1. **F01** (P2) Restore the quasi-minuscule Satake normalization

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1084, “`j_{!+}(p₁^+ A_ψ)` on each fibre is concentrated in degree zero”.

   **Claim:** This displayed coefficient has middle-image cohomology in degree zero of dimension `dim W`, and the corresponding relative object is holonomic in degree zero.

   **Witness:** XZ line 2052 explicitly inserts `[dim Gr_λ]` before intermediate extension. For the PGL₂ quasi-minuscule surface, `d=2`: normalized middle-image dimensions are `H⁰=3, H²=0`; removing `[2]` moves that three-dimensional space to `H²`.

   **Exact repair:** Use the coefficient already fixed in §§1.3 and 1.5: `p₁^+A_ψ ⊗ IC_W`, with its de Rham analogue. On the smooth part of a fibre, explicitly write `M_s=p₁^+A_ψ[d](d/2)` in the Frobenius theory and `p₁^+E_{−π}[d]` in the de Rham theory, where `d=dim Gr_W`; define the intermediate extension from these normalized objects. State separately the relative convention: the unshifted eigenvalue is a connection in degree zero on the curve, whereas the associated holonomic/perverse object carries the curve shift `[1]` (XZ line 2056). Add §§1.3 and 1.5 to this target's Needs line. Add the `d=2`, rank-three degree test above as a negative control. It gives `H⁰=3` after the repair and `H⁰=0, H²=3` if the dimension shift is omitted. The blanket mention of normalized hearts in §1.1 does not define a shifted meaning for the explicitly written `p₁^+`; XZ lines 701–712 identify that pullback with ordinary pullback of smooth coefficients.

2. **F02** (P3) Reverse the vertex-stalk Check

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:1097, “`j_!` contributes the vertex stalk to compactly supported cohomology and changes the dimension”.

   **Claim:** Extension by zero supplies a nonzero ordinary stalk at the deleted vertex.

   **Witness:** For `i:{0}→Y`, `j:Y−{0}→Y`, one has `i^*j_!L=0`. On the characteristic-zero quadric cone `Y=Spec K[u,v,w]/(uv−w²)`, normalized constant IC instead has vertex `H^(−2)` of dimension one.

   **Exact repair:** Replace the Check by the explicit distinction: extension by zero has zero ordinary vertex stalk; intermediate extension can retain vertex intersection cohomology, and its difference from `j_!` must be tracked by the localization triangle. For the stated quadric cone, use the locally nonsingular rank-one exponential coefficient and the Satake shift from R01: the two vertex dimensions in degree `−2` are `0` and `1`. This computes the repaired Check on the package's own example. The cone is the quotient of the smooth two-dimensional cover by `±1`; in characteristic-zero coefficients its link has the rational homology of a three-sphere, so its constant IC is the shifted constant complex. Do not retain the unsupported assertion that `j_!` itself contributes the vertex stalk, or assert a global dimension change without the relevant localization maps.

3. **F03** (P2) Remove the reverse scalar supply claim

   **Location:** `packages/KloostermanSheavesAndBesselIsocrystals/README.md`:2286, “KloostermanMomentsAndPotentialAutomorphy uses the normalization of the all-rank companions”.

   **Claim:** This roadmap supplies §§0.1 and 8.1 to KloostermanMomentsAndPotentialAutomorphy as a downstream consumer.

   **Witness:** `merge-order/ORDER.txt`:310 puts KloostermanMomentsAndPotentialAutomorphy before this roadmap at line 366. `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`:120 explicitly supplies normalization and the Bessel dictionary to this roadmap; its §1.1 at line 471 owns that normalization.

   **Exact repair:** Delete this downstream bullet. Keep the scalar imports in Scope, Exact supplier contracts, and §8.1. The resulting supply is solely `KloostermanMomentsAndPotentialAutomorphy → KloostermanSheavesAndBesselIsocrystals`, with order `310 < 366`. A later extension using the new reductive-group companion theorem would be a separate Part II consumer, not an input to the earlier base roadmap. This is a contradictory reverse-supply promise in prose, not an UPWARD/CYCLE line emitted by the mechanical dependency checker; the checker does not justify retaining it.

Three findings: two P2 and one P3. The previous finding is repaired. The five Lean headlines elaborate, but the quasi-minuscule coefficient has an omitted normalization and an incorrect Check, and the downstream list reverses an existing supply relationship. The package is repairable within its scope.

## Verified sound

### Previous finding and changed passages

Checked the preceding review and repair report before the new audit. There was one finding, F01 (P3), and none marked not actionable.

| Previous finding or supporting repair | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: §0.1 lacks its own Needs line | Repaired | README:441 now says “*Needs:* Mathlib `AddChar`, `AddChar.compAddMonoidHom`, `Algebra.trace`”, followed by the trace, DVR, completeness, fraction-field and four RD inputs. All seven Mathlib names and RD.6.2, .3, .46, .48 resolve. |
| F01: §1.1 lacks its own Needs line | Repaired | README:565 now says “*Needs:* §§0.1, 0.3; GlobalShtukasAndFunctionFieldLanglands §0.1”, followed by §§1.1–1.4, Springer Layer 9 and the two declared gaps. The atlas, bounded Hecke geometry and coefficient-operation prerequisites are accounted for. |
| Added Kashiwara contract | Repaired/supporting edit sound | README:375 includes “Kashiwara's equivalence”; Springer §9.2 is present. Singular bounded Schubert pieces are treated through smooth ambient embeddings, not asserted smooth. |
| Enlarged relative-level contract | Repaired/supporting edit sound | README:244 asks for “full level structures” and “bounded Hecke stacks”; the same slug and enlarged requirement occur in `design/plan.json`. The finite-field owner has §§0.3 and 1.3; the mixed-characteristic extension remains an explicit contract. |
| Layer 0 dependency list and Mathlib/RD contracts | Repaired/supporting edits sound | README:538 contains the added inputs; §§0.1 and 10.2 use the same DVR/completeness/fraction-field carriers. RD.6.2 is listed in the supplier contract. |

Repeated the missing-Needs pattern search over every numbered subsection: **65 targets, 65 Needs lines**. All 12 layers have Examples and Dependencies. Checked the changed dependency lines against their suppliers afresh; the computed tests below include their trace, twist, level and singular-support cases. The new R01–R02 concern a seeded target whose previous numerical row tested the punctured cone's affineness, but did not test its coefficient shift or its asserted vertex stalk. That earlier row is not evidence for either of those assertions.

### Principles, shape and scope

Read all 65 target subsections, their API bullets and Checks, all 12 layers and dependency paragraphs, the Lean file, metadata and all 24 source entries. The overall direction is eigenobjects, the oper comparison, relative comparison, Frobenius, monodromy, explicit realizations and ordinarity. The order is justified by these dependencies; no chapter-following organization or source-chapter layer title was found. Existing scalar Kloosterman theory, generic Tannaka theory, classical Satake and generic p-adic foundations are imported. This is a new reductive-group comparison roadmap, not a replacement for the scalar supplier. R03 corrects the inconsistent downstream sentence.

The scope includes arbitrary split connected reductive groups and every prime, including the characteristic-two branch. Gross–Reeder's prime-to-Weyl-order hypothesis is attached to that classification, not imposed on the roadmap's final all-prime results. Products and tori are addressed separately from almost-simple groups. There is no computational algorithm in the roadmap. The computation scripts used here are review witnesses only.

Every definition has an API and at least three Checks; R02 identifies a false Check despite that count. No sorry'd data, `set_option`, admitted example, `lemma` declaration, forbidden import or quota of elementary acceptance examples appears in Suggested.lean. There is no process narrative, machine path or pull-request number in the roadmap text. Mathematical statements are paraphrased, with formulas and locators, rather than copied source exposition. Metadata and the manifest parse. Read main's ReductiveGroups, AffineLieAlgebras and EtaleCohomologyFoundations for the upstream shape comparison.

The standing datum excludes `p=0,1`, `q=1`, the zero coefficient ring and nonfinite residue fields. All tuple denominators are units. The theorem hypotheses exclude the `n=0` natural-subtraction artifact of the total orthogonal-sum definition. The DVR headline retains mixed characteristic through characteristic-zero fraction field and nonunit 2. Nonreduced level structures retain their nilpotents. No additional generality reduction or unowned prerequisite was found beyond the reported normalization and supply defects.

### Seeded source verification

All **15 seeded targets** were opened at their locators in the supplied legal line-numbered extractions. No additional locator marked unverified was found. Printed page markers and theorem/section numbers were checked. The row for §3.3 records the failure, rather than counting a readable citation as a successful match.

| Target | Locator/text read | Hypotheses and outcome |
| --- | --- | --- |
| 0.1 Normalized coefficient datum | XZ lines 105–188, §§1.1.2–1.1.4, pp. 3–4; line 1731, §4.1, p. 37; line 2323, §4.4.3, p. 50 | Nontrivial prime-field character, Dwork parameter and finite coefficient extension agree. The roadmap correctly adds the square root needed by normalized traces; the smaller introductory source field is insufficient. |
| 0.3 Two-point level models | HNY line 527, Proposition 1.1, printed p. 253; lines 548 and 561–608, Corollaries 1.2–1.3, pp. 254–255; XZ lines 1747–1778 and 1943–1964, §§4.1.1, 4.1.11, pp. 37–38, 41–42 | Components, length-zero group, big cells and the extra torus at level (1,2) agree. Relative bases are explicitly covered by the supplier gap, not attributed to a finite-field theorem. |
| 1.5 Normalized Hecke action | XZ lines 1779–1806, (4.1.2.1)–(4.1.2.4), pp. 38–39; lines 1870–1895, (4.1.8.1)–(4.1.8.4), p. 40 | Bounded-support kernel, tensor action and base-point eigenvalue formula agree. README's IC dimension shift and half twist are explicit here. |
| 2.3 Bessel oper slice | Zhu line 993, Lemma 20, p. 22, with normal form at lines 950–1004; XZ lines 2243–2265, §4.3.5, pp. 48–49 | Almost-simple adjoint oper slice is an affine line with fixed residue and slope bound. The tame parameter zero is included; genericity is not asserted there. The lemma starts at line 993, not the earlier paragraph near line 978. |
| 3.2 Minuscule comparison | XZ lines 1986–2044, Theorem 4.2.1, Lemma 4.2.3 and (4.2.4.1)–(4.2.4.2), pp. 42–44 | Generic integral functional, smooth minuscule geometry, concentration, fibre specialization and descent match the target. |
| 3.3 Quasi-minuscule middle image | XZ lines 2045–2092, §4.2.5 and Lemma 4.2.6, pp. 44–45; lines 701–712 for smooth-object conventions | **R01:** line 2052 includes the dimension shift that the target drops. Line 2056 distinguishes the relative curve shift. The source's affine-projection proof step at line 2070 also needs replacement, as the roadmap already acknowledges. **R02:** extension by zero does not have the ordinary vertex stalk claimed by the Check. |
| 3.4 Quasi-minuscule comparison | XZ lines 2093–2107, (4.2.7.1)–(4.2.7.2), p. 45 | Convergence is established without an already transported Frobenius, then full faithfulness for underlying overconvergent isocrystals is used. Both distinctions are retained and the dense-convergence input is declared. |
| 4.1 Bessel F-isocrystal | XZ lines 2290–2313, §4.4.1, pp. 49–50 | Transport of Frobenius through the comparison and its independence of central comparison ambiguity agree. |
| 4.2 Nilpotent logarithmic extension | XZ lines 2314–2322, §4.4.2, p. 50; lines 1128–1147, §2.9.3 and Proposition 2.9.4, pp. 23–24 | Unipotent boundary monodromy gives the nilpotent logarithmic extension and nearby-cycle fibre. The relation is `C⁻¹NC=qN`, not its inverse. |
| 5.2 Cuspidal Newton bound | XZ lines 2932–2940, Theorem 5.4.2, p. 62; VL-est line 274, Proposition 2.1, printed p. 461 | Nonzero cuspidal eigenform, finite-order central character and normalization at `q_v` are retained in the declared supplier input. The proposition itself starts at line 274. |
| 6.5 Simple wild parameters | GR lines 1170–1173, §5.3, p. 31; line 1190, Proposition 5.4; lines 1302–1340, Proposition 5.6, pp. 34–35; line 1351, definition | GR assumes adjoint type in this setting. README separates the adjoint theorem from its central-lift calculation and retains the prime-to-Weyl-order condition. The central lower break is allowed to change. |
| 7.1 Central torsor of Frobenius structures | XZ lines 2521–2526, Lemma 5.1.1, p. 55; line 2333, Proposition 4.4.5, p. 50 | After the established monodromy/centralizer computation, structures differ by the center. Normalization at zero removes this ambiguity in the stated uniqueness use. |
| 7.3 Exact radius of adjoint solutions | XZ lines 2532–2555, proof of Proposition 5.1.3, p. 55 | The radius-one assertion uses the nontrivial adjoint object and its Frobenius; scaling of the parameter produces the reciprocal power of its absolute value. It is not asserted for arbitrary connections. |
| 8.3 Orthogonal invariant-line decomposition | XZ lines 2733–2735, §5.3.3, p. 58; lines 2864–2869, (5.3.6.5), p. 60 | The even standard representation has a constant invariant line and the odd complement. Fresh matrix and trace tests below distinguish the summands. |
| 8.5 Boundary count for the quadric chart | XZ lines 2740–2802, §5.3.4 and Proposition 5.3.5, pp. 59–60 | The package's corrected boundary contribution `Q^(n−1)−Q` is right on the tested chart. The printed `(Q−1)Q^(n−2)` fails at n=4, Q=2 and Q=3; the two expressions coincide at n=3. |

Also reopened XZ lines 3037–3059, Appendix A.5(i′), pp. 64–65, for the signed Dwork headline, and lines 2883–2910, Proposition 5.3.8 and Corollary 5.3.11, p. 61, for the finite-sum headlines. The seven settled uncertified works were not refetched. All cited works have manifest keys; no source entry was altered or added.

### Adversarial computations

The table records actual values, not an elaboration-based truth claim. Finite sums were evaluated exactly in cyclotomic quotient rings, with finite fields constructed explicitly; there is no floating-point comparison. Fresh execution covered **249 finite-sum equalities**, **1,560 rational Dwork coefficient tests**, **six quadric-chart counts**, and **two even orthogonal matrix pairs**. The smaller symbolic computations are given directly below. “Inherited” refers only to unchanged statements supported by numerical rows in the round-4 report; it is not a claim to have rerun those calculations.

| Statement | Instances tried | Values on each side / wrong-model control | Result; change |
| --- | --- | --- | --- |
| 0.1: normalization and coefficient field | r=2, q=3, a=1 | Raw sum `ζ+ζ²=−1`; normalized trace `1/√3`. In `Q₃(μ₃)=Q₃(√−3)`, adjoining `√3` would also adjoin `√−1`, absent from that ramified quadratic field. | Correct field enlargement; no change. |
| 0.1: twists and repaired RD.6.3 edge | q=4, d=2 | Half twist `2^(−2)=1/4`; square `1/16=4^(−2)`; wrong full twist in place of half gives `1/16`. | Matches supplier and target. |
| 0.1: character and repaired RD.6.2/.46/.48 edges | p=2; F₂⊂F₄ | `π=−2`, `π^(p−1)=−2`; `F_1=−1`, after extension `F_1²=1=ψ(Tr 1)`. One factor would give `−1`. | Correct character and iteration. |
| 0.1 and traceChar | F₄=F₂(ω), ω²+ω+1=0 | Traces of `0,1,ω,ω+1` are `0,0,1,1`; character values `1,1,−1,−1`. | Field trace, not a chosen coordinate, determines the character. |
| 0.2–0.3: root depth and components | SL₂, PGL₂, torus; inherited depth/component values | Quotient dimensions SL₂=2, torus=0; component-group orders SL₂=1, PGL₂=2. In F₂[[t]], `(1+t)²=1+t²`, not `1+t`. | No bad-characteristic central lifting shortcut. |
| 0.3 and repaired relative-level contract | G_m over dual numbers; torus modifications | `(1+ε)⁻¹=1−ε`; reduction sends the nonidentity level unit to 1. Modifications `+1,−1` compose to 0. | Full levels must retain nilpotents; the declared relative Hecke input is necessary. |
| 1.1 and repaired Springer edge | GL₂ Schubert cone at its vertex | Local dimension 2; tangent dimension 3 from `uv−w²` having zero linear term. | Singular support requires the ambient construction; smooth-atlas hypothesis is not inferred for the cone. |
| 1.1: triangulated versus bounded coefficients | B G_m | `H^(2i)=K` for every i≥0, odd cohomology 0. | The target does not assert a bounded stack-cohomology category. |
| 1.3, 1.5, 1.6: Satake and Hecke headline | Minuscule P¹, standard SL₂, unit | Betti dimensions `1+1=2`; normalized Frobenius values `q^(−1/2),q^(1/2)`; tensor rank `2·2=4`, unit rank 1. | Kernel normalization and tensor direction agree. |
| 2.3: oper slice | Rank-one adjoint group, parameter 0 and nonzero | Slice dimension 1; slopes 0 and 1/2 respectively. | Tame origin is retained; imposing nonzero parameter on the whole slice would lose it. |
| 2.4–2.7: localization/descent/comparison headlines | A=K[t], M=A/(t); nonsquare a; inherited | Derived specialization has Tor₀=K and Tor₁=K; ordinary specialization only K. `det(c·diag(a,1))=c²a`, with no solution 1 for nonsquare a, but solution c=b⁻¹ for a=b². | Flatness and rational marking are substantive, not vacuous conditions. |
| 3.2: minuscule comparison | Standard SL₂ coefficient, identity base change | Both comparison ranks 2; other cohomology dimensions 0; identity base change acts by the identity 2×2 matrix. | Degree and rank agree. |
| 3.3: omitted coefficient shift | PGL₂ quasi-minuscule surface, d=2 | Normalized middle image: H⁰ dimension 3, H² dimension 0. Without [2]: H⁰ dimension 0, H² dimension 3. | **R01**; insert the Satake normalization. |
| 3.3: vertex Check | i=vertex, j=punctured quadric cone, rank-one local coefficient | `i^*j_!L[2]=0`; `dim H^(−2)(i^*IC(L))=1`. | **R02**; replace the reversed Check. |
| 3.3: nonaffine projection | Normal affine quadric cone minus vertex | Global function rings before/after deletion are equal; the canonical map to that affine spectrum omits exactly the vertex. | Not affine. Source proof step cannot be reused. |
| 3.4–3.5: quasi-minuscule route | E₈ | Nontrivial minuscule representations: 0; adjoint rank on both sides of comparison: 248. | Convergence without Frobenius and the quasi-minuscule input are essential. |
| 4.1: Bessel construction headline | Torus and rank-two case at F₃,a=1 | Torus connection matrix 0 and Frobenius 1; rank-two raw trace −1 gives normalized trace 1/√3. | No extra toric irregularity; no missing square root. |
| 4.2–4.5: logarithmic residue and Frobenius | N=E₁₂, C=diag(c⁻¹,c), q=c² | N²=0, rank N=1; upper-right entry of NC is c, of qCN is q/c=c. Inverse C would give c⁻¹ versus c³. | Correct logarithmic and column conventions. |
| 5.2–5.3: Newton bound and generic ordinary headline | SL₂ ordinary/basic classes; torus character | Ordinary slopes `(−1/2,1/2)`, basic slopes `(0,0)`, equal endpoint 0; finite-order central character slope 0, norm character slope 1. | Dominance direction and finite-order central hypothesis agree with VL-est. |
| 6.1–6.4, 11.4: monodromy headlines | SL₂ standard/trivial; even A at p=2; inherited | Tensor-square invariant dimensions 1 versus 4. SO₃ dimension 3 versus SL₃ dimension 8; G₂ dimension 14 versus SL₇ dimension 48. | Distinguished actual monodromy from ambient and trivial groups. |
| 6.5: central lift and quotient | u⁴=t, z⁵−z=u⁻², w=uz² | v(u)=5, v(z)=−2, v(w)=1, v(σw−w)=3. Lift: inertia order20, lower break2; adjoint quotient: order10, lower break1. Both upper breaks `2·5/20=1·5/10=1/2`; adjoint Swan `2·1/2=1`. | Correct central-lift statement; GR's D₂=1 is restricted to the adjoint image. |
| 6.6, 11.5: adjoint rigidity headline | A₄ inertia, characteristic two; inherited | Adjoint invariant dimension `(3−3+8·0)/12=0`; rank-one-group Euler expression `−1+1+0=0`. | No prime-to-Weyl-order assumption imported into this case. |
| 7.1: central torsor | SL₂ versus PGL₂ | SL₂ central alternatives C and −C have opposite eigenvalues; center orders 2 and 1 respectively. | Normalization removes a real ambiguity; adjoint uniqueness is different. |
| 7.3: exact radius | p=2 scalar comparison, j=2^a | `v₂(4^j/(j!)²)=2s₂(j)=2`; valuation divided by j tends to 0, giving radius1. Multiplying λ by2 gives radius4; by1/2 gives1/4. | Exact radius and scaling orientation agree. |
| 7.4–7.6: functoriality/companion headlines | G₂ standard representation; SL₂→PGL₂; inherited | `dim Λ²(7)−7=21−7=14`; central kernel order2. | The faithful-representation comparison cannot be replaced by a bare subgroup surjection. |
| 8.3: invariant-line decomposition | Standard dimensions6 and8 | In both cases `NᵗJ+JN=0`, `EᵗJ+JE=0`, `Nv=0`, `Ev=0` entrywise; complementary dimensions5 and7. | Matrix realization and constant line agree. |
| 8.5: boundary count | Q=2, n=3,4, a=1 | Chart sums3,7; toric sums1,1; differences2,6. Formula `Q^(n−1)−Q` gives2,6; printed formula gives2,4. | Package correction is sound. |
| 8.5: boundary count, second field | Q=3, n=3,4; a=1,2 | Chart sums `(13,4),(13,40)`; toric sums `(7,−2),(−11,16)`; differences `(6,6),(24,24)`. Formula gives6,24. | Constant independent of a, with the corrected exponent. |
| 8.3, 8.6: trace splitting | SO₈/SO₇ over F₂ at1 | `7/8−(−1/8)=1`; wrong printed boundary would give `5/8−(−1/8)=3/4`. | Constant summand has trace1. |
| 9.1: hypergeometric construction headline | Upper parameters0,1/2, lower1/3; inherited | Differences −1/3,1/6 are nonintegral; rank2. Equal positive lengths delete x=1; unequal lengths do not. | Correct nonresonance and base domain. |
| 9.4: convolution normalization | q=3,N=2,a=1 | Raw convolution4. Unshifted normalized convolution trace `−4/(3√3)`; half twist gives `−4/9`; [1] gives `4/9=(7−3)/9`. | The earlier convolution repair remains sound. |
| 10.1: dworkBlock | B(j)=j+1; p=2,m=2,s=0; p=0,s=1 | Block `3x²`; at p=0,s=1, interval `[0,0)` gives0. At p=2,m=1,s=2, indices4,5,6,7. | Actual definition has the intended total-function behavior; theorem fixes p=2. |
| 10.2: signed Dwork headline | Odd ranks3,5, m=s=1,N=4 | Coefficients `640/27`, `23296/243`; factors `−16`, `−64`; quotients `−40/27`, `−364/243` are integral at2. | No failed divisibility. |
| 10.2: broader coefficient test | Ranks3,5; m=0..2,s=0..3,N=0..64 | 780 tests per rank; smallest nonzero valuation margins3 and2, versus required≥0. | 1,560 exact rational instances pass. These are tests, not a proof for arbitrary congruence data. |
| 10.3–10.6: unit root and characteristic-two comparison headline | q=4 telescoping; Bessel series; inherited | `(1+x)(1+x²)=1+x+x²+x³`; Bessel series ratio starts `1−16x+112x²`; unit-root slope0 becomes maximal quotient slope n under dual twist. | Taylor comparison and dual quotient direction retained. |
| 11.1: kloostermanSum and orthogonalSum definitions | k=0; F₃,n=0,a=2 | Rank-zero Kloosterman sum at a=1 is1, otherwise0. Orthogonal total definition at n=0 still has two variables and value4, whereas an empty-tuple interpretation gives1. | Rank hypotheses exclude the junk case; no padding theorem states it. |
| 11.1: quadraticCharIn and quadraticHypergeometricSum definitions | F₃,N=0,b=0,1,2 | Quadratic character values0,1,−1; H₀(0)=0, H₀(1)=ζ², H₀(2)=−ζ. | Native transport and the total zero convention agree. |
| Characteristic-two identity headline | F₂,F₄,F₈, a=1 | n=1: both sides −1,5,17; n=2: both sides −1,21,−151. | Exact equalities. |
| Characteristic-two character restriction | F₄, character scaled by ω, a=1 | `U₁−4=−3` but standard R₃(1)=5; rescaled argument gives R₃(1/ω)=−3. | Prime-trace character is essential in this signature, not an unused hypothesis. |
| Odd-characteristic identity headline | F₃, ζ³=1, a=1 | g=−1−2ζ. n=1: g(−2)=2+4ζ=H₃(1); n=2: g·4=−4−8ζ=H₅(1); 4a=1. | Gauss sign and argument4a agree. |
| Raw convolution headline | N=2,a=1, q=2,3,4,5,8 | LHS and RHS respectively −1,4,21,21,−151. At q=3 the two RHS summands are2 and2. | Exact equalities. |
| All three sum headlines, wider tests | All a≠0 in F₂,F₄,F₈,F₃,F₅,F₇; n=1,2; all allowed character scalings | Counts3+15+63+12+48+108=249; every LHS−RHS=0. At q=7,N=2,a=1 both sides have cyclotomic coordinate vector `(35,0,45,36,36,45)`. | No numerical tolerance or favorable-prime restriction. |
| 11.2: toric degree/Hodge input | n=1,d=1,2,3; inherited | Degrees3,6,9, with respectively3,6,9 unit Hodge multiplicities; facet determinant d, primitive vertex index1. At p=2,d=2, logarithmic derivative of −z² is0. | Facet condition and all-face nondegeneracy remain distinct. |
| Orthogonal ordinarity headline | F₂,n=1,a=1; extension degrees1,2,3 | Power sums−1,5,17 yield `T³+T²−2T−8`; coefficient valuations0,0,1,3 give slopes0,1,2 and norms1,1/2,1/4. | Correct normalization and extension exponent. β is chosen before all L. |
| Downstream direction | Scalar supplier and this roadmap | Order indices310<366; imported direction310→366; downstream bullet asserts366→310. | **R03**; remove reverse promise. |

For unchanged targets not repeated in this compact table, the round-4 numerical rows supply the inherited tests: ULA hyperbolic-localization shifts, tame twists and traces of powers, product Coxeter exponents, cyclic/horizontal signs, pinned covariance, principal-exponent exclusion and toric lattice counts. Their computed values, rather than the previous “sound” prose, were compared with the unchanged statements. The full README was nevertheless reread; no uncomputed summary was used to certify a newly changed or sampled assertion.

### Pinned declarations, duplication, signatures and padding

Inspected Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are paths within those pinned libraries. Every named library input in the README was opened; searches also used the mathematical objects, not only the proposed declaration names.

| Pinned file and line | Declaration(s) inspected; scope comparison |
| --- | --- |
| `Mathlib/Algebra/Group/AddChar.lean`:72, 242, 354, 463 | AddChar, compAddMonoidHom, sum_eq_ite, mulShift. The carrier does not impose nontriviality. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`:240 | AddChar.sum_eq_zero_of_ne_one; orthogonality with a domain hypothesis, not an orthogonal-sum identity. |
| `Mathlib/RingTheory/Trace/Defs.lean`:70; `Mathlib/FieldTheory/Finite/Trace.lean`:37, 49; `Mathlib/Algebra/Algebra/ZMod.lean`:47 | Algebra.trace, trace_to_zmod_nondegenerate, algebraMap_trace_eq_sum_pow, ZMod.algebra. The finite-field assumptions exclude the trace's infinite-dimensional degeneracies. |
| `Mathlib/NumberTheory/GaussSum.lean`:72, 76, 83, 200 | gaussSum, change of additive character and inverse-character Gauss product. None states the orthogonal hypergeometric or convolution identity. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean`:120; `Mathlib/NumberTheory/MulChar/Basic.lean`:455 | quadraticChar and ringHomComp. quadraticCharIn specializes these existing definitions with a real body. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean`:77, 112; `Mathlib/RingTheory/PowerSeries/Expand.lean`:33, 87, 97, 110; `Mathlib/RingTheory/PowerSeries/Trunc.lean`:51, 63 | coeff, mk, expand, coefficient substitution and initial truncation. Block truncation is a simple definition needed by the Dwork headline; no signed congruence is already proved here. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`:56; `Mathlib/RingTheory/AdicCompletion/Basic.lean`:57; `Mathlib/RingTheory/Localization/FractionRing.lean`:52 | IsDiscreteValuationRing, IsAdicComplete, IsFractionRing. The first is a nonfield local PID/domain condition; completeness includes separation. |
| `Mathlib/NumberTheory/Padics/Complex.lean`:137; `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61 | PadicComplex is the completed algebraic closure; Module.finrank is the cardinal rank's natural value. Finite fields force finite extension dimension in the headline. |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean`:43; `Mathlib/Algebra/Lie/Basic.lean`:73 | Matrix.trace and LieAlgebra; these do not supply differential Galois or curve-isocrystal carriers. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean`:112, 138 | WittVector.Isocrystal and IsocrystalEquiv concern a vector space over a coefficient field with Frobenius. They are not overconvergent coefficients on a curve or H-valued monodromy. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean`:95; `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean`:138 | FGComoduleCat and pointsFunctorIsoTensorAutFunctor. Finite comodules and Hopf reconstruction are imported; neither provides the missing coefficient category on G_m. |
| `TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean`:176; `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean`:98 | map_restrictNormalHom_lowerRamificationGroupReal and map_restrictNormalHom_upperRamificationGroup, in TauCeti.LocalFieldsRamification. Local-field tower and normal/Galois hypotheses retained; quotient lower numbering uses Herbrand, upper numbering is preserved. |

Opened the useful near-match candidates and the other search leads at the pin. Initial-truncation/expand formulas, the integer multiplicity formulas (`Mathlib/NumberTheory/Multiplicity.lean`:271, 277, 301), p-adic reduction congruences (`Mathlib/NumberTheory/Padics/RingHoms.lean`:121, 131), analytic hypergeometric series (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean`:71, 81), finite-set convolution (`Mathlib/Combinatorics/Additive/Convolution.lean`:97), and Fourier convolution (`Mathlib/Analysis/Fourier/Convolution.lean`:164) have different conclusions or carriers. Orthogonal Lie algebra basis changes likewise do not give Bessel-sum identities. Some search-index labels are stale (for example CoxeterMatrix.Bₙ is the type-B matrix defined as CoxeterMatrix.B at this pin); they are not package citations and were not promoted to findings.

There are **11 actual declarations: six definitions and five theorems**. The supplied automated count of 13 includes docstring parsing artifacts. Every actual declaration is named in the README; every backticked identifier attributed to this roadmap resolves to one of these declarations. Mathematical notation such as IC_W is not presented as an additional Lean declaration. No duplicate fully qualified name was found in the readable roadmaps or libraries.

Ran the prescribed `lake env lean` elaboration of the package's Suggested.lean from the pinned content checkout: **exit 0**, with exactly five `declaration uses 'sorry'` warnings, at lines **66, 133, 145, 156, 169**. Its only import is `Mathlib`, so no Tau Ceti module build was necessary. A separate scratch copy with `#check @name` for every actual declaration also elaborated. Compared all 11 types to the README: no lost section variable, hidden conclusion hypothesis, zero-denominator omission, or change of coefficient-ring generality. The ordinary signature chooses β before quantifying over all finite extensions L. The two prime-field algebra structures agree uniquely, so they do not create a missing scalar-tower assumption.

The one-tactic probe was run on **all five sorried theorems**, on a scratch copy, trying each of `simp`, `rfl`, and `infer_instance` as a complete proof. All five failed every alternative. Comparison with the pinned single-lemma candidates above also rules out an `exact` of one of those lemmas: their statements do not give any of these five conclusions. None of the five is a definition restatement, a boundary theorem, or a small-value Check. **No padding found; no Lean repair requested.**

### Headline acceptance coverage

| README headline | Suggested.lean disposition |
| --- | --- |
| Kloosterman eigenobject and Bessel F-isocrystal, with companions (§§1.6, 4.1) | Named in docstring: missing curve coefficients, arithmetic/holonomic D-modules and eigensheaf carriers. No stand-in. |
| Arithmetic D-module Satake (§1.3) | Named in docstring: missing arithmetic D-modules on the Grassmannian. |
| Zhu comparison and relative de Rham–rigid comparison (§§2.7, 3.5) | Named in docstring: missing opers, stack D-modules and family rigid cohomology. R01 repairs the README's intermediate target, not a fake Lean signature. |
| Differential Galois and Bessel monodromy classification (§§2.8, 6.4, 11.4) | Named in docstring: missing group-connection differential Galois and isocrystal monodromy carriers. |
| Generic ordinarity and everywhere ordinarity on Newton points (§§5.3, 11.3) | Named in docstring with missing H-valued coefficient/Newton carrier. The type B/D trace consequence is the genuine native headline orthogonalSum_ordinary, line 169. Type A/C scalar trace ordinarity is owned by the scalar supplier. |
| HNY functoriality and companion monodromy (§§7.5–7.6) | Named in docstring: missing lisse sheaves on G_m and coefficient comparison carriers. |
| Hypergeometric arithmetic construction (§9.1) | Named in docstring with nonresonance/domain restrictions and missing arithmetic D-module carrier. |
| Signed Dwork refinement (§10.2) | signed_dwork_congruence, line 66, over a general complete mixed-characteristic DVR. |
| Characteristic-two isocrystal comparison (§10.6) | Named as not statable; its trace consequence is orthogonalSum_sub_card_eq_kloostermanSum, line 133. |
| All-characteristic finite-sum identities (§11.1) | The characteristic-two theorem at 133, gaussSum_mul_orthogonalSum_sub_card at 145 and orthogonalSum_sub_card_eq_convolution at 156. |
| Everywhere orthogonal ordinarity (§11.3) | orthogonalSum_ordinary, line 169, states all extension-field power sums and the individual p-adic norms; it is not merely a pointwise trace bound. |
| Simple-wild local parameter and adjoint cohomological rigidity (§§6.5–6.6, 11.5) | Named in docstring: missing local H-valued Weil parameters and rigid cohomology with coefficients. |

No statable headline was found missing. The six simple definitions have native carriers and real bodies, are used in those deep statements, and do not introduce free Prop-valued stand-ins.

### Suppliers, open work and ownership

Read the board-package index before judging missing-package leads. Used `roadmaps list`, `roadmaps show`, and object searches with `roadmaps grep`, together with searches in main, the board packages and pinned libraries. Main was `c1107359463a6249b47ce20bb22c66c259330d25`; open copies were read at the supplied index heads. The following table gives the cited file, sections and actual line locations, excluding the source tool's wrapper line.

| Supplier and version | Resolved file/sections; ownership boundary |
| --- | --- |
| KloostermanMomentsAndPotentialAutomorphy, board package | `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`:471, 534, 625, 725, 747: §§1.1, 1.3, 2.1, 2.5, 2.6. Scalar normalization, monodromy and cyclic/horizontal dictionary. The resolver's missing-§2.6 lead is false; it is at line 747. R03 concerns the reverse downstream sentence. |
| CongruenceSpectralGap, open #1504 | `TauCetiRoadmap/CongruenceSpectralGap/README.md`:647, 677, §§4.2a–4.2b. Raw product-fibre sums, scalar Artin–Schreier and Kloosterman sheaves. The local sum definition is the expressly permitted native acceptance specialization. |
| CharacterSumsOverFiniteFields, open #1712, head 52b794d | `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md`:1123, §3.3. Hasse–Davenport lifting, including its sign and nontriviality qualification. Transport from the field generated by character values respects both trace and norm. |
| GlobalShtukasAndFunctionFieldLanglands, open #1490, head ede1562 | `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`:174, 218, 494, 537, 564, 590, 614, 648, 662, 713, 727, 804: §§0.1, 0.3, 0.14, 1.1–1.6, 1.8–1.9, 1.12. Finite-field bundles, full levels, bounded Hecke stacks, étale coefficients, fusion and Satake. Mixed-characteristic bases and the Newton estimate remain named gaps. |
| ReductiveGroups and ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroups/README.md`:1030, 2253, 3029, 4087, Layers1,7,9,10; `TauCetiRoadmap/ReductiveGroupsPartII/README.md`:4151, 4794, 5533, RG2.3.3, RG2.3.6, RG2.4.1. Root, group and depth geometry is imported. Principal-SL₂ subgroup classification is separately requested. |
| OrthogonalSpinGroups, completed on main | `Completed/OrthogonalSpinGroups/README.md`:331, 408, Layers0–1. Orthogonal and spin carriers; the present package adds their Bessel realization, not another classical-group foundation. |
| FormalConnectionsOpers, open #1056, head 4b3f57b | `TauCetiRoadmap/FormalConnectionsOpers/README.md`:667, 1568, 2109, F2,F4,F6. Connections, opers and slice machinery; the Bessel oper specialization remains here. |
| AffineLieAlgebras, main | `TauCetiRoadmap/AffineLieAlgebras/README.md`:1013, 1049, A7–A8. Complex critical centres are present; rational forms over arbitrary characteristic-zero fields are the declared extension. |
| SpringerResolutionAndCharacteristicCycles, open #1828, head f8ea4db | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md`:832, 964, 990, 1016, 1051, 1075, Layers8–9, particularly §§9.1–9.2,9.4,9.6–9.7. Smooth ambient D-module operations and Kashiwara; level-stack descent is the present application. |
| BunGAndNewtonStrata, open #1241 | `TauCetiRoadmap/BunGAndNewtonStrata/README.md`:331, 679, §§1.5,1.22. Rational Newton orbits and representation detection, not a new Newton construction here. |
| MotivesAndAlgebraicCycles, open #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`:1116, 1130, 1149, 1179, §§6.1–6.3,6.5. Neutral reconstruction and tensor-isomorphism torsors; no automatic rational point. |
| DeligneWeightsAndPurity, open #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`:2434, 2525, 2562, 2718, §§8.5,8.12,8.14,8.19. Mixed operations, proper purity, geometric monodromy and geometric semisimplicity. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`:850 and F.0–F.6. Generic constructible coefficients and operations, not Bessel objects. |
| PadicDifferentialEquationsAndRigidCohomology, open #1002, head 4d3f9ec | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`:1670,1847 (RD.0.37,.44); 2472,2513,2537,2558,2591,2613,2635,2663,2685,3094,3324,3346,3361 (RD.1.11–.19,.35,.44–.46); 4442,4475,4502,4517,5032,5523 (RD.2.13–.16,.33,.51). Radii, breaks, lift comparison and local monodromy resolve. |
| Same p-adic supplier, geometric/analytic interfaces | Same README:5787,6219,6436,6474,6538,6575,6604,6767,6802,6824,6879,6939 (RD.3.8,.25,.33–.37,.43–.45,.47,.51); 8507,8543 (RD.4.58–.59); 8780,10266,10638,10926,10971,10995,11227 (RD.5.8,.76,.89,.101–.103,.112). Restriction without Frobenius differs from forgetting overconvergence; smooth compactification and nilpotent-residue hypotheses remain in force. |
| Same p-adic supplier, Frobenius/trace interfaces | Same README:11440,11479,11506,11961,12005,12056,12365,12392,12429,12461,12521,12563,12604,12671,12702,12792,12996,13026,13385,13641,13664,13731 (the cited RD.6.2,.3,.4,.23,.25,.28,.41–.44,.46–.48,.51–.52,.55,.64–.65,.82,.94–.95,.97). The sign dictionary, generated category and scalar local-monodromy inputs agree. |
| PadicDifferentialEquationsAndRigidCohomologyPartII, board package | `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`:1461,1483, MS.4.6–MS.4.7. The specified-map lift requires irreducible objects and nonzero map, or PBQ/saturation and an isomorphism; the characteristic-two application retains the appropriate hypotheses. |

Read every Needs line and supplier citation against these copies. No cited declaration was declared missing merely from a remembered main/head distinction. The overlap lead file reports no competing head modifying this roadmap, no dropped supplier id, no revision-only id and no unmapped dropped id. The existing former-numbering correspondence is retained.

Compared the closest open scopes explicitly. GlobalShtukasAndFunctionFieldLanglandsPartII #1845, head 9a1ad06, imports the Bessel/companion anchor in `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md`:606 and its Needs at638; it is a genuine later consumer, not a supplier. GeometricSatakeAndFusion #1235, head 140b5a7, has its Fargues–Fontaine étale/perverse ULA setting in `TauCetiRoadmap/GeometricSatakeAndFusion/README.md`:3,26; it does not own a second arithmetic D-module Bessel construction. The other three closest scopes are the p-adic, finite-field shtuka and character-sum suppliers in the table. Object searches for toric Hodge bounds/facial ordinarity, scalar versus group-valued Kloosterman objects, and coefficient/oper comparisons found no additional conflicting owner in the supplied readable work. Ownership against the supplied open heads was checked; unnamed/unavailable external work is not certified.

All **11 declared gaps** have the same slug in `design/plan.json` and a named supplier contract in the README:

- GlobalShtukasAndFunctionFieldLanglands: relative-level-geometry; cuspidal-newton-bound.
- PadicDifferentialEquationsAndRigidCohomology: arithmetic-d-module-operations; formal-slope-comparison; companion-monodromy; dense-convergence-detection; toric-exponential-sum-hodge-bound; toric-exponential-sum-ordinarity.
- ReductiveGroups: principal-sl2-subgroups.
- KloostermanMomentsAndPotentialAutomorphy: scalar-kloosterman-ordinarity.
- AffineLieAlgebras: critical-center-rational-forms.

They specify mathematical hypotheses and named earlier owners. The operation package is one coefficient-theory interface with its exact operations; the group-classification package supplies the stated principal-SL₂ structure input. No unnamed owner, already-provided object, or vague request for the present roadmap's conclusion was found. In particular, scalar Kloosterman rationality is not a substitute for the general toric Newton/Hodge theorems, and a complex critical-center theorem is not an arbitrary characteristic-zero rational form. The enlarged relative-level contract has the precise base-change requirement needed by §§1.1 and 1.5. Pending supplier implementation itself is not a finding.

The prescribed dependency command with `--movable --content` completed successfully. Its complete output was:

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. R03 is the manually detected reverse promise in Downstream consumers, notwithstanding this mechanical result. No forbidden supplier was found.

## Not verifiable

The seven settled uncertified texts remain unavailable for direct primary-text verification: **AS89** (Corollary 3.11), **Wan93** (boundary decomposition/diagonal ordinarity), **Wan04** (Theorem 3.1 and Corollary 2.6), **Bal82** (formal versus p-adic slopes), **DH35** (Gauss lifting), **ESDE** (scalar Kloosterman/hypergeometric inputs), and **KatzCC** (low-dimensional character identities). Their statuses were settled by the operator; none was requested again or added to a missing-reference request. The readable XZ applications and the independent finite calculations were checked, but they do not certify the inaccessible primary texts' complete arguments. The other 17 manifest works have supplied legal cached texts; no new source was needed for this sample.

Lean elaboration checks types, not the truth of the five admitted theorems. The computed instances are discriminating tests, not proofs of the general roadmap. Generic prerequisites recorded as supplier gaps remain explicit future supplier obligations, not implemented results certified by this review.

## Source issues

- **Error** in XZ at Theorem 1.1.4(ii), printed pp. 3–4: the source says the normalized Frobenius matrix is defined over Q_p(μ_p); it should be defined after adjoining the chosen square root of p when required by half twists; affects a stated result.
- **Gap** in XZ at the proof of Lemma 4.2.6(i), printed pp. 44–45: the source says the punctured quasi-minuscule projection is affine; it should use an independent concentration argument, since the punctured quadric cone is not affine; affects the proof.
- **Error** in XZ at Proposition 5.3.5(ii), printed pp. 59–60: the source says the boundary contribution is (q−1)q^(n−2); it should be q^(n−1)−q, giving six rather than four when q=2,n=4; affects a stated result.
- **Misprint** in XZ at the proof of Proposition 5.3.8(i), printed p. 61: the source says the middle eigenvalue of normalized Frobenius is zero; it should be one, as Frobenius is invertible and the displayed weight sequence includes the weight-zero line; affects nothing.
- **Error** in XZ at (5.3.9.1) and (5.3.11.1), printed p. 61: the source says the normalized odd orthogonal coefficient equals unadjusted compact-support convolution; it should carry shift [1] and half twist (1/2), with their negative normalized trace factor; affects a stated result.

GR's adjoint hypothesis is explicit and is not a source error. The missing shift in R01 and reversed Check in R02 are package defects; the source explicitly includes the shift and does not assert the package's vertex-stalk Check.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ec4e225c286f694584827f54f8b2f0e104e1b709", "job": "REV-PKG-KloostermanSheavesAndBesselIsocrystals~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
