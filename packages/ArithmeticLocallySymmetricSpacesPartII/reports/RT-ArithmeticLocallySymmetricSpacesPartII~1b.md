<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13108#issuecomment-6894272825 -->
Red team round 1 pass b (claude) of 8ac6e0e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Three declared gaps ask NoncommutativeAndEquivariantIwasawa for what the open roadmap LocallyAnalyticDistributionsPartII already plans

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:64`, `:72`, `:80` ("What NoncommutativeAndEquivariantIwasawa must provide (gap:flat-microlocalisation) …", "(gap:algebraic-quotient-comparison) …", "(gap:integral-central-faithfulness) …"), and the `*Needs:*` line of §1.2 (`:240`); `design/plan.json` `gaps`.

   **Claim.** The flat map A→Û, the comparison M/Ann_A(W_k)M ≅ (Û⊗_A M)/Ann_Û(W_k)(Û⊗_A M), and injectivity of A→Û/(Δ_i−λ_i) for every λ∈ℤ_p^m are missing everywhere and must be added to NoncommutativeAndEquivariantIwasawa Layer 0.

   **Witness.** LocallyAnalyticDistributionsPartII (open, merge order line 199): §3.4 (K[[G]]→Û(h)_K flat on both sides), §3.10 (M_W→M̂_W isomorphism, natural in M), §4.14 (injectivity for every λ∈ℤ_p^m, G=G₁^m, p odd); §3.8 allows congruence depth a≥0.

   **Repair.** Two owners for one object: cite the existing plan instead of asking a second supplier to build it.

   - Replace the three contract paragraphs by a subsection `### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII`: "Consume §3.4 for the microlocalisation A→Û=Û(g_{ℤ_p})_{ℚ_p}, flat on both sides (with §3.7 for M̂=Û⊗_A M); §3.10 for the natural isomorphism M/Ann_A(W)M→M̂/Ann_Û(W)M̂ for a finitely generated A-module M and an absolutely irreducible W with a stable lattice, applied to W=W_k; §4.14 for injectivity of A→Û/(Δ_i−λ_i)_i for every λ∈ℤ_p^m, with the Casimir Δ_i=½h_i²−h_i+2e_if_i of its Conventions item 6." Keep the three sets of Checks under that subsection.
   - §1.2 `*Needs:*` and Layer 1 Dependencies: replace the three gap slugs by `LocallyAnalyticDistributionsPartII §3.4; LocallyAnalyticDistributionsPartII §3.10; LocallyAnalyticDistributionsPartII §4.14`. Keep `gap:generic-cyclic-growth` (LocallyAnalyticDistributionsPartII's scope excludes Fu §3) and retarget its sentence "Supplier section" only if the intake prefers one supplier for the Û material.
   - Remove the three slugs from `design/plan.json` `gaps` (or, if the gap list may not shrink at this stage, retarget their `supplier` to `LocallyAnalyticDistributionsPartII` with `section` §3.4, §3.10, §4.14).
   - Scope paragraph (`README.md:9`): "the missing analytic and rank inputs have individual supplier gaps" → name LocallyAnalyticDistributionsPartII as owner of microlocalisation, the isotypic comparison and central specialisation.

   Tested on a scratch copy with the §1.2 Needs line so changed: the dependency check prints `moved: ArithmeticLocallySymmetricSpacesPartII moved in the merge order from #180 to #199, right after its last supplier LocallyAnalyticDistributionsPartII` and `depcheck: 245 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD or CYCLE line.

2. **F02** (P2) §0.3 re-plans the algebraic Peter–Weyl quotient and the W_k properties owned by LocallyAnalyticDistributionsPartII §5.2

   **Location.** `README.md:185` ("Prove that its rational action has image `End_{ℚ_p}(W_k)`, hence `A/Ann_A(W_k)≃End_{ℚ_p}(W_k)`") and the Scope sentence `README.md:9` ("Their compact-open restriction, rational action quotient … are applications here").

   **Claim.** This roadmap owns W_k on G=G₁^m with absolute irreducibility, self-duality, and the action quotient A/Ann_A(W_k)≅End(W_k) (fu24 (32)).

   **Witness.** LocallyAnalyticDistributionsPartII §5.2 proves, for p odd, G=G₁^m, k∈ℕ^m: (i) W_k absolutely irreducible and self-dual on every open subgroup; (iii) `K[[G]]/Ann(W_k) ≅ End_K(W_k)`, citing the same fu24 §6 (32). Its §0.2 defines the first congruence product.

   **Repair.** In §0.3 keep what is this roadmap's own (the lattice W_k⁰, dim W_k=D(k+1), the finite-extension compatibility and the Checks) and replace the owned statements by a citation: "Absolute irreducibility on G, the G-equivariant self-duality W_k≃W_k^* and the action quotient A/Ann_A(W_k)≃End_{ℚ_p}(W_k), of dimension D(k+1)², are LocallyAnalyticDistributionsPartII §5.2 (i) and (iii); the group G is its §0.2." Delete the Burnside-density proof route for the quotient (or keep it as a Check at p=3, m=1, k=1, where the README already computes the span M₂(ℚ₃)). Add `LocallyAnalyticDistributionsPartII §5.2` to §0.3 Needs and Layer 0 Dependencies; correct the Scope sentence accordingly. The merge-order move is the one tested in R01.

3. **F03** (P2) LieHighestWeight Layer 0 is cited for statements it does not make

   **Location.** `README.md:9` ("LieHighestWeight Layer 0 owns split characteristic-zero sl₂ highest weights"), `:114` ("Consume Layer 0’s split characteristic-zero sl₂ highest-weight classification, irreducibility and dimension n+1"), Needs of §0.3 (`:198`) and §5.1 (`:569`), Dependencies of Layers 0 and 5.

   **Claim.** Layer 0 of LieHighestWeight (on main) supplies the classification, irreducibility and dimension of the sl₂-modules V(n) over a split characteristic-zero field.

   **Witness.** `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` on main: heading "## Layer 0: normalized rank-one tensor comparisons" (tensor strings over ℂ); its former-numbering table sends "Layer 0: `sl₂` representation theory" to Tau Ceti `TauCeti.exists_int_of_hasEigenvalue`, `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`, `TauCeti.Sl2Std.isInternal_cgSummand`.

   **Repair.** Move the citation to the pinned declarations, in "### From Tau Ceti": "Use the standard sl₂-module `TauCeti.Sl2Std` with `TauCeti.Sl2Std.finrank_eq` (dimension n+1), `TauCeti.Sl2Std.isIrreducible` (irreducible over a field of characteristic zero) and `TauCeti.Sl2Std.raise_basis_zero`, in TauCeti/Algebra/Lie/Sl2/Standard.lean; `TauCeti.Sl2Std.existsUnique_nonempty_lieModuleEquiv` in TauCeti/Algebra/Lie/Sl2/Classification.lean (a finite-dimensional triangularizable irreducible sl₂(K)-module is V(n) for exactly one n); `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` in TauCeti/Algebra/Lie/Sl2/WeightString.lean. None of them identifies `Sym^n(K²)` under `TauCeti.symPowerRep` with `Sl2Std K n`; that comparison, over ℚ_p and over ℂ, is a target of §0.3." Then: delete the subsection "### From TauCetiRoadmap.LieHighestWeight" except its sentence on Layer 3 (PBW), which is correct; in the Scope paragraph replace "LieHighestWeight Layer 0 owns split characteristic-zero sl₂ highest weights" by "Tau Ceti supplies the sl₂-modules V(n), their irreducibility and classification"; in the Needs of §0.3 and §5.1 and in the Dependencies of Layers 0 and 5 replace `LieHighestWeight Layer 0` by `Tau Ceti TauCeti.Sl2Std.isIrreducible; Tau Ceti TauCeti.Sl2Std.finrank_eq` (§5.1: also `TauCeti.Sl2Std.raise_basis_zero`). Add to §0.3 the API bullet "`Sym^n(K²)`, differentiated, is isomorphic to `Sl2Std K n` as an sl₂(K)-module, for K a field of characteristic zero."

4. **F04** (P2) S_κ(K_f), the carrier of the headline cusp-form bound, is never defined; the identity of §4.1 depends on the definition

   **Location.** `README.md:495` ("giving `dim H_cusp^q(Y(K_f),V_κ)=2^{r₁}dim` S_κ(K_f)") and `:509` (§4.2). S_κ(K_f) first occurs at `:13` as "the adelic carrier S_κ(K_f)" and has no defining target, no signature and no Checks.

   **Claim.** For neat K_f and dim V_κ>1 the cuspidal cohomology in degree q=r₁+r₂ has dimension exactly 2^{r₁}·dim S_κ(K_f).

   **Witness.** By §ALS.5b.5, dim H_cusp^q=Σ_{ε∈{±}^{r₁}} m_ε, one summand per discrete-series sign pattern. Complex conjugation gives only m_ε=m_{−ε}; for r₁≥2 nothing equates (+,+) with (+,−) at fixed K_f.

   **Repair.** Add to §4.1 the definition and state only what is proved:

   "For κ and a compact open K_f⊂SL₂(𝔸_F^∞), and a sign pattern ε∈{±}^{real places}, let π_κ^ε=⊗_{v real}D_{κ_v}^{ε_v}⊗_{v complex}π_{κ_v,0}, where D_k^± are the holomorphic and antiholomorphic discrete series of SL₂(ℝ) of weight k and π_{2n+2,0} is the unitary principal series of SL₂(ℂ) with nonzero (𝔤,K)-cohomology against E_n (fgt10, (1.6)–(1.8) and (3.9)). Put m_ε(κ,K_f)=dim Hom_{SL₂(F_∞)}(π_κ^ε, L²_cusp(SL₂(F)\SL₂(𝔸_F))^{K_f}) and S_κ(K_f)=Hom_{SL₂(F_∞)}(π_κ^{+}, L²_cusp(SL₂(F)\SL₂(𝔸_F))^{K_f}), so dim S_κ(K_f)=m_{+}. For neat K_f and dim V_κ>1, dim H_cusp^q(Y(K_f),V_κ)=Σ_ε m_ε(κ,K_f), and m_ε=m_{−ε}. Hence dim S_κ(K_f)≤dim H_cusp^q; the sum equals dim S_κ for r₁=0 and 2 dim S_κ for r₁=1. For r₁≥2 the equality with 2^{r₁}dim S_κ(K_f) is asserted only when K_f is normalised by elements diag(a,1), a∈F^×, realising every sign pattern."

   Checks to add: (1) r₁=0, F=ℚ(i): one pattern, dim H¹_cusp=dim S_κ. (2) F=ℚ (r₂=0, outside §4.2 but inside §4.1): Γ=SL₂(ℤ), κ=12: m_+=m_−=1 and dim H¹_cusp(Sym^{10})=2. (3) K_f=principal level 𝔫 with a unit of every sign pattern: all m_ε are equal. The §4.2 route needs only dim S_κ≤dim H_cusp^q≤dim H^q, so §4.2, §4.3, §4.4 and `Suggested.lean` are unchanged; in the §4.2 route replace "§4.1 for nontrivial coefficients" by "the inequality dim S_κ≤dim H_cusp^q of §4.1". Correct the first Check of §4.1 ("At signature (0,1), the cusp-form and degree-one cuspidal dimensions agree") to cite the definition, and the module docstring of `Suggested.lean` needs no change.

5. **F05** (P3) gap:skew-rank asks for the Ore division ring without saying what Mathlib already constructs

   **Location.** `README.md:96` ("For a two-sided noetherian domain R, construct its classical Ore division ring Q(R) and the finite skew rank …").

   **Claim.** The division ring Q(R) has to be constructed by the supplier.

   **Witness.** Pinned Mathlib, Mathlib/RingTheory/OreLocalization/Ring.lean:209–211: `variable {R} [Ring R] [Nontrivial R] [NoZeroDivisors R] [OreSet R⁰]` and `instance : DivisionRing R[R⁰⁻¹]`. No file under Mathlib/RingTheory/OreLocalization mentions `IsNoetherian`.

   **Repair.** Narrow the `needs` sentence to what is missing: "For a left and right noetherian domain R, prove the left and right Ore conditions for R⁰ (an instance of Mathlib `OreLocalization.OreSet R⁰`), so that Mathlib's `OreLocalization` R[R⁰⁻¹] with its `DivisionRing` instance (Mathlib/RingTheory/OreLocalization/Ring.lean) is the classical division ring Q(R); define the skew rank `dim_{Q(R)}(Q(R)⊗_R M)` on finitely generated left R-modules and prove it finite, additive on exact sequences, zero exactly for torsion modules and equal to a on R^a." Add the Mathlib declaration to "### From Mathlib", and make the same edit to the `needs` of `skew-rank` in `design/plan.json`.

6. **F06** (P3) Three locators name the wrong page or edition

   **Location and witness.**

   - `README.md:718` (E2): "§5, Remark 5.8, p. 21". fu24 line 1010: Remark 5.8 begins on p. 20 (page 21 starts at fu24 line 1012).
   - `README.md:726` (E3): "used in Theorem 5.1, p. 21". fu24 line 782: Theorem 5.1 is stated on p. 16; only its proof (fu24 line 1017) is on p. 21.
   - `README.md:796`: "Astérisque 46 (1977), Numdam" with the link `AST_1983__46__1_0`. serre77 line 2: the text read is the 1983 printing; the page numbers 20, 52 and 169 are its printed pages (serre77 lines 625–634, 1521–1531, 5191–5198).

   **Repair.** E2: "Remark 5.8, pp. 20–21". E3: "used in the proof of Theorem 5.1, p. 21 (statement p. 16)". References: "Astérisque 46, Société Mathématique de France, third edition 1983 (first edition 1977), Numdam; page numbers are those of the 1983 printing."

Six findings: R01–R04 are P2, R05–R06 are P3. No statement of `Suggested.lean` was found false; the blocking findings are two-owner and supplier-drift defects and one undefined carrier in a headline target.

## The pass: statements, instances and values

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `embeddingStdRep` | F=ℚ(i), γ=(i 1;−1 0), both embeddings | det=1; traces i and −i | determines the object; same-embedding model excluded by the E₁ trace 1 vs −1 |
| `weightRep` | t=0; t=(1,0) and (n,n) over ℚ(i); −I | dim 1 (not 0); −I acts by −1, resp. (−1)^{2n}=1 | agrees with §3.1 Checks |
| `finrank_groupCohomology_weightRep_le` | F=ℚ (excluded by hF): k=10, 22; 𝔞=⊥ with Γ=1, i=0; 𝔞=⊤; t=0; t=(n,0); t=(1,0) with −I∈Γ; a=1; i>3d | dim H¹=3, 5 against constant C; dim H⁰(1,V_t)=∏(t_σ+1), so a·dim≤C∏ fails as a→∞; Γ=SL₂(O_F); bound C; bound C(n+1) with boundary H¹ of dimension ≤2c; 0≤C; trivial bound by generators; 0 | true as typed; both `hF` and `h𝔞` are used; quantifier order ∃C ∀t,i,a matches README |
| `bianchi_groupCohomology_linear_growth` | F=ℚ(i), Γ=SL₂(ℤ[i]): n=0, n=99, n=100; −I | H¹(Γ,ℂ)=0, so n₀≥1 needed; base-change slopes 1/3·100≈33.3 and 1/12·101≈8.4; (−1)^{2n}=1 | true as typed; c≤1/12 from base change at ℚ(i) |
| §0.1 B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=1; I=∅ | 2+3·2·4=26; constant; D=1 | correct |
| §0.2 saving | proper s, j∉s, a≤x_j | ∏_{i∈s}x_i≤D/x_j≤D/a; diagonal t^{m−1} | correct |
| Casimir Δ=½h²−h+2ef | highest weight k=0,1,k | ef·v=k·v; ½k²−k+2k=½k(k+2); 0, 3/2 | correct, equals ½h²+ef+fe |
| §0.3 | p=3, m=1, k=1: 1+3e, 1+3f; k=(1,2); p=3, k=3 | e, f, ef=E₁₁, fe=E₂₂ span M₂; dim 6, quotient 36; binomial 3 divisible by 3 | correct (ownership: R02) |
| §1.1 | M=A | both sides dim W | correct |
| §1.2 strips | α=(3,3), k=(1,t); m=1, k≥α | dim W_k=2(t+1)≤6(t+1)+12; 2α−α²/(k+1)≤2α | correct |
| §1.3, §2.1 | ℚ_p[X,Y], (X,Y); M=A/Aδ | rank 1, two generators, kernel rank 1; a=0, ℓ=1 | correct |
| §2.2–§2.5 | exact sequences | dim H₀(M)≤aD+U_T; ≥ℓD−(ℓ−a)D−U_N; dim H₁=dim H₀(N)−ℓD+dim H₀(M)≤U_N+U_M | correct |
| §2.6 | p=2, g=−I | (1−g)(1+g)=0 | hypothesis p odd used |
| §3.1 | (0,1), κ=6; (1,1), κ=(4,6); κ=2 | t=(2,2), dim 9, Δ=36, min x=3; t=(2,2,2), dim 27, Δ=144; κ−1≥κ/2 | correct |
| §3.2 | γ=(1 1;−3 −2); ℚ(i), p=5, q=3 | det 1, trace −1, order 3, unipotent mod 3; 5 splits, 3 inert | correct; matches §ALS.0.11 |
| §3.4, §4.2 | Q(x)≤(Σc)D/min x | ≤2(Σc)Δ/min κ | correct |
| §4.1 | r₁=0, 1, ≥2 | 1, 2 and 2^{r₁} sign patterns; conjugation pairs ε with −ε only | R04 |
| §4.3 | (1,1) | κ³/κ=κ² | correct |
| §5.1 | z=(1,i), n=2; n=0 | det −2i; dims (9,18,9), ranks (8,8), cohomology (1,2,1); (1,2,1) | correct |
| §5.2 | long exact sequence, n>0 and n=0 | defects ≤b_i and ≤b_{i−1}; |dim H_c−dim H|≤2c≤3c; H_c³=ℂ at n=0 | correct |
| §5.3 formula | N=1: k=2,4,…,16; N=2: k=6, 8, three types; N=3: k=2, 4, 6; ω alone | 0,0,0,0,0,1,0,1; 0,1,0 (total 1) and 0,0,1 (total 2); 0, 1, 0+0+3·1=3; ½ | correct with σ^ι≃σ; ½ confirms the hypothesis is needed |
| §5.4 traces | cuspidal character −(θ(ζ)+θ(ζ^ℓ)): ℓ=3 (S₄), ℓ=7 (S₄), odd ℓ≡2 mod 3 (S₃); fixed points of S₃, S₄ on P¹ | +2, −2, −2; 0/1/2 and 0/2 | agrees with fgt10 pp. 25–26 |
| §5.6 A_F, B_F | u=1,2,3,5,6,7,10,13 by summing types with parities | even/odd totals over 12: 1/4; 3/6; 2/2; 12/18; 18/18; 4/4; 24/30; 32/38 | A_F±B_F reproduced in all eight; A_F/B_F=(5/3)3^{s−1} |
| §5.7 | Γ′=Γ(𝔞𝔭𝔮), Q=Γ/Γ′ | eigenvalue root of unity has p-power and q-power order; dim H²(Γ)≥dim H¹_!(Γ′)^Q | correct |
| gap:skew-rank Checks | ℚ_p[X,Y]; M₂(ℚ_p) | ranks 1, 1, 0; zero divisors | correct (minimality: R05) |
| E10 | N=3, k=4, σ=ω | 3/12+1/4=½ | a real error in fgt10 Proposition 4.18 |

## Dependency check

Run as in the brief on the README at the head:

```text
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD or CYCLE line. With the R01 repair applied to a scratch copy the check prints the `moved:` line quoted in R01 and again 0 problems.

## Verified sound

- **Declarations read: 4** (2 definitions, 2 theorems). Compared with the elaborated signatures the worker supplied (`scratch/signatures.md`); no binder lost; both theorems match README §4.2 and §5.8 in hypotheses, quantifier order and generality. I ran no Lean. Imports: one Mathlib import and one Tau Ceti module that exists at the pin, in the `module`/`public import` form that 76 `Suggested.lean` files on main use. No `set_option`, `lemma`, `#eval`, sorry'd data or `True` placeholder. Padding probe: neither theorem follows from a library lemma; both definitions are used by both theorems. The three headlines not stated (§2.6, the S_κ form of §4.2, the support forms of §5.8) are named in the module docstring with the missing carriers; I agree none is statable at the pins.
- **Targets read: 30** numbered targets, six gap contracts, ten source corrections, all Checks.
- **Locators verified: 41** against the cached texts: fu24 20 (Theorems 1.2, 1.4, 1.5, Corollary 1.3, (2), p. 4; Theorem 3.2, Lemma 3.3, Proposition 3.4; (16)–(18); Theorem 4.3; Theorems 5.1, 5.7, Remark 5.8; (32)–(38) and the bound on p. 24), fgt10 10, marshall12 4, serre77 3, aw14 2, aw13 2. Three are wrong (R06).
- **Checks tested: about 90**, every Check with a numerical or structural value; values in the table above. None is false.
- **Sibling citations checked: 47 section ids** in 10 roadmaps; every heading exists at the current head or on main. Statements read and matched for §§ALS.0.11, ALS.1.5, ALS.5b.5; CompletedCohomologyPartII §§5.7, 6.3; NoncommutativeAndEquivariantIwasawa §§0.5, 0.8, F.1, 0.12, 0.14, 0.15, 1.12; GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.6, R16.2.9; ModularSymbolsPadicLFunctions §0.7; AutomorphicFormsOnReductiveGroups §§5.2–5.3; AdelicAlgebraicGroups §4.2. One mismatch (R03).
- **Pinned declarations checked: 23** (16 Mathlib, 7 Tau Ceti; `Finset.prod` and `MvPolynomial` taken as known), each with the file the README names.
- **Ownership against open work.** Searched the open heads and main for the Fu sources, the microlocalisation, the Ore rank and the four Lean names. No `Suggested.lean` declares any of this roadmap's four names. Overlap found: R01, R02. BianchiModularForms (later in the order) restricts itself to weight 2 and owns none of these targets. GL2AutomorphicRepresentationsAndTransfer §R16.6.3 is distinguished correctly in the Scope paragraph.
- **Policy.** The pull request changes only the package folder (README and one report). No pull-request numbers or process narrative in README or docstrings.
- **Gaps.** `gap:generic-cyclic-growth` and `gap:canonical-dimension-zero` are precise, declared in both places and not provided anywhere I searched. The other four: R01, R05.

Source independence: 10 passages compared with 5 sources, none shared; largest share fu24, 34 of 59 locators; contents compared with fu24: independent (Layers 0–2 draw on its §6, Layers 3–4 on its §7, Layer 5 on fgt10 §4; its §§2–5 are supplier material; no one-to-one run of sections).

## Not verifiable

- fgt10 §3.2, pp. 16–17 (restriction and corestriction) and aw13 §§10.2–10.4: cited, text not opened in this pass.
- The trace values of §5.4 at ℓ=2 (ν₂=2, 3): they agree with fgt10 Lemma 4.19 and with the parity sums of §5.6, but I did not recompute the dyadic types from their construction.
- ν_{L,n} and the class-number corrections of §5.5: compared with fgt10 Propositions 4.10–4.11 only.
- Chebotarev Layer 10 and ModularForms §10C: headings confirmed, statements not read against the use made of them.
- Whether a concrete F with r₁≥2 and K_f has unequal m_ε (R04): the argument shows the README's proof does not give equality; I did not produce a numerical example.
- Elaboration of `Suggested.lean`: not run here; I relied on the supplied elaborated signatures.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, p. 2: the source says the minimum runs over indices up to r, the degree of the field; it should be over the r₁+r₂ archimedean places indexing the weights; affects a stated result.
- **Error** in fu24 at equation (2), p. 2, and Corollary 1.3, p. 3: the source says the cusp-form dimension is that of compactly supported cohomology; it should be the interior or cuspidal subspace, as marshall12 §2.1 defines its subscript c; affects a stated result.
- **Gap** in fu24 at §1, p. 4, remark after Theorem 1.5: the source says the injectivity follows from aw14 Theorems 4.6 and 5.4; it should note that aw14 §5.4 assumes congruence index n>0, which excludes the first congruence kernel; affects the proof.
- **Error** in fu24 at equation (16), p. 13: the source says the Banach completion consists of series with bounded weighted coefficients; it should require the weighted coefficients to tend to zero; affects nothing.
- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the multiplicity formula holds for every σ with the right central parity; it should assume σ isomorphic to its conjugate by diag(−1,1) (N=3, k=4 gives ½); affects nothing.
- **Gap** in marshall12 at equation (4), p. 4: the source says the degree r₁+r₂ dimension is 2^{r₁} times the cusp-form dimension without defining the cusp-form space by sign type; it should sum the multiplicities over the 2^{r₁} sign patterns; affects nothing.

## For the human reviewers

- **Licence.** aw14 and aw13 are read from the authors' university pages (`sources.toml`, `licence_class = "author-page"`); the README's page numbers are those of these author versions, not of the journals.
- **Scope.** R01 and R02 move three contracts and part of §0.3 to LocallyAnalyticDistributionsPartII, which places this roadmap after it in the merge order (line 180 to line 199); whether the gap list in `design/plan.json` may shrink at the package stage is a board decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8ac6e0e4eade88c715fa0542a7b95e9f63f1ef91", "job": "RT-ArithmeticLocallySymmetricSpacesPartII~1b", "model": "fable", "worker": "chris-x55"} -->
