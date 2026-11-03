# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 361dda3)

**Verdict:** needs changes

## R01 (P1) — Perfect fraction fields miss purely inseparable non-coverings

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:236`, §0.4: “a perfect field whose absolute Galois group is a pro-ℓ group”.

**Claim:** The prime-to-ℓ alteration topology is detected by these valuation rings, including when ℓ equals the characteristic.

**Witness:** Take k = 𝔽_p(t), Y = Spec k(t^(1/p)), X = Spec k and ℓ = p. Every specified test lifts, but [k(t^(1/p)):k] = p is not prime to p.

Indeed, in any perfect fraction field K containing k, the unique p-th root of t exists. It lies in the valuation ring V because it is integral over V. Thus every test in the stated class lifts. On the other hand, every finite field extension through which a point of Y factors has degree divisible by p. No prime-to-p covering refinement exists. This refutes the “if” direction, already for a field and for p = 2 or 3.

**Repair:** Use the published test class: the fraction field has pro-ℓ absolute Galois group, and perfection is required only when ℓ ≠ char(K). Preserve the topology in characteristic ℓ. Cite ILO-final-II, Remark 4.2.2, p. 34, lines 522–527, and add this inseparable example as a negative-control Check. For the repaired test class V = k^sep is allowed: its absolute Galois group is trivial, but it contains no p-th root of t, so this test fails to lift and correctly rejects Y → X. The unqualified perfection condition in ILO14 line 1579 was corrected in the published text.

## R02 (P2) — Oriented descent is restricted to its applications

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:718`, §3.6: “this finite-type scope, which suffices for the applications to open and closed immersions”; also §§3.3 and 3.5, lines 652 and 702.

**Claim:** The library develops oriented descent only for diagrams finite type over one fixed noetherian base, and hyper-base-change only for finite-type f and g.

**Witness:** Set S = Spec k[t], X = Spec k(t), Y = S, g = id, and use the constant hypercover. Both sides are Rf_*K, but f is not of finite type.

The source supports this case: ILO14, XII Theorem 2.2.4, pp. 192–194, line 9093, treats noetherian diagrams without that finite-type restriction. The published treatment repairs the ambient-category problem without narrowing the theorem: ILO-final-XII, XIIA §2.1.1, p. 241, lines 218–223, uses diagrams of schemes; Theorems 2.2.3 and 2.2.5, p. 243, lines 279–300, supply descent and hyper-base-change, with coherence of the direct-image morphism. Morphisms between noetherian schemes satisfy that coherence hypothesis.

**Repair:** Build the oriented topology in the ambient scheme-diagram category of the published source, with universes fixed, and retain arbitrary noetherian diagrams in the noetherian headline. State the coherent-morphism condition when extending outside that domain. Keep the finite-type subcategory as a specialization, not the general target. This includes the displayed localization example and its identity comparison, while avoiding the false assertion that arbitrary fibre products of noetherian schemes are noetherian. Update the locators to distinguish XII in the preprint from XIIA in the published volume.

## R03 (P3) — ArcTopologyAndDescent §8.3 does not exist

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:122`: “Sections 8.3 and 8.6–8.9 supply henselian rigidity”; repeated at lines 21, 942, 960, 1010, 1272, 1288, 1388 and 1424.

**Claim:** §8.3 is a supplier for rigidity and completion comparisons.

**Witness:** At the supplied open head, `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1078` has rigidity in §8.7; lines 1101 and 1111 have punctured completion and support refinements in §§8.8–8.9. There is no §8.3.

**Repair:** Remove the redundant §8.3 references and cite §8.7 for rigidity, §8.8 for punctured completion and §8.9 for the bounded-torsion/support refinement as appropriate. For the henselian pair (k⟦t⟧,(t)), §8.7 supplies the comparison with k; §8.9 supplies the support refinement needed here. This is locator drift, not an unowned prerequisite: the existing citations to §§8.6–8.9 already include the actual suppliers.

## R04 (P3) — The five supplier contracts have lost their gap identifiers

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:68`, and lines 72, 84, 102 and 116.

**Claim:** These paragraphs declare the five additional supplier contracts.

**Witness:** `packages/EtaleDualityAndPerverseSheavesPartII/design/plan.json` retains all five gap slugs. The reviewed README contains their needs sentences but zero occurrences of `gap:`.

**Repair:** Prefix each needs sentence with the required “What <Supplier> must provide (gap:<slug>):” form:

| README line | Supplier and section | Identifier |
| --- | --- | --- |
| 68 | SchemeAndStackFoundations §0.21 | `gap:henselian-quasi-excellent-catenary` |
| 72 | SchemeAndStackFoundations §0.14 | `gap:elkik-finite-algebra-completion` |
| 84 | DeformationAndDerivedPatchingAlgebra §1.10 | `gap:equicharacteristic-cohen-coefficients` |
| 102 | EtaleCohomologyFoundations §F.3 | `gap:generic-constructibility-noetherian` |
| 116 | LefschetzPencilsAndVanishingCycles §6.2 | `gap:ILLUSIE-2003` |

The repaired list has five identifiers matching five plan entries, without changing any mathematical contract. The brief already declares these gaps, so their absence from today's suppliers is not a blocking finding.

## R05 (P3) — Put the regular pinned construction before the top-class theorem

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:1010`, §6.2, cites “the regular pinned construction in §6.4”.

**Claim:** Layer 6 is presented in build order, but §6.2's proof requires §6.4.

**Witness:** The local dependency chain is §6.1 → §6.3 → §6.4 → §6.2. The top-class proof explicitly pulls back the regular potential complex to prove injectivity.

**Repair:** Order these subsections as immediate transitions, putative/potential complexes, regular potential complex, higher transitions/top class; renumber their references consistently. The regular trait example then constructs Λ with its codimension pinning before it is used in the top-class argument. There is no mathematical cycle: §6.4 uses immediate compatibility from §6.1, not the general higher-transition theorem. The defect is the advertised build order.

## Verified sound

This is a review of the entire two-file folder at the specified head: 55 numbered README targets and all nine Lean declarations (six theorems and three structures). The findings above qualify the results below; successful examples are not proofs of the general theorems.

**Gate, file scope and elaboration.** The supplied gate passed every check, including the targeted build. Its recorded counters are:

```text
set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0
residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The outside-folder diff is empty. Independent direct elaboration of `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` succeeded with only six `sorry` warnings. A separate copy with `#check @name` for each of the nine declarations also elaborated; comparison with the README found no dropped standing binder. The original worktree was not edited.

The independent dependency check returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The local forward reference in R05 is separate from this cross-roadmap graph.

**Principles and shape.** The base roadmap's field/one-dimensional-base results are extended, rather than planned again. No computational algorithm, sorry'd data, arbitrary proposition standing in for a construction, `set_option`, extra import, or copied source passage was found in the reviewed files. Definitions have prose interfaces and at least three Checks; the layers have examples and dependencies. The gap identifiers and stale supplier locator require R03–R04. The restriction in R02 conflicts with the general-library requirement.

**Seeded source sample: 15/15 texts and locators inspected.** Page numbers below are the printed pagination of the cited version, not PDF page indices. Every listed source was read from the provided legal cache. The README has no additional locator marked unverified.

| Target | Source text opened | Hypotheses and conclusion compared | Result |
| --- | --- | --- | --- |
| 0.4 Valuative characterization | ILO14 II 4.2.1–4.2.2, p. 32, line 1571; ILO-final-II 4.2.1–4.2.2, pp. 33–34, lines 485–527 | Noetherian X, object of alt/X, maximally dominant valuation tests; algebraically closed fraction field versus pro-ℓ tests | Ordinary alteration version matches the published correction; prime-to-ℓ version fails as in R01. |
| 0.6 Henselian reduction | ILO14 II 4.3.3 and proof, pp. 33–34, lines 1631–1655 | Reduction through components, normalization and henselian local excellent normal schemes; quasi-excellent input and dimension control | Supported, with the explicitly declared henselization/catenarity supplier contract. |
| 1.2 Equivariant Cohen–Gabber | ILO14 IV 2.2.2 and proof, pp. 53–55, line 2419 | Reduced complete noetherian equicharacteristic local A; finite group of invertible order; residue action; fixed parameters; generic étaleness | Matches. Positive-characteristic source proof and the characteristic-zero Cohen/separable normalization route cover the stated cases. Equidimensionality is not inserted. |
| 2.1 Equivariant nodal-curve alteration | DJ97 2.4 and 2.5, pp. 602–603, lines 139–162; ILO-final-IX 1.2, pp. 161–162, lines 35–60 | Excellent integral base; geometrically irreducible smooth generic curve; markings, boundary and exceptional base locus; group extension and quotient condition | Supported by the excellent-base formulation, not merely the field-base theorem. |
| 4.1 Constructibility | ILO14 XIII 2.1–2.2, pp. 195–197, lines 9294–9351; SGA4half [Th. finitude] 1.9(i)–(ii), p. 236, lines 7774–7779 | Finite-type morphism over quasi-excellent noetherian schemes, invertible finite coefficients; generic constructibility has no properness requirement | Matches, conditional on the declared general-noetherian generic-constructibility contract. The roadmap correctly allows disconnected hypercover terms. |
| 5.3 Regular base change | ILO14 XIV 2.5.3, pp. 216–217, lines 10216–10231 | Regular map of noetherian bases, qcqs other morphism, torsion sheaf in the stated coefficient domain | Matches; it does not assert invariance of arbitrary global cohomology under completion. |
| 6.7 Potential-dualizing functoriality | ILO14 XVII 4.1.1–4.1.3, p. 280, lines 13512–13538 | Regular pullback and finite-type exceptional pullback with their different induced dimension functions | Matches, including the finite-type/compactifiable domain for exceptional pullback. |
| 6.9 Biduality | ILO14 XVII 6.1.1, p. 293, lines 14233–14246 | Excellent noetherian X with dimension function; potential complex; bounded constructible inputs, not just perfect inputs | Matches. Finite quasi-injective dimension is equivalent to finite scheme dimension, not a premise for all biduality. |
| 6.11 Normalized regular-local complex | CS24 proof of 3.2.3, p. 33, lines 1367–1380; ILO14 XVII 2.4.4.1, p. 267, line 12835, and 0.9, pp. 258–259, line 12220 | Strictly local excellent regular ring of dimension d; invertible Λ; Λ(d)[2d] normalized to δ(closed point)=0 | Matches, including the twist and the cohomological shift. |
| 6.12 Local duality | CS24 proof of 3.2.3, p. 33, lines 1367–1380; ILO14 XVII 6.1.1, p. 293, line 14233 | Strictly local excellent X, normalized potential complex; finite-coefficient duality of support and global dual sections | Supported by the local-duality argument with self-injective Λ. No finite-Tor restriction on the input is smuggled in. |
| 7.3 Local Lefschetz | CS24 Lemma 3.2.3, p. 33, lines 1356–1380 | Strictly henselian regular local A, arbitrary f in its maximal ideal, invertible torsion; isomorphism below d−1 and injection at d−1 | Matches; neither excellence nor f ≠ 0 is a theorem hypothesis. The completion step uses the support comparison. |
| 8.1 Matched opens | CS24 2.1.2, pp. 10–11, lines 415–423, and 2.2.7, p. 21, lines 827–835 | Global henselian pair, bounded ϖ-power torsion, perfectoid completion; opens containing D(ϖ); sharp and Frobenius quotient identifications | Matches; the unpowered quotient uses Frobenius, not a misquoted sharp map. |
| 8.2 Multiplicative generic-fibre tilt | CS24 (2.1.7.2), p. 13, lines 513–516 | Inversion of ϖ and compatible p-power sequences; multiplicative comparison | Matches. No additive identification between characteristic-zero and characteristic-p generic fibres is claimed. |
| 8.3 Idempotents | CS24 proof of 2.2.7, pp. 21–22, lines 836–851 | Matched opens, completion/glueing, idempotents and disjointness | Matches, including arbitrary matched opens rather than only principal affines. |
| 8.5 Algebraic tilting of cohomology | CS24 2.2.5, p. 20, lines 800–818, and 2.2.7, pp. 21–22, lines 827–877 | Torsion abelian coefficients, including characteristic-primary coefficients; matched opens and henselian perfectoid pairs | Matches. Perfectness alone is not used to assert acyclicity. |

**Computed adversarial pass.** Each row records actual values, objects or maps. “No change” means that this test did not refute the statement; it is not a claim that examples prove it. Λ below is nonzero finite constant torsion of order invertible on the scheme unless a row explicitly changes that condition. For local examples k is algebraically closed, and dimensions and supports are specified. The first table has one row for each of the 55 numbered targets; the following tables separately check conventions, structure/signature boundaries and gap contracts.

| Statement | Instances tried | Values on the two sides / defining laws | Result and change |
| --- | --- | --- | --- |
| 0.1 alt/S, reduction, products and universal properties | S=Spec k; S=Spec k[ε]/ε²; P¹→Spec k | A point has generic degree 1; P¹ has transcendental generic fibre and is excluded. S_red=Spec k has one S-map from each reduced S-object. | Reduction terminal object and generic-finiteness filter discriminate; no change. |
| 0.2 ℓ′ alteration topology and degree conventions | ℤ[i]/ℤ, ℓ=2,3; Frobenius on 𝔸¹_𝔽p; ℓ=1,∞ | Degree 2 has gcd(2,3)=1 and gcd(2,2)=2; Frobenius degree p has gcd(p,p)=p. Formal ∞ allows degree 1 only, formal 1 all positive degrees. | Correct degree distinctions; no change. |
| 0.3 Standard covering forms | Identity; empty base; nonempty point with empty family | Identity degree 1 covers; empty family covers ∅; it misses the unique point of Spec k. Composite degree 1·1=1. | Covering and empty cases agree; no change. |
| 0.4 Valuative criterion | 𝔽_p(t^(1/p))/𝔽_p(t), ℓ=p, p=2,3 | Stated perfect-valued tests all lift; degree=p has gcd(p,p)=p, so covering=false. Repaired V=k^sep gives zero lifts. | False converse; R01. |
| 0.5 Higher-graded approximation | k⟦t⟧ versus its closed point; identity comparison | Both special fibres are k; degree-one associated graded pieces are k versus 0. Identity has k in every graded degree on both sides. | Fibre agreement alone is excluded by the higher-graded comparison; no change. |
| 0.6 Henselian-normal reduction | Nodal curve with two branches; reduced two-point scheme; empty scheme | Normalization has two branch points; covering must meet both. Two-point base needs both images, while the empty base needs zero. | Reduced/componentwise formulation preserves coverage; no change. |
| 0.7 Complete-local reduction | Complete regular trait; plane with three lines through origin | Completion of the trait is itself, so both models equal k⟦t⟧. Blowing up the plane separates three strict transforms; each meets the exceptional curve at a different point, at most two components per crossing. | Approximation retains the snc condition, not merely the underlying closed fibre; no change. |
| 1.1 Equal-characteristic Cohen–Gabber | k⟦x,y⟧/(y²−x³), p=2,3; d=0 | At p=2 use t=y: generic degree 3, derivative x²≠0. At p=3 use t=x: degree 2, derivative 2y≠0. A reduced local zero-dimensional A=k gives degree 1. Parametrizing k⟦x⟧ by x^p instead has derivative 0. | Generic étaleness excludes inseparable wrong parameters; no change. |
| 1.2 Equivariant theorem | C₂ acting by x↦−x, char≠2; S₃ permuting three variables, char∤6; char=2 | Invariants x² and elementary symmetric parameters give generic degrees 2 and 6; coefficient action is induced, parameters fixed. In characteristic 2, card(C₂)=0 is not a unit. | Equivariance and invertible-order condition distinguish tame from wild; no change. |
| 1.3 Epp elimination | Already unramified extension; characteristic-2 Artin–Schreier cancellation | Unramified ramification index stays 1. For RHS u²π^(−2)+uπ^(−1), substituting z↦z+uπ^(−1) gives RHS 0, hence two split roots. | Cancellation must precede leading-term reasoning; original Epp text remains uncertified. |
| 1.4 Mixed Cohen–Gabber | A=ℤ_p⟦x⟧, d=2, H=1; p=3, ℓ=2 with V=W(𝔽̄₃)[π]/(π²−3), H=C₂ | Identity presentation has degree 1 and identity p-fibre map. In the second example H sends π↦−π, fixes x, B=V⟦x⟧ and B^H=W(𝔽̄₃)⟦x⟧; invariant degree 1. | Coefficient action must be retained; no change. |
| 1.5 Partial algebraization and ideal marking | A=k⟦x,y⟧, B=k⟦x⟧, C=B[y], n=(x,y); ideal (y−x²) | dim B=1<2=dim A; completion C_n^∧=A; extended model ideal=(y−x²). B=A would give 2<2, false. Ideals (x),(x²) have quotient lengths 1,2 in k⟦x⟧. | Real completion and equality of ideals exclude identity-base and radical-only stand-ins; no change. |
| 1.6 Equal-characteristic partial algebraization | Reduced nodal complete curve; zero-dimensional field | Curve has d=1 and algebraization base k of dimension 0, giving 0+1=1. A field has d=0 and fails positive dimension. | Correct boundary and dimension drop; no change. |
| 1.7 Mixed partial algebraization | ℤ_p⟦x⟧ with any finite polynomial ideal family; ramified C₂ coefficient example | Extension degree 1 may be chosen before the family; B=ℤ_p has dimension 1 versus 2. In the ramified example the invariant coefficient ring is W, while an invariant square root of 3 would require 2v₃(b)=1. | Correct quantifier order and descent of coefficient action; no change. |
| 2.1 Equivariant nodal curves | P¹_k with one marked point; P¹_L as a k-curve for a nontrivial finite separable L/k | Identity has degree 1, one étale marking and smooth fibres. The second generic curve splits into [L:k] geometric components, so geometric irreducibility fails. | Excellent-base theorem retains the necessary generic-curve condition; no change. |
| 2.2 Weak uniformization | Cone xy=z², including char=2; empty scheme | On one blow-up chart y=xz₁², coordinates (x,z₁) are regular; boundary x=0 is regular. Empty base admits zero covering pieces. | Regularity/snc output is substantive and empty case consistent; no change. |
| 2.3 Prime-to-ℓ uniformization | Regular pair; a proposed degree-ℓ alteration | Identity degree 1 is prime to every ℓ; degree ℓ has gcd=ℓ and is rejected. A generically allowed degree alone does not supply the residue-point lifting condition of an ℓ′ covering. | Degree and covering conditions remain separate; no change. |
| 2.4 Regular snc hypercovers | Two disjoint points; constant one-point hypercover; truncation q=0,1 | Two-point base requires X₀ meeting both points and cannot have connected X₀. Constant matching maps are identities. Required skeleta reach degrees 1 and 2 respectively. | Finite disjoint unions and q+1 truncation are correct; no change. |
| 3.1 General oriented product | Strict trait; point base; empty factor | Underlying specialization pairs are (s,s),(η,η),(s,η): three, versus two for the ordinary self-fibre product. A point factor over a point recovers the other topos; empty factor gives empty product. | Orientation and universal property exclude the ordinary product; no change. |
| 3.2 Tube comparison | Point base; generic open of a strict trait | For a point, both complexes are the same sections complex. For the punctured strict trait, H⁰=Λ and H¹=Λ(−1) on both sides. | Comparison preserves the nonzero degree-one stalk; no change. |
| 3.3 Diagram topology | Identity; blow-up of 𝔸²; {0}⊂𝔸¹ over a point; k(t)/k[t] | Identity covers. The type-(iv) blow-up covers though its exceptional fibre is P¹, not étale. {0} misses 𝔾_m and does not cover. Localization example is excluded by finite type. | Cover generators discriminate correctly; restore general ambient category in R02. |
| 3.4 Proper oriented acyclicity | π=id and K=Λ; zero K | Adjunction is id_Λ with cone 0; for K=0 both sides are 0. Proper blow-ups are permitted without requiring π étale. | Identity and zero complexes agree with the claimed unit; no change. |
| 3.5 Oriented descent | Constant hypercover; Čech nerve of two points covering a point | Constant normalized complex is K in degree 0, zero extra degrees. Čech cochains start Λ²→Λ⁴ with kernel diagonal Λ and higher augmented cohomology 0. | Descent map is correct; R02 restores its general scope. |
| 3.6 Hyper-base-change | S=Spec k[t], X=Spec k(t), Y=S; constant hypercover | Left=Rf_*K, right=Rf_*K, comparison=id; f is not finite type. For f=id both sides are g^*K. | Source-supported identity case is excluded by target; R02. |
| 4.1 Constructibility via weak uniformization | snc complement with r=0,1,2 branches; n=1 | R^qj_*Λ stalk ranks are (1), (1,1), (1,2,1), the binomial coefficients; all are finite. For n=1 every stalk is 0. | Correct finite-stratification model and coefficient boundary; no change. |
| 4.2 Global finiteness | Same snc complements; characteristic-primary coefficients on 𝔸¹ | Invertible coefficients vanish above r. In characteristic p, Artin–Schreier classes t^m, p∤m, give infinitely many independent classes, so finite-dimensionality cannot be inferred for ℤ/p. | Invertibility cannot be dropped; no change. |
| 5.1 Dimension functions, shifts and support dimension | Strict trait; zero sheaf; regular surface | Trait normalized values (δ(η),δ(s))=(1,0), negative-codimension values (0,−1), both drop 1. Surface chain values 2,1,0; zero support has supremum −∞. | Sign and zero-support conventions agree; no change. |
| 5.2 Existence | Field; dual-number thickening; regular strict trait | One-point spectra k and k[ε]/ε² admit δ=0 with no immediate pair. Trait admits 1→0. Nilpotents add no specialization or δ equation. | Hypotheses are not silently replaced by reducedness; no change. |
| 5.3 Regular base change | Identity; strict henselian trait completion and j:η→S | Identity exchange is id. Closed stalks of Rj_*Λ before/after completion have H⁰=Λ,H¹=Λ(−1); higher groups 0. | Correct stalkwise comparison, not an assertion of equality of arbitrary global sections; no change. |
| 5.4 Induced dimension functions | 𝔸¹_k→Spec k, δ(k)=0 | Finite-type transport gives generic/closed values (1,0); regular transport gives (0,−1), differing by relative dimension 1. Identity transport changes δ by 0. | The two conventions are deliberately distinct; no change. |
| 5.5 Trait consequence | Strict trait puncture; closed point | d=1: H¹(η,Λ)=Λ(−1), H²=0, matching bound 1. d=0 point has H⁰=Λ and H^q=0 for q>0. | Sharp degree bound; no change, conditional on trait gap. |
| 5.6 Affine Lefschetz and signs | 𝔾_m/k; t=u^ℓ; snc surface with branch swap | H¹(𝔾_m,Λ)=Λ(−1), matching dim=1. Kummer pullback for t=u^ℓ is multiplication ℓ=0 on ℤ/ℓ. Swap interchanges H¹ basis and acts by −1 on H²: 1 mod 2, 2 mod 3. | Affine bound, ramification and exterior-power parity consistent; no change. |
| 5.7 Local affine bound | Strict trait; regular strict surface principal puncture; finite-residue trait as negative control | Punctured strict trait has cd_ℓ=1. Principal puncture in dimension 2 has H^q=0 for q>2. For 𝔽_q((t)), cd_ℓ=2, not 1. | Strict locality is essential to the stated version; no change. |
| 5.8 Bound 2d−1 | Strict trait; punctured regular strict surface; d=0 point | d=1 gives bound 1 and H¹≠0; d=2 gives bound 3 and H³=Λ(−2). d=0 would give −1 but H⁰=Λ, so the positive-dimension binder matters. | Headline is sharp on these cases; no change. |
| 6.1 Immediate transitions | Strict trait; residue degree 2 with Λ=ℤ/3; degree 3 with Λ=ℤ/2 | Kummer generator maps 1↦1. Normalized trace factors satisfy 2·2=1 mod 3 and 3·1=1 mod 2. A closed skyscraper has generic group 0. | Direction and inverse inseparable-degree normalization correct; no change. |
| 6.2 Higher transitions/top class | Regular strict surface; d=0 field; two saturated regular flags | Surface H⁴_x(Λ(2))=Λ and H^q=0 for q>4; each composite fundamental-class transition sends 1↦1. Field top class is H⁰=Λ. | Values agree; prerequisite ordering requires R05. |
| 6.3 Putative/potential complexes and pinning | Strict trait with δ=(1,0); shifted δ; empty scheme | K=Λ(1)[2] has generic Λ(1)[2] and closed support Λ; wrong K=Λ has generic degree 0 rather than −2. δ+1 uses K(1)[2]. Empty scheme has only 0. | Rank-one pinnings and shift law determine the intended object; no change. |
| 6.4 Regular potential complex | Strict regular surface, δ=−codim; field | For unshifted Λ, closed support is Λ(−2)[−4], in degree 4; proposed shift [+4] would put it in degree −4. Field has c=0 and pinning Λ. | Purity shift correct; move before §6.2 as R05. |
| 6.5 Pointwise perverse t-structures | Point with p=0; strict trait p=−2δ; p=+∞ | Point gives standard t-structure. Trait K=Λ(1)[2] has generic degree −2 and closed support degree 0, exactly p=(−2,0); Λ fails generic ≤−2. Infinite perversity gives D^{≤p}=D⁺, D^{≥p}=0. | Sign and extreme perversity are consistent; no change. |
| 6.6 Potential existence/uniqueness | Point; two-point disjoint union; rank-two wrong model | At point, End(Λ)=Λ but pinning-preserving automorphism is only 1. Rank-two Λ² has stalk rank 2≠1. Two components carry two independent rank-one pinnings. | Uniqueness is for pinned objects, not arbitrary automorphisms of an unmarked complex; no change. |
| 6.7 Functoriality | Identity; smooth affine line over k | Identity leaves K and δ unchanged. Finite-type exceptional pullback gives Λ(1)[2], δ=(1,0); regular ordinary pullback gives Λ, δ=(0,−1). | Both functors match their dimension transport; no change. |
| 6.8 Dualizing predicate and invertible ambiguity | Point, Λ=ℤ/4,M=ℤ/2; K=Λ²; composite Λ=ℤ/6 | Hom_Λ(M,Λ)=(2)≅M and double dual=M. Wrong K=Λ² yields DDΛ=Λ⁴, not Λ. Invertible ℤ/6-complex 𝔽₂⊕𝔽₃[1] has inverse 𝔽₂⊕𝔽₃[−1]. | Full constructible duality and componentwise shifts discriminate; no change. |
| 6.9 Biduality | Same nonperfect ℤ/4-module ℤ/2; normalized regular strict trait | Double dual of ℤ/2 is ℤ/2 despite infinite Tor dimension. Trait normalized K has RΓ_sK=Λ. | Finite-Tor restriction on F is not needed; no change. |
| 6.10 Excellent duality and normalization | Regular trait; coefficient factors 𝔽₂ and 𝔽₃ | Normalized support degrees are 0. If support offsets n on η,s are (−2,0) or (−3,−1), floor(−n/2)=(1,0) in either case. | Componentwise shift ambiguity does not change the immediate-drop convention; no change. |
| 6.11 Regular-local normalized complex | Dimensions 0,1,2 | K=Λ,Λ(1)[2],Λ(2)[4] respectively; RΓ_closed(K)=Λ in degree 0 in all three cases. Unshifted Λ in dimension 2 has support degree 4. | Twist and 2d shift verified; no change. |
| 6.12 Local duality | Strict trait, F=Λ and F=Λ[1] | For F=Λ, H²_sF=Λ(−1)=Hom(Λ(1),Λ). For F=Λ[1], H¹_sF=Λ(−1), while DF=Λ(1)[1] has H^(−1)=Λ(1). | Degree reversal and twist agree; no change. |
| 7.1 Principal-open vanishing | Strict trait, f=uniformizer, f=0, f=unit | Uniformizer puncture: H¹=Λ(−1), H²=0. D(0)=∅ gives all groups 0; D(1)=whole strict local scheme has H⁰=Λ and higher 0. | These extremes do not contradict the bound; no change. |
| 7.2 Support of extension by zero | Strict trait, generic j, constant Λ | H⁰_s(j!Λ)=0, H¹_s(j!Λ)=Λ, so vanishing for i<d=1 is sharp. For empty open j!Λ=0, all groups 0. | Lower bound and localization shift agree; no change. |
| 7.3 Local Lefschetz | Strict regular trait, closed hypersurface; f=0 | At d−1=0, restriction is 0→Λ, injective but not surjective. f=0 gives identity on X, hence an isomorphism in all degrees. | Injection endpoint is necessary; no added f≠0 or excellence hypothesis. |
| 8.1 Henselian perfectoid pair/matched opens | O_C×O_C with nonzero ϖ; 𝔽_p with ϖ=0 | Each rank-one component has two points. Opens containing both generic points have 2²=4 choices on each side. For ϖ=0, D(ϖ)=∅ and both opens of Spec 𝔽_p are allowed. | Matching is not arbitrary identification of all spectral opens; no change. |
| 8.2 Multiplicative generic-fibre comparison | Perfect characteristic-p A; A=𝔽_p,ϖ=0; O_C | In characteristic p, Frobenius is bijective and its inverse-limit multiplicative monoid identifies with A[1/ϖ]. If ϖ=0 the localization is the zero ring on both sides, one monoid element, not p elements. O_C gives C^♭, not an additive isomorphism C≅C^♭. | Localization and multiplicative scope correct; no change. |
| 8.3 Idempotent comparison | Two components; empty open; connected nonempty open | Idempotent counts are 4↔4, 1↔1, 2↔2. Primitive e₁e₂=0; collapsing both to e₁ would give e₁²=e₁≠0. | Orthogonality rules out the wrong comparison; no change. |
| 8.4 Valuation-product cohomology | Two algebraically closed generic fields; empty index set; infinite product clopens | Two components give H⁰=G² and H^q=0 for q>0 on each side. Empty product ring is 0, spectrum empty, cohomology 0. Idempotent of subset J has value 1 exactly at ultrafilters containing J. | Components and ultraproduct points are retained; no rank-one claim for all components. |
| 8.5 Algebraic tilting | A=𝔽_p,ϖ=0, U=Spec A; coefficients ℤ/ℓ including ℓ=p | Tilt is 𝔽_p. Both sides have H⁰=ℤ/ℓ,H¹=ℤ/ℓ,H^q=0 for q≥2. | Characteristic-primary comparison holds; perfectness does not imply acyclicity. |
| 8.6 Supports | Empty closed support; whole Spec 𝔽_p; rank-one O_C with generic open | Empty support gives 0↔0. Whole finite-field support gives H⁰=H¹=ℤ/ℓ on both sides. For O_C, restriction RΓ(O_C,G)→RΓ(C,G) is G→G identity, so its shifted fibre is 0 on both sides. | Comparison respects the support fibre triangle; no change. |

| Additional statement | Instances and values computed | Result / change |
| --- | --- | --- |
| Nonzero local rings and coefficient convention | Zero ring has 0=1 and is excluded by IsLocalRing; ℤ/1 coefficients give 0 cohomology, while Λ=ℤ/2 on a point gives H⁰=ℤ/2. | Domain and n≥2 duality convention discriminate. |
| Complex shift and Tate twist convention | A module Λ[2] has H^(−2)=Λ and H²=0; strict trait H²_sΛ=Λ(−1), so H⁰_s(Λ(1)[2])=Λ. | Same signs in supplier purity and Layers 6–7. |
| Generic étaleness versus all components | A=k⟦x,y,z⟧/(xy,xz), t₁=x+y,t₂=z: generic fibre over Frac(k⟦t₁,t₂⟧) has degree 1 on the plane; the line component disappears. z·x=0 with z,x≠0. | Equivariant theorem correctly omits torsion-freeness/equidimensionality; it does not discard the lower component from A itself. |
| Finite-group class boundaries | C₂ has order 2; S₃ order 6; Q₈ order 8. At ℓ=2, Q₈ is an ℓ-group, S₃ is not since it has order-3 elements. Trivial group has order 1. | IsPGroup field and tame order field are different, necessary filters; no abelian-only assumption. |
| MixedCohenGabberPresentation, Lean line 105 | d=2 gives Fin(d−1)=Fin 1; d=0,1 are excluded by 2≤d. B=A=ℤ_p⟦x⟧ has fraction degree 1 and residue-map identity; a zero map violates injectivity. | No natural-subtraction junk case enters the headline; marked structural maps exclude arbitrary presentations. |
| PartialAlgebraization, Lean line 182 | Model B=k⟦x⟧,C=B[y] gives completion k⟦x,y⟧ and ideal (y−x²). The empty ideal family imposes zero ideal equations but still requires 1<2 and a completion equivalence. | Not a vacuous existence when the family is empty. |
| PrimeToEllLocalExtension, Lean line 228 | Identity has positive generic degree 1, gcd(1,ℓ)=1. A degree-ℓ extension has gcd=ℓ. For the structure's extra input ℓ=0 only degree 1 satisfies gcd(d,0)=1; ℓ=1 accepts every positive degree. | Wider structure domain is meaningful; prime binders remain in the theorems. |
| Sheaf torsion binder, Lean line 279 | Constant ℤ/ℓ^r needs exponent r; the sum over all r has no uniform global r. On each qc affine étale object a locally torsion section has a finite-cover maximum exponent. | The signature expresses ℓ-primary torsion, not bounded exponent. |
| Gap: henselian quasi-excellence/catenarity | k⟦t⟧ is already henselian, dimension 1 with chain (0)⊂(t); a square-zero thickening preserves underlying chain length 1. | Contract includes nonreduced inputs, is specific, owned, and not already supplied by generic permanence. Restore slug in R04. |
| Gap: finite-algebra completion | Over henselization of k[t] at t, z²=t descends with involution z↦−z. Without henselianity, k[t]_(t)[z]/(z²−1−t) is connected (2 idempotents), while completion splits (4). | Morphism descent and henselianity are substantive; same coherent equivalence contract. Restore slug. |
| Gap: coefficient fields | In characteristic p, lift the p-basis element t of 𝔽_p(t) inside 𝔽_p(t)⟦x⟧; residue sends the chosen lift to t, whereas a section sending it to a different residue fails that equation. | Specified p-basis lifts are extra data, not perfection of residue fields. Restore slug. |
| Gap: generic constructibility | Projection 𝔾_m×S→S with invertible Λ has fibre cohomology ranks 1,1,0 in degrees 0,1,≥2; it is not proper. | Proper finiteness alone does not supply this contract. Restore slug. |
| Gap: trait affine Lefschetz | Strict trait generic open has δ(η)=1,δ(s)=0; R¹j_*Λ has closed support dimension 0, equal to 1−1. | Independent trait support bound is precise and has the expected endpoint. Restore slug. |

**Headline signatures and padding.** The README's deep end results are: equal-characteristic, equivariant and mixed-characteristic Cohen–Gabber; equal/mixed partial algebraization; weak and prime-to-ℓ uniformization; oriented descent; quasi-excellent finiteness; dimension-function existence/transport; trait/local/general affine Lefschetz and the 2d−1 bound; higher local classes/transitions; potential-dualizing existence, uniqueness and functoriality; pointwise perversity; excellent biduality and normalized local duality; local Lefschetz; and algebraic tilting of matched-open idempotents, cohomology and supports.

The six statable headline theorems are present. The module docstring, lines 13–41, names the remaining geometric families and their missing carriers/operations. Epp is explicitly an intermediate input. Three structures bundle existing ring-theoretic data needed by the headlines; none has a sorry body or a free Prop field used in place of missing geometry.

| Lean declaration | README comparison and probe result |
| --- | --- |
| cohenGabber_equalCharacteristic, line 59 | §1.1; reduced, complete, noetherian, equidimensional and prime-characteristic binders retained; finite/torsion-free/generic-étale conclusion. |
| cohenGabber_equivariant, line 81 | §1.2; field algebra certifies equal characteristic; finite group and invertible cardinality retained; induced residue action, not a prescribed invariant coefficient field. |
| MixedCohenGabberPresentation, line 105 | §1.4; residue equivalence equation, local finite injection, p-fibre étaleness and actual invariant-map degree retained. |
| cohenGabber_mixedCharacteristic, line 172 | §1.4; normal complete local domain, char 0, residue char p, ℓ≠p and d≥2 retained. |
| PartialAlgebraization, line 182 | §1.5; completion isomorphism and all extended ideal equalities retained; lower-dimensional base is required. |
| partialAlgebraization_equalCharacteristic, line 216 | §1.6; finite ideal family, reduced equal-characteristic complete local input, positive dimension, regular base and dimension drop retained. |
| PrimeToEllLocalExtension, line 228 | §1.7; local finite injective extension and degree of the actual generic fibre retained. |
| partialAlgebraization_mixedCharacteristic, line 253 | §1.7; extension chosen before every finite ideal family; regular mixed-characteristic base and dimension drop retained. |
| cohomologicalDimension_le_of_strictlyLocal, line 271 | §5.8; henselianity, separably closed residue field, d>0, prime invertible ℓ, affine-basis torsion and q≥2d retained. |

For all six sorried theorems, a scratch-copy probe tried `simp`, `rfl` and `infer_instance`; none closed a goal. Object-based searches found no pinned one-lemma version of these six headlines. No theorem restates a retained definition or merely computes a README Check. Consequently no padding deletion is requested. The report does not claim an exhaustive search of all possible single-lemma proofs.

**Pinned-library audit.** The following definitions/declarations were opened at the repository pins, not on a newer library. The entries explain both what is present and the extra structure it does not provide.

| Pinned file and line | Declaration / inspected meaning |
| --- | --- |
| `Mathlib/RingTheory/LocalRing/Defs.lean:30` | IsLocalRing extends Nontrivial; no zero-ring local example. |
| `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean:134` | ResidueField.mapEquiv induces the coefficient action used in §1.2. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | IsAdicComplete includes Hausdorffness and precompleteness. |
| `Mathlib/RingTheory/Etale/Basic.lean:205` | Algebra.Etale includes formal étaleness and finite presentation. |
| `Mathlib/RingTheory/Etale/Locus.lean:35` | Algebra.IsEtaleAt tests formal étaleness after localizing the source prime; the headline also supplies a finite map. |
| `Mathlib/RingTheory/KrullDimension/Basic.lean:26` | ringKrullDim is extended-natural valued with bottom; equality with d and explicit d bounds matter. |
| `Mathlib/RingTheory/Henselian.lean:108` | HenselianLocalRing includes the local-ring structure. |
| `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51` | Native regular-local predicate used on the algebraization base. |
| `Mathlib/FieldTheory/IsSepClosed.lean:65` | Separably closed field predicate, not merely an algebraically closed chosen extension. |
| `Mathlib/RingTheory/Perfection.lean:633` | PreTilt is perfection of reduction modulo p; it is not the whole henselian perfectoid-pair/marked-open interface. |
| `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:42` | LocallyOfFiniteType is local finite type, not separatedness or properness. |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` | IsProper includes separatedness, universal closedness and local finite type. |
| `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | Scheme.smallEtaleTopology supplies the native sheaf carrier in the bound. |
| `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:112` | Small-étale sheafification; the affine comparison at line 140 and Grothendieck-abelian instance at line 149 support sheaf cohomology. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | Sheaf.H is Ext from the constant free rank-one abelian sheaf; degree-zero comparison is H.equiv₀ at line 102. |
| `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54` | Abstract TStructure exists; this does not define geometric stalk/support perversity. |
| `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98` | FixedPoints.subring is the actual invariant subring used for degree, not an arbitrary chosen ring. |
| `Mathlib/GroupTheory/PGroup.lean:41` | IsPGroup distinguishes ℓ-groups from general finite groups. |
| `Mathlib/Algebra/Module/Injective.lean:401` | Module.Baer.injective converts the Baer criterion to injectivity. |
| `TauCeti/Algebra/Module/ZMod/Injective.lean:50` | Module.Baer.zmod_self supplies self-injectivity for nonzero ZMod n. |

These 20 file/declaration entries support the binder and missing-carrier judgments. Searches by objects included power-series coefficient sections, equivariant generic étaleness, regular local rings, generic fibres and invariant subrings, partial algebraization, alteration/Riemann–Zariski objects, oriented products, dimension functions, potential dualizing complexes, étale support/cohomology, perfectoid pairs and tilting. Existing generic t-structures, étale sites, perfection and completions were not counted as the missing geometric interfaces themselves.

**Ownership and supplier resolution.** I used the roadmap search/show tools and inspected the actual main, supplied-head and named package files. The main roadmap shapes read included EtaleCohomologyFoundations, EtaleDualityAndPerverseSheaves and LocalPurity. Cross-roadmap references were resolved by object and section; the following groups cover the supplier contracts and the Needs lines. Line references are to the relevant README unless another file is named.

| Supplier / location | Resolved contract and ownership boundary |
| --- | --- |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.12–0.16, 0.20–0.22; §0.14 line 1068, §0.21 line 1394 | Henselian machinery, smooth Elkik lifting, Popescu, catenarity/Nagata/excellence, and non-Japanese example. The two stronger completion/catenarity inputs are precisely declared gaps, not assumed consequences of smooth lifting. |
| Same file, §§2.11–2.12, 2.15–2.16, lines 3656, 3696, 3867, 3896 | Artin–Schreier, Nisnevich/continuity and ordinary proper hypercover descent. No oriented descent is inferred merely from ordinary descent. |
| Same file, §§4.16–4.20, lines 6038, 6075, 6109, 6411 | Alterations, snc divisors, nodal families and trait alterations are imported, not recreated as independent owned targets. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, §§6.0–6.1 | Exact polynomial Artin approximation with congruence control. Target §0.5 adds the higher-graded comparison, which polynomial approximation alone does not state. |
| `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md`, §1.10 | Cohen rings and coefficient maps, including p-torsion targets. The prescribed p-basis equicharacteristic section is the declared extra contract. |
| `packages/AdicCoefficientsAndComparisonsPartII/design/README.md:83`, PA.0.2–PA.0.8; PA.0.11 line 313; PA.1.2–PA.1.4 line 379; PA.4.1–PA.4.8; PA.5.1–PA.5.4 line 1074 | Maximal dominance, alteration degree controls, flattening/snc, excellent-surface resolution, Riemann–Zariski spaces, log modifications and stable modification. Named in the permitted earlier suppliers; actual package sections exist although the main/open-PR resolver has no folder for this design. |
| `TauCetiRoadmap/AdicEtaleGeometry/README.md:5511`, A1.14; A1.15 line 5673, general enough-points target line 5763 | Coherent-topos conventions and Deligne points; the general coherent-site target is present, not just an analytic-point analogy. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, §§0.1–0.4; E2.6 line 2293 | Ringed-site enhancements, replacements, tensor/Hom and coherent functors; bounded-below hypercover descent with uniform lower bound, without a repleteness hypothesis. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, §§F.0–F.8 and 0.7; F.3 lines 692–751; F.5 lines 1180–1192 | Finite coefficients, localization, proper/smooth exchange and six operations in the stated domains. General-base generic constructibility is the declared gap; exceptional pullback is not obtained circularly from this roadmap's final duality. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, §§0.1–0.2, 1.1, 2.1–2.11 | Finite-type-field/excellent-one-dimensional-base coefficient duality, supported classes, recollement and field-base perversity. Here the enlarged excellent base, potential pinnings and arbitrary monotone perversity are distinct extensions. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, §§0.2–0.5, 0.10, 6.2 | Trait-oriented product and absolute purity are supplied. Trait-perversity setting exists; its independent affine support bound is explicitly a gap. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md`, §5.4 | Scheme-oriented product site/projections/specialization points and the listed curve-alteration steps. Target §3.1 adds general topoi; §2.1 adds the specified excellent-base marked single-curve/quotient statement. |
| `TauCetiRoadmap/ArcTopologyAndDescent/README.md`, supplied open head, §3.6; §§8.6–8.9 lines 1068–1111; §§11.1–11.2, 11.5, 12.6 | Ultraproduct components, formal glueing, rigidity, completion/support comparisons, complete arc descent and tilting invariance. The split-cover statement in §11.2 supplies acyclicity for valuation products; §8.3 is the only stale section in this citation group (R03). |
| `TauCetiRoadmap/PerfectoidQuotients/README.md`, §§0.4–0.6 | Bounded torsion operations, p-integral closure and integral perfectoid constructions. |
| `packages/PerfectoidQuotientsPartII/design/README.md:93`, Q5.1–Q5.3; Q6.2–Q6.7 lines 233–330 | Integral multiplicative tilt, products, sharp quotients, completeness transfer and valuation tilting. Generic-fibre inversion and arbitrary matched-open cohomology remain the new objects here. |
| PurityForFlatCohomology, downstream paragraph | A consumer, not a supplier edge. Its absence from the main/open-PR resolver is not an unowned input. |

The four resolver leads were inspected individually: the two named earlier package designs have the cited sections; the PurityForFlatCohomology citation is downstream only; the Arc §8.3 locator produces R03. The five gap needs sentences are precise, owned and minimal relative to the sections inspected. No additional generic foundational target was found to be duplicated by the six Lean headlines, and no fully qualified declaration name collides with the searched main, package or supplied open-head files. Searches included the open neighboring work on ArcTopologyAndDescent, ClassicalAdicEtaleCohomologyPartII, DeligneWeightsAndPurityPartII, DeRhamCohomologyAndDuality and SheafTheoreticSmithTheory, as well as the broader supplied-head object search. They do not acquire ownership of this roadmap's general excellent potential-dualizing or Cohen–Gabber results.

## Not verifiable

- **Ill03, Theorem 2.4.** The original text is settled as uncertified. The available secondary statement at ILO14 XV 1.1.3 and 3.3.2, pp. 219 and 224, lines 10337 and 10557, was checked. This is the declared `gap:ILLUSIE-2003`, not an attempt to certify the inaccessible original proof.
- **Epp73, original elimination theorem.** The original is settled as uncertified. The available ILO14 presentation and K10 correction, especially K10 lines 85–113, were checked for the formulation and the cancellation issue. No new request for either settled source is made.

All 15 seeded source targets were readable in the cache. No unresolved source-access request is being used to park this review. The mathematical library promised by the README is not implemented by six `sorry` statements; elaboration certifies their signatures only.

## Source issues

- **Misprint** in ILO14 at II Theorem 4.2.1, printed p. 32, line 1575: the source says the valuation ring's residue field is algebraically closed; it should be its fraction field; affects a stated result; corrected in print at ILO-final-II Theorem 4.2.1, printed p. 33, line 489.
- **Error** in ILO14 at II Remark 4.2.2, printed p. 32, lines 1576–1580: the source says prime-to-ℓ tests always have perfect fraction fields; it should be perfection only when ℓ differs from the fraction-field characteristic; affects a stated result; corrected in print at ILO-final-II Remark 4.2.2, printed p. 34, lines 522–527.
- **Error** in ILO14 at XII §2.1.1, printed p. 191, lines 9020–9033: the source says finite limits of noetherian scheme diagrams exist termwise; it should be an ambient category of scheme diagrams closed under those limits; affects a stated result; corrected in print at ILO-final-XII XIIA §2.1.1, printed p. 241, lines 218–223.
- **Misprint** in ILO14 at XIII §2.1.1, printed p. 196, line 9304: the source says the composed derived direct image is applied to the morphism g; it should be applied to the coefficient sheaf C; affects the proof.
- **Error** in ILO14 at XIII Theorem 2.2.2(i), printed p. 196, line 9333: the source says every required hypercover term is regular connected; it should be a finite disjoint union of regular connected schemes; affects a stated result.

