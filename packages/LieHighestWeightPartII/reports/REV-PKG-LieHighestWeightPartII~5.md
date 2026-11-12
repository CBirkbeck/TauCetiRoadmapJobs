<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6791239071 -->
Review (codex) of 12b62c3

Verdict: needs_changes

1. **F01** (P2) Weight-pattern recognition has two open owners

   **Location:** `packages/LieHighestWeightPartII/README.md:7`, “weight patterns, positive real parts and their recognition”; the constructions and theorem are at lines 511 and 560.

   **Claim:** This package owns the general representation-indexed weight pattern and recognition of positive real parts. The later open roadmap GlobalShtukasAndFunctionFieldLanglandsPartII also defines the same invariant on positive torus points and independently proves the same recognition step, without importing this owner.

   **Witness:** PR #1845, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:1207` and `:1211`, defines multiplicities at `q^ν` and repeats trace-based recognition. With Frobenius trivial, this is §§5.3–5.5 on positive points; `:1229` does not cite this package.

   Its scope at line 11 expressly retains this recognition. This is distinct from its legitimate additional theorem identifying absolute Weyl conjugacy with relative Weyl conjugacy on the Frobenius-fixed real space. The duplicate part is the preceding general weight-pattern construction and character-recognition argument. The supplied closest-roadmap list did not identify this collision; an object search of the supplied open heads did.

   **Exact repair:** Keep the general construction and recognition in LieHighestWeightPartII §§5.3–5.5, which is earlier in `merge-order/ORDER.txt` (positions 241 and 367). Record the ownership split in this package's Scope and Downstream consumers: GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 owns the logarithmic normalization, varying-residue-cardinality comparison and Frobenius-fixed/relative-Weyl refinement, consuming §§5.3–5.5. Reconcile PR #1845 accordingly: its §8.0 must import this invariant and recognition by those section names and prove only the remaining comparison/refinement. Its Needs line must cite the earlier owner. Do not add the later roadmap as a supplier here or remove this package's general headline. The corresponding later-head change is part of resolving the overlap, not an instruction to edit that checkout during this read-only review.

   **Repair test:** For dual SL₂, `q=4`, `ν=(1/2,−1/2)`, both constructions give `s=diag(2,1/2)` and multiplicities 1 at degrees ±1. The trace used by both proofs is `2+1/2=5/2`; the Weyl-reflected point has the same pattern and is conjugate. Applying this package's §5.5 supplies that conclusion directly. At `q=16`, the eigenvalues become 4 and 1/4 but the degrees remain ±1, leaving exactly the normalization comparison for the later roadmap.

2. **F02** (P3) A finite-dimensional Check survived the infinite-dimensional extension

   **Location:** `packages/LieHighestWeightPartII/README.md:504`, “Strengthening the hypothesis to `ν(ω_i) ∈ ½ℤ` for all fundamental weights would make both sides of the equivalence always true”.

   **Claim:** Half-integrality on fundamental weights makes both assertions of §5.2 true in its newly enlarged scope, which explicitly includes infinite-dimensional irreducible highest-weight modules.

   **Witness:** Over ℚ take `α=2ω`, `ν(aω)=a/2`, and the Verma module of highest weight `λ=−ω/2`. Then `ν(ω)=1/2`, but `ν(λ−kα)=−1/4−k∉½ℤ`; both sides are false.

   This module satisfies the enlarged theorem's assumptions. In the basis `v_k=F^k v_0`, `Hv_k=(−1/2−2k)v_k` and `Ev_k=−k(k−1/2)v_(k−1)`. All raising coefficients for `k≥1` are nonzero. A nonzero submodule contains a weight vector by polynomial interpolation in H, then contains `v_0` by raising and every `v_k` by lowering; hence it is irreducible. The native highest-weight predicate imposes no finite-dimensionality or integrality (`TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122`); the integrality theorem explicitly introduces finite-dimensionality at line 358. This is an isolated false Check, not a counterexample to the new Lean equivalence.

   **Exact repair:** Qualify the Check: “For a finite-dimensional Lie module, requiring half-integrality on all fundamental weights makes both sides true, because every weight is in their integral span.” Alternatively assume the highest weight belongs to that integral weight lattice. Add the Verma example above as the control showing why the qualification matters. Preserve the broader theorem and its Lean signature.

   **Repair test:** In `V(1)`, the strengthened hypothesis `ν(ω)=1/2` gives twice the weight values ±1; in `V(2)` it gives 2,0,−2. Both assertions hold in these finite-dimensional cases. For the Verma example twice the values are `−1/2−2k`, never integers, while the equivalence still correctly reads false iff false.

## Verified sound

The four package inputs were read without changing them. All 23 numbered subsections, API lists, Checks, proof routes and Needs lines were inspected. The three previous findings were checked first; none was marked not actionable. All are repaired. The changed hypotheses and their consequences were tested afresh, including the rest of §5.2, which exposed R02. There are two findings, one blocking. No supplier gap is declared.

### Previous findings, in order

| Previous finding | Repaired passage | Status and verification |
|---|---|---|
| F01: statable highest-weight headline omitted | `Suggested.lean:215`: `theorem forall_weight_halfIntegral_iff_highestWeight`; README:491: “finite-dimensional or not”. | Repaired. The signature uses actual highest-weight and generalized-weight-space carriers. The native cone theorem applies to a module generated by the highest vector; irreducibility supplies generation. Dropping algebraic closure and module finiteness is justified. The algebraic-group form is separately identified in the docstring. R02 is the Check that did not follow this enlargement. |
| F02: domain spectrum loses torsion-freeness | README:52: “on a Noetherian, torsion-free module over a characteristic-zero domain”. | Repaired. The native binders at `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:90` and theorem at :151 match. Over ℚ[T], the trivial module ℚ[T]/(T) has `H·1̄=0=T·1̄`, exhibiting the excluded torsion failure. The negative-weight injectivity contract at README:56 now has the same domain hypotheses. |
| F03: zero-module maximum undefined | README:193: “largest element of `{0} ∪ {|j| : M_j ≠ 0}`”; README:203: “with `N = 0` every step is `0 = M`”. | Repaired. Bounds are N=0,1,2,0 for the zero module, V(1), V(2), and a nonzero trivial module. Other maxima concern nonzero spin or adjoint modules. |

### Computed adversarial evidence

The rows cover all fifteen seeded targets, all nine Lean headlines, both findings and the changed contracts. Additional rows cover the remaining definitions and proof interfaces. The unchanged rank-range/form/tensor controls also agree with the preceding review's explicit computed rows; no uncomputed “sound” summary was used as mathematical evidence.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 predicate and normalization | Zero; standard sl₂; exchange; characteristic 2 | Zero gives three 0=0 equations but fails native h≠0. Standard gives [E,F]=H, [H,E]=2E, [H,F]=−2F. Exchanging E,F gives −H rather than H. In 𝔽₂, (0,E,0) works but [E,F]=I≠0 excludes (0,E,F). | Correct zero extension and characteristic boundary. |
| §0.1 functoriality/exchange | Zero map; `(−H,F,E)` | Zero map sends all brackets/actions to 0. Exchanged brackets give [F,E]=−H and [−H,F]=2F. | Homomorphism direction and signs pass. |
| §0.2 inner group and twists | SL₂ with c=2; abelian L | `w(2)w(1)⁻¹=diag(2,1/2)`; Ad sends E to 4E. `exp(ad E)H=H−2E`. For abelian L, ad=0 and Int={1}. | Correct rank-one factorization; module nilpotence uses Killing. |
| §0.3 conjugacy from h | Standard/zero triples; rescaling | ad E sends H to −2E, rank 1 onto L₂, and F to H injectively on L₋₂. Zero gives image 0=L₂. diag(2,1/2) conjugates `(H,E,F)` to `(H,4E,F/4)`. | Open-orbit route and unique f pass. |
| §1.1 restriction | Trivial K²; exchanged standard; minimal sl₃ | Restrictions are 2V(0), V(1) with weights ±1, and V(2)⊕2V(1)⊕V(0) with weights −2,−1,−1,0,0,1,1,2. | Pullback agrees with the stated action. |
| §1.2 filtration and bounds | V(1), adjoint sl₂, zero | Ranks at −2,…,2 are (0,1,1,2,2), (1,1,2,2,3), (0,0,0,0,0). N=1,2,0. For each, W_(−N−1)=0 and W_N=M. | Repaired zero maximum works. |
| §1.2 raising kernel | V(0)⊕V(1), x=u+v₊ | Ex=0 but Hx=v₊: eigenvector coefficients would require both 0 and 1. E(v₋)=v₊≠0; all kernel components have weights 0 or 1. | Eigenvector qualifier retained. |
| Domain spectrum contracts | ℚ[T]/(T); finite field-vector-space modules; Verma | T·1̄=0 with both factors nonzero; T is not an integer constant. V(1) has spectrum ±1 over ℚ. Verma highest −1/2 gives −1/2−2k, showing finiteness/Noetherianity cannot simply disappear. | Repaired native domain/field contracts pass. |
| §1.3 quotient and inversion | V(2)⊕2V(0) | d₀=3, d₂=d₋₂=1; m₀=3−1=2, m₂=1−0=1. Cumulative W₀ has dimension 4. Summing the recovered strings returns d₀=3 and d₂=1. | Both formulas agree. |
| §1.3 intertwiner iff headline | V(2) versus V(1)⊕V(0); two trivial carriers | Equal total dimension 3, unequal cumulative vectors (1,1,2,2,3)/(0,1,2,3,3). On degree≤1 polynomials and K², both trivial restrictions jump by 2 at 0; a+bX↦(a,b) intertwines all zero actions. | Both directions discriminate; distinct carriers are not identified by an identity map. |
| §1.4 strictness/exactness | Projection V(1)⊕V(0)→V(0) | At i=−1,0: source dimensions 1,2, kernel dimensions 1,1, image dimensions 0,1; 1=1+0 and 2=1+1. | Image equals intersection at both steps. |
| §1.4 tensor/dual/unit | V(1) tensor square and dual | Graded multiplicities 1,2,1 at −2,0,2; cumulative ranks 1,1,3,3,4. At i=−1, Ann W₀ has dimension 1, whereas incorrect Ann W₁ has dimension 0. Unit has one jump at 0. | Tensor convolution and −i−1 shift pass. |
| §2.0 rank ranges | so₂, so₃, so₄; B₂/D₃ | Dimensions 1,3,6,10,15; Killing ranks 0,3,6 in the first three. Rank-4 dimensions 28=4+24 and 36=4+32. | Abelian so₂ excluded from Killing claim; so₄ is not declared simple. |
| §2.1 form definition, determinant, parity | n=0,1,2,3 | Anti-diagonals alternate from +1. Reversal signs and entry products are both +,−,−,+; determinants all 1. Transpose signs are +,−,+,−. | Nondegenerate; symmetric/alternating convention correct. |
| §2.1 invariance and normalization | V(1), V(2), adjoint realization | H on opposite V(1) weights gives 1−1=0; F at (w₀,w₀) gives −1+1=0; E on V(2) at (w₁,w₂) gives 2−2=0. Trace form on E,−H,−2F has anti-diagonal (−2,2,−2)=−2β₂. | Formula and scalar comparison pass. |
| §2.1 wrong model/rescaling | Identity pairing on V(1); c=2,3 | Identity pairing gives H-invariance residual 2≠0. Normalizing on c times the basis gives coefficients 1/4,1/9, not 4,9. | Wrong form excluded; rescaling is c⁻². |
| §2.2 partitions/splitting | sp₄, so₄, V=0 | (3,1) in sp₄ has forbidden odd multiplicities 1,1; (2,2) allowed. so₄ (2,2) gives 2 SO classes, (3,1) gives 1. Empty space gives O=SO=1 and 1 class. Centralizer reflection determinant is (−1)^(n+1). | Both conjugacy directions and empty-space exception pass. |
| §2.3 half-spin maxima | a=(3,3,1,1), (1,1,1,1), (1,1); negate last coordinate | Even-sign spectra respectively: {−4:1,−2:1,0:4,2:1,4:1}/{−3:2,−1:2,1:2,3:2}; {−2:1,0:6,2:1}/{−1:4,1:4}; {−1:1,1:1}/{0:2}. Maxima are (4,3),(2,1),(1,0)=A,A−a_r. | Half-spin separates; combining both parities loses separation. |
| §2.3 minuscule convention | ω_r, 2ω_r | Pairings with ±ε_i±ε_j are ½(±1±1)∈{−1,0,1}; 2ω_r pairs to 2 with ε₁+ε₂. Lowered weight is (0,0,1,…,1), outside orbit of (1,…,1). | Correct normalization and non-example. |
| §2.4 A/C headlines | sl₀/sl₁/sp₀; sl₃; sp₂ | Zero carriers have one triple. Minimal/regular sl₃ standard spectra are (1,0,−1)/(2,0,−2). sp₂ zero/standard jumps are 2 at 0 versus 1 at ±1. | Recognition tests nontrivial and boundary cases. |
| §2.4 orthogonal and split-D headlines | so₀/so₂/so₇/so₈ | so₀ has zero eigenspace=bottom, so hker fails. so₂ has only zero triple. Odd dimension forces a zero weight. In so₈ partition (4,4), kernel dimension is 0 and standard spectra agree, while spin maxima are 4/3. | hker excludes the counterexample; second module restores full D recognition. |
| §3.1 characteristics | G₂ (2,0); E₆; sl₂ | G₂ profile (4,0,2,0,1,0,2) has d₄=1<2=d₆. Opposition fixes 3⁴=81 of 3⁶=729 E₆ labels. sl₂ labels are 0/2. | Necessary conditions and zero case pass. |
| §3.2 root profiles/support | Zero labels; G₂ (−1,0); principal G₂/F₄ | Zero gives D₀=14,52,78,133,248. Negative G₂ has (4,2,1,2), radius 3=Σ abs(a_i)θ_i. Principal G₂ gives (2,0,2,0,1,0,1,0,1,0,1). Principal F₄ has D₀=4, cumulative F₀=28, total 52. | Cartan contribution, symmetry and support bound pass. |
| §3.3 finite injectivity | All ternary vectors in five types | Root counts 12,48,72,126,240. Candidate counts 7,28,34,274,245 equal distinct-profile counts. E₆ without opposition has 212 candidates but 123 profiles. | Exhaustively recomputed from the stated reflections, independently of orbit tables. |
| §3.4 exceptional headline | Five G₂ classes; D₄ contrast | Profiles (14), (4,4,1), (4,2,1,2), (4,0,4,0,1), principal above are distinct and each has reflected total 14. D₄ very-even pair has equal adjoint spectrum under its outer automorphism. | Five-type restriction is substantive. |
| §3.5 CH table interpretation | All numeric rows; principal and rank-one rows | E₈/F₄/G₂ have 70/16/5 rows, 70/16/5 distinct vectors, totals 248/52/14, and zero length/top/inequality failures. Principal tops 58/22/10, D₀=8/4/2. F₄ root rows (22,14,1)/(22,8,7) both total 52. | Recomputed numerical consistency for all 91 rows; principal/root rows also matched to direct root profiles. Entries are graded, not cumulative. |
| §4.1 all-module and finite-family recognition | sl₂×sl₂, (t,0)/(0,t); zero L | Both product adjoint spectra are (−2,0,0,0,0,2). First-factor standard ranks at −1 are 1/0, with jumps ±1 versus 2 at 0. L=0 has one triple and identity conjugator. | Factor-selective tests avoid outer swapping. |
| §5.1 coset iff | A₁; missing hypothesis; Q=0 | ν(α)=1/2 gives ν(±ω)=±1/4, both outside ½ℤ. With ν(α)=1/3, λ=0 is inside but μ=α is outside. Q=0 gives μ=λ. | Both directions and necessary root condition pass. |
| §5.2 headline | V(1),V(2),V(3), ν(α)=1/2 | Twice the weight values are ±1/2; (1,0,−1); (3/2,1/2,−1/2,−3/2). Left/right truth values are false/false, true/true, false/false. | New native-carrier theorem has intended meaning. |
| §5.2 hypothesis controls | V(1)⊕V(0), v in V(0); V(3) with ν(α)=1/3 | First: highest value 0 is half-integral but ±1/4 are not. Second: twice highest value is 1, but twice another weight is 1/3. | Irreducibility/generation and simple-root condition cannot be dropped. |
| §5.2 infinite-dimensional Checks | Verma highest values −2 and −1 | Raising coefficients −k(k+1), −k² are nonzero. ν values are −(k+1)/2 (all half-integral) and −1/4−k/2 (none half-integral). | Both advertised Verma controls pass. |
| §5.2 strengthened fundamental-weight Check | Verma highest −1/2; ν(ω)=1/2 | Raising coefficients for k=1,2,3 are −1/2,−3,−15/2. Twice weight values are −1/2,−5/2,−9/2,…; both assertions false despite strengthened hypothesis. | R02: qualify the Check, not the theorem. |
| §5.2 group/degenerate controls | PGL₂; G_m; L=H=0 | PGL₂ weights kα have ν=k/2. Torus irreducible has only k and both sides test ν(k). For zero Lie algebra the dual is zero and both sides have 2ν(0)=0. v=0 is excluded by the native predicate. | Group form retains the standing algebraic-closure convention; new nonclosed-field scope concerns the Lie form. |
| §5.3 patterns and total-function boundaries | Zero/unit; q=4; q=1; Jordan block | Patterns 0, δ₀, δ₋₁+δ₁. Tensor square has 1,2,1 at −2,0,2; dual reverses indices. At q=1 the unit counts at every integer. J₂(2) contributes dimension 1 at degree 1 rather than 2. | Laws correctly require q>1 and semisimple geometric actions. |
| §5.3 geometricity | SL₂ diag(2,1/2), diag(5,1/5), q=3/4 | At q=3, 2^k or 5^k equals 3^(i/2) only for k=i=0, so only zero-weight multiplicities survive for both. At q=4, 2=4^(1/2) and 1/2=4^(−1/2). | Geometric hypothesis excludes equal-pattern/different-positive-part failure. |
| §5.4 positive part and faithfulness | G_m at 2i; SL₂ phase; unipotent u | r(t)=2, r(t⁻¹)=1/2. Coefficients generate ℂ[t], adjoining antipode gives ℂ[t,t⁻¹]. diag(i,−i) has positive part I. Both u and I act by 1 on u-fixed vectors. | Faithful separation and semisimple uniqueness correctly scoped. |
| §5.5 recognition headline | Phase pair, Weyl pair, torus, unipotent control | At q=4 Weyl pair has trace 5/2 and pattern at ±1; identity has trace 2 and jump 2 at 0. G_m characters on 2i/2 have pattern δ_k and positive trace 2^k. Taking s=s′=u admits r=u,r′=I, not conjugate. | Central torus included; semisimplicity essential. |
| Shared object with #1845 §8.0 | Split dual SL₂, q=4 and q=16 | Both invariants equal δ₋₁+δ₁ for ν=(1/2,−1/2). Eigenvalues 2,1/2 become 4,1/4; normalized degrees stay ±1. | R01: import generic recognition and retain the normalization/relative-Weyl adapter downstream. |

### Sources and the seeded sample

All four cited works are recorded once, certified and accessible in the legal cache. No separately flagged unverified locator was found. No fetch, manifest mutation or missing-source request was needed. Page and theorem numbers below are for CH arXiv v1, DG arXiv v2, SOM preliminary notes and the KIR lecture-note draft, the versions the package identifies.

| Seeded target | Text and printed locator read | Verification |
|---|---|---|
| 0.1 Zero-inclusive triples | CH §2.1, (2.1), p.6; CH line 272 and CH line 279 | Algebraically closed characteristic-zero standing field; three bracket relations. Source allows zero; package separately handles it. |
| 0.3 Conjugacy from the neutral element | DG §3, Lemmas 2–3, p.4; DG line 139 through DG line 153; SOM §3.1, pp.15–16, SOM line 361 | Centralizer differential and density; injectivity of the neutral-element orbit map. General-field proof is supplied here from the named algebraic/native inputs; the SOM complex result is only a comparison. |
| 1.1 Restriction | CH Appendix, proof of Lemma 10.9, p.35; CH line 1707 | Source's nonzero span is sl₂. Package's homomorphism construction handles zero without pretending its span is sl₂. |
| 1.3 Recovery | Same proof/page; CH line 1708 | Finite-dimensional restricted representation determined by filtration. Explicit inversion comes from the supplied sl₂ decomposition and is checked above. |
| 2.1 Invariant forms | KIR Theorem 5.6, (5.4), p.61; KIR line 2369 through KIR line 2375 | Source normalization has f(v_j)=(j+1)v_(j+1). w_j=j!v_j gives the roadmap's ladder; form, determinant and symmetry are its own computations, scalar uniqueness is native. |
| 2.3 Half-spin separation | CH proof of Lemma 10.9, p.35; CH line 1716 through CH line 1727 | Very-even splitting and sign-vector weights support separation; package corrects coordinate order and replaces “last nonzero filtration index” by last jump. |
| 2.4 Classical recognition | Same proof/page; CH line 1709 through CH line 1727 | Standard Jordan blocks and very-even exception. General K and low ranks follow the package's explicit form argument and named suppliers. |
| 3.1 Characteristics | DG §2, p.3, DG line 83 through DG line 94; SOM §3.1, p.15, SOM line 366 through SOM line 373 | Integrality and ternary labels. Opposition and inequalities are derived in the package, not misattributed as additional source theorems. |
| 3.2 Root profiles | DG §2, p.3; DG line 83 through DG line 89 | Root evaluation and integer eigenspaces. Cartan term and support estimate are explicit derived formulas. |
| 3.5 Tables | CH Tables 2–4, pp.36–37; CH line 1734 through CH line 1837; DG Appendix A, Tables 2,3,6, pp.7–16, DG line 262 onward | Graded rather than cumulative entries; all 91 numeric rows checked as described above. DG uses a different G₂ node order; its A₁ diagram (1,0) becomes this package's (0,1). |
| 4.1 Filtration recognition | CH Lemma 2.4, p.6, CH line 296; Lemma 10.9, p.35, CH line 1701 | General semisimple all-module claim and simple refinements. The finite product-family proof preserves factor labels. |
| 5.1 Root-coset half-integrality | CH §6.12, proof of Lemma 6.30, p.24; CH line 1163 | Integer root differences support the stated subgroup generalization in both directions. |
| 5.2 Highest-weight test | CH Lemma 6.30, p.24; CH line 1156 through CH line 1171 | Source is finite-dimensional and has an application-specific cone for ν. Its proof only needs root half-integrality. The infinite-dimensional/split-field extension is supported by the pinned cone theorem, not claimed to appear verbatim in CH. |
| 5.4 Positive real part | CH §10.1, proof of Proposition 10.2, p.32; CH line 1555 through CH line 1565 | Positive torus representative and trace reconstruction. Torus factorization and faithful-comodule uniqueness are developed here with group suppliers. |
| 5.5 Recognition | CH Proposition 10.2, p.32; CH line 1554 through CH line 1565 | Equal patterns give equal positive traces and Weyl conjugacy. The connected reductive version retains central torus directions. |

Also read CH Definition 2.2 (CH line 288), Definition 2.5 (CH line 323), and KIR Theorem 6.33 (KIR line 2919). The package explicitly uses the complex-modulus version of geometricity, not the arithmetic algebraicity/all-embeddings condition of CH Definition 2.5. It uses DG's mathematical preliminaries, not its probabilistic algorithm. No copied source passage was found.

### Lean, headlines, signatures and padding

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The required `lake env lean` command on the submitted `Suggested.lean`, run from the content checkout, exited 0. It produced exactly nine `declaration uses sorry` warnings at lines 78,95,109,126,149,176,196,215,264 and no other warnings. All imported object files were present; no build was needed. One initial scratch command used the wrong working directory and failed before elaboration; the actual package run and both completed scratch runs used the prescribed checkout. No toolchain or dependency files were changed.

A scratch copy appended `#check @name` for all fourteen declarations and elaborated successfully. All printed types were read and compared with the README. No binder was lost: finite-dimensionality of the tested modules, the rational Lie structure for Int, hker, polarization basis and zero remainder, invertible 2, the all-module universe `Type (max u v)`, highest-vector/irreducibility/splitting assumptions, and both semisimplicity/geometricity/positive-part predicates remain. The highest-weight theorem deliberately has neither algebraic closure nor finite-dimensionality of M; this matches README:491. No signature needed changing.

Every one of the nine sorried theorems was tested with each of `simp`, `rfl`, `infer_instance`, wrapped individually in `fail_if_success solve`. The combined confirmation file exited 0 with only its nine retained sorry warnings: all 27 closure attempts failed. The library-match leads were compared at the pins. Carrier definitions, generalized-weight-space transport, root-triple existence, semisimplicity instances and scalar positive-part identities do not prove these conclusions with one `exact`. The half-integrality headline requires the actual cone theorem, generation and additive closure; it is not a restatement of the highest-vector definition. No padding was found.

| Headline from Summary/build | Acceptance coverage in `Suggested.lean` |
|---|---|
| Restricted sl₂-module recovery, §1.3 | `finrank_weightFiltration_eq_iff_exists_intertwiner`, line 78 |
| Standard-module type A recognition, §2.4 | `exists_innerAut_of_finrank_weightFiltration_sl`, line 95 |
| Standard-module type C recognition, §2.4 | `exists_innerAut_of_finrank_weightFiltration_sp`, line 109 |
| Orthogonal recognition with odd part, §2.4 | `exists_innerAut_of_finrank_weightFiltration_so`, line 126 |
| Full type D recognition with half-spin, §§2.3–2.4 | `exists_innerAut_of_finrank_weightFiltration_typeD`, line 149 |
| Exceptional adjoint recognition, §3.4 | `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`, line 176 |
| Semisimple all-module recognition, §4.1 | `exists_innerAut_iff_finrank_weightFiltration`, line 196 |
| Specified finite factorwise test family, §4.1 | Named in docstring lines 32–36: no assembled decomposition with factor types/test modules at the pins. No arbitrary predicate replaces it. |
| Lie highest-weight half-integrality, §5.2 | `forall_weight_halfIntegral_iff_highestWeight`, line 215 |
| Algebraic-group highest-weight form, §5.2 | Named in docstring lines 37–41: missing general highest-weight/Borel-line carrier for an irreducible comodule. Native binary-form special cases do not supply it. |
| Positive-real-part recognition, §5.5 | `exists_conj_positiveRealPart_of_weightPattern_eq`, line 264 |

All fourteen own declaration names appear in the README. Conversely its own Lean identifiers resolve to these declarations; symbols such as β_n and D_T are mathematical notation. There is one `import Mathlib` followed by six used individual Tau Ceti imports. Five simple definitions have real bodies. There are no sorry'd data, admitted examples, `set_option`, `lemma` declarations, catalogue-only targets, process identifiers, HTML anchors or machine paths in the package text.

### Pinned declarations and duplication by object

The qualified identifiers were searched by terminal declaration and disambiguated by file/namespace, rather than trusting the resolver (which expressly does not inspect the pinned libraries). The following are the substantive pinned definitions/theorems opened. Abbreviated paths in a cell inherit that cell's explicit directory.

| Object | Pinned file and line; distinction checked |
|---|---|
| Triple and primitive vector | `Mathlib/Algebra/Lie/Sl2.lean:38`, :79. Native triple includes h≠0; primitive vector includes nonzero, H-eigenvector and E-kernel conditions. |
| Action, eigenspace, filtered carrier | `Mathlib/Algebra/Lie/OfAssociative.lean:186`, :196; `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, :446; `Mathlib/CategoryTheory/Filtration/Basic.lean:73`. Kernel/eigenvalue and MonoOver filtration semantics agree; no separate generic filtered category is planned. |
| Killing, root pairing, weights | `Mathlib/Algebra/Lie/Killing.lean:50`; `Weights/RootSystem.lean:411`; `Weights/Basic.lean:183`, :205, :701; `Semisimple/Defs.lean:33`; `Mathlib/LinearAlgebra/RootSystem/Base.lean:68`. Nontrivial generalized weight spaces and simple-support data are actual carriers. |
| Classical models and changes | `Mathlib/Algebra/Lie/Classical.lean:92`, :157, :166, :224, :252, :290, :321, :373; `Matrix.lean:85`. Trace-zero/skew forms, invertible 2, square root of −1 and index transport checked. |
| Exceptional carriers | `Mathlib/Algebra/Lie/SerreConstruction.lean:145`, :152, :155, :158, :161, :164. Quotient carriers exist; exceptional model structure remains the named supplier's input. |
| Spectrum and decomposition | `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:90`, :151, :327, :341; `Decomposition.lean:68`; `WeightMultiplicity.lean:167`; `Basic.lean:359`. Domain hypotheses checked and nonclosed-field `omit [IsAlgClosed K]` read. |
| Raising and ternary labels | `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`, :188, :209; `WeightedDiagram/Basic.lean:124`. These are used as supplied, with zero handled separately. |
| Forms and standard irreducibility | `TauCeti/Algebra/Lie/InvariantForm/Basic.lean:141`; `Sl2/Standard.lean:956`. Proportionality needs an existing nonzero invariant form; it does not define this normalization. |
| Inner group and exponentials | `TauCeti/Algebra/Lie/InnerAutomorphism.lean:99`, :109, :188; `AdjointAction/InnerAutomorphismGroup.lean:70`, :108; `Sl2/Weyl/Automorphism.lean:116`, :330; `Mathlib/Algebra/Lie/Derivation/Basic.lean:398`; `Derivation/Killing.lean:108`; `Mathlib/RingTheory/Nilpotent/Exp.lean:51`; `Mathlib/LinearAlgebra/GeneralLinearGroup/Basic.lean:33`. Int is subgroup closure of nilpotent exponentials, not all automorphisms. |
| Cartan and nilpotent actions | `Mathlib/Algebra/Lie/CartanExists.lean:374`; `TauCeti/Algebra/Lie/CartanExists.lean:45`; `AdjointAction/CartanConjugacy.lean:74`; `Killing/AdNilpotent.lean:211`; `TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:95`. Infinite field, Killing and finite-module hypotheses are respected. |
| Highest-weight repair | `TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122`, :253, :368; `Module.lean:309`; `TauCeti/Algebra/Lie/Submodule/Atom.lean:54`; `TauCeti/LinearAlgebra/RootSystem/Positive.lean:319`. The predicate excludes v=0; the cone theorem needs generation, not module finiteness. |
| Dynkin data | `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:153`, :219; `Opposition.lean:198`. Rank ranges, Bourbaki orientation and opposition match the independent computation. |
| Polarization and spin | `TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:83`; `HalfSpin/Basic.lean:119`, :125; `Polarization/TypeD/Representation.lean:96`, :111; `Polarization/Irreducible.lean:201`; `TypeD/CartanWeights.lean:131`; `TypeD/Character.lean:47`; `TypeD/HighestWeight.lean:197`. Addition law and perfect/separating pairing prevent a fake polarization; occupied coordinate has +1/2. Highest-vector result has even rank≥4; rank 2 is handled explicitly. |
| Type D structure | `TauCeti/Algebra/Lie/Orthogonal/TypeD/Basis.lean:45`; `Killing.lean:265`, :308. Simple/Killing statements require n≥4. |
| Native group carriers | `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean:68`; `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:95`; `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean:102`; `SemisimplePoint/Basic.lean:81`; `Mathlib/Algebra/WithConv.lean:28`. Finite type alone is not connected reductivity; semisimplicity quantifies over finite comodules. |
| Faithfulness and reductivity | `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:311`, :321; `Reductive/Basic.lean:71`, :80; `SpecialOrthogonal/Reductive.lean:149`; `Symplectic/Reductive/Basic.lean:102`. Antipode coefficients, geometric connectedness/smoothness and SO's 2≠0 condition retained. |

Object searches at the pins found spectrum, decomposition, highest-weight-cone, spin, and group-theoretic inputs, not existing recognition/half-integrality declarations duplicating the nine headlines. Near matches such as `LieModule.map_genWeightSpace_eq` transport an already supplied intertwiner; they do not construct one from filtration dimensions. No duplicate fully qualified acceptance declaration was found in the supplied roadmap heads.

### Supplier resolution, open work, order and shape

Read the board package index before absence claims. Its three listed reviewed packages have unrelated subjects. Main/open-head searches used the prescribed `roadmaps grep` and `roadmaps show`; local packages were searched by object too. The closest heads were read: LieHighestWeight #1797 and #1220, SpinRepresentations #1207, ReductiveGroups #1332, ClassicalGroups #1192. Their scopes are ordinary highest-weight/PBW/model theory, spin representations and classical/group structure. For instance #1220's general invariant-form symmetry at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1496` does not define the basis-normalized β_n here; #1207's `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:4` owns spin modules, not triple recognition. ClassicalGroups #1192, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:11`, owns rational classical-group representations and branching, not conjugacy of zero-inclusive triples. R01 records the separate collision found in #1845.

The supplied overlap file reports no other PR changing this package, no cited id dropped by an open revision, and no cited id defined only by an open revision. The current package renumbers no existing id. The citation resolver reports no missing roadmap/name, with its library limitation noted above. Existing suppliers were checked on main, not substituted with their open revisions.

| Supplier citation | Resolution read this round |
|---|---|
| LieHighestWeight Layers 0–6 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319`, :351, :370, :405, :537, :567, :773: sl₂, roots, weights, highest weights, irreducibles, complete reducibility, characters. |
| LieHighestWeight Layers 7–9 | Same file :980, :1158, :1191, :1197, :1432: inner/Chevalley theory, normalized Serre presentation and componentwise assembly, exceptional models, diagonal gl/sl theory. |
| NilpotentOrbits N0.2/N0.3, N2.1/N2.2/N2.4, N4 | `TauCetiRoadmap/NilpotentOrbits/README.md:101`, :113, :162, :169, :187, :215. Complex orbit/partition geometry and zero/nonzero split match the citations. |
| RootSystems former Layers 4–6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1136`–1138 explicitly maps the old labels to native chamber/classification/integral-data interfaces and present sections. The numbering is preserved by that map. |
| SpinRepresentations Layer 5 | `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:777`–808: the pinned Cartan sign, even/odd rank parity and highest weights. |
| ReductiveGroups Layers 1–7 | `TauCetiRoadmap/ReductiveGroups/README.md:1030`, :1046, :1230, :1262, :1687, :1880, :1949, :2253: representations, faithful embedding, Lie/adjoint, subgroup/orbit theory, tori, polynomial exponential, reductivity, root/Bruhat structure. |
| ReductiveGroups 9A/9B/9D/10B | Same file :3046, :3056, :3287, :3845, :4143: pinned Lie comparison, folded classical models, integral group construction and classification, rational highest weights. |
| ReductiveGroupsPartIII §§0.3/0.5 | `TauCetiRoadmap/ReductiveGroupsPartIII/README.md:433`, :467 at its supplied open head: class-function restriction and semisimple trace separation, with the full central torus. |
| NoncompactQuantumSymmetry Layer 3 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1038` at its supplied open head: real-Lie-group adjoint/inner comparison. Cited only to distinguish scope from the algebraic result here. |

Every Needs line was read. No upward edge, cycle, drift or unowned prerequisite was found in the package's consumed contracts. The requested dependency command, including `--movable` and the content checkout, returned:

```
depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R01 is an ownership overlap with a later roadmap, not an existing forbidden supply edge; the repair must preserve that distinction.

House shape was compared with main LieHighestWeight, SpinRepresentations and ReductiveGroups. The package has Summary, Scope, Conventions, supplier contracts, build explanation, six layers with Examples/Dependencies, consumers and references. Every definition has an API and at least three Checks; each numbered target has Checks and a locator or pinned input for its derived assertion. The order is forced where needed: restrictions and graded recovery precede classical/exceptional recognition, those feed factorwise assembly, and the independent highest-weight/pattern strand uses its own lower suppliers. No layer is named for a source chapter or claims to follow a source's exposition. The finite injectivity assertion is mathematics, not an executable algorithm deliverable. Metadata remains `math.RT`.

## Not verifiable

- The published CH/DG editions and Cambridge KIR edition were not collated against the cached versions. The roadmap explicitly cites the versions read, so this is not a missing-source finding.
- This round did not independently reconstruct every Bala–Carter label-to-diagram correspondence in DG. It reread the cited table context, checked the node-order examples and principal/root rows, and recomputed all 91 CH rows' dimensions, bounds and sl₂ inequalities. The preceding review's computed table evidence remains relevant to the unchanged label correspondence; no new complete semantic bijection is claimed here.
- No source request is pending. The two findings concern an ownership collision and a Check's scope, not inaccessible references.

## Source issues

- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1707: the source says every triple spans sl₂; it should separate the zero triple before identifying the span; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1720: the source says ascending neutral coordinates are dominant for its descending chain roots; it should reverse the chain roots or the coordinate order; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1726: the source says to take the largest nonzero increasing-filtration index; it should take the largest nonzero graded index or filtration jump; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.36–37, CH lines 1734,1813,1831: the source says the entries are filtration dimensions; it should identify graded-piece dimensions, with cumulative sums giving filtration dimensions; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1732: the source says E₈ adjoint separation implies separation for its Levi algebras; it should justify complementary summands and conjugacy descent, or check E₆/E₇ independently; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source says to compose a target automorphism on the source side of an sl₂-to-g map; it should postcompose by the automorphism of g; affects nothing.
- **Misprint** in KIR at Theorem 5.7(2), printed p.62, KIR line 2414: the source says raising maps weight n to −n and lowering reverses this; it should use eⁿ from −n to n and fⁿ from n to −n; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "12b62c33bf34af083b111fb7204d268529786ec3", "job": "REV-PKG-LieHighestWeightPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
