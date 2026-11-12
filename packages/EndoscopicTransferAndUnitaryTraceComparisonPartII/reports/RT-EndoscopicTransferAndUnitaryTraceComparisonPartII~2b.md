<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13019#issuecomment-6793820751 -->
Red team round 2 pass b (claude) of a2f4542

Verdict: needs_changes

1. **F01** (P3) the nontriviality of η∘N_(F_i/F) needs a third pinned declaration

   **Location.** `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:47` ("Together they give, for a finite extension F_i/F not containing E, that η_(E/F)∘N_(F_i/F) is the quadratic character of the field E⊗_F F_i over F_i and is nontrivial") and README:538 ("it is nontrivial because that norm group has index 2").

   **Claim.** `TauCeti.ClassFieldTheory.artinMap_norm` and `TauCeti.index_normGroup_of_isCyclic` suffice.

   **Witness.** Index 2 gives x∉N(E_i^×); transitivity of norms gives only ker(η∘N)⊇N(E_i^×). To get N_(F_i/F)x∉N(E^×) one needs "an Artin symbol fixing E_i comes from a norm of E_i". That is pinned as `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`, `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:165`, and is not cited.

   **Repair.** In README:47 replace "Consume `TauCeti.ClassFieldTheory.artinMap_norm` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`) and" by "Consume `TauCeti.ClassFieldTheory.artinMap_norm` and `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`) and", and add after "index [L:K] in K^×": "; the third says that if a representative of the absolute Artin symbol of x∈K^× fixes a finite Galois extension M/K pointwise, then x is a norm from M". Replace the sentence at README:538 from "by norm functoriality" to "index 2" by:

   > "the kernel of η_i contains N(E_i^×) by transitivity of the norm, and it is not all of F_i^×: take x outside N(E_i^×), which has index 2 (`TauCeti.index_normGroup_of_isCyclic`); if N_(F_i/F)(x) were a norm from E, its Artin symbol would fix E (`TauCeti.ClassFieldTheory.artinMap_norm` for E/F), so by the same theorem for F_i/F a representative of the Artin symbol of x would fix E and F_i, hence E_i, and x would be a norm from E_i (`TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`)".

   Add the declaration to the *Needs* of §3.2 (README:536) and to the Layer 3 Dependencies (README:656). Tested on the instances of the round 1 table: F_i=F gives η_i=η, kernel N(E^×) of index 2; F_i=E gives i∉S₁ and the argument is not invoked.

2. **F02** (P3) two consumed library declarations have no consumer

   **Location.** README:39 ("and `MvPolynomial.bind₁` (`Mathlib/Algebra/MvPolynomial/Monad.lean`)") and README:43 ("`TauCeti.mem_normGroup_iff_dvd_normalizedValuation`").

   **Claim.** Both are inputs of the roadmap.

   **Witness.** Each name occurs once in the README, in its contract paragraph; no *Needs* line, proof route or Dependencies list names it. The substitutions of §§2.2 and 4.8 act on symmetric Laurent polynomials, which `MvPolynomial.bind₁` (of type `MvPolynomial σ R →ₐ[R] MvPolynomial τ R`, Monad.lean:67) does not cover.

   **Repair.** Delete "and `MvPolynomial.bind₁` (`Mathlib/Algebra/MvPolynomial/Monad.lean`)" from README:39. Keep the Tau Ceti declaration and name its consumers: add "Tau Ceti `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`" to the *Needs* of §4.2 (README:680) and §4.7 (README:752), whose statements use that norms have even valuation ("vanishes on the other GL_n(E)-orbit", "Φ_n,d=0 for … d odd"), and to the Layer 4 Dependencies (README:834). Tested: inertia degree 2 gives v_F(N(z)) even, so Φ_1,1=0 and r₊,!φ(π)=0, the values of the Checks at README:767 and README:688.

Two P3 findings (S01, S02). All nine findings of round 1 are repaired at this head, and no repair introduced an error. No finding re-raises one that a repair report marked `not actionable in this package`.

## Round 1 findings at this head

| Finding | Status | Witness at a2f4542 |
|---|---|---|
| 1a/F01 (P1) zero clause at colliding block spectra | repaired | `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:329` defines source-regular ("coprime characteristic polynomials, equivalently … D_ab … nonzero"); README:376 "SRO(f_Ξ,δ_H)=0 for every source-regular δ_H (§1.2) with no regular source match"; README:800 tests "every G-regular target orbit". Recomputed: target (c,c), N(c)=−1, has D_ab=1−1=0, untested, stable value 1; target (c,c′), −N(c′)=1+π, has D_ab=−π, factor η(−π)\|π\|_F=−q⁻¹. |
| 1a/F02 (P1) Tate continuation unowned | repaired, one residue (S01) | README:97 consumes AL.1.1.2, AL.1.2.1, AL.1.2.3; README:536 lists them in *Needs*. The three sections exist at the supplier's head with the stated content (z=L·z₀, z₀ entire; ramified case entire; unit volume one). The nontriviality step still lacks one pinned input: S01. |
| 1a/F03 (P3) analytic implicit theorem | repaired | README:45 and README:221 cite `ImplicitFunctionData.analyticAt_implicitFunction`; README:223 names the left and right functions of `HasStrictFDerivAt.implicitFunctionDataOfComplemented`. Both read at the pins (`leftFun := f`, `rightFun x := Classical.choose hker (x - a)`). |
| 1b/F01 (P2) BC_n attributed to a section that does not define it | repaired | README:452 "define BC_m:H_m,E→H_m,F as the unique complex-algebra homomorphism whose composite with the normalized Satake isomorphisms … is the substitution Z_i↦T_i²"; §4.9(b) of the base is no longer in any *Needs*. |
| 1b/F02 (P2) compound gap sentence | repaired | README:53 and `design/plan.json` carry the same sentence, "the transfer relations (4.3) and (4.7) as relations between test functions"; README:55 maps parts to consumers and excludes Theorem 4.2. |
| 1b/F03 (P3) two-space adjoint | repaired | README:127 "X^τ is the W₁→W₂ block of `signedHermitianAdjoint` applied to the endomorphism (v₁,v₂)↦(Xv₂,0)". Recomputed: h(A(v₁,v₂),(w₁,w₂))=h₁(Xv₂,w₁)=h₂(v₂,X^τw₁). |
| 1b/F04 (P3) r₊, r₋ before definition | repaired | README:31 "gives r₁(c)=−N(c)=1, the value at 1 of the unsigned Gram map z↦N(z) (the map r₊ of §4.1)". |
| 1b/F05 (P3) cutoff at non-regular invertible points | repaired | README:260 "replaces f by f·1_(r₁⁻¹(B)) … det r₁ lies in the compact set det(B)⊂F^×". Check at README:275 recomputed: fibre volume vol(U(V₂)∩M₂(O_E))=vol U(Λ₂)=1. |
| 1b/F06 (P3) "even-valuation source contraction" | repaired | README:414 "Every source contraction has determinant of even valuation, although its eigenvalues may each have odd valuation". |

## Verified sound

**Counts.** Suggested.lean declarations read: 0 (38 lines read; the file states nothing). README targets read: 36 (§§0.1–0.9, 1.1–1.5, 2.1–2.3, 3.1–3.8, 4.1–4.10, 5.1), plus Conventions, the nine supplier-contract subsections, the five Examples blocks and E01–E17. Locators verified against the cached texts this round: 16 (Leslie25 (2.7), Definition 2.10, Theorem 2.12, Proposition 3.4, Theorem 3.5, Remarks 3.6–3.7, §4.1.4 with (4.6)–(4.7), Lemma 4.6 with κ_Σ, Theorem 4.7, Theorem 5.3, Theorem 11.1, §11.2; Hironaka99 (2.1)–(2.3), Theorem 2). Statements and Checks tested with recomputed values: 45 rows below; all 135 Check bullets were read. Sibling citations resolved at the current heads or main: 26 sections or named targets in 9 roadmaps. Pinned declarations read: 9 Mathlib, 7 Tau Ceti.

**Suggested.lean.** One `import Mathlib`, one module docstring of the required form, an empty namespace `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII`, no `set_option`, no declaration, so no padding, no sorry'd data, and the `#check @name` comparison is empty. Headline theorems of the README: §4.10 (Leslie25 Theorem 2.12), §4.6 (Theorem 3.5), §4.4 (Theorem 5.3), §2.3 (Hironaka's isomorphism), §5.1 (the full-module operator); the docstring names all five with the missing carriers. At the pins a search for `Satake`, `SphericalHecke`, `orbitalIntegral` finds only `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean` (GL₂ newform parameters) and a bad-prime file; no analytic spherical Hecke algebra, Satake transform, orbital integral or Hermitian spherical function exists, so none of the five is statable without an ad hoc encoding. The one resolver lead, `IntegralHermitianLattice.ofCarrier`, is target 2.7.1 of GeometryOfNumbersAndQuadraticArithmetic.

**Policy.** `git diff --stat origin/main...HEAD` changes only files under `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/` (README.md, design/plan.json, sources.toml, two reports). No pull-request number, process word, `lemma`, `set_option` or algorithm in README or Suggested.lean; every numbered target has a locator.

**Dependency check** (command of the brief, unchanged):

```text
depcheck: 237 roadmaps, 2146 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: SmoothRepresentationsOfLocalGroups 26, AdelicAlgebraicGroups 53, GeometryOfNumbersAndQuadraticArithmetic 56, AutomorphicLFunctionsAndLocalFactors 95, EndoscopicTransferAndUnitaryTraceComparison 149, MetaplecticAutomorphicForms 151, this roadmap 152; ReductiveGroupsPartII and SchemeAndStackFoundations are on main. GanGrossPrasadUnitaryGroups (239) is named only as a consumer of the base roadmap; its gaps `relative-finite-transfer` and `relative-fundamental-lemma` on the base exist at its head, as README:874 says.

**Supplier citations resolved this round.** EndoscopicTransferAndUnitaryTraceComparison §1.14 (D(I,G;F), inv), §1.17(a)–(c) (S₁={i: F_i⊉E}; inv across pure forms; κ̃ trivial on S₁(a), nontrivial on S₁(b)), §2.1(iv) (unnormalized Lie orbital integral over G_X⁰∖G), §2.4 (rebasing multiplies by κ(inv)⁻¹), §2.9, §2.11 (strongly G-regular targets; zero when nothing matches), §2.12 (unramified, p odd; Δ=κ(inv(δ,δ′))η(D)\|D\|_F), §3.3 (GL_n: nonleading coefficients), §4.7 (any residue characteristic); AutomorphicLFunctionsAndLocalFactors AL.1.1.2, AL.1.2.1, AL.1.2.3; SmoothRepresentationsOfLocalGroups SR.4.1 (*satake-isomorphism*), SR.4.3 (*parabolic-descent*: GL_n(E) only, dual embedding diag(q⁻ᵇm₁,q⁻ᵃm₂)); AdelicAlgebraicGroups §2.2 (*quotient-measure*); GeometryOfNumbersAndQuadraticArithmetic §2.7 (`IntegralHermitianLattice.ofCarrier`, `.dual`), §2.9 (`SignedHermitianSpace`, `signedHermitianAdjoint`, `_comp`, `_involutive`; one-space adjoint over any field with involution), §3.2 (unramified, char(F₀)≠2); MetaplecticAutomorphicForms §2.1 `weilIndex`, §2.5 `weil_generators`, §3.2a `splitHermitianOscillator` (pairing (ℓ(y),εk(x)), GL(A) by (g,(g⁻¹)∨)); ReductiveGroupsPartII RG2.0 *smooth-group-analytic-charts*; SchemeAndStackFoundations §1.24 (same number on main and at its open revision). Convention comparison: the base's transfer relation SO(f^H)=Σ_δ Δ(γ₁,δ)O_δ(f) equals this roadmap's Δ_rel·RO^κ because Δ(δ_H,δ′)=κ(inv(δ,δ′))Δ(δ_H,δ) for a quadratic κ, using the base's rule inv(γ″,γ′)=inv(γ,γ′)−inv(γ,γ″).

**Pins.** Mathlib: `Matrix.conjTranspose`, `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self` (Hermitian.lean:286), `Matrix.isHermitian_conjTranspose_mul_self` (:290), `Matrix.charpoly_mul_comm` (Charpoly/Basic.lean:279), `MvPolynomial.hsymm` (Symmetric/Defs.lean:312), `MvPolynomial.bind₁` (Monad.lean:67; see S02), `HasStrictFDerivAt.implicitFunction` (Implicit.lean, finite-dimensional section, `[CompleteSpace 𝕜]`), `HasStrictFDerivAt.implicitFunctionDataOfComplemented` (:321). Tau Ceti: `TauCeti.map_normUnits_unitFiltration` (Unramified/Basic.lean:126), `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (:158), `ImplicitFunctionData.analyticAt_implicitFunction` (Analysis/Analytic/Inverse.lean:131, root namespace, complete F and G), `TauCeti.ClassFieldTheory.artinMap_norm` (Local/ArtinMap.lean:345), `TauCeti.index_normGroup_of_isCyclic` (Brauer/LocalH2Bound.lean:70), `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes` (Local/ArtinMap.lean:165; see S01); the path `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean` exists.

**Declared gaps.** Seven slugs, the same sentences in `design/plan.json` and under "Exact supplier contracts", each with a named supplier earlier in the order. None is raised.

**Adversarial table** (values computed on each side; q≥2, E/F unramified unless stated).

| Statement | Instance | Values | Result |
|---|---|---|---|
| §0.1 skew-adjointness of δ(X) | general | adjoint of [[0,X],[Y,0]] is [[0,Y^τ],[X^τ,0]]; with Y=−X^τ: −δ | holds |
| §0.1 Check 1 | ⟨1⟩,⟨π⟩, X=z | conj(zv)w=conj(v)π(π⁻¹z̄w); X^τ=π⁻¹z̄ | holds; z̄ excluded |
| §0.1 split adjoint and action | (A,C) on M⊕M∨, B=Cᵗ | (ℓ(Bw),(Aᵗm)(v)): (A,B)^τ=(B,A); action (gAh⁻¹,hBg⁻¹); (1,1)↦(2,1/2), AB=1 | holds |
| §0.2 r₂(X)=r₁(X^τ) | swapped spaces | −X^τ(X^τ)^τ=−X^τX | holds |
| §0.4 block charpoly | general | det[[T,−X],[X^τ,T]]=det(T²+XX^τ)=charpoly(r₁)(T²) | holds |
| §0.4 Check 3 | split, A=diag(1,0), B=I | charpoly r₁=T(T+1); δ: T²(T²+1) | holds |
| §0.5 image Ω | y=−XX^τ, a=Xv | −h₁(a,y⁻¹b)=h₂(X⁻¹a,X⁻¹b) | holds |
| §0.5 stabilizer | g₂=X⁻¹g₁X unitary | iff g₁ commutes with XX^τ | holds |
| §0.6 differential surjective | h=−(1/2)SX^(−τ) | −(hX^τ+Xh^τ)=S; needs 2∈F^× (characteristic 0) | holds |
| §0.7 left H_X-invariance | (t₁,t₂)∈H_X | (t₁h₁)⁻¹X(t₂h₂)=h₁⁻¹Xh₂ | holds |
| §0.8 Check 4 | n=2, T=−I₂ | {u∈U(V₂): Xu∈M₂(O_E)}=U(Λ₂), volume 1 | holds |
| §1.3 basepoint | values 2,5 | −3; rebased 3=κ(d₀)⁻¹(−3) | holds |
| §1.4 against base §2.11 | κ quadratic | ΣΔ(δ_H,δ′)O_δ′=Δ(δ_H,δ)O^κ_δ | same relation |
| §1.5 unmatched clause | target matching only y∉Ω(W₁,W₂) | ordinary identity gives Δ·O^κ(r_!f,y)=0, r_!f vanishing off Ω | holds |
| §2.2 ξ_F | definition | \|det m₁\|^(b/2)\|det m₂\|^(a/2)δ_P^(1/2)=\|det m₁\|^b | holds |
| §2.2 Check 3 | n=2 | q(Z₁+Z₂)↦q(T₁²+T₂²)=[q(T₁²+T₂²)+(q−1)T₁T₂]−(q−1)T₁T₂ | holds |
| §2.2 Satake normalisation | SR.4.1 at diag(π,1), diag(1,π) | δ^(1/2)·vol: q^(−1/2)·q and q^(1/2)·1, both √q | √q(T₁+T₂) |
| §2.3 measure | y↦gyg* | Jacobian \|N det g\|_F^n cancels \|det(gyg*)\|_F^(−n) | invariant |
| §2.3 rank one | Hironaka99 (2.2): s₁=−z+πi/log q | Y_z(π^(−j))=q^(js)=(−1)^jU^j | holds |
| §2.3 ê_(1,0), from (2.1)–(2.2) | x=diag(π⁻¹,1), s₂=−z₂+1/2+πi/log q | ω(x)=√q(qU₁−U₂)/(q²+1); ω(1)=(q−1)(qU₁−U₂)/((q²+1)(U₁+U₂)); ratio √q(U₁+U₂)/(q−1); volume q−1 | ê_(1,0)=√q(U₁+U₂), as stated |
| §2.3 ê_(1,1) | y⁻¹=π⁻¹I | q^(s₁+2s₂)=q^(−z₁−z₂)(−1)³=−U₁U₂ | holds |
| §2.3 module law | T_(1,0),E∗e_0 | ê_(2,0)+(q+1)ê_(1,1)=q(U₁²+U₂²) | holds |
| §2.3 orbit volumes | Hironaka99 (2.7) | (1,0): q(1−q⁻¹)=q−1; (1,1): 1; (2,0): q(q−1) | holds |
| §3.2 Checks | 1_(O^×), 1_(πO^×), 1_O | 1; −1; 1/(1+q^(−s))→1/2 | holds |
| §3.2 T-coset invariance | t₀∈T | S₁ components absorbed at s=0; others: v, v* zero and η∘N trivial | holds |
| §3.2 scaling law | v=π | Σ_(k≥−1)(−1)^kq^(−ks)→−1/2=η(π)·1/2 | holds |
| §3.3 identity, rank one | f=f₁⊗f₂ near 0 | ∫f₁(t)f₂(a/t)η(t)d^×t=A+η(a)B; A+B=Φ₁(0), A−B=Φ_ε(0) | A=(Φ₁+Φ_ε)/2: factor 2^(−r) |
| §3.4 descent | u=m₁u′ | \|det m₁\|^b∫_Nφ(mu′)du′=ξ_F(φ)(m) | holds |
| §3.5 sign | a=b=1 | det[[1,x_a],[1,x_b]]=x_b−x_a=(−1)^(ab)D_ab | holds |
| §3.5 Jacobian | n=[[1,u],[0,1]] | nyn⁻¹ has off-block uy_b−y_au, determinant ±D_ab | \|D_ab\|⁻¹ |
| §3.5 Check 4 | a=2,b=1, ℚ₃ | det[[1,0,2],[0,1,0],[1,1,1]]=−1=D_ab; g=diag(3,3,1): values 1,0 with e₁; 0,0 with 0 | holds |
| §3.5 with §3.3 | general | ω_nG_n=η(D)\|D\|⁻¹ω_aω_bG_(a,b): SO=η(D)\|D\|·O^κ | factor of §2.12 |
| §3.8 Fourier self-duality | 1_(Λ_n), kernel ψ(Tr h) | trace dual of O_E^n is O_E^n (unramified, p=2 included) | holds |
| §3.8 generation | t=π⁻¹ | n(t)n⁻(−t⁻¹)n(t)=diag(t,t⁻¹)w; π∈π⁻¹O_F | holds |
| §4.2 | y=XX* | {g: g⁻¹∗y∈K∗I}=XU(V)K, measure ∫_Uφ(Xu)du | holds |
| §4.3 | Φ=1_K⊗φ, h∈K | φ(diag(h⁻¹,1)g)=φ(g); integral vol(K)φ=φ | holds |
| §4.4 against Leslie25 (4.6), Theorem 5.3 | rank shift n+1→n | ω(X)=η(det[e_n,Xe_n,…,X^(n−1)e_n]) | agrees |
| §4.7 count | T=XX*, L=X*Λ | {uU(Λ): Xu integral}↔self-dual L′ with L⊆L′⊆L∨=X⁻¹Λ | holds |
| §4.7 density | n=1, T=π^(2d)u | count q^k(1+q⁻¹), density 1+q⁻¹, self-density 1+q⁻¹ | m₀=1 |
| §4.8 exponent | general | d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | holds |
| §4.10 Check 4, by lattice counting | y=diag(1,1+π) | orbit (1,1): 1 lattice; orbit (π,π): q+1 lattices, one torus orbit, value q+1; O^κ=1−(q+1)=−q | 1=(−q⁻¹)(−q) |
| §4.10 at label (π,π) | y=diag(π,πu), u≢1 mod π | pairs (Λ₁,M): orbit (1,1) gives q+1, orbit (π,π) gives q+1; O^κ=0 | zero target confirmed |
| §4.10 at unit resultant | y=diag(1,π²) | orbit (1,1): 1; orbit (π,π): 0; O^κ=1=SO(e_0⊗e_2), Δ=1 | holds |
| §4.9 ordinary unmatched clause | V_a⊕V_b≅V_n | every G-regular target matches diag(y_a,y_b); the clause is empty and the zeros come from the matching identity | consistent |
| §5.1 Checks | e_(1,0); e_(1,1); 1_(πK)∗e_0 | −(e₁⊗e₀+e₀⊗e₁); −q⁻¹e₁⊗e₁; q^(−2ab) | holds |
| Layer 4 Example | H_2(Φ_2,2) | q(T₁²+T₂²)↦q·q⁻¹(X²+Y²) | holds |

**Checks and definitions.** Every definition (X^τ, r₁, r₂, RO, r_!, relative datum, source-regular, Δ_rel, RO^κ, the transfer relation, H(X_n), BC_m, ξ_F, H_n, G_Σ, f_p, Φ_n,d, c_n,d, ξ_X) has at least three Checks in its subsection, and none of the Checks recomputed above is false or vacuous. The most plausible wrong models are excluded by stated Checks: unsigned contraction (§0.2 Check 1), z̄ as adjoint (§0.1 Check 1), unsquared base change (§2.2 Check 4), the opposite spectral dictionary (§2.3 Checks 5–6, §5.1 Check 5), the unaveraged germ (§3.3 Check 1), the unsigned cyclic ratio (§3.5 Check 2).

## Not verifiable

- Hironaka99 Theorem 1 and (2.5)–(2.6): the cached text is OCR and the sign exponent and constants are illegible (Hironaka99 lines 633–641, 687–699). The definition (2.1) and the change of variables (2.2) are legible (lines 492–507); from them I recomputed the rank-one and rank-two transforms used by the README, so the Checks of §§2.3 and 5.1 do not depend on the illegible lines. The general formula "ê_λ is a multiple of P_λ(U;−q⁻¹)" was checked only in ranks one and two.
- The sufficiency of the seven declared gaps for §§3.1–3.8 and 4.3–4.5 (measures, rank ranges, zero clauses): the supplier sections do not exist yet.
- Leslie25 Theorem 11.1's proof and the global comparison behind it (declared gap; statement read at Leslie25 lines 3696–3706, proof not read).
- The general statements of §§4.6, 4.9, 4.10 were tested at the instances in the table, not proved.
- Ownership against open pull requests was checked with the `roadmaps` index and the supplier READMEs at their heads (nine roadmaps read); the remaining sibling checkouts were not opened individually.

## Source issues

- **Gap** in Leslie25 at Definition 2.10, p. 21: the source says an unmatched regular semisimple target must have zero stable relative orbital integral; it should restrict this to targets whose contracted blocks have disjoint spectra; affects a stated result.
- **Error** in Leslie25 at Theorem 4.7, p. 36: the source says the factor-weighted regularized integral equals the κ_Σ-weighted orbital sum over S; it should be 2^(−#S₁) times that sum for volume-one torus measures; affects the proof.
- **Misprint** in Leslie25 at §4.1.4, p. 33: the source says the Hermitian block embedding has upper-left entry x; it should be the Hermitian variable y; affects nothing.
- **Misprint** in Leslie25 at §2.2.3, p. 19: the source says the endoscopic datum is (U(V_a)×U(V_b),s,η); it should be ξ, η being the quadratic character; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a2f4542d3301443f0381e96ee110401e5e9a9a62", "job": "RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2b", "model": "fable", "worker": "chris-x10"} -->
