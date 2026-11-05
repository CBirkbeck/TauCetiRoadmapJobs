# Repair report: étale duality and perverse sheaves, part II

## F01 (P1) — not actionable in this package: the trait theorem requires its named supplier

Ownerless source-access gap → `gap:ILLUSIE-2003`, requesting the exact trait support bound from LefschetzPencilsAndVanishingCycles §6.2. Scope, contracts and §5.5 agree: only the strict-local consequence is proved here. ILO14 lines 10337 and 10557 invoke, rather than prove, the trait theorem. Adding that supplier theorem requires editing its roadmap; this package records the request without inventing an existing target.

## F02 (P1) — applied

Self-invocation of Epp's theorem → residue-field stability reductions and the corrected p-cyclic argument, with a characteristic-2 cancellation Check. Deleted the stale EPP-1973 gap and merged the repeated route. ILO14 lines 2545–2595 prove the sorites; K10 lines 23–35 and 90–113 explain the correction. Epp73 remains uncertified; no assertion of legal availability or complete proof certification remains.

## F03 (P1) — applied

Conditional nonabelian companion → torsion abelian Layer 3 only. Deleted its scope clause, §3.5 paragraph and NONABELIAN-ORIENTED-LIMIT gap; restricted §3.4's theorem/proof citations to the abelian argument. ILO14 lines 9013–9017 and ILO-final-XII lines 209–215 flag the unsupported nonabelian limit passage. No abelian target needs that gap.

## F04 (P2) — applied differently

Added `cohomologicalDimension_le_of_strictlyLocal`, removed its non-statability claim, and aligned §5.8, supplier entries and the headline count. Unlike the proposed signature, torsion is tested on affine étale objects: all-object sectionwise torsion excludes legitimate unbounded-exponent sheaves. The affine-basis condition expresses the full ℓ-primary torsion hypothesis of ILO14 lines 16193–16199. Boundary and exponent Checks remain prose.

## F05 (P2) — applied

Deleted the open-duality supplier gap. Section 6.8 proves the exchange from tensor–Hom and extension-by-zero adjunctions, with three Checks and explicit evaluation compatibility. Every Layer 6 consumer and the build-order paragraph now use those supplied operations. Evidence: EtaleCohomologyFoundations §0.7; EnhancedDerivedSheaves §§0.3–0.4; the specialized exchange in ILO14 lines 15186–15194.

## F06 (P2) — applied

Deleted general-base-exceptional-pullback. The contract now directly imports EtaleCohomologyFoundations §F.5 on §F.2's finite-cohomological-dimension domain, §F.2.4's separated finite-type noetherian geometry, §0.7's closed supports and §F.6's smooth purity. Composition comes from adjunction applied to lower-shriek composition. These operations precede the duality theorem being proved; no additional missing ingredient was found.

## F07 (P2) — applied

Arbitrary DVR normalization Check → excellent DVR normalization Check, retaining arbitrary finite, including inseparable, fraction-field extensions. Added the non-Japanese counterexample as a negative control. SchemeAndStackFoundations §§0.20–0.22 distinguish finite normalization from the non-finite integral closure example. Integral plus finite type implies finite, so the latter normalization is outside alt/X.

## F08 (P3) — applied

Deduplicated Checks in §§0.1, 0.2, 1.5, 3.1, 5.1, 6.1, 6.3, 6.5, 6.8 and 8.1; merged §4.2's Check blocks and §1.3's repeated route. Section 0.6 now checks one (X,Z) instance. Both §§0.6 and 2.2 distinguish connected identity covers from component covers. Section 8.1 retains the explicit completion and tilt information. No Lean padding was added.

## F09 (P3) — applied

Corrected universal catenarity to XIV 1.3.2 (ILO14 line 9860); qualified all four ambiguous §6.2 locators by ILO XVII. Scoped §6.10's necessity assertion to finite dimension and SGA 5 dualizing complexes of finite quasi-injective dimension, factorwise in prime-power coefficients. G04 lines 441–464 support that scope; a computed ℤ/6 shift Check excludes a false common-shift interpretation.

## F10 (P3) — applied

Downstream claim PF.1/PF.4 and §§7.3/8.6 → PF.1 consuming §7.3. PurityForFlatCohomology's design §Exact supplier contracts, gap EDP-PII-local-lefschetz, and PF.1 name precisely that input; PF.4 names other suppliers. Its placement before this package concerns intake's merge order, which this repair cannot edit. No dependency on that consumer was introduced.

## F11 (P3) — applied

Moved regular base change to §5.3 and transport to §5.4, updating every internal reference and the final reference note. Added the smooth-base-change route input explicitly. Lean's layer label is now Layer 1; source cited_for values use README sections. Deleted the two unowned scope-exclusion sentences. External ClassicalAdicEtaleCohomology §5.4 citations retain their supplier numbering.

## Check outcomes

- Final elaboration from the content checkout, using `lake env lean` on `packages/EtaleDualityAndPerverseSheavesPartII/Suggested.lean`: exit 0, exactly six `declaration uses sorry` warnings, at lines 54, 76, 167, 211, 247 and 265; no errors or other warnings. The earlier substantive elaboration also exited 0 with six such warnings. No Tau Ceti import or targeted build was needed.
- A single scratch module containing the final file and `#check @name` for every declaration elaborated: exit 0, the same six warnings, nine printed signatures. The initial scratch-sweep setup used the content working directory for board-relative reads and failed before generating the scratch module; it was corrected before the successful sweep. The final sweep has no missing declaration and no lost binder. The comparison is recorded below.
- Required movable dependency check: exit 0. Exact output:

```text
depcheck: 51 roadmaps, 594 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap. The command used the configured merge order, this package's README and name, and `--movable`.

- Cross-roadmap resolver: exit 0. Its four leads are AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology. All four exist as board package designs and were read there. No Lean-name lead was reported. The resolver says its own host has no pinned Lake packages; native-name checks here used the supplied local pins and Lean, independently of that host.
- `git diff --check`: exit 0. Source TOML parses. Every remaining gap has exactly slug, needs, supplier and section, and its needs sentence exactly matches its README contract. JSON comparison against HEAD after removing the top-level gaps key gives equality: no other plan content changed.
- Suggested.lean has 278 lines, the single import `Mathlib`, six admitted headline theorems and three native data structures. Every declared name occurs in the README; no declaration was deleted or renamed. No set_option, admitted data, new API lemma, admitted example or boundary theorem was introduced.
- No separate gate failures were supplied with this job. No source was added or requested. The settled uncertified statuses of Ill03 and Epp73 remain unchanged.

### Elaborated binder comparison

All types were read from the successful `#check @name` output, not inferred from section-variable text.

| Declaration | Elaborated assumptions and conclusion compared with README | Outcome |
| --- | --- | --- |
| cohenGabber_equalCharacteristic | Local, noetherian, maximal-ideal complete, reduced; prime p and CharP; finite d and quotient-by-every-minimal-prime equidimensionality; injection, residue equation, finite torsion-free module and finite étale generic fibre. | Matches §1.1; unchanged. |
| cohenGabber_equivariant | Explicit field algebra, finite group, action, unit group order and dimension; coefficientwise induced residue action; finite generically étale injection, without equidimensionality or torsion-freeness. | Matches §1.2; unchanged. |
| MixedCohenGabberPresentation | Ring, domain and local assumptions on A remain explicit parameters; p, ℓ and d retained. Bundle fields retain the actual finite maps, residue identification, p-fibre étaleness and invariant generic degree. | Matches §1.4; unchanged. |
| cohenGabber_mixedCharacteristic | Complete normal local domain, characteristic zero, prime residue characteristic p, prime ℓ ≠ p, d ≥ 2 and dimension equality. | Matches §1.4; unchanged. |
| PartialAlgebraization | Local noetherian complete A, independent ideal-index universe and actual ideal family. Completion is of the localization at the bundled maximal ideal. | Matches §1.5; unchanged. |
| partialAlgebraization_equalCharacteristic | Reduced complete local A containing a field; positive dimension; arbitrary finite ideal-index type. Regular base and dim B + 1 = dim A. | Matches §1.6; unchanged. |
| PrimeToEllLocalExtension | Actual local domain A and ℓ parameter; B complete normal noetherian local; finite injective local map; degree of the actual fraction-field tensor fibre. | Matches §1.7; unchanged. |
| partialAlgebraization_mixedCharacteristic | All mixed-characteristic, completeness, normality and prime-to-residue hypotheses survive; one extension chosen before every finite ideal family; mixed-characteristic regular base of dimension one less. | Matches §1.7; unchanged. |
| cohomologicalDimension_le_of_strictlyLocal | Noetherian henselian local A with separably closed residue field; d > 0 and ringKrullDim A = d; prime ℓ invertible in A; open U; abelian sheaf; sectionwise ℓ-power torsion on affine étale objects; 2d ≤ q implies Subsingleton (F.H q). | Matches §5.8; added with all binders explicit. |

### Sources, ownership and native carriers

The mathematical evidence for the changed claims was read at ILO14 lines 2524–2595 (Epp statement and residue-field reductions), 8936–9017 and ILO-final-XII lines 209–215 (abelian descent and nonabelian limitation), ILO14 lines 9860–9862 (henselian quasi-excellent catenarity), 10216–10285 (regular base change and transport), 10337–10339 and 10552–10561 (trait input), 15186–15194 (open exchange), 16193–16199 (cohomological dimension), K10 lines 14–113 (p-cyclic correction), and G04 lines 441–464 (the stronger dualizing convention). Ill03 and Epp73 were not reopened; statements read in ILO and K10 are distinguished from their uncertified original proofs.

The citation pass used content main 6383577 and the indexed open roadmap heads of 2026-10-25. Main supplier locators confirmed: SchemeAndStackFoundations §§0.7, 0.12–0.16, 0.20–0.22, 2.11–2.12, 2.15–2.16 and 4.16–4.20; EtaleCohomologyFoundations §§F.0.1–F.0.3, 0.7, F.1, F.2.1–F.2.2, F.2.4, F.3, F.5–F.6 and F.8; EnhancedDerivedSheaves §§0.1–0.4 and E2.6; AdicEtaleGeometry §§A1.14–A1.15; PerfectoidSpaces §P1.24. The first three also supplied the upstream roadmap-form examples read before editing.

Open-head supplier locators confirmed: EtaleDualityAndPerverseSheaves §§0.1–0.2, 1.1, 2.2, 2.4 and 2.11; LefschetzPencilsAndVanishingCycles §§0.2–0.5, 0.10 and 6.2; ClassicalAdicEtaleCohomology §5.4, including OrientedEtaleProduct; DeformationAndDerivedPatchingAlgebra §1.10; AlgebraicModuliForArithmeticGeometry §§6.0–6.1; PerfectoidQuotients §§0.4–0.6. LefschetzPencilsAndVanishingCycles §6.2 has the trait-perversity context, not the requested affine theorem: this is why ILLUSIE-2003 remains a supplier gap.

Board design locators confirmed: AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8 and PA.5.1–PA.5.4; ArcTopologyAndDescent §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5 and 12.6; PerfectoidQuotientsPartII §§Q5.1–Q5.3 and Q6.3–Q6.7. PurityForFlatCohomology's PF.1 supplier gap is read as consumer evidence only.

Ownership was searched by object with `roadmaps grep` over indexed main/open heads and with package README searches. The other matches concern analytic or diamond duality, rather than this scheme theorem. No other owner of Cohen–Gabber, corrected Epp elimination, potential dualizing complexes or the arbitrary strictly local scheme bound was found. The formal exchange is a consequence of existing operations, not another foundational carrier. The trait theorem is explicitly requested from the earlier trait-perversity owner. The named open siblings were included through the roadmap index; no subagents or GitHub writes were used.

| Carrier or consumed declaration | Pinned location | Meaning verified |
| --- | --- | --- |
| HenselianLocalRing | Mathlib/RingTheory/Henselian.lean:108 | Includes IsLocalRing and the monic simple-root lifting property; no noetherianity or separably closed residue field is implicit. |
| IsSepClosed | Mathlib/FieldTheory/IsSepClosed.lean:65 | Splitting for separable polynomials; perfection is not assumed. |
| AlgebraicGeometry.IsAffine | Mathlib/AlgebraicGeometry/AffineScheme.lean:56 | The canonical map to Spec of global sections is an isomorphism; it does not assert noetherianity. |
| Scheme.smallEtaleTopology | Mathlib/AlgebraicGeometry/Sites/Etale.lean:50 | The full small étale over-category, not only its quasi-compact objects. |
| HasSheafify instance | Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:112 | Sheafification for the small étale site obtained through the affine subsite. |
| Sheaf.H | Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56 | Ext from the constant free rank-one abelian sheaf; cohomology is available without inventing an étale-derived carrier. |
| Algebra.IsEtaleAt | Mathlib/RingTheory/Etale/Locus.lean:35 | Formal étaleness of the localization; the retained finite noetherian maps supply the needed finite-presentation setting. |
| Module.Baer.zmod_self | TauCeti/Algebra/Module/ZMod/Injective.lean:50 | Self-injectivity of ZMod n requires n ≠ 0, consistent with Layer 6's n ≥ 2. |

These checks used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as recorded in the supplied content manifest. Searches found no quasi-excellence or strict-henselization carrier at those pins. Tau Ceti's continuous-group cohomological-dimension predicates concern continuous representations; they do not prove the new scheme-open bound.

## Adversarial mathematics pass

Values below are mathematical computations, not claims that admission checks prove truth. Identity, empty and nonreduced cases are included where the operations admit them. Rows for unchanged targets retain their hypotheses; corrected rows specify the edit. API identities are tested on their defining maps rather than on unrelated free scalars.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Local rings are nonzero | Field; zero ring | Field has maximal ideal 0 ≠ 1; zero ring has 0 = 1 and no proper maximal ideal. | Local hypothesis excludes zero ring. | None. |
| Finite coefficient convention | n = 1, 2 | ZMod 1 = 0, all groups 0; ZMod 2 has 2 elements, while its square has 4. | Layer 6 needs n ≥ 2 for rank controls. | None. |
| Shift convention | Λ[2] | H⁻²(Λ[2]) = H⁰(Λ) = Λ; H⁰(Λ[2]) = 0. | Degree sign fixed. | None. |
| Tate/purity normalization | Strict trait; regular strict surface | H²_s(Λ(1)) = Λ; two codimension-one classes give H⁴_x(Λ(2)) = Λ. | Degree 2c and twist c agree. | None. |
| Specialization direction | Trait η ⇝ s | Closure of η in the strict local trait has dimension 1; closure of s has dimension 0. | δ(η) − δ(s) = 1. | None. |
| Normalized δ and perversity | Trait | δ(s), δ(η) = 0,1; −2δ(s), −2δ(η) = 0,−2; 0 ≥ −2. | Monotonicity sign agrees. | None. |
| Support dimension of zero | F = 0; nonzero point sheaf | Empty support gives −∞; point of δ-value 0 gives supremum 0. | Zero does not acquire a finite support dimension. | None. |
| Formal alteration primes | ℓ = 1, 2, ∞ | Degree 2 admitted for 1, rejected for 2 and ∞; degree 1 admitted in all cases. | Separates all three conventions. | None. |
| Complete local means separated | A = k[[t]] | Intersection of (tⁿ) is 0 and A → lim A/(tⁿ) is bijective. | Completeness is not precompleteness alone. | None. |
| §0.1 alt/S objects | Spec k; origin in A¹ | Reduced finite-type generic-finite k-schemes have dimension 0; origin's generic point maps to a nongeneric point of A¹. | First admitted, second excluded. | Duplicate Checks deleted. |
| §0.1 md right adjoint | T = A¹_k over Spec k | T^md = T but generic extension k(t)/k is infinite. | md does not imply membership in alt/k. | None. |
| §0.1 fibre product | Blow-up B of A² at 0 | B × B over A² contains exceptional P¹ × P¹ of dimension 2; generic diagonal closure omits its nondominant component. | alt product requires md. | Duplicate deleted. |
| §0.1 final object | Spec k[ε]/ε² | Terminal reduced S-scheme is Spec k, and its S-map is unique; S itself is nonreduced. | Terminal object is S_red. | None. |
| §0.1 flat base change | Field extension k → L | Spec k pulls back to Spec L; reduction stays Spec L. | Base-change formula has the stated value. | None. |
| §0.1 proper integral object | Identity on an integral S | Proper, surjective, generic degree 1 on both object and alteration definitions. | The equivalence admits identity in both directions. | Duplicate deleted. |
| §0.2 generating proper covers | Z[i]/Z, ℓ = 3 | Generic degree 2, gcd(2,3) = 1; finite and surjective. | A generating cover. | Deduplicated. |
| §0.2 rejected cover | Z[i]/Z, ℓ = 2 | gcd(2,2) = 2; no odd-degree extension of Q contains Q(i). | Not a cover of the prime-to-2 topology. | Deduplicated. |
| §0.2 nonsurjective open | G_m → A¹ | Fibre at 0 is empty; a covering would need a point above 0. | Not a cover even for ℓ = 1. | Deleted repeated generic version. |
| §0.2 Nisnevich case | Split two-point cover; quadratic residue extension | Split cover has a degree-1 lift; quadratic point has residue degree 2. | ∞ distinguishes them. | None. |
| §0.2 hypercover convention | Constant X_• | Every matching map is the identity; degree-zero map is identity. | Zero and positive levels agree. | None. |
| §0.3 first standard form | Identity integral X, Zariski cover | Y = X; generic degree 1; Zariski cover unchanged. | Meets all clauses for ℓ = 1. | None. |
| §0.3 second standard form | Integral henselian X, finite flat degree m | Y = V = X, W the given cover; birational degree 1 and finite flat rank m. | gcd(m,ℓ) = 1 is exactly the required degree test. | None. |
| §0.4 valuative iff | Identity; G_m → A¹ | Identity has a unique lift; valuation sending t to an element of positive valuation centred at 0 has no lift to G_m. | Both directions have their expected boundary behavior. | None. |
| §0.4 finite normalization | Excellent DVR; finite field extension degree m | Integral closure finite, generic degree m, spectrum surjects; valuative lifts extend the chosen generic embedding. | Valid alt cover for all finite extensions. | Added excellence to Check only. |
| §0.4 non-Japanese control | Supplier §0.22 inseparable extension | Integral closure not finite; integral finite-type would be finite, contradiction. | Not an alt object. | Added Check. |
| §0.5 approximation order | n = n₀ ≥ c > 0 | n + 1 − c ≥ 1; no natural subtraction at a negative order is used. | Order remains meaningful. | None. |
| §0.5 dimension/regularity comparison | Identity model; t² − a with a and 2 units | Closed-fibre dimensions equal; derivative 2t is a unit in the quadratic étale algebra. | Regularity transfers only if the base is regular. | None. |
| §0.6 instance of U | Connected regular X, snc Z | Identity has generic degree 1 and preimage Z itself, with the same snc branches. | Checks a single (X,Z). | Removed universal overclaim. |
| §0.6 connected-source condition | Disjoint union of two regular lines | Identity has two components and is not connected; component family has two connected sources, each degree 1 over its component. | Component cover required. | Repaired here and §2.2. |
| §0.7 complete-local reduction | T already complete | T̂ = T, and each approximated finite family can be the original family. | Conclusion equals the assumed complete case. | None. |
| §1.1 equal-characteristic Cohen–Gabber | Cusp, p = 2 | t ↦ y: equation x³ = y², derivative x² nonzero at generic point, generic rank 3. | Separable degree 3, including bad small characteristic. | None. |
| §1.1 equal-characteristic Cohen–Gabber | Cusp, p = 3 | t ↦ x: degree 2 and derivative 2y nonzero generically. | Separable degree 2. | None. |
| §1.1 equidimensional hypothesis | k[[x,y,z]]/(xz,yz) | Components have dimensions 2 and 1; not every minimal-prime quotient has dimension 2. | Excluded from torsion-free form. | None. |
| §1.1 dimension-zero case | A = k | Zero-variable series ring is k, map identity, generic rank 1, residue identity. | Nonvacuous at d = 0. | None. |
| §1.2 equivariant map | Sign action on k[[x]], char k ≠ 2 | t ↦ x², σ(t) = t, generic degree 2; derivative 2x nonzero generically. | Equivariance and generic étaleness agree. | None. |
| §1.2 nonabelian group | S₃ permutes three variables, char k ≠ 2,3 | Symmetric parameters fixed; generic degree 6; group order 6 invertible. | Nonabelian example admitted. | None. |
| §1.2 wild-order rejection | char 2, σ(x) = x/(1+x) | σ²(x) = x/(1+2x) = x, but order 2 maps to 0, not a unit. | Excluded by unit-order hypothesis. | None. |
| §1.3 residue-field transitivity | F_p ⊂ F_(p²) ⊂ F_(p⁴) | Perfect cores are these same finite fields; degrees 2 and 2 compose to 4. | Finite and transitive Epp conditions agree. | Route now identifies stability inputs. |
| §1.3 power-series perfect core | F_p((t)) | A nonzero infinitely p-divisible valuation must be 0; a surviving nonconstant coefficient exponent cannot be divisible by every pⁿ. Core = F_p. | Matches the residue-field sorites. | Added route input. |
| §1.3 unramified elimination | Identity or unramified traits | Ramification index e = 1; special fibre is a field, hence reduced; S′ = S. | No extension required. | None. |
| §1.3 mixed-characteristic reduction | T = S = Spec Z_p; S′ = S | Fibre product is Z_p, injects into Q_p, has no nilpotent. | Reduced before normalization. | Route merged. |
| §1.3 corrected p-cyclic step | char 2, L = F₂(u), a = u²π⁻² + uπ⁻¹ | With d = uπ⁻¹, a + d − d² = 0; z² − z = 0 splits as z(z−1). | A claimed surviving leading coefficient would be false. | Added cancellation Check. |
| MixedCohenGabberPresentation | Z_p[[x]], B = A, V = Z_p, H = 1 | Both maps identity; residue F_p; p-fibre map identity; invariant generic degree 1. | All fields of the bundle hold. | None. |
| §1.4 p-dense étaleness | V[[t]] → V[[x]], t ↦ x^p | Generic derivative p x^(p−1) nonzero in characteristic 0; at generic p-fibre it is a nonunit, and residue map t ↦ x^p inseparable. | Generic étaleness alone is insufficient. | None. |
| §1.4 invariant degree | B = W(k)[π]/(π^ℓ−p)[[x]], H = μ_ℓ | Degree B/A = ℓ; B^H = A; invariant degree 1, gcd(1,ℓ) = 1. | The correct degree is after invariants. | None. |
| §1.4 group condition | Q₈ acting trivially; S₃ at ℓ = 2 | Q₈ element orders 1,2,4; S₃ has an element of order 3. | First is a 2-group, second is not. | None. |
| PartialAlgebraization | k[[x,y]], I = (y−x²) | B = k[[x]], C = B[y], n = (x,y); completion k[[x,y]], dim B + 1 = 2. | Ideal extends with its equation. | Deduplicated. |
| §1.5 dimension inequality | A = k; attempted B = A | Need dim B < 0 in field case; identity B = A gives d < d. Both false. | Rejects field and trivial presentation. | Deduplicated. |
| §1.5 scheme-theoretic ideals | (x), (x²) in k[[x]] | Quotient lengths 1 and 2, although both closed supports equal {0}. | Supports alone do not encode the family. | None. |
| §1.5 intersections | (x), (y) in k[[x,y]] | Intersection is (xy) before and after completion. | Flat extension preserves this API operation. | None. |
| §1.6 equal-characteristic algebraization | k[[x,y]]/(xy), ideals (x),(y) | B = k, C = k[x,y]/(xy), completion A; 0 + 1 = 1. | Reducible reduced case admitted. | None. |
| PrimeToEllLocalExtension | Identity; quadratic extension | Actual generic dimensions 1 and 2; gcd(1,2) = 1, gcd(2,2) = 2, gcd(2,3) = 1. | Generic-degree definition distinguishes cases. | None. |
| §1.7 mixed algebraization | A = Z_p[[x]], I = (x−p) | E = identity chosen once; B = Z_p, C = Z_p[x], n = (p,x); dim B + 1 = 2, residue F_p. | Full mixed-characteristic conclusion holds. | None. |
| §1.7 quantifier order | Same A, I = (x), (x−p), empty family | One E = identity serves all; the same polynomial model carries each ideal and the empty family. | Extension precedes ideal choice. | None. |
| §2.1 nodal alteration | Already smooth projective curve with disjoint marked sections | G = 1, a = b = identity; quotient maps birational of degree 1, marked locus unchanged. | Base case matches all conclusions. | None. |
| §2.1 geometric irreducibility | P¹_L over K, [L:K] = 2 separable | After separable closure it is two P¹ components, not one; generic constants L ≠ K. | Hypothesis excludes false quotient model. | None. |
| §2.2 weak uniformization | Cone xy = z², including char 2 | Blow-up chart y₁ = z₁² is regular; conic gradient (y,x,−2z) has no projective zero on the conic even in char 2. | Regular source, snc exceptional conic. | Connected identity Check repaired. |
| §2.3 degree-control cover | F₃[t]_(t), cubic x³+x²+2x+t | Special fibre x(x²+x+2); quadratic discriminant 2 nonsquare. Removing rational point leaves only residue degree 2, despite generic degree 3. | Not prime-to-2 covering. | None. |
| §2.3 tame quotient | A²/μ_ℓ | Quotient map degree ℓ has gcd(ℓ,ℓ) = ℓ; resolution has birational degree 1. | Use the modification in the prime-to-ℓ topology. | None. |
| §2.4 hypercover truncation | q = 0,1; regular snc pair | Need levels through 1,2 respectively; constant hypercover's matching maps are identities. | N ≥ q+1 sufficient; constant example needs no resolution. | None. |
| §3.1 oriented-product definition | Identity strict trait diagram | Underlying point pairs (s,s),(η,η),(s,η); (η,s) absent. | Three points instead of the two of ordinary self-product. | Deduplicated trait comparison. |
| §3.1 universal property | Base punctual; identity maps | Specialization two-cell is unique; product object is X × Y, with its two projections. | Recovers product topos. | Deduplicated. |
| §3.2 tube base change | X = S = point, Y arbitrary | Both sides are constant RΓ(Y,F); at a point the tube is Y. | Direction f^*Rg_* → Rp₁*p₂^* agrees. | None. |
| §3.3 finite-type diagram category | Base Spec k; two affine lines | Fibre product Spec k[x,y] is noetherian of dimension 2. | Termwise products stay in the specified category. | None. |
| §3.3 proper generator | Blow-up S′ → A², X = S′, Y = S | Proper base change gives source (S′→S′←S′); exceptional fibre P¹, so map not étale. | Type (iv) required. | None. |
| §3.3 rejected family | Y = A¹, Y′ = {0}, X = S = point | Oriented product is Y; points with coordinate ≠ 0 have empty fibre. | Not covering. | None. |
| §3.4 proper acyclicity | π = identity; constant coefficient Λ | ←ρ = identity; F → R←ρ_*←ρ^*F is F → F. | Unit is identity. | Abelian citations only. |
| §3.5 descent | Split two-point cover of a point | Čech C⁰ = Λ², C¹ = Λ⁴; degree-zero kernel diagonal Λ; higher cohomology 0 by split contraction. | Recovers Λ, not Λ². | Nonabelian companion deleted. |
| §3.6 hypercover base change | Constant S_• | Totalized right side reduces to g^*Rf_*K; comparison identity. | Formula has correct direction. | None. |
| §4.1 constructibility | Source XIX non-quasi-excellent example | Adjacent stalk dimensions 2 and 1 persist along the source's nonconstructible locus. | Quasi-excellence cannot be dropped. | None. |
| §4.2 finiteness | snc boundary with r = 0,1,2 | Exterior-power ranks (1), (1,1), (1,2,1), and 0 above r. | Constructible, bounded and correct Tate powers. | Merged Check blocks. |
| §4.2 invertibility control | A¹ over algebraically closed char-p field | Classes t^m, p not dividing m, survive independently modulo h^p−h; H¹(A¹,Z/p) infinite. | Does not contradict invertible-coefficient finiteness. | None. |
| §5.1 dimension function | Strict trait | δ(η),δ(s) = 1,0; difference of two choices is (c,c). | Torsor and sign agree. | Deduplicated; catenarity locator corrected. |
| §5.1 empty specialization condition | Spec k | No immediate pair; any integer value c defines a dimension function. | No forced zero normalization without choosing it. | None. |
| §5.1 bad closure dimension | A¹_R, point (πt−1) | Closure dimensions 2 and 0 differ by 2, while local codimension is 1. | Closure dimension fails here. | Deduplicated. |
| §5.1 bad negative local dimension | Line and plane meeting at 0 | At line generic point local dimension 0; at joint point dimension 2; immediate line specialization drops by 2. | −dim O needs the stated hypotheses. | None. |
| §5.2 existence criterion | Strict trait; Nagata catenary nonuniversally-catenary local example | Trait admits (1,0); Nagata example would imply universal catenarity if a local dimension function existed, contradicting its dimension-chain defect. | Separates catenary from universally catenary. | None. |
| §5.3 regular base change | Identity; smooth map | Identity comparison F → F; a smooth map recovers the supplied smooth exchange. | Statement and route agree. | Moved before transport; explicit smooth input. |
| §5.3 global-cohomology control | k[t]_(t), z² = 1+t, char k ≠ 2 | No root in k(t), since 1+t has odd zero valuation; completion has a root with constant term 1. | Global sections can change without henselianity. | None. |
| §5.4 finite-type transport | A¹_k → Spec k | trdeg k(t)/k = 1; closed residue transcendence degree 0; δ-values 1,0. | Reversed field extension would be meaningless. | References updated. |
| §5.4 regular transport | Identity; excellent completion | Identity fibre dimension 0, so δ unchanged; completion closed fibre dimension 0, so closed-point value remains 0. | Correct fibre-codimension sign. | Moved after base change. |
| Trait support-bound supplier contract | Generic open j of strict trait | δ(R¹j_*Λ) = δ(s) = 0; δ(Λ on η) − 1 = 1−1 = 0. | Sharp sign and normalization. | Named supplier gap, not claimed supplied. |
| §5.5 strict-local consequence | Separably closed point; strict trait generic open | d = 0 gives H⁰ = Λ, higher 0; d = 1 gives H¹ = Λ(−1), H² = 0. | Fits q > d and has nonzero boundary degree. | Consequence retained here. |
| §5.6 quasi-excellent affine Lefschetz | Affine line over separably closed k | Support dimension 1; H^q(A¹,F) = 0 for q > 1. | Recovers Artin's bound. | Uses new §5.4 locator. |
| §5.7 local affine form | W(kbar)[[x]][1/p], ℓ ≠ p | d = 2; groups above degree 2 vanish; trait case d = 1 vanishes above 1. | Distinguishes dimensions 1 and 2. | None. |
| §5.8 cohomological-dimension bound | A = k[[t]], d = 1, U generic | 2d−1 = 1; H¹(U,Z/ℓ) = Z/ℓ(−1) ≠ 0, H^q(U,F) = 0 for q ≥ 2. | Bound attained. | Native headline added. |
| §5.8 excluded d = 0 | A = k separably closed | cd_ℓ(Spec k) = 0 while integer 2d−1 = −1. | Positive-dimension hypothesis necessary. | Retained prose boundary. |
| New headline degree inequality | d = 1; d = 2 | hq begins at q = 2; q = 4 respectively; neither admits q = 0. | No subtraction or negative-degree encoding. | Explicit hd, hdim and hq. |
| New headline empty/zero inputs | U = empty; F = 0 | H^q(empty,F) = 0; H^q(U,0) = 0; each underlying type subsingleton. | Degenerate cases agree. | No Lean padding. |
| New headline affine torsion test | Constant M with generators of orders ℓ^r; infinite disjoint union V | Each affine section has finite image and bounded exponent; section (e_r) on V has no k with ℓ^k(e_r) = 0. | All-object condition would be too strong. | Use affine basis. |
| §5.8 finite relative dimension corollary | Identity of finite-dimensional Y | R⁰ id_*F = F, R^q id_*F = 0 for q > 0. | Finite cohomological dimension 0 in this case. | None. |
| §6.1 immediate transition | Strict trait, K = Λ | Λ → H²_s(Λ(1)) sends 1 to the Kummer class, an isomorphism. | Twist and shift fixed. | Deduplicated. |
| §6.1 zero transition | K = i_s*Λ | Generic support group 0, closed support Λ; map is zero. | Cannot replace supported input by constant Λ. | None. |
| §6.1 wild-inertia projection | p = 2, ℓ = 3, sign action of C₂ on F₃ | Invariants 0 since 2m = 0 implies m = 0; averaging (1+σ)/2 = 0. | Transition must vanish. | None. |
| §6.1 inseparable normalization | p = 2, Λ = Z/3; p = 3, Λ = Z/2 | Inverse degree factors 2 and 1; 2·2 = 1 mod 3, 3·1 = 1 mod 2. | Denominators are units under coefficient assumptions. | None. |
| §6.1 identity specialization | c = 0 | Twist 0, shift 0, map identity on RΓ_x. | No extra trace factor. | Deduplicated. |
| §6.2 top class | Strict regular surface | Two immediate classes give Λ → H⁴_x(Λ(2)) = Λ, sending 1 to 1. | Chain-compatible normalization. | Qualified ILO XVII locators. |
| §6.2 top-degree bound | d = 0,1 | Field: H^q_x = 0 for q > 0; trait: H²_s(Λ(1)) = Λ and H^q_s = 0 for q > 2. | Top degree 2d, not d. | None. |
| §6.3 potential complex | Strict trait, δ = (1,0) | K = Λ(1)[2]; generic local complex Λ(1)[2], closed supported complex Λ. | Pinning values agree with δ. | Deduplicated. |
| §6.3 rejected pinning | Same trait, K = Λ | Generic restriction has degree 0, required degree −2. | Not putative. | Deduplicated. |
| §6.3 twist-and-shift rule | Point, δ = 0 then δ = 1 | Λ becomes Λ(1)[2]; costalk changes by exactly twist 1, shift 2. | δ+k sign correct. | None. |
| §6.3 empty scheme | X empty | Only complex 0; no point-pinning conditions. | Unique potential object. | None. |
| §6.4 regular potential complex | Strict trait, δ = −codim | Generic pinning Λ; closed RΓ_sΛ = Λ(−1)[−2]. | Matches δ(η) = 0, δ(s) = −1. | None. |
| §6.5 perverse t-structure | Point, p = 0 | Stalk = costalk; conditions are H^i = 0 for i > 0 and i < 0. | Heart ordinary Λ-modules. | Deduplicated. |
| §6.5 trait heart | p = −2δ, K = Λ(1)[2] | Generic degree −2 satisfies both endpoints; closed stalk degree −2 ≤ 0, closed costalk degree 0 ≥ 0. | K in heart. | Deduplicated. |
| §6.5 rejected trait object | Same p, K = Λ | Generic degree 0 > p(η) = −2. | Not in upper aisle. | None. |
| §6.5 shifted perversity | Point p = 0, k = 1 | Λ[−1] has H¹ = Λ; belongs to degrees ≤ 1, corresponding to D≤0[−1]. | Shift is −k. | None. |
| §6.6 existence and pinned uniqueness | Regular connected X, δ = −codim | K = Λ; scalar automorphism u preserving pinning must satisfy u·1 = 1, hence u = 1. | Pinning excludes rescaling by units. | None. |
| §6.7 finite-type functoriality | A¹_X → X | f^!K = f^*K(1)[2]; relative generic δ increases by 1. | Shift/twist matches transport. | Updated §5.3/§5.4 references. |
| §6.7 regular functoriality | Identity; étale f | Fibre codimension 0, f^*K unchanged except restriction; f^! = f^*. | Two constructions agree on étale maps. | None. |
| §6.8 formal exchange | j = identity, F = Λ | RHom(Λ,K) = K = R id_*RHom(Λ,K); evaluation identity. | Yoneda map has correct direction. | Added README lemma. |
| §6.8 formal exchange | U empty | j_!F = 0; RHom(0,K) = 0 = Rj_*0. | No nonempty hypothesis. | Added Check. |
| §6.8 formal exchange | Generic open of strict trait | Both closed stalks H⁰ = Λ, H¹ = Λ(−1); j_! alternative has zero closed stalk. | Rj_* is essential. | Added Check. |
| §6.8 tensor compatibility | Generic open, M = F = Λ | Λ ⊗ᴸ j_!Λ = j_!Λ = j_!(Λ ⊗ᴸ Λ), zero closed stalk. | Formal exchange input is independent of dualizing existence. | Supplied directly. |
| §6.8 dualizing predicate | Geometric point, K = Λ | D²Λ = Λ; finite coefficient evaluation identity; empty X gives 0. | Positive and empty examples hold. | Deduplicated. |
| §6.8 rejected dualizing object | Geometric point, Λ = F₂, K = Λ² | DΛ = Λ²; D²Λ = Λ⁴, with 16 elements rather than 2. | Biduality fails. | None. |
| §6.8 invertible-object classification | Λ = Z/6, L = F₂ ⊕ F₃[1] | L ⊗ᴸ (F₂ ⊕ F₃[−1]) = F₂ ⊕ F₃ = Λ; cross terms 0. | Factorwise shifts, no single shift. | Retained as control. |
| §6.8 no finite-Tor restriction on tested M | Λ = Z/4, M = Z/2 | Hom_Λ(M,Λ) = (2) ≅ Z/2; double dual Z/2; Tor dimensions unbounded. | Module need not be projective. | None. |
| §6.9 biduality | Strict regular local ring dimension d | Normalized K = Λ(d)[2d]; on Λ, double twist/shift cancels, D²Λ = Λ. | Agrees with regular and coefficient normalization. | None. |
| §6.10 stronger dualizing necessity | Trait, ℤ/6 factorwise twist of normalized K | n₂ = (−2,0), n₃ = (−3,−1); each changes by 2. Floors of negative halves give (1,0) for both. | Dimension function obtained without a common shift. | Added scope and Check. |
| §6.10 uniqueness up to invertible object | Strict regular local dimension d | Λ and Λ(d)[2d] differ by invertible Λ(d)[2d]; inverse Λ(−d)[−2d]. | Unpinned objects are not uniquely isomorphic. | None. |
| §6.11 normalization | d = 0,1 | K = Λ for field; K = Λ(1)[2] for trait; closed support in both cases Λ. | Dimension-zero formula is meaningful. | Deleted last stale gap reference. |
| §6.12 local duality | Strict trait, F = Λ | H²_sΛ = Λ(−1); Hom(H⁻²(K)_s,Λ) = Hom(Λ(1),Λ) = Λ(−1). | Degree −i is correct. | None. |
| §7.1 principal-open vanishing | d = 1, f uniformizer; f = 0 | Generic field has H^q = 0 for q > 1; zero localization is empty, all groups 0. | Bound includes zero f. | None. |
| §7.2 extension-by-zero vanishing | d = 1, f uniformizer | H⁰_m(j_!Λ) = 0; dual stalk K|_η yields no H⁰_m contribution. | Vanishing below d holds. | None. |
| §7.2 unit boundary | f a unit outside stated maximal-ideal domain | j = identity, purity gives support vanishing below 2d, hence below d. | Broader example does not falsify scoped theorem. | None. |
| §7.3 local Lefschetz | DVR, f uniformizer | In degree d−1 = 0: 0 → Λ injective, not surjective. | Boundary is injectivity only. | Consumer claim narrowed. |
| §7.3 zero and dimension-zero cases | f = 0; d = 0 | Restriction identity; when d = 0 threshold d−1 = −1, both negative-degree groups 0. | No natural-number subtraction convention used. | None. |
| §7.3 hypersurface consequence | Regular ambient dimension d | Source supports vanish below 2d; restriction gives quotient supports 0 below d−1. | Correct PF.1 input. | Downstream citation corrected. |
| §8.1 matched-open definition | Rank-one valuation pair | Closed special fibre is one point; its closed subsets are empty and whole. Complements give exactly two matched pairs. | Order correspondence determines object. | Combined duplicate Checks with explicit completion. |
| §8.1 unions/intersections | Two admissible opens U,V | Complements: Z_(U∪V) = Z_U ∩ Z_V; Z_(U∩V) = Z_U ∪ Z_V on both quotient spectra. | Inclusion and operations preserved. | None. |
| §8.1 generic-fibre exclusion | Open missing a generic point | Its complement meets D(ϖ), whereas an admissible complement lies in V(ϖ). | No matched open in the specified poset. | None. |
| §8.1 sharp-quotient powers | ϖ = p^(1/p) in O_C | ϖ^p = p; Frobenius identifies O_C/ϖ with O_C/ϖ^p; quotient spectra each one point. | Powered sharp quotient and unpowered consequence distinguished. | None. |
| §8.2 localized multiplicative tilt | Perfect char-p complete ring; O_C | First: A^♭ = A, coordinate zero gives identity; second: lim_(x↦x^p) C = C^♭ multiplicatively, not C. | No additive untilt identification asserted. | None. |
| §8.3 idempotent comparison | A₁ × A₂; connected A | Idempotents (1,0),(0,1) survive tilting; connected whole spectrum has {0,1}. | Boolean decomposition retained. | None. |
| §8.4 valuation-product cohomology | One aic rank-one valuation, generic open | Generic spectrum algebraically closed field: H⁰ = G, H^q = 0 for q > 0, before and after tilt. | No higher terms. | None. |
| §8.4 empty generic open | Algebraically closed char-p field, ϖ = 0 | D(0) empty: all groups 0; whole field spectrum H⁰ = G. | Does not assign G to empty open. | None. |
| §8.4 infinite product components | e_J in a product; ultrafilter U | e_J = 1 on J, 0 elsewhere; component belongs to D(e_J) iff J ∈ U on both sides. | No rank-one assumption on ultraproduct components. | None. |
| §8.5 cohomology tilting | Perfect char-p complete A; A = O_C | First comparison identity; second on whole and generic spectra has G in degree 0 on both, higher groups 0. | Matches valuation calculation and arbitrary torsion. | None. |
| §8.6 support tilting | Z empty; algebraically closed char-p field with ϖ = 0 and Z whole | Fibres of identical maps are 0 in first case; second support complex is G[0] on both sides. | Empty/full boundaries distinguished. | None. |
| §8.6 nondiscrete valuation control | O_C, Z = V(ϖ) | Affine and generic complexes both G[0], restriction identity G → G; support fibre 0. | No DVR purity class on nondiscrete O_C. | None. |
| §8.6 perfect-field control | Spec F_p, ℓ ≠ p | H¹(Spec F_p,Z/ℓ) = Hom_cont(Zhat,Z/ℓ) = Z/ℓ. | Perfectness alone does not kill higher cohomology. | None. |

## Maintainer consequences

Three supplier gaps remain: ILLUSIE-2003, equicharacteristic-cohen-coefficients and generic-constructibility-noetherian. Each has a named earlier supplier and exact section. The first requires the supplier's author or a human ownership decision; this report does not certify that supplier theorem as present. The Epp source-access issue is settled as an uncertified citation, not converted into an invented supplier obligation.

The only new Lean name is cohomologicalDimension_le_of_strictlyLocal. Existing Lean names are unchanged. README §5.3 now means regular base change and §5.4 means transport; consumers citing those subsection numbers should use this mapping. The trait support-bound construction is requested upstream; §5.5 here is its local consequence. PurityForFlatCohomology's PF.1 request remains supported; no claim that PF.4 uses §8.6 remains. Its merge-order issue requires intake action outside this package.

Only the authorized README, Suggested.lean, sources.toml, top-level plan gaps and this report were changed. The design's other fields, other roadmap folders, tooling, pins and merge order were not edited. No commit or push was made.
