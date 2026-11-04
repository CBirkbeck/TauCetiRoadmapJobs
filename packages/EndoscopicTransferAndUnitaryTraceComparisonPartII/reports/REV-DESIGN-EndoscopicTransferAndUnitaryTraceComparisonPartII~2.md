<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/309#issuecomment-6400845657 -->
Review (codex) of 78eadae

Verdict: needs_changes

1. **F01** (P2) Import the existing split Hermitian carrier

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:109`, also `design/plan.json:142`: “This supplies the split model directly from finite-dimensional duality”. The §0.1 Needs line has no split-carrier supplier.

   **Claim.** This roadmap constructs the split dual-pair model and identifies its unitary group with GL.

   **Witness.** `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:608` at head 22bee85 already constructs the same conjugate-first pairing on A⊕A∨ and the action (g,(g⁻¹)∨), in §3.2a. GanGrossPrasadUnitaryGroups §1.1 and its supplier contract explicitly import it.

   **Exact repair.** Add MetaplecticAutomorphicForms §3.2a to Scope, the exact supplier contract, §0.1 Needs, Layer 0 Dependencies and the node prerequisites. Import its sign +1 finite-projective split carrier, pairing and GL-isometry identification. Keep here the relative Hom identification, exchange-adjoint calculation and off-diagonal block adapter. Do not reconstruct the generic split carrier. MetaplecticAutomorphicForms is already the last supplier selected by the gate, so this adds no upward edge.

   **Retest.** For A=F and g=2, both the supplied pairing and the intended adapter send (x,ℓ) to (2x,ℓ/2); pairing values remain (ℓy,kx). On paired Hom maps (1,1), the relative action gives (2,1/2), with product 1. The imported carrier supplies exactly the needed convention, including rank zero.

2. **F02** (P2) The Fourier-to-Satake identification still leaves a sign undetermined

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:510`, also `design/plan.json:1404`: “Identify its symmetric Laurent-polynomial image with the F-Satake algebra; this fixes H_n on every congruence orbit”. The ambiguity reaches §5.1, line 929.

   **Claim.** The integral and the stated unit/base-change laws specify the full operator, including noncyclic vectors.

   **Witness.** Hironaka99 line 697, equation (2.6), printed p. 571, gives the rank-one transform of e₁ as −q^(−z), not q^(−z). In rank two, e_(1,0) transforms to √q(q^(−z₁)+q^(−z₂)).

   The scan was read visually: the OCR omits the sign and powers. Write U_i=q^(−z_i) and let T_i be the normalized F-Satake variables. In rank one the Check H₁(e₁)=T forces U₁↦−T. In rank two both identifications U_i↦T_i and U_i↦−T_i preserve the unit, the squared-variable base-change image, freeness, and all the numerical cyclic Checks. They give H₂(e_(1,0))=T_(1,0),F and −T_(1,0),F respectively. Keeping the stated H₁, the resulting §5.1 operators give opposite values on e_(1,0): ±(e₁⊗e₀+e₀⊗e₁). The existing noncyclic Check is expressed using H itself and does not distinguish these maps.

   **Exact repair.** Specify the spectral-variable dictionary in every rank, with Hironaka's (2.2)–(2.3), p. 566, and the chosen F-Satake convention. One consistent choice is U_i↦−T_i for every n, followed by inverse normalized F-Satake. Record that choice in the plan as well. Add the rank-two noncyclic value H₂(e_(1,0))=−T_(1,0),F and ξ_X(e_(1,0))=−e₁⊗e₀−e₀⊗e₁ for this choice. A different explicitly specified dictionary is also possible, with its corresponding computed value.

   **Retest.** With the proposed dictionary, −U↦T in rank one, U_i²↦T_i² in every rank, and √q(U₁+U₂)↦−√q(T₁+T₂). The twisted F-Levi substitution sends the last expression to −X−Y. Thus it preserves every cyclic comparison and determines the formerly ambiguous two-term example.

3. **F03** (P2) The graded equivalence must quantify over the relative form labels

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:881`, also `design/plan.json:2579`: “The relative unit fundamental lemma for a fixed datum Xi is equivalent” to the reference-pair identities and the other-form zero conditions.

   **Claim.** A single relative datum supplies the full ordinary graded transfer relation.

   **Witness.** For a=b=1, unramified E/F and Xi with (α,β)=(π,1), target contractions have odd/even valuations; source contraction determinants have even valuation. There are no matching source orbits. The zero-target relative assertion is therefore automatic.

   A fixed relative datum tests only its contraction image. It cannot test the ordinary identity on, for example, the reference even/even pair (π²,1), where the proposed degree-two target has value 1. For a direct negative control on the purported reduction, replacing the source by twice its unit leaves the odd/even zero-target assertion automatic while doubling the required ordinary transferred value on the reference component. Leslie25 Corollary 3.10, line 1248, concerns Theorem 2.12, including its family of form labels; it does not assert the stronger fixed-relative-datum reduction. Likewise, “zero for every other form pair” must mean restriction to that pair's contraction image, not a second global ordinary transfer to the zero function.

   **Exact repair.** Fix the ordinary datum (U(Va)×U(Vb),s,ξ), and state the equivalence between the simultaneous relative unit assertions for every (α,β) and the compact ordinary identities for every d. Explain that the contraction images partition the invertible target locus and that the displayed reference target restricts to zero on the other images. Alternatively state the fixed-Xi equivalence only for orbital identities restricted to its contraction image. Synchronize the plan.

   **Retest.** For a=b=1 the four parity components are (even,even), (even,odd), (odd,even), (odd,odd). Their union tests every invertible target pair; the degree-two target has values 1 at (2,0), 0 at (1,1), and 0 on the odd-total components. This restores both directions of the reduction without an infinite sum.

4. **F04** (P2) Separate the rank-zero spherical boundary

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:463`: “Retain both GL_n(E)-orbits”; line 834: “it has infinitely many nonzero grades”; line 854: “the total function is not in H(Xn)”. Also `design/plan.json:1234,2422`.

   **Claim.** These assertions hold under the stated finite-rank conventions, without n>0. The design explicitly defines zero-rank groups and the empty self-density product.

   **Witness.** At n=0, X₀ is a point, det(∅)=1, v(det)=0, H(X₀)=ℂ and Φ₀=e₀. There is one form orbit and exactly one nonzero grade; Φ₀ is compactly supported.

   **Exact repair.** Retain the rank-zero carrier and comparison: one form orbit, Φ₀,₀=e₀, Φ₀,d=0 for d≠0, H₀=identity. Qualify “both orbits”, infinitely many grades and noncompactness by n>0 in README and plan. This preserves the GL₀×GL₁ comparison and does not narrow the positive-rank theorems.

   **Retest.** At n=0 the orbit count is 1, the self-density is 1 and the number of nonzero grades is 1. At n=1 the orbit count is 2 and Φ₁(π^(2j))=1 for every j≥0, so noncompactness holds exactly as intended.

5. **F05** (P3) A residual rank-one Check and a tautological Check remain

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:198`: “In rank one, r=−N(z)”; `design/plan.json:431`. Also README line 398: “For κ=1 the sum equals SRO.”

   **Claim.** The first Check covers the standing general forms; the second is one of the three discriminating Checks for §1.3.

   **Witness.** W₁=⟨1⟩, W₂=⟨π⟩, z=1 gives r=−π⁻¹ and charpoly δ=T²+π⁻¹. Also SRO is defined as the κ=1 sum, so the line 398 Check passes even for identically zero orbital distributions.

   **Exact repair.** Qualify line 198 by standard forms, or use r=−(a₁/a₂)N(z) and charpoly δ=T²+(a₁/a₂)N(z), and retain the nonstandard example as a negative control. Replace the tautological §1.3 Check by a numerical stable sum, for instance orbital values 2 and 5 give stable sum 7, nontrivial weighted sum −3 and shifted weighted sum 3. Keep three separate discriminating Checks; update the plan tests.

   **Retest.** At a₁=1,a₂=π,z=1 the revised characteristic polynomial has constant coefficient π⁻¹; the standard formula would give 1. The zero functional gives 0 instead of 7, and the trivial character gives 7 instead of −3.

6. **F06** (P3) Remove the remaining process prose and empty consumer sentence

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md:7`: “their allocation to a separate continuation requires an ownership decision”; line 954: “Its direct consumers are .”

   **Claim.** The repair completed the timeless-prose and shape corrections.

   **Witness.** The first passage describes a future ownership decision, although the exact named supplier gaps already record the mathematical contracts; the second is an empty generated sentence.

   **Exact repair.** End the Scope paragraph with the fact that the consumed Jacquet–Rallis inputs are the named supplier contracts below; keep any allocation proposal solely in plan.restructure. Delete the empty sentence. Also remove the doubled “of §1.1” at line 433 and duplicate source locators at lines 208, 271, 437, 514 and 576. These changes do not alter mathematical content or dependencies.

   **Retest.** The seven gap declarations and every prerequisite remain present after this prose cleanup; §5.1 ends with its substantive Checks and layer examples.

Six findings: four P2 blockers and two P3 corrections. The design is repairable without changing its scope. None re-raises a supplier obligation that the repair report marked not actionable. The seven declared gaps are contracts, not findings.

## Verified sound

Reviewed the full 36-node design, the source manifest, all 36 Needs lines, six layer dependency lists, nine supplier subsections, the acceptance specification, and the earlier review and repair response. The previous review's computed rows were used as regression witnesses, not as authority for repaired wording. All 15 seeded targets were reopened in the source texts. The two Hironaka pages obscured by OCR were rendered from the cached publisher PDF and read visually. No design or source-manifest entry was changed.

### Previous findings, checked individually

The following quotations are from the repaired design. “Repaired” concerns the previous defect, not an endorsement of unrelated additions.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| F01 unowned Jacquet–Rallis/fibre inputs | §0.6: “integration over the right U(W2)(F)-fibres maps compact locally constant tests onto C_c^∞(Ω)”; lines 43–47 declare the three jr gaps with matching plan slugs and consumer edges. | Repaired as declared contracts. The supplier implementation remains settled/not actionable here. |
| F02 open targets presented as theorems | Scope: “neither is a target”; §3.3 explicitly uses “2^(−r)”; §5.1 constructs only the Fourier operator. Deleted targets are absent from the active node list. | Repaired; new precision issues R02–R03 are independent. |
| F03 fictitious parent sections and factor inputs | Contracts name §§1.1, 1.5, 1.14, 1.17, 2.1, 2.4, 2.9, 2.11, 2.12, 3.3, 4.7, 4.9; §3.5 gives “η((−1)^(ab)D_ab)ω_aω_b”. | Repaired; all-quadratic factor remains a declared, settled gap. |
| F04 dyadic overclaim | “At depth zero this gives N(O_E×)=O_F×”; the three Hermitian gaps are declared and wired. | Repaired as contracts; not re-raised. |
| F05 unowned Igusa criterion | §0.3: “invariance gives P(A,B)=P(AB,I)”; density and the section prove the full invariant-ring assertion directly. | Repaired. |
| F06 duplicated Weil/torsor/basepoint/norm inputs | “Import the descended SL_2(F) Weil actions”; §1.3 transports the parent basepoint law; norm theorem cited at the pin. | Repaired for those four objects; R01 identifies a different duplicated object added by the repair. |
| F07 narrowed coefficient scope | “Layers 0–1 allow a quadratic étale algebra”; §3.2 allows “any quadratic field extension”. | Generality repaired; split construction must be imported (R01). |
| F08 rank-one form coefficients | Conventions and §0.2: “r_i(z)=−(a1/a2)N(z)”. | Partly repaired: §0.4 and its plan Check still omit the ratio (R05). |
| F09 pages and direct consumers | §4.10 cites “Theorem 2.12, p. 21”; §3.8 cites BP21 “pp. 4–5”; §0.7 names orbital-comparison and kappa-orbital-integral. | Repaired. |
| F10 missing house shape | Title starts “# Roadmap:”; Summary, Scope, Conventions, exact contracts, six Layers, Examples and Dependencies are present. All 14 definition/construction nodes have APIs and at least three written Checks. | Partly repaired: one tautological Check and residue listed in R05–R06. |
| F11 process narration | Old job/tool/access narrative is gone; the scope still says “requires an ownership decision”. | Partly repaired (R06). |
| F12 pins | Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. | Repaired; equal to the content manifest. |
| F13 source manifest | Five certified entries, citing-target arrays, arXiv-version notes and Hironaka publisher-scan metadata. | Repaired. No newly cited work needs fetching. |
| F14 padded acceptance proposal | “There are no substitute matrix theorems, admitted examples or data definitions”; plan acceptanceTest.declarations is empty. | Repaired at design stage. |
| F15 Part II boundary | Parent “stops before symmetric-space endoscopy”; consumed JR work is explicit supplier contracts. | Repaired. |

### Seeded source sample

Source line numbers below refer to the service's numbered extractions. Page numbers are those of the versions in the manifest, not the journal pagination of the two arXiv copies. No locator in the active design is flagged unverified. The previously unread Hironaka normalization was checked visually this round.

| Seeded target | Text actually checked | Result |
|---|---|---|
| 0.3 Invariant quotients | Leslie25 lines 556–581, Proposition 2.1 and Lemma 2.2, p. 14 | Quotients and étale scope supported. The new dense-open proof is valid independently of Igusa. |
| 0.4 Regular semisimplicity | Leslie25 lines 542–550 and 621–639, pp. 14–16 | Invertibility and characteristic-polynomial criterion supported. Lemma statement is p. 15; proof continues p. 16. Residual Check: R05. |
| 0.7 Relative orbital integrals | Leslie25 lines 493–497, 611–616, 657–671, pp. 12, 15–16 | Quotient direction, maximal-compact normalization and convergence agree. |
| 1.1 Relative data | Leslie25 lines 801–818, p. 20 | Five-tuple and separate form labels agree; split proper elliptic exclusion is correct. |
| 1.2 Matching and factor | Leslie25 lines 761–783 and 819–826, pp. 19–20 | Pullback, resultant and κ(inv) orientation agree. Larger factor theorem is a declared contract. |
| 1.4 Transfer relation | Leslie25 lines 842–848, Definition 2.10, p. 21 | Both matching and unmatched clauses retained. |
| 2.1 Full spherical module | Leslie25 lines 1116–1137, (3.7), p. 26 | Action and all integral coweights agree. Positive-rank qualifier: R04. |
| 2.3 Hironaka transform | Hironaka99 lines 697–709 and 715–720, Theorem 2 and (2.6)–(2.7), p. 571; scanned (2.2)–(2.3), p. 566; Leslie25 lines 1140–1168 | Isomorphism, measure and rank 2ⁿ supported. Missing variable dictionary: R02. The scan explicitly allows p=2. |
| 3.2 Regularized distributions | Xiao18 lines 140–194, (2), Lemma 2.1, pp. 4–5; Leslie25 §4.2, p. 36 | Support, signs of s, quotient and holomorphy at zero agree, including ramified E. |
| 3.4 Additive descent | Leslie25 lines 1685–1705 and 1743–1779, pp. 38–39 | No modulus in the definition; Jacobian supplies the twisted group descent. |
| 3.5 Cyclic factors/Jacobian | Xiao18 lines 994–1028 and 1175–1187, pp. 21–22, 24 | Source's compact average has η(k); unramified restriction removes it. Added ordered-block sign is necessary over ramified E. |
| 4.5 Augmented spherical transfer | Leslie25 lines 1920–1924 and 2000–2008, pp. 42–43 | Consequence of rank-shifted comparison and Weil reduction; reference/other-form clauses retained. |
| 4.7 Contracted unit | Leslie25 lines 1197–1245, (3.8), Lemma 3.8, Remark 3.9, pp. 28–29 | Overlattice count, compact grades, even-valuation support agree; density is an adapter to GN §3.2. Rank-zero exception: R04. |
| 4.8 Degree identities | Leslie25 lines 1297–1378, (3.9)–(3.10), pp. 30–31 | Satake coefficient and finite degree splitting agree. |
| 4.9 Graded equivalence | Leslie25 lines 1246–1255, Corollary 3.10, p. 29; lines 657–671 | Source proves the family reduction. “Fixed Xi” and unrestricted ordinary transfer need R03. |

Additional changed inputs checked: Leslie19 Proposition A.3, lines 1379–1393; Xiao18 forward identity (7), lines 914–916, and cyclic-coordinate bijection, lines 932–946; BP21 Proposition 1, lines 337–338, and the sum-space argument starting line 366; Leslie25 Theorem 5.3, lines 2000–2008, and its deduction at lines 4021–4058. These support the new fibre-lift, finite-inversion and Weil-sum proof routes. The global spectral theorem remains an explicit independent supplier contract.

### Adversarial calculations

These are actual values or algebraic expressions computed from the definitions. They are tests of the statements and conventions, not claims to have proved the deep transfer theorems. Positive-rank and unramified hypotheses below are explicit where used. Invalid inputs—q=1, characteristic-p F, inseparable quadratic coefficients—fail the standing hypotheses; split étale coefficients are tested separately.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions: field and measures | F=Q₂, q=2; stabilizer scale 2 | q_E=4, abs_E(π)=1/4; RO'=RO/2, so 1↦1/2 | Sound; no division by 2 in integral lattices |
| 0.1 block model | X=1; X=diag(1,π) | δ* =−δ; δ²=−I; higher-rank square diag(−1,−π²,−1,−π²) | Sound adapter; import split carrier R01 |
| 0.1 action, noncommutative order | Two invertible changes g,h | g₁(h₁Xh₂⁻¹)g₂⁻¹=(g₁h₁)X(g₂h₂)⁻¹ | Correct right-action inverse |
| 0.1 split carrier | A=F, g=2; rank zero | Pairing after action=(ℓy,kx), before=(ℓy,kx); at zero both components 0 | Identical to Metaplectic §3.2a |
| 0.2 contractions | Forms (1,π), z=1; standard diag(1,π) | r₁=r₂=−π⁻¹; standard charpolys both (T+1)(T+π²) | Correct; old formula survives only in §0.4 Check |
| 0.3 invariant ring | Split (A,B), B invertible; section (−Z,I) | h=B⁻¹ gives (AB,I); −(−Z)I=Z | Invariant restriction and pullback mutually inverse |
| 0.3 singular fibres and empty rank | (0,1),(1,0); n=0 | Both products 0, distinct orbits; empty invariant ring F on both sides | No false orbit-classifier or rational-surjectivity assertion |
| 0.4 rss iff | Split A=diag(1,0), B=I; standard diag(1,π) | First: p_r=T(T+1), p_δ=T²(T²+1), so fail; second: (T²+1)(T²+π²), separable | Both directions distinguish zero eigenvalue; R05 for general rank-one Check |
| 0.5 torsor/kernel | Rank one unramified; split | −1 has fibre U(1), −π has none; split fibre (u,−T/u); kernel C₂→C₂ is 0 | Geometric surjectivity does not imply rational surjectivity |
| 0.5 stabilizer | t commutes with XX* | (t,X⁻¹tX) fixes X and projects to t; (X⁻¹tX)*(X⁻¹tX)=1 | Sound inverse, including noncommuting matrices |
| 0.6 local sections/lifts | Norm at z≠0; chart vol J=2 | Derivative N(z)Tr(z⁻¹dz) is onto; integral of 1_J/2 is 1, not 2 | Nonzero denominator and correct fibre lift |
| 0.6 invariant cutoff | f=1_OE, B=OF× | χ⁻¹(B)=OE×; f1_U=1_OE×; pushforward=1_OF× | Compact support preserved by clopen cutoff |
| 0.7 RO | Standard unit orbit; Haar scales 2,3,4 | Unit RO=1; scaled RO=2·3/4=3/2 | Correct quotient normalization |
| 0.8 pushforward | Rank-one shells and full lattice | r_!1_(π^jOE×)=e_(2j); full lattice gives 1 at π^(2j), j≥0, 0 at odd valuations | Full pushforward accumulates at zero; nonsingular compact lift remains compact |
| 0.9 comparison | X=1,π,π⁻¹, f=1_OE | Relative values (1,1,0)=ordinary values (1,1,0); doubled torus (1/2,1/2,0) | Sound measure transport |
| 1.1 data | a=b=1, field and split | Field labels C₂²: 4; split: 1; split centre dimensions 2 versus 1 | No split proper elliptic block datum |
| 1.2 factor | x−y=π, unit,0 | Unramified Δ=−q⁻¹,1, outside regular domain respectively; q=2 gives −1/2 | Correct sign and nonzero-resultant condition |
| 1.3 weighted sums | D=C₂; values 2,5 | Stable 7, κ-weighted −3, shifted 3=(−1)⁻¹(−3) | Laws sound; replace tautological Check R05 |
| 1.4 transfer relation | Δ=−1/2; source value 2; unmatched target 1 | Required target −1; unmatched required 0≠1; sums of source 2,4 require −3 | Both clauses and linearity discriminate |
| 1.5 nonsingular transfer | 1_OE× vs 1_OE; target vol J=2 | Pushforwards e₀ versus Σ_(j≥0)e_(2j); target lift 1_J/2 integrates to 1 | Support hypothesis and cutoff essential |
| 2.1 full module | Rank one e₋₁,e₀,e₁; n=0 | At π⁻¹,1,π their value vectors are (1,0,0),(0,1,0),(0,0,1); n=0 orbit count 1 | Full support correct; R04 |
| 2.2 BC/Levi square | a=b=1,q=2 | Both composites send Z₁→X²/2; Z₁Z₂ under ξ_E→XY/4 | Correct twists |
| 2.2 support counterexample | GL₂ basic double coset, q=2 | BC(T_(1,0),E)=T_(2,0),F−T_(1,1),F; odd central coefficient −1 | Correct rejection of source shortcut |
| 2.3 normalized Fourier | n=1, e_j; n=2,e_(1,0) | Raw transform (−1)^jU^j; raw rank-two transform √q(U₁+U₂); unit transforms to 1 | R02: dictionary must fix signs |
| 2.3 rank and cyclic image | n=0,1,2 | Squared-variable extension ranks 1,2,4; n=1 span of T^(2j) excludes T | Freeness/cyclic distinction correct |
| 3.1 coordinates | Two nonsplit factors ζ=(ε,1) | κ_{1}(ζ)=1, κ_{2}(ζ)=−1; empty S₁ gives singleton and character 1 | Complement indexing correct |
| 3.2 raw germs | Unramified rank one, tests 1_O×,1_πO×,1_O | Values 1,−1,(1+q^(−s))⁻¹ at s=0 gives 1/2 | Correct raw normalization; ramified character also has no pole at zero |
| 3.3 inversion | r=1,2,0; v=π | HHᵗ=2I,4I,I; coefficients 1/2,1/4,1; ωG=(−1)(−1/2)=1/2 | Correct averaging and cyclic rescaling |
| 3.4 additive descent | a=b=1; lattice test; m₁=π | Integral over u∈OF gives 1; outside vector lattice 0; du after πu is q⁻¹du | Correct additive/group comparison |
| 3.5 cyclic factor | a=b=1, xa=0,xb=1, E=Q₃(√3) | det[[1,0],[1,1]]=1; D=−1; η(−D)=1 whereas η(D)=−1 | Added ordered-block sign correct |
| 3.5 Jacobian | Unramified xa−xb=π | Off-block map modulus q⁻¹; inverse Jacobian q; reversed transfer factor −q⁻¹ | Correct integral-descent restriction |
| 3.6 reduction | Two nonsplit blocks | 2⁻²=2⁻¹·2⁻¹; only reference/reference test survives, other three are 0 | Finite inversion constants cancel |
| 3.7 Weil sum and polar form | Two decompositions differing by C; u=w=w'=1 | Image difference W_GL(C)−W_U(C)=0; trace 4=2+2; norm 4≠1+1 | Sum construction and trace kernel sound |
| 3.8 unit vector / generators | h(w,w)=1; q(a)=π | p(w)=w,p²=p; ψ(π⁻¹·π)=1; diag(π⁻¹,π) scales upper parameter by π⁻² | Dyadic integral splitting and generation work |
| 4.1 sign comparison | N(c)=−1; rank two diag(1,π) | −N(c)XX*=diag(1,π²)=XX*; ramified Q₃(√3) has no norm −1 unit | Correct unramified scope |
| 4.2 spherical pushforward | Shells j=1,−1 | Images e₂,e₋₂; at odd valuation both 0 | Signed and positive versions coincide by central unit |
| 4.3 product contraction | Φ=1_Km⊗φ, vol K_m=1; m=0 | Integral=1·φ(g); empty-group integral=φ(g); γ₁=I gives Ω=ω(γ₂) | Correct boundary and measure |
| 4.4 adjacent-rank headline | n=1, φ=1_π^dOE× | GL₀ integral BC(φ)=1_π^(2d)OF×; target e_(2d), ω=1; odd valuation 0=0 | Sound boundary of Theorem 5.3 |
| 4.5 augmented transfer | n=1, x unit, v=v*=1, φ=1_K | Twisted regular integral=1, reference integral=1, other-form test=0; raw germ=1/2 | Regular transfer is not raw-germ equality |
| 4.6 cyclic headline | n=2,a=b=1,d=1 | ξ_E(c₂,₁) cyclic image=e₂⊗e₀+e₀⊗e₂; unit e₀↦e₀⊗e₀ | Correct target sum; no full-module overclaim |
| 4.7 grades/density | n=1, T=π²; q=2; n=0 | One self-dual overlattice; density/reference=1; reference density 3/2; n=0 ratio 1/1 and one grade | Positive-rank count sound; R04 |
| 4.8 degree identities | n=2,d=1,2; a=b=1 | q(Z₁+Z₂)↦X+Y; q²(Z₁²+Z₁Z₂+Z₂²)↦X²+XY+Y² | Middle term and all coefficients correct |
| 4.9 iff domain | Four form pairs, a=b=1 | Contraction parities cover all four pairs; one fixed odd/even pair tests none of the source's even determinants | R03: simultaneous relative assertions needed |
| 4.9 compact summation | Block valuations (2,4), odd total, negative total | Exactly total 6 contributes; odd/negative total products 0 and source 0 | No exchange of infinite sum and integral |
| 4.10 lattice headline | All four labels; a=b=1; q=2 | Targets (unit,0,0,0); grade two e₂⊗e₀+e₀⊗e₂; nice factor −1/2 | Consistent with Theorem 2.12 and repaired reduction |
| 5.1 full operator | Central cyclic shell; noncyclic e_(1,0) | Central coefficient q^(−2ab), hence 1/4 at a=b=1,q=2; noncyclic value changes sign with H₂ dictionary | Cyclic laws sound; full operator requires R02 |

The other API laws were checked with these same defining formulas: linearity follows from linear integrals/finite sums, isometry transport preserves the Gram pairing, and inversion identities use the actual inverse of H. No undefined denominator is needed: resultant and cyclic determinants are nonzero on their stated regular domains, compact-open Haar mass is positive, q≥2, and every factor of the reference self-density is positive. Positive characteristic, q=1 and inseparable extensions are not silently admitted by the standing local-field hypotheses.

### Ownership, suppliers and the pinned libraries

The main checkout read was a8132fb235144b25aba003881cc74e35d7d15f36. Two main roadmaps, ComplexTori and ProfiniteProPGroups, were read for shape; SchemeAndStackFoundations was read on main rather than its revision pull request. The current `roadmaps list`, `roadmaps grep` and `roadmaps show` were used, including object searches for Friedberg–Jacquet, Jacquet–Rallis, Hironaka, spherical Fourier, regularized nilpotent distributions, splitHermitianOscillator and dual-pair carriers. The board package index was read before searching its named heads. All 18 other indexed packages were searched at those heads: four root READMEs and fourteen design READMEs (plus the additional sibling design carried with PadicHodgeTheoryPartII); none matched the relative objects searched. Initial root-path 404s were resolved using each head’s tree, rather than treating the packages as absent. These searches distinguish ordinary Shalika germs and trace-methods K-theory from the augmented nilpotent distributions here.

Resolved supplier citations (file line numbers below exclude the display header added by `roadmaps show`):

| Supplier and version | Sections actually opened | Contract resolution |
|---|---|---|
| EndoscopicTransferAndUnitaryTraceComparison, 40d60b6 | README §§1.1,1.4,1.5,1.14,1.17; §§2.1,2.4,2.9,2.11,2.12; §§3.3,4.7,4.9 | Cohomology, inv orientation, ordinary quotient/factors/transfer and base change resolve. §2.12 at line 977 assumes unramified E and odd p, as the repaired contract says. |
| GeometryOfNumbersAndQuadraticArithmetic, 465728d | README §2.7 lines 1128–1167; §2.9 lines 1194–1207; §3.2 from line 1305 | Lattice/dual and field adjoint are supplied. §3.2 has dyadic primitive counts, saturation and density normalization, but does not discharge the three declared classification/transitivity exports. Its Hironaka space is U(2n)/(U(n)×U(n)), not this X_n. |
| AdelicAlgebraicGroups, 70c4324 | README §2.2, lines 1746–1803 | Quotient measure, Weil's L¹ formula, stages and inversion supply the stated measure conventions; the modular-character and topological hypotheses are retained. |
| SmoothRepresentationsOfLocalGroups, 1383569 | README SR.4.1, lines 3144–3152; SR.4.3, lines 3314–3345 | Normalized Satake and twisted E-Levi descent agree with the q-powers used here. The F-version and BC comparison are constructed in §2.2 of this design. |
| SchemeAndStackFoundations, main | README §1.24, lines 3068–3096 | Affine semilinear descent with continuous coordinate-algebra actions; finite splitting-field descent satisfies its condition. |
| ReductiveGroupsPartII, 1383569 | README RG2.0, smooth-group-analytic-charts and adjoining tangent/Jacobian target | Characteristic-zero analytic group charts are present; local torsor sections remain this design's own target. |
| MetaplecticAutomorphicForms, 22bee85 | README §2.1 line 402; §2.5 line 520; §3.2a lines 606–616 | Weil phase/operators supplied; orbital descent correctly remains a gap. Split Hermitian carrier is already supplied: R01. |
| GanGrossPrasadUnitaryGroups, db8ad41 | README exact contracts lines 150–163 and §1.1 | Downstream only. Its global, finite and archimedean JR contracts do not follow from this lattice theorem; its split carrier already points to Metaplectic §3.2a. |

All seven gap slugs agree between README and plan, have named suppliers/sections and concrete hypotheses, and appear on consuming nodes. There are 36 nodes and 80 internal prerequisite edges; no internal reference or gap reference is missing. The three jr contracts ask for the external local interface, orbital Weil descent, and an independent product comparison, rather than re-requesting the Weil operators. The four remaining contracts explicitly extend the field/factor/lattice coverage. None is treated as already implemented. The preserved plan.restructure proposal is not a supply edge.

Pinned files were fetched and read at the manifest revisions, not at the default branches. Searches by object were supplemented by both pinned recursive file trees. The following declarations and definitions were opened:

| Pin | File and line | What was verified |
|---|---|---|
| Mathlib 6b7abb3 | Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43 | Matrix.conjTranspose is transpose followed by entrywise star. |
| Mathlib 6b7abb3 | Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44,285,289 | Matrix.IsHermitian is Aᴴ=A; rectangular Hermitian-product facts already exist. No local-field or Haar structure is included. |
| Mathlib 6b7abb3 | Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132,271 | charpoly is det(TI−A); charpoly_mul_comm applies over a commutative ring. |
| Mathlib 6b7abb3 | Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312 | hsymm is the sum of all degree-d monomials, so h₂(X,Y)=X²+XY+Y². |
| Mathlib 6b7abb3 | Mathlib/Algebra/MvPolynomial/Monad.lean:67 | bind₁ is the algebra-hom polynomial substitution. |
| Mathlib 6b7abb3 | Mathlib/Analysis/Calculus/Implicit.lean:464 | HasStrictFDerivAt.implicitFunction uses a complete normed setting, finite-dimensional codomain and surjective strict derivative; this is not itself an assertion of analytic regularity. |
| Mathlib 6b7abb3 | Mathlib/LinearAlgebra/UnitaryGroup.lean:58 | Matrix.unitaryGroup is the standard-Gram matrix unitary carrier; it does not contain the relative orbital-integral package. |
| Mathlib 6b7abb3 | Mathlib/NumberTheory/HeckeRing/Defs.lean:157,183,189 | Abstract double-coset quotient and finitely supported Hecke modules exist; these are not an already normalized local spherical Fourier comparison. |
| Tau Ceti a91d3aa | TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126,158 | Unit-filtration norm surjectivity and the valuation-divisibility criterion, including residue characteristic two. |
| Tau Ceti a91d3aa | TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean:13,28 | Arithmetic p-local GL_n generators and evaluation hom, not H(X_n) or a local spherical Satake transform. |
| Tau Ceti a91d3aa | TauCeti/LinearAlgebra/UnitaryGroup.lean:33 | Special-unitary star equals adjugate; no Hermitian local transfer structure. |
| Tau Ceti a91d3aa | TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91 | Satake parameters of classical newforms, not the required local spherical algebra isomorphism. |

The matrix-product and charpoly identities should remain imported background, not acceptance milestones. No duplicate Lean declaration can be introduced by the proposed empty acceptance module. The owned new objects are the relative Hom/block adapters, relative contractions/integration, the X_n spherical module and its fixed Fourier comparison, augmented germ/descent adapters, and the relative lattice theorem. R01 is the ownership exception.

Dependency gate output:

```text
candidate: EndoscopicTransferAndUnitaryTraceComparisonPartII is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 55 roadmaps, 613 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The proposed extra §3.2a import uses an already named supplier. No merge-order change was made.

### Acceptance-test boundary

The README names four acceptance headlines: Leslie25 Theorems 2.12, 3.5 and 5.3, and Hironaka99 Theorem 2. Each appears in plan.acceptanceTest.notStatable with its missing analytic/transfer carriers. The declared package-stage module has one Mathlib import, the required namespace/docstring and zero declarations. This is a design, not a package with an existing Suggested.lean; no file was manufactured for the review.

Elaboration: **not available (this lane does not elaborate)**. No Lean command was run. There are zero declarations for a mechanical #check binder comparison or a one-tactic padding probe. Reading the pinned matrix files confirms that the earlier proposed contraction substitutes were correctly deleted: the Hermitian product and equal-charpoly facts would reduce to individual existing library theorems. No statable substitute is demanded for a missing headline carrier.

## Not verifiable

- Lean elaboration and a package-stage module docstring cannot be tested in this lane; Suggested.lean does not exist in this design package.
- The journal versions of Leslie25 and BP21 were not compared. The manifest expressly cites arXiv v3 numbering, and those versions were read. No source request or new manifest entry is necessary.
- Leslie25's entire global spectral proof in Part 2 was not re-derived. Its theorem and final contraction step were read; the independent product theorem is an explicit supplier contract, not a claimed local proof in this design.
- The unexplained general four-form sign conversion in Leslie25 Proposition 4.8 versus Xiao18 Theorem 6.1 remains a source gap. This design uses only the reference/reference term, so that conversion is not a hidden prerequisite of the spherical reduction.

## Source issues

- **Misprint** in Leslie25 at Lemma 1.8, p. 12: the source says the centralizer lies in U(W) for an endomorphism of V; it should be U(V); affects nothing.
- **Misprint** in Leslie25 at §2.2.3, p. 19: the source says the fixed endoscopic embedding is η; it should be ξ, retaining η for the quadratic character; affects nothing.
- **Error** in Leslie25 at §2.3, p. 20: the source says there are two Hermitian form classes in every rank; it should require positive rank and a nonsplit quadratic field extension; affects a stated result.
- **Misprint** in Leslie25 at §4.1.2, p. 32: the source says the unitary invariants use powers of x; it should use powers of y; affects nothing.
- **Misprint** in Leslie25 at §4.1.4, p. 33: the source says the Hermitian block embedding has upper-left block x; it should be y; affects nothing.
- **Misprint** in Leslie25 at Proposition 4.8 proof, p. 38: the source says the upper augmented test is φ tensored with the lattice indicator; it should use φ∗e₀ tensored with that indicator; affects nothing.
- **Gap** in Leslie25 at Proposition 4.8, p. 37: the source says the comparison hypothesis only in rank n; it should include the two smaller block ranks used in the proof; affects the proof.
- **Gap** in Leslie25 at Proposition 4.8 proof, p. 38: the source says four-form signs using both form labels; it should explain conversion from Xiao18's second-form sign convention; affects the proof.
- **Error** in Leslie25 at Proposition 4.8 proof, p. 39: the source says base-change support has individually even coweights; it should use commuting Satake substitutions, since the GL₂ central odd coefficient is −(q−1); affects the proof.
- **Error** in Xiao18 at Theorem 4.7, equation (8), p. 21: the source says inverse character summation has coefficient one; it should have coefficient 2^(−card S₁) for the stated raw germs and volume-one measures; affects a stated result.
- **Error** in Leslie25 at Theorem 4.7, p. 36: the source says the raw germ equals the unaveraged character sum; it should include 2^(−card S₁); affects a stated result.
- **Error** in Xiao18 at Theorem 6.1 proof, p. 24: the source says the cyclic ratio is η(D_ab); it should be η((−1)^(ab)D_ab) for its ordered block volume, relevant when η(−1)≠1; affects the proof.
- **Error** in Leslie25 at §5.1, p. 40 (line 1838): the source says the Hermitian Fourier kernel uses the norm of the pairing; it should use the trace polar pairing; affects the proof.
- **Misprint** in Leslie25 at §5.1, p. 40 (line 1838): the source says the unitary Fourier integrand evaluates f at x; it should evaluate f at y; affects nothing.
- **Gap** in Leslie25 at Proposition 5.2 proof, p. 43: the source says the defect carries the action on the intersection of orbital-image spaces; it should use their sum with the agreeing actions; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "78eadae64bff552590f81410aa20ecfa5a25e770", "job": "REV-DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII~2", "model": "gpt-6-astra", "worker": "chris-42"} -->
