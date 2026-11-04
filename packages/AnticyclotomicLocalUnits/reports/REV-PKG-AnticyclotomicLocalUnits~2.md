<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1062#issuecomment-6394253590 -->
Review (codex) of aecb500

Verdict: needs_changes

1. **F01** (P1) The ramification argument has no scheme Riemann–Hurwitz input

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:764`, “Apply separable Riemann–Hurwitz to the smooth connected curve and its genus-one target”; its `Needs` is at line 770.

   **Claim:** Section 5.5 uses the scheme Riemann–Hurwitz theorem in characteristic p, including wild different multiplicities, without importing it. Its three listed inputs supply the parametrization, good models and genus/index formula. ModularForms Layer 10B gives the compact complex-surface formula, not this scheme theorem. A source citation is not an owned proof input.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4673` states `scheme_riemann_hurwitz` for finite generically étale morphisms of smooth proper geometrically connected curves, with the different and wild inequality. This is the existing earlier owner.

   **Exact repair:** Import SchemeAndStackFoundations §3.2 in Scope and ownership, Exact supplier contracts, §5.5's `Needs`, and Layer 5 dependencies. Specify the finite generically étale map of smooth proper geometrically connected good fibres and retain the supplied genus comparison. Do not add a second generic Riemann–Hurwitz target here.

   **Repair test:** With genus-one target, the supplied formula gives different degree `2g_N−2`. At N=27 and N=32 this is respectively `0≤36/6=6` and `0≤48/6=8`. In characteristic 5 relative Frobenius is not generically étale, so the repaired input does not incorrectly apply to it. The failure witnessed here is the absent input, not either numerical bound.

2. **F02** (P2) The coordinate gap includes an existing one-variable theorem

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:70`, “identify the native O completed algebras with O[[S,T]] and O[[T]], continuously”; the same request occurs in `packages/AnticyclotomicLocalUnits/design/plan.json`, gap `quadratic-coefficient-coordinates`.

   **Claim:** This gap asks the supplier to provide its existing one-variable O-coordinate, continuity and generator change again. The genuine missing comparison with the two-variable algebra and the twisted plus quotient does not make those existing components missing. This is the nonminimal-gap pattern of previous F01 at a different contract.

   **Witness:** `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2627–2658` constructs the continuous O-algebra equivalence into the native completed carrier, inverse continuity, coefficient preservation and generator change. Its `Suggested.lean:650` states `TauCeti.Iwasawa.exists_completedCoordinate`.

   **Exact repair:** Keep the slug, but narrow its `needs` in both files to the two-variable coordinate and its compatibility with κ-twisting and quotient by the plus coordinate, relative to the existing one-variable coordinate. Import the existing coefficient extension, one-variable ring properties and generator comparison from §§1.7, 4.3–4.5 explicitly. State any additional multivariable property as such, rather than requesting the one-variable result again.

   **Repair test:** For O the unramified quadratic integer ring at 5, the existing coordinate sends γ to `1+T`; at level zero T maps to 0. Replacing γ by γ⁶ gives `(1+T)⁶−1`, whose linear coefficient 6 is a unit. These cases already satisfy the requested one-variable properties. The remaining two-variable comparison must send the plus relation to S and reduce at S=0 to that supplied coordinate.

3. **F03** (P3) The two-variable pairing Checks do not distinguish the zero pairing

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:430–432`, “Pairing a point killed by π^k has value in π^(−k)O/O” and “The zero point pairs to zero with every unit”.

   **Claim:** All three displayed calculations also hold for the zero bilinear pairing. The final assertion about an arbitrary lattice duality gives no finite class or value testing that assertion. The theorem and API correctly demand the actual perfect Kummer pairing; the Checks do not test that requirement.

   **Witness:** For B₀(y,x)=0, torsion values lie in π^(−k)O/O, both sides of restriction/norm adjunction are 0, and B₀(0,x)=0. Thus every computed test at lines 430–432 passes.

   **Exact repair:** Retain at least three Checks and make the finite comparison explicit. For a primitive base point Q, choose a dual coordinate through the actual connecting-map/Cartier evaluation pairing. Test a nonzero order-π value, its order-π² lift and multiplication by π, and the unramified coefficient trace. Do not add corresponding Lean padding.

   **Repair test:** Normalize the dual coordinate so that the values on `Q⊗π⁻¹` and `Q⊗π⁻²` are π⁻¹ and π⁻² modulo O. At p=5 these are `−1/5` and `1/25`; multiplication by π takes the second to the first, then to 0. The zero pairing fails the first two. In O/5O, `Tr(1)=2` and `Tr(3)=1`; the identity scalar map instead gives 1 and 3. These calculations test the actual normalization as well as nondegeneracy.

Three findings: one P1, one P2 and one P3. All ten findings from the previous review are repaired. The new findings concern a missing proof dependency, another nonminimal supplier contract, and nondiscriminating pairing Checks. No counterexample to the package's headline mathematical results was found. The input files were not edited.

## Verified sound

### Baseline, extent and previous repairs

The content checkout is main commit `bfaaff10c2db6fea1ff2d1500673df510534799f`. Its manifest and installed repositories agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The roadmap service's main copy agrees with that main commit; open-roadmap searches used its supplied head index of 2026-10-25. Library statements below were opened at those pins, not inferred from the resolver.

Read all four package inputs, the previous review and repair report, all 50 numbered targets, every API and Check, all supplier contracts and `Needs` lines, and the nine design gap entries. Recomputed the repaired passages and searched for the same patterns elsewhere. The earlier table was used only for its explicit computations, which were also checked where relevant; its summary claims were not treated as evidence. In particular the generic count at p=23 is μ, not the 0 appearing in the earlier review's table.

| Previous finding | Repaired passage, at the new README line unless stated otherwise | Verification and status |
|---|---|---|
| F01, mass ownership | 746: “m+e/2+d/3=(p−1)/12, equivalently p−1=12m+4d+6e” | **Repaired.** §5.4 and the contract import ModularCurvesPartII §12.1; neither gap entry requests its mass or exceptional-j criteria. Values at 5, 7, 47 are recomputed below. R02 is another instance of the minimality pattern. |
| F02, norm-control contract | 78: “put Z(F)=lim_(K⊆E⊆F, [E:K]<∞) lim_m Eˣ/(Eˣ)^(p^m), with norm transitions in E” | **Repaired.** The exact kernel, cokernel, injectivity, finite coinvariant ideal and rank hypotheses follow, in both declarations. The source's multiplicative completion is retained. |
| F03, consumers | 1123: “InertAnticyclotomicCMMainConjecture imports §0.1’s conductor parity” | **Repaired.** Its design line 40 names the corresponding local inputs. HeegnerPointEulerSystems and SelmerIwasawaCohomologyPartII are expressly prospective; the earlier SelmerIwasawaCohomology is absent. |
| F04, Herbrand ownership | 60: “Multiplicativity requires finite degree-minus-one Tate groups on both outer terms of the short exact sequence” | **Repaired.** Public pinned Tate names and hypotheses are imported; §7.1 uses them. `H0IsoNormQuotient` and `HNegOneIsoNormKernelQuotient` are outside the internal Zero/NegOne namespaces. |
| F05, cokernel | 1058: “quotient Λ/pΛ” | **Repaired.** The determinant-p example has this infinite power-series quotient; its further augmentation quotient has 25 elements at p=5. |
| F06, locators | 418: “Rubin87 Proposition 5.2, p.412”; 1144: “§§5.2–5.5.3, pp.93–98” | **Repaired.** All seven Rubin line corrections are present: §§2.1, 2.3, 2.4, 2.5, 3.5, 3.7, 6.5 now use 292/306, 306, 325, 322, 325, 389, 474. Duplicates are gone. The manifest distinguishes Lemmas 7.1–7.2 from Propositions 7.3–7.4. |
| F07, missing APIs and Checks | 388: “Inclusion F[π^k]→F[π^(k+1)] corresponds to [π] on the formal-point quotients”; 1109: “plus Kummer image has O-corank 20” | **Repaired.** §§2.1 and 8.5 each have four API clauses and three Checks. The transition direction, coefficient trace, ranks 20 and 5, and injectivity were tested below. |
| F08, unused edge | 978: “*Needs:* §3.3; §3.2” | **Repaired.** §6.5 is removed from §7.1, retained where the primitive point is needed in §7.2. The Herbrand values 1,25,625 do not use it. |
| F09, primary locator | 652: “Kato93, Chapter II, Theorem 2.1.7, uncertified” | **Repaired.** Manifest and References contain the same settled key and locator; BKO21 line 467 points to this version. Original text remains uncertified. |
| F10, finite fields | 84: “every finite extension of Φ used for the elliptic formal-point comparison” | **Repaired.** The plan agrees; line 375 also says finite extensions of Φ. Other finite-field occurrences concern finite cardinality. |

No finding was marked not actionable in the last repair report. None of R01–R03 re-raises such a finding.

### Computed adversarial pass

In the tables, O is the unramified quadratic integer ring at p=5, π=−5 and Λ=O[[T]], unless another instance is specified. “Pass” means the displayed calculation agrees with the statement, including its exclusions; it is not a claim to have formalized the proof. A symbolic a denotes a logarithm or derivative value in the stated carrier. Named API clauses are separated where their tests differ. Finite groups and lattices used as negative controls do not replace the arithmetic objects in the statements.

| Statement or convention | Instances tried | Computed values on both sides | Result; change |
|---|---|---|---|
| Standing prime and coefficient hypotheses | p=2,3,5; field Φ; square-zero O[ε]/ε² | 1728=0 in characteristics 2,3, but 1728=3 in F₅; 5Φ=Φ gives quotient 0 versus O/5O of size 25; ε²=0 with ε≠0 violates the domain hypothesis | Excluded cases identified; pass |
| Characteristic, zero ring and residue size | equal characteristic 5, zero ring, F₂ | 5=0, 1=0 and residue size 2 respectively, versus characteristic 0, 1≠0 and size 25 here | Excluded by the actual native field/integer-ring data; pass |
| π-adic Tate basis | n=0,1 | [−5](−w₁)=w₀; [−5]w₁=−w₀ | Pass; rules out unaltered p-adic basis |
| Arithmetic reciprocity and inverse twist | Artin unit 2 | κ=1/2 on T, inverse twist factor 2; product 1 | Pass |
| Quadratic directions and finite tower degrees | n=0,1,2 | u·cuc⁻¹=u·u⁻¹=1; Θ degrees 1,25,625 and Ψ degrees 1,5,25; tame degrees 24 versus 6 | Pass |
| Trace coefficient convention and different | O=Z₅[z], z²=2; ramified z²=5 | Trace Gram matrices diag(2,4), determinant 8≡3, versus diag(2,10), determinant 20≡0 | Pass; unramified hypothesis essential |
| Discrete versus compact action convention | finite-image homomorphism from a compact group to torsion-free discrete points | Image is finite and torsion-free, hence size 1; the zero continuous homomorphism has value 0 | Pass; not an assertion for valued topology on the direct limit |
| Nonabelian and rank-zero controls | S₃, trivial Γ | S₃ has ab≠ba, so no Γ≃Z₅²; at n=0 the finite quotient has size 1, though the infinite Γ retains rank 2 | Pass; finite base level does not erase standing infinite-tower data |
| 0.1 conductor definition and minimality | orders 1,5,25 | c=0,2,3; conductor ideals O,25O,125O; order-5 first appears at level 1 | Pass |
| 0.1 parity partition, both directions | preceding characters | even membership true,true,false; odd false,false,true; intersection empty and union all three | Pass |
| 0.1 inversion and coefficient embeddings | χ primitive of order 25 | χ⁻¹ and any embedded primitive value still have order 25, c=3 | Pass |
| 0.2 native principal-unit subgroup | 1, 1+ϖ, Teichmüller 2 | Residues 1,1,2; first two are in depth one, third is not | Pass |
| 0.2 norm-compatible projections and their uniqueness | identity family, difference of two equal-coordinate families | N(1)=1; every difference coordinate 0, hence limit difference 0; a base unit's degree-25 norm is a²⁵ | Pass |
| 0.2 omega eigenspace iff and projector | ω-eigenvector; η≠ω | (1/24)Σ1=1 on ω; Σ(η/ω)=0 on η; e² has eigenvalues 1²=1 and 0²=0 | Pass in both directions |
| 0.2 projected family and completed action API | group element g, norm N, omega projector | Projection of g·u has coordinate g(u_n); N(gu)=gN(u); eN=Ne since each summand dN=Nd | Pass |
| 0.2 additive zero | zero in the additive limit | Coordinates are multiplicative 1, and e(0)=0, not the field element 0 in Φ_nˣ | Pass |
| 0.3 two-variable rank | n=0,1 | Coinvariant O-ranks 2·25ⁿ=2,50; free Λ₂² gives the same 2,50 | Pass |
| 0.3 tame exceptional character exclusion | p=5, omega and cyclotomic tame characters | Exponents 1 and 6 modulo 24 differ; nontrivial omega projection of trivial Z₅ cokernel is 0 | Pass |
| 0.4 Hom evaluation, inverse and equality | h(v)=b, evaluation at −v and 5v | Values b,−b,5b; reconstruction sends v to b; evaluation at 5v has image 5O and misses 1 | Pass; nonbasis excluded |
| 0.4 diagonal action | scalar κ(g)=2 on T | (g·h)(v)=g h(v/2)=(1/2)g b, versus g b without twist | Pass |
| 0.4 basis transport and functoriality | basis −v; maps multiplication by 2 then 3 | Evaluation −b; postcomposition gives 3·2b=6b; identity gives b | Pass |
| 0.5 quotient definition, twist comparison | σ acts by κ; twisted action | κ⁻¹κ−1=0; untwisted relation κ−κ=0; wrong relation 1−κ need not be 0 | Pass |
| 0.5 universal property and equality in quotient | O[[S,T]]², x−y=S e₁ | q(x)−q(y)=0 iff this difference lies in (S); map sending S e₁ to 1 does not descend | Pass in both directions |
| 0.5 generator independence | σ′=σ⁶ | Ratio of relations has constant term 6κ⁵, a unit; at κ=1 it is 6 | Pass |
| 0.5 freeness, quotient action and continuity | coordinate quotient S=0 | O[[S,T]]²/(S)=O[[T]]²; q(σx)=q(x); Γ⁻ multiplication commutes with q | Pass, conditional on narrowed coordinate contract |
| 1.1 norm and scalar algebra | f=1, reduction of [π]_F | Product of 25 terms 1 is 1; [π]X mod π=X²⁵ gives scalar rank 25, not p=5 | Pass |
| 1.1 interpolation and uniqueness test | identity unit family | f(v_n)=1 at every n and N_F(1)=1; zero series has value 0 and is not a unit | Pass |
| 1.1 multiplicativity and topology | two families f,g; finite projection | (fg)(v_n)=f(v_n)g(v_n)=u_n w_n; projection of product equals product of projections | Pass |
| 1.1 basis and coordinate transport | b=−1; Z=X+X² | f∘[−1] evaluated at −v gives f(v); additive inverse in Z is −Z+2Z²+… rather than −Z | Pass |
| 1.1 extension and finite values | coefficient embedding ι | (ιf)(ιv_n)=ι(f(v_n))=ιu_n; identity embedding returns u_n | Pass |
| 1.2 derivative definition and nonzero denominators | f=1; normalized differential at 0 | δ=0/1=0; λ′(0)=1; f=0 would give a forbidden zero denominator | Pass |
| 1.2 invariant differential and linearity | differential rescaled by 2; logarithmic derivative 2h | (2h)/2=h; f g gives f′/f+g′/g, so additive input has derivative h_f+h_g | Pass |
| 1.2 Tate-basis independence | v↦−v, a↦−a | Chain rule changes h to −h; (−a)(−h)=ah | Pass |
| 1.2 covariance and augmentation | g on finite coefficients; r=γ−1 and r=2 | δ((γ−1)x)=δ(x)−δ(x)=0; δ(2x)=2δ(x); finite value becomes gδ_n(x) | Pass |
| 1.2 trace recursion and zero | successive admissible levels | Tr δ_(n+1)=−5δ_n; all values of the identity family are 0 | Pass |
| 1.3 character derivative, level independence | adjacent levels with trace −5A | (−5A)/25=−A/5 at n=1 and n=0 | Pass |
| 1.3 covariance and Λ-specialization | χ(g)=ζ₅ | δ_χ(gx)=ζ₅⁻¹δ_χ(x)=ζ₅⁴δ_χ(x), versus ζ₅δ_χ(x) for the wrong convention | Pass |
| 1.3 coefficients, linearity and zero | ι and x+x′ | ιΣχ(g)gA=Σιχ(g)ι(gA); sum values add; at x=0 both sums are 0 | Pass |
| 1.4 trivial Euler factor | p=5; δ(x)=a | (1−π⁻¹)a=(1+1/5)a=6a/5; if a=0 both vanish | Pass |
| 1.4 descent and augmentation | Γ⁺ generator; χ inflated from Γ⁻ | χ(σ)⁻¹−1=1−1=0, so δ_χ((σ−1)x)=0; δ((γ−1)x)=0 | Pass |
| 1.5 signed unit membership and zero | trivial character, plus ξ* | Minus gives δ₁=0 and δ=0; plus ξ* gives 6δ(ξ*)/5≠0; zero is in both | Pass; opposite parity retained |
| 1.5 closed finite submodules and inherited operations | scalar r with specialization b | δ_χ(rx)=b·0=0 and δ_χ(x+y)=0+0=0; intersections of closed kernels remain closed | Pass |
| 1.5 finite-free tensor identity | W=O² | δ_W(x₁,x₂)=(δx₁,δx₂); vanishing iff both coordinates vanish | Pass in both directions |
| 1.5 scalar/tensor distinction | W=O[ζ₅] | ζ⊗1−1⊗ζ≠0 in the tensor, but multiplication gives ζ−ζ=0 | Pass; excludes ramified scalar shortcut |
| 2.1 finite exact sequence and connecting kernel | L=Φ, k=1,2; primitive Q | Quotient sizes 25,625; class of Q nonzero, class of π^k Q zero; connecting kernel exactly π^kF(Φ) | Pass |
| 2.1 torsion inclusions and quotient transitions | k=1→2 | Q mod π maps to πQ mod π², nonzero; reduction of πQ mod π² back mod π is 0 | Pass; inclusion is not reduction |
| 2.1 restriction/corestriction | base point, degree-5 extension | Restriction gives Q; corestriction after restriction gives [5]Q; identity extension gives Q | Pass |
| 2.1 Cartier coefficient comparison | 1,3,z in F₂₅=F₅[z], z²=2 | Tr values 2,1,0; Gram determinant 3 mod 5 is nonzero, versus 0 for ramified z²=5 | Pass |
| 2.2 formal norm vanishing and obstruction route | height 2, n=1,2,3,4; n=0 | Hazewinkel depths 1,2,2,3 tend to infinity; n=0 trace is identity, depth 1 | Pass; formula not evaluated with junk n−1 |
| 2.2 quantifiers at ramified bases | fixed base L and arbitrary depth a; height-one control | Eventual image lies in every 𝔪_L^a, intersection 0; height-one cyclotomic norm cokernels at levels 0,1,2 have sizes 1,5,25 | Pass; extra ramified-base estimate is an explicit target, not misquoted from Haz77 |
| 2.3 actual perfect pairing and finite comparison | primitive order-π class, correctly normalized actual dual | Nonzero value π⁻¹=−1/5 mod O; zero pairing gives 0 instead | The theorem is sound; R03 improves its Checks |
| 2.3 equivariance and compact dual | inverse-twisted eigenvectors a,a⁻¹ | Product a·a⁻¹=1, so paired value unchanged; without inverse twist factor a remains | Pass |
| 2.3 existing three Checks | B₀=0 | 0∈π⁻kO/O, adjunction 0=0, B₀(0,x)=0 | Fail discrimination; R03 |
| 2.4 descent and zero annihilator | σ eigenvalue κ; nonzero torsion point/dual coordinate | Twisted relation κ⁻¹κ−1=0; perfect coordinate value π⁻¹≠0 detects the nonzero class | Pass |
| 2.5 Wiles trace, increasing m | trace multiplier π, k fixed | πA/π^(m+2+k)=A/π^(m+1+k); at π=−5 the first adjacent case is −5A/25=−A/5 | Pass |
| 2.5 k=0, zero point and lift independence | y⊗1=0; y=0; changing lift by (σ−1)x | Trace expression is integral modulo O in first case, 0 in second; Γ⁺ trace of a difference is A−A=0 | Pass; admissible m retained |
| 3.1 normalized logarithm and level independence | base logarithm a, levels 0,1,2 | a,5a/5,25a/25 all equal a | Pass |
| 3.1 character covariance | χ(g)=ζ₅ | Reindexing gives ζ₅λ_χ(y); the unit derivative instead gives ζ₅⁻¹δ_χ(x) | Pass |
| 3.1 higher-character vanishing | base point and primitive order-5 character | aΣ_(i=0)^4 ζ₅^i=0, versus trivial sum 5a | Pass |
| 3.1 trivial character and O-linearity | y+y′; base y | λ₁(y)=Tr(a)/5=a; λ_χ(y+y′)=λ_χ(y)+λ_χ(y′), λ_χ(0)=0 | Pass |
| 3.2 signed point definition and finite intersection | n=0,1,2,3 | Ranks (A⁻,A⁺)=(1,0),(5,0),(5,20),(105,20); at n=0 all base points are minus | Pass; same parity killed |
| 3.2 saturation | nonzero a and aλ_χ(y)=0 | Field coefficients give λ_χ(y)=0; with a=0 the equation is 0=0 for every y, so a≠0 is needed | Pass |
| 3.2 tensor injection | saturated inclusion; unsaturated 5O⊂O | Saturated quotient has Tor=0; multiplication by 5 on Φ/O has kernel π⁻¹O/O of size 25 | Pass; wrong unsaturated model excluded |
| 3.2 inclusion, operations and formal traces | base point and degree-5 trace | Same-parity zero remains 0; trace logarithm 5·0=0, sum 0+0=0 | Pass |
| 3.3 logarithm lattice and rational normal basis | C₅,C₂₅ | Rational orbit dimensions 1+4=5 and 1+4+20=25; every orbit dimension positive | Pass; does not assert an integral normal basis |
| 3.3 integral trace-projector denominator | n=0,1,2 | Denominators divide 1,5,25; multiplying their sums by these values is integral | Pass |
| 3.4 intersection and divisible sum | finite Fourier decomposition; n=2 | All Fourier coefficients zero implies y=0; 20+5=25; 25F⊂A⁺+A⁻ becomes full sum after division | Pass; no premature direct sum of divisible modules |
| 3.4 both infinite ranks | n=1,3,4 | Minus ranks 5,105,105; plus ranks 0,20,520, so neither sequence is bounded | Pass |
| 3.5 finite-level saturation | π(gz−z)=0 in torsion-free points | gz−z=0; unsaturated inclusion 5O⊂O instead has the 25-element tensor kernel above | Pass |
| 3.6 annihilator inclusion | plus points paired with plus units, and minus/minus | Each Fourier summand λ_χ(y)δ_χ(x) has a zero factor, hence sum 0 | Pass |
| 3.6 annihilator converse and dual direction | nonzero matching Fourier coordinates a,b; sufficiently divisible point | Product ab/π^k is nonintegral for k>v_π(ab), hence nonzero modulo O; dual action sends g to g⁻¹ | Pass; nonzero wrong-sign component detected |
| 3.7 disjointness and rank upper bounds | ambient rank 2; quotient rank ≥1 | Rank of sign ≤2−1=1; annihilator of D⁺+D⁻=D is 0, hence signed intersection 0 | Pass |
| 3.7 positive quotient rank and O-torsion-freeness | minus point ranks 5→105 | Unbounded dual corank rules out rank-zero finite-coinvariant model; aδ_χ(x)=0 with a≠0 forces δ_χ(x)=0 | Pass |
| 4.1 small-prime auxiliary fields | all 13 primes 5–47 listed below | D≡1 mod 8; (D/p)=−1; class numbers 1,2,3 all prime to their selected p | Pass |
| 4.1 large-prime estimate and threshold | p=47,53 | Upper expression sqrt(8p)(2+log(8p))/π_real is 48.9434676>47, 52.7611868<53; at 53 ratio .99549409 | Pass; large-prime estimate not used at 47 |
| 4.1 canonical CM assembly | chosen inert p and canonical sign | φ(pO_K)=−5, W(φ)=+1; auxiliary conditions exclude l=p and p∣l−1 | Pass; canonical character construction stays with NCM |
| 4.2 conductor-indexed projected class | ν of exact order l | Nontrivial conductor l², not l; group-ring evaluation [g]↦ν(g), not ν(g)⁻¹ | Pass |
| 4.2 norm compatibility and quotient | adjacent p-levels, inverse twist | Norm of projected level n+1 equals projected level n; σ−1 maps to 0 after quotient | Pass |
| 4.2 linearity, coefficients and tame average | zero class, sums; p=5 | 0↦0; z+z′↦ξ+ξ′; Δ projector uses 1/24, not 1/6; coefficient embedding distributes over the sum | Pass |
| 4.3 dual exponential normalization | n=0,1; normalized cyclotomic class | π⁻¹=−1/5, π⁻²=1/25; imported exp*(log χ_cyc)=1 | Pass against BKO21; Kato93 original uncertified |
| 4.3 character sum | coefficient A=δ_n(x) | Σχ(g)g(π⁻n⁻¹A)=π⁻n⁻¹Σχ(g)gA=δ_χ(x) | Pass |
| 4.4 trivial CM Euler factor | χ=1, φ(p)=−5 | 1−(−5)/25=6/5=δ₁/δ | Pass |
| 4.4 root sign and signed membership | χ trivial, order 5, order 25 | Signs +,+,−; opposite-sign central values 0; unramified scalar/tensor injection takes 0 only from 0 | Pass; ramified tensor counterexample excluded |
| 4.5 unit derivative descent | W free on w_i; all δ(x_i)∈5O | Σδ(x_i)w_i∈5W has valuation ≥1; Finis specialization has valuation 0, so at least one coordinate has valuation 0 | Pass; no signed freeness used |
| 5.1 rational supersingular examples | y²+y=x³ at 5,11; y²=x³−x at 7 | Point counts 6,12,8; p+1−#E=0 in all three | Pass |
| 5.1 optimal isogeny and Honda parameter | a_p=0, p=5 | a_(p²)=0²−2p=−10; formal parameter −5, not +5 | Pass; source sign corrected in roadmap |
| 5.2 Manin unit and separability | good optimal model; t+t², t⁵ in characteristic 5 | v₅(c_E)=0; derivatives at 0 are 1 and 0 respectively | Pass; optimality and good prime retained |
| 5.3 scalar Frobenius and cyclic subgroup stability | traces ±10; orders 6 and 7 | #E=26∓10=16,36; −5≡1 mod 6, −5≡2 mod 7; both scalars preserve a cyclic subgroup, only first fixes its generator | Pass |
| 5.4 mass equality | p=5,7,47 | 1/3=4/12; 1/2=6/12; 3+1/2+1/3=46/12 | Pass; imported owner |
| 5.4 twist-sensitive trace counts | p=5,7,47 | (N(2p),N(p),N(0))=(1,2,0),(1,0,2),(5,2,2); negative traces have corresponding same counts | Pass |
| 5.5 ramification bound | N=27,32, identity genus-one map | Different degrees 0,0,0; numerical upper bounds 6,8,0 respectively | Numerically sound; missing input R01 |
| 5.6 generic supersingular bound | p=13,23,29,47; negative control p=5 | m=1,1,2,3,0; point bounds μ,μ,2μ,3μ,0; for p≥13 these exceed μ/6 | Pass; source's p=47 weak bound is 0 |
| 5.7 exceptional bounds | (p,N)=(5,27),(7,32); p=13 | μ/3=12>6, μ/2=24>8; at 13 both exceptional hypotheses are false | Pass |
| 5.8 fine marking and prime-to-p group | M=6 at 5, M=8 at 7 | φ(M)=2,4 prime to p; E[6] has 36 points, and (1,0) in (Z/6)² has exact order 6 | Pass |
| 5.8 forgetful disk and represented family | unramified marked point, identity coefficient extension | Local disk map has linear coefficient a unit; extension by identity leaves subgroup and point orders N,M | Pass; unmarked coarse point lacks the supplied family |
| 5.9 primitive formal point | log(Q)=5u with u a unit; multiplier 36 | Valuation 1 before and after multiplication by 36≡1 mod 5; multiplication by 5 gives valuation 2 and loses primitivity | Pass |
| 5.9 disk inverse and native formal image | derivative a unit; chosen formal Q | Unique formal preimage maps to Q; reduction is 0, agreeing with the pinned range/ker-reduction equivalence | Pass |
| 6.1 quotient lattice and base case | s=0,1,2 | C₀=0, cardinalities of C₁,C₂ are 5,25; x₀=Q; fields have degrees 1,6,30 | Pass; no s=0 evaluation of p^(s−1)(p+1) |
| 6.1 order and field of definition | s=1,2 | Endomorphism orders Z₅+5O and Z₅+25O differ; unit quotient sizes 24/4=6 and 600/20=30 | Pass |
| 6.1 marking, Galois transport and formal image | prime-to-5 cyclic subgroup of order N | Degree-5 isogeny has intersection 0 with the subgroup, so transported order stays N; reduction of x_s is 0 | Pass |
| 6.2 tame trace and degrees | s=0,1,2 | Primed degrees 6,30,150 divided by 6 give 1,5,25; trace has 6 terms rather than 24 | Pass |
| 6.2 primitive base value | y=[6]Q | log(y)=6log(Q), valuation 1; multiplying by 5 would have valuation 2 | Pass |
| 6.2 formal trace API | nested degrees 6 and 5; scalar a | Double sum has 30 terms; [a]Σy_i=Σ[a]y_i; all zero coordinates give the zero system | Pass |
| 6.3 lattice neighbors and their Hecke orbit | s=1 over F₅ | Five lines (1,a) and one line (0,1); det((1,a),(1,b))=b−a≠0 for a≠b | Pass |
| 6.3 wrong scalar lattice model | replace θ by 1 | Each 1+5a is a Z₅-unit, producing one lattice repeated five times instead of five distinct outward neighbors | Pass; source slip not copied |
| 6.3 Hecke boundary and interior | a_p=0, s=0 and s≥1 | T_p x₀=0=Σ_(Δ′)x₁; interior trace equals −x_(s−1) | Pass; Δ′ order 6, not Δ order 24 |
| 6.4 initial and next traces | s=0,1,2 | y₀=0; Tr y₁=−6Q; Tr y₂=−y₀=0 | Pass |
| 6.5 odd trace formula | n=1,3,5 | −y,5y,−25y match (−1)^((n+1)/2)5^((n−1)/2)y | Pass |
| 6.5 signed parity | y₀ and y₂ | y₀=0; λ₁(y₂)=0 and order-5 Fourier values 0; surviving order-25 characters have odd conductor, so y₂ is plus | Pass |
| 7.1 arithmetic Herbrand ratio | n=1,3,5 | 5^(n−1)=1,25,625; at n=3 lattice product 5⁴·5⁻²=25 | Pass |
| 7.1 finite-index and finite-module controls | O,5O; finite O/5O, trivial action C₅ | O and 5O each give cardinal ratio 25/1; finite module gives 25/25=1 | Pass |
| 7.1 total cardinal, trivial and noncyclic controls | zero module, trivial group, infinite direct sum F₅, S₃ on Z | First two ratios 1/1=1; infinite Tate groups give totalized 0/0=0; for S₃ low Tate ratio 6 but H²/H¹ ratio 2 | Pass; finiteness and cyclicity are explicitly required |
| 7.2 finite H¹ vanishing | n=3, primitive y; nonprimitive 5y′ | Ĥ⁰ has size at most 25 and ratio 25, forcing H¹ size 1; nonprimitive bound becomes 625 and does not force vanishing | Pass |
| 7.2 continuous cocycle passage | compact Γ and discrete A⁻ | Continuous cocycle has finite image; after a sufficiently deep subgroup fixes it, its homomorphism image is finite torsion-free, size 1 | Pass; gives a finite-level cocycle, not an unrestricted cohomology-limit assertion |
| 7.3 minus invariants | base lattice 5O and π-torsion | 5O⊗Φ/O≃Φ/O with π-torsion size 25; inclusion is the saturated formal-point inclusion, not multiplication by 5 on Φ/O | Pass |
| 7.4 compact Nakayama and rank | Λ versus Λ/(T); noncompact Φ/O | Both first coinvariants equal O, but ranks are 1 and 0; Φ/O has quotient by 5 equal 0 while itself nonzero | Pass; positive rank and compactness exclude false shortcuts |
| 7.4 kernel freeness | split surjection Λ²→Λ | Kernel is finite projective of rank 2−1=1; local finite-flat theorem makes it free | Pass |
| 8.1 augmentation generation | f=1+5T, T, 5+T | Constant terms 1,0,5; only first a unit; coefficient-of-T sends T to 1 despite T nonunit | Pass |
| 8.1 actual derivative factorization | f(T)e with δ(e)=b | δ(fe)=f(0)b; a unit product has both factors units; continuity alone gives no such equation | Pass |
| 8.2 integral direct sum | determinant 1 versus columns e₁,e₁+5e₂ | First cokernel 0; second determinant 5, cokernel Λ/5Λ with independent classes 1,T,T²,… | Pass; previous false Check repaired |
| 8.2 rank and chosen generator | plus generated by ξ*, minus kernel | Ranks 1+1=2; section followed by q is identity; inverse twist changes action, not O-rank | Pass |
| 8.3 every-character nonvanishing | trivial, primitive order-25 χ | Trivial δ₁(ξ*)=6δ(ξ*)/5≠0; order-25 rational orbit dimension 20>0 provides a nonzero Fourier component | Pass via actual pairing and sufficiently divisible points |
| 8.4 matching and opposite parity | χ order 25; generator v↦−v | δ_χ(v₊)=0, δ_χ(v₋)≠0; new nonzero value is its negative; plus augmentation valuation remains 0 | Pass |
| 8.5 finite signed Kummer image definition | n=0,2 | Plus coranks 0,20; minus coranks 1,5; totals 1 and 25 equal full point coranks | Pass |
| 8.5 actual injectivity | primitive base Q⊗π⁻¹ | Source order π is nonzero, actual Kummer image is nonzero; zero plus module at level 0 has image 0 | Pass |
| 8.5 restriction and trace squares | base logarithm a, degree 5, identity | Trace gives 5a, not −5a; identity gives a on both point and Kummer sides | Pass |
| 8.5 submodule and image membership API | zero, z and −z | Kummer(0)=0; Kummer(z)+Kummer(−z)=0; both source sum and image sum give 0 | Pass |

The finite computations used to check all small-prime examples are as follows. The form lists are reduced primitive forms with the boundary convention b≥0. Euler's criterion gives residue p−1 in every selected inertness test.

| D | Selected primes | Reduced forms | Computed class number and splitting |
|---|---|---|---|
| −7 | 5,13,17,19,31,41,47 | (1,1,2) | h=1; D mod 8=1; (D/p)=−1 for each listed p |
| −15 | 7,11,29,37,43 | (1,1,4),(2,1,2) | h=2; D mod 8=1; (D/p)=−1 for each listed p |
| −31 | 23 | (1,1,8),(2,−1,4),(2,1,4) | h=3; D mod 8=1; (D/23)=−1 |

| p | (m,d,e) | Weighted mass, equal to (p−1)/12 | (N(2p),N(p),N(0)) |
|---|---|---|---|
| 5 | (0,1,0) | 1/3 | (1,2,0) |
| 7 | (0,0,1) | 1/2 | (1,0,2) |
| 11 | (0,1,1) | 5/6 | (2,2,2) |
| 13 | (1,0,0) | 1 | (1,0,0) |
| 23 | (1,1,1) | 11/6 | (3,2,2) |
| 29 | (2,1,0) | 7/3 | (3,2,0) |
| 47 | (3,1,1) | 23/6 | (5,2,2) |

No assertion ranges over arbitrary covers, fans, index universes or schemes. Thus empty covers and non-quasi-separated schemes are not instances of these arithmetic statements. The actual corresponding degenerate cases—empty character sum, trivial finite quotient, zero module, inseparable map, noncompact dual, ramified coefficient, nonbasis vector and level zero—are included above. No formula divides by a possibly zero parameter under its stated hypotheses: p and π are nonzero in characteristic zero; p²−1 is a p-unit; Coleman series values and invariant differentials are nonzero; finite Fourier denominators live in fields; Herbrand ratios are used only after finiteness.

### Seeded source sample and additional locator checks

All fifteen requested targets were checked in the cached legal extractions. Printed page numbers, theorem types and hypotheses were compared, rather than merely finding similar words. The manuscript's extra API clauses are its own explicit formal consequences; the following table distinguishes those from verbatim theorem-level support. No source text was copied into the package or this report.

| Sample | Source and exact support read | Outcome |
|---|---|---|
| 0.1 conductor parity | BKO21 §2, p.948, lines 249–252 | Trivial c=0 and nontrivial order p^r with c=r+1; inverse convention checked. |
| 0.5 twisted quotient | BKO21 §2, p.948, lines 260–269 | σ−κ(σ) before twist, σ−1 afterwards, rank two; matches. |
| 2.1 finite Kummer/Cartier | BKO21 §4, p.954, lines 516–523; Rubin87 Lemma 5.1 and Proposition 5.2, pp.411–412, lines 292–317 | Division/cohomology route and resulting arithmetic duality support the construction. Finite exactness and transition directions were independently derived from the division diagram; generic Cartier and local Tate inputs are imported, not claimed as a new Rubin theorem. |
| 3.1 character logarithms | BKO21 §4, p.955, lines 535–538; Rubin87 Lemma 5.5(i)–(iv), pp.412–413, lines 339–358 | p⁻n, inverse character in sum, direct covariance and trace normalization agree. |
| 3.6 signed annihilator | BKO21 §4, p.955, lines 547–550; Rubin87 Proposition 5.6 and Corollary 5.7, pp.413–414, lines 364–388 | Same sign for annihilator, opposite vanishing conventions for points and units; Fourier converse retained. |
| 4.1 auxiliary CM field | BKO21 Lemma 3.1, pp.950–951, lines 339–362; CM hypotheses lines 373–394 | Splitting of 2, inert p, p-prime class number and canonical-character setup agree. Small fields and threshold were recomputed independently. |
| 4.4 CM derivatives and sign | BKO21 equations (3.6)–(3.7) and Proposition 3.3, p.953, lines 469–488 | Both omitted-Euler-factor formulas and parity sign agree. Membership after scalar evaluation uses the separately resolved NCM.5 coefficient contract. |
| 5.4 mass and twists | BKO21 proof of Lemma 5.2, p.957, lines 617–656 | Counts distinguish invariants and rational twists. Existing mass owner is imported; no false mass gap remains. |
| 6.1 quasi-canonical modular points | BKO21 §5.0.2, pp.958–959, lines 712–738 | Lattices, field indices, transported cyclic marking and x₀ agree, with the source's Φ′/Ψ′ slip corrected. |
| 6.3 Hecke traces | BKO21 proof of Theorem 5.5(ii), p.959, lines 753–768 | Interior inward/outward decomposition and boundary trace agree after correcting the missing θ and Δ′ slips. The roadmap imports lattice classification. |
| 7.2 first cohomology | Rubin87 Lemma 7.2 and Proposition 7.3, p.417, lines 519–528 | Bound contains the base-point index. Primitivity makes that index 1. The continuous discrete-module passage is separately supplied by the finite-image cocycle argument. |
| 7.3 minus invariants | Rubin87 Proposition 7.4, p.417, lines 529–532; BKO21 Corollary 5.6, pp.959–960, lines 769–780 | Actual inclusion of base points and Φ/O invariant module agree. |
| 7.4 free quotient and kernel | BKO21 Corollaries 5.6–5.7, pp.959–960, lines 769–785; Rubin87 Lemma 4.3, p.410, lines 254–259 | Compact Nakayama plus positive rank gives free quotient; splitting and pinned local-ring module theorem give free kernel. |
| 8.2 integral decomposition | BKO21 Theorem 2.1, p.949, line 306, and Theorem 5.8/proof, p.960, lines 791–797 | Integral direct sum, not only rational complement; augmentation linearity is explicit in the roadmap. |
| 8.4 every matching generator | BKO21 Corollary 2.2, p.949, lines 308–309; Rubin87 Lemma 10.1, p.421, lines 665–672 | Every matching finite character and every generator; full-module derivative nonvanishing supplies the needed input. |

Also read Win80 §4 theorem (i),(iii), pp.91–92, lines 112–123, §5.2, p.93, lines 192–198 and the finite coinvariant argument at lines 296–325; Haz77 Theorem 1.3, pp.305–306, lines 37–57; AU96 Theorem A, p.269, lines 49–51, Propositions 3.3–3.4 and the proof at lines 308–364. The unramified-base restriction of Haz77 and optimality/good-prime restriction of AU96 are retained. The new general norm contract agrees with Win80's multiplicative norm-limit formulation rather than replacing it by finite units. Wiles78 and Kato93 are the only settled uncertified entries, discussed below.

### Duplication, ownership and current supplier resolution

Used the roadmap service's object searches and `show` for the open suppliers, and searched pinned code by object as well as declaration name. Searches included formal-group norms, Lubin–Tate interpolation, Coates–Wiles derivatives, signed local units, Manin constants, Cartier duality, Riemann–Hurwitz, Tate quotients and completed coefficients. Read representative main roadmaps LocalFieldsRamification, PadicMeasuresIwasawaAlgebras and ImaginaryQuadraticClassNumber for upstream shape.

The following citations were resolved afresh. Paths in this table are under `TauCetiRoadmap/` on main or the roadmap's indexed open head, except explicitly marked board designs. Line numbers are the roadmap file's numbers, excluding the service wrapper.

| Supplier and location | Sections actually read and what they supply |
|---|---|
| `LocalFieldsRamification/README.md:59`, 267, 561, 705 | Layers 0–3: local fields, units, topology, ramification and normal basis. |
| `ProfiniteArithmetic/README.md:403` | §1.3: continuous p-adic powers; the module application here retains commutativity. |
| `PadicMeasuresIwasawaAlgebras/README.md:909`, 2409, 2485, 2530, 2620, 3367 | §§1.7, 4.2–4.5, 5.2: coefficient extension, one-variable ring/module structure, coordinate and compact Nakayama. R02 concerns already supplied pieces. |
| `ClassFieldTheory/README.md:416`, 460, 920, 1220, 1312, 1433 | §§2.5–2.6 and Layers 5–8: arithmetic reciprocity, finite Tate duality, restriction/norm adjunction. Generic Herbrand material is correctly assigned to Tau Ceti. |
| `ImaginaryQuadraticClassNumber/README.md:35`, 53, 57, 67 | H1.3, H2.1–H2.3: forms, splitting, class-number formula. H2.3's lower-estimate material does not already give the requested uniform upper estimate. |
| `EllipticCurves/README.md:423`, 683, 1154 and Layer 4 | Layers 1,3–5: isogenies, Frobenius and point counts, reduction and twists. The requested twist-sensitive trace table is additional. |
| `ModularCurves/README.md:1279`, 1648, 1803 | Layers 5,8,9: fine affine level, cyclic subgroup transport and stabilizers. |
| `ModularForms/README.md:1068`, 1117 | Layer 10B: compact complex-surface genus/index formula; this does not supply R01's positive-characteristic different theorem. |
| `IntegralIwasawaTheory/README.md:829`, 855, open head | §§7.1–7.2: multiplicative interpolation and cyclotomic control. No second owner of height-two Lubin–Tate interpolation or the stated general norm contract. |
| `ColemanPowerSeries/README.md:26`, 4930, open head | Scope and Layer 1 explicitly concern multiplicative cyclotomic interpolation and its explicit norm refinements. The general Lubin–Tate direction is outside that base roadmap. |
| `ArithmeticGaloisDuality/README.md:554`, 640, open head | R02.1.2–R02.1.3: inverse-limit cohomology with lim¹ and discrete lattice quotients. Does not supply continuous cohomology of arbitrary A⁻ by fiat. |
| `PadicHodgeRegulators/README.md:507`, 556, open head | §§1.4 and 1.7: dual exponential with positive ordered adjunction, exp*(log χ_cyc)=1, and trace compatibility. The arithmetic Coleman comparison remains this package's target. |
| `ModularCurvesPartII/README.md:969`, 1201, 1756, 1784, open head | §§3.2,3.9,5.2–5.3: arbitrary composite-level compactifications and good models. |
| `ModularCurvesPartII/README.md:2959`, 2993, 3010, 3364, 3510, 3662, 4511, open head | §§9.9–9.11,12.1,13.2,13.7,16.6: geometric Hecke, mass, differentials and modular quotients. Exact mixed-disk, integral-congruence and good-model trace comparisons remain declared extensions. |
| `EllipticCurveModularity/README.md:1464`, 1598, open head | R29.5–R29.6: genuine parametrization and full rational elliptic modularity. Optimal good-prime Manin-unit application is not a second modularity theorem. |
| `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:76–468` | LT.0–LT.2: formal O-action, log, analytic comparison, Tate torsion, κ and Artin conventions. |
| Same design, lines 736,755,815,889,986,1059 | LT.4–LT.6: Honda sign and elliptic specialization, marked quotients and quasi-canonical descent. |
| Same design, lines 1122,1161,1199,1224,1260,1297,1334,1353 | All cited LT.7 and LT.8 slugs: fields, ring-class group, lattice neighbors, character data, quadratic directions, field/generator and sign comparisons. |
| Same design, lines 1378,1415,1451 | LT.9 formal traces, tame descent and trace square. Lines 1212 and 1436 leave distinguished modular points and their recurrence to this roadmap. |
| `packages/NonordinaryCMSpecialValues/design/README.md`, NCM.0–NCM.5; lines 619,637 | Canonical characters, early class, semilocal comparisons, root sign, Finis specialization; precise unramified coefficients and scalar/tensor injection. The local projection composite is not claimed there. |
| `packages/InertAnticyclotomicCMMainConjecture/design/README.md:40` | Actual downstream local inputs agree with this README's revised consumer list. |

ColemanPowerSeriesPartII's rejected package does not establish another active owner of the same work. The introduction explicitly identifies this roadmap as ColemanPowerSeries, Part II and identifies where the base stops. The LT and NCM contracts partition the foundational constructions from their arithmetic applications here. The generic scheme Riemann–Hurwitz theorem must likewise be imported as R01 specifies. No move of mathematics to a later supplier is proposed.

The board-package index was read before concluding anything about ownership. Searched all twenty indexed heads: the package READMEs of AnalyticNumberTheory (`310e834`), ArithmeticStatistics (`357e723`), AutomorphicCongruences (`b047dd3`), KatoEulerSystems (`5fb6ef4`) and LogicAndDefinabilityInNumberTheory (`3062436`), and the fifteen design READMEs listed below. The latter heads have a `design` directory rather than a package README; the initial 404s were resolved by reading that directory. All named open-roadmap heads were also searched through the supplied roadmap service.

KatoEulerSystems §7.5, lines 2015–2034, concerns good ordinary E/Q_p in the cyclotomic tower, not height-two inert signed units. AutomorphicCongruences' Katz/anticyclotomic contracts concern split ordinary primes; its Manin-period gap does not own the good-prime optimal Manin-unit application here. Its line 1021 Yager module is a trace limit of integers in an unramified tower, not the ramified multiplicative unit limit. PELModuliPartII's lines 68–110 define polarized strict unitary modules with signature and relative duality, importing the strict-module foundation; they do not own this local-unit/Kummer construction. HigherHidaAndColemanTheory lines 399–426 use Cartier-dual degree divisors on Siegel chains. SchemeAndStackFoundationsPartII lines 196–221 construct Bégueri resolutions from the existing Cartier dual, not a second duality or this formal division comparison. These possible object matches were opened and distinguished. No duplicate of this package's owned constructions was found.

| Board design searched, at `packages/<Name>/design/README.md` | Indexed head |
|---|---|
| ArithmeticLocallySymmetricSpacesPartII | `84a41ac` |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | `948c94c` |
| CrystallineCohomologyPartII | `84ea77e` |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | `80a66cc` |
| HigherHidaAndColemanTheory | `da88512` |
| LawrenceVenkateshMethod | `9ee7ac3` |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | `7e88c38` |
| PELModuliPartII | `d4bb48d` |
| PadicHodgeTheoryPartII | `6502997` |
| PadicLocalLanglandsForGL2QpPartII | `3e0777d` |
| RealSurfacePeriodIndex | `875bca4` |
| SchemeAndStackFoundationsPartII | `accb0a0` |
| ShimuraVarietiesPartII | `57dc0a4` |
| VStackSheavesAndLisseCategoriesPartII | `0987ba7` |
| VectorBundlesAndIsocrystalsPartII | `b58d862` |

### Pinned definitions and theorem hypotheses opened

These are file/line witnesses, not merely successful grep results. Native definitions were read to determine what they do and do not bundle. The README's seven named Mathlib declarations and twenty-two named Tau Ceti declarations all exist at the pins.

| Pinned file and line | Declaration or body checked; mathematical limit |
|---|---|
| `Mathlib/RingTheory/PowerSeries/Basic.lean:76`, 139 | `PowerSeries.coeff`, `constantCoeff`; native coefficient maps, no analytic convergence. |
| `Mathlib/RingTheory/PowerSeries/Derivative.lean:49` | `PowerSeries.derivative`; formal derivative over a commutative semiring, not evaluated convergence. |
| `Mathlib/RingTheory/PowerSeries/Inverse.lean:109` | `PowerSeries.isUnit_iff_constantCoeff`; ring hypothesis, actual constant term. |
| `Mathlib/FieldTheory/Galois/NormalBasis.lean:59`, 120,127 | Finite-dimensional binder, `IsGalois.normalBasis`, `normalBasis_apply`; finite Galois field representation, not an integral normal basis. |
| `Mathlib/RingTheory/LocalRing/Module.lean:299` | `Module.free_of_flat_of_isLocalRing`; commutative local ring, finite module and flatness. |
| `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99`, 192 | `unitFiltration`, `unitFiltration_one`; congruence kernel on native integer-ring units with local-field valuation/topology. The definition does not supply pro-p or scalar action. |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454`, 473 | `IsProP.module`, `continuousSMul_module`; commutative pro-p group and relevant compact/topological hypotheses. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | `completedGroupAlgebra`: compatible finite-quotient group-algebra families; arbitrary coefficient ring does not make it compact. |
| Same directory, `Module.lean:344`, 387 | `IsCompactModule.completedGroupAlgebraModule`, `continuousSMul_completedGroupAlgebraModule`; genuine compact continuous action, not a bare algebraic module. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean:273`, 292 | `WeierstrassCurve.formalPointHomAdicCompletion` and injectivity; height-one Dedekind completion and elliptic curve hypotheses. |
| Same directory, `Range.lean:158` | `range_formalPointHomAdicCompletion`; zero or `1 < Valued.v(xCoord)`. |
| Same directory, `KerReduction.lean:79`, 87 | `range_formalPointHomAdicCompletion_eq_kerReduction`, `formalPointAddEquivKerReduction`; actual reduction kernel, not any arbitrary complete local field. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271`, 331 | `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `cartierDual`; commutative base, finite locally free affine group schemes. No canonical self-duality of F[π^k] is included. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151`, 284 | `TateCohomology.H0IsoNormQuotient`, `HNegOneIsoNormKernelQuotient`; public names follow the internal namespace closures. Finite group, commutative coefficient ring. |
| Same directory, `Periodic.lean:346` | `Rep.FiniteCyclicGroup.periodicIso`; cyclicity essential, as the S₃ test shows. |
| Same directory, `HerbrandQuotient.lean:105`, 120 | Definition and total-cardinality zero case; infinite Tate groups do not give an ordinary positive cardinal ratio. |
| Same file, lines 196,206,380,482 | `herbrandQuotient_eq_one_of_finite`, `herbrandQuotient_eq_natCard_H2_div_natCard_H1`, `herbrandQuotient_eq_mul_of_shortExact`, `herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`; finite outer degree-minus-one terms or finite kernel/cokernel are retained where required. |

Generic native formal groups, elliptic formal points, completed group algebras and continuous cohomology therefore are not duplicated. Searches and opened definitions did not reveal a pinned arithmetic Lubin–Tate division tower, its local-unit norm limit/inverse twist, native Coates–Wiles maps or signed arithmetic carriers. The Z_p power-series coordinate in Tau Ceti is not the missing two-variable O-coordinate; the additional one-variable O-coordinate is, however, already stated by the main roadmap in R02.

### Supplier order and declared gaps

The prescribed dependency command completed successfully, with this exact output:

```text
depcheck: 48 roadmaps, 545 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver reported no missing cross-roadmap citation or backticked name; its result was treated as a search aid and the citations above were opened. Relevant order positions are SchemeAndStackFoundations 2, IntegralIwasawaTheory 31, ColemanPowerSeries 33, LubinTateFormalModulesAndQuasiCanonicalLifts 57, PadicHodgeRegulators 212, NonordinaryCMSpecialValues 213, this roadmap 214 and InertAnticyclotomicCMMainConjecture 215. Prospective consumers SelmerIwasawaCohomologyPartII and HeegnerPointEulerSystems are 240 and 251. R01 adds an earlier supplier and creates no upward edge.

All nine gap slugs and `needs` sentences match between the README and the plan. None has supplier `none`. Absence of a promised supplier extension was not counted as a defect. The following tests assess precision and minimality, not completion of the supplier's proof.

| Gap | Audit and discriminating instance |
|---|---|
| quadratic-coefficient-coordinates | Nonminimal: R02. One-variable γ↦1+T and generator 6 already belong to §4.5; the new product coordinate must reduce at S=0 to that map. |
| compact-coefficient-duality | Precise compact/discrete contract. For compact O, the Φ/O-valued dual has π-torsion of size 25; invariants correspond to dual of the closed relation quotient. Existing measure coefficient extension does not by itself provide this arithmetic limit/duality comparison. |
| general-unit-norm-control | Precise norm-limit carrier, maps, ideal and exceptional-character conditions. For K unramified quadratic at 5, the full completed multiplicative group has Z₅-rank 3; a cyclotomic norm quotient is Z₅ and its nontrivial tame projection is 0. Rank-two omega coinvariants have O-ranks 2 and 50. When Δ is trivial, there is no nontrivial ψ and that clause makes no false rank assertion. |
| formal-point-completion-realization | Precise comparison needed because the pinned map is on a height-one number-field completion. It asks to preserve Φ, its finite extensions, models and maps, not merely a field isomorphism. Reduction of a formal point must remain 0 and [π] must remain [−5]. |
| supersingular-trace-classes | Previous redundant mass and exceptional-j requests removed. New counts at 5 are 1,2,0 and at 7 are 1,0,2; the requested rational classes are not just counts of geometric invariants. |
| mixed-level-disk-comparison | Specific mixed model and disk comparison; N=27,32 and M=6,8 give p∤φ(M), with unit disk derivative. The broad existing good-model theorem alone does not identify this mixed fine family's disk. |
| good-model-hecke-comparison | Precise composite-level integral/geometric comparison. At p=5 the geometric correspondence has 6 subgroup quotients; the boundary trace uses 6, not 24, terms. |
| integral-congruence-comparison | Specific optimal differential/q-expansion and degree/congruence lattices at p∤N, beyond a rational correspondence. Unit cokernel comparison must force v_p(c_E)=0; rational equality alone permits c_E=5 and fails that test. |
| quadratic-class-number-upper-bound | Defined discriminants and constants, exact upper estimate; main H2.3 does not state it. At 53 its ratio to p is .99549409<1; at 47 it is 1.04135037>1, explaining the separate small-prime calculation. |

The long norm-control request is a single coherent theorem package about a defined functor and its transition maps, with quantified hypotheses and four precise conclusions; it no longer has F02's unspecified “control” or “torsion-corrected” object. No new scope defect or cycle was found in those conclusions.

### Shape, headline coverage and Lean

All nine layers end in Examples and Dependencies. The 18 definition/construction sections have API lists and at least three Check bullets: 0.1, 0.2, 0.4, 0.5, 1.1, 1.2, 1.3, 1.5, 2.1, 2.3, 3.1, 3.2, 4.2, 5.8, 5.9, 6.1, 6.2 and 8.5. R03 records the distinction between having three bullets and having three discriminating tests. All 50 numbered targets have source locators. The package has the requested headings and timeless mathematical scope, no computational algorithm, no copied passage found in the read sources, no route-specific good-prime restriction beyond the actual p≥5 theorem, and no route-dependent exclusion of 5,7,11. `metadata.toml` identifies math.NT; the seven manifest entries use consistent work keys and published locators.

The headline inventory in the README agrees with the twelve docstring entries in `Suggested.lean`:

| README headlines | Missing pinned carrier recorded in the docstring |
|---|---|
| 0.3,0.5 rank-two unit and quotient freeness | Arithmetic division tower, norm-compatible unit limit and inverse Tate twist |
| 1.1 height-two Coleman interpolation | Formal O-module, compatible division points and analytic interpolation |
| 2.2–2.4 formal norms and perfect Kummer duality | Actual point towers and their arithmetic Kummer comparison |
| 2.5 trace reciprocity | Those carriers and native Coates–Wiles derivatives |
| 3.6–3.7 annihilators and signed rank bounds | Arithmetic Fourier logarithms, derivatives and signed submodules |
| 4.5 optimal plus unit | Actual signed unit carrier and derivative |
| 5.9,6.3–6.5 primitive modular point and optimal trace system | Integral parametrization and Lubin–Tate/quasi-canonical point carriers |
| 7.2–7.3 minus cohomology and invariants | Signed arithmetic point module with its specified action/topology |
| 7.4 free quotient and kernel | Actual signed submodule and ambient quotient |
| 8.2 integral decomposition | Arithmetic rank-two anticyclotomic unit module and its signs |
| 8.3–8.4 every-character/generator nonvanishing | The same carriers and derivatives |
| 8.5 finite signed Kummer images | Signed points and actual Lubin–Tate torsion coefficients |

These require substantial arithmetic constructions, not a few simple predicates on currently supplied carriers. No statable headline was replaced by algebra on free variables or an assumed pairing. The file contains one `import Mathlib`, one module docstring and the correct empty namespace; there are no declarations, sorry'd data, extra imports, `set_option`, examples or padding.

Ran the prescribed `lake env lean` on the package's absolute `Suggested.lean` argument from the content checkout: exit 0, no output and **no warnings**. No Tau Ceti module build was needed. The declaration inventory is empty, so the requested `#check @name` inventory has zero entries; its scratch file was elaborated once with the same command, exit 0 and no warnings. There were no disappearing binders to repair. The one-tactic padding probe likewise has zero sorried theorems to try. No Lean process was left running.

## Not verifiable

- **Wiles78:** manifest status `uncertified`, settled by the brief. The original 1978 text was not read or requested again. The actual trace formula was checked in Rubin87 Theorem 5.3, p.412, line 322 and BKO21 §4, p.955, line 545.
- **Kato93:** manifest status `uncertified`, settled by the brief. Chapter II, Theorem 2.1.7 was not independently read. Its identification and use were verified at BKO21 lines 467–468 and the reference at line 965. This does not certify the original theorem's text.
- **OCR displays:** parts of Rubin87's trace display and Herbrand-lattice display are imperfect in extraction. Their surrounding theorem numbers, pages, hypotheses and transitions are readable; formula normalizations were cross-checked with BKO21 and the computations above. No claim of pixel-level transcription verification is made.
- **Uncompleted supplier contracts:** the LT and NCM design statements and all nine gap contracts were reviewed as interfaces, not as existing proofs. The consumer design was checked for its stated dependencies, not its eventual global proof.

## Source issues

- **Error** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace 2εp gives Honda type p+εX² and parameter −εp; it should be type p−εX² and parameter εp; affects a stated result.
- **Gap** in BKO21 at Lemma 5.2(ii), printed p.956: the source says its displayed bound ensures an unramified supersingular point for every p≥31; it should use the exact generic count, since the displayed bound at 47 is zero; affects the proof.
- **Misprint** in BKO21 at proof of Theorem 5.5(ii), printed p.959: the source says the outward lattice generators use scalar 1+ap^s; it should use 1+ap^sθ for O=Z_p⊕Z_pθ, producing distinct directions; affects the proof.
- **Misprint** in BKO21 at proof of Theorem 5.5(ii), printed p.959: the source says the boundary sum runs over Δ; it should run over Δ′, of order p+1; affects nothing.
- **Misprint** in BKO21 at §5.0.2, printed p.958: the source says the quasi-canonical degree is indexed by Φ′_s; it should be indexed by Ψ′_s; affects nothing.
- **Misprint** in BKO21 at §3.0.2 and proof of Theorem 3.4, printed pp.952–954: the source says l^m indexes both order and conductor of the nontrivial auxiliary character; it should use conductor l^(r+1) for exact order l^r; affects nothing.
- **Misprint** in BKO21 at Corollary 5.6, printed p.959: the source says the ambient quotient uses unstarred V∞; it should use V∞*/V∞*,−; affects nothing.
- **Misprint** in BKO21 at §6.0.2, printed p.962: the source says finite characters factor through Gal(Ψ_n/Ψ); it should be Gal(Ψ_n/Φ); affects nothing.
- **Error** in Rubin87 at Lemma 4.2, printed p.410: the source says continuity and a unit value force generation of a free rank-one Iwasawa module; it should require augmentation Λ-linearity, since coefficient extraction sends nonunit T to 1; affects a stated result.
- **Gap** in Rubin87 at proof of Lemma 5.1, printed p.411: the source says vanishing of the base-coordinate norm image kills the whole inverse limit; it should establish shrinking norms into every finite, possibly ramified, base; affects the proof.
- **Error** in Rubin87 at §2, printed p.407: the source says to use a p-adic Tate generator with Lubin–Tate parameter −p; it should use a π-adic generator, differing at level n by (−1)^n; affects the proof; corrected in print at BKO21 §2, footnote 2, printed p.948.
- **Misprint** in Haz77 at Theorem 1.3, printed p.306: the source says the integral part is the smallest integer at most r; it should be the largest integer at most r; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "aecb5008a63396012f21bc74f45b25d85f1261f1", "job": "REV-PKG-AnticyclotomicLocalUnits~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
