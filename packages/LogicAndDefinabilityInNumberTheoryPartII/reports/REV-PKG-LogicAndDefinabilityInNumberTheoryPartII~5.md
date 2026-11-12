<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6786773411 -->
Review (codex) of b6a9bce

Verdict: needs_changes

1. **F01** (P2) The adapted fibration needs a stronger finite-field supplier

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1012`, §5.4: “The existence of such a fibration is a Bertini-type statement for pencils over the finite constant field.” Its Needs line at 1020 cites LefschetzPencilsAndVanishingCycles §§3.4–3.5; the supplier contract is at 103.

   **Claim:** Those sections provide the smooth fibration adapted to the specified divisor over the original finite constant field, so its base function field, and then its relative algebraic closure, lie inside K.

   **Witness:** LefschetzPencilsAndVanishingCycles, open pull request #873, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2478–2483`, provides a pencil over some F_(q^r), explicitly allowing no F_q-rational good axis. For K=F₂(s,t), F₄(s) is not a subfield of K.

   Indeed K has constant field F₂, whereas F₄(s) contains a root of X²+X+1. Extending constants supplies geometry for K F₄, not the requested subfield of K. Geometric nonemptiness does not close the gap: A¹_F₂ minus {0,1} has zero F₂-points and two F₄-points. The geometric pencil theorem §3.4 does not supply the missing rational point either. The nearby boundary-adapted construction, #929, `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2028–2039`, likewise permits a finite constant extension. The alteration fibration in AdicCoefficientsAndComparisonsPartII §PA.6.1 also permits field extensions/alterations; it does not fix this issue. SchemeAndStackFoundations §4.13 states Bertini over infinite fields; its §4.18 curve-fibration reduction also descends only after a finite field extension.

   The mathematical conclusion of §5.4 is not refuted: `dittmann_pop line 681` asserts the adapted subfield. What fails is the claimed prerequisite for the stated proof route. `pop_eei2 line 301` describes smooth fibrations without supplying this original-finite-field Bertini step. A citation to that assertion does not implement the missing geometric input.

   **Exact repair:** Retain the full statement of §5.4. Declare a minimal earlier-supplier gap, for example `finite-field-divisor-adapted-fibration`, assigned to LefschetzPencilsAndVanishingCycles §3.5. Its needs sentence should request: for a smooth projective geometrically integral surface X over a finite field k and an integral curve C in X, a smooth projective birational model X′, a smooth projective geometrically integral k-curve B and a dominant k-morphism X′ → B with smooth geometrically integral generic fibre and horizontal strict transform of C, all over the original k. Record the same slug in the plan's top-level gaps and the README's Exact supplier contracts, and cite it in §5.4. Do not replace K by a constant extension or restrict to fields with enough rational good axes. An independently owned proof of precisely this original-field result is an alternative to the gap.

   **Repair test:** For K=F₂(s,t), take X=P¹×P¹, C=(t=0), B=P¹_s and projection to s. The generic fibre is P¹ over F₂(s), v_t(s)=0, and C maps dominantly onto B. The proposed contract supplies exactly the required type of object; F₄(s) fails its original-base-field condition. The proposed supplier is earlier in the merge order. No author file was changed by this review.

   One finding, one blocking. All six findings from round 4 are repaired. This finding is new, not a re-raising of a finding marked not actionable.

## Verified sound

### Previous findings, repaired passages and pattern checks

The repair report and the previous review were read first. Each changed mathematical passage was reconsidered, including the source-manifest locator changes. Only earlier adversarial rows containing computed values were used as prior evidence; narrative-only coverage was not treated as certification.

| Previous finding | Repaired passage in README | Status and independently checked values |
|---|---|---|
| F01: separably closed need not be C₀ | 234: “Let k̄ be an algebraic closure of k, purely inseparable over k, and K′ = K k̄.” | **Repaired.** Over k=F₂(s)^sep, X²+sY² has no nonzero zero: √s is absent. X³+s has a root in k because its roots are separable. Thus the repaired argument uses the allowed degree-three descent, not false C₀ ascent. |
| F02: inseparable residue coefficients | 236: “For 0 ≤ j ≤ h put A_j = A/(t_{j+1}, …, t_h) and F_j = Frac(A_j).” | **Repaired.** At π=u²+s in F₂(s)[u], the residue is F₂(r), r²=s. A coefficient lift z²=s would force 2v(z+u)=1. The flag route instead lifts X³+r²Y³, anisotropic since ord_r(r²)=2 modulo 3; its three π-blocks have distinct valuations 0,1,2 modulo 3. |
| F03: inseparable cubic descent | 232: “write a nontrivial zero over L as P = P₀ + αP₁” | **Repaired.** For q=X³+sY²Z and P=(r,1,r), P₀=(0,1,0), P₁=(1,0,1). Restriction to XP₀+YP₁ is Y(Y²+sX²), whose linear factor gives P₀ as a K-zero. The double quadratic factor is retained. A separable control over Q(i) gives X(X²+Y²). |
| F04: arithmetic core needs infinitude | 1277: “Let B be an infinite finitely generated integral domain with fraction field K.” | **Repaired.** In F₄ every b has b⁴−b=0 and no transcendental t exists. It is excluded. F₂[s,t] gives core F₂[t]; Z[√5,t] gives Z[√5], each dimension one. |
| F05: fraction interpretation page | 1302: “AKNS, Examples 2.9(4), p. 13” and “Dittmann–Pop, proof of the bi-interpretability theorem, pp. 17–18” | **Repaired.** `akns line 565` starts page 13; lines 567–574 give localization and fractions. For (1,2) and (2,4), cross products are both 4 and the interpreted value is 1/2. `dittmann_pop line 779` continues the second comparison on page 18. Related citations at 1314, 1350 and 1393 agree. |
| F06: Q(s) called global | 418: “the field ℚ(s) is not a member (Kronecker dimension two)” | **Repaired.** δ(Q)=1 and δ(Q(s))=2. The excluded field is no longer called global. |

Searched the remaining occurrences of separable closedness/Tsen–Lang, smooth points and Laurent embeddings, conjugates/quadratic extensions, infinite finitely generated domains, fraction interpretation locators and global-field examples. The other coefficient-field uses retain separable residues; §0.6(e) no longer depends on §0.5. The odd-degree quadratic-form descent explicitly consumes Springer's theorem in inseparable extensions. The other conjugate-point construction is over a Galois extension. §§7.2, 7.4 and 7.6 use infinite domains; §8.4 separates finite domains. No recurrence of the six repaired patterns was found.

### Principles and shape

Read all 74 numbered target subsections, all 74 Check blocks, the conventions, supplier contracts, layer examples and Needs lines. There are nine layers, each with Examples and Dependencies. Definitions retain an API and at least three Checks; the seven shorter two-Check blocks are theorem blocks, not missing definition tests. Main's AlgebraicCurves, EllipticCurves and ClassFieldTheory were read for comparison of shape.

The extension starts where the base logic roadmap stops: interpretations, quotient semantics and fractions are imported, while uniform arithmetic of finitely generated fields is developed here. The mathematical direction is arithmetic predicates → cohomological detection → test forms → compactness/coarsening → stabilizers → divisor formulas → normalizations → bi-interpretation → sentences. The dependencies force this order. No source-chapter organization, route-specific good-prime restriction, replanning of the base, computational algorithm, copied source exposition, process residue, machine path or HTML anchor was found in the roadmap. Characteristic two, split quadratic étale algebras, inseparable extensions and all prolongations remain in scope. R01 is a prerequisite-strength defect, not a request to narrow that scope.

The manifest records eighteen works, fourteen certified and four settled uncertified, with one key per work. Version conventions identify the preprints being cited. No source was added or fetched in this round. The metadata topic is appropriate. The author's four reviewed files were left unchanged.

### Seeded source sample

All fifteen requested targets were checked at the following locations. Source line numbers refer to the cached extractions. “Supports” below certifies the stated content and hypotheses at the indicated locator, not every unpublished formal proof step.

| Sample | Text read and printed locator | Result |
|---|---|---|
| 0.7 Rumely's uniform arithmetic | `rumely line 22`, Introduction I–III, pp.195–196; line 687, p.211; `poonen_uniform line 113`, Theorem 2.2, p.3; `akns line 1055`, Lemma 3.8, p.23 | Supports global-field uniformity and coding. Rumely gives the coding map and leaves its definability as an exercise; the restricted digit set used here is stated explicitly. |
| 0.12 Relatively closed global function subfields | `poonen_uniform line 415`, Lemmas 4.7–4.9 and Proposition 4.10, pp.9–11 | The roadmap corrects the extension-valued elliptic test and double-pole issue. Its maximal-fibre filter supplies relative algebraic closedness; it does not pretend Proposition 4.10 alone states maximality. |
| 0.16 Relative constant field k_t | `dittmann_pop line 597`, Notations/Remarks 4.1, pp.13–14 | Supports the relative closure, algebraic independence and one-variable function-field setup. |
| 2.3 Approximation for the tail | `dittmann_pop line 407`, Lemma 3.5 and proof, pp.9–10 | Supports simultaneous local choices, signs and the distinguished split place. |
| 2.4 Nice tails over a separable extension | `dittmann_pop line 407` through line 431, Lemma 3.5, pp.9–10 | Supports niceness and anisotropy after the stipulated separable extension; the split-place and local norm conditions are retained. |
| 4.3 Finite V_a | `dittmann_pop line 614`, Notations/Remarks 4.1, p.14 | Positive odd outer order, lower unit slots and anisotropic tail agree. Finiteness is on the proper curve over k_t, not on all valuations of K. |
| 4.6 Union-of-balls identity | `dittmann_pop line 619`, Theorem 4.2 and proof, p.14 | Both inclusions use the strict inequality 2w(τ)>w(a_d); τ=0 and the empty detecting family have the correct branches. |
| 5.1 First-order niceness and units | `dittmann_pop line 340`, Definition 3.3, p.8; line 665, Recipe 4.3, p.15 | Dyadic trigger, real positivity and unit restrictions are not conflated. The characteristic-two branch does not impose a dyadic test. |
| 5.3 Uniform divisors in dimension ≥3 | `dittmann_pop line 619` through line 673, Theorem 4.2 and Recipe 4.3, pp.14–15 | Supports the formula assembly; dimension/resolution assumptions are carried through H_d. Fibre verification and exhaustion are separately stated. |
| 5.4 Adapted smooth fibrations | `dittmann_pop line 674` through line 683, Remark 4.4, p.15; `pop_eei2 line 301`, §3A, p.2098 | The desired adapted subfield is asserted. Its chosen geometric proof route has the supplier mismatch R01. |
| 5.5 Low-dimensional shifted rings | `pop_eei2 line 474`, Notation 3.5, p.2102; line 511, Notation 4.1, p.2103; line 607, §4C/4.4, p.2106 | Root-field quantifiers and shifted operations agree. The characteristic-two threshold is corrected to v(n), not the printed v(2n). |
| 6.2 Finite normalizations | `dittmann_pop line 694`, Proposition 5.1, p.16 | Supports finite normalization with full fraction field. No separability assumption is added to normalization finiteness. |
| 6.5 Full flags and terminal place | `dittmann_pop line 715`, Proposition 5.1 Case 2, p.16 | The roadmap corrects the rank-one indexing slip by using a full geometric flag ending in a number field, followed by an arithmetic place. |
| 6.6 Flags refine detecting divisors | `dittmann_pop line 737` through line 750, Lemma 5.3 proof, p.17, together with Case 2 | The source compresses the inclusion into the flags. The roadmap expands it through an étale model and a flag whose basis coordinates remain integral; no positive-characteristic generic-smoothness assertion is smuggled into this characteristic-zero step. |
| 7.3 Finiteness of arithmetic core | `akns line 1014`, Lemma 3.6, p.22; lines 1064–1082, proof of Theorem 3.1, p.23 | Supports finiteness under the repaired infinite-domain hypothesis. The roadmap additionally repairs the source's premature assertion of normality by conductor localization. |

The repaired diagonal-form locators were also opened: `poonen_uniform line 584` (A.1), line 588 (A.2), line 594 (A.3), line 615 (A.5), pp.13–14. The replacement regular-local route uses Stacks tags 00NP–00NQ (`stacks line 11920`, Commutative Algebra), 00PD (line 13409) and 00TT (line 17618). They give regular local quotients, the one-dimensional DVR criterion and smooth local regularity. These supply the residue-field-compatible flag argument without the false coefficient lift.

### Adversarial values

The table records the seeded targets, all acceptance theorems, the repaired mathematics and the new finding. Additional unchanged targets with computed rows in round 4 were reconsidered against their present text. In the value column, a formula's stated truth value is compared with its intended predicate; no unknown formula is claimed to have been executed.

| Statement | Instances and computed sides | Result / change |
|---|---|---|
| 0.1; dimension sentence | F₄: trdeg=0, shift=0, δ=0. Q: 0+1=1. Q(s,t): 2+1=3. Q̄: 0+1=1 but FG=false. Sentence for n=3 is true only in the third FG example. | Finite generation and shift retained. |
| 0.2; geometric divisor predicate | t-adic Q(s,t): residue Q(s), δ=2, so 2+1=3 and equal characteristic=true. A p-adic place of Q has residue δ=0 and 0+1=1, but characteristic equality=false. The whole field has no DVR structure. | Arithmetic/trivial valuations excluded. |
| 0.6(a), cubic descent | q=X³+sY²Z over F₂(s), P=(r,1,r), r²=s: q(P)=sr+sr=0; restricted cubic Y(Y²+sX²); q(0,1,0)=0. Separable control over Q(i): X(X²+Y²). | Both quadratic extension types pass. |
| 0.6(c), separably closed base | F₂(s)^sep: X²+sY² has zero-set {0}, while X³+s has a separable root; degree-three binary form has a nonzero zero. | False C₀ intermediate claim removed. |
| 0.6(e), smooth inseparable point | π=u²+s: v(π)=1; hypothetical coefficient lift gives even value 2v(z+u)=1. Correct flag's cubic block values are 0,1,2 mod 3. | Flag proof handles the excluded coefficient model. |
| 0.7, global arithmetic/coding | Q: intersection of finite-place rings=Z; 1/2 fails at 2. F₂(t): t is in F₂[t], 1/t is not. Digit codes with exponents 1,2,3,6 encode 0,1,t,1+t respectively. | Arithmetic intersection and one-based coding agree. |
| 0.10; characteristic sentence | Q: char=0; F₂ and F₃: char=2,3. In F₂, 2=0; in F₃, 2 is a unit. Positive-characteristic implication has no FG hypothesis. | Characteristic branches and actual signature agree. |
| 0.12, elliptic test | E/F₅: y²=x³+x+1 has 9 points, trace −3. Nonzero anti-invariant z gives σ(2z)=−2z≠2z. At P=(2,1), z=y/x=3 and 2z=1; s²−1 at s=1 has derivative 2 and simple order 1. | Test stays in K_u; corrected pole has order −1. |
| 0.12/0.15, maximal global fibres | F₄(s,t): F₂(s) is properly contained in F₄(s), with constant-field degrees 1 and 2 over F₂; first fails maximality. Q(s,t): Q has δ=1, Q(s) has δ=2. | Relative closure and dimension filters discriminate. |
| 0.13; constant-field formula | In F₉(t), all 9 constants are algebraic over F₃; t is transcendental. In Q(t), constants=Q and t is excluded. | Relative algebraic closure, not prime field alone. |
| 0.14; dependence formula | Empty tuple: independent=true, dependence=false. Tuple (0): dependence=true via X. (s,s²): true via Y−X². (s,t): false. | n=0 and both directions retained. |
| 0.16, relative k_t | Q(s,t), chosen s²−s: relative closure is Q(s), derivative 2s−1≠0. In char 2 derivative is 1. Replacing by s² gives derivative 0 in char 2. | Separating tuple condition matters. |
| 2.3, selected-tail approximation | Q, selected v=5: a₀=3 has v₅=0 and nonsquare residue 3; a₁=145 has v₅=1, is 1 mod 8 and 1 mod 3; a₀>0 at the real place. | Distinguished anisotropic place and dyadic/real local conditions compatible. |
| 2.4, extension anisotropy | For Q(i)/Q, 5 splits; the selected completion is still Q₅. Tail (3,145): nonsquare unit 3 and odd second order 1 remain; anisotropy=true before and after that local extension. | Separability/splitting retained. |
| 3.6, higher-rank coarsening | Lexicographic Z²: w(y)=(1,0)>Nw(x)=(0,N) for every natural N; coarsening kills second coordinate, so w̄(y)=1, w̄(x)=0. | No Archimedean rank-one substitution. |
| 4.2, multiplicative stabilizer | Stab(∅)=K; Stab({1})={1}; Stab(Z inside Q)=Z, since x·1 must be integral. Equality-preserving multipliers of Z are only ±1. | Inclusion, not equality, is the convention. |
| 4.3, detecting family | Constant outer slot has all outer orders 0, so V_a=∅. For a selected anisotropic tail and outer slot t, t-divisor has order 1 and lower orders 0; it qualifies. | Positivity, oddness and lower-unit conditions independent. |
| 4.6, union of balls | At t-divisor, outer slot t³: τ=t gives 2≤3, excluded; τ=t² gives 4>3, included; τ=0 gives ∞>3, included. Empty V_a gives empty union. | Strict threshold and zero branch agree. |
| 4.7, stabilizer of a union | Two places P,Q: take y-orders (1,−2) in the first ball, multiplier x-orders (−1,0); xy-orders (0,−2) are in neither positive ball. | A multiplier with a pole is excluded; intersection, not union, of valuation rings. |
| 5.1, dyadic trigger | q=⟨1,−3,−5,15⟩ at (1,0,0,1): q=16, derivative coordinate 2, v₂(q)=4>2v₂(2)=2. At 3, nonsquare unit 5 and odd slot order 1 obstruct isotropy. | Local trigger does not assert global isotropy. |
| 5.1, real/char-2 branches | Both slots −1 over R give sum of four squares, zero-set {0}; real niceness fails. In char 2 the guard 2≠0 is false. | No accidental omission of real places or dyadic test in char 2. |
| 5.3; divisor-formula headline | Q(s,t): t-divisor and exceptional divisor at origin have residues Q(s), Q(s/t), each δ=2; an arc valuation with residue Q has δ=1. The first two satisfy 2+1=3, the last 1+1≠3. | Exhaustion covers both models; wrong rank-one valuation excluded. |
| 5.4, fibration supplier | U=A¹_F₂ minus {0,1}: #U(F₂)=0, #U(F₄)=2. K=F₂(s,t): constants=F₂; proposed F₄(s) contains a root of X²+X+1, K does not. | **R01**: constant extension cannot supply a subfield of K. |
| 5.4, repaired contract test | X=P¹_s×P¹_t, C=(t=0), base=P¹_s: generic fibre=P¹ over F₂(s), v_t(s)=0; C→base has degree 1. | Original-field contract has the required result. |
| 5.4, smoothness control | y²=x³+s over F₂(s): local maximal ideal at x=0 is (x), so regular dimension 1; after √s extension it is (y+√s)²=x³, a cusp with zero gradient. | Regular≠smooth over imperfect base. |
| 5.5, shifted rings in char 2 | n=3, c_n=1 gives v(c_n)=0. β=1 has v(β−1)=∞>0; β=1+t has value 1>0. Old 2n=0 gives threshold ∞ and fails even β=1. Shifted product x*1=x; x∘2=x. | Correct threshold and identities retained. |
| 6.2; normalization setup | K=F₂(u,s), basis (u²,s): normalize F₂[u²,s] to F₂[u,s], module basis (1,u), rank 2, fraction field K. Q(t): Z[t] has fraction field Q(t), Q[t] is not finitely generated as a ring. | Purely inseparable and arithmetic cases included. |
| 6.5, full flags | Q(s,t): s-adic then t-adic gives rank 2 and residue Q; adding 3-adic gives rank 3, residue F₃. Q alone: empty geometric flag plus 3-adic rank 1. | Empty flag and terminal characteristic drop correct. |
| 6.6, integral refinement | At s-divisor, use t=0 flag then 3-adic: w(s)=(1,0,0), w(t)=(0,1,0), both nonnegative. Choosing t=∞ gives w(t)=(0,−1,0), not nonnegative. | The chosen flag must retain basis integrality. |
| 6.8, all prolongations | In Q(i), x=1/(2−i): ord_(2+i)(x)=0 but ord_(2−i)(x)=−1. | One prolongation would wrongly admit x; all are required. |
| 6.9; normalization formula | K=Q, empty basis: integrals over Z are Z. K=F₄, empty basis: integral closure of F₂ is F₄. K=F₂(t), basis t²: integral closure F₂[t²] is F₂[t]. | Basis length zero and inseparability agree with Lean. |
| 7.3, core and conductor | B=Z[√5,t]: D=Z[√5], normalization Z[(1+√5)/2]; 2 times the normalization lies in D. Inverting 2 identifies their localizations. B=F₄ has dimension 0 and fails infinitude. | Corrected normality route and hypothesis. |
| 7.5, fraction comparison | (1,2)~(2,4) since 1·4=2·2=4; both give 1/2. Pair (1,0) is outside fraction domain. | Definable equivalence, no representative choice. |
| 8.2, inverse graph | Field: x=0 has sole inverse-graph partner y=0; x≠0 has xy=1. Z/4: x=2 has no partner satisfying xy=1. | Field axioms included in ring-language conversion. |
| 8.4; domain characterization | B=Z: Z is accepted, F₂ and zero ring fail its characteristic/nonzero conditions. Finite B=F₄: cardinality 4 with field axioms accepts F₄, rejects F₂. | Comparison class is finitely generated commutative rings; finite case separated. |
| 8.5; field characterization | K=F₄: F₄ is accepted, F₂ and F₄(t) rejected (cardinalities 4,2,infinite). K=Q has δ=1, unlike F₂ (δ=0). | Formula is chosen from K before the comparison field; no hypothesis H_d imposed on the latter. |

For cohomological and patch inputs the previously computed tests remain applicable: real places have nonzero mod-two cohomology in every degree; a henselian non-dyadic DVR example F₃[[t]] satisfies excellence and 2 invertible; split quadratic étale norm is (u,v)↦uv and is surjective; a principal-unit outer slot makes the relevant Pfister form hyperbolic. Reading the repaired text did not reveal changes to those hypotheses. Empty parameter families, zero elements, rank-one versus higher-rank valuations and characteristic-two symbol conventions were checked at each consumer.

### Lean acceptance test and headline completeness

The direct command `lake env lean <Suggested.lean>` was run from the content checkout against its pinned manifest. It exited 0, with exactly eight warnings, each “declaration uses 'sorry'”, and no other warnings or errors. No library build was necessary. The actual import header is the single `import Mathlib`.

A separate copy appended `#check @name` for every declaration. All ten elaborated types were compared with their README statements. Both simple definitions and all eight theorems retain the needed binders; no type changed. In particular, CompatibleRing instances connect syntax to the actual ring operations, FG is field generation, the normalization test retains the transcendence-basis hypothesis, and the final theorem restricts the chosen K but compares with all finitely generated fields L.

Every sorried theorem was tested in a scratch copy against each of `simp`, `rfl`, `infer_instance`, and `exact?`, guarded by `fail_if_success solve`. All 32 probes failed to close their theorem; the probe file elaborated with only its eight terminal sorry warnings. The library-near-match leads were opened at the pins and compared by object. None proves one of these eight uniform or characterizing statements in one step. No API theorem, boundary-only theorem, definition restatement or Check is padded into the file.

| README headline / deep result | Acceptance-file treatment |
|---|---|
| §0.8 fixed Kronecker dimension | `exists_sentence_kroneckerDimension_eq` |
| §0.10 characteristic-zero sentence | `exists_sentence_charZero` |
| §0.13 uniform constants | `exists_formula_isAlgebraic_primeField` |
| §0.14 uniform algebraic dependence | `exists_formula_not_algebraicIndependent` |
| §§5.3, 5.6–5.7 uniform geometric prime divisors | `exists_formula_isGeometricPrimeDivisor`, unconditional char≠2 or d≤3 range |
| §6.9 uniform finite arithmetic normalizations | `exists_formula_arithmeticNormalization`, same unconditional range |
| §§7.4–7.6 arithmetic bi-interpretation of infinite domains and fields | Named in module docstring as not statable: interpretation/composite-homotopy carriers missing. No free predicate substitute. |
| §8.4 domain characterization | `exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain` |
| §8.5 field characterization | `exists_sentence_realize_iff_nonempty_ringEquiv` |
| Full char-2, dimension>3 conditional forms | Named in docstring as not statable: the global resolution/SNC compactification hypothesis has no requisite pinned carrier. No empty Prop flag. |

The two real-body definitions are `kroneckerDimension` and `IsGeometricPrimeDivisor`, needed by these signatures. All ten own names appear in the README; every backticked name attributed to this roadmap was reconciled with the acceptance file. The bi-interpretation and global resolution omissions are genuine carrier omissions, not proof difficulty. Tau Ceti's local algebraic SNC chart is not a carrier for the two quantified global RS clauses.

### Pinned library evidence and duplication by object

The checked pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to those library repositories. The cited declarations were opened, not inferred from current online documentation.

| Pinned file and line | Declaration / comparison checked |
|---|---|
| `Mathlib/ModelTheory/Algebra/Ring/Basic.lean:59,156,223` | ring language, CompatibleRing, compatibleRingOfRing; syntax is not silently identified with arbitrary structures. |
| `Mathlib/ModelTheory/Semantics.lean:526,627`; `Mathlib/ModelTheory/Definability.lean:54` | Formula.Realize, Sentence.Realize, Set.Definable; syntax and parameter definability, not bi-interpretation carriers. |
| `Mathlib/Algebra/Field/Subfield/Basic.lean:458` | Field.FG means finitely many field generators. |
| `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45`; `Defs.lean:54,173` | Cardinal trdeg, algebraic independence, transcendence basis; no finite-type-ring replacement. |
| `Mathlib/FieldTheory/AlgebraicClosure.lean:39`; `Mathlib/RingTheory/Algebraic/Defs.lean:45` | Relative algebraic closure and algebraicity through a nonzero polynomial. |
| `Mathlib/Algebra/CharP/Defs.lean:154`; `Mathlib/FieldTheory/Finite/GaloisField.lean:260` | ringChar; finite fields of equal cardinality are isomorphic, requiring Fintype. |
| `Mathlib/RingTheory/Valuation/ValuationSubring.lean:37,298`; `LocalSubring.lean:117` | Valuation subrings include the whole field; ofPrime is coarsening; dominating extension uses a local subring. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `LocalRing/ResidueField/Defs.lean:28`; `Henselian.lean:95` | DVR excludes fields; residue field is the maximal-ideal quotient; henselian root lifting does not imply excellence. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054` | QuadraticMap.Anisotropic says zero value forces zero vector; isotropy is its negation. |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:53`; `IsIntegral/Algebra/Basic.lean:71,223` | Monic integral equation and finite-module integrality; not uniform definability. |
| `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74`; `Localization/FractionRing.lean:52`; `FiniteType.lean:39` | Integrally closed predicate, fraction localization, algebra finite type; domain hypotheses checked separately. |
| `Mathlib/Algebra/Ring/Subring/Basic.lean:483` | Subring.closure; empty generating set gives the prime subring, explaining arithmetic normalization. |
| `Mathlib/RingTheory/KrullDimension/Field.lean:24` | Field Krull dimension is zero, not the Kronecker dimension of Q. Near-match is not duplication. |
| `Mathlib/ModelTheory/Algebra/Ring/Definability.lean:29` | Definability of a specified polynomial zero locus is weaker than the uniform algebraic-dependence theorem. |
| `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:561` | The localization-intersection result has a Dedekind hypothesis; it does not replace §6.3 for arbitrary Noetherian normal domains. |
| `TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96,196,209` | Patch topology, compactness and basic clopens on all Spv, including trivial valuations. |
| `TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103,132,145,167` | Place, integers, ord and ord_zero=0; zero must be split off from the additive ∞ convention. |
| `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:145` | Prescribed finite integer orders with nonzero solution. |
| `TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:247`; `Consequences/StrongApproximation.lean:88` | Single pole for n≥2g and strong approximation outside a proper set; full-constant-field hypotheses are present. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84` | Pointed Albanese universal property, not arbitrary-field existence of the rational unpointed torsor. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43` | A nonempty smooth scheme has a point over some finite separable extension; not every closed point is separable. |
| `TauCeti/RingTheory/SerreCondition/Normal.lean:128` | Serre R₁/S₂ normality criterion; no separate general height-one intersection interface replacing §6.3. |
| `TauCeti/AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:45` | Local étale polynomial chart with coordinate-product divisor; not the global SNC compactification/RS hypothesis. |

Object searches were run through the roadmap service across main and open heads, and against the board packages and both pinned libraries: geometric prime divisors, arithmetic definability, bi-interpretation, normalization/intersections, Albanese existence, Pfister forms, valuation compactness, symbols, local–global detection and Bertini/fibrations. No other acceptance file was found owning the same fully qualified theorem names.

The height-one intersection in #1754, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:226`, is an input in the proof of Cartier-to-Weil injectivity, not a duplicate general theorem interface. The existing Dedekind intersection and normality criterion above do not supply the arbitrary-dimensional normal-domain theorem. This package remains the owner of that interface. Its rational Albanese torsor extends pointed characteristic-zero existence rather than restating it. Pfister invariants, odd-degree descent, henselizations, normalization finiteness and alteration theorems remain imported from their named owners.

### Supplier resolution and merge order

The board package index was read before resolving apparent absences. In particular the service's two missing-roadmap leads are false positives: the base LogicAndDefinabilityInNumberTheory is present at its indexed board head, and LocalFieldsRamificationPartII is a board package. The five unresolved-library-name leads are planned supplier declarations, and were found in the cited supplier sections. They are not misrepresented as pinned Lean declarations.

| Supplier and current file location | Resolved content |
|---|---|
| `packages/LogicAndDefinabilityInNumberTheory/README.md:151–232`, indexed #164 head 8d875d1 | §§0.1–0.4 quotient interpretations, semantics/composition, fractions, arithmetic. No homotopy interface claimed without its gap. |
| `packages/LocalFieldsRamificationPartII/README.md:384–447,1086–1165` | §§1.1–1.3, 5.1–5.3; normalization/prolongations, henselization, inverse-image composition, coarsening and Abhyankar. |
| `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md`, #1834, §§1.1–1.2, 1.5, 2.5, 3.1, 3.7–3.9, 4.1–4.3, 5.6–5.7, 6.3, 6.5, 7.2 | Pfister/norm conventions, inseparable odd-degree descent (908), Tsen–Lang (1619), dimension (1638), away-from-2 Jannsen (1826), no-FG dimension theorem (1903), isotropy openness (1985). |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1832,9281–9307`, #853 | §3.5 ample-bundle descent includes its own cocycle, including nonreduced inseparable fibre squares. §7.5 normalization finiteness, all-prolongation integrality and root-coefficient descent with multiplicities. |
| `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:1604,1632`, #1796 | PA.6.8 and PA.6.10, excellent bases and odd degree, without an invented separability hypothesis. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2074,3527`, #858 | R02.3.2 function-field class formation; R02.4.4 number-field cohomological-dimension bound, excluding real-place obstruction when ℓ=2. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md:2406`, #1474 | §5.8 degree-sensitive Chebotarev; compatibility with constant-field Frobenius. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:963,1400,2921`, #849; `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3109`, #852 | Weil extension, isogenies, complete reducibility; NOS and isogeny invariance of good reduction. |
| `TauCetiRoadmap/ColemanIntegrationPartII/README.md:637`, #1360 | §4.0b pointed characteristic-zero Albanese existence. |
| `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3582`, #1495; `TauCetiRoadmap/WeilConjectures/README.md:1335` | Uniform affine Lang–Weil including arbitrary bounded-dimensional fibre upper bounds; separate curve RH. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2410,2458,2478`, #873 | §§3.4–3.5 exist, but finite extension allowed: **R01**. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2254,2308`, #929 | §§7.12,7.15 weights/purity with invertible coefficient prime. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:160`, #1313; `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:486,512`, #1281 | Gersten support; §§3.0–3.0a logarithmic symbols, residues and norm-residue comparison, not ownership of the arithmetic detection theorem. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:5697`, #875; `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1160,1448,4001` | §11.2 field cohomological dimension input; henselizations, Nagata normalization and cohomology/limits. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:616`; `TauCetiRoadmap/AlgebraicCurves/README.md:403,478,712,1468` | Mertens §0.21; places, affine normalization including inseparability, extension identity and curve dictionary. |
| `Completed/Chebotarev/README.md:410`; `Completed/GlobalNumberFields/README.md:259,439` and `Suggested.lean:355` | Chebotarev and weak/strong approximation; the cited strong-approximation target name exists in Suggested.lean despite the README also using the library-qualified form. |
| `TauCetiRoadmap/GlobalQuadraticForms/README.md:769`; `Completed/RealAlgebraicGeometry/README.md:130` | Hasse–Minkowski with real places; ordered real-closure existence. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1638,1924` | Brauer–Hasse–Noether and number-field cyclic Hasse norm; no function-field norm theorem silently inferred. |
| `TauCetiRoadmap/EllipticCurves/README.md:423,683,793,1154,1200`; `TauCetiRoadmap/JacobianChallenge/README.md:448` | Isogenies/formal groups, Hasse bound, local reduction, twists, Mordell–Weil; pointed curve Albanese property. |

The overlap report has no competing change to this roadmap, dropped cited id or revision-only citation. The scopes at the five closest heads were read: #1834 QuadraticFormInvariantsPartII, #1796 AdicCoefficientsAndComparisonsPartII, #1313 MotivesAndAlgebraicCycles, #1017 HeightsRationalPointsAndObstructions and #1743 EtaleDualityAndPerverseSheavesPartII. Their quadratic, alteration, motivic, height and excellent-duality objects are distinct from this package's owned uniform definitions, or expressly imported. No mutual handoff or duplicate ownership was found in those scopes.

The exact dependency check required by the brief exited 0:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This is an order check, not evidence that a supplier proves the strength attributed to it; R01 illustrates the difference.

The two existing gaps match between `design/plan.json` and the README's Exact supplier contracts: `biinterpretation-homotopy` (base logic §0.2) and `function-field-cyclic-hasse-norm` (ArithmeticGaloisDuality §R02.3.2). They have named earlier suppliers, precise hypotheses and minimal missing interfaces. Composition of interpretations does not supply definable comparison homotopies; the number-field norm theorem does not discharge the function-field contract. These are legitimate conditional inputs and not findings. The proposed R01 gap has not been added by the reviewer.

## Not verifiable

- The settled uncertified primary texts `kato_hasse` (Corollary p.145 and p.149), `merkurjev_suslin` (Theorem 12.2), `moret_bailly` (Lemma 11.1(i)) and `lenstra_cm` (Theorem 1(a)) were not available for direct reading. Accessible citing papers corroborate their use, not their full proofs. No repeat request or new key was made.
- The disclosed arXiv numbering was used. The Jannsen crosswalk to the published typesetting was not independently re-certified against that typesetting.
- The broad Stacks Resolution of Surfaces chapter reference was not re-read chapter-wide. Specific regular-local tags needed by the changed proof were opened as recorded above. No claim of checking every theorem in that chapter is made.
- Ownership checks cover main, the indexed board packages and the supplied/open heads exposed by the roadmap service. Unspecified pull-request files outside that accessible set were not checked.

These limits do not supply evidence for or against R01, whose witness is readable in the current supplier head. Elaboration and the computed examples are acceptance-signature and adversarial checks, not proofs of the sorried theorems.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says K-valued sums of selected elliptic coordinates detect the subfield; it should use extension-valued coordinates and test the form over K_u; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says composing x with the separable endomorphism gives a simple pole; it should use z=y/x since x has a double pole; affects the proof.
- **Gap** in poonen_uniform at proof of Lemma A.5, p. 14: the source says the Laurent-series passage retains coefficients at any smooth closed point; it should justify inseparable residues through successive DVRs along a regular local flag; affects the proof.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says the arithmetic composites are indexed by rank-one W_T; it should use full geometric flags ending in a number field; affects a stated result.
- **Error** in pop_eei2 at Notation 3.5, p. 2102: the source says the strict threshold uses v(2n) in characteristic two; it should use v(n) there because 2n=0; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the arithmetic core is necessarily Dedekind; it should invert a nonzero conductor element before invoking normality; affects the proof.
- **Misprint** in akns at Lemma 3.8, p. 23: the source says the coefficient sum starts at zero while the digits start at one; it should start at one; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b6a9bce2251549b3ed57cb10c2768f6aa1074098", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
