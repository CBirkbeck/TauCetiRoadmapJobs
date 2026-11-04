# Review of ArtinRepresentations (pull request #1711 at 6802a8f)

**Verdict:** needs changes

## R01 (P2) — State the weight-one comparison that the pins already support

**Location:** `TauCetiRoadmap/ArtinRepresentations/Suggested.lean:27`, “Weight-one and Stark-unit comparisons lack the newform-to-Artin comparison and regulator carriers”; `TauCetiRoadmap/ArtinRepresentations/README.md:1756`, §8.2.

**Claim:** The weight-one comparison cannot be stated at the pins, so the acceptance file omits it entirely.

**Witness:** `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` defines `HeckeRing.GL2.Newform`. Together with this file's `finiteArtinLSeries`, it supports an irreducible Artin representation whose **full** L-series equals the newform's Fourier-coefficient L-series.

The missing comparison is the theorem to state, not a carrier that must already exist. This signature elaborated on a scratch copy of the actual file, with the single additional used import `TauCeti.NumberTheory.ModularForms.Newforms.Newform`, under the defaults and with only `sorry` warnings:

```lean
theorem weight_one_full_artin_comparison (N : ℕ) [NeZero N]
    (f : HeckeRing.GL2.Newform N 1) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (_ : IsGalois ℚ E)
      (ρ : Representation ℂ (E ≃ₐ[ℚ] E) (Fin 2 → ℂ)),
      Representation.IsIrreducible ρ ∧
      ∀ s : ℂ, 1 < s.re →
        finiteArtinLSeries ℚ E ρ s =
          LSeries (fun n : ℕ =>
            (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n) s := sorry
```

**Repair:** Add this statable component of §8.2, with its declaration documented in the README, and correct the missing-carrier inventory. Keep the conductor-level refinement and other genuinely unavailable components explicitly distinguished. This uses exactly the finite Galois presentations already used by the file's analytic headlines; it introduces neither a free predicate nor an auxiliary comparison structure. Consume the named Deligne–Serre supplier rather than planning its proof again.

The source is [Deligne–Serre, Theorem 4.6, p.514](https://www.numdam.org/item/ASENS_1974_4_7_4_507_0/), `deligneserre1974` lines 287–298, on primitive cuspidal input. For the README's conductor-23 form, both sides have polynomials `1+X+X²` at 2, `1−X²` at 5, and **`1−X` at the ramified prime 23**. Thus the proposed signature preserves the all-prime comparison, not just good-prime matching. This is an additional finding from the full headline audit, not a reopening of a finding marked non-actionable.

## R02 (P2) — Separate ramification from the primes excluded from the Frobenius table

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1913`, “ramifiedSet ρ̄ (the LMFDB's `conductor_primes`, together with the places above `ℓ`)”.

**Claim:** All places above the coefficient characteristic are included in the representation's ramified set, irrespective of inertia.

**Witness:** For the trivial mod-3 line over ℚ, every inertia image is `{1}`, the prime-to-3 conductor is 1, and topSlope is 0. The actual ramified set is empty; the written union is `{3}`.

The paragraph itself defines unramifiedness using inertia. The database's omission of primes dividing `ℓ·conductor` from a Frobenius display does not assert ramification at those primes: see [the mod-ℓ display source](https://github.com/LMFDB/lmfdb/blob/master/lmfdb/modl_galois_representations/web_modlgal.py), `lmfdb` lines 205–219.

**Repair:** Define `ramifiedSet ρ̄ = {v | ¬ IsUnramifiedAt ρ̄ v}`. Express it as conductor support union **the ramified places above ℓ**. If the larger exclusion set is needed, name it separately as the complement of good primes. Add the trivial mod-3 line as a negative control: repaired ramified set `∅`, excluded set `{3}`. For the mod-5 cyclotomic character, inertia at 5 has order 4, so both the actual and repaired ramified sets are `{5}`, although its prime-to-5 conductor is 1.

## R03 (P3) — Keep the container Check inside its irreducible domain

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:2255`, “A continuous `ρ : G_ℚ → GL₂(ℂ)` with image `{1}` has Artin field `ℚ`, containerDegree = 1”.

**Claim:** The trivial two-dimensional representation is an input to the container invariant defined in §7.7 for irreducible representations.

**Witness:** Every line in the trivial two-dimensional representation is invariant, so it is reducible. The unrestricted subgroup-index expression has minimum 1, but this is not a value of the stated irreducible-only invariant.

**Repair:** Use the trivial **line** for this Check, or explicitly describe the unrestricted minimum without applying containerDegree. On the line, irreducibility holds and `[G:G]=1`; its Artin field is ℚ and its projective image is trivial. Keep §7.7's existing reducible negative control as an explanation of the domain restriction.

## Verified sound

This is a full review of all nine layers, all 44 numbered subsections, the conventions and supplier contracts, the worked examples, and all 16 Lean declarations. There are **two P2 findings and one P3 finding**. No PR file was changed. The 126 computed rows below are adversarial tests, not proofs of the admitted theorems.

### Previous review, finding by finding

These checks were performed before the fresh full review. No supplied repair report marks a finding “not actionable in this package”.

| Previous finding | Passage at this head | Assessment and computed retest |
|---|---|---|
| R01, residual conductor | README:2220, “prime-to-5 conductor `1`”; :2221, “`Δ = −11⁵`” | **Repaired.** c₄=496, Δ=−161051. Tate inertia parameters are 5 mod5=0 and 5 mod3=2, giving fixed dimensions 2 and 1 and residual conductors 1 and 11. |
| R02, unramified twist | README:2174, “`W(χη,ψ̄_p) = η(ϖ)^(a(χ)) W(χ,ψ̄_p)`”; §2.4 includes the additive conductor | **Repaired.** Over ℚ₂, (−1)²i=i; over ℚ₃, (−1)i=−i. Changing n(ψ) from 0 to 1 adds exactly the multiplier −1. |
| R03, tetrahedral image | README:2157–2161, “image `SL(2,3) ⊂ SL₂(ℂ)` of order 24; its restriction to `Q₈`” | **Repaired.** The order-3 element has eigenvalues ζ₃,ζ₃², trace −1 and determinant 1. It lies in the full order-24 image; Q₈ is the order-8 restriction. |
| R04, conjugacy | Suggested.lean:170, `finite_pgl2_iso_implies_conjugate` | **Repaired.** Conjugation by z↦z+1 sends ⟨−z⟩ to ⟨2−z⟩. The quantifier asks for some conjugacy, not realization of every prescribed automorphism of C₅. |
| R05, completion ownership | README:380, “From ClassicalArithmeticCompletion §7.30 … consume the finite-character completedArtinLFunction” | **Repaired.** Main §7.30 owns this interface. On χ₋₄, both use conductor 4, Γℝ(s+1), local phases −i and i, and global root 1. On 1⊕1 both have ζ² and pole order 2. |
| R06, restriction API/locators/predicate Checks | README §2.1 explicitly gives the invariants map; §5.2 cites Martinet Ch.II §1; §§8.1–8.2 have separate predicate Check lists | **Repaired for the identified targets.** Restricting a ramified quadratic line to its kernel enlarges invariant dimension 0→1. Holomorphy tests give orders 0,−1,−2; the RM/CM tests distinguish imaginary induction, mixed-signature real induction and tetrahedral image. Source-access limitations are recorded separately. |

### Gate, signatures, principles and headline inventory

The worker's gate at the requested head reports all scanners and the targeted build passing, including `build=0`, `outside-folder=0`, `stray-files=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `dropped=0`, and final `OK`. The independent dependency check returned:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The outside-folder diff is empty. This roadmap is not a replacement of an existing ArtinRepresentations roadmap on main. Its retained constructions develop the general finite-image theory and retain ramified primes; the cycle-type discussion is a mathematical criterion, not a computational implementation. No copied source passage, sorry'd data, `set_option`, or admitted example was found in the reviewed files.

Direct `lake env lean` elaboration of Suggested.lean succeeded with exactly ten `sorry` warnings and no other diagnostic. A separate scratch file ran `#check @name` for all **16 declarations**; every elaborated signature was compared with the README. No finite-dimensional, Galois, number-field, normed-space or semisimplicity binder was lost. The three definitions using choices have the necessary existence on their intended inputs: finite primes have Frobenius lifts, inertia has nonzero cardinality in ℂ, and the real-place fallback in finiteNPlus describes trivial conjugation.

The **ten stated headlines** are: finite Galois Artin field and image degree; finite Galois factorization; semisimplicity; character recognition; complete irreducible zeta factorization; meromorphic continuation and exact orders at 0 and 1; abstract Klein classification; conjugacy uniqueness; rank-one holomorphy; and common-finite-quotient Frobenius recognition. The six other declarations are their supporting structure, abbreviation and four definitions. A scratch copy tried `simp`, `rfl`, and `infer_instance` as closing tactics on each of the ten admissions; **zero closed**. Reading the relevant pinned inputs did not reveal a one-library-lemma proof of one of these full signatures. No padding finding is made.

The other README headlines are the completed functional equation, conductor–discriminant formula, local/global root-number formulas, orthogonal obstruction comparison, elliptic local-root formulas, weight-one dictionary and Stark comparisons. The docstring identifies missing conductor/epsilon/regulator carriers for the relevant parts. Its blanket exclusion of weight-one comparisons is R01: the native newform and existing all-prime L-series suffice for the stated full finite L-series comparison. The scratch signature above adds no definitions and elaborates with eleven `sorry` warnings total.

### Computed adversarial table

All arithmetic below was recomputed in this review. Exact rational/integer polynomial discriminants, finite-field factor degrees, elliptic point counts, subgroup averages and the quartic Gauss sum were also independently evaluated in scratch. Other rows give explicit linear-algebra, field-degree and local-constant calculations. The standing number-field/characteristic-zero assumptions exclude zero rings, q=1 and inseparable number-field extensions; arbitrary imperfect base fields are tested separately. “Retain” means no defect found in the displayed test. Each row records a value or a true/false outcome on actual inputs, including negative controls.

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
| §2.1 inertia/wild invariants | Unramified line; tame quadratic at odd p; χ₋₄ at 2 | Dimensions (dim Vᴵ,dim Vᴾ)=(1,1),(0,1),(0,0). Unramified/tame outcomes (T,T),(F,T),(F,F). | Retain; the new restriction map is explicit. |
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
| §4.3 direct sum, induction and completion comparison | Ind_{ℚ(i)}^ℚ1=1⊕χ₋₄ | W=1·1=1=W(1 over ℚ(i)); local factors separately can have λ≠1. | Retain global/local distinction. |
| §4.4 order at zero | Zero; trivial ℚ line; χ₋₄; nontrivial even χ₅; odd S₃ standard | Σ archimedean fixed dimensions minus global invariants gives 0−0=0,1−1=0,0−0=0,1−0=1,1−0=1. | Retain. |
| §4.4 complex place | Trivial line over ℚ(i) | One complex-place contribution 1 minus invariant dimension 1 gives order 0, matching r₁+r₂−1=0. | Retain counting a complex place once. |
| §4.4 analytic card | Trivial ℚ line; 1⊕1 | Completed poles have orders 1 and 2 at both 0 and 1; polar supports each {0,1}. | Retain holomorphy premise for general card. |
| §5.1 conductor–discriminant | ℚ(i); ℚ(ζ₅) | Absolute discriminants 4 and 125; products 1·4=4 and 1·5·5·5=125. | Retain. |
| §5.1 nonabelian exponents | S₃ closure of discriminant −23 cubic | Product 1·23·23²=23³, with degree-2 character exponent 2, not 1. | Retain. |
| §5.2 rank-one/Hecke/Dirichlet conductor | χ₋₄; trivial character presented mod 4 | Primitive conductors 4 and 1 on both sides; presentation modulus 4 is wrong for the trivial character. | Retain; Martinet Ch.II §1 now cited. |
| §5.2 determinant divisibility | S₃ standard; χ₋₄⊕χ₋₄ | Conductors 23 versus det conductor 23; 16 versus det conductor 1. Divisibilities 23∣23,1∣16. | Retain, equality not asserted. |
| §6.1 product formula | χ₋₄ over ℚ | Standard W∞=i, W₂=−i, other local factors 1; i(−i)=1=global W. | Retain. |
| §6.1 independence of global additive character | Scale χ₋₄'s character by −1 | Real multiplier −1 and 2-adic multiplier −1 give product 1. | Retain global reciprocity. |
| §6.2 orthogonal/symplectic/self-dual | 1⊕1; χ⊕χ̄; Q₈ faithful 2-space | Indicators 2,0,−1; first two admit symmetric forms, third alternating form. Global orthogonal W=1; symplectic bound permits ±1. | Retain form hypotheses, not indicator tests for arbitrary sums. |
| §6.3 obstruction construction | Sign line; sum of two sign lines | Pin⁺ pullback of one reflection splits, w₂=0. Two signs: w₂=w₁∪w₁; rank zero gives 0. | Retain actual extension construction. |
| §6.3 local obstruction formula | χ₋₄⊕χ₋₄ over ℚ₂, standard ψ | W=(-i)²=−1; determinant line trivial W=1; Brauer invariant 1/2 gives exp(2πi·1/2)=−1. | Retain sign and determinant correction. |
| §6.3 one-dimensional/char-2 controls | χ₋₄ line; coefficient map in equal characteristic 2 | Line ratio W(χ)/W(detχ)=1, w₂=0; in char 2, ±1→Kˢ× has both values 1, so image class 0 and exponential 1. | Retain stated characteristic split. |
| §6.4 p-adic field root number | ℚ₂(√−3), ℚ₂(i), ℚ₂(√2) | Database W=1,i,1; fourth powers 1,1,1. Not every quadratic unit extension has W=1. | Retain. |
| §6.4 conjugate-character adapter | ℚ₂(i) | Standard value −i multiplied by χ_disc(−1)=−1 gives database i. | Retain. |
| Worked §6.4 twist law | ℚ₂(i) twisted by ℚ₂(√−3) | a=2: actual i; new law (−1)²i=i; erroneous exponent 1 would give −i. | Repaired; retain. |
| Worked §6.4 tame twist control | ℚ₃(√−3) twisted unramified | a=1: actual −i; corrected (−1)¹i=−i. | Retain the odd-conductor control. |
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
| §7.6 conjugacy headline | H=⟨−z⟩, K=⟨2−z⟩ | Both order 2; unequal subgroups; conjugation by z+1 sends the generator to 2−z. | Repaired; now a Lean headline. |
| §7.6 dihedral induction | Ind_C₃^S₃ ζ₃ | ψ/ψ^σ=ζ₃² of order 3; projective group D₃ order 6; twisted character order modulo extendible characters is 3. | Retain. |
| Worked tetrahedral example | ρ₀ at an order-3 element | Trace −1, determinant 1, eigenvalues ζ₃,ζ₃²; order 3≠1,2,4 (the possibilities in Q₈). Full image order 24; restriction image order 8. | Repaired; retain. |
| §7.7 minimal permutation container | S₃ standard | H=C₂ gives invariant dimension (2+0)/2=1, index 3; H=C₃ gives (2−1−1)/3=0, index 2. Minimum 3. | Retain irreducibility. |
| §7.7 degenerate container | Nontrivial C₂ line; trivial line; reducible 1⊕sgn | Minima 2,1,1. The last action's minimal containing permutation representation need not contain the whole reducible representation. | Retain domain restriction. |
| §7.8 cycle type versus class | Faithful character of cyclic cubic field | Two nonidentity Frobenii each give cycle type (3); polynomials 1−ζ₃X≠1−ζ₃²X. | Retain fibre-constancy hypothesis. |
| §7.8 ramified support/local table | S₃ conductor-23 standard | Support {23}; P₂=1+X+X², P₅=1−X², P₂₃=1−X. | Retain all primes. |
| §7.9 intrinsic labels | Trivial line; conductor-23 standard | Prefixes 1.1 and 2.23 are determined; a full orbit/container label contains choices absent from these two numbers. | Retain boundary. |
| §8.1 ArtinHolomorphic/rank-one theorem | 0,1,χ₋₄,1⊕1 | L=1,ζ,Lχ,ζ²; orders at 1:0,−1,0,−2, respectively minus invariant multiplicity. | Retain; separate predicate Checks now present. |
| §8.1 completed equivalence | Trivial line; odd nontrivial line | Completed trivial has simple poles at 0,1; completed odd line no poles; multiplicities 1 and 0. | Retain. |
| §8.1 positive induction cases | S₃ standard=Ind_C₃ ζ₃ | Nontrivial Hecke character gives entire L, invariant dimension 0, pole order 0. | Retain monomial case. |
| §8.2 weight-one good-polynomial dictionary | η(z)η(23z), primes 2 and 5 | (a₂,detF₂)=(−1,1), (a₅,detF₅)=(0,−1); polynomials X²+X+1 and X²−1. | Retain both coefficients and arithmetic direction. |
| §8.2 induction oddness | Imaginary quadratic line; real quadratic line with signatures (+,−) or (+,+) | c on induction swaps basis in imaginary case (det−1); real case determinants −1 or +1. | Retain mixed-signature condition. |
| §8.2 self-twist predicates | Irreducible quadratic induction; tetrahedral image | Quadratic induction is unchanged by the nontrivial quadratic character of the inducing field; tetrahedral projective image has no such dihedral self-twist. | Retain; separate real/imaginary self-twist Checks now present. |
| §8.3 S-truncation/order/regulator rank | ℚ trivial character, S={∞}, then {∞,2} | Orders 0 and 1; augmentation-kernel ranks 0 and 1. Extra factor 1−2⁻ˢ has a simple zero at 0. | Retain. |
| §8.3 odd rank-two order | Conductor-23 S₃ standard | n₊=1, global invariants 0, r=1; derivative is leading coefficient, not value L(0)=0. | Retain. |
| §8.3 Chinburg quantifiers | b=1/d, d>0 | d·A(1/d)=A(1); m=d, versus m=1 only under the integral-trace premise. | Retain. |
| §8.3 embeddings | Same S₃ extension | Six embeddings all complex, signature (0,3); fixed cubic signature (1,1), degree 3. | Retain complex embedding. |
| §9.1 finite-coefficient carrier/image | Trivial rank 0; GL₂(𝔽₂) image; a line over 𝔽₄ of order 3 | Orders 1,6,3; indices 1,1,1 in their respective codomains. Field characteristic 2, cardinalities 2 or 4 must not be conflated. | Retain. |
| §9.1 irreducibility/absolute irreducibility | C₃ on 𝔽₂² with polynomial X²+X+1 | No root in 𝔽₂; two roots in 𝔽₄; irreducible true, absolutely irreducible false; det(c)=1=−1. | Retain characteristic-2 exception. |
| §9.2 prime-to-ℓ conductor | 37.a1[2] at 2 and 37 | At 2 inertia C₃ (ramified), top slope 1, but prime-to-2 conductor excludes 2; at 37 tame residual exponent 1 gives conductor 37. | Retain exclusion versus ramification distinction. |
| §9.2 top-slope convention | Unramified; tame ramified; wild break u=1 | Slopes 0,1,2=1+u respectively. | Retain supplier convention. |
| §9.2 residual conductor reduction | 11.a2[5] versus [3] at 11 | vΔ=5; inertia parameters 0 mod 5 and 2 mod 3; a₁₁=0 and 1, giving conductors 1 and 11 as now stated. | Repaired; retain. |
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
| §1.2 character-defined field | Trivial line over 𝔽₂(t) | Trace locus is all G_F; in the stipulated separable closure its fixed field is F, degree 1. Without that convention it contains t^(1/2), of degree 2. | Retain the standing separable convention in this sentence too. |
| §2.1 restriction/invariants map | A ramified quadratic line, then restriction to its kernel field | Old invariant space 0 maps into new invariant space ℂ; dimensions 0≤1; the map is not asserted surjective. | Retain actual inclusion. |
| §2.4 unramified twist, arbitrary additive conductor | χ for ℚ₂(i), η(2)=−1, n(ψ)=0 then 1 | Multipliers (−1)^(2+0)=1 and (−1)^(2+1)=−1; change equals η(2)=−1. | Repaired; retain. |
| §7.6 prescribed automorphism versus conjugacy | H=C₅ acting by z↦ζ₅z | Normalizer acts on H by powers 1 or −1=4; power 2 has no such conjugating map, although H is conjugate to itself. | Retain existence of some conjugacy, not realization of every isomorphism. |
| §8.2 V₄ self-twists | Odd irreducible dihedral representation with projective image V₄ | Three quadratic characters at c take (1,−1,−1); RM=true and CM=true. For projective D₄, the unique real inducing character gives (RM,CM)=(true,false). | Retain nonexclusivity at V₄. |
| §8.2 missing full L-series comparison | f=η(z)η(23z), S₃ standard representation | At p=2: a₂=−1, P₂=1+X+X²; at p=5: a₅=0, P₅=1−X²; at p=23: a₂₃=1, P₂₃=1−X. Both full series have these factors. | R01: the native full comparison elaborates; add the headline. |
| §9.2 ramifiedSet | Trivial mod-3 line over ℚ | Inertia images all {1}, conductor=1, topSlope=0, actual ramified set=∅; written union gives {3}. | R02: restrict the added primes to those with nontrivial inertia. |
| §9.2 repaired set, positive control | Mod-5 cyclotomic character | Prime-to-5 conductor=1; inertia at 5 has order 4; actual and repaired sets both {5}; topSlope=1. | Repair preserves genuinely ramified coefficient primes. |
| Boundary container Check | Trivial rank-two complex representation; trivial line | Rank-two action has every line invariant and is reducible, so containerDegree has no input under §7.7. Trivial line is irreducible and minimum index=1. | R03: use the line. |
| Worked tetrahedral discriminants | Quartic f, octic g and resolvent cubic displayed in README | Polynomial discriminants 26569=163², 6353205849=9·163⁴, 26569=163². Hard prime 3 is not in conductor support {163}. | Retain polynomial-discriminant distinctions; field-index assertion is not certified by this calculation. |
| Worked tetrahedral Frobenius table | g mod p for p=2,5,7,11,13,17,19,23,29,43 | Factor degrees respectively 1133,44,26,26,44,44,26,44,26,1133; p^54 mod163 respectively 104,1,104,58,1,1,58,1,58,58, with 104²=58. | Retain ω(2)=ζ and all displayed local polynomials. |
| Worked tetrahedral discriminant exponents | A₄ and SL₂(3) irreducibles | A₄: 1+1+2·3=8; binary group: 8+2·2+1·2+1·2=16; dimension sums 1+1+1+9=12 and 12+4+4+4=24. | Retain conductor powers and complete character family. |
| Source proof step | Martinet Ch.II §1, restriction to D≤G; G=C₂,D=1,χ=1 | χ(1)=1; Ind_D^G(Res χ)(1)=2, so the claimed induction identification is false. Restriction gives the same inertia data and conductor 0 in the unramified example. | Source error; use restriction to compare local conductors. |

### Seeded source sample

All **15 requested targets** were checked. The README flags no locator explicitly as unverified. Actual text, rather than remembered numbering, was used where legally readable; other locators remain uncertified below. Sources were obtained through the sources service or its legal-copy cache. No manifest was edited. Source identifiers below identify the work; for `lmfdb`, the accompanying page or code-file title distinguishes its extractions.

| Sampled target | Text/locator inspected | What the evidence supports |
|---|---|---|
| §1.1 carrier, open kernels, finite image | ArithmeticGaloisRepresentations §1.4; pinned ContRepresentation and finite-module open-kernel theorem | Continuity in the group variable is additional data. The profinite/no-small-subgroups route produces an open kernel. The finite-module theorem also needs open point stabilizers; it is not a theorem that finite image alone implies continuity. No independent external page locator is supplied for this adapter. |
| §2.2 local polynomial and Euler factor | `deligne1973` lines 756–825, §§3.7–3.9, pp.530–531; `martinet1977` lines 193–242, author-copy pp.8–10 | Factors are on inertia invariants, including ramified places. Deligne uses the geometric convention; the stated dual/Frobenius conversion is necessary. Neukirch VII(10.1) itself is publisher-only. |
| §3.2 induction and local polynomial | Deligne Proposition 3.8 and its cyclic-block argument, `deligne1973` lines 792–825, pp.530–531; `martinet1977` lines 222–231 | Induction gives the product over primes upstairs, with residue-degree substitution. The test at the ramified prime 2 in ℚ(i)/ℚ gives 1−X on both sides. |
| §3.4 Euler product | `martinet1977` lines 217–242, pp.9–10; AA.2.4 artin-local-factors; pinned complete irreducible family | Re(s)>1, direct sums, induction and the regular-character zeta factorization are supported. The degree powers are necessary: S₃ gives 1,1,2. Neukirch VII(10.4)–(10.5) numbering is uncertified. |
| §4.1 meromorphic continuation | `martinet1977` lines 434–487, pp.16–17; `deligne1973` lines 870–896, §3.12, pp.533–534 | Brauer reduction to rank-one Hecke continuation supports meromorphy, not general Artin entirety. The exact order at 1 also uses LFunctions Layer 7's nonvanishing. |
| §4.3 functional equation and root number | Deligne §3.12(B)–(D), pp.533–534; `martinet1977` lines 393–433, pp.14–16; ClassicalArithmeticCompletion §7.30 | Supports continuation, reflection to the dual, direct sums and induction with the stated completed normalization. χ₋₄ and the nonreal quartic character distinguish the signs and conjugations. This is not certification of every unreadable Tate/Neukirch locator. |
| §5.1 conductor–discriminant | `martinet1977` lines 578–659, Ch.II §1, pp.21–23; ArithmeticGaloisRepresentations §3.5; NumberFieldArithmetic relative discriminant | Lower-group conductor and induction formulas support the regular-character assembly. Products 4,125,23³ were checked. Martinet's erroneous identification with an induced restriction, noted below, is unnecessary: restriction gives the local conductor comparison. Neukirch VII(11.9) itself is uncertified. |
| §6.4 root number of a p-adic field | [LMFDB local-field root-number knowl](https://www.lmfdb.org/knowledge/show/lf.root_number), `lmfdb` lines 90–116; `rohrlich1994` lines 813–816 and 843–917, §§11–12, pp.143–146 | The database uses the conjugate standard character and real sign −i; unramified value 1 and fourth-root property are supported. The repaired twist exponent agrees with Rohrlich. ℚ₂(i) gives i in the database convention and −i in the standard one. |
| §7.1 dimension, conductor, determinant, parity and conjugation trace | `lmfdb`, artin `math_classes.py` lines 150–219 and 276–315; supplied character/conductor/conjugation APIs | The database reads these invariants; the algebraic comparison uses det(c)=(−1)^n₋ and tr(c)=n₊−n₋. Rank-two −I has determinant 1 and trace −2. Source code documents storage, not the proof of the identities. |
| §7.6 Klein classification/projective type | [Beauville, arXiv:0909.3942v1](https://arxiv.org/abs/0909.3942v1), introduction p.1, `beauville2009` lines 15–18; Proposition 1.1 proof p.2, lines 41–59 | Over algebraically closed characteristic zero the five types and uniqueness up to conjugacy are supported. The theorem is stronger than an abstract isomorphism list. The explicit low-order matrix error in its proof is recorded below. |
| §7.7 smallest permutation container | `lmfdb`, artin `math_classes.py` lines 256–271; pinned Frobenius reciprocity and induction supplier | The code reads the stored transitive label; it does not prove the minimum characterization. Frobenius reciprocity supports that mathematical equivalence under irreducibility. S₃ gives minimum 3, with fixed dimensions 1 for C₂ and 0 for C₃. The guessed definitional knowl was 404; the exact database minimum definition remains uncertified. |
| §7.8 ramified primes/cycle-type/local table | `lmfdb`, artin code lines 273–288 and local-factor methods; native factorization-type and ramified-prime interfaces | Ramification is intrinsic; hard primes depend on the stored polynomial. Cycle type alone cannot distinguish inverse C₃ classes: the two polynomials are 1−ζ₃X and 1−ζ₃²X. The fibre-constancy hypothesis and ramified local factors are retained. |
| §7.9 invariant suite/LMFDB boundary | Same artin code, determinant/projective/container/local-factor accessors | The listed intrinsic data and choice-dependent label components are separated. `Container` is rendered from a stored label, and the code is not a source of a canonical minimizing subgroup. No computational target is introduced here. |
| §8.2 weight-one dictionary | [Deligne–Serre](https://www.numdam.org/item/ASENS_1974_4_7_4_507_0/), Theorems 4.1 and 4.6, pp.513–514, `deligneserre1974` lines 262–298; pp.516–517, lines 357–395 | Nonzero odd-nebentypus eigenforms give the finite-image representation; cuspidal input gives irreducibility; primitive cusp forms give the exact full L-function and conductor. The reverse direction's automorphic input is separately supplied, not attributed unconditionally to this 1974 theorem. R01 concerns statability, not truth. |
| §9.3 Frobenius matrices/generators/recognition | Deligne–Serre Lemma 3.2, p.513, `deligneserre1974` lines 245–253; ArithmeticGaloisRepresentations §§5.3,5.7; `lmfdb` mod-ℓ code lines 205–219 | Semisimple characteristic-polynomial recognition is supported in positive characteristic. Trace-only recognition has the additional n! condition. Generation uses image-internal classes; finite recognition uses one common quotient. The database omits coefficient primes from its display, which explains but does not justify R02. |

Additional readable checks: Deligne 1973 Theorem 4.1, pp.535–536 (`deligne1973` lines 901–920), gives dimension-zero induction and rank-one local-constant axioms. Deligne 1976 §§1.3–1.6, Theorem 1.5, p.301 (`deligne1976` lines 84–122), gives the dimension-zero, determinant-one orthogonal obstruction formula; applying it to ρ−detρ−(dimρ−1)·1 yields the stated determinant correction. Its coefficient map in characteristic 2 is trivial. The Whitney cross term cancels because w₁(ρ)=w₁(detρ).

Rohrlich 1996 Theorem 2 and proof, pp.329–332 (`rohrlich1996` lines 612–696), treats finite extensions of ℚₚ, not only ℚₚ. The text supports the characteristic-zero elliptic route; some displayed equations extract poorly and are not certified as exact transcriptions. The equal-characteristic extension is explicitly supplied by AL.3.10.3. Jones–Roberts §3.3, p.5 of the cited arXiv version (`jonesroberts2006` lines 226–228), records the fourth-root invariant. The LMFDB Stark-unit knowl, `lmfdb` lines 90–96, supports the weighted b/m quantifiers; it does not certify the inaccessible Chinburg proof.

### Pinned declarations and ownership by object

Pins inspected: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Searches covered representations and continuity, finite quotients, invariants, characters and scalar action, induction/Brauer, local factors and conductors, projective groups, orthogonal obstruction classes, newforms, and Frobenius recognition. These are object searches, not just searches for proposed declaration names.

| Opened pinned location | Evidence and consequence |
|---|---|
| `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`, :72 | ContRepresentation is a homomorphism into continuous linear endomorphisms, with toRepresentation. It contains **no continuity condition on the group variable**. ArtinRep's extra field is necessary. |
| `Mathlib/RepresentationTheory/Character.lean:55`, :63, :68, :74, :93 | Character is trace; char_one, char_tensor, char_iso and char_dual supply the algebraic identities. The dual reads g⁻¹. No second abstract character API is needed. |
| `Mathlib/RepresentationTheory/Maschke.lean:179` | The semisimplicity instance assumes finite G and nonzero cardinality in the coefficient field. It does not directly discharge the theorem for an infinite absolute Galois group. |
| `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:266`, :277 | The separable fixed-field correspondence and mem_perfectClosure_iff_fixed distinguish the Artin field from the full algebraic-closure fixed field over imperfect F. The convention and actual definition include the intersection. |
| `TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean:55` | isOpen_ker_of_finite assumes Module.Finite and **open vector stabilizers**. The proof intersects stabilizers of generators. This is not a finite-image-only continuity theorem. |
| `TauCeti/NumberTheory/NumberField/Frobenius.lean:67`, :77 | Frobenius exists at nonzero primes in finite Galois number-field extensions, including ramified primes. The integer-base variant distinguishes ℤ from 𝓞 ℚ. |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean:244`, :248, :299 | characterDegree, irreducibleRepresentation and the degree-square sum use the full conjugacy-class-indexed family. The zeta theorem has all irreducibles and the degree powers. |
| `TauCeti/RepresentationTheory/CharacterTable/Kernel.lean:115`, :130 | Character detects kernel under finite-order hypotheses. Apply after passing to the finite image. |
| `TauCeti/RepresentationTheory/CharacterTable/Values.lean:336` | The norm-equals-dimension criterion gives an actual scalar on a finite-group representation, supporting the projective-kernel criterion. |
| `TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Trichotomy.lean:412`, :428, :443 | Indicator 1,−1,0 characterizations retain irreducibility. Arbitrary orthogonal sums can have indicator 2 or 0; the roadmap's global self-dual statements instead use forms. |
| `TauCeti/GroupTheory/GroupExtension/Cohomology.lean:120`, :363 | FactorSet.cohomologyClass and section-independence have concrete cocycles, normalized sections and induced-action premises. The proposed finite-model pullback is not an unbound operation. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:85`, :104 | The actual nonzero Hecke eigenform and normalized newform carriers exist, with cusp form, character and Fourier expansion. They are sufficient for R01's full L-series comparison. |

The worker's 26 unresolved-name leads were checked as such, not treated as automatic missing-supplier findings. They include own target names, supplier targets and database keys. No fully qualified collision with the 16 declarations was found in the accessible roadmap material. The proof of character recognition still needs a common finite quotient, and Frobenius recognition still needs density: neither is padding merely because the finite algebraic input already exists.

### Resolved roadmap contracts and supplier order

The named main checkout was used for existing roadmaps, including Completed folders; an open revision of an existing roadmap was not promoted to a prerequisite. New roadmap heads were read through the provided checkouts and `roadmaps show`. Main/open ownership searches used `roadmaps grep`, and board packages were also searched by object. This does not purport to review every unrelated roadmap.

| Resolved supplier location | Consumed contract |
|---|---|
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:850`, F.4.0 | Jointly continuous representation carrier and its isomorphisms; finite-dimensional complex comparison here. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:956`, §1.4 | No-small-subgroups/open-kernel route, with profiniteness and continuity. |
| Same, §§2.4–2.7, :1807 and :2086 | Weil–Deligne/Frobenius adapters and scalar constants/globalization. The higher-rank characteristic-zero existence theorem is explicitly owned here, not silently presumed supplied. |
| Same, §§3.1–3.6, :2498–2771 | Artin/Swan/prime-to-ℓ conductors, induction, integrality and reduction. Residual conductor can decrease. |
| Same, §§4.1,4.4,5.1,5.3,5.7, :2844,:2970,:3148,:3194,:3329 | Oddness including characteristic 2, Dickson, density, semisimple recognition and finite-field realization. |
| Same, §6.3, :3873 and :3945 | Tate inertia and the multiplicative residual-unramified criterion used to retest previous R01. |
| `TauCetiRoadmap/LFunctions/README.md:346,:730,:859,:929`, Layers 0,3–5,7 | Finite-polar-divisor analytic card, meromorphic uniqueness, primitive/presented Hecke functions, corrections and nonvanishing at 1. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1996,:2078`, AA.2.4 | All-prime Artin formalism and character-module convergence factors. General complex Artin continuation here also names Brauer and LFunctions, rather than assuming that every representation is a character lattice. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2325`, AL.3.10.3 | Equal-characteristic local constants, monodromy, conductor-compatible norm twisting and coefficient adapters. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15102`, §7.30 | Existing finite-character completion, analytic root, functional equation, uniqueness and normalized product. This roadmap now transports that interface. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md`, R17.5.1,.6–.10, :2242–2344 | Solvable Artin/weight-one theorems. Declared local-constant/functional-equation gaps remain supplier contracts, not new defects in this package. Its native weight-one signature also corroborates availability of the newform carrier. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1419`, §2.10 | Deligne–Serre arithmetic polynomial and cuspidal irreducibility; geometric dual comparison is explicit. |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:486,:640`, §§1.2,1.9 | Automorphic Artin predicates and totally odd rank-two theorem over totally real fields. The trivial rank-one function is handled by the separate zeta case. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1422,:1559,:1599`, §§2.31,2.39 with its Aramata–Brauer subtarget,2.41 | Boundary continuation, entire quotient and ArtinHolomorphy as a hypothesis. No general Artin conjecture is imported as a theorem. |
| `TauCetiRoadmap/ClassFieldTheory/README.md`, Layers 5,7,9,11–13, :920,:1312,:1505,:1683,:1724,:1799 | Brauer invariant, local reciprocity/Frobenius, Weil group, global reciprocity/existence, primitive conductor. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:1583`, G5 item 4; `Completed/OrthogonalSpinGroups/README.md:152` | Positive real Pin extension, twisted action, and reverse-versus-star norm. A line reflection has square +1 in Pin⁺, which fixes the w₂ convention. |
| `TauCetiRoadmap/ProfiniteCohomology/README.md:725,:777,:1060,:1265,:1363` | Explicit degree-two cocycles, comparison, inflation, cups and separable-closure coefficients. |
| `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:724,:760,:817`, Layers 4,7; `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`, Layers 2,6,7 | Cyclotomic values, Galois action, splitting fields/indicator; induction/reciprocity/Brauer and projective lifting. Adapters retain actual coefficient hypotheses. |
| `Completed/LocalFieldsRamification/README.md`, Layers 2–4; `Completed/LocalGaloisGroups/README.md`, conventions | Local Frobenius, lower/upper filtration, wild/tame quotient and local Galois notation. |
| `Completed/NumberFieldArithmetic/README.md:615,:1086,:1290`, Layers 2,4–6 | Relative Frobenius, discriminant, completions/decomposition and ramification. The Frobenius exponent is the base residue cardinality. |
| `Completed/Chebotarev/README.md:416,:622` | Dirichlet/natural density and occurrence of every class; actual finite sets of recognizing primes. |
| `Completed/PolynomialGaloisGroups/README.md:205`, Layer 6 | Transitive labels only through degree 5. The octic action is retained without pretending this supplier constructs its numerical label. |
| `TauCetiRoadmap/PadicExtensionFamilies/README.md:966`, §2.7 | Galois-closure top slope, 0/1/1+u. The reference is a defined supplier target; absence of this new folder from the candidate list is not itself an upward edge. The mechanical check reports no problem. |
| `TauCetiRoadmap/ModularForms/README.md:532`, Layer 4 | Newforms and nebentypus; arithmetic attachment is separately supplied. |

The completed Chebotarev and LocalGaloisGroups roadmaps were read as shape examples. Every layer here has Examples and Dependencies endings. Definitions generally carry their local API and discriminating examples; the out-of-domain boundary Check is R03. The statement-by-statement dependency reading preserves the separation of local existence from the global product formula: §2.4 uses scalar globalization and Hecke equations, not §6.1 as its own proof input.

Open-work searches locate McKaySkewGroup's finite SL₂/SU₂ binary-group classification (README:365–465). Its concrete binary lifts are distinct from the PGL₂ theorem here, and it is later in the order. ArtinRepresentations is the earlier owner of the projective classification; no upward McKay supply is introduced. SatoTateGroups, FiniteGroupInvariants and HilbertModularForms are consumers of the indicated intrinsic invariants. No second owner for the specific ArtinRep adapters, no additional declaration collision, and no additional direct supplier-order defect was found. There are no declared gaps in this package.

## Not verifiable

These limits concern source access or exact attribution, not deferred review work. They do not suspend the verdict.

- `neukirch1999`: *Algebraic Number Theory*, VII §§8,10–12, including (10.1),(10.4),(10.5),(11.4),(11.7),(11.9),(12.6), was publisher-only through the sources service. Its exact numbered locators are uncertified. Accessible Deligne/Martinet text independently supports the sampled formalism.
- `serrerep`, `serrelocal`: the Springer books were publisher-only. The stated representation/ramification sections could not be checked against the text. Pinned library results do not certify a textbook page.
- `tate1979`: the DOI led to an access gateway. No readable legal text was obtained for the full §§3–4 local/global product argument.
- `tate1984`: bibliographic resolution found no readable copy. The exact Ch.I Props.3.4,5.3,7.1–7.3 and Conj.5.1 regulator/functoriality locators remain unverified. The S-unit rank and b/m tests are narrower independent checks.
- `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`: the service classified these publisher citations as uncertified. The Chinburg primary proof and the Halberstadt tables were not read. Deligne 1976 does give readable support for the orthogonal global consequence. The attempted Chinburg DOI lookup did not establish a bibliographic match, so that DOI is not certified here.
- `frohlich1985`, `klein1884`: no readable text through the bibliographic resolver. Deligne 1976 and Beauville's cited version respectively supply readable alternatives for the main sampled mathematics; the inaccessible texts themselves are not certified.
- `lmfdb`: the local-root and Stark knowls and the artin/mod-ℓ code were readable. The attempted minimum-container knowl returned 404. The exact minimum-container database definition is not certified by code that merely reads a label. Generic `artin.*`/`modlgal.*` references do not pinpoint every database claim.
- Martinet's page numbers were checked against the author's posted copy, as the README now specifies. Jones–Roberts was checked in its arXiv version; published pagination was not silently substituted. Rohrlich 1994/1996 contain poorly extracted displayed equations, so only the legible passages and independently computed formulas above are certified. The bibliography's Rohrlich 1993 item has no separate target-level locator to certify.
- Polynomial discriminants and all displayed good-prime octic factorizations were recomputed; those computations alone do not certify the octic field's maximal-order index, its global Galois group or its database label. No legal primary derivation of that particular field identification was located in the cited source material.

Missing readable texts were consolidated in the scratch reference-request file using the existing work identifiers. Publisher-only uncertified items were not requested again. No source file or extraction was copied into the PR or this report.

## Source issues

- **Error** in beauville2009 at Proposition 1.1 proof, cyclic and dihedral cases, p.2: the source says its displayed homography realizes the cyclic generator for every r; it should treat r=1 by identity and r=2 separately, since the displayed matrix is singular at r=2; affects the proof.
- **Error** in martinet1977 at Ch.II §1, author-copy p.23: the source says the global character is induced from its restriction to a decomposition subgroup; it should compare local conductors by restriction and identical inertia filtrations, without identifying the global character with that induction; affects the proof.
