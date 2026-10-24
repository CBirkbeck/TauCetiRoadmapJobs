# FIX-RT-GlobalShtukasAndFunctionFieldLanglands~2

Two reviews were merged: pass a (15 findings, F01 … F15) and pass b (3 findings, F01 … F03). Each finding section is headed by its review's own id, pass a first, then pass b; in cross-references below, a-Fnn names finding Fnn of pass a and b-Fnn finding Fnn of pass b. a-F03, a-F08 and b-F01 concern the same supplier gap and were settled once (sections below say so). Section numbers below are the new digit-only ids; the old `GS.k.n` id is given where it helps. All target ids changed for the gate (see "Gate failures").

## F01 (P2) — applied

Changed: Layer 3 Examples, *Tori*: "functions on … Bun_T(F_q)/Ξ" → "at level N, functions on `Bun_{T,N}(F_q)/Ξ`; at empty level this specializes to `Bun_T(F_q)/Ξ`"; stray blank line removed.

Evidence: G_m on P¹/F₃, N={0,∞} has 2 classes against 1 at N=∅. The other torus passages (§§0.14, 3.5, 3.8, Layer 5 Examples) already carried the level.

## F02 (P2) — applied differently

Changed: *Nonsplit Satake descent* now precedes *Normalized spherical Satake*; renumbered old GS.1.13 → 1.11, GS.1.11 → 1.12, GS.1.12 → 1.13. Layer 1 descriptions reordered to match.

Evidence and difference: the forward Needs was real (old GS.1.13 needs only 0.12, 1.9 and suppliers). Ids were renumbered rather than retained because the gate forces new ids anyway; 1.12 now needs 1.11 backwards, with no cycle.

## F03 (P2) — applied differently

Changed: gap `function-field-arithmetic` deleted (README, `design/plan.json`). Its items now cite AL.3 *Curve additive analysis*, ArithmeticGaloisDuality §R02.3.2 and FunctionFieldArithmetic §§0.3, 2.2, 5.1, 5.3, 5.8, 6.1–6.4. Zeta is cited to FunctionFieldArithmetic §§5.1/5.3, the arithmetic owner, instead of DeligneWeightsAndPurity §1.10.

Evidence: settled together with a-F08 and b-F01. AutomorphicLFunctionsAndLocalFactors (open head, *Curve arithmetic and the unramified pure realization*) states *Curve additive analysis* and both rank-one reciprocity targets. FunctionFieldArithmetic at the head given in the brief has §§0.3, 2.2, 5.1, 5.3, 5.8 and 6.1–6.4, and its scope assigns ideles and the class formation to ArithmeticGaloisDuality §R02.3.2.

## F04 (P2) — applied

Changed: §1.9 proof, "Reconstruct the Tannakian group … (MV §11)" → "Apply MotivesAndAlgebraicCycles §§6.1–6.2; establish the Satake-specific hypotheses here; identify the group by weight functors and rank-one Levis". Supplier row, Needs and Dependencies added. Remark: G_m gives E[z,z⁻¹] with antipode z↦z⁻¹, and G=1 gives E.

Evidence: Motives §6.1–6.2 reconstructs over any field. §1.14 (over O_E) is unchanged: Motives §6 is over fields, and its §6.4 is a different relative setting.

## F05 (P3) — applied

Changed: docstring "lacks the algebraic-group representation and perverse étale-sheaf categories" → "lacks the Grassmannians, perverse sheaves on them with convolution, and the fibre functor; its representation side is present (`TauCeti.FGPointRepresentationCat`, `TauCeti.fgPointRepresentationCategoryEquivalence`)". A README "From Tau Ceti" contract names both.

Evidence: `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean` lines 216 and 231 at the pin.

## F06 (P2) — applied

Changed: §1.11 replaces "Ric Corollary 5.8 turns this into an isomorphism" by the half Tate character ε (ε²=cycl), c=(2ρ)∘ε and the comparison (g,γ)↦(g·c(γ)⁻¹,γ), which holds over F_q and F. Added: the SL₂ unipotent Check, the k₀=R non-example and Source correction E7.

Evidence: Ric line 1051's φ(g,γ)=(Ad χ(γ)⁻¹g,γ) satisfies φ((g,γ)(1,γ′))=(Ad χ(γγ′)⁻¹g,·) ≠ (Ad χ(γ)⁻¹g,·)=φ(g,γ)φ(1,γ′). For SL₂ with cycl=3 the two sides give u(1/3) and u(3); the corrected map gives u(1)c(γ)⁻¹ on both.

## F07 (P3) — applied

Changed: §2.5's two restating Checks were replaced by (1) GL₂ on P¹ with no legs: dimensions m+1 (1 and 2 at m=0,1) and an infinite-dimensional colimit; (2) the partition comparison with P¹ fibre over (1,1), ranks 1 in degrees 0 and 2, matching Std⊗Std=Sym²⊕det, against total rank 1 for a point.

## F08 (P2) — applied differently

Changed: each requested contract now cites an existing owner instead of a gap: the Brauer sequence is ArithmeticGaloisDuality §R02.3.2 (`GlobalFunctionField.classFormation`), constant-field Chebotarev is FunctionFieldArithmetic §5.8, and cuspidal support is FunctionFieldArithmetic §6.4. Old FA.3 becomes §0.7's own statement H¹(O_v,𝒢)=1, by Lang plus lifting. No bare labels remain.

Evidence: this re-raises round-1 F10. It is now actionable because the supplier text is available at the head given in this brief, so the round-1 reason ("text absent") no longer holds.

## F09 (P3) — applied

Changed: §0.6 gained a Checks block. (1) G_m on P¹: the adjoint bound accepts every O(d); via diag(t,t⁻¹), μ=(b,−b) keeps exactly |d|≤b. (2) GL₂: O(1)⊕O(−1) has adjoint slopes (2,0,−2), so b=1 rejects and b=2 accepts. (3) PGL₂ Ad versus Ad⊕Ad: the same cutoff 2a≤b with different polygons.

## F10 (P2) — applied

Changed: §7.1 lost "the spherical local excursion … equals `h_{V,v}`" and its proof sentence. §7.5 now states it after the construction, with the proof step (§3.6 calculation), Needs §§3.6 and 7.1, and the GeL Remark 1.6 and VL Prop 6.2 locators. GeL `cited_for` drops 7.1; VL `cited_for` adds 7.5.

## F11 (P2) — applied

Changed: §4.1 now states VL Lemma 8.11's generality: finite families of connected F_q-schemes with geometric points, commuting partial Frobenii composing to q-Frobenius, ≃ finite continuous ∏π₁(X_i,z_i)-sets via contracted products; U^I is kept as the shtuka case. Added remark: A²×A¹ with the constant quadratic character (degree 2, transposition from π₁(A²), trivial from π₁(A¹)).

Evidence: VL line 5925. No other scheme-level owner exists; VStackSheavesAndLisseCategories VS1 is the v-stack version.

## F12 (P2) — applied differently

Changed: deleted "(parahoric at the remaining points)" in §0.1. §0.6 now covers every smooth affine connected-fibre model through ρ:𝒢→SL(V) with quasi-affine quotients and finite-type ρ-truncations, with the adjoint construction only for parahoric models. Ξ-saturations are in §0.10. §2.2 adds AH19 Thm 3.15, and §0.1 gains the dilatation Check.

Evidence and difference: AH19 Prop 2.2(b) (p. 6) and Remark 2.9 (pp. 9–10) hold for flat affine models of finite type. A faithful ρ already bounds central degrees, so "fixing central degrees" is not needed. Putting the saturation in §0.10 avoids a §0.6↔§0.10 cycle. The remaining parahoric hypotheses are explicit source hypotheses (Xue-S §6 in §§4.12, 4.13, 5.4; VL Theorem 12.3 in §5.10; ind-properness in §§7.2, 7.8).

## F13 (P3) — applied

Changed: §7.2 Source "§9, pp. 46–47" → "§9, pp. 43–45"; same change in the GeL `locator` of `sources.toml`.

Evidence: GeL line 1604 starts §9 on page 43, and the references begin at line 1703 on page 45.

## F14 (P2) — applied

Changed: §1.4's DM clause now uses DeligneWeightsAndPurity §8.24 `dmStack_etaleCohomology` for rational coefficients over F_q; this target builds the lisse-étale comparison and extends it to Artin stacks and the six operations. API bullet updated; Needs, supplier row and Dependencies added. New Check: on B C₂ the sign system has H⁰=0 and the constant one H⁰=E.

Evidence: DWP README §8.24 states `dmStack_etaleCohomology` with `_atlas`, `_refinement`, `_pullback`, `_frobenius` and `_finite`.

## F15 (P2) — applied

Changed: §6.1 now obtains the finite-determinant twist from DeligneWeightsAndPurity §5.5 applied to det L (an ℓ-adic unit scalar, continuous on the constant field), with the example "Frobenius 1+ℓ normalized by (1+ℓ)⁻¹". The plainness refinement stays here. Needs "FunctionFieldArithmetic FA.4" → "DeligneWeightsAndPurity §5.5"; Dependencies updated.

## F01 (P2) — applied differently

Changed: settled with a-F03/a-F08. The gap was deleted and every FA citation replaced (Conventions, §§0.7, 0.10, 0.11, 0.13, 0.14, 0.15, 2.6, 5.3, 5.7, 6.1, 7.10, Dependencies). §0.14 no longer plans parahoric Harder finiteness: it transports FunctionFieldArithmetic §6.4 (every connected reductive G, every compact open level) along §0.7.

Evidence and differences: this re-raises round-1 F10 (the FunctionFieldArithmetic part), now actionable as explained under a-F08. Chebotarev is FunctionFieldArithmetic §5.8, its number at the head given in the brief (the review's §5.10 is the board-package numbering). FA.3 became §0.7's local triviality, and §6.1's FA.4 became DeligneWeightsAndPurity §5.5 (a-F15) instead of ArithmeticGaloisDuality.

## F02 (P3) — applied

Changed: three links "[§GS.4.8 *… `H_{I,W}*](#…)`" → "[§4.8 *The cohomology functors `H_{I,W}`*](#48-the-cohomology-functors-h_iw)". The same scan made the unprotected `[#I(κ)](#I(κ)/2)` in the §3.3 remark a code span.

Evidence: a slug check of all 391 internal links now finds none broken.

## F03 (P3) — applied

Changed: §4.3 "p. 8" → "p. 9". The Xue-S `locator` gains "§1.2.9 and Lemma 1.2.10, p. 9" and `cited_for` gains "4.3".

Evidence: Xue-S lines 440 and 448 lie between the page-9 marker (line 405) and the page-10 marker (line 462).

## Gate failures

- **target-ids (93 hits, "write `### k.n Title`")**: every `### GS.k.n Title` became `### k.n Title` (93 headings), and every `## Layer GS.k:` became `## Layer k:` (8). Internal anchors `#gsKN-…` became `#KN-…` (260), text references `§GS.k.n` became `§k.n` (291), and layer references `Layer GS.k`/`Layers GS.a–GS.b` became `Layer k`/`Layers a–b` (60). The a-F02 permutation (1.11↔1.12↔1.13) was applied in the same pass. `sources.toml` `cited_for` ids went from `"GS.k.n"` to `"k.n"` (129), and two locator notes now say "the Source paragraphs of Layers 0–7/0–3". FunctionFieldArithmetic section numbers are always written with the roadmap name, so they cannot be read as this roadmap's own ids.
- Local confirmation: the package gate run on a scratch copy laid out as `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/` (copy deleted afterwards) reports `target-ids=0 layer-ids=0 tex=0 latex=0 readme-ids-missing=0 depcheck=0 metadata=0 sorry-data=0 imports=0 set_option=0` and every other counter 0. The exception is `git=1`, which comes only from the scratch copy not being a git repository.

## Checks run

- `lake env lean …/Suggested.lean` from the content checkout: exit 0, no output. Suggested.lean imports only Mathlib, so no Tau Ceti module needed building.
- `#check @name` audit: Suggested.lean declares nothing (one docstring, empty namespace), so there was nothing to check. The two Tau Ceti names now in the docstring were checked in the source at the pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (lines 216 and 231 above). They are not imported or used in any declaration.
- Dependency check, verbatim:

      depcheck: 34 roadmaps, 329 edges, 0 problem(s)

  Exit 0; no UPWARD, CYCLE or moved line. All new suppliers come before this roadmap (merge-order line 171): AdelicAlgebraicGroups 35, ArithmeticGaloisDuality 50, MotivesAndAlgebraicCycles 84, DeligneWeightsAndPurity 93, AutomorphicLFunctionsAndLocalFactors 94, FunctionFieldArithmetic 169.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 dilatation Check | G_m model with O_x-points 1+π_xO_x on P¹/F₃ | Aut(L)=F₃×, order 2, acts simply transitively on the 2 trivializations of L_x: 1 class, trivial Aut; without level Aut has order 2 | pass | added |
| §0.6 ρ-truncation, G_m | ρ=diag(t,t⁻¹), μ=(b,−b) | O(d)↦O(d)⊕O(−d); accepted iff \|d\|≤b, so 2b+1 degrees, 1 class each; adjoint bound accepts all d∈Z | pass; separates the two constructions | Check |
| §0.6 adjoint bound, GL₂ | O(1)⊕O(−1) | ad slopes (2,0,−2); b=1 rejects, b=2 accepts | pass | Check |
| §0.6 change of ρ, PGL₂ | a=0,1,2; Ad and Ad⊕Ad | (0,0,0),(2,0,−2),(4,0,−4) vs doubled; cutoff 2a≤b in both | pass, cofinal not equal | Check |
| §0.6 degenerate model | G=1, V=O, ρ trivial | SL₁/1 = point, Bun = point, truncation finite type | pass | — |
| §0.10 saturation | G_m, P¹, Ξ=a^Z, deg a=1 | the saturation of \|d\|≤b is all degrees; quotient = Pic⁰(P¹)·B G_m, one class: finite type | pass | added |
| §0.10 FFA §6.2 hypothesis | GL₂ on P¹, U maximal; Ξ deg 1, deg 2, trivial | double quotient sizes 1, 2, ∞ (the last violates finite index) | pass; Ξ≠1 needed | added |
| §0.10 semisimple case | SL₂, Z=μ₂, p odd and p=2 | Z(A) compact (μ₂(F_v) finite; =1 in char 2): finite quotient | pass | added |
| §0.7 local triviality | special fibre G_a, G_m; component group Z/2 | H¹(κ,G_a)=0, H¹(κ,G_m)=0; H¹(F_q,Z/2)=Z/2, giving 2 classes | pass; connected fibres essential | added |
| §0.14 via FFA §6.4 | G_m on P¹, Ξ deg 1, N=∅ vs N={0,∞}; R=O_E/λ^s with p=3, ℓ=2 | cusp dimensions 1 and 2; 3 is a unit mod 2 | pass | rewritten |
| §1.4 DM comparison | B C₂, E coefficients, ℓ=2 | H⁰(sign)=0, H⁰(const)=E | pass | Check |
| §1.9 reconstruction | G=1; G_m | B=E; B=E[z,z⁻¹], S(z)=z⁻¹; with the identity antipode m(S⊗id)Δ(z)=z²≠ε(z)=1 | pass | proof, remark |
| §1.11 corrected L-group map | SL₂, cycl=3; γ=1; torus Ĝ=G_m | Ric: u(1/3) vs u(3); corrected: both u(1)c(γ)⁻¹ with c=diag(√3,1/√3); γ=1 gives c=1; for a torus 2ρ=0 gives the identity | pass | statement, Check, E7 |
| §1.11 hypothesis ε | k₀=R | cycl(c)=−1; every character χ of Z/2 has χ²=1 | ε cannot exist; stated as a hypothesis | added |
| §2.2 general model | dilatation model, I=∅ | bounded zero-leg shtukas = finite discrete set of F_q-points over a ρ-truncation | pass | clause |
| §2.5 Check 1 | GL₂ on P¹, m=0,1,2 | classes {O⊕O}, {+O(1)⊕O(−1)}, {+O(2)⊕O(−2)}: dims 1, 2, 3; colimit dim ∞ | pass | Check |
| §2.5 Check 2 | P¹ fibre vs point | P¹ ranks (1,0,1), total 2 = rank of the (1,1)-stalk of IC(2,0) ⊕ IC(1,1), i.e. 1+1; the point model gives 1 | pass | Check |
| Layer 3 torus example | P¹/F₃, N={0,∞} vs ∅ | (F₃××F₃×)/F₃×: 2 vs 1 | pass | rewritten |
| §4.1 general Drinfeld | I={1}; I=∅; A²×A¹ | ordinary π₁(X₁); empty product Spec F_q with Frob_T=id, so T is constant = finite sets with trivial group; degree 2, transposition/trivial | pass | statement, remark |
| §5.3 Chebotarev via FFA §5.8 | constant quadratic extension | odd degree: no trivial Frobenius; even degree: all places | pass | citation |
| §6.1 via DWP §5.5 | Frobenius 1+ℓ; scalar ℓ⁻¹ | twist (1+ℓ)⁻¹ gives trivial character; ℓ⁻ⁿ is unbounded, so it is not continuous on Ẑ (why unit matters) | pass | proof |
| §7.5 spherical element | f=1; V=1; GL₂ standard | 1_{U_m}; h₁=1_{G(O_v)}; value +q_v^{−1/2} on the minuscule coset | pass | moved from §7.1 |
| E7 | (u(1),1)·(1,γ′), cycl(γ′)=3 | Ric's map: (u(1/3),γ′) vs product (u(1),γ′) | not multiplicative | added |
| Locators | GeL §9; Xue-S Lemma 1.2.10 | GeL lines 1604/1703 on pp. 43/45; Xue-S line 448 on p. 9 | pass | fixed |

## Ownership, citations and sources

- Checked at the heads given by the brief and the roadmap index: FunctionFieldArithmetic (checkout of its open pull request, head 42f4779); AutomorphicLFunctionsAndLocalFactors (5d22a23); ArithmeticGaloisDuality (09ad340); DeligneWeightsAndPurity (6c2402d); MotivesAndAlgebraicCycles (79b02f6); AdelicAlgebraicGroups (70c4324); ArithmeticGaloisRepresentations (bef111d). Tau Ceti and Mathlib were checked at the `lake-manifest.json` pins.
- This roadmap stays the owner of the scheme-level Drinfeld lemma (§4.1; VStackSheavesAndLisseCategories VS1 is the v-stack version), of the general-model bounded loci of Bun_𝒢 over a curve (§0.6; GeometricSatakeAndFusion uses quasi-affine quotients only for Witt-vector Grassmannians), of the lisse-étale/DM comparison and the Artin-stack six operations (§1.4), and of integral Satake reconstruction over O_E (§1.14).
- No new source keys and no `needs-references.toml`. AH19's locator now adds Proposition 2.2 and Theorem 2.5 with Remark 2.9, and its `cited_for` adds 0.1, 0.6 and 2.2. The GeL locator, Xue-S locator and `cited_for`, VL and GeL `cited_for` and a Ric locator note were updated as stated above. All locators were read in the cached legal copies (AH19 lines 289–300, 404–406, 478–509, 798–805; Ric lines 1037–1052; VL lines 5925–5941, 8247–8286; GeL lines 311–318, 1598–1703; Xue-S lines 405–462).
- Untrusted text: the reviews contain no instruction to run commands or act outside this job.

## For the maintainer

- Every section id of this roadmap changed: `GS.k.n` → `k.n`, and old GS.1.11/GS.1.12/GS.1.13 are now 1.12/1.13/1.11. Layer names `Layer GS.k` are now `Layer k`. LanglandsParameterStacks (open head) cites this roadmap as "GlobalShtukasAndFunctionFieldLanglands (GS.5)" in its Downstream consumers, which is now Layer 5. No other roadmap cites a section id of this roadmap. FunctionFieldArithmetic already lists this roadmap as a consumer of its Layer 6, consistent with the new citations.
- The gap `function-field-arithmetic` is gone. Four gaps remain (classical-centre-restriction, equal-characteristic-glr-correspondence, elliptic-sheaf-carrier, function-field-sl-volume), unchanged except that the elliptic-sheaf text now says "§2.7".
- §0.10 now states, as part of choosing Ξ, the finiteness of `Z(F)\Z(A)/((Z(A)∩U)Ξ)` that FunctionFieldArithmetic §6.2 assumes (VL's "réseau"). It is proved here for split centres and semisimple groups. For a nonsplit central torus it rests on compactness of the degree-zero adelic classes, which no supplier was found to state.
- §5.10 keeps VL's parahoric hypothesis. The general smooth-model case would follow by changing the level, but it is not stated, to avoid widening the scope.
