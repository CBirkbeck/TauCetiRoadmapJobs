<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13019#issuecomment-6792212196 -->
Red team round 1 pass b (claude) of 2131a2b

Verdict: needs_changes

1. **F01** (P2) The base-change homomorphism BC_n is attributed to a supplier section that never defines it

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:437` (§2.2): "BC_n is unramified base change of EndoscopicTransferAndUnitaryTraceComparison §4.9(b), which on normalized Satake variables sends each Z_i to T_i²". Same attribution at README:47 ("§4.9(b) (unramified spherical base change for GL_n)") and in the *Needs:* lines of §§2.2, 2.3, 3.6, 4.3.

   **Claim.** §4.9(b) of the base roadmap supplies the algebra homomorphism BC_n:H_n,E→H_n,F together with its Satake description Z_i↦T_i².

   **Witness.** EndoscopicTransferAndUnitaryTraceComparison README (open head), §4.9(b), line 1915: it states only that `f_E` and "its base-change image `b_{E/F}(f_E)`" are associated (an orbital-integral identity). The map `b_{E/F}` is used there without a definition, and no Satake formula occurs in §4.9. A search of every roadmap on main and at the open heads for a definition of the spherical base-change homomorphism finds no other owner. Every Layer 2, 4 and 5 statement here (the square of §2.2, H_n(φ∗f)=BC_n(φ)∗H_n(f), the Check BC(T_(1,0),E)=T_(2,0),F−(q−1)T_(1,1),F) uses the Satake formula, not the orbital identity.

   **Repair.** Define the map in §2.2 and keep §4.9(b) only as the name of the same object. Replace the clause quoted above by:

   > "BC_n:H_n,E→H_n,F is defined here as the unique complex-algebra homomorphism whose normalized Satake transform (SmoothRepresentationsOfLocalGroups §SR.4.1, over E and over F) is the substitution Z_i↦T_i²; it is well defined because that substitution maps symmetric Laurent polynomials in Z to symmetric Laurent polynomials in T, and it is injective. For G₀=GL_n and E/F unramified quadratic it is the map written b_(E/F) in EndoscopicTransferAndUnitaryTraceComparison §4.9(b); the orbital-integral association proved there is not used in this roadmap."

   and add the API bullet "BC_n is a unital injective algebra homomorphism; BC_1(1_(π^dO_E^×))=1_(π^(2d)O_F^×)". In README:47 replace "§4.9(b) (unramified spherical base change for GL_n)" by "§4.9(b) (only to identify the base-change map BC_n defined in §2.2 with its b_(E/F))". Tested on the instance: with this definition Sat_E(T_(1,0),E)=q(Z₁+Z₂)↦q(T₁²+T₂²)=Sat_F(T_(2,0),F)−(q−1)T₁T₂, the value of the existing Check at README:455, and BC_1(1_(π^dO_E^×)) has Satake transform T^(2d), the value used at README:698.

2. **F02** (P2) gap:jr-local-comparison is compound, and one of its clauses has no consumer

   **Location.** README:49: "Supply the augmented and block/group Jacquet–Rallis invariant quotients, regular matching across all pure forms, η(det)-twisted orbital distributions, the cyclic factors (4.1) and (4.6), local smooth transfer with partial Fourier compatibility, and the product-to-conjugation identities (7.5)–(7.7), …".

   **Claim.** One precise contract.

   **Witness.** The sentence bundles six separate targets with different consumers (matching: §3.1; orbital distributions and the factor (4.1): §§3.2–3.3; factor (4.6): §4.4; identities (7.5)–(7.7): §4.3). The clause "local smooth transfer with partial Fourier compatibility" is ambiguous between the transfer *relations* (Leslie25 (4.3), line 1455, and (4.7), line 1524) and the *existence* theorem (Leslie25 Theorem 4.2, line 1534). "partial Fourier" occurs nowhere else in the README; every consumer (§§3.3, 3.6, 3.8, 4.5) takes "are Jacquet–Rallis transfers" as a hypothesis on named test functions and never invokes existence of a transfer or its Fourier compatibility.

   **Repair.** The slug and the plan's `needs` sentence stay; add directly after README:49 the scoping sentence, and make each consumer name the part it uses:

   > "Of this contract, the roadmap consumes: the invariant quotients and regular matching across both forms (§3.1); the η(det)-twisted orbital distributions with the factor (4.1) and the transfer relation (4.3) as a relation between test functions (§§3.2, 3.3, 3.6, 3.8, 4.5); the block relation (4.7) with the factor (4.6) (§§3.8, 4.4); and the identities (7.5)–(7.7) with Definition 7.4 (§4.3). The existence of Jacquet–Rallis smooth transfer (Leslie25 Theorem 4.2, p. 34) and its compatibility with the partial Fourier transform are not consumed by any target here."

   If the maintainer prefers minimality over an unchanged sentence, the alternative is to delete the words "local smooth transfer with partial Fourier compatibility" from the README and from the plan's `gaps` entry and replace them by "the transfer relations (4.3) and (4.7)". Tested on the instance: §3.3 at README:539 ("Suppose f and the family {f_V} are augmented Jacquet–Rallis transfers") needs only relation (4.3).

3. **F03** (P3) The two-space adjoint X^τ is attributed to a supplier declaration that is an endomorphism adjoint

   **Location.** README:117 (§0.1): "For nonsplit E the carrier is `SignedHermitianSpace` of GeometryOfNumbersAndQuadraticArithmetic §2.9 with its adjoint." Also README:59 and the *Needs:* line README:119.

   **Claim.** `signedHermitianAdjoint` supplies X^τ:W₁→W₂ for X∈Hom_E(W₂,W₁), with h₁(Xv,w)=h₂(v,X^τw).

   **Witness.** GeometryOfNumbersAndQuadraticArithmetic README (open head), §2.9, line 774: `signedHermitianAdjoint` is "characterized by h(av,w)=h(v,a*w)" for an endomorphism a of one space V, with `_id`, `_comp`, `_involutive`. No adjoint between two different Hermitian spaces is stated there, and this README has no target constructing it.

   **Repair.** Add to §0.1, after the sentence quoted, and as a first API bullet:

   > "The adjoint between two spaces is constructed here from the supplier's endomorphism adjoint: on the orthogonal sum W=W₁⊕W₂ with form h₁⊕h₂, X^τ is the W₁→W₂ block of `signedHermitianAdjoint` applied to the endomorphism (v₁,v₂)↦(Xv₂,0). It is the unique E-linear map with h₁(Xv,w)=h₂(v,X^τw); (X^τ)^τ=X and (g₁Xg₂⁻¹)^τ=g₂X^τg₁⁻¹ follow from `signedHermitianAdjoint_involutive` and `signedHermitianAdjoint_comp`."

   Tested on the instance: for W_i=⟨a_i⟩ and X=z, h(A(v₁,v₂),(w₁,w₂))=conj(zv₂)a₁w₁=conj(v₂)a₂·((a₁/a₂)z̄w₁), so the block is (a₁/a₂)z̄, the value in the Conventions (README:23).

4. **F04** (P3) The Conventions Check uses r₊ and r₋ before they are defined

   **Location.** README:31: "A unit c with N(c)=−1 gives r₋(c)=1=r₊(1)".

   **Claim.** A Check on the conventions of README:23, which define only r₁ and r₂.

   **Witness.** r₊ and r₋ are introduced at README:646 (§4.1), in reference coordinates and in the unramified setting only; at README:31 they are undefined symbols (the Conventions section is the étale setting).

   **Repair.** Replace the sentence by: "In the unramified setting a unit c with N(c)=−1 gives r₁(c)=−N(c)=1, the value at 1 of the unsigned Gram map z↦N(z) (the map r₊ of §4.1); such a unit exists in every residue characteristic, including two." Tested: r₁(c)=−(a₁/a₂)N(c) with a₁=a₂=1 is −(−1)=1.

5. **F05** (P3) §0.8 proves local constancy on the invertible locus with a cutoff that exists only at regular orbits

   **Location.** README:248 (§0.8 proof route): "treats arbitrary f by the orbitwise cutoff of §0.6".

   **Claim.** The cutoff of §0.6 gives local constancy of r_!f at every invertible T for arbitrary f∈C_c^∞(Hom_E(W₂,W₁)).

   **Witness.** The cutoff of §0.6 (README:207, 211) is built for "every closed regular orbit O" from a compact open set of separable characteristic polynomials. For n=2, standard forms and T=r₁(I₂)=−I₂, T is invertible and not regular, so §0.6 provides no cutoff at T, although the statement at README:244 claims local constancy on the whole invertible locus.

   **Repair.** Replace the clause by: "and treats arbitrary f at an invertible T by the cutoff f·1_(r₁⁻¹(B)), with B a compact open neighbourhood of T in Herm(W₁)^inv: its support is a closed subset of supp f on which det r₁ is bounded away from 0, so it is compactly supported in the invertible Hom locus, and it has the same fibre integrals as f over B; the regular-orbit cutoff of §0.6 is needed only in §0.9." Tested on the instance: f=1_(M₂(O_E)), T=−I₂, B=−I₂+π·Herm₂(O_E) gives r₁⁻¹(B)∩supp f ⊂ GL₂(O_E), compact in the invertible locus.

6. **F06** (P3) Layer 1 Example: "even-valuation source contraction" is wrong eigenvalue by eigenvalue

   **Location.** README:399: "so it lies outside the image of every even-valuation source contraction".

   **Claim.** Source contractions have even valuations.

   **Witness.** For standard rank-two forms and a unit u≠1, y=diag(π,πu) lies in Ω(W₁,W₂): the form −h₁(·,y⁻¹·) has determinant π⁻²u⁻¹, of even valuation, hence is isometric to the standard form. Its eigenvalues have odd valuation. Only the determinant valuation is even, as §4.9 says correctly at README:791.

   **Repair.** Replace the clause by: "so its determinant has odd valuation, whereas every source contraction has determinant of even valuation (its eigenvalues may each have odd valuation, as for diag(π,πu)); no source orbit matches". Tested: label (π,1) gives v(xy) odd; label (π,π) gives v(xy) even and does match diag(x,y) with both valuations odd.

Two P2 findings (R01, R02) and four P3 findings (R03–R06). No statement of the README was found false; the findings are supplier citations that attribute to a supplier something it does not state, one compound gap sentence, and three local wording or proof-route defects. None re-raises a finding that a repair report marked `not actionable in this package`.

## Verified sound

**Counts.** Suggested.lean declarations read: 0 (the file states nothing; docstring read in full). README targets read: 36 (§§0.1–0.9, 1.1–1.5, 2.1–2.3, 3.1–3.8, 4.1–4.10, 5.1), plus Conventions, supplier contracts, Examples, Source corrections. Locators: every theorem, proposition, lemma, definition, remark, section and numbered-equation locator in the target citations and the gap sentences was compared with the page markers and headings of the cached texts of the five sources (Leslie25, Leslie19, Xiao18, BP21, Hironaka99); all pages agree. The statements behind Leslie25 Definition 2.10, Theorems 2.12, 3.5, 4.7, 5.3, 11.1, Propositions 4.8 and 5.2, Lemmas 2.7 and 4.6, §§2.3 and 11.2, Xiao18 §2.1, Lemma 4.6, Theorem 4.7 and Lemma 5.1, BP21 Lemma 1 and Proposition 1, and Leslie19 Lemma 4.6 were read in full. Checks: all 135 Check bullets read; the 37 rows of the table below record the values recomputed for those that pin a convention, a formula or a theorem. Sibling citations checked at their current heads or on main: 23 sections and 9 declaration names. Pinned declarations checked: 9 Mathlib, 2 Tau Ceti, 1 Tau Ceti file path.

**Suggested.lean.** One `import Mathlib`, one module docstring in the required form, an empty namespace, no `set_option`, no declaration. The `#check @name` comparison is vacuous (no declaration), and nothing is padding. Headlines listed in the docstring: Theorem 2.12 (§4.10), Theorem 3.5 (§4.6), Theorem 5.3 (§4.4), Hironaka's isomorphism (§2.3), the Layer 5 operator (§5.1); these are the README's end theorems. Each needs orbital integrals on p-adic unitary or general linear groups with normalized Haar measures, or analytic spherical Hecke algebras; the pinned Tau Ceti Hecke rings (`TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean`, present) are the arithmetic ones. I found no headline statable at the pins without an ad hoc encoding. Lean names in the README are suppliers' or library names only; the lead `IntegralHermitianLattice.ofCarrier` resolves at GeometryOfNumbersAndQuadraticArithmetic §2.7.1 (line 706 of its README at the open head).

**Policy.** `git diff --stat origin/main...HEAD` touches only this package's README and one report. No pull-request numbers, no `lemma`, no `set_option`, no algorithm; every target has a locator; no layer is named after a source chapter.

**Dependency check** (command of the brief, run unchanged):

```text
depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: EndoscopicTransferAndUnitaryTraceComparison 149, MetaplecticAutomorphicForms 151, this roadmap 152; ReductiveGroupsPartII and SchemeAndStackFoundations are on main.

**Supplier citations resolved** (section present with the cited content): EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.4, 1.5, 1.14, 1.17(a)–(c), 2.1, 2.4, 2.9, 2.11 (unmatched vanishing present), 2.12 (stated for unramified E and odd p, as the README says), 3.3, 4.7 (any residue characteristic), 4.9 (see R01); GeometryOfNumbersAndQuadraticArithmetic §2.7 (`IntegralHermitianLattice.ofCarrier`, `.dual`), §2.9 (`SignedHermitianSpace`, `signedHermitianAdjoint`; carrier over any field with involution, classification in odd residue characteristic; see R03), §3.2 (unramified, dyadic allowed); AdelicAlgebraicGroups §2.2 (*quotient-measure*: right coset space, second countable locally compact Hausdorff, closed subgroup, equal modular characters, integrable extension, stages); SmoothRepresentationsOfLocalGroups §SR.4.1 (*satake-isomorphism*), §SR.4.3 (*parabolic-descent*: GL_n(E) only, dual embedding diag(q⁻ᵇm₁,q⁻ᵃm₂), as the README says); MetaplecticAutomorphicForms §2.1 `weilIndex`, §2.5 `weil_generators`, §3.2a `splitHermitianOscillator` (pairing (ℓ(y),εk(x)), conjugate-linear first, isometry group GL(A), A=0 allowed); ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts* (characteristic zero); SchemeAndStackFoundations §1.24 (on main and unchanged in number at the open revision). Downstream paragraph: GanGrossPrasadUnitaryGroups is later in the order (239) and is named only as a consumer of the base roadmap.

**Pins.** `Matrix.conjTranspose` (file present), `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self` (Hermitian.lean:286), `Matrix.isHermitian_conjTranspose_mul_self` (:290), `Matrix.charpoly_mul_comm` (Charpoly/Basic.lean:279, square matrices over a commutative ring), `MvPolynomial.hsymm` (Symmetric/Defs.lean:312), `MvPolynomial.bind₁` (Monad.lean:67), `HasStrictFDerivAt.implicitFunction` (Implicit.lean); `TauCeti.map_normUnits_unitFiltration` (Unramified/Basic.lean:126, all i, unramified only), `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (:158). Statements agree with the README's descriptions.

**Declared gaps.** Seven slugs, identical in `design/plan.json` and under "Exact supplier contracts", each with a named supplier and section. Six are precise and are not raised; the seventh is R02.

**Adversarial table** (values computed on each side).

| Statement | Instance | Values | Result |
|---|---|---|---|
| Conventions: X^τ in rank one | W_i=⟨a_i⟩, X=z | conj(zv)a₁w = conj(v)a₂·(a₁/a₂)z̄w | holds |
| Conventions: column reversal | E=ℚ₃(√3) | Hilbert symbol (−1,3)₃=(−1/3)=−1, so η(−1)=−1 | holds |
| §0.2 r₁ | ⟨1⟩,⟨ε⟩, X=1 | −ε⁻¹ | holds |
| §0.4 block charpoly | general | δ²=diag(r₁,r₂); det(T−δ)=det(T²−r₁) | holds |
| §0.4 Check | a₁=1,a₂=π,z=1 | T²+π⁻¹ versus T²+1 | discriminates |
| §0.5 image Ω | y=−XX^τ | −h₁(v,y⁻¹w)=h₂(X⁻¹v,X⁻¹w) | holds |
| §0.5 stabilizer | g₁Xg₂⁻¹=X | g₂=X⁻¹g₁X, g₁ centralizes r₁(X) | holds |
| §0.6 Check | f=1_(O_E), B=O_F^× | U=O_E^×; fibre integral 1_(O_F^×) | holds |
| §0.8 Check | f=1_(O_E), rank one | 1 iff v(−t) even ≥0 | holds |
| §1.3 basepoint law | values 2,5, κ(d₀)=−1 | 5−2=3=(−1)⁻¹(−3) | holds |
| §1.5 route | stable class versus Ω | det of −h(·,y⁻¹·) is constant on a stable class, so Ω is stably invariant | holds |
| §2.2 ξ_F | definition | \|det m₁\|^(b/2)\|det m₂\|^(a/2)·δ_P^(1/2)=\|det m₁\|^b | holds |
| §2.2 square | a=b=1 | q⁻ᵇX² by both composites | holds |
| §2.2 Check | n=2 | q(T₁²+T₂²)=Sat(T_(2,0))−(q−1)T₁T₂ | holds |
| §2.3 measure | y↦gyg* | Jacobian \|N det g\|_F^n against \|det y\|_F^(−n) | invariant |
| §2.3 rank two | ê_(1,0) | vol (q−1) × q^(−1/2) × q/(q−1) × (U₁+U₂)=√q(U₁+U₂) | holds |
| §2.3 rank two | T_(1,0),E∗e_0 | q²+1 cosets = q(q−1)·1+1·(q+1); transform q(U₁²+U₂²) | holds |
| §2.3 freeness | n | symmetric Laurent ring over its squared-variable subring, degree 2^n | holds |
| §3.1 κ_Σ | two nonsplit factors, ζ=(ε,1) | Σ={1}: 1; Σ={2}: −1; agrees with Leslie25 line 1622 | holds |
| §3.2 Checks | 1_(O^×), 1_(πO^×), 1_(O) | 1, −1, 1/(1+q^(−s))→1/2 | holds |
| §3.2 T-coset invariance | factor outside S₁ | η∘N_(F_i/F) trivial when E⊂F_i | holds |
| §3.3 identity | rank one unit, Σ={1} and Σ=∅ | 1/2=2⁻¹(1+0); 1/2=2⁻¹(1−0) | holds |
| §3.3 against sources | Xiao18 (7) inverted | Σ_x⟨Λ,x⟩O_x=2^r·ωG_Λ | factor 2^(−r) needed (E11) |
| §3.4 descent | u=m₁u′ | \|det m₁\|^b∫_N φ(mu)du=ξ_F(φ)(m) | holds |
| §3.5 sign | a=2,b=1 mixed Check | det[[1,0,2],[0,1,0],[1,1,1]]=−1; D_ab=(√2−1)(−√2−1)=−1; (−1)^(ab)=1 | holds |
| §3.5 sign | ℚ₃(√3), x=diag(0,1) | cyclic det 1, D_ab=−1, η((−1)(−1))=1 | holds |
| §3.5 coset Check | g=diag(3,3,1) | value 1 at I, 0 at g with vector e₁; 0,0 with vector 0 | holds |
| §3.8 generation | t∈π⁻¹O_F | π⁻¹ and π both in π⁻¹O_F give diag(π⁻¹,π) | holds |
| §4.1 | E=ℚ₃(√3) | unit norms ≡ squares mod 3; −1≡2 | no c, as stated |
| §4.2 | y=XX* | {g: g⁻¹X∈K·U} has measure ∫_U φ(Xu)du | holds |
| §4.7 density | n=1, T=π^(2d)u | count q^k(1+q⁻¹), density 1+q⁻¹, quotient 1 | holds |
| §4.7 exponent | same rank | Hom Jacobian \|det A\|_E^n equals Hermitian Jacobian | index exponent 0 |
| §4.7 Check | Gram πI₂ | q+1 isotropic lines | holds |
| §4.8 exponent | general | d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | holds |
| §4.9 | non-invertible regular target | both sides 0 by support | holds |
| §5.1 Checks | e_(1,0), e_(1,1), e_(2,2) | −(e₁⊗e₀+e₀⊗e₁); −q⁻¹e₁⊗e₁; q⁻²e₂⊗e₂ | holds |
| §5.1 Check | 1_(πK)∗e_0 | (q⁻ᵇ)^a(q⁻ᵃ)^b=q^(−2ab) | holds |

**Source corrections of the README.** E01, E04, E06, E07, E08, E11, E14, E15 and E16 were confirmed at the cited lines (Leslie25 lines 478–480, 1423, 1543, 1722, 1838, 1629–1634, 1660–1662 with 1731, 803; Xiao18 lines 949–983). E02, E03, E05, E09, E10, E12, E13 were not re-read.

## Not verifiable

- The sign and constant in Hironaka99 Theorem 1 and equations (2.5)–(2.6): the cached text is OCR of a scan and the exponent of (−1) and the Hall–Littlewood normalisation are illegible (Hironaka99 lines 633–641, 687–699). The README's rank-one and rank-two values are consistent with the sign (−1)^(Σiλ_i) evaluated at y⁻¹, with (2.7), and with the Hecke-module law, which I checked independently; the printed formula itself was not read.
- Whether the block rank hypotheses and the measure normalisations of gap:jr-local-comparison, gap:jr-weil-descent and gap:jr-product-base-change suffice for §§3.6–3.8 and 4.3–4.4: the supplier sections do not exist yet (declared gaps).
- The proof of Leslie25 Theorem 11.1 and the global argument behind it (declared gap; not read).
- Ownership against open pull requests was checked through the `roadmaps grep` index of the open heads (searches for the spherical base-change map, Hironaka's transform on X_n, Friedberg–Jacquet periods); the individual sibling checkouts were read only for the eight roadmaps cited or closest in vocabulary.

## Source issues

- **Error** in Leslie25 at Theorem 4.7, p. 36: the source says the factor-weighted regularized nilpotent integral equals the κ_Σ-weighted sum of unitary orbital integrals over S; it should be 2^(−#S₁) times that sum, with volume-one torus measures; affects the proof.
- **Error** in Xiao18 at Theorem 4.7, equation (8), p. 21: the source says Fourier inversion on (ℤ/2)^(S₁) of the identities (7) gives (8) with no constant; it should carry the factor 2^(−#S₁) on the right side; affects a stated result.
- **Misprint** in Leslie25 at §4.1.2, p. 32: the source says the Hermitian invariants b_i pair w with powers of x applied to w; it should be powers of the Hermitian variable y; affects nothing.
- **Misprint** in Leslie25 at Lemma 1.8, p. 12: the source says the centralizer of δ∈Herm(V) is taken in U(W); it should be U(V); affects nothing.
- **Misprint** in Leslie25 at the proof of Proposition 4.8, p. 38: the source says the upper test is φ⊗1_(Λ_n) with value φ at the zero vector; it should be (φ∗1_0)⊗1_(Λ_n) with value φ∗1_0; affects nothing.
- **Error** in Leslie25 at §5.1, p. 40: the source says the Hermitian partial Fourier kernel is ψ of the norm of the pairing; it should be ψ of the trace Tr_(E/F) of the pairing; affects the proof.
- **Gap** in Leslie25 at Proposition 4.8, pp. 37–38: the source says the Jacquet–Rallis hypothesis is assumed in rank n; it should be assumed in ranks a and b as well, where the proof uses it; affects the proof.
- **Misprint** in Leslie25 at Remark 4.4, p. 35: the source says the characteristic-zero transfer is due to "Gordan"; it should be Gordon; affects nothing.
- **Error** in Leslie25 at §2.3, p. 20: the source says the set of Hermitian orbit representatives has two elements for any n; it should be one element at n=0; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2131a2bf47f5f9646f790629beb1aee0d280835b", "job": "RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b", "model": "fable", "worker": "chris-x8"} -->
