# Review of ComplexComparisonPartII (pull request #848 at e8889ef)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ComplexComparisonPartII/README.md:792,1057–1077` imports ReductiveGroups §3A.5c–3A.5e for all locally finite-type schemes, smooth charts and finite-type groups; C-1.1 retains the analytic ring sheaf and its comparisons.
- R02 — repaired: `TauCetiRoadmap/ComplexComparisonPartII/README.md:148,773,2141,4009–4027,5299` assigns the Picard/exponential segment to K4.P; C5.4 retains transport to analytic modules and the comparison with its singular Chern class.
- R03 — repaired: `TauCetiRoadmap/ComplexComparisonPartII/README.md:184,1090,1231` names ReductiveGroups in scope, C-1.1's needs and Layer C-1's dependencies.
- R04 — repaired: the description's supplier paragraphs include ReductiveGroups and K4.P and remove GlobalHolomorphicFunctions, PadicMeasuresIwasawaAlgebras, RigidAnalyticGeometry and AdicSpacesPartII from the claimed supplier lists.
- R05 — repaired: the description's ownership paragraph names K4.P on main as the Picard/exponential supplier and distinguishes C5.4's remaining comparison.

## Verified sound

| Statement | Instances | Analytification / constructed side | Supplier / comparison side | Result |
| --- | --- | --- | --- | --- |
| C-1.1 classical topology | Doubled origin; disjoint union of countably many affine lines | Two inseparable origins; disjoint union of copies of ℂ | Same two origins; same disjoint-union topology | Matches without separatedness or quasi-compactness |
| C-1.1 reduction and closed quotients | Spec ℂ[ε]/(ε²); unit ideal | One point, stalk ℂ[ε]/(ε²); empty zero locus | Reduction has one point, stalk ℂ; unit-ideal locus empty | Topology agrees; nilpotents survive only in ring sheaf |
| C-1.1 fibre products and open restrictions | A¹ × A¹; D(t) ⊂ A¹ | ℂ² with coordinate projections; ℂ× | Evaluation topology ℂ²; open subspace ℂ× | Same maps and topology |
| C-1.1 smooth/étale charts; curve atlas | P¹ overlap at z=2; t↦t² at 1 and 0 | w=1/2, derivative −1/4; derivatives 2 and 0 | Same transition; inverse derivative 1/2 at 1, no étale chart at 0 | Same smooth atlas |
| C-1.1 relative smooth charts | A¹ over Spec ℂ[ε]/(ε²) | Local ring ℂ{t}[ε]/(ε²), ε≠0 | Product model has the same ring and projection | No reduction of the base |
| C-1.1 proper and finite maps | P¹→point; t↦t² | Compact sphere; inverse of closed unit disc is that disc, fibre over 1 is {−1,1} | Compact sphere; same compact disc and two-point fibre | Properness/finite comparison agrees |
| C-1.1 complex group identification | Elliptic curve; μ₃; trivial group | ℂ/Λ; three discrete points; one point | Dimensions 1, 0, 0; same groups | Nonaffine group included |
| C1.9 curve GAGA and Picard transport | P¹, rational function t, O(1) | Orders +1 at 0 and −1 at ∞; line class degree +1 | Same orders and divisor; K4.P class has Chern number +1 | Named maps preserve normalization |
| C5.4 Picard group versus connecting map | Elliptic curve, L=O(p−q), p≠q | L nontrivial; degree 0 | [L]≠1; δ[L]=0 | Picard identification retains the kernel of δ |
| C5.4 exponential and Čech conventions | u₀₁=1/3, u₁₂=2/3, u₀₂=0 | δu=2/3−0+1/3=1; δ(−u)=−1 | Product cocycle exp(2πi)=1; dual connecting value −1 | Sign and transition direction agree |
| C5.4 integral/singular and curvature comparisons | O(1), O(−1), trivial line on P¹ | Integral classes +1, −1, 0 | Connecting classes +1, −1, 0; normalized curvature integrals +1, −1, 0 | Same integral normalization |
| C5.4 tensor, dual and pullback laws | O(2)⊗O(−2); degree-two map P¹→P¹ | Class 2−2=0; pullback of O(1) has degree 2 | δ is additive: 0; pullback sends generator to 2 | Laws agree |

The rows for untouched statements stand as in the previous review, of `a021e44`.

- Change check: 134 lines, README only; no layer renumbering, Lean declaration change or edit outside the folder; title, description and `roadmap-summary` agree with this head.
- Sources: 2 texts; SGA 1 XII 1.1–1.2, 2.1, 3.1–3.2 and 4.4 checked at `sga1 line 9399`, 9454, 9493, 9594, 9639 and 9805; Demailly V.8.2, V.9.2–9.5, V.11.1–11.2 and VI.9.1 at `demailly-agbook line 13017`, 13040, 13157 and 15564.
- Seeded sample: the affected curve atlas and curve GAGA passages checked against those locators and K4.P; the other 13 sampled targets have no changed passage.
- Pinned API: 5 declarations opened in `TauCeti/Analysis/Analytic/Inverse.lean:106`, `TauCeti/Topology/Algebra/PointTopology/Scheme.lean:143,165`, `TauCeti/Topology/Algebra/PointTopology/Basic.lean:245` and `TauCeti/Topology/Algebra/PointTopology/FiberProduct.lean:46`; the topology APIs supply no analytic ring sheaf.
- Citations: 4 affected supplier roadmaps resolved on main (ReductiveGroups, ComplexKahlerGeometry, CharacteristicClasses, SmoothBundlesConnections); 2 consumer heads checked (K3Surfaces #1285 and GeometricQuantization #1186); overlap rerun reports no dropped cited ids or conflicting edit to this folder.
- Gate: worker gate including targeted build passed; independent gate exited 0 with every check zero and `OK`.
- Dependency check, complete output: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: direct `lake env lean` and a scratch copy with all 4 `#check @` probes exited 0, with only 4 sorry warnings each; signatures retain their hypotheses. The unchanged Lean declarations' earlier padding probes stand.

Overlap check: read ComplexKahlerGeometry (main, #1807, #1808), AlgebraicModuliForArithmeticGeometry (#853), AbelianSchemesAndArithmeticModuli (#849), EtaleCohomologyFoundations (main, #1891), RealAnalyticGeometry (main), and ReductiveGroups (main). K4.P on main owns the manifold Picard/exponential segment; ReductiveGroups owns point topology and smooth charts; ComplexComparisonPartII owns their analytic-ringed-space adapters. Algebraic moduli, abelian-scheme applications, étale coefficients and native coherence retain their respective suppliers.

Source independence: changed passages only; 9 passages compared with 2 source texts and the affected supplier wording, with no copied prose or reused material found. Largest share: demailly-agbook, 40 of 137 explicitly source-led parenthetical citation groups counted. No layer was added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- Kato, *Logarithmic structures of Fontaine–Illusie*: carried from the previous review; the sources service found no legal text.
- Hironaka, *Triangulations of algebraic sets*: carried from the previous review; the sources service found no legal text.
- Bochnak–Coste–Roy, Theorem 9.2.1: carried from the previous review; no open host was identified.
- Dimca, *Sheaves in Topology*: carried from the previous review; publisher DOI resolves to a paywall, recorded as uncertified.

## Source issues

- **Misprint** in sga1 at XII Proposition 1.3.1, printed p. 241 (sga1 line 9479): the source says the input module is over the analytic structure sheaf; it should be over the algebraic structure sheaf on X; affects a stated result.

## For the human reviewers

- none

