<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12960#issuecomment-6781601898 -->
Review (codex) of c024054

Verdict: needs_changes

1. **F01** (P1) The inverse-Frobenius norm needs rescaling

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1256`: “the inverse perfection of A with the supremum of spectral norms”; compare :1232–1236 and the supremum construction at :1061.

   **Claim.** Twisting the successive scalar actions, while taking the supremum of the original stage spectral norms, gives the isometric perfectoid coreflection in characteristic p.

   **Witness.** Take A=K, the completed perfect closure of F_p((t)), with q=‖t‖<1. For x=(t,t^(1/p),…), the asserted supremum is 1, whereas its counit image has norm q.

   **Exact repair, tested.** Specify both the scalar twist and the norm: at stage n use λ·a=λ^(1/pⁿ)a and norm ‖a‖_n=‖a‖_sp^(pⁿ). Then take the bounded limit with these rescaled norms. Equivalently, give a compatible sequence its zeroth-coordinate spectral norm. Replace the last Check with this explicit formula, and state the normalization where `ulim_F` is introduced. On the witness every rescaled coordinate has norm q, so the counit is isometric; without rescaling every positive power of x still has supremum 1. For p=2,q=1/4 and p=3,q=1/8 the repaired norms are 1/4 and 1/8, respectively. The supplier already specifies the sharp/gauge equality at `TauCetiRoadmap/PerfectoidSpaces/README.md:4095`. ANDRE18A Proposition 3.2.1, p.36 (line 1514), and Proposition 3.3.3, p.40 (line 1715), support the coreflection, not the unrescaled-norm Check.

2. **F02** (P2) One finite-freeness assertion still includes infinite targets

   **Location.** `packages/PerfectoidSpacesPartII/README.md:2115`: “every transition A_jl → A_{j′l′} is a localisation of a finite free extension”. The preceding definition at :2104 admits indices in ℕ∪{∞}.

   **Claim.** This finite-freeness argument applies to every stage inclusion, including a finite stage mapping to an infinite stage.

   **Witness.** Put n=0,k=F₂,l=l′=0,j=0,j′=∞. The map is Q₂→⋃_r Q₂(ζ_(2^r)); the finite subextensions have degrees 1,2,4,…, so its target is not finite dimensional.

   **Exact repair, tested.** Restrict this sentence to transitions with finite source and target indices. State separately that all remaining inclusions are obtained from these injective maps by filtered unions. A localization of a finite-dimensional algebra over a field is still finite dimensional, so the witness cannot satisfy the original assertion; it does satisfy the repaired filtered-union assertion. Preserve the all-indices purity theorem. ANDRE18B lines 339–351, §§2.2–2.3, pp.77–78, separate the finite constructions from their unions. This is the remaining occurrence of previous R11's pattern, not an objection to the two correctly repaired finite-index statements.

3. **F03** (P2) The perfected Tate algebra is planned again

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1260`–:1264: “Let A be a perfectoid K-algebra. Prove … A⟨T^(1/p^∞)⟩ is perfectoid”, followed by its unit ball and universal property.

   **Claim.** Section 3.2(1) is a construction/theorem owned by this Part II.

   **Witness.** Main `TauCetiRoadmap/PerfectoidSpaces/README.md:5423`, P1.30, already supplies all three assertions for any perfectoid Tate ring and any set of variables. Revision PR #1187 retains them at the same section and lines.

   **Exact repair, tested.** Delete §3.2(1) as a target, and import PerfectoidSpaces P1.30 through Scope and Exact supplier contracts. Keep the new root-quotient theorem, currently §3.2(2), and make its proof consume P1.30. Its scalar-field, one-variable case is exactly the supplier theorem with R=A and Σ a singleton, including the completed unit ball and the universal map. No variant distinguishing the repeated theorem is stated here; the existing citation at README:284 already identifies the correct owner. The free algebra used over an arbitrary uniform base in §2.8 remains a genuinely broader construction and need not be removed.

4. **F04** (P2) Adjoining roots of a new coordinate does not perfect the coefficient algebra

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1171`: “the perfectoid disc algebra A⟨T^(1/p^∞)⟩”; the assumptions at :1165 only require A to be a uniform Banach K-algebra.

   **Claim.** This disc algebra is perfectoid for an arbitrary uniform coefficient algebra in §2.9.

   **Witness.** Let K be perfectoid of characteristic p and A=K⟨X⟩. In K⟨X,T^(1/p^∞)⟩, Frobenius multiplies every X-exponent by p; X has no p-th root, at p=2 or 3.

   **Exact repair, tested.** Call it the completed algebra `A⟨T^(1/p^∞)⟩`; say it is perfectoid when A is perfectoid, citing P1.30 in the supplier discussion. Keep the general tube-colimit theorem and its uniform hypotheses. Add the coefficient-variable example as a negative Check. For A=K all coordinate exponents have roots and the algebra is perfectoid; for A=K⟨X⟩ the missing X^(1/p) remains missing after completion. ANDRE18A Corollaire 2.9.3, p.34, concerns uniform algebras; the perfectoid-base assertion is in Exemples 3.2.3(1), p.37.

5. **F05** (P1) The cited Nakayama contract does not supply the complete-module version

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1866`: “Nakayama lemma for complete modules (PerfectoidSpaces P0.26)”.

   **Claim.** P0.26 supplies lifting of an almost-surjective reduction modulo p to an almost-surjective map between the complete modules used by the trace argument.

   **Witness.** Main `TauCetiRoadmap/PerfectoidSpaces/README.md:3168` assumes a tight ideal and almost finite generation, or almost finite projectivity. ANDRE18A line 176 instead uses completeness of both modules, without those finiteness assumptions.

   **Exact repair, tested.** Declare the missing contract, for example `gap:complete-almost-nakayama`, with supplier PerfectoidSpaces, section P0.26: for a basic setup and an almost algebra R, a morphism M→N between p-adically complete R-modules is an epimorphism if M/pM→N/pN is an epimorphism. Put the identical slug in the plan's top-level gaps and in the README's supplier subsection, and cite it in §4.7's Needs. Alternatively replace the proof by a fully owned argument establishing this complete-module assertion; the existing P0.26 citation alone does not do so. The source is ANDRE18A §1.3, printed p.5, lines 176–187, supported by GR03 Lemma 5.3.3, p.111, lines 5509–5519. Its proof lifts surjectivity through all p-power quotients and uses the surjective kernel transitions and completeness. For the identity of a complete module the reductions and map are surjective. Completeness matters: Z_(p)→Z_p is surjective modulo p but not surjective. Do not impose finite generation or tightness on the Abhyankar theorem to fit the narrower supplier; the ramified root setup does not give them. No such gap is declared in this package now.

6. **F06** (P3) The additive-functor Check fails at root index zero

   **Location.** `packages/PerfectoidSpacesPartII/README.md:508`: “for a nonzero class x in an image the element x ⊗ ϖ^(1/p^k) is nonzero”.

   **Claim.** The stated simple tensor is nonzero for the allowed root indices, without a restriction on k.

   **Witness.** Take K=C₂,ϖ=2,k=0. In `(A/2^(1/2)) ⊗_(F₂) (A/2)`, every x⊗2 equals zero, including nonzero x from a transition image.

   **Exact repair, tested.** Fix k=1, or explicitly require k≥1, in this negative Check. Then ϖ^(1/p^k) is nonzero modulo p: its valuation is at most 1/p^k<1. A nonzero simple tensor over F_p is nonzero, and every transition image of the shrinking-quotient tower is nonzero, so this proves the intended failure of almost-pro-zero. Add k=0,ϖ=p as the boundary zero computation. The A-linear functor theorem itself is correct; BHATT18 Lemma 3.6, p.6, lines 337–346, requires A-linearity.

7. **F07** (P3) The rigid Riemann-extension deferral names an obsolete roadmap

   **Location.** `packages/PerfectoidSpacesPartII/README.md:123`: “belongs to AdicSpacesPartIIPartII (its Riemann extension theorem for normal rigid spaces)”.

   **Claim.** The named roadmap resolves the scope-only deferral.

   **Witness.** Open PR #2133 states that theorem at `TauCetiRoadmap/AdicSpacesPartV/README.md:447`, §1.7. `roadmaps show AdicSpacesPartIIPartII` finds no main or open roadmap; the board index supplies no such package.

   **Exact repair, tested.** Replace the name and informal locator with “AdicSpacesPartV §1.7”. Its statement is precisely extension of bounded functions across a nowhere dense analytic subset of a normal rigid space over any complete nontrivially nonarchimedean field. Keep this as a scope comparison, not a supplier or Needs edge: AdicSpacesPartV is later in the merge order. The actual board folder and merge order also use AdicSpacesPartV.

Seven findings: two P1, three P2 and two P3; five blocking. The scope is a repairable Part II extension. The submitted Lean file now elaborates, with exactly six `sorry` warnings. No package input was changed. The source manifest already contains all five works, and no entry was added or rewritten.

## Previous findings, checked first

The identifiers in this table belong to the round-2 review. The repair report marks all thirteen applied; none was marked not actionable. Locations below refer to the submitted round-3 package. README locations mean `packages/PerfectoidSpacesPartII/README.md`; Lean locations mean `packages/PerfectoidSpacesPartII/Suggested.lean`.

| Previous finding | Repaired passage | Independent result |
| --- | --- | --- |
| R01, elaboration | Lean:115 explicitly uses `: Finset R`; Lean:428 supplies the scalar structure for completion. | **Repaired.** The actual file elaborates, not just a proposed correction. Its six warnings all concern admitted theorems. |
| R02, native APIs | README:90: “The native perfectoid predicate and almost-module category supply P1.1 and P0.1's carriers”. README:233 names `LinearMap.projectiveTrace`. | **Repaired for the objects identified.** The local perfectoid class is gone; native annihilation and the projective trace are correctly distinguished from the missing almost-algebra structures. A separate remaining ownership duplication is R03 below. |
| R03, free roots versus a chosen branch | README:1190: “The free root algebra has an evaluation retraction to A using the chosen roots, but retains other branches.” | **Repaired.** Over C₂, S²−1 has two factors and four idempotents; evaluation selects one factor. |
| R04, dimension-zero tower and lower-shriek model | README:2236: “completion cannot turn this algebra into a field”; README:2418: “For p = 2, k = 𝔽₂, n = 0, g = 2, the inclusion S ⊆ Â°_∞∞ is strict”. | **Repaired.** At p=2, j=3, l=1, X²−2 splits over Q₂(ζ₈). Its idempotent e=(1+X/(ζ₈+ζ₈⁻¹))/2 persists in completion and need not lie in the image of S. The other field/valuation-ring and equality assertions identified previously have been corrected. |
| R05, envelope's integral model | README:1822: “Its integral model is (B̃^♮)°. The natural inclusion (B̃^♮)° → B̃° is an almost isomorphism in the stated ramified setup”. | **Repaired.** This is the distinction in ANDRE18A line 3181 and line 3185; at g=1 both models coincide. |
| R06, Frobenius-only control | README:220: “Frobenius on ℤ_p/p = 𝔽_p is the identity … so that condition alone accepts it”. | **Repaired.** At p=2,3 it fixes respectively two and three residue classes. Positive integral valuations cannot satisfy 0<v(ϖ)≤1/p. |
| R07, annular boundary | README:1362 qualifies strictness by “j ≥ 1”; README:1365 says at j=0 both norms are 1. | **Repaired.** For q=1/4,p=2,j=1 the quotient norm is 2 and the spectral norm 1; at j=0 both are 1. |
| R08, p=2 witness | README:2171 uses `ζ_(p²) − 1`, of valuation `1/(p(p−1))`. | **Repaired.** Valuations are 1/2 and 1/6 at p=2 and 3, whereas v₂(ζ₂−1)=1. |
| R09, non-nested algebra tower | README:1536 uses `(K°/ϖ)[X]` and says “let each successor transition send X to 0”. | **Repaired.** These maps send 1 to 1. Their images stabilize at the constants, so lim¹=0, while the cokernel contains a non-almost-zero X-class. |
| R10, omitted coordinate roots | README:2238: “Coordinate roots cannot be omitted in general: for g = 1 and n ≥ 1”. | **Repaired.** Frobenius misses T₁ in that example; for n=1,g=T₁ the g-roots already provide every coordinate root. The source correction and worked examples agree. |
| R11, finite versus infinite stages | README:2086 and :2148 now explicitly restrict finite freeness to finite indices. | **Partly repaired.** README:2115 still asserts it for every transition after allowing infinity; see R02 below. |
| R12, two locators | README:622 now gives “Theorem 1.6, p. 3”; README:2527 gives “Proposition 4.4.4, proof (3), p. 63”. | **Repaired.** BHATT18 line 111 and ANDRE18A line 2989 locate the intended passages. |
| R13, general kernel headline | Lean:208 declares `bhatt_kernel_without_regularity`; README:704 identifies it. | **Repaired.** Its type has no almost-regularity hypothesis, uses the product of the two root scalars, and places the offset before the element being tested. |

## Verified sound

The following evidence certifies specific checks, not acceptance of the seven passages above. All six layers, all individual Needs lines, the conventions, examples, correction list and references were read. The 440-line Lean file, metadata and complete five-entry source manifest were inspected. For untouched assertions I used the round-2 adversarial rows only where they contained explicit computed values; I did not inherit its blanket claims about suppliers or ownership. In particular, the complete-module Nakayama inference and the scope-only owner name were resolved anew.

### Principles, shape and ownership

The roadmap develops general principal-divisor ramification theory over perfectoid bases, including p=2, both characteristics, zero divisors where permitted, zero finite étale algebras, and arbitrary perfect residue fields. It does not replace the base PerfectoidSpaces roadmap. The duplicated supplier theorem is isolated in R03. There is no executable algorithm, selected-root-field shortcut, copied source exposition, sorry-valued datum or `set_option` in the package. Statements and proof descriptions use the author's own wording. The mathematical layer titles are not source chapter names. Their dependency chain forces the order: tower calculus feeds quantitative extension; uniform algebra feeds coreflection and limits; these feed envelopes and Abhyankar; tube models and ramified purity feed Kummer applications.

Main `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/ProfiniteCohomology/README.md` were read for shape. This README has Summary, Scope, Conventions, supplier contracts, build explanation, six layers with Examples and Dependencies, consumers and references. Its definition blocks retain API lists and at least three Checks. R01 and R06 identify defective Checks rather than missing quotas. Section 3.0 is a supplier pointer without a duplicate local predicate. No process dates, PR numbers, machine paths or hand-off instructions were found in the mathematical package text. Metadata remains `topic = "math.AG"`.

Object searches used the pinned libraries, main, the board packages, `roadmaps grep`, and `roadmaps show` at open heads. The board package index was read before any missing-name conclusion. The quantitative almost-pro statements, arbitrary-uniform-algebra root saturation and explicit normalized Kummer tower have no second owner identified by those searches. In particular:

- PR #1187, PerfectoidSpaces: compare main for supply, its head for overlap. P1.30 is the duplicate in R03; the basic perfectoid predicate, almost-module category and finite-projective trace are now native inputs, not local constructions.
- PR #1042, PerfectoidQuotients, §§1.3–1.4: integral perfectoid root covers and their saturation differ from this package's arbitrary uniform Banach root construction and explicit normalized Kummer tower.
- PR #816, PerfectoidTowers: quotient and descent theory; PR #1209, RelativeFarguesFontaine: relative period geometry. Their scopes do not claim these quantitative or normalized-tower headlines.
- PR #1735, DirectSummandsAndBigCohenMacaulay, `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:9` and :92: it consumes this ramification and purity theory, and owns direct summands and big Cohen–Macaulay applications. Its pre-existing RA.0–RA.5 vocabulary is not an id newly dropped by this repair. Its separately declared ramified-multielement contract is not a gap declared by this package.
- PR #2133, AdicSpacesPartV, §1.7, is the correct owner for the normal rigid-space comparison in R07. PR #1085, PerfectoidShimuraVarieties, §1.3, still displays the arbitrary-ideal characteristic-p Hebbarkeitssatz, through AutomorphicBundles §10.3; it remains a scope comparison, not an upward input.

The supplied overlap inventory has no other head changing this roadmap, no cited supplier id dropped without a mapping, and no cited id defined only by an unacknowledged open revision. No package target id was deleted in this repair. No same fully qualified Lean declaration was found in another readable roadmap.

### Seeded source sample

All fifteen requested targets were checked against the actual cached text, including theorem numbering, printed/preprint page, hypotheses and the statement's direction. There are no author-marked unverified locators. All five works are legally cached and recorded once; published André numbering and the manifest's preprint version notes are distinguished. The additional ANDRE18B v1 correction was checked in the already cached arXiv text, under the same work id.

| Target | Text opened and locator | Result |
| --- | --- | --- |
| 0.1 almost-pro-zero and almost-pro-isomorphisms | BHATT18 lines 309–324, Definition 3.2 and Example 3.3, p.6 | Quantifier order, scalar annihilation and kernel/cokernel formulation agree. The elementwise definition does not need regularity of t. |
| 0.2 uniform version | BHATT18 lines 355–370 and 418–426, Theorem 4.2(2), p.6, Remark 4.3, p.7 | The offset is independent of stage and of the second root precision; those quantifiers are retained. |
| 0.4 linear functors | BHATT18 lines 337–346, Lemma 3.6, p.6 | A-linear covariant functors, including nonexact ones, are allowed. The functor factors the scalar-zero map; R06 concerns only its negative Check. |
| 1.1 annular tower | BHATT18 lines 348–353, Notation 4.1, p.6, and 374–416, proof of Theorem 4.2, p.7; SCHOLZE12 lines 1393–1445, Lemma 6.4 | Integral completed all-root presentation and restriction direction agree; no replacement by a selected root branch. |
| 1.3 derived quantitative form | BHATT18 lines 418–426, Remark 4.3, p.7, and 125–130, Remark 1.8, p.3 | Scalar-zero transitions survive arbitrary derived tensor products. The separate Koszul vanishing retains weak regularity. |
| 1.5 limits | BHATT18 lines 119–124, Remark 1.7, p.3, with Theorem 4.2 and the no-regularity form | Almost comparison survives the derived limit. Bounded extension is not an assertion that 1/g extends. |
| 2.3 root saturation | ANDRE18A lines 935–959, Lemma 2.5.1, pp.24–25; 1067–1087, Lemma 2.5.3, pp.26–27; 1282–1292, Lemma 2.8.2, p.32 | The ambient localized ring, all-root intersection, six-condition dictionary and completion distinction agree. Inverting ϖ corrects the source's characteristic-p misprint. |
| 2.5 Weierstrass unit ball | ANDRE18B lines 238–302, §1.2, formulas (1)–(4), pp.76–77 | The extra isometric-multiplication condition for the integral quotient is retained; discrete and nondiscrete unit-ball formulas differ as stated. |
| 3.1 coreflection | ANDRE18A lines 1514–1519, Proposition 3.2.1, p.36; 1711–1724, Proposition 3.3.3, p.40 | Adjunction and isometric counit supported. The added inverse-Frobenius norm explanation needs R01's rescaling. |
| 3.2 perfectoid roots | ANDRE18A lines 1533–1551, Exemples 3.2.3(1), p.37; 2125–2145, §3.6.1, pp.48–49 | Perfectoid-base hypotheses and quotient direction supported. The free-disc theorem is already supplied: R03. |
| 3.8 uniform limits | ANDRE18A lines 2760–2834, Proposition 4.3.1, pp.58–59 | Characteristic zero is retained. The implication diagram is (1)⇔(2)⇐(3)⇔(4)⇔(5), not an unjustified five-way equivalence. |
| 4.3 annular envelopes | ANDRE18A lines 2969–3003, Proposition 4.4.4, pp.62–63 | Finite étale algebra need not be faithful; zero rank is allowed. The proof's algebraic limit corrects the source's bounded-limit slip. |
| 5.1 purity | ANDRE18B lines 835–850, A.1/Lemma A.1.1, p.89; 858–889, A.2/Lemma A.2.1, pp.89–90 | Tensor purity, finitely presented tests, splittings and generator criterion agree. The dual is R-linear; finite sums of evaluations give a retraction. |
| 5.2 almost purity/flatness | ANDRE18B lines 940–962, A.4, p.92; GR03 lines 1101–1104, Definition 2.4.4, p.23 | The basic setup and flatness of its tensor ideal are retained. The intermediate arrow is corrected. Native annihilation implements the elementwise predicates. |
| 5.7 Noetherian tubes | ANDRE18B lines 485–531, Theorem 2.5.2 proof (a),(b), p.81; BHATT18 Proposition 5.1, p.8 | The package replaces the unargued generic-fibre step with an integral argument. For j≥k′ the reduction is monic in the auxiliary variable and free over the finite Noetherian base; the named complete-flatness supplier applies. |

The changed free-root example was also read against ANDRE18A lines 1320–1350; annular norms against lines 2175–2218; the envelope correction against lines 3171–3200; finite/infinite Kummer stages against ANDRE18B lines 313–365; and the lower-shriek integral model and modulo-p theorem against lines 589–614. No sampled theorem number or page remains wrong after the prior locator repair.

### Computed adversarial evidence

Here q=‖ϖ‖ with 0<q<1. These rows cover all sampled targets, the headlines, repaired passages and the findings. Untouched background API rows with computed values in the round-2 table were checked against the unchanged definitions; bare earlier summaries were not treated as mathematical evidence. Values such as zero kernels refer to the indicated instance, not a general proof of the theorem.

| Statement | Instances | Values computed on the two sides | Result and change |
| --- | --- | --- | --- |
| Root and norm conventions | p=2,3; t=0,1; product root systems | (t_(k+1)g_(k+1))^p=t_k g_k. Norms 0 and 1 both fail 0<‖t‖<1. A unit-root ideal contains 1 and its annihilated modules are zero. | General prime and both characteristics retained. |
| Native perfectoid predicate | Q₂,Q₃,C_p; square-zero C_p[ε]/ε² | Frobenius fixes all 2 or 3 residues; no integer v lies in (0,1/p]. In C_p, v(p^(1/p))=1/p. Each p^(−r)ε squares to 0 while its norm grows. | Divisibility and uniformity distinguish the wrong models. |
| 0.1 almost-pro-zero | M_n=K°/ϖ^(1/pⁿ), transitions multiplied by ϖ^(1/pⁿ−1/pⁿ′) | The image times ϖ^(1/pᵏ) vanishes iff n′≥k; k=n′+1 leaves it nonzero. Constant K° has nonzero scalar image of 1; zero-transition tower has zero image. | Stage may depend on precision. |
| 0.1 almost-pro-isomorphism | Identity and 0→constant K° | Identity kernel,cokernel and cone are 0. The second map has cokernel K° and ϖ^(1/pᵏ)·1≠0. | Not a condition just on an arbitrary comparison map. |
| 0.2 uniformity | Zero transitions; shrinking quotient tower with g=1 | Offset 1 kills the first. For any fixed c in the second, choose l>n+c: exponent 1/pⁿ−1/p^(n+c)+1/pˡ is below 1/pⁿ and the image survives. | The quantifier order is substantive. |
| 0.4 linear functors | A-linear tensor/Hom; scalar action on the second factor of M⊗_Z A | F(t_kρ)=t_kF(ρ)=0. With ϖ=p,k=0, x⊗p=0; with k=1, nonzero x⊗p^(1/p)≠0 over F_p. | The theorem passes; R06 fixes the Check. |
| 1.1 annulus direction | g=T,q=1/2,n=1,c=1; g=0 | Inner radii are 1/2 and 1/4. The smaller geometric domain receives restrictions from the larger. With g=0 the denominator localization is 0. | Source/target and zero algebra agree with native maps. |
| 1.1 root presentation | g=1 and a root u_n^(1/p) | u_n^(1/p)=t^(n/p); restriction sends u_(n+c)^(1/p) to t^(c/p)u_n^(1/p), yielding t^((n+c)/p). | All-root transition relation agrees. |
| 1.2 kernel headline | g=1; g=(T,0),a=(0,1); m=0 | For g=1 kernel=0. In the product f_n(a)=0 but t_l a≠0 modulo t^m for large l; almost regularity fails. At m=0 the quotient is 0. | Required regularity is actually in the Lean type. |
| 1.2 cokernel headline | p=2,3; (k,m)=(0,1),(1,1),(2,2) | c=pᵏm equals (1,2,8) and (1,3,18). In every case c/pᵏ=m. For a monomial exponent e≥1/pᵏ the extra t-exponent is ≥m; for e<1/pᵏ, g^(1/pᵏ−e) has nonnegative exponent. | Exact bound, not a prime-restricted shortcut. |
| 1.3 derived and Koszul form | R[−1]⊕R[−2]; sequence (0) versus regular x | A scalar-zero transition acts by 0 on both summands with the same offset. K(0) has H₀=H₁=R; K(x) has H₁=0,H₀=R/x. | No amplitude-dependent loss; vanishing requires regularity. |
| 1.4 no-regularity headline | g=(T,0),a=(0,1); g=0; m=0 | t_k a can survive, but g_k t_k a=(0,0). For g=0 multiplier=0; for m=0 t⁰=1 and b=g_k t_k a solves the divisibility equation. | New signature has the correct annihilator and uniform offset. |
| 1.5 limit extension | Disc g=T; aT^(−r),r>0 | On annulus j its norm is ‖a‖q^(−jr), unbounded unless a=0. Constant 1 has norm 1 at every stage. | Bounded functions extend; 1/T is excluded. |
| 2.3 saturation | Disc b=1,1/T; product g=(T,0) | T^(1/pᵏ)·1 is integral; T^(1/pᵏ)/T has negative exponent for k≥1. Localization kills (0,1) in the product. | Ambient image versus injective inclusion is distinguished. |
| 2.3 saturation can enlarge | A=K+closure(Σ_m T₁^(1/pᵐ)P), P=K⟨T₁^(1/p∞),T₂^(1/p∞)⟩ | T₂∉A, but T₁^(1/pᵐ)T₂∈A for every m. Thus T₂ belongs to the saturation. | No general root-saturatedness claim follows from perfectoidness. |
| 2.4 quotient norm/source correction | A=K×K,g=(ϖ²,1),λ=ϖ,a=(1,ϖ²) | The first factor dies; quotient norm=q². The one-parameter infimum is inf_m max(q^m,q^(2−m))=q. At q=1/2 these are 1/4 and 1/2. | Corrected quotient-norm route retained. |
| 2.5 Weierstrass ball | f=T,λ=ϖ; f=ϖT,λ=ϖ² | First quotient has T=ϖU and ball K°⟨U⟩. Second integral quotient contains v=ϖU−T≠0 with ϖv=0. | Isometric-multiplication condition is necessary for the stated integral model. |
| 2.5 change of variables | f′=f+λa,λ′=λu,‖u‖=1 | Substituting U′=(λ/λ′)U+(f′−f)/λ′ gives λ′U′−f′=λU−f; inverse substitution returns U. | Both map directions and the sign agree. |
| 2.8 existing roots/free branches | C₂,g=1; g=0 in characteristic p | C₂[S]/(S²−1)=C₂×C₂ has four idempotents, not two. In characteristic p, S^(pⁱ)=0 is killed by uniformization. | Retraction and full free-root construction repaired correctly. |
| 2.9 tube colimit and base | f=T, f=0; A=K⟨X⟩ in characteristic p | Tube norms of T are ≤qⁱ→0, so its colimit image is 0; f=0 gives B. In A⟨T^(1/p∞)⟩ all Frobenius X-exponents lie in pN, so X∉image. | Colimit theorem passes; R04 removes the perfectoid overclaim. |
| 3.1 inverse-Frobenius norm | A=K, x_n=t^(1/pⁿ), q=1/4 or 1/8 | Raw supremum=1 and counit norm=q. Rescaled norms ‖x_n‖^(pⁿ)=q for every n. | R01. |
| 3.1 coreflection image | K⟨X⟩ in characteristic p; perfect K | A nonzero X-exponent cannot be divisible by pⁿ for every n, so the counit image is K; on K it is all K. | Non-surjective and identity cases agree once the norm is fixed. |
| 3.2 perfectoid roots/ownership | Perfectoid K; singleton versus empty variable set | Singleton has T_(n+1)^p=T_n; empty set returns K. The unit ball is the completion of the integral root-polynomial union in both package and P1.30. | Mathematical statement passes; ownership is R03. |
| 3.4 repaired boundary | p=2,q=1/4 and p=3,q=1/8; j=0,1 | Spectral norm of (ϖʲ/T)^(1/p)=1. Quotient norms at j=1 are 2 and 4; at j=0 both equal 1, with T^(−1/p)=T^(1−1/p)U. | Correct strictness range. |
| 3.6 closure headline | g=1; disc g=T,b=1,1/T | For g=1 both sets are A°. For b=1 take the cyclic module A°·1. For 1/T, powers T^(−r) exceed every finite denominator bound and some root multiple is nonintegral. | Both directions tested on positive and negative inputs. |
| 3.8 uniform/perfectoid limits | Constant perfectoid diagram; zero diagram | Limits are A and 0; reduction comparisons and Frobenius linearizations are identities, with cokernel 0. | Consistent with the one-way implication diagram. |
| 3.9 repaired non-nested tower | R_i=(K°/ϖ)[X], successor X↦0, T↦1 | 1↦1, X↦0. Cokernel contains [X] with ϖ^(1/p)[X]≠0; images stabilize at constants after one step, giving lim¹=0. | A genuine algebra example, not scalar multiplication. |
| 3.11 nested-system headline | Standard disc annuli and zero system | Uniform limit of disc annuli is A and its j-localization is A[j]; for the zero system both operations return 0. Unit and counit are identity maps in these instances. | Adjunction direction and zero case agree. |
| 4.1 Galois convention | C₂ on A×A, e₁⊗e₂; regular S₃ torsor | The swap component of b·γ(b′) is e₁; of γ(b)·b′ it is e₂. Tensor swapping identifies them. For S₃ all 36 delta tensors map bijectively to the 36 delta coordinates. | Nonabelian and tensor-factor conventions checked. |
| 4.3 annular envelope | B′=A[1/T],0, or its split square | 1/T has norms q^(−j), so belongs to the algebraic limit but not its bounded part. Envelopes are A,0,A×A. | Corrected trace proof and nonfaithful case agree. |
| 4.5 ramified almost purity | Identity, zero and split finite étale cover; tame Y^ℓ=T | Images under the equivalence are A,0,A×A. The tame derivative is ℓY^(ℓ−1), a unit after T is inverted but not at T=0. | The ramified almost ideal and localization are substantive. |
| 4.6 integral envelope comparison | g=1; general coreflection map | At g=1 cokernel=0. The general assertion is kernel=0 and m·cokernel=0, not cokernel=0. | Prior overclaim removed. |
| 4.7 Abhyankar and trace | B′=0; split quadratic cover; complete versus incomplete source modules | Zero envelope is 0, and A→0 is not injective. Split trace sends (a,b)↦a+b and (1,0)↦1. Z_(p)→Z_p is onto modulo p but not onto. | Faithfulness qualifier passes; complete lifting needs R05. |
| 5.1 purity | Identity, diagonal R→R², Z→F₂, Z→Z[i] | First two tensor maps are x↦x and x↦(x,x), kernel 0. In Z→F₂, 2 maps to 0. The Z-linear retraction of Z[i] is a+bi↦a, but the primes (2+i),(2−i) both lie over 5. | Tensor purity differs from spectral universal injectivity. |
| 5.2 almost flat/faithful predicates | m=0 and m=V; M=V and M=0 | At m=0 all annihilation conditions hold. At m=V they become ordinary flatness and tensor reflection of zero. M=V tensors identically; M=0 fails faithfulness for a nonzero test module. | No free Prop placeholder or hidden nonzero hypothesis. |
| 5.4 transitions | n=0,k=F₂,l=0,j=0,j′=1,2,3,∞ | Finite degrees are 1,2,4; the union has unbounded degree. For identity indices the map is identity. | R02 restricts finite freeness, not purity. |
| 5.4–5.6 maximal ideal and coordinates | p=2,3; g=1 versus g=T₁ | v(ζ_(p²)−1)=1/2,1/6. With g=1, missing coordinate roots leave T₁ outside Frobenius image; with g=T₁ the next g-root is a p-th root of every coordinate root. | Both prior negative controls are repaired. |
| 5.7 tube models | j=k′ and j=k′+1, p=2,3; f=0 | Reduction degree d=p^(j−k′) is 1 or 2/3; basis is Z^aU^b for 0≤a<d,b≥0 and includes 1. With f=0 the nonzero U-class is killed by ϖ_(ik′). | Complete flatness applies to the actual monic models; the bad model is excluded. |
| 5.8 flatness headline/full branches | n=0,p=2,g=2,j=3,l=1 | X²−2=(X−u)(X+u), u=ζ₈+ζ₈⁻¹. e²=e, e≠0,1, ‖e‖=‖1−e‖=1. Neither completion nor normalization merges these factors. | No field shortcut; valuation-base torsion-free modules remain flat. |
| 5.9 purity headline | Identity stages; finite split stage; infinite union | Identity tensor kernel=0. For D→D² diagonal, projection gives a retraction and tensor kernel=0. Any tensor-kernel element at a union is represented at a finite stage. | All indices retained, with no finite-dimensional assertion at infinity. |
| 5.11 integral model and 5.12 modulo-p headline | Split branch idempotent e; g=1; m=0 and identity finite extension | The image of the unitized lower-shriek model is scalar modulo m, whereas e has different branch residues. At g=1 the ramified ideal is the valuation ideal. At m=0 both p⁰ quotients are 0; identity extension tensors identically for m≥1. | S need not equal the whole integral ring; modulo-p statement has the right setup and boundaries. |
| R07 scope comparison | Punctured disc and bounded constant | At T=ϖⁿ, norm(1/T)=q^(−n)→∞; constant 1 extends as 1. | AdicSpacesPartV §1.7 is the stated bounded-extension theorem. |

### Pinned declarations and resolved supplier contracts

The content manifest and the checked-out package HEADs agree: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The table uses paths relative to the corresponding pinned library, not a newer online version.

| Pinned file and line | Declaration inspected and relevant boundary |
| --- | --- |
| `TauCeti/RingTheory/Perfectoid/Basic.lean:86` | `IsPerfectoidTateRing`; complete Hausdorff Tate ring, bounded power-bounded subring, pseudouniformizer divisibility and both Frobenius conditions. Its uniformity and reducedness theorems are at :102 and :108. |
| `TauCeti/RingTheory/Huber/Basic.lean:163`, :186, :213 | `PairOfDefinition`, `IsPseudoUniformizer`, `IsTateRing`. Tate alone does not assert Hausdorffness or completeness; the six relevant signatures carry these explicitly. |
| `TauCeti/RingTheory/Huber/Bounded.lean:109`; `PowerBounded.lean:121`, :456, :482, :598; `Uniform.lean:71` | Bounded subsets, power-bounded elements/subring, integral elements being power-bounded, topologically nilpotent ideal and uniformity. These are native objects, not new definitions here. |
| `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311`; `Plus.lean:117` | `HasDenominatorPower` takes a Set; `completedPlusSubring` takes a Finset and the denominator hypothesis. The plus ring is the closure of the image of the algebraic integral closure in the localization, not a freely chosen subring. |
| `TauCeti/RingTheory/Huber/LocalizationTopology/CompleteSeparated/Basic.lean:91`; `Completion.lean:242`; `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219` | `completionLocObj`, `toCompletionLoc`, `pairHomOfRationalSubsetSubset`: actual presentation-dependent carriers and the contravariant comparison direction. |
| `Mathlib/Algebra/Module/Torsion/Basic.lean:214`; `TauCeti/RingTheory/Almost/BasicSetup.lean:252`, :263; `Module.lean:75`, :86 | `Module.IsTorsionBySet`, `IsAlmostZero`, its elementwise equivalence, the native Serre quotient and almostification. These do not by themselves provide almost-algebra finite-étale structures. |
| `TauCeti/LinearAlgebra/Trace/Projective.lean:72`, :96, :118, :158 | `LinearMap.projectiveTrace`, cyclicity, agreement with finite-free trace and base change. For R=k×k and M=(1,0)R, identity trace=(1,0); for M=R and 0 the traces are 1 and 0. |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27`, :32, :126 | `IsAlmostIntegral` uses a nonzerodivisor multiplier; `completeIntegralClosure` packages that predicate. The equality with integral closure at :126 requires Noetherian domain/fraction-ring hypotheses, absent in the perfectoid headline. It does not prove the submitted theorem in one step. |
| `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175` | `IsIntegralClosure.finite` requires an integrally closed Noetherian base and a finite separable extension of its fraction field. Section 5.4 normalizes the finitely many field factors with exactly these conditions. |
| `Mathlib/RingTheory/Flat/Tensor.lean:89`; `FaithfullyFlat/Basic.lean:385` | `Module.Flat.iff_lTensor_injective` tests finitely generated ideals; `Module.FaithfullyFlat.lTensor_injective_iff_injective` requires an existing faithfully flat instance. Neither proves Kummer purity or almost flatness for free. |
| `Mathlib/RingTheory/Ideal/Pure.lean:84` | `Ideal.Pure.of_inf_eq_mul` concerns a pure ideal/flat quotient, not arbitrary pure ring maps or the Kummer theorem. |
| `Mathlib/RingTheory/Filtration.lean:393` | `Ideal.mem_iInf_smul_pow_eq_bot_iff` retains both Noetherian and finite-module hypotheses. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`, :172, :324 | `IsAdicComplete`, `AdicCompletion`, and the transported module structure. Completion as used by the flatness signature is a module with explicit scalar data. |
| `Mathlib/RingTheory/Perfection.lean:40`, :507; `Mathlib/FieldTheory/PerfectClosure.lean:68` | Inverse compatible power sequences, `ModP`, and direct perfect closure have the claimed directions. On F_p(T) the former projects to F_p while the latter contains T^(1/p). |
| `Mathlib/RingTheory/WittVector/Defs.lean:52`; `Mathlib/Topology/Algebra/Valued/NormedValued.lean:47` | The native Witt-vector carrier and norm valuation used by the explicit Kummer/field definitions. The tower's ring structure is not an admitted datum. |
| `TauCeti/RingTheory/Etale/Torsor/Basic.lean:88` | Native `TauCeti.Algebra.IsFiniteEtaleTorsor` includes finite étale, faithfully flat and bijective tensor comparison. The almost counterpart is a different target. |

The README's other native scalar, polynomial, localization, tensor, subalgebra, category and module identifiers were resolved against the pins; the declarations actually used by Lean also elaborate under the explicit imports. The near-match list was treated as leads: ordinary kernel/cokernel presentations do not prove Bhatt's scalar estimates, the Noetherian complete-integral-closure lemma has different hypotheses, and an injective subalgebra inclusion is weaker than tensor purity.

Cross-roadmap citations were resolved afresh by their content, including clauses beneath broader headings:

- `TauCetiRoadmap/PerfectoidSpaces/README.md`: P0.1 :879, P0.2 :965, P0.3 :1042, P0.6 :1262, P0.8 :1447, P0.9 :1562, P0.11 :1714, P0.12 :1832, P0.14 :2034, P0.16 :2161 and its setup-change clause :2206, P0.25 :3029, P0.27 :3220 and its almost-zero limits clause :3250. P0.26 exists at :3143, but the consumed complete-module variant is missing: R05.
- In that same file, P1.1 :3583, P1.2 :3702, P1.4 :3843, P1.5 :3965, P1.7 :4079, P1.11 :4355, P1.24 :5049, P1.25 :5101, P1.27 :5197, P1.29 :5289 and P1.30 :5423 resolve the perfectoid carriers and constructions. P2.2 :6136, P2.3 :6235, P2.4 :6427, P2.13 :7391, P2.16 :7570 and P3.10–P3.13 :8628–8746 resolve approximation, rational restriction, tensor products and almost purity. P4.15.4 :11144 is the scope-only root-cover comparison.
- `Completed/AdicSpaces/README.md:378` and :461 supply §§2.2 and 3.1. `TauCetiRoadmap/AdicSpacesPartII/README.md:1769`, :2270, :2473 and :4097 supply tensor products, spectral seminorm, uniformization and the normalization clause, the last by its explicit RigidAnalyticGeometry deferral. `TauCetiRoadmap/AdicSpacesPartIII/README.md:10370` and :12470 supply the uniform/spectral comparison and Gel'fand formula; the coefficient-field setting satisfies the extra norm-scaling condition.
- `TauCetiRoadmap/AdicEtaleGeometry/README.md:9246`, :9267 and :9376 resolve A4.2, the explicit `Algebra.galoisTensorMap` alias to `TauCeti.MulSemiringAction.tensorToPi`, and A4.2a. The resolver's one missing-name lead therefore is not a finding. The tensor-swap convention was computed above.
- `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649`, :794 and :1865 resolve Koszul, derived tensor and derived limits. Its :38 explicitly maps former §1.T.1 citations to the native tower declarations: this is a valid numbering/ownership bridge. `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1401` supplies E2:towers.2, the ordinary pro-zero version.
- At the allowed earlier open heads, `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:536`, §1.10, supplies the Noetherian complete-base reduction criterion with completeness and nonzerodivisor hypotheses. `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:304`, §1.13, supplies flat completion, faithful when the ideal lies in the Jacobson radical. Section 5.7 uses finite Noetherian stages before taking unions.

The prescribed mechanical dependency command was run without editing the order or tooling. Its complete output was:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The incomplete supplier assertion in R05 and scope-name error in R07 are semantic issues not detected by that graph check. No supplier gap is currently declared.

### Headline coverage and Lean verification

| README headline | Acceptance-file coverage |
| --- | --- |
| §1.2 quantitative Riemann extension | Kernel and exact-constant cokernel at Lean:97 and :145. The assembled pro-object is explicitly unavailable in the module docstring. |
| §1.3 derived form | Named at Lean:39–45 as unavailable: presentationwise plus rings and pair comparisons are present, but the assembled annular tower and its derived comparison are not. |
| §1.4 without regularity | Kernel at Lean:208 together with the already general cokernel at :145. No regularity binder leaked into the new theorem. |
| §1.5 limit form | Named at Lean:39–45; the missing assembled tower/limit is specified. |
| §3.6 perfectoid Riemann extension | Complete-integral-closure equality at Lean:252; the uniform-limit clause is named at :46–49 with its missing Banach localization diagram. |
| §3.11 nested systems | Named at Lean:46–49: uniform limits and the category of compatible perfectoid annular systems are missing. |
| §4.5 ramified almost purity | Named at Lean:50–52: almost-perfectoid and almost finite-étale algebra structures are missing, despite native almost modules. |
| §4.7 perfectoid Abhyankar | Named at Lean:53–55: topologized intermediate algebras and almost finite-étale structures are missing; finite-projective trace is correctly recognized as native. |
| §5.8 Kummer almost faithful flatness | Lean:422 on the real normalized-stage module and its adic completion. |
| §5.9 Kummer purity | Lean:370, all finite/infinite indices and the explicit inclusion. |
| §5.12 ramified modulo-p flatness | Named at Lean:56–59: the completed tower as an algebra over the ramified root setup and its integral closure are missing. |

No additional absent statable headline was identified. The file uses a single Mathlib import in the pinned `public import` syntax, followed by six individually used Tau Ceti modules. It has a module docstring, the requested namespace and layer comments, and mathematical declaration docstrings. There are no admitted examples, placeholder propositions, sorry-defined data, or option overrides. The explicit polynomial quotient, localization, integral-closure intersections and module completion are real native carriers needed by the Kummer headlines, rather than arbitrary data assumed to have the conclusion.

`lake env lean` on the submitted absolute file path was run from the content checkout: exit 0, exactly six warnings, each “declaration uses sorry”. No missing Tau Ceti object required a build. A scratch copy with `#check @name` for all 23 named declarations, the three constructors and the generated ring instance also elaborated. Comparison with README showed no lost required binder: prime/perfect residue-field assumptions, topological completeness and separation, the native perfectoid predicate, continuity, root equations, regularity only where used, and the scalar tower needed by completion are present. No signature was edited.

Every admitted theorem was tested on a scratch copy with the alternatives `solve | simp`, `rfl`, and `infer_instance`; no alternative closed any of the six goals. The six resulting failures occur at the corresponding theorem bodies, not at imports or malformed signatures. The inspected single-lemma candidates do not match the statements at these pins.

| Admitted theorem | Probe and native-candidate result |
| --- | --- |
| `bhatt_riemann_extension_ker_almostZero` | All three tactics fail. Native localization/extension kernel identities do not imply its almost annihilation estimate. |
| `bhatt_quantitative_riemann_extension` | All three fail. Cokernel presentations provide no uniform offset or scalar divisibility. |
| `bhatt_kernel_without_regularity` | All three fail. Neither the regular-kernel theorem nor a native kernel identity supplies this root-product bound. |
| `riemann_extension_completeIntegralClosure` | All three fail. The native closure equality assumes Noetherian domain/fraction-ring hypotheses and gives a different conclusion. |
| `kummer_isPureHom` | All three fail. `Subalgebra.inclusion_injective` only asserts injectivity before tensoring; it is not purity. |
| `kummer_almost_faithfullyFlat` | All three fail. Native flatness criteria require the tensor assertions that this theorem must prove. |

The two already proved support theorems establish an inclusion used in a headline and integrality needed to form its ideal generators. They are not admitted boundary results. Every backticked local declaration name resolves to the file, including the constructors and the new no-regularity headline. No padding deletion is requested.

## Not verifiable

- None of the sources needed for the seeded sample or the author's source-correction list was unreadable. No reference request, waiver or new manifest entry is needed.

## Source issues

- **Error** in ANDRE18A at Theorem 0.3.1(1), printed p.2, line 61: the source says the envelope's structure map is injective for every finite étale algebra; it should be a structure map, with injectivity under faithfulness; affects a stated result.
- **Error** in ANDRE18A at §2.6.2, printed p.28, line 1158, and Lemma 2.6.3 proof, printed p.29, line 1190: the source says the quotient norm equals an infimum of rescaled powers; it should be the quotient Gauss norm, which can be q² when that infimum is q; affects a stated result.
- **Error** in ANDRE18A at Lemma 2.6.3 proof, printed p.29, line 1190: the source says the infimum is at least one; it should be bounded below by the norm of the nonzero input under the stated size hypothesis; affects the proof.
- **Error** in ANDRE18A at Remark 2.6.4(1), printed p.29, lines 1193–1195: the source says all the uniform-localization restriction maps are injective; it should be qualified, since restrictions of a product algebra can kill one factor; affects a stated result.
- **Misprint** in ANDRE18A at formula (2.17), printed p.26, lines 1005–1008: the source says invert p in the integral middle expression; it should be invert the pseudouniformizer, including in characteristic p; affects a stated result.
- **Misprint** in ANDRE18A at Lemma 2.5.3, proof of (2)⇒(6), printed p.27, line 1087: the source says apply condition (1); it should be condition (2), since the scaled elements belong to B[1/g]; affects the proof.
- **Error** in ANDRE18A at Proposition 4.4.4 proof (3), printed p.63, line 2991: the source says A[1/g] embeds into the bounded uniform limit; it should be the algebraic limit, since 1/T has unbounded annular norms; affects the proof.
- **Gap** in BHATT18 at §1.4 Notation, preprint p.3, line 146: the source says t has roots and matches p's norm in characteristic zero; it should be required to have norm strictly between zero and one in characteristic p too; affects a stated result.
- **Misprint** in ANDRE18B at §1.2.1, formula (2), printed p.77, line 266: the source says the discrete-valuation condition with a misplaced conjunction; it should be a conditional clause assuming discrete valuation; affects nothing.
- **Error** in ANDRE18B at Introduction §0.6, printed p.74, lines 142–150: the source says cyclotomic and g-root stages alone describe the completed tower; it should be stages also containing the coordinate roots, which g-roots need not supply; affects a stated result.
- **Gap** in ANDRE18B at Theorem 2.5.2 proof (a), printed p.81, lines 485–497: the source says an increasing-polydisc description gives generic-fibre flatness over the localized formal base; it should be supplemented by a descent argument or the integral monic-reduction flatness argument; affects the proof.
- **Misprint** in ANDRE18B at Lemma A.2.1 proof, printed p.90, line 888: the source says the generator criterion uses S-linear maps from S to R; it should be R-linear maps; affects the proof.
- **Misprint** in ANDRE18B at Annexe A.4, printed p.92, line 947: the source says the intermediate almost injection points from M′ to M; it should be from M to M′ in M→M′→N; affects a stated result.
- **Misprint** in ANDRE18B at arXiv v1 §5.5, preprint p.14, lines 741–745: the source says module almost purity tests a ring-map tensor expression containing an undeclared S; it should be tensoring the given module map M→N; affects a stated result; corrected in print at Annexe A.4, p.92.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c02405402fbc8af51cf389aba5f3de28984d07c5", "job": "REV-PKG-PerfectoidSpacesPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
