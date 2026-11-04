# Mathematical repair report

The first eighteen finding sections refer to RT-EllipticKTheory_r1a; the final four refer to RT-EllipticKTheory_r1b. Their overlapping claims were investigated together. Source passages were not copied. The mathematical tests below are falsification checks, not proofs of the admitted headlines.

## F01 (P1) — applied

Inverse transpose on geometric H¹ → inverse transpose on arithmetic H¹ and transpose on geometric H¹. Updated the supplier contract and §5.8 convention Check: for the trace-zero curve over 𝔽₃ the determinants are 1/3 and 3, respectively; twist two gives 27. Evidence: the dual action and inversion of the Frobenius generator; WeightsInEtaleCohomology R34.1–R34.2.

## F02 (P2) — applied

Unweighted residue embeddings → embeddings with inseparable multiplicity, or multiplicities in base-changed orders (§7.4). On ℙ¹ over 𝔽₂(s), the two values s and s⁻² have norm product s²s⁻²=1, while unweighted embeddings give s⁻¹. The normed theorem and degree-one Lean statement are unchanged. Evidence: determinant norm for a purely inseparable quadratic extension; K2SymbolsBrauer §10.30.

## F03 (P2) — applied

Unavailable projective cubic → supplied pinned carrier. Added the geometric-integrality headline on WeierstrassCurve.projModelOver, importing its individual ProjModel module; dimension and cohomology remain separate prose targets (§1.2). Verified ProjModel.lean:75,80 and Integral.lean:60 at the pin. Ellipticity is unnecessary, including for y²=x³. No corresponding geometric-integrality theorem occurs at the pins.

## F04 (P1) — not actionable in this package: earlier suppliers must state the missing contracts

The brief permits K3BlochGroups and ArithmeticKTheory, contrary to the eligibility witness, but neither has an available main/open-head roadmap. Registered gap:k3-field-inputs and gap:arithmetic-dedekind-inputs. Replaced every MotivicEtaleKTheory citation with verified MotivesAndAlgebraicCycles §§4.7–4.8 or explicit field/comparison gaps to eligible owners. Removed unused Suslin inputs. Only earlier-owner changes can discharge these contracts; no unavailable theorem is advertised as supplied.

## F05 (P2) — applied

Owned isogeny-to-scheme construction → imported AlgebraicCurves Layer 12C correspondence, transported by ModularCurves Layer 2A (§1.6, scope and contracts). Retained only degree, differential, kernel and divisor compatibility targets. Evidence: TauCetiRoadmap/AlgebraicCurves/README.md:1128–1147 and TauCetiRoadmap/ModularCurves/README.md:64–66. The package adds no competing scheme-map construction.

## F06 (P1) — applied differently

Unowned splitting → curveEInvariant, curveCoefficientEdge, its specified section, and their coefficient/Galois naturality (§5.7). Updated §§5.9 and 5.11 to use these maps. Checks compute the order-four element under Frobenius multiplication by three. Evidence: weibel lines 30656–30661 and 30723–30727. VI.2.5.1 concerns exceptional-field alternatives; the finite-field splitting uses VI.2.5 and VI.6.3, without importing those alternatives.

## F07 (P2) — applied

Quotient class treated as a certified lift → invariant rational tame-kernel input; quotient classes are lifted, averaged, then descended (§7.9). Added galoisDescent_quotient with preservation of constants and torsion and both transfer composites. Its quadratic Checks distinguish lifts from quotient classes; constants over ℚ(s,t) need not vanish rationally. Evidence: transfer base change and averaging over ℚ; ddz Remark 4.14, line 515.

## F08 (P2) — applied differently

Arbitrary base change of the regular comparison → arbitrary pullback of eigenspaces, with regular conclusions only when both required schemes are regular (§4.5). The supplier's §6.8 has narrower scope, so gap:general-scheme-adams-pullback records the missing general interface. Auditing its §6.9 also corrected coefficient weights to generalized weights with endpoint hypotheses; multiplication by 12 on ℤ/25 gives difference 10, square zero.

## F09 (P1) — applied

DVR resolution advertised globally → locally supplied theory and owned excellentSurfaceResolution (§6.2), global common resolution (§6.4), globalExceptionalContraction (§6.5) and globalBlowdownFactorisation (§6.6). Updated scope, contracts and consumers throughout Layer 6. Evidence: stacks lines 216035–216066, 216220–216223, 216434–216459 and 216548–216558. The resolution preserves the regular locus. Also corrected Scholl’s elliptic warning (§6.8).

## F10 (P3) — applied

Replaced the stale torsion-function name in scope, contracts and §7.5 by WeierstrassCurve.Affine.exists_principal_eq_zsmul_ofPoint_sub_infinity; applications use n=(C:ℤ). Evidence: pinned TorsionDivisor.lean:42. Corrected LineBundleClass from monoid to commutative group; its instance is pinned LineBundle/Class.lean:142. No alias was introduced.

## F11 (P3) — applied differently

Boundary examples and API padding in Lean → prose Checks. Kept the nonzero rational two-torsion and characteristic-torsion witnesses, added the rejected singleton certificate, and retained the formal coefficients 1,1/3 versus 3,1. Deleted non-headline model/certificate/API declarations and examples from Suggested.lean. The order-zero quotient calculation is now inside tameValue's real body; no missing ord_tameQuotient declaration is claimed in the README.

## F12 (P3) — applied differently

Infinite S outside the finite-S domain → finite_S_exhaustion in §6.8, using continuity and finite descent. Checks use S=∅ and S={2,3}; the denominator-three class forces 3 into any term containing it. SchemeKTheoryOperations §1.7 supplies descent of perfect complexes and finite diagrams; GeneralAlgebraicKTheory §3.2 supplies filtered-colimit K-theory. No finite-S definition was enlarged implicitly.

## F13 (P3) — applied differently

Absent manifest → fourteen lifetime source keys, complete bibliographic fields, locators and legal access records. Fetched every unsettled cited work through the source service. Bloch and Young retain the brief's explicit waived statuses; the review's request to reopen them was not followed. Grayson and Geisser–Levine are settled uncertified publisher references; the remaining ten works have certified legal copies.

## F14 (P3) — applied

Repetitions → instantiated Checks in §§3.1, 3.7, 3.8, 6.10 and 7.9: degree-two divisors and i/−i residues; the nonzero order-two infinity-support class on ℙ¹_ℚ; θ of order three over 𝔽₄; torsion −1 versus nonconstant vertical 1/w; and the two quadratic transfer composites. The support class vanishes generically and rationally. Evidence: projective bundle splitting and weibel V.6.12.

## F15 (P3) — applied differently

Common dependency list → separate Needs for coprime degrees, zero-cycle construction, splitting, BMS, finite generation, reciprocity exactness, tame-kernel finiteness and both Geisser–Levine statements (§5.5). Harder (3.2.3) assumes Quillen finite generation: harder lines 1589–1594. Replaced the circular reduction-theory attribution by gap:function-field-steinberg-homology to ArithmeticKTheory §3.2; weibel lines 19053–19066 state the exact homology input and conclusion.

## F16 (P2) — applied

Unspecified n → positive n invertible in the algebraically closed base, with geometrically connected smooth proper curve. Added the characteristic-two negative control in §5.8: μ₂ is the zero étale sheaf and H²=0, whereas ℤ/2 has two elements; for n=3 trace gives ℤ/3. All actual ℓ-power consumers have ℓ≠p. Evidence: the Kummer exact sequence under invertibility and the trace contract.

## F17 (P2) — applied

Geometrically connected Harder statement → all smooth projective curves, through constantFieldReduction and finite component products (§5.6). Formulas in §§5.7–5.11 use the exact constant field. Checks give K₁(ℙ¹_𝔽₄)=(ℤ/3)² over either stated base, and the same K₁ for ℙ¹_𝔽₂ ⊔ ℙ¹_𝔽₄. Evidence: weibel lines 30619–30620; stacks lines 134754–134796.

## F18 (P3) — applied differently

Out-of-order carriers and closing catalogue → Layer 1, Layer 5 and Layer 7 headline statements, each preceded only by needed simple definitions. Removed the model/API/example blocks; they are README targets. One module docstring lists the unstatable headlines and their missing carriers. The requested closing one-sentence replacement would omit that required explanation, so the carrier explanation stays in the opening docstring.

## F01 (P3) — applied

Review b: KTheoryLowDegrees §11.1 → §11.2 in scope, supplier contracts, §5.5 and Layer 5 dependencies. Verified the arithmetic setup at supplier line 965 and the actual SK₁ vanishing at lines 1003–1005. The Mennicke-symbol machinery is separately cited at §§10.1–10.3; no number-field theorem is applied to a function field.

## F02 (P3) — applied

Review b: K-book V.9.5 page 437 → page 438 in §§4.3 and 6.10. The §9 opening remains page 435. Evidence: weibel line 26535 marks PDF page 446, line 26555 states Proposition 9.5 and line 26562 gives (9.5.1); the declared offset is eight pages.

## F03 (P3) — applied

Review b: heading k-theory → K-theory. This retains the subject's conventional capital K and keeps the rest of the title lower-case. No internal heading link targets the changed title.

## F04 (P3) — applied

Review b: removed the temporal library split, “since”, “now”, “current” and the incorrect post-pin claim from scope, contracts and §2.3. Both Tau Ceti contract paragraphs describe the same pinned library. The acceptance-test explanation now accurately distinguishes the supplied cubic from unavailable K/cohomology carriers. This shares the pin verification of review a F03 and F10.

## Gate failures

- **Missing sources.toml:** created packages/EllipticKTheory/sources.toml, schema tauceti-roadmap-sources/v1, with fourteen unique keys. Source-service validation: 0 problems. Bloch/Young waivers were preserved; no missing-reference request remains.
- **tex=3:** joined the norm-residue formula into one code span and changed the BMS title to Unicode subscripts. The package content gate reports tex=0 and latex=0. No affected heading link required updating.
- **readme-ids-missing=13:** replaced the advertised identity/composition, minimality, uniformiser-divisor and candidate-to-K₂ API names by their facts in prose. Removed Check labels for the Bloch correction and tame-value tests. Deleted acceptance-test API padding, and removed every corresponding declaration claim throughout the README. Content gate: readme-ids-missing=0; no padding declaration was added to clear this gate.

## Validation outcomes

- **Lean elaboration:** exit 0 for packages/EllipticKTheory/Suggested.lean from the pinned content environment. Exactly four expected “declaration uses sorry” warnings, at the four headline theorems; no errors. Individually built the six imported Tau Ceti modules first, each successfully; no root build, update or cache command ran.
- **One-tactic negative probe:** replacing the new geometric-integrality admission by infer_instance fails with lean.synthInstanceFailed for GeometricallyIntegral W.projModelOver (exit 1); the other three admissions produce their expected warnings. Thus the new statement is not an existing instance restated as an admitted theorem. This scratch probe did not change the acceptance file.
- **Mechanical binder audit:** elaborated one scratch file containing the complete acceptance text followed by #check @name for all eight retained declarations. Exit 0, the same four warnings. Field, algebra, finite-field, ellipticity, extension, degree-one, support, annihilator and divisor hypotheses all remain in the elaborated signatures. No lost binder required changing a headline. The ordinary tame-quotient proof moved into the definition's body when its API theorem was removed.
- **Dependency check:** exit 0, exact output:

```text
depcheck: 14 roadmaps, 117 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order file was edited.

- **Source check:** exit 0, exact output:

```text
packages/EllipticKTheory/sources.toml: 0 problem(s)
```

- **Supplementary package-content gate:** tested the package through a scratch TauCetiRoadmap directory layout because this board stores it under packages. Every content category is zero, including missing declarations, TeX, imports, admitted data, private paths, metadata and source material. The full command reports ok=false solely for dirty=1, with “?? TauCetiRoadmap/”: that scratch repository has no commit, as required. This is not claimed as the worker's final submission gate. Actual-board git status contains only this package's authorized edits/additions.

## Source and ownership audit

Read the mathematical witnesses in the legal extractions: weibel III.2.5.1, IV.6.9, V.9.5, VI.2.1–2.5.1 and VI.6.1–6.7; levine Theorem 14.7; stacks 33.9.3–33.9.4 and 54.14.5/54.16.1/54.16.9/54.17.2; harder (3.2.3); ddz Construction 4.1, Lemma 4.2, Proposition 4.3 and Remark 4.14; dgjk Propositions 2.2 and 10.2 and Table 10.4. Scholl, Conrad and Poonen's cited model, image and Picard hypotheses were checked against their fetched author copies. Source text remains outside the repository.

All named available supplier sections were resolved against main or their indexed open heads, including the changed KTheoryLowDegrees and SchemeKTheoryOperations contracts. Read the main roadmaps AlgebraicCurves, ModularCurves and EllipticCurves for shape and ownership. Searched the indexed roadmaps by object and the supplied sibling heads for competing scheme-isogeny, surface, cycle-complex, Adams and splitting ownership. AlgebraicCurves owns the scheme-map correspondence; MotivesAndAlgebraicCycles owns cycle complexes. StableReduction supplies only the DVR surface results, so the needed global extension remains here. No verified later roadmap became a supplier.

The resolver still lists the absent K3BlochGroups and ArithmeticKTheory roadmaps; these are the explicit gaps, not claimed verified sections. The six gaps, including the general Adams extension and function-field Steinberg homology, have matching README lines and only top-level gaps data in packages/EllipticKTheory/design/plan.json. Supplier fulfillment and any resulting scope decisions belong to maintainers of the named earlier roadmaps.

## Computed adversarial pass

The rows distinguish the assertion tested, its instantiated calculations, the result and the repair. Tests of a general theorem are evidence against the indicated wrong alternative, not a proof for every input. Empty/trivial cases are included where they belong to the object's domain; fields exclude the zero ring, finite fields exclude q=1, and every symbol input is a unit so division by zero is outside its domain.

| Statement | Instances and computed values | Result | Change |
| --- | --- | --- | --- |
| Curve convention | ℙ¹_𝔽₄/𝔽₂: dim=1, constants=𝔽₄; the inseparable affine curve becomes ε²=0. | Regularity differs from geometric regularity. | Scope retained; base-change boundary explicit. |
| All closed points | div((t²+1)/(t²+2)) has rational coefficients 0 everywhere but two degree-two coefficients +1,−1. | Rational-point-only sequence fails. | §3.1 Check retained. |
| K/G convention | For a regular curve Cartan identifies both ranks with 1 on O; on a dual-number point Cartan sends its rank-one module to length 2. | Regularity is essential. | No singular Cartan inversion used. |
| Tame normalisation | ord(t)=1, residue(u)=2: {u,t}→2, {t,u}→1/2; {t,t}→−1, or 1 in characteristic two. | Both directions and parity distinguished. | Convention retained. |
| Residue-field carrier | At t²+1 over ℚ, t→i, t⁻¹→−i and N(i)=1. | Value is not in ℚ. | Retained. |
| Tate twist convention | q=3, trace=0: det on points=3, arithmetic H¹=1/3, geometric H¹=3; j=2 determinant=27. | Original dual-direction witness fails. | F01 repaired. |
| Finite-S convention | S=∅ gives O_F; S={2,3} over ℚ gives ℤ[1/6]; no finite S gives ℚ. | Infinite input excluded. | F12 repaired. |
| Coefficient convention | Over ℙ¹_𝔽₂, K₁=0; geometric divisible K₂ coefficients have two copies of ℚ₃/ℤ₃. | Integral/geometric/coefficient groups differ. | Retained. |
| EllipticScheme.charts | Z=1 gives y²+a₁xy+a₃y=x³+a₂x²+a₄x+a₆; O has Z=0,Y=1. | Affine chart misses O. | No duplicate carrier. |
| EllipticScheme.cover | Y=Z=0 forces X³=0 and thus X=0; projective all-zero point is excluded. | The alleged missing point cannot exist, even in characteristics 2,3. | Retained. |
| Zero-section comparison | O=[0:1:0]: Y-chart coordinate=1, Z-chart coordinate=0. | Only the Y-chart contains O. | Retained. |
| Geometric integrality headline | y²=x³ remains irreducible after algebraic closure; smoothness fails at (0,0), but the scheme remains integral. | Singular cubic does not refute the theorem. | New Lean headline; no ellipticity binder. |
| Dimension of the cubic | One nonzero irreducible cubic in ℙ² gives dimension 2−1=1; degree 3 does not give dimension 3. | Dimension agrees. | Kept separate from integrality. |
| H⁰ of the cubic | Plane cubic has H⁰=F of dimension 1, also for y²=x³. | Constants are fixed. | Separate prose target. |
| H¹ of the cubic | Degree-three arithmetic genus=(3−1)(3−2)/2=1; χ(O)=1−1=0. | Singular arithmetic genus also equals 1. | Separate prose target. |
| Regularity target | Smooth cubic has regular closed stalk dimension 1; cusp y²=x³ has embedding dimension 2 at (0,0). | Ellipticity cannot be discarded here. | Retained. |
| Noetherian/DVR interface | On ℙ¹ a closed stalk has dimension 1 and parameter order 1; its generic stalk is a field of dimension 0. | Only codimension one gives a DVR. | Retained. |
| Closed points to places | V(t²+1) has degree 2 and ord(t²+1)=1; infinity has degree 1 and ord(t)=−1. | Degrees and signs agree. | Retained. |
| Point/divisor compatibility | Origin gives (O)−(O)=0; nonzero two-torsion gives class P−O≠0 but 2(P−O)=0. | Zero or sign-reversed dictionary excluded. | Retained. |
| Point-count dictionary | Over 𝔽₅, y²=x³−x has 8 points; y²=x³ has 6 scheme points but 5 nonsingular group points. | Elliptic hypothesis is necessary for group dictionary. | Recomputed. |
| Scheme-isogeny correspondence | Identity gives degree 1; [2] in characteristic zero gives degree 4; zero map induces no field embedding. | Domain of supplied correspondence is respected. | Construction imported under F05. |
| Isogeny-degree compatibility | [3] over ℚ has generic rank 9, matching degree 3²=9. | Degree agrees. | Compatibility retained. |
| Isogeny-differential compatibility | [3] over ℚ pulls ω to 3ω≠0; characteristic-three Frobenius pulls ω to 0. | Separable/inseparable cases distinguished. | Compatibility retained. |
| Isogeny-kernel compatibility | [2] over characteristic zero has 4 geometric kernel points; inseparable Frobenius has degree p but only 1 geometric kernel point. | Kernel rank is not point count. | Compatibility retained. |
| Divisor-conorm compatibility | t=s² at zero gives e=2, residue degree 1 and 2·1=2. | Ramification multiplicity retained. | Compatibility retained. |
| zeroHom and line bundles | Constant map to O pulls a line bundle to its one-dimensional fibre tensored with O, class 0 in Pic; its divisor pullback away from O is 0. | No field embedding or finite-map formula used. | README only. |
| K₀ rank/determinant | O→(1,O), O_x→(0,O(x)); for V(t²+1), rank=0 and degree=2. | Rank and degree cannot be interchanged. | Imported rank–determinant theorem retained. |
| K₀ pullback naturality | t=s² sends O(1) to O(2), so (1,1)→(1,2); identity gives (1,1). | Degree scales, rank does not. | Retained. |
| Euler characteristic definition | On ℙ¹, χ(O)=1, χ(O(−1))=0; on ℙ¹_𝔽₄/𝔽₂, χ(O)=2. | Constant-field restriction matters. | Recomputed. |
| Euler additivity | 0→O(−1)→O→O_∞→0: 0+1=1. | Skyscraper sign is positive. | Retained. |
| Pushforward equals χ | On ℙ¹, π_*O=1 and π_*O(−1)=0; on an elliptic curve π_*O=1−1=0. | Pushforward is not rank. | Retained. |
| Riemann–Roch | ℙ¹: χ(O(2))=3=2+1; elliptic: χ(O)=0=0+1−1. | Correct genus/constant hypotheses. | Retained. |
| Divisor/Picard comparison | div(t)=[0]−[∞] maps to O(1)⊗O(−1)=O; [∞] maps to degree +1, not −1. | Principal class and sign distinguished. | Retained. |
| Open-curve class group | Cl(𝔸¹)=0 versus Cl(ℙ¹)=ℤ; infinity contributes degree 1 only on the proper curve. | Full-place import cannot be used on an open curve. | Retained. |
| Picard decomposition | O(P)→(1,P); O(O)→(1,0); O(P−O)→(0,P). | Origin splitting agrees. | Retained. |
| Degree-map surjectivity hypothesis | Real conic has no real point, degree image 2ℤ; after ℂ base change O(1) has degree 1. | Unpointed degree splitting fails. | Retained. |
| Picard descent injectivity | O(P−Q) geometrically trivial implies P−Q=0, hence P=Q; on the real conic an invariant degree-one class has no lift. | Injectivity and surjectivity separated. | Retained. |
| Pointed Picard descent | An invariant class of degree d subtracts dO(O), leaving invariant point P; adding back gives degree d, point P. | Both inverse composites give (d,P). | Retained. |
| Rank–determinant product | (0,1,O)²=(0,0,O); (1,0,O)·(r,d,P)=(r,d,P). | Componentwise ring would give degree 1 instead of 0 in the first test. | Retained. |
| Square-zero ideal | ([L]−1)²=0 and [O_x][O_y]=0; at L=O the first class is already 0. | Trivial and nontrivial line classes agree with the law. | Retained. |
| K₀ elliptic group | Over 𝔽₅, group is ℤ²⊕ℤ/4⊕ℤ/2; [O_P]−[O_Q]→(0,0,P−Q). | Both torsion and rank summands occur. | Retained. |
| Localisation tail | div(t²+1)=[x]−2[∞] gives degree 2−2=0; O has generic rank 1. | Adjacent maps and last-map sign distinguished. | F14 strengthened. |
| Degree-two boundary | {t,t²+1} at x gives i, reversed gives i⁻¹=−i; the other relevant values are 1. | Residue-field norm product=1. | F14 strengthened. |
| Divisor boundary | At t=0, t has order +1; at infinity order −1. | Both signs occur. | Retained. |
| Degree-zero transfer | [x] for degree-two x gives [O_x]→(0,2), while O→(1,0). | Generic rank annihilates the support term. | Retained. |
| Generic-rank surjectivity | O maps to 1, −O maps to −1; rank-zero skyscraper maps to 0. | All integers occur. | Retained. |
| Open-restriction naturality | Remove ∞ from ℙ¹: div(t) projects [0]−[∞] to [0]; remove nothing: [0]−[∞] unchanged. | Projection direction fixed. | Retained. |
| Finite-pullback naturality | t=s², {2,t} residue=2 downstairs and 2²=4 upstairs; identity gives exponent 1. | Ramification exponent needed. | Retained. |
| Finite-transfer naturality | Quadratic constant extension: N(res α)=2α; at ℚ(i)/ℚ, N(i)=1. | Norm, not ramification exponent, enters transfer. | Retained. |
| Rational K₂ injectivity | On ℙ¹_ℚ, ∞_*{−1,−1} has order 2, π_* sends it to the same nonzero element; generic restriction=0, rationalisation=0. | Integral injectivity is false. | F14 explicit counterexample. |
| Affine K₂ contrast | On 𝔸¹_ℚ, constants inject into ℚ(t); on ℙ¹_ℚ the support summand gives the kernel above. | Boundary example is not universal integral injectivity. | F14 explicit. |
| Finite-field K₂ injectivity | On ℙ¹_𝔽₂, K₂=0; at t²+t+1 the symbol residue θ has θ³=1 and θ≠1. | Higher-degree residue survives despite rational residue groups being trivial. | F14 explicit. |
| Curve SK₁ definition | ℙ¹_F: SK₁=∞_*F×; for F=𝔽₂ this is 0, for F=𝔽₃ it has 2 elements. | Zero subgroup is not a uniform model. | Retained. |
| SK₁ cokernel presentation | On ℙ¹_𝔽₃, the norm quotient has order 2; on ℙ¹_𝔽₂ order 1. | Both small characteristics included. | Retained. |
| Norm on SK₁ | At ℚ(i), u=i has N(i)=1; at rational infinity, u=2 has norm 2. | Degree-two norm and rational value differ. | Retained. |
| Base-point splitting | π_*∞_*(2)=2 and ∞^*∞_*(2)=1 in multiplicative K₁, by self-intersection factor 1−1=0. | Pushforward and pullback are different retractions. | Retained. |
| Coniveau pages | dim point=0 gives one column; ℙ¹ gives columns 0,1 and no column 2. | No extra column is introduced. | Retained. |
| Coniveau left term | F¹K₃(ℙ¹_ℚ)=ℤ/48; F¹K₃(𝔸¹_ℚ)=0. | Kernel alone does not determine K₃. | Retained. |
| Coniveau exact extension | For ℙ¹_ℚ, left=ℤ/48, right=ℤ/48, middle=(ℤ/48)². | Both pieces nonzero. | Page locator corrected. |
| Elliptic K₃ extension | For 37a1, π^*a and O_*b give π_*O_*b=b, O^*π^*a=a, while π_*π^*a=0 and O^*O_*b=0. | Two independent ℤ/48 copies detected. | Retained. |
| Adams eigenspace definition | ψ²(1)=1 and ψ²(z)=2z on K₀(ℙ¹); z=1−O(−1). | Weights 0 and 1 distinguished. | Defined before regular comparison. |
| Rational projectors | On ℙ², eigenvector z+z²/2 is not integral; basis 1,2z+z²,z² has determinant 2. | Integral projectors would be false. | Retained. |
| Regular weight bound | For curve n=0 weights 0,1; for field n=3 possible rational weights 2,3; j=4 gives 2j−3=5>4 and hence 0. | Bounds agree with cycle dimensions. | Retained. |
| Motivic tower layers | ℙ¹ has weight-zero ℚ and weight-one Pic⊗ℚ in K₀; codimension coniveau still has only two columns. | Weight and point filtrations not conflated. | Retained. |
| Motivic comparison regularity | A=𝔽₂(t)[x,y]/((y−x)²−t) is F(√t)[x]; after F(√t) base change, ε²=0 with ε≠0. | Base change is not regular. | F08 repaired. |
| Adams pullback | On ℙ¹, pullback O(1) along t=s² is O(2), ψᵏO(2)=O(2k)=f^*O(k); identity returns O(k). | Functoriality is independent of regular comparison. | General noetherian scope recorded as gap. |
| Finite-coefficient generalized weights | 0→ℤ/5→ℤ/25→ℤ/5→0, A=12: A−2=10≠0; (A−2)²=100=0 mod25. | Scalar eigenspaces miss extensions. | Corrected to supplier §6.9 hypotheses. |
| Indecomposable K₃ | For ℚ rational K₃=0 and weight two=0; Milnor triple products have ψᵏ factor k³. | Quotient isolates weight two. | Missing foundational quotient registered. |
| Curve K₃ Gysin weights | Residue weight 2 under a point pushforward becomes 3; weight 3 becomes 4. | Shift is +1, not −1. | Retained. |
| KPullback | Identity on O gives O; composition [2]^*[3]^*O(P) has degree 4·9=36, matching [6]^*. | Contravariant order and rank agree. | Retained. |
| KPushforward | On a finite degree-two map f, f_*O has rank 2; on an identity map rank=1. | Transfer has correct variance. | Retained. |
| Isogeny projection formula | f_*f^*(1)=[f_*O]=(2,L_f) for a 2-isogeny; [3] gives (9,O). | Degree alone misses L_f. | Retained. |
| Determinant obstruction | Finite étale degree-two isogeny has L_f²=O; for the x³−x 2-isogeny L_f≠O. | A nontrivial order-two line bundle survives. | Retained. |
| Odd multiplication determinant | For [3], L²=O and [3]^*L=L³=O force L=O since gcd(2,3)=1. | Odd m hypothesis used. | Retained. |
| Projective bundle basis | O→(1,0), O(−1)→(0,1), O_∞→(1,−1); rank/degree become (1,0),(1,−1),(0,1). | Basis conversion signs agree. | Retained. |
| Elliptic two-generator criterion | 37a1/𝔽₂ has E(𝔽₂)=ℤ/5, so two classes miss 5 point classes; trace +2 curve has E(𝔽₂)=0. | Both directions tested. | Retained. |
| Closed points of coprime degrees | On ℙ¹_𝔽₂ there is a degree-two point t²+t+1 and a degree-three point t³+t+1; gcd(2,3)=1. | Rational point not needed for this construction. | Separate Needs. |
| Degree-one zero-cycle | [x₃]−[x₂] has degree 3−2=1; empty cycle has degree 0; [x₂] has degree 2. | Signed coefficients needed. | Separate Needs. |
| Zero-cycle retraction | Restriction/transfer composite is 3−2=1; using only x₂ would give 2. | Specified map excludes wrong scaling. | Separate Needs. |
| Zero-cycle SK₁ section | π_*Σ n_x i_*res(u)=u^(3−2)=u; π_* of empty cycle gives 1. | Section and zero map differ. | Separate Needs. |
| Function-field BMS | R=𝔽₃[t]: SK₁=0, units=±1; R=𝔽₃[t,t⁻¹]: units=±tⁿ and K₁ has ℤ rank 1. | Does not assert finiteness on an affine curve. | §11.2 citation and Needs fixed. |
| Steinberg homology input | R=𝔽₂[t], rank(P)=1: Aut(P)=1, Steinberg group=ℤ in reduced degree −1, H₀=ℤ and H₁=0. | Rank-one input is finitely generated; rank 0 excluded. | Explicit supplier gap, no Harder cycle. |
| Curve finite generation | K₀(𝔽₂[t])=ℤ; K₁(𝔽₃[t,t⁻¹])=ℤ/2⊕ℤ. | Finite generation does not imply finite cardinality. | Separate Needs and missing input. |
| Reciprocity exactness | ℙ¹_𝔽₂ norm target has order 1; ℙ¹_𝔽₃ quotient has order 2. Degrees 2,3 give gcd(3²−1,3³−1)=gcd(8,26)=2. | Coprime-degree bound matches q−1. | Separate Needs. |
| Tame-kernel finiteness | ℙ¹_Fq: K₂=0 of order 1; multiplication by p on a cyclic group of order prime to p is invertible, but on ℤ not surjective. | Finite generation and p-divisibility both used. | Separate Needs. |
| Geisser–Levine comparison | k=𝔽₂,n=0: both coefficient groups ℤ/2^ν; n=1: k×=1, hence both mod-two groups 0. | Degree zero and positive degree agree. | Missing motivic input explicit. |
| Geisser–Levine no p-torsion | k=𝔽₃,n=1: K₁=ℤ/2 and kernel of multiplication by 3 is 0. | Prime-to-characteristic torsion allowed. | Retained. |
| Geisser–Levine colimits | A symbol over ⋃k_i uses two entries in some k_i; the zero symbol uses 0 entries; relations also use finitely many entries. | Finite descent, not perfectness of the union. | Own Needs. |
| Constant-field reduction | ℙ¹_𝔽₄/𝔽₂: H⁰=𝔽₄ has degree 2; over 𝔽₄ it has degree 1 and is geometrically connected. | Formula parameter must be q_X=4. | F17 repaired. |
| Component reduction | ℙ¹_𝔽₂⊔ℙ¹_𝔽₄: constants=𝔽₂×𝔽₄; K₁=0×(ℤ/3)², order 9. | Integral-curve definition not silently reused for a disconnected union. | F17 repaired. |
| Harder theorem | ℙ¹_𝔽₄ has K₁ order 9, odd; affine torus over 𝔽₂ has K₁=ℤ, infinite. | Properness essential; constant extension admitted. | Generalised. |
| curveEInvariant | On ℙ¹_𝔽₃, constant −1 maps to −1, whose order is 2; zero map would send it to 1. | Field summand detected. | New owned map. |
| curveCoefficientEdge | Over 𝔽̄₃, the edge of a pulled-back element of order 4 is that same element; zero goes to zero. | Target and section identify the actual field summand. | New owned map. |
| curveCoefficientEdge_split | Edge∘section sends 1/4 modℤ to 1/4; multiplication by 0 would give 0. | Composite equals identity. | New splitting law. |
| curveEInvariant_naturality | Frobenius on 1/4 at q=3 gives 3/4; either order of edge/section and Frobenius yields 3/4. | Galois compatibility has a nontrivial witness. | New owned law. |
| Finite-constant restriction compatibility | 𝔽₃→𝔽₉ sends −1 to −1; norm back is (−1)^4=1=(−1)^2. | Degree-two composite agrees with transfer. | New Check. |
| Geometric odd K-groups | K₁(ℙ¹_𝔽̄₂)=(𝔽̄₂×)²; at ℓ=3 each summand has elements of order 3,9. | Nonzero divisible summands differ from K₁ over 𝔽₂=0. | Explicit splitting input. |
| Geometric even K-groups | For ℙ¹, Jacobian=0 and even geometric K-groups=0; for elliptic E the ℓ-primary Jacobian group has two divisible coordinates. | Genus-zero boundary is not the elliptic case. | Retained. |
| Coefficient twist shift | K₂i coefficients have twist i twice; K₂i−1 coefficients have Jacobian twist i−1. At i=1 the latter is untwisted torsion. | Extra twist does not disappear. | Retained. |
| Cohomology descent range | q=3,j=2: H⁰ rational eigenvalue=9, H²=3, H¹ eigenvalues have absolute value 3√3; none is 1. At j=0, H¹(Spec𝔽₃,ℚℓ)=ℚℓ. | j≥2 matters. | F01 witness propagated. |
| Étale Kummer coefficients | On ℙ¹_𝔽̄₂: n=2 gives H²(μ₂)=0, n=3 gives ℤ/3. | Noninvertible n rejected. | F16 repaired. |
| Positive K-descent | X=ℙ¹_𝔽₃: K₁=(ℤ/2)²; invariants in two geometric μ groups are μ₂², also order 4. | Actual base change has the required invariant image. | Splitting maps now inputs. |
| Degree-zero descent contrast | 37a1/𝔽₂: K₀=ℤ²⊕ℤ/5 is infinite; geometric invariant point group has 5 elements. | Finiteness restricted to positive degree. | Retained. |
| Twisted kernel definition | Over 𝔽₃, P=(0,0) has 2P=0 and 3πP=P, so P∈B₁ and P≠0. Identity extension fixes P. | Wrong zero subgroup rejected. | README Check retained. |
| Prime-to-p condition | Over 𝔽₂, P=(0,1) has 2P=0, πP=P; no odd annihilator exists, so P∉B₀. | Wrong full torsion model rejected. | README Check retained. |
| Kernel at i=0 | Trace +2 curve over 𝔽₂ has E(𝔽₂)=0, hence #B₀=1; its #B₁=5. | Cardinality headline needs i≥1. | Binder retained. |
| Rational-point kernel API | q=3,i=1: (q^i−1)P=2P=0; i=0: (1−1)P=0. | Natural subtraction is safe since q^i≥1. | API remains prose. |
| Kernel extension API | Identity extension sends P to P and order 2 to 2; a further field embedding preserves the same equation 3πP=P. | Extension map cannot change the group law. | API remains prose. |
| Characteristic-torsion exclusion API | If order divides m and p with gcd(m,p)=1, order divides 1, so P=0; m=1 gives only O. | No nonzero p-torsion admitted. | API remains prose. |
| Cardinality headline | q=2,a=−2: D₁=1+4+8=13,D₂=1+8+32=41; a=2 gives 5,25; q=3,a=0 gives 28. | Point counts match all orders. | Recomputed. |
| Separability of 1−qⁱπ | i≥1: differential=1−0=1 and D_i mod p=1; i=0 on ordinary 𝔽₂ curve may include p-torsion. | The same i restriction is essential. | Retained. |
| Odd finite-field formula | q=2: K₁ order (2−1)²=1,K₃=(ℤ/3)²; q=3: K₁=(ℤ/2)². | Independent of elliptic trace. | Splitting inputs corrected. |
| Even finite-field formula | Trace ±2 over 𝔽₂ gives orders 13 versus 5; q=3,trace0 gives 28. | A degree-only or untwisted model fails. | Retained. |
| Lattice cokernel comparison | For A=3 on ℤ₂⊂ℚ₂, ker(3 on ℚ₂/ℤ₂)=0=coker(3 on ℤ₂); for A=2, kernel and cokernel both ℤ/2. | Lattice kernel itself is not the torsion group. | Retained. |
| RegularProperModel definition | O=F with identity marking satisfies the two triangles; twisting ℚ(s) by s↦s+1 changes s and fails the fixed-base triangle. | Marking is over F. | README only. |
| Marked generic inclusion | Identity marking gives i∘structure=the fixed map; a field twist gives s+1 rather than s. | Wrong marking excluded. | README Check retained. |
| Fibre multiplicities | Good fibre has div(π)=1·C; blow-up at its smooth point has total transform C′+E, both multiplicity 1. | Multiplicity is valuation, not number of components. | API in prose. |
| Weierstrass regularity criterion | 37a1: F(5,18)=222=6·37, not 0 mod37²; 11a1: F(5,5)=0,F_x=−55,F_y=11. | First total space regular; second singular. | Recomputed. |
| Nonminimal-model boundary | y²=x³−81x at p=3 has all terms in (3,x,y)², so embedding dimension 3, local dimension 2. | Generic good reduction does not regularise a nonminimal equation. | Retained. |
| Néron comparison | Good 37a1 model over ℤ[1/37] is proper; at 37 its smooth locus removes the node and is a nonproper torus, a₃₇=−1. | Smoothness alone is insufficient. | Retained. |
| excellentSurfaceResolution | Specℤ[t] is unchanged; xy=z² over ℚ has vertex local dimension 2, embedding dimension 3, and regular complement unchanged. | Regular-locus preservation passes; normal-locus claim fails. | New global target. |
| Regular-model existence | 37a1 needs 0 blow-ups at 37; 11a1 needs a nonidentity modification at 11. | Resolution is not automatically an identity. | Global input explicit. |
| Marked Hom | Identity has generic action 1; elliptic involution has action −1 and fails identity marking. | Unmarked automorphisms excluded. | README only. |
| Hom uniqueness | For identity source/target, generic agreement with id gives 1 endomorphism; a point blow-down gives one map forward and 0 maps backward. | Category is thin in the stated domain. | README only. |
| Outgoing minimality | Smooth or nodal 37a1 is minimal; blow-up at (2,x,y) has exceptional ℙ¹ and noninvertible outgoing blow-down. | Regular does not imply minimal. | No API padding in Lean. |
| Local-model adapter | Localising the fixed generic field gives F again; the generic marking is id_F, not a residue-field map F→k(v). | Fraction-field interpretation preserved. | README only. |
| Global common resolution | Compare M and Bl_x M: choose X=Bl_x M, with one blow-down and one identity. | Both arrows point from X. | Global theorem owned. |
| globalExceptionalContraction | Blow-up of Specℤ[t] at (2,t) has normal degree −1; a smooth elliptic fibre has normal degree 0. | Only the first curve is contracted. | New target and three consumer Checks. |
| Locally minimal existence | One point blow-up of a smooth model requires one contraction; starting at the smooth model requires zero. | Component count decreases by 1. | Global contraction input explicit. |
| globalBlowdownFactorisation | Blow-down sends exceptional ℙ¹ to one point and factors through itself; identity on the blow-up sends that curve to a curve and does not meet the hypothesis. | Constancy on the exceptional curve is essential. | New global target. |
| Terminal property | X=M gives id; X=Bl_x M gives the blow-down, while a reverse map would give an impossible isomorphism. | Direction is toward M. | Global factorisation input explicit. |
| Minimality local criterion | 37a1 smooth/nodal models satisfy all three properties; a point blow-up has an exceptional curve and outgoing nonisomorphism. | Both implications survive the boundary example. | Retained. |
| Minimal uniqueness | Identity-marked model has 1 comparison isomorphism; its unmarked involution gives at least 2 scheme automorphisms. | Marked uniqueness is stronger. | Retained. |
| Minimal localisation | Invert 37 in 37a1: nodal bad fibre removed, Δ=37 becomes a unit; S=S′ leaves Δ and model unchanged. | Localisation, not ramified extension. | Retained. |
| Integral part definition | Zero class belongs to S=∅; a class represented on 𝓔[1/6] lies in S={2,3}. | Image definition has stated finite domain. | F12 repaired. |
| Monotonicity | S=∅⊂{2} for 37a1 gives equality, since good 𝔽₂ fibre has K₁=0; denominator-three class excludes S=∅. | Inclusions need not all be strict or all equal. | Retained. |
| finite_S_exhaustion | A finite diagram over F has finitely many coefficient denominators; their finite prime union supports descent. Empty diagram gives S=∅. | Union uses only admissible finite inputs. | New target. |
| Integral-part model independence | For π:Bl_xM→M, generic π=id, so j^*π_*a=j′*a; both images contain exactly those same generic values. | Reverse inclusion needs pushforward and regular Cartan. | Retained. |
| Good-prime condition | At 2 for 37a1, K₁(fibre)=(𝔽₂×)²=0; over 𝔽₃ its order is (3−1)²=4, hence 0 rationally. | Integral surjectivity at 2 and rational surjectivity in general distinguished. | Retained. |
| Vertical rational criterion | {−1,3} at a multiplicity-m component gives (−1)^m, order ≤2 and rational value 0; 1/w has divisor −[0]+[∞] and infinite order. | Torsion versus infinite-order values distinguish membership. | F14 strengthened. |
| Integral-multiple conclusion | A torsion residual class of order 2 is killed by multiplication 2; a residue (1/w)^m is nonconstant for every m≠0. | Torsion has a clearing multiple; the bad example has none. | Retained. |
| tameValue definition | Orders a=1,b=−1 give (−1)^−1 times a residue unit; order of quotient a b−b a=−1−(−1)=0. For a=b=0 the value is 1. | No illegal residue or zero denominator. | Order proof inlined. |
| Leading-unit formula | f=t²·2,g=t³·3 gives (−1)^6·2³/3²=8/9; replacing t by ct cancels c-powers c⁻⁶c⁶=1. | Uniformiser independence witnessed. | API stays README. |
| Tame bimultiplicativity | At ord(t)=1, {2·3,t}→6=2·3; {2,t²}→4=2². | Both arguments tested. | API stays README. |
| Tame swapping | {2,t}→2, swapped→1/2; self-uniformiser→−1=(−1)⁻¹. | Inverse and sign agree. | API stays README. |
| Steinberg relation | f=t, g=1−t: at t=0 value 1; at t=1 value 1; at infinity a=b=−1 gives (−1)·(−1)=1. | Including pole sign is necessary. | API stays README. |
| −1 and self-symbol | ord(f)=1 gives −1; ord(f)=2 gives 1; in characteristic 2 both equal 1. | Parity and small characteristic checked. | Check in prose. |
| SymbolCandidate carrier | Singleton has integer coefficient 1; zero has support ∅; [s]−[s] has coefficient 0. | Formal representation is not a K₂ quotient. | Needed definition retained. |
| Candidate tame product | Candidate [s]−[t] with values 2 and 3 gives 2/3; when s=t gives 1. Empty product also gives 1. | Negative coefficients and collision handled. | Needed definition retained. |
| Candidate-to-K₂ comparison | Singleton [f,1−f] has coefficient 1 but class 0 and tame value 1; zero candidate has coefficient 0 and class 0. | Distinct formal data can have the same K-class. | API in prose. |
| SymbolCertificate definition | Zero has support ∅ and product 1; singleton {2,t} at t=0 gives 2≠1 and fails. | Wrong vacuous certificate rejected. | F11 Check added. |
| Certificate completeness | For [s]−[s]=0, empty support works; on 11a3 raw {x,y} gives −1 at (0,0), so no support can certify it. | Both directions distinguished. | README only. |
| Certificate soundness | 11a3 corrected candidate has paired values (−1)(−1)=1 at each of first two places; the remaining values are 1. | Horizontal tame kernel condition verified. | README only. |
| Norm-only negative certificate | On 36a1 at x=1, value −1∈ℚ(√2)× has norm (+1), while −1≠1. | Norm testing would falsely accept. | Retained. |
| IntegralCertificate | Constant units c,d have all vertical orders 0 and value 1; u=1/3 example has residue 1/w, so fails. | Horizontal certification does not imply vertical certification. | README only. |
| Last-point reciprocity headline | Rational last point has norm x↦x; quadratic last point may have value −1 with norm (−1)²=1. | Degree-one hypothesis cannot be removed. | Lean binder retained. |
| Inseparable reciprocity | k=𝔽₂(s), {s,t²−s}: values s and s⁻², norm product s²s⁻²=1; unweighted product=s⁻¹. | Original embeddings claim false. | F02 repaired. |
| Aggregate torsion divisor | C=1 gives 0 divisor; C=2 on y²=x³−x gives div(1/y)=3O−P₀−P₁−P₋₁ of degree 0 and point sum 0. | Correct at both parities. | Retained. |
| Torsion aggregation characteristic bound | Over 𝔽₂, E[2](k̄)={O,(0,1)} sums to nonzero (0,1), unlike the 4-point prime-to-p model. | char∤C needed for the full-torsion formula. | Retained. |
| Single torsion function | On y²=x³−x, div(x)=2(0,0)−2O; on 11a3 the first listed torsion function has norm −x⁵. | Integer annihilator and positive divisor orientation agree. | Pinned name and cast fixed. |
| Principal-divisor nonexample | P=(0,0) on y²=x³−x is nonzero of order 2: P−O≠0 in Pic⁰ while 2(P−O)=0. | Degree zero alone does not imply principal. | Retained. |
| Bloch correction headline | At a nonzero P, c_P^C·c_P^−C=1; with C=3,c_P=2 this is 8·1/8=1. Outside support: 1; at O reciprocity gives 1. | Sign and factor tested. | Headline retained. |
| Correction trivial subgroup | T={O}, S=∅, C=1: supported functions are constants, tame value=1 everywhere; sum has 0 correction terms. | Finite-list hypothesis handles the trivial case. | Retained. |
| Correction factor necessity | C=2, {1/y,x} has values −1,1,−1,1; doubling makes all 1. Without C the two −1 values remain. | Missing factor false. | Check in prose. |
| Correction order | ord(h)=3,res(c)=2: {h,c}→1/8, reverse→8; raw cubed value 8 gives totals 1 versus 64. | Reversing entries invalid. | Check in prose. |
| Bloch lift definition | A=3[s]+[t] gives A/3 coefficients 1,1/3, while A coefficients are 3,1. C=1 has no nonzero torsion index. | Integral and divided normalisations differ before quotient. | README Check retained. |
| Quotient class definition | Two lifts differing by constant {s,t} over ℚ(s,t) map to the same quotient; its t-adic residue s has infinite order. | Constants cannot be discarded in the actual rational group. | F07 clarified. |
| Choice independence | Multiplying ρ by 1 changes correction by 0; a root-of-unity correction {h,ζ} with ζ²=1 is killed by 2. | Torsion and constants are precisely quotiented. | Retained. |
| C=2 obstruction | Sign tensor is class of (1,0) mod2; possible doubling roots ±1 give quartic value 4,4 rather than 0. | Raw symbol not correctable without factor. | Recomputed. |
| Integral ICM comparison | A=2{1/y,x}+{x,−1}+{x+1,−1} has values 1 at all four torsion points; A/2 is the chosen lift. | C·divided class equals integral image, not its negative. | Waived Bloch locator retained. |
| Three-point relation | If torsion orders are all 2, lcm/m_i=1, so S₁=S₂=S₃ modulo torsion; their span has rank ≤1, not 3. | Independence not claimed. | Retained. |
| Constant-field transfer | E:y²=x³−2x,L=ℚ(√2): N{x−√2,y}={x²−2,y}; degree-two residue (1/4)(2x₀)=x₀/2=1/x₀. | Conjugate residue field identification matters. | Recomputed. |
| Transfer on constants | N(res{c,d})=2{c,d} in a quadratic extension; for c=d=−1 this is 0. | Constants subgroup preserved. | F07 quotient interface. |
| Actual Galois descent | Quadratic res(Nβ)=β+σβ; N(res(Nβ))=2Nβ; G=1 gives both maps id. | Degree appears once in inverse N/2. | F14 explicit composites. |
| Averaged quotient descent | For a quotient-invariant lift b, average (b+σb)/2 maps to (b̄+b̄)/2=b̄; changing b by q changes average by (q+σq)/2 in Q⊗ℚ. | Quotient class independent of lift. | F07 repaired. |
| Descent versus integrality | u=1/3 class is already defined over ℚ, so σ fixes it; residue (1/w)^m≠1 for every m≠0. | Galois invariance does not imply integral membership. | Retained. |
| E₄ divisors | v has coefficients 1,−1,−1,1; w and h each 1,1,−1,−1. Each degree sum=0; numerator/denominator zeros exhaust the listed points. | Degree and support agree. | Recomputed. |
| E₄ certificate | Each symbol has values −1,1,−1,1,1,−1,1,−1; termwise products are eight copies of 1. | Certificate holds. | Recomputed. |
| E₄ specialisation | At (0,0), h=w=1 gives 0; at (−16,0), h=5,w=1 gives {−1,5}, with 5-adic tame value −1. | Class not a constant K₂ image. | Recomputed. |
| E₄ discriminant | 16·4⁴·(4²−1)²=921600; exponent four on (4²−1) would give 207360000. | Source misprint remains corrected. | Retained. |
| Degree-two worked example | Values 1/2,1/x₀,−2,−4,1; N(1/x₀)=1/4; normed product=1, unnormed=−1−√−3. | Norms are essential. | Recomputed. |
| 11a3 integrality example | Vertical orders of x,y at irreducible fibre 11 are 0,0, giving tame value 1; horizontal corrected values are all 1. | Both certificate layers hold. | Retained. |
| Denominator-three integrality failure | 4vw=−3(v²−1)(w²−1) gives ord₃(v)=1, ord₃(w)=0; residue=1/w with divisor −[0]+[∞]. | Every nonzero multiple has infinite-order residue. | Recomputed. |
| Integer-4u contrast | u=4 gives 4u=16 integral and 2α integral; u=1/3 gives denominator 3 and no nonzero integral multiple. | Both sides of the denominator distinction tested. | Retained. |

## Maintainer consequences

No commit, push, issue, pull-request or external-message write was made. packages/EllipticKTheory/metadata.toml is unchanged. The new plan contains only the top-level gaps list. The report and the source manifest contain no machine path or extracted source passage.

The removed Lean declarations were API/model/certificate scaffolding and proved boundary examples, not changed mathematical headlines. The actual order, last-point and correction headline names are unchanged; geometric integrality is newly statable. The stale torsion-function name has no alias. Downstream roadmaps that imported the removed scaffolding from this acceptance file must instead consume the finished library's declarations or the README contracts; a roadmap acceptance file is not a supplier module.

Earlier maintainers must settle the six recorded supplier contracts. This round does not claim an independent acceptance verdict; the next independent review can use the computations, source anchors and explicit unresolved ownership boundaries above.
