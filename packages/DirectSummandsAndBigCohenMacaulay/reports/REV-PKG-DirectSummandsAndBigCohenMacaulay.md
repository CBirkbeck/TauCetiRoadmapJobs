<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1452#issuecomment-6394442320 -->
Review (claude) of 102f454

Verdict: needs changes

1. **F01** (P1) Unowned gap `equal-char-zero-existence-proof`

   Location: `packages/DirectSummandsAndBigCohenMacaulay/design/plan.json`, top-level `gaps`, entry G1 (needed by DS.4/equal-char-zero-big-cm); README §4.10, line 956: "Establish the finite-equation specialization theorem used below".

   Claim: the characteristic-zero existence route (§4.10, Lean `exists_balanced_charZero`, and through it `exists_balanced`) rests on a specialization theorem that the plan declares as a gap with no supplier.

   Witness: the G1 entry has `title`, `neededBy` and `detail` but no `supplier` or `section`; no roadmap on main, in an open pull request or on the board states it (search for "big Cohen" finds only this package).

   Repair: give the gap an owner. Either assign the spreading-out half (preservation of a system of parameters and of the dimension of a maximal-dimensional domain quotient after reduction modulo a maximal ideal of a finitely generated ℤ-algebra) to SchemeAndStackFoundations §0.9 as a stated contract, or make it an owned target of §4.10 with a locator (HH95 is settled as uncertified and may be cited by its locator), and have the intake withdraw the supplier-`none` entry. The package worker cannot clear it alone, since `plan.json` is frozen apart from added gaps.

2. **F02** (P1) Unowned gap `char-zero-derived-splitting-bridges`

   Location: `design/plan.json`, gaps entry G2 (needed by DS.7/char-zero-derived-splitting); README §7.7, line 1393: "Prove a finite-presentation approximation statement descending the proper surjective cover".

   Claim: `derivedDirectSummand_charZero` and the characteristic-zero branch of `derivedDirectSummand` depend on bridges (approximation to finite type, projective domination, field extension and localisation) that have no supplier.

   Witness: KOVACS00 Theorems 1–2 (KOVACS00 lines 11 and 50) are for complex varieties with rational singularities on the source; G2 names no supplier; its `needs` also repeats the Grauert–Riemenschneider contract already assigned to ResolutionOfSingularitiesCharacteristicZero.

   Repair: split G2 into named contracts: the limit and Popescu passage to SchemeAndStackFoundations §§0.9, 0.15; the projective-cover and resolution step to ResolutionOfSingularitiesCharacteristicZero §5.5, merged with `gap:grauert-riemenschneider`; or state the field and localisation comparisons as owned targets of §7.7. The intake then retires the supplier-`none` entry.

3. **F03** (P1) Unowned gap `arbitrary-module-completion-proof`

   Location: `design/plan.json`, gaps entry G3 (needed by DS.0/completion-balances); README §0.5 and `completion_balanced` (Suggested.lean, lines 79–85).

   Claim: §0.5 is this roadmap's own target, yet the plan records its proof as a gap with no supplier.

   Witness: BMPSTWW line 516 states the completion result and refers to Bruns–Herzog Theorem 8.5.1; G3 has no supplier. DeformationAndDerivedPatchingAlgebraPartII §K0.1 (Čech comparison and filtered colimits for arbitrary modules) is the natural owner of the missing arbitrary-module local cohomology input.

   Repair: either assign the arbitrary-module completion statement to DeformationAndDerivedPatchingAlgebraPartII §K0.1 as a stated contract, or keep §0.5 as an owned target with the locators it already has (BMPSTWW §2.2 p. 12; ANDRE18B §4.1 p. 85; Bruns–Herzog Theorem 8.5.1, uncertified, by locator) and have the intake withdraw G3.

4. **F04** (P1) Unowned gap `pointed-modification-finite-witness`

   Location: `design/plan.json`, gaps entry G4 (needed by DS.4/partial-algebra-modification, modification-criterion, almost-cm-to-big-cm, weak-functoriality-almost-cm); README §4.3, line 822: "Prove the finite-witness comparison for the explicitly pointed module quotient".

   Claim: Hochster's modification criterion (§4.3), and with it §§4.5, 4.8, 4.10, 4.11, 4.12 and 6.2, rests on a comparison that the plan leaves without a supplier.

   Witness: G4 names no supplier; design source issues E21–E22 record that the published fixed-relation colimit does not recover the full algebra modification (README §4.2 Check at line 804 computes the counterexample: t² survives in T/Rt but dies in T/(t)).

   Repair: this is internal to Hochster's method, so own it: state the finite-witness comparison as a target of §4.3 with its hypotheses and the locators HOCHSTER02 Theorem 4.2 and HEITMANNMA18 Theorem 1.6, and have the intake withdraw G4 as a supplier gap.

5. **F05** (P2) Padding: three declarations follow in one step from another declaration

   Location: `Suggested.lean` lines 104–110 (`directSummand_charP`), 173–178 (`exists_balanced_charZero`), 306–310 (`derivedDirectSummand_charZero`).

   Claim: each is listed as a headline.

   Witness: in a scratch copy of the file, the terms `directSummand R S h`, `exists_balanced R` and `derivedDirectSummand R` close the three statements verbatim (elaboration exit 0, no error); each adds only `CharP R p` or `Algebra ℚ R` to the other declaration's hypotheses.

   Repair: delete the three theorems from `Suggested.lean`; keep §§1.3, 4.10 and 7.7 in the README as targets, writing their names without backticks. After this deletion alone the file elaborates with 16 `sorry` warnings; R08 gives the count after R05–R08.

6. **F06** (P2) `almostCM_exists_balanced` is implied by `exists_balanced`; `AlmostCMFor` then serves nothing

   Location: `Suggested.lean` lines 151–158; definition `AlmostCMFor` lines 137–149.

   Claim: André's Proposition 4.1.2 is stated as a headline whose conclusion is existence of a balanced big Cohen–Macaulay `R`-algebra.

   Witness: that conclusion is exactly `exists_balanced R`, which holds with no hypothesis; the probe `example … (_h : AlmostCMFor R D xs p roots) : ∃ C …, BalancedBigCM R C := exists_balanced R` elaborates. The README itself (line 860) disclaims any factorization through D.

   Repair: delete `almostCM_exists_balanced` and `AlmostCMFor` from `Suggested.lean`; keep §§4.1 and 4.5 as README targets (drop the backticks in "The headline signature is …" at lines 739 and 854).

7. **F07** (P2) Route endpoints stated as headlines: `andre_unramified`, `bhatt_mixed`

   Location: `Suggested.lean` lines 114–122 and 126–133; README §5.1, line 1025: "The theorem is stated once; it has two proofs in mixed characteristic".

   Claim: both are headlines of the package.

   Witness: both are special cases of `directSummand` (W(k)⟦T₁,…,T_n⟧ and complete regular local rings are regular rings). They do not reduce in one step at the pin only because Mathlib lacks regular-local-implies-regular (the TODO in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`, lines 23–40; probe: `failed to synthesize IsRegularRing R`).

   Repair: delete both from `Suggested.lean`; keep §§2.3 and 3.7 as README targets, without backticked names.

8. **F08** (P2) Input lemmas stated as headlines: `completion_balanced`, `balanced_faithfullyFlat`, `complete_pure_split`

   Location: `Suggested.lean` lines 79–85, 87–92, 96–102; definition `BigCMFor` lines 58–63 (used only by `completion_balanced`).

   Claim: these classical lemmas are headline theorems.

   Witness: §0.5 is an input of §4.3, which feeds `exists_balanced`; §0.6 (André Remarque 4.2.1) is an input of `finiteCover_flatDomination` and of §6.3; §1.2 (Matlis duality) is an input of `absoluteIntegralClosure_split`. None is an end theorem; the only downstream use named for §0.5 is the consumer refuted in R11.

   Repair: delete the three theorems and `BigCMFor` from `Suggested.lean` (the README keeps §§0.3, 0.5, 0.6, 1.2 as targets, names without backticks). After R05–R08 the file keeps 10 theorems (`absoluteIntegralClosure_charP`, `exists_balanced`, `directSummand`, `finiteCover_flatDomination`, `absoluteIntegralClosure_split`, `monomial_noncontainment`, `weakFunctoriality_regularTarget`, `pureSubring_cohenMacaulay`, `splinter_iff_derivedSplinter_charP`, `derivedDirectSummand`) and 9 definitions; re-elaborate and expect exactly 10 `sorry` warnings.

9. **F09** (P2) False Check in §4.8: the characteristic-p branch is not forced by ℤ₂⟦X,Y⟧/(2X)

   Location: README line 920: "The mixed-characteristic ring B=ℤ₂⟦X,Y⟧/(2X) has dimension 2; its maximal-dimensional prime quotient by (2) is 𝔽₂⟦X,Y⟧, so the characteristic-p branch is necessary".

   Claim: the only maximal-dimensional minimal-prime quotient is of characteristic p.

   Witness: (2X) = (2) ∩ (X); B/(X) ≅ ℤ₂⟦Y⟧ also has dimension 2 and is a mixed-characteristic regular ring, its own balanced big Cohen–Macaulay algebra.

   Repair: use B = ℤ₂⟦X,Y⟧/(2X, 2Y) (already in the §4.7 Check, line 903): its minimal primes are (2), quotient 𝔽₂⟦X,Y⟧ of dimension 2, and (X,Y), quotient ℤ₂ of dimension 1, so every maximal-dimensional domain quotient has characteristic 2.

10. **F10** (P2) The README re-plans API that suppliers own (purity, parameter lists)

   Location: README §1.2, lines 468–473 ("The tensor-purity interface has the following laws": composite, base change, filtered colimit, left factor); §0.3, lines 235–239 (permutation, positive powers, isomorphism transport for `ParameterSystem`).

   Claim: these laws are part of this roadmap's interface.

   Witness: `packages/PerfectoidSpacesPartII/design/README.md`, RA.5 target `pure-map`, lists stability of pure ring maps under composition, base change and filtered colimits and the left-factor property (`Module.IsPure.comp`, `Module.IsPure.baseChange`); DeformationAndDerivedPatchingAlgebraPartII §K0.3 lists permutation and positive-power invariance of secant lists, as README line 120 itself says.

   Repair: replace both law lists by one sentence each: `PureAlgebra` is the native view of RA.5's pure ring map, whose composition, base-change, colimit and left-factor laws are consumed from PerfectoidSpacesPartII §RA.5; `ParameterSystem` is the native view of a maximal secant list, whose permutation and power laws are consumed from §K0.3. Keep only the comparison of the native predicate with the supplier notion.

11. **F11** (P2) False ownership and consumer claims about "SchemeAndStackFoundations, Part II"

   Location: README line 13 ("the birational theories of plus-regularity and test ideals belong to the direction of SchemeAndStackFoundations, Part II") and line 1433 (that roadmap "consumes §§0.2–0.5 and §4.9").

   Claim: a Part II of SchemeAndStackFoundations owns plus-regularity and test ideals and consumes this roadmap.

   Witness: the only such roadmap, the board package SchemeAndStackFoundationsPartII (pull request head accb0a0, `design/README.md`), is "flat cohomology with finite locally free coefficients over animated rings" and mentions none of these; no roadmap on main or in an open pull request mentions test ideals or +-regularity.

   Repair: state that mixed-characteristic Cohen–Macaulayness of the completed absolute integral closure, plus-regularity and test ideals are outside this roadmap's scope, without naming an owner, and delete the consumer sentence about SchemeAndStackFoundations, Part II from Downstream consumers.

12. **F12** (P2) Gap `finite-parameter-subring` asks for what DeformationAndDerivedPatchingAlgebra already supplies

   Location: README line 116 (gap contract); §4.8 line 915.

   Claim: DeformationAndDerivedPatchingAlgebra must newly construct a finite injective coefficient-compatible map W(k)⟦T₂,…,T_d⟧ → B.

   Witness: DeformationAndDerivedPatchingAlgebra §1.10 (`cohenCompatibleLift`), §1.9 (native series evaluation) and §4.1 ("Finiteness from a residual fibre": B finite over A when B/m_A B is finite over k_A) give the map and its finiteness; injectivity is a dimension count (B a domain of dimension d, finite over A/ker).

   Repair: delete the gap from the README contracts (and report it to the intake); in §4.8 cite DeformationAndDerivedPatchingAlgebra §§1.9, 1.10, 4.1 and prove injectivity here: a nonzero kernel P would give dim B ≤ dim A/P < d.

13. **F13** (P2) Gap `parameter-systems` is compound and half of it is already supplied

   Location: README line 122.

   Claim: DeformationAndDerivedPatchingAlgebraPartII must identify maximal secant lists of R with parameter systems and transport them under completion, domain quotients and finite injective local maps.

   Witness: §K0.3's secant dimension formula (for M = R ≠ 0, a list in m is secant iff dim R/(rs) + length = dim R) already identifies secant lists with zero-dimensional quotient with dimension-length lists generating an m-primary ideal; the three transports are separate statements in one sentence.

   Repair: drop the identification half (cite the §K0.3 formula), and state the remaining contract as three separate sentences with hypotheses, e.g. "a parameter system of a Noetherian local R maps to one of R̂; of R/P when dim R/P = dim R; of B for a finite injective local map R → B".

14. **F14** (P2) Gap `perfectoid-base-modification-domination` cannot be stated by its supplier as written

   Location: README line 134.

   Claim: SchemeAndStackFoundations must handle "an arbitrary integral perfectoid p-torsion-free base A and a proper Y→Spec A".

   Witness: SchemeAndStackFoundations is line 2 of the merge order and PerfectoidSpaces (owner of integral perfectoid rings, §P1.24) is line 13, so the supplier cannot use the carrier; its §4.12 is Noetherian, and the Raynaud–Gruson form it cites (Stacks tags 0815, 081R) needs finite presentation, which "proper" does not give over a non-Noetherian base.

   Repair: restate the contract without perfectoid notions: for a quasi-compact quasi-separated scheme S, a quasi-compact open U and a proper, finitely presented X → S that is an isomorphism over U, a U-admissible blow-up with finitely generated centre dominates X; apply it in §7.4 to S = Spec A, U = Spec A[1/p] (the base change of the finite-type Z₀ is finitely presented) and keep the completion and perfectoid steps in §7.4.

15. **F15** (P2) Gap `grauert-riemenschneider` has a vague tail

   Location: README line 144: "with the field-extension and duality comparisons required for derived splitting".

   Claim: the contract is a precise request.

   Witness: the tail names no statement or hypothesis; ResolutionOfSingularitiesCharacteristicZero §5.5 (`localIsomorphismResolution`) states resolution only, and no roadmap mentions Grauert–Riemenschneider vanishing, so the supplier cannot tell what to provide.

   Repair: state only the vanishing (ρ: Y → X proper birational, X a variety over a characteristic-zero field, Y smooth: Rⁱρ_*ω_Y = 0 for i > 0) and either list each comparison as its own sentence (compatibility of Rⁱρ_*ω with field extension; the duality isomorphism used) or move them to §7.7 as owned steps.

16. **F16** (P3) Supplier contracts omit sections that the Needs lines use; absolute integral closure owner not cited

   Location: README lines 112 and 132 (contracts) versus lines 325, 944 (DeformationAndDerivedPatchingAlgebra §§3.7, 3.9), 124 (SchemeAndStackFoundations §2.7); §§4.9 and 5.4 (lines 928, 1084).

   Witness: the contract for DeformationAndDerivedPatchingAlgebra lists §§1.9–1.15, 3.1–3.4, 7.3 only; SchemeAndStackFoundations §0.11 on main defines `absoluteIntegralClosure` with the affine comparison to `Spec A⁺`.

   Repair: add §§3.7, 3.9 (and §4.1, see R12) to the DeformationAndDerivedPatchingAlgebra contract and §2.7 to the SchemeAndStackFoundations contract; cite SchemeAndStackFoundations §0.11 as the owner of R⁺ in §§4.9 and 5.4, noting that the Lean statements use the equal native expression `integralClosure R (AlgebraicClosure (FractionRing R))`.

17. **F17** (P3) `ParameterSystem` has two Checks

   Location: README lines 272–273.

   Witness: only the field (empty list) and k⟦X⟧ with (X²), (1) are tested.

   Repair: add a third discriminating Check, e.g. over k⟦X,Y⟧ the list (X, X) has the right length 2 but radical (X) ≠ m, and (X) has length 1 < dim 2.

18. **F18** (P3) Locator lines and pages

   Location and witness: line 1294 cites BHATT18 line 109 for "§1.2, last paragraph", which starts at BHATT18 line 137; line 1409 cites BHATT18 line 6 (the title) for Remark 1.3(2), at BHATT18 lines 32–40; line 1353 puts Lemma 2.2 at pp. 5–6 and Proposition 3.1 at pp. 6–7, but BHATT12 lines 256 and 294 are on pp. 6 and 7; line 450 cites HOCHSTER73 line 215 for Theorem 2, which is at HOCHSTER73 line 235; HH95 is recorded in `sources.toml` as cited for 0.6, 4.10 and 6.3 but no body section cites it.

   Repair: correct the five line or page numbers; add "(HH95, §1.2(d); uncertified)" to §0.6 and "(HH95, §2.3; uncertified)" to §6.3, or drop those `cited_for` values.

19. **F19** (P3) Undefined names and duplicated Checks

   Location: line 1372 "(isSplinter of §7.1)"; line 337 "n + 1 = dim A" (n undefined there); duplicated Checks at lines 219/225 (field), 224/226 (ℚ-domain), 626/630 (A₀ = ℤ_p).

   Repair: replace "isSplinter of §7.1" by "the reduced-derived-splinter law of §7.1"; write "dim A"; delete one Check of each duplicated pair.

20. **F20** (P3) §4.6 states the two sufficient conditions ambiguously

   Location: line 875: "Then D is almost Cohen–Macaulay … iff it is so for (A, x, π^{1/p^∞}). This holds in each of the following cases".

   Witness: the equivalence holds unconditionally; (a) and (b) are sufficient conditions for almost Cohen–Macaulayness (ANDRE18B line 696; the README proof route proves exactly that).

   Repair: "In each of the following cases D is almost Cohen–Macaulay for (A, x, π^{1/p^∞}), hence for (B, x, π^{1/p^∞})".

Twenty findings: four P1 (the four supplier-`none` gaps of the design), eleven P2 (padding in `Suggested.lean`, one false Check, restated supplier API, a false ownership claim, four imprecise or already-supplied gap contracts) and five P3. The mathematics of the 52 targets is otherwise sound and the package is not an alias of any roadmap: no roadmap on main, in the 352 open roadmap pull requests or among the board packages states the direct summand theorem, splinters, big Cohen–Macaulay algebras or their applications, and PerfectoidSpacesPartII (design README, scope paragraph) explicitly leaves all of them to this roadmap.

## Adversarial pass

Each row gives the instance, the values computed on each side, and the outcome.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `SplitAlgebra` | ℤ→ℤ[i]; ℤ→ℚ; K→0; ℝ→ℂ | ρ(a+bi)=a, ρ(1)=1; Hom(ℚ,ℤ)=0 so no ρ; ρ(1)=ρ(0)=0≠1; real part: ρ(i·i)=−1, ρ(i)²=0 | sound; non-multiplicative retraction admitted, zero algebra excluded | none |
| 0.2 `Splinter` | node K[x,y]/(xy); k[ε]/ε²; ℤ; K[t²,t³] | x=(x+y)(1,0) in S, x∉(x+y)R (constants 1,0); not reduced; ns≡1 forces n=1; K[t]/K[t²,t³]=K·t torsion ≠0 | sound | R19 duplicates |
| 0.3 `ParameterSystem`, `BigCMFor` | k⟦X⟧ with [X²],[1]; ℤ_(p), M=ℚ; K⟦X,Y⟧/(XY,Y²); M=0 | rad(X²)=(X), length 1=dim; 1∉m; p bijective, ℚ/pℚ=0; Y·m=0 so depth 0<1; 0/m0=0 | sound | R08, R10, R17 |
| 0.4 `BalancedBigCM` | k⟦X⟧, M=R/(X); field; regular local | X·1=0; every nonzero module; every sop regular | sound | none |
| 0.5 completion | R=k[X]_(X), M=R; M=0 | M̂=k⟦X⟧, M̂/XM̂=k, X regular; hypothesis fails | sound (M̂/mM̂≅M/mM, m finitely generated) | R03, R08 |
| 0.6 flatness | DVR A, C=Frac A; A=C | ϖC=C so not balanced and flat-not-faithfully-flat; trivial | sound | R08, R19 |
| 0.7 obstruction | 0→ℤ→2ℤ→ℤ/2→0; id; K[t²,t³]⊂K[t]; ℤ⊂ℤ[i] | class 1∈Ext¹(ℤ/2,ℤ)=ℤ/2; cone 0; Hom_A(K,A)=0 but Ext¹≠0; B/A free on i, class 0 | sound; direction fixed | none |
| 0.8 reductions | S=A×A/I; g choice | projection to A injective, to A/I not; height-one primes over p avoid closure of non-étale locus | sound | none |
| 0.9 trace | ℤ→ℤ[(1+√5)/2]; K(√a), a nonsquare, char≠2 | d=2, Tr=1, d⁻¹Tr=1/2∉ℤ; Tr(1)=2, Tr(√a)=0 | sound | none |
| 0.10 dim ≤ 2 | DVR; k⊂k[ε]/ε² | torsion-free finite ⇒ free; basis 1,ε | sound | none |
| 1.1 endomorphism criterion | 𝔽₂⟦X⟧, σ(X)=X², r=0; V⟦x⟧, σ(x)=x^q | σʲ(m)R=(X^{2ʲ}), ∩=0, rank 2; ∩σʲ(m)R=rR | sound (r regular added, source E2) | none |
| 1.2 pure ⇒ split | Datta–Murayama K₁(k); ℤ→ℚ; R→R×R | Hom(V^{1/p},V)=0 though pure; ℤ/2⊗: 1↦0; pr₁ retracts | sound | R08, R10 |
| 1.3 char p | 𝔽₂⟦X⟧⊂𝔽₂⟦X^{1/2}⟧; 𝔽₃ | a+bX^{1/2}↦a; basis 1,X^{1/3},X^{2/3} | sound | R05 |
| 2.1 adic criterion | A=ℤ, I=ℤ; ℤ, M=ℤ/2 | all quotients 0 split but ℤ→ℤ/2 has none (I⊄Jac); transition 2ⁿ↦0 in Hom(ℤ/2,ℤ/2ⁿ) | sound | none |
| 2.2 mod pᵐ | A=ℤ₂, g=1 | pg≡0 mod 2, =2≠0 mod 4 | sound (m≥2 then reduce) | none |
| 2.3 André | n=0 | W(k) a DVR | sound | R07 |
| 3.1 Cohen presentation | ℤ_p[√p]⟦x₂⟧; f₀=p²+X² | f=X₁²; u=1−p, u⁻¹(p−f₀)=p−X²/(1−p); p∣f ⇒ kernel (p), char p | sound | none |
| 3.2 perfectoid cover | A₀=ℤ_p; p=2 | A=(ℤ_p[p^{1/p^∞}])^; v(2^{1/2ⁿ})=2⁻ⁿ→0, ideal not finitely generated | sound | R19 duplicate |
| 3.3 almost faithful flatness | ℤ₂, O_K | A/2≠0, 2^{1/2} has valuation 1/2<1 | sound | none |
| 3.4 detection | ℤ₂, g=1, m=3 vs 2 | p²g=4≠0 in ℤ/8, =0 in ℤ/4 | sound (BHATT18 line 576) | none |
| 3.5 annuli | 𝔽₄=𝔽₂[ω] | Tr(1)=0, Tr(ω)=ω+ω²=1 | sound | none |
| 3.6 limit | constant tower; zero complex | lim=V, lim¹=0; both Hom 0 | sound | none |
| 3.7 Bhatt | p odd, y²=x+p; p=2 | disc 4(x+p), g=x+p≢0 mod p; disc 4(x+2), g=x+2 | sound | R07 |
| 4.1 `AlmostCMFor` | ℤ_p, D=O_K, π=p; 𝔽_p⟦X,Y⟧/(XY,Y²), π=1; D=0 | J=m_D, p^{1/p}∉pD; (0:X)=(Y) not killed; roots in m·0 | sound | R06 |
| 4.2 partial modification | T=k⟦x⟧[t]/(xt), u₁=t; zero relation N=1; K⟦X,Y⟧/(XY,Y²) | T/Rt keeps t², T/(t)=R kills it; R⊕(R/x)X; R/RY kills Y | sound | none |
| 4.3 criterion | R=k⟦X⟧, T=R/(X) | T/R·1=0 bad | sound | R04 |
| 4.4 key lemma | N=1,D=2; N=0,D=1; M=R² example | 2+2+1=5=1+2·2; 1; x−0=x vs x−x=0 | sound | none |
| 4.5 almost ⇒ balanced | ℤ₂, O_K, π=2 | v(2^{1/2ʰ})<1 so ∉2D | sound | R06 |
| 4.6 criteria | ℤ₂, x₁=4, g=1 | (π)∩A=2ℤ₂⊄4ℤ₂ | sound | R20 |
| 4.7 reductions | ℤ₂⟦X,Y⟧/(2X,2Y); ℤ_p⟦x,y⟧/(xy) | dims 2 and 1; (2+X,Y) quotient ℤ/4, image (2,0) on ℤ₂ length 2>1; B/(x) dim 2 | sound | none |
| 4.8 mixed existence | ℤ₂⟦X,Y⟧/(2X) | B/(2) dim 2, B/(X)=ℤ₂⟦Y⟧ dim 2 | Check false | R09 |
| 4.9 R⁺ in char p | R=𝔽₂; Lean vs HUNEKELYUBEZNIK lines 227–233 | R⁺=𝔽̄₂≠0, empty list; hypotheses agree (domain, image of Gorenstein local) | sound | R16 |
| 4.10 char 0 | ℚ[ε]/ε²→ℚ | m·ℚ=0≠ℚ, dim 0 | sound | R01, R05 |
| 4.11 existence | 𝔽₂[ε]/ε²→𝔽₂ | m·C=0 | sound | none |
| 4.12 squares | π=2, π′=4 | 2^{2/2ⁿ}/2^{1/2ⁿ}=2^{1/2ⁿ}; reverse quotient valuation −1/2ⁿ | sound | none |
| 5.1 DST | R=0; cubic over 𝔽₂ with a↦x² | S=0, ρ(1)=1; c²≠0 in 𝔽₂[c]/c³, z⁴=x³z+y³z∈(x²,y²) | sound | none |
| 5.2 Chase | k⊕V, V²=0; empty product; ∏ℤ | (x₁,x₂,…) killed by x₀, not in VM; 0 not faithfully flat; torsion-free | sound | none |
| 5.3 flat domination | ℤ₂, S=R×R/2; R=0 | T=R; 2T=0 on other factor; T=0 vacuous | sound | none |
| 5.4 R→R⁺ | field; DVR (Datta–Murayama) | K̄ basis with 1; non-complete fails | sound | R16 |
| 5.5 monomial | K⟦x,y⟧/(xy), x+y; k⟦X,Y⟧, n=2; d=0 | iff m≥n; XY∉(X²,Y²), X²Y²∈; 1∉0 | sound (source E15 repaired) | none |
| 6.1 purity and completion | k[X]_(X)→k[X,Y]_(X,Y) | Y↦0 extends to k⟦X,Y⟧→k⟦X⟧ | sound | none |
| 6.2 weak functoriality | ℤ_p⟦T⟧→ℤ_p⟦T,U⟧/(T²−TU+p); 𝔽₂→𝔽₂(t), 𝔽₂(t)→𝔽₂(t^{1/2}) | V=U−T gives p−TV, T zero divisor on B′/p; separable trdeg 1; inseparable degree 2 | sound | none |
| 6.3 CM descent | k⟦X,Y⟧ | (0:X)=0, (X):Y=(X) | sound | R18 (HH95) |
| 6.4 pure subrings | C₂ on ℤ₃⟦X⟧; S₃ on ℤ₅⟦X₁,X₂,X₃⟧ | ℤ₃⟦X²⟧, a+bX↦a; Reynolds X₁↦(X₁+X₂+X₃)/3, 6 a unit | sound | none |
| 7.1 `DerivedSplinter` | Spec(ℤ/2)→Spec ℤ; elliptic cone; A_red; diagonal | 2↦0 but ρ(2)=2; R¹π_*O=H¹(E,O)=ℂ; n=ρ(n·1)=0 forces reduced; pr₁∘(a↦(a,a))=id | sound | R19 |
| 7.2 perfectness | elliptic curve; 𝔸¹ | H⁰=H¹=k; H⁰=k[T] infinite, not proper; Stacks 01XI bound | sound | R18 |
| 7.3 reductions | Spec(A×A)→Spec A | closure of a generic point is Spec A | sound | none |
| 7.4 almost split | Y=Spec(A/p) | Hom_A(A/p,A)=0 (A p-torsion-free) | sound with surjectivity (source E17) | R14 |
| 7.5 killing cohomology | elliptic curve, p=2,3 | [p]* acts by p=0 on H¹(O_E); identity acts by 1 | sound | R18 |
| 7.6 char p equivalence | node; 𝔽_p⟦x,y⟧ | contraction fails; regular | sound | none |
| 7.7 char 0 | E/ℂ | H¹=ℂ yet splits in D(ℂ) | sound | R02 |
| 7.8 derived DST | blow-up of k⟦X,Y⟧ at (X,Y) | Rπ_*O=O, unit iso | sound | none |
| `PureAlgebra` | id; ℤ→ℚ; diagonal | identity; 1↦0 in ℤ/2⊗ℚ; split | sound | R10 |
| `SeparableResidueMap` | 𝔽₂→𝔽₂(t); 𝔽₂→𝔽₄; 𝔽₂(t)→𝔽₂(t^{1/2}) | separable trdeg 1; separable degree 2; inseparable | sound (matches Stacks 030O, STACKS line 4671) | none |
| `structureComplex`, `derivedUnit` | Spec 𝔽₂; ∅; Spec k[ε]; diagonal cover | 𝔽₂ in degree 0, zero elsewhere; all zero; ε≠0 kept; a↦(a,a) | sound | none |
| convention: obstruction direction | 0→ℤ→2ℤ→ℤ/2→0 | α=1∈ℤ/2, last arrow Q→A[1] | sound | none |
| convention: divisibility δ(π^{1/pᵐ})∣π′^{1/pᵐ} | π=2, π′=4 | quotient 2^{1/2ⁿ}, reverse fails | sound | none |

## Duplication audit

By object, at the pins and across roadmaps: no Mathlib or Tau Ceti declaration of split algebras, splinters, pure ring maps, systems of parameters, big or balanced Cohen–Macaulay modules or Cohen–Macaulay rings (searches of `Mathlib/RingTheory`, `Mathlib/Algebra/Module`, `Mathlib/LinearAlgebra` and `TauCeti/RingTheory`; `Ideal.Pure` in `Mathlib/RingTheory/Ideal/Pure.lean` is a different notion). Mathlib's perfectoid directory has only Fontaine's θ, untilts and B_dR, so the docstring's claim that integral perfectoid algebras are missing is correct. Supplier-owned objects restated: pure-map laws and parameter-list laws (R10); absolute integral closure (R16). Chase's flat-product theorem (§5.2) is owned nowhere else (search of main, the open pull requests and AdicSpacesPartIII R2.10). Ownership was checked against all 352 open roadmap pull requests with the roadmap search tool, against main, against the board packages in this checkout, and against SchemeAndStackFoundationsPartII at its pull-request head.

## Supplier-order audit

Dependency check output: `depcheck: 49 roadmaps, 562 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Every supplier is on main (DerivedModuleAlgebra, EnhancedDerivedSheaves, PerfectoidSpaces, SchemeAndStackFoundations, StableReduction) or earlier in the merge order (lines 2–72 versus this roadmap at line 73). The resolver's single lead, "PerfectoidSpacesPartII §RA.5 found nowhere", is a false lead: `packages/PerfectoidSpacesPartII/design/README.md` is on the board's main branch, and every cited RA slug resolves in the stated section (RA.0 three tower targets, RA.1 annular tower and the two Riemann extension forms, RA.3 perfectoid Riemann extension, RA.5 pure map, almost pure map, Krull detection, flat integral model, Kummer purity, Kummer almost faithful flatness, ramified Kummer almost flatness).

## Verified sound

- Elaboration: `lake env lean` on `Suggested.lean` from the content checkout exits 0 with exactly 19 `sorry` warnings and nothing else. A scratch copy with `#check @name` for all 30 declarations elaborated once; every elaborated type matches its README statement and generality, and every binder is explicit in its own signature (no `variable` blocks). One-step probes: R05 (three closures), R06 (one closure), R07 (fails only on the missing instance). `TauCeti.IsRegularLocalRing.isDomain` is an instance (`TauCeti/RingTheory/RegularLocalRing/Basic.lean:124`), which makes `FractionRing R` a field in `absoluteIntegralClosure_split`.
- Form: one `import Mathlib` plus `TauCeti.RingTheory.RegularLocalRing.Basic` (exists, used); no `set_option`, no sorry'd data, no `lemma`; module docstring names the three non-statable headline groups and their missing carriers.
- Library declarations opened at the pins: `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`), `IsRegularRing` (same file, line 92, with the TODO that regular local does not yet imply regular), `Algebra.IsTranscendentalSeparable` (`Mathlib/FieldTheory/TranscendentalSeparable.lean:72`), `CategoryTheory.HasInjectiveDimensionLE` (`Mathlib/CategoryTheory/Abelian/Injective/Dimension.lean:52`), `Ideal.ofList` (`Mathlib/RingTheory/Regular/RegularSequence.lean:41`), `Ideal.iInf_pow_eq_bot_of_isLocalRing` (`Mathlib/RingTheory/Filtration.lean:431`), `CochainComplex.Plus` (`Mathlib/Algebra/Homology/CochainComplexPlus.lean:42`), `DerivedCategory.Plus.Q` (`Mathlib/Algebra/Homology/DerivedCategory/Plus.lean:227`), `HasDerivedCategory.standard` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:81`), `Module.Flat.pi` and `Module.FaithfullyFlat.pi_of_exists_submodule_ne_top` (`TauCeti/RingTheory/Flat/Pi.lean:62, 75`); every Mathlib name in the contract exists in the stated file.
- Cross-roadmap citations resolved (11 roadmaps): PerfectoidSpaces P0.12, P1.1, P1.24, P1.25, P2.7–P2.8, P3; PerfectoidSpacesPartII RA.0–RA.5 (above); PerfectoidQuotients §§0.7, 1.3, 1.4; DerivedDeRhamCohomology §1.10; DerivedModuleAlgebra §§0.K.1, 1.T.1, 1.1.1, 1.E.0, 1.M.2; EnhancedDerivedSheaves §§E1.4, E1.6 (global dimension, Kunz, Cohen presentations), E1.8 (`liftingObstruction_map`); DeformationAndDerivedPatchingAlgebra §§1.9, 1.10, 1.13–1.15, 3.1, 3.4, 3.7, 3.9, 7.3; DeformationAndDerivedPatchingAlgebraPartII §§K0.1, K0.3; SchemeAndStackFoundations §§0.9, 0.11, 0.15, 0.17, 2.6, 2.7, 2.18, 4.12, 4.13; StableReduction Layer 2; ResolutionOfSingularitiesCharacteristicZero §5.5.
- Gap contracts declared where the intake reads them: the six named-supplier slugs appear in both `plan.json` and the README. `ramified-multielement-kummer` (RA.5 covers only the unramified one-g case) and `common-cohen-extension` are precise and not supplied elsewhere.
- Seeded source sample, read at the cached texts: 0.2 (BMPSTWW line 672, BHATT12 lines 20 and 91, ANDRE18B line 27), 0.4 (ANDRE18B line 641, BMPSTWW line 507), 1.1 (ANDRE18B lines 898–927), 2.1 (ANDRE18B line 630, BHATT18 line 547), 3.1 (BHATT18 lines 493–498), 3.7 (BHATT18 lines 563–595), 4.7 (ANDRE18B lines 720–731), 5.5 (ANDRE18B lines 41–78), 6.2 (ANDRE18B lines 779–818, 575–586), 6.3 (ANDRE18B line 818–821), 7.2 (BHATT18 line 604; STACKS coherent text lines 290, 2350), 7.4 (BHATT18 lines 616–657), 7.5 (BHATT12 lines 42, 256, 294–386), 7.6 (BHATT12 lines 38, 388–396), 7.7 (BHATT18 line 27, BHATT12 line 105, KOVACS00 lines 11, 50). Also read: HUNEKELYUBEZNIK lines 75–82, 227–253; DATTAMURAYAMA lines 1315–1320; HOCHSTER73 line 235; STACKS more-algebra line 13484 (0A6A). Statements, hypotheses and numbers agree, with the line and page slips of R18; no locator points to a text lacking the statement.
- Principles: no route-specific shortcut (ramified and unramified bases both covered), no computational algorithm, no copied passages, no process words or pull-request numbers, no LaTeX delimiters.

## Not verifiable

- HH95 (§1.2(d), §2.3): paywalled and settled as uncertified; its two uses (flatness of balanced algebras over regular rings, Cohen–Macaulay descent) were checked mathematically only.
- Bruns–Herzog, Theorem 8.5.1 and Exercise 8.1.7 (cited inside BMPSTWW for §0.5): not in the manifest and not openly available; not requested, since BMPSTWW states the result.
- Sources outside the seeded sample (CHASE60, HOCHSTER02, HEITMANNMA18, HOCHSTERLC) were not re-read beyond what the sampled targets needed.

## Source issues

- **Error** in BHATT18 at Proposition 6.2, p. 11: the source says the unit is almost split for every proper map whose generic fibre is finite étale; it should require that generic fibre map to be surjective (Spec(A/p) refutes it); affects a stated result.
- **Misprint** in BHATT18 at Theorem 5.4, p. 10: the source asserts splitting of a map to B₀ without introducing B₀; it should state it for a finite extension A₀ → B₀ of Noetherian rings with A₀ regular; affects nothing.
- **Misprint** in BHATT18 at Proposition 5.2(1), p. 8: the source calls A an integral perfectoid K-algebra; it should be a K°-algebra; affects nothing.
- **Misprint** in BHATT18 at §1, sentence after Theorem 1.1, p. 1: the source says the trace argument works in characteristic 0; it should say when A₀ contains ℚ, since ℤ_p has characteristic 0; affects nothing.
- **Error** in ANDRE18B at Proposition A.3.1, final assertion and Annexe A.3 Applications, p. 91: the source says pure integral extensions of regular rings split, and that V⟦T⟧ splits in its absolute integral closure for every DVR V; it should require a complete base (an excellent Henselian DVR with zero Frobenius dual refutes it); affects a stated result.
- **Gap** in ANDRE18B at Proposition A.3.1, proof of (c) ⇒ (b), p. 91: the source divides a functional by a power of r knowing only that R is r-adically separated; it should also require r = 0 or r a nonzerodivisor; affects the proof.
- **Misprint** in ANDRE18B at Proposition A.3.1, proof, p. 91: the source defines the linear form on N; it should be on the chosen finite free summand M; affects nothing.
- **Gap** in ANDRE18B at Lemme A.2.1(4), proof of (c) ⇒ (b), p. 90: the source takes the dual over S and a single pair with value 1; it should use Hom_R(S, R) and a finite sum of values equal to 1 (t ↦ Σ fᵢ(sᵢt)); affects the proof.
- **Gap** in ANDRE18B at Lemme A.2.2, proof, p. 90: the source tests purity of the completed map only on modules extended from R; it should test every finite module over the completion, through its finite-length quotients; affects the proof.
- **Gap** in ANDRE18B at §4.2, first paragraph, p. 86: the source says completing and killing nilpotents gives a ring without p-torsion; it should also pass to a maximal-dimensional minimal prime, since ℤ_p⟦x⟧/(px) is reduced with p-torsion; affects the proof.
- **Misprint** in ANDRE18B at §4.1, definition of partial modification, p. 85: the source multiplies the relation by module elements of bounded degree; it should multiply by scalar polynomials of bounded degree, with the variables carrying the distinguished element; affects the proof.
- **Gap** in ANDRE18B at Proposition 4.1.2, proof, p. 85: the source says B → D factors through the colimit algebra; the construction gives only choice-dependent linear maps into π^{−1/pⁿ}D; affects nothing.
- **Misprint** in ANDRE18B at Proposition 4.4.1, p. 87: the source says D′ is almost Cohen–Macaulay for B with parameters x′; it should be for B′; affects nothing.
- **Error** in ANDRE18B at §4.3, proof of Théorème 0.7.2, p. 87: the source takes the product over all local factors of the normalisation, including lower-dimensional ones that are not flat over the completed base; it should keep only factors dominating it; affects the proof.
- **Misprint** in ANDRE18B at footnote 7, pp. 86–87: the source uses the Tor degree also as the length of the regular sequence and writes the third Tor term with M; it should use the height of P and the module N; affects the proof.
- **Error** in ANDRE18B at §0.1, statement (4), p. 72: the source asserts the monomial equivalence for every local ring; it should require dimension at least 1, since the empty product 1 never lies in the zero ideal; affects a stated result.
- **Misprint** in BHATT12 at Lemma 2.2, p. 6: the source gives the composite of the d maps the target K_d; it should be K_{d+1}; affects nothing.
- **Gap** in BHATT12 at proof of Theorem 0.4, p. 9: the source iterates the cover construction dim(X) times, which can be infinite for a Noetherian X; it should iterate up to the cohomological amplitude bound given by a finite affine cover; affects the proof.
- **Misprint** in BHATT12 at proof of Theorem 0.3, p. 9: the source uses one letter for both the factorisation and the splitting and composes with an undefined letter; it should compose the splitting after the factorisation; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "102f454", "job": "REV-PKG-DirectSummandsAndBigCohenMacaulay", "model": "opus", "worker": "fable-rev96"} -->
