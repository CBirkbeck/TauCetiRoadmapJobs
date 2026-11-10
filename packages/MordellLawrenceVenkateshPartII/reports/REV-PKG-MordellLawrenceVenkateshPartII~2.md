# Review of MordellLawrenceVenkateshPartII (package, round 2)

**Verdict:** needs changes

Sixteen findings: three P1, eight P2 and five P3; eleven blocking findings. The package is repairable. Its scope is a legitimate Part II, and neither headline Lean theorem failed elaboration or the padding probes. The defects below concern mathematical statements, proof inputs, generality, ownership, and inaccurate Checks or documentation. No package source file was changed.

## R01 (P1) — Subgroup conjugacy requires a normalizer

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1198–1202`, “subgroups or homomorphisms … indexed by the kernel … for the relevant centralizer”.

**Claim:** The centralizer cohomology kernel classifies both unmarked subgroups and marked homomorphisms in a geometric conjugacy class.

**Witness:** For the diagonal torus T in GL₂/ℚ₃, H¹(ℚ₃,T)=H¹(ℚ₃,GL₂)=1. Nevertheless the four quadratic étale ℚ₃-algebras give four nonconjugate rational maximal tori in its geometric conjugacy class.

**Repair:** Separate the statements. For subgroups M use ker[H¹(F,N_G(M))→H¹(F,G)]; for a fixed homomorphism use the centralizer of its image. Keep the finiteness conclusion. Add the split torus and the three field tori from ℚ₃(√2), ℚ₃(√3), ℚ₃(√6) as a Check. The normalizer kernel has four classes, whereas the centralizer kernel has one. The finiteness clause repaired in §2.3 remains true; this corrects its classification input.

## R02 (P1) — Arithmetic Hodge–Tate signs are reversed in the balance statement

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1597`, “every global graded subquotient has Hodge–Tate average w/2”; also lines 1607–1608 and 1887–1888. Compare the explicit convention at lines 155–159.

**Claim:** The arithmetic Hodge–Tate average is positive half the geometric Weil weight.

**Witness:** ℚ_p(−1) is crystalline, has geometric Frobenius q and Weil weight 2. Under HT(χ_cyc)=+1 its Hodge–Tate weight is −1, while its descending de Rham jump is +1: −1≠2/2.

**Repair:** Say “average descending de Rham degree w/2”, or “arithmetic Hodge–Tate average −w/2”. Keep the balance theorem with the de Rham convention. The elliptic Tate module has geometric weight −1 and arithmetic weights 0,+1; H¹ has geometric weight +1 and arithmetic weights 0,−1. Correct both elliptic Checks accordingly. In §7.2 write the actual de Rham cocharacter t↦diag(t,1), not the singular matrix diag(1,0). On ℚ_p(−1) the repaired averages are +1 and −1 respectively. SheafConvolutionOnAbelianVarieties §3.3 and MordellLawrenceVenkatesh §1.10 use these same actual filtration jumps.

## R03 (P2) — The Ax–Schanuel gap has a vacuous exception and the wrong ambient space

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:299`, “unless the projection … lies in a weakly special subvariety”, with codimensions in X×Ď; the same contract is in `packages/MordellLawrenceVenkateshPartII/design/plan.json`, gap `period-map-ax-schanuel`.

**Claim:** This contract supplies the monodromy-orbit inequality used in §3.4.

**Witness:** A varying elliptic H¹ plus a constant elliptic H¹ has dim X=1, dim Ď=3, dim D_mon=1. For W=X×D_mon, the displayed inequality reads 3≥2+3. Also X itself is weakly special.

**Repair:** State the inequality in X×D_mon, with W algebraic there, and require the exceptional projection to lie in a **proper** weakly special subvariety. Equivalently supply the exact monodromy-orbit degeneracy consequence of §3.4 with its quantifiers. Update both copies of the slug's needs sentence. In the example the corrected inequality is 1≥0+1; projection onto all X is no longer an allowed exception. This concerns the precision of a declared contract, not the supplier's present failure to implement it. LS line 2965 explicitly chooses the monodromy orbit as its compact dual; LS lines 2970–2977 compute in that ambient space.

## R04 (P2) — Three general results are narrowed to the application route

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1147–1151` (§2.9 over ℚ), line 1323 (§3.5 over ℚ), and line 2330 (§9.2 only n≥4,d≥4).

**Claim:** These application-specific ranges are the general library targets.

**Witness:** LS line 2813 fixes an arbitrary number field K; LS lines 2979–2989 explicitly retain general K. Beauville lines 84–89 and 129–136 include plane cubics and quartic surfaces, excluded here.

**Repair:** State §2.9 over an arbitrary number field, with finite places above p included in T and integral Frobenius polynomials retained. State §3.5 over K with a place v and residue disk over K_v. Keep ℚ as a Check/application, without extending the genuinely ℚ-specific purity-balance theorem. State the full connected-monodromy result for smooth universal hypersurfaces in ambient dimension n≥2 and degree d≥2, treating the cubic-surface exception separately and the rank-zero/rank-one quadric cases explicitly. Plane cubics have primitive rank 2 and Sp₂ of dimension 3; quartic surfaces have primitive rank 21 and SO₂₁ of dimension 210. Both now belong to the theorem. Cubic surfaces retain finite W(E₆), and quadrics have trivial connected form group. This is the binding general-library requirement, not a demand to strengthen the final large-dimension non-density theorem.

## R05 (P2) — Frobenius invariance of a projector does not fix its individual group elements

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:884–887`, “For an element γ … commuting with Frobenius … Hence tr(F^m e) …”.

**Claim:** The commuting-element argument justifies every summand of the rational-projector trace.

**Witness:** Let Γ=C₃, FγF⁻¹=γ⁻¹ and e=(2−γ−γ²)/3. Then Fe=eF and e²=e, but neither γ nor γ² commutes with F. Both have nonzero coefficients in e.

**Repair:** Prove the twist trace statement for arbitrary deck elements with Frobenius action, using the finite semidirect descent datum, then apply it to F^mγ. Explicitly use purity/degree separation of the point-count trace formula to obtain rational traces in the individual cohomological degree. Alternatively supply an equally general equivariant rationality argument. Do not require every torsion point to be rational. In the test example the semidirect group is S₃ and (γF)²=1, so the twisted descent exists although γ does not commute with F. The orbit construction in LS lines 2277–2283 explicitly permits this permutation action.

## R06 (P2) — Formal transfer incorrectly assumes number-field Taylor coefficients

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1330–1334`, “power series with coefficients in a number field”.

**Claim:** At the arbitrary p-adic centres needed for analytic components, the common Taylor series has number-field coefficients.

**Witness:** At a transcendental a∈ℚ_p, even the algebraic function t has Taylor series a+u. Its constant coefficient belongs to no number field. LS lines 3033–3036 instead complete over K_v at x₀.

**Repair:** Use formal completion over K_v, transport coefficients through the chosen abstract algebraic-closure isomorphism, and invoke the supplied complex convergence of the horizontal differential equation. Descend the resulting algebraic equation from a finite extension of K_v, as in LS lines 3065–3068, not from an asserted number field. The series a+u then transfers to σ(a)+u; no continuity or arithmeticity of a is needed. This fixes the route at every centre while preserving the general theorem requested in R04.

## R07 (P2) — The new proper-pushforward supplier contract drops lisseness

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:318–321`, “the higher direct image of a de Rham local system is de Rham”.

**Claim:** PadicHodgeTheory §7.3 supplies this without a hypothesis on the higher direct images.

**Witness:** Open pull request #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:1286`, explicitly assumes the relevant Rⁱf_*L are lisse, including every degree entering a pairing. The package's newly added contract omits that hypothesis.

**Repair:** Include lisseness of all higher direct images used, and the de Rham hypothesis on L, in this contract. For §§0.1, 0.5 and 0.7 record that the geometric constant-coefficient smooth-projective application supplies lisseness by proper smooth base change. The constant family has Rⁱf_*ℚ_p the constant local system Hⁱ and Gauss–Manin connection zero, so the corrected contract still gives identity horizontal transport there. The narrowed Frobenius-compatibility gap remains necessary and is not otherwise challenged.

## R08 (P2) — The nonsymmetric hypersurface case has no inversion pairing

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2512–2514`, “build the orbit system … inversion pairing (§1.8)”.

**Claim:** Every family allowed by §10.5 supplies that pairing.

**Witness:** LS lines 3951–3954 distinguish SL_N from the inversion-symmetric Sp/SO cases. On standard SL_N, a central ζI with ζ²≠1 would force ζ²B=B, hence B=0. Such a pairing cannot be nondegenerate.

**Repair:** Split the route: use GL coefficient structure for the nonsymmetric case; add the inversion pairing and use GSp or GO only under inversion symmetry up to translation. Keep the theorem's full scope. The earlier supplier already makes exactly this distinction: open pull request #1809, `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:843–853`, §4.8, including its SL₆ negative Check. On SL₆ choose a primitive cube root ζ; on the symmetric n=4 case the pairing instead has alternating sign −1. Update the scope wording if it continues to promise an inversion pairing for every orbit system.

## R09 (P1) — The curve-to-Jacobian prerequisite is cited to a theorem about abelian schemes

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2621–2622` and 2633, citing AbelianSchemesAndArithmeticModuli §A1.2 for factorization of C→A.

**Claim:** That supplier proves the Jacobian universal property for a curve.

**Witness:** Open pull request #849, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:771–774`, assumes both source and target are abelian schemes. A genus-two curve is not abelian. `TauCetiRoadmap/JacobianChallenge/README.md:449–453` on main supplies precisely the missing factorization.

**Repair:** Cite JacobianChallenge Layer F for the pointed curve's Abel–Jacobi map and its Albanese universal property, and add that supplier to scope, contracts, Needs and dependencies. Retain §A1.2 only where a map between abelian schemes is actually used. For f equal to the Abel–Jacobi map of a genus-two curve the resulting homomorphism is id_J; for f=0 it is zero. Both follow from Layer F, whereas §A1.2 cannot even accept C as its source. This is supplier drift, not a request to redevelop Jacobians here.

## R10 (P2) — The analytic-radical target duplicates its named supplier

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1279–1293`, §3.3; scope line 44 claims ownership of the analytic-radical step.

**Claim:** The power-membership theorem is new work here.

**Witness:** On main, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:970–975`, K3 §3.4, proves I(V(a))=√a for every convergent local ideal, including exactly the finitely generated germ power-membership statement requested here.

**Repair:** Import that theorem by the exact supplier section in scope/contracts and in §3.5; remove §3.3 as a separately owned theorem. Keep the radical example in Examples. No additional mathematical adapter is required: the period equations are convergent germs, and an algebraic g is a convergent germ. For I=(z²), the supplier gives z²∈I while z∉I, exactly the claimed output. Preserve a former-numbering mapping if any dependent citation needs §3.3 after renumbering.

## R11 (P2) — The residue-map route identifies the conjugate Hodge piece

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2185–2187`, “Griffiths's residue description identifies H^(p,n−1−p) … degree (p+1)d−n−1”.

**Claim:** That residue construction has the stated Hodge target.

**Witness:** For a quartic surface, p=0 gives Jacobian degree 0. The residue of Ω/F is a holomorphic two-form, of type (2,0), not (0,2). BC lines 1341–1350 give degree (n−p)d−n−1 for H^(p,n−1−p).

**Repair:** Write that degree (p+1)d−n−1 gives H^(n−1−p,p), and use Hodge symmetry to obtain the numerical formula as written. Alternatively reverse the displayed degree in the construction. Keep the numerical Hodge-number theorem and its Checks: for the quartic, degrees 0,4,8 give dimensions 1,19,1. The first residue lands in H^(2,0); equality of dimensions does not make it an identification with H^(0,2).

## R12 (P3) — Eulerian reflection is around the wrong centre

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2114–2115`, “Replacing q−j by j−q is harmless …”.

**Claim:** Those two summations agree by Eulerian row symmetry.

**Witness:** For n=2, α=(1/2,1/2), extended by zero, and j=0: Σ_q α_qα_q=1/2, while Σ_q α_qα_(−q)=1/4. The reflection centre is (n−1)/2, not zero.

**Repair:** Replace the Check by α_(q−j)=α_(n−1−q+j), or by β_j=(α*α)_(n−1+j). On the same row and j=0 the corrected sum is 1/4+1/4=1/2. The definition of β and the central-mass theorem are unchanged.

## R13 (P3) — A symplectic line cannot be the nonisotropic negative control

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1250–1251`, “a Hodge line not isotropic for a flat symplectic form”.

**Claim:** This is an available flag outside the tensor-compatible orbit.

**Witness:** Every alternating form satisfies B(v,v)=0, hence every line is isotropic. There is no proposed negative instance, in any characteristic.

**Repair:** Use a two-plane in a four-dimensional symplectic space. For the basis e₁,e₂,f₁,f₂ with B(e_i,f_j)=δ_ij, span(e₁,f₁) is not isotropic because B(e₁,f₁)=1; span(e₁,e₂) is Lagrangian with restriction zero. The corrected Check distinguishes the wrong flag from the period orbit.

## R14 (P3) — The weak-balance example exceeds its block dimension

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2662–2664`, the 2+2+2 example with contributions “(0,3,0)”.

**Claim:** This is a realizable weakly balanced filtration with dim F¹=3.

**Witness:** Each a_i is a dimension inside a two-dimensional block, so 0≤a_i≤2. Enumerating a₀+a₁+a₂=3 and a₀=a₂ gives only (1,1,1); 3>2 excludes the claimed example.

**Repair:** Delete (0,3,0) and say that weak balance and balance coincide in this particular example. If a strict distinction is wanted, separately use blocks 4+4+4 and dim F¹=6: (1,4,1) is realizable and weakly balanced, since 8(a₀−a₂)=0, but its block averages 1/4,1,1/4 differ. The balanced triple there is (2,2,2).

## R15 (P3) — The not-statable explanation denies carriers that exist at the pin

**Location:** `packages/MordellLawrenceVenkateshPartII/Suggested.lean:33–35`, “neither library has ample line bundles or divisors”; compare `README.md:204–207`.

**Claim:** Both kinds of carrier are absent.

**Witness:** The pin declares `LineBundleClass.IsAmple` in `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71`, `Scheme.CartierDivisor` in `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127`, and effectivity in `TauCeti/AlgebraicGeometry/CartierDivisor/Effective/Basic.lean:45`.

**Repair:** Credit these existing carriers, with their hypotheses, and give the remaining actual obstruction for each Shafarevich headline, such as numerical divisor classes and the arithmetic-model/good-reduction interface. An integral abelian variety's underlying scheme meets the Cartier-divisor hypotheses; the ample predicate is defined on line-bundle classes on a scheme and includes quasi-compactness and affine nonvanishing loci of positive powers. This finding does not assert that those three carriers alone make the whole Shafarevich theorem statable.

## R16 (P3) — Two remaining locators point to the wrong line or page

**Location:** `packages/MordellLawrenceVenkateshPartII/README.md:194–195` (“line 293”) and line 2699 (“Lemma A.5, p. 92”).

**Claim:** These locate the parabolic definition and the reversed tail inequality.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` defines `parabolic`; line 293 concerns its unipotent subgroup. The reversed sign is LS line 4303, preceding the page-92 marker at LS line 4314.

**Repair:** Cite line 154 for the definition and p. 91, or pp. 91–92 for the whole proof, for the A.5 correction. Rechecking the corrected locators reaches the definition and the offending sign directly. The mathematical corrections themselves are sound.

## Verified sound

### Previous findings and the changed passages

Each earlier finding was checked against its repair, not treated as an instruction. Quotations below are from the package, not copied source text.

| Earlier finding | Repaired passage / evidence | Status |
|---|---|---|
| F01, locators | §0.7 now says “Remark 5.7, p. 42”; §5.2 “p. 74”; §§7.1–7.2 “footnote 11”; §§7.3 and 7.5 distinguish statement p.975 from proof pages. | Repaired. The disputed Def.5.2 locator **40–42** was already right: LS 1798 starts p.40, 1832 starts the definition, 1848 starts p.41, 1895 starts p.42. The repair's reason is correct; this settled sub-item is not re-raised. R16 is a different remaining locator. |
| F02, inversion supplier | §1.8 now cites “SheafConvolutionOnAbelianVarieties §4.8”, as do scope, contract and Layer 1 dependencies. | Repaired. The current head's §4.8 is at README:841; its pairing condition is independently examined in R08. |
| F03, rational semisimplification | §2.3 says “unique up to G(k̄)-conjugacy” and restricts finite rational classes to “k a finite extension of ℚ_p”; continuity uses the morphism P→L. | Repaired. Upper-unipotent GL₂ image projects to 1; the polynomial map (a,b;0,d)↦(a,d) is continuous. R01 is a new false classification formula in its downstream input, not a rejection of these changes. |
| F04, G-objects | §2.4 now requires “a k-linear rigid abelian tensor category C with fibre functor ω”. | Repaired. LS 2583–2596 requires the abelian setting; §0.3 supplies it. A functor sending the tensor unit to a two-dimensional space cannot be a tensor fibre functor, since the unit must have dimension 1. |
| F05, orthogonal density | §9.2 now uses “An open subgroup of SO(E)(ℚ_ℓ) has Lie algebra 𝔰𝔬(E)” and cites ReductiveGroupsPartII §RG2.0.2. | Repaired. The main supplier's README:640 supplies analytic charts for smooth finite-type groups. In split rank two the closure of 1+ℓℤ_ℓ has dimension 1=dim SO₂; it need not contain the other component of O₂. The new contract, Needs, scope and dependencies all name the input. |
| F06, pair count | §2.10 now gives “two classes of pairs … the Borel pairs (B,T) and the trivial pair (G,G)”. | Repaired: 2 GL₂-classes. For the diagonal GL₃ torus, ordered partitions give 1+6+6=13 classes under the torus. |
| F07, crystalline gap | The gap now attributes horizontality to “the proper smooth pushforward … of §7.3” and asks for Frobenius compatibility and association. | Partly repaired. The redundant gap demand is removed in both README and plan; all requested dependency additions are present. The newly inserted generic supplier summary drops lisseness (R07). The constant-family test gives ∇=0 and identity transport, but cannot test that missing hypothesis. |

The repaired patterns were searched elsewhere: rational versus geometric conjugacy led to R01; exact supplier hypotheses to R07/R09; form-group inputs to R08; computed Checks to R12–R14; locators to R16. No earlier “not actionable” finding is re-raised.

### Source sample and manifest

All fifteen seeded targets were reread against the cached legal text. No additional source was needed; the five manifest entries were preserved. Serre remains settled as uncertified. LS locators use the recorded v5 preprint, LV its printed pagination, Beauville its printed pagination, and BC its recorded preprint PDF pagination. A “supports” entry below concerns the mathematical source statement, not a proof of all downstream prerequisites.

| Target | Text actually opened | Locator and hypothesis result |
|---|---|---|
| 0.3 Tensor category | LS 1981–2004, Def.5.11/Lem.5.12, pp.43–44 | Four compatible realizations, strict morphisms and the neutral tensor category are present. Connectedness and the chosen Betti point are retained. |
| 0.5 Geometric systems/projectors | LS 1957–1978, Ex.5.10, p.43; LS 2261–2366, Lem.5.29 proof, pp.49–51 | Proper geometric realization and the rational orbit summand are supported; the package explicitly restricts its construction to constant coefficients. Rational lattice intersection, not the image of the integral lattice, is correct. |
| 2.2 Centralizer bound | LS 2455–2480, Lem.5.33, pp.53–54 | One coefficient-Frobenius cycle gives one factor's dimension; the fixed-algebra hypothesis is essential. |
| 2.9 Global types | LS 2810–2848, Lem.5.49, pp.61–62 | Finiteness route supported after retaining integral **rational polynomials** and treating disconnected GO. Source is over arbitrary K: R04. |
| 3.1 One orbit | LS 2902–2939, Lem.6.1, pp.63–64 | Tensor-isomorphism torsor and equivariant flags support both period maps. R13 concerns the package's impossible negative Check. |
| 3.5 p-adic transfer | LS 2979–3076, Thm.6.4, pp.65–67 | Source uses arbitrary K, local coefficients K_v and finitely many disks/components. R04/R06 correct the package's restrictions and transfer claim. |
| 4.2 Strong balance | LS 3109–3137, Def.6.6/Ex.6.7, p.68 | Equal class sizes, partition preservation and the number of classes met by each orbit agree. |
| 4.4 Semisimple orbits | LS 3205–3255, Lem.7.2, pp.70–71 | The inequality cA−dim H≥e and fixed coefficient cycle match. |
| 7.3 Bounded prime | LV 3113–3122, Lem.10.4, p.975; 3175–3251, proof pp.977–978 | Uniform finite prime choice and Hodge centralizer bound match. Footnote 11 is at LV 3196. Multiplier ℓ^r corrects the source's typo. |
| 7.5 Semisimplification fibres | LV 3123–3128, Lem.10.5, p.975; 3255–3340, proof pp.979–981 | Self-dual stable flags, fixed graded data and average de Rham degree r/2 are retained. |
| 8.4 Central mass | LS 4255–4325, Lemmas A.4–A.6, pp.91–92 | Corrected upper tail comparison proves the large-n case; direct values cover the small cases. R12 does not affect this theorem. |
| 9.2 Universal monodromy | Beauville 84–104, Thm.2, p.10; 129–155, Thm.4/proof, pp.11–12 | Shift from hypersurface dimension to ambient dimension checked. Symplectic/orthogonal connected conclusions supported in a wider range: R04. |
| 10.2 Parameter space | LS 3892–3902, proof Thm.9.2, p.85 | Smooth ample divisors of fixed class use a finite-type Hilbert locus. Supplier adds the explicit Cartier and numerical-class interfaces. |
| 10.4 Smooth base | LS 3930–3944, proof Thm.9.2, p.86 | Package correctly restricts lifts to a dense smooth open, avoiding the source's overstatement about all singular rational fibres. |
| 10.5 Family non-density | LS 3945–4001, proof Thm.9.2, pp.86–87 | Dimension/exceptional-degree and nontranslation hypotheses match. Source branches SL, Sp, SO; package needs R08. |

No author-flagged unverified locator other than the settled Serre entry was found. BC Theorems 10.6, 10.13 and Remark 10.14 were also opened, BC 1237–1257 and 1341–1352; R11 records the distinction between the Hodge-number formula and the residue-map target.

### Computed adversarial table

Values below are independent computations, except where an unchanged earlier computed row is explicitly retained. Small Eulerian values were recomputed by counting descents of permutations, not assumed from the package. This table covers every sampled target, every headline, the repair changes and all findings. The complete target worklist and auxiliary arithmetic are retained in the review scratch ledger; there is no hundreds-of-target appendix in this comment.

| Statement | Instances tried | Values on the two sides / discriminating computation | Result; change |
|---|---|---|---|
| §0.3 tensor/faithfulness | Unit scalar 2; disconnected two-point base | End(1)=ℚ and fibre scalar=2; map (0,1)≠0 has first fibre 0 | Connectedness discriminates; no change |
| §0.5 projector | Swap τ on ℚ², e=(1−τ)/2 | e²=e; e(1,0)=(1/2,−1/2); im(e)∩ℤ²=ℤ(1,−1), while eℤ²=(1/2)ℤ(1,−1) | Rational summand/lattice distinction correct, including p=2 |
| §0.5 extremes | e=0, e=1; identity family degree 0 | Image ranks 0 and rank V; R⁰id_*ℚ=ℚ | Correct |
| §0.7 and F07 | Constant family | ∇=0, parallel transport=1, φ transported to itself | Gap's remaining Frobenius compatibility is substantive; R07 |
| §1.9 projector trace route | C₃ with inversion by F | Fe−eF=0; FγF⁻¹=γ²≠γ; (γF)²=1 | R05 |
| §2.2 centralizer | Two GL₂ factors, φ=swap; φ=id | Swap centralizer diagonal GL₂, dimension 4≤4; identity centralizer dimension 8, fixed algebra E₀²≠E₀ | Hypothesis essential and bound correct |
| §2.2 regular case | One GL₂ factor diag(1,2) | Centralizer dimension 2≤dim GL₂=4 | Correct |
| §2.3 repaired semisimplification | Upper-unipotent subgroup of GL₂ | Levi projection [[1,x],[0,1]]↦(1,1); semisimplification=1 | Correct geometric uniqueness/local finiteness; R01 fixes indexing input |
| §2.4 repaired tensor category | Tensor unit sent to k² | dim F(1)=2≠dim 1=1 | Not a tensor fibre functor; correct exclusion |
| §2.9 global types | K=ℚ(i), trivial rank-one representation, T contains p | Every good Frobenius polynomial t−1∈ℤ[t], weight 0; one trivial class | Valid source instance excluded only by package K=ℚ; R04 |
| §2.10 repaired count | H=1 in GL₂; diagonal torus GL₃ | GL₂ pairs (G,G),(B,T): 2; ordered GL₃ partitions 1+6+6=13 | F06 repaired |
| §2.11 rational orbits | GL₂/ℚ₃ maximal tori | Centralizer kernel size 1; normalizer kernel size 4; split ranks 2 versus 1 | R01 |
| §2.11 p=2 boundary | μ₂ over ℚ₂ and ℚ₃ | Square-class counts 8 and 4 respectively | Local finiteness correct; no odd-prime restriction |
| §3.1 orbit | Constant system; elliptic variation | Constant D_mon dimension 0; SL₂/B=ℙ¹ dimension 1 | Source statement correct |
| §3.1 negative Check | Line; two-planes in symplectic rank 4 | B(v,v)=0 always; B(e₁,f₁)=1, B restricted to span(e₁,e₂)=0 | R13 |
| §3.3 radical/ownership | I=(z²), I=(1), I=0 | z∉I but z²∈I; 1∈(1); only zero germ vanishes on whole neighbourhood | Correct mathematics already supplied; R10 |
| §3.4/gap ambient | Varying elliptic H¹ plus constant elliptic H¹ | Full compact-dual calculation 3≥5 is false; monodromy ambient gives 1≥1 | R03 |
| §3.4 dimension cutoff | dim X=1, codim Z=1; constant variation | Bound dim U≤1−1=0; constant orbit has codim 0<1 | Correct conclusion once contract fixed |
| §3.5 coefficients | Centre a transcendental over ℚ, f(t)=t | Taylor coefficient f(a)=a∈ℚ_p but a∉ℚ̄; transported constant=σ(a) | R06; local field suffices |
| §3.5 excluded Z | Z=D_mon, d=1 | codim Z=0<1; inverse image=whole disk, Zariski closure X | Correct necessary cutoff; general K needs R04 |
| §4.2 strong balance | Four 2-element classes, σ=(13)(24)(57)(68) | Number of classes=4, minimum classes per orbit=2 | 4-balanced but strongly only 2-balanced |
| §4.2 degenerate partitions | Full diagonal; full product with fixed index | One class gives c≤1; singleton fixed orbit meets 1 class | Correct |
| §4.4 codimension | GL₂ weights (1,0), c=5,e=1 | A=1, dim H=4; cA−dim H=1≥e; for c=1 value −3<1 | Bound/hypotheses match source |
| §5.3 and worked example | Blocks 2+2+2, dim F¹=3 | γ pairing 4(a₀−a₂): (1,1,1)→0, (0,1,2)→−8, (2,1,0)→8; (0,3,0) impossible since 3>2 | Sign sound; R14 |
| §5.4 balance signs | ℚ_p(−1) | Geometric weight 2, de Rham average +1=2/2; arithmetic HT −1≠2/2 | R02 |
| §5.7 unchanged repair in source | GL₂ φ=diag(2,1), U upper root group | Ad φ(x)=2x, infinite order; on Z_U(φ^r) finite-order restriction and cocycle norm 1 | Earlier computed row retained; corrected route sound |
| §5.10/§7.4 boundary | GL₂ profile h=(1,2,1), c=e=1 | A=B=1,t=2; T(1)+T(1)=2>1=B | Strict hypothesis fails as required |
| §6.1 coefficient headline | Same GL₂ profile, base dimension 1, c=30 | x=(1+4)/30=1/6; (h⁰−t)/2=0; A=1≥1/6 and B=1>2T(1/6)=1/3 | Numerical hypotheses genuinely satisfiable; not a vacuous headline |
| §6.1 excluded base | dim X=0, one integral point | Closure of one point is X; density true | Positive dimension necessary |
| §7.1 torsor | Identical one-dimensional tensor fibres | Isom tensor torsor has identity point; chosen transport is 1 | No arbitrary rational trivialization assumed |
| §7.2 signs | Ordinary elliptic H¹; Tate twist | Arithmetic weights {0,−1}; de Rham cocharacter t↦diag(t,1); ℚ_p(−1) jump +1 | R02 |
| §7.3 bounded prime | r=2, λ=1; regular GSp₂ | Paired eigenvalue ℓ²; torus centralizer dimension 2=g+1 | Correct multiplier and bound; no rational conjugacy inferred |
| §7.5 fixed semisimplification | Irreducible representation | Stable flag has one nonzero graded piece; fixed-graded condition is original filtered φ-isomorphism condition | Reduces to semisimple orbit bound; source proof matches |
| §§7.6–7.7 headlines | Elliptic family; dim C=1≤d=2 | dim Sp₂=3 versus dim GSp₂=4; for h⁰=2,A≥4, top arguments for d=2 are 4,5≤A+h⁰, and for C are 3,4 | Correct scalar exclusion and decreasing-dimension comparison; no added finding |
| §7.7 zero-dimensional closure | Reduced finite-type closure with r geometric points | Dimension 0; number of rational points ≤r<∞ | Induction terminates |
| §7.8 point-count headline | M=1 triangular Fourier kernel | Coefficients 1,2,3,2,1; norm²=19; 9/19≤3/4; largest frequency 2, not 1 | Earlier computed row retained; corrected cutoff necessary |
| §8.2 reflection | n=2,j=0 | Difference mass 1/2; unshifted reflected mass 1/4; correctly shifted convolution 1/2 | R12 |
| §8.3 moments | n=2,3,4,5 | β₀=1/2,1/2,61/144,571/1440; second moments=1/2,2/3,5/6,1=(n+1)/6 | Independently recomputed |
| §8.4 Lean headline | n=1,2,3,4,5,6 | 2ΣA²=2,4,36,488,11420,377816; (n!)²=1,4,36,576,14400,518400 | n=1 false and excluded; n=2,3 equality; remaining tested strict |
| §8.4 large/small bridge | n=7,8,9 | 2ΣA²=17405640,1049776080,80786169900; factorial squares=25401600,1625702400,131681894400; moment at 8=3/2 | Small cases pass; A.5 contradicts β₀>1/2 for n≥8 |
| Eulerian zero convention | n=0 | A(0,0)=1; the sum over q<0 is 0; 0!=1 | Headline excludes n=0. Layer's probability formulas are used only for n≥2; do not extend the support convention to n=0 |
| §8.6 residue route | Quartic surface n=3,d=4 | Jacobian graded dimensions 1,19,1; residue at degree 0 has type (2,0), not (0,2) | Numerical theorem sound; R11 |
| §§8.6–8.7 numerical values | (n,d)=(2,3),(4,5),(5,4),(3,3),(4,2),(3,2) | Primitive rows (1,1),(1,101,101,1),(0,21,141,21,0),(0,6,0),(0,0,0,0),(0,1,0) | Independently recomputed coefficient extractions |
| §9.1 Lean carriers | F=0; F=x₀; F=Σx_i^p in characteristic p | Zero form and pth-power form have all partials 0; x₀ has ∂₀=1 | Defines intended smooth forms; characteristic 2,3 failures included |
| §9.1 good reduction | F=x₀ and pF | F smooth modulo every prime; pF becomes 0 modulo p | S must contain any scaling prime; agrees with projective S-unit representatives |
| §9.2 repaired SO step | SO₂ split; O₂ | Closure of open 1+ℓℤ_ℓ dimension 1=dim SO₂; missing O₂ component remains missing | F05 repaired; R04 broadens separate monodromy range |
| §9.2 missing cases | Plane cubic; quartic surface; cubic surface | Groups Sp₂ (dim 3), SO₂₁ (dim 210), finite W(E₆) (closure dimension 0) | R04 with explicit exception |
| §9.3 Lean headline | Coefficient counts; S-unit rescaling | n=2,d=4 gives 15 coordinates and ℙ¹⁴; G(cF)=c^eG(F) for homogeneous degree e | Exact coefficient-space non-density, not a bounded substitute; quantifiers checked |
| §10.2 parameter space | Translate H+a; nodal divisor; different degree | [H+a]=[H]; node gradient=(0,0), excluded; different intersection degree gives different Hilbert polynomial | Parameter object and smooth open discriminate |
| §10.3 Weil restriction | Degree 1, quadratic étale, dual numbers | Dimension m, 2m, respectively tangent extension of dimension 2 for elliptic curve over dual numbers; last has affine-line fibre and is not proper | Étale hypothesis retained |
| §10.4 smooth reduction | Already smooth C; singular exceptional fibre | Resolution over U has fibre one point and unique lift; a nonsplit conic exceptional fibre can have 0 rational points | Package's restriction to U is sound |
| §10.5 branches | Standard SL₆; inversion-symmetric n=4 | ζ²B=B with ζ³=1 forces B=0 in SL case; self-dual geometric sign (−1)³=−1 | R08 |
| §§10.6/10.9 headlines | Exceptional pair (5,20) | binom(25,5)/6=53130/6=8855; 17710≠8855 but 8855 divides 17710 | Primitive exclusion is equality, all-divisor exclusion divisibility; retained |
| §§10.7–10.8 quotient/descent | Stabilizer of order 4; trivial stabilizer | d=4d′; for T=1 unique translation is Galois-fixed, hence K-rational | Degree and descent directions correct |
| §10.10 headline/input | Principal class on abelian surface; map mf | φ²=2 gives genus 2; q(mf)=m²q(f), so q(2f)=4q(f) | Finiteness route's quadratic bound sound; Jacobian input needs R09 |
| Pin-carrier claim | Integral abelian variety's underlying scheme | CartierDivisor carrier exists; IsEffective has local regular-equation condition; IsAmple has positive-power affine-cover condition | R15 |
| Locator claims | Parabolic and LS A.5 | Definition line 154≠293; sign before marker92, hence p.91≠92 | R16 |

### Lean acceptance test and headline inventory

Ran the required `lake env lean` elaboration of the package's actual `Suggested.lean` from the pinned content checkout. Exit status 0; **the only warnings were the two declarations using `sorry`, at lines 61 and 98**. No import build was needed: the file has only `import Mathlib`. No processes were left running.

Independently elaborated a scratch copy with `#check @name` for all six actual declarations: `eulerian`, `eulerian_central_mass_le_half`, `HypersurfaceMonomial`, `IsSmoothHypersurface`, `HasGoodReductionOutside`, and `integralHypersurfaces_not_zariskiDense`. There are four real-bodied definitions/abbreviations and two theorems, not seven declarations; the supplied signatures lead contains a parser artefact for a comma, not an additional declaration. No binder disappeared. In particular, `2≤n`, `[Field k]`, the primality binder that installs `Fact p.Prime`, degree homogeneity, and `∃n₀ ∀n≥n₀ ∃D₀ ∀d≥D₀ ∀S ∃G≠0` all survive exactly. No signature change was made.

Both admitted theorems were tested, separately, with each of `simp`, `rfl`, and `infer_instance` on scratch copies. All six attempts failed: `simp` makes no progress on the Eulerian inequality and leaves the hypersurface existential; neither goal is definitional equality or a typeclass goal. The pin near-matches are not one-lemma proofs (details below). Neither theorem is padding. No boundary theorem or README Check appears as a Lean theorem.

| Headline | Acceptance-test coverage |
|---|---|
| §6.1 coefficient non-density | Named as not statable in docstring lines 23–27: compatible family realizations and their comparison/monodromy carrier missing. No substitute. |
| §§7.6–7.7 general-family non-density and finiteness | Named in lines 28–30: primitive family cohomology and its monodromy/Hodge interfaces missing. |
| §7.8 corrected Frobenius-centralizer point-count bound | Named in lines 36–37: eigenvalues on primitive middle étale cohomology missing. |
| §8.4 central Eulerian mass | Stated exactly at line 61 on counted permutations, denominator-free with n≥2. |
| §9.3 projective hypersurface non-density | Stated at line 98 on native polynomials and geometric smoothness over algebraic closures. |
| §§10.6, 10.9, 10.10 Shafarevich finiteness | Named in lines 31–35. R15 corrects the claimed missing-carrier list; numerical classes/arithmetic models still need an actual interface. No replacement Prop or sorry'd data was introduced. |

For §9.3, nonzero homogeneous rational equations are exactly the coefficient-projective non-density formulation. An integer degree-d form with smooth reduction outside finite S has S-unit content and gives an integral projective parameter; conversely clearing S-denominators of such a parameter produces a representative of this form. The homogeneous G permits rescaling. The existential thresholds may be enlarged to ensure positive dimension and degree; no assertion at n=0 or d=0 is used. No additional statable omitted headline was established in this review; the definite current defect is the false absence claim R15, not an invented replacement statement.

### Pinned library and duplication audit

Opened the following declarations at the local pins, comparing hypotheses and bodies rather than merely matching names:

| Pinned file and line | Object and what it actually supplies |
|---|---|
| `Mathlib/Data/Finsupp/Weight.lean:216` | `Finsupp.degree`, the sum of natural exponents; degree-zero monomial subtype has one element. |
| `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46` | `MvPolynomial.IsHomogeneous`, degree support predicate; zero polynomial is homogeneous in every degree, so smoothness separately excludes it. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | `MvPolynomial.pderiv`; in characteristic p the derivative of x^p is zero. |
| `Mathlib/Algebra/MvPolynomial/Eval.lean:572` | `MvPolynomial.aeval`, evaluation into an algebra. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127` | Algebraic closure carrier as the prescribed maximal-ideal quotient. |
| `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | `RingTheory.Sequence.IsRegular`: weak regularity plus nonzero final quotient, not just a list of formal generators. |
| `Mathlib/RingTheory/Filtration.lean:432` | `Ideal.iInf_pow_eq_bot_of_isLocalRing`, with Noetherian local ring and proper ideal hypotheses; these are required at the localized Tate algebra. |
| `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` | `TauCeti.Cocharacter.parabolic`, defined on Hopf-algebra points by the dynamic limit construction; R16 corrects the line. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` | `TauCeti.Tannaka.fgPointTensorIsoEquiv`, known Hopf-group points versus tensor automorphisms; does not itself construct arbitrary fibre-functor torsors. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group scheme over a field; not an arithmetic good-reduction model. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` | Ample line-bundle classes already exist; R15. |
| `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127` and `TauCeti/AlgebraicGeometry/CartierDivisor/Effective/Basic.lean:45` | Cartier divisors and effectivity, latter with integral-scheme hypothesis; R15. |
| `Mathlib/Combinatorics/Derangements/Finite.lean:66` | `numDerangements` counts fixed-point-free permutations: n=1 gives 0, while A(1,0)=1. Not an Eulerian duplicate. |
| `Mathlib/Combinatorics/Additive/Convolution.lean:87` | `Finset.convolution_le_card_left` bounds a finite-set convolution by a cardinality, not the weighted Eulerian collision probability by 1/2. |
| `Mathlib/RingTheory/MvPolynomial/Basic.lean:198` | `MvPolynomial.basisMonomials` indexes all exponent functions, not only degree d; the retained subtype is a simple specialization. |
| `Mathlib/RingTheory/Smooth/Basic.lean:110–119` | Formal smoothness of the polynomial algebra, not of a hypersurface quotient; x₀^p remains a negative example for the package's predicate. |

The near-match list's lattice asymptotics, ordered-value-group nondensity and elliptic Weierstrass good reduction are different objects, not alternate proofs of the projective-parameter headline. Object searches across the pinned libraries found no theorem proving either retained headline. The minimal Eulerian definition has the same convention as ClassicalArithmeticCompletion §2.18 and is expressly allowed to make the headline statable; it does not reuse another roadmap's fully qualified declaration name. All six own backticked names in the README resolve to these six declarations, including the two displayed applications with arguments.

Ownership searches used `roadmaps grep` on the open heads and main for Hodge–Deligne systems, semilinear centralizers, Eulerian convolution, nonabelian H¹/normalizers, and Jacobian/Albanese universal properties; main, board package index and the nearest open scopes were consulted. The existing-owner findings are R09 and R10. The new assembly of four realizations, coefficient-normalizer bounds, balanced incidence estimates and the two higher-dimensional applications belongs here. The base MordellLawrenceVenkatesh stops at its one-dimensional applications; its semilinear bound, Faltings lemma and period infrastructure are imported. SheafConvolutionOnAbelianVarieties owns the geometric convolution and character inputs; this roadmap assembles their arithmetic realization systems. GaloisSectionsPadicPeriodMaps (#1739) owns section loci and model-free abelian-by-finite symplectic pairs, not this higher-dimensional coefficient theorem. WeightsInEtaleCohomology (#1001) owns weight calculus, and HeightsRationalPointsAndObstructions (#1017) owns the height/translation-descent inputs; they do not jointly own either retained Lean headline.

The recorded overlap facts were checked: no other open head changes this new roadmap, no dropped cited id, and no citation that only an open revision defines was listed. Thus no overlap-numbering or merge-conflict finding is invented. The board index was read before attempting the separately indexed LawrenceVenkateshMethod package; its README was not retrievable at the supplied head (see Not verifiable). No claim that it exists nowhere is made.

### Supplier direction, contracts and shape

Dependency-check output from this review:

```
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citations resolver also returned no nowhere-found roadmap section or own identifier. That is a heading check, not a guarantee of mathematical content: R07 and R09 are substantive supplier mismatches despite their headings existing.

Read every target's Needs line and the supplier contracts. Resolved current cited sections in MordellLawrenceVenkatesh, SheafConvolutionOnAbelianVarieties, ComplexComparisonPartII, ShimuraData, MotivesAndAlgebraicCycles, PadicHodgeTheory, CrystallineCohomology, DeligneWeightsAndPurity, WeilConjectures, PadicDifferentialEquationsAndRigidCohomology, InverseGaloisAndArithmeticFundamentalGroups, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles, AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli, ArithmeticGaloisDuality, HeightsRationalPointsAndObstructions, and FaltingsFinitenessAndIsogenyTheorems against the available heads. Main suppliers checked include ClassicalArithmeticCompletion, ReductiveGroups, ReductiveGroupsPartII, RestrictedPowerSeries, ComplexKahlerGeometry, SchemeAndStackFoundations, and Completed/Chebotarev. Representative load-bearing resolutions, beyond the findings, are:

- MotivesAndAlgebraicCycles §6.8: faithfully flat affine tensor-isomorphism torsors and finite presentation for finite-type group; finite-type nonempty torsor over a field has an algebraic-closure point, not automatically a rational point.
- DeligneWeightsAndPurity §§0.16, 4.4 and 9.12: pairing eigenvalues λ,c/λ, rational geometric degree factors, and primitive/vanishing pairing. §2.2 only supplies the symplectic open-subgroup density used here.
- LefschetzPencilsAndVanishingCycles §§3.4, 4.4, 5.8, 5.10: Lefschetz pencils, vanishing space, odd symplectic and even open-or-finite alternatives. ReductiveGroupsPartII §RG2.0.2 supplies the added orthogonal analytic step.
- PadicDifferentialEquationsAndRigidCohomology §RD.7.7 supplies Katz–Messing polynomial comparison; Chebotarev Layer 10 supplies the density statement used to select finitely many primes, not an effective prime bound.
- AbelianSchemesAndArithmeticModuli §§A2.4, A2.10, A6.7, A6.14, A6.30–A6.32 supply Riemann–Roch, numerical-class infrastructure, Hom finiteness, Rosati positivity and finite étale Weil restriction. Its A1.2 does not supply the Jacobian universal property (R09).
- AlgebraicModuliForArithmeticGeometry §§2.1 and 9.4 supply Hilbert loci and characteristic-zero resolution preserving the regular locus; SchemeAndStackFoundations §0.9 supplies spreading out. FaltingsFinitenessAndIsogenyTheorems §R28.5.15 supplies finiteness of curves with good reduction, without imposing a rational base point on the original curve.
- ClassicalArithmeticCompletion §§2.18, 2.39, 2.56 supply Eulerian counting, reflection/Worpitzky and unimodality. They do not state the requested descent CLT or the full convolution/log-concavity and variance contract as targets. The support/probability statements are used for n≥2 here; A(0,0)=1 is retained by the Lean counting definition.

The six gap slugs agree between README and plan: `eulerian-log-concavity-and-variance`, `eulerian-central-limit`, `andre-monodromy-normality`, `period-map-ax-schanuel`, `relative-crystalline-comparison`, `hodge-tate-image-cocharacter`. Each has a named earlier supplier. The Eulerian probability contracts, monodromy-normality contract, Frobenius-compatible relative comparison, and tensor-compatible Hodge torus are treated as declared obligations, not unowned missing results. R03 corrects the malformed Ax–Schanuel obligation; R07 corrects the description of the already supplied de Rham half. None is rejected merely because its supplier has yet to implement it.

Read main examples in JacobianChallenge, ComplexKahlerGeometry and ReductiveGroupsPartII to compare shape. The package has the required summary, scope, conventions, exact contracts, build paragraph, eleven mathematical layers, and per-layer Examples and Dependencies. Its 80 numbered targets were read, with earlier computed rows reused only for unchanged mathematical witnesses explicitly identified above; earlier blanket assertions that all Checks were true were not reused. Definitions retain API bullets and at least three listed Checks, but R12–R14 show that counting bullets alone is insufficient. Every theorem target has a source locator and hypotheses in prose. The ordering of the realization, coefficient, group, period, balance and application layers is supported by explicit dependencies, not a promise to follow source chapters. No computational algorithm, copied source passage, forbidden supplier, route-specific “good primes only” conclusion, sorry'd data, `set_option`, `lemma`, machine path, PR-number residue or process narrative was found in the package's mathematical text. R04 is the separate prohibited narrowing of general prerequisite statements.

## Not verifiable

- Serre, *Galois cohomology*, III §4.3 Theorem 4 and I §5.4 Corollary 1 to Proposition 36, used in §2.11, remains **uncertified** in the manifest. The text was not available for direct locator verification and was not requested again. R01 is established by the explicit torus calculation, independently of that inaccessible citation.
- The board index lists LawrenceVenkateshMethod at pull request #345, head 9ee7ac3. The attempted read of its indexed README returned HTTP 404. Its ownership cannot be certified from that head in this run. The ordinary open-head searches and all five closest-roadmap scopes above were checked; no assertion about unavailable additional open files is made.
- The upstream LV copy's recorded licence class was preserved, as required. This review read the supplied legal cache and did not independently authenticate the host's institutional affiliation.
- This is a review of statements, sources, interfaces and test signatures. The missing future formal cohomology/period constructions were not built; passing `sorry` elaboration is not represented as proof of their theorems.

## Source issues

- **Error** in LV at §10.2, printed p. 971: the source says the coefficient parameter dimension is binom(n+d,d−1)−1; it should be binom(n+d,d)−1, for example 14 rather than 19 for plane quartics; affects nothing.
- **Gap** in LV at Lemma 12.1 and proof, printed pp. 995–996: the source uses estimates only through N after introducing Fourier frequencies through 2N; it should require the point-count cutoff through 2N; affects a stated result.
- **Misprint** in LV at proof of Lemma 10.4, printed p. 978: the source says the degree-r pairing multiplier is ℓ; it should be ℓ^r, pairing λ with ℓ^r/λ; affects nothing.
- **Misprint** in LV at Example 4 after Lemma 11.2, printed p. 988: the source maps the induced filtration into f_k/f_(k+1); it should map into f_k/f_(k−1); affects nothing.
- **Misprint** in LV at proof of Lemma 11.4, printed p. 993: the source uses w and w⁻¹ as inverse root-set correspondences; it should use −w and −w⁻¹; affects nothing.
- **Misprint** in LS at proof of Lemma A.4, preprint p. 91: the source gives denominator 3^j in the bound propagated to index i; it should give 3^i; affects the proof.
- **Misprint** in LS at proof of Lemma A.5, preprint p. 91: the source puts the tail comparison in the greater-than direction; it should be less-than to obtain the second-moment upper bound 3/2; affects nothing.
- **Misprint** in LS at proof of Lemma A.5, preprint p. 91: the source leaves i in the denominator after reducing to the single k-sum; it should use 3^k in that single sum; affects nothing.
- **Gap** in LS at proof of Lemma 8.14, preprint p. 80: the source applies the finite-order cyclic argument on all of the unipotent radical; it should restrict to Z_U(φ^r), where the conjugation action has finite order; affects the proof.
- **Gap** in LS at proof of Lemma 5.49, preprint pp. 61–62: the source applies Faltings finiteness using only algebraic-integral Frobenius eigenvalues; it should also require rational Frobenius characteristic polynomials, hence integer coefficients; affects the proof.
- **Error** in LS at proof of Lemma 5.49, preprint p. 61: the source treats the coefficient-linear even-rank GO subgroup as connected; it should separate the identity component and finite component quotient; affects the proof.
- **Error** in LS at Lemma A.1, preprint pp. 89–90: the source gives a strict bound for every listed classical group; it should retain geometric parity, since n=2,d=1,GO₂ gives equality zero on both sides; affects a stated result.
- **Misprint** in LS at the paragraph following the GO calculation in Lemma A.1, preprint p. 90: the source gives square-root growth for the variance; it should give variance (n+1)/12 and square-root growth for standard deviation; affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source excludes invariance under every translation, including zero; it should exclude only nonzero translations; affects nothing.
- **Gap** in LS at proof of Theorem 9.2, preprint p. 86: the source uses properness to lift every integral point through a resolution; it should first restrict to the dense smooth open with unique rational lifts; affects the proof.
