# Review of ModpRepresentationsOfGL2OverLocalFields (package, round 2)

**Verdict:** needs changes

Eleven findings: two P1, five P2, four P3. The six Lean theorems elaborate with only their six `sorry` warnings. No padding was found. The mathematical and ownership findings below prevent acceptance. README, Suggested.lean, metadata.toml, sources.toml and design/plan.json were not changed.

## Previous review: repair verification

The five earlier findings were checked before the new pass. Locations below are in `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`.

| Earlier finding | Status | Repaired passage and verification |
|---|---|---|
| F01, obstruction-space containment | Repaired | §0.8, lines 543–544: “for `σ` a Serre weight and `V` a nonzero admissible quotient … `Δ(σ,V)` contains `V^{I₁}`”. HU12 line 1167, Corollaire 3.9, supplies this form. For the identity of compact induction, Δ=0 and the invariants are nonzero; the revised Check excludes this nonadmissible example. The repair correctly also removes unconditional nonvanishing: the old review's suggestion to retain VIGNERAS11 Proposition 10 was itself wrong. |
| F02, general-F Steinberg route | Partly repaired | §2.2, lines 775–789: “`H^i(N₀, St ⊗ χ∘det) = 0` for every `i ≥ 1`”. The Bruhat-cell/coinduction argument now supplies the general-F vanishing, and EMERTON2 Remark 3.7.3 supplies the injection from R¹ to H¹. The new torus-action formula has the unit-factor defect R02. This does not invalidate the resulting nilpotence or Steinberg vanishing. |
| F03, nonexistent supplier names | Repaired | Lines 210–213: “the coefficient-linear torsion dual `Hom_𝒪(M, L/𝒪)`”; lines 230–235 attribute the five compact-induction/Hecke names to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15. The former is prose in PadicLocalLanglandsForGL2Qp §0.3; the latter five names occur in the cited supplier. |
| F04, nonexistent projective-cover declaration | Repaired | Lines 179–184 use “`TauCeti.exists_isProjectiveCover_of_finite`” and correctly state Artinian K, finite A over K, scalar tower, and no finiteness condition on the module. Opened the pinned declaration at `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195`. All six occurrences use the existing name. This repair does not settle the separate integral-lifting duplication R04. |
| F05, four locators | Repaired | §0.5 now cites “Theorem 4.5, Corollary 5.2 and Lemma 2.8”; §2.2 names PotentialAutomorphyInfrastructure “§§3.7 and 3.12”; the canonical dimension is attributed to NoncommutativeAndEquivariantIwasawa “§0.11”; complete intersections and Cohen–Macaulayness are separated between DeformationAndDerivedPatchingAlgebra §3.4 and SchemeAndStackFoundations §0.17. Each cited section was opened. |

No earlier finding was marked not actionable. The new pass included all changed passages and all other occurrences of the repaired patterns, rather than accepting the repair report's assertions. The earlier adversarial table was used only for its explicit numerical/computed rows; the rest of the 60 numbered targets was read again.

## R01 (P1) — The regular-weight Ext formula fails for GL₂(𝔽₂)

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:995`: “`1` when `ω, ω′` are adjacent and `0` otherwise”. The prime convention at lines 138–141 does not restrict Layer 3.

**Claim.** The adjacency formula computes every regular-weight Ext¹, including p=2, f=1.

**Witness.** For p=2, f=1, μ=(0,0), Λ={0} and GL₂(𝔽₂)=S₃. Ext¹(k,k)=Hom(S₃,k⁺)=k has dimension 1; the claimed nonadjacent value is 0.

An explicit nonsplit extension sends the sign quotient C₂ to the matrix `[[1,1],[0,1]]` over k. Its square is the identity, but its invariant line has no invariant complement. Thus this is not an ambiguity about K-extensions versus finite-group extensions. BP12 line 1470 explicitly assumes p>2 in the f=1 formula; its cited regular-weight formula cannot remove this exception.

**Exact repair.** Preserve all primes. Give the exceptional case (p,f)=(2,1) separately: its sole regular weight has a one-dimensional self-extension. Use the adjacency formula in the other cases, with BP12 Corollary 5.6(i), pp. 37–38, and the elementary exceptional calculation as justification. Add this negative-control Check. The repaired value on S₃ is 1, equal to the explicit extension space. For p=2, f>1 the regular weights are determinant characters; the odd-order determinant quotient and perfect SL₂(𝔽_q), q≥4, give Ext¹=0, agreeing with the edgeless regular domain.

## R02 (P1) — The Hecke operator loses the torus unit

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:790`: “for … `t ∈ T⁺` with … index `q`”; line 792 specifies multiplication by `q/ϖ`.

**Claim.** Every such t conjugates N₀ by the fixed uniformiser ϖ.

**Witness.** Take F=ℚ₅(ϖ), ϖ²=5, t=diag(2ϖ,1), χ=1. For ℓ(1)=0, ℓ(ϖ)=1 on 𝒪_F/5, the asserted operator evaluates at 1 to 1; the actual operator gives 3.

Indeed t conjugates the upper-unipotent coordinate by 2ϖ. Transfer multiplies by q=5 and inverse conjugation divides by 2ϖ; `5/(2ϖ)=3ϖ` modulo 5. The index condition specifies a valuation, not a unit.

**Exact repair.** For `t=diag(a,d)` put c=a/d and state the operator as `χ(ad)` times precomposition with multiplication by `q/c`, when v_F(c)=1. Keep `q/ϖ` for the explicitly normalized t=diag(ϖ,1). Add the unit-twisted ramified example. On it the repaired value is 3; the operator still squares to zero. Thus the general-F nilpotence route survives without narrowing the theorem.

## R03 (P2) — The level-two fundamental character needs a larger residue field and its own Artin map

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:135`: “`ω_{f′} : I_F → k^×`”; lines 108–110 only require the residue embeddings of F. Section 3.4, lines 1010–1012, uses f′=rf.

**Claim.** The fixed coefficients and an unspecified inverse local Artin map on I_F define all the stated fundamental characters.

**Witness.** F=ℚ₅, k=𝔽₅, r=2 satisfies the coefficient convention. A level-two fundamental character has image order 24, whereas k× has order 4. BHHMS23 lines 617–622 instead use F′ and an embedding of its residue field.

**Exact repair.** Name the unramified extension F′/F of degree r and define the character through `I_F=I_{F′} → 𝒪_{F′}^× → k_{F′}^× → k^×`, using the geometric reciprocity convention for F′. Explicitly enlarge the coefficient field to contain k_{F′} (uniformly, k contains 𝔽_{p^{2f}} for the GL₂ tame construction), and retain descent/coefficient independence. This is the existing fundamental-character supplier specialized to F′. Add the order test: after k=𝔽₂₅ the image has order 24 and its sixth power has order 4; the F-Artin map alone gives only the latter level-one information. Do not change geometric to arithmetic reciprocity.

## R04 (P2) — Projective lifting is already pinned, and reciprocity has another owner

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1348`–1356: “every … projective … lifts”; “owned here because no supplier plans it”.

**Claim.** The general integral lifting and reciprocity package must be developed here.

**Witness.** `TauCeti/Algebra/Module/Projective/Lift.lean:89` already lifts a direct summand of N/rN to a projective submodule of N. Open PR #1775, `TauCetiRoadmap/ModularCharactersAndBlocks/README.md:710`, also states Φφ=Σχ dχφχ.

The pin's theorem is `TauCeti.exists_projective_quotient_smul_top_linearEquiv`. Take R=𝒪, A=𝒪[Γ], N=Aⁿ, r=ϖ_L and a split presentation of P. End_A(N) is complete because it is finite over the complete Noetherian DVR. Uniqueness is already `Ideal.nonempty_linearEquiv_of_quotient_smul_top`, `TauCeti/Algebra/Module/Projective/Reduction.lean:73`, applied to the radical ideal ϖ_LA. PR #1775 §1.3, lines 450–458, correctly imports this same lift. Its §3.1 and this package both claim general Brauer reciprocity. GL2AutomorphicRepresentationsAndTransfer §R17.5.11 at open PR #931 already supplies the projective/Brauer pairing and lattice reduction comparison.

**Exact repair.** Delete the generic lifting/existence/uniqueness targets here and add the exact pinned declarations and hypotheses to Scope and supplier contracts. Keep only the GL₂-specific adjoint/lattice constructions. Treat the multiplicity comparison as the specialization of the earlier GL2AutomorphicRepresentationsAndTransfer §R17.5.11 projective pairing together with the Hom base-change comparison: dim_L Hom(P̃_L,V)=rank_𝒪 Hom(P̃,V°)=dim_k Hom(P,V̄)=[V̄:σ] over a splitting modular system. Record those inputs instead of claiming another general reciprocity development; remove the independent reciprocity target shared with #1775, without adding #1775 as an upward supplier. For Γ=C_p in a splitting mixed-characteristic system, the imported lift is 𝒪[C_p], rank p, and both multiplicities for each ordinary character are 1.

## R05 (P2) — The general-DVR reciprocity clause needs mixed characteristic

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1348`–1353: “`𝒪` a complete discrete valuation ring”; “`[P̃_σ[1/p] : V] = [V̄ : σ]`”.

**Claim.** The rebinding to an arbitrary complete DVR supports the entire displayed conclusion, provided only that L splits Γ.

**Witness.** Take p=5, 𝒪=𝔽₅[[t]], L=𝔽₅((t)), Γ=1, P=k and V=L. L splits Γ. P̃[1/5]=0, giving multiplicity 0; the reduction has multiplicity 1.

**Exact repair.** Separate the general complete-DVR lifting/base-change assertions from reciprocity over a splitting modular system of mixed characteristic (0,p). State the latter with `L ⊗_𝒪 P̃`, specifying residue characteristic p and the splitting coefficients. The equal-characteristic test remains a valid lifting test, with lift 𝒪 and rank 1, but is no longer an instance of characteristic-zero reciprocity. The mixed-characteristic test Γ=1 gives 1=1. This preserves the genuinely general lifting statement rather than restricting the whole section to a convenient coefficient ring. R04 determines its owner.

## R06 (P2) — Ordinary parts for ℚ_p are planned twice

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:29` and `:732`: ownership and construction of Emerton's ordinary-parts adjunction for every GL₂(F).

**Claim.** This package owns the construction including F=ℚ_p, with no citation of its existing owner.

**Witness.** Open PR #1270, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:241`, constructs the same locally finite right adjoint with `Hom_G(Ind_{B̄} U,V)=Hom_T(U,Ord_B V)`. It precedes this package at merge-order lines 252 and 264.

**Exact repair.** Import the ℚ_p construction and adjunction from CompletedCohomologyAndLocalGlobalCompatibility §0.1. Retain the arbitrary-F extension here, explicitly distinguish that extension, and require its ℚ_p specialization to identify with the supplier's functor and adjunction. Add the supplier to Scope, contracts and §2.1 dependencies. The existing distinction from PotentialAutomorphyInfrastructure's localization does not distinguish this other owner: it uses precisely Emerton's right adjoint. Compatibility tests give Ord(χ∘det)=0 and Ord(Ind_{B̄}U)=U on both constructions, including the same Weyl swap for upper induction.

## R07 (P3) — Consumers still cite the former MP target IDs

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:317` onward replaces MP identifiers with numbered subsections, without a former-numbering map.

**Claim.** The numbered README preserves the interfaces consumed by open roadmaps.

**Witness.** PR #1745, `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:64`, consumes MP.3/weight-coordinates and MP.8/projective-lattice. PR #1757, `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:93`, consumes MP.0/torsion-admissibility. None occurs in the package README.

These are genuine former IDs, present in `packages/ModpRepresentationsOfGL2OverLocalFields/design/plan.json:250`, `:1251` and `:3299`. The generated overlaps summary missed these design-to-package renamings.

**Exact repair.** Add a compact “Former numbering → section” compatibility map covering every MP ID consumed in those two supplier-contract paragraphs, not a new catalogue of targets. In particular map MP.0/torsion-admissibility→§0.1, MP.3/weight-coordinates→§§3.1–3.3 and MP.8/projective-lattice→§8.4. Check the remaining entries in #1745 lines 64, 665, 760, 799 and #1757 line 93 against the plan's IDs. Following these three sample mappings reaches exactly the promised torsion, coordinate and lattice objects; consumers need no upward edge or change of mathematics.

## R08 (P3) — Three negative-control Checks make false assertions

**Locations and claims.** All are in `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`.

| Location | Claim, quoted briefly | Computed witness | Exact repair, tested |
|---|---|---|---|
| :394, §0.2 | “a componentwise multiplication on `𝒪[H] ⊗ 𝒪` would be commutative” | H=S₃, U=1: ordinary tensor-product multiplication gives [(12)][(23)]=[(123)], but the reverse gives [(132)]. | Keep the group-algebra test without that assertion. Add H=ℤ_p⋊C₂, p odd, where s acts by inversion: sTs⁻¹=(1+T)⁻¹−1=−T+T²−…, whereas a false commuting product gives T. |
| :650, §1.4 | “for a nontrivial character `δ`” the displayed direct sum need not have a central character | p=5, δ quadratic: δ(det(zI))=δ(z²)=1. Both summands have the same central character. | Require δ²≠1 and give δ(2)=2 in 𝔽₅×. At z=2 the two central scalars differ by δ(4)=4. Keep the quadratic character as a negative control to the proposed test. |
| :1111, §4.1 | “`dim 0 = 0` would break the exact-sequence formula” | For V=k, both sides of the max formula on 0→V→V→0 are 0 even with dim(0)=0; the same is true for every nonnegative finite dimension. | Keep dim(0)=−∞ as the chosen convention and its distinction from the trivial line. Delete the claimed failure of exactness; the test is (−∞,0), not a refutation of the alternative max convention. |

These corrections concern the tests, not the existence of augmented multiplication, central-character separation, or the chosen canonical-dimension convention.

## R09 (P3) — Two sampled source labels are inaccurate

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:942`: “BP12, Lemma 3.4 for the tensor-product form”; `:735`: “Definitions 3.1.3 and 3.1.7–3.1.9”.

**Claim.** These are the source locators for the Serre-weight tensor formula and ordinary-part definition.

**Witness.** BP12 line 805, Lemma 3.4, p. 21, is a short exact sequence involving an injective module R_r. EMERTON1 line 753 calls 3.1.7 a lemma; line 762 labels 3.1.8 an equation.

**Exact repair.** For the tensor form cite BP12 equation (2), pp. 13–14, lines 479–487; keep BHHMS23 §2.2, pp. 13–14, for classification modulo central weights. For ordinary parts cite Definition 3.1.3, Lemma 3.1.7, equation (3.1.8), and Definition 3.1.9, pp. 15–17. Update existing manifest locators without adding duplicate source keys. The corrected tensor locator gives dimensions (r₀+1)(r₁+1), e.g. 6·7=42; the ordinary-parts locator gives the same locally finite Hom module as the README.

## R10 (P3) — Complete the continuous-induction definition and fix the broken code span

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:907`–916 defines continuous induction but supplies no definition API and only two Checks. At `:1515`, “`ε ∈ {−1, 0, 1}^J” has no closing backtick.

**Claim.** Every definition has its API and at least three discriminating Checks, and the weight formula renders as intended.

**Witness.** Section 2.6 has two Check bullets, both about the approximation map; its new inverse-limit induction has no functoriality/topology/reduction API. Section 6.4's unclosed span consumes subsequent mathematical text.

**Exact repair.** Give continuous induction's source/target categories and inverse-limit topology, functoriality, and its finite-quotient comparison. Add definition tests: zero coefficients give 0; coefficients 𝒪/ϖ give smooth induction; coefficients 𝒪 give continuous functions, including uniformly convergent sums of ϖⁿ times characteristic functions of shrinking clopens in ℙ¹(F), which need not be locally constant. The last test distinguishes continuous induction from smooth induction over 𝒪. Retain the two approximation tests. Close the code span immediately after `^J` in §6.4. These are README repairs, not new Lean declarations.

## R11 (P2) — The completed-algebra supplier is for compact modules, not arbitrary discrete smooth modules

**Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:175`–177 attributes a module structure “on discrete modules with open stabilisers” to `completedGroupAlgebraModule` in the pinned Module.lean; §0.2 line 376 consumes it.

**Claim.** That declaration directly extends every discrete smooth torsion action.

**Witness.** `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` is `TauCeti.IsCompactModule.completedGroupAlgebraModule`. For Γ=ℤ_p and M=⊕ₙ𝔽_p with trivial action, all stabilisers are Γ, but discrete M is infinite and not compact.

**Exact repair.** State the actual compact-module contract with its fully qualified name. In §0.2 explicitly obtain the discrete action by the compatible actions on finite orbit-generated 𝒪-submodules, using `TauCeti.completedGroupAlgebra.toQuotientEnd` (`Module.lean:99`), or the compact theorem on each such finite submodule. Compactness of Γ and smoothness make every orbit finite; torsion and finite residue field make its 𝒪-span finite. The union covers M, and compatibility supplies the action and uniqueness already targeted in §0.2. Do not add compactness to the representation being studied. On the witness the repaired construction is the augmentation action on every finite sum and hence on the full direct sum; T acts by 0. This is a wrong supplier generality, not a new unowned prerequisite or a request to narrow the theorem.

## Verified sound

### Coverage and acceptance-test checks

Read the complete 60-target, 10-layer README, all 186 lines of Suggested.lean, metadata and all 18 manifest entries. The 15 seeded targets were checked against the cached texts at their locators; details follow. All five earlier repairs were audited. Three main-branch exemplars were consulted for shape: ClassFieldTheory, SchemeAndStackFoundations and RepresentationTheory/QuiverRepresentations. Each layer has Examples and Dependencies, the mathematics is in the roadmap's own layered organization, and the dependency lines force the substantive construction order. No source-chapter heading, algorithmic target, route-only good-prime shortcut, copied source passage, forbidden import, sorry'd data or `set_option` was found. Prime/depth bounds in Layers 4–9 are substantive theorem hypotheses; R01 concerns an exceptional case outside those bounds.

The original file was elaborated using `lake env lean` from the pinned content checkout: exit 0, exactly six `declaration uses sorry` warnings, at lines 99, 116, 128, 146, 161 and 175. It imports only Mathlib, so no missing TauCeti object required a build. A separate scratch copy appended `#check @name` for every one of the 11 declarations; it also elaborated. All five definition types and all six theorem types were compared with the README. No dropped section binder or arbitrary-topology theorem was found: the headline local fields carry `IsNonarchimedeanLocalField`, both residue characteristics are tied to p, and the quotient generator is irreducible. Zero and unit “uniformisers” therefore do not enter the coherence theorem. IsFinitelyPresented implies smoothness and bounded torsion here through its finite-length compact-induction presentation; those properties are not inferred merely from IsTorsionAdmissible.

Every admitted theorem was probed on a scratch copy with `rfl`, `infer_instance`, and `simp` separately through a `first`/`solve` tactic block. All six failed with “simp made no progress”. The plausible exact-library-lemma candidates were inspected at the pin: ordinary module finite presentation is not smooth compact-induction presentation, and semisimple/Artinian finite-length equivalences lack the required hypotheses here. None gives a one-lemma proof. No padding deletion is requested, and no absent statable headline was found.

| README headline | Suggested.lean disposition | Computed test / signature check |
|---|---|---|
| §0.5, coherence for GL₂(F)/ϖ^ℤ | `isFinitelyPresented_ker`, line 99 | For multiplication by T on I(σ), ker=0 and the zero presentation has both generators 0. For the zero map I→I, ker=I, retaining its one-generator smooth presentation. |
| §1.3, finite type implies finite presentation over ℚ_p | `isFinitelyPresented_of_finite`, line 116 | I(σ) is cyclic and finitely presented but has infinite length; I/(T−λ) has one added relation. Thus the statement is not finite-dimensionality or a length Check. |
| §1.5, bounded semisimple quotients imply finite length | `isFiniteLength_of_bounded_semisimple_quotients`, line 128 | For π⊕π simple π, maximal quotient length and module length are both 2; N=0 forces V=0 among finitely generated modules. N is chosen before the quotient. |
| §1.6, finite length iff finite smooth dual | `isFiniteLength_iff_finite_smoothDualSpan`, line 146 | Trivial k: length=1, dual dimension=1. Steinberg: length=1, smooth dual=0. Both directions retain finite generation; an infinite direct sum of Steinbergs has zero smooth dual but infinite length and is excluded. |
| §2.4, admissible finite presentation implies finite length | `isFiniteLength_of_admissible_of_finitelyPresented`, line 161 | 0 has length 0; a character has length 1; Steinberg has length 1 despite infinite vector-space dimension. Compact induction fails admissibility. |
| §2.4, all subobjects are finitely presented | `isFinitelyPresented_subrepresentation_of_admissible`, line 175 | In k⊕k, W=0, a line and V have lengths 0,1,2 and finite presentations. The type quantifies over every subrepresentation, after the hypotheses on V. |
| §2.5–2.6, ordinary counit and Banach approximation | Named in module docstring | Missing Emerton Ord and smooth parabolic-induction carriers; for a character the counit's kernel/cokernel dimensions are (0,1), for Steinberg (1,0), for induced U (0,0). |
| §2.4, no supersingular constituents when F≠ℚ_p | Named in module docstring | Missing smooth principal-series/supersingular API; ℚ_p supersingulars of length 1 are correctly outside this clause. |
| §4.7, Iwahori multiplicity criterion | Named in module docstring | Missing canonical-dimension and pseudocompact truncation carriers; for f=1, Wχ,3 has length 7 while χ has length 1, so the imposed equality is substantive. |
| §7.6, local GK upper bound | Named in module docstring | Missing tame weights/Diamond modules and canonical dimension; bounds for f=1,2 are 1,2, rather than ambient GL₂ dimensions 4,8. No equality/lower bound is asserted. |
| §§8.4–8.6, lattice realization of the first projective truncation | Named in module docstring | Missing pseudocompact projective covers, weights and gluing lattice; for f=1 and dim P=d the reduction has dimension 4d and its K₁-coinvariants have dimension d. |
| §§9.1–9.3, commutative endomorphisms and relative projectivity | Named in module docstring | Same missing carriers; End dimensions are 4 for f=1 and 12 for f=2, from 2^f(f+1), not the full matrix dimensions. |

All 11 backticked own declaration names occur in Suggested.lean; all 11 Lean names occur in the README. No fully qualified name collides with a declaration in the accessible sibling roadmaps. The mathematical headlines in the summary are represented either by the six genuine theorems or by the explicitly documented unavailable carriers, not by free predicates or stand-ins.

### Seeded source sample

The line numbers here refer to the numbered cache extractions, not to OCR search snippets. Each listed passage was opened, including the hypotheses and adjacent proof where the README uses a proof-internal step. The two settled unavailable texts are treated below.

| Sampled target | Source locator read | Hypotheses, pages and outcome |
|---|---|---|
| 0.2 augmented Iwasawa algebra | SHOTTON20 lines 301–349, §3 | The tensor carrier has the augmented multiplication and independence-of-open-subgroup construction. The carrier is not asserted to have naive tensor multiplication. Mathematical construction supported; false Check is R08. |
| 2.1 ordinary parts | EMERTON1 lines 686–697, 753–788, 1759 onward; Definition 3.1.3, Lemma 3.1.7, (3.1.8), Definition 3.1.9, Theorem 4.4.6 | Transfer action, locally finite Hom and opposite-parabolic right adjunction agree. The numbering/kind correction is R09; the ownership issue is R06. |
| 2.2 ordinary constituents away from ℚ_p | HAUSEUX line 1350, Corollaire 4.2.4(ii); EMERTON2 line 1179, Remark 3.7.3; CDN23 line 891, Proposition 1.30(b), p. 21 | Hauseux supplies degree-one vanishing for non-ℚ_p induction; Emerton supplies R¹↪H¹ generally. The new Bruhat-cell argument removes reliance on the ℚ_p-only Theorem 4.2.12. R02 corrects its explicitly stated Hecke formula. |
| 2.3 finite obstruction and length | HU12 Proposition 4.4 and Lemme 4.5, pp. 34–36, including lines 1935–1984; VIGNERAS11 §§4–5 | The finite-presentation obstruction criterion is used with finite-dimensional generators; the passage to admissible finite length retains admissibility. The plus/plus source misprint is not copied. |
| 3.1 regular weights and depth | BHHMS23 lines 542–553, 601–608, §§2.1–2.2, pp. 12–14; BP12 lines 479–487 and 805–808 | Depth's strict inequalities and central quotient agree. BP12 Lemma 3.4 is not the tensor-product locator: R09. |
| 3.2 coordinate map | BHHMS23 equation (14), p. 16, and lines 760–788, Lemmas 2.4.4–2.4.6, p. 17 | Cyclic successor parity, negative Euclidean division, and root translation agree. The separately stated Ext consequence has the small-prime issue R01. |
| 4.5 crossing algebra | BHHMS23 lines 2792–2816, Theorem 5.3.4(ii), p. 54 | The central quotient and relations eᵢfᵢ give a complete intersection of dimension f; no division by p or admissibility is smuggled into the algebra statement. |
| 6.1 rectangular modules | BHHMS23 lines 3037–3104, Proposition 6.2.2, pp. 59–60; HU10 lines 902–925, Lemma 2.13(i), pp. 14–15 | Predecessor parity and coordinate bounds agree. The f≥2 hypothesis of Hu's lemma is retained in that branch; the f=1 argument is separate. The preprint/journal numbering difference is recorded. |
| 6.2 box torsion filtration | BHHMS23 lines 3102–3132, Lemma 6.2.3 and Proposition 6.2.4, pp. 60–61 | The extra depth and coefficient/parity restrictions are retained; the sum of the floor coordinates determines the torsion filtration (a single-coordinate cut at 2n−1 only when f=1). |
| 6.5 adjoint tensor | BHHMS23 lines 3235–3294 and 3373–3433, Lemma 6.3.8 and Proposition 6.3.10, pp. 63–67 | Three graded pieces are ordered λ+εⱼαⱼ, λ, λ−εⱼαⱼ. Four-depth suffices for filtration; five-depth is retained for all extension edges; εⱼ=0 has the direct-sum version. |
| 6.7 tame socle enlargement | BHHMS23 lines 3505–3616, Corollaries 6.3.13 and 6.3.15, pp. 69–71 | Eight-depth, tameness and multiplicities mσ are retained; the assertion does not identify different σ summands or replace multiplicities by 1. |
| 8.1 infinitesimal action | BHHMS23 lines 3854–3919, Lemma 7.1.1, pp. 76–78 | Unramified Witt coefficients, p>2 and trivial mod-p action are retained. β=[(g−1)v/p] maps from the adjoint tensor to V/pV; the coinvariant sequence, not an invariants sequence, is used. |
| 8.2 preimage lattice | BHHMS23 lines 3922–3927, Lemma 7.1.4, pp. 78–79 | The middle quotient is V₁/p²V; it is not V₁/p²V₁. This distinction is retained explicitly in the README. |
| 8.3 contraction automorphism | BHHMS23 lines 3987–4034, Lemma 7.2.1, pp. 79–80, and lines 4052–4073 | The bracket order, coefficients 2 and 4, and 2≤r≤p−4 are retained. Eigenvalues below verify the sign and exceptional endpoints. |
| 8.5 gluing lattice reduction/coinvariants | BHHMS23 lines 4101–4185, Theorem 7.3.3, pp. 82–83 | Reduction gives the displayed extension and K₁-coinvariants Pσ. The argument uses the adjoint contraction and pR⊂R₁⊕R₂, not a hypothetical K₁-invariant lift. |

### Computed adversarial table

Values were recomputed, including both sides of equalities and exceptional examples. “Retain” means no repair to that statement, not a formal proof by numerical testing. This table covers every seeded target, every headline and every mathematical target touched by a finding; remaining section checks are grouped only where they share the same construction.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result and change |
|---|---|---|---|
| §0.1 torsion admissibility | Trivial L/𝒪, ramification e; j=0,1,2 | Length of pʲ-torsion =0,e,2e; infinite direct sum of k has infinite invariant length | Retain. Finite length is over 𝒪 here, not over G. |
| §0.2 augmented algebra | H=1; H=S₃,U=1; H=ℚ_p,U=ℤ_p; discrete M=⊕ₙ𝔽_p, trivial Γ=ℤ_p | 𝒪; products (123) and (132); T acts by 0 on k[ℚ_p/ℤ_p]; M has infinitely many elements and is not compact, but its augmented action still has T=0 | Construction retained; R08 repairs the purported commuting countermodel and R11 repairs the compact/discrete contract. |
| §§0.3–0.5 presentation/coherence | Zero; I(σ); multiplication by T; G₀⊂G′ | Presentation sizes 0 and one compact generator; ker T=0; [G′:G₀]=2 | Retain. Smooth finite presentation is not abstract finite presentation over k[G]. |
| §0.6 Hom scalar extension | A=k, V=k²,W=k; infinite V and infinite scalar extension | Finite case: both Hom spaces have dimension 2 after extension. Infinite case: finite linear combinations of scalar coefficients cannot give a sequence of linearly independent coefficients | Retain finite generation. |
| §0.7 five-term criterion | A=B=0; D=E=0 | Middle term respectively ker(D→E), coker(A→B); the corresponding kernel/cokernel is finitely presented by coherence | Retain. |
| §0.8 obstruction | Identity I→I; augmentation I(1)→k | Δ=0 versus nonzero I₁-invariants; Δ=k and k^{I₁}=k | F01 repaired; admissibility separates the examples. |
| §§1.1–1.3 finite quotients/filtration | I(σ); I/(T−1) in reducible case; zero | Length ∞ versus 2; filtration step counts 1 and 0 | Retain; no finite-length conclusion for I itself. |
| §1.4 character separation | p=5, quadratic δ; order-four δ | Central multiplier δ(z²)=1 in first case; at z=2 it is 4 in second | R08. |
| §§1.5–1.6 headline criteria | π⊕π; trivial line; St; infinite sum St | (length,bound)=(2,2); (length,dual-dim)=(1,1),(1,0),(∞,0) | Retain finite generation; six-theorem table gives exact Lean coverage. |
| §2.1 ordinary normalization | χdet; upper principal series; zero | Contracting Hecke scalar qχ(det t)=0; Ord swaps (χ₁,χ₂) to (χ₂,χ₁); Ord(0)=0 | Mathematics retained; R06 ownership and R09 locator. |
| §2.2 general-F nilpotence | ℚ_p; unramified quadratic; ramified quadratic ϖ²=p | q/ϖ acts on 𝒪_F/p as 1,0,ϖ respectively; powers needed to vanish are none,1,2 | Vanishing distinction retained. |
| §2.2 arbitrary torus element | p=5, ϖ²=5, t=diag(2ϖ,1), ℓ(ϖ)=1 | Claimed evaluation 1; actual evaluation 3; both squared operators 0 | R02; revised q/(a/d) gives 3. |
| §2.3 obstruction criterion | Augmentation of compact induction; identity compact induction | Δ dimension 1 with finitely generated kernel; Δ dimension 0 for identity. Compact induction's invariant dimension is infinite | Criterion retained; identity cannot witness admissible length. |
| §§2.4–2.6 finiteness/counit | 0, character, St, induced U; Banach trivial lattice | Lengths 0,1,1; counit (ker,coker) dimensions (0,1),(1,0),(0,0); Banach σ=0 and cokernel 𝒪 of rank1 | Retain; R10 supplies continuous-induction API. |
| §3.1 depth/tensor weights | p=17,N=3,r=3,2; pair (5,0),(8,3); f=2 r=(5,6) | 3<4<14 true, 3<3 false; both differences 5, twist det³; dimension 6·7=42 | Formula retained; R09 locator. |
| §3.2 negative and cyclic coordinates | p=17,λ=(5,0),ω=−1,+1; f=2 λ=((5,0),(6,0)),ω=(1,0) | t(−1)=(0,−11), t(1)=(−1,−10); f=2 gives ((6,0),(−1,−10)), not the reversed pair | Retain successor parity and Euclidean division. |
| §3.3 change of origin | f=1,λ=(5,0),ω=1 then ω′=1 | New sign −1; new weight differs from λ by central (−16,−16), hence agrees modulo p−1=16 | Retain coordinate identity. |
| §3.3 Ext adjacency | p=2,f=1,ω=ω′=0; p=17 neighbours ±1 | Self Ext dimension 1 versus adjacency RHS0; generic neighbour dimensions 1=1 | R01. |
| §3.4 fundamental characters/tame weights | F=ℚ₅,k=𝔽₅,r=2; p=17,rλ=5 | Required image order24 versus available4; after coefficient extension 24 and norm order4. For the split tame shape the two weights have r=5,9 with determinant exponents0,6 | R03. |
| §3.5 Diamond socle | Empty socle; generic f=1 semisimple tame pair | D=0 for empty input; each generic box length2, total4 for two distinct socle weights | Retain maximal multiplicity-free object. |
| §4.1 dimension/growth | 0;k;C∞(ℤ_p^d,k) | Dimensions −∞,0,d; dual grades ∞,d,0; fixed dimensions in last case p^{rd}; alternative zero convention still gives max(0,0)=0 | Retain definition; R08 Check. |
| §4.2 central quotient | R=k[[x,y]], M=R/(x), central sequence x | grade_R M=1, dim R−grade=1; quotient support dimension=1 | Retain centrality and regularity. |
| §4.3 saturated valuation | u=[[1,1],[0,1]], l=[[1,0],[p,1]] | Weights 1/2,1/2; commutator [[1+p+p²,−p],[p²,1−p]] has weight1 | Retain; uniform weight-one model is wrong. |
| §4.4 graded algebra | f=1,2 | gr₁ dimensions2,4; gr₂ dimensions4,12; [eᵢ,fᵢ]=hᵢ≠0 | Retain noncommutative graded algebra. |
| §4.5 crossing quotient | J empty; one pair; two pairs | Krull dimensions0,1,2; X,Y nonzero with XY=0; mixed X₀Y₁ survives | Retain regular-sequence/Cohen–Macaulay claim. |
| §§4.6–4.7 Iwahori truncations | f=1, n=1,2,3; regular smooth functions | Truncation lengths1,3,7; Hom from Wχ,3 has dimension7 versus Hom from χ dimension1 for the regular function module | Retain the nonautomatic multiplicity hypothesis. |
| §5.1 character collisions | f=1,p=5 | α has order4, α²=α⁻²; the repeated character has multiplicity2 | Retain p>5 on multiplicity one. |
| §5.2 finite Borel digits | p=7,f=2,j=15=1+2p | Submodule length (1+1)(2+1)=6, not j+1=16 | Retain digit order. |
| §5.3 injective intervals | One, then two nonzero coordinates | Lower Boolean intervals have lengths2,4; two incomparable middles in second case | Retain multiplicity-free interval condition. |
| §5.4 projective lifting/reciprocity | Γ=C_p mixed characteristic; Γ=1,𝒪=𝔽₅[[t]] | Lift rank p=dim k[C_p]; ordinary multiplicities all1. Equal-characteristic inversion gives0 versus reduction multiplicity1 | R04–R05. |
| §5.5 adjoint tensor | p=17, r=5, f=1 | Symmetric-power dimensions4+6+8=18=3·6; projective dimensions34+34+34=102=3·34 | Retain depth bounds. |
| §5.6 first-order hull | f=1,2 | H¹(K₁/Z₁,k) dimensions3,6; first-order ambient length factor1+3f=4,7 | Retain self-extension exclusions. |
| §6.1 rectangles | All negative signs B=1; f=2 signs(+1,−1) | Length2^f; d=(0,1), required parities(odd,even); lower interval at (1,2) has6 constituents | Retain predecessor index. |
| §6.2 torsion cuts | f=1, all-negative B=3, r=5,p=17 | n=1 cut at1 gives2 constituents; n=2 cut at3 gives4 | Retain 2n−1, not n−1. |
| §§6.3–6.4 induced extension/boxes | f=1 two-character extension; ε=0, one or two nonzero entries | Induced length4 versus principal-series2; box lengths1,2,4 | Retain; R10 closes notation span. |
| §6.5 adjoint tensor | p=17,f=1,λ=(5,0),ε=−1 | D has dimensions6+12=18; tensor dimension54. Labels −3,…,2 have dimensions14,4,12,6,10,8 summing54; three graded boxes each have dimension18 | Retain the ordered filtration, not a direct sum. |
| §6.6 maximal enlargement | f=1,2 with full sign box | Lengths (f+1)2^f=4,12 versus original box lengths2,4 | Retain first-order enlargement. |
| §6.7 multiplicity-preserving enlargement | p=23,f=1,8-deep r=10; two tame weights with multiplicities2,1 | Each enlarged box has length4 and invariant box length2; total lengths12 and6. Coordinate labels are disjoint intervals −3…0 and1…4 | Retain multiplicities and eight-depth. |
| §§7.1–7.3 connectivity | {1,α²} versus {1,α,α²}; p=7,p=5 | First set misses the required middle α, second contains it; 2<r<p−3 gives r=3 at p7 and no r at p5 | Retain endpoint/depth hypotheses. |
| §7.4 Iwahori involution | w=[[0,1],[p,0]], g=[[a,b],[pc,d]] | wgw⁻¹=[[d,c],[pb,a]]; upper/lower characters swap; χ=χˢ is excluded where required | Retain normalization. |
| §§7.5–7.6 multiplicity/GK | multiplicity m; f=1,2 | Restriction preserves Hom dimension m, not merely1; GK upper bounds1,2 | Retain three local hypotheses; no claim of automatic equality. |
| §8.1 infinitesimal action | adjoint lattice, p odd; trivial lattice rank1 | β(e⊗f)=h, β(f⊗e)=−h, β(h⊗e)=2e. Trivial action gives0 and lengths1→2→1 | Retain bracket sign and coinvariants. |
| §8.2 preimage lattice | W=0, V₁=pV, rank n; W=V/pV | V₁/p²V=pV/p²V has length n; the wrong V₁/p²V₁=pV/p³V has length 2n; full W recovers V and original sequence | Retain denominator p²V. |
| §8.3 contraction | p=11,r=3; r=0 and r=p−2 | Eigenvalues −2r,4,2(r+2) are5,4,10; product of the three distinct eigenvalues2≠0. At excluded endpoints first/last eigenvalue0 | Retain automorphism range and sign. |
| §8.4 gluing lattice | f=1,2,rank P=d | Lattice ranks4d,7d; the congruence defining the diagonal has index (card k)^{3fd} | Retain diagonal congruence, not an arbitrary fiber-product isomorphism. |
| §8.5 reduction and coinvariants | f=1,dim P=d | Exact reduction dimensions0→3d→4d→d→0; K₁-coinvariants dimension d, whereas invariants contain a subspace of dimension3d | Retain coinvariants, not invariants. |
| §8.6 projective truncation | f=1,p=11,r=5 | Generic finite projective dim22; first radical truncation dim4·22=88 | Retain lattice/truncation identification. |
| §9.1 endomorphisms | f=1,2 | Dimensions2^f(f+1)=4,12; not squares of the full module dimensions | Retain commutativity as a substantive headline. |
| §§9.2–9.3 cyclic Hom/relative projectivity | τ=σ; Q=0, Q=σ, Q=Tσ | Right action is f·a=f∘a; Hom(Tσ,σ) has dimension1; zero Hom0; Q=Tσ recovers projectivity | Retain source-side action and quotient hypotheses. |

### Pinned declarations and duplication by object

The following declarations were opened, rather than relying on resolver names. Paths in this table are library-relative paths at the two manifest pins.

| Pinned file and line | What was verified and what it does not supply |
|---|---|
| `Mathlib/NumberTheory/LocalField/Basic.lean:46` | IsNonarchimedeanLocalField includes the compatible valuative topology, local compactness and nontrivial valuation. It is not a bare arbitrary topology. CharZero and residue CharP are additional explicit headline binders. |
| `Mathlib/RepresentationTheory/Induced.lean:59`, `:77` | IndV is the tensor coinvariant construction; ind acts by right inverse translation. Inverting the coset coordinate gives the usual left tensor model. It is compact induction for open subgroups, not smooth parabolic induction from a nonopen Borel. |
| `Mathlib/RepresentationTheory/Basic.lean:670`, `:679` | Representation.dual uses g⁻¹. It is the full dual action, not the smooth-vector submodule; taking open stabilisers is necessary in smoothDualSpan. |
| `Mathlib/RingTheory/FiniteLength.lean:76`, `:92` | Finite length iff Noetherian and Artinian; finite generation iff finite length under semisimplicity. Neither gives these GL₂ headlines: no Artinian or semisimple hypothesis is available on V. |
| `Mathlib/RingTheory/HopkinsLevitzki.lean:125` | The Artinian-ring finite-length equivalence needs an Artinian ring. The abstract group algebra of GL₂(ℚ_p)/p^ℤ is not such an input. |
| `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195` | Existing finite-over-Artinian cover theorem, with precisely the revised supplier hypotheses. |
| `TauCeti/Algebra/Module/Projective/Lift.lean:89` | Integral projective lifting already exists; R04. |
| `TauCeti/Algebra/Module/Projective/Reduction.lean:73` | Projectives with equivalent radical reductions are equivalent, under coatomic submodule hypotheses; finite modules satisfy them. R04. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:99`, `:322` | Level actions exist on quotients with an open normal kernel; the assembled module declaration requires a compact module. R11 supplies the discrete assembly step. |
| `TauCeti/Algebra/Module/Dual/ProjectiveInjective.lean:181` | Scalar duality exchanges finite-dimensional right projectives and left injectives with the displayed scalar pairing. The finite-dimensional algebra and module hypotheses are explicit. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328` | Positive continuous cohomology of coinduced discrete modules over a compact group vanishes. This supplies the new §2.2 route, not a claim about arbitrary noncompact cohomology. |

Also resolved/opened the README's native representation, stabilizer, intertwining kernel, bundled Rep, subrepresentation, finite-length, module-length, module-finiteness/torsion, dual/span, local-field residue/integer, quotient-topology, normal-closure, open-subgroup, polynomial/Krull-dimension and regular-sequence APIs, and the completed-group-algebra construction/action. None identifies ordinary module finite presentation with the smooth presentation used here. The object searches across the pins and the roadmaps found the lifting and ordinary-part duplications and the compact/discrete supplier mismatch above, but no prior owner of the augmented noncompact algebra, the local finite-length criteria, the explicit GL₂ box enlargement or the projective-cover gluing construction. Those remain appropriate ownership for this package.

### Supplier direction, gaps and open work

Every Needs line and supplier contract was read. The required dependency command returned exactly:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The command used this package's README, the supplied ORDER, `--movable`, and the pinned content checkout. The resolver reported no missing cross-roadmap citations; its library check was unavailable in that service, so the direct pinned reads and Lean runs above were used instead. Zero resolver results did not prevent the object-level findings R04, R06 and R07.

| Supplier | Sections/objects resolved at main or supplied head |
|---|---|
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4, SR.0d.1, SR.2.1: smoothness, admissibility, compact-open invariants, coefficient change, dual, injectives, smooth/compact induction, Frobenius reciprocity, exactness, Mackey filtration. The coinduced acyclicity is now separately pinned. |
| PadicLocalLanglandsForGL2Qp | §§0.1,0.3,2.1–2.3,2.7,2.9,5.1,5.3: Banach/Schikhof and torsion duality, fundamental characters, torsion categories, classification, nonpresentation away from ℚ_p, blocks and projective envelopes. The old six nonexistent names are gone. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.5.15 contains the five named Serre-weight/compact-induction/Hecke declarations and the nonzero-eigenvalue classification. The stronger invariant-codimension assertion is explicitly a gap. |
| PotentialAutomorphyInfrastructure | §3.7, transfer/localization; §3.12, derived comparison. This is distinct from the right-adjoint ownership conflict in R06. |
| NoncommutativeAndEquivariantIwasawa | §§0.3,0.5,0.7,0.8,0.10,0.11,0.13,F.1: open-subgroup algebra, graded transfer, saturated valuations, weighted grading, grade/canonical dimension and uniform cohomology. In particular −∞ for zero belongs to §0.11. |
| CompletedCohomologyPartII | F.1 Banach lattices and §5.8 dimension/growth comparison; finite-dimensional V gives constant growth p^{0r}=1, agreeing with the local convention. |
| DeformationAndDerivedPatchingAlgebra | §3.4 regular sequences/complete intersections; no nonexistent generic Cohen–Macaulay declaration is named. |
| SchemeAndStackFoundations | §0.17 depth/Cohen–Macaulay regular-sequence criterion; gives the crossing quotient's Cohen–Macaulay conclusion. |
| ClassFieldTheory | Layer 7, geometricArtinMap; inversion of arithmetic reciprocity is maintained. R03 supplies the missing extension field in its application. |
| RepresentationTheory/QuiverRepresentations | Layer 3 finite-dimensional algebra structure, covers, envelopes and radical/socle machinery. Its §3.1 explicitly points to ArtinAlgebras §2.3 for left/right duality; that main-branch section and the pinned scalar-dual projective/injective theorem were opened. Thus the duality has an earlier owner; it is not an unowned prerequisite. |

Both declared gaps are precise, single mathematical contracts, present under the same slugs in the plan's gaps array and README supplier subsections. Their suppliers precede this package. Neither is a replacement for an input already supplied at the reviewed locations:

- `ext1-finite-length-into-compact-induction`: the p=2,3 extension of DEG Lemma 4.2.1 belongs to PadicLocalLanglandsForGL2Qp §2.7; the package does not silently apply the p≥5 statement at small primes.
- `barthel-livne-finite-codimension`: the invariant-codimension input belongs to FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 and is explicitly contracted there, not asserted to exist today.

The board-package index was read before ownership conclusions. Open-head scopes and contracts of the closest supplied roadmaps were compared, including #1745 HilbertModularVarietiesAndShimuraCurvesPartII, #1312 PadicLocalLanglandsForGL2Qp, #1757 ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, #1688 SmoothRepresentationsOfLocalGroups and #1270 CompletedCohomologyAndLocalGlobalCompatibility. Further object searches located #1775 ModularCharactersAndBlocks. No conflicting edit of this roadmap, supplier ID dropped by an open revision, or citation depending only on an unnamed revision was found. R07 records the independently verified old consumer IDs that the overlap service did not report. The two major local endpoints are consumed by the global/tower roadmaps, not reowned by them.

## Not verifiable

- SERRE-LRFG, Part III Chapters 14–15: the manifest records this text as uncertified/paywalled. Its exact prose and numbering were not certified. No new request was made. The elementary counterexample in R05 and the pinned lifting theorem do not depend on access to this book.
- BARTHEL-LIVNE94, Proposition 18: the manifest records the source as waived. Its text was not read or re-requested. The corresponding assertion is a declared supplier contract, not an unconditional verification claim here.
- No additional missing source was identified; no source fetch or manifest rewrite was needed. The other cached sampled texts, including the author/preprint versions specified in their version notes, were readable. Source passages were not copied into the repository.
- Numerical and structural examples check the statements and conventions; they do not replace proofs of the six admitted Lean theorems. The build verifies elaboration only.

## Source issues

- **Error** in VIGNERAS11 at §5, Propositions 9–10, printed p. 22 (lines 827–842): the source says every generated smooth representation has nonzero obstruction containing the indicated invariants; it should require the admissible quotient hypotheses for these assertions; affects a stated result.
- **Gap** in CDN23 at Proposition 1.30(b), printed p. 21 (line 891): the source says the general-local-field Steinberg assertion follows from Emerton Theorem 4.2.12; it should supply a general-field cohomology argument because that theorem treats ℚ_p; affects the proof.
- **Misprint** in HU12 at proof of Proposition 4.4, printed p. 36 (line 1980): the source says the intersection of the positive cell with itself is finite-dimensional; it should use the positive and negative cells; affects the proof.
- **Error** in BHHMS23 at the sentence after equation (44), printed p. 55 (lines 2855–2856): the source says each nontrivial character occurs at most once; it should exclude p=5,f=1, where α²=α⁻² occurs twice; affects a stated result.
- **Misprint** in BHHMS23 at proof of Lemma 6.3.8, printed p. 64 (lines 3265–3266): the source says the Diamond box surjects onto its socle weight F(λ); it should surject onto its cosocle F(t_λ(Σ εᵢηᵢ)); affects the proof.
- **Misprint** in BHHMS23 at proof of Corollary 7.3.4, printed p. 84 (lines 4206–4208): the source says three projective-cover subscripts are K₁/Z₁; it should use K/Z₁ in those three places; affects the proof.
- **Misprint** in EMERTON2 at Theorem 4.2.12(3), printed p. 30 (line 1514): the source says the character's first ordinary cohomology is χ⊗χ; it should be χε⁻¹⊗χε, agreeing with Proposition 4.2.5; affects a stated result.
