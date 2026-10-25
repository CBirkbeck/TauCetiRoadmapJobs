<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1174#issuecomment-6398676361 -->
Review (codex) of add5996

Verdict: needs_changes

1. **F01** (P1) The extension-space dimension need not exceed one for the fixed S

   **Location.** `packages/GlobalGaloisDeformationsPartII/README.md:1442`, §8.11: “For a fixed odd χ̄, one can choose a finite quotient of `Γ_{Q,S}` with dim H¹(Γ,k̄(χ̄))>1.” The conventions fix S at line 31.

   **Claim.** Every allowed fixed S admits the indicated finite quotient.

   **Witness.** Take p=5, χ̄=κ̄ and S={5}. Kummer theory gives H¹ dimension 1; inflation from every relevant finite quotient is injective. FKP22 line 1702 instead requires sufficiently large S.

   **Exact repair.** Start §8.11 with: “After a finite enlargement S′⊃S, for every fixed odd χ̄ there is a finite quotient Γ of Γ_{ℚ,S′}, through which χ̄ factors, with dim H¹(Γ,k̄(χ̄))>1.” Keep the finite weight-level obstruction for that resulting family. Add a negative-control Check for the fixed set S={5}, and refer explicitly to the enlargement in §7.2.

   **Test of the repair.** For the original instance, the Kummer group is ℤ[1/5]×/(ℤ[1/5]×)⁵: −1 is a fifth power and 5 generates its one-dimensional quotient. The class group contributes zero. Thus its dimension remains 1 after extending scalars to k̄. Adding the trivial prime 11 gives two independent classes 5 and 11, whose valuations at (5,11) are (1,0) and (0,1). Their cocycles factor through the finite splitting field of X⁵−5 and X⁵−11 together with μ₅, unramified outside {5,11}; the enlarged dimension is 2. This also checks the quantifier order in the repair.

2. **F02** (P2) Very-good characteristic is substituted for a sufficiently large prime

   **Location.** `packages/GlobalGaloisDeformationsPartII/README.md:1135`, §6.5: “For any number field F and a lifting datum satisfying C1–C4”. The same missing-bound pattern occurs in §§2.5–2.6 (lines 684,697), §3.4 (812), §3.6 (839), and the uses of general root position in §§5.3–5.5. Line 333 identifies C4 with Assumption 3.1 without its prime bound. The standing assumption at line 27 is only very-good characteristic and a prime-to-p central kernel.

   **Claim.** The general-root-data constructions and nongeometric lifting theorem follow under those weaker prime hypotheses. Saying “Keep the other local hypotheses” in §6.5 does not retain a global root-datum bound.

   **Witness.** FKP22 line 457 assumes p≫G; Theorem 5.6, line 1193, retains Theorem 5.2’s bound from line 1008. In SL₄/𝔽₃, 3 is very good, but every split diagonal Lie element has a repeated entry.

   **Exact repair.** Introduce a bound B_G depending only on the root datum and covering the general finite-field root-position inputs. Explicitly assume p>B_G in the above general constructions and in §6.5, propagating it to their given-tower applications when those use §5.2. Describe C4 as the cohomological clause of Assumption 3.1, not the whole assumption. Preserve §6.4’s explicitly proved sl₂ exception p≥3. Do not replace the quantified bound by an unquantified “good prime” convention.

   **Test of the repair.** In type A₃, very-good means p∤4, so p=3 passes the existing convention. Four diagonal entries in 𝔽₃ cannot be distinct. Consequently some root differential is zero for every H∈Lie(T), and the asserted first noncentral layer with every root nontrivial cannot be manufactured by the stated toral construction. Exhausting the trace-zero diagonal tuples gives 0 regular tuples over 𝔽₃. Over 𝔽₇ it gives 120; diag(0,1,2,4) has trace 0 and all root differences nonzero. Choose B_A₃≥3, which is harmless for an existential bound, to exclude the refuting local instance. The separate sl₂ calculation at p=3 still has dα(diag(1,−1))=2≠0. The source itself, rather than these finite tests, establishes the need to retain p≫G in §6.5; no counterexample to every possible lifting method at small primes is claimed.

3. **F03** (P3) The new arithmetic selection predicate lacks its definition API and third Check

   **Location.** `packages/GlobalGaloisDeformationsPartII/README.md:784`, §3.2: “The arithmetic selection hypothesis for a lifting datum asserts the existence of such a uniform ε”. Its Checks list, lines 792–794, has two bullets and no definition API. The new K′ definition in §6.6, line 1150, also lacks an API list, although its four Checks are present.

   **Claim.** This is a newly defined mathematical hypothesis used by the general headlines, so the definition requirements apply to it.

   **Witness.** Section 3.2 has two Check bullets and no API bullets; ε=1 is admitted but has no separate Check. Section 6.6 defines K′ without an API list.

   **Exact repair.** Add a prose API stating preservation on restricting the required stages, transport by isomorphisms preserving the finite Galois tests and prescriptions, and compatibility with enlarging a finite excluded set. These are consequences of the quantified predicate, not a proof that C1,C3,C4 imply it. Add a third discriminating Check for ε=1: after one test the failure set must be empty; a repeated binary test has failure proportion 1/2 and does not satisfy this premise. For K′, list finiteness, absorption of each defining extension and monotonicity when the finite set T is enlarged. Keep these facts in the README.

   **Test of the repair.** For s≥1, (1−1)ˢ=0. An always-successful test realizes failure 0; the repeated binary test realizes 1/2, so it is rejected. For the two fields sharing K′ in §6.6, the degrees remain p³ over K and p² over K′; absorbing the shared old extension removes the false p⁴ prediction. No new arithmetic existence assertion or Lean padding is needed.

Three findings: one P1, one P2 and one P3. The two blocking findings are a false fixed-ramification-set assertion and omitted large-characteristic hypotheses. The earlier mathematical repairs are retained; none of the blocking findings re-raises the settled historical intake issue.

## Previous finding verification

Each quoted passage below is from the repaired package, not from a source. F10 was expressly marked “not actionable in this package” in the repair report; its reason concerns an intake decision about historical edits, and is sound. Restoring the obsolete self-gap or compound requests would undo the authorized mathematical repairs. It is not re-raised.

| Earlier id | Status | Repaired passage and verification |
|---|---|---|
| F01 | Repaired by the previously offered conditional route | README:784: “C1,C3,C4 are not asserted to imply this arithmetic hypothesis.” Summary:3 and Scope:21 announce it; the general applications carry it. README:1148: “it has no arithmetic selection hypothesis from §3.2.” The irreducible route now constructs K′ using FKP19 Definition 5.8, Proposition 5.9, Lemma 5.11 and Theorem 5.14; the relative arguments take that tower as data. The self-gap is absent from both declarations. |
| F02 | Repaired | README:206: “Consume §§1.21, 6.5 and 6.17”. The two redundant local gaps are gone. §§8.5 and 10.1 cite those local suppliers; §§6.5 and 6.17 of that supplier really give the full torus character and fixed-quotient dimension. |
| F03 | Repaired | README:112: “the torus is allowed to depend on W.” The exponential names k, P=MU and its root-datum bound; semisimplification, scalar extension, filtration, varying torus, prescribed toral element and adjoint expansion have separate slugs. All seven corresponding requests are precise and match the plan. |
| F04 | Repaired | Suggested.lean:29: “Fixed-weight-level finiteness of actual reductions”. The stable-lattice input is no longer called an unstatable headline. Its elementary apartment statement is left in §8.9. |
| F05 | Repaired | README:1413: “Use IntegralHeckeAndGaloisDeterminants §1.4, ‘Classical Ribet lattice’”. Scope:14 and the Needs line:1424 also cite it. The retained additions are segment geometry, split interiors and coefficient-extension comparison of the endpoints. |
| F06 | Repaired | README:178: “Consume §A1, ‘Currents and continuous cohomology’”. The complex-simple Whitehead input is credited to AffineLieAlgebras; the requested extension names the shared absolute complex, semisimple p-adic coefficients and all-degree vanishing without invariants. |
| F07 | Repaired | README:244 cites “§5.2, Skinner–Wiles Theorem A”; :248 cites “§10.15”; :262 cites “§2.28” and “§2.48”. These sections exist. The nonexistent slash identifiers are removed. |
| F08 | Repaired | README:1392: “The API has the following mathematical properties.” §1.11 has one scalar-ratio Check; the misplaced apartment Check is in §8.9. Layer Examples point to Checks instead of copying them; the duplicated δ sentence and “Theorem5.2” are gone. R03 concerns a different new definition requirement. |
| F09 | Repaired | README:1591: “the lift supplied by §6.3 is Zariski dense in all of G”. The new implication requires central density on the component-splitting field and surjectivity to components. The dimension computation below verifies the distinction. |
| F10 | Not repaired; settled as not actionable in this package | Repair report: “not actionable in this package”. It assigns the retrospective plan-history decision to intake. This review checks the present 28-contract consistency and does not reopen that decision. |
| F11 | Repaired | README:212 uses “ω₀”; :248 reserves ω for Pan’s mod-3 ratio. §4.7:963 marks its lattice API as imported. sources.toml records the published FKP19 DOI 10.1215/00127094-2021-0003 alongside arXiv v5 and its numbering note; the FKP22 locator now says “applications”. |

The repaired patterns were also searched elsewhere: conditional general applications versus the independent irreducible route; individual versus joint inertia; full torus versus root-only conditions; actual versus semisimplified representations; source section identifiers; scalar versus derived tangents; and overlap with Ribet’s lattice theorem. The missing prime-bound pattern is R02. The fixed-S error in R01 is particularly visible against §7.2, which correctly permits enlarging T.

## Verified sound

The review covered all 81 numbered targets, their Checks and proof inputs, all 11 previous findings, all 28 declared gaps, all 15 seeded targets, and the four supplied package files. Computations for the 81 targets were retained in the review worklist ledger; the table below contains the sampled targets, headlines, changed mathematical interfaces and every target directly implicated by a finding. Finite-instance tests distinguish definitions and hypotheses; they are not offered as proofs of the deep arithmetic theorems.

The package is an extension of GlobalGaloisDeformations, with its stopping point and the relative/doubling additions stated in Scope. No route-specific restriction to selected primes, computational algorithm, copied source passage, sorry-defined data or set_option was found. Source passages were read as evidence, not instructions. The sources manifest was not changed. No package author file was changed.

### Seeded source verification

Locators below use the versions recorded in sources.toml. FKP19 and FKP22 use their recorded arXiv v5 printed pagination; a claim to have collated the published pagination is not made. Every sampled locator was readable. “Supported” retains the roadmap’s explicit standing hypotheses and declared supplier contracts; the arithmetic selection hypothesis is not inferred from a deficient source argument.

| Target | Text opened at locator | Result of hypothesis and content comparison |
|---|---|---|
| 0.2 | FKP19 Definition 1.2, pp.2–3; FKP19 line 107, line 114 | Numerical oddness matches. The roadmap correctly separates total reality for a torus, unlike the source’s unrestricted explanatory sentence. |
| 0.5 | FKP19 Notation 5.1, pp.25–26, line 1137; FKP22 §1.3, pp.7–8, line 316; construction p.15, line 657 | The field uses the actual additive restriction image. The strong-disjointness definition correctly uses the full product; the source’s later independence assertion is not adopted unconditionally. |
| 0.6 | FKP22 Lemma 2.1, p.10, line 445 | Exact hypotheses: L/F finite Galois, A/F abelian. The restriction/commutator proof supports trivial conjugation. |
| 1.5 | FKP22 Lemma A.5 and Remark A.6, p.45, line 2026 | Supports the semisimplified adjoint/cyclotomic exclusion route to C3,C4. The finite-image and scalar-extension contracts retain their large-prime restrictions. |
| 1.11 | FKP22 Examples A.16–A.17, p.50, line 2282 and line 2292 | The source examples require the corrections already present: determinant divided by δ, and full exponent tests including zero. See Source issues. |
| 2.2 | FKP22 pp.10–11, line 477; FKP19 §5.1, p.27, line 1189 | C4 makes restriction detect nonzero dual classes; finitely many trivial primes annihilate the finite Sha group. The earlier page repair is correct. |
| 2.3 | FKP22 Lemma 3.4(1),(3), pp.11–12, line 490 | Both finite cyclic families must be stabilized, including the dual family independently. No assertion that the dual of a cyclic module is cyclic is used. |
| 2.6 | FKP22 Proposition 3.6(2), pp.12–15, line 549 and line 650 | Prescribed nonzero vector, prime-field inertia line and constant old restriction match. Its inherited preparation needs the explicit general prime scope of R02. |
| 2.7 | FKP22 construction after Proposition 3.6, p.15, line 657 | The two summands, marked inertia and cyclic individual images match. The roadmap deliberately does not infer joint generation. |
| 2.9 | FKP22 Lemma 3.7 and proof, pp.15–16, line 666 and line 682 | The added full joint-inertia premise repairs the proof step. The source alone does not supply this premise, or §3.2’s arithmetic estimate. |
| 3.5 | FKP22 Lemma 4.3, pp.19–20, line 875 | Full derived congruence image, C1 and C3 are retained. Applying the quotient argument to the whole dual compositum does not require individual dual fields to be independent. |
| 4.1 | FKP19 Definition 6.2, p.45, line 2017 | The relative group is the reduction image; full-level balance is separate from equality of relative images. |
| 4.3 | FKP19 Lemmas 6.1 and 6.3, pp.44–45, line 1986 and line 2028 | C1,C2, cocycle exactness and adjacent full-level cardinalities support the division argument. At n=1 the reduction is the identity; no level-zero lattice is needed. |
| 6.5 | FKP22 Theorem 5.6, p.27, line 1193; Theorem 5.2, p.23, line 1008 | Local dimension and removal of oddness match. The retained sufficiently-large-p premise is missing in the target: R02. |
| 10.3 | FKP22 Proposition 9.1/proof, pp.41–43, line 1864 and line 1954; BLGGT14 Theorem 5.5.1/proof, pp.590–593, line 3699 through line 3810; Lemma 5.3.1, pp.580–581, line 3273 | Uses the supplied extension of the compatible-system argument, not the literal BLGGT theorem with hypotheses discarded. Quadratic-CM descent, two distinct Steinberg residue characteristics and the classification/formal-character contract are explicit. Lemma 5.3.1 is correctly not cited as formal-character independence. |

### Computed adversarial table

In the result column, “sound” means that the indicated assertion survives these tests and its stated route/hypotheses were checked; it does not mean that the missing supplier contracts have already been implemented.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| 0.2 oddness | GL₂/F₃, diag(1,−1), identity; imaginary torus | fixed adjoint dimensions 1=flag dimension1, versus 3≠1; torus 0=0 | Sound; total reality separate | None |
| 0.3 residual hypotheses | Zero quotient; trivial line and nontrivial quadratic twist | zero quotient dimension0 is excluded; character values1 and−1 differ | Correct cohomological convention, incomplete source identification | R02 |
| 0.5 cocycle fields | Zero class; three quadratic subfields; prime-field image in F₉ | degrees1; product8/compositum4; degree3 versus9 | Strong product and actual image correctly defined | None |
| 0.6 conjugation | C₂² versus S₃ | commutator1; (12)(123)(12)=(132)≠(123) | Abelian premise necessary | None |
| 1.5 cyclotomic exclusion | Trivial adjoint, order-two κ̄ at p=3 | constituents act by1 versus−1; common constituents0 | Sound exclusion check | None |
| 1.11 GSp₄/equal blocks | (cI,c²); χ=1, ord κ̄=5,N=4; χ=κ̄⁻¹ | ratio c²/c²=1, determinant c²; all five orders5>4; zero-exponent comparison gives equality in the last case | Corrected source statements | None |
| 2.2 dual Sha | One-dimensional Sha/F₃, nonzero detecting restriction; inflated class | detecting map rank1, kernel dimension0; inflated restriction0, excluded by C4 | Sound finite annihilation mechanism | None |
| 2.3 simultaneous stabilization | A=F₃[x,y]/(x,y)²; Z=0 | A cyclic dimension3; socle dimension2, hence A-dual needs2 generators; zero inertia increment0 | Two families and zero case retained | None |
| 2.5 spanning classes | F₃² cokernel; zero cokernel | independent vectors rank2, repeated vector rank1; empty family size0 | Sound linear test; general root input needs prime scope | R02 |
| 2.6 prescribed vector | Nonzero Z in trivial F₉; zero cokernel | F₃Z has3 elements,2 nonzero; kZ has9,8 nonzero; new inertia can remain nonzero when cokernel dimension0 | Correct prime-field line; inherited prime scope missing | R02 |
| 2.7 marked classes | Two marked directions and common inertia | marked matrix rank2; (1,1) orbit span dimension1 versus product dimension2 | Individual images do not imply joint image | None |
| 2.9 joint inertia | Two equal character lines; three degree-3 fields in C₃² | diagonal inertia order3 versus product9; degree product27 versus compositum9 | Conditional joint-generation formulation survives | None |
| 3.2 density/hypothesis | ε=1/2,s=4; repeated test; alternating sequences; ε=1 | 1/16<1/10 versus repeated failure1/2; separate limsups1,1 versus product0; boundary failure0 | Elementary estimate correct; arithmetic estimate explicitly assumed | R03 adds API/third Check |
| 3.3 pairing | u=(1,0),t=(0,1), p=5 | inv(u∪t)=4, inv(t∪u)=1; self-pairings0 | Correct sign with stated reciprocity | None |
| 3.4 doubling | p=5,3,2 | coefficients(4,2),(2,2),(1,0); old correction −Y+2Y=Y | Correct signs, p=2 excluded; prime scope still needed | R02 |
| 3.5 congruence field | Hypothetical common trivial/dual quotient | trivial quotient gives invariant dimension≥1 versus C1=0; dual quotient has positive dimension versus C3’s prohibition | Correct whole-compositum argument | None |
| 3.6 controlled towers | e=2,D=1; SL₄ split diagonals over F₃,F₇ | cutoff2, first noncentral3 independent of M; regular trace-zero tuple counts0,120 | Missing sufficiently-large-p scope | R02 |
| 4.1 relative images | Identity F₃²; zero F₃→F₃; coordinate inclusion | source/image9/9; source/image3/1; image/target3/9 | Definition determines image rather than target | None |
| 4.3 relative balance | Full orders81,27; wrong kernel9; n=1 | images81/27=3 on both sides; wrong case3 versus9; identity preserves each full group | Adjacent balance and injections are necessary | None |
| 4.7 imported root lattice | SL₂, r=2 over Z₃ | condition9³=729, unramified part9²=81, quotient9; ambient9⁶ | Imported cardinality/fibre API is correctly marked | None |
| 4.8 smooth neighborhoods | Trivial fixed-det GL₂ point, r=2; ramification index2 | away-p729, degree-one p-place6561; original depth3 becomes6 | Correct general DVR scaling | None |
| 5.3 detection | x,y on F₃²; r,r−1 on F₃ | at(1,1) values1,1; at r=2 values2,1; wrong separate factors cannot share one root | Same-factor argument correct; retain §5.2’s bound | R02 |
| 5.4 relative annihilation | Finite level-M Selmer order and reduction image | order81→27 while image dimension1→1; zero images require0 new primes | Correct termination measure and supplied-tower distinction | R02 carries prime scope |
| 5.5 factor recombination | Two simple factors exchanged by C₂ | common component fibre product order2 versus unrestricted product4 | Correct quotient sharing | R02 carries prime scope |
| 6.1 finite ramification | n=3,M=2; growing finite sets | buffer level5 retains level4; each set finite but infinite union possible | Fixed-set completion is separate from finite towers | None |
| 6.3 geometric headline | Torus; GL₂ with finite determinant; ramified coefficients | derived kernel size1; closure dimensions3+0<4; depth2 at e′=3 becomes6 | Conditional theorem retains large p and approximation order | None |
| 6.4 small-prime headline | sl₂ at p=3 versus2 | dα(h)=2 versus0; doubling(2,2) versus(1,0) | p≥3 refinement survives | Preserve exception in R02 |
| 6.5 nongeometric headline | Fixed-det GL₂/ℚ_p; real C₂/F₃; A₃/F₃ | dimensions(1+1)3=6 versus3+1=4; positive C₂ cohomology0; regular toral tuple count0 | Local variant correct, missing global prime premise | R02 |
| 6.6 independent irreducible headline | Two degree-p² fields sharing old degree-p field K′; r=0 | compositum degreep³ over K, notp⁴; relative degreesp,p,p² over K′; r=0 gives K′=K | Independent K′ route repairs F01 | None |
| 7.6 Levi lifting headline | Even diagonal GL₂; lattice conjugation | adjoint fixed dimension3≠flag1; derived closure dimension3 unchanged although congruence image can shrink | Oddness and density conclusion correct | None |
| 7.7 torus application | Quadratic SL₂ diagonal versus nontrivial root character | χ²=1 gives invariant dimension3; two nontrivial roots give0+1+0=1 | Exclusions discriminate | None |
| 7.8 Siegel application | a=2,w=2 and w=0,−1,−2 | weights0,−1,2,3 distinct; each excluded value repeats an entry; scalar ratio1 | Correct δ and weight convention | None |
| 8.5 actual modularity headline | p=3, odd character of ℚ(√−2) | local character1 since −2≡1 mod3 lifts to a square; κ̄⁻¹ nontrivial on inertia | Scalar local case allowed by Pan; general selection premise explicit | None |
| 8.6 Hamblen–Ramakrishna specialization | Trivial F₉-line | k-multiplicity1 versus prime-field trivial multiplicity2 | No invalid multiplicity-free inference | None |
| 8.7 totally real conditional headline | F=ℚ; nonabelian totally real F | degree1 and abelian character fields in first case; oddness alone imposes no abelian-field condition in second | Imported conditional hypotheses retained | None |
| 8.8 actual extension classes | F₃² extension space; wrong quotient map | projective count(9−1)/(3−1)=4; over k̄ classes(1,t) infinite; wrong q∘i=1 instead of0 | Actual extensions and markings matter | None |
| 8.9 lattice input | Off-diagonal valuation minima2,1; e′=3 | s=−2,…,1 gives4 vertices; −6,…,3 gives10; exactly2 nonsplit endpoint classes | Supplied Ribet orientations; new geometry justified | None |
| 8.10 finiteness headline | m newforms; segment length1 then e′=2 | at most3m classes; 2 endpoint classes become2 endpoints+1 split=3 | Correct allowance for coefficient extension | None |
| 8.11 fixed-level obstruction | p=5,χ̄=κ̄,S={5}; S′={5,11} | H¹ dimension1, so not>1; enlarged valuation matrix identity2 gives dimension2 | Fixed-S claim false, repair tested | R01 |
| 9.2 function-field automorphy | n=2 or3,p=3; finite determinant | determinant-root derivatives2 (unit),0 (nonunit); Teichmüller F₉ value order divides8 versus4∈Z₃× infinite order | Prime and finite-determinant conditions retained | None |
| 9.3 irreducible specialization | Quadratic constant-field induction, q≡−1 modp | κ̄ values1,−1 in even/odd degrees; restriction splits into2 lines; twisted induced adjoint summand unchanged | Cyclotomic restriction cannot be dropped | None |
| 9.4 two blocks | Dimensions1,3 | Hom-invariant dimensions0,0; primitive determinant exponents3,−1 give c³c⁻³=1 | Correct block and determinant tests | None |
| 9.5 separated sums | Independent order-10 κ̄,ψ and blocks κ̄ψ²,κ̄ψ,1 | separate remaining cyclotomic degrees10,10,5; joint remaining degree1 | Joint field condition excludes source counterexample | None |
| 10.1 ordinary symplectic headline | n=1,2, weight zero | weights0,1 sum1=HT(κ⁻¹); weights0,1,2,3 have pair sums3=HT(κ⁻³) | Correct sign and nonfinite central multiplier | None |
| 10.2 ANT application | Two scalar blocks permuted by polarization; d=2n | swapped action fixes diag(1,−1); individual scalar action negates it; tangent dimensions4 versus3 for n=2 | Individual polarization and full ANT prime hypotheses explicit | None |
| 10.3 compatible-system headline | Steinberg residue characteristics2,5; n=1,2 | ℓ=2 uses5; ℓ=5 uses2; GSp₂=GL₂ rank2; GSp₄ rank3 versus principal GL₂ rank2 | Two-place argument and separate monodromy gap correct | None |
| 10.4 L-group implication | GL₂ with dense/finite determinant; Gₘ | closure dimensions3+1=4 versus3+0=3; Gₘ gives0+1=1 | Dense central quotient and component surjection give conclusion | None |
| Repaired exponential/expansion contracts | SL₂ and Heisenberg SL₃, p=7; U=1 | Ad(I+xE₁₂)E₂₁=E₂₁+xh−x²E₁₂; exp(E₁₂+E₂₃) has E₁₃ coefficient1/2=4; U=1 sends0→1 | Uniform bound and denominators explicit | None |
| Repaired varying-torus/regular-toral contracts | W=kE₁₂+kE₂₁; h/2; sl₃/F₇ | standard roots lie in W; conjugate vector diagonal entries−1,1 escapes; root values1,−1; diag(2,1,−3) values1,5,4 | Separate exports and variable torus correct | None |
| Repaired semisimplification/base-change/filtration contracts | Nonsplit triangular GL₂; C₄/F_p,p≡3 mod4; (1,2) parabolic | off-diagonal1→0; irreducible rank2 becomes two lines over F_p²; graded dimensions2+4+2=8 | New minimal parabolic and graded-only identification retained | None |
| Centralizer contracts | SL₂/F₇ nonzero nilpotent and zero; PGL₂ involution | centralizer dimensions1,3; torus centralizer1; involution has2 components, square has full dimension3 Levi | Nonzero and Weyl-component hypotheses necessary | None |
| Finite-image contracts | SL₂/F₁₁; conjugated C₂; unipotent C₇ | 11>2(3+1)=8; complement k(e₁+e₂), Levi kernel1; unipotent kernel7 and no complement | Quantified hypotheses discriminate | None |
| Repaired local imports | Gₘ inertia1 versus4; fixed-det GL₂ | root equations0 in both, basis character1≠4; ordinary dimension4 versus unrestricted6 | No duplicate gap remains | None |
| Repaired Whitehead ownership | sl₂ characteristic0 trivial line; abelian one-dimensional Lie algebra | H⁰ dimension1, H¹=H²=0; abelian H¹ dimension1 | Complex input and required extension separated | None |

### Supplier order, ownership and declaration audit

The dependency command was run on the package README with the supplied configuration, name, merge order and `--movable`. Its complete output was:

```text
depcheck: 52 roadmaps, 603 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver used main 1ce5c4f and the supplied index of 363 open heads dated 2026-10-25T13:35:40Z; its missing cross-roadmap citations and missing Lean-name lists were both empty. These mechanical results were checked against the supplier text, rather than treated as mathematical certification.

The board package index was read before resolving ownership. LocallyAnalyticDistributionsPartII and PotentialAutomorphyInfrastructurePartII resolve to earlier board designs, respectively `packages/LocallyAnalyticDistributionsPartII/design/README.md:65` (ND.0, with charts at 128–185) and `packages/PotentialAutomorphyInfrastructurePartII/design/README.md:3744` (PL.7 source-primitivity theorem, with PL.6 at 2215). They were not incorrectly declared absent because `roadmaps show` has no merged folder for them.

All supplier subsections and Needs lines were inspected. The following resolved locations record the main ownership boundaries; paths in the second column are below `TauCetiRoadmap/` unless stated otherwise. Range notation identifies sections, not a claim that their whole contents have been implemented.

| Supplier | File and checked sections | Boundary verified |
|---|---|---|
| GlobalGaloisDeformations | `GlobalGaloisDeformations/README.md:407`, §§3.3–3.8; :1955, §§8.1–8.4 | Global obstruction machinery is imported; reducible fixed-G and polarized coefficient refinements remain declared contracts. |
| ArithmeticGaloisDuality | `ArithmeticGaloisDuality/README.md:554`, R02.1.2–1.3; :1126,2.1; :1754,3.1; :2464,3.4; :3005,4.2; :3324,4.3; :3749,4.5; :6413,5.1; :5220,D7.4; :6050,D7.7 | Finite cohomology, restriction and duality are owned there. Function-field numerics are an additional precise contract, not silently supplied by the number-field formula. |
| ReductiveGroups | `ReductiveGroups/README.md:227`, Layer2; :627,Layer7; :1023,Layer8 | General Lie, root, parabolic and Levi carriers are imported. |
| ReductiveGroupsPartII | `ReductiveGroupsPartII/README.md:729`, RG2.0.3; :1445,RG2.1; :3128,RG2.2.3; :3408,RG2.2.4 | Congruence quotients, lattice tree and subdivision are supplied. The arbitrary finite-field root exports are separate gaps. Its valuative torus-centralizer target does not already give the arbitrary algebraically closed-field contract. |
| IntegralHeckeAndGaloisDeterminants | `IntegralHeckeAndGaloisDeterminants/README.md:2515`, §1.4 Classical Ribet lattice | Nonsplit reductions in both orientations belong to that owner; §8.9 retains the segment/interior/extension additions. |
| ArithmeticGaloisRepresentations | `ArithmeticGaloisRepresentations/README.md:670`, §§1.1–1.2,1.6–1.11; :4126,§§7.2–7.7 | Representation, reduction, polarization and adjoint conventions imported; small-dimensional finite-image results separately declared. |
| ProfiniteCohomology | `ProfiniteCohomology/README.md:725`, Layers2–8 | General cocycles, coefficient exactness, restriction and products imported, with continuity retained. |
| ProfiniteProPGroups | `ProfiniteProPGroups/README.md:306`, Layer3; :471, Frattini paragraph | Generation modulo Frattini is imported; finite congruence-depth application is the new target. |
| NoncommutativeAndEquivariantIwasawa | `NoncommutativeAndEquivariantIwasawa/README.md:171`, §0.2; :311,0.7; :498,F.2; :519,0.13 | Compact group and bar/resolution inputs exist. Arbitrary lattice coefficients and rational Lie comparison are not the trivial F_p exterior calculation. |
| AffineLieAlgebras | `AffineLieAlgebras/README.md`, §A1 | Complex-simple Whitehead input credited; not reassigned wholesale. |
| AutomorphicFormsOnReductiveGroups; ArithmeticLocallySymmetricSpaces | `AutomorphicFormsOnReductiveGroups/README.md:219`, Layer1; `ArithmeticLocallySymmetricSpaces/README.md:860`, ALS.F.5 | Shared absolute complex distinguished from relative real-pair cohomology. |
| Chebotarev; FunctionFieldArithmetic | `Chebotarev/README.md:410`, Layer10; `FunctionFieldArithmetic/README.md:1995`, §5.8 | Actual composita and constant-field Frobenius cosets retained. No supplier asserts the arithmetic selection estimate. |
| LocalGaloisDeformationRings | `LocalGaloisDeformationRings/README.md:1558`, §§1.17,1.20–1.22; :1796,2.5; :1993,2.14; :2309,2.28; :2332,2.30; :2545,3.11; :3178,6.5; :3460,6.17; :4056,8.5; :4125,8.10 | Fixed quotient, full torus, ordinary dimensions and Steinberg points imported. Root lattices, smooth approximation and normalized determinant correction remain the specified contracts. Hodge signs are translated to the package’s HT(κ)=−1 convention. |
| ClassFieldTheory | `ClassFieldTheory/README.md:1312`, Layer7; :1799,Layer13 | Reciprocity and Kronecker–Weber, including the uniformizer-value restriction, are the proper inputs. |
| ModularForms | `ModularForms/README.md:532`, Layer4; :935,8G; :1119,10C | Finite-dimensional spaces/newforms do not assert finiteness of all complex vectors. |
| AlgebraicModularFormsAndSerreWeights | `AlgebraicModularFormsAndSerreWeights/README.md:1093`, R15.4; :1339,5; :1554,5A; :1598,5A.2; :1662,5A.3; R15.6 | Serre weights and the classical Galois attachment normalization imported. Actual lattices are additional witness data here. |
| AutomorphicGaloisRepresentations; its PartII | `AutomorphicGaloisRepresentations/README.md:980`, Layer1; :2308,Layer5; `AutomorphicGaloisRepresentationsPartII/README.md:1758`, AG2.5; :2036,AG2.6 | Attachments and local compatibility are suppliers, not re-planned constructions. |
| ClassicalSerreModularity | `ClassicalSerreModularity/README.md:850`, R27.6 | Absolutely irreducible Serre theorem is imported; actual reducible lifting is different. |
| OrdinaryAutomorphicFormsAndModularityLifting | `OrdinaryAutomorphicFormsAndModularityLifting/README.md:2038`, §5.2; :2065,5.3 | Abelian-field and local-ratio hypotheses are retained, or H is explicitly assumed. |
| GL2ModularityLifting | `GL2ModularityLifting/README.md:2758`, §10.15 | Existing CC1–CC5/LC conditions explain the precise unconditional Pan gap; no assertion that the supplier already proves its removal. |
| AutomorphicLFunctionsAndLocalFactors | `AutomorphicLFunctionsAndLocalFactors/README.md:2529`, AL.3 leveled shtukas/ramified rank induction | Both correspondence directions are supplied; chosen integral lattice and full reduction are the additional contract. |
| ModularityAndLanglandsExtensions | `ModularityAndLanglandsExtensions/README.md:1349`, §2.28; :1688,§2.48 | Simultaneous finite Steinberg places and system construction are imported. Ordinary seed and exact all-place classification remain declared refinements. |
| AutomorphicSpectralTheory | `AutomorphicSpectralTheory/README.md:3780`, §7.1 | Quadratic descent has a norm-trivial twist ambiguity; choosing the correct descent is necessary. |

Object searches used `roadmaps grep` across the indexed main/open folders and `rg` across the board packages and both pinned libraries: relative Selmer images, adjoint deformation conditions, doubling, classical Ribet lattices, semisimplification, centralizers, Whitehead cohomology, ordinary torus conditions, newform attachments and compatible systems. The relevant overlapping owners above are cited. SelmerIwasawaCohomology concerns its arithmetic Selmer/local conditions; it does not replace the finite-level adjoint reduction-image construction here. The ANT lifting theorem and compatible-system construction are consumed, while identifying their outputs with this roadmap’s lift and residual lattice is an application. No duplicate fully qualified Lean declaration is possible in the package’s declaration-free acceptance file. No move to a later owner or change to merge order is needed.

The 28 gap slugs in `design/plan.json` equal the 28 README contracts, and their needs sentences match. Every supplier is named and earlier. The revised finite-field requests have their fields, root data and prime hypotheses; the local requests distinguish full-torus data from root data; the all-place request distinguishes formal-character independence from component-group independence. No remaining gap requests an already supplied result at the same generality. The absence of these promised exports from today’s suppliers is not a finding. An eventual acceptance remains conditional on them.

### Pinned library and headline checks

The pins inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations were opened at those pins, including their surrounding hypotheses:

| Declaration | File and line at pin | What is, and is not, supplied |
|---|---|---|
| Representation | `Mathlib/RepresentationTheory/Basic.lean:48` | Monoid homomorphism into linear endomorphisms; no continuity. |
| Rep.of | `Mathlib/RepresentationTheory/Rep/Basic.lean:62` | Bundles an existing representation and module; no arithmetic attachment. |
| Representation.IntertwiningMap; Representation.Equiv | `Mathlib/RepresentationTheory/Intertwining.lean:36`, :312 | Equivariant linear map; invertible equivariant linear map. |
| TopRep | `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31` | Topological module and individually continuous operators; not an automatic jointly continuous G-action. |
| continuousCohomology | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` | Continuous-cochain homology carrier; no specified arithmetic local condition. |
| ContinuousCohomology.tateShafarevich | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` | Absolute localization kernel; not the restricted Γ_{F,S} Selmer carrier. |
| groupCohomology.H1 | `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:965` | Algebraic degree-one group cohomology. |
| CategoryTheory.ShortComplex.ShortExact | `Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean:34` | Exactness, mono and epi on actual maps; not arbitrary unnamed extension data. |
| CompositionSeries.jordan_holder | `Mathlib/Order/JordanHolder.lean:454` | Jordan–Hölder engine used on the appropriate equivariant lattice. |
| Submodule.span, subset_span, span_le; map_span | `Mathlib/LinearAlgebra/Span/Defs.lean:46`, :75,:80; `Mathlib/LinearAlgebra/Span/Basic.lean:73` | Infimum/universal-property and image laws; scalar-homomorphism hypotheses remain. |
| Submodule.map; AddSubgroup.map | `Mathlib/Algebra/Module/Submodule/Map.lean:52`; `Mathlib/Algebra/Group/Subgroup/Map.lean:112` | Existential image, and the additive declaration generated from subgroup image. |
| IsAbelianGalois | `Mathlib/FieldTheory/Galois/Abelian.lean:25` | Galoisness plus commutative automorphisms, without finiteness. |
| IsDiscreteValuationRing | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` | Local principal ideal domain with the nonfield condition; not the zero ring or an arbitrary field. |
| TauCeti.ContCohomology.H1 | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712` | Actual continuous cocycles modulo coboundaries; the documented quotient topology is not silently an arithmetic discrete-coefficient convention. |
| TauCeti.ContCohomology.explicitInfRes_exact | `TauCeti/RepresentationTheory/Homological/ContCohomology/Inflation/Basic.lean:350` | Range inflation equals kernel restriction with a normal subgroup, invariant coefficients and quotient-action continuity. Closedness and profiniteness are not required by the pinned theorem; the arithmetic application specializes to closed subgroups. |
| reductiveCommHopfAlgPropertyOver | `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38` | Smooth finite-type affine group with connected reductive geometric fibres. A reductive group carrier exists; the missing headline interface is the arithmetic lifting/local-condition structure, not all reductive-group theory. |

The README’s headline list comprises controlled towers (§3.6), relative Selmer annihilation (§5.4), geometric/sl₂/nongeometric/irreducible lifts (§§6.3–6.6), derived-dense Levi lifts and applications (§§7.6–7.8), actual reducible modularity and its specializations (§§8.5–8.7), fixed-weight-level finiteness (§8.10), function-field automorphy (§§9.2–9.5), ordinary symplectic lifting and ANT (§§10.1–10.2), and the compatible-system conclusion (§10.3). Section 10.4 is the conditional central-density implication from §6.3, rather than an assertion of the full conjecture.

Suggested.lean names each headline family and the missing carrier. Native representations, submodules and cohomology do not by themselves provide the fixed-quotient arithmetic lifting datum, local deformation components and de Rham conditions, finite adjoint Selmer systems, newform/Lafforgue attachments with integral lattices, or strictly pure compatible systems. The algebraically statable lattice-segment and extension-space inputs are correctly absent as acceptance-test padding. No statable headline omission or stand-in was found.

The required `lake env lean` elaboration was run from the content checkout with the package file as an absolute argument. It exited 0 with no output: there were no errors and no warnings, including no sorry warnings. Suggested.lean has exactly one import, `import Mathlib`, the prescribed namespace and one module docstring. It contains zero definitions, instances, theorems, lemmas or examples. Declaration enumeration followed by the scratch signature elaboration also exited 0; there are zero own signatures to check and no dropped section binders. Consequently the one-tactic probe has zero sorried theorem candidates, and found zero padding declarations. No TauCeti object build was needed and no Lean process remains running.

The README has the required Summary, ownership, conventions, supplier contracts, reading guide, 11 ordered layers, layer Examples/Dependencies, downstream and reference sections. Shape was compared with the main-branch ComplexTori and ModularCurves roadmaps. Apart from R03, no further blocking shape or package-form defect was found. The review concerns theorem statements and interfaces, not proof completion of future suppliers.

## Not verifiable

- **Gur99, Theorem A:** settled uncertified source. Its full text was not reopened or guessed. The package avoids attributing an unverified numerical bound to it; the small-dimensional splitting contract remains explicit.
- **NSW08, Theorems 8.6.7, 8.6.10 and 8.7.9:** settled uncertified textbook locators. The relevant owned duality interfaces and the readable FKP applications were checked, but this is not certification of the textbook text.
- **BC14, Lemma 10/Proposition 11 and Definitions 29–30/Proposition 32:** settled uncertified locators. The segment’s readable Ribet10 inputs and its explicit apartment computation were checked; BC14 itself remains locator-only.
- **Arithmetic selection in §3.2:** no proof of the arithmetic estimate is provided or certified. The elementary density bound was checked, and the general lifting results explicitly assume the estimate. This is the previously authorized conditional repair, not a newly unowned prerequisite.
- **Future supplier exports:** this review certifies the declaration, precision, minimality and order of the 28 contracts, not their eventual proofs. No missing-source request was added; the three settled uncertified works remain settled.

## Source issues

- **Error** in FKP19 at Definition 1.2 discussion, pp.2–3 (FKP19 line 114): the source says numerical oddness forces total reality without qualification; it should be restricted to positive derived rank, or total reality assumed separately; affects a stated result.
- **Gap** in FKP22 at Lemma 3.7 proof, pp.15–16, and Proposition 3.8 proof, p.18 (FKP22 line 682; line 804): the source says generation in each cyclic factor ensures independence of their compositum; it should be a joint-inertia generation statement, or use a separate arithmetic selection argument; affects the proof.
- **Misprint** in FKP22 at Lemma 3.4(2) proof, p.12 (FKP22 line 510): the source says the dimension increment is one for every Z; it should be dim_Fp(F_p Z), zero when Z=0; affects the proof.
- **Error** in FKP22 at Example A.16, p.50 (FKP22 line 2289): the source says the separation character is the determinant of the GL₂ block; it should be that determinant divided by the similitude character δ; affects a stated result.
- **Error** in FKP22 at Example A.17, p.50 (FKP22 line 2296): the source says comparisons involving only the two nonzero exponents suffice; it should be the full D condition, including zero exponents; affects a stated result.
- **Error** in FKP22 at Lemma A.9(3), p.46, applied in Corollary 8.4, p.39: the source says separate determinant-character field bounds provide the needed exclusion; it should be a bound using the joint character-field compositum; affects a stated result.
- **Gap** in FKP22 at Corollary 8.3 proof, p.39 (FKP22 line 1772): the source says nonsplitting supplies noninjectivity of projection to the Levi image; it should be justified using sufficiently-large-characteristic complete reducibility; affects the proof.
- **Gap** in FKP22 at Theorem 7.4 proof, p.36 (FKP22 line 1629; line 1636): the source says the selected local correction extends globally by Kronecker–Weber; it should be normalized to have value one on local Artin of p before extension; affects the proof.
- **Misprint** in FKP22 at §9 ordinary-weight discussion and Proposition 9.1 proof, p.41 (FKP22 line 1861; line 1888): the source says ordinary weights are negatives of ξ_{τ,2n−i+1}+i−1 under HT(κ)=−1; it should be the positive expression in this convention; affects a stated result.
- **Gap** in FKP22 at Proposition 9.1 final proof paragraph, p.43 (FKP22 line 1959): the source says one Steinberg place supplies regular unipotents for every coefficient prime; it should be supplemented at its own residue characteristic, for example with a second Steinberg place; affects the proof.
- **Misprint** in FKP19 at Claim 6.14 proof, p.54 (FKP19 line 2435): the source says the modifying cocycle lies in the dual adjoint module; it should be a cocycle in the primal adjoint module acting on the lifting fibre; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "add59962af6e548ff5c3b0a0d51872a38da37e19", "job": "REV-PKG-GlobalGaloisDeformationsPartII~3", "model": "gpt-6-astra", "worker": "chris-20"} -->
