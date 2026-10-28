<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6394659289 -->
Review (codex) of f831e23

Verdict: needs_changes

1. **F01** (P1) The cited supplier does not supply p-adic compatibility of Hodge tensors

   **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:390`: “Import the absolute-Hodge p-adic comparison from AutomorphicBundles §§B1.1–B1.3.” Also §2.3, line 384, and the contract at line 74.

   **Claim.** The route to the integral CM tensor torsor treats compatibility of the absolute Hodge tensor realizations under the p-adic comparison as supplied. This is not the complex Betti comparison or descent of the de Rham tensor.

   **Witness.** `TauCetiRoadmap/AutomorphicBundles/README.md:873` specifies Betti–de Rham and Betti–étale comparisons. Its §B2.7, line 1539, expressly excludes crystalline/B_dR assertions. A line 1442 separately invokes Blasius–Wintenberger for precisely the missing equality.

   **Exact repair.** Add `gap:absolute-hodge-padic-comparison`, supplier `AutomorphicBundles`, section `B1.3`, to the plan's top-level gaps and the matching README supplier subsection. Its needs sentence should be: “For an abelian variety A over a number field K, a finite place v of good reduction of any residue characteristic, and a rational absolute Hodge tensor in tensor powers of H¹, duals and Tate twists with realizations defined over K, prove that the B_dR comparison sends its étale realization to its algebraic de Rham realization, compatibly with the B_cris comparison, tensor operations and finite base extension.” Tag §2.4 and its layer dependency with that contract. Keep the integral torsor construction here; do not replace the missing assertion by algebraicity of Hodge cycles. Alternatively, a separately named CM-specific proof target must explicitly own and prove the same equality, without importing it from §§B1.1–B1.3.

   **Repair test.** The required equality is `comparison(1 ⊗ t_et) = 1 ⊗ t_dR` at the actual v-adic realization. It is exactly the transition from A lines 1436–1439 to lines 1442–1445. The tensor unit gives 1=1, an identity endomorphism gives id=id, and the polarization retains its Tate line. ShimuraVarieties §7.0i supplies complex conjugation/Betti transport and does not fill this p-adic requirement either. The seven existing gap slugs do not request it.

2. **F02** (P2) The distant-isogeny headline is statable at the pins

   **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean:22`: “Distant ideal isogenies and subpolynomial individual CM heights: CM abelian varieties with their isogenies and heights are missing.” README §10.2, line 1003, is the omitted headline.

   **Claim.** Missing heights prevent stating the individual-height theorem, but do not prevent stating distant isogenies.

   **Witness.** At the pin, `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` defines abelian varieties; `End/Basic.lean:83` defines their endomorphism ring; `Isogeny.lean:61` provides `IsIsogeny`. The native-carrier signature below elaborates with only its `sorry` warning.

   **Exact repair.** Import `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`, add the simple geometric-kernel-cardinality definition below and the §10.2 headline in the package namespace, and name both in the README. Split the docstring bullet: only the individual-height statement remains unavailable for lack of the height carrier. No CM-type encoding is needed: a full endomorphism-ring identification with O_E and dimension g specify primitive maximal CM; an O_E-linear isogeny keeps the CM type. The lower bound still ranges over every complex isogeny.

   **Repair test.** I elaborated this complete witness against the pins, then inspected its `#check @…distant_cm_isogenies` type. All field, dimension, CM-action, positivity and uniform-constant binders remain. For a complex elliptic curve, the definition gives degree 1 on the identity and degree 4 on [2]. For the Gaussian and Eisenstein maximal orders, ε=1/8 and c=4^(−1/8) give lower bounds 1 and 0.964678630, compatible with their degree-one minimum. Over ℂ finite isogenies have reduced finite kernels, so this cardinality is the actual degree, not a numerical stand-in. No assertion about the cardinality of an arbitrary non-isogeny is used.

   ```lean
   import Mathlib
   import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny

   open CategoryTheory
   open TauCeti.AlgebraicGeometry
   open scoped NumberField

   namespace IndependentReviewWitness

   universe u

   /-- Over C, an isogeny's degree is the cardinality of its geometric kernel. -/
   noncomputable def complexIsogenyDegree {A B : AbelianVariety ℂ} (f : A ⟶ B) : ℕ :=
     Nat.card {x : A.toScheme | AbelianVariety.Hom.toSchemeHom f x = B.zeroPoint}

   /-- The uniform distant-isogeny bound for primitive maximal CM varieties. -/
   theorem distant_cm_isogenies (g : ℕ) (hg : 0 < g) (ε : ℝ) (hε : 0 < ε) :
       ∃ c : ℝ, 0 < c ∧
         ∀ (E : Type u) [Field E] [NumberField E] [NumberField.IsCMField E],
           Module.finrank ℚ E = 2 * g →
           ∀ (A : AbelianVariety ℂ), A.dim = (g : WithBot ℕ∞) →
           ∀ ι : 𝓞 E ≃+* AbelianVariety.End A,
             ∃ (B : AbelianVariety ℂ) (κ : 𝓞 E ≃+* AbelianVariety.End B),
               (∃ f : A ⟶ B, AbelianVariety.IsIsogeny f ∧
                 ∀ a : 𝓞 E,
                   AbelianVariety.End.toHom (ι a) ≫ f =
                     f ≫ AbelianVariety.End.toHom (κ a)) ∧
               ∀ f : A ⟶ B, AbelianVariety.IsIsogeny f →
                 c * |(NumberField.discr E : ℝ)| ^ ((1 : ℝ) / 4 - ε) ≤
                   (complexIsogenyDegree f : ℝ) := by
     sorry

   end IndependentReviewWitness
   ```

   The witness namespace is for the independent test; the repair uses the package namespace. The ring identification is a hypothesis on actual endomorphisms, not a free proposition or sorry'd data.

3. **F03** (P2) The Hodge-height identity is restricted to a proof-route complement

   **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:661`: “with positive rank-two orthogonal complement”. Section 4.2d inherits this restriction at line 679.

   **Claim.** The general comparison is only promised for the particular complement used to construct the prime-elimination example. A §8.3 does not impose rank two on this theorem.

   **Witness.** A lines 4924–4928 define Λ as the orthogonal complement without a rank restriction; line 4979 requires n⋄≥3. Take L=U⊕U and L⋄=L⊕〈1〉: signatures (2,2), (3,2), complement rank 1.

   **Exact repair.** In §4.2c allow the positive definite orthogonal complement of arbitrary rank, retaining maximal lattices, n⋄≥3, Hypothesis 8.3.1 and c_f(0,0)≠0. Let §4.2d consume this general statement. Keep the rank-two choice in §4.5, where it serves the existence argument. Add the rank-one enlargement as a Check.

   **Repair test.** The displayed pair is integral and maximal: U is unimodular and the only nontrivial dual coset from 〈1〉 has quadratic value 1/4, so it cannot enlarge the integral lattice. It is within the CM setting: for E=ℚ(i,√2), F=ℚ(√2), ξ=√2, the trace norm is 8(ab+cd), rationally U⊕U. The complement vector has norm 1; therefore c_f(−1,μ)=1 is excluded, whereas an admissible form must have that coefficient zero. Both ranks use the same factor E_error/(c_f(0,0)deg Y), and scaling f by 2 gives 2E/(2c deg Y)=E/(c deg Y). No new existence assertion for f is required by the general conditional identity.

4. **F04** (P3) The vertical-support pointer imports a source misprint

   **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:665`: “with the support prescribed in A (8.3.1)”.

   **Claim.** This points to the paragraph after (8.3.1), which reverses the odd-prime divisibility condition and confuses L with L⋄. The package's own §4.2a is already correct.

   **Witness.** A line 4987 places support at p² not dividing D_L; A lines 2602–2607 instead make the odd component zero there. With v_p(D)=1, the former pointer permits support where the latter requires zero.

   **Exact repair.** Replace that phrase with “with the support of §4.2a applied to L⋄ (A Theorem 4.8.1, pp. 454–455)”. Do not weaken or invert §4.2a. Record the source misprint.

   **Repair test.** For odd discriminant valuation 1 the repaired clause gives E_p=0; valuation 2 is not covered by that vanishing clause. For n⋄≥5 and a self-dual dyadic lattice it gives E=0. These are precisely the current §4.2a Checks.

5. **F05** (P3) Local prerequisites appear after their consumers

   **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:324`: “§1.5 integral polarized cm families”; line 384: “§2.4 integral cm tensor torsor”; lines 657 and 675: “§4.3 auxiliary cm quadratic data”.

   **Claim.** The numbered targets are not in their stated build order. In addition, §4.1 uses the auxiliary data of §4.3 but omits them from its Needs line at 599.

   **Witness.** The dependency positions are 1.4→1.5, 2.3→2.4, 4.2b→4.3 and 4.2c→4.3. Each edge points forward within its layer; §4.3 has only earlier external prerequisites.

   **Exact repair.** Place the integral-family theorem before the total-reflex-family construction; place the integral tensor-torsor theorem (formed first from the rational realization and local Breuil–Kisin lattices on its stated unramified locus) before the global bundle-extension theorem; place auxiliary CM quadratic data before the orthogonal adapter and intersection statements. Renumber and update all local references, including layer dependencies. Add the auxiliary-data target explicitly to the adapter's Needs line.

   **Repair test.** With that order, the relevant chains are integral family→total reflex family, local comparison→tensor torsor→global bundles, and auxiliary quadratic data→adapter/big-CM degree→Hodge identity→average comparison. The local forward-edge count for these chains becomes zero. No roadmap-level supplier is moved or added by this repair.

Five findings: one P1, two P2 and two P3. The nine preceding repair requests have been addressed; the fresh pass finds a supplier mismatch, a statable missing headline, an unnecessarily restricted theorem, a misleading source locator and local build-order defects. The seven declared gaps are legitimate contracts, not findings. No authored package file was changed.

## Verified sound

### Previous findings and repairs

I checked the previous review and repair report before the new pass. None was marked “not actionable in this package”; no settled finding is re-raised. The statuses below concern the preceding request, not the fresh findings above. Quotes are from the current package README unless specified.

| Previous finding / repair | Status | Repaired passage and independently checked witness |
|---|---|---|
| R01 / F01, malformed and redundant gaps | Repaired | Line 62: “What ArakelovGeometryAndAbelianHeights must provide (gap:ramified-component-determinants)”. The plan has exactly seven named, owned entries, matching all seven README slugs and needs sentences. The obsolete proof/edition notes are not contracts. |
| R02 / F02, duplicated adjunction and point | Repaired | Line 13: “The arithmetic adjunction identity i₀(P,P)/e=−h_L(P_U) is stated by GrossZagierAndArithmeticHeights §7.78.” Line 959 consumes it. Its §0a.4 owns the point; §§6.56, 7.15, 7.65–7.66 and 7.77 cover the formerly missing kernel input. At e=2, i₀=−0.091850506 gives i₀/e=−0.045925253=−h_L. |
| R03 / F03, duplicate bounded descent gap | Repaired | Line 100 consumes “bounded polarized descent”. Line 1045 cites PELModuli M6.1, M6.8, M6.10. M6.8 descends the marked polarized pair, including full 3-torsion; g=1 yields 2·3⁴=162 and compositum bound 4·3⁸=26244. |
| R04 / F04, duplicate norm-index gap | Repaired | Line 114: “at n=0: for every finite number-field extension L/K”. IntegralIwasawaTheory §3.4 has the full class-group norm cokernel, not just a p-part. Identity extension gives index 1; C₆→C₃ following a subgroup of order 3 gives image 3≥3/2. |
| R05 / F05, misplaced gap tags | Repaired | Line 1129 attaches “gap:quantitative-cm-torus-orbit” to §12.4. The reduction tag occurs at §13.3, line 1179; narrow norm, bridge, product order and ramified determinant tags occur at their actual consumers. All Needs lines and layer summaries were searched again. |
| R06 / F06, nonuniform quantifiers | Repaired | Line 1003: “For every g≥1 and ε>0 there is c_g,ε>0 such that for every primitive maximal-order CM type”. Line 1013 does likewise for individual heights. The same c=4^(−1/8) works in the two quadratic controls. The repair report's separate claim that distant isogenies cannot be stated is contradicted by R02. |
| R07 / F07, broken prose and symbols | Repaired | Line 493: “every invertible B-module is isomorphic to B”; line 845: “the finite flat kernel Q”; line 863: “where B splits”; line 1197: “The conclusion is unconditional for all g using the 2018 orbit theorem”. All listed fragments and their repeated patterns were searched; none remains. |
| R08 / F08, conjecture-domain Check | Repaired | Line 226: “f(r)=1 differs from f(r⁻¹)=−1, so it is outside H_CM”. The six complementary sums are all 0. The Check distinguishes the proper overlap span without claiming equality on all CM⁰. |
| R09 / F09, bundled orthogonal target | Repaired | Headings 4.2, 4.2a, 4.2b, 4.2c and 4.2d separately state geometry, Borcherds support, big-CM degree, Hodge identity and the average error. Each has its own Needs. New clauses were reviewed in full, producing R03–R04. |

### Seeded source verification

All nine manifest works have one key each and a certified legal cached extraction. No author-marked unverified locator was found. I read all fifteen seeded targets at their actual source statements/proofs, and the repaired and neighboring passages. The table distinguishes a supported claim from a needed correction; page numbers are printed pages unless marked preprint. No source was fetched or manifest entry changed.

| Target | Locator opened | Hypotheses and support |
|---|---|---|
| 0.3 Average CM character | A Proposition 9.3.1, p. 511; A lines 5104–5140 | All 2^d types, coefficient 1/(2d), induced quadratic character. Verified on all 58 signed permutations for d=1,2,3, not just identity values. |
| 1.1 CM height torus | A §3.1, pp. 415–416; A lines 1012–1057 | Quotient by norm-one real torus, cocharacter and character annihilator match. Package correctly replaces the source's claimed diagonal embedding by kernel μ_d. |
| 1.3 Finite étale CM models | A Proposition 3.2.1, pp. 417–418; A lines 1105–1134 | Maximal prescribed integral level gives the finite étale model; arbitrary deeper normalized levels are not all asserted étale. The proof continues on p. 418 beyond the README's statement locator. |
| 1.4 Total reflex CM pair | A Proposition 3.4.2, pp. 420–421; A lines 1208–1244 | The finite étale algebra can be a product; total degree 2^d, Hodge half 2^(d−1), integral polarization after scaling. |
| 1.5 Integral polarized families | A Proposition 3.4.1, pp. 419–420; A lines 1179–1207 | Faithful weight-one representation, stable full lattice and integral alternating form. No principal/unimodular assumption is inserted. |
| 3.1 Determinant section | A (9.4.2)–(9.4.3), pp. 514–515; A lines 5220–5267 | Correct determinant line and exponent r=2^(d−1); characteristic-zero flat integral base excludes square-zero Cartier failures. |
| 3.6 Metrized determinant | A proof of Theorem 9.4.2 and Lemma 9.4.3, pp. 515–516; A lines 5290–5336 | The determinant identity and degree 2^d d log(2π) agree. The package correctly fixes the source's period exponent and arbitrary-generator claim. |
| 4.1 Hodge-line adapter | A Proposition 9.5.1 proof, pp. 522–523; A lines 5616–5677 | The required filtered-line degree correction is distinguished from the false full-lattice scaling at A line 5670. The −9 local example refutes that shortcut. |
| 4.2c Hodge-height identity | A Hypothesis 8.3.1, Proposition 8.3.3, Theorem 8.3.4, pp. 506–508; A lines 4924–4993 | Nonzero c_f(0,0), proper intersection, positive CM degree and nonzero Λ retained. Rank restriction and support pointer require R03–R04. |
| 4.3 Auxiliary quadratic data | A Definition 5.3.3, p. 460, and §9.5, pp. 522–525; A lines 2812–2825, 5616–5623 | Local stable/self-dual versus ramified maximal-lattice conditions match; Tr_F/ℚ gives signature (2d−2,2), and inverse norm scaling preserves it. |
| 6.1 Different graph | YE Theorem 1, pp. 1–2; YE lines 25–45 | Specified graph isomorphism, ideal different, both projections, good integral models. Mere isogeny is not enough. |
| 6.5 Quaternionic graph | YE §1, pp. 2–3; YE lines 65–115 | Embedded maximal order and no common finite ramification are retained; division primes give unit different and zero kernel. Split dyadic factors are included. |
| 7.1 Auxiliary quaternion datum | Y §1.2, pp. 536–537; Y lines 144–176 | Totally definite incoherent datum, compact switched coherent curve, and no common finite ramification. The explicit existence/parity argument is an adapter to that setup. |
| 13.3 CM period reduction | PT §3, Lemmas 3.4–3.7, preprint pp. 5–9; PT lines 160–385 | Read the full relevant proof, including repeated blocks, saturation index e_R and symplectic reduction. The package correctly retains e_R where PT's Lemma 3.6 proof drops it. Quantitative reduction is a declared contract. |
| 13.5 Bounded moduli degree | MZ §5.4, p. 667, MZ lines 1437–1444; PT14 Lemma 7.4, p. 675, PT14 lines 751–757; T Theorem 5.2, pp. 385–386, T lines 270–277 | MZ's older genus/conditional discussion is not itself an all-g theorem. T supplies the unconditional center-discriminant orbit bound; PT14 supplies bounded-discriminant finiteness. The package supplies safe dimension-only coordinate degrees and counts distinct coarse points. |

### Computed adversarial pass

There are 68 numbered target subsections; every one has a row below. Definition rows test the APIs and plausible wrong objects as well as the displayed body. Conventions, the imported adjunction and all seven contracts have additional rows. Untouched round-one calculations were retained only where they had explicit values; I re-evaluated the arithmetic below, and reviewed all repaired/new passages and all sampled passages. Finite tests are falsification evidence, not proofs of the deep targets.

All field statements retain characteristic zero, separability, NumberField finiteness and g>0. Thus a zero ring, inseparable extension, g=0 or empty CM algebra is not an instance. Empty direct sums and empty partitions have their separately stated zero conventions. Local integral comparisons retain the actual DVR and its ramification index; equal-characteristic DVRs are outside the mixed-characteristic contracts. The only Lean theorem carries its field/CM/degree/positivity hypotheses explicitly. Quotient denominators below are positive degrees, nonzero constant coefficients or established nonzero L-values. Compact quotients and profinite finite-image functions are not extended to noncompact/infinite-image inputs.

| Statement | Instances tried | Computed values on the two sides / negative control | Result; change |
|---|---|---|---|
| Conventions: metrics | Square torus; g=1 | Squared norms 2, 1, 1/π; shifts −0.346573590 and +0.918938533. Applying the second twice adds an erroneous 0.918938533. | Correct; none. |
| Conventions: Artin, degree, discriminant | ℚ₅, unit 2; degree-two base change; Gaussian order | Arithmetic action 2⁻¹=3 mod 5 versus geometric 2. 6/2=12/4=3, but 6/4=1.5. Field discriminant 4, conductor-2 order discriminant 2²·4=16. | Correct; none. |
| 0.1 CM⁰, overlaps, Z̃, H_CM | Nonabelian C₂×S₃ on three embedding pairs; type (+,+,−); constant 1; trivial constituent | On the three transpositions, overlaps 3,1,1 average to 5/3; their c-translates 0,2,2 average to 4/3; sum 3=d. Every overlap at c is 0, constant 1 at c is 1. ζ(0)=−1/2 and ζ′/ζ(0)=log(2π). | Conjugacy averaging, proper span and trivial-character normalization distinguished; none. |
| 0.2 Height invariance and linearity | Empty sum; extension of a functional outside overlap span | Empty height sum 0. On generators ev_c=0, so ht+t·ev_c gives the same values; at constant 1 it changes by t. | Uniqueness is only on H_CM; none. |
| 0.3 Average character | All signed permutations in ranks d=1,2,3 | Tested 2,8,48 elements. LHS/RHS value sets respectively {0,1}/{0,1}, {0,1,2}/{0,1,2}, {0,4/3,2,8/3,4}/{0,4/3,2,8/3,4}; zero mismatches. Identity values 1,2,4. | Coefficient 1/(2d) and all types verified; none. |
| 0.4 Individual predicate | C₆ values (0,1,1,0,−1,−1); two linear forms | All six complementary sums 0, but f(r)=1 and f(r⁻¹)=−1. Linear forms x and y agree at (1,1), values 1=1, but at (1,0) give 1≠0. | Equality of averages does not identify functionals; none. |
| 1.1 CM height torus | d=1,2,3; character vectors | Dimensions T=2,3,4 and T_so=1,2,3. At d=2, −1 maps to (−1)²=1 in the kernel torus. Pair sums (1,0) fail constancy; a CM-type vector has (1,1). | μ_d and the character condition exclude wrong diagonal and quotient; none. |
| 1.2 Integral compact level | Ramified quadratic local factor; unramified unit; scalar unit | Uniformizer class has order 2 but odd valuation 1; F× shifts valuation by 2ℤ, so it cannot be a unit image. Unit and scalar-unit valuations are 0. | Compact open is not incorrectly called maximal compact; none. |
| 1.3 Integral models | E=ℚ(i), maximal level; deeper ray level at 5 | K₀ kills unit inertia. At modulus 5, residue (2,2) is outside the global-unit residues (1,1),(4,4),(2,3),(3,2), giving a nontrivial ray inertia class of order 2. | The stronger all-level étaleness claim is excluded; none. |
| 1.4 Total reflex pair | d=1; biquadratic E=ℚ(i,√2); d=3; wrong polarization sign | Degrees 2,4,8 and abelian dimensions 1,2,4. The biquadratic type set has two orbits of size 2, hence two quadratic factors. A sign-flipped selected imaginary coefficient has Im −i=−1 rather than +1. | Product algebra and positivity required; R05 for target order. |
| 1.5 Integral families | Elliptic principal polarization λ and 2λ | Alternating determinants 1 and 4, polarization degrees 1 and 4, Tate rank 2 in both cases. Zero alternating form has determinant 0 and is inadmissible. | Integral need not mean principal; none. |
| 1.6 Total-reflex character/height | d=3, identity | Total-reflex half has size 4; (1/6)·8·3=4. Incorrect coefficient 1/8 gives 3. | Character and height scaling agree; none. |
| 2.1 Crystalline representations | Split Gaussian prime 5; dual and unit characters | Local reciprocity on unit 2 gives 3 mod 5; dual gives 2. Two embedding factors have Hodge multiplicities 1,0; dualizing changes the nonzero weight's sign. | Representation/image-torus and variance retained; none. |
| 2.2 Breuil–Kisin comparison | E_y(u)=u−p; residue field 𝔽₉=𝔽₃[t]/(t²+1) | φ*M/u has W-rank 1; φ*M/E_y has O_y-rank 1. On the coefficient t, Frobenius gives t³=−t≠t, detecting deletion of the pullback/relabeling. | Actual Eisenstein polynomial and Frobenius pullback retained; none. |
| 2.3 Bundles/crystals | Étale relative local model; quadratic ramified relative extension | Relative ramification indices 1 versus 2; only the first satisfies the global-crystal étaleness condition. Fiber ranks remain 2, with Hodge ranks 1+1. | Global bundle/étale crystal distinction correct; route affected by R01 and R05. |
| 2.4 Integral tensor torsor | Constant polarized rank-two representation; zero frame; extra zero tensor | Identity frame determinant 1, zero frame determinant 0. Constant frame torsor is T, and adding tensor 0 does not change its stabilizer. These values do not establish the missing p-adic tensor equality. | R01 supplies missing contract; R05 orders this before its consumer. |
| 2.5 Hecke actions | Multiplication by 2 and 1/2 on Gaussian lattice | [2] has lattice index/degree 4; 1/2 sends 1 outside ℤ[i]. The latter is a rational quasi-isogeny, not an integral automorphism. | Rational/integral distinction correct; none. |
| 2.6 Standard CM quadratic line | E=ℚ(i), conjugate-linear maps z↦z̄ and z↦i z̄ | Both squares are +1; ordinary multiplication by i squares to −1. For z=(1,i) in the positive standard plane, B(z,z̄)=4 and absolute squared metric is 4. | Conjugate-linearity, norm and metric sign distinguish the object; none. |
| 2.7 Tautological crystal | Gaussian split prime 5 | Two slopes 0,1 sum to dimension 1; total height/rank 2. Swapping embeddings exchanges factors without changing this sum. | Correct rank-one CM decomposition; none. |
| 2.8 Nonsplit/supersingular | Gaussian inert prime 3 versus split prime 5 | Inert slopes (1/2,1/2); conjugate-linear special endomorphism space has rank 2. Split slopes (0,1); corresponding Frobenius-fixed special space has rank 0. | Nonsplit-in-E hypothesis distinguished; none. |
| 3.1 Determinant section | d=1,3; diagonal (π,1,1,1); square-zero thickening | Exponents r=1,4; determinant π gives length 1. Over k[ε]/ε², multiplication by ε has nonzero kernel (ε), so ε is not a Cartier equation. | Integral flat-base hypotheses exclude the false extension; none. |
| 3.2 Partition quotient | Empty part; split algebra; π²=3; invertible-module twist | Quotients 0,0,C/(2π), with lengths 0,0,1. An invertible module over the semilocal B is free, so twisting preserves length 1. | Empty, split and ramified cases agree; none. |
| 3.3 Partition length | π²=3 over ℤ₃, singleton partition | Cross valuation v_C(2π)=1; disc=12 has valuation 2; half-discriminant minus within sums is 1−0−0=1. Reversed sign gives −1. | Corrected positive sign verified; none. |
| 3.4 Conductor functional | Trivial character; tame quadratic character; infinite digit function | Conductors 0 and 1. Digit-tail/leading ratio (p−1)/(2p−1) is 1/3 at p=2 and 2/5 at p=3, so distinct leading digits give infinitely many values. | Infinite-image continuous function is outside finite-quotient domain; none. |
| 3.5 Conductor/length identity | ℚ₃(√3), the two singleton embeddings | Each diagonal indicator has μ=1/2; e=2; +(2/2)(1/2+1/2)=1=length C/(2π). Negative factor gives −1. | Normalization verified; none. |
| 3.6 Trace volume and determinant | r=1; unit 3+2√2; d=3 | Trace-one period magnitude 2π versus erroneous (2π)⁻¹. Unit magnitudes 5.828427 and 0.171573 multiply to 1. Normalized determinant degrees 2log(2π), 24log(2π). | Generator and global product normalization correct; none. |
| 3.7 Local total reflex | d=2 and local d_p=1,2; F=ℚ(√3), p=3 | Restriction-fiber sizes 2,1. Different valuation 1 gives 2^(2−2)·1=1. Split character has conductor 0 rather than an omitted local factor. | Multiplicity and ramified valuation retained; none. |
| 3.8 Total-reflex height | d=1, mean h; degree-two pullback | Δ-degree 0 and ω₀-degree 4h+2log(2π); subtract 2Ω with Ω-degree 2h to obtain 2log(2π). Solving gives h=h; pullback doubles both normalized-degree terms. | No duplicate metric shift; none. |
| 4.1 Filtered-line adapter | Unramified E_v/ℚ₃, ξ=−9 | On 3⁻¹O_E, ξNm(1/3)=−1; on the falsely proposed ξO_E, ξNm(−9)=−729. | Full-lattice shortcut rejected; R05 supplies earlier auxiliary definition. |
| 4.2 GSpin/divisor data | Negative plane; zero form; stack stabilizer 2 | B((1,i),(1,−i))=−4, norm²=4. Z(0)=Φ(0)=0. Weighted degree 1/2 becomes 1 on a degree-two étale cover. | Sign, zero divisor and stack weighting correct; none. |
| 4.2a Borcherds/support | n=5 self-dual dyadic; n=3; odd discriminant valuations 1,2; c=2 | First E=0; n=3 does not invoke the n≥5 clause. Odd valuation 1 gives E_p=0; valuation 2 is not covered. Weight 2 gives constant 2log(4πe^γ). | Correct support and constant; none. |
| 4.2b Big-CM degree | f=0; shadow zero; degree-two cover | 0/Λ(0,χ)=0 with nonzero denominator. ξ(f)=0 makes its derivative term 0. 2a/(2d)=a/d. | No zero denominator or spurious shadow deletion; R05 for order. |
| 4.2c Hodge identity | Rank-one complement; norm-1 vector; 2f; zero error | Complement signatures (2,2)→(3,2), rank 1. c(−1,μ)=1 violates avoidance. 2E/(2c d)=E/(c d). Gamma expansion gives −2ℓ−log(D_E/D_F) on both sides. | Constants correct; R03 generality, R04 support, R05 order. |
| 4.2d Average error | E_error degree 8, c=2, deg Y=1 | Hodge error 8/2=4; average error 4/4=1=8/(4·2·1). Dropping the factor 1/4 gives 4. | Factor correct; R03 inherited generality. |
| 4.3 Auxiliary quadratic data | d=1, ξ=−1; all-positive ξ; scaling a by 2 | Signatures (0,2) versus (2d,0). Local valuation 1 fails the required 0. (ξ/4)Nm(2a)=ξNm(a). | Sign, local unit and transport laws distinguish the object; R05 order. |
| 4.4 Good data/narrow norm | F=ℚ(√3), E=F(i) | D_E/D_F²=144/144=1. Narrow class group has order 2; generator 2√3 of the different has signs (+,−), so χ(d_F)=−1=(−1)^(2/2). | Precise narrow contract needed; no finding against the declared gap. |
| 4.5 Prime elimination | Rational log relation; self-dual p-lattice | a log2+b log3=0 becomes 2^m3^n=1, forcing m=n=0. At a self-dual p-lattice, discriminant valuation 0 gives p-error 0; the source's good-prime proof also covers the smaller ambient dimension. | Not merely disjoint bad sets; none. |
| 4.6 Quadratic branch | E=ℚ(i) | ℓ(0)=0.7831887854; −ℓ/2−log4/4−log(2π)/2=−1.6571065162. YZ normalization gives −0.7381679830. | Correct endpoint and shift; none. |
| 5.1 Component invariance | Gaussian lattices O_E and 2O_E | Isogeny index 4; same-type component-height difference 0. Multiplying the height by 4 would violate invariance. | Correct; none. |
| 5.2 Component decomposition | g=1, reflex ideals of discriminant 1 | Correction −log(1·1)/(4·2)=0; total height equals its sole component. Averaging the general correction contributes −(1/4)log D_F. | Relative rather than absolute reflex discriminants; none. |
| 5.3 Nearby types | g=1,2,3; opposite vertices of a square | (vertices,edges)=(2,1),(4,4),(8,12). One flip has symmetric difference 2; opposite square vertices give 4. Swapping endpoints leaves the average (a+b)/2 unchanged. | Actual adjacency and unordered average fixed; none. |
| 5.4 Nearby average | g=2, all eight endpoint-component heights equal 1 | Four edges each have mean 1. Component side 2⁻²·8=2; edge side 2⁻¹·4=2 before the shared discriminant correction. | Factor 2^(1−g) verified; none. |
| 6.1 Different-graph datum | Unit different; cyclic generic torsion C₃; identity versus inverse graph | Graph sizes 1,3; whole product size 9. In C₃², (1,1) is in the identity graph and not the inverse graph (1,2). Both projections have size 3. | Specified map, rather than arbitrary isogeny, is determined; none. |
| 6.2 Torsion modulo different | π²=3 over ℚ₃; π²=2 over ℚ₂ | π−π̄=2π has valuations 1 and 3; its image modulo δ is 0 in both. At residue 𝔽₂, the allowed contraction begins at n≥max(2,e), not n=1. | Ramified and dyadic clauses retained; none. |
| 6.3 Integral graph/self-duality | Gaussian O_E/(2) | Four elements; Cartier-dual order 4; units 1,i; i=−i mod 2. Graph projections each have order 4, whereas product kernel has order 16. | Self-duality/conjugation condition is meaningful; none. |
| 6.4 Nearby-height identity | Ramified opposite-component quotient; self-dual determinant | Raw lengths at √3 and √2 are 1 and 3, not 0. Relative determinant contributions cancel as t−t=0 only through the declared comparison. | Raw exactness is not assumed; contract retained. |
| 6.5 Quaternionic graph | Split M₂ with E=ℚ₂(i); ramified odd quadratic; division unramified; split E | (1−conjugation)/(2i) sends 1↦0, i↦1, integral matrix [[0,1],[0,0]]. Projection O_E/(2i) has cardinality 4, length 2. At √3 length 1. Division/unit-different and E=F×F cases have quotient length 0. | Embedded-order and dyadic inputs retained; none. |
| 7.1 Auxiliary quaternion datum | g=1,2,3,4 | Finite ramification counts 2,1,0,1 give total ramification 3,3,3,5, all odd; switching one real place gives 2,2,2,4, all even and nonzero. | Incoherence, coherence and compactness agree; none. |
| 7.2 Point and height | z=i,1+i; field extension degree 2 | Norms 2,2; numerator/denominator 6/2=12/4=3. Replacing the relative denominator by the absolute one for [F:ℚ]=2 gives 1.5. | Imported actual point and chosen normalization; none. |
| 7.3 Hodge bridge | z=i; O_B-linear versus O_E-linear Hom | Norm L=2, norm L²=4. Relevant deformation Hom ranks 1 versus 2; dropping quaternionic linearity changes the line. | Exact ramified bridge gap remains necessary. |
| 7.4 Quaternionic average | Gaussian E and d_B=21 | h_L=0.0459252529; h_L/2−log21/4=−0.7381679830. | Auxiliary discriminant cancels; none. |
| 8.1 Modified self-intersection | Same datum; split place q=2 | i₀/e=−0.0459252529. n=−1/7, c/log2=−2/7 give 2n−c/log2=0. Test theta integral (1−1/2)²(1−3/7)=1/7>0. | Compensated and noncuspidal supplier terms retained; none. |
| Imported adjunction | Same datum, e=2 | i₀=−0.0918505058; i₀/e=−0.0459252529=−h_L. Horizontal pullback multiplicity 2 is not the étale value 1. | Imported from GZ §7.78; no duplicate local target. |
| 8.3 Quaternionic height | Same datum | −0.7831887854+(1/2)log(21/4)=0.0459252529=−i₀/e. | Sign agrees with imported adjunction; none. |
| 9.1 Averaged Colmez | Gaussian field, both routes | Orthogonal quadratic branch −1.6571065162; quaternionic mean −0.7381679830 minus 0.9189385332 gives −1.6571065162. | Exactly one metric conversion; none. |
| 10.1 Class-number growth / existing Lean headline | D=3,4,23; ε=1/8; sextic regulator | Ratios h_E/h_F=1,1,3. With C=4^(−1/8), lower sides 0.964679,1, about 1.244, respectively. R_E/R_F=4/2=2 or 4/1=4, never forced to 1. | Uniform nontrivial theorem; no padding. |
| 10.2 Distant isogenies | Gaussian/Eisenstein classes; identity, [2] | Minimum degrees 1,1; common c gives lower sides 1,0.964679. Actual kernel cardinalities on an elliptic curve are 1,4. | Repaired quantifiers correct; missing native headline is R02. |
| 10.3 Subpolynomial heights | Heights −1,3, lower bound −1 | Mean 1; 2·1−(2−1)(−1)=3 equals the larger height. ℓ(0)+ℓ(1)=−log(D_E/D_F)+g(log(2π)+γ) yields the stated mean formula after substitution. | No positive-height or primitivity assumption needed; none. |
| 11.1 Definition fields | g=1; unit (1+√2)^8; f=[2] | Bounds 162 and 26244; 2·#GL₂(𝔽₃)=96 is smaller. Unit 577+408√2≡1 mod3, but its square 665857+470832√2≠1. For f=[2], n=2 gives g₀=id. | Polarization is essential for rigidity; quotient polarization route correct. |
| 11.2 Orbit exponent budget | κ=2, δ=1/16, a=3/16, ε=1/32 | δκ=1/8<3/16<1/4; εκ=1/16<3/16. | Strict exponent inequalities have room; none. |
| 11.3 Primitive orbit | Gaussian and Eisenstein coarse points | Absolute degrees 1,1; c≤4^(−δ) gives cD^δ≤1 for both. | Bounded range and absolute orbit retained; none. |
| 12.1 Center order | Gaussian conductor 2; repeated block; nonproduct order | J=2, D=2²·4=16. Center of M_n(E) is one E. For R={(a,b):a≡b mod2}⊂ℤ², Gram [[2,2],[2,4]] has determinant 4=index²·1. | Product-order contract includes nonproduct R; none. |
| 12.2 Normal-closure image | Identity extension; C₆ subgroup of order 3 followed by C₆→C₃ | Norm index 1≤1 in the identity case. Following quotient images have orders 3 and 3, giving 3≥3/2; following identity gives 3=6/2. | Direct full-class norm supplier suffices; none. |
| 12.3 Compact index | J=1; p=2 exponential domain | 1≤I^cP^d for I,P≥1. v₂(2)=1 versus v₂(4)=2, so the deep-unit argument cannot start at the shallow dyadic value. | Field factor and finite exceptional factors retained; none. |
| 12.4 General reduction | I=P=1; B=1/2, two bad primes | Base orbit size at least 1; loss factor B²=1/4, not 1. Discarding it multiplies the claimed lower bound by 4. | Quantitative torus contract and absorption are necessary. |
| 12.5 General orbit bound | Gaussian orders of conductors 1 and 2 | D_x=4,16; coarse degrees both 1. One C≥16 covers both in D_x≤C·degree^b. | Field discriminant alone would miss the second order; none. |
| 13.1 Coordinate degree | g=1,2; signed-permutation sextic type | Safe bounds 2(2g)!=4,48. A sextic type has orbit size 8, larger than 2g=6; normal closure bound 6!=720 still contains its reflex field. | Safe field bound avoids unsupported small joint-degree bound; none. |
| 13.2 CM lattice basis | ℤ[i]; ℤ+2ℤi; saturation in rank 2g | Covolumes 1=(√4/2)·1 and 2=(√4/2)·2. For e_R=2,g=2, [J:I]≤2⁴=16. | Order index retained; none. |
| 13.3 Period reduction | Periods i,2i; z=1/M+i | For i,2i, h₀=1,2 and H_abs=1,2. For z=1/M+i, h₀≤√2 and H_abs=√(M²+1), while the primitive polynomial M²X²−2MX+(M²+1) has unbounded coefficients as M grows. | Analytic size alone is not algebraic height; declared reduction gap remains. |
| 13.4 Polynomial lift height | i and 2i | Minimal polynomial coefficient heights 1,4; absolute Weil heights 1,2. At degree 2, H_abs²=1,4 agrees with Mahler measure. | Leading coefficient and bounded-degree conversion retained; none. |
| 13.5 Bounded-degree finiteness | Scalar degree≤2, H_abs≤2; repeated CM parameter | Primitive polynomial coefficient bound 2²·2²=16, hence at most 2·33³=71874 roots across the enclosing coefficient box. Repeating one CM point m times still gives distinct count 1. | Northcott and distinct-point interpretation correct; none. |
| Seven existing supplier contracts | Ramified components/bridge; narrow norm; product order; torus; reduction; embedded orders | Opposite-embedding torsion lengths 1 and 3; narrow different sign −1; nonproduct discriminant 4=2²; I=P=1 base index 1; Z=i reduced by identity matrix entries 0,1; dyadic quaternion graph projection cardinality 4. | Each contract has a real missing general input, not an excluded prime. R01 is an additional undeclared input. |
| Source controls for compactness and norm cokernels | Two ramified quadratic E-factors over split F_p; two unramified quadratic F-factors | Valuations (1/2,−1/2) pair to 0 with every T-character but cannot be shifted to (0,0) by integer F-valuations. For two identical quadratic norm images N, [ℚ_p×:N·N]=2, whereas the direct-sum cokernel has order 4. | Supports the two §3.2 source corrections without using a single T_so uniformizer as a lift to T. |
| Source control for PT Lemma 3.6 proof | I=ℤ+fℤi, J=O_E I=ℤ[i] | [J:I]=f is unbounded while disc O_E=4; disc R=4f² retains it. | The proof's saturation-degree estimate needs the order index. |

### Pinned libraries, duplication and ownership

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened the declarations below, rather than inferring availability from names. Library paths in this table are relative to the respective pinned library root.

| Pinned file and line | Declaration / actual content | Consequence for this package |
|---|---|---|
| `Mathlib/NumberTheory/NumberField/CMField.lean:69` | `NumberField.IsCMField`: totally complex and quadratic over the maximal real subfield, on a characteristic-zero field | Does not supply number-field finiteness. Suggested.lean separately has `[NumberField E]`. |
| Same file, lines 136, 141, 163 | Integrality under the number-field assumptions; `complexConj`; `complexConj_apply_apply` | Correct native involution, not a second definition or an arbitrary local conjugation. |
| Same file, lines 372, 438 | `indexRealUnits_eq_one_or_two`; `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` | R_E/R_F=2^(g−1)/Q_E; sextic values 2 or 4. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:125` | `maximalRealSubfield`, elements fixed by complex conjugation under every complex embedding | The Lean denominator uses the actual maximal real field. |
| `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64` | `classNumber` of the maximal order | Matches the README; not an arbitrary-order Picard number. |
| Same file, lines 69, 77 | `classNumber_pos`; `exists_ideal_in_class_of_norm_le` with nonzero ideal | Division is not 0/0; ideal representatives retain the nonzero condition. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36`, line 41 | `discr`; `discr_ne_zero` | The positive absolute discriminant in the estimate is not zero. |
| `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean:399` | `NumberField.card_ideal_absNorm_le`, coarse X²2^degree bound | Correctly cited, not sufficient alone for the nearly 1/4 distant-isogeny exponent. |
| `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean:61` | `NumberField.abs_discr_le_of_basis_isIntegral` | An inequality for an integral rational basis; not the full product-order equality. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, lines 118, 171 | Native abelian variety, Krull dimension, zero point | These are actual schemes with their abelian-variety structure, not formal symbols. R02 uses them. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`, lines 92, 168 | `End`, `End.toHom`, ring instance | Native integral endomorphisms support the maximal-CM ring identification. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56`, line 61 | `isogenies`, `IsIsogeny`: finite and surjective underlying scheme map | The complex kernel-cardinality definition in R02 needs no absent CM carrier. |

Object searches covered the pinned CM field/conjugation, class group/regulator/discriminant, abelian varieties and endomorphisms/isogenies, total-reflex and component-height constructions, GSpin special divisors, Borcherds products, CM orbit estimates and Siegel reduction. There is no second declaration of the kept fully qualified class-number theorem in the readable roadmap Lean files; `roadmaps grep` found no occurrence of `relative_class_number_growth` on main or an open roadmap head. No native Faltings-height, total-reflex or Siegel-CM-locus carrier was found in those searches. Native abelian varieties and isogenies were found, contrary to the docstring.

I read the board package index before making absence claims. I used `roadmaps grep` by object across main and the supplied open-head index, read the matching supplier roadmaps with `roadmaps show`, and searched board package READMEs and designs. Main was `bfaaff1`; the open-head index was dated 2026-10-25T06:19:48Z and contained 353 pull requests. The broad first search was capped, so I repeated a narrower CM/total-reflex/class-norm/Siegel/Borcherds/Colmez search and inspected its complete 142-hit output. No downloaded code or instructions in those texts were executed.

Ownership resolutions:

- Base `ComplexMultiplicationAndExplicitReciprocity` §§0.1–0.2 and 2.1–2.3 own reflex pairs/orders, polarized lattice classification, ideal actions and marked reciprocity. Part II consumes these and adds heights. It does not re-plan the base roadmap.
- `CyclotomicClassGroupsAndStickelberger` §3.4 has abelian/cyclotomic unit and class-number formulas. It does not state the arbitrary-CM-field uniform relative-class-number lower bound here.
- `GrossZagierAndArithmeticHeights` owns the point, full kernel inputs and arithmetic adjunction now imported. Its Part II design owns unitary Kudla–Rapoport work; it does not take ownership of the GSpin big-CM construction here. The orthogonal route remains this package's work.
- `AnalyticNumberTheoryPartI` owns the varying-base quadratic Hecke estimates and near-linear ideal count, `IntegralIwasawaTheory` owns the full class norm bound, and `PELModuli` owns the required marked polarized descent. None is rebuilt here.
- `ArakelovGeometryAndAbelianHeights`, `AbelianSchemesAndArithmeticModuli`, `GeometryOfNumbersAndQuadraticArithmetic`, `HilbertModularVarietiesAndShimuraCurves`, `IntegralLattices` and `OrthogonalSpinGroups` supply their generic carriers/comparisons. The retained CM specializations differ by the total-reflex determinant, different graph or center-order hypotheses.
- The extra AutomorphicBundles p-adic claim fails statement-level resolution despite the section existing: R01. A textual resolver cannot detect that mismatch.

### Supplier resolution and direction

Every named cross-roadmap citation was checked again at main or its supplied new-roadmap head, including changed citations. The table groups section ranges from the same supplier; it records the actual section anchor and the hypotheses important to the consumer. Line numbers refer to that roadmap's README, except the two explicitly identified board designs.

| Supplier and resolved sections | Location/evidence | Result |
|---|---|---|
| ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2, 2.1–2.3 | Lines 253, 285, 472, 512, 547; field-scoped reflex pair, integral order, actual polarization, ideal action and marked orbit | Matches; integral/rational and marked/absolute distinctions retained. |
| AbelianSchemesAndArithmeticModuli A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.22, A6.25, A6.37–A6.38 | Lines 1763, 1841, 2059, 2437, 2646, 3265, 3348, 3698, 3716 | Covariant Tate/H¹ duality, nonprincipal polarizations, locally Noetherian normal-base Hom extension and one center field per simple block agree. |
| ArakelovGeometryAndAbelianHeights §§1.3, 1.11, 1.13–1.14, 2.1, 2.7, 2.10, 3.4–3.5, 4.6–4.8, 6.5 | Lines 227, 484, 557, 584, 683, 839, 922, 1026, 1059, 1249, 1286, 1308, 1736 | Metric shifts agree. §4.6 takes torsion-free component lines; §4.7 raw quotient comparison assumes local freeness. The ramified extension is a real gap. |
| AnalyticNumberTheoryPartI §§2.2, 2.31d–f, 2.32, 2.44–2.46, 3.27 | Lines 1629, 1646, 1665, 1896, 1910, 1924, 2961 for the quantitative interfaces | Fixed-degree/varying-field constants, ramified Euler factors and X^(1+ε) count are present. |
| AutomorphicLFunctionsAndLocalFactors AL.1, CM quadratic completion | Line 1534 and following completion clauses | Root number 1 and conductor D_E/D_F match the package's Λ and gamma conversion. |
| AdelicAlgebraicGroups AA.2.4 | Within §2.4, lines 1987–2047 | Inertia-invariant ramified Artin factors, induction and one-dimensional comparison; the AA-prefixed citation is an internal milestone, not a missing heading. |
| AutomorphicBundles B1.1–B1.3, B2, B4.10 | Lines 801, 826, 858, 1311, 1533, 4084 | Tensor stabilizers and complex/rational realizations exist. The B_dR/B_cris equality does not: R01. The CM integral torsor remains local work. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.15–16, R07.2.20, R07.4 | Lines 3462, 3493, 3619; R07.4 begins at 5330; dyadic classification 6322, integral comparisons 6404 | All-prime classification and φ* specializations, with actual variance and hypotheses. It does not identify arbitrary absolute Hodge realizations for R01. |
| LubinTateFormalModulesAndQuasiCanonicalLifts LT.2 | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:412` and line 449 | Named character and reciprocity comparison exist in the supplied design: arithmetic Artin sends a unit to its inverse. |
| NeronModelsAndSemistableAbelianVarieties §§1.5, 5.1–5.2 | Lines 764, 2838, 2900 | Extension uniqueness, excellent henselian NOS and isogeny invariance; the CM local bases meet the hypotheses. |
| ReductiveGroups Layer 4; ReductiveGroupsPartII RG2.0a.2 | Main line 432; open-head line 1128 | Tori/character lattices and finite locally free Weil restriction are supplied. |
| ShimuraData Layers 1, 3; ShimuraVarieties §§4.1–4.6, 5.1–5.11, 6.1–6.2, 8.1–8.6 | ShimuraData lines 166, 369; ShimuraVarieties lines 978–1112, 1299–1553, 1621, 1640 and Layer 8 lines 2200, 2335 | Coarse versus stack models, actual CM actions and both Artin conventions are explicit. Arithmetic Artin here is converted from the supplier's geometric convention. |
| PELModuli M2.1–M2.3, M3.9, M5, M6.1–M6.2, M6.8–M6.10 | Lines 2154, 2174, 2210, 3116, 3736, 3765, 3951, 3978, 4010 | Polarized rigidity and actual marked-pair descent, not just a coarse moduli degree bound. |
| FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 | `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/design/README.md:678` | Geometric isogeny over a common number-field base, degree ≤C_g max(1,h,[k:ℚ])^κ_g; no fixed polarization or k-rational-map requirement. |
| ClassFieldTheory Layer 13 | Main line 1799, class-field applications at line 1823 onward | Hilbert/narrow class fields present; special narrow different-character identity remains the declared gap. |
| IntegralIwasawaTheory §3.4 | Line 490, `classNorm_cokernel` at line 494 | Arbitrary base fields and full ideal class groups, valid at n=0; no p-primary narrowing. |
| GlobalNumberFields Layer 11 | Main line 565 onward | Full orders in a field; product-order extension does not follow by treating a nonproduct order as a product. Declared gap retained. |
| GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2, 1.5, 2.2, 2.7–2.9 | Lines 238, 275, 362, 452, 701, 942, 1128, 1164, 1194 | Covolumes and integral hermitian/quaternionic lattices present; quantitative general Siegel reduction is not silently assumed supplied. |
| HilbertModularVarietiesAndShimuraCurves R18.1, R18.2.12–R18.2.18, R18.5 | Bridge clauses at lines 2570 and 2594 | The τ-component bridge assumes F_v/ℚ_p unramified, unlike its earlier saturated Kodaira–Spencer input. Both ramified bridge and embedded-order gaps remain needed. |
| GrossZagierAndArithmeticHeights §0a.4, §§0.1, 0.5, 0.9–0.11, 2.1, 2.9, 2.14, 6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.28, 7.65–7.67, 7.77–7.78 | Lines 226, 298, 394, 485, 499, 513, 679, 866, 991, 1733, 2050, 2126, 2569, 3172, 3404, 4005, 4017, 4029, 4218, 4230 | Actual CM point, relative degree, noncuspidal terms, q=2 compensation, nonvanishing and adjunction all present. No residual kernel/adjunction gap. |
| MetaplecticAutomorphicForms Layers 4–7 | Lines 1148, 1290, 1537, 1830 | Weil, theta and Whittaker framework; proper-intersection and prescribed-support orthogonal theorems are explicitly owned here. |
| HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16 | Lines 233, 245, 253, 294 | Absolute normalization and real/imaginary coordinate adapters match. |
| DiophantineApproximationAndTranscendence §§0.2–0.3 | Main lines 227, 358 | Mahler/primitive-polynomial comparison and algebraic-closure Northcott with bounded absolute degree; not merely a fixed-field theorem. |
| IntegralLattices Layers 1–3; OrthogonalSpinGroups Layers 0–1 | Main lattice headings 162, 227, 258; orthogonal headings 306, 383 | Generic lattice duality and orthogonal group ownership in Scope; no duplicate generic construction is requested. |
| CyclotomicClassGroupsAndStickelberger §3.4 | Line 505 | Specialized abelian/cyclotomic results distinguished from §10.1. |

The following seven existing gaps are precise, minimally identify a missing interface, have named earlier suppliers, and have the same slug in `design/plan.json` and the README. They are not reasons for refusal:

| Gap slug | Supplier | Missing part verified |
|---|---|---|
| ramified-component-determinants | ArakelovGeometryAndAbelianHeights §4.7 | Relative/image determinant and dual-length comparison beyond locally free raw embedding quotients. |
| quantitative-cm-torus-orbit | ShimuraVarieties §§4.1–4.6 | Quantitative absolute polarized orbit with compact index and bad-prime loss, not qualitative reciprocity. |
| narrow-cm-norm-different | ClassFieldTheory Layer 13 | Special narrow norm image and unramified different-character parity. |
| etale-order-discriminant | GlobalNumberFields Layer 11 | Full order in a product that need not itself split. |
| quantitative-siegel-hermitian-reduction | GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5, 2.7 | Dimension-uniform quantitative hermitian and Siegel matrix bounds including repeated blocks and indices. |
| ramified-quaternionic-bridge | HilbertModularVarietiesAndShimuraCurves R18.2.17–18 | Ramified coefficient-field extension of the actual relative/image bridge with its metric and descent. |
| embedded-quaternion-orders | HilbertModularVarietiesAndShimuraCurves R18.1 | Embedded quadratic integer ring in local maximal orders, including split dyadic residue 𝔽₂. GZ's F=ℚ order setup does not replace it. |

`roadmaps resolve` found no missing roadmap or backticked declaration references. Manual checking found the semantic mismatch R01. The dependency command in the brief completed successfully; its exact output was:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 573 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The movable position is not a finding. The order file was not changed. R05 concerns internal target order, which this roadmap-level check does not diagnose.

### Headline coverage, elaboration, padding and shape

The README's deep/end results and their acceptance-test coverage are:

| Headline | Suggested.lean status |
|---|---|
| CM height linearity on the overlap span (§0.2) | Named in docstring; component-period and stable-height carriers absent. |
| Integral CM realizations and different-graph comparison (Layers 1–2, 6) | Named; integral CM family and Breuil–Kisin realization carriers absent. |
| Total-reflex determinant/height (Layer 3) | Named; total-reflex family, integral filtered Hodge bundles and arithmetic Picard degree absent. |
| Big-CM arithmetic degree, Hodge comparison and prime elimination (Layer 4) | Named; GSpin integral special-divisor and arithmetic-intersection carriers absent. |
| Corrected nearby-type and quaternionic height identities (Layers 5–8) | Named; component heights, quaternionic integral curves and modified intersections absent. |
| Averaged Colmez, including g=1 (Layer 9 and §4.6) | Named; actual stable CM heights absent. |
| Relative class-number growth (§10.1) | Stated on native carriers, with correct uniform quantifiers. |
| Distant isogenies (§10.2) | Missing despite native carriers; R02. |
| Individual subpolynomial heights (§10.3) | Named; stable-height carrier absent. |
| Primitive and general center-order orbit bounds (Layers 11–12) | Named; actual polarized coarse moduli locus/action and center-order interface absent. |
| Polynomial CM lifts and bounded moduli-degree finiteness (§§13.4–13.5) | Named; Siegel CM locus/uniformization and period-coordinate interface absent. |

The required `lake env lean` invocation, from the content checkout with the absolute target argument, exited 0. Its only warning was `Suggested.lean:45:8: declaration uses sorry`. The authored file has one theorem, a single `import Mathlib`, no definitions or instances, no `set_option`, no sorry'd data and no admitted examples. I separately elaborated a scratch copy with `#check @TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.relative_class_number_growth`; the complete type matches §10.1 and no binder disappeared. The R02 witness's native Tau Ceti object files were present, so no targeted build was necessary.

One-tactic probes on separate scratch copies of the existing theorem failed for `simp`, `rfl` and `infer_instance`. Object searches found no pinned lemma providing the same uniform estimate, so there is no applicable one-lemma `exact` closure. The theorem is not a definition, Check, boundary case or small computation. Padding count: zero. The missing headline, not padding, is the acceptance-test defect.

For house style I read the main roadmaps ComplexTori, IntegralLattices and ClassFieldTheory. The package has 14 layers, all ending with Examples and Dependencies; 68 numbered targets, all with locators and Needs; and 16 definition/API sections with at least three Checks each. The one declared Lean name appears in the README. TOML files parse; the source manifest has nine distinct keys. No computational algorithm, copied source passage, route excluding bad primes, forbidden Lean command or process narrative was found in the authored package. R03 is the narrower-than-source generality defect. No file outside the authorized review outputs and scratch work was edited.

## Not verifiable

- C is an OCR extraction of an image scan. The displayed component-period formulas in Theorem 0.3(i)–(ii), p. 631 (C lines 288–300), are not legible enough to certify every symbol of that normalization. The finite-function-domain checks do not depend on reconstructing the damaged display.
- The YE locator is the recorded 18 December 2022 author revision. Its numbering was not collated against the later printed erratum. PT and T12 are checked at their explicitly recorded preprint pagination, not presumed to share later journal page numbers.
- Primary proofs inside the supplied papers—Blasius–Wintenberger, Kisin's integral tensor-torsor input, Armitage's different-character identity, Vignéras' local order classification, Bruinier's prescribed-divisor theorem and the geometric isogeny estimate—were not independently reconstructed. Their use must be through owned targets/contracts. R01 identifies one use incorrectly claimed as supplied. The others remain named package or supplier proof obligations.
- Ownership was checked against the supplied open-head index and readable board packages, not an unseen working tree. The indexed board heads for PELModuliPartII and ShimuraVarietiesPartII did not expose the prescribed package README path (404). No claim that those packages exist nowhere is made. The generic CM/PEL suppliers actually used here were readable and checked separately.
- This is a statement, source and acceptance-test review, not verification of future supplier proofs. In particular the seven declared supplier contracts remain outstanding mathematical obligations; their absence today was not counted as a finding.

## Source issues

The following are source issues, not additional package findings. The package already corrects most of them. Source text is paraphrased.

- **Error** in A at Theorem 9.1.5, p. 510: the source says total CM heights uniquely determine a functional on all CM⁰; it should be unique on the overlap span, unless component-period normalization is added; affects a stated result.
- **Error** in A at §3.1, p. 415: the source treats the diagonal scalar map into T as an embedding; it should have kernel μ_d, with the kernel torus identified through the real norm; affects a stated result.
- **Error** in A at §3.2, p. 416: the source calls the prescribed K₀ maximal compact; it should be compact open, since balanced ramified valuation classes can enlarge it; affects nothing.
- **Error** in A at equation (3.2.2), p. 417: the source gives a direct sum of local norm cokernels; it should give ℚ_p× modulo the product of the local norm images; affects a stated result.
- **Misprint** in A at Proposition 3.5.2, p. 422: the source names its crystalline representation with an undefined lattice symbol; it should use the given N_p at the point with p inverted; affects nothing.
- **Misprint** in A at Proposition 3.6.1(1), p. 430: the source describes the prime as nonsplit in F; it should say nonsplit in E; affects nothing.
- **Misprint** in A at the paragraph following (8.3.1), p. 508: the source permits odd support where p² does not divide the discriminant; it should require p² dividing the enlarged lattice discriminant, consistently with Theorem 4.8.1; affects nothing.
- **Misprint** in A at §9.4, p. 514: the source uses the negative bilinear value for the positive standard CM plane's squared norm; it should use the positive value, or its absolute value; affects nothing.
- **Error** in A at Lemma 9.4.3, p. 516: the source gives every integral generator period magnitude (2π)^(−dim A); it should give (2π)^(dim A) for trace one, multiplied by the embedding's unit magnitude after rescaling; affects the proof.
- **Error** in A at Lemma 9.4.4 and (9.4.6), p. 517: the source gives a negative cross-pair valuation for the quotient length; it should give the positive cross-pair sum, or half-discriminant minus within-part sums; affects a stated result.
- **Error** in A at Proposition 9.4.5, p. 519: the source places −e_P/2 before the conductor values; it should be +e_P/2, giving length 1 for the ramified quadratic singleton; affects a stated result.
- **Error** in A at equation (9.5.3), p. 523: the source obtains the maximal lattice by multiplying by ξ times the inverse different; it should compute the filtered lattice indices, since ξ=−p² gives p⁻¹O_E rather than p²O_E; affects the proof.
- **Misprint** in A at §9.5, p. 524: the source uses the trace from E for an F-valued norm expression; it should use Tr_F/ℚ in the auxiliary quadratic form; affects nothing.
- **Error** in T at §2.2, p. 382: the source identifies the CM and real-field regulators; it should use their ratio 2^(g−1)/Q_E with Q_E equal to 1 or 2; affects nothing.
- **Misprint** in T at the proof of Corollary 3.3, pp. 383–384: the source calls the height lower bound positive; it should permit a negative real bound, which the argument also handles; affects nothing.
- **Gap** in T at Lemma 4.1, p. 384: the source uses level-three rigidity for an unpolarized variety; it should retain a polarization, since infinite-order CM units can act trivially modulo three; affects the proof.
- **Error** in T at the proof of Theorem 5.2, p. 386: the source equates an absolute moduli degree with a reflex-field class quotient; it should compare absolute and reflex-relative orbits with their bounded field and marking factors; affects nothing.
- **Misprint** in PT at the proof of Lemma 3.3, preprint p. 4: the source gives CM covolume as the discriminant times the ideal index; it should be 2^(−g) times the square root of the absolute discriminant times that index; affects nothing.
- **Misprint** in PT at the proof of Lemma 3.4, preprint p. 7: the source writes Sp₄ for general genus; it should use Sp₂g; affects nothing.
- **Misprint** in PT at the general-case decomposition, preprint p. 7: the source puts the endomorphism blocks in matrices of size g_i; it should use the multiplicity n_i; affects nothing.
- **Misprint** in PT at the general-case decomposition, preprint p. 8: the source calls J_i an O_Ki ideal; it should be a rank-n_i projective O_Ki-module, decomposable into ideals; affects nothing.
- **Error** in PT at the proof of Lemma 3.6, preprint p. 8: the source bounds the saturation isogeny degree using only the maximal-algebra discriminant; it should retain [O_A:R], then absorb it into disc R; affects the proof.
- **Gap** in YE at the proof of Proposition 6, p. 10: the source infers exactness after embedding contraction from local freeness; it should establish relative/image determinant cancellation, since ramified contraction can retain different-torsion; affects the proof.
- **Misprint** in YE at the proof of Theorem 1, p. 11: the source writes A₂[π] as the Hom target; it should be A₂[δ_π]; affects nothing.
- **Gap** in Y at §9.2, p. 633: the source invokes étaleness of the coarse level map to produce a section; it should justify the section while retaining elliptic pullback multiplicity e; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f831e234c82993e1d699e5cd6c82a92d4fe8c3ab", "job": "REV-PKG-ComplexMultiplicationAndExplicitReciprocityPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
