# Review of ArtinRepresentations (pull request #1711 at 4926d5b)

**Verdict:** needs changes

No pull-request files were changed.

## R01 (P1) — Take the Artin field in the separable closure

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:206–225, 758–765; TauCetiRoadmap/ArtinRepresentations/README.md:478–507.

**Claim:** The fixed field of the kernel inside AlgebraicClosure F is claimed finite Galois over every field F. This invalidates the finite-level construction, not just an edge-case example.

**Witness:** For F = F₂(t) and the trivial line, every automorphism fixes t^(1/2ⁿ). The fixed field contains extensions of degrees 2ⁿ, whereas the image has order 1.

**Repair:** Use the separable closure and transport the kernel through TauCeti.absoluteGaloisGroupRestrictEquiv, or intersect the algebraic-closure fixed field with the separable closure. Apply this to both ArtinRep and ModLRep. Preserve arbitrary fields. On F₂(t), the repaired trivial field is F, degree 1, and separable. The imported pin explicitly explains this at TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:33–47; mem_perfectClosure_iff_fixed is at line 277 and the comparison at line 325.

## R02 (P1) — Restore irreducibility in the container theorem

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:687–696; TauCetiRoadmap/ArtinRepresentations/README.md:1262–1268.

**Claim:** containerDegree_eq_one_iff assumes only Nontrivial V. Its left side detects a nonzero invariant vector, not a trivial representation.

**Witness:** For ρ = 1 ⊕ χ₋₄, H = G has index 1 and a one-dimensional fixed space. Thus containerDegree = 1, while ker ρ has index 2.

**Repair:** Carry Representation.IsIrreducible explicitly in the theorem, matching §7.7, or state the general equivalence with nonzero global invariants and reserve the triviality equivalence for irreducibles. The counterexample is then either excluded from the irreducible theorem or satisfies the corrected invariant-vector equivalence.

## R03 (P1) — Generate inside the image, not from ambient conjugacy classes

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:871–877; TauCetiRoadmap/ArtinRepresentations/README.md:1473–1478.

**Claim:** IsGeneratingSet closes entire GLₙ(𝔽)-conjugacy classes but equates the result to image ρ. These classes need not lie in that image, making exists_isGeneratingSet false.

**Witness:** Embed a quadratic quotient as ⟨[[1,1],[0,1]]⟩ in GL₂(F₂). Its image has order 2; the ambient nonidentity conjugacy class has three elements and generates all six elements.

**Repair:** Form Frobenius conjugacy classes in the finite Galois quotient or in image ρ, then map to ambient GL only for the displayed matrix invariant. In this example the image class is the singleton transvection; one inert good prime generates exactly the order-2 image. Intersecting an ambient class with the image need not recover a single image-conjugacy class, so retain the image-level datum.

## R04 (P1) — Replace the characteristic-polynomial divisibility claim

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1470–1473.

**Claim:** The characteristic polynomial need not divide X^(orderOf g) − 1. An annihilating polynomial is divisible by the minimal polynomial; repeated eigenvalue multiplicities prevent the proposed conclusion.

**Witness:** For the trivial rank-two representation over F₃, g = I, orderOf g = 1 and charpoly g = (X−1)². A degree-2 polynomial does not divide X−1.

**Repair:** State minpoly 𝔽 g ∣ X^(orderOf g) − 1, with the finite-order hypothesis, and separately the root/eigenvalue implication for charpoly. If a charpoly divisibility statement is wanted, (X^(orderOf g) − 1)^n is a valid bound. The identity example gives minpoly = X−1 and both corrected divisibilities hold.

## R05 (P1) — A bound exhausting one image does not recognize other representations

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1482–1484.

**Claim:** Agreement at primes whose classes exhaust image ρ does not determine a competing representation unless both factor through a specified common finite quotient.

**Witness:** Compare the trivial F₃-valued character with the quadratic character modulo 17. At the only prime ≤2 both values are 1; the trivial image is exhausted. At 3 the values are 1 and −1.

**Repair:** Require both representations to factor through the same specified finite Galois quotient and require the tested primes to meet every conjugacy class of that quotient. Alternatively keep the cofinite-prime recognition theorem already stated. For the witness the common C₂ quotient has a second class, represented by 3, so the insufficient singleton test fails the repaired hypothesis.

## R06 (P1) — Finite image alone does not imply continuity

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:289 (carrier convention), 444–449.

**Claim:** The README makes continuity, open kernel and finite image equivalent for a bare homomorphism. Only continuity ⇔ open kernel, followed by finite image, is valid in this generality.

**Witness:** G_ℚ surjects onto ∏ₙ C₂ via independent quadratic extensions. A nonzero F₂-linear functional on (∏ₙ F₂)/(⊕ₙ F₂) gives a finite-image character with dense, nonopen kernel.

**Repair:** Remove finite image from the three-way equivalence. State continuity ⇔ open kernel and the finite-image consequence. If using finite image as an input, also require closed kernel (or continuity). The discontinuous character then fails the closed-kernel test; its image still has two elements. Representation.isOpen_ker_of_finite at TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean:55 assumes open vector stabilizers, not merely finite image.

## R07 (P1) — Exclude the zero representation from the induction-kernel formula

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:550–553.

**Claim:** The assertion that the Artin field of ind τ is the Galois closure of the Artin field of τ fails for a zero-dimensional τ.

**Witness:** Take L = ℚ(i), F = ℚ and τ = 0. Ind τ = 0 has Artin field ℚ, while the Galois closure over ℚ of K_τ = L is ℚ(i).

**Repair:** State the normal-core kernel formula for nonzero τ, and the separate zero-dimensional branch K_(Ind 0) = F. The witness gives degrees 1 and 1 in the repaired zero branch; for τ = 1_L the original degree-2 conclusion remains valid.

## R08 (P1) — Remove the asserted Galois equivariance of normalized root numbers

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1199–1204.

**Claim:** Normalized root numbers are not equivariant under arbitrary coefficient-field automorphisms in the asserted way. Restriction to the character field does not specify an action on the larger field containing the Gauss sum and normalization.

**Witness:** For χ modulo 5 with χ(2)=i, let σ fix i and send ζ₅ to ζ₅². Then χ^σ=χ, σ(√5)=−√5, σ(τχ)=−iτχ, and σ(Wχ)=iWχ≠Wχ.

**Repair:** Delete the general equivariance law and retain W(ρ∨)=conj W(ρ). Any broader transformation law must specify the automorphism on the Gauss-sum field, the additive character, and the square-root normalization and include their correction factors. Here W=0.8506508084+0.5257311121i and σ(W)=−0.5257311121+0.8506508084i, so treating identity on ℚ(i) as identity on W fails.

## R09 (P1) — Do not apply the irreducible indicator criterion to arbitrary sums

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1051–1058.

**Claim:** Section 6.2 identifies self-duality with nonzero Frobenius–Schur indicator and orthogonality with indicator 1 without irreducibility. It also promotes a sufficient condition for a real root number to an iff.

**Witness:** For quartic χ modulo 5, χ⊕χ∨ is self-dual with indicator 0 and W=1. For 1⊕χ, the indicator is 1 but W=0.8506508084+0.5257311121i, not 1.

**Repair:** State the root-number results using actual self-dual and orthogonal structures. Restrict the indicator equivalences to irreducibles and replace the final “exactly when” by the justified forward implication. Both sums then have the correct status; the first is orthogonal despite indicator 0. The roadmap’s own Check at lines 1065–1066 already refutes its iff.

## R10 (P1) — Do not treat every quadratic unit extension as unramified

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1094–1097.

**Claim:** The formula padicFieldRootNumber(ℚ_p(√u))=1 for every unit u includes ramified dyadic extensions.

**Witness:** At p=2, u=−1 is a unit and ℚ₂(√u)=ℚ₂(i). The same README computes its root number as i, not 1 (lines 705–706 and 1109–1113).

**Repair:** Replace the unit hypothesis by “unramified quadratic extension”; for odd p, a nonsquare unit provides that case. Keep the dyadic unit square classes and their correct values as Checks. For u=−3 at 2 the value is 1; for u=−1 it is i and the unramified hypothesis fails.

## R11 (P1) — Normalize the elliptic epsilon factor at the correct weight

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1117–1125.

**Claim:** The dual Tate-module parameter has determinant |·|⁻¹ and is not a unitary weight-zero Artin representation. Evaluating its epsilon factor after only a half-twist does not produce a unit-modulus root number. Triviality of the determinant at −1 does not justify independence under scaling by every b.

**Witness:** For a split Tate curve over ℚ₁₁ and the conductor-zero character, ε(σ′⊗|·|^(1/2))=−√11. The stated value is −1. Taking ε/|ε| gives −1.

**Repair:** Define W(σ′,ψ)=ε(σ′,ψ,dx)/|ε(σ′,ψ,dx)| and prove epsilon is nonzero; equivalently state and prove the correctly weighted central normalization. Derive character independence from the positive determinant phase, as Rohrlich does. rohrlich1994 line 843–853 (§12, p.144) defines the quotient, lines 980–997 (§13, p.147) choose the Tate dual, and lines 1223–1269 (§19, pp.153–154) give the signs. Preserve the full local-field scope and supply a source/proof for extending the potentially-good table beyond ℚ_p; §19(iii) itself assumes K=ℚ_p.

## R12 (P1) — An odd Artin field has no real embedding

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1388–1392.

**Claim:** The weight-one Stark-unit assertion requires a fixed real embedding of the Artin field. For an odd irreducible two-dimensional Artin representation over ℚ, its Galois Artin field is totally imaginary.

**Witness:** The roadmap’s conductor-23 example has Artin field the S₃ splitting field of x³−x+1, signature (0,3). It has zero real embeddings; complex conjugation acts as a nontrivial transposition.

**Repair:** Fix a complex embedding of the Artin field and formulate the unit equality in ℂ. If a real-valued unit is needed, specify the subfield fixed by the chosen complex conjugation and its induced real embedding. In the S₃ example that fixed field has degree 3 and one real embedding. The cited LMFDB Stark-unit text contains no real-embedding assumption.

## R13 (P1) — Supply the second Stiefel–Whitney class used by the local formula

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1076–1083, 1547–1548.

**Claim:** The orthogonal local-constant formula uses a class that the roadmap explicitly excludes and says no roadmap defines. A named vanishing hypothesis cannot replace construction of the class and its local invariant.

**Witness:** Section 6.3 says the class is a target of no roadmap and is “stated as an implication from a named hypothesis”. Deligne’s local invariant map is essential: deligne1976 lines 99–110.

**Repair:** Name an actual supplier for the finite orthogonal representation’s central-extension class, its pullback to G_K and its invariant in H²(G_K,μ₂), or add those constructions and comparisons before this target. QuadraticFormInvariants’ form classes need an explicit representation comparison, not a name-only substitution. Test the determinant-one sum χ⊕χ over ℚ₂ for χ=χ₋₄: W(χ⊕χ)=−1 and the local obstruction must be nontrivial, whereas the trivial two-plane has obstruction 0 and root number 1.

## R14 (P1) — Repair the missing higher-rank local-constant supplier

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:158–162, 241–244, 678–700.

**Claim:** ArithmeticGaloisRepresentations §2.7 is cited for epsilonWeil, Deligne–Langlands existence and global transfer. At the resolved supplier head it explicitly excludes these and exports scalar character constants and finite-order globalization only.

**Witness:** TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:144–159 assigns higher-rank epsilon constants and global transfer to ArithmeticGaloisRepresentations Part II. Section 2.7 contains no epsilonWeil construction.

**Repair:** Repoint to a real earlier owner with the exact hypotheses and normalizations, or introduce an explicit, precise supplier gap with the matching plan and README contract. If no earlier owner exists, move the missing prerequisite into an earlier layer here. Verify both the rank-one χ₋₄ value −i and a rank-two monodromic split Tate parameter; scalar constants alone do not provide the latter. No gap is declared in this package.

## R15 (P1) — Do not consume a proposed revision of PolynomialGaloisGroups

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1271–1274; convention table line 316.

**Claim:** The promised labels through degree 11 cite PolynomialGaloisGroups Layer 1D, which is not in that roadmap on main. This is an existing roadmap, so its proposed revision cannot be used as a supplier.

**Witness:** TauCetiRoadmap/PolynomialGaloisGroups/README.md:57–61 excludes completeness in degrees 6–11. Its Layer 6, line 1172, covers n≤5; Layer 1D does not exist on main fa41b374.

**Repair:** Consume the on-main label contract only on its domain. Keep the mathematical permutation-container construction at every degree; omit unsupported degree-6–11 labels or supply their ownership in an appropriate Part II contract. A degree-8 container remains a valid transitive group, but the numeral in “8t12” is not obtained from the cited on-main table.

## R16 (P1) — Factorization type does not determine the Artin local factor

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1282–1287; convention line 313.

**Claim:** The cycle type of Frobenius in a stem-field permutation action does not determine its conjugacy class in the Galois group, or the characteristic polynomial in an arbitrary representation.

**Witness:** In the cyclic cubic field ℚ(ζ₇)^+, primes 2 and 3 have the same irreducible cubic factorization type. A faithful cubic character has values ζ₃ and ζ₃² there, giving different local polynomials.

**Repair:** Keep the factorization-type/cycle-type comparison, but retain the Frobenius conjugacy class as additional input. Claim a function of factorization type only after proving the representation’s local polynomial is constant on every cycle-type fibre. For the witness both types are (3), while the outputs are 1−ζ₃X and 1−ζ₃²X. The roadmap’s own tetrahedral example already needs the extra value ω(p).

## R17 (P1) — Clear the worker’s failing build gate

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:1.

**Claim:** The supplied gate reports build=1 FAIL due to the warning that importing Mathlib requires the module-system preamble. Under this review contract a failing build gate blocks acceptance even though direct elaboration succeeds.

**Witness:** The worker’s gate at 4926d5b reports a non-sorry warning recommending module at the start of Suggested.lean. The independent direct lake env lean run exits 0.

**Repair:** Add the appropriate module preamble and declaration visibility, preserving the allowed imports, then rerun the targeted build and gate. A scratch copy with module prepended elaborated successfully. This report does not confuse a warning-gate failure with a Lean type error, and does not claim the unmodified gate is green.

## R18 (P2) — State the full Chinburg quantifiers before implying Stark

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1388–1397.

**Claim:** ChinburgStarkUnit is described only for b=1,m=1, while StarkUnitProperty quantifies over all b∈E×. A statement for one coefficient does not supply the asserted implication for every coefficient.

**Witness:** lmfdb (cmf.stark_unit) line 96 imposes m=1 whenever Tr(bf) has integral coefficients; b=1 is merely the displayed specialization. Lines 90–94 quantify over b and include α(b) in the exponent.

**Repair:** Define the full Chinburg statement for every b with integral Tr(bf), retaining α(b) in the sum, and derive Stark by clearing denominators. Keep b=1 as a Check. For a rational b=1/d, the repaired proof uses m=d and the integral case b=1; the b=1-only premise did not supply the nonrational coefficient cases.

## R19 (P2) — Make the finite-polar-divisor card conditional on Artin holomorphy

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:984–991.

**Claim:** The unconditional analytic card is required to have no poles outside {0,1}. This is stronger than meromorphic continuation and would prove the Artin conjecture that §8.1 deliberately states only as a proposition.

**Witness:** LFunctions Layer 0 (README.md:365–373) requires exact poles and analyticity away from the recorded divisor. For a nontrivial irreducible, the proposed zero divisor makes its completed L-function entire.

**Repair:** Construct that AnalyticLFunctionData with its asserted polar divisor under ArtinHolomorphic ρ, and keep the unconditional meromorphic function and functional equation separately. The trivial line still has simple completed poles at 0 and 1; the conductor-23 monomial representation supplies a conditional entire card via its proved holomorphy. No counterexample to Artin’s conjecture is claimed here; this is an unsupported theorem target.

## R20 (P2) — Import the existing Artin-factor development by section

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:217–223, 847–855; also §§3.1–3.4.

**Claim:** The claim “nothing is imported” because AA.2.4 has no Lean declaration reverses ownership. A README target is existing planned work whether or not Suggested.lean names it.

**Witness:** TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1994–2044, AA.2.4 artin-local-factors, already states choice independence, direct sums, ramified induction and the Artin–Hecke comparison on general finite-image complex representations.

**Repair:** Consume AA.2.4 by target name and build only the carrier/normalization adapters and additional invariants here. Do not require the earlier owner to read this later roadmap. At ℚ(i)/ℚ above 2, both owners compute the same invariant-line factor (1−2^(−s))⁻¹; that shared result needs one owner. The Adelic roadmap’s own boundary and the on-main ClassicalArithmeticCompletion README:267–269 confirm the supply direction.

## R21 (P2) — Retain the characteristic-two exception in odd irreducibility

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1414–1418.

**Claim:** The imported implication from irreducibility and oddness to absolute irreducibility loses the supplier’s characteristic restriction.

**Witness:** The real cyclic cubic field gives a C₃-image representation on F₂² with polynomial X²+X+1. It is irreducible, c=1 has det(c)=1=−1, but it splits over F₄.

**Repair:** For characteristic ≠2 retain determinant oddness; in characteristic 2 require ρ(c)≠1, exactly as ArithmeticGaloisRepresentations §4.1, README.md:2869–2874. The cubic example fails the repaired characteristic-two hypothesis; the nontrivial unipotent conjugation case retains the supplier’s conclusion.

## R22 (P2) — Keep the carrier’s finiteness assumptions in its signature

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:94, 740; TauCetiRoadmap/ArtinRepresentations/README.md:285–289, 1403–1408.

**Claim:** ArtinRep drops FiniteDimensional ℂ V, and ModLRep drops Finite 𝔽. The declarations therefore accept objects outside the promised finite-dimensional and finite-coefficient carriers. Derived definitions inherit this widening.

**Witness:** The elaborated ArtinRep type has no finite-dimensional binder; the trivial action on an infinite-dimensional complex normed space is admitted. ModLRep ℚ 1 ℚ is also admitted, despite not having finite characteristic.

**Repair:** Bind the intended assumptions explicitly on both structures, propagating them where needed; alternatively make the broader carrier an explicitly owned target and specialize the advertised invariant API. The former keeps the stipulated scope and rejects both witnesses. All 149 #check types were rerun; 43 dropped-binder alerts were inspected, not treated as 43 independent errors. Ordinary algebraic definitions losing NumberField need no new arithmetic assumption.

## R23 (P2) — State the native Artin-factorization headline in Suggested.lean

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:795–799; TauCetiRoadmap/ArtinRepresentations/Suggested.lean:54–63, 542–562.

**Claim:** The introduction and §3.4 advertise Dedekind-zeta factorization over irreducible characters, but Suggested.lean stops at direct sums and the trivial one-dimensional case. The factorization is neither stated nor named as unstatable with a missing carrier.

**Witness:** For the S₃ splitting field the promised exponents are 1,1,2: ζ_K=ζ·L(sgn)·L(std)². None of the Lean declarations states this identity.

**Repair:** State the finite-Galois Artin factorization using native representations/characters and the kept ofFinite and artinLSeries definitions; use the pinned finite-group regular decomposition as the route. A scratch factorization statement using ofFinite, TauCeti.irreducibleRepresentation and characterDegree, with NumberField K and Re(s)>1, elaborated with only sorry warnings. Include the half-plane hypothesis or a germ identity. Test S₃ and C₂, obtaining exponents (1,1,2) and (1,1), respectively. If removing it as duplicated ownership, cite the owner explicitly and align the headline list.

## R24 (P3) — Delete the confirmed one-tactic and boundary padding

**Location:** TauCetiRoadmap/ArtinRepresentations/Suggested.lean:130–142, 146, 240–242, 611–613, 629, 697–702, 782–783.

**Claim:** Suggested.lean contains API wrappers and boundary cases rather than only the roadmap’s deep acceptance theorems.

**Witness:** Six isolated replacements elaborate: ofFinite_apply by rfl; character_one by exact Representation.char_one; ker_trivial, isStemField_top, the ramified-set iff, and the image-index iff by a single simp invocation.

**Repair:** Delete these declarations from Suggested.lean; keep their mathematical statements in the README. Also delete the already proved wrappers isOpen_ker_of_forall_isOpen_stabilizer and Gammaℂ_eq_Gammaℝ_mul_Gammaℝ_add_one, whose bodies are single library applications. Drop helper definitions used only by removed padding. The same 0/1-dimensional and identity computations remain README Checks. No request to prove padding in place is made.

## R25 (P3) — Restore per-target sources, discriminating Checks and layer shape

**Location:** TauCetiRoadmap/ArtinRepresentations/README.md:1, 436–538, 615–677, 1208–1296; TauCetiRoadmap/ArtinRepresentations/Suggested.lean:111, 146, 185.

**Claim:** The required Summary, Exact supplier contracts, How to read the build and per-layer Examples/Dependencies shape is missing. Many definitions have no three discriminating Checks, and most individual claims have only a bibliography-level source, with no attached theorem/page locator. Several Lean declarations have no docstring.

**Witness:** IsStemField (§7.4) and inertiaInvariants (§2.1) have no local Checks list. §1.5’s induction-field formula has no source locator. The Rohrlich references explicitly omit theorem numbers.

**Repair:** Reorganize into the specified headings; attach an API and at least three discriminating Checks to each retained definition, and a legal exact locator to each theorem. Use the counterexamples above as negative controls. For inertia invariants: dimensions 1 for the trivial line, 0 for a ramified quadratic line, 1 for the tame S₃ plane. Add declaration docstrings only to the definitions/headlines retained after removing padding. No source text should be copied.

## Verified sound

The following are concrete tests, not proofs of the admitted theorems. All 44 numbered milestones and the 149 elaborated declarations were read. The retained tables cover the seeded sample, headline families and finding witnesses; supplementary per-target examples are omitted. Where several API identities share an object, their values share a row. “Pass” refers only to the displayed instances; source and scope limitations remain recorded below.

The worktree was clean at the supplied head, and the diff outside ArtinRepresentations was empty. No set_option, sorry-bodied data, admitted examples, source blobs or computational-algorithm target was found. The worker gate passed every scanner and dependency category except build. Direct elaboration exited 0 with only sorry warnings. A separate scratch file reran #check on all 149 declarations; it agreed with the worker’s signatures. No binder was changed in the PR. The carrier mismatch and the independently missing irreducibility hypothesis are R22 and R02.

The 76 sorried theorem bodies were tried with simp, rfl and infer_instance branches on a scratch copy; ofFinite_apply closed. A second copy confirmed the six explicit one-tactic replacements in R24, with no errors. These probes do not establish the remaining theorems. The two already proved one-lemma wrappers were inspected directly.

Dependency check output, verbatim:

```text
depcheck: 204 roadmaps, 1501 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. Every Prerequisites line and the supplier lists were read. The mechanical check does not detect the nonexistent or changed contracts in R14/R15, or the reversed ownership explanation in R20. No declared gap was assumed.

### Adversarial values

| Target / statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 1.1 carrier, kernel, finite image | Trivial line over ℚ: ker=G, index=1, image order=1, χ(1)=1. Zero space: χ=0 and determinant=1. A discontinuous C₂ quotient has image order=2 but nonopen kernel. | Continuous examples pass; finite-image converse fails R06; carrier scope R22. |
| 1.2 Artin field, finite/Galois and degree | ℚ, χ₋₄: [K:ℚ]=2=\|image\|. F₂(t), trivial line: fixed field contains degree-2ⁿ purely inseparable extensions; asserted degree=1. | Fails R01; use separable fixed field. |
| 1.2 inflation and finite-level inverse | C₂ sign inflated from ℚ(i): c↦−1, χ(c)=−1. Inflation from ℚ impossible for this sign; possible for trivial line. Inflating then restricting sign returns sign. | Pass over perfect base; R01 affects arbitrary base. |
| 1.3 semisimplicity, character recognition and multiplicities | S₃ standard χ=(2,0,−1), class sizes (1,3,2): inner square=(4+0+2)/6=1; trivial multiplicity=(2+0−2)/6=0. Permutation χ=(3,1,0) has trivial multiplicity 1. | Pass; coefficient characteristic zero is retained. |
| 1.5 induction dimension, reciprocity, transitivity | Ind from C₃ to S₃ of a nontrivial line has dimension 2, χ=(2,0,−1), pairing with standard=1 on both sides. Ind 1 from ℚ(i) has dimension 2 and c-trace 0. | Pass for nonzero input. |
| 1.5 induced Artin field | τ=0 over ℚ(i): K_Ind=ℚ, degree 1; normal closure of K_τ=ℚ(i), degree 2. For τ=1 the two degrees are 2. | Fails R07; separate zero branch. |
| 2.1 inertia and wild invariants; both iff directions | Unramified line: dimensions (I,P)=(1,1), predicates (true,true). Tame nontrivial line: (0,1), (false,true). χ₋₄ at 2: (0,0), (false,false). | Pass on all three; wrong full-space invariants fail. |
| 2.2 local polynomial, degree, constant and lift independence | Trivial line: P=1−X, degree1, constant1. Zero invariants: P=1, degree0. Tame S₃ plane with I=C₂: dim V^I=1, P=1−X for both lifts. | Pass; full plane would give degree2. |
| 2.2 dual, twist and local induction | Unramified cubic eigenvalue ζ gives P=1−ζX; dual 1−ζ²X. Two-block induction of trivial line gives det(I−XA)=1−X²=P_L(X²). Zero carrier gives 1=1. | Pass; residue degree f≥1 is essential. |
| 2.2 Euler denominator | q=2,s=2,trivial line: P(1/4)=3/4 and L=4/3. For eigenvalue of modulus1 and Re(s)>1, \|q^(−s)\|<1, so no denominator vanishes. | Pass on convergence domain; q=1 excluded by local-field hypothesis. |
| 2.3 conductor specialization | χ₋₄ at2: a=2=codim1+Sw1. Tame ramified quadratic at3: a=1=1+0. Unramified line: a=Sw=0. Dual has same values. | Pass; conductor owner retained. |
| 2.4 local root numbers, scaling, dual product | χ₋₄ at2: Wψ=−i, Wψbar=i; factor χ(−1)=−1. Wψ²=−1=χ(−1). Trivial/unramified conductor-zero factors=1. | Pass for finite-image Artin characters; supply R14. |
| 3.1 prime/lift/inflation independence | χ₋₄: at2 P=1, at3 P=1+X, at5 P=1−X. S₃ standard at23 has P=1−X; invariant dimension is1 for each conjugate inertia subgroup. | Pass; arithmetic convention and ramified factors retained. |
| 3.1 characteristic polynomial and trace | S₃ 3-cycle: charpoly=X²+X+1, reversed P=1+X+X², trace=−1. Transposition: X²−1 reverses to1−X², trace0. Identity: trace2. | Pass; trace from nextCoeff includes rank0 value0. |
| 3.2 global induction local factors | ℚ(i)/ℚ: at2 one f=1 prime gives1−X; at3 one f=2 prime gives1−X²; at5 two f=1 primes give(1−X)². | Pass; same three values in AA.2.4, R20. |
| 3.3 eigenspaces, trace, parity and twisting | c=diag(1,−1): (n+,n−)=(1,1), trace0, det−1. c=−I₂: (0,2), trace−2, det+1. Zero carrier: (0,0), trace0, det1. | Pass; parity belongs to determinant. |
| 3.3 archimedean induction | Ind_ℚ(i)^ℚ 1: n+=n−=1, matching one complex place contribution1 to each. Identity restriction preserves (1,0); odd line twist swaps to(0,1). | Pass. |
| 3.4 convergence and nonvanishing | ρ=1 overℚ,s=2: product=ζ(2)=π²/6≠0; local p=2 factor4/3. ρ=0: every local factor1, product1. | Pass on Re(s)>1. |
| 3.4 direct sum, Hecke and inflation formalism | χ₋₄ at3: factor(1+3^(−s))⁻¹ on both sides; at2 factor1 on both. 1⊕χ₋₄ gives ζ_ℚ(i). Inflating to a larger quotient leaves eigenvalue −1. | Pass; primitives/conductor primes matter. |
| 3.4 Dedekind-zeta factorization headline | C₂: exponents1,1, dimensions sum2. S₃: exponents1,1,2, dimension sum1+1+4=6. At a 3-cycle factors multiply to(1−X³)² for regular action. | Pass in examples; missing Lean headline R23. |
| 3.5 global and analytic conductor | χ₋₄: Nf=4, base discriminant1, C=4. Ind_ℚ(i)^ℚ 1: C=4=\|discℚ(i)\|. Rank0: C=1. | Pass for correctly scoped dimensions; trivial-on-V prose must mean the line for C=\|disc F\|. |
| 3.6 adelic comparison | Ind_ℚ(i)^ℚ1 at2 has Euler factor(1−2^(−s))⁻¹ in both roadmaps; at3 it is(1−3^(−2s))⁻¹. | Equal mathematical object, existing owner R20. |
| 4.1 meromorphic continuation and normal form | ρ=0: continuation1 and orders0. Trivial line: ζ, order at1=−1. 1⊕1: ζ², order−2. χ₋₄: order at1=0. | Pass; normal form prevents arbitrary removable-point values. |
| 4.1 uniqueness and sum identities as germs | ρ=1⊕1: germζ² equals product of two ζ germs, including at1; pole orders−2=−1−1. Changing a polar point value cannot change that germ. | Pass; no unrestricted value identity inferred. |
| 4.2 gamma and completed induction | At s=2: Γ_R(2)Γ_R(3)=1/(2π²)=Γ_C(2). For χ₋₄ use Γ_R(s+1); for c=−I₂ use Γ_R(s+1)². | Pass; eigenspaces, not determinant parity alone, determine shifts. |
| 4.3 functional equation/root number headline | χ₋₄: τ=2i, i^a√N=2i, W=1. Quarticχ5: W≈0.8506508084+0.5257311121i, \|W\|²=1; dual W is conjugate. | Pass for these normalizations; higher-rank supplier R14. |
| 4.3 root-number sums and induction | Ind_ℚ(i)^ℚ1: W=1, equal to W(1 overℚ(i)); decomposition has W1·Wχ₋₄=1. χ⊕χ∨ has W·conj W=1. | Pass. |
| 4.4 order at0 headline | Overℚ: 1 has r=1−1=0 and ζ(0)=−1/2; χ₋₄ has r=0−0=0 and L(0)=1/2; the quadratic character modulo 5 has r=1−0=1; S₃ plane has r=1. | Pass; integer subtraction, not natural truncation. |
| 4.4 analytic card | Trivial line: degree1, C1, pole multiplicities(1,1). S₃ plane: degree2,C23,no completed poles. General nontrivial irreducible card demands zero poles everywhere. | Examples pass; unconditional general claim overreaches R19. |
| 5.1 conductor–discriminant headline | ℚ(i):4=1·4. ℚ(ζ5):125=1·5·5·5. S₃ splitting field:12167=1·23·23², local exponent3=0+1+2·1. | Pass on abelian/nonabelian and ramified examples. |
| 5.2 character conductor and determinant divisibility | χ₋₄: Artin ideal norm4=primitive Dirichlet conductor4. S₃ plane: det conductor23 divides23. 1⊕χ₋₄: det conductor4 divides4. | Pass. |
| 6.1 product formula | χ₋₄: archimedean i times finite −i=1. Switching to conjugate character: (−i)·i=1. Scaling globally by−1 multiplies local phases by(−1)·(−1)=1. | Pass; retain globally compatible characters. |
| 6.2 self-duality/indicator/root signs | χ⊕χ∨: indicator0, self-dual=true,W1. 1⊕χ: indicator1,W≈0.85065+0.52573i. S₃ standard: indicator1,W1. | Fails unqualified iff and indicator1 implication, R09. |
| 6.3 orthogonal local constants | χ₋₄ at2: W²=(−i)²=−1=det(Art(−1)); trivial line:1=1. χ⊕χ: W=−1, determinant character trivial, nonzero obstruction required. | Square identity passes; obstruction carrier/normalization unowned R13. |
| 6.4 p-adic fields | Unramified quadraticℚ₂(√−3):W1. ℚ₂(i):Wi with i⁴=1. Globalℚ(i):i·(−i)=1. Unit u=−1 incorrectly predicts1. | Fails unit rule R10; fourth-root and product checks pass. |
| 6.5 elliptic root normalization | Split Tate at11: raw half-twisted epsilon−√11, normalized phase−1. Good reduction phase1; nonsplit multiplicative phase+1. | Definition fails R11; stated phase values agree with sources. |
| 6.5 potentially good table and global signs | e=6 atp=5,7,11: (−1/p)=(1,−1,−1). e=4: (−2/p)=(−1,−1,1). 11.a2: (−1)_∞(−1)_11=+1;37.a1:(−1)_∞(+1)_37=−1. | Numerical checks pass; source generality beyondℚ_p not certified. |
| 7.2 irreducible indicator | C₃ nonreal line: (1+ζ²+ζ)/3=0. S₃ standard: (2+3·2+2·(−1))/6=1. Quaternionic Q₈ plane: (4−12)/8=−1. | Pass with irreducibility and nondegenerate form interpretation. |
| 7.3 character orbit versus root-number orbit | χ5 quartic: character field degree2, orbit size2. σ fixes all its character values but sends W to iW; σW=−0.52573+0.85065i versus W=0.85065+0.52573i (exact relation σW=iW). | Character-field data pass; root-number claim fails R08. |
| 7.4 stems and minimal degree | C₂ faithful line: only core-free subgroup1, stem degree2. S₃ standard: subgroupC₂ has core1,index3; subgroupC₃ has coreC₃,index2 and is not a stem. Trivial group:degree1. | Pass over number fields; nonexample distinguishes normal closure from arbitrary subfield. |
| 7.5 projective kernel and fields | χ₋₄ line: all matrices scalar, projective fieldℚ⊂ℚ(i), \|χ(g)\|=1=dim. S₃ plane: scalar kernel1, projective field=Artin field, nonidentity traces0 or−1 have norms<2. | Pass; scalar twist leaves projective field unchanged. |
| 7.6 Klein classification headline | Orders of noncyclic types: D₂=V₄ order4, D₃=S₃ order6, A₄12, S₄24, A₅60. S₃ orbit orders(2,2,3):1/2+1/2+2/3=5/3=2−2/6. | Finite-group examples consistent; Klein text locator unverified below. |
| 7.6 cyclic exclusion and dihedral characterization | Diagonal C₃ action onℂ² has invariant coordinate lines, hence reducible. S₃ plane=Ind_C₃ ψ, ψ/ψ^σ has order3, giving D₃. Q₈ plane has projective V₄=D₂. | Pass on separating cases; no classification proof claimed. |
| 7.7 container minima | Irreducible S₃ standard: fixed dimensions for H=G,C₂,1 are0,1,2; indices1,3,6; minimum3. χ₋₄ minimum2. 1⊕χ₋₄ minimum1 although nontrivial. | README irreducible case passes; Lean iff fails R02. |
| 7.8 cycle type does not determine local polynomial | Faithful cubic character of cyclic cubicℚ(ζ7)^+: atp=2 and3 the regular degree-3 action has type(3), but eigenvaluesζ₃ andζ₃², giving1−ζ₃X and1−ζ₃²X. | Fails factorization-only assertion; see R16. |
| 8.1 Artin predicates and elementary cases | Trivial line: pole order−1, analytic away1; zero rep: entire1, order0. S₃ monomial plane: invariant multiplicity0, entire. 1⊕1: pole−2, still satisfies predicate. | Pass; strong-Artin entireness route needs trivial-character case handled separately. |
| 8.2 weight-one dictionary headline | η(z)η(23z): good traces at2,5 are−1,0; determinants1,−1; polynomialsX²+X+1 andX²−1. Level23=Artin conductor23; odd c has eigenvalues1,−1. | Matches Deligne–Serre forward direction and supplier conventions. |
| 8.2 quadratic induction and multiplication | Imaginary quadratic induction: c swaps basis, trace0,det−1. Real quadratic signatures(+,+) give det+1; mixed(+,-) give−1. Twisting by the quadratic quotient character fixes the induced representation. | Pass; theta/newform construction remains supplied automorphic theory. |
| 8.3 Stark order and regulator dimension | Trivial character, K=F=ℚ,S={∞}: unit rank0, augmentation rank0, r=1−1=0. S={∞,2}:r=2−1=1, unit generator2 has log2≠0. | Pass for rank/order tests; general regulator source uncertified. |
| 8.3 weight-one Stark unit | Conductor23 Artin field has signature(0,3), hence0 real embeddings; chosen-conjugation fixed field has degree3 and1 real embedding. For b=1/d, clearing denominators needs m=d. | Repairs R12/R18; b=1 alone is not full conjecture. |
| 9.1 mod-ℓ carrier, image and index | GL₂(F₂):order6; full image index1, determinant group order1/index1. Quadratic transvection image order2,index3. n=0:GL₀ order1. | Pass for finite fields; carrier binder R22 and imperfect fixed field R01. |
| 9.1 irreducible/absolutely irreducible | C₃ onF₂²: polynomialX²+X+1 irreducible; overF₄ two eigenlines. c=I,det(c)=1=−1. FullGL₂(F₂) natural module has no common invariant line overF̄₂. | Oddness shortcut fails R21. |
| 9.3 class polynomial and determinant | GL₂(F₂) order3 element: X²+X+1, determinant1. Identity and transvection both have(X+1)² but orders1 and2. | Class polynomial invariant passes; polynomial cannot determine order in characteristic2. |
| 9.3 order divisibility | I₂ overF₃:order1, charpoly degree2 versus X¹−1 degree1. Minimal polynomialX−1 dividesX−1. | Fails R04. |
| 9.3 generating sets | Quadratic transvection image order2; ambient GL₂(F₂) class size3; its closure order6. Image-level conjugacy class singleton generates order2. | Fails R03; corrected group works. |
| 9.3 cofinite recognition versus finite test | Trivial and quadratic17 characters overF₃: at2 both1; at3 values1,−1. Coefficient difference is detected on the common C₂ quotient’s nonidentity class. | Cofinite semisimple statement consistent; finite-bound consequence fails R05. |

### Headline coverage

The README’s deep endpoints are: open-kernel/finite-level equivalence and semisimple character recognition; local and global Artin formalism including ramified induction and Dedekind-zeta factorization; meromorphic continuation, completed functional equation and root number; order at zero; conductor–discriminant; orthogonal global and elliptic/local-field root numbers; Klein classification and the field/container invariants; Artin, weight-one and Stark interfaces; and mod-ℓ Chebotarev recognition.

Suggested.lean states open kernels, finite-level recovery, character recognition, local polynomials, convergence, meromorphy, orders at zero/one, Klein’s abstract isomorphism-type classification, and cofinite semisimple recognition. The module docstring identifies conductor/completion/epsilon-dependent endpoints, weight one and Stark as omitted. It incorrectly treats the main file as an API catalogue, misses the statable factorization endpoint (R23), and admits the false container and generation statements (R02/R03). It also calls induction’s coset choice a missing carrier although Mathlib already has IndV; a future short signature should use the existing induction carrier. The full conjugacy-uniqueness formulation of Klein in the README is stronger than the abstract five-case disjunction in Lean; its geometric realization and uniqueness proof remain README obligations.

### Pinned declarations opened

Pin-relative paths below refer to the versions in lake-manifest.json, not current web documentation. These supply objects rather than proving this roadmap’s new analytic assertions.

| Library file and line | Declaration / inspected contract |
|---|---|
| Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42 | Field.absoluteGaloisGroup uses AlgebraicClosure, not SeparableClosure. |
| TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:277, 325 | mem_perfectClosure_iff_fixed and absoluteGaloisGroupRestrictEquiv; the action/closure distinction explains R01. |
| Mathlib/RepresentationTheory/Continuous/Basic.lean:54, 73 | ContRepresentation is a homomorphism to continuous linear maps; no continuity in the group variable is included. |
| TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean:55 | Representation.isOpen_ker_of_finite requires a finite module and open stabilizers for every vector. |
| Mathlib/RepresentationTheory/Induced.lean:77 | Representation.ind lives on the native IndV carrier. |
| Mathlib/RepresentationTheory/Character.lean:55, 63 | Representation.character and char_one; direct one-lemma padding witness. |
| Mathlib/LinearAlgebra/Charpoly/Basic.lean:44, 60 | LinearMap.charpoly and charpoly_one; identity eigenvalue multiplicity is retained. |
| Mathlib/GroupTheory/Index.lean:480 | Subgroup.index_eq_one; index1 iff subgroup is top. |
| Mathlib/Algebra/Group/Subgroup/Ker.lean:146 | MonoidHom.range_eq_top; range top iff surjective. |
| TauCeti/RepresentationTheory/CharacterTable/Table.lean:206, 244, 249 | irreducibleCharacter, characterDegree and irreducibleRepresentation on Fin (characterDegree) → k; algebraically closed coefficients and invertible group order. |
| TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean:309 | character_eq_sum_nsmul_irreducibleCharacter, with finite group, algebraically closed field and invertible group order. |
| Mathlib/Analysis/Meromorphic/NormalForm.lean:143, 177 | Normal-form meromorphic order detects analyticity/nonzero values; arbitrary point values are not the intended continuation. |

Twelve library-file entries were opened, in addition to the imported finite-field, Frobenius, character and Galois implementations used by the signature checks. Object searches covered Mathlib and Tau Ceti, roadmaps on main, the supplied open-head index through roadmaps grep/show, and board packages (19 README/plan matches). No duplicate fully qualified declaration in the ArtinRepresentations namespace was identified. This is not a claim that every name in the expansive library inventory was independently reproved.

### Resolved supplier contracts

| Supplier and exact place | Resolution |
|---|---|
| EtaleCohomologyFoundations §F.4.0, README.md:850–878 (main) | ContinuousRep, joint continuity, finite-projective carrier and base change exist as targets. The specialization comparison is meaningful. |
| RepresentationTheory/InductionRestriction Layers 2,6,7 (main) | Finite induction, Frobenius reciprocity, Brauer/virtual-character theory and projective representations are existing work. |
| RepresentationTheory/CharacterTheory Layers 4,7 (main) | Character-field and irreducible Frobenius–Schur theory are existing work; no general reducible trichotomy follows. |
| ArithmeticGaloisRepresentations §§1.4,2.5,2.5a,3.1–3.6,4.1,4.4,5.1,5.3,5.7 (resolved head) | The underlying named mathematics is present. In §2.5 the cyclic-block statement is prose, not the cited Lean identifier; cite the target title. §4.1 carries the characteristic-two exception. §2.7 higher-rank epsilon contract fails R14. |
| LFunctions Layers 0,3–5,7 (main) | Analytic cards, primitive/presented Hecke functions, continuation, functional equations and nonvanishing are present. The finite polar-divisor contract explains R19. |
| ClassFieldTheory Layers 7,9,11–13 (main); Completed/LocalFieldsRamification Layers 2–4 | Reciprocity/Weil groups and ramification are the intended owners; use completed-path/pinned implementations for completed local theory. |
| Completed/NumberFieldArithmetic Layers 1.4,2,4–6; completed ArithmeticDirichletSeries | Prime splitting, Frobenius, relative discriminants, completions and Euler-product infrastructure are the relevant contracts. |
| GL2AutomorphicRepresentationsAndTransfer R20.5.1,6–10, README.md:2241–2350 (resolved head) | Solvable rank-two strong Artin and the exact-conductor classical weight-one dictionary are stated; no new theta-series construction belongs here. |
| AutomorphicGaloisRepresentations §2.10, README.md:1418–1440 (resolved head) | Arithmetic polynomial X²−a_pX+ψ(p), irreducibility in the cuspidal case, and the same-Frobenius dual polynomial are stated. |
| ModularityAndLanglandsExtensions §§1.2,1.9, README.md:485–515,639–649 (resolved head) | Strong-Artin convention dualizes for geometric reciprocity; odd totally-real rank-two weight one is supplied. Entireness clause excludes the trivial character. |
| AnalyticNumberTheoryPartI §2.41, README.md:1598–1608 (resolved head) | ArtinHolomorphy is already defined as a hypothesis, consistent with the stated adapter, inconsistent with an unconditional no-extra-poles card. |
| AdelicAlgebraicGroups AA.2.4 artin-local-factors/convergence-factors | Existing owner, R20; absence of Lean declarations does not transfer ownership. |
| Completed/Chebotarev Layers 10,14, README.md:416,622 (main) | The named Dirichlet and natural density targets both give class size divided by group order; the latter is not inferred merely from the former. |
| ClassicalArithmeticCompletion README.md:19,267–269 (main) | Imports Artin functions from AA.2.4; it does not establish the claimed backward dependency on this roadmap. |
| PadicExtensionFamilies §2.7, README.md:778–793 (supplied head) | Galois-closure top slope, tame1/unramified0, matches §9.2. |
| PolynomialGaloisGroups Layer 6, README.md:1172 (main) | n≤5 only; proposed Layer1D is not a permissible supplier, R15. |

The on-main InductionRestriction, LocalFieldsRamification and LFunctions roadmaps were read as shape examples. Searches also found the form-theoretic Stiefel–Whitney ownership in QuadraticFormInvariants; that does not by itself supply the Galois-representation class and comparison missing in §6.3. New ownership that can remain here includes the Artin-specific invariant adapters, stem/container organization and any genuinely new Klein endpoint, after resolving foundational duplication. No ownership move or dependency file was edited.

### Seeded source sample

All 15 requested targets were traced through the sources service and legal copies. Exact locators missing from the README are covered by R25; none is explicitly flagged there as “unverified”.

| Sample target | Text and locator actually inspected | Outcome and hypotheses |
|---|---|---|
| 1.5 Restriction and induction | serrerep §7 was requested; the publisher copy is uncertified. martinet1977 lines 222–242, author-copy pp.9–10, give the L-function formalism. | The survey supports induction invariance, not the claimed kernel-field formula including rank zero. R07 supplies the separating instance. No exact printed source locator for that formula was verified. |
| 2.1 Inertia invariants and predicates | serrelocal IV was requested; no readable publisher text. The native invariants and cited local-field supplier were inspected. | Source locator uncertified. Dimensions 1,0,1 in the table distinguish trivial, ramified quadratic and tame S₃ cases; no finite-image/infinite-dimensional extrapolation is certified. |
| 2.2 Local polynomial and Euler factor | deligne1973 lines 756–774, §3.5–3.6, pp.528–529; lines 792–833, Proposition 3.8(ii) and proof/Lemma 3.9, pp.530–531. | Finite-dimensional continuous complex Weil representations, finite separable local extension; induction includes ramification. Deligne uses geometric Frobenius. The roadmap must use its stated inverse/dual convention comparison, not identify the two operators. OCR drops parts of displayed formulas; the cyclic-block determinant was independently recomputed, and no missing glyph is certified. Neukirch VII(10.1) remains uncertified. |
| 2.3 Conductors, consumed | martinet1977 lines 578–621, author-copy pp.21–23; serrelocal VI and neukirch1999 VII(11.4) unavailable. | The readable survey assumes a finite normal extension with separable residue extensions, states integrality and the unramified/tame cases, and records induction with the discriminant. It does not certify the unavailable textbook numbering. ArithmeticGaloisRepresentations Layer 3 remains the owner. |
| 3.1 Global local polynomials | neukirch1999 VII(10.1) unavailable; martinet1977 lines 215–242, pp.9–10; AA.2.4 supplier text. | Survey supports the inertia determinant construction and independence; the exact Neukirch locator is uncertified. Existing ownership is R20. |
| 3.3 Complex conjugation and archimedean data | neukirch1999 VII§12 unavailable; deligneserre1974 lines 283–290, remarks 4.4–4.5, p.514, inspected for the weight-one odd case. | The latter verifies determinant −1 and the two opposite eigenvalues for odd dimension two, not the entire general gamma-factor target. General textbook locator remains uncertified. Eigenvalue and gamma-factor examples are recorded above. |
| 3.6 Adelic convergence-factor comparison | AdelicAlgebraicGroups AA.2.4 artin-local-factors and convergence-factors, README.md:1994–2044; ClassicalArithmeticCompletion README.md:267–269. | Exact earlier targets exist. They already own the finite-image inertia factors, formalism and Artin–Hecke comparison. The asserted direction of import fails R20. |
| 4.1 Meromorphic Artin L-function | martinet1977 lines 393–484, author-copy pp.14–17; neukirch1999 VII(12.6) unavailable. | Survey explicitly gives meromorphic continuation and the Brauer-to-Hecke route for general finite complex representations; nontrivial rank-one entirety is distinguished. Published edition numbering was not compared. The exact Neukirch locator remains uncertified. |
| 4.3 Functional equation and root number | martinet1977 lines 393–404 and 434–486, pp.14–17; deligne1973 §§3.5–3.8 for local conventions. | Survey states the completed functional equation with contragredient character and unit-modulus constant. It does not justify arbitrary coefficient-automorphism equivariance. Global formula examples agree; local supplier failure is R14. Neukirch VII§12 remains uncertified. |
| 4.4 Order at zero and analytic card | tate1984 I Proposition 3.4 requested, publisher copy uncertified; LFunctions Layer 0 read directly. | The exact Tate theorem/page was not verified. Trivial, odd/even quadratic and S₃ orders were computed above. The analytic-card requirement is stronger than the unconditional continuation, R19. |
| 5.1 Conductor–discriminant formula | martinet1977 lines 418–429 and 606–621, pp.15,22–23; neukirch1999 VII(11.9) unavailable. | Survey records conductor induction with the relative discriminant and dimension exponent. The regular-character specialization agrees with quadratic and S₃ exponents in the table. Exact textbook theorem/page remains uncertified. |
| 6.5 Elliptic local root numbers | rohrlich1994 lines 843–864 (§12,p.144), 980–997 (§13,p.147), 1223–1273 (§19,pp.153–154), 1303–1306 (§20,p.155); rohrlich1993 lines 249–251 (Prop.2(v),p.126), 332–386 (proof), 410–438 (Prop.3,pp.132–133). | Normalization is epsilon divided by its modulus; the representation is the Tate dual. Multiplicative and potentially multiplicative cases are supported. The displayed potentially-good table in 1994 §19(iii) assumes K=ℚ_p, p≥5; this does not certify the roadmap’s general K formula. R11 records the normalization defect and the missing general-field support. Some 1993 display text is absent in extraction, so those missing symbols were not certified. |
| 7.4 Image, Artin field and stems | lmfdb (artin.number_field) lines 90–93; lmfdb (nf.stem_field) lines 90–93; artin.stem_field cross-reference read. | Artin field is the minimal Galois factorization field over ℚ; a stem’s Galois closure is the given Galois extension. These support the number-field definitions and the core-free subgroup interpretation. They do not support an inseparable algebraic-closure fixed-field extension, R01. |
| 7.6 Klein classification and projective type | klein1884: only a GDZ §8 excerpt was retrieved, concerning icosahedral rotations; no exact classification locator in README. | Full classification and conjugacy uniqueness not source-certified. The orbit equation, small dihedral/V₄ cases and abstract subgroup orders were computed. The excerpt cannot substitute for the missing complete statement. |
| 8.2 Weight-one dictionary | deligneserre1974 lines 262–274, Thm.4.1, pp.513–514; lines 293–306, Thm.4.6 and Cor.4.8, pp.514–515. | Nonzero weight-one Hecke eigenform with odd nebentypus; arithmetic Frobenius explicitly identified in the footnote. Irreducible iff cuspidal. Exact conductor and L-function equality require primitive cuspidal form. These certify the forward direction; the reverse direction is a separate automorphic supplier, not a conclusion of these theorem numbers. |

Additional readable checks: deligne1976 lines 99–122, Theorem 1.5 and its global consequence, distinguish the local cohomology invariant from the global orthogonal sign. lmfdb (lf.root_number) lines 90–116 explicitly uses −i for the real sign character and defines the field invariant through the permutation representation; that is the conjugate convention accounted for in the roadmap’s p-adic-field examples. jonesroberts2006 lines 226–228, §3.3 of the fetched 2003 arXiv version, describes the fourth-root invariant; no equivalence of its pagination with the 2006 publication is asserted. lmfdb (cmf.stark_unit) lines 90–96 supplies the quantifiers and coefficient weights used in R12/R18.

## Not verifiable

- Exact textbook locators in neukirch1999 (VII§§10–12), serrelocal (IV–VI), serrerep (§§2–3,7–10,12–13), and tate1984 (I Proposition 3.4, §§5–7): the sources service reached publisher records/paywalls, not readable texts. They remain uncertified; no paywall was bypassed.
- chinburg1983 and halberstadt1998: Elsevier DOI records were available, but the primary texts were not. The LMFDB knowl verifies the stated Stark formulation, not Chinburg’s original proof or Halberstadt’s tables. The p=2,3 acceptance-table claim was not certified.
- tate1979: its DOI redirected to an access gateway. frohlichqueyrut1973: citation resolver and legal-source search found no readable article. frohlich1985: EuDML supplied metadata only. The readable Deligne paper does not certify all statements or locators in those different works. These missing texts are recorded together for the worker.
- klein1884: the full Dartmouth scan retrieval stalled; GDZ returned only §8. The complete classification locator is still missing. No conclusion about a source error follows from this.
- The Martinet author-copy and Jones–Roberts preprint were read, but their numbering was not matched against the cited printed editions. OCR/extraction omitted portions of several Deligne/Rohrlich displayed equations. The report relies on readable hypotheses and independently computed witnesses, and does not claim every missing formula symbol was visually verified.
- The wildcard LMFDB knowls and both named website implementation files are not exact per-claim locators. Seven relevant index/knowl pages were retrieved; the complete live database schema, all displayed curve/field labels and the numerical tetrahedral field identification were not independently certified. This does not affect the algebraic counterexamples.

These limits do not park the review. The verdict rests on the explicit defects above. No source-unavailability item was converted into a mathematical-error finding, and no missing text was guessed.

## Source issues

- none
