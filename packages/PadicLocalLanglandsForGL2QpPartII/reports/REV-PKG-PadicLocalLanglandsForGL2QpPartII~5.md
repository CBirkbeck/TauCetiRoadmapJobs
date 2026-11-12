<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6787151265 -->
Review (codex) of 1647178

Verdict: needs_changes

1. **F01** (P1) Three distinct period lines have no supplier

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1136`: “Varying the residual representation in CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives three forms with pairwise distinct lines.”

   **Claim:** The cited globalisation theorem supplies the three marked period lines needed to eliminate a non-scalar projectivity in §7.3.

   **Witness:** PR #1270, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:2278`, supplies one form with the prescribed supercuspidal local component up to unramified twist and absolutely irreducible residual restriction. It does not supply three distinct filtrations.

   Its proof chooses a Serre weight and constructs an appropriate residual representation; it does not quantify over arbitrary residual representations or assert distinct resulting filtration lines. DLB17 line 2773 asserts a second line, and lines 2776–2781 then use linear combinations of unmarked extension classes. Neither passage supplies the stronger three-line input now required here. Repeating an existential assertion three times can give the same line three times. The distinction matters: diag(1,2) fixes Le₁ and Le₂ but moves L(e₁+e₂) to L(e₁+2e₂).

   **Exact repair:** Declare a supplier gap, for example `gap:three-period-line-globalisation`, owned by CompletedCohomologyAndLocalGlobalCompatibility §6.4, in both the top-level gaps of `design/plan.json` and its README supplier contract. Ask precisely for three weight-two quaternionic forms, after finite coefficient extension and the allowed finite-order twists, with the fixed depth-zero supercuspidal local π of §7.3, absolutely irreducible residual restrictions at p, and pairwise distinct Fil⁰ lines in the same identified M_dR. Allow their tame levels to differ. Keep the definite quaternion algebra and the hypotheses on π from §7.3; do not ask for arbitrary prescribed residual representations. Replace the asserted consequence of §6.4 by this contract in §7.3 and its Needs line. Alternatively, an actual owned theorem proving that exact input would discharge the gap.

   **Repair tested:** For lines Le₁, Le₂, L(e₁+e₂), an automorphism fixing the first two is diag(a,b); fixing the third gives a=b. One or two lines permit a≠b. The proposed contract supplies exactly the missing third constraint, without assuming the desired comparison theorem.

2. **F02** (P2) The general P-finite model is restricted to one family

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:326`: “For V in the family of π, construct the P-equivariant injection”; also the family convention at line 260 and the locally analytic input of the definition at line 288.

   **Claim:** The P-finite Kirillov construction and infinitesimal-action target are only built for the weights-{0,1}, nontrianguline family used by the final geometric application. The definition is given on locally analytic representations, but the theorem applies it to the Banach representation Π(V).

   **Witness:** DLB17 line 1472 assumes only an absolutely irreducible two-dimensional L-representation V; Proposition 7.6, lines 1535–1543, gives the model at that generality. Definition 7.4, line 1473, takes vectors in Π(V) itself.

   This is a restriction of a general library theorem to the route's application, not a false assertion about the restricted family. The base's P-algebraic model does not supply the omitted general P-finite theorem: compare PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1300`, §4.1k, and its separately restricted density theorem in §4.9. The new P-finite target is owned here.

   **Exact repair:** Define the group-action conditions for P-finiteness on a continuous L-representation, including Banach representations. State the construction of §1.5 for every absolutely irreducible continuous rank-two L-representation of G_ℚ_p, at every prime. State the infinitesimal formula with its generalized Sen weights, after a coefficient extension splitting the Sen polynomial when necessary. Keep the family of π as a specialization used by subsequent targets, not as a hypothesis of this general construction. Remove the nontrianguline-family dependency from the general construction where it is unnecessary; retain the analytic-vector exact sequence and differential-period inputs.

   **Repair tested:** If V₀ belongs to the current weights-{0,1} family with determinant χ, V₀(1) is still absolutely irreducible but has weights {1,2} and determinant χ³. The source's construction applies; the current target excludes it. The general formula gives a⁻=2−∇ and Casimir ((1−2)²−1)/2=0. Specializing back to {0,1} gives a⁻=−∇ and u⁻=−t∂². This also distinguishes the general theorem from merely repeating its weight-two Check.

3. **F03** (P3) The new Steinberg Check uses a non-stable component

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:929`: “It is the reduction of the integral Steinberg classes … on one copy of Ω”. The same Check then uses this copy as the image of a G-equivariant map from P_B.

   **Claim:** Classes supported on one of the two geometric level-zero components form the required G-subrepresentation inside the finite-K invariant piece.

   **Witness:** Put p=5, L=ℚ₅ and μ=δ₀−δ∞. For g=diag(5,1), gμ=μ, but g(μ,0)=(0,μ)≠(μ,0), since g exchanges the components. An equivariant image must be G-stable.

   This is the same component action correctly used in the repaired §3.1 Check at README line 480; the level-zero action is also explicit in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:797`. Taking K to contain the unramified quadratic extension fixes the components for G_K, not for G.

   **Exact repair:** Specialize this negative-control Check to p=5 and L=ℚ₅ and use the diagonal integral Steinberg classes (μ,μ), then reduce modulo 5. Their image is a G-stable copy of Sp₁(𝔽₅)*. Retain the compactness-versus-discreteness argument and the surjection from its block projective generator. Use the same diagonal embedding as the already repaired §6.6 Check. The single-component sequence in §5.1 can remain for its unipotent-continuity test, which does not require a G-stable summand.

   **Repair tested:** g(μ,μ)=(gμ,gμ), so the diagonal is stable even when components are exchanged. Its mod-5 dual is infinite and has no nonzero finite G-stable subgroup: such a subgroup would dualize to a nonzero finite-dimensional quotient of the infinite-dimensional irreducible smooth Steinberg representation. Thus the nonzero map from compact P_B is continuous in the stage topology and cannot be continuous into the discrete topology, as the Check intends.

4. **F04** (P2) Finite-length factorisation needs a fixed torsion stage

   **Location:** `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1038`: “Every map from the compact P_B factors through a finite-length block quotient”.

   **Claim:** Compactness alone gives the finite-length factorisation used to compare the two centre actions on the integral or rational Hom space.

   **Witness:** The identity of P_B does not factor through a finite-length quotient: PR #1312, `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1776`, explicitly states that this projective envelope is not of finite length. CDN23 line 2804 first fixes a torsion exponent.

   The source then considers only φ:P_B→(Y/p^kY)∨. Its finite-length argument uses two additional facts about σ=(im φ)∨: it is a finitely generated O_L[G]-quotient of LL(M)⁺/p^k, and it is a union of finite-length block subrepresentations inside P_B∨ (CDN23 lines 2818–2824). Those facts imply finite length. Compactness is used earlier to clear denominators, not to replace the inverse limit by a single finite-length quotient. A finite-length torsion quotient cannot have a nonzero image in the torsion-free Yᵈ, which further shows why the order of steps matters.

   **Exact repair:** Replace the last route bullet by the fixed-k assertion above, with continuity and equivariance, and name both finite generation and local finite length. Prove factorisation through σ∨⊂(Y_B/p^kY_B)∨ and equality of the two centre actions there. Deduce that J annihilates each fixed-k Hom, pass to the inverse limit in k, and only then invert p to deduce the claimed I-annihilation. Extend the proof locator to CDN23 lines 2800–2835, printed pp. 73–74.

   **Repair tested:** The identity of P_B is excluded from the fixed-torsion-target assertion. The elementary model ℤ_p/p^k has length k, whereas lim_k ℤ_p/p^k=ℤ_p has infinite length; passing to the inverse limit preserves coordinatewise annihilation by J, not finite length. The repaired argument uses precisely that distinction and preserves the original headline conclusion.

Four findings: one P1, two P2 and one P3. The two previous findings are repaired. Elaboration and the mechanical dependency check pass. The defects below concern the mathematical scope, a missing globalisation input, a new Check, and a proof input with omitted hypotheses. They do not require replanning the roadmap.

## Previous findings checked first

The preceding review had two findings; neither was marked not actionable. Both repairs were checked before the new pass. Their original defects are not re-raised.

| Previous finding | Repaired passage | Status and verification |
|---|---|---|
| F01: arithmetic cohomology incorrectly given its p-adic topology | README line 851: “The topologies are those of the stages, not the p-adic topology.” Line 873 separates algebraic completeness from the induced stage topologies; lines 915 and 1074 carry these topologies through evaluation and factorisation. | **Repaired.** Finite-K torsion stages are profinite, followed by colim_K, lim_k and scalar inversion. The multiplicity module's own p-adic topology at line 891 is intentionally different. CDN23 Proposition 5.19 and Remark 5.20 support this. The new component error in one negative-control Check is R03, not recurrence of the original topology definition. |
| F02: smooth vectors incorrectly said to be G-fixed | README line 480: “fixed by an open subgroup of G”; its example gives diag(p,1)(1,−1)=−(1,−1). | **Repaired.** The even-determinant-valuation stabilizer is open. Over characteristic-zero L, (1,−1)≠(−1,1), also at p=2. Lie derivatives vanish without full G-invariance. |

The changed passages in §§5.1–5.5 and 6.6, the supplier topology descriptions and the §3.1 Check were re-read in full. The search for the repaired patterns also checked compact-convergence versus norm-dual topology in Conventions and §4.2, all O_L-linear versus Pontryagin duals in §5.3, and the Nakayama Check in §5.5. In particular, O_L-dual(O_L)=O_L, Pontryagin-dual(O_L)=L/O_L, and ϖ(L/O_L)=L/O_L with nonzero underlying module. The new R03 is the remaining component-equivariance pattern.

## Verified sound

### Coverage, principles and shape

All 51 numbered targets and all 51 Needs lines were read, including every definition, API and Check. Unchanged mathematics was compared with the preceding review's computed rows; unsupported prose summaries were not treated as mathematical evidence. The tables below record the seeded targets, headlines, changed material and finding witnesses, rather than reproducing a separate ledger for every API bullet.

There are eight mathematics-named layers, each with Examples and Dependencies. The opening identifies where the base roadmap stops. The base correspondence, analytic quotient, coordinate operator, conditional comparison, tower geometry, blocks and type rings are imported, not constructed again. The dependency chain from analytic operators through geometric realisation to multiplicities and arithmetic factorisation explains the order; there is no claim to follow a source's chapter arrangement. The application restriction of §1.5 is the exception reported as R02. No computational algorithm, copied source passage, machine path, pull-request narrative, HTML anchor, route-only prime restriction, sorry data or set_option was found in the authored files. The p>2 and p>3 restrictions in the arithmetic factorisation are tied to the stated theorems and block inputs, not an exclusion of difficult primes from the underlying general library.

The README shape was compared with `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `Completed/LocalGaloisGroups/README.md` on main. Definitions have API prose and at least three Checks; R03 identifies a false one. Targets have locators and dependency lines; R01 and R04 identify inadequate proof inputs despite those lines being present. The one-line metadata and the five-entry source manifest were read. No own backticked Lean name is promised without a declaration. No suspicious instructions were encountered in the material reviewed.

### Seeded source verification

All five manifest texts were readable from the legal cache. No new source fetch or manifest change was necessary. No locator was marked unverified in the authored package. Page numbers below are the printed pages of the particular cached version, not physical PDF page indices or a different edition's pagination.

| Target | Text opened, theorem and printed page | Hypotheses and conclusion checked |
|---|---|---|
| 0.2 Type decomposition | CDN23 lines 2343–2349, §5.1, p. 61; CDN20 lines 100–108, introduction, p. 3 | Finite quotient at fixed level; multiplicity Hom and isotypic tensor are distinct; the p-central sector is ΦNᵖ_n. |
| 1.5 P-finite model | DLB17 line 1460, Theorem 7.3, p. 36; lines 1472–1487; lines 1535–1543, Proposition 7.6, pp. 37–38 | The source is general absolutely irreducible rank two, including the Banach P-finite domain. The family restriction is R02. Operator order and Sen-weight formula agree. |
| 2.2 Homographic covariance | DLB17 line 1946, Proposition 9.6, p. 46; lines 1967–1999, Theorem 9.7/Lemma 9.8, pp. 47–48 | Nontrianguline analytic quotient, invertible resolvents, correct numerator/denominator and inverse-element completion of the one-sided argument. |
| 4.3 Partial operator | CDN20 lines 1171–1193, Lemma 2.18, pp. 29–30 | Finite-dimensional E, no nonzero invariant subspace contained in S, distinct eigenvalues in L. The README corrects companion signs and explicitly owns the missing complementary-space argument. |
| 4.4 Period multiplicities | CDN20 lines 809–821, §2.1.2 and Remark 2.3, p. 21 | Rank-two slope-1/2 periods, finite extension F, L⊗F structure and finite-dimensionality; rational specialization is stated separately. |
| 4.8 G-bounded vectors | CDN20 lines 1009–1019, §2.2.1, p. 25; CDN23 lines 2378–2393, Lemma 5.3, p. 62 | Bounded full G-orbit, individual seminorm bounds and maps out of Banach duals. No norm-dual action substituted. |
| 4.11 Occurrence and finite length | CDN20 lines 1090–1193, Theorem 2.15 and its proof, pp. 27–30 | Arbitrary finite-dimensional continuous V, absolute irreducibility after coefficient extension where used, finite-length admissible Banach occurrence; quotient/subrepresentation directions retained. |
| 4.12 Differential multiplicities | CDN23 lines 2424–2464, Proposition 5.7, pp. 63–64 | Absolutely irreducible admissible unitary Π; actual period line ℒ; source proof's ΦNᵖ restriction retained in the README. |
| 4.13 Étale multiplicities | CDN23 lines 2465–2500, Theorem 5.8 and Lemma 5.9, pp. 64–65 | Compact-convergence Π*, analytic-vector comparison, rank-two, special and zero cases; p-central restriction corrected. |
| 4.14 Galois multiplicities | CDN20 line 1108, Corollary 2.16, p. 28; CDN23 line 2357, Theorem 5.1, pp. 61–62, and line 2541, Theorem 5.10, p. 66 | Absolutely irreducible V, dimension≥3 vanishing, full-tower versus p-central condition and special-character convention distinguished. |
| 5.2 Saturation and finite-K pieces | CDN23 line 2658, Corollary 5.17, p. 69; lines 2673–2715, Proposition 5.19/Remark 5.20, pp. 69–70 | Saturated lattice, algebraic completeness, injection mod p^k, induced profinite finite-K pieces, colimit topology; repairs supported. |
| 5.6 Types, level and centre | CDN23 lines 2757–2777, Remark 5.23, p. 72 | Finite type decomposition, action of the indicated central character, and level independence above the type's level. |
| 6.2 Special type | CDN23 lines 2553–2557, §5.2, p. 66 | R=L, Galois character δ, Banach factor contragredient twist and determinant/Nrd conventions. |
| 7.2 Weighted BGG | DLB17 lines 2718–2727, Remark 11.12, pp. 64–65; COLMEZ19POIDS lines 215–241, Theorem 0.6, p. 6, and lines 328–340, Conjecture 0.10/Remark 0.11, p. 8 | Sym^k quotient, determinant twist, k+1 weight convention and unramified twist. The conjecture is a formulation to prove here, not cited as an already proved theorem. |
| 7.5 Primitivable functions | DLB17 lines 444–448, Theorem 1.10, p. 11; lines 2790–2804, §12.1, p. 66 | Printed conclusion omits component constants. The README corrects this and separates one-dimensional sectors from general-central-character supercuspidal sectors. |

Also reopened: DLB17 lines 2734–2783 for §7.3; TEI90 Theorem 5, Corollary 6 and Theorem 8 at lines 177, 232 and 298 (pp. 73–77); CDN23 lines 2620–2745 for the repaired arithmetic topology and evaluation; lines 2800–2835 for R04; COLMEZ19POIDS lines 153–180 and 262–271 for weight change. The source's one-form globalisation does not resolve R01 merely because its later proof asserts variation.

### Computed adversarial evidence

Here d means the dimension of JL(M) when used in a multiplicity row. A “pass” is limited to the hypotheses and the indicated computed test; it is not a claim that a sorry elaboration proves the theorem. Rows marked R01–R04 identify changes required. The tests deliberately distinguish smoothness from invariance, a multiplicity from an isotypic component, torsion stages from their limit, and a fibre from closed-point torsion.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result and change |
|---|---|---|---|
| Conventions: levels and descent | p=2,3; level zero and first cover | First-cover degrees p²−1=3,8; DLB level 1 is CDN level 2. H⁰ of level zero has dimensions 1 over ℚ_p, 2 after quadratic splitting, 1 in descent invariants. | Pass; prevents identifying the first cover with Σ₁ or descent with a split union. |
| Conventions: inverse pullback and dual | f=z; scalar a on a representation | (u⁺f,a⁺f,a⁻f,u⁻f)=(−1,−z,z,z²). On the dual the scalar is a⁻¹, not a. | Pass in §§3.1,6.2,7.1–7.2. |
| 0.2: multiplicity/type decomposition | X=W⊗ρ, dim W=r, dim ρ=d; distinct irreducible ρ′ | dim Hom_Ǧ(ρ,X)=r, dim X=rd; Hom_Ǧ(ρ′,X)=0. | Pass; evaluation must tensor back with ρ. |
| 0.2: central quotient control | Translation T on the product of copies indexed by ℤ | For (T−1)x=y, choose x₀ and solve x_(i+1)=x_i+y_i in both directions; cokernel=0. Finite-support sums would not give this conclusion. | Pass for the stated cohomological descent model. |
| 0.3–0.4: filtration/twist dictionary | Weights {0,1}; ℚ_p(1); basis e₁,e₂ | dim Fil⁰=1, Fil¹=0; φ on D_cris(ℚ_p(1)) is p⁻¹, after [1] it is 1. e₁∧e₂=1 sends e₁ to e₂* in the wedge pairing. | Pass; opposite weight signs would place the filtration line at Fil¹. |
| 1.1: lattice independent of line | R e₁+tR e₂ and tR e₁+R e₂ | Intersection=tR²; either individual lattice strictly contains it. | Pass; line-forgetting is not equality of the two lattices. |
| 1.2: nontrianguline polynomial injectivity | Rank-one trivial module; ∇=t∂ | ∇1=0 in the excluded model; (∇−1)(tx)=t²∂x. | Pass with nontriangulinity; no unjustified statement for arbitrary rank one. |
| 1.3: P-finiteness and infinite slope | Trivial vector; p=2 additive character | Trace of the trivial vector is p^n v and its kth power p^(nk)v≠0; ζ₂−1=−2≠0 in L. | Conditions distinguish infinite slope; R02 fixes the Banach domain. |
| 1.4: Γ-covariance/support | Quadratic coefficient i with σ(i)=−i; shells p^jℤ_p× | Constant value i is sent to −i, not i; shell support j≥0 accumulates at 0 and is not compact in ℚ_p×. | Pass; Γ-law and compact support exclude the wrong models. |
| 1.5: general model and action | V₀ and V₀(1), weights {0,1} and {1,2} | a⁻=−∇ versus 2−∇; Casimir=0 in both. In weights {0,1}, u⁻=−t∂², whereas −∂²t=−t∂²−2∂. | R02: restore general theorem, retain specialization. |
| 1.6: residue/trace normalization | dt/t, dt; trace of 1 from level n+1 to n | Residues 1,0; p^(−n−1)Tr(1)=p^(−n), so transition normalization agrees. Orthogonal lattice is tR, not t²R. | Pass; weight-dependent t^k is not copied. |
| 1.7: Kirillov pairing | One nonzero shell; zero functional | The shell sum has exactly its one residue contribution; zero functional gives 0 on both sides. | Pass; no infinite-sum convergence hidden in the compact-support test. |
| 2.1: both-chart embedding | Pair (0,y) with y≠0 before gluing/fixed-vector constraints | First-chart restriction=0, pair≠0; restriction alone is not injective. | Pass: Weyl chart and φ-fixed vanishing explicitly supplied; fixed-radius gap retained. |
| 2.2: covariance | w=(0,1;1,0), translation u(b), scalar matrix | g∂g⁻¹ is ∂⁻¹, ∂−b, ∂ respectively; wu⁺w on z equals z². Formula (d∂−b)/(a−c∂) gives these same values. | Pass; inverse-element argument addresses both inverses. |
| 2.3–2.4: irreducibility/weight change | k=0,1,2; determinant at diag(p,1) | Casimir at k=0 is −1/2, at k=1 is 0; k=2 algebraic determinant factor p pairs with δ²(p)=p⁻¹ to give unit norm. Smooth π maps to 0 in the quotient. | Pass; boundary weights do not become padding in Lean. |
| 3.1: local analyticity versus invariance | Two-component f=(1,−1), p=2,3,5 | All Lie derivatives=0; diag(p,1)f=(−1,1)≠f; the even-valuation subgroup fixes f. | Previous F02 repaired. |
| 3.1: multiplicities and noncompact geometry | 1⊕1; u(p⁻¹) on the standard tree vertex | dim Hom(1,1⊕1)=2; tree displacement=2, not 0. | Pass; no multiplicity-one or compact-group shortcut. |
| 3.2–3.3: twisted model and general central character | t⁻¹e; cubic/quadratic characters at p=7 | σ(t⁻¹e)=χ(σ)⁻¹t⁻¹σ(e). Squaring on the order-6 character group has image of order 3, so its quadratic character has no square root there. | Pass: §3.3 supplies the general character route rather than assuming every character is a square. |
| 4.1: fixed-level geometric diagram | Slope-zero φ=1 control; n=0 supercuspidal sector | The slope-zero control has fixed vector 1; positive-slope vanishing cannot be used there. At level zero no supercuspidal JL-type survives. | Pass with the stated slopes/types. |
| 4.2 and 4.10: dual topology | μ_j=δ_(5^j)−δ₀ on the unit ball of the Steinberg dual | Total mass=0, norm=1, while μ_j(f)→0 for each continuous f. δ₀ has mass 1 and fails the Steinberg relation. | Pass; compact convergence on bounded sets differs from norm convergence. |
| 4.3: prescribed spectrum | E=L², S=Le₁, Ae₁=e₂, λ=1,2; E=0 | B=[[0,−2],[1,3]] has trace 3, determinant 2; eigenvectors e₂−2e₁ and e₂−e₁ have eigenvalues 1,2. All-positive top coefficient gives determinant −2. At dimension 0 the eigenbasis is empty. | Pass for the corrected target; S=E≠0 is excluded by the invariant-subspace hypothesis. |
| 4.4: period multiplicities | V=0, V=L, general finite F | H_C(0)=H_M(0)=0; H_C(L)=L⊗F has L-dimension [F:ℚ_p]; an admitted supercuspidal line has its one-dimensional H_M. | Pass; rational-base conclusions are not generalized to arbitrary F. |
| 4.5–4.6: coefficients and Sen weights | Quadratic L/ℚ_p; nilpotent 2×2 Sen operator; F quadratic | L⊗_L L has L-dimension 1, L⊗_ℚ_p L has dimension 2. A size-2 nilpotent block has kernel and cokernel dimensions 1. Sum of nonnegative weights is 1 for F=ℚ_p, 2 for quadratic F. | Pass; these are different conditions, not interchangeable tensor or weight formulas. |
| 4.7: marked line/comparison | Rescale a chosen nonzero period by a | The tensor factors scale by a and a⁻¹, with product 1; the intersection uses the rational function subspace. | Pass; a bare unmarked isomorphism alone would not identify the period line. |
| 4.8: bounded orbits | Scalar p-action of ℤ; trivial action; family of seminorms | Orbit contains p^(−n)v with norm p^n‖v‖→∞; trivial orbit has constant norm ‖v‖. A bound r_i can grow with i. | Pass; neither a single uniform r nor compactness of G is silently assumed. |
| 4.9: bounded functions | f=z under translations; constants in a supercuspidal sector | Translations by p^(−n) have unbounded values. Constant/component representations contribute 0 to a supercuspidal multiplicity. L⊗ an O_L-torsion module=0. | Pass in the stated tower setting. |
| 4.11: occurrence/length | Direct sum of two admitted rank-two constituents; one-dimensional V; V=0 | Length of the two-factor Banach contribution=2, not 1; supercuspidal occurrence for a character=0; zero V gives zero multiplicity. | Pass; quotient direction and coefficient enlargement retained. |
| 4.12: differential multiplicity | Admitted (M,ℒ), dim JL(M)=d; wrong p-central character | dim(ℒ⊗JL(M))=d; forbidden central character gives Hom=0 because 1−χ(p) is invertible. | Pass with ΦNᵖ_n, unlike the source's abbreviated statement. |
| 4.13: étale Banach multiplicity | Same M; special character | dim(V_(M,ℒ)⊗JL(M))=2d; special Galois multiplicity has dimension 1. Replacing ℒ by an unnamed scalar line loses its marked embedding. | Pass. |
| 4.14: higher-dimensional Galois multiplicity | Absolutely irreducible dim V=3; admitted dim 2; character | Hom for dimension 3 is 0; admitted rank-two case has Π(V)*⊗JL(M), character case the stated Steinberg twist. | Pass; irreducibility is essential to the dimension-vanishing assertion. |
| 5.1–5.2: repaired topology | p=5, L=ℚ₅, n=0, K⊇ℚ₂₅; μ_j above | μ_l(1_(5^jℤ₅×))=δ_jl. Thus infinitely many distinct reductions mod 5, but μ_j→0 pointwise; u(5^j)(δ₀−δ∞)−(δ₀−δ∞)=μ_j. | Previous F01 repaired: compact profinite quotient passes, discrete quotient fails compactness and continuity. |
| 5.2: saturation and ramification | H⁺ saturated; ramification index e=2 | Kernel of H⁺→H_C⁺/p^k is p^kH⁺; for pH⊂H this equality would fail. O_L/p has O_L-length 2, whereas k_L has length 1. | Pass; p^k and ϖ^k are not conflated. |
| 5.3: dual and evaluation | m=O_L; absent block; composition e | m̌=O_L, m∨=L/O_L; absent block multiplicity=0. Evaluation gives (f∘e)(x)=f(ex), agreeing with the balanced tensor relation. | Pass; no unjustified discrete topology on general m∨. |
| 5.4: completion and topology | Block coordinates p^i; coordinates all 1 | Mod p^k, p^i has support i<k; all-1 coordinates have infinite support already mod p. | Pass: completed direct sum differs from both product and algebraic direct sum. |
| 5.4: new finite-K negative control | One-component (μ,0), g=diag(5,1); diagonal (μ,μ) | g(μ,0)=(0,μ)≠(μ,0); g(μ,μ)=(μ,μ). A finite image in the Steinberg dual is 0, but the diagonal quotient map is nonzero. | R03: replace one-component G-submodule by the diagonal one. |
| 5.5: Nakayama | m∨=L/O_L | ϖm∨=m∨, hence m∨/ϖ=0 although m∨≠0. | Pass: finite generation concerns the compact O_L-dual, not this Pontryagin dual. |
| 5.6: level stability and character | Finite quotient K_D(n)/K_D(m), characteristic-zero coefficients | Averaging divides by its nonzero finite order; dual character δ⁻² times δ²=1. | Pass; no characteristic-p averaging claim. |
| 6.1: universal family | Empty full-type locus; nonempty rank-two family | R=0 gives family=0. Galois rank=2 does not make the Banach dual rank 2. | Pass; full WD type, not merely inertia, is supplied. |
| 6.2: special-type convention | p=7, character χ(a)=ζ₃ | Twisted Banach dual has scalar η(a²)⁻¹ζ₃ in the stated convention, whereas the inverse character gives η(a²)⁻¹ζ₃²; ζ₃≠ζ₃². | Pass; inverse twist is detected by a nonquadratic character. |
| 6.3: interpolation rigidity | Matrix diag(1,T); character congruent to 1 modulo uniformizer | Rank is 2 generically, 1 at T=0. Residual characters can coincide while characteristic-zero traces differ. | Pass with fibre and joint-action hypotheses; not a residual-character argument. |
| 6.4: annihilator and factorisation | N=L[T]/(T²); identity P_B; inverse limit of ℤ_p/p^k | T acts as 0 on every closed fibre of N, but T·1≠0 in N. P_B has infinite length; ℤ_p/p^k has length k, its inverse limit infinite length. | R04: prove annihilation at fixed torsion stages, then pass to the limit. |
| 6.5: continuous coefficient dual | R=L; arbitrary r₁,r₂,s | Ř=L; r₁(r₂ℓ)(s)=ℓ(r₂r₁s)=(r₁r₂)ℓ(s). | Pass; the source's self-referential dual is not copied. |
| 6.6: arithmetic factorisation/fibre | R=L⟨T⟩ and continuous dual; closed point T=0 | T on the dual is a surjective shift, so ordinary fibre=0; T-torsion=Levaluation₀. A quadratic residue field has κ-dimension 1 but L-dimension 2. | Pass: closed-point torsion, not ordinary tensor fibre, is used. |
| 6.6: transported topology | p=5,n=0; diagonal (μ_j,μ_j) | Norm=1; pairwise distinct reductions; pointwise limit=(0,0). Galois and division-algebra component swaps fix the diagonal. | Previous F01 propagation repaired. |
| 7.1–7.2: weighted action/BGG | k=1; scalar pI; k=0 | Middle scalar p^(−3)p⁴=p; line-preimage scalar p⁻¹p²=p; Sym¹ scalar p. Four smooth copies would have scalar 1. At k=0 the determinant cancellation gives 1. | Pass; algebraic Sym^k and determinant/unramified twists are necessary. |
| 7.3: projective comparison | Le₁, Le₂, L(e₁+e₂); diag(1,2) | First two lines fixed, third sent to L(e₁+2e₂). Repeated use of one existence theorem may yield only 1 distinct line. | R01: declare/prove the three-line supplier input. |
| 7.3: first-cover model | p=2,3; y=ϖ_Ky′ | Over unramified base special fibre is y^(p²−1)=0. After ramification, numbers of factors p−1=1,2, degrees p+1=3,4; derivative of z−z^p mod p is 1. | Pass: reduced semistable model requires the stated ramified extension. |
| 7.4: Iwasawa invariants | Trivial-character control; zero Iwasawa class | H¹_e(trivial)=0, while the unramified H¹_f has dimension 1; all specializations of 0 are 0. The target's module rank is 2. | Pass; exponential-image condition is not replaced by H¹_f or H¹_g. |
| 7.5: infinitely primitivable | Two split components, f=(1,−1) | (d/dz)^j(z^j/j!,−z^j/j!)=(1,−1) for every j. A pullback from Ω has equal components, so cannot equal f. | Pass for H⁰_dR·O(Ω); printed source conclusion fails. |
| 7.6: filtered derived realization | Two-term complex with H⁰=0; rank-two V | H¹[−1][1]=H¹ in degree 0; Hom dimension=2, Fil⁰ dimension=1, Fil¹=0. Trivial ρ can have H⁰≠0 and is excluded. | Pass; no Frobenius or monodromy is inferred. |
| 7.7: limit/finite-sum compatibility | Empty type set; two disjoint components; cofinal level shift | Empty sum=0; functions on two components are E×E; a cofinal reindexing leaves the limit unchanged. | Pass with fixed-level finite type sum and named strict-limit inputs. |

### Pinned declarations, Lean and headlines

The pins were read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by objects and hypotheses (Drinfeld tower, Kirillov model, Robba equation, analytic/Banach representation, Iwasawa cohomology and type multiplicity), not only by proposed names. Algebraic/categorical occurrences of Drinfeld or Steinberg do not supply these geometric representations.

| Declaration opened at the pin | File and line | Actual content and limit |
|---|---|---|
| Bornology.IsVonNBounded | `Mathlib/Analysis/LocallyConvex/Bounded.lean:61` | Absorption by every zero-neighbourhood; does not include Hausdorffness or local convexity. |
| NormedSpace.image_isVonNBounded_iff | `Mathlib/Analysis/LocallyConvex/Bounded.lean:495` | Norm-bounded image over a nontrivially normed field. |
| WithSeminorms.isVonNBounded_iff_seminorm_bounded and image variant | `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679` | For each seminorm a bound; no uniformity over the seminorm index. |
| WithSeminorms.banach_steinhaus | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:164` | Barrelled-source uniform boundedness; not an unrestricted equality of dual topologies. |
| Representation | `Mathlib/RepresentationTheory/Basic.lean:48` | Algebraic monoid homomorphism into linear endomorphisms; no topological representation structure. |
| LinearMap and Submodule | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `Mathlib/Algebra/Module/Submodule/Defs.lean:39` | Algebraic linearity/submodule laws, not continuity or topological closedness. |
| Module.Basis and Module.finrank | `Mathlib/LinearAlgebra/Basis/Defs.lean:89`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Finitely supported coordinates; finrank is rank.toNat and is 0 for infinite rank. |
| BDeRhamPlus and BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88` | Period rings of a perfectoid field; not Galois D_dR or the cohomology of Drinfeld covers. |

All ten backticked imported identifiers in the README resolve at these pins. The missing structured carriers named in the Lean docstring were not found in either pinned library. Generic vector spaces and continuous duals exist; they do not make the following statements native without constructing substantial new objects.

| Headline theorem from the summary/scope | README | Lean module-docstring coverage |
|---|---|---|
| Galois socle and higher-dimensional vanishing | 4.14 | Named; lacks rigid tower, its étale cohomology and p-adic correspondence. |
| Banach multiplicities in differentials and étale cohomology | 4.12–4.13 | Named; additionally lacks admissible unitary Banach representations with the appropriate dual action. |
| Arithmetic factorisation | 6.6 | Named; additionally lacks blocks, projective envelopes, full-type rings and interpolated family. |
| General supercuspidal realization | 3.3 | Named; lacks rigid functions/de Rham cohomology and locally analytic vectors. |
| Discharge of the base's global hypotheses | 3.1 | Named; lacks completed quaternionic cohomology and uniformisation. |
| Topological irreducibility and weight change | 2.3–2.4 | Named; lacks Robba modules, equivariant sheaf and locally analytic representations. |
| Weighted BGG and original first-cover comparison | 7.2–7.3 | Named; lacks weighted functions, BGG operator, semistable model and its comparison. |
| Iwasawa invariants | 7.4 | Named; lacks tower functions, distribution algebra and representation Iwasawa cohomology/exponential. |
| Infinitely primitivable functions | 7.5 | Named; lacks rigid half-plane and its covers. |
| Filtered derived realization | 7.6 | Named; lacks coadmissible distribution-module derived category and rigid de Rham complex. |

The prescribed `lake env lean` invocation on the absolute package file, run from the pinned content checkout, finished with **exit 0 and no warnings or output**. There is exactly one import, `import Mathlib`; no Tau Ceti object build was needed. Suggested.lean has the required module docstring and namespace, **zero named declarations and zero sorried theorems**. Consequently the exhaustive one-tactic probe inventory and exhaustive `#check @name` binder inventory are both empty, not sampled. There is no padding to delete, hidden binder to repair or substitute predicate encoding. The statable auxiliary linear-algebra lemma of §4.3 is not one of these headline theorems; its absence is appropriate.

### Suppliers, ownership and merge order

The board package index and overlap leads were read before resolving missing-name leads. Supplier copies were re-opened in this round using the roadmap tools and available board files. The following resolutions supplement the computation table; PR identifiers here identify the evidence copy, not proposed supplier citations in the roadmap.

| Supplier and evidence copy | Resolved location | Ownership/input checked |
|---|---|---|
| PadicLocalLanglandsForGL2Qp, PR #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, `:1300`, `:1416`, `:1657`, `:2013`, `:2311`; §§0.1–0.2,1.1–1.4,1.6,2.5,2.7,3.1–3.8,3.11,4.1k,4.2a,4.9,4.11,5.1–5.8,5.12,6.7,6.9 | Correspondence, analytic vectors, P-algebraic model, equation action, blocks and conditional realization imported. General P-finite extension belongs here (R02); compact projectives are not finite length (R04). |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4623`, `:4652`, `:4704`, `:4860`, `:4962`; §§12.4,12.5,12.7,12.14,12.19 | Tower, coverings, actions and Weil descent. Frobenius exchanges height classes; no duplicate tower construction. |
| LocallyAnalyticDistributions, PR #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891`, `:1081`, `:1344`; §§0.0–0.3 | Compact-type bounded sets, strict limits and strong duals. |
| LocallyAnalyticDistributionsPartII, board | `packages/LocallyAnalyticDistributionsPartII/README.md:213`, `:232`; §§2.2–2.3 | Enveloping closures and general ordered p-valued Frommer theorem; p=2 uses G₂. |
| LocallyAnalyticRepresentationsOfLocalGroups, board | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:164`, `:209`; §§0.3,0.5 | Differentiation and distribution action, not full G-invariance of Lie-invariant vectors. |
| ProetaleCohomologyOfPAdicCurvesAndTowers, board | `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:172`, `:192`, `:741`, `:777`, `:789`, `:801`, `:813`, `:826`; §§0.3–0.4,6.2,6.5,6.9,7.1–7.5 | General-F geometric diagram, integral Steinberg and equivariant models imported. Rational fixed-level period multiplicities and arithmetic factorisation remain here. |
| ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PR #1757 | `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:754`; §5.4 | Compact dual of finite-length smooth mod-p cohomology and finite residual Hom, for p>2. Its characteristic-zero consumer is this roadmap. |
| PhiGammaModulesAndIwasawaCohomology, PR #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1158`, `:2345`, `:2453`, `:2494`; §§2.4,5.4,5.6a,5.7 | ψ comparison, analytic Iwasawa theory, unfiltered equation, all-level exponential-image and annular inputs. |
| PadicHodgeTheory, PR #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682`, `:894`, `:982`, `:1378`; §§3.3,4.4,5.1–5.4,8.1 | Period/differential functors and comparisons. Sen theory alone does not give the separate continuous-H¹ tensor-limit gap. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:4055`, `:5283`; RD.1.73,RD.2.43 | Robba residue duality and nontrianguline de Rham ∂-bijectivity are already owned there. |
| GL2AutomorphicRepresentationsAndTransfer, PR #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:716`, `:840`; R16.1.8,R16.2.8,R16.3,R17.3 | Prescribed finite local character, smooth Kirillov model, parameters and global JL. Smooth Kirillov is not the general P-finite analytic construction. |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:935`, `:1719`, `:2275`; §§2.7,4.9,6.4 | Classical/p-adic forms and local–global compatibility; one-form globalisation. The stronger three-line input is not supplied (R01). |
| HilbertModularVarietiesAndShimuraCurves, PR #1005 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1817`, `:2343`, `:2552`, `:3937`, `:3993`, `:4014`; R18.5.3,5.16,5.21,4.24a,4.25,3.29 | Uniformisation, automorphic cohomology and semistable comparison; contragredient and weight-sign translation checked. |
| LocalGaloisDeformationRings, PR #923 | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2367`; §3.8 | Full WD-type quotient and integral image, not just inertia. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:588`, `:1916`, `:2710`, `:2744`; SR.0,SR.2,SR.3.2/cuspidal-splitting | Smooth categories, induction and complex-coefficient projectivity; general L-coefficient extension remains the declared contract. |

The roadmap search tools were used for ownership searches over main and indexed open heads, including Kirillov/P-finite models, Drinfeld cohomology/factorisation, homographic covariance and primitivable functions. The nearest-roadmap scopes listed in the overlap report were compared: base PR #1312, completed cohomology PR #1270, Scholze PR #1757, Hodge PR #1062 and PhiGamma PR #1310. No competing ownership or reciprocal supply of the new objects was found. The three board-only suppliers above resolve the resolver's three missing-section leads in the available copies; see the limitation below. Suggested.lean has no fully qualified declaration capable of colliding with a sibling.

The overlap report has no conflicting head changing this roadmap, no dropped cited id, no removed id needing an old→new mapping and no citation defined only by an open revision. No such overlap finding is added.

The complete output of the required dependency check was:

    depcheck: 236 roadmaps, 2148 edges, 0 problem(s)

It exited 0, with no UPWARD, CYCLE or moved line. Manual examination of every Needs line found no upward supplier. R01 is a semantic supplier insufficiency that this name-level check cannot detect.

The three declared gaps have matching slugs and named suppliers in `design/plan.json` and README Exact supplier contracts. They are precise and remain necessary: `fixed-radius-divisibility` asks for both-chart fixed-radius control, not unrestricted Robba divisibility; `cuspidal-projectivity-coefficients` extends the cited complex theorem to characteristic-zero L with fixed central character; `continuous-galois-tensor-comparison` asks for the strict continuous-H¹ model and compatible completed tensor/limit comparison. None is treated as an unowned prerequisite. Acceptance after repair would remain conditional on these contracts and any new R01 contract.

## Not verifiable

- No cited source text was inaccessible. No missing-reference request was created. The cached versions and their internal locators were checked; no claim is made to have independently compared every page with a different published pagination.
- The supplied board index does not identify independent indexed pull-request heads for LocallyAnalyticDistributionsPartII, LocallyAnalyticRepresentationsOfLocalGroups or ProetaleCohomologyOfPAdicCurvesAndTowers. Their available package sections were inspected and resolved. Identity of those copies with a separately moving head was not verifiable from the supplied index. Ownership against other open work was checked through the supplied roadmap tools; no unspecified checkout was sought.
- The three declared supplier gaps are future contracts, not completed theorems in the supplied libraries. Their eventual proofs are not certified by this review. R01 concerns an additional input which is presently asserted as supplied instead of declared.

## Source issues

- **Error** in DLB17 at Theorem 1.10, printed p. 11 (DLB17 line 447): the source says all infinitely primitivable functions descend to the half-plane; it should allow component constants multiplying pullbacks; affects a stated result.
- **Gap** in DLB17 at the proof of Theorem 9.7, printed pp. 47–48 (DLB17 line 1998): the source says the displayed one-sided inverse establishes invertibility; it should also establish the other inverse, for example using the inverse group element; affects the proof.
- **Gap** in DLB17 at Remark 11.13, printed p. 66 (DLB17 lines 2773–2781): the source says two unmarked line comparisons determine all extension classes; it should fix their relative scale or establish an independent third marked line; affects the proof.
- **Misprint** in DLB17 at Remark 11.13, printed p. 66 (DLB17 line 2775): the source says the second analytic representation corresponds to the first period line on the other side; it should use the second period line on both sides; affects the proof.
- **Gap** in DLB17 at §12.1, printed p. 66 (DLB17 lines 2797–2799): the source says every nontrivial division-algebra type satisfies the stated supercuspidal comparison; it should separately handle one-dimensional types and nontrivial central characters; affects the proof.
- **Misprint** in CDN20 at Lemma 2.18, printed p. 30 (CDN20 line 1186): the source says all companion coefficients are positive elementary symmetric functions; it should use alternating signs from the prescribed characteristic polynomial; affects the proof.
- **Gap** in CDN20 at Lemma 2.18, printed p. 30 (CDN20 lines 1188–1193): the source says the chosen complement permits induction on the second partial operator; it should justify its domain inclusion and absence of nonzero invariant subspaces; affects the proof.
- **Error** in CDN23 at Proposition 5.7 and Theorem 5.8, printed pp. 63–64 (CDN23 lines 2430–2434 and 2471–2474): the source says a level bound alone selects nonzero multiplicities on the p-central quotient; it should additionally require trivial action of central p, as its proof does; affects a stated result.
- **Misprint** in CDN23 at Theorem 5.15, printed p. 68 (CDN23 line 2624): the source says the coefficient dual is defined as the dual of itself; it should be the continuous L-dual of the coefficient ring; affects a stated result.

These source issues are distinct from R02, R03 and R04, where the package's restriction or inference is the problem. R01 is the unresolved stronger input introduced to address the source's marked-line gap.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1647178d649830075a4bda4f181fc1b115dac060", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
