<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13019#issuecomment-6849384314 -->
Red team round 2 pass a (claude) of a2f4542

Verdict: needs_changes

1. **F01** (P2) The product-group contract and the p=2 claims rest on a source lemma stated for odd residue characteristic

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:59` (gap:jr-product-base-change): "Prove Leslie25 Theorem 11.1, p. 78, for GL_m×GL_(m+1) in every m≥0 with its factor Ω, spherical base change and all nonreference-form zero components". Consumers: :708 (§4.4), :815 (§4.10, "residue characteristic two included"), :3 and :19.

   **Claim.** The cited theorem, as the source proves it, supplies §4.4 in every residue characteristic, so the three end theorems hold at dyadic places.

   **Witness.** Leslie25 line 3610–3628 (Lemma 10.6, p. 76) evaluates the unitary-period functional on the spherical vector as 1 through normalization (8.7); that value is Leslie25 line 2829 (Lemma 8.6, p. 61), stated only for odd residue characteristic. The proof of Theorem 11.1 applies Lemma 10.6 at the place under study (Leslie25 line 3689, line 4012).

   **Why it matters here.** The contract sentence does not say which residue characteristics it covers, and the Source corrections (E01–E17) do not record this gap. A supplier that proves the theorem as the source does delivers odd p only, and §§4.4–4.6, 4.10 then fail to reach p=2. Hironaka's unramified computation itself is valid at p=2 (Hironaka99 line 508), so the hypothesis is removable, but the removal has to be asked for.

   **Repair.**

   1. In README:59 and in the `needs` of `jr-product-base-change` in `design/plan.json`, replace "in every m≥0" by: "in every m≥0 and every residue characteristic, two included; in particular with the unramified evaluation of the local unitary-period functional on the spherical Whittaker vector (Leslie25 Lemma 8.6, p. 61) proved without its odd-residue-characteristic hypothesis".
   2. Add to Source corrections: "**E18 (gap), Leslie25, Lemma 10.6, p. 76, and Theorem 11.1, p. 78.** The spherical relative-character identity is applied at an arbitrary unramified place, but the evaluation it uses (Lemma 8.6, p. 61) is stated for odd residue characteristic. The dyadic case of Theorem 11.1, hence of Theorems 5.3, 3.5 and 2.12, needs that evaluation at p=2; gap:jr-product-base-change asks for it."
   3. Add "E18" to the Leslie25 `cited_for` list of `sources.toml`.

   Tested on the instance: F=ℚ₂, E=ℚ₂(ζ₃), n=1, m=0. The repaired contract covers this place; the unrepaired one, read as the source's proof, does not.

2. **F02** (P2) gap:hermitian-field-classification is false as worded at archimedean places

   **Location.** README:67: "Classify nondegenerate Hermitian spaces over every quadratic extension of characteristic-zero local fields by dimension and discriminant, including dyadic and ramified extensions".

   **Claim.** Dimension and discriminant classify Hermitian spaces over every quadratic extension of characteristic-zero local fields.

   **Witness.** ℂ/ℝ is such an extension. The forms diag(1,1) and diag(−1,−1) have dimension 2 and discriminant 1 in ℝ^×/N(ℂ^×), and signatures (2,0) and (0,2); they are not isometric. The README's own standing hypothesis (:15) is nonarchimedean; the contract sentence omits it.

   **Repair.** In README:67 and in the `needs` of `hermitian-field-classification` in `design/plan.json`, replace "characteristic-zero local fields" by "nonarchimedean local fields of characteristic zero". Tested: ℂ/ℝ is excluded; ℚ₂(√−1)/ℚ₂ (dyadic, ramified) and ℚ₃(√3)/ℚ₃ remain covered.

3. **F03** (P3) Three Layer 0–1 locators carry an odd-residue hypothesis the targets drop without saying so

   **Location.** README:205 (§0.5) "Leslie19, Lemmas 3.6 and 3.9, pp. 12–13"; README:256 (§0.8) "Leslie19, §3.2, pp. 12–13"; README:400 (§1.5) "Leslie19, … Proposition 4.5, p. 15".

   **Claim.** The cited statements support the targets in the étale setting, residue characteristic two and split E included.

   **Witness.** Leslie19 line 431 (opening of §3, p. 9) fixes a quadratic extension of local fields of odd residue characteristic for the section that contains Lemmas 3.6, 3.9 and §3.2. The targets are still true: the README's routes use only the geometric torsor, gap:hermitian-field-classification and Waldspurger's transfer in any residue characteristic.

   **Repair.** Add to Source corrections: "**E19 (scope), Leslie19, §3, p. 9.** The section assumes odd residue characteristic and a field extension. §§0.5, 0.8 and 1.5 here are stated in the étale setting in every residue characteristic; the routes given there replace the source's use of the hypothesis by gap:hermitian-field-classification (determinant classification of unitary H¹) and, for split E, by H¹(F,GL_n)=1." Add "Source corrections E19" to the Leslie19 `cited_for` list. Tested: rank one, F=ℚ₂, E unramified: H¹(F,U(1))=F^×/N(E^×) has order 2 and the determinant map on it is the identity, so the two kernel conditions of §0.5 agree.

4. **F04** (P3) The Layer 1 example does not fix the source spaces, and V_a, V_b are used before they are defined

   **Location.** README:414: "Every source contraction has determinant of even valuation … Hence no source orbit matches"; README:307 (§1.1, étale setting): "(U(V_a)×U(V_b),s,ξ) for U(W₁)".

   **Claim.** For the label (π,1) no source orbit matches.

   **Witness.** Layer 1 allows any W₁,W₂. Take W₁=V₂ and W₂=(E²,diag(1,π)), X=I₂: X^τ=diag(1,π⁻¹), r₁(X)=−diag(1,π⁻¹), determinant valuation −1, odd; this contraction matches a (π,1)-label target. The sentence holds only for W₁=W₂=V₂. Separately, :19 defines V_n=(E^n,I_n) in the unramified setting only, while §1.1 uses V_a,V_b in the étale setting (the source defines them there: Leslie25 line 511).

   **Repair.** In README:414 replace "the four relative data on one ordinary datum have labels" by "with source spaces W₁=W₂=V₂, the four relative data on one ordinary datum have labels". In README:21 add: "V_n=(E^n,I_n) denotes the identity form in every setting." Tested: with W₁=W₂=V₂, det r₁(X)=N(det X) has even valuation for every invertible X, and the example's conclusion holds.

Two P2 findings (S01, S02) and two P3 findings (S03, S04). All nine round-1 findings are repaired at this head and no repair introduced an error. No finding re-raises one that a repair report marked `not actionable in this package`.

## Round-1 findings at this head

| Round-1 finding | Status | Witness at a2f4542 (`packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`) |
|---|---|---|
| 1a/F01 (P1) unmatched vanishing at colliding spectra | repaired | :376 "SRO(f_Ξ,δ_H)=0 for every source-regular δ_H (§1.2) with no regular source match"; :329 defines source-regular by D_ab≠0; :394 and :826 carry the collision Check. Recomputed below (rows 1–3). |
| 1a/F02 (P1) Tate continuation unowned | repaired | :97 contract "Consume AL.1.1.2 … AL.1.2.1 … and AL.1.2.3"; :536 *Needs* lists them and the two Tau Ceti declarations. Sections exist at the supplier's head (lines 684, 788, 820) with unit volume for O^×. |
| 1a/F03 (P3) analytic implicit theorem | repaired | :45 "Consume `ImplicitFunctionData.analyticAt_implicitFunction`"; :221 *Needs*; :223 route. Declaration at `TauCeti/Analysis/Analytic/Inverse.lean:131`, hypotheses as described. |
| 1b/F01 (P2) BC_n attributed to §4.9(b) | repaired | :452 "define BC_m:H_m,E→H_m,F as the unique complex-algebra homomorphism whose composite with the normalized Satake isomorphisms … is the substitution Z_i↦T_i²"; §4.9 no longer in any *Needs*. |
| 1b/F02 (P2) compound gap clause | repaired | :53 "the transfer relations (4.3) and (4.7) as relations between test functions"; :55 maps parts to consumers. Each named consumer's *Needs* line carries the gap (checked §§3.1–3.8, 4.3–4.5); same sentence in `design/plan.json`. |
| 1b/F03 (P3) two-space adjoint | repaired | :127 "X^τ is the W₁→W₂ block of `signedHermitianAdjoint` applied to the endomorphism (v₁,v₂)↦(Xv₂,0)"; :135 uniqueness and involutivity; :143 Check. |
| 1b/F04 (P3) r₊, r₋ before definition | repaired | :31 "r₁(c)=−N(c)=1, the value at 1 of the unsigned Gram map z↦N(z) (the map r₊ of §4.1)". |
| 1b/F05 (P3) cutoff at non-regular invertible T | repaired | :260 "chooses a compact open neighbourhood B of T inside the invertible locus of Herm(W₁) and replaces f by f·1_(r₁⁻¹(B))"; :275 Check at −I₂ (recomputed, row 9). |
| 1b/F06 (P3) "even-valuation source contraction" | repaired | :414 "Every source contraction has determinant of even valuation, although its eigenvalues may each have odd valuation". The example still leaves the source spaces implicit: S04. |

## Verified sound

**Counts.** `Suggested.lean` declarations read: 0 (38 lines read; the file declares nothing). README targets read: 36 numbered subsections, with Conventions, the nine supplier-contract subsections, the Examples, Source corrections E01–E17 and References (all 920 lines). Locators verified against the cached texts: 21. Checks tested with recomputed values: 46 (table below). Sibling citations checked at their heads or on main: 27 sections and 8 declaration names. Pinned declarations checked: 13.

**Suggested.lean.** One `import Mathlib`, one module docstring in the required form, an empty namespace; no `set_option`, no `sorry`, no declaration, so the `#check @name` comparison is vacuous and nothing is padding. The five headlines of the README (§§4.10, 4.6, 4.4, 2.3, 5.1) are each named in the docstring with the missing carriers. I found none statable at the pins without an ad hoc encoding: each needs orbital integrals on p-adic unitary or general linear groups, or the analytic spherical Hecke algebra with its Satake transform; `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean` is the arithmetic ring over ℤ.

**Adversarial table** (values computed on each side).

| # | Statement | Instance | Values | Result |
|---|---|---|---|---|
| 1 | §1.4 zero clause (repaired) | a=b=1, labels (1,1), target (c,c), N(c)=−1 | contraction (1,1), D_ab=0; not source-regular; SRO(1⊗1)=1, untested | no contradiction with §4.10 |
| 2 | §4.10 Check :826 | target (1,1+π); source y=diag(1,1+π) | self-dual O_E[y]-stable lattices: 1 on the (1,1) orbit, q+1 on the (π,π) orbit; O^κ=1−(q+1)=−q; 1=(−q⁻¹)(−q) | holds |
| 3 | §4.10 at label (π,π) | y=diag(π,πu), u≢1 mod π; Φ_2,2=e_(2,0)+(q+1)e_(1,1) | orbit (1,1): one lattice of type (1,1), weight q+1; orbit (π,π): q+1 lattices of type (2,0), weight 1; O^κ=(q+1)−(q+1)=0 | zero target correct |
| 4 | Conventions: X^τ rank one | ⟨a₁⟩,⟨a₂⟩, X=z | conj(zv)a₁w=conj(v)a₂·(a₁/a₂)z̄w | holds |
| 5 | §0.1 split adjoint | X=(A,B) | h₁(Xv,w)=(ℓ(Bw₁),m(Av₂))=h₂(v,(B,A)w) | (A,B)^τ=(B,A) |
| 6 | §0.4 block charpoly | general | det[[T,−X],[X^τ,T]]=det(T²+XX^τ)=charpoly(r₁)(T²) | holds |
| 7 | §0.5 image Ω | y=−XX^τ | −h₁(Xv,y⁻¹Xw)=h₁(Xv,(X^τ)⁻¹w)=h₂(v,w) | holds |
| 8 | §0.5 inverse stabilizer | t commuting with XX^τ | (X⁻¹tX)^τ=X^τt⁻¹(X^τ)⁻¹=X⁻¹t⁻¹X | lands in U(W₂) |
| 9 | §0.8 Check :275 | T′∈−I₂+πHerm₂(O_E) | −T′ unimodular, so XX* with X∈K; L=Λ, overlattice count 1 | r_!f≡1 near −I₂ |
| 10 | §1.2 Check | x−y=π, unramified | η(π)q⁻¹=−q⁻¹; η(−π)=η(π) since η(−1)=1 | holds |
| 11 | §1.3 basepoint | values 2, 5 | 5−2=3=(−1)⁻¹(−3) | holds; matches supplier §2.4 |
| 12 | §1.5 route | cutoff 1_B∘χ on target | SO scales by 1_B(χ); O^κ(r_!f,·)=0 off χ(supp r_!f)⊂B | identities preserved |
| 13 | §2.2 Check :472 | n=2 | q(Z₁+Z₂)↦q(T₁²+T₂²)=Sat(T_(2,0))−(q−1)T₁T₂ | holds |
| 14 | §2.2 ξ_F | definition | \|det m₁\|^(b/2)\|det m₂\|^(a/2)δ_P^(1/2)=\|det m₁\|^b | holds |
| 15 | §2.3 measure | y↦gyg* | dy scales by \|N det g\|_F^n; \|det y\|^(−n) by its inverse | invariant |
| 16 | §2.3 orbit volume :501 | π^(1,0), n=2 | dy-volumes (q²+1)(q−1)/q³ for K∗I and (q²+1)(q−1)²/q⁵ for K∗π^(1,0); weight q²; ratio q−1 | holds |
| 17 | §2.3 Check :502 | e_(2,0)+(q+1)e_(1,1) | q(U₁²+U₂²)+(q+1)U₁U₂−(q+1)U₁U₂=q(U₁²+U₂²) | equals BC₂(T_(1,0),E) |
| 18 | §2.3 sign rule | ê_j, ê_(1,1), ê_(2,2), ê_(1,0) | (−1)^j, −, +, +: sign (−1)^(Σ(n+1−i)λ_i) in each | consistent |
| 19 | §2.3 freeness | n | ℂ[U^±] free of rank n! over invariants and 2^n over ℂ[U^(±2)]; ratio 2^n | holds |
| 20 | §3.2 coset invariance | t₀∈T | factors outside S₁: η∘N trivial, vector zero; factors in S₁: \|t₀\|^(∓s)→1 at s=0 | well defined |
| 21 | §3.2 Checks | 1_(O^×), 1_(πO^×), 1_O | 1, −1, 1/(1+q^(−s))→1/2 | holds |
| 22 | §3.2 scaling | v=π | Σ_(k≥−1)(−q^(−s))^k→−1/2=η(π)·1/2 | holds |
| 23 | §3.3 rank one | Σ={1}; Σ=∅ | 1/2=½(1+0); 1/2=½(1−0) | holds |
| 24 | §3.4 descent | spherical φ | ∫φ([[m₁,u],[0,m₂]])du=\|det m₁\|^b∫_Nφ(mn)dn | equals ξ_F(φ) |
| 25 | §3.5 off-block map | u↦x_au−ux_b | determinant ∏(λ_a−λ_b)=D_ab; g=knm has measure dk dn dm | factor \|D_ab\|⁻¹ |
| 26 | §3.5 fixed vectors | (v_a,0), (0,v_b*) | n(v_a,0)=(v_a,0); (0,w)n⁻¹=(0,w) | holds |
| 27 | §3.5 Check :603 | ℚ₃(√3), x=diag(0,1), v=(1,1) | det[[1,0],[1,1]]=1; η((−1)(−1))=1 | holds |
| 28 | §3.5 Check :605 | a=2, b=1 | det[[1,0,2],[0,1,0],[1,1,1]]=−1; D_ab=(√2−1)(−√2−1)=−1 | holds |
| 29 | §3.5 coset Check | g=diag(3,3,1) | vector e₁: values 1, 0; vector 0: 0, 0; test 1_(3ℤ₃³): 1, 1 | holds |
| 30 | §3.8 generation | t∈π⁻¹O_F | n(π⁻¹), wn(π)w⁻¹ give diag(π⁻¹,π); conjugation scales t by π⁻² | all n(t) reached |
| 31 | §4.1 | −(cX)(cX)* | −N(c)XX*=XX* | holds |
| 32 | §4.2 | y=XX* | {g: g⁻¹∗y∈K∗I}=X·U·K; measure ∫_Uφ(Xu)du | holds |
| 33 | §4.3 | Φ=1_K⊗φ | ∫_(K_m)φ(diag(h⁻¹,1)g)dh=φ(g) | holds |
| 34 | §4.7 overlattice bijection | T=xx*, L=x*Λ | xhΛ⊆Λ ⟺ hΛ⊆L∨ ⟺ L⊆hΛ | holds |
| 35 | §4.7 self-density | n=1; general | 1+q⁻¹; #U_n(𝔽_q)/q^(n²)=∏(1−(−q)^(−j)) | positive |
| 36 | §4.7 Check :770 | Gram πI₂ | q+1 isotropic lines in k_E² | holds |
| 37 | §4.8 | n=2, d=1; exponents | q(Z₁+Z₂); d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | holds |
| 38 | §4.9 image decomposition | diag(x,y)∈Ω(V_n,V_n) | iff disc(α)disc(β) is a norm; (π,π) targets are matched (row 3) | consistent |
| 39 | §5.1 Checks | e_(1,0), e_(1,1), e_(2,2) | −(e₁⊗e₀+e₀⊗e₁); −q⁻¹e₁⊗e₁; q⁻²e₂⊗e₂ | holds |
| 40 | §5.1 Check :861 | 1_(πK)∗e_0 | (q⁻ᵇ)^a(q⁻ᵃ)^b=q^(−2ab) | holds |
| 41 | Layer 4 example | Φ_2,2 | q(T₁²+T₂²)↦q(q^(−1/2)X)²+q(q^(−1/2)Y)²=X²+Y² | holds |
| 42 | Conventions Check :32 | ℚ₃(√3) | (−1,3)₃=(−1/3)=−1 | holds |
| 43 | §4.1 Check :674 | ℚ₃(√3) | N(a+b√3)≡a² mod 3; −1≡2 | no such c |
| 44 | gap:hermitian-field-classification | ℂ/ℝ | diag(1,1), diag(−1,−1): same dimension and discriminant | S02 |
| 45 | Layer 1 example | W₂=diag(1,π), X=I | det r₁=π⁻¹ up to sign, odd valuation | S04 |
| 46 | gap:unramified-unit-vector-transitivity | unit w, w′ | Λ=O_Ew⊕w^⊥, complements self-dual of rank n−1 | follows from the lattice-orbits gap; see note |

**Suppliers at their current heads.** EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.4, 1.5, 1.14, 1.17, 2.1, 2.4 (basepoint law κ(inv)⁻¹), 2.9, 2.11 (strongly G-regular), 2.12 (unramified, p odd, as the README says), 3.3, 4.7, 4.9; GeometryOfNumbersAndQuadraticArithmetic §2.7 (`IntegralHermitianLattice.ofCarrier`), §2.9 (`SignedHermitianSpace`, `signedHermitianAdjoint`, `_comp`, `_involutive`; endomorphisms of one space), §3.2 (unramified, dyadic allowed; Hironaka's U(2n)/(U(n)×U(n)) functions); AdelicAlgebraicGroups §2.2 (*quotient-measure*); AutomorphicLFunctionsAndLocalFactors AL.1.1.2, AL.1.2.1, AL.1.2.3; SmoothRepresentationsOfLocalGroups SR.4.1, SR.4.3 (*parabolic-descent*, GL_n(E) only, dual embedding diag(q⁻ᵇm₁,q⁻ᵃm₂)); MetaplecticAutomorphicForms §§2.1, 2.5, 3.2a (`splitHermitianOscillator`, pairing (ℓ(y),εk(x)), GL(A)); ReductiveGroupsPartII RG2.0 and SchemeAndStackFoundations §1.24 on main. All present with the cited content. GanGrossPrasadUnitaryGroups is later in the order and is named only as a consumer of the base roadmap; its README does not name this roadmap.

**Pins.** `Matrix.conjTranspose`, `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self` (Hermitian.lean:286), `Matrix.isHermitian_conjTranspose_mul_self` (:290), `Matrix.charpoly_mul_comm` (Charpoly/Basic.lean:279), `MvPolynomial.hsymm` (Symmetric/Defs.lean:312), `MvPolynomial.bind₁` (Monad.lean:67), `HasStrictFDerivAt.implicitFunction` (Implicit.lean:465), `HasStrictFDerivAt.implicitFunctionDataOfComplemented` (:321); `TauCeti.map_normUnits_unitFiltration` (Unramified/Basic.lean:126), `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (:158), `ImplicitFunctionData.analyticAt_implicitFunction` (Analytic/Inverse.lean:131), `TauCeti.ClassFieldTheory.artinMap_norm` (Local/ArtinMap.lean:345), `TauCeti.index_normGroup_of_isCyclic` (Brauer/LocalH2Bound.lean:70). Statements agree with the README's descriptions.

**Declared gaps.** Seven slugs; each `needs` sentence of `design/plan.json` occurs verbatim in the README under its supplier. Five are precise and are not raised; two are S01 and S02. Note, not a finding: gap:unramified-unit-vector-transitivity follows from gap:unramified-hermitian-lattice-orbits by the projector argument the README already gives at :88 and :642 (table row 46), so one supplier theorem discharges both.

**Locators verified.** Leslie25 Lemma 2.5 (line 657), §2.2.3 and (2.7) (lines 749–794), §2.3 (line 801), Definition 2.10 (line 842), Theorem 2.12 (line 873), Lemmas 3.1–3.2 (lines 961, 999), (3.7) and Proposition 3.4 (lines 1123, 1140), Theorem 3.5 and Remarks 3.6–3.7 (lines 1153–1180), (3.8), Lemma 3.8, Remark 3.9, Corollary 3.10, Lemma 3.11 (lines 1197–1259), Proposition 5.1 (line 1910), Proposition 5.2 (line 1920), Theorem 5.3 (line 2000), Theorem 11.1 (line 3696); Leslie19 Definition 1.2, Proposition 1.3, Conjecture 4.4, Proposition 4.5 (lines 164, 174, 693, 699); Hironaka99 (2.2)–(2.3) (lines 499–517), Theorem 1 (line 633), (2.5)–(2.7) and Theorem 2 (lines 688–720), validity at p=2 (line 508). Pages agree with the README.

**Policy.** `git diff --stat origin/main...HEAD` touches only files of this package folder. No pull-request numbers, no process narrative, no `lemma`, no `set_option`, no algorithm in the README or the Lean file; every target has a locator; no layer is named after a source chapter.

**Ownership.** The overlap list names no second copy, no dropped id and no other pull request changing this roadmap. The closest open roadmaps (GanGrossPrasadUnitaryGroups, the base roadmap, AutomorphicLFunctionsAndLocalFactorsPartII, MetaplecticAutomorphicForms, ExceptionalThetaCorrespondencesForG2) were compared in round 1; BC_n and the two-space adjoint, which this roadmap now owns, were searched by the repair with `roadmaps grep` and I did not repeat that search. GeometryOfNumbersAndQuadraticArithmeticPartII (later in the order) does not state the dyadic Hermitian field classification, so that gap has no second owner.

**Dependency check** (command of the brief, run unchanged):

```text
depcheck: 206 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Not verifiable

- Hironaka99 Theorem 1 and (2.5)–(2.6): the cached text is OCR and the exponent of the sign and the normalizing constants are illegible (Hironaka99 lines 633–641, 687–699). The README's rank-one and rank-two values are mutually consistent and consistent with the module law and (2.7) (rows 16–18); the printed formula was not read.
- FLO12 Lemma 3.9, the origin of the odd-residue hypothesis in S01, is not among the cached sources. S01 relies on the hypothesis as Leslie25 itself states it (line 2829); whether FLO12's proof needs it was not checked.
- The normalization of the representation density in GeometryOfNumbersAndQuadraticArithmetic §3.2 against m₀ (§4.7) was checked only at n=1 and through the self-density formula.
- The three Jacquet–Rallis gaps and the proof of Leslie25 Theorem 11.1 beyond the dependence in S01: the supplier sections do not exist yet.
- No Lean was run: the file declares nothing.

## Source issues

- **Gap** in Leslie25 at Lemma 10.6, printed p. 76, and Theorem 11.1, printed p. 78: the source says the spherical relative-character identity holds at every unramified place; it should either assume odd residue characteristic or prove Lemma 8.6 without that hypothesis; affects a stated result.
- **Gap** in Leslie25 at Definition 2.10, printed p. 21: the source says every unmatched regular target has zero stable integral; it should restrict the clause to targets whose two blocks have disjoint spectra; affects a stated result.
- **Gap** in Leslie19 at Definition 1.2, printed p. 4: the source says every unmatched target has zero stable relative orbital integral; it should restrict to targets with disjoint contracted block spectra; affects a stated result.
- **Error** in Leslie25 at §2.3, printed p. 20: the source says there are two Hermitian orbit representatives in every rank; it should be one at rank zero; affects nothing.
- **Misprint** in Leslie25 at the paragraph before §3.1, printed p. 22: the source says the reduction is an unresolved proposition label; it should be Proposition 3.12; affects nothing.
- **Misprint** in Leslie25 at Lemma 3.1, printed p. 23: the source says the modular character of the E-parabolic uses the absolute value of F; it should use the normalized absolute value of E; affects nothing.
- **Error** in Leslie25 at §3.3, printed p. 28: the source says the contracted lattice function, extended by zero off the regular image, is locally constant; it should be defined by fibre integration on the whole invertible image; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a2f4542d3301443f0381e96ee110401e5e9a9a62", "job": "RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a", "model": "fable", "worker": "chris-x16"} -->
