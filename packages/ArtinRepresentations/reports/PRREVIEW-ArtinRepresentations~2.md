# Review of ArtinRepresentations (pull request #1711 at aaeb686)

**Verdict:** needs changes

## R01 (P1) — The residual conductor of 11.a2 modulo 5 is 1

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1988–1991`, “conductor `11`”.

**Claim:** The prime-to-5 Artin conductor of the specified curve's representation on E[5] is 11.

**Witness:** For `[0,-1,1,-10,-20]`, c₄=496 and Δ=−11⁵. Thus v₁₁(q)=5 and the Tate inertia matrix on E[5] is the identity. Its conductor exponent at 11 is 0, not 1.

This uses the roadmap's own supplier, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3873–3880` and `3946–3956`: at multiplicative reduction and ℓ≠p, E[ℓ] is unramified iff ℓ divides v(q). At every other prime different from 5 there is good reduction. Consequently the prime-to-5 conductor is 1. The [LMFDB curve record](https://www.lmfdb.org/EllipticCurve/Q/11/a/2) independently gives the same minimal discriminant (`lmfdb`, curve record, line 253).

**Repair:** Replace 11 by 1 and explain the distinction between the elliptic curve's conductor and its residual representation's conductor. Keep a negative-control Check: E[3] at 11 has inertia parameter 5 mod 3=2, fixed dimension 1 and conductor exponent 1; E[5] has parameter 0, fixed dimension 2 and exponent 0. The corrected conductors are respectively 11 and 1.

## R02 (P1) — Restore the conductor exponent in the unramified-twist law

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1954–1959`, “the scaling law `W(χη) = η(ϖ) W(χ)` for the unramified quadratic `η`”.

**Claim:** Every unramified quadratic twist multiplies the root number by η(ϖ).

**Witness:** Over ℚ₂ take χ for ℚ₂(i), a(χ)=2, and unramified η for ℚ₂(√−3). Then χη corresponds to ℚ₂(√3). The displayed table gives W(χ)=W(χη)=i, whereas the stated law gives −i.

This is a contradiction within the same paragraph. The dependence on conductor is also visible in `rohrlich1994` line 816 (Section 11, proposition, printed p.143).

**Repair:** For the conductor-zero additive character used in this paragraph, write `W(χη)=η(ϖ)^(a(χ)) W(χ)`. For a general additive character include its conductor exponent as well, with the convention explicitly stated. Retest χ for ℚ₂(i): (−1)²i=i; for the tame quadratic character at 3, (−1)¹i=−i. Both then agree with the table. These are essential even/odd conductor Checks, not just sign conventions.

## R03 (P1) — The tetrahedral representation does not factor through Q₈

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1943–1945`, “`ρ₀` factors through `Q₈ ⊂ SL₂(ℂ)` restricted from `SL(2,3)`”.

**Claim:** The displayed representation ρ₀ factors through Q₈.

**Witness:** The same example gives ρ₀ an element of order 3 with trace −1 and determinant 1. Its eigenvalues are ζ₃ and ζ₃². No image in Q₈ can have order 3.

**Repair:** Say that ρ₀ is the defining binary-tetrahedral representation with image SL(2,3), whose **restriction** to Q₈ is the faithful quaternionic representation. Its invariant alternating form comes from its determinant-one two-dimensional action. This preserves the intended symplectic conclusion, permits the order-3 matrix, and gives image order 24 rather than 8. The Q₈ restriction has image order 8 and indicator −1.

## R04 (P2) — Include the conjugacy part of Klein's headline

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1457–1461`, “is conjugate to exactly one”; `TauCetiRoadmap/ArtinRepresentations/Suggested.lean:162–166`.

**Claim:** The README promises classification up to conjugacy, but `klein_classification` concludes only an abstract group-isomorphism disjunction. Conjugacy is neither stated nor named as unavailable in the module docstring.

**Witness:** H=⟨z↦−z⟩ and K=⟨z↦2−z⟩ are distinct C₂ subgroups, conjugate by z↦z+1. The existing conclusion merely labels both cyclic; it says nothing about their embeddings.

**Repair:** Retain the abstract alternatives and add the missing native statement that isomorphic finite subgroups of PGL₂(ℂ) are conjugate. Together these give the promised uniqueness. The following signature elaborated in a scratch copy under the defaults, with only the expected `sorry` warning:

```lean
theorem finite_pgl2_iso_implies_conjugate
    (H K : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℂ)) [Finite H] [Finite K]
    (h : Nonempty (H ≃* K)) :
    ∃ g : Matrix.ProjGenLinGroup (Fin 2) ℂ,
      ∀ x, x ∈ H ↔ g * x * g⁻¹ ∈ K := sorry
```

For the witness, choose g(z)=z+1; conjugating −z yields 2−z. [Beauville, cited version](https://arxiv.org/abs/0909.3942v1), introduction p.1 (`beauville2009` lines 15–18), explicitly includes uniqueness of the conjugacy class.

## R05 (P2) — Correct the claimed direction of supply from ClassicalArithmeticCompletion

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:218–222`, “which consumes completedArtinLFunction and the functional equation of Layer 4 here under exactly those names”; also §§4.2–4.3 and 6.1.

**Claim:** ClassicalArithmeticCompletion is a downstream consumer of this roadmap's analytic Artin completion and root-number construction.

**Witness:** On main, `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15102–15106` already defines the finite-character completion and `analyticArtinRootNumber`, with functional equation and uniqueness. Its supplier is ArithmeticGaloisRepresentations §2.7, not ArtinRepresentations.

The same contract is explicit at lines 263–269 and 15118–15126. It uses the same conductor-balanced completion, arithmetic-Frobenius convention and normalized all-place product; this is not merely its tame symplectic algebraic Gauss factor. The existing main roadmap cannot be retrospectively described as consuming a new owner here.

**Repair:** Correct Scope and ownership, cite ClassicalArithmeticCompletion §7.30 for the existing finite-character analytic root/completion interface, and state the retained targets as comparisons with this roadmap's ArtinRep carrier through finite Galois factorization. Import its functional-equation/uniqueness/product interface instead of planning a second generic root-number interface. Keep any genuinely missing local-constant construction explicitly distinguished from that imported interface and from GL2AutomorphicRepresentationsAndTransfer's declared ArithmeticGaloisRepresentations contracts. On χ₋₄ both interfaces have conductor 4, real factor Γℝ(s+1), finite local phase −i, real phase i and global root 1; on 1⊕1 both give ζ² with pole order 2. These witnesses verify that this is the same normalized object, not an incompatible convention requiring a new owner.

## R06 (P3) — Finish the per-target locators and definition Checks

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:544–558`, `656–670`, `1160–1172`, `1558–1604`. Representative wording: “the expected ones”.

**Claim:** Several targets still have only a bibliography-level source or a supplier name, and some newly defined predicates have no local API/three discriminating Checks. The new layer endings fix the earlier shape defect, but do not fix this part of previous R25.

**Witness:** §2.1 never specifies the restriction-invariants comparison it calls “expected”; §5.2 has no external theorem/page locator. §§8.1–8.2 define ArtinHolomorphic, ArtinConjecture, HasRealMultiplication and HasComplexMultiplication without their own Check lists.

**Repair:** State the actual maps and hypotheses in the APIs, add exact locators at the relevant claims, and give three discriminating Checks per definition. For ArtinHolomorphic use 0 (L=1, order 0), the trivial line (ζ, order −1 at 1), and 1⊕1 (ζ², order −2); these distinguish the allowed pole from an incorrectly imposed entirety condition. For the quadratic-self-twist predicates, distinguish imaginary-quadratic induction, mixed-signature real-quadratic induction, and a tetrahedral representation with no quadratic self-twist. Keep these Checks in the README. No additional acceptance-file padding is requested.

## Verified sound

This was a full reread of all 44 numbered subsections, conventions, supplier contracts, worked examples and all 15 Lean declarations. The 113 rows below are finite tests of the stated mathematics, not claims to have proved the admitted theorems. The six findings above comprise three P1, two P2 and one P3 finding. No PR file was changed.

### Previous review, finding by finding

Quotes below are from this head, not instructions from the earlier review. “Repaired” means the identified defect is removed; source-certification limits are listed separately.

| Previous | Passage at this head, in README unless indicated | Assessment and retest |
|---|---|---|
| R01 | §1.2: “IntermediateField.fixedField ρ.ker ⊓ separableClosure F (AlgebraicClosure F)”; Lean:60–62 has the actual intersection | Repaired. Trivial action over 𝔽₂(t) cuts out F, degree 1, rather than its infinite perfect closure. |
| R02 | §7.7: “for an irreducible `ρ`” | Repaired. S₃ standard minimum 3; reducible 1⊕sgn minimum 1 is outside this claim. |
| R03 | §9.3: “the union of these image-level classes generates image ρ̄” | Repaired. A transvection image C₂ generates 2 elements, rather than the 6 generated by its GL₂(𝔽₂) conjugates. |
| R04 | §9.3: “minimal polynomial divides `X^m − 1`” | Repaired. I₂ over 𝔽₃ has minimum X−1, characteristic polynomial (X−1)² and order 1. |
| R06 | §9.3: “representations factoring through that same quotient” | Repaired. Trivial and quadratic-mod-17 characters agreeing at 2 are separated at 3; the common quotient sees both classes. |
| R06 | §1.1: “continuity and open kernel are equivalent” | Repaired. A discontinuous finite-image homomorphism fails the stated open-kernel condition. |
| R07 | §1.5: “for nonzero `W`”; separate zero case | Repaired. Induction of zero still has zero space and kernel all of G, unlike the core formula for nonzero induction. |
| R08 | §7.3: “No action on normalized root numbers is specified by an automorphism of the character field alone.” | Repaired. For χ(2)=i mod 5, W=0.8506508084+0.5257311121i; an automorphism fixing χ and i can change the chosen square root, so unnormalized algebraic identities cannot imply the removed assertion. |
| R09 | §6.2 uses an invariant symmetric or alternating form; §7.2: “for irreducible” | Repaired. 1⊕1 is orthogonal with indicator 2; χ⊕χ̄ is self-dual with indicator 0. |
| R10 | §6.4: “the unramified quadratic extension” | Repaired. ℚ₂(√−3) has root number 1; ℚ₂(i) has i in the database convention. |
| R11 | §6.5: “ε/\|ε\|” and the characteristic-zero extension citation | Repaired as to the weight defect. The split Tate half-twisted epsilon is −√11, whose phase is −1, not a number of modulus √11. |
| R12 | §8.3: “a fixed complex embedding” | Repaired. The S₃ Artin field has signature (0,3); its chosen-conjugation fixed cubic has (1,1). |
| R13 | §6.3: pull back the real “Pin⁺” extension, then map to the local Brauer group | Repaired ownership. The real double cover, discrete extension class and continuous-cohomology bridge have named inputs; the representation-specific comparison is now a target. A sign line has w₂=0, two sign lines have w₁². |
| R14 | §2.4: “Prove existence and uniqueness”; AL.3.10.3 for equal characteristic | Repaired ownership. Higher-rank characteristic-zero construction is explicitly here; the equal-characteristic supplier actually has the required target. Zero rank gives ε=1, a tame line has exponent 1+n(ψ). |
| R15 | conventions/§7.7: “for `d ≤ 5`” | Repaired. Completed PolynomialGaloisGroups Layer 6 supplies those labels; no later revision is needed for an 8-dimensional container because that label is excluded from construction here. |
| R16 | §7.8: local-polynomial recovery only with constancy on cycle-type fibres | Repaired. The two nonidentity C₃ classes have the same cycle type but polynomials 1−ζ₃X and 1−ζ₃²X. |
| R17 | Lean preamble `module` / `public import` and explicit declarations | Repaired. Worker targeted build and independent direct elaboration succeed. |
| R18 | §8.3: “for every `b` ... an integer `m ≥ 1`” | Repaired. b=1/d gives A(db)=dA(b) and m=d; nonrational b retains all α(b). |
| R19 | §4.4: “Under the explicit hypothesis that the meromorphic continuation is analytic at every `s ≠ 1`” | Repaired. The supplied card requires finite polar support; conjectural holomorphy gives support within {0,1}. |
| R20 | Scope: “adapters to AdelicAlgebraicGroups AA.2.4” | Repaired. The all-prime factors and induction formalism are imported, with carrier/polynomial comparisons retained here. |
| R21 | §9.1: “In characteristic 2, instead require the chosen complex conjugation to act nontrivially” | Repaired. C₃'s degree-2 irreducible over 𝔽₂ splits over 𝔽₄ although determinant at conjugation is 1=−1. |
| R22 | Lean:44–47, `[FiniteDimensional ℂ V]` in ArtinRep's own parameters | Repaired. All 15 elaborated signatures checked; none silently lost a required section binder. |
| R23 | Lean:124, `dedekindZeta_eq_prod_artinLSeries_pow` | Repaired. Every irreducible occurs, with exponent its degree: S₃ gives 1,1,2 and total dimension 6. |
| R24 | Lean now contains nine admitted headline theorems and six supporting declarations | Repaired. The earlier boundary/API declarations are gone. No new theorem closed in the one-tactic probe. |
| R25 | All nine layers now end with “Examples” and “Dependencies” | Partly repaired. Per-target locators and definition Checks still need R06; the earlier missing layer endings and declaration docstrings are fixed. |

No supplied repair report designates any of these findings “not actionable in this package”; none is re-raised against such a settlement.

### Gate, signatures and headline inventory

The worker's gate at the reviewed head reports every scanner, dependency check and targeted build passing. In particular `build=0`, `outside-folder=0`, `stray-files=0`, `sorry-data=0`, `set_option=0`, `imports=0`, and final `OK`. The independent dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1545 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The head matches the requested commit; the diff outside this folder is empty and the worktree remains clean. The direct `lake env lean` elaboration succeeded with nine `sorry` warnings and no other diagnostic. The separate signature file checked `#check @name` for all 15 declarations; comparison with the prose found no dropped binder. No statement or file was changed by these checks.

The nine admitted theorems are finite Galois Artin field/degree, finite Galois factorization, semisimplicity, character recognition, Dedekind zeta factorization, meromorphic continuation with orders at 0 and 1, abstract Klein classification, rank-one holomorphy, and common-finite-quotient Frobenius recognition. A scratch copy tried `simp`, `rfl` and `infer_instance` as closing tactics on each; zero of nine closed. Reading their pinned inputs did not identify a single-lemma wrapper to delete. The missing conjugacy headline is R04.

The remaining README headlines are the completed functional equation, conductor–discriminant formula, local/global root-number identities, orthogonal obstruction formula, elliptic root-number formulas, the weight-one dictionary and Stark comparisons. The docstring names their missing conductor, epsilon, newform-comparison or regulator carriers. No free predicate or sorry'd data substitutes for them. The finite inertia projector is an actual definition on native representations, not an assumed local-polynomial API: its zero-eigenspace contributes 1 after polynomial reversal. Its denominator is nonzero because inertia is a nonempty finite group in characteristic zero.

### Computed adversarial table

Each row records actual values or a concrete true/false outcome for the named statement. Tests use arithmetic Frobenius unless a row explicitly switches it. The number-field and characteristic-zero hypotheses exclude zero rings, inseparable number-field extensions and residue cardinality 1; the arbitrary-field carrier is separately tested in imperfect characteristic. “Retain” records no defect found in that test, not a proof by examples.

| Statement | Instance | Values on the two sides / wrong-model control | Result; change |
|---|---|---|---|
| §1.1 carrier, continuity/open kernel/finite image | Zero representation; a finite quotient C₂ | Image orders 1 and 2; kernel indices 1 and 2; open in both cases. An arbitrary discontinuous finite-image map has finite image but fails continuity/open kernel. | Retain explicit continuity. |
| §1.1 comparison with jointly continuous action | Trivial action on ℂ; scalar action by −1 of C₂ | Both action maps continuous; identity and −identity are continuous operators. Operator continuity alone imposes no continuity in the group variable. | Retain additional field in ArtinRep. |
| §1.2 Artin field and finite degree | Trivial action over 𝔽₂(t) | Separable fixed field is F, degree 1=image order 1; full algebraic fixed field contains all t^(1/2ⁿ), so would not be finite. | Retain repaired intersection. |
| §1.2 faithful finite quotient | χ₋₄ over ℚ; zero representation | Degrees 2 and 1 equal image orders 2 and 1. Kernels in the respective quotient actions are trivial. | Retain. |
| §1.2 actual finite factorization | Inflate χ₋₄ through ℚ(ζ₈) | Restriction C₂×C₂→C₂ has kernel order 2; χ after restriction still has image order 2. An arbitrary zero map would produce image 1. | Retain actual restriction map. |
| §1.3 semisimplicity | C₂ on ℂ² by diag(1,−1) | Two invariant lines, dimensions 1+1=2; projections (1±g)/2 have ranks 1 and 1. | Retain. |
| §1.3 irreducibility/character pairing | S₃ standard character (2,0,−1) | (4+3·0+2·1)/6=1; permutation character (3,1,0) has pairing (9+3)/6=2. | Retain irreducibility distinction. |
| §1.3 character recognition | S₃ standard; 1⊕sgn | Characters (2,0,−1) versus (2,0,2): agree at transpositions but differ at 3-cycles; not isomorphic. | Retain equality on every class. |
| §1.4 direct sum | χ(g)=i, χ∨(g)=−i | Trace i−i=0; determinant i(−i)=1. | Retain. |
| §1.4 tensor/twist | χ(g)=i; trivial 2-dimensional space twisted by χ | Tensor-square trace i²=−1; determinant of twisted 2-space i²=−1=det(1₂)χ². | Retain. |
| §1.4 dual | χ(g)=i | Inverse and conjugate both −i, different from i. | Retain dual/inverse convention. |
| §1.4 symmetric/exterior squares | The same line; zero space | Sym² trace (−1−1)/2=−1; wedge² trace (−1+1)/2=0. Zero trace 0, determinant of wedge⁰ 1. | Retain; division by 2 is legitimate over ℂ. |
| §1.5 restriction | S₃ standard restricted to C₃ | Eigencharacters ζ₃,ζ₃²; traces at a generator ζ₃+ζ₃²=−1. | Retain. |
| §1.5 induction/character/degree | Ind from C₃ of ζ₃ into S₃ | Degree 2=[S₃:C₃]·1; character (2,0,−1). | Retain. |
| §1.5 induction kernel | Nonzero trivial C₂-module induced to S₃; zero module | Nonzero permutation action kernel core(C₂)=1; zero induced action kernel S₃≠core(C₂). | Retain nonzero hypothesis. |
| §1.6 field of values/Galois orbit | Faithful C₃ line; S₃ standard | Fields ℚ(ζ₃) and ℚ, degrees 2 and 1; orbit sizes 2 and 1. | Retain. |
| §1.6 virtual characters/Brauer | S₃ standard | Ind(C₂,1)−1 has values (3,1,0)−(1,1,1)=(2,0,−1); dimension 3−1=2. | Retain negative coefficients. |
| §2.1 inertia/wild invariants | Unramified line; tame quadratic at odd p; χ₋₄ at 2 | Dimensions (dim Vᴵ,dim Vᴾ)=(1,1),(0,1),(0,0). Unramified/tame outcomes (T,T),(F,T),(F,F). | Retain; complete the vague restriction API in R06. |
| §2.1 zero representation | V=0 | Both fixed spaces equal V=0; both unramified/tame predicates true. | Retain: equality with the whole space, not positive dimension. |
| §2.2 polynomial and lift independence | Unramified χ with χ(Φ)=ζ₃ | P=1−ζ₃X; changing lift by inertia leaves it unchanged. Geometric lift instead gives 1−ζ₃²X. | Retain arithmetic convention. |
| §2.2 ramified polynomial | Nontrivial ramified line | Vᴵ=0, P=1, degree 0, local Euler factor 1. Full-space determinant would have degree 1. | Retain all-prime definition. |
| §2.2 finite projector definition in Lean | 1⊕ramified quadratic, inertia generator diag(1,−1) | Average diag(1,0); projected Frobenius charpoly X(X−1), reverse 1−X; invariant-space determinant 1−X. | Retain. |
| §2.2 rank-zero and denominator | V=0; inertia trivial | Empty determinant 1; inverse of inertia cardinality 1; no 0/0. | Retain. |
| §2.2 Euler-factor evaluation/nonvanishing | q=2,s=2, trivial line | P(1/4)=3/4, inverse 4/3; q=1 would give denominator 0 but is not a finite residue-field cardinality. | Retain hypotheses. |
| §2.3 conductor comparison | χ₋₄ at 2; tame quadratic | a=2=codim 1+Swan 1; tame a=1=1+0. Unramified line a=0. | Retain supplier ownership. |
| §2.4 local-constant normalization | 0 and trivial line, conductor-zero ψ/self-dual measure | ε(0)=ε(1)=1; W=1/1=1. Positive measure rescaling a gives ε(1)=a and W=a/a=1. | Retain. |
| §2.4 additive-character change | χ₋₄ at 2, b=−1 | W(ψ)=−i; detχ(−1)=−1; W(ψ̄)=i=(−1)(−i). | Retain. |
| §2.4 dual product | Same quadratic character | (−i)²=−1=χ(−1); local self-duality does not force W=±1. | Retain. |
| §2.4 dimension-zero induction law/λ | ℚ₂(i)/ℚ₂, trivial inducing line | In database convention W(Ind1)=i, W(1 upstairs)=1, λ=i; general induction factor is i¹·1=i. | Retain λ; no uncorrected local induction claim. |
| §2.4 Weil–Deligne monodromy | Split Tate representation at q=11 | Half-twisted epsilon −√11; phase −1. Zero monodromy quotient would contribute determinant 1 instead. | Retain. |
| §2.4 equal-characteristic comparison | Nontrivial Artin–Schreier line over 𝔽₂((t)), break 1 | Swan 1, invariant codimension 1, a=2; norm-twist exponent 2+n(ψ), not 1+n(ψ). | Retain AL.3.10.3 contract. |
| §3.1 global local polynomial | χ₋₄ at 2,3,5 | P₂=1, P₃=1+X, P₅=1−X; constant terms all 1. | Retain. |
| §3.1 degree/unramified iff | 1⊕χ₋₄ at 2, rank 2 | P=1−X has degree 1<2, so ramified; at 5, (1−X)² has degree 2. | Retain both directions. |
| §3.2 induction including ramification | Ind from ℚ(i) of 1 | At 2:1−X; at 3:1−X²; at 5:(1−X)². RHS products over primes upstairs give the same three polynomials. | Retain ramified prime 2. |
| §3.3 n₊,n₋/trace/parity | c=diag(1,−1); c=−I₂; zero | (n₊,n₋)=(1,1),(0,2),(0,0); traces 0,−2,0; determinants −1,1,1. | Retain parity from determinant. |
| §3.3 finiteNPlus | Totally real presentation, real base place | No ramified infinite place; returns full rank 2, equal to dim ker(1−1). Imaginary quadratic sign line gives 0. | Retain fallback. |
| §3.4 Euler product/convergence | Trivial line over ℚ at s=2; zero | ζ(2)=π²/6; zero product=1. Factors 1/(1−p⁻²) and 1 respectively. | Retain Re(s)>1. |
| §3.4 direct sum/induction | 1⊕χ₋₄ | Product ζ(s)L(s,χ₋₄)=ζ_{ℚ(i)}(s); factors at 2,3,5 are reciprocals of 1−X,1−X²,(1−X)². | Retain. |
| §3.4 full irreducible factorization | S₃ regular representation, 3-cycle | Exponents 1,1,2; 1²+1²+2²=6. Local denominator (1−X)²(1+X+X²)²=(1−X³)² on both sides. | Retain Lean headline. |
| §3.4 trivial extension | L=F | Exactly one degree-1 irreducible; zeta product has one factor ζ_F, not an empty product. | Retain. |
| §3.5 global conductor/analytic conductor | χ₋₄; zero; trivial line over ℚ(i) | Ideals (4), (1), (1); analytic conductors 4,1,4 respectively, since base discriminant contributes 4¹. | Retain base-discriminant power. |
| §3.6 torus comparison | Split rank 2 torus at q=2,s=1 | Local factor (1−1/2)⁻²=4; rank zero gives 1. | Retain AA specialization, not a new factor theory. |
| §4.1 continuation and uniqueness | Zero; trivial ℚ line | Continuations 1 and ζ; orders at 1 are 0 and −1. Artificial zero continuation disagrees with Euler product value 1 for zero representation. | Retain germ/normal-form distinction. |
| §4.1 Brauer quotient | S₃ standard | L=ζ_cubic/ζ_ℚ; dimension 3−1=2 and pole order at 1 (−1)−(−1)=0. | Retain meromorphy, not inferred general entirety. |
| §4.2 gamma factors | Real 1⊕sgn at s=2 | Γℝ(2)Γℝ(3)=(1/π)(1/(2π))=1/(2π²)=Γℂ(2). | Retain factor 2 in Γℂ. |
| §4.2 conductor power under induction | ℚ(i)/ℚ trivial line | C upstairs=4 and C downstairs=4; completion powers both 4^(s/2). | Retain. |
| §4.3 global root number/dual | χ₋₄; quartic χ mod 5 | τ(χ₋₄)=2i gives W=1; quartic W≈0.8506508084+0.5257311121i, dual its conjugate, product 1. | Retain unit norm and duality. |
| §4.3 direct sum and global induction; R05 ownership comparison | Ind_{ℚ(i)}^ℚ1=1⊕χ₋₄ | W=1·1=1=W(1 over ℚ(i)); local factors separately can have λ≠1. | Retain global/local distinction. |
| §4.4 order at zero | Zero; trivial ℚ line; χ₋₄; nontrivial even χ₅; odd S₃ standard | Σ archimedean fixed dimensions minus global invariants gives 0−0=0,1−1=0,0−0=0,1−0=1,1−0=1. | Retain. |
| §4.4 complex place | Trivial line over ℚ(i) | One complex-place contribution 1 minus invariant dimension 1 gives order 0, matching r₁+r₂−1=0. | Retain counting a complex place once. |
| §4.4 analytic card | Trivial ℚ line; 1⊕1 | Completed poles have orders 1 and 2 at both 0 and 1; polar supports each {0,1}. | Retain holomorphy premise for general card. |
| §5.1 conductor–discriminant | ℚ(i); ℚ(ζ₅) | Absolute discriminants 4 and 125; products 1·4=4 and 1·5·5·5=125. | Retain. |
| §5.1 nonabelian exponents | S₃ closure of discriminant −23 cubic | Product 1·23·23²=23³, with degree-2 character exponent 2, not 1. | Retain. |
| §5.2 rank-one/Hecke/Dirichlet conductor | χ₋₄; trivial character presented mod 4 | Primitive conductors 4 and 1 on both sides; presentation modulus 4 is wrong for the trivial character. | Retain mathematical identity; R06 locator. |
| §5.2 determinant divisibility | S₃ standard; χ₋₄⊕χ₋₄ | Conductors 23 versus det conductor 23; 16 versus det conductor 1. Divisibilities 23∣23,1∣16. | Retain, equality not asserted. |
| §6.1 product formula | χ₋₄ over ℚ | Standard W∞=i, W₂=−i, other local factors 1; i(−i)=1=global W. | Retain. |
| §6.1 independence of global additive character | Scale χ₋₄'s character by −1 | Real multiplier −1 and 2-adic multiplier −1 give product 1. | Retain global reciprocity. |
| §6.2 orthogonal/symplectic/self-dual | 1⊕1; χ⊕χ̄; Q₈ faithful 2-space | Indicators 2,0,−1; first two admit symmetric forms, third alternating form. Global orthogonal W=1; symplectic bound permits ±1. | Retain form hypotheses, not indicator tests for arbitrary sums. |
| §6.3 obstruction construction | Sign line; sum of two sign lines | Pin⁺ pullback of one reflection splits, w₂=0. Two signs: w₂=w₁∪w₁; rank zero gives 0. | Retain actual extension construction. |
| §6.3 local obstruction formula | χ₋₄⊕χ₋₄ over ℚ₂, standard ψ | W=(-i)²=−1; determinant line trivial W=1; Brauer invariant 1/2 gives exp(2πi·1/2)=−1. | Retain sign and determinant correction. |
| §6.3 one-dimensional/char-2 controls | χ₋₄ line; coefficient map in equal characteristic 2 | Line ratio W(χ)/W(detχ)=1, w₂=0; in char 2, ±1→Kˢ× has both values 1, so image class 0 and exponential 1. | Retain stated characteristic split. |
| §6.4 p-adic field root number | ℚ₂(√−3), ℚ₂(i), ℚ₂(√2) | Database W=1,i,1; fourth powers 1,1,1. Not every quadratic unit extension has W=1. | Retain. |
| §6.4 conjugate-character adapter | ℚ₂(i) | Standard value −i multiplied by χ_disc(−1)=−1 gives database i. | Retain. |
| Worked §6.4 twist law | ℚ₂(i) twisted by ℚ₂(√−3) | a=2: actual i; claimed (−1)i=−i; corrected (−1)²i=i. | **Fail; R02.** |
| Worked §6.4 tame twist control | ℚ₃(√−3) twisted unramified | a=1: actual −i; corrected (−1)¹i=−i. | Retain as companion to R02. |
| §6.5 elliptic multiplicative cases | 11.a2 at 11; 37.a1 at 37 | Split local sign −1, nonsplit +1; real sign −1 gives global +1 and −1. | Retain. |
| §6.5 potentially good, e=6 | y²=x³−p at p=5,7,11 | vΔ=2, e=12/gcd(12,2)=6; (−1/p)=+1,−1,−1. | Retain. |
| §6.5 potentially good, e=4 | y²=x³−px at p=5,7,11 | vΔ=3, e=4; (−2/p)=−1,−1,+1. | Retain. |
| §6.5 residue extension/general q | e=4, q=25 | Quadratic sign of −2 is +1 in 𝔽₂₅, unlike −1 in 𝔽₅. | Retain q, not a prime-only replacement. |
| §7.1 dimension/determinant/parity | 1⊕χ₋₄; −I₂ at conjugation | Dimensions 2,2; determinant −1,+1; trace 0,−2. | Retain even is not equivalent to c acting trivially. |
| §7.2 Frobenius–Schur | C₃ line; S₃ standard; Q₈ faithful | Indicators 0,1,−1. For Q₈: (2+2+6·(−2))/8=−1. | Retain irreducible trichotomy. |
| §7.3 Galois conjugates | C₃ line at generator | χ=ζ₃, conjugate ζ₃²; local polynomials conjugate correspondingly. Character-field conductor 3, rational standard S₃ conductor 1. | Retain; no normalized-W equivariance. |
| §7.4 kernel from character | S₃ standard | χ(e)=2, transposition 0, 3-cycle −1: only e attains trace 2, so kernel 1. | Retain finite-order hypothesis in supplier. |
| §7.4 stem field/minimum | S₃, subgroup C₂ versus A₃ | Indices 3 versus 2; cores 1 versus A₃. Cubic is stem; quadratic is not. Trivial group minimum 1. | Retain. |
| §7.5 projective field/kernel | Faithful C₃ line; S₃ standard; Q₈ faithful | Artin/projective degrees (3,1),(6,6),(8,4); scalar subgroup orders 3,1,2. | Retain. |
| §7.5 norm-of-character criterion | Q₈ faithful representation | χ(±1)=±2 with absolute value 2; χ(±i,±j,±k)=0. Projective kernel exactly {±1}. | Retain; absolute value is essential. |
| §7.5 twist/Galois invariance | Twist Q₈ representation by a character | Scalar multiplication preserves exactly the scalar matrices; projective image remains order 4. | Retain. |
| §7.6 Klein orbit count | C₁,C₂,V₄,A₄,S₄,A₅ | LHS 0,1,3/2,11/6,23/12,59/30; RHS empty sum,2(1/2),3(1/2),1/2+2/3+2/3,1/2+2/3+3/4,1/2+2/3+4/5. | Retain numeric classification. |
| §7.6 exclusivity/cyclic exclusion | D₁ versus C₂; irreducible S₃ standard | D₁ would have order 2 and duplicate C₂; n≥2 removes it. Standard S₃ projective image order 6 is noncyclic. | Retain. |
| §7.6 conjugacy headline | H=⟨−z⟩, K=⟨2−z⟩ | Both order 2; unequal subgroups; conjugation by z+1 sends the generator to 2−z. | **Missing Lean conclusion; R04.** |
| §7.6 dihedral induction | Ind_C₃^S₃ ζ₃ | ψ/ψ^σ=ζ₃² of order 3; projective group D₃ order 6; twisted character order modulo extendible characters is 3. | Retain. |
| Worked tetrahedral example | ρ₀ at an order-3 element | Trace −1, determinant 1, eigenvalues ζ₃,ζ₃²; order 3≠1,2,4 (the possibilities in Q₈). | **Fail; R03.** |
| §7.7 minimal permutation container | S₃ standard | H=C₂ gives invariant dimension (2+0)/2=1, index 3; H=C₃ gives (2−1−1)/3=0, index 2. Minimum 3. | Retain irreducibility. |
| §7.7 degenerate container | Nontrivial C₂ line; trivial line; reducible 1⊕sgn | Minima 2,1,1. The last action's minimal containing permutation representation need not contain the whole reducible representation. | Retain domain restriction. |
| §7.8 cycle type versus class | Faithful character of cyclic cubic field | Two nonidentity Frobenii each give cycle type (3); polynomials 1−ζ₃X≠1−ζ₃²X. | Retain fibre-constancy hypothesis. |
| §7.8 ramified support/local table | S₃ conductor-23 standard | Support {23}; P₂=1+X+X², P₅=1−X², P₂₃=1−X. | Retain all primes. |
| §7.9 intrinsic labels | Trivial line; conductor-23 standard | Prefixes 1.1 and 2.23 are determined; a full orbit/container label contains choices absent from these two numbers. | Retain boundary. |
| §8.1 ArtinHolomorphic/rank-one theorem | 0,1,χ₋₄,1⊕1 | L=1,ζ,Lχ,ζ²; orders at 1:0,−1,0,−2, respectively minus invariant multiplicity. | Retain; add explicit definition Checks in R06. |
| §8.1 completed equivalence | Trivial line; odd nontrivial line | Completed trivial has simple poles at 0,1; completed odd line no poles; multiplicities 1 and 0. | Retain. |
| §8.1 positive induction cases | S₃ standard=Ind_C₃ ζ₃ | Nontrivial Hecke character gives entire L, invariant dimension 0, pole order 0. | Retain monomial case. |
| §8.2 weight-one good-polynomial dictionary | η(z)η(23z), primes 2 and 5 | (a₂,detF₂)=(−1,1), (a₅,detF₅)=(0,−1); polynomials X²+X+1 and X²−1. | Retain both coefficients and arithmetic direction. |
| §8.2 induction oddness | Imaginary quadratic line; real quadratic line with signatures (+,−) or (+,+) | c on induction swaps basis in imaginary case (det−1); real case determinants −1 or +1. | Retain mixed-signature condition. |
| §8.2 self-twist predicates | Irreducible quadratic induction; tetrahedral image | Quadratic induction is unchanged by the nontrivial quadratic character of the inducing field; tetrahedral projective image has no such dihedral self-twist. | Retain; add explicit three Checks in R06. |
| §8.3 S-truncation/order/regulator rank | ℚ trivial character, S={∞}, then {∞,2} | Orders 0 and 1; augmentation-kernel ranks 0 and 1. Extra factor 1−2⁻ˢ has a simple zero at 0. | Retain. |
| §8.3 odd rank-two order | Conductor-23 S₃ standard | n₊=1, global invariants 0, r=1; derivative is leading coefficient, not value L(0)=0. | Retain. |
| §8.3 Chinburg quantifiers | b=1/d, d>0 | d·A(1/d)=A(1); m=d, versus m=1 only under the integral-trace premise. | Retain. |
| §8.3 embeddings | Same S₃ extension | Six embeddings all complex, signature (0,3); fixed cubic signature (1,1), degree 3. | Retain complex embedding. |
| §9.1 finite-coefficient carrier/image | Trivial rank 0; GL₂(𝔽₂) image; a line over 𝔽₄ of order 3 | Orders 1,6,3; indices 1,1,1 in their respective codomains. Field characteristic 2, cardinalities 2 or 4 must not be conflated. | Retain. |
| §9.1 irreducibility/absolute irreducibility | C₃ on 𝔽₂² with polynomial X²+X+1 | No root in 𝔽₂; two roots in 𝔽₄; irreducible true, absolutely irreducible false; det(c)=1=−1. | Retain characteristic-2 exception. |
| §9.2 prime-to-ℓ conductor | 37.a1[2] at 2 and 37 | At 2 inertia C₃ (ramified), top slope 1, but prime-to-2 conductor excludes 2; at 37 tame residual exponent 1 gives conductor 37. | Retain exclusion versus ramification distinction. |
| §9.2 top-slope convention | Unramified; tame ramified; wild break u=1 | Slopes 0,1,2=1+u respectively. | Retain supplier convention. |
| §9.2 residual conductor reduction | 11.a2[5] versus [3] at 11 | vΔ=5; inertia parameters 0 mod 5 and 2 mod 3; a₁₁=0 and 1. | **Worked value fails; R01.** |
| §9.3 matrices/order/minimum | I₂ over 𝔽₃ | Trace 2, det 1, order 1, minimum X−1, charpoly (X−1)²; minimum divides X¹−1, charpoly does not. | Retain repaired minimum-polynomial claim. |
| §9.3 image-internal generators | Transvection T over 𝔽₂ | Image {1,T} has size 2; its own conjugacy class {T} generates 2. Ambient conjugacy class has 3 transvections and generates 6. | Retain image-internal classes. |
| §9.3 recognition | Trivial and quadratic character modulo 17 | At p=2 both values 1; at p=3 values 1 and −1. One prime exhausting the trivial image cannot recognize the second representation. | Retain common quotient and all-but-finite set. |
| §9.3 semisimplicity needed | C₂ over 𝔽₂, trivial 2-space versus unipotent Jordan block | Both charpolys (X+1)² on every element; generator matrices have ranks of T−I equal 0 and 1, so not isomorphic. | Retain both semisimple hypotheses. |
| §9.3 rank-zero recognition | n=0 | Characteristic polynomial 1; unique zero representation; isomorphism exists. | Retain boundary admitted by headline. |
| §9.4 projectivization | Full GL₂(𝔽₃); scalar C₃ line over 𝔽₄ | Orders 48/2=24 and 3/3=1; projective kernel field degrees 24 and 1. | Retain. |
| §9.5 torsion origin/determinant | 11.a2[5], p=3,7,31 | Point counts give aₚ=−1,−2,7; reductions of X²−aₚX+p are (X+2)(X+4),(X+3)(X+4),(X+4)². Determinants 3,2,1. | Retain polynomials; conductor correction R01 independent. |
| §9.5 mod-2 elliptic example | 37.a1, p=3,5,7,11 | Point-count aₚ=−3,−2,−1,−5; parity gives charpolys X²+X+1,(X+1)²,X²+X+1,X²+X+1. | Retain. |
| Worked mod-2 table through 59 | 37.a1 at 13,17,19,23,29,31,41,43,47,53,59 | aₚ=−2,0,0,2,6,−4,−9,2,−9,1,8; odd precisely 41,47,53 in this list, agreeing with order-3 entries. | Retain. |
| Worked mod-2 discriminant | 4x³−4x+1; X³−4X+2 | Discriminants 592=16·37 and 148=4·37; second polynomial Eisenstein at 2. | Retain tame cubic at 2. |
| Source realization, not a roadmap target | Beauville Prop.1.1's cyclic matrix at r=2 | ζ=−1, λ=−2, matrix [[−1,−1],[1,1]], determinant 0; it is not a PGL element. | Source error recorded below. |

### Seeded source sample

All 15 requested targets were visited. Exact published numbering is certified only where the actual text was readable; a mathematically successful test does not certify a missing locator. No README locator was explicitly flagged “unverified”; the remaining uncertified bibliography items are nevertheless accounted for below. All fetching used the sources service. No source material was placed in the PR.

| Sampled target | Text and locator examined | Outcome |
|---|---|---|
| 1.4 Operations and their characters | Serre, *Linear Representations*, §§2–3, 7,13.2: publisher-only. Native `char_tensor`, `char_dual`, `char_iso` read at the pin; the CharacterTheory supplier's symmetric/exterior-square ownership checked. | The displayed formulas pass the i-valued-line test. Serre page/theorem attribution remains uncertified; no exact local locator is supplied for each operation (R06). |
| 2.1 Inertia invariants and predicates | Serre, *Local Fields*, IV §§1–3 and VI §§1–3: publisher-only. Native inertia/wild-inertia and imported filtration interfaces inspected. | Unramified, tame and wild examples discriminate the predicates. The phrase “expected ones” does not give a checkable restriction comparison (R06). |
| 2.2 Local polynomial/Euler factor | [Deligne 1973](https://publications.ias.edu/sites/default/files/Number20.pdf), §3, Proposition 3.8 and §3.9, printed pp.530–531 (`deligne1973` lines 750–825); [Martinet author copy](https://jamartin.perso.math.cnrs.fr/AlgNT/durham1.pdf), local factors pp.8–10 (`martinet1977` lines 193–242). | Inertia invariants, finite-image hypotheses and ramified factors are supported. Deligne's Frobenius convention must be converted, as the roadmap now requires. Neukirch VII(10.1) itself remains uncertified. |
| 3.1 Global local polynomials | `martinet1977` lines 193–242, author-copy pp.8–10; AdelicAlgebraicGroups AA.2.4, artin-local-factors, lines 1996–2048. | Choice-independence and the inertia-fixed factor include ramified places. The author-copy pagination is not certified as the printed Durham volume's pagination. |
| 3.2 Induction/local polynomial | `deligne1973` Proposition 3.8, printed pp.530–531, lines 750–825; `martinet1977` lines 222–231. | The residue-degree substitution and induction formalism are supported. Tested unramified and ramified ℚ(i)/ℚ primes; no “good primes only” repair was accepted. |
| 3.4 Euler product | `martinet1977` lines 217–242, author-copy pp.9–10, including convergence half-plane and regular-character consequence; pinned zeta Euler product and AA.2.4. | Re(s)>1 and complete irreducible factorization supported. Neukirch VII(10.4)–(10.5) numbers remain uncertified behind the publisher boundary. |
| 5.2 Rank-one conductors | Neukirch VII §11 and Serre VI: publisher-only; ArithmeticGaloisRepresentations §§3.2–3.5 and ClassFieldTheory Layers 7,11 read as the actual suppliers. | Primitive versus presentation conductor and finite part versus full modulus pass the examples. A precise source theorem/page is still absent at this target (R06). |
| 6.1 Product formula | Tate 1979 §§3–4 could not be read; `deligne1976` §1.6, printed p.301, lines 111–122, verifies the orthogonal global application; `martinet1977` lines 393–433 verifies completion/induction, not the entire general local-product theorem. | Orthogonal special case and χ₋₄ normalization verified. The requested full Tate locator is **not certified** from these substitutes. |
| 6.3 Orthogonal obstruction | [Deligne 1976](https://publications.ias.edu/sites/default/files/Number26.pdf), §§1.3–1.6, Theorem 1.5, printed p.301 (`deligne1976` lines 84–122). | The theorem is for real virtual representations of dimension 0 and determinant 1. Subtracting det(V) and dim(V)−1 trivial lines gives precisely the roadmap's determinant correction; its degree-two class remains w₂(V). The characteristic-2 coefficient map is trivial. |
| 7.5 Projective image/field | [LMFDB projective-image knowl](https://www.lmfdb.org/knowledge/show/artin.projective_image), `lmfdb` lines 90–92; `lmfdb` artin source lines 221–244; pinned Values.lean:336. | The quotient-image definition and scalar-character criterion are supported. The source distinguishes stored projective-field data from a canonical polynomial. |
| 7.7 Smallest permutation container | LMFDB artin source `smallest_gal_t`/`container`, `lmfdb` lines 256–271; pinned Frobenius reciprocity and the named induction supplier. | The source reads a label; it does not prove the variational minimum. The mathematical equivalence passes the S₃ test, but the exact LMFDB definitional knowl was not located. The attempted knowl returned 404. |
| 7.8 Ramified primes/cycle type/table | LMFDB artin source `is_ramified`, `lmfdb` lines 273–274; local-factor source as above; Completed PolynomialGaloisGroups, factorization and low-degree-label sections. | Supports intrinsic ramification and stored local factors. Cycle-type recovery requires the added fibre-constancy condition; cyclic cubic example verifies why. Generic `artin.*` is not an exact knowl locator (R06). |
| 8.2 Weight one | [Deligne–Serre 1974](https://www.numdam.org/item/ASENS_1974_4_7_4_507_0/), Thm.4.1 pp.513–514 and Thm.4.6 p.514 (`deligneserre1974` lines 262–298). | 4.1 requires a nonzero weight-one eigensystem with odd nebentypus and gives arithmetic traces/determinants; irreducible iff cuspidal. 4.6 requires primitive cuspidal input for exact conductor and full L-equality. The reverse direction is supplied separately, not attributed to Deligne–Serre. |
| 9.3 Frobenius/recognition | [LMFDB mod-ℓ display source](https://github.com/LMFDB/lmfdb/blob/master/lmfdb/modl_galois_representations/web_modlgal.py), `lmfdb` lines 200–219; ArithmeticGaloisRepresentations §5.3, lines 3194 onward. | Source displays trace, determinant, order and characteristic polynomial, omitting primes dividing ℓ·conductor. It does not prove a finite recognition bound. The repaired common-quotient theorem has semisimplicity and all-but-finitely-many primes. |
| 9.5 Origins/invariant suite | Same mod-ℓ source, lines 89–123, 200–219; ArithmeticGaloisRepresentations §6.3, lines 3873–3880 and 3946–3956; LMFDB curve record line 253. | The torsion construction and determinant/Frobenius comparisons pass; the residual conductor example fails R01. Website code is evidence of the database display, not a replacement for a mathematical theorem source. |

Additional source checks: Deligne 1973 Theorem 4.1, pp.535–536 (`deligne1973` lines 901–920), states the local-constant axioms; its §§4.10–4.12 (`deligne1973` lines 1080–1160) support the finite-inertia extension route. Rohrlich 1994 §12, pp.144–146 (`rohrlich1994` lines 843–925), defines the phase and gives orthogonal/symplectic restrictions. Sections 13 and 19, pp.147 and 153–154, were read for the monodromy and elliptic comparisons. [Rohrlich 1996](https://www.numdam.org/item/CM_1996__100_3_311_0/), Theorem 2 and proof pp.329–332 (`rohrlich1996` lines 612–692), treats finite extensions of ℚₚ, so the repair is not confined to ℚₚ itself; several displayed formulas have imperfect extraction and are not claimed as fully transcription-certified. The equal-characteristic extension is a proposed argument using the explicitly named local-factor supplier, not a claim that this characteristic-zero theorem covers it.

[LMFDB's local-field root-number knowl](https://www.lmfdb.org/knowledge/show/lf.root_number), `lmfdb` lines 90–108, gives the −i real-sign convention; [Jones–Roberts preprint](https://arxiv.org/abs/math/0309309v1), §3.3 p.5 (`jonesroberts2006` lines 226–228), records the fourth-root-of-unity invariant. The preprint's numbering was not silently identified with the published version. [The Stark-unit knowl](https://www.lmfdb.org/knowledge/show/cmf.stark_unit), `lmfdb` lines 90–96, supports the full weighted b/m quantifiers now written in §8.3; it does not certify the inaccessible Chinburg proof.

### Pinned declarations and duplication by object

Pins inspected: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Searches used the mathematical objects (invariants, finite quotients, character equality, scalar action, induction, epsilon constants, obstruction extensions and projective subgroups), not just the roadmap's proposed names. The following is the central declaration evidence, with library-relative file locations:

| Object | Opened declaration at the pin | Consequence for this review |
|---|---|---|
| Continuous linear action | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`, `ContRepresentation`; :72, `toRepresentation` | The sole structure datum is a homomorphism into continuous linear maps. It does **not** assert continuity in the Galois variable. ArtinRep's additional continuity field is necessary. |
| Character operations | `Mathlib/RepresentationTheory/Character.lean:63`, `char_one`; :68, `char_tensor`; :74, `char_iso`; :93, `char_dual` | The finite-dimensional trace identities are native inputs, not new API theorems to admit. The dual uses g⁻¹. |
| Maschke | `Mathlib/RepresentationTheory/Maschke.lean:179` | The instance needs a finite group and invertible group order. G_F need not be finite, so the Artin theorem still needs its finite quotient; it is not closed by the native instance alone. |
| Imperfect fixed fields | `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:277`, `mem_perfectClosure_iff_fixed`; separable correspondence at :266 | The full fixed field in the algebraic closure is a perfect closure. The repaired separable intersection is essential. |
| Frobenius at every finite prime | `TauCeti/NumberTheory/NumberField/Frobenius.lean:67`, `exists_isArithFrobAt` | Applies at a nonzero prime in a finite Galois number-field extension, including ramified primes. The finiteLocalPolynomial fallback is unreachable on its intended inputs. |
| Full irreducible family | `TauCeti/RepresentationTheory/CharacterTable/Table.lean:244`, `characterDegree`; :248, `irreducibleRepresentation` | Indexed by Fin(card conjugacy classes); the acceptance theorem includes the trivial character and all degree powers. |
| Character detects kernel | `TauCeti/RepresentationTheory/CharacterTable/Kernel.lean:115`, `Representation.mem_ker_iff_char_eq`; :130, FDRep version | Requires finite order of the element. Apply on the finite image, not to an arbitrary operator. |
| Character detects scalars | `TauCeti/RepresentationTheory/CharacterTable/Values.lean:336`, `FDRep.exists_apply_eq_smul_of_norm_char_eq_finrank` | Gives an actual scalar with μ^(orderOf g)=1 for finite G; supports §7.5. |
| Frobenius–Schur trichotomy | `TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Trichotomy.lean:412`, :428, :443 | These statements retain irreducibility in their context. They do not identify arbitrary orthogonal representations by indicator 1. |
| Extension class | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean:120`, `FactorSet.cohomologyClass`; :363, `GroupExtension.cohomologyClass_factorSet_eq` | Section-independence has the actual induced-action and normalized-section premises. The target explicitly uses a small finite model for this pinned cohomology interface. |

The 26 names flagged by the worker's citation resolver were treated as search leads, not missing-declaration findings. Own declarations, intended supplier targets and database keys are not absent pinned lemmas merely because that resolver cannot identify them. No collision with any of the 15 fully qualified names in the readable roadmap heads was identified. No new sorry'd API catalogue remains.

### Resolved roadmap contracts and order

The supplied main checkout was used for existing roadmaps, including Completed entries; open revisions of an existing roadmap were not promoted into prerequisites. New suppliers were read through `roadmaps show` at their available heads. The LFunctions main version was checked separately from the tool's open-head rendering. Two completed shape examples, LocalGaloisGroups and Chebotarev, and the GeneralizedCohomology build shape were consulted.

| Supplier and resolved location | Contract checked |
|---|---|
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:850`, F.4.0 | Finite-projective jointly continuous representation, Iso, rank-one and base-change carriers. ArtinRep is the finite-dimensional complex specialization plus the finite-image consequences. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:956`, §1.4 | No-small-subgroups/open-kernel input, not the false implication from finite image alone. |
| Same, :1807 and :2086, §§2.4–2.7 | Weil–Deligne carriers and dual/Frobenius adapter; arithmetic character constants, not a ready-made general higher-rank complex local-constant theorem. |
| Same, :2498–2771, §§3.1–3.6 | Swan/Artin/global/prime-to-ℓ conductors, functoriality, induction and reduction. §3.6 allows residual conductor to drop; R01 uses this distinction. |
| Same, :2844,:2970,:3148,:3194,:3329 | Oddness and characteristic 2, finite-characteristic Dickson classification, Frobenius density/recognition and finite-field realization. |
| `TauCetiRoadmap/LFunctions/README.md:346,:730,:859,:929` on main | Completed card with finite polar divisor, normal-form/germ uniqueness, primitive Dirichlet/Hecke functions and imprimitive Euler corrections. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1996`, AA.2.4 | All-prime Artin factors, direct sums, induction and Artin–Hecke comparison. Its convergence-factor specialization begins :2078 on character lattices; general continuation here also explicitly uses LFunctions and Brauer induction. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2325`, AL.3.10.3 | Equal-characteristic local Galois/Weil–Deligne constants and conductor-compatible norm twisting, before the global converse theorem. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2242,:2282,:2290`, R17.5.1,.6–.10 | Dihedral/tetrahedral/octahedral/solvable automorphy and odd weight-one consequences. Its declared `gap:weil-local-constants` and `gap:artin-functional-equation` are contracts with ArithmeticGaloisRepresentations, not proofs present in that supplier today. Their absence is not raised as a finding. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1419`, §2.10 | Weight-one representation with arithmetic polynomial X²−aₚX+ψ(p); cuspidal/primitive requirements are preserved in the dictionary. |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:486,:640`, §§1.2,1.9 | Automorphic Artin predicate and totally odd rank-two theorem over totally real fields. Its entirety theorem excludes the trivial character; the roadmap's implication must use its rank-one trivial case when necessary. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1422,:1559,:1599`, §§2.31,2.39,2.41 | Near-line-one input, Heilbronn/Aramata route, and the full ArtinHolomorphy predicate. No general Artin conjecture is imported as proved. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:920,:1312,:1505,:1683,:1724,:1799` | Layers 5,7,9,11–13: actual local Brauer invariant, reciprocity/Frobenius, Weil group, global reciprocity/existence and conductor comparison. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:1575`, G5 item 4; `Completed/OrthogonalSpinGroups/README.md:152–169`, Layer 1 | Genuine real Pin⁺ extension and twisted vector action; reverse norm gives +Q(v), star norm gives −Q(v). The sign distinction needed for w₂ is explicit. |
| `TauCetiRoadmap/ProfiniteCohomology/README.md`, Layers 2–3,6,8–9 | Explicit H², continuous/discrete comparison, inflation, cups and separable-closure coefficients. Its index-two signed-permutation application at :2322 is not the general orthogonal local-constant comparison. |
| `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md`, Layers 4,7; `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`, Layers 2,6,7 | Cyclotomic values/Galois action, indicator and squares, induction/reciprocity/Brauer and projective representation theory. The roadmap uses finite-level adapters. |
| `Completed/LocalFieldsRamification/README.md:576,:724`, Layers 2–4; `Completed/LocalGaloisGroups/README.md` conventions | Frobenius, lower/upper filtration, wild/tame quotient, local Galois notation. |
| `Completed/NumberFieldArithmetic/README.md:615,:1086,:1290`, Layers 2,4–6 | Artin symbols, relative discriminant, completions/decomposition and ramification groups. |
| `Completed/Chebotarev/README.md:416,:622` | Dirichlet and natural density, supporting actual Frobenius-class occurrence. |
| `Completed/PolynomialGaloisGroups/README.md:205–210`, Layer 6 | Transitive labels only through degree 5; no proposed later enlargement imported. |
| `TauCetiRoadmap/PadicExtensionFamilies/README.md:966`, §2.7 | Galois-closure top slope: 0 unramified, 1 tame, 1+largest upper break wild. |
| `TauCetiRoadmap/ModularForms/README.md:532`, Layer 4 | Newforms/primitive forms/conductor and nebentypus; downstream arithmetic attachment is supplied separately. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15102`, §7.30 | Existing finite-character analytic completion/root-number interface and its own supplier contract; the claimed downstream direction is wrong (R05). Tame algebraic Gauss-sign applications are a separate part of that section. |

The open-work object search also located `TauCetiRoadmap/McKaySkewGroup/README.md:365–465`: its finite SL₂/SU₂ binary-group classification and SO₃ rotation route overlap in background with Klein's projective theorem. It is later in the order (ArtinRepresentations at 178, McKaySkewGroup at 291). ArtinRepresentations is the earlier owner of the PGL₂ theorem; it must not add McKaySkewGroup as an upward supplier. The binary lifts and concrete quaternion models remain the latter's distinct targets. There is no fully qualified declaration collision. The distinction, and reuse of the earlier projective theorem by later consumers, should remain explicit as those roadmaps develop.

Main, the named open checkouts and the board's package material were searched by object. This is not a claim to have reviewed unrelated roadmaps. No additional supplier cycle or outside-folder edit was found. The present roadmap declares no supplier gaps of its own.

## Not verifiable

These are source-access or attribution limits, not guessed source contents. They do not suspend the verdict or excuse R01–R05.

- `neukirch1999`: *Algebraic Number Theory*, VII §§8,10–12, including (10.1),(10.4),(10.5),(11.4),(11.7),(11.9),(12.6). The sources service classified the Springer DOI as paywalled. Those exact theorem/page locators are uncertified, although several statements were independently checked against accessible Deligne/Martinet text and the actual supplier contracts.
- `serrerep` and `serrelocal`: both Springer books were publisher-only through the service. The named sections were not certified against the text. Native finite-group/ramification declarations do not certify a textbook page number.
- `tate1979`: the DOI resolved to an access gateway rather than legal readable text. The full §4 product-formula passage was not read; Deligne 1976 certifies only the orthogonal consequence used above.
- `tate1984`: the service's bibliographic search found no readable text. The exact I.3.4, I.5.1/I.5.3 and I.7.1–7.3 Stark-regulator/order/functoriality locators remain unverified. The algebraic examples and the LMFDB Chinburg equations are independent, narrower checks.
- `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`: publisher-only citations, respectively Elsevier, Springer and Elsevier. No attempt to bypass access controls. Deligne 1976 supplies a readable derivation of the orthogonal global theorem; the Chinburg primary argument and Halberstadt tables remain uncertified.
- `frohlich1985`: bibliographic resolver found no readable text. The additional Stiefel–Whitney exposition was not checked; Deligne 1976's theorem and the roadmap's actual pullback construction were checked instead.
- `klein1884`: bibliographic resolver found no readable text. Beauville's explicitly cited version supplies the classification and conjugacy statement, so the missing nineteenth-century text does not leave that headline without readable support.
- `lmfdb`: projective-image, local-root-number, Stark-unit, curve and both code sources were readable. The guessed minimum-container knowl was 404, and the mod-ℓ landing page redirected to a gate. No exact `artin.*`/`modlgal.*` locator was available for every claimed database invariant. The source-code checks above are explicitly limited to what those files say. No scraped display is treated as a theorem proof.
- Martinet's author copy and Jones–Roberts's arXiv version were read with their own page/line numbering; equality with the cited published pagination was not established. Rohrlich's 1994 OCR is usable for the phase definition and surrounding proof, but distorted displayed formulas were not silently certified. Rohrlich 1993 was fetched; the bibliography gives no separate target-level locator to certify there.

The outstanding reference-request file was consolidated under the existing work identifiers; successful fetches and duplicate website keys were removed. Uncertified publisher citations were not requested again. No manifest was edited.

## Source issues

- **Error** in beauville2009 at Proposition 1.1 proof, cyclic and dihedral cases, p.2: the source says its displayed homography realizes the cyclic generator for every r; it should handle r=1 by identity and r=2 by z↦−z, since the displayed matrix is singular at r=2; affects the proof.
