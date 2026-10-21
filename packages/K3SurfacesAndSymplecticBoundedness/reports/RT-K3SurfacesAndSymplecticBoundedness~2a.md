<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/563#issuecomment-6318668313 -->
Red team round 2 pass a (codex) of 6fbedb2

Verdict: needs_changes

1. **F01** (P2) The declared genus-one contract still contains the rejected definition

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3371`, gap `elliptic-surface-geometry`, `detail`: “A genus-one fibration f:X→C is a proper morphism from a smooth surface X to a smooth curve C with f_*O_X=O_C, and is relatively minimal”.

   **Claim:** These conditions specify the domain of the genus-one canonical-bundle and Jacobian comparisons. Round 1 r1a F01 was fixed in the README but survives in the top-level gap contract.

   **Witness:** The projection ℙ¹×ℙ¹→ℙ¹ satisfies the displayed conditions. Its generic fibre has genus zero and its canonical line restricts to O(−2), contradicting the subsequent genus-one formula. README:87 now correctly excludes it.

   **Exact repair text:** Replace that sentence inside this gap’s `detail` by: “A genus-one fibration f:X→C is a proper flat surjective morphism from a smooth integral surface to a smooth integral curve, with f_*O_X=O_C and geometrically integral generic fibre of arithmetic genus one; it is relatively minimal. The Euler and global canonical comparisons below assume C proper.” This changes only the permitted top-level `gaps` list.

2. **F02** (P3) Polarized-stabilizer Checks do not test preservation of the polarization

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:623`, the three Checks `polarized_identity`, `scalar_choices`, `power_stabilizer` for the definition at :615.

   **Claim:** These Checks discriminate the class stabilizer and its symplectic intersection.

   **Witness:** Replacing Aut(X,[L]) by Aut(X) for every L passes all three Checks. On the Wehler surface, σ₁ fixes H₁ but sends H₂ to 4H₁−H₂, so it must fail membership for H₂.

   **Exact repair text:** Add realized Checks, using the same Wehler surface and matrices as §5.4: “`polarized_wehler_positive`: H₁ is ample because its projection is finite; σ₁*H₁=H₁, so σ₁ belongs to Aut(X,[H₁]).” “`polarized_wehler_negative`: H₂ is also ample, but σ₁*H₂=4H₁−H₂≠H₂ (the Gram determinant is −12), so σ₁ does not belong to Aut(X,[H₂]).” “`polarized_symplectic_intersection`: σ₁ belongs to Aut(X,[H₁]) but not SymplecticAut(X,[H₁]), because its canonical scalar is −1 over ℂ.” These are geometric Checks until the geometric carriers exist; no surrogate Lean surface is needed.

3. **F03** (P3) Two Stacks page locators remain incorrect

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/sources.toml:427`: “0BCL, Lemma 44.13, p.105”; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3500`: “Lemmas 54.17.1–54.17.2 (0C5R, 0C5S), p.52”.

   **Claim:** These page numbers locate the cited results in the cached editions.

   **Witness:** `stacks-projective-morphisms line 4764` starts 44.13 on printed p.104; p.105 starts at line 4776. `stacks-surface-resolution line 2390` starts 17.2 on printed p.53. The README already gives pp.52–53 for the latter.

   **Exact repair text:** In the manifest locator replace “0BCL, Lemma 44.13, p.105, lines 4764–4777” with “0BCL, Lemma 44.13, p.104, lines 4764–4775”. In the `ruled-surface-two-forms` gap detail replace “(0C5R, 0C5S), p.52” with “(0C5R, 0C5S), pp.52–53”.

4. **F04** (P3) The new lifting and pencil targets share an incomplete dependency entry

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/README.md:895`, the single `*Needs:*` following both `IsK3.tameInvolutionLift` and `IsK3.symplecticInvolution_genusOnePencil`.

   **Claim:** This entry records the prerequisites of both distinct targets.

   **Witness:** README:893 begins “Apply `IsK3.tameInvolutionLift`”, but :895 does not list that target. Conversely, complex integral topology and Picard specialization belong to the pencil proof, not the lifting proof. The required per-target dependency entries are absent.

   **Exact repair text:** Put this entry immediately after the lifting proof at :883:

   “*Needs:* §2.3 `IsK3.noVectorFields`; §2.4 `IsK3.hodgeAndCrystallineRanks`; §2.5 `IsK3.formalDeformation`; §2.6 `IsK3.lineBundleDeformationDivisor`; §3.4 `IsK3.integralEtaleRanks`; §6.2 `IsK3.tameSymplectic_fixedPoints`; `gap:tame-equivariant-deformations`; `gap:crystalline-chern-derivative`; `gap:cross-realization`; SchemeAndStackFoundations §§4.1–4.6 and §4.10; CrystallineCohomology CR.7.3.”

   Replace :895 with:

   “*Needs:* §6.7d `IsK3.tameInvolutionLift`; §3.3 `IsK3.complexIntegralBetti`; §3.4 `IsK3.integralEtaleRanks`; §4.1 `IsK3.picardSpecialization`; §4.2 `IsK3.picardLattice`; §6.2 `IsK3.tameSymplectic_fixedPoints`; §6.0b `IsK3.genusOnePencil_of_rank_ge_five`.”

## Earlier findings: verification at this head

The identifiers below distinguish the two round-1 reviews; quotations are from the repaired package. Source locators are checked separately below.

| Earlier finding | Status | Repaired passage and witness |
| --- | --- | --- |
| r1a F01, genus-one hypothesis | **Partly repaired** | README:87 adds “geometrically integral generic fibre of arithmetic genus one”; README:91 excludes the ruled projection. The same false definition survives in the declared gap’s `detail`: S01. |
| r1a F02, integral torsion argument | **Repaired** | README:453: “If nx=0 for n>0” and “injectivity of c₁ gives nL=0”. For a quartic hyperplane x²=4 the hypothesis now fails, as required. |
| r1a F03, finite-flat trace misuse | **Repaired** | README:926: “Resolve the dominant rational map X⇢Y to q:V→Y”; README:928 names `brauerPullback_nonzeroTangent`. The degree trace uses proper coherent duality; README:937 retains the nonflat A₁ counterexample. |
| r1a F04, global cubic line | **Repaired** | README:1092: “descend to a Brauer–Severi projective bundle P_λ”; README:1094 identifies “Isom_S(P_λ,ℙ_S^(9d+1))”. Scalar ambiguity disappears after projectivization; README:1103 retains the nonsplit real example. |
| r1a F05, congruence examples | **Repaired, without compiler certification** | Suggested.lean:15 defines `firstCongruenceKernel`; :21 and :32 give proved examples at 3 and 2. The actual residues of −1 are 2 and 1 respectively, and −1≠1 in ℤ₂. |
| r1a F06, page locators | **Partly repaired** | sources.toml now locates Mukai at “187” and “218–221”, Artin (1.8) at “p.548”, and Stacks factorization at “pp.52–53”; README:1224 ends “50–53”. The old Stacks page remains in the gap detail: S03. |
| r1a F07, divisible Chern class | **Repaired** | README:385: “Divide by its maximal power pᵃ”; README:394 tests L=M^p. The normalization and both graded maps match deligne-lift line 516 through line 525. |
| r1a F08, Galois invariants | **Repaired** | README:490 separates “For a finite Galois extension K/k” from “For geometric classes use G_k=Gal(kˢ/k)”. The skew conjugate real-quartic lines at :499 distinguish the two groups. |
| r1a F09, Artin-one Checks | **Repaired** | README:918–920 gives actual Fermat quartics at 3, 7 and 5, with discriminants −9, −49 and height one respectively. The printed discriminant reversal is explicitly corrected. |
| r1a F10, binary groups | **Repaired** | README:175 and the matching gap needs say “binary tetrahedral, binary octahedral or binary icosahedral”. The A₄ involution obstruction is retained at :179. |
| r1a F11, geometric rank Checks | **Repaired** | README:537: “arithmetic rank is strictly smaller by Galois descent”. Skew conjugate lines with self-intersection −2 and mutual intersection 0 force nontrivial conjugation. |
| r1b F01, false modulo-two step | **Repaired conditionally on the declared supplier gap** | README:881 names `IsK3.tameInvolutionLift`; :893 uses eight algebraic anti-invariant classes and injective specialization to obtain rank ≥9. README:65 and plan.json declare the same new equivariant-deformation gap. The swap-matrix inference is no longer consumed. The repair report’s supplier-ownership reason is accepted, not re-raised. |
| r1b F02, missing order 14 | **Repaired** | README:746 includes 14; :750 includes A₁₃⊕A₆⊕A₁ with determinant 196; :759 computes 21+96+195=312 and both subgroup identities. README:765 still mentions only 11 and 15, but expressly applies the corrected §6.1a. |
| r1b F03, further Lean Checks | **Repaired, without compiler certification** | Suggested.lean:54 and :61 prove the rank-zero and unipotent controls; :117 and :126 test Wehler matrices; :154 and :158 test Mathieu values 24,8,3. No admitted example occurs. |
| r1b F04, unused manifest records | **Repaired** | The manifest contains no records `illusie-witt`, `gros-chern` or `liu`. Their removal neither removes a consumed theorem nor reopens a waived source. |

## Verified sound

Read all 1,232 README lines and all 162 Suggested.lean lines. The inventory is 60 numbered README target sections, including their subordinate interface laws and the additional lifting, specialization and projective-bundle targets; 23 bold supplier contracts; 18 Lean declarations (3 definitions, 9 theorems, 6 examples); and 213 bullet Checks. All 213 Checks were inspected mathematically; this does not mean 213 compiler tests. The three nondiscriminating stabilizer Checks are S02. All 15 earlier findings are accounted for above.

The source audit checked locator groups in all 23 readable source records, with the two page corrections in S03. Five other records have settled waived/uncertified status, listed below. Supplier inspection covered 15 roadmap owners, including the three open supplier heads, and ownership searches covered the five specifically supplied sibling heads. Declared gaps are accepted as conditional contracts, not as implemented theorems.

### Suggested.lean declaration and context table

All locations in this table are in `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean`. There are no ambient `variable` or `include` blocks. Every variable and nontrivial typeclass prerequisite appears in the declaration itself; all carriers here are small native types. The only import is `Mathlib`. The three admitted declarations are theorem propositions at lines 76, 86 and 96; no admitted data or example occurs.

| Line; layer; declaration | Variable and instance context | Instances tried; result; change |
| --- | --- | --- |
| 15; 4; `firstCongruenceKernel` | `ell : ℕ`, `[Fact ell.Prime]`, `n : ℕ`; native matrix units | n=0; n=1 at 2 and 3. Correct kernel, including the trivial rank-zero group; none. |
| 21; 4; first example | GL₁(ℤ₃), concrete prime instance | −1 reduces to 2, not 1; valid negative control; none. |
| 32; 4; second example | GL₁(ℤ₂), concrete prime instance | −1 reduces to 1, has square 1 and is not 1 in characteristic zero; none. |
| 54; 4; `rank0_kernel` | `ell`, prime instance, `A : GL(Fin 0,ℤ_ell)` | Empty index type has a unique matrix; proof eliminates a `Fin 0`; none. |
| 61; 4; `unipotent_two_term` | `m : ℕ`; matrices over ℤ₃ | m=0,1,2 gives off-diagonal 0,3,6. Square-zero off-diagonal yields the asserted formula; none. |
| 76; 4; `GeneralLinearGroup.oddCongruenceKernel_torsionFree` | `ell`, prime instance, `ell≠2`, n, A, identity reduction, `IsOfFinOrder A` | n=0; n=1; unipotent matrix; −1 at 2 excluded. Minimal entry valuation rises under an ell-th power; none. |
| 86; 4; `finiteSubgroup.reduction_injective` | Same prime/odd hypotheses; H subgroup; `[Finite H]` | H={1}; n=0; distinct elements with equal residue have finite-order quotient in kernel; none. |
| 96; 4; `finiteSubgroup.integral_reduction_injective` | n; H≤GLₙ(ℤ); `[Finite H]`; reduction to ℤ/3 | Rank zero; ±I; integral embedding into ℤ₃ retains invertibility; none. |
| 105; 5; `wehlerPullbacks` | `i : Fin 2`; integer matrices | i=0,1; column convention gives H₁ fixed by first and H₂ fixed by second; none. |
| 109; 5; `wehlerPullbacks_zero` | Closed integer-matrix identity | First column (1,0), second (4,−1); definitional equality; none. |
| 113; 5; `wehlerPullbacks_one` | Closed integer-matrix identity | First column (−1,4), second (0,1); definitional equality; none. |
| 117; 5; pairing example | `∀ i : Fin 2`; B=[[2,4],[4,2]] | Both SᵀBS=B; det B=4−16=−12; none. |
| 126; 5; product example | Closed integer-matrix expressions | S₂S₁=[[-1,−4],[4,15]], trace 14, determinant 1; opposite pullback order retained; none. |
| 136; 6; `mathieuCharacter` | `n : ℕ`, values in ℚ | n=0 gives 0 by total division, explicitly excluded from order interpretation; n=1 empty product gives 24; none. |
| 140; 6; `mathieuCharacter_one` | Closed rational equality | Empty prime-factor set, denominator 1; none. |
| 144; 6; `mathieuCharacter_prime` | q : ℕ, explicit `hq : q.Prime` | q=2,3,7; q=0,1 excluded; cast q nonzero follows from primality; none. |
| 154; 6; identity example | Closed rational equality | 24 rather than the nonidentity fixed-point counts; none. |
| 158; 6; prime-order example | Closed rational equalities | 24/3=8 and 24/8=3; none. |

No forced geometric headline is encoded through arbitrary substitute data. No additional easy geometric headline was identified on the pinned carriers: the required global canonical/cohomological, analytic, crystalline and moduli interfaces are still roadmap inputs. The existing matrix headlines retain the general prime and rank quantifiers promised in the README.

### README adversarial statement table

Section numbers refer to `packages/K3SurfacesAndSymplecticBoundedness/README.md`; each row includes that section's interface laws, proof plan and Checks. “None” means no further defect found, conditional on the named supplier contracts. Degeneracies outside a statement's domain were checked as exclusions, not silently substituted into a theorem over fields or K3 surfaces.

| Section; statement(s) | Instances and boundary tests | Result; change |
| --- | --- | --- |
| 1.1 `IsK3`, constructor, equivalence, canonical comparison | Empty scheme, disjoint union, abelian surface, smooth quartic, dimension one | Geometric integrality enforces nonemptiness; H¹ excludes abelian surfaces; trivialization is existential. None. |
| 1.2 isomorphism and field-extension iff | Identity, towers, purely inseparable extension | Smoothness descends fpqc; coherent sections of L and L⁻¹ descend triviality. None. |
| 1.3 projectivity | Imperfect field; smooth versus merely proper singular surface | Full regular-surface supplier retained. None. |
| 1.4 RR and contraction | L=O, L⁻¹, quartic hyperplane; characteristic 2; scaling volume form | χ=2, hyperplane square 4 and χ=4; alternating rank-two contraction remains invertible at 2. None. |
| 1.5 numerical and torsion kernel | O, torsion class, nonzero effective class against ample H | RR forces one sign effective; zero intersection with ample H forces triviality. None. |
| 1.6 quartics | Smooth quartic at 2; Fermat at odd characteristic; Fermat at 2 | Smoothness is required; the doubled Fermat quadric at 2 is excluded, not all characteristic 2. None. |
| 2.1 relative Picard and arithmetic points | Field; nonreduced test base; Brauer obstruction; missing section | Universal functions and sheafification retained; unramified does not become relative étale without flatness. None. |
| 2.1a infinite-height differential kernel | Nonzero vector field; infinite height; finite-height control | Contradiction input is not used as unconditional kernel nonvanishing. Rank computation precedes later K3 cohomology. Waived input below. |
| 2.2 closed regular one-forms | p=2,3; finite/infinite height | Both height branches present; V-separatedness used with its named supplier. None. |
| 2.3 no vector fields | p=2,3; characteristic zero; imperfect base | Closedness, Oda and contraction have the required descent and rational-point reductions. None. |
| 2.4 Hodge and crystalline ranks | H⁰,H⁴; degrees outside 0–4; p=2; imperfect k | Crystalline assertion restricted to perfect k; finite W-module reduction rules out torsion. None. |
| 2.5 marked deformation functor | Equal characteristic zero, mixed characteristic, dual numbers | Twenty parameters; coordinates noncanonical; H⁰(T)=H²(T)=0 are earlier inputs. None. |
| 2.6 line deformation divisor | L=O excluded; L=M^p; p dividing L² | Normalized crystalline class replaces the invalid primitive-mod-p shortcut; smoothness only on the stated good-degree locus. None. |
| 2.7 polarized lift | p=2; divisible polarization; ramified trait | Finite extension of W(k) allowed; no unramified-lift overclaim. None. |
| 3.1 analytic K3 predicate | Empty/disconnected manifold, complex torus, projective K3 | Compactness, connectedness, dimension and H¹ all explicit. None. |
| 3.2 GAGA essential image | Projective K3; nonprojective analytic K3 | Algebraizability iff projective embedding, not all analytic K3s. None. |
| 3.3 integral topology and Chern class | nx=0; quartic hyperplane; O(1) winding +1 | Correct torsion argument, integral c₁ and complex orientation; no factor 2πi in the lattice. None. |
| 3.4 integral étale cohomology | ℓ=p excluded; p=2 with ℓ odd; huge characteristic-zero field | Spread to finitely generated field before embedding into ℂ; ranks and cup trace compatible with integral comparison. None. |
| 4.1 Picard base change, Galois descent, specialization | K=k; purely inseparable extension; real conjugate skew lines; constant trait | Finite Galois and absolute Galois groups separated; specialization injective, not surjective. None. |
| 4.2 Picard lattice | O, hyperplane square 4, negative curve; nonclosed field | Form uses actual integer intersection; arithmetic positive direction survives; Q=L²/2. None. |
| 4.3 geometric rank and comparison | Real Fermat versus complex Fermat; algebraically closed extension | Geometric rank invariant; arithmetic rank allowed smaller. None. |
| 4.4 bounds and saturated cycle map | Rank 1,20,22; ℓ≠p | Torsion-free Tate-module cokernel; equal rank at 22 implies integral isomorphism. None. |
| 4.5 congruence theorem and depth identities | Rank 0, rank 1, ℓ=2, unipotent, coprime power | Odd-prime bound is for the general matrix theorem; finite subgroup assumption used. None; Lean table above. |
| 4.6 bounded Picard descent | Trivial Galois action; finite field; rational point; inseparable classes | Uniform bound is for rank; full integral descent only under stated extra hypotheses. None. |
| 5.1 symplectic predicate/representation | Identity, volume rescaling, inverse, noncommuting composition | Inverse pullback fixes representation direction; kernel independent of generator. None. |
| 5.2 polarized stabilizers | Full-Aut substitution; Wehler σ₁ and H₁,H₂ | Checks fail to test the defining restriction. S02. |
| 5.3 finite étale stabilizer | Wild p-subgroup, infinitesimal point, scalar line automorphisms | Class stabilizer removes scalar automorphisms; noVectorFields implies unramified, hence étale over k. None. |
| 5.4 infinite symplectic group and Wehler matrices | Two deck involutions, product, Gram determinant | Product trace 14 rules out finite order; each deck involution is nonsymplectic over ℂ. None. |
| 6.0 supersingular discriminant | σ=0, σ=11, p=2, rank below22 | Exceptional discriminant-length/parity argument includes dyadic case through declared gap. None. |
| 6.0a height inequality | h=1, h=10, impossible h=11, ρ=22 | h positive; ρ≤22−2h gives the required infinite-height implication. None. |
| 6.0b rank-five pencil | Rank 4 control; p=2,3; primitive nef isotropic class | Meyer uses dyadic local isotropy; quasi-elliptic branch retained. None. |
| 6.0c height plus pencil | No section; Jacobian; quasi-elliptic; ρ=21 | Canonical formula proves Jacobian K3; rank21 excluded without a universal Tate-conjecture premise. None. |
| 6.1 tame quotient and rank20 root lattice | Trivial G; tame SL₂ local groups; p=2; square determinant | Trivial G gives empty exceptional lattice; rank20 restriction excludes square determinant only on its domain. None. |
| 6.1a cyclic arithmetic | n=2,11,14,15; subgroup orders2 and7 inside14 | For14: a₂=a₇=a₁₄=1, weighted sum312, root rank20, determinant196. Corrected exclusion present. None. |
| 6.2 fixed-point table | Identity excluded; orders2–8; wild orderp | Finite reduced fixed scheme requires tameness; counts8,6,4,4,2,3,2 agree. None. |
| 6.2a wild fixed-locus alternatives | Empty, one/two points; κ=0,1,2; p=2,3 | Nonreduced quotient divisor allowed; singular contraction not assigned smooth cohomology. None. |
| 6.3 wild quotient | Free Enriques at2; rational and K3 branches | Enriques invariant dimension10 uses b₂, not an unsupported Picard equality. None. |
| 6.3a refinements and p-torsion | κ=0, κ=2; one-point rational quotient; p=7,11 | p>7 torsion-section assertion distinguished from the bound p≤11 for a general invariant pencil. None. |
| 6.4 wild-prime bound | Trivial subgroup; finite group with p dividing order | Cauchy supplies an exact-order-p element; all characteristic-p such automorphisms are symplectic. None. |
| 6.4a Picard faithfulness | Picard-trivial arbitrary automorphism; polarized finite-order reduction | Rank22 geometric hypothesis retained; separate rigidity source still waived. None beyond verification limit. |
| 6.5 étale faithfulness | Infinite-order automorphism; tame/wild kernel; nonclosed k | Polarization reduces the kernel to finite order before semisimplicity; all fields retained. None. |
| 6.6 universal bound | Characteristic3, characteristic5, identity group | Choose ℓ=5 at3 and ℓ=3 otherwise; finite subgroup and integral ranks supply injection. None. |
| 6.7d tame involution lift | Exact order2; p=3; p=2 excluded; L^p | Invariant tangent dimension12; normalized c₁ and invariant perfect pairing give a flat pair locus. New generic formalism declared as a gap. Dependency entries: S04. |
| 6.7d involution pencil | Identity excluded; integral swap matrix mod2; specialization | Eight anti-invariant algebraic dimensions plus ample class give ≥9. False source inference not reused. Dependency entries: S04. |
| 6.8 Artin-one predicate | Fermat at3,7,5; rank below22 | Discriminants −9,−49; finite height at5 gives a realized negative control. None. |
| 6.8a invariant-dimension calculation | G=1; orders7,21; nonflat A₁ quotient | Proper coherent trace on resolved map replaces nonexistent finite-flat quotient trace; exceptions have total invariant dimension6. None. |
| 6.9 Mathieu character | n=0,1,2,7; trivial group | Zero has no order meaning; identity dimension24 and nonidentity values match. None. |
| 6.10 characteristic-zero bound | Trivial group; M₂₀ of order960; huge field | Embedding follows after spread/base change; at least five orbits on24 letters includes the distinguished fixed letter. None. |
| 6.11 positive-characteristic tame bound | Artin-one exception; p dividing group order excluded | Bound10200960 retained on exceptional branch, sharper960 only under stated alternative. No realization of all candidate groups asserted. None. |
| 7.1 geometric primitivity | Zero, F, 2F on elliptic K3 | Zero excluded; saturation equivalence requires nonzero class. None. |
| 7.2 closed roots and open primitive locus | n=0 excluded; n=p=3; λ²=0; λ=0 | Root loci closed, primitive locus open; λ·H bounds square-zero divisibility. None. |
| 7.3 polarized families | d=0 excluded; nonreduced/non-qc base; nontrivial Brauer obstruction | Picard section rather than global line; étale local representatives and affine refinements retained. None. |
| 7.4 ample cohomology | m=0, negative t, p=2,3 | Vanishing only m>0; Hilbert formula all integer t. None. |
| 7.5 uniform embeddings | m=1 control, m=2,3; d=1,2; arbitrary base change | Cube rank9d+2 and projective dimension9d+1; family statement retains Noetherian base and actual line. None. |
| 7.6 Hilbert K3 locus | Singular fibre; same ranks but different ω class; nilpotent base | Canonical-class equality is scheme-theoretic, not equality of ranks. None. |
| 7.7 atlas and cubic projective bundle | Characteristic3 root; nontrivial stabilizer; real nonsplit quartic | Brauer–Severi descent and PGL torsor retain source identification; no global vector-bundle descent asserted. None. |
| 8.1 polarized stacks | d=0 excluded; primitive/nonprimitive; scalar automorphisms | Class-preserving arrows and finite-type quotient yield DM claim; no G_m inertia. None. |
| 8.2 separatedness/finite diagonal | DVR, ramified extension, nonruled special fibre | Volume form excludes ruled special fibre; polarized extension theorem is a declared gap. None. |
| 8.3 coarse spaces | Algebraically closed points versus finite-field points | Only geometric-class bijection asserted; forms not discarded. None. |
| 8.4 smooth locus | p dividing2d; characteristic zero | Good-degree smoothness claim does not exclude bad primes from the moduli construction. None. |
| 8.5 finite-field finiteness | Nontrivial forms; degree fixed; missing representative | Finite-field Brauer vanishing gives actual line and finite set of frames; coarse rational points alone not used. None. |

### Bold supplier-contract inventory

All 23 slugs occur both in the README's exact-contract section and in the plan's top-level `gaps`; all 23 `needs` sentences match verbatim. None has supplier `none`. These contracts extend named earlier owners rather than creating a consumer-to-supplier cycle. Their related comparison laws are treated as parts of the same mathematical interface, not unrelated bundled prerequisites.

| Gap slug | Hypotheses/boundaries inspected; result and change |
| --- | --- |
| `surface-projectivity` | Smooth proper geometrically integral surfaces over any field, including imperfect fields; full regular-surface source supports it. None. |
| `hypersurface-cohomology` | Ordered regular sequence, ample cuts, positive final dimension; two disconnected hyperplane fibres and zero-dimensional divisor distinguish both restrictions. None. |
| `oda-interface` | Perfect field, characteristic p>0, smooth proper scheme with rational point; algebraic closure supplies the point. None. |
| `surface-arithmetic-quotient` | Residue-weighted curve pushforward and field-degree factor checked; arithmetic and geometric Picard groups not identified. None. |
| `tame-linear-groups` | SL₂ rather than PGL₂; binary groups, p′ orders, characteristic zero; A₄ has too many involutions. None. |
| `elliptic-surface-geometry` | Generic genus1, wild fibres at2,3, torsion in R¹f_*O, Jacobian χ comparison, quasi-elliptic branch; plan detail: S01. |
| `artin-discriminant` | Rank22, p=2, discriminant length22, F_p-linear rather than k-linear injection; no scope loss. None. |
| `witt-formal-brauer` | H¹=H³=0, one-dimensional height dichotomy, finite-flat norm, birational invariance; no flatness assertion for quotient maps. None. |
| `crystalline-chern-derivative` | Formal smooth proper deformation over W(k), filtered comparison, derivative of the actual c₁; distinct from an unfiltered connection. None. |
| `cross-realization` | Smooth projective geometric variety; arbitrary automorphism characteristic polynomials; semisimplicity only at finite order. None. |
| `integral-topology` | Exponential exp(2πiz), integer kernel, δu signs, O(1) degree+1, pullback naturality. Primary locator uncertified, derivation inspected. |
| `tame-lefschetz` | Proper smooth projective, finite-order prime-to-p action; isolated reduced points contribute+1. Existing identity case consumed. None. |
| `surface-quotient-resolutions` | Wild finite quotient retained; normality, surface resolution, and comparison maps; no wild R¹π_*O vanishing. None. |
| `tame-quotient-singularities` | Tame SL₂ quotient, R¹π_*O=0, discrepancy zero, ADE intersection form; p=2 tame case included. None. |
| `quotient-transcendental-comparison` | Rational ℓ-adic quotient by divisor cycles; ℓ invertible, wild group permitted, exceptional contributions algebraic; no integral averaging. Primary locator uncertified. |
| `ruled-surface-two-forms` | Smooth proper surfaces; point blowup and ℙ¹-bundle fibre O(−2); plan locator: S03. |
| `mathieu-permutation-model` | Faithful 24-letter model; M₂₃ point stabilizer; correct orders244823040 and10200960. Abstract pinned presentations do not already give this model. None. |
| `mukai-eleven-groups-recognition` | Rational or compatible ℚ_ℓ representations, invariant dimension≥5, Sylow2 embedding; quaternion obstruction atℚ₂ only when2 divides the group order, hence p≠2. None. |
| `matsusaka-mumford` | Smooth proper polarized traits, geometrically nonruled special fibre; uniqueness and descent retained. Primary source waived. |
| `adjoint-positivity` | Full Reider–Terakawa numerical alternatives, quasi-elliptic/general-type exclusions, dyadic inequalities; characteristic-zero vanishing imported from existing owner. None. |
| `exceptional-mathieu-embeddings` | Abstract exceptional groups with extension structures, faithful embedding rather than K3 realization. None. |
| `rational-surface-cohomology` | Smooth projective unirational surface, invertible ℓ; H¹,H³ and divisor surjectivity; singular contraction not substituted. None. |
| `tame-equivariant-deformations` | Perfect field, |G| invertible, vanishing infinitesimal automorphisms for fixed-functor comparison; exact invariants, formal fixed locus, algebraization. Flatness of invariant polarization remains a local K3 target. None. |

### Source locator audit

The table counts 23 readable source-record locator groups. Entries identify the substantive passages checked; they are locators, not reproduced source text. The mathematical test table above records the associated hypothesis and normalization checks. No new missing text was requested, and settled waived/uncertified entries were not reopened.

| Source | Checked locators |
| --- | --- |
| `huybrechts` | lines133–183,305–380,405–511;1110–1132,1173–1183;3372–3407,3570–3585;7879–7888;11765–11788,11901–11908,12221–12231,12268–12290;13945–14054,14121–14138,14317–14342,14538–14550,15255–15275. Definitions, RR, analytic comparison, Wehler matrices, rank/base change and Fermat examples. |
| `rizov` | lines121–179,273–300,404–516,530–570,610–665,756–784,807–849,879–920,1023–1101. Picard sheaf, roots, stabilizers, embeddings, atlas and moduli claims; printed global-line and PGL-size shortcuts are not copied. |
| `dolgachev-keum` | Theorem2.1 line138; refinements lines160,218–242,287–312,353–394; tame quotient/cyclic arithmetic399–520; Mathieu/formal-Brauer/invariant calculations522–595,597–808; exceptional list833–880 and Proposition5.14 line1566. The false mod2 inference at643–647 is expressly rejected. |
| `keum` | lines120–128,268–341,767–815. Characteristic-polynomial domain, tame trace, all-characteristic faithfulness and quotient alternatives. |
| `lang-nygaard` | lines54–106. Oda sequence, no-vector-field reduction and closedness proof. |
| `mukai` | lines53–108,187–204,750–765,1503–1540. Theorems0.3,0.6,1.4 and group recognition; corrected printed page187. |
| `nikulin-symplectic` | lines1537–1624. Russian-original §5, Euler identity and cyclic cases; no claim of matching translation numbering. |
| `oda` | lines2480–2520, especially Corollary5.12 at2490. Perfect smooth proper/rational-point domain. |
| `nygaard-closedness` | lines270–305, especially Corollary2.7 at286. p-divisible formal-Brauer implication. |
| `wild-cyclic` | lines14–44 and408–430. Fixed-locus alternatives and quotient-divisor content. |
| `deligne-lift` | lines29–160,250–335,495–535. Ranks/deformations, flat polarized divisor, derivative and primitive crystalline normalization. |
| `terakawa` | lines138–200,245–275,345–404. Instability/extension, vanishing and adjoint-separation hypotheses. |
| `artin-supersingular` | lines40–55,192–222. Height inequality, elliptic rank22 and Jacobian passage; Lemma1.8 is on p.548. |
| `rudakov-shafarevich-inseparable` | lines438–497. Vector-field unirationality and rank consequence. |
| `shioda-unirational-primary` | lines52–55,98–147. Unirational surface cohomology and divisor comparison. |
| `artin-mazur-formal` | lines391–416,658–685,808–821,880–950. Dieudonné rank, principal units, cohomological realization, prorepresentability. |
| `sga2` | lines4277–4287. ExposéXII Corollary3.5, connectedness with the required depth/positive-dimension hypotheses. |
| `stacks-surface-resolution` | lines289–295,1880–1908,2274–2399. Blowup cohomology, resolution, contraction, projectivity and factorization. Residual plan page: S03. |
| `liedtke-mckay` | lines609–629,650–662,786–815. Linearly reductive SL₂ quotients and ADE resolution. |
| `stacks-relative-ample` | lines1253–1327. Scheme criterion and relative ample descent; actual invertible sheaf required. |
| `liedtke-surfaces` | lines749–767,1326–1335. Quasi-elliptic characteristics and purely inseparable ruled domination. |
| `stacks-projective-morphisms` | lines4229–4238,4633–4640,4688–4692,4764–4775. Distinct projectivity conventions and qcqs global criterion; printed page correction S03. |
| `enriques-one` | lines17528–17594,18458–18483,18646–18657,18799–18817. Canonical formula with torsion/wild terms, Jacobian, χ and fibre types. Encoding limitation below. |

### Suppliers, pins, ownership and direction

Pinned checkouts were identified by commit, not their default branches: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Supplier inspected | Verifiable declarations/sections and relevant boundaries |
| --- | --- |
| Mathlib at the pin | `SmoothOfRelativeDimension.smooth`, `IsProper`, geometric integrality and field-base-change instances; `Matrix.GeneralLinearGroup.map`/`map_apply` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:187`; `PadicInt.toZMod`, `ker_toZModPow`, `ext_of_toZModPow` in `Mathlib/NumberTheory/Padics/RingHoms.lean:300`; nonzero-entry valuation theorem in `Mathlib/NumberTheory/Padics/PadicIntegers.lean:472`; Witt DVR/residue equivalence; `littleWedderburn`; `Nat.Prime.primeFactors` in `Mathlib/Data/Nat/PrimeFin.lean:94`. No existing general matrix torsion theorem found by object search. |
| Tau Ceti at the pin | Native differential/rank and `LineBundleClass` APIs; rational-ambient `IntegralLattice.ofSubmodule` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:174`; `brauerCohomologyEquiv` in `TauCeti/Algebra/CrossedProduct/Comparison.lean:267`; full-universe `subsingleton_brauerGroup_of_finite` in `TauCeti/Algebra/BrauerGroup/Trivial.lean:247`. SL₂ reduction and abstract Mathieu presentations do not supply the missing GLₙ torsion theorem or faithful24-letter models. |
| `SchemeAndStackFoundations` on main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:694` reflexive extension; :2657 wild-compatible projective finite-group quotient; :3642 smooth-group comparison; :3872 field comparison; :3880 finite-Galois-covering Hochschild–Serre; :4352 CM Serre duality; :4406 coherent duality. Field/smooth/proper/finite hypotheses used here are within those domains. §§4.1–4.6,4.10,4.14 and5.9–5.10 own the declared general deformation/Hilbert/intersection inputs. |
| `ComplexComparisonPartII` at `c9ccfac82885efe9b0ba23cc8df12ddb5512af37` | `TauCetiRoadmap/ComplexComparisonPartII/README.md:1665` projective GAGA; :1681 proper pushforward; :1690 proper equivalence; :1739 dictionaries; :1974,:1992,:2010,:2028 Picard representation, separation, Brauer obstruction and finite Cartier-dual torsors; :4172,:4343 Artin comparisons. Universal-functions and geometric-integrality conditions match the K3 applications. |
| `CrystallineCohomology` at `2c8b22a1737d1660f1baf397926b41e90139a80d` | CR.2.3,CR.3.2–3.3,CR.4.1,CR.4.6–4.7,CR.3:duality.1,CR.7.3 occur at the cited version. `TauCetiRoadmap/CrystallineCohomology/README.md:6584` explicitly supplies `Crystalline.wittCohomology_V_complete` for smooth proper schemes over perfect fields. Generic formal-Brauer and c₁-derivative extensions remain declared gaps. |
| `AlgebraicModuliForArithmeticGeometry` at `98fd03823a4797777f298cf65d50ff0cafb51c43` | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:9489`,:9503,:9511,:9541 supply the named Picard/base-change/kernel/section-split targets; :10270 supplies characteristic-zero adjoint vanishing with nef-big and SNC fractional-support hypotheses. Integral ample lines satisfy these. |
| Other main owners | `JacobianChallenge` A,C,D; `AlgebraicVectorBundles` L0A–L0C; `StableReduction` Layer2 (polarized effective descent at README:395); `IntegralLattices` active1,5,6 and completed1–5; `GlobalQuadraticForms` §5.5; `QuadraticFormInvariants`6D (rank≥5 isotropy at README:2082); `EtaleCohomologyFoundations` F.0,F.2,F.4–F.6; `AlgebraicTopology` Stage6; `MorseNovikov` N6 (Lefschetz construction at README:499); `ComplexKahlerGeometry` K3–K6; `CFSGStatement` as the named owner of its new PartII gaps. No later supplier was introduced. |

Ownership searches in main active/completed roadmaps found abstract K3-lattice work in `IntegralLattices` and a quartic deformation example in `AdicSpacesPartIII`; the package imports abstract lattice theory and does not recommission those owners. The five specified external sibling heads were searched: `CohomologyComparisonsPartII`, `ColemanIntegrationPartII`, `QWittVectors`, `ErdosProgressionPowers`, `ArithmeticDynamics`. The K3 occurrence in `TauCetiRoadmap/ArithmeticDynamics/README.md:2233` is a height example, not ownership of these geometric or boundedness targets. No sibling-number drift or duplicate owner was found in these searches.

The requested mechanical dependency command returned exactly:

```text
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The order places this roadmap after `ComplexComparisonPartII`; direct supplier citations were also checked against main/earlier status. No ownership move is required by this review. The missing local target edge is S04, not an upward roadmap edge.

The base-to-head diff contains seven changed files, all within `packages/K3SurfacesAndSymplecticBoundedness/`. README/docstrings contain no pull-request-number narrative, computational algorithm target, `set_option`, admitted data, `True` stand-in or declaration using `lemma`. The source title containing “algorithm” is a bibliographic citation to a surface comparison, not an algorithm implementation target. Review/report metadata inside the package is not treated as README mathematics.

## Not verifiable

- Lean elaboration and elaborated `#check @...` types: no Lean command or build was run, as required by the read-only brief. Native signatures and proof terms were inspected at the pins; compiler success is not asserted.
- `nygaard-vectorfields`, Lemma3.3: waived in the manifest. Its use in §2.1a remains conditional; the Lang–Nygaard application was checked, not substituted for the unavailable primary proof.
- `rudakov-shafarevich`, §8 Proposition3: waived. The distinct readable inseparable-morphisms article does not certify this Picard-faithfulness theorem. The Keum application and rank22 restriction were checked.
- `matsusaka-mumford`, Theorem2: waived. Rizov's application was checked; the original theorem was not independently read.
- `shioda-transcendental`, Proposition5: uncertified published locator. Keum and Dolgachev–Keum applications were read, but do not independently certify every general finite-group hypothesis of the primary proposition.
- `arapura-chern`, §7.5 Lemma7.5.1 and Definition7.5.2: uncertified published locators. The explicit exponential/Čech normalization argument was checked independently; the printed primary locators were not certified.
- The `enriques-one` extraction has broken mathematical font encoding. The theorem numbers, surrounding hypotheses, canonical/Jacobian comparisons and visible numerical formulas were cross-checked, but this audit does not certify every OCR symbol in the long extracted formulas.
- Declared supplier contracts are promises of later implementation. This review checks their ownership, scope, declaration matching and mathematical source support, not completion of their Lean developments.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6fbedb25e435c0b9d85d36c6ec0853d3750a02ef", "job": "RT-K3SurfacesAndSymplecticBoundedness~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
