<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6782383506 -->
Review (codex) of a53e5b1

Verdict: needs_changes

1. **F01** (P1) The strong Banach dual does not carry the claimed continuous action

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:47`: “topology of uniform convergence on bounded sets”; line 596: “H¹_ét[M] ≅ (St^cont⊗δ_G)′_b⊗δ”. The convention propagates through §§4.10–4.14 and Layer 6. `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean:21` repeats the strong Banach-dual terminology.

   **Claim.** The continuous Banach dual, endowed with its strong topology, supplies the topological G-representation in the étale multiplicity comparisons. This is false even for the special type with δ=1.

   **Witness.** In St^cont, let μ=δ₀−δ∞. Then u(pⁿ)μ−μ=δ_(pⁿ)−δ₀ has strong-dual norm 1 for every n, although u(pⁿ)→1. CDN23 line 184 specifies uniform convergence on compact sets instead.

   Here μ annihilates constants and hence belongs to the dual of C(ℙ¹(ℚ_p),L)/L. A clopen indicator separating 0 and pⁿ has quotient norm at most 1 and evaluates to ±1 on the difference; the upper bound is also 1. Thus the orbit map is not continuous in the strong topology. In contrast, this equibounded sequence of functionals tends to zero on every continuous function, hence uniformly on compact sets by a finite-net argument. This works at p=2 and p=3 as well.

   The distinction is explicit in CDN23, introductory footnote 8, printed p. 4, lines 182–184. CDN20 §1.3.2, p. 16, lines 633–644 uses weak Banach duals in its Steinberg discussion. The supplied Banach/Schikhof foundation also retains a compact topology on its integral dual: `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:228`, §0.1, open PR #1312. This is a topology mismatch, not a missing construction in that supplier.

   **Repair.** Separate the strong dual of locally analytic compact-type spaces from the continuous Banach dual with the compact-open/Schikhof topology used by CDN23. Use the latter in the Banach and étale multiplicity statements, in Π*(ρ) and the factorisation, and in the module docstring. Specify the topology on the G-bounded subspaces in §4.10 when identifying them with Banach duals. Retain strong duals where the analytic/smooth comparison actually requires them; do not globally replace every dual. Add the displayed Dirac-orbit Check. With the repaired topology its limit is 0, whereas the discarded norm topology gives the constant norm 1, so the same instance verifies the repair.

2. **F02** (P1) A coefficient-dual summand has a socle, not the asserted ordinary fibre

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1072`: “a rank-two A-family Π*(ρ)⊗ρ⊗Ǎ whose fibre at each closed point x of A is Π(ρ_x)′_b⊗ρ_x”. Line 1064 also needs the meaning of multiplicity at x made explicit.

   **Claim.** The entire cohomological summand, including the continuous coefficient dual Ǎ, has the stated nonzero tensor fibre. This confuses a fibre with the subspace annihilated by a maximal ideal. It also calls the whole representation rank two, although only its Galois factor has that rank.

   **Witness.** For A=L⟨T⟩, its continuous dual is bounded sequences. T acts by left shift, with kernel L·(1,0,…) and cokernel 0. Thus Ǎ/TǍ=0 but Ǎ[T]=L·ev₀. CDN23 line 2839 uses the latter operation.

   Indeed Q(f)=(f−f(0))/T is continuous, and for any functional ℓ, ℓ′=ℓ∘Q satisfies Tℓ′=ℓ. Therefore T acts surjectively on P⊗_AǍ for every A-module P, and its ordinary fibre at T=0 is zero. Its annihilator construction, unlike the ordinary fibre, detects evaluation at 0. The same division calculation applies to bounded analytic power series on the open disc, the ring model relevant to the type families.

   CDN23, proof of Théorème 5.24(ii), printed p. 74, lines 2837–2851, computes m_(B,M)[𝔪_x], and identifies the fibre of its continuous dual with the dual of that annihilator. It does not compute the ordinary fibre of m_(B,M). In contrast, the fibre assertion for Π*(ρ) alone at README lines 966 and 980 is supported by CDN23 lines 181 and 2606–2614 and should remain.

   **Repair.** Rewrite the Layer 6 example and the closed-point Check using the 𝔪_x-annihilated multiplicity, or equivalently the fibre of the appropriate dual family followed by dualisation. Keep the κ(x)/L dual or its trace identification when κ(x)≠L. State rank two only for ρ in the supercuspidal case, not for Π*(ρ)⊗ρ⊗Ǎ. Preserve the genuine ordinary-fibre statement for Π*(ρ). At x=0 in the test above, the repaired operation gives L·ev₀, while the rejected operation gives zero.

3. **F03** (P2) The level dictionary loses the arithmetic Frobenius permutation

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:45`: “Σ₀ is M^p_0” and “Σ₀ consists of two copies of Ω”. Ω was defined over ℚ_p at line 43, and the same paragraph specifies the ℚ_p-model. See also lines 1155 and 1194.

   **Claim.** The identified arithmetic level-zero space is the split disjoint union of two half-planes over ℚ_p. The two-copy description is valid after splitting the geometric components, not with the arithmetic descent asserted here.

   **Witness.** Frobenius swaps the two height classes. Its invariants in H⁰_ét=L² are {(a,a)}, dimension 1; two split ℚ_p-copies give dimension 2. CDN23 lines 223–235 retain precisely this descent action.

   The central scalar pI₂ translates height by 2; Frobenius translates by ±1. Thus passage to height modulo 2 leaves a nontrivial permutation. The cited supplier explicitly retains it: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4970`, §12.19, PR #999. The other cited supplier independently computes the same discrepancy: `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:765`, §5.4, PR #1757. Over the unramified quadratic extension the invariant dimension is 2; over a ramified quadratic extension it remains 1. In characteristic-zero coefficients, Frobenius sends (1,−1) to (−1,1), also when p=2.

   **Repair.** State the two-copy decomposition after base change to a field splitting the components, and retain the Frobenius swap in the comparison between the DLB and CDN models. If different descent conventions are used for the DLB model, specify their transport before identifying the arithmetic models. Explicitly put the componentwise examples at lines 1155 and 1194 over that splitting field; §7.5 already allows such an extension. Add the residue-degree Check above. The repaired convention gives dimensions 1,2,1 over ℚ_p, its unramified quadratic extension, and its ramified quadratic extension respectively, matching both suppliers.

4. **F04** (P3) The weighted cokernel is not four copies of the smooth representation

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1105`: “π′⊗M*_dR⊗Sym¹, which is four copies of π′”.

   **Claim.** At k=1, the weighted cokernel is four copies of π′ as the G-representation under discussion. The dimension of Sym¹ has been retained but its nontrivial algebraic action has been discarded.

   **Witness.** With trivial central character on π, pI₂ acts on π′⊗M*_dR⊗Sym¹ by p. It acts on (π′)⊕4 by 1. The paragraph itself computes the required scalar p on the middle term.

   **Repair.** Delete the four-smooth-copies assertion. Say that, after a basis choice for the two-dimensional trivial G-factor M*_dR, the cokernel is two copies of π′⊗Sym¹, with the standard algebraic action retained. Add the central scalar test. On pI₂ the repaired object has scalar p, as required by the BGG row. This is independent of the correctly repaired determinant on its preimage.

5. **F05** (P3) The special-type Check reverses the dual twist

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1000`: “Replacing η by ηχ twists … the G-factor by χ_G”.

   **Claim.** Twisting η by χ positively twists Π*(ρ) by χ_G. But line 988 defines that factor as (St^cont⊗η_G)′, with the contragredient action of line 47.

   **Witness.** Take p=7 and an order-three unit character χ with χ(7)=1. If χ(a)=ζ₃, then at aI₂ the actual dual twist is χ(a²)⁻¹=ζ₃; the stated twist gives ζ₃²≠ζ₃.

   This character preserves the p-central condition. A quadratic character would hide the error. The defining special-type formula agrees with CDN23 §5.2, printed p. 66, lines 2553–2557; the erroneous Check does not agree with that definition.

   **Repair.** Replace the G-factor twist by χ_G⁻¹. Keep χ on the Galois factor and χ∘Nrd on JL(M), and transport the Steinberg block by the residual character when it changes. Add the cubic-character Check: the corrected G-factor has scalar ζ₃ at aI₂, equal to the direct computation from its defining dual.

Five findings: two P1, one P2 and two P3. The package's mathematical scope and Part II ownership can be retained. The defects concern the topology on Banach duals, specialisation of a coefficient dual, arithmetic descent, and two representation-theoretic Checks. No package source file was edited.

## Verification of the previous repairs

Locations below are in `packages/PadicLocalLanglandsForGL2QpPartII/README.md`, unless another file is named. The previous review's computed table covers all 51 numbered targets. I reused its unchanged computations only after comparing the statements; I reread the repaired passages, the seeded sample, the headline targets and the relevant source text. The table later in this report records new computations and the computations relevant to those repairs. A repaired finding below means that its original witness has been addressed; it does not certify every other assertion in that paragraph.

| Previous finding | Repaired passage | Status and verification |
|---|---|---|
| R01: coefficient tensor and rational differential image | Line 649 uses `⊗̂_L`; line 696 uses `d(O[M]^(G_ℚ_p))`. | Repaired. For a quadratic coefficient field, tensoring two one-dimensional L-spaces over L has L-dimension 1, whereas tensoring over ℚ_p has dimension 2. The rational image is also retained at line 776. |
| R02: degree-zero vanishing for reducible representations | Line 473: “smooth absolutely irreducible finite-dimensional ρ”. | Repaired. The negative control 1⊕1 at line 483 has nonzero multiplicity in constants; an absolutely irreducible representation of dimension at least two cannot occur in a sum of characters. |
| R03: determinant in the weighted preimage | Line 1100: “Π(Δ_(k+1,ℒ))′_b⊗det^k”. | Repaired. At k=1, a=p, both the middle term and the preimage have central scalar p; the untwisted preimage has scalar p⁻¹. New R04 below concerns a different claim in the same Check. |
| R04: obsolete supplier labels | Lines 100 and 122 cite “§§2.2–2.3” and “§§0.3 and 0.5”. | Repaired in the available supplier copies. These headings contain the radius/enveloping and differentiated/distribution actions; the obsolete ND and LR labels do not recur. See the head-availability limitation below. |
| R05: continuous Galois cohomology comparison | Line 135: “What PadicHodgeTheory must provide (gap:continuous-galois-tensor-comparison)”. | Repaired by a declared contract, consistently present in `design/plan.json`. The repair report's decision that the missing supplier proof is not actionable here is sound and is not re-raised. |
| R06: shell equivariance | Line 317: “φ(p^ja) = σ_a(x)”. | Repaired. At p=2, x=i, σ₋₁(x)=−i, so a constant shell fails whereas the revised shell transforms correctly. The cyclotomic level restriction handles p=2. |
| R07: tree distance | Line 484 uses “distance 2”. | Repaired. The lattice comparison has elementary divisors 1 and p², giving distance 2, not 1. |
| R08: p versus the coefficient uniformiser | Line 871 uses “O_L/p[G′]”. | Repaired. If ϖ²=p, O_L/p has length 2 and ϖ is nonzero in it; its composition factors are k_L. This is not O_L/ϖ. |
| R09: inputs outside the p-central sector and zero objects | Lines 551, 587: “M ∉ ΦNᵖ”; line 588: “no parameter in its domain”. | Repaired. For χ(p)=1+p the geometric multiplicity is zero but the intrinsic period term is nonzero. At level zero there is no supercuspidal parameter. The zero Iwasawa class at line 1140 is not a zero representation. |
| R10: recurrence and first cohomology | Line 203 uses “f_(h+2)−f_h = a_h”. | Repaired. Recursion separately on even and odd integers solves every right-hand side: cokernel 0, although the kernel has two independent parity constants. |
| R11: level zero | Line 45: “K_D(0) = O_D^×”; positive levels use “1+ϖ_D^nO_D”. | Repaired as a subgroup definition. At p=2,3 the first deck group has order 3,8, whereas the subsequent kernels have p-power order. New R03 below concerns the descent of the resulting level-zero space. |
| R12: missing weighted headline inventory | `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean:38` names “The weighted realisation and BGG row”; line 45 names the first-cover comparison. | Repaired. Both are explicitly listed as not statable, with the missing geometric and representation carriers. |

## Verified sound

### Extent, principles and shape

I read all four package files, the previous review and repair report, the package index, the overlap report, the citation leads and the plan's gap declarations. The README has 51 numbered targets in eight layers, with 51 Needs lines, eight Examples subsections and eight Dependencies subsections. Definitions carry prose APIs and at least three Checks; the new false Checks are listed above. The ordering is justified by the mathematical dependencies: refinements and realisation feed geometric multiplicities; integral block decomposition and type families feed arithmetic factorisation. I found no layer named after a source chapter, instruction to follow a source's exposition, executable algorithm, copied source passage, target-number catalogue or process narrative in the package text.

The Part II boundary is explicit. The base correspondence, coordinate operator, analytic quotient, abstract line independence and conditional trivial-central-character comparison remain owned by the base. Part II adds embedded equality, covariance, topological irreducibility, discharge of global hypotheses, the extension to p-central supercuspidal types, and the subsequent cohomological consequences. The restriction to GL₂(ℚ_p) is tied to the correspondence and type-ring inputs. The source's p>3 hypothesis is retained for arithmetic factorisation; it is not silently imposed on the geometric results or their p=2,3 Checks. Non-p-central intrinsic types are retained in the dictionary rather than falsely declared zero.

The three declared gaps have matching slugs and named earlier suppliers in the README and `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`:

| Gap | Exact use and ownership |
|---|---|
| fixed-radius-divisibility | README line 88; PadicLocalLanglandsForGL2Qp §6.9. Requires a common admissible-radius lattice on both charts for the intersection argument. Full Robba-ring t-divisibility does not provide it. |
| cuspidal-projectivity-coefficients | README line 147; SmoothRepresentationsOfLocalGroups §SR.3.2. Extends the supplied complex-coefficient splitting to the specified characteristic-zero L category with fixed central character. |
| continuous-galois-tensor-comparison | README line 135; PadicHodgeTheory §4.4. Specifies the continuous H¹ comparison, trivial Banach factor, Hausdorffness and limit/differential compatibility needed in §4.5. The Sen-realisation statement alone does not supply it. |

These are precise missing interfaces, not unowned prerequisites or duplicate work. Their absence from suppliers is not a finding. Acceptance after repair would remain conditional on them.

### Computed adversarial table

“Pass” below means that the specified instance and the stated hypotheses agree; it is not a proof of the target. Untouched targets also retain the earlier review's computed rows. The tests include each seeded target, the headline results, all repaired patterns and every new finding. Inapplicable cases are excluded by actual domains: L is a finite extension of ℚ_p, p is prime, supercuspidal parameters have rank two, and equal-characteristic or zero coefficient rings are not admitted by these statements.

| Target / convention | Instances tried | Computed values on the compared sides | Result / change |
|---|---|---|---|
| §0.1 levels | p=2,3; n=0,1,2 | K_D(0)=O_D×; first deck orders p²−1=3,8. The expression 1+O_D contains 0 and is not that group. K_D(2r)=1+pʳO_D for r≥1. | Repaired level indexing passes. |
| §0.1 arithmetic model | Level zero, residue degrees 1,2 | Frobenius on height mod 2: 0→1→0. Invariant dimensions 1,2; a split ℚ_p-model gives 2 already at degree 1. | R03. |
| Actions and duals | f=z, inverse pullback | u⁺z=−1, a⁺z=−z, a⁻z=z, u⁻z=z². A scalar χ on a space gives χ⁻¹ on its dual. | Formula passes; R05 violates the last rule. |
| Tate and period conventions | ℚ_p(1) | t⁻¹e lies in Fil⁻¹, not Fil⁰; φ=p⁻¹, and the shift [1] multiplies by p, giving 1. | Pass. |
| §§0.1–0.2 p-central exclusion | χ(p)=1+p, p=2,3 | Central character values 9,16 are not 1; geometric multiplicity=0, intrinsic nonzero rank-two period space≠0. | Repaired exclusion passes. |
| §0.4 recurrence | Arbitrary sequence a_h on ℤ | Solve f_(h+2)=a_h+f_h independently on both parities: cokernel 0, kernel dimension 2. | Repaired Check passes. |
| §§1.1–1.5 P-finite shells | p=2, x=i; two unit arguments | σ₋₁(i)=−i, not i. φ(pʲa)=σ_a(i) gives σ_bφ(pʲa)=φ(pʲba); a constant shell fails. | Repaired equivariance passes. |
| §1.6 differential residue | 1 paired with t⁻¹dt; tN⁺ | Residue 1 in the first case; residue 0 against regular dual coefficients in the second. Annihilator is tN⁺, not the smaller t²N⁺. | Pass with source correction. |
| §1.6 normalised trace | 1 through a cyclotomic step of degree p | p⁻⁽ⁿ⁺¹⁾Tr(1)=p⁻⁽ⁿ⁺¹⁾p=p⁻ⁿ. Without the normalisation the values differ by p. | Pass. |
| §1.7 duality and smoothness | Single shell; unipotent with bx=p⁻¹ | The pairing has one contributing summand, rather than a divergent series. exp(tbx)−1 has first coefficient bx; at the cyclotomic constant term ζ_p−1≠0 (−2 for p=2). | Pass; smoothness requires the stated annihilation condition. |
| §§2.3–2.4 irreducibility and weight change | k=1; scalar aI₂ | Π^an has a nonzero smooth subobject; it is not the irreducible quotient. In Π(M,−1)⊗det, central factors a⁻² and a² multiply to 1. | Correct quotient and twist; no inference of irreducibility of Π^an. |
| §§3.1–3.3 geometry | ρ=1⊕1 versus absolutely irreducible dim≥2; adjacent lattices | Hom(1⊕1,L)=L², whereas a higher-dimensional irreducible has Hom to characters 0. Elementary divisors (1,p²) give tree distance 2. | Both prior repairs pass. |
| §4.2 Steinberg | μ=δ_a−δ_b versus δ_a | Total masses 0 and 1; residues of dlog((z−a)/(z−b)) are +1,−1. Only the first functional descends modulo constants. | Algebraic dual description passes. |
| §4.2 and Banach headlines | μ=δ₀−δ∞, g_n=u(pⁿ) | Strong norm of g_nμ−μ is 1; compact-open limit is 0. Continuous group action requires the latter topology. | R01. |
| §4.4 period multiplicities | V=0; V=L; a period-line representation | H_C(0)=0; H_C(L)=L⊗F, L-dimension [F:ℚ_p]; H_M(V_(M,ℒ)) has L-dimension 1. | Pass with L⊗F retained. |
| §4.5 Galois multiplicity diagram | [L:ℚ_p]=2; rank-one factors | L⊗_L L has L-dimension 1; L⊗_ℚ_p L has L-dimension 2. | Corrected tensor passes. |
| §4.5 cohomology route | Nilpotent N(e₂)=e₁, N(e₁)=0 | ker N=Le₁; coker N=L[e₂]. The cocycle log(χ)e₂+(log(χ))²e₁/2 has the required cross-term log(χ(g))log(χ(h)). | Retains nonzero H¹; needs the declared comparison contract. |
| §4.7 line extension | ℒ=Le₁ versus Le₂; scalar a≠0 | Line intersection=0; changing generator multiplies the inverse identification by a⁻¹, so the composite multiplier is aa⁻¹=1. | Pass; exact forms use rational d(O[M]^G). |
| §§4.8–4.10 boundedness | Seminorms q_i(x)=i·q(x); scalar p-action | Each seminorm has its own bound; these need not share one bound. Orbit {pⁿx:n∈ℤ} is unbounded for x≠0. | Native von Neumann notion is appropriate; topology still needs R01. |
| §4.11 partial-operator extension | Eigenvalues 1,2 on a two-dimensional model | Companion column (−2,3) gives trace 3 and determinant 2; the all-positive column gives determinant −2. Rank-zero model gives zero. | Corrected sign passes. |
| §§4.12–4.14 Banach/Galois headlines | JL dimension d; irreducible Galois ranks 1,2,≥3 | Rank-two étale multiplicity has Galois factor dimension 2, hence 2d after JL; differential line contributes d. Character case is Steinberg; rank≥3 gives 0. | Branches agree with sources; topology R01 remains. |
| §§5.1–5.2 saturation and finite-K pieces | ϖ²=p; submodule pH of a torsion-free H | O_L/p has length 2 and nonzero class ϖ; O_L/ϖ has length 1. H/pH has p-torsion, so pH is not saturated. | Repaired coefficients and saturation distinction pass. |
| §§5.3–5.5 block evaluation | x, f and endomorphism e; p-adic sum | Evaluation of (f∘e)⊗x and f⊗ex is f(ex) on both sides. Coefficients pⁱ have finite support mod pᵏ; the sequence of all 1's does not. | Balanced action and completed direct sum pass. |
| §5.6 types and central character | Special type Sp⊗δ | Central p acts through δ(p)² on JL; p-central condition is δ(p)²=1. Dual G-central character is δ⁻². | Pass; the inverse is lost only in §6.2's Check. |
| §6.2 special twist | p=7, cubic χ, χ(a)=ζ₃ | χ(a²)⁻¹=ζ₃ versus χ(a²)=ζ₃². Galois factor remains rank 1, not 2. | R05. |
| §6.3 PID rigidity | Smith diagonal (1,T), specialisation T=0 | Generic rank 2, specialised rank 1; the resulting proper stable image contradicts absolute irreducibility. A DVR alone has only one maximal ideal and cannot support the trace-intersection argument. | Stated infinite-prime hypothesis and productwise proof pass. |
| §§6.4–6.5 typed multiplicity | R=L; joint endomorphism action | Continuous coefficient dual is L; the formula reduces to m_B(Π(ρ)′)⊗ρ. For (rℓ)(s)=ℓ(rs), associativity gives ℓ(r₁r₂s) on both sides. | Joint E_B-action is retained; fibre operation must be distinguished. |
| §§6.5–6.6 closed point | A=L⟨T⟩, x=0 | T on Ǎ is left shift: kernel L·ev₀, cokernel 0. Thus ordinary fibre 0 differs from the nonzero point multiplicity. | R02; Π*(ρ) alone keeps its genuine fibre. |
| §6.6 completion | Modulo pᵏ; special Steinberg block | Each vector has finite block support mod pᵏ. At R=L the summand is (St^cont)′⊗1⊗1; no extra rank-two Galois factor. | Source formula, p>3 and arithmetic completion retained; R01/R02 remain. |
| §7.1 automorphy | u(b), w and k=0; scalar aI₂ | For u(b)w, the denominator factor is b−z from both product calculations; k=0 gives 1; aI₂ gives a⁻ᵏ. | Cocycle direction and integral-weight convention pass. |
| §7.2 weighted headline | k=1, a=p | Middle term: p⁻³p⁴=p. Corrected preimage: p⁻¹p²=p. Cokernel with Sym¹: p; four smooth copies: 1. | Prior determinant repair passes; R04. |
| §7.2 algebraic dual | diag(a,b), Sym¹ | Dual weights multiplied by det: a⁻¹ab=b and b⁻¹ab=a. | (Sym¹)∨⊗det≅Sym¹, with action retained. |
| §7.3 first cover | p=2,3; projective diagonal map | At p=2 the chart equation has degree 3 and derivative of z−z² is 1 mod 2; at p=3 the covering degree is 4. diag(1,c) fixes 0,∞ but sends 1 to c, forcing c=1 only with the third line. | First-cover indexing and three-line rigidity pass. |
| §7.4 Iwasawa headline | Zero class; trivial representation as negative control | Zero specialises to 0 at every level; the asserted invariant module has rank 2 over D(Γ). For the trivial representation H_e¹=0 while H_f¹ has dimension 1, so substituting finite for exponential images is invalid. | Correct exponential-image route and nontrianguline hypothesis retained. |
| §7.5 primitive headline | Split components, f=(1,−1) | The jth derivatives of (zʲ/j!,−zʲ/j!) are (1,−1); a pullback has equal coordinates. In a supercuspidal sector the infinite-divisibility intersection is 0 under its contract. | Corrected component-constant conclusion; R03 specifies the base field. |
| §7.6 filtered derived headline | Weight {0,1}, shift [1] | H¹ moves to degree 0; D_dR has dimension 2, Fil⁰ dimension 1, Fil¹=0. The trivial sector has nonzero H⁰ and is excluded. | Shift, filtration and sector agree. |
| §7.7 boundary construction | Empty open; disjoint opens; shifted cofinal exhaustion | Empty sections=0; sections on disjoint collars give a product of two factors; replacing B_i by B_(i+c) leaves the colimit germs identical. | No arbitrary unprojected boundary function is substituted for the ρ-sector. |

### Source sample and manifest

All five recorded works were readable in the supplied legal cache. No new fetch, manifest entry or missing-reference request was necessary. I found no author-flagged unverified locator requiring a sixth text. Page numbers below are printed page numbers in the cached versions; in CDN23 these differ by one from the extraction's PDF page markers. The numbering of the cited results was checked against that text, not inferred from the README.

| Seeded target | Text opened and comparison |
|---|---|
| §0.1 | DLB17 lines 104–116, p. 3; CDN23 lines 205–235, pp. 5–6, and lines 2343–2349, p. 61. Positive-level dictionary is correct; the descent qualification is R03. |
| §1.6 | DLB17 Proposition 7.7, lines 1550–1569, p. 38. Pairing and normalised trace agree; the roadmap correctly repairs the printed power of t. |
| §1.7 | DLB17 Théorème 7.8, Proposition 7.9 and Lemme 7.11, lines 1576–1618, pp. 38–39. Duality and the smooth-vector condition retain their Kirillov/differential setting. |
| §2.3 | COLMEZ19POIDS Théorème 0.3(ii), lines 161–180, pp. 4–5, and Théorème 0.6(iii), lines 215–236, p. 6. The irreducible object is the analytic quotient, with its determinant twist. |
| §4.2 | CDN20 §1.3 and Proposition 1.5/1.6, Théorème 1.7, lines 614–681, pp. 16–17; CDN23 Théorème 5.1/Remarque 5.2, lines 2355–2371, pp. 61–62. Functionals and special twists agree algebraically; Banach dual topology does not: R01. |
| §4.4 | CDN20 §2.1, Remarque 2.3 and Proposition 2.8, lines 809–821 and 911–916, pp. 21,23. The L⊗F coefficients and slope hypothesis are retained. |
| §4.5 | CDN20 Proposition 2.4, lines 822–853, pp. 21–22; CDN23 Lemme 5.3, lines 2397–2416, pp. 62–63. Tensor base L and the declared cohomological comparison are explicit. The source distinguishes strong duals in this functional-analytic lemma from its Banach-dual convention. |
| §4.7 | CDN20 Proposition 2.9 and Théorème 2.10, lines 917–971, pp. 23–24. Line inverse images, rational differential image and the geometric representation are kept distinct. |
| §5.2 | CDN23 Corollaire 5.17 and Proposition 5.19, lines 2658–2690, pp. 69–70. Saturation, finite-K pieces and integral coefficients agree. |
| §5.6 | CDN23 Remarque 5.23, lines 2762–2776, p. 72. Type-level restriction and central-character convention agree. |
| §6.3 | CDN23 Lemme 5.12 and its proof, lines 2574–2595, pp. 66–67. Infinite prime ideals, fibrewise irreducibility, Smith form and the commuting-algebra extension are retained. |
| §6.5 | CDN23 Théorème 5.24, lines 2779–2782 and 2837–2851, pp. 72,74. The joint E_B-action and the source's locally-free-dual step are explicit. The source uses annihilators at closed points: R02. |
| §6.6 | CDN23 Théorème 0.1, lines 121–125, p. 3; Théorème 5.15, lines 2620–2624, p. 68; p>3 at line 93, p. 2; completed-sum and dual-topology conventions at lines 178–184, p. 4. Formula and completion agree; R01/R02 concern topology and the example. |
| §7.1 | DLB17 Remarque 11.12, lines 2718–2725, p. 64; COLMEZ19POIDS §0.4, lines 310–340, p. 8. Integral automorphy factor and separate determinant are consistent. |
| §7.3 | TEI90 Théorème 5, lines 177–224, pp. 73–74; Corollaire 6, lines 232–259, p. 75; Théorème 8, lines 298–315, p. 77; DLB17 Proposition 11.13 and discussion, lines 2731–2781, pp. 65–66. The first ϖ_D-cover is distinguished from DLB level one; three period lines fix the projective identification. |

### Pinned APIs, duplication and headlines

The library inspection used the Mathlib and Tau Ceti copies selected by the content checkout's manifest, not an online Mathlib version. These are the README's native declarations opened at the pin:

| Declaration | Pinned file and line | Relevant content and limitation |
|---|---|---|
| Bornology.IsVonNBounded | `Mathlib/Analysis/LocallyConvex/Bounded.lean:61` | Every neighbourhood of zero absorbs the set. The native predicate itself does not impose Hausdorffness or local convexity. |
| NormedSpace.image_isVonNBounded_iff | `Mathlib/Analysis/LocallyConvex/Bounded.lean:495` | Norm-bound characterisation under its normed-field/space hypotheses. |
| WithSeminorms.isVonNBounded_iff_seminorm_bounded | `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659` | Bounds are per seminorm, not a uniform bound over the index. |
| WithSeminorms.image_isVonNBounded_iff_seminorm_bounded | `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:679` | The corresponding image criterion; the quantifier order is preserved. |
| WithSeminorms.banach_steinhaus | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:164` | Requires the barrelled source and continuous linear/semilinear family; concludes equicontinuity. It does not identify two different dual topologies. |
| Representation | `Mathlib/RepresentationTheory/Basic.lean:48` | A monoid homomorphism to linear endomorphisms. It does not bundle a topology, continuity, Banach admissibility or the p-adic correspondence. |
| LinearMap | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84` | Additivity and scalar compatibility; not continuity. |
| Submodule | `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Algebraic closure properties; not closedness in a topology. |
| Module.Basis | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | Linear equivalence with finitely supported coordinates; not a topological basis. |
| Module.finrank | `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Cardinal.toNat of rank; infinite rank has the junk value 0, so this is not an automatic finiteness hypothesis. |
| BDeRhamPlus, BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88` | Period-ring constructions exist; this does not provide the period functors, Drinfeld tower or Banach correspondence used here. |

Object searches covered Robba rings and differential modules, Kirillov models, Drinfeld towers, continuous/analytic Steinberg objects, Banach admissibility and duals, cohomological multiplicities, type rings, arithmetic factorisation, and the weighted/boundary constructions in both pinned libraries, main roadmaps, available board packages and the indexed open heads. Broad hits such as categorical Drinfeld constructions or highest-weight BGG theory do not provide these p-adic objects. Smooth Whittaker/Kirillov models in GL2AutomorphicRepresentationsAndTransfer R16.2.8 and AutomorphicLFunctionsAndLocalFactors AL.2.2 are not the P-finite semilinear model of Layer 1. No target here was found already proved at the pins, and no duplicate fully qualified Lean declaration is introduced: this package declares none.

Every backticked identifier presented as a library declaration resolves to the pin. There are no backticked identifiers presented as new declarations of this roadmap that are absent from its Lean file.

The headline inventory was compared with the module docstring:

| README headline or deep endpoint | Docstring coverage / missing carriers |
|---|---|
| §4.14 Galois socle and rank≥3 vanishing | Lines 11–18: Drinfeld space, rigid étale cohomology, Banach correspondence. |
| §§4.12–4.13 Banach multiplicities | Lines 19–21: same geometry and representation carriers; dual-topology wording needs R01. |
| §6.6 arithmetic factorisation | Lines 22–27: blocks, projective envelopes, type rings, universal families, interpolated dual. |
| §§3.1 and 3.3 global discharge and all-type realisation | Lines 28–34: analytic vectors, rigid functions/cohomology and quaternionic uniformisation. |
| §§2.3–2.4 irreducibility and weight change | Lines 35–37: locally analytic compact-type representations, Robba modules and their sheaf. |
| §§7.2–7.3 weighted BGG and first cover | Lines 38–46: weighted rigid functions, de Rham quotient, differential operator and semistable model. |
| §7.4 Iwasawa invariants | Lines 47–51: analytic tower functions, D(Γ), Iwasawa cohomology and exponential. |
| §7.5 infinitely primitivable functions | Lines 52–53: rigid half-plane and covering function spaces. |
| §7.6 filtered derived realisation | Lines 54–57: coadmissible derived category, rigid de Rham complex and period functor. |

These are substantial missing constructions, not simple predicates on already available carriers. No statable headline was found omitted, and no substitute scalar theorem or free Prop predicate is supplied. The pinned generic algebraic representations and period rings do not make the headline statements available by a few simple definitions.

### Supplier and overlap resolution

I used the roadmap index/show/grep facilities as well as the available checkouts. The board package index was read before interpreting an absent indexed result. The three citation-tool leads are actual board packages, not evidence of unowned prerequisites. The following table records the resolved ownership groups; line references identify the inspected supplier sections rather than claiming the whole supplier is formally implemented.

| Supplier copy | Resolved cited sections and witness locations |
|---|---|
| PadicLocalLanglandsForGL2Qp, PR #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`: §§0.1–0.2 and 1.1–1.7 analytic/Robba foundations; §§2.5,2.7 and 3.1–3.8,3.11 representations and correspondence; §§4.1k,4.2a,4.9,4.11 quotient/Kirillov inputs; §§5.1–5.8,5.12 blocks and type families; §§6.7,6.9 finiteness and conditional comparison. The latter comparison is at line 2311, and the Schikhof topology at line 228. |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4623`: §§12.4,12.5,12.7,12.14 tower, period maps, commuting actions and central quotient; §12.19 at line 4962 supplies arithmetic descent. R03 identifies a failure to retain its convention. |
| LocallyAnalyticDistributions, PR #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891`: §§0.0,0.2,0.3 locally convex limits, strictness and analytic compact-type duality. |
| LocallyAnalyticDistributionsPartII, board | `packages/LocallyAnalyticDistributionsPartII/README.md:213` and `:232`: §§2.2–2.3; the general ordered p-valued theorem handles the p=2 use with the smaller subgroup. |
| LocallyAnalyticRepresentationsOfLocalGroups, board | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:164` and `:209`: §§0.3,0.5 differentiated and distribution actions. |
| ProetaleCohomologyOfPAdicCurvesAndTowers, board | `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:172`: §§0.3–0.4 Steinberg; §§6.2,6.5,6.9 half-plane comparisons (line 741 explicitly says weak Banach dual); §§7.1–7.5 components, semistable models and fundamental diagrams (line 777 onward). |
| PhiGammaModulesAndIwasawaCohomology, PR #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1158`, `:2345`, `:2453`, `:2494`: §§2.4,5.4,5.6a,5.7. The geometric nontriangulinity condition after finite coefficient extension is retained. |
| PadicHodgeTheory, PR #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, `:894`, `:982`, `:1378`: §§3.3,4.4,5.1–5.4,8.1. The additional continuous-H¹ comparison remains the declared gap. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:4055`, `:5283`: RD.1.73 and RD.2.43 residue duality and the nontrianguline application. |
| GL2AutomorphicRepresentationsAndTransfer, PR #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:716`: R16.1.8 full local finite-character prescription; R16.3 local parameters; R17.3 global Jacquet–Langlands, including R17.3.1 and R17.3.5. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:935`, `:1719`, `:2275`: §§2.7,4.9,6.4 classical comparison, local–global compatibility and supercuspidal globalisation. |
| HilbertModularVarietiesAndShimuraCurves, PR #1005 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1817`, `:2343`, `:2552`, `:3937`, `:3993`, `:4014`: R18.5.3, R18.5.16, R18.5.21, R18.4.24a, R18.4.25, R18.3.29(c). The dual arithmetic representation and opposite printed weight convention are explicitly transported. |
| LocalGaloisDeformationRings, PR #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2367`: §3.8 fixed Weil–Deligne type and integral image. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:588`, `:1916`, `:2710`: SR.0, SR.2, SR.3.2. Complex-coefficient cuspidal splitting is at line 2744; the L-coefficient contract is additional. |
| ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PR #1757 | `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:754`: §5.4 finite length, coefficient dévissage and geometric Hom finiteness. Its Frobenius Check is relevant to R03. |

The overlap evidence reports no conflicting other head changing this roadmap, no dropped cited id, and no id supplied only by an unacknowledged open revision. I compared the scopes of the five nearest open roadmaps: #1312, #1270, #1757, #1062 and #1310. Their supplied objects are cited rather than rebuilt here; the three declared gaps express the additional contracts. No duplicate owner or mutual hand-off was found in those comparisons. R01 and R03 are mismatches with existing supplier conventions, not new ownership claims.

The prescribed dependency check returned:

```text
depcheck: 236 roadmaps, 2148 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier citation in the package was read. No dependency on a forbidden supplier was found.

### Lean acceptance test and padding

Running the prescribed `lake env lean` command on `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` from the pinned content environment completed with exit code 0 and no output or warnings. No Tau Ceti object needed building. The file has the single `import Mathlib`, one module docstring and its namespace, with no declarations.

The exhaustive one-tactic inventory therefore contains **0 sorried theorems**; there are no padding declarations to probe or delete. The explicit-signature inventory likewise contains **0 named declarations**, so there is no `#check @name` comparison to run and no silently dropped section binder. No sorry'd data, `set_option`, alternate import, lemma, admitted example or stand-in theorem occurs. This empty acceptance file is justified by the missing carriers listed above; it is not evidence that the prose mathematics is true.

## Not verifiable

- Independent current-head lookup for LocallyAnalyticDistributionsPartII, LocallyAnalyticRepresentationsOfLocalGroups and ProetaleCohomologyOfPAdicCurvesAndTowers did not resolve through the supplied open-roadmap index. Their available `packages/<Name>/README.md` files were inspected and the cited sections resolve there. I do not certify a separate unavailable pull-request head for these three files.
- The three declared supplier gaps remain contracts; their proofs are not supplied by this package. This is an explicit conditionality, not an undeclared missing source.
- No source in the five-work manifest was unreadable. No mathematical claim in this report relies on an unavailable paywalled text. The computed tests and source comparison do not purport to prove every planned theorem.

## Source issues

- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), printed p. 4, line 163: the source omits the character twist in the quotient identification; it should retain the twist appearing in Théorème 0.6(iii), line 234; affects a stated result.
- **Misprint** in DLB17 at Proposition 7.7(b), printed p. 38, line 1569: the source gives the annihilator with a weight-dependent power of t; it should be tN⁺ in the differential-equation pairing used here; affects a stated result.
- **Misprint** in CDN20 at the proof of Proposition 2.5, printed p. 22, lines 875–876: the source reverses the two relevant dimensions; they should be one for isomorphic modules and zero for nonisomorphic modules; affects the proof.
- **Misprint** in CDN20 at the proof of Lemme 2.18, printed p. 30, line 1186: the source's companion-matrix column has all-positive symmetric coefficients; it should have alternating signs, giving determinant 2 for eigenvalues 1 and 2; affects the proof.
- **Gap** in DLB17 at the proof of Proposition 11.13, printed pp. 65–66, lines 2776–2781: the source determines a projective identification from two lines; it should fix a third distinct line to eliminate the diagonal ambiguity; affects the proof.
- **Error** in DLB17 at Théorème 1.10, printed p. 11, line 447: the source places every infinitely primitivable function in the pullback from Ω; it should allow locally constant component factors after splitting components; affects a stated result.
- **Gap** in CDN23 at Proposition 5.7 and Théorème 5.8, printed pp. 63–64, lines 2424–2473: the source suppresses the p-central condition on types in these statements; it should restrict the asserted geometric comparison to ΦNᵖ; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15, printed p. 68, line 2624: the source defines the coefficient dual using that dual itself as its argument; it should take the continuous L-dual of the type ring; affects a stated result.
- **Gap** in CDN23 at the proof of Théorème 5.24(ii), printed p. 74, lines 2848–2851: the source uses finite local freeness of the dual multiplicity without establishing it there; it should justify that property before applying fibrewise PID rigidity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a53e5b1e6dd4acb07ceb9f207f7b3bc78d636f2f", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~3", "model": "gpt-6-astra", "worker": "chris-32"} -->
