<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6789419435 -->
Review (codex) of 85c9dec

Verdict: needs_changes

1. **F01** (P2) The statable highest-weight headline is omitted

   **Location:** `packages/LieHighestWeightPartII/Suggested.lean:33`, “is a short coset argument … and is kept in the README as a target rather than stated here”; `packages/LieHighestWeightPartII/README.md:3` and §5.2, line 488.

   **Claim:** The highest-weight half-integrality test can be omitted from the acceptance file because its proof is short.

   **Witness:** `TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122` supplies `TauCeti.IsHighestWeightVector`; `Mathlib/Algebra/Lie/Weights/RootSystem.lean:411` supplies its root pairing. The native-carrier signature below elaborates at the pins. None of `simp`, `rfl`, `infer_instance` closes it.

   **Exact repair:** Add the Lie-module highest-weight half-integrality headline on the native highest-weight and weight-space carriers, with `sorry`, and name it in README §5.2. Replace the short-proof exemption in the docstring. Retain the full theorem, including arbitrary algebraically closed characteristic-zero fields, actual irreducible modules, and only simple-root half-integrality. Account separately for any genuinely unavailable carrier in the algebraic-group version. Do not replace this headline by the bare additive-coset assertion of §5.1.

   Here is the tested statability witness. It uses an additive functional on the ambient dual; its restriction to the integral weight lattice is the data used in §5.2. Conversely, a real functional on the real weight space restricts to that lattice and extends from its rational span to the ambient dual as a rational-linear, hence additive, map. Thus this formulation does not impose half-integrality on fundamental weights or lose the intended functionals.

   ```lean
   import Mathlib
   import TauCeti.Algebra.Lie.HighestWeight.Basic

   open LieAlgebra LieModule Module

   theorem highestWeight_halfIntegral_review
       {K L M : Type*} [Field K] [IsAlgClosed K] [CharZero K]
       [LieRing L] [LieAlgebra K L] [IsKilling K L] [FiniteDimensional K L]
       (H : LieSubalgebra K L) [H.IsCartanSubalgebra] [IsTriangularizable K H L]
       (b : (IsKilling.rootSystem H).Base)
       [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
       [FiniteDimensional K M] [LieModule.IsIrreducible K L M]
       (nu : Dual K H →+ ℝ) (lam : Dual K H) (v : M)
       (hv : TauCeti.IsHighestWeightVector b lam v)
       (hroot : ∀ i ∈ b.support, ∃ z : ℤ,
         2 * nu ((IsKilling.rootSystem H).root i) = (z : ℝ)) :
       (∀ mu : Dual K H, weightSpace M (mu : H → K) ≠ ⊥ →
         ∃ z : ℤ, 2 * nu mu = (z : ℝ)) ↔
         (∃ z : ℤ, 2 * nu lam = (z : ℝ)) := sorry
   ```

   **Repair tested:** The signature elaborates with one `sorry` warning and retains every displayed binder under `#check @highestWeight_halfIntegral_review`. In A₁, set α=2ω and ν(α)=1/2. For V(1), the two sides are false: twice the weight values are ±1/2, and twice the highest-weight value is 1/2. For V(2), both are true: twice the values are 1,0,−1. The witness uses genuine highest-weight data, not an assumed root-coset conclusion. Searches at the pins found no existing half-integrality theorem that proves this signature by one `exact`.

2. **F02** (P2) The domain spectrum contract loses torsion-freeness

   **Location:** `packages/LieHighestWeightPartII/README.md:52`, “every eigenvalue … on a finite-dimensional module over a characteristic-zero domain is an integer”.

   **Claim:** The cited integer-spectrum theorem applies to finite modules over characteristic-zero domains without a torsion condition.

   **Witness:** Take A=ℚ[T], M=A/(T), with trivial sl₂(A)-action and its standard nonzero triple. Then ρ(h)=0 and T·1̄=0, so T is an eigenvalue, although T is not an integer constant.

   **Exact repair:** Describe the native domain theorem with its actual hypotheses: a Noetherian, torsion-free A-module over a characteristic-zero domain A. State the finite-dimensional characteristic-zero field specialization used here separately. Add the torsion quotient above as a negative-control Check if retaining the domain contract. Do not weaken the roadmap's field-level recognition theorems.

   **Repair tested:** `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:90`–92 explicitly binds `IsTorsionFree K M` and `IsNoetherian K M`; the theorem is at line 151. The counterexample is cyclic, Noetherian and nonzero, but not torsion-free: T≠0 and 1̄≠0, while T·1̄=0. The repaired contract excludes precisely that failure. For a finite-dimensional vector space over a field the two native module hypotheses hold; standard V(1) still has integer eigenvalues ±1. This is an overstatement in the supplier description, not a counterexample to the eight submitted Lean theorems.

3. **F03** (P3) The filtration bound does not define its zero-module value

   **Location:** `packages/LieHighestWeightPartII/README.md:191`, “where `N` is the largest absolute value of an eigenvalue”.

   **Claim:** This prescription defines N for every finite-dimensional module, including the zero module.

   **Witness:** On M=0 every eigenspace is bottom, so the eigenvalue set is empty and has no largest absolute value. Native `Module.End.hasEigenvalue_iff`, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:446`, requires a non-bottom eigenspace.

   **Exact repair:** Take N to be the maximum of `{0} ∪ {|j| : M_j ≠ 0}`, or explicitly set N=0 for M=0. Add the zero-module Check in §1.2. No Lean declaration is needed.

   **Repair tested:** For M=0 the corrected N is 0 and every Wᵢ is 0=M, satisfying both bounds. For V(1), N=1; for V(2), N=2; for a nonzero trivial module, N=0. The ordinary cases are unchanged.

## Verified sound

The four package inputs were read without editing them. All 23 numbered subsections, their API bullets, Checks, proof routes and Needs lines were read. The fifteen seeded targets were checked anew against the cached source text. The prior review's computed rows were used only for unchanged, non-sampled material; in particular its complete 91-row CH/DG table comparison was not represented as a new complete table audit. The current pass independently recomputed the exceptional candidate sets, all sampled numerical examples and the changed claims. The three findings above require local repairs; the scope remains a valid Part II extension.

### Previous findings checked first

No preceding repair was marked not actionable. All three preceding findings are repaired; R01–R03 above are distinct issues.

| Previous finding | Repaired passage | Status and verification |
|---|---|---|
| F01, raising-kernel vectors | README:193: “every nonzero `ρ(h)`-eigenvector killed by `ρ(e)` has a nonnegative integer eigenvalue”; line 204 gives the mixed-vector Check. | Repaired. For x=u+v₊, Ex=0 but Hx=v₊; an eigenvalue would have to be both 0 and 1. The direct-sum containment still holds. The scope and supplier wording elsewhere distinguish vectors of specified weight from arbitrary kernel vectors. |
| F02, faithful coefficients | README:527: “the matrix coefficients of `V` generate `H` only together with their antipode images”; line 546 gives Gₘ. | Repaired. The faithful character contributes t; the antipode contributes t⁻¹. Together they generate every Laurent monomial. The two added native citations at lines 62,548,573 resolve. Section 5.3 already includes the dual in tensor generation. |
| F03, invariant-form API | README:271: “API:”; lines 273–276 list invariance, nondegeneracy, transpose sign and proportionality. | Repaired. Four API bullets and four Checks. The added determinant and rescaling assertions were recomputed, not accepted merely as formatting. |

### Computed adversarial evidence

These rows cover all seeded targets, all eight admitted headlines, the omitted headline, and every changed or finding-bearing claim. The few additional rows marked inherited concern unchanged non-sampled targets and use the preceding review's explicit computed values, as permitted. No empty “checked” row is used as evidence.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 zero-inclusive predicate and signs | Zero; standard sl₂; exchange; characteristic two | Zero gives three equalities 0=0, but native h≠0 fails. Standard gives [E,F]=H, [H,E]=2E, [H,F]=−2F. Swapping E,F without negating H gives −H≠H. Over 𝔽₂, (0,E,0) works; [E,F]=I≠0 excludes (0,E,F). | Sound; unchanged computed controls also present in prior review. |
| §0.2 inner group and twisting | SL₂, c=2; abelian algebra | w(2)=[[0,2],[−1/2,0]], w(2)w(1)⁻¹=diag(2,1/2), and Ad sends E to 4E. exp(ad E)H=H−2E. For abelian L, ad=0 and Int={1}. | Signs and group convention agree with the pins. Killing is used for nilpotence on modules. |
| §0.3 conjugacy from h | Standard triple; zero; rescaling | ad E maps H to −2E, hence rank 1 onto L₂; on L₋₂ it sends F to H and is injective. For zero, image L₀ is 0=L₂. diag(2,1/2) sends (H,E,F) to (H,4E,F/4). | Sound, with separate zero branch. |
| §1.1 restriction | Trivial K²; standard and exchanged triples; minimal sl₃ adjoint | Trivial restriction is 2V(0). Standard/exchanged spectra both {−1,1}, coordinate swap intertwines. Minimal sl₃ adjoint spectrum is (−2,−1,−1,0,0,1,1,2), equal to V(2)⊕2V(1)⊕V(0). | Pullback and H/E/F ordering pass. |
| §1.2 increasing filtration | V(1); adjoint sl₂; zero module | V(1) cumulative ranks at −2,…,2 are (0,1,1,2,2). Adjoint ranks are (1,1,2,2,3), versus decreasing ranks (3,2,2,1,1). Zero module has ranks 0 throughout; its spectral maximum is undefined, corrected to 0. | Filtration sound; R03 fixes the stated bound. |
| §1.2 repaired kernel assertion | V(0)⊕V(1), x=u+v₊; V(2); zero triple | Ex=0, Hx=v₊, requiring eigenvalue 0 and 1 simultaneously. In V(2), Ew₁=2w₀ and Ew₂=2w₁, so ker E=Kw₀ of weight 2. Zero triple on K² has kernel K²=M₀. | F01 repaired. Positive-weight direct sum need not consist of individual eigenvectors. |
| §1.2 kernel stability | V(1), v₋ | EH(v₋)=−v₊; (HE−2E)(v₋)=v₊−2v₊=−v₊. | Added stability identity has the correct sign. |
| Spectrum supplier at README:52 | A=ℚ[T], M=A/(T), trivial action | H·1̄=0=T·1̄ with 1̄≠0; T is not any integer constant. Torsion product T·1̄=0 has both factors nonzero. | R02: the domain contract needs torsion-freeness and Noetherianity. |
| §1.3 graded inversion | V(2)⊕2V(0) | d₀=3,d₂=d₋₂=1; m₀=3−1=2,m₂=1−0=1; W₀ has dimension 1+3=4. Inverse strings recover exactly those d values. | Quotient and inversion formulas agree. No reliance on truncated subtraction for positivity. |
| §1.3 intertwiner iff | V(2) versus V(1)⊕V(0); two trivial carriers | Both dimensions are 3, but cumulative ranks at −2,…,2 are (1,1,2,2,3) and (0,1,2,3,3). Trivial degree≤1 polynomials and K² both jump by 2 at 0; a+bX↦(a,b) sends all zero actions to zero. | Both directions discriminate; no illicit identity between distinct carriers. |
| §1.4 strictness and exactness | Projection V(1)⊕V(0)→V(0) | At i=−1,0: source-step dimensions 1,2; kernel-step dimensions 1,1; target/image-step dimensions 0,1. Thus 1=1+0 and 2=1+1; image and intersection agree. | Strictness and stepwise exactness pass. |
| §1.4 tensors and duals | V(1) tensor square and dual; unit | Tensor multiplicities at −2,0,2 are 1,2,1 and cumulative ranks are 1,1,3,3,4. At i=−1, Ann W₀ has dimension 1; the wrong Ann W₁ has dimension 0. Unit/dual jump by 1 at 0. | Tensor convolution and dual index −i−1 pass. |
| §2.0 rank ranges | so₂,so₃,so₄; B₂/D₃; rank 4 | Dimensions 1,3,6,10,15; Killing ranks for so₂/so₃/so₄ are 0,3,6. Rank-4 dimensions 28=4+24 and 36=4+32. | Unchanged prior computed row retained; scope correctly separates so₂ and nonsimple so₄. |
| §2.1 defining βₙ and determinant | n=0,1,2,3 | Anti-diagonals (1), (1,−1), (1,−1,1), (1,−1,1,−1); reversal signs +,−,−,+ and entry products +,−,−,+ give determinants 1,1,1,1. | Added nondegeneracy proof passes. |
| §2.1 rescaling | n=0,c=2; n=1,c=3 | β′(2w₀,2w₀)=1 implies β′(w₀,w₀)=1/4. β′(3w₀,3w₁)=1 implies β′(w₀,w₁)=1/9. | Added factor c⁻² is correct; c² would fail. |
| §2.1 invariance and parity | n=1,2; identity form | For n=1, H at (w₀,w₁): 1−1=0; F at (w₀,w₀): −1+1=0; E at (w₁,w₁): 1−1=0. For n=2, E at (w₁,w₂): 2−2=0. Transpose signs for n=0,…,3 are +,−,+,−. Identity form on V(1) gives 2≠0. | All added API facts pass, including a wrong-form control. |
| §2.1 proportionality normalization | Adjoint V(2), basis E,−H,−2F | Trace anti-diagonal (−2,2,−2)=−2(1,−1,1). H-invariance alone permits independent coefficients; E/F force opposite adjacent coefficients. | Native proportionality applies with irreducibility and a nonzero β. |
| §2.2 partition parity and splitting | sp₄; so₄; zero space | sp₄ partition (3,1) has forbidden odd multiplicities 1,1; (2,2) is allowed. so₄ (2,2) has two SO classes, (3,1) one. Reflection determinant is (−1)^(n+1). Empty partition has one class since O(0)=SO(0)=1. | Both conjugacy directions and positive-dimension exception pass. |
| §2.3/type-D half-spin headline | a=(3,3,1,1), (1,1,1,1), (1,1), then negate final coordinate | Even-sign spectra are {−4:1,−2:1,0:4,2:1,4:1} versus {−3:2,−1:2,1:2,3:2}; {−2:1,0:6,2:1} versus {−1:4,1:4}; {−1:1,1:1} versus {0:2}. | Maxima (4,3),(2,1),(1,0) equal A,A−aᵣ. Full spin combines both spectra and cannot separate. |
| §2.4 sl/sp headlines | sl₀,sl₁,sp₀; sl₃; sp₂ | Zero algebras have only zero triple and identity conjugator. sl₃ minimal/regular standard spectra (1,0,−1)/(2,0,−2) differ. sp₂ zero/standard jumps are 2 at 0 versus 1 at ±1. | Boundary and nontrivial recognition controls pass. |
| §2.4 orthogonal headline | so₀,so₁,so₂,so₇,so₈ | so₀ has eigenspace₀=bottom, so hker is false. so₁/so₂ have only zero triple. Odd dimension forces an odd block and nonzero zero-weight space. so₈ (4,4) has kernel dimension 0, standard spectrum ±3,±1 each twice, and half-spin tops 4/3. | Kernel condition excludes the very-even counterexample; split-D theorem adds the necessary second test. |
| §3.1 necessary characteristics | G₂ (2,0); E₆ opposition; sl₂ | G₂ profile (4,0,2,0,1,0,2) has d₄=1<d₆=2. E₆ opposition fixes 3⁴=81 of 3⁶=729 ternary labels. sl₂ zero/principal labels are 0/2. | Necessary conditions and normalization pass. |
| §3.2 root profiles and support | All zero labels; negative G₂; principal G₂/F₄ | D₀ at zero is 14,52,78,133,248, not merely ranks 2,4,6,7,8. G₂ (−1,0) gives (4,2,1,2), radius 3=Σ|aᵢ|θᵢ. Principal G₂ gives (2,0,2,0,1,0,1,0,1,0,1). Principal F₄ has D₀=4, cumulative F₀=28, total 52. | Cartan contribution, symmetry, negative-label bound and cumulative convention pass. |
| §3.3 finite injectivity used by §3.4 | Every ternary vector in five root systems | Roots: 12,48,72,126,240. Candidates: 7,28,34,274,245. Distinct profiles: exactly 7,28,34,274,245. E₆ without opposition has 212 candidates and only 123 profiles. | Exhaustively recomputed from the stated Cartan matrices/reflections; no orbit table used as input. |
| §3.4 exceptional headline | Five G₂ classes; zero; so₈ control | G₂ nonnegative profiles: (14), (4,4,1), (4,2,1,2), (4,0,4,0,1), principal profile above: five distinct vectors, all reflected totals 14. so₈ very-even pair has equal adjoint spectrum because the outer automorphism intertwines it. | Exceptional scope passes; does not extend to arbitrary simple type. |
| §3.5 table interpretation | Principal F₄/E₈/G₂; F₄ short/long rows | Principal tops 22,58,10, entries at 0 equal 4,8,2. F₄ row (4,0,4,…) cannot be increasing dimensions; cumulative F₀=28. Rows (22,14,1) and (22,8,7) each total 52 after reflection. | Current sample agrees. Prior complete 91-row numerical audit retained for the rest of this unchanged subsection. |
| §4.1 all-module and finite-family recognition | sl₂×sl₂, (t,0)/(0,t); zero L | Both product adjoint spectra are (−2,0,0,0,0,2). First-factor standard test has ranks at −1 equal 1 and 0, with jumps 1 at ±1 versus 2 at 0. L=0 has one triple and identity conjugator. | Factor-selective family distinguishes the outer swap; both iff directions pass. |
| §5.1 additive coset iff | A₁; missing root condition; Q=0 | ν(α)=1/2 gives ν(ω)=1/4 and ν(−ω)=−1/4, both outside ½ℤ. With ν(α)=1/3, λ=0 has value 0 inside, μ=α has 1/3 outside. Q=0 makes μ=λ. | Both directions pass; root hypothesis necessary. |
| §5.2 highest-weight headline | V(1),V(2),V(3); PGL₂; Gₘ | Twice weight values are ±1/2; (1,0,−1); (3/2,1/2,−1/2,−3/2), respectively. Thus both sides are false/true/false. PGL₂ weights kα give k/2; torus character k has the single value ν(k). | Mathematical claim passes; R01 supplies the absent native-carrier acceptance statement. |
| §5.3 pattern definition/tensor/dual | Zero/unit; q=4, diag(2,1/2); q=1; Jordan block | Patterns 0,δ₀, and δ₋₁+δ₁. Tensor square gives 1,2,1 at −2,0,2; dual reverses indices. At q=1 the unit contributes 1 at every integer. J₂(2) contributes 1 at degree 1, not dimension 2. | Semisimplicity and q>1 are substantive; the general real-bodied definition is not itself promised to satisfy these laws outside that scope. |
| §5.3 geometricity | q=3, diagonal 2 versus diagonal 5 in SL₂ | 2^k or 5^k equals 3^(i/2) only for k=i=0. Both patterns retain only zero-weight multiplicities although positive parts have different standard eigenvalues. At q=4, 2=4^(1/2) and 1/2=4^(−1/2). | Geometric hypothesis excludes the counterexample. |
| §5.4 positive part and uniqueness | Gₘ s=2i; SL₂ phase; unipotent u | r(t)=2 and r(t⁻¹)=1/2; coefficient algebra ℂ[t] omits t⁻¹ but adding S(t) generates ℂ[t,t⁻¹]. diag(i,−i) has positive eigenvalues 1,1. For u, both u and 1 act by 1 on every fixed vector. | F02 repaired. Semisimplicity makes eigenspaces span and faithful action determine r. |
| §5.5 positive-part headline | Phase and Weyl pairs; Gₘ; unipotent control | At q=4 Weyl pair has equal pattern at ±1 and trace 2+1/2=5/2, identity trace 2. On Gₘ character k, 2i and 2 give pattern δₖ and positive trace 2^k. For s=s′=u, pattern₀=1 on the standard module, yet permissible r=u,r′=1 are not conjugate. | Central torus is retained; the semisimple predicate is essential. Trivial group has g=r=r′=1. |

### Seeded source audit

All four sources are already recorded, certified and legally cached. No fetch or manifest mutation was necessary; no missing-reference request was needed. The README cites CH v1, DG v2 and the KIR lecture-note draft, rather than asserting published-version numbering. There were no separately flagged unverified locators to reopen.

| Seeded target | Locator actually read | Support checked |
|---|---|---|
| 1.1 Restriction | CH Appendix, proof of Lemma 10.9, printed p.35; CH line 1707 | Restriction to the generated sl₂ and determination of its module. The zero homomorphism is the package's explicit extra branch; the source proof's assertion that the span is sl₂ requires a nonzero triple. |
| 1.2 Filtration | CH Definition 2.2, printed p.6; CH line 284 and CH line 291 | Increasing filtration, symmetric monoidal functor, raising by +2 and h acting by the grade. The eigenspace construction and kernel consequence are derived using the named native results. R03 concerns its empty spectral bound. |
| 1.3 Recovery | CH proof of Lemma 10.9, printed p.35; CH line 1708 | Finite-dimensional sl₂ restriction is determined by the filtration. The explicit multiplicity inversion is derived here from the standard-module decomposition. |
| 1.4 Exact/tensor/dual | CH Definition 2.2, printed p.6; CH line 288 | Symmetric monoidal setting. Strict exactness and annihilator shift are the package's eigenspace consequences; neither is incorrectly presented as a separately numbered theorem of CH. |
| 2.1 Invariant form | KIR Theorem 5.6, equation (5.4), printed p.61; KIR line 2369 through KIR line 2375 | Source has f(vⱼ)=(j+1)vⱼ₊₁. Rescaling wⱼ=j!vⱼ gives the stated ladder. β, determinant and symmetry follow by the checked calculations; scalar uniqueness is the native irreducible-module theorem. |
| 2.2 Partitions | CH proof of Lemma 10.9, printed p.35; CH line 1709 through CH line 1718 | Jordan block dimensions, classical partition parametrization and the very-even split. The package supplies the form-factorization argument over general K and the empty-space exception. |
| 2.4 Classical recognition | Same proof/page; CH line 1709 through CH line 1727 | Standard-module comparison and half-spin separation. The source's coordinate/filtration-index slips are corrected rather than repeated. Low ranks and zero are treated separately. |
| 3.1 Characteristics | DG §2, printed p.3, DG line 83 through DG line 94; SOM §3.1, printed pp.15–16, SOM line 361 through SOM line 380 | Dominant characteristic, integrality, 0/1/2 labels and conjugacy classification. General-field label/Cartan results are native suppliers; opposition and inequalities are derived here. |
| 3.2 Root profiles | DG §2, printed p.3; DG line 83 through DG line 89 | Integer eigenspace decomposition and root evaluation. Counting formula, Cartan contribution and support estimates are explicit package consequences. |
| 3.4 Exceptional separation | CH proof of Lemma 10.9, printed p.35; CH line 1728 through CH line 1733 | Source asserts exceptional separation. Its E₈-to-Levi inference is not sufficient on its own; the package's independently verified E₆ and E₇ finite arguments repair that route. |
| 4.1 Filtration recognition | CH Lemma 2.4, printed p.6, CH line 296 through CH line 300; Lemma 10.9, printed p.35, CH line 1701 | Semisimple all-representation statement and simple refinements. Product decomposition supplies the factor-selective finite family. |
| 5.1 Coset half-integrality | CH §6.12, proof of Lemma 6.30, printed p.24; CH line 1163 through CH line 1171 | Difference of weights is an integral root combination. The arbitrary additive-subgroup version is the package's stated algebraic generalization. |
| 5.2 Highest-weight test | CH Lemma 6.30, printed p.24; CH line 1156 through CH line 1171 | Highest-weight occurrence and root-coset argument. CH has additional restrictions on ν from the surrounding application, but its proof uses only root half-integrality; dropping dominance of ν is justified. |
| 5.3 Patterns | CH §10.1, printed p.32, CH line 1549 through CH line 1553; Definition 2.5, printed p.7, CH line 323 | Representation-indexed integer-weight multiplicities. The package explicitly uses a complex-modulus notion, not the stronger arithmetic algebraicity/all-embeddings condition of Definition 2.5. |
| 5.4 Positive part | CH proof of Proposition 10.2, printed p.32; CH line 1555 through CH line 1565 | Replacement by the positive torus part and trace recovery. Torus factorization and the faithful-comodule predicate are supplied here with ReductiveGroups inputs. |

Additional source readings: DG Lemmas 2–3, printed p.4, DG line 139 through DG line 153, for the centralizer differential/dense-orbit route; CH Tables 2–4 at CH line 1734, CH line 1813 and CH line 1831; KIR Theorem 5.7 at KIR line 2408. The mathematical preliminaries of DG are consumed; its probabilistic algorithm is not a target of this package.

### Lean elaboration, signatures and padding

The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The prescribed `lake env lean` invocation from the content checkout on the submitted acceptance file exits 0, with exactly eight `declaration uses sorry` warnings at lines 75,92,106,123,146,173,193,240 and no other warnings. No module build was needed. An initial scratch-probe invocation from the board checkout failed for lack of a default toolchain; rerunning from the prescribed content checkout succeeded. No toolchain or dependency files were changed.

A scratch copy ran `fail_if_success solve | simp`, `fail_if_success solve | rfl`, and `fail_if_success solve | infer_instance` on each of the eight sorried theorems: all 24 closure probes failed as expected, and the file then elaborated with its eight remaining `sorry`s. The near-match results were inspected at the pins: ordinary carrier definitions, weight-space transport, root-triple existence, Killing-to-semisimple instances and scalar positive-part identities are not any of these eight recognition conclusions. No one-lemma `exact` match or padding declaration was found. The R01 witness independently passed the same three probes.

The same scratch copy appended `#check @name` for all thirteen declarations. Each printed type was compared with the README. No section hypothesis was lost: characteristic zero/algebraic closure, module finiteness, rational scalar structure for Int, hker, the finite spin basis and zero remainder, invertible 2, the module universe `Type (max u v)`, reductivity, both semisimplicity and geometricity assumptions, and both positive-part predicates remain. The five definitions have real bodies. The broad domains of `weightFiltration` and `weightPattern` are intentional; their finite-dimensional/semisimple laws are scoped separately. No acceptance signature was changed.

| Headline | Acceptance coverage |
|---|---|
| Restricted sl₂-module recovery (§1.3) | `finrank_weightFiltration_eq_iff_exists_intertwiner`, line 75 |
| Type A recognition (§2.4) | `exists_innerAut_of_finrank_weightFiltration_sl`, line 92 |
| Type C recognition (§2.4) | `exists_innerAut_of_finrank_weightFiltration_sp`, line 106 |
| Orthogonal recognition with an odd part (§2.4) | `exists_innerAut_of_finrank_weightFiltration_so`, line 123 |
| Full type D recognition (§§2.3–2.4) | `exists_innerAut_of_finrank_weightFiltration_typeD`, line 146 |
| Exceptional adjoint recognition (§3.4) | `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`, line 173 |
| Semisimple all-module recognition (§4.1) | `exists_innerAut_iff_finrank_weightFiltration`, line 193 |
| Specified finite factorwise test family (§4.1) | Named in docstring lines 27–31; the assembled typed-factor/test-module carrier is not available. No arbitrary predicate replaces it. |
| Highest-weight half-integrality (§5.2) | Omitted despite native statability: R01. The bare coset calculation is not a substitute. |
| Positive-real-part recognition (§5.5) | `exists_conj_positiveRealPart_of_weightPattern_eq`, line 240 |

### Pinned declarations opened and ownership comparison

Seventy-five explicitly qualified library identifiers in the README were located at the pins, with namespaces/file contexts used to disambiguate terminal names. The applied classical carriers and unqualified `IsSl2Triple`, `WithConv` and standard module names were also checked. The following table records the substantive declarations opened; grouped locations refer to the named file, not another version of the library.

| Object | Pinned declaration locations and verified distinction |
|---|---|
| Nonzero triple / primitive vector | `Mathlib/Algebra/Lie/Sl2.lean:38`, `:79`: h≠0 is a field; primitive vectors satisfy both eigenvector and raising-kernel conditions. The zero-inclusive adapter is different. |
| Action, adjoint, eigenspace, rank, direct sum | `Mathlib/Algebra/Lie/OfAssociative.lean:186`, `:196`; `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, `:443`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/Algebra/DirectSum/Basic.lean:440`. Eigenspaces are ordinary kernels, and eigenvalues require a nonzero eigenspace. |
| Filtered object | `Mathlib/CategoryTheory/Filtration/Basic.lean:73`, with `Filtration` into `MonoOver`: actual monomorphisms into the underlying object, no abelian-category assertion. |
| Killing/root/Cartan inputs | `Mathlib/Algebra/Lie/Killing.lean:50`; `Mathlib/Algebra/Lie/Weights/RootSystem.lean:411`; `Mathlib/Algebra/Lie/CartanExists.lean:374`; `TauCeti/Algebra/Lie/CartanExists.lean:45`. Finite dimension and infinite/split-field conditions are respected in the use here. |
| Classical matrix carriers and changes | `Mathlib/Algebra/Lie/Classical.lean:92`, `:157`, `:166`, `:180`, `:224`, `:252`, `:290`, `:321`, `:373`; `Mathlib/Algebra/Lie/Matrix.lean:85`. Trace zero, skew-adjoint forms, invertible 2, square root of −1 and index transport are genuine data. |
| Exceptional Serre carriers | `Mathlib/Algebra/Lie/SerreConstruction.lean:145`, `:152`, `:155`, `:158`, `:161`, `:164`: quotient definitions, not proofs of exceptional finite-dimensional Killing structure. |
| Integral spectrum/decomposition | `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:90`, `:151`, `:327`, `:341`; `Decomposition.lean:68`; `WeightMultiplicity.lean:167`; `Basic.lean:359`. R02 records the domain-hypothesis mismatch. Other field-level contracts match. |
| Raising and weighted diagrams | `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`, `:188`, `:209`; `WeightedDiagram/Basic.lean:124`. Negative-weight injectivity, allowed-weight surjectivity and simple-label bound are supplied, not new recognition theorems. |
| Standard irreducibility / invariant forms | `TauCeti/Algebra/Lie/Sl2/Standard.lean:956`; `TauCeti/Algebra/Lie/InvariantForm/Basic.lean:141`. Proportionality presupposes an existing nonzero invariant form; it does not construct βₙ or its normalization. |
| Int, exponentials and Cartan conjugacy | `TauCeti/Algebra/Lie/InnerAutomorphism.lean:99`, `:109`, `:188`; `AdjointAction/InnerAutomorphismGroup.lean:70`, `:108`; `AdjointAction/CartanConjugacy.lean:74`; `Sl2/Weyl/Automorphism.lean:116`, `:330`; `Mathlib/Algebra/Lie/Derivation/Basic.lean:398`; `Derivation/Killing.lean:108`; `Mathlib/RingTheory/Nilpotent/Exp.lean:51`. The native group is the subgroup closure of nilpotent adjoint exponentials, not all automorphisms. |
| Nilpotent actions | `TauCeti/Algebra/Lie/Killing/AdNilpotent.lean:211`; `TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:95`. Killing and finite-module hypotheses are essential to the module-action step. |
| Dynkin data | `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:153`, `:219`; `Opposition.lean:198`. Valid rank ranges, G₂ transpose and Bourbaki numbering match the computed profiles. |
| Polarization and parity spaces | `TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:83`; `HalfSpin/Basic.lean:119`, `:125`. The decomposition equivalence, its addition law, perfect pairing and separating law exclude a fake polarization; finite W and line=0 give the required finite split space. |
| Spin action / weights / highest vector | `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean:96`, `:111`; `Polarization/Irreducible.lean:201`; `TypeD/CartanWeights.lean:131`; `TypeD/Character.lean:47`; `TypeD/HighestWeight.lean:197`. Exterior subset gives +1/2 on occupied coordinates; highest-vector comparison uses even rank ≥4. Rank two is handled separately. |
| Type-D structure | `TauCeti/Algebra/Lie/Orthogonal/TypeD/Basis.lean:45`; `TypeD/Killing.lean:265`, `:308`: rank ≥4 for the simple/Killing comparison; no incorrect simplicity claim for so₄. |
| Native group carriers | `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean:68`; `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:95`; `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean:102`; `SemisimplePoint/Basic.lean:81`. Finite type is not reductivity; semisimplicity is on every finite comodule. |
| Faithful comodule repair | `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:311`, `:321`: generation with antipode images, and injectivity of the actual points action. Both apply in the common universe used here. |
| Reductivity and classical groups | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`, `:80`; `SpecialOrthogonal/Reductive.lean:149`; `Symplectic/Reductive/Basic.lean:102`. Smoothness/geometric connectedness and the geometric unipotent-radical condition are included; SO requires 2≠0. |
| Omitted headline's native objects | `TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122`, `:259`, `:286`; `Mathlib/LinearAlgebra/RootSystem/Base.lean:68`; `Mathlib/Algebra/Lie/Weights/RootSystem.lean:411`. Highest vector, actual weights, dominant-integral predicate and root base already exist. |

Paths abbreviated within a table cell inherit the explicit library directory of that cell. None of the eight recognition declarations is merely one of the pinned decompositions, carrier definitions or transport laws above.

### Supplier order, open work and shape

The board package index was read before absence claims; its three other packages have unrelated subjects. Object searches used `roadmaps grep` over the supplied main/open-head index for weight filtrations, neutral elements, very-even classes, half-integrality, positive real parts, candidate characteristics and the acceptance namespace. The local packages were searched too. The supplied overlap report lists no conflicting modification, dropped cited id, or id defined only by an open revision. A live `roadmaps overlaps LieHighestWeightPartII` lookup reports that the package is not itself an indexed main/open roadmap; this does not supersede the supplied package-specific overlap evidence.

The nearest revisions were read at their supplied heads: LieHighestWeight #1797 and #1220, SpinRepresentations #1207, and ReductiveGroups #1332 and #1808. Their ownership remains highest-weight/PBW/exceptional structure, spin modules, and group structure respectively. For example, LieHighestWeight #1220, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1496`, owns the general invariant-form symmetry argument; its rank-one step does not define this package's basis-normalized βₙ. SpinRepresentations #1207, `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:4`, concerns the spin representations themselves, not recognition of triple classes by their restrictions. ReductiveGroups #1332 and #1808, `TauCetiRoadmap/ReductiveGroups/README.md:11`, concern group constructions and dictionaries, not the pattern invariant. No duplicate fully qualified acceptance name was found.

Consumers #1758 TwistedAutomorphicDescents and #1815 SmoothRepresentationsOfLocalGroupsPartII mention this package. The latter's N0–N5 labels are pre-existing consumer/design-label references, not section ids dropped by the present repair; none of the current package's ids changed. No new ownership transfer or supplier gap is needed.

| Supplier citation | Current resolution |
|---|---|
| LieHighestWeight Layers 0–6 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319`, `:351`, `:370`, `:405`, `:537`, `:567`, `:773`: sl₂ modules, roots, weights, highest weights, classification, Weyl reducibility and characters. Native instances are cited separately where used. |
| LieHighestWeight Layers 7–9 | Same file `:980`, `:1158`, `:1197`, `:1432`: Chevalley restriction, normalized Serre presentation with componentwise assembly at `:1191`, exceptional models and the gl/sl matrix framework. |
| NilpotentOrbits N0.2/N0.3, N2.1/N2.2/N2.4, N4 | `TauCetiRoadmap/NilpotentOrbits/README.md:101`, `:113`, `:162`, `:169`, `:187`, `:215`. Complex orbit geometry is not silently used for a general-field classification; §0.3 explains its general-field extension. |
| RootSystems former Layers 4–6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1136`–1138 explicitly maps old chamber/classification/integral-data numbering to its native owners and present sections. This preserves the citations. |
| SpinRepresentations Layer 5 | `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:777`–808: algebraic Cartan weights, parity convention and highest-weight identification. General-K spin action is cited directly from Tau Ceti. |
| ReductiveGroups Layers 1–7 | `TauCetiRoadmap/ReductiveGroups/README.md:1030`, `:1046`, `:1230`, `:1262`, `:1687`, `:1880`, `:1949`, `:2253`, `:2423`: comodules/faithfulness, Lie/adjoint, centralizers/orbits, tori, polynomial exponentials, reductivity and root/Bruhat generation. |
| ReductiveGroups 9A,9B,9D,10B | Same file `:3046`, `:3056`, `:3287`, the 9B construction, `:3845`, `:4143`: pinned Lie comparison, classical folded matrix models, group construction, existence/isomorphism and rational highest-weight theory. |
| ReductiveGroupsPartIII §§0.3/0.5 | `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:433`, `:467` at its supplied open head: class-function restriction and trace separation of semisimple classes for connected reductive groups, central torus retained. |
| NoncompactQuantumSymmetry Layer 3 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1038`: real-Lie-group Ad/Int comparison. It is a scope distinction, not a prerequisite for the algebraic variant here. |

The resolver reports no unresolved cross-roadmap citation or Lean name in its roadmap index. It does not inspect the pinned libraries, so the native inspections above were separate. The requested dependency command returned:

```
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was read. All consumed roadmaps are on main or earlier new suppliers in the merge order. The main versions, not open revisions, supply existing roadmaps. No declared gap is present.

Three main roadmaps were read for house shape: LieHighestWeight, SpinRepresentations and ReductiveGroups. The package has the required summary/scope/conventions/contracts/build/layers/consumers/references organization. All 23 numbered targets have at least three Check bullets; each definition has its API list, including the repaired §2.1. All six layers have Examples and Dependencies. The order is mathematical: module recovery precedes separate classical/exceptional recognition, then factorwise assembly; the group-pattern strand has its own lower suppliers. It is not CH's chapter sequence. Finite injectivity is a mathematical statement, not an executable algorithm target.

Every own Lean identifier in the README resolves to one of the thirteen acceptance declarations; mathematical symbols such as βₙ and D_T are notation, not claims of Lean declarations. There are no sorry'd data, `set_option`, admitted examples, `lemma` declarations, illegal imports, PR/job identifiers, machine paths or HTML anchors in the package text. Its single `import Mathlib` is followed only by the individual used Tau Ceti imports. No copied source passages were found. Source keys are unique and cover every cited work. Metadata remains `math.RT`.

## Not verifiable

- The published CH/DG editions and the Cambridge edition of KIR were not collated against these cached preprints/lecture notes. The package explicitly cites the versions read; all fifteen sampled locators were accessible.
- This round did not reconstruct every Bala–Carter name or repeat the previous complete CH/DG numerical-table bijection. The unchanged table section relies on the preceding review's explicit computed values, with its principal and rank-one rows checked again here. The independent candidate-set injectivity used by the headline was recomputed in all five exceptional types.
- The source's E₈-to-Levi shortcut does not itself justify E₆/E₇ separation. The package's direct finite argument supplies those cases and was checked; this limitation is not an unowned package prerequisite.

No source request is pending. The failing items are the three findings above, not inaccessible evidence.

## Source issues

- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1707: the source identifies the span of every triple with sl₂; it should treat the zero triple separately before making that identification; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1720: the source combines ascending neutral coordinates with descending-chain simple roots; it should reverse the chain roots or the coordinate order; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1726: the source uses the largest nonzero increasing-filtration index; it should use the largest nonzero graded index or filtration jump; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.36–37, CH lines 1734,1813,1831: the source labels graded multiplicities as filtration dimensions; it should label graded-piece dimensions and recover filtrations by cumulative sums; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1732: the source infers Levi adjoint separation directly from E₈ separation; it should justify complementary summands and descent of conjugacy, or check E₆/E₇ independently; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source composes a target automorphism on the source side of an sl₂-to-g map; it should postcompose by the automorphism of g; affects nothing.
- **Misprint** in KIR at Theorem 5.7(2), printed p.62, KIR line 2414: the source reverses the raising and lowering isomorphism directions; it should use eⁿ from weight −n to n and fⁿ from n to −n; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "85c9dec6d21bbbe5a99e3689c75d250c7d9905b5", "job": "REV-PKG-LieHighestWeightPartII~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
