# Repair report

Finding ids retain the review numbering; each section identifies review r1a or r1b in its body. The overlapping Lean findings are settled together. Changes concern `packages/K3SurfacesAndSymplecticBoundedness/README.md`, `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean`, `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`, and only the top-level `gaps` list in `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json`.

## F01 (P2) — applied

Review r1a. Connected, relatively minimal proper surface map → proper flat surjective map with geometrically integral generic fibre of arithmetic genus one. Added `genus_zero_projection`: ℙ¹×ℙ¹→ℙ¹ fails that genus condition. Properness of the base remains explicit for global formulas. Evidence: enriques-one line 17528; restriction of the ruled surface’s canonical line to a fibre has degree −2.

## F02 (P2) — applied

Review r1a. “Multiple belongs to Pic” → assume nx=0, annihilate the image of x in torsion-free H²(O), lift x through the injective Chern map, and use torsion-free Pic. A quartic hyperplane has square 4 and refutes the old implication. Evidence: huybrechts line 464 through line 469.

## F03 (P1) — applied

Review r1a. Unqualified formal-Brauer trace → resolved pullback Br̂(Y)→Br̂(X), with named `tameInvariantDimension.brauerPullback_nonzeroTangent`. Nonzero tangent follows from proper coherent duality and degree trace on the dense étale locus. Added the nonflat A₁ quotient Check. Supplier declarations were read in SchemeAndStackFoundations §§2.19–2.21; artin-mazur-formal line 658 supplies the principal-units pullback model.

## F04 (P2) — applied

Review r1a. Global f_*L³ without a representative → `PolarizedK3Family.cubeProjectiveBundle`, the descended Brauer–Severi bundle P_λ, with overlap, cocycle and arbitrary-base-change comparisons. The stack pullback is Isom(P_λ,ℙ^(9d+1)), retaining its source identification. Added twist and nonsplit real quartic controls. Evidence: rizov line 1023 through line 1067; scalar ambiguity disappears on projectivization.

## F05 (P3) — applied differently

Reviews r1a F05 and r1b F03. Zero examples → three real-bodied definitions and six proved example scripts: congruence controls at 3 and 2, Wehler pairing/composition, and Mathieu values 24,8,3. Rank zero and the unipotent power identity are proved named boundary theorems, preserving two examples per definition. All names appear in the README. Pinned matrix, units, residue and prime-factor APIs were read; elaboration is unavailable.

## F06 (P3) — applied

Review r1a. Corrected Mukai (1.4) to p.187 and its §8 locator to pp.218–221; Artin (1.8) to p.548; surface factorization to pp.52–53, including the reference range. Evidence: mukai line 190 and line 1511; artin-supersingular line 209; stacks-surface-resolution line 2384 and line 2390. Added precise locators for the newly consumed specialization and deformation calculations.

## F07 (P2) — applied

Review r1a. Unnormalized mod-p Chern class → nonzero horizontal integral class, divided by its maximal p-power before reduction, followed by both graded Gauss–Manin obstructions. Added `divisible_chern_control` for L=M^p, whose de Rham Chern class is zero. Evidence: deligne-lift line 510 through line 526. The same normalization is explicit in the equivariant lifting argument.

## F08 (P2) — applied

Review r1a. Unspecified Galois-invariant geometric Picard group → separate finite-Galois Pic(X_K) invariants and absolute-Galois geometric invariants after rationalization. Identity extension now means identity on Pic(X). Added the real Fermat quartic’s skew conjugate lines. Evidence: huybrechts line 14011 through line 14025; their mutual intersection zero differs from either self-intersection −2.

## F09 (P3) — applied

Review r1a. Numerical substitutions alone → realized Fermat quartics over F̄₃, F̄₇ and F̄₅, with discriminants −9, −49 and finite height one respectively. Numerical sign/rank controls remain supplementary. Evidence: huybrechts line 15264 through line 15270; shioda-unirational-primary line 52 and line 137 through line 147. Rank-22 p-elementarity rules out −64 at p=3,7 and determines the correction of the printed “respectively”.

## F10 (P2) — applied

Review r1a. Ambiguous polyhedral list → explicitly binary tetrahedral, binary octahedral and binary icosahedral, in both contract copies, with characteristic domains unchanged. Recorded orders and the A₄ involution obstruction. Evidence: dolgachev-keum line 399 through line 419. Over ℂ, a nonidentity involution in SL₂ is −I, whereas A₄ has three involutions.

## F11 (P3) — applied

Review r1a. Closed-field rank controls alone → real Fermat quartic with geometric rank 20 and strictly smaller arithmetic rank. Conjugation exchanges distinct skew line classes; rational Galois descent identifies arithmetic rank with invariant dimension. Geometric rank stays 20 after ℝ→ℂ while arithmetic rank increases. Evidence: huybrechts line 12288 and line 14011 through line 14018.

## F01 (P1) — not actionable in this package: generic tame equivariant deformation theory is supplier-owned

Review r1b. The swap matrix refutes dolgachev-keum line 643. Replaced the Brauer/mod-2 route by named K3 lifting and Picard specialization targets, with primitive normalization and the rank-nine argument. Declared `gap:tame-equivariant-deformations` for SchemeAndStackFoundations Part II §tame-equivariant-deformations. Its generic fixed-functor theorem requires that supplier’s work; no existing supplier target is invented. Deligne’s graded maps are at deligne-lift line 273 through line 332.

The replacement distinguishes the two issues in the suggested repair. Averaging alone supplies the smooth fixed deformation space, not flatness of an arbitrary restricted pair divisor. The K3 proof establishes invariant tangent dimension 12 and applies both graded Gauss–Manin arguments to the normalized invariant crystalline class. It therefore also covers an invariant ample line with zero unnormalized de Rham Chern class. After a polarized equivariant lift, the complex anti-invariant H² has dimension eight and type (1,1), giving rank at least nine with an invariant ample class. Injective specialization then gives the same lower bound on the special fibre (huybrechts line 11901 through line 11908; line 14121 through line 14138). This is an explicit proof plan conditional on the declared generic supplier contract, not a claim that the supplier already exports it.

## F02 (P2) — applied

Review r1b. Candidates {2,3,4,5,6,7,8,11,15} → include 14. Added divisor-inversion and subgroup-divisibility deductions, the order-14 relation witness, and A₁₃⊕A₆⊕A₁ with rank 20 and determinant 196 to `extra_exclusions`. The nonsquare theorem excludes 11,14,15 uniformly. Evidence: direct identities 21+96+195=312, 3·48=144 and 8·3=24; dolgachev-keum line 465 through line 506 supplies the general exclusion.

## F04 (P3) — applied

Review r1b. Removed unused illusie-witt, gros-chern and liu records from `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`; no theorem was assigned an artificial citation. Their `cited_for` arrays were empty and the README consumed none of their locators. Crystalline Chern variation continues to use the named CrystallineCohomology contract and Deligne’s calculation. No settled source waiver was reopened.

## Adversarial mathematics pass

Rows include the associated defining conditions, interface laws and conventions; numerical controls do not stand in for geometric realization. “Retained” means no additional counterexample was found in the stated instances, not completion of a future theorem proof.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 `AlgebraicGeometry.IsK3` and its constructor/canonical API | Empty scheme, ℙ², E×E, smooth quartic; imperfect field | Nonemptiness, canonical triviality and H¹ distinguish the objects | Retained |
| §1.2 isomorphism and field-extension equivalence | Identity, tower, purely inseparable extension, rescaled volume form | Faithful field extension detects all conditions | Retained |
| §1.3 projectivity | Quartic over original field, imperfect field, dimension three control | Uses the general surface supplier, not geometric projectivity alone | Retained |
| §1.4 RR and contraction | O, quartic H, two basis vectors; p=2 | 2χ=4 and 8; contraction columns (0,1),(−1,0) | Retained |
| §1.5 numerical/torsion kernel | O, rational (−2)-curve, p-torsion | RR contradicts nontrivial numerical kernel | Retained |
| §1.6 quartic and Fermat | t=0,1,−1; characteristic two | χ=2,4,4; Fermat becomes a fourth-power thickening at two | Retained |
| §2.1 relative Picard and universal functions | Closed field, jumping family, zero section, arithmetic obstruction | Unramified does not imply relatively étale; Picard sections need not be lines | Retained |
| §2.1a infinite-height kernel | Zero vector, nonzero vector field, finite-height branch, p=2 | Nonzero kernel witness is essential; primary Nygaard locator remains waived | Retained |
| §2.2 closed forms | Zero form, p=2, finite/infinite height | Separate kernel and p-divisible branches avoid arbitrary-surface degeneration | Retained |
| §2.3 no vector fields | E×E control, K3 at p=2, tangent at identity | Oda/closedness inputs retained in all characteristics | Retained |
| §2.4 Hodge/crystalline ranks | Degrees −1,0,1,2,3,4; a W/p summand | Universal coefficients detect torsion; rank tuple (1,0,22,0,1) | Retained |
| §2.5 marked formal deformations | Dual numbers, unmarked automorphisms | Tangent 20; prorepresentability is marked | Retained |
| §2.6 pair divisor | O, ample M, M^p, p dividing square | Nontriviality does not imply nonzero mod-p Chern class | Primitive normalization added |
| §2.7 polarized lift | Bad degree, ramified trait, p=2 | Existence of a suitable trait does not assert all lifts work | Retained |
| §3.1 analytic predicate | Empty manifold, quartic, two-torus | Complex dimension two and H¹ exclude wrong carriers | Retained |
| §3.2 analytification/GAGA | O, rescaled form, nonprojective analytic K3 | Algebraic essential image is projective | Retained |
| §3.3 integral Betti/exponential convention | nx=0, x=c₁(H), positive winding on ℙ¹ | Membership in Pic does not imply zero; positive cup square is 4 | Torsion proof corrected |
| §3.4 integral étale ranks | ℓ=char excluded; ℓ=2 allowed; point trace | Integral freeness precedes rational rank comparison | Retained |
| §4.1 Picard base change/Galois | K=k=ℝ, ℝ→ℂ, purely inseparable extension | Relative and absolute Galois groups have different invariant domains | Separated the two comparisons |
| §4.1 `IsK3.picardSpecialization` | Constant family, quartic square 4, a rank jump | Intersection preservation and nondegeneracy give injection, not surjection | Named target added |
| §4.2 Picard lattice APIs | O, Gram [4], rational curve, complex-line pushforward | Bilinear square 4 versus half norm 2; projection factor 2 only for pushforward | Retained |
| §4.3 geometric rank | Closed field; real Fermat quartic and its conjugate lines | Arithmetic rank substitution now fails a Check | Nonclosed-field witness added |
| §4.4 cycle/saturation/ranks | Characteristic zero/positive; rank 22; multiplication by ℓ | Injective equal-rank map alone is insufficient; saturation required | Retained |
| §4.5 `firstCongruenceKernel` | GL₀, −1 in GL₁ at 2 and 3 | At 3 outside kernel; at 2 nontrivial square-one element inside | Definition and proved scripts added |
| §4.5 odd congruence theorem and depth laws | Depth a=1, odd ℓ; ℓ=2 counterexample | Odd binomial leading-depth step holds; even boundary fails | General theorem signatures retained |
| §4.5 finite-subgroup reduction, integral and p-adic | Trivial subgroup, A B⁻¹, rank zero | Quotient belongs to kernel and has finite order | Signatures retained |
| §4.5 `rank0_kernel`, `unipotent_two_term` | Fin 0; m=0,1,2; E₁₂²=0 | Empty index gives identity; upper entry 3m | Proved boundary scripts added |
| §4.6 bounded descent | Closed field degree 1, imperfect field, finite field, rational point | Rank descent survives torsion obstruction; integral descent needs its hypotheses | Retained |
| §5.1 symplectic kernel/inverse pullback | Identity, composition, generator rescaling, −1 at p=2 | Inverse pullback is a left action; −1 becomes +1 at two | Retained |
| §5.2 polarized stabilizers | Identity, scalar changes, L^n for n>0 | Class stabilizer discards scalar isomorphisms | Retained |
| §5.3 finite étale automorphism schemes | Involution, nonrational geometric automorphism, p=2 | Finite type and zero geometric tangent give finite étale | Retained |
| §5.4 Wehler existence and matrix model | Both deck matrices, Gram determinant −12, S₂S₁ | Pairing preserved; product trace 14 and determinant 1; reversed order matters | Native matrix definition and two scripts added |
| §6.0 supersingular discriminant | σ=0,1,10,11; p=2 | Negative sign and even unimodular obstructions retained | Retained |
| §6.0a height inequality | h=1,10,11,∞ | Rank bounds 20,2; 11 impossible; infinity not an integer substitution | Retained |
| §6.0b rank-five pencil | Positive rank-one lattice, primitive F versus 2F, p=2,3 | Isotropy needs rank threshold and primitivity; quasi-elliptic alternative persists | Retained |
| §6.0c height/pencil/Jacobian comparisons | No section, finite height, quasi-elliptic branch, rank 21 | Jacobian formulas and unirationality give rank 22 in the stated branches | Retained |
| §6.1 tame quotient/root determinant | Identity group, involution 8A₁, square rank-20 determinant | General nonsquare argument also applies to order 14 | Retained |
| §6.1a cyclic arithmetic | n=2,4,9,12,14,16,23,28; prime pairs | Order 14 survives all Euler/subgroup identities and has square determinant | Candidate and exclusion corrected |
| §6.2 tame fixed-point table | Identity excluded, orders 2,7,8 | Values 8,3,2; trace on H² at order 2 is 6 | Retained |
| §6.2a wild fixed-locus alternatives | Empty locus at two; divisor κ=0,1,2; D²=2,d=1 | No tame averaging or division by zero | Retained |
| §6.3 wild quotient comparisons | Rational quotient, free characteristic-two Enriques, K3 resolution | Free quotient has e=12, b₂=10; no Picard-rank inference | Retained |
| §6.3a wild refinements | p=2,3,7,11,13; quasi-elliptic pencil | p=11 exception and separate p>7 section-torsion theorem preserved | Retained |
| §6.4 wild prime bound | p=2,11,13; nonsymplectic finite group | Order-p element is symplectic; p=13 excluded | Retained |
| §6.4a rank-22 Picard faithfulness | Identity, p=2, rank-one polarization stabilizer | Full Picard action and rank 22 cannot be replaced by one ample class | Retained; primary locator waived |
| §6.5 étale faithfulness | Identity kernel, ℓ=char excluded, wild Enriques branch | All positive-characteristic quotient alternatives retained | Retained |
| §6.6 universal bound | G=1, p=3, a wild subgroup | Use ℓ=5 at p=3; averaging in group order unnecessary | Retained |
| §6.7d `IsK3.tameInvolutionLift` | Invariant tangent rank 12, L^p, p=2 | Normalized class still invariant; both graded maps needed; two excluded | Explicit K3 target and supplier gap added |
| §6.7d involution pencil | Swap matrix mod 2; exact order two; p=3 | Mod-2 inference false; complex rank ≥9 specializes injectively | Proof route replaced |
| §6.8 Artin-one predicate/APIs | Fermat at 3,7,5; wrong sign; rank 20 | Realized values −9,−49; ordinary surface fails predicate | Three geometric Checks added |
| §6.8a resolved Brauer pullback | Identity; tame A₁ nonflat quotient; common resolution | Proper trace is valid; finite-flat trace at quotient is not | Nonzero-tangent target added |
| §6.8a invariant dimension | G=1, C₇, order 21, even group, both Artin-one | Dimensions 24,6,6; exceptional four-dimensional branch preserved | Transfer route and involution dependencies repaired |
| §6.9 `mathieuCharacter` | n=0,1,2,7; prime formula | Total rational value 0 at 0 has no order interpretation; 24,8,3 at positive tests | Definition and two scripts added |
| §6.9 tame character theorem | Identity, wild element excluded, exceptional pair | Character formula only on positive tame orders | Retained; connected to native definition |
| §6.10 characteristic-zero bound | Trivial group; 1⁸2⁸; 23-cycle | Orbit counts 24,16,2; five-orbit condition excludes last | Retained |
| §6.11 tame exceptional branch | Tame at two, nonclosed base, four orbits | Odd-order restriction at two; no universal bound 960 asserted | Retained |
| §7.1 primitivity | Zero, generator, double, squarefree d | Zero fails; n² divides d for a proper multiple | Retained |
| §7.2 multiplication/root loci | n=0,3; p=3; F,2F; square and ample intersection both zero | Positive n closed immersion; primitive openness includes isotropic classes | Retained |
| §7.3 polarized families/APIs | Constant family, d=0, nontrivial Picard obstruction, scalar choices | Algebraic spaces and local representatives required | Projective-bundle interface linked |
| §7.4 ample cohomology | m=0,1,2,3,−1; quartic d=2 | m=0 has H²≠0; h⁰=4,10,20 for positive quartic powers | Retained |
| §7.5 cube embeddings | d=1,2; p=2; failure divisor with L·D=1 | Dimensions 10,19; evenness excludes D²=1 | Retained |
| §7.6 Hilbert K3 locus/APIs | Singular degeneration; canonical rank versus class; quartic cube | Scheme-theoretic class equality is essential | Retained |
| §7.7 descended P_λ and frame torsor | L⊗f*N, triple overlaps, nonsplit real quartic, automorphism stabilizer | Projectivization descends although L³ and vector bundle may not | Global interface corrected |
| §8.1 polarized stacks/quotients | Involution stabilizer, all primes, primitive open | Stack retains arrows; PGL torsor gives presentation | Retained with corrected atlas |
| §8.2 separation | Identity trait, nonsmooth degeneration, non-ruled K3 | Extends isomorphisms between existing smooth families only | Retained |
| §8.3 coarse space | Nontrivial stabilizer, nontrivial form | Coarse geometric point assertion is not arithmetic classification | Retained |
| §8.4 smoothness | d=1; p dividing 2d | Base ℤ[1/2] at d=1; no bad-prime smoothness assertion | Retained |
| §8.5 finite-field finiteness | Fixed k,d; twists; actual cubic frames | Brauer triviality gives line representatives and a surjection from finite H_d(k) | Retained |
| Supplier genus-one convention | ℙ¹×ℙ¹ projection; quasi-elliptic generic fibre | Arithmetic genus one excludes ruled projection without excluding cuspidal genus one | Hypotheses corrected |
| Supplier finite SL₂ classification | A₄ over ℂ; tame versus wild; binary orders | Ordinary polyhedral names are wrong for SL₂ | Contract corrected |
| Other supplier contracts | ℓ dividing group order with ℚ_ℓ coefficients; finite-flat versus proper trace; qcqs projectivity; dyadic lattices | Domains and explicit gaps preserved; no integral averaging or unconditional projective framing inferred | Three unused Brauer contracts replaced by the needed equivariant-deformation gap |

## Verification and maintainer notes

- **Elaborate `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean`: not available.** No Lean command was run. Consequently the new proof scripts, including the six examples, two boundary theorems and four API theorems, have not been elaborated; no `#check @...` scratch elaboration was possible. The three original admitted theorem signatures keep their explicit hypotheses unchanged.
- **Dependency check: exit 0.** Exact output:

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line.

- **Whitespace check:** `git diff --check` exited 0 with no output.
- **Consistency checks: passed.** JSON and TOML parse; all 23 gap slugs and needs sentences match the README contracts exactly; the plan’s non-gap content equals its original content. Every Lean declaration name occurs in the README. The Lean file has one `import Mathlib`, three real-bodied definitions, six example scripts without admissions, two proved boundary theorem scripts, four proved API theorem scripts, three admitted theorem targets, and no admitted data or `set_option`.
- **Pinned APIs:** read Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, `Matrix.GeneralLinearGroup.map`, its extensionality and entrywise map, units negation, p-adic characteristic zero and residue homomorphisms, matrix multiplication/trace/determinant, and `Nat.Prime.primeFactors` have the required domains. Searches by the matrix/congruence objects did not identify an existing matrix torsion-free kernel theorem to replace §4.5.
- **Sources:** all newly used passages were read from the legal cached extractions. No new inaccessible text was needed, and no missing-reference file was created. Existing waived and uncertified active citations remain settled at their stated locators. Source passages were not copied into the package.
- **Ownership and downstream consequences:** the generic extension belongs to SchemeAndStackFoundations Part II §tame-equivariant-deformations. Its absence is explicitly a supplier gap for human disposition. The three Brauer contracts used only by the replaced proof (`surface-brauer-localization`, `surface-brauer-kummer`, `equivariant-brauer-descent`) are no longer consumed and were deleted from this package’s gap list. No supplier roadmap was edited. The five supplied open sibling roadmaps supply none of the repaired interfaces.
- **Names:** no original Lean declaration was deleted or renamed. `IsK3.symplecticInvolution_genusOnePencil` keeps its name and strengthens its rank conclusion to ≥9. New geometric interfaces are `IsK3.tameInvolutionLift`, `IsK3.picardSpecialization`, `tameInvariantDimension.brauerPullback_nonzeroTangent` and `PolarizedK3Family.cubeProjectiveBundle`. Existing frame-torsor consumers now use P_λ, recovering f_*L³ only with an actual representative. The design plan outside `gaps` was deliberately left unchanged under the edit restriction.

Submission-format verification: finding headings retain the original F identifiers, with review labels in their bodies and the overlapping Lean findings settled once. The four README API names `wehlerPullbacks_zero`, `wehlerPullbacks_one`, `mathieuCharacter_one` and `mathieuCharacter_prime` now have matching proved theorem scripts in `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean`; their mathematical statements and the six example scripts are unchanged. Lean elaboration remains unavailable.

Validation recheck: the report parser recognizes 14 finding sections; `readme-ids-missing=0`. The prescribed dependency check exits 0 with `depcheck: 6 roadmaps, 42 edges, 0 problem(s)` and no UPWARD or CYCLE line. `git diff --check` exits 0 with no output. No Lean command was run.
