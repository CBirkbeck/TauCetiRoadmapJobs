<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6399777963 -->
Review (codex) of 888e10d

Verdict: needs_changes

1. **F01** (P1) Generic analytic loci do not exist for arbitrary local-field definable bijections

   **Location:** `packages/LogicAndDefinabilityInNumberTheory/README.md:421`, §2.5: “For a definable isomorphism f:X→Y between equal-dimensional local-field definable sets, restrict to definable analytic loci of full dimension where the derivative is invertible.” The local-field convention at line 33 does not impose characteristic zero.

   **Claim:** Definability and bijectivity alone give full-dimensional analytic loci with invertible differential over the local fields admitted by the statement.

   **Witness:** In F=𝔽₂((t)), write x=a²+tb² uniquely and set s(x)=b²+ta². This definable involution has difference quotients t along h=t^(2n), and t⁻¹ along h=t^(2n+1), at every x.

   Here the graph is the ring formula ∃a,b, x=a²+tb² ∧ y=b²+ta², with the permitted parameter t. Splitting the even and odd Laurent coefficients proves existence and uniqueness. The map is additive, satisfies s²=id, and restricts to a bijection O_F→O_F. Thus both source and target are one-dimensional open manifolds, each of measure one. Both sequences of increments tend to zero, but t≠t⁻¹. There is no derivative anywhere, hence no nonempty open analytic locus. This avoids relying on a disputed dimension convention for the image of Frobenius.

   The source does not assert this unrestricted positive-characteristic result. `cluckers_loeser_2008` line 1766 explicitly works in characteristic zero; Theorem 7.5.3 at line 1786 is in that paper's characteristic-zero definable category. Section 2.2 of the README itself distinguishes the fixed characteristic-zero theorem from fixed-formula specialization above a residue-characteristic bound. Those qualifications are missing from §2.5.

   **Exact repair:** Separate the two assertions in §2.5. State analytic substitution for analytic diffeomorphisms of local-field manifolds, with invertible differential, over every nonarchimedean local field. State generic analytic preparation of definable bijections in the characteristic-zero settings of §2.2, and state its uniform local-field specialization only for fixed definable data above its corresponding residue-characteristic bound. Keep every prime and every ramification index in the fixed finite-extension-of-ℚ_p theorem. Make the regime explicit at uses in §§2.4 and 3.7–3.9. Add the involution above as a negative-control Check; do not replace the general analytic theorem by a ℚ_p-only formula.

   **Repair tested:** s is excluded from the analytic-diffeomorphism hypothesis because its two difference quotients differ, and from the characteristic-zero generic-regularity clause because char F=2. The genuine analytic map x↦tx remains admitted over F and gives μ(tO_F)=1/2=|t|μ(O_F). The existing characteristic-zero q=3 two-coordinate example remains 1/27 on both sides. This repairs the false regularity assertion while retaining the general analytic measure theory.

2. **F02** (P2) The explicit two-universal-variable headline is statable but absent

   **Location:** `packages/LogicAndDefinabilityInNumberTheory/README.md:1338`, §4.33: “Then t∈ℤ iff for every a,b∈ℚ there exist u∈ℚ⁴,v∈ℚ³ with F=0.” Compare `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean:106` and its module docstring, lines 7–24.

   **Claim:** The acceptance file states the roadmap's statable arithmetic endpoints. It omits the explicit endpoint of §4.33, including its fixed seven-witness formula. The existing one-universal-variable theorem supplies an unspecified polynomial and an unspecified witness arity; it does not test this quantitative, explicit statement.

   **Witness:** A direct definition of F on ℚ and the exact ∀a,b∃u,v equivalence elaborate at the pins with one `sorry` warning. No new syntax, geometric carrier, or computation-code adapter is needed.

   **Exact repair:** Add the following simple definition and theorem in Layer 4, with mathematical docstrings, add their names to §4.33, and include this endpoint in the module docstring. The displayed zero-based indexing is the same formula as §4.33's one-based indexing.

   ```lean
   /-- The polynomial in the two-universal-variable integer definition (§4.33). -/
   def integerFormula (a b t : ℚ) (u : Fin 4 → ℚ) (v : Fin 3 → ℚ) : ℚ :=
     let A := ∑ i, u i ^ 2
     let B := a * u 1 ^ 2 + b * u 2 ^ 2 - a * b * u 3 ^ 2
     let C := a * v 0 ^ 2 + b * v 1 ^ 2 - a * b * v 2 ^ 2
     (a + A) * (b + A) *
       ((u 0 ^ 2 - B - 1)^2 + ((t - 2*u 0)^2 - 4*C - 4)^2)

   /-- Two universal and seven existential rational variables define the integers
   by the explicit polynomial of Koenigsmann, Step 1, p.79. -/
   theorem two_universal_integer_formula (t : ℚ) :
       (∃ z : ℤ, (z : ℚ) = t) ↔
         ∀ a b : ℚ, ∃ (u : Fin 4 → ℚ) (v : Fin 3 → ℚ),
           integerFormula a b t u v = 0 := by sorry
   ```

   **Repair tested:** This definition and signature were elaborated in an isolated scratch file using `import Mathlib`, exit 0, with only the theorem's `sorry` warning. At a=b=1, t=0, u=(0,0,0,1), v=(0,0,1), A=1, B=C=−1, and both squared expressions are zero. At a=−1 and u=(0,1,0,0), the first guard is zero for every b,t,v. Conversely a=b=3 excludes t=1/2: the quaternion ramification set is {2,3}, so its two-trace sum lies in ℤ_(2)∩ℤ_(3), while v₂(1/2)=−1. The monomial a²b²u₄⁸ has coefficient one, giving total degree 12 and existential-block degree 8, as the README correctly states. The source formula is at `koenigsmann_defining_z` lines 258–272, printed p.79.

Two blocking findings: an unrestricted local-field assertion fails in characteristic two, and the explicit two-universal-variable integer definition is missing from the acceptance file. Neither finding re-raises the settled supplier-foundation finding. The package is repairable without changing its scope.

## Verified sound

Read all four package inputs and all 93 numbered targets in the eight layers, including the proof routes, API bullets, Checks, conventions, supplier contracts and downstream descriptions. The seeded sample contains 15 targets; 12 have readable primary/pinned source passages, two cite the settled uncertified Davis paper, and one cites the settled waived Pila–Wilkie paper. The latter's statement also has readable support in Pila 2009. These limitations are distinguished below from mathematical counterexamples.

The review used the main content checkout at 4f7a4021c5eefb6a254dcd4db450663a5f1aa71d, the supplied open-head index and board-package index, Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a, and Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. A locator helper only located supplier texts; the statements and evidence reported here were read and assessed independently.

### Previous findings, checked first

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, general o-minimal foundation cycle | Repaired as a declared contract; external supply remains conditional | README:113 says “supplied independently of the general foundations in LogicAndDefinabilityInNumberTheory §§6.4–6.5”. The same slug occurs in `design/plan.json`. The repair report's “not actionable in this package” reason is valid: B2.6 already owns the general block theorem. Under this brief the precise declared gap is a contract, not a renewed finding. |
| F02, missing undecidability endpoints | Repaired | README:1023 names `hilbert_tenth_integers`; README:1191 names `forall_exists_rational_undecidable`. Suggested.lean:70 and :98 contain the fixed-polynomial statements. Both elaborate. The complement reduction was checked in both directions, including nonintegral coordinates. R02 is a different missing explicit endpoint found by searching for the repaired pattern elsewhere. |
| F03, internal dependency loops | Repaired | README:423 now derives nullity “by the cell decomposition of §2.2”; :433 needs §2.2 and local substitution, not §§2.4 or 2.8. The explicit internal graph has 93 vertices, 182 edges and no cycle. The newly expanded analytic argument was checked adversarially; its generality yields R01. |
| F04, five locator slips | Repaired | README §§4.18, 4.20, 4.25, 4.27, 6.4 now cite respectively “Observation 0, p.74”, “Proposition 6, p.76”, “Corollaries 3 and 3′, p.74”, “Proposition 21(a)–(e), p.87”, and “4.1 and 4.2(1)–(2), p.12”. Read Koenigsmann lines 42, 59–69, 161–255, 712–724 and van den Dries–Miller lines 472–510. The deleted nonsquare declaration has no stale Lean locator. |
| F05, unused sections and duplicate renaming | Repaired | The old boundary, quotient and unused torsion sections are absent. README §4.5 retains the API clause “injectivity of h is not required” and the collapsing-variables Check. All remaining section numbers are consecutive within their layers. The noninjective and permutation evaluations below verify the retained comparison. No deletion stub remains. |
| F06, manifest and process text | Repaired | The manifest has 39 unique source entries with nonempty `cited_for`; the four uncited keys identified by F06 are absent. The Koenigsmann item classes match Proposition 10, Corollary 11, Definition 12 and Lemma 13. The mirror-symmetry substitution locator is now “Lemma 4.3, p.20”, supported at source lines 1083–1091, rather than quotient-stack Lemma 4.11. “design provenance” is absent from the References. |
| F07, duplicate nonsquare acceptance theorem | Repaired | `rational_nonsquares_diophantine` is absent. README §4.27 keeps the mathematical result; Suggested.lean:115 retains the general number-field theorem. For ℚ and r=2, zero is a square, so the nonzero-nonpower set is exactly the nonsquare set, and finite equations combine by a sum of squares. |

The earlier review's displayed numerical rows were usable for unchanged statements after translating section numbers. Its reference to a separate 138-row earlier ledger was not treated as evidence available in this run: the remaining text was read afresh. The repair report's numerical table was a list of claims to test, not an acceptance certificate.

### Seeded source sample

All source locators below refer to the supplied legal cached extractions. No source text was copied into the package or fetched from an unofficial mirror. No new source key or manifest edit was needed. There is no additional author-flagged unverified locator outside the eight settled unavailable works listed under Not verifiable.

| Target | Source passage opened | Result at the stated generality |
|---|---|---|
| 2.8, positive-codimension nullity | `geometric_stabilisation_via_p_adic_integration` lines 248–273, §2.1/Proposition 2.1(a), pp.5–6; `mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int` lines 1102–1114, Proposition 4.4, p.21 | Positive codimension on the smooth locus is null for its ambient measure. The package distinguishes intrinsic zero-dimensional counting measure and gives the analytic-chart argument for its stated variant. It does not infer that a point has intrinsic mass zero. |
| 3.3, coefficient ring | `cluckers_loeser_2008` lines 764–782, §4.2, pp.19–20 | Exactly ℤ[L,L⁻¹,(1−L⁻ⁱ)⁻¹], i>0; evaluation and positivity range over every real q>1. Section 4.1 is background; §4.2 is the operative locator. |
| 3.5, constructible functions | `cluckers_loeser_2008` lines 1189–1226, §§5.2–5.3, pp.28–29 | Tensor product over P⁰, with distinct positive and signed versions. No unsupported injectivity of the positive-to-signed map is claimed. |
| 3.6, graded Functions | `cluckers_loeser_2008` lines 1458–1509, §§6.1–6.3, pp.35–36, and §10.1, pp.59–60 | Support-dimension filtration and its quotient are correct; relative fibre dimension is distinct from total dimension. The relative convention is explicitly visible in §6.3 as well as the cited relative integration context. |
| 3.10, integral identities | `cluckers_loeser_exp` lines 1853–1869, Theorem 9.2.4, p.46 | Equality of whole specialized functions, with compatible coefficient data and a residue-characteristic bound. It is not pointwise transfer across an invented bijection of valued-field parameters. |
| 4.3, polynomial syntax | `hilbert10_polynomial_bridge` lines 607–643, especially `exists_mvPolynomial` at 619; pinned `Poly.induction` | Arbitrary variable type is allowed; constants are integers, including negative constants. Existence in Prop does not provide computable extraction from an extensional native polynomial. |
| 4.5, ring equivalence | `diophantine_functions_and_matiyasevic_s_theorem_native_poly_and_d`, `Poly`/induction/map passages; `multivariate_polynomial_extensionality_on_infinite_boxes`, `funext_set`, lines 51–74 | Surjectivity is structural induction; injectivity uses an infinite natural-number box in ℤ. Renaming can be noninjective. The inverse is classical, not an executable code extractor. |
| 4.13, bounded universal closure | `hilbert_s_tenth_problem_is_unsolvable`, §4 Theorem 4.1 and Lemmas 4.1–4.7, pp.249–252; §5 Theorem 5.1 and Lemmas 5.1–5.2, pp.253–256 | Settled uncertified; exact source wording cannot be checked. The statement retains fixed finite witness arity and handles n=0. Its elementary tests and dependency direction are checked below. |
| 4.14, computation graphs | Same source, Theorem 6.1, pp.257–260 and Theorem 8.1, p.264 | Settled uncertified. The README explicitly distinguishes total positive-integer functions in the cited theorem from the partial-recursive comparison that it must construct. Earlier divergence is not silently skipped in minimization. |
| 4.33, explicit integer formula | `koenigsmann_defining_z` lines 258–272, Step 1, p.79; introduction lines 88–92, p.75 | The displayed guards and norm equations match. Quantifier counts 2 and 7 and the degree calculation are correct. R02 concerns acceptance-file completeness, not truth of the README formula. |
| 6.8, Remmert–Stein | `peterzil_starchenko_agc` lines 596–611, Theorem 4.4/Corollary 4.5, p.12; Theorem 3.2 at lines 501–515 | Definability permits arbitrary dimension of the removed analytic set. The local embedding into a smooth ambient manifold supports the singular ambient variant. Definability cannot be dropped. The proof has transcription slips recorded below. |
| 6.14, rational counting | `pila_wilkie`, Theorem 1.10, pp.591–592, settled waived; `on_the_algebraic_points_of_a_definable_set` lines 192–194 and 265–282, Theorems 3.1 and 3.5, pp.4,6 | Original text unavailable; the readable later primary paper states the uniform result and the stronger block decomposition used here. Constant C precedes the fibre parameter and T; ε>0, T≥1 remain explicit. |
| 6.15, integral/image blocks | `on_the_algebraic_points_of_a_definable_set` lines 220–282, Definition 3.2, Proposition 3.4 and Theorem 3.5, pp.5–6 | A block includes continuous semialgebraic images of basic blocks. Images need not be smooth basic blocks. Positive-dimensional images belong to the algebraic part; a constant image is a point. |
| 6.16, bounded degree | Same source lines 76–82, Theorem 1.6, p.2; lines 322–398, Definition 5.1, Lemma 5.2 and Theorem 5.3, pp.7–8 | Coordinatewise degree, not degree of the generated field; explicit algebraicity; k+1 coefficients; coefficient-height/absolute-height conversion at fixed k. The package corrects the source's coefficient-count typo. |
| 7.6, period codimension | `the_shafarevich_conjecture_for_hypersurfaces_in_abelian_varieties` lines 2958–2978, Lemma 6.3 and proof, pp.64–65; `the_ax_schanuel_conjecture_for_variations_of_hodge_structures` lines 32–64, Theorem 1.1, p.2 | Polarized integral variation, positive-dimensional smooth irreducible base, the monodromy compact dual and the actual Ax–Schanuel hypothesis are retained. The zero-dimensional component is handled separately; no p-adic consequence is asserted here. |

### Computed adversarial pass

These rows record values, not build success as a substitute for mathematics. They include all seeded targets, all acceptance headlines, both findings, the repaired constructions and convention witnesses used across layers. “Retain” means no defect found in the tested assertion; it does not certify a source listed as unavailable.

| Statement | Instances tried | Computed values on the two sides / negative control | Result and change |
|---|---|---|---|
| 0.1 quotient interpretations | ℤ/2 representatives 1,3; equality replaced by literal equality | 1∼3 is true; 1=3 is false. Addition sends both to class 0 after adding 1. | Invariant graphs are necessary; retain. |
| 0.2 composition/semantics | identity interpretation and nested quotient representatives | Translating 1+1=0 in ℤ/2 yields true both before and after identity composition; changing representative 1 to 3 preserves true. | Retain. |
| 0.3 fraction fields | (1,2),(2,4); forbidden (1,0) | Cross-products 4=4; values both 1/2. With a zero denominator, total division would produce 0 and destroy the intended equivalence. | Nonzero denominators and domain retained. |
| 0.4 natural/integer/rational bridges | 0, −1, 1/2 | Natural square-sum predicate admits 0, rejects −1; rational denominator representation of 1/2 uses denominator 2, not 0. | Retain carrier distinctions. |
| 1.1–1.2 valuation/ac | F=𝔽₃((t)), x=t³(2+t), uniformizer changed to 2t | ord x=3, ac_t x=2; ac_(2t) x=2·2⁻³=1. ord(0) has no finite value. | Guards and chosen ac data retained. |
| 1.3 relative elimination | x²=a, a=0 and a≠0 | Zero branch has one root; nonzero square branch has ord a even and square ac(a), e.g. t² has ord 2/ac 1, t has ord 1/ac 1. | Zero branch is not inferred from a totalized valuation. |
| 1.4 AKE | trivial valuation on a field; ramified ℚ₂(√2) | Trivial value group has one element, not ℤ; in the ramified example ord(√2)=1 and ord(2)=2. | Actual value group and equicharacteristic-zero hypothesis retained. |
| 1.5 / `ax_kochen_ring` | sentence ∃x, x²+1=0; p=2,3,5 | ℚ₂ false versus 𝔽₂((t)) true; p=3 false/false; p=5 true/true. | Eventual, sentence-dependent bound is necessary. |
| 2.1 cells | q=5, ord x=0/ac x=1; all units; singleton | Cell mass 1/5; four cells total 4/5; singleton Haar mass 0. ac=0 is not a nonempty 1-cell. | Retain. |
| 2.2 preparation | ℚ₂, f=1 and f=x²+y²; ℚ₂(√2) | f=1 has ord 0; at (0,0) f=0 has no finite ord; ord 2=2 in the ramified field. | Fixed-prime and uniform regimes correctly distinguished here. |
| 2.3–2.4 constructibility/integrability | φ=ab−c on all F; a=2,b=3,c=6 or 5 | φ=0 gives integral 0; φ=1 gives infinite absolute integral on F. Integrability locus is c=ab, not a Presburger set. | Constructible zero-locus certificate is necessary; retain. |
| 2.4 Presburger summation | q=3, ∑3⁻ⁿ; ∑n3⁻ⁿ; ∑1 | 3/2; 3/4; divergent. Equal-exponent coefficients 1 and −1 cancel to 0 before testing convergence. | Retain cancellation and absolute summability. |
| 2.5 generic analyticity | F=𝔽₂((t)), s(a²+tb²)=b²+ta² | s²=id, μ(O)=1 on both sides; difference quotients t≠t⁻¹ at every point. | False as unrestricted local-field claim; R01. |
| 2.5 substitution sign | x=πu; (x,y)=(πu,π²v), q=3 | Target masses 1/3 and 1/27 equal determinant densities; inverse factors give 3 and 27. | Analytic theorem and sign retained. |
| 2.6 normalized tail identity | f=0; f=1; f=x, q=2 | (Z,A)=(0,1/(1−T)), (1,1), ((1/2)/(1−T/2),1/(1−T/2)); TZ=1+(T−1)A in all three. | Retain zero polynomial and n=0. |
| `igusa_poincare_rationality` | m=0,f=1; m=1,f=0; ramified DVR,f=x | Raw count series 1; 1/(1−qT); 1/(1−T). At level 0 the quotient has one point even for f=1. | Lean raw-count form differs from normalized A only by T↦q^mT; retain. |
| 2.7 tensor gauge | q=3, ω=(π²)(dx)⊗², r=2 | Density abs(π²)^(1/2)=1/3, not 1/9. Replacing chart x=πu multiplies by abs(π). | r>0 and tensor root retained. |
| 2.8 nullity | point in F; graph F×{0}; F⁰ | Ambient masses 0 and 0; intrinsic mass of F⁰ is 1. | Matching ambient dimension is essential; retain. |
| 2.9 Weil volume | A¹/O, G_m/O, q=5 | #A¹(k)/q=5/5=1; #G_m(k)/q=4/5. | Haar normalization agrees with supplier. |
| 2.10 Néron dual counts | cyclic Frobenius acting by −1 on ℤ/3; split Tate curve n=3,q=5 | Kernel and cokernel of σ−1 each have size 1; component/identity product 3·4=12 for both duals. | Retain finite-residue and duality contract. |
| 2.10 finite duality | pairing rs/3 versus zero pairing | Value on (1,1) is 1/3 versus 0; first is perfect, second is not. | Gap asks for substantive perfectness, not mere pairing existence. |
| 2.11 isogeny volume | multiplication by 2 on a good-reduction elliptic curve over ℚ₃ | Both integral-point volumes are #E(𝔽₃)/3; derivative determinant is 2, of absolute value 1. | Prime-to-residue-characteristic condition retained where used. |
| 2.12 relative top forms | base t, fibre x, ω=dt∧dx | Base-first identity gives dt∧dx; reversing order gives −dt∧dx. Absolute densities agree only after taking absolute value. | Sign convention retained. |
| 3.1 subassignments | ∀y,y²≠−1 under ℝ⊂ℂ; affine elliptic curve | Truth set changes {⋆}→∅, so not a subfunctor. Elliptic function-field genus 1 differs from genus 0 of an open A¹. | Subassignment and closed embeddings retained. |
| 3.2 direct image | two points mapping to one point | f!1=2, f!(1·1)=2, but (f!1)²=4. Scissor relation 2=1+1. | Additive pushforward, not ring homomorphism. |
| 3.3 coefficient localization | q=2; q=1; q=3/2 | (1−q⁻¹)⁻¹=2 at q=2; denominator 0 at q=1; L−2 evaluates to −1/2 at q=3/2. | q>1 and all-real-q positivity retained. |
| 3.4 Presburger functions | ∑L⁻ⁿ and its q=2 evaluation | Formal coefficient (1−L⁻¹)⁻¹ evaluates to 2=1+1/2+1/4+…; ∑1 diverges. | Summability hypothesis retained. |
| 3.5 tensor relations | generator 1_Y and L−1; signed difference | 1_Y⊗1=1⊗[Y]; at q=3, L−1 gives 2 on either side. Signed subtraction gives [Y]−[Y]=0, not a positive-object inverse. | Distinct positive/signed constructions retained. |
| 3.6 grading | singleton; graph of x↦x² over A¹; empty support | Singleton contributes 1 in degree 0, 0 in degree 1. Graph has total dimension 1 and fibre dimension 0. Empty class is 0 in every degree. | Retain intrinsic/relative distinction. |
| 3.7–3.9 pushforward and specialization | one ball of ord n/ac 1; q=3; projection of two-point fibre | Motivic volume L^(−n−1) evaluates to 3^(−n−1); fibre pushforward 1+1=2. | Normalization and additive law agree; regularity regime needs R01 clarification. |
| 3.10 universal integral identity | φ(s)=∫_O 1=q⁰, ψ(s)=1; ψ(s)=0 | Whole-family equality is true in both fields for ψ=1, false in both for ψ=0. Both integrals equal 1, not an assigned correspondence of VF parameters. | Retain universal quantification. |
| 3.11 realization | G_m and P¹ | [G_m]↦L−1 and [P¹]↦1+L, then L↦[ℚ(1)]; q=3 gives 2 and 4. | No asserted isomorphism of coefficient rings. |
| 4.1–4.3 signed syntax | constant −4; X₀−2X₁ at (1,3); X₀X₁ at (2,5) | −4=−4; −5=−5; 10=10 under native Poly evaluation and polynomial evaluation. | No natural-coefficient restriction. |
| 4.4 injectivity | P=X(X−1), inputs 0,1,2 | Values 0,0,2; equality with zero on two points fails globally. On all naturals infinite-box extensionality applies. | Finite-grid substitution rejected. |
| 4.5 equivalence/renaming | identify two variables in X₀−X₁; swap at (2,5) | Collapsed polynomial 0 evaluates 0; swapped value 5−2=3 agrees with pulled-back assignment. | Noninjective renaming and contravariant assignment direction retained. |
| 4.6–4.9 finite witness compression | P=U−V−1; arbitrary input coordinates unused by P | Witnesses (1,0) give 0; merging them gives −1 for every value. Compression keeps two distinct supported variables and leaves all inputs fixed. Empty witness set for 1 gives no root. | Retain injective enumeration and fixed inputs. |
| 4.10 coding / 4.11 enumeration | code for X−2 at 2 and 3; extensional zero polynomial | Evaluations 0 and 1 determine acceptance/nonacceptance of these witnesses. Many syntax codes can evaluate identically to 0. | Explicit syntax is needed for effective coding; no inverse extraction from Poly is claimed. |
| 4.12 sequence coding | residues 1 mod 3, 2 mod 4 | Code 10 gives residues 1 and 2. Using noncoprime moduli 2,4 with residues 1,0 has no solution. | CRT coprimality retained. |
| 4.13 bounded ∀ | P(i): i=0, n=0,1,2 | Empty conjunction true; one test 0=0 true; two tests include 1=0 false. | Retain; exact Davis text uncertified. |
| 4.14 minimization | g(0) undefined,g(1)=0; g(0)=1,g(1)=0 | Standard partial minimization is undefined in first case, equals 1 in second. Skipping divergence would incorrectly give 1 in both. | Earlier defined-output certificate retained; Davis text uncertified. |
| 4.15 / `mrdp` | n=0, empty/full predicates; even naturals | One empty tuple; equations 1=0 and 0=0 give empty/full. x−2y=0 admits 4 (y=2), rejects 3. All three predicates are recursively enumerable. | Native finite-tuple form matches README. |
| 4.16 / `hilbert_tenth_integers` | natural 2 versus integer −1 under four-square encoding | 2=1²+1²+0²+0²; −1 cannot be a sum of integer squares. Parameter remains fixed before witnesses. | Integer reduction retains the natural-domain restriction; no proof of undecidability is inferred from a small instance. |
| 4.17 ring Diophantine systems | two equations x=0,y=0 over ℚ versus ℂ | x²+y²=0 over ℚ forces both 0; over ℂ, (1,i) gives 0 with neither coordinate 0. | General rings keep finite systems. |
| 4.18 conditional transfer | t=1/2; t=3 | m=1,n=2,a=1,b=0 gives am+bn=1 and m=tn. For t=3, coprimality forces n=±1, excluded. | Observation 0 route and denominator restriction retained. |
| 4.19–4.20 quaternion traces | (−1,−1); (3,3); dyadic table (6,15) | Real two-trace range [−4,4], so 3 admitted and 5 excluded. Δ(3,3)={2,3}. Source triple (1,1,0) gives −21≡3; replacement (1,1,1) gives 69≡5 mod 8. | Real place and corrected local table retained. |
| 4.21 prime classes | R³₃, R³₅, R¹_(1,3) | ℤ_(3), ℤ_(2), ℚ respectively. For p=5 the dyadic factor survives outside the class-three guard. | Guarded claim retained, no unguarded identification with ℤ_(p). |
| 4.22 radicals | (a,b)=(−1,3); split (1,1) | Δ={2,3}; even dyadic valuations remove 2 from J, leaving 3ℤ_(3). In split case empty intersection is ℚ while Jac(ℚ)=0. | The nonempty/prime guard is necessary and present. |
| 4.23–4.24 universal integers | t=0,−2,1/2,1/3 | All finite-place valuations of 0 and −2 are nonnegative; v₂(1/2)=−1; v₃(1/3)=−1. | Universal definition includes exactly embedded integers in these tests. |
| `rational_nonintegers_diophantine` | same four rationals | Complement membership false,false,true,true; negation of ∀g≠0 gives ∃g=0. | Complement direction correct. |
| 4.25 / `forall_exists_rational_undecidable` | q=(P(a,z)w−1)∏g(zᵢ,uᵢ); nonintegral z; integral root; integral nonroot | Noninteger certificate gives factor 0; integer root gives (−1) times nonzero factors, hence never 0; nonroot admits w=P⁻¹, giving 0. | Formula defines the complement of integer solvability, with correct quantifier order. |
| 4.26 union of local rings | p=17·41, t=1/17 | v₁₇(t)=−1, v₄₁(t)=0; t belongs to the union, not the intersection. | Retain union. |
| 4.27–4.28 one universal variable | t=0,1/2; dyadic classes 1,3 | Integer predicate true,false; 1+ℤ_(2)=3+ℤ_(2), while 1+8ℤ_(2) and 3+8ℤ_(2) are disjoint. | Corrected S_p and residue-class guards retained. |
| 4.29 normic zero-cycle input | split norm versus cyclic quadratic norm; zero-cycle degree | Split norm product attains every scalar, including 0. N_ℚ(i)/ℚ(x+iy)=x²+y² excludes −1. A point of degree d represents a zero-cycle of degree d, not degree 1. | Cyclic étale norm and stated zero-cycle degree retained. |
| 4.30 / `nonpowers_diophantine` | ℚ,r=2: −1,0,4; ℚ,r=3:2,−8; ℚ(i),r=2:−1 | Membership true,false,false; true,false; false since i²=−1. | Number-field generality and nonzero guard retained. |
| 4.31–4.32 existential preservation | ℚ⊂ℚ(√2); formula ∃x,x²=2 | False in ℚ, true in the extension; hence this embedding is not existentially closed. Identity embedding gives equal truth values for every formula. | No false preservation under arbitrary extensions. |
| 4.33 explicit formula | a=b=1,t=0; a=−1; a=b=3,t=1/2 | F=0 with A=1,B=C=−1; first guard 0 in nonpositive case; t=1/2 fails 2-integrality for positive pair. Degrees 8/12 as in R02. | README sound; add missing acceptance headline. |
| 5.1 normalization | all O², q=3,n=2; n=0 | Raw count 3⁴=81, factor 3⁻⁴=1/81, measure 1; level-zero count 1 and measure 1 for invariant full set. | Reduction invariance retained before counting. |
| 5.2–5.3 transferred local factors | f=x,q=3, T=0 and T=1/3 | Z=(2/3)/(1−T/3) gives 2/3 and 3/4. At s=1, T=1/3 agrees with ∫_O abs(x). | Analytic substitution and normalization are explicit; no Euler-product conclusion. |
| 5.4 singular product fibre | q=2; ord a=1 and 2 | Fibre masses 2·(1/2)=1 and 3·(1/2)=3/2; q²(1−q⁻¹)²∑_(n≥1)(n+1)q⁻ⁿ=3=2q−1. | Singular zero fibre is excluded from smooth relative formula. |
| 6.1 o-minimal predicate | (0,1), ℤ, ℚ | Frontiers {0,1}, ℤ, ℝ; sizes 2,infinite,infinite. Closure minus the set would incorrectly give empty boundary for ℤ. | Native frontier predicate distinguishes the wrong models. |
| 6.2–6.3 analytic symbols | restricted constant 1; x=1 and x=2; unrestricted exp | Restricted values 1 and 0; exp(2)>1. Moving the cube endpoint outside would wrongly make value at 1 zero. | Closed-cube convention retained. |
| 6.4–6.5 cells/dimension | unit disk partition; point; empty set | Five base cells yield 1+3+5+3+1=13 plane cells; dim(point)=0; empty has no point to choose. | Finite C^p cells and nonempty fibres for choice retained. |
| 6.6–6.7 atlases | line, half-line, complex affine line | At origin the real chart domains are ℝ and [0,∞); complex A¹ has real dimension 2. A boundary point is not an interior chart point. | Finite definable atlas and real/complex dimension distinction retained. |
| 6.8 closure | A={(z,0):z≠0} in ℂ², E={z=0}; graph e^(1/z) | First closure adds (0,0), producing a complex line of dimension 1. In the second, vertical limit points fill the missing fibre and violate a locally finite analytic closure; that graph is not definable in the required category. | Definability matters; retain. |
| 6.9 Chow | algebraic line; graph of complex exp | Line is closed analytic and algebraic. exp graph intersects w=1 at infinitely many isolated z=2πin, impossible for a definable discrete fibre. | Nondefinable analytic graph is excluded. |
| 6.10 finite algebraic union | finite singleton union; all singleton points of a line | First gives exactly finitely many points; uncountable union gives a line and is outside the countable-union hypothesis. | Countability not silently dropped. |
| 6.11 / `algebraicPart` | interval; {0,1}; n=0 | Algebraic parts are the interval, ∅, ∅. Connected sets with two distinct points are positive-dimensional in the semialgebraic setting. | Definition excludes finite and zero-dimensional substitutes. |
| 6.12 / `rationalTupleHeight` | −3/4; (−3,2); 0; empty tuple | Heights 4,3,1,1, matching numerator/denominator maxima and the outer max 1. | Native rational height bridge retained. |
| 6.13 blocks | interval, singleton, exp graph | Dimensions 1,0,1; interval is a basic block, singleton a block, exp graph has no positive-dimensional semialgebraic containing set of equal dimension. | Incorrect unrestricted image-map notion excluded. |
| 6.14 / `pila_wilkie` | ℝ; graph y=2^x at T=8; n=0 | Outside algebraic part: 0 for ℝ; points (0,1),(1,2),(2,4),(3,8) give four displayed graph points; n=0 count 1 or 0. | Subpower bound, not zero count or parameter-dependent constant. |
| 6.15 image blocks | identity and constant map on (0,1); integer tuple (−3,2) | Image dimensions 1 and 0; algebraic parts interval and ∅; tuple height 3 equals sup norm. | A constant image cannot force a positive-dimensional algebraic locus. |
| 6.16 / `bounded_degree_counting` | √2; (√2,√3); transcendental x; n=0 | Degree/height (2,√2); coordinate degrees (2,2) versus joint degree 4; transcendental minpoly degree 0/height 1 but algebraicity false; empty-tuple count 1. | Explicit algebraicity and coordinatewise degree retained. |
| 6.16 height conversion | X²−2,k=2,T=2 | Coefficient height 2≤2²·2²=16; degree-one coefficient vectors cannot encode √2, whereas (−2,0,1) can. | k+1 coefficient correction verified. |
| 6.17 orbit/counting exponent | c=C=1, δ=1,A=2, ε=1/4 | Orbit lower bound D exceeds counting exponent D^(1/2) for D>1; choosing ε=1 instead would give D² and fail the comparison. | ε<δ/A retained. |
| 7.1–7.4 pure AO reductions | A₁; {0,1728}; {1} | Infinite CM locus dense in A₁; finite set has two special points; {1} has zero CM points. For singleton nonspecial V the density hypothesis is false. | Actual input datum retained, not an arbitrary predicate containing the conclusion. |
| 7.5 CM-pair curve | diagonal; j₁=1728; j₁=1 | First two have infinitely many CM pairs and are excluded special curves; last has zero. | Horizontal/vertical special exceptions retained. |
| 7.6 period codimension | dim X=2, dim Ď=3, codim Z=2; dim U=1 or 0 | codim W=3, codim(X×Z)=2; positive U gives codim U=4<5. Zero-dimensional U projects to a point, proper because dim X=2>0. | Correct strict inequality and separate zero-dimensional argument. |
| 7.7 mixed AO | torsion point and nontorsion point in CM elliptic fibre; pure limit | Special-point counts 1 and 0; pure limit has torsion order 1. | Torsion and pure-orbit inputs retained. |

The arithmetic computations above also check the source-versus-supplier conventions: Hilbert symbols use the same quadratic norm signs; quaternion (3,3) has nontrivial symbols at 2 and 3; the Brauer sign 1/2 corresponds to Hilbert sign −1; local volume uses |π|=q⁻¹; relative wedge order is base first; rational height is maximum reduced numerator/denominator height. None requires an arbitrary-topology carrier or a conclusion hidden inside a hypothesis.

### Library and ownership audit

Opened the following objects at the pins, rather than inferring their contents from names. A further scratch file containing `#check @name` for all 56 explicitly Mathlib-qualified declaration references extracted from the README elaborated with exit 0 and no warnings/errors.

| Pinned file and line | What was checked; ownership consequence |
|---|---|
| `Mathlib/NumberTheory/Dioph.lean:47`, :92, :197, :228, :245, :667 | The comparison TODO; `Poly` as integer-valued functions on natural assignments; induction into Prop; renaming; `Dioph`; exponentiation. These existing objects are imported. They do not supply the full computation-to-polynomial comparison promised here. |
| `Mathlib/Algebra/MvPolynomial/Funext.lean:51`, :56 | `funext_set` assumes a commutative domain and infinite coordinate sets; arbitrary variable type is allowed. The natural subset of ℤ meets these hypotheses. |
| `Mathlib/Computability/Halting.lean:60`, :64, :67 | Halting is RE, is not computable, and its complement is not RE. The roadmap imports the obstruction and owns the Diophantine reduction. |
| `Mathlib/ModelTheory/Arithmetic/Presburger/Definability.lean:162`, `presburger.mul_not_definable` | The carrier is ℕ. Restricting an alleged integer Presburger multiplication definition to nonnegative inputs is required and is stated. |
| `Mathlib/ModelTheory/Ultraproducts.lean:74`, :146, :154; `Ultraproduct.structure`, `realize_formula_cast`, `sentence_realize` | Native structure and Łoś transfer are imported, not reproved as new targets. Formula transfer includes nonempty factors. |
| `Mathlib/RingTheory/Valuation/ValuationSubring.lean:37`, :161 | Valuation subring and actual value group; the latter is not definitionally ℤ for every valuation. |
| `Mathlib/NumberTheory/Height/NumberField.lean:136`, :532 | `NumberField.absMulHeight₁` has actual off-algebraic value 1; `Rat.mulHeight₁_eq_max` supplies the rational formula. Algebraicity is explicitly retained in counting. |
| `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68` | `IsSemialgebraic` is the Boolean algebra generated by polynomial zero/positivity sets. Real coefficients are allowed; projection closure is not a field of this definition. |
| `TauCeti/RingTheory/GrothendieckRing.lean:180`, :205, :232 | `ofRingHom`, `liftRingHom`, `instCommRing` supply general semiring ring-completion. The residue-definable scissor objects remain additional work. |

Searches by object used `roadmaps grep` over main and indexed open heads, supplemented by pinned source searches and the supplied board-head texts. Search objects included polynomial function evaluation/renaming, MRDP and recursive graphs, quaternion definability/nonpowers, Denef–Pas/Ax–Kochen, constructible motivic pushforwards, generic o-minimal cells/choice, block counting, gauge measures and period codimension. Generic semialgebraic elimination, Grothendieck completion, gauge measures for affine groups, arithmetic Hodge carriers, and block decomposition have the named existing owners below; their narrower library/supplier objects are not restated in Suggested.lean.

No second declaration with one of this file's fully qualified names was found in the inspected libraries or roadmaps. The resolver's sole lead, `Diophantine.mrdp`, is the declaration in this package's nested namespace at Suggested.lean:63; it is not a missing supplier declaration.

The supplied LawrenceVenkateshMethod board head has a design, not a second package theorem file. `packages/LawrenceVenkateshMethod/design/README.md:164` assigns the complex-period consequence to MordellLawrenceVenkateshPartII M2.3. That roadmap is at merge position 298, whereas this one is at 153. Under the direction-of-supply rule, §7.6 remains here and that later consumer should cite it; it is not an upward supplier for this package. The actual referenced Mordell reader is unavailable in the supplied trees, so no stronger comparison of its signature is claimed. The supplied ShimuraVarietiesPartII and RealSurfacePeriodIndex designs were also searched for overlapping carriers; they supply no duplicate acceptance signature for this package.

### Supplier citations and direction

All 17 named roadmap supplier contracts were resolved against their main text or supplied/indexed open head. Main roadmaps were used as main roadmaps, not replaced by revision pull requests. The following are the operative section locations; relative paths are prefixed by `TauCetiRoadmap/` and end in `/README.md`.

| Supplier | Resolved sections and lines; consumed scope |
|---|---|
| SchemeAndStackFoundations | §0.7 at 755, §2.20 at 4275 (smooth identification at 4350): finite-type dimension and relative dualising/top-exterior-power comparison. |
| NeronModelsAndSemistableAbelianVarieties | §2.5 at 1112, §4.6 at 2361: functoriality and pairing; perfectness there is semistable only. General finite-residue perfectness is the explicitly declared gap. |
| ReductiveGroupsPartII | RG2.3.7 at 5201: Lang for smooth geometrically connected groups over finite fields; disconnected groups are not silently included. |
| MotivesAndAlgebraicCycles | §4.20 at 914: scissors and χ^c; the particular localization/realization in §3.11 remains this roadmap's work. |
| HeightsRationalPointsAndObstructions | §§2.16b, 2.17, 2.20, 2.21 at 1146,1159,1215,1267; §§5.1,5.6,5.8 at 2168,2271,2391: residues, proper-model unramified Brauer groups, arbitrary-degree zero-cycle pairing, formal lemma, and Manin–Mumford. |
| QuadraticFormInvariants | Layer 2 at 1025; §6C items 9,10,12 at 1945,1963,1992: quaternion norm/trace, general odd-residue symbol formula, dyadic formula and its table. |
| GlobalQuadraticForms | §§4.1–4.4 at 381,391,432,443; §5.5 at 665, §6.1 at 694: approximation, square/norm principles, sign prescription, isotropy and scalar representation. |
| DiophantineApproximationAndTranscendence | §§0.2–0.3 at 227,358; inequalities at 344–352; §5.6 remains the differential-exponential input, not Hodge Ax–Schanuel. Bounded-degree Northcott retains algebraicity and characteristic zero. |
| ShimuraVarieties | §§3.5a,3.5d,3.6 at 798,852,862: R_an,exp foundations, smooth definable Chow/local analytic extension, and Hermitian arithmetic comparison. No general-expansion foundation is inferred from §3.5a. |
| AdelicAlgebraicGroups | §2.4 at 1877–1971: characteristic-zero smooth affine groups and gauge volumes. Arbitrary analytic manifolds/tensor densities and arbitrary smooth models in this package are broader objects. |
| AbelianSchemesAndArithmeticModuliPartII | B2.6 at 1326, B2.7 at 1352, B2.14 at 1539, B2.15 at 1568, B2.18 at 1609: general block decomposition, free-word growth and invariant torus/abelian results. The independent foundation supply is a declared contract, not an inferred citation to this later consumer. |
| RealAlgebraicGeometry | Layers 3 and 6 at 298 and 437–477: real semialgebraic syntax and elimination over ℝ, not arbitrary real closed fields. |
| DifferentialGeometry | Boundary and corners at 63–94: manifold substrate, not nonarchimedean substitution. |
| ResolutionOfSingularitiesCharacteristicZero | §6.2 at 770: smooth projective compactification with SNC boundary for smooth quasi-projective characteristic-zero varieties. |
| WeilConjectures | Curve RH from the surface bound at 1037: all-conjugates reciprocal-root bound used for the curve estimate. |
| Chebotarev | Layer 14 at 609–632: natural density and removal of finitely many primes. Nonempty conjugacy class has positive density #C/#G. |
| ClassFieldTheory | Layers 5,10–13, respectively at 920,1552,1683,1724,1799: local invariants, global sum, reciprocity, class fields and cyclic norm theorem. The latter includes actual local étale-algebra norms and the cyclic hypothesis. |

Both declared gap slugs match `packages/LogicAndDefinabilityInNumberTheory/design/plan.json` and README Exact supplier contracts:

- `neron-pairing-perfect-finite-residue`: one missing perfectness property for arbitrary abelian varieties over nonarchimedean local fields with finite residue field, without semistability. Existing pairing and semistable perfectness do not discharge it.
- `general-ominimal-block-foundations`: the cell, dimension and choice interface needed by B2.6 for arbitrary o-minimal expansions, independently of this later consumer. R_an,exp alone does not discharge it. This is a coherent single foundation interface, with named supplier and section.

Neither gap has supplier `none`, neither is an invitation to assume its consumer's conclusion, and neither is re-raised as an unowned prerequisite. Any eventual acceptance remains conditional on these contracts.

Every `*Needs:*` line and supplier citation was read. The internal linked-target graph has no cycle. The required mechanical dependency command exited 0 with exactly:

```text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This output checks explicit directions; the independently declared general-foundation gap is not falsely treated as implemented by this output.

### Acceptance file, shape and headline coverage

`lake env lean` on the unchanged package Suggested.lean, from the pinned content project, exited 0. There were eleven warnings, all `declaration uses sorry`, and no errors or other warnings. The individual Tau Ceti import was already built; no build or cache mutation was needed. A scratch copy with `#check @name` for all 16 declarations also exited 0. Comparing every elaborated type with the README found no dropped section binder: the DVR theorem retains CharZero/IsDomain/finite ℤ_p-algebra, the number-field theorem retains r>1, and both counting statements retain hL, hX, k≥1 where relevant, ε>0, T≥1 and C before all parameters.

Each of the eleven admitted theorems was probed on a copy with `rfl`, `simp`, `infer_instance`, and one-lemma `exact?` alternatives. None closed. The eleven failures were theorem-proof failures, not import or signature failures. Reading the native definitions and surrounding library did not identify remaining padding. The five real definitions are used in the retained headlines; there is no sorry'd data, empty Prop field, `set_option`, admitted example, or extra roadmap import.

| README headline | Acceptance result |
|---|---|
| §1.5 eventual Ax–Kochen transfer | `ax_kochen_ring`, correct eventual quantifiers. |
| §2.6 all-prime Igusa–Poincaré rationality | `igusa_poincare_rationality`, finite characteristic-zero DVR extension, raw series equivalent to normalized form. |
| §4.15 MRDP | `Diophantine.mrdp`, native REPred and Dioph on finite tuples. |
| §4.16 integer H10 | `hilbert_tenth_integers`, fixed-polynomial family with a noncomputable integer-parameter predicate. |
| §4.24 universal integers / rational nonintegers | `universal_integers`, `rational_nonintegers_diophantine`. |
| §4.25 rational ∀∃ undecidability | `forall_exists_rational_undecidable`, fixed polynomial and fixed block sizes. |
| §4.28 one universal variable | `one_universal_variable`; fixed existential arity, not depending on t or x. |
| §4.30 number-field nonpowers | `nonpowers_diophantine`, genuine finite-system normal form. |
| §4.33 explicit two-universal/seven-existential formula | Missing and statable: R02. |
| §§6.14,6.16 uniform rational/bounded-degree counting | `pila_wilkie`, `bounded_degree_counting`, actual definable fibres and native heights. |
| §§1.3–1.4 relative Denef–Pas/AKE; §§3.7–3.10 motivic pushforward/specialization/transfer | Docstring names missing three-sorted structures/syntax and constructible motivic/graded-pushforward carriers. No stand-in is supplied. |
| §2.11 dual Néron volume; §4.29 normic zero-cycles; §6.9 definable Chow | Docstring names missing gauge-measure/Néron, normic-compactification/Brauer–Manin, and definable-complex-analytic carriers. |
| §§7.4–7.7 pure AO, CM-pair, period-codimension and mixed AO reductions | Docstring names the missing Shimura/special/uniformization, Hodge–Deligne/period-domain and mixed Shimura carriers. The readable native libraries do not provide those constructions. |

The README has the required opening summary, scope, conventions, exact contracts, build guide, eight layers, eight Examples and eight Dependencies endings, downstream consumers and references. Definition blocks retain prose APIs and at least three discriminating Checks; the numerical rows above test the notable normalization and wrong-model controls. Native and supplier APIs are cited instead of repeated as acceptance lemmas. The computability sections describe the mathematical representation and reduction theorems needed for MRDP, not a separate executable solver deliverable. The package and metadata remain unchanged by this review. No copied source passage, route-specific bypass or re-planned existing roadmap was identified beyond the precise generality defect R01.

## Not verifiable

- `hilbert_s_tenth_problem_is_unsolvable`: settled uncertified/paywalled. The exact Davis statements/proofs behind §§4.12–4.16, especially sampled §§4.13–4.14 and the Theorem 8.1 p.264 locator, could not be read. Their small-instance tests and native comparison obligations were checked; the source text was not guessed.
- `hodges`, Model Theory §5.3; `bosch_lutkebohmert_raynaud`, §7.3 Proposition 6; `schneider`, Proposition 6.4 p.42 and §7; `denef_1984`, Theorems 1.1–1.2: settled uncertified. Their exact source passages remain unverified. R01 is an explicit counterexample to the package's generality and does not rely on attributing an unread assertion to Schneider.
- `vd_dr_tame`, `vd_dr_macintyre_marker`, `pila_wilkie`: settled waived. These texts were not requested again. Pila 2009 gives readable statement/block-theorem evidence for the sampled rational-counting consequence, but does not make the original waived pages readable.
- The actual MordellLawrenceVenkateshPartII M2.3 reader linked by the supplied LawrenceVenkateshMethod design is absent from that supplied tree and the main checkout. The design's ownership reference and merge position were checked; its full theorem signature was not. No absence-from-the-portfolio claim is made.
- Ownership against open pull requests whose files/heads were not supplied by the brief was not independently certified. Searches of the tool's wider index were leads, not a substitute for opening the named sources. The declared supplier gaps remain contracts to be fulfilled, not theorems proved by this review.

No new missing-reference request was created: every cited work needed here already has a certified, waived or uncertified manifest key. The eight settled unavailable entries were preserved. The waived `cl_addenda` key mentioned in the brief is not cited by the current package and was not reopened.

## Source issues

- **Error** in cluckers_loeser_2008 at §5.1, p.28: the source says residue-definable direct image induces ring and semiring morphisms; it should be additive with the projection formula, since a two-point fibre gives 2 rather than 4 under multiplication; affects a stated result.
- **Error** in cluckers_loeser_2008 at §15.1, p.83: the source says each affine chart is isomorphic to an open subset of affine space; it should be embedded as a closed subset of affine space, with intrinsic dimension and embedding-independent gluing; affects the proof.
- **Error** in koenigsmann_defining_z at proof of Proposition 6, table, p.78: the source says the (6,15) row uses (1,1,0), giving −21≡3 mod 8; it should be a triple such as (1,1,1), giving 69≡5 mod 8; affects the proof.
- **Misprint** in koenigsmann_defining_z at proof of Proposition 10(b), p.81: the source says the displayed class-five and class-seven trace sums have parameter factors inconsistent with Definition 7; it should be T₋₂,₋p+T₂,₋p and T₋₁,₋p+T₋₂,p respectively; affects nothing.
- **Error** in koenigsmann_defining_z at Lemma 13, closing clause, p.82: the source says its dyadic condition suffices to identify J_ab with the Jacobson radical; it should also require nonempty ramification, since the split case gives J_ab=ℚ but Jac(ℚ)=0; affects a stated result.
- **Misprint** in koenigsmann_defining_z at Corollary 22, p.90: the source says the class-one clause uses an undefined one-parameter R¹_p; it should be S_p from Definition 19, as in Lemma 20; affects nothing.
- **Misprint** in koenigsmann_defining_z at proof of Corollary 22, p.91: the source says the local congruence guard uses k+ℤ_(2); it should be k+8ℤ_(2), which distinguishes the four odd residue classes; affects nothing.
- **Misprint** in peterzil_starchenko_agc at proof of Theorem 4.4, p.12: the source says to apply Theorem 3.2 to M_i and A and estimates cl(M_i∩E); it should use M_i and E and estimate cl(M_i)∩E; affects the proof.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition 5.1, p.7, and Lemma 5.2, p.8: the source says k coefficients with powers zero through k−1 encode degree-at-most-k algebraic numbers; it should use k+1 coefficients and powers zero through k; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at headings of §§4–5, pp.6–7: the source says these sections prove Theorems 1.3 and 1.2; it should identify Theorems 1.7 and 1.6; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at proof of Proposition 3.4(2), p.6: the source says the preimage points and connecting path lie in the image block U; it should place them in its source basic block V; affects the proof.
- **Misprint** in native_multiplicative_heights at the absMulHeight₁ docstring, line 1617, no printed page: the source says the value outside the algebraic domain is zero; it should be one, as the actual definition returns; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "888e10d3381ad2896ffc248738cfaf9b049ca3d2", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
