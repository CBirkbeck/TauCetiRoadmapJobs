# Repair report

## F01 (P1) — applied

Replaced A₈ → A₉ only in the eleven-dissection’s residue-five term in the README and plan. Added its general theta-product derivation, a source-misprint note, and `dissectionCrankFortyNine`. Updated Garvan1988’s manifest locators and version note. The product correction agrees independently with Garvan1988 (6.24), line 748.

## F02 (P3) — applied

Changed a=1/2 → a=−1/2 in `largeBaseRadius` and Layer 2’s examples in both files. Added the coefficient-ratio limit and `largeBaseTermination`, retaining a=1/2 as the polynomial control. The convergence theorem’s hypotheses and classification need no change.

## Mathematical verification

Garvan1988 line 695, equation (6.8), printed p. 64, contains the erroneous A₈. Its product definitions are at Garvan1988 line 701 through line 706. The repair follows from the theta addition identity at Garvan1988 line 711, the root substitution at Garvan1988 line 719, and the product expansions at Garvan1988 line 668 and line 675. The residue-difference identity (6.24), Garvan1988 line 747 through line 749, supplies an independent consistency check using A₉.

Here is the algebra behind the derivation added to §4.4a. Write J(z;Q)=P(z,Q/z,Q;Q), and use the README’s K and N. Substitution in theta addition gives N=K E(q¹¹)V. Every factor of K is nonzero for a primitive eleventh root; E(q¹¹) is nonzero on the disc. For 0<|q|<1, the absolutely convergent triple product gives, for h=0,1,2,

`J(ζ^k q^h;q^3) = sum_(t=0)^10 (-1)^t ζ^(kt) q^(3t(t-1)/2+ht) J(q^(11(15+3t+h));q^363)`.

This follows by writing the bilateral summation index as 11m+t. Apply J(Qz;Q)=−z⁻¹J(z;Q) and J(Q/z;Q)=J(z;Q) to express these terms using Q_b(q¹¹). Multiplication in N and reduction by 1+ζ+⋯+ζ¹⁰=0 gives the following entire residue-five part, with H=−K(c₂+c₄):

| Product term, every Q evaluated at q¹¹ | Coefficient |
| --- | --- |
| q⁵Q₁₅Q₁₁ | 0 |
| q⁵Q₁₂Q₁₃ | H |
| q³⁸Q₁₂Q₂ | −H |
| q¹⁶Q₉Q₁₀ | −H |
| q⁴⁹Q₉Q₁ | −H |

Consequently that part is −K(c₂+c₄)q⁵(A₃B₂−q¹¹A₉B₇). Division by K E(q¹¹) proves the corrected component for every coefficient. The value q=0 follows by continuity. This argument uses a finite regrouping of infinite theta identities, rather than inferring an identity from a truncated expansion.

Independently, (6.24) says that consecutive vector-count differences in residue five are 0,H₀,−H₀,H₀,−H₀, with H₀=(A₃B₂−XA₉B₇)/E(X). Thus the counts in classes 2 and 4 differ by −H₀ from the common count in classes 0,1,3,5; symmetry supplies the opposite classes. Summing against powers of ζ and using 1+c₁+⋯+c₅=0 gives exactly −(c₂+c₄)H₀.

For F02, Gasper1995 line 313 gives the finite base-inversion identity and Gasper1995 line 323 the large-base binomial domain. Directly, for cₙ=Pₙ(a;2)/Pₙ(2;2) and a=−1/2,

`c_(n+1)/c_n = (1+2^(n-1))/(1-2^(n+1)) -> -1/4`.

Every numerator factor is positive and every denominator factor is nonzero. The radius is therefore 4, and z=3 is strictly inside it. For a=1/2 the factor with index one vanishes, giving precisely 1−z/2.

## Adversarial mathematics pass

The table covers the mathematical statements, definitions and conventions affected by these repairs and their immediate consumers.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §2.1 normalized unilateral series used in §2.3 | q=2, r=1, s=0, n=0,1,2; a=±1/2 | The normalization exponent is zero; denominator factors 1−2ʲ, j≥1, never vanish. | None to definition. |
| §2.3 `basicHypergeometric_convergence`, `phi_summable_iff`, base inversion | a=−1/2; z=0,3; radius boundary 4 | Coefficients begin 1,−3/2,1,−3/7,1/7. Ratio modulus tends to 1/4. Base inversion has only nonzero parameters. | Correct `largeBaseRadius` and examples. |
| §2.3 termination convention | a=1/2, n=1,2 | Coefficients are 1,−1/2,0,0,…; the finite tail overrides the nonterminating classification. | Add `largeBaseTermination`. |
| §4.4a theta addition and J, E, Q, A, B conventions | a=ζ⁹,b=ζ⁵; all eleven index classes; q→0 | K is nonzero; Euler denominators are nonzero; only Q₉, hence A₉, occurs in the second residue-five product. At q=0 the component has constant −(c₂+c₄). | Add the all-coefficient derivation and source note. |
| §4.4a `rankCrankDissections_coeff`, `rankCrankDissections_products` | Degree 49; numerator degrees 0–4; all primitive eleventh roots | Each ordinary crank count is 15775. Correct numerator is 1−X−X³−X⁴+O(X⁵); division by E gives degree-four coefficient 0. A₈ gives 1. Cyclotomic algebra transports the result to every primitive root. | Replace the single A₈; add `dissectionCrankFortyNine`. |
| §4.4a `rankCrankDissections_vanish` and §4.5 equidistribution consumer | Distinguish residues 5 and 6 modulo 11; size-one correction versus size 49 | The correction changes a residue-five product; the residue-six zero component and downstream equidistribution statement are preserved. At size 49, C and V have the same coefficient. | No consumer signature change. |

## Checks and scope

- **Dependency check:** the prescribed command with candidate `packages/QSeriesPartitionsAndMockModularForms/design/README.md` exited 0. Exact output:

```text
candidate: QSeriesPartitionsAndMockModularForms is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 40 edges, 0 problem(s)
```

- **Exact arithmetic controls:** passed. Root coefficients of the regrouped theta products were checked in ℤ[Z]/Φ₁₁(Z); the four nonzero terms and the cancellation above agree exactly. Independent truncated vector-crank multiplication and ordinary partition crank enumeration both gave eleven copies of 15775 at degree 49. The numerator/E coefficient controls gave 1 for A₈ and 0 for A₉. The first five unilateral coefficients for a=±1/2 agree with the values above. These computations are controls, separate from the general derivation.
- **README/plan consistency:** passed after normalizing paragraph whitespace, which the plan flattens. Both affected theorem statements, proof sketches, all their Check names, the three changed/new Check texts, and Layer 2’s examples agree. JSON and TOML parsing passed. No obsolete residue-five expression remains. No declaration was renamed or deleted.
- **Whitespace check:** `git diff --check` passed.
- **Lean:** no `Suggested.lean` exists in this design package, and no Lean command is authorized by the brief. No elaboration was run. The degree-49 Check remains a requirement for a proved package-stage mirror on the eventual q-series/statistic carriers; no artificial carrier or admitted data was introduced.
- **Ownership and pins:** read the main-branch ComplexTori and ThetaSeries roadmap shapes, and the available CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics scope statements. Neither correction moves ownership or introduces a supplier. GitHub code search located the native partition generating-function and conjugation files; these were then read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Nat.Partition.genFun` and `Nat.Partition.coeff_genFun` retain the existing carrier and coefficient interface. No duplicate library target is needed.
- **Sources:** both findings were settled using the legally cached Gasper1995 and Garvan1988 extractions and direct mathematics. No new source is missing; settled waived/uncertified entries were not reopened. Manifest access metadata is preserved.

Only the three authorized design/source files and this required report were changed. There is no merge-order change, no new target and no changed downstream API name. The pre-existing supplier gaps `classical-metaplectic-model`, `analytic-elliptic-regularity` and `vector-bundle-dolbeault` remain declared with their owners; this repair does not discharge them. No commit, push or external message was made.
