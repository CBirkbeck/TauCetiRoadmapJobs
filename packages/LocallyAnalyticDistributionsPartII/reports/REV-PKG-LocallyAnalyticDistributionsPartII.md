<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2379#issuecomment-6628607324 -->
Review (claude) of aa9bafa

Verdict: needs_changes

1. **F01** (P2) §0.1 and §0.3 (i) re-plan Lazard's Lie algebra, which NoncommutativeAndEquivariantIwasawa §0.13a already constructs

   **Location.** `packages/LocallyAnalyticDistributionsPartII/README.md` line 11 ("This roadmap owns: Lazard's Lie lattice L_G of a uniform group"), lines 85–91 (the definition of L_G by the three limit operations, "this common ℚ_p-Lie algebra is denoted g and does not depend on the open uniform subgroup", "A continuous homomorphism of uniform groups is a homomorphism of the Lazard lattices", the logarithm identification), line 122 (§0.3 (i): "the matrix logarithm is an isomorphism of ℚ_p-Lie algebras from ℚ_p ⊗ L_G onto sl_n(ℚ_p)").

   **Claim.** The package owns the construction of L_G, the independence of ℚ_p ⊗ L_U from the open uniform subgroup U, functoriality, and the identification of ℚ_p ⊗ L_G with the matrix Lie algebra for open subgroups of SL_n(ℚ_p).

   **Witness.** NoncommutativeAndEquivariantIwasawa (open head e311e48, earlier in the merge order, cited by this package as a supplier) §0.13a item 1: "let Log H be Lazard's ℤ_p-Lie algebra on the underlying set of H and 𝔤_H = ℚ_p ⊗ Log H. Open inclusions induce isomorphisms … A continuous homomorphism induces a map of Lie algebras … For a closed subgroup G ⊆ GL_n(ℤ_p), L(G) is the ℚ_p-span of log(G ∩ (1 + p^k M_n(ℤ_p)))", with its proof step 1 building Log H "with Lazard's limit formulas for sum and bracket". For a uniform group at odd p with the valuation ω_U of §0.7 this is the same object as L_G (AW13 line 3122–3131 are the same three formulas), since (G, ω_U) is p-saturated for odd p (ST03 line 827–832; the saturation half of (HYP) that gap:radius-algebras already asks for).

   **Repair.** In §0.1 import, by name and section, NoncommutativeAndEquivariantIwasawa §0.13a for: Log U = L_G as a ℤ_p-Lie algebra, the independence of g = ℚ_p ⊗ L_U from U, functoriality, and the logarithm description for closed subgroups of GL_n(ℤ_p); add the one-line hypothesis that (U, ω_U) is p-saturated for odd p (cite NoncommutativeAndEquivariantIwasawa §0.7 and gap:radius-algebras). Keep as this roadmap's targets only what §0.13a does not state: L_G is free of rank d with basis any minimal generating set, [L_G, L_G] ⊆ pL_G, L_{G^{p^n}} = p^n L_G, and the normalisation g_R = (1/p) R L_G with its R-Lie algebra structure (AW13 line 3131–3143). Rewrite §0.3 (i) as a consequence of §0.13a's span statement (an open compact G ⊆ SL_n(ℚ_p) is conjugate into GL_n(ℤ_p) and its span is sl_n(ℚ_p) because G ∩ (1 + p^k M_n) is open in SL_n). Change the Scope line 11 to say the lattice-level facts and the normalisation are owned here and the Lie algebra is NoncommutativeAndEquivariantIwasawa §0.13a's, and adjust the Summary sentence "Lazard's Lie lattice of a uniform group" accordingly. Tested on the instance that refuted the original: with §0.13a cited, the first Check of §0.1 (G = 1 + pℤ_p, L_G = pℤ_p ⊂ ℚ_p under log, g_{ℤ_p} = ℤ_p·log(1 + p)/p) is the n = 1, GL₁ case of §0.13a's last Check ("1 + pℤ_p has Lie algebra ℚ_p, since log(1 + pℤ_p) = pℤ_p") together with the normalisation kept here.

2. **F02** (P3) `AnalyticSupport.Coadmissible` is not a declaration of PadicLocalLanglandsForGL2Qp

   **Location.** README line 53: "the predicate `AnalyticSupport.Coadmissible` with independence of the cofinal sequence".

   **Claim.** PadicLocalLanglandsForGL2Qp §0.1 supplies a Lean predicate of that name.

   **Witness.** At head 84416ad, neither the README nor Suggested.lean of PadicLocalLanglandsForGL2Qp contains `Coadmissible`; the names `AnalyticSupport.functions`, `AnalyticSupport.distributions`, `distributionConvolution` and `analyticTensor_equiv` do occur (its README line 2425, and LocallyAnalyticDistributions line 104 at 444887a), so only this one is invented. The worker's citation check flags the same name as found nowhere.

   **Repair.** Replace the backticked name by prose: "the coadmissibility predicate of §0.1 (compatible finite modules over the Banach stages, recovered by inverse limit)". No other line of the README uses the name.

3. **F03** (P3) §4.7 (ii) at irrational radii rests on a noetherianity the package itself says is unproven

   **Location.** README line 512 ("(ii) Consequently D^λ_r(G, ℚ_p) is an integral domain for every 1/p < r < p^{−1/2}") and line 518 ("for r′ = r < p^{−1/2} this holds because the ideal is closed (finitely generated in a noetherian Banach algebra)").

   **Claim.** The quotient filtration on D^λ_r is separated for every real r in the range because D_r is noetherian.

   **Witness.** Source correction 2 of the same README (line 644) and ST03 line 872–876: noetherianity of D_r(G, K) is proved for r ∈ p^ℚ only; for r ∉ p^ℚ the closedness of the finitely generated ideal is not available, so the sketch does not cover (ii) as stated. The range (1/p, p^{−1/2}) is contained in the range [1/p, p^{−1/(p−1)}) of §4.8 because 1/2 ≥ 1/(p−1) for p ≥ 3, and §4.8 (ii) proves closedness and the domain property by the bounded division argument for every real r.

   **Repair.** In the proof sketch of §4.7 write: "for r ∈ p^ℚ the ideal is closed because D_r is noetherian; for every real r in (1/p, p^{−1/2}) the closedness and the domain property are §4.8 (ii), whose range contains this one", and in the *Needs:* line of §4.7 cite §4.8 for (ii) as well as for (iii). Tested on r = p^{−1/√2}·(1/p)^{0}, an irrational radius in the range: §4.8 applies with ρ = pr > 1 and gives the domain property; the noetherianity route does not.

4. **F04** (P3) §4.2–§4.4: for a general split reductive 𝔾 the infinitesimal character of Ind(χ) under left translation is dχ∘HC∘S, not dχ∘HC

   **Location.** README line 477 ("Z(g) acts on Ind(χ) by the induced character λ = dχ ∘ HC … right N-invariance kills the second part") and line 449 (the definition of "induced" for general 𝔾).

   **Claim.** With the action of §1.1 (contragredient of left translation, x̃ acting by f ↦ (d/dt) f(exp(−tx)·)), every z ∈ Z(g) acts on Ind(χ) = {f(gtn) = χ(t)f(g)} by dχ(HC(z)).

   **Witness.** Under left translation the derived action of a monomial x₁⋯x_k is the right-invariant operator of S(x₁⋯x_k), and for central z the right-invariant operator of z equals the left-invariant one, so z acts by the left-invariant operator of S(z), whence by dχ(HC(S(z))) (right N-invariance kills U(g)n, right T-equivariance gives dχ on U(t)). For sl₂, S(½h² − h + 2ef) = ½h² + h + 2fe = Δ, so every target on G₁^m is unaffected; for sl₃ the cubic generator of Z(g) has eigenvalue on Sym²(std) the negative of its eigenvalue on the dual (an odd W-invariant polynomial in λ + ρ), so dχ∘HC and dχ∘HC∘S differ. The README's own §4.3 sketch already says "up to the antipode, which preserves Z(g)".

   **Repair.** In §4.4 first bullet (and §4.2's definition) write "by dχ ∘ HC ∘ S, S the antipode of U(g); for 𝔾 = SL₂^m the antipode fixes each Δ_i, so this is dχ ∘ HC", or restrict §4.2–§4.4 to 𝔾 = SL₂^m, which is all that §§4.5–4.14 use. Tested on the instance: χ(diag(t, t⁻¹)) = t^c, λ(Δ) = ½c² + c is unchanged by S.

5. **F05** (P3) §1.3's O(2) example needs a reflection in G

   **Location.** README line 174: "so x is not central in D(G, K) for G an open subgroup of O(2)(ℤ_p)".

   **Claim.** Non-centrality for every open subgroup.

   **Witness.** SO(2)(ℚ_p) has index 2 in O(2)(ℚ_p), so SO(2)(ℤ_p) is an open subgroup of O(2)(ℚ_p) contained in O(2)(ℤ_p); on it the adjoint action fixes x and Z(so(2)) ⊗ K is central in D(SO(2)(ℤ_p), K) by the connected case of the same proposition.

   **Repair.** "for G = O(2)(ℤ_p), or any open subgroup containing an element of determinant −1".

6. **F06** (P3) two *Needs:* clauses point at the wrong supplier clause

   **Location.** README line 93 ("NoncommutativeAndEquivariantIwasawa §0.1 (uniform groups, unique p^i-th roots and the lower p-series)") and line 176 ("PadicLocalLanglandsForGL2Qp §0.1 (density of Dirac distributions)").

   **Claim.** The cited sections state unique p^i-th roots, respectively density of the span of Dirac distributions.

   **Witness.** NoncommutativeAndEquivariantIwasawa §0.1 at e311e48 states the uniform predicate, its dimension and the constant lower-series indices; p-th roots appear in §0.7 ("the p-saturation adjoins p-th roots … uniqueness of such roots in a saturated group"). PadicLocalLanglandsForGL2Qp §0.1 at 84416ad promises "the Dirac, pushforward, convolution, completed projective tensor and open-subgroup comparisons" and strong biduality, but not that the span of the Dirac distributions is dense (ST02 line 514–526, Lemma 3.1, proved from reflexivity and Hahn–Banach).

   **Repair.** Line 93: cite §0.7 (saturation of (G, ω_U) for odd p, hence unique p-th roots of elements of G^p) instead of §0.1 for the roots. Line 176: add the density of the Dirac span as a bullet of §1.1 proved from PadicLocalLanglandsForGL2Qp §0.1's strong biduality and LocallyAnalyticDistributions §0.2's Hahn–Banach (ST02, Lemma 3.1, p. 13), and let §1.3 cite that bullet.

7. **F07** (P3) Suggested.lean docstring misnames what the algebraic Peter–Weyl headline lacks; Tau Ceti has the module extension

   **Location.** `packages/LocallyAnalyticDistributionsPartII/Suggested.lean` lines 32–35: "it needs the action of the completed group algebra on Sym^k(K²), the continuous extension of the algebraic representation, which is a construction through the finite quotients of the lattice rather than a library object".

   **Claim.** The extension of a continuous group action to the completed group algebra is not a library object.

   **Witness.** Tau Ceti at the pin, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean` line 344, `TauCeti.IsCompactModule.completedGroupAlgebraModule : Module (completedGroupAlgebra R Γ) M` for a compact topological ring R, a compact R-module M (`TauCeti.IsCompactModule`, `TauCeti/Topology/Algebra/Module/Compact.lean` line 294) and a continuous R-linear Γ-action, with `completedSMul_of` (group elements act as Γ). What is missing is the carrier Sym^k(ℤ_p²) as a compact ℤ_p-module with its continuous SL₂(ℤ_p)-action: Mathlib at the pin has no symmetric-power representation and no `MulAction (SpecialLinearGroup n R) (n → R)` instance in `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`, so even k = 1 needs an ad hoc action. "Not statable" stands; the reason does not.

   **Repair.** Rewrite the docstring item: the headline lacks Sym^k(ℤ_p²) as a compact ℤ_p-module with continuous SL₂(ℤ_p)-action; the K[[G]]-module structure itself would be `TauCeti.IsCompactModule.completedGroupAlgebraModule`. Add that declaration (with `completedSMul_of`) to the README's "From Tau Ceti" contract, and add to §3.9 an API bullet that for W = Sym^k(K²) with lattice Sym^k(ℤ_p²) the Lie module 𝓛(W) is the module structure obtained from the continuous G₁-action through that declaration (both extend g ↦ exp(log g) = g and K[G] is dense), which is what §5.2 (i) uses.

Independent review of the package (README, Suggested.lean, metadata.toml, sources.toml, design/plan.json gaps) against the pinned Mathlib and Tau Ceti, the suppliers at their open heads (PadicLocalLanglandsForGL2Qp at 84416ad, NoncommutativeAndEquivariantIwasawa at e311e48, LocallyAnalyticDistributions at 444887a) and on main (LieHighestWeight, PadicMeasuresIwasawaAlgebras), and the cached source texts. One blocking finding (an object already planned by a supplier), six non-blocking ones.

## Verified sound

**Principles.** No route-specific shortcut (all theorems are stated for the general uniform group or the general split reductive 𝔾 where the sources prove them, with G₁^m only where Fu's theorems are specific to it); no computational algorithm; no sorry'd data, no `set_option`, no `lemma`, no process words in README or Lean; the Lean file has the single `import Mathlib` plus one existing Tau Ceti module. Supply is downward only; R01 is the only ownership overlap found.

**Dependency gate** (run as instructed):

```
depcheck: 205 roadmaps, 1749 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The roadmap is in the merge order (line 316), after every supplier it names (NoncommutativeAndEquivariantIwasawa 29, PadicLocalLanglandsForGL2Qp 32, LocallyAnalyticDistributions 76; LieHighestWeight and PadicMeasuresIwasawaAlgebras are on main).

**Elaboration.** `lake env lean` on Suggested.lean from the content checkout: exit 0 in 7 s, the only diagnostic is `declaration uses 'sorry'` at line 71. `#check @` of the three declarations on a scratch copy reproduces the elaborated types of the worker's signatures file; the theorem keeps `Fact p.Prime`, `p ≠ 2`, `[Module ℚ_[p] M]`, `[IsScalarTower …]` and `[FiniteDimensional ℚ_[p] M]` explicitly, matching README §3.8's statement ("finite-dimensional over ℚ_p, the scalars acting through the algebra") exactly; no binder was lost.

**Padding probe.** Replacing the `sorry` by `infer_instance` fails (no `IsSemisimpleModule` instance for the tensor-product ring); `simp`/`rfl` cannot apply to a class goal. The theorem is a headline (AW13 line 3704–3706, Theorem 11.1(a)); the two definitions are the simple carriers it needs. No padding. `firstCongruenceSL2` and `firstCongruenceProduct` are declared nowhere else (roadmaps grep for the kernel of SL₂(ℤ_p) → SL₂(𝔽_p) and for `toZMod` in Lean files: no other owner).

**Headline theorems** (README Summary): Fu's injectivity theorem (§4.14), the semisimplicity theorem (§3.8), with the Ardakov–Wadsley microlocalisation (§3.4), D_{1/p} ≅ Û (§3.5), faithfulness of affinoid Verma modules (§4.13), Frommer and the crossed product (§§2.3–2.4), the isotypic comparison (§3.10), strong duality (§4.3), the algebraic Peter–Weyl theorem (§5.2) and the Fréchet–Stein property of 𝒰(g) (§2.5) as the deep results. The semisimplicity theorem is stated; each other one is named in the module docstring with its missing carrier, and I confirmed at the pin that `AdicCompletion` is a ring only for a commutative ring at its own ideal (`Mathlib/RingTheory/AdicCompletion/Algebra.lean` line 97), that no distribution algebra, Banach step, Ore microlocalisation of a filtered ring or Arens–Michael envelope exists in Mathlib or Tau Ceti (greps of both trees), and (R07) what Peter–Weyl actually lacks.

**Library declarations opened at the pin.** Mathlib: `IsSl2Triple` (`Mathlib/Algebra/Lie/Sl2.lean` 38), `LieAlgebra.SpecialLinear.sl` (`Mathlib/Algebra/Lie/Classical.lean` 92), `Matrix.SpecialLinearGroup.map` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` 225), its topology and `isTopologicalGroup` (`Mathlib/Topology/Algebra/Group/Matrix.lean` 83, 125), `PadicInt.toZMod` (`Mathlib/NumberTheory/Padics/RingHoms.lean` 300), `OreLocalization.OreSet` (`Mathlib/GroupTheory/OreLocalization/OreSet.lean` 52), `IsRingFiltration` (`Mathlib/RingTheory/FilteredAlgebra/Basic.lean` 73), `Module.FaithfullyFlat` (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean` 63), `IsSemisimpleModule` (`Mathlib/RingTheory/SimpleModule/Basic.lean` 65), `NormedSpace.exp` (`Mathlib/Analysis/Normed/Algebra/Exponential.lean` 127), `Subalgebra.topologicalClosure` (`Mathlib/Topology/Algebra/Algebra.lean` 263), `Algebra.TensorProduct.rid` (`Mathlib/RingTheory/TensorProduct/Maps.lean` 274), `AbstractMeasure` (`Mathlib/NumberTheory/Padics/Measure/Topology.lean`), `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean` 46), `AdicCompletion` (commutative only, as the README says). Tau Ceti: `TauCeti.completedGroupAlgebra` (`…/CompletedGroupAlgebra/Basic.lean` 145: the inverse limit of `R[Γ ⧸ U]` over open normal U; for the compact G₁^m with the subtype topology this is ℤ_p[[G₁^m]], and the definition needs no topological-group instance), `TauCeti.casimirElement` and `casimirElement_mem_center` (`TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean` 128, 178: Σ x_i y_i over a basis and its Killing-dual basis, needing `IsKilling` and finite dimension, which sl₂ over a field of characteristic zero satisfies), `span_orderedPBWMonomials_eq_pbwFiltration` (`…/PBW/Ordered.lean` 157), `pbwFiltration` (`…/PBW/Basic.lean` 78), `IsCompactModule.completedGroupAlgebraModule` (R07). Every Mathlib and Tau Ceti name the README cites exists at the pins.

**Cross-roadmap citations resolved** (every one in the README, at the heads above): PadicLocalLanglandsForGL2Qp §0.1 (LA(X,L), D(H,L), convolution as the transpose of multiplication with δ_g ∗ δ_h = δ_{gh}, Dirac/pushforward/open-subgroup comparisons, Fréchet–Stein for D(H,L) with noetherian radius algebras and flat transitions, coadmissibility and its independence of the cofinal sequence, the anti-equivalence, faithful flatness of F[[H]] → D(H₀,L) on both sides, Schikhof duality citing ST02B Theorem 3.5, which I opened at ST02B line 547–553); NoncommutativeAndEquivariantIwasawa §0.1 (uniform predicate, dimension), §0.2 (`analytic_exists_open_uniform`, line 180–184), §0.3 (Λ(H) free over Λ(H′), crossed product for H′ normal), §0.5 (Zariskian, noetherian, domain), §0.6 (ordered coordinates, c(p^nℤ_p^d) = U^{p^n}), §0.7 (p-valuations, (HYP)-style saturation, ω_U = 1 + min v_p(x_i) for odd p), §0.8 (ordered series, rationalisation, gr_ω O[[G]] ≅ gr O ⊗_{𝔽_p[P]} U(gr G) when p is a uniformiser, Schneider Theorem 28.3), §F.1 (noetherianity on both sides, canonical topology, categorical Ext); LocallyAnalyticDistributions §0.0 (locally convex limits, strict maps), §0.1 (Amice's theorem), §0.2 (Hahn–Banach over a spherically complete field, Fréchet open mapping, compact-type extensions, line 45), §0.3 (polydiscs, charts, atlas independence, products, strong duality for analytic compact-type spaces, line 1466); PadicMeasuresIwasawaAlgebras Layer 0 (D(X,R) = C(X,R)′ as `AbstractMeasure`, Dirac separation, density of locally constant functions), §1.2 (convolution (μ∗ν)(f) = μ(x ↦ ν(y ↦ f(xy))), line 587, the order the README's Convention 3 states), §1.7 (comparison with `TauCeti.completedGroupAlgebra`); LieHighestWeight Layer 0 (V(n) = Sym^n, irreducibility), Layer 3 (PBW over a field, Verma modules), Layer 5 (Weyl complete reducibility), Layer 7 (Z(U(L)), Harish-Chandra, central characters). The two downstream names (LocallyAnalyticRepresentationsOfLocalGroups, Fu's applications) are consumers, not suppliers.

**Declared gaps.** `gap:frechet-stein-general` and `gap:radius-algebras` appear with the same slugs, supplier PadicLocalLanglandsForGL2Qp and section §0.1 in design/plan.json (lines 4363–4376) and in the README under the supplier's subsection (lines 55, 57). Each `needs` sentence is a precise list with ST03 locators (§3 Corollaries 3.1–3.5, Lemma 3.6, Proposition 3.7, Lemma 3.8; §4 Lemmas 4.1–4.4, Theorem 4.5, Remark 4.6, the remark before Lemma 4.4), all of which I opened (ST03 lines 348–476, 803–935). Neither asks for what exists: PadicLocalLanglandsForGL2Qp §0.1 at head states Fréchet–Stein and coadmissibility for D(H,L) only and never the coordinate norms; LocallyAnalyticDistributions has no Fréchet–Stein notion; OverconvergentAutomorphicForms (#1422, line 19) itself records PadicLocalLanglandsForGL2Qp §0.1 as the owner of "Fréchet–Stein presentations, coadmissible modules".

**Sources at the sampled targets** (all read in the cached texts; theorem numbers, pages and hypotheses agree unless noted):

- 0.1: AW13 line 3117–3143 (§10.2, the three operations citing DDMS Theorem 4.30, powerful, (1/p)R L_G free of rank d); FU24 line 572–589 ((10)–(12), g_R = (1/p)L_G ⊗ R). Supported; ownership is R01.
- 1.2: ST02 line 514–526 (Lemma 3.1 proof: D(G) = ⊕ δ_g ∗ D(H)); ST03 line 1144–1200 (Theorem 5.1, Step 1: basis δ_{g_i}, conjugation-invariant norms, free of rank l); AW13 line 3326–3340 (McConnell–Robson §1.5.8 crossed product with twisting). Supported.
- 1.3: ST02 line 635–644 (Proposition 3.7: G open in G(L), G connected, Z(g) ⊗ K central, via Lemma 3.1 and the adjoint action); FU24 line 798–799. Supported; R05 concerns only the README's own counterexample wording.
- 2.1: AW13 line 645–668 (§3.4 Example (c)), 682–714 (§3.5 deformations), 747–769 (§3.7 completion, Gr(Â_{n,K}) ≅ gr A/π), 770–781 (§3.8), 797–803 (§3.9 Lemma (a)–(c), [K′:K] < ∞ in (c)); 3217–3227 (§10.4 display). Supported, including the finiteness hypothesis the README records.
- 2.3: KOH07 line 654–705 (Schneider–Teitelbaum theorem, Frommer's theorem for r ∈ p^ℚ, 1/p < r < 1, the basis b^α with 0 ≤ α_i < ℓ_i, the description of U_r, Corollary 1.4.1 and the formula for ℓ_i at line 697–699); FU24 line 846–853 ((27)). Supported.
- 3.1: AW13 line 402–427 (§2.3 Zariskian, §2.4 Lemma (a)–(c), Definition, Corollary: flatness, Q_T(A) ⊗ M ≅ Q_T(M), Q_T(M) = 0 iff M_S = 0). Supported.
- 3.3: AW13 line 3228–3234 (S = {gr x = (gr p)^a} = ⋃(p^a + m^{a+1})), 3298–3308 (S_n, conjugation-stable); FU24 line 686–694 ((17)). Supported; the ramified-R problem with (17) is recorded below.
- 3.4: AW13 line 3235–3282 (Theorem 10.4 and proof: exp on L_G ⊆ ph, ψ(b^α) ≡ p^{|α|}u^α, strictly filtered, gr(ψ_K)(t) = s, surjective by completeness), 3283–3297 (Remarks (a)–(d)), 3314–3354 (Proposition 10.6 (a)–(e)); FU24 line 695–699 ((18)). Supported.
- 3.5: AW14 line 609–666 (§5.1 standing p odd, §5.2 Lemma and proof: Cohen's theorem, K′ unramified, AW13 Theorem 10.4 and Lemma 3.9(c)); AW13 line 3291–3293 (Remark 10.5(c)); FU24 line 1041–1042. Supported; the "sup finite" description in the proof is a misprint (below).
- 3.6: AW13 line 797–803 (Lemma 3.9); FU24 line 686–699. Supported.
- 3.10: FU24 line 700–747 (standing assumption g_K split semisimple, W irreducible with a U(g_R)-lattice, (19)–(20), Theorem 4.3 and proof, including the use of AW13 Proposition 11.1 with n = 0 and Û·Ãnn ⊆ Ânn). Supported.
- 4.2: FU24 line 762–780 (Borel pair, triangular decomposition, HC (24), dχ, "induced"); Remark 5.8 at line 1014–1016. Supported; see R04 and the Remark 5.8 issue below.
- 4.5: FU24 line 792–817 (Theorem 5.2 and proof: ST02 Prop 3.7, sequence (25)–(26), ST03 Theorem 6.3, X = G/B with a splitting, nowhere vanishing f₀, f₀·C^sm dense). Supported.
- 4.13: AW14 line 422–431 (Theorem 4.4, simply connected), 447–458 (affinoid Verma module), 480–509 (Lemma 4.6 (a)–(c) and Theorem 4.6 with p very good), 728–751 (§5.4 conditions and Theorem 5.4 with its proof through Propositions 4.7, 4.8 and Theorem 5.3). Supported.
- 5.2: FU24 line 1072–1115 (degree filtration, (n+1)² count, x^k generating W_k ⊗ W_k^*, closedness, ST02a for the maximal W_k-quotient, AW13 Theorem 11.3, (32) with the two proofs of surjectivity). Supported; the "lower upper triangular" slip is below.
- Headline §3.8: AW13 line 3588–3598 (§10.12 conditions on the uniform G: p^{m+1}g = R ⊗ L_G for the connected split reductive 𝔾 of §4.7, line 1006–1007, assumed semisimple, p very good), 3653–3730 (§11.1: definitions, Proposition, Theorem (a)–(b), Corollary; "drop the restriction on p" at line 3654), 3107 (v(p) = 1, so R = ℤ_p is allowed). Supported.
- Also opened for the findings and the table: AB07 line 612–629 (Lemma 5.4 and Corollary, as §4.9 states them); SCHM13 line 196–230 (Propositions 3.2.1, 3.2.3, U_r(g) noetherian with Û(g) → U_r(g) flat), 625–629 (Theorem 4.3.3); BCGP25 line 1112–1157 (§2.2.29, Remark 2.2.30, Definitions 2.2.31 and 2.2.33, §2.2.34, Proposition 2.2.35); FU24 line 234–243 (Lemma 2.2), 447–480 (Lemma 3.3), 822–875 (Proposition 5.3 and proof with the norm computation), 876–930 ((28)–(29), Proposition 5.5), 975–1009 (Theorem 5.7 and proof), 1017–1043 (proof of Theorem 5.1), 157–175 (Theorem 1.5, the remark that it follows from AW14), 598–603 (Lemma 4.1), 941–969 (Lemma 5.6), 1065–1115; ST02 line 376–401 (Lemma 2.4 with the factor (−1)^{|n|} n!), 457–483 (the limit formula); ST03 line 449–473 (Proposition 3.7 and the display A/I ≅ lim A_n/A_nI), 803–832 ((HYP) and the remark on uniform groups), 872–935 (Theorem 4.5, Remark 4.6, Lemma 4.8).

**Adversarial table** (statement; instances; values computed; result; change):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Conv. 6: the three forms of Δ | ef = fe + h | ½h² − h + 2(fe + h) = ½h² + h + 2fe; ½h² + ef + fe = ½h² + h + 2fe | equal | none |
| Conv. 6: Δ on Sym^k, Verma(a) | k = 0, 2; a | Δx^k = (½k² − k + 2k)x^k; k = 2 gives 4; a: ½a² − a + 2a = ½a(a+2) | matches §4.1 Check, §4.12 | none |
| Conv. 6: Δ = 4·casimirElement | sl₂ | κ(h,h) = 8, κ(e,f) = 4; dual basis (h/8, f/4, e/4); Σ = h²/8 + (ef+fe)/4 = Δ/4 | holds; Tau Ceti's Ω is basis-independent (`casimirElement_eq_sum`) | none |
| Conv. 9: induced parameter | c | ½c² + c, 2λ+1 = (c+1)² | holds | none |
| §0.2 index of G₁ | p = 3, 5 | p(p²−1) = 24, 120 | holds | none |
| §0.2 −I₂ at p = 2 | p = 2 | −1 − 1 = −2 ≡ 0 mod 2, order-2 element, not uniform | holds | none |
| §0.3 lower p-series indices | G₁ | kernels mod p^{n+1}, successive index p³ = |sl₂(𝔽_p)| | holds | none |
| §1.1 Check 1 (sign) | G = ℤ_p, f = z² + 3z | f′(0) = 3; opposite sign −3 | holds | none |
| §1.1 commutator convention | exp(sx)exp(ty) vs reversed | second mixed derivative difference = st[x,y] term, giving [x,y]~; reversed convolution gives −[x,y]~ | holds | none |
| Conv. 3 vs ST02 Lemma 2.4 | ordered monomial x^α on t^β | ∂^α t^β at 0 = α!δ_{αβ}; ST02 line 395 has (−1)^{|n|}n! for exp(−tx) | consistent | none |
| §1.3 O(2) remark | G = SO(2)(ℤ_p) | open in O(2)(ℚ_p) (index 2), Ad fixes x, x central | README sentence too strong | R05 |
| §2.1 Check 1 | h = R·u, K⟨u⟩ | Σπ^n u^n ∈ (coefficients → 0), Σu^n ∉; Û(π^n h)_K = K⟨π^n u⟩ radius |π|^{−n} | holds | none |
| §2.1 Check 4 | Σ(πu)^n | coefficients in basis (πu)^n all 1, not → 0 | holds | none |
| §2.2 Check 2 | G = ℤ_p, r₁ = p^{−1/p} | r₁^{p^k}/|p^k| = p^{k − p^{k−1}}: k = 0: p^{−1/p}; k = 1: 1; k = 2: p^{2−p} ≤ p^{−1} | max 1 at k = 1 | none |
| §2.2 Check 4 | 1/p < r < p^{−1/(p−1)} | |1/n|r^n < r for n ≥ 2 (n = p: pr^p < r iff r^{p−1} < 1/p); exp(x) = Σx^n/n! converges iff r < p^{−1/(p−1)}, so T ∈ U_r | U_r = D_r | none |
| §2.3 ℓ_i | KOH07 line 697–699 | same maximiser formula | matches | none |
| §2.4 (i) | r_n = p^{−1/p^n} | r_n^{p^k}p^k = p^{k − p^{k−n}}; k = n: p^{n−1}; k = n+1: p^{n+1−p} < p^{n−1} for p ≥ 3; k < n: < k ≤ n−1 | max p^{n−1} at k = n | none |
| §2.4 (ii) | exp(p^n x_i) | |p^{nk}/k!| p^{(n−1)k} = p^{−k + v_p(k!)} ≤ p^{−k(p−2)/(p−1)} → 0 for p ≥ 3 | converges | none |
| §2.5 Check 1 | g = E·x | Σx^n/n! ∈ U(g)_r iff r < p^{−1/(p−1)} < 1; not in 𝒰(g) | holds | none |
| §3.1 Check 3 | ℤ_p[[X]], T = powers of gr p | p + X² has symbol gr p (deg X² = 2); X has degree 1 ≠ gr p; F₀ of A_S completes to ℤ_p⟨X/p⟩ | holds | none |
| §3.3 Check 4 | R = ℤ_p[√p] | p = ϖ² ∈ m², 0 = p − p ∈ p + m² | S₀ ∋ 0, not an Ore set of regular elements | none (source issue 3) |
| §3.7 Check 1 | trivial module | ε(s) ∈ p^a + p^{a+1}R, nonzero | S₀ invertible, K̂ = K | none |
| §3.7 Check 3 | G = 1 + pℤ_p, M of functions on G/G^p | (1+b)^p − 1 = exp(p²u) − 1 = p²u·v, term k of v has norm p^{−2k + v_p((k+1)!)} ≤ p^{−2k + k/2} < 1 | M̂ ≅ ℚ_p⟨u⟩/(u) = ℚ_p | none |
| §3.7 Check 4 | same M over D(ℤ_p) | (1+T)^p − 1 has p zeros ζ − 1 with |ζ−1| < 1; D/(f) ≅ ℚ_p^p-dimensional | p vs 1 | none |
| §3.8 headline at m = 0 | G₁^0 = 1 | ℚ_p ⊗ ℤ_p[[1]] = ℚ_p; vector spaces are semisimple | holds | none |
| §3.8 counterexample | G = ℤ_p | K[[G]]/((γ−1)²) nonsplit extension of K by K | semisimplicity needs semisimple 𝔤 | none |
| §3.9 Check 4 | K ∋ ζ_p, character of G₁/G₁^p ≅ (ℤ/p)³ | sl₂ perfect ⇒ 1-dim Lie modules trivial | Artin, not Lie | none |
| §4.1 last Check | r = p^{−2/3}, λ = p^{−1} | ‖log(1+H)‖_r = r (needs r < p^{−1/(p−1)}: 2/3 > 1/(p−1)); ‖h‖ = p^{1/3}; ‖Δ‖ ≤ p^{2/3} < p = |λ|; Δ − λ unit | D^λ_r = 0 | none (source issue 4) |
| §4.2 Check 3 | p = 3, 5; λ = 1 | 2λ+1 = 3: v₃ = 1 odd; mod 5: 3 ∉ {0,1,4} | not induced | none |
| §4.2 Check 4 | λ = 3 at p = 3, 7 | 7 ≡ 1 mod 3 square by Hensel; v₇(7) = 1 | induced / not | none |
| §4.2 Borel independence | n vs n̄ | HC(Δ) = ½h² ± h, 2λ+1 = (c ± 1)², c ↦ −c | same set | none |
| §4.4 infinitesimal character | left translation, z central | dλ(z) = L_{S(z)}; S(Δ) = Δ for sl₂; sl₃ cubic Casimir changes sign on duals | general-𝔾 wording off | R04 |
| §4.7 (i) symbol | 1/p < r′ < p^{−1/2} | degree-2 terms r′²; ‖p·log(1+H)‖ = p^{−1}r′ < r′² iff r′ > 1/p; |p²λ| ≤ p^{−2} < r′² | symbol ½H² + 2EF | none |
| §4.7 (i) irreducibility | ½H² + 2EF over 𝔽_p, p odd | nondegenerate ternary form ⇒ absolutely irreducible | domain | none |
| §4.7 (ii) closedness | r ∉ p^ℚ | D_r noetherian unknown (ST03 line 876) | route via §4.8 | R03 |
| §4.7 (iii) range | p = 3, 5 | p^{−1/2} < p^{−1/(p−1)} iff p ≥ 5; empty at p = 3 | holds | none |
| §4.7 sketch at r_n | symbol of log(1+X) | max at k = n only ⇒ symbol p^{−n}X^{p^n}; p²Δ symbol p^{−2n}(½H²+2EF)^{p^n} by Frobenius | nilpotents in gr | none |
| §4.8 (i) isometry | x^α = p^{−|α|}Π log(1+b_i)^{α_i} | ordered expansion with leading b^α and other terms of smaller norm when r < p^{−1/(p−1)}; ‖x^α‖ = (pr)^{|α|} | holds for real r | none |
| §4.8 (ii) division | h² = 2(Δ−λ) + 2λ + 2h − 4ef, ρ ≥ 1, |λ| ≤ 1 | norms 1, ρ, ρ² ≤ ρ² | bounded division | none |
| §4.9 | AB07 Lemma 5.4 | right T-module M, Ext^i_T(M,T) ≅ Ext^i_R(M,R) as left R-modules; α(f) = Σ f(ḡ)ḡ⁻¹ | matches | none |
| §4.10 weight | r_n | ‖pe‖ = p^{n−1} ⇒ ‖e‖ = p^n; weight-p^n null sequences ⊂ weight-1 null sequences | injection on normal forms | none |
| §4.11 (i) grade | torsion right module over a domain | Hom(M, A) = 0 ⇒ j ≥ 1; j_T = j_U by §4.9; j_U(U) = 0 | contradiction as sketched | none |
| §4.12 | λ ∈ ℤ_p, a = −1 + √(1+2λ) | a² + 2a = 2λ, a(a+2)/2 = λ; p = 3, λ = 1: a = −1 + √3 ∈ ℤ₃[√3] | holds | none |
| §4.13 very good | type A₁ | p ∤ 2 for p odd | holds | none |
| §4.14 descent | K/ℚ_p finite | K ⊗ ℚ_p[[G]] = K[[G]] (R finite free), K faithfully flat | kernel zero | none |
| §5.1 dimensions | n = 0,1,2,3 | C(n+3,3) − C(n+1,3) = 1, 4, 9, 16; identity (n+1)(6n+6)/6 | holds | none |
| §5.1 Check 4 | {±I₂} | x − w vanishes | not injective | none |
| §5.2 (ii) invariances | n upper, n lower | (gn)₁₁ = g₁₁ for upper n; g₁₁ + a g₁₂ for lower; (ng)₁₁ = g₁₁ for lower n | source slip 9 confirmed | none |
| Source corr. 5 flatness remark | G = ℤ_p, T − t, r′ < |t| ≤ r | (T−t)⁻¹ = −t⁻¹Σ(T/t)^n converges in D_{r′}; T − t not a unit in D_r | not faithfully flat | none |
| Lean carrier | ↥(firstCongruenceProduct p m) | subtype topology of Fin m → SL₂(ℤ_p) (Matrix Pi topology); compact; kernels mod p^k cofinal | completedGroupAlgebra = ℤ_p[[G]] | none |

**Shape and completeness.** README has Summary, Scope and ownership (deferrals by section), Conventions with computed witnesses, Exact supplier contracts (Mathlib, Tau Ceti, five roadmaps, two gaps), How to read the build, six layers each with Examples and Dependencies, Downstream consumers, Worked examples, Source corrections, References. Every definition (§§0.1, 0.2, 1.1, 2.1, 2.2, 2.5, 3.1, 3.3, 3.7, 3.9, 4.1, 4.2, 4.4, 5.1) carries an API list and at least three discriminating Checks (counted: 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4); every theorem has hypotheses and a locator; the only backticked names of this roadmap's own are the three declarations of Suggested.lean. Unicode mathematics, no LaTeX delimiters, no process words, no pull-request numbers, no absolute paths. The manifest records every cited work once with `cited_for`; SCH11 is `uncertified` as settled.

## Not verifiable

- Schneider, *p-Adic Lie Groups* (SCH11, uncertified, paywalled): the locators in §0.1 (Corollary 31.7 p. 229, Theorem 32.1 p. 232) and §3.2 (Theorem 28.3 p. 199) are cited by number without the text; the §3.2 locator agrees with NoncommutativeAndEquivariantIwasawa §0.8's citation of the same theorem and page.
- AW13 §9.2 (cited in §3.9 for the extension of a lattice action to Û(g_R)): the section marker was not located in the extraction's layout and I did not read it; the same construction is stated by FU24 line 700–705, which I read.
- H. Frommer's Münster preprint (the primary source of §2.3) is not in the manifest; the package cites it only through Kohlhaase §1.4, which summarises the theorem and the proof of Corollary 1.4.1 with the formula for ℓ_i.
- Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmaps grep over all 441 open heads and main.

## Source issues

- **Misprint** in FU24 at §4, equation (16), printed page 14: the source says D_r(G, K) is the series with bounded weighted coefficients; it should be the series whose weighted coefficients tend to zero, the bounded ones being D_{<r}; affects nothing.
- **Error** in FU24 at Theorem 4.2, printed page 14: the source says D_r(G, K) is noetherian for every 1/p ≤ r < 1 citing ST03 §4; it should restrict noetherianity to r ∈ p^ℚ and r = 1/p (ST03 Theorem 4.5(ii), Remark 4.6), multiplicativity holding for all r; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed page 14: the source says the microlocal set ⋃(p^a + m^{a+1}) is formed in R[[G]] for the integers R of any finite extension; it should take R unramified, since for ramified R the set contains 0; affects the proof (the definition of (18) over ramified R, repaired by base change).
- **Error** in FU24 at Theorem 5.7, printed page 20: the source says D^λ_r(G, ℚ_p) is an integral domain for every λ; it should assume v_p(λ₀) ≥ 2, since its own first branch gives the zero ring when v_p(λ₀) ≤ 1; affects a stated result.
- **Gap** in FU24 at proof of Theorem 5.7, printed page 20, as used in the proof of Theorem 5.1, page 21: the source says the graded ring of D^λ_r for the weaker norm is the quotient by the symbol via Lemma 2.2; it should also show the induced filtration on D^λ_r is separated, which is not established at the radii r_n; affects the proof (Theorem 1.5 is unaffected, following from AW14).
- **Error** in FU24 at Remark 5.8, second bullet, printed pages 20–21: the source says λ is induced iff v_p(λ₀) ≥ 2; it should say induced implies v_p(λ₀) ≥ 2, the converse failing at p = 3, λ(Δ) = 1; affects nothing.
- **Misprint** in FU24 at §6, printed page 22: the source says x^k is right invariant under the "lower upper triangular" nilpotent subgroup; it should say the upper triangular unipotent subgroup; affects nothing.
- **Misprint** in AW14 at §5.2, proof of the Lemma, printed page 14: the source says D_{1/p}(G, K) is the series with sup |λ_α|p^{−|α|} finite; it should say those with |λ_α|p^{−|α|} → 0, the completion for the norm; affects nothing.
- **Misprint** in BCGP25 at Definition 2.2.31, printed page 24: the source says a left module M is coadmissible when M_{r+1} ⊗_{Û(g)_{r+1}} Û(g)_r = M_r; it should put Û(g)_r on the left for left modules; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "aa9bafa568b319b47d669db9fb03a8668064663e", "job": "REV-PKG-LocallyAnalyticDistributionsPartII", "model": "fable", "worker": "chris-x11"} -->
