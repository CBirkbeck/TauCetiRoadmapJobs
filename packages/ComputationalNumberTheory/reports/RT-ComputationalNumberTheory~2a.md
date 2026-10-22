<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/131#issuecomment-6333748089 -->
Red team round 2 pass a (codex) of 47e438c

Verdict: needs_changes

1. **F01** (P1) Complete-DVR factor Hensel remains unowned

   **Location:** `packages/ComputationalNumberTheory/README.md:1105`: “coprime factor Hensel over complete DVRs”.

   **Claim:** The new polygon-factorisation contract consumes this general theorem, but §1.26 only constructs factors in `ZMod (p^k)`. Its degree-bounded induction does not itself supply the inverse-limit theorem over an arbitrary complete DVR.

   **Witness:** README:765 specifies integer polynomials and `ZMod (p^k)`. `Mathlib/RingTheory/Henselian.lean:49` lists coprime-factor lifting as unfinished. MilneANT line 5346 states the missing complete-ring factor theorem.

   **Exact repair text:** Insert before §2.19a: “`henselFactor_completeDVR`: Let O be a complete DVR with residue field κ and let f∈O[X] be monic. Every expression f̄=g₀h₀ with g₀,h₀ monic and coprime in κ[X] lifts uniquely to monic g,h∈O[X] with f=gh and reductions g₀,h₀. Finite pairwise coprime factorizations lift uniquely as well. Prove degree-bounded corrections modulo successive powers of the maximal ideal, then take coefficientwise limits; prove uniqueness using separatedness. Include constant factors and arbitrary residue characteristic. Source: MilneANT, Theorem 7.33 and Lemmas 7.34–7.35, pp.121–122.” Make `phiPolygon_factorization` consume this named target. Keep §1.26 as its finite-quotient specialization.

2. **F02** (P1) AKS cardinality inputs are listed but never contracted

   **Location:** `packages/ComputationalNumberTheory/README.md:656`: “Those nonroutine algebraic estimates are separate proof requirements.”

   **Claim:** Neither the layer nor its suppliers names or states those requirements. The three predicates on the Needs line do not supply the quotient-algebra inequalities proving the converse of `aks_correct`.

   **Witness:** Shoup line 21783 supplies the evaluation-image upper bound; Shoup line 21819 supplies the lower bound; Shoup line 21864 supplies their incompatibility. None is a target in this package.

   **Exact repair text:** Insert before §1.14: “For n>1, r>1, a prime p dividing n and gcd(n,r)=1, put E=𝔽_p[X]/(X^r−1), ξ=[X], D(n)={a∈E : a(ξ^n)=a(ξ)^n}. Evaluate at a primitive rth root ζ in 𝔽_(p^ord_r(p)), and let S be the image of D(n). Put t=|⟨p mod r,n mod r⟩|. Prove `aks_evalImage_upper`: if n is not a prime power, |S|≤n^(2⌊√t⌋). Prove `aks_evalImage_lower`: if p>r and (ξ+j)^n=ξ^n+j for 1≤j≤ℓ, then |S|≥2^min(t,ℓ)−1. Prove `aks_growth_contradiction`: ord_r(n)>4 len(n)^2 and ℓ>2 len(n)⌊√r⌋ imply 2^min(t,ℓ)−1>n^(2⌊√t⌋). Supply the substitution endomorphisms and their composition laws in the same general finite algebra. Source: Shoup, Lemmas 21.6–21.11, pp.550–558.” Add these named inputs to §1.14; retain the full primality statement.

3. **F03** (P1) The integral modular basis needed by the congruence bound has no target

   **Location:** `packages/ComputationalNumberTheory/README.md:1260`: “The full modular integral basis must be constructed separately from the complex Sturm theorem.”

   **Claim:** This is an unowned input. §3.3 constructs a basis of the cusp lattice only. The characteristic-zero dimension and equality theorems on the Needs line do not prove a mod-p congruence statement for the full modular lattice.

   **Witness:** README:1241 specifies `integralCuspLattice`; README:1258 quantifies over `integralModularLattice`. The weight-zero constant form already lies outside the former, so the cusp basis cannot supply the latter basis.

   **Exact repair text:** Insert before §3.4: “`exists_integralModularBasis`: For every k∈ℕ, the integral level-one modular lattice has a finite ℤ-basis b_i and distinct indices n_i≤⌊k/12⌋ with a_(n_i)(b_j)=δ_ij. Prove it by the integral triangular E₄,E₆,Δ construction, including the weight-zero constant basis and the empty weight-two basis; odd weights have the empty basis. Source: Stein, Algorithm 2.18 and Lemma 2.20, pp.19–21. Needs: §3.1 and the native level-one dimension and q-expansion theorems.” Make §3.4 depend on this target. Divisibility of the pivot coefficients then gives divisibility of every integral coordinate.

4. **F04** (P1) The GRH certification uses an unowned Turing comparison

   **Location:** `packages/ComputationalNumberTheory/README.md:1964`: “sign-change zero isolations and Turing upper count”.

   **Claim:** Value enclosures and a finite character range do not supply an upper bound on the number of zeros. The zero-count identity and integrated argument estimate are absent from the roadmap, its named suppliers and the pinned number-theory APIs searched.

   **Witness:** Platt line 271 states the conjugate-character zero-count identity; Platt line 321 states the bound on the integral of Sχ. Section 4.22 cites neither as an owned input.

   **Exact repair text:** Before §4.22 add “`dirichletArgumentCount`: Define Sχ(t)=π⁻¹ Im ∫_(∞)^(1/2) L′χ(σ+it)/Lχ(σ+it) dσ, with the one-sided convention at zeros. For primitive χ, establish the zero-count identity paired with its conjugate character and its integrated version, with zero-free endpoint ordinates and multiplicities retained (Platt, Theorems 3.1–3.2, pp.4–5). Import the general argument principle from ContourIntegration Layer 2. `dirichletTuringIntegralBound`: For primitive χ of modulus q, t₀>50 and h>0, prove |∫_[t₀,t₀+h]Sχ(t)dt|≤1.8397+0.1242 log(q(t₀+h)/(2π)) (Platt, Theorem 3.3, p.5). `dirichletZeroCertificate_complete`: Combine these bounds with a finite family of disjoint certified critical-line zero intervals to certify that their multiplicity lower count equals the total strip count.” Add these inputs to §4.22, retaining all moduli and the theorem's boundary heights.

5. **F05** (P1) Root counting omits its existing global-to-local supplier

   **Location:** `packages/ComputationalNumberTheory/README.md:1171`: “K ⊗_ℚ ℚ_p is the product of the completions K_P”.

   **Claim:** LocalFieldsRamification Layer 0 provides invariants for local extensions. It does not supply the global completion decomposition or its comparison with the number-field prime ideals used by the stated count.

   **Witness:** `Completed/NumberFieldArithmetic/README.md:1399` owns `semilocalEquiv`; :1427 names the factor/completion identifications; :1476 compares local e,f with the global ideal invariants. These sections are absent from this target's Needs line.

   **Exact repair text:** Append to §2.23's Needs line and the NumberFieldArithmetic supplier contract: “NumberFieldArithmetic §§5.3 and 5.5: `semilocalEquiv`, `completionFactorsEquivPlaces`, `factorFieldEquivCompletion`, and the comparison of completion ramification/inertia degrees with the prime-ideal invariants. Consume these identifications for K/ℚ before applying the LocalFieldsRamification degree formula.” Do not rebuild these comparisons here.

6. **F06** (P2) Elementary Lean contracts are narrower than their README statements

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:720`: “[Field K] [NumberField K]”; :739–740: “(hp : p.Prime) (hR : (Subalgebra.toSubmodule R).FG)”.

   **Claim:** The monotonicity target is promised for subalgebras of any characteristic-zero field, and the radical membership adapter for arbitrary natural p and subalgebras of a number field. Their explicit theorem binders impose additional restrictions.

   **Witness:** README:890 allows K=ℚ(X); Lean:720 requires `NumberField K`. README:914 allows p=0 and R=⊤; Lean:739 requires prime p and a finitely generated order, excluding those valid adapter cases.

   **Exact repair text:** Use the following signatures, adjusting only the local section context if needed:

   ```lean
   theorem isPMaximal_mono {K : Type*} [Field K] [CharZero K]
       (R S : Subalgebra ℤ K) (p : ℕ) (hRS : R ≤ S)
       (hR : IsPMaximal R p) : IsPMaximal S p := by
     intro x hx
     obtain ⟨a, ha, hax⟩ := hR x hx
     exact ⟨a, ha, hRS hax⟩

   theorem mem_pRadicalLattice {K : Type*} [Field K] [NumberField K]
       (R : Subalgebra ℤ K) (p : ℕ) (x : K) :
       x ∈ pRadicalLattice R p ↔
         x ∈ R ∧ ∃ k ≥ 1, ∃ y ∈ R, x ^ k = (p : K) * y := by
     sorry
   ```

   Keep primality and finite-order assumptions on the arithmetic maximality theorems that need them.

7. **F07** (P2) The CT scalar enclosure headline is easy to state but omitted

   **Location:** `packages/ComputationalNumberTheory/README.md:1807`: “prove existence of a rational interval”; `packages/ComputationalNumberTheory/Suggested.lean:1391`: “end ExplicitFormula”.

   **Claim:** The eight expressions use only existing complex derivatives, sums, real elementary functions and the retained `ctTailKernel`. Their common enclosure is a layer milestone, yet the Lean file stops after auxiliary remainder bounds and omits both the real-bodied scalar definition and this easy headline.

   **Witness:** README:1752–1759 gives all eight expressions explicitly. Lean:1337 retains their kernel; Lean:1371 and :1378 already use native digamma and its derivative. No new heavy carrier is needed.

   **Exact repair text:** Add a real-bodied `ctExplicitFormula (l : ℝ) (w : ℕ) : Fin 8 → ℝ` using exactly the eight displayed expressions and their displayed auxiliary arguments. Add `ctExplicitFormula_shared_value`, and the headline:

   ```lean
   theorem exists_ctEnclosure (l : ℚ) (hl : 0 < l) (w P : ℕ) :
       ∃ I : Fin 8 → NonemptyInterval ℚ,
         (∀ q, ((I q).fst : ℝ) ≤ ctExplicitFormula l w q ∧
           ctExplicitFormula l w q ≤ ((I q).snd : ℝ)) ∧
         (∀ q, (I q).snd - (I q).fst ≤ 1 / (2 : ℚ) ^ P) ∧
         I 1 = I 4 := by
     sorry
   ```

   List that name in §4.18. Bundle the two shared-value Checks at ℓ=1,2 into proved examples of the real definition; retain the full eight-scalar statement.

8. **F08** (P2) The presentation-change Check forgets the advertised substitutions

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:267`: “Nonempty (PresentationChange …)”.

   **Claim:** The docstring and README:449–452 promise to verify the specific inverse pair `(X+2,X+1)`. The theorem only asserts that some pair exists, so it does not check either substitution or the direction of the inverse.

   **Witness:** Over `ZMod 3`, the different pair `(2X+1,2X+1)` also satisfies all three divisibilities for these polynomials. Thus the typed conclusion cannot distinguish the claimed pair from that pair.

   **Exact repair text:** Replace the conclusion by:

   ```lean
   ∃ P : PresentationChange
       (X ^ 2 + 1 : (ZMod 3)[X]) (X ^ 2 + X + 2),
     P.b = X + 2 ∧ P.c = X + 1
   ```

   Prefer a proved bundled example constructing this pair and checking its three polynomial identities. Keep the separate non-self-inverse control over `ZMod 7`.

9. **F09** (P3) Several revised Checks still have no mirror, and AKS has no rejecting Check

   **Location:** `packages/ComputationalNumberTheory/README.md:625`: “The empty identity test is not a primality criterion”; :1162: “17 is square while 5 is not”.

   **Claim:** The two empty-range AKS bullets are the same vacuity observation, leaving only two distinct Checks and no rejection test. The displayed local-square Checks, finite Hensel Checks and real/dyadic local-image computations also lack matching Lean statements despite using existing carriers.

   **Witness:** Lean:411 and :419 only accept empty-range input 9. Lean:934–952 contains the general square criterion and ramified example, but no 17/5/6 control. Lean:1121 checks only an empty `localImageSpan`.

   **Exact repair text:** Replace README:625 by “At n=9,r=2,ℓ=1 the identity fails: modulo `(9,X²−1)`, `(X+1)^9=4X+4`, whereas `X^9+1=X+1`.” Add `AKSIdentities.nine_nonempty_rejected : ¬ AKSIdentities 9 2 1` and its README name. Add bundled named boundary targets for (a) `IsSquare (17 : ℚ_[2]) ∧ ¬ IsSquare (5 : ℚ_[2]) ∧ IsSquare (6 : ℚ_[5])`; (b) the exact two factor identities at modulus 49 and the two distinct lifts at modulus 4 in §1.26; (c) `Nat.card` of the actual `localImageSpan` for the real curve and abscissae of README:1422, and the single-generator dyadic span of :1424. The latter must compare with 2 and with 8 respectively. Use proved examples when elementary; otherwise keep these as named theorem targets with `sorry`, as the boundary-target rule permits. Do the same for the digamma/trigamma controls at z=1 in §4.17a; their positive real-part and N≥1 hypotheses are statable now.

10. **F10** (P3) Arb's error-bound sections do not locate the algebraic-root arithmetic

   **Location:** `packages/ComputationalNumberTheory/README.md:333`: “([Arb](#source-arb), §§5–5.3, pp.7–9.)”; the same locator occurs at :301, :321, :339, :345 and :355.

   **Claim:** Those sections discuss interval precision, error bounds and branch cuts. They do not state isolated algebraic-root presentations, closure under algebraic arithmetic or their equality test. These are valid elementary adapters, but the cited locus does not support the theorem attributed to it.

   **Witness:** Arb line 779 defines enclosure preservation; Arb line 800 begins generic error bounds; Arb line 933 begins branch cuts. `Mathlib/FieldTheory/AlgebraicClosure.lean:39` and :54 supply the actual algebraic carrier and membership characterization.

   **Exact repair text:** In §§0.8–0.13 replace the mathematical attribution to Arb by “This is a presentation adapter for Mathlib `algebraicClosure` and `mem_algebraicClosure_iff` (`Mathlib/FieldTheory/AlgebraicClosure.lean`, definitions at lines 39 and 54). Closure under addition, multiplication and inversion is the native intermediate-field structure. A nonzero polynomial has finitely many distinct complex roots; rational rectangles separate that finite set. Arb §5 is cited only for enclosure/error semantics, not for algebraic-root arithmetic.” Before §0.10 add `algebraicRootCertificate_exists`: for every z∈ℂ algebraic over ℚ, there is c : AlgebraicRootCertificate with c.value=z; prove it by finite-root separation with rational rectangles. Make §§0.10–0.12 and §4.19 consume this target. Align `sources.toml`'s `cited_for` descriptions with this limited use of Arb.

11. **F11** (P3) The multiplicity example still tests no retained definition

   **Location:** `packages/ComputationalNumberTheory/Suggested.lean:1612`: “example”; :1619: “have h := multiplicityGram_lift”.

   **Claim:** The example now expands the correct five coordinates, but its expression consists entirely of library matrices and literal sums. It tests no real-bodied definition introduced by the roadmap, and it derives the expanded value from the admitted headline rather than independently computing the Check.

   **Witness:** Lean:1604–1609 is a `sorry` theorem. The example at :1612–1621 mentions no retained roadmap definition and invokes that theorem to obtain the value −34. This leaves the earlier r1a F15 only partly repaired.

   **Exact repair text:** Add light definitions `multiplicityLift m t (i,r) := t i / m i` and `multiplicityBlockGram m A K (i,r) (j,s) := (if (i,r)=(j,s) then A else 0)-K i j`, with the same sigma index as the headline. State `multiplicityGram_lift` through these definitions. Make the existing example directly reduce the two- and three-element block sums with these definitions and rational arithmetic, without using `multiplicityGram_lift`. In the README add the singleton-block identity Check alongside the existing two-block normalization Check. Add the negative control n=1,m₀=0,A=0,K₀₀=1,t₀=1: the expanded sum is zero and the proposed reduced value is −1, so positivity of every block size is necessary.

12. **F12** (P3) The board diff contains a file outside the package

   **Location:** `merge-order/ORDER.txt:105`: “ComputationalNumberTheory”.

   **Claim:** The checked board pull-request diff is not confined to the package folder. This is the intake merge-order insertion, but it must remain board metadata rather than become a change in the roadmap publication.

   **Witness:** `git diff --stat origin/main...HEAD` reports `merge-order/ORDER.txt | 1 +`; the hunk inserts this roadmap after HeightsRationalPointsAndObstructions. Every other changed path is under `packages/ComputationalNumberTheory/`.

   **Exact repair text:** “Export only `packages/ComputationalNumberTheory/` to `TauCetiRoadmap/ComputationalNumberTheory/`; exclude the board's `merge-order/ORDER.txt` diff from the roadmap-repository change.” Keep the board order file intact; no package mathematics or supply position needs changing.

## Verification of every round-one finding

Here `a` means the earlier codex review and `b` the independent review. Line references in this table are to `packages/ComputationalNumberTheory/README.md` (R) and `packages/ComputationalNumberTheory/Suggested.lean` (L). Status concerns the original finding; a new defect in the replacement is identified separately. No settled finding is re-raised.

| Earlier finding | Status | Repaired passage at this head | Verification witness / remaining defect |
| --- | --- | --- | --- |
| a F01: computational algorithms | Repaired | R:24–25 “Computational algorithms, executable verifiers, implementation costs and termination specifications are outside this roadmap's scope.” | RAM/Boolean-verifier layer removed; mathematical predicates, finite-family assertions and existence statements remain. Pratt bit size measures the object, not an algorithm. |
| a F02: options | Repaired | L:1 “import Mathlib” | Full-file search finds no `set_option`; explicit local-field and number-field theorem hypotheses inspected. |
| a F03: admitted examples | Repaired | L:1245 “intervalMul (NonemptyInterval.pure 0) I” | All 45 example bodies read; none contains `sorry`. Elaboration was prohibited. The indirect reliance of the multiplicity example on an admitted target is recorded in S11. |
| a F04: duplicate class–unit theory | Repaired | R:95 “it defines no second relation lattice or stopping bound.” | Old §§2.10–2.15 and their Lean API are gone; the exact ClassGroupPresentation/regulator hypotheses match ClassicalArithmeticCompletion §§5.2,5.11,5.16,5.22. |
| a F05: nonexistent matrix supplier slugs | Repaired | R:244 “ClassicalArithmeticCompletion §3.3 `IntMatrix.IsSmithDecomposition`” | Current supplier §§3.3,3.5,3.25,3.27,3.33,3.48 exist; upper column convention agrees. |
| a F06: stale pins | Repaired | R:138 “`6b7abb3c7686292736be2955bd3eb9ebf63b456a`” | README's Mathlib and Tau Ceti revisions agree with the supplied manifest/checkouts; named native order APIs exist. |
| a F07: missing source manifest | Repaired | `sources.toml:1` “schema = \"tauceti-roadmap-sources/v1\"” | 26 unique works recorded: 25 readable cached texts and the settled uncertified Mattuck entry. Unsupported uses of Arb are separately S10. |
| a F08: transfer to EffectiveDiophantineMethods | Not repaired; disposition accepted | R:2148 “EffectiveDiophantineMethods” | Repair's refusal is justified: ORDER positions are 105 versus 131; no owner folder on supplied main. Repointing upward would violate the contract. No finding. |
| a F09: nonexistent AN.4 | Repaired | R:253 “any analytic lower bound for `h_K*R_K` is a separate input.” | Duplicate stopping targets and the AN.4 dependency have both disappeared. No hR residue computation is still consumed here. |
| a F10: missing alternating headline | Repaired | L:1363 “theorem ctTailKernel_alternating_tail” | Explicit α>0, b≥0, N arbitrary; first omitted term agrees with CL normalization. N=0 and b=0 tested. |
| a F11: algorithmic existence docstrings | Repaired | L:1393 “Complete isolation of the roots of a rational polynomial” | Renamed existence targets at L:627,785,1394 agree with R §§1.28,2.8,4.19. No termination or complexity conclusion is promised by their types. |
| a F12: ℤ_p-only square criterion | Repaired | R:1154 “a characteristic-zero nonarchimedean local field” | L:914 states the native valuation-ring version; L:934 separately states the ℤ_p specialization. L:942 tests π²=2 and 3+2π=(1+π)². |
| a F13: names/docstrings | Partly repaired | L:175 “theorem RabinCertificate.exists_of_irreducible” | All 202 named declarations occur in README. The presentation-change docstring still promises specific data absent from its type: S08. |
| a F14: absent Check mirrors | Partly repaired | L:1324 “uniqueInteger ⟨((3 / 4 : ℚ), 5 / 4), by norm_num⟩ = some 1” | Interval, rounding, complex-box, integer-recovery and ellipsoid examples now exercise the definitions. Local-square, local-image, Hensel and special-function controls still lack counterparts: S09. |
| a F15: irrelevant/excess examples | Partly repaired | L:1611 “The actual five-coordinate lift for blocks two and three has quadratic value minus 34.” | The old class–unit scalar example is deleted and the two-block value is correct. The replacement still has no retained definition under test: S11. |
| a F16: lemma labels | Repaired | R:1735 “Theorem.” | Full README/Lean scan finds no target declared with `lemma` or a “Lemma” target label. Source theorem titles are not declarations. |
| a F17: root Hensel used for factors | Repaired in §1.26 | R:770 “Induct on k with degree-bounded Bézout corrections” | Correct finite-quotient proof, including constant factors and the noncoprime mod-four counterexample. New complete-DVR use in §2.19a remains unowned: S01. |
| a F18: missing φ-polygon theory | Partly repaired | R:1088 “Prove `phiPolygon_mul` and `phiResidual_mul`” | Four general contracts now match GMN lines 495,575,684, with −∞ factors and residual scalar ambiguity. Their complete-DVR Hensel prerequisite is still missing: S01. |
| a F19: Cremona/FPS misattribution | Repaired | R:1436 “as a concrete local-generator example” | Cremona line 1474 supports the real-component distinction; FPS line 662 is now an example, not a falsely attributed general density theorem. |
| a F20: BCG/CG13 locators | Repaired | R:1358 “N-marked entries and the companion-weight relation” | CG13 lines 536–564 and BCG line 457 support the lists; p=151 ordinary candidate correctly fails the gcd condition. |
| a F21: missing analytic remainders | Repaired | R:1782 “Prove `digamma_series_remainder` and `trigamma_series_remainder`” | Explicit positive denominators, weighted-tail threshold, uniform Euler–Maclaurin bound and two Mellin tails are supplied. S04 concerns the distinct zero-counting input. |
| a F22: vacuous cusp-enclosure Checks | Repaired | L:1416 “theorem delta_L_twelve_bounds” | Zero form, Δ and −Δ are bound to native L-values; `[1/2,3/2]` versus `[-3/2,-1/2]` tests sign. No generic rectangle fact substitutes for that comparison. |
| a F23: catalogue instead of signatures | Repaired | L:13 “it is not exhaustive” | Closing catalogue removed. Alternating tail, Ore and root-count headline signatures now exist. The additional CT enclosure omission is S07. |
| b F01: EffectiveDiophantine duplication | Not repaired; disposition accepted | R:2148 “EffectiveDiophantineMethods” | Same ownership/order witness as a F08. The earlier proposed upward supplier is invalid in this snapshot. |
| b F02: class–unit duplication | Repaired | R:248 “ClassicalArithmeticCompletion §§5.1–5.3, 5.10–5.11, 5.16 and 5.22” | Removed local duplicate targets; supplier matches checked as for a F04. |
| b F03: false CA supplier names | Repaired | R:245 “§3.25 `IntMatrix.IsHermiteDecomposition`” | Supplier:6065 has that declaration and its full reconstruction equation. |
| b F04: AN.4 | Repaired | R:253 “a separate input” | No nonexistent AN.4 citation or dependent hR-enclosure target remains. |
| b F05: options | Repaired | L:1 “import Mathlib” | No `set_option` in the whole file. |
| b F06: sorry examples | Repaired | L:1328 “norm_num [uniqueInteger]” | All example bodies inspected; no admitted example syntax. No build claim is made. |
| b F07: undocumented declarations | Repaired | R:432 “`FiniteFieldPresentation.minpoly_eq`” | Name reconciliation is complete for all 202 named declarations; mathematical overclaim at `translate_three` is S08. |
| b F08: unsupported downstream list | Repaired | R:2148 “EffectiveDiophantineMethods” | Only the later consumer remains; no reversed ClassicalArithmeticCompletion edge. Its future consumer roadmap is not treated as an existing supplier. |
| b F09: missing Ore/root headlines | Repaired | L:888 “theorem ore_residual_irreducible”; L:923 “theorem card_padicRoots_eq” | Native local fields, polynomial roots, generating root and unprimed ideal invariants inspected. The proof-plan global bridge needs S05. |
| b F10: pins/native interfaces | Repaired | R:208 “`WeierstrassCurve.pointCount`, `WeierstrassCurve.frobeniusTrace`” | Native point-count, descent and order modules present at the stated pins. |
| b F11: Mattuck and local quotient supplier | Repaired as a declared contract; settled | R:257 “What HeightsRationalPointsAndObstructions must provide (gap:local-two-quotient)” | Plan and README share the slug, supplier and §1.17. The exact dimension-g formulas are stated. Mattuck's uncertified status is settled; no request or re-raise. |
| b F12: ramified dyadic squares | Repaired | L:942 “theorem ramified_dyadic_unit_square” | Uniformizer π, not the base prime, appears in the ideal `(4π)`. The ramified example fixes the valuation normalization. |
| b F13: semantic/certificate mismatch | Repaired | R:385 “no choice of an executable verifier” | Rabin and factor structures carry mathematical conditions. The weakened generic `saturationSieve_sound` Lean statement is deleted; the full arithmetic statement remains R:1481. |
| b F14: algorithms | Repaired | R:24–25 “Computational algorithms, executable verifiers, implementation costs and termination specifications are outside this roadmap's scope.” | Same full-document check as a F01. |

## Statement-by-statement adversarial pass

Each row covers the numbered target, its supporting API bullets, and its Checks. “Pass” means no counterexample or additional defect was found in this review, not that an admitted theorem has been proved. Dimension-zero, zero-polynomial and zero-ring tests are applied only when those objects inhabit the stated carrier; a `Field` cannot be the zero ring. All 104 bold target statements occur in the 119 numbered sections below. The unnumbered dataset layer is recorded separately.

| Section / README line | Statement | Instances and boundaries tried | Result / change |
| --- | --- | --- | --- |
| 0.8 / 292 | AlgebraicRootCertificate | X; X² with repeated zero; X²−1 in a two-root box; excluded zero polynomial | Truth passes; S10 locator/separation input. |
| 0.9 / 313 | Rational root presentation | 0; 1/2+1/3=5/6; 1/2≠1/3 | Pass; S10 locator. |
| 0.10 / 329 | Algebraic addition | Zero; opposite roots; equal presentations with different polynomials | Pass; S10 input. |
| 0.11 / 335 | Algebraic multiplication | Zero factor; rational product; repeated-root input | Pass; S10 input. |
| 0.12 / 341 | Algebraic inverse | 1/2; −1; zero excluded | Pass; nonzero premise retained; S10 input. |
| 0.13 / 347 | Algebraic equality | Distinct rational points; differently presented same point; overlapping boxes | Truth passes; overlap alone is not equality; S10 locator. |
| 0.14 / 363 | Canonical p-adic ball | Zero mantissa; N=0,v=−1,p=3; p-divisible mantissa; p=2 | Pass; radius uses p^(−N), not p^N. |
| 0.15 / 380 | Rabin certificate | Degree one; X²+X+1/F₂; X²+1/F₅; degree zero | Pass; coprimality rejects reducible and inseparable factors. |
| 0.16 / 408 | Finite-field presentation | Base field F₅; quadratic F₂ extension; linear inverse | Pass; generator equality and cardinality are tied to the polynomial. |
| 0.17 / 434 | Change of presentation | Identity; translation over F₃; scaling over F₇ | Mathematics passes; S08 loses the specific translation pair. |
| 1.1 / 481 | Pratt syntax | Leaf two; malformed node; repeated children | Pass; syntax does not assert primality. |
| 1.2 / 497 | Pratt validity | Two; node three; wrong child product; bad witness base | Pass. |
| 1.3 / 518 | Pratt soundness | Leaf; 0/1 nodes; composite candidate | Pass by native Lucas criterion. |
| 1.4 / 524 | Pratt completeness | 2; 3; repeated prime factors of n−1 | Pass; finite tree retains multiplicity. |
| 1.5 / 530 | Pratt bit measure | Leaf size 1; three-node size 7; duplicated child | Pass; every occurrence charged. |
| 1.6 / 547 | Quadratic size bound | 2; long factor chains; repeated factors | Pass as existence bound; header and subtree logarithmic charges compatible. |
| 1.7 / 553 | Strong liar | n=3; n=9; base 2 at 2047; nonunit residue | Pass; strong pseudoprime is not prime. |
| 1.8 / 571 | Prime bases pass | p=3; every nonzero residue; p=2 excluded by oddness | Pass. |
| 1.9 / 577 | Strong-liar cardinality | 9; prime powers; Carmichael case; excluded primes | Pass; count is among n−1 nonzero residues, not just units. |
| 1.10 / 583 | Independent rounds | k=0; k=1; repeated coordinates allowed | Pass; Cartesian-product count yields 4^(−k). |
| 1.11 / 589 | AKS parameter | n=0,1,2,9; r=n fallback; least noncoprime divisor | Pass; existence follows from fallback. |
| 1.12 / 611 | AKS identities | Characteristic 5; empty range; n=9,r=2,ℓ=1 | Truth passes; missing rejecting Check S09. |
| 1.13 / 631 | AKS predicate | 0;1;2;9; a^b with a,b>1 | Pass; empty identities do not bypass non-power condition. |
| 1.14 / 652 | AKS correctness | Prime Frobenius branch; smallest composite prime factor; prime powers | Statement passes; omitted proof estimates S02. |
| 1.15 / 658 | Pocklington divisor bound | Repeated q-powers; F sharing factors with cofactor; different bases for different q | Pass; whole q-adic order forces F∣p−1. |
| 1.16 / 664 | Pocklington primality | Strict square threshold; n=2; composite with small prime factor | Pass; source's printed size error not copied. |
| 1.17 / 670 | Pocklington data | Empty factors; valid partial factorization; bad congruence | Pass; F>1 and size conditions remain explicit. |
| 1.18 / 686 | Pocklington soundness | Repeated prime children; product bound; wrong prime witness | Pass. |
| 1.19 / 692 | Integer factors | −1; 12; 0; repeated 2 | Pass; sign and empty product correct. |
| 1.20 / 710 | Integer factor soundness | ±1 empty list; negative integer; zero exclusion | Pass. |
| 1.21 / 716 | Integer factor existence | 1;−1;−12;0 excluded | Pass. |
| 1.22 / 722 | Finite-field factors | 1; X²+1/F₅; repeated linear factor; zero | Pass; distinct factors plus exponents preserve multiplicity. |
| 1.23 / 743 | Factor soundness | Nonmonic scalar; repeated factor; degree-zero product | Pass. |
| 1.24 / 749 | Factor existence | Nonzero constants; inseparable X^p; arbitrary finite field | Pass; zero excluded. |
| 1.25 / 757 | Transport of factors | Identity equivalence; scalar≠1; repeated factors | Pass; ring equivalence preserves leading scalar. |
| 1.26 / 763 | Hensel factors | k=1; p=7,k=2; constant factor 1; noncoprime mod-four pair | Finite statement passes; new general consumer needs S01; mirrors S09. |
| 1.27 / 783 | Rational factors | Nonmonic polynomial; 1; zero; repeated factors | Pass. |
| 1.28 / 799 | Rational factor existence | Rational denominator; repeated irreducible; constant | Pass; no irreducible-reduction restriction. |
| 2.1 / 846 | Order basis | K=ℚ,n=1; alleged basis 1/2; n=0 | Pass; multiplication and one coordinates force an order. |
| 2.2 / 868 | Multiplier ring | Zero module gives whole field; ℤ⊂ℚ; multiplier 1/2 | Pass; no finiteness assertion for zero module. |
| 2.3 / 888 | p-maximality | p=1; ℤ in ℚ; top algebra; K=ℚ(X) | Definition passes; monotonicity signature S06. |
| 2.4 / 906 | Nilpotent Frobenius kernel | Zero algebra; dimension one; F₂[ε]/ε²; exponent equal to dimension | Pass; ≥ rather than > suffices. |
| 2.5 / 912 | Radical lattice | p=0; p=1; ℤ,p=3; nonfinite R=⊤ | Definition passes; membership signature S06. |
| 2.6 / 932 | Multiplier maximality criterion | ℤ; maximal ramified order; proper index-p suborder | Pass under full finite-order assumptions. |
| 2.7 / 938 | Integral basis certificate | ℚ singleton; dimension zero impossible; 1/2 nonintegral | Pass. |
| 2.8 / 958 | Extending an order | Already maximal order; nonmonogenic order; bad-index prime | Pass; no good-prime restriction. |
| 2.9 / 975 | Prime ideal factors | ℚ,p=2; p=1 empty list; zero prime; zero exponent | Pass; prime assumptions imposed on arithmetic theorem. |
| 2.16 / 993 | φ-expansion | φ=X; shifted quadratic; f=0; arbitrary coefficient ring | Pass; monic positive degree required for reconstruction. |
| 2.17 / 1013 | Coefficient valuation | 0→∞; 3X+9→1; X²→0 | Pass; native v(0)=0 excluded from support minimum. |
| 2.18 / 1031 | Negative side | X²−3; wrong slope −1; zero polynomial; φ-divisible input | Pass; −∞ is separate and end heights nonnegative. |
| 2.19 / 1049 | Residual polynomial | X²−3→Y−1; zero; (X−3)²→(Y−1)² | Pass; p^(u−hj) divides coefficients on a certified side. |
| 2.19a / 1067 | Products and factorization | Nonmonic products; constant; two distinct slopes; π→−π; pure φ² | Stated GMN contracts pass; complete factor Hensel S01. |
| 2.20 / 1128 | Ore criterion | Eisenstein X²−3; repeated residual; e=1; deg φ>1 | Pass; finite whole side and exponent-one residual imply irreducibility. |
| 2.21 / 1134 | Local expansion | N=0; π⁻¹ with one digit; wrong zero centre; arbitrary normed field | Pass; certificate does not claim digit uniqueness without a residue section. |
| 2.22 / 1152 | Unit squares | Q₂:17,5; Q₅:6; ramified π²=2 | Statement passes; full ramified generality present; missing controls S09. |
| 2.23 / 1167 | Local root counts | Linear f; X²−2 at 7 and 2; nonmonogenic order | Statement passes; missing existing comparison supplier S05. |
| 3.1 / 1199 | Integral modular lattice | 0; E₄; E₄/2 | Pass; submodule span equals integral coefficient predicate. |
| 3.2 / 1219 | Integral cusp lattice | Δ; weight zero; Δ/2 | Pass. |
| 3.3 / 1239 | Miller basis | Weight 0,2,12; exceptional residue k≡2 mod12 | Pass; positive Fourier coefficients index the cusp basis. |
| 3.4 / 1256 | Congruence Sturm | k=0,2,12; constant term; reduction mod2 | Statement passes; full integral basis input S03. |
| 3.5 / 1262 | Modular data equality | Bound zero; equal arrays; Δ versus zero with matching constants | Pass; full coefficient binding, including zero, is required. |
| 3.6 / 1278 | Hecke recurrence | Weight2 zero space; T₂Δ=−24Δ; zero operator at12 | Pass; uniqueness follows from all coefficients, not a short prefix. |
| 3.7 / 1298 | Hecke matrix | Empty matrix determinant1; weight12 1×1; column convention | Pass; not identified with a dual-symbol matrix. |
| 3.8 / 1314 | Coefficient at107 | Independent exact convolution of ΔE₄²E₆ | Pass: 35830422465487817813321292. |
| 3.9 / 1320 | Ordinarity residue | Exact numeral reduced mod107 | Pass: 106=−1, nonzero. |
| 3.10 / 1326 | Weight38 determinant | Independent Miller computation modulo79 | Pass: matrix [[3,17],[25,10]], determinant0; gcd(37,80)=1. |
| 3.11 / 1332 | Nonordinary pair | (38,79); weight2 empty matrix; (26,107) | Definition passes; full simultaneous lift supplier not locally verifiable. |
| 3.12 / 1348 | First nonordinary primes | Small dimensions; 59 weights16,46;79 weights38,44 | Matches source table and p+3−k symmetry. |
| 3.13 / 1354 | Pairs below200 | All eight N-marked prime rows; both companion weights; gcd filter | Matches CG13 list; full enumeration not executed. |
| 3.14 / 1360 | Weight82 companion | ℓ=1 normalization; exponent81=−25 mod106; all ℓ≠107 | Source convention passes; full eigensystem not reconstructed. |
| 3.15 / 1366 | Ordinary companion pair | p=2 no eligible k; weight2 zero;107/26/82 | Definition passes; nonzero common eigenvectors required. |
| 3.16 / 1382 | Corrected companion list | Six C-marked pairs;151 weights52,100 | Pass; gcds at151 both3, other six gcds1. |
| 3.17 / 1388 | Character-sum count | Smooth F₅ cubic9 points; singular cusp6; F₂ failure | Pass; oddness essential, nonsingularity unnecessary for raw point count. |
| 3.18 / 1408 | Local image certificate | Real split cubic; real nonsplit cubic; dyadic one-generator span | Counts mathematically pass; missing actual-span Checks S09. |
| 3.19 / 1426 | Size completes image | Empty span; equal finite cardinality; dimension1 local index | Pass conditional on declared gap; inclusion premise retained. |
| 3.20 / 1432 | Complete local image exists | Real and dyadic places; avoid finite 2-torsion; rational abscissa approximation | Density/openness argument passes; not rational global-point density. |
| 3.21 / 1438 | Good odd local image | Splitting types3,1+2,1+1+1; p=2 excluded | Kernel counts1,2,4 agree with 1+r; general bad-prime work elsewhere retained. |
| 3.22 / 1444 | p-saturation | p=0,1; zero subgroup with p-torsion;6ℤ at2,3,5 | Pass; prime condition placed on index theorem. |
| 3.23 / 1463 | Finite divisibility test | Z with generator2 at2; Z/2 omitted torsion; Z/3 quotient-spanning empty list | Pass; torsion premise and quotient-generating variant both necessary. |
| 3.24 / 1473 | Point divisibility | Identity separate; p=2; nonzero affine target; rational root with no rational point | Pass; point and group-law check retained, not root-only converse. |
| 3.25 / 1479 | Reduction sieve | Empty prime family; p∤point count; nonzero intersection | Pass; only zero intersection certifies vanishing. |
| 3.26 / 1485 | Saturation criterion | Rank0 with torsion; dependent generators; prime-to-p torsion | Pass; independence in G/pG is part of iff. |
| 4.1 / 1539 | Interval product | Mixed signs; zero interval; [-1,1]² | Pass: [-12,15] and lower endpoint−1. |
| 4.2 / 1555 | Multiplication enclosure | Both signs; endpoint equality; zero | Pass. |
| 4.3 / 1561 | Partial reciprocal | Positive; negative; endpoint zero; interval crossing zero | Pass; none exactly when 0 lies inside. |
| 4.4 / 1577 | Reciprocal enclosure | Negative reciprocal reverses endpoints; x=0 excluded | Pass. |
| 4.5 / 1583 | Dyadic hull | 1/3 at2;−1/3 at0; exact dyadic input | Pass; floor lower and ceil upper. |
| 4.6 / 1599 | Width growth | P=0; zero-width input; exact dyadic endpoints | Pass; at most two rounding units. |
| 4.7 / 1605 | Complex rectangle | Origin; 1+i; point outside one coordinate | Pass; conjunction binds both axes. |
| 4.8 / 1621 | Unique integer | [3/4,5/4];[0,1];{1/2} | Pass: some1;none;none. |
| 4.9 / 1637 | Integer recovery | Boundary integer; no integer; two integers | Pass; needs known integral input and returned integer. |
| 4.10 / 1643 | Normalize p-adic ball | Zero; negative valuation; denominator prime to p | Arithmetic specification passes. |
| 4.11 / 1660 | p-adic addition | Cancellation; zero ball; unequal precisions | Pass; min absolute precision, renormalized valuation. |
| 4.12 / 1676 | p-adic product | Both zero balls; negative valuation; example3·1/3 at3 | Pass; precision min(v+N′,N+v′), value centre1. |
| 4.13 / 1693 | p-adic inverse | Zero-containing ball; v<0;3+O(3⁴) | Pass; inverse precision N−2v=2. |
| 4.14 / 1709 | Tail kernel | x=0;1;−1; denominator never zero | Pass: r(0)=2/π², positive and not even. |
| 4.15 / 1727 | Geometric tail | N=0;b=0;α→0 positive | Pass; denominator 1−exp(−α)>0. |
| 4.16 / 1733 | Alternating tail | N=0,1; b=0; weighted tail threshold | Pass; first omitted term and sign indexing agree. |
| 4.17 / 1739 | Eight CT scalars | ℓ=1,2; w=0; shared indices1,4; G-imaginary term | Formulas match CL/CT; missing light definition/headline S07. |
| 4.17a / 1777 | Special-function remainders | z=1,N=1,2; Re z→0 positive; excluded z=0 | Bounds pass; positive denominators; missing Checks S09. |
| 4.18 / 1805 | CT enclosures | Width1/50≤1/32; width1/25≤1/16; irrational singleton exclusion | Pass; shared family omitted from Lean, S07. |
| 4.19 / 1828 | Complete root rectangles | Nonzero constant; X²; two roots ±1; zero excluded | Pass; distinct roots, no multiplicity loss claim; earlier separation input S10. |
| 4.19a / 1845 | Uniform continued Dirichlet remainder | N=1; m≥1; principal pole; nonprincipal s=1; q=1 | Pass; cancellation at s=1 and σ₀+2m>1 retained. |
| 4.20 / 1874 | Dirichlet rectangles | ζ(2);ζ(0);principal pole at1; nonprincipal value at1 | Pass; pole condition explicit in Lean. |
| 4.20a / 1898 | Cusp Mellin tails | k=12; σ=k/2; zero form; N=1; compact complex set | Pass; both t^(s−1) and i^k t^(k−s−1) tails required. |
| 4.21 / 1929 | Cusp rectangles | Zero form; Δ at12; −Δ at12; nonpositive integers via continuation | Pass; native normalization and sign agree. |
| 4.22 / 1960 | Platt zero-line range | Modulus parity; ±heights; critical strip excludes trivial zeros; q=1 | Source statement passes; Turing proof inputs S04. |
| 4.23 / 1966 | Central nonvanishing | Both character parities; conductor1; upper conductor endpoint | Matches Platt7.2; finite dataset not replayed. |
| 4.24 / 1972 | No real zero | Real s∈(0,1); critical value1/2; height0 | Pass given4.22 and4.23. |
| 4.25 / 1978 | Entrywise Gram lower bound | n=0; zero vector; nonnegative coordinates; mixed-sign failure | Pass; nonnegative-coordinate premise retained. |
| 4.26 / 1984 | Ellipsoid set | I₂ radius1; binary Gram radius2; shifted half; n=0; zero form | Pass:5,7,2 points respectively; degenerate nonfinite control correct. |
| 4.27 / 2011 | Ellipsoid finite completeness | Negative R; n=0; semidefinite nondefinite matrix | Pass; symmetry/positive definiteness required. |
| 4.28 / 2020 | Loewner comparison | Mixed-sign x; PSD singular difference; n=0 | Pass; only difference must be symmetric PSD. |
| 4.29 / 2026 | Negative certificate | Negative1×1 interval; zero vector; positive upper endpoint | Pass; exact upper sum, nonnegative and nonzero vector. |
| 4.30 / 2043 | Certificate soundness | Boundary entries; asymmetric target; zero dimension impossible certificate | Pass; interval binding retained. |
| 4.31 / 2049 | Effective ellipsoid cover | Extra B-short vectors; zero; negative coordinate | Pass as cover, not exact A-sublevel enumeration. |
| 4.32 / 2065 | Gram validity | Negative interval; zero vector; interval straddling0 | Pass. |
| 4.33 / 2084 | Dataset validity | Empty list; one valid row; appended zero vector | Pass; no exhaustiveness inferred from validity. |
| 4.34 / 2104 | Multiplicity lift | n=0; blocks1; blocks2,3; omitted positive-size hypothesis | Identity passes and −34 independently recomputed; example policy S11. |
| CN.5 / 2124 | Dataset binding | Empty family; wrong zero-vector row; finite cover versus validity | No additional target; existing comparisons used without an exhaustiveness shortcut. |

## Complete Lean declaration and context register

All 247 declarations were read. The ambient contexts below are lexical contexts, not a claim that Lean retains an unused variable. Explicit declaration binders are recorded separately; a `sorry` theorem does not acquire unused standing hypotheses. The entire file is noncomputable, inside `TauCetiRoadmap.ComputationalNumberTheory`. Type universes are polymorphic (`Type*`); no universe restriction is silently assumed. No `include` occurs. This is static signature review, not an elaborated-type transcript.

| Context | Available section variables and instances |
| --- | --- |
| C0 | None |
| C1 | `{F : Type*} [Field F] [Fintype F]` |
| C2 | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` |
| C3 | `{K : Type*} [Field K] [NumberField K]` |
| C4 | `{K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic] [W.IsCharNeTwoNF]` |
| C5 | `{n : ℕ}` |

Locations below are lines of `packages/ComputationalNumberTheory/Suggested.lean`. “None” means no own parameters before the result type; any universal quantifier in that result remains part of the statement reviewed above. Sections resume their enclosing section after a nested `end`.

| Line | Declaration / kind | Section; context | Own parameters and instance binders |
| --- | --- | --- | --- |
| 32 | `AlgebraicRootCertificate` (structure) | Algebraic; C0 | None |
| 41 | `AlgebraicRootCertificate.value` (def) | Algebraic; C0 | `(c : AlgebraicRootCertificate)` |
| 45 | `AlgebraicRootCertificate.value_mem_algebraicClosure` (theorem) | Algebraic; C0 | `(c : AlgebraicRootCertificate)` |
| 50 | `AlgebraicRootCertificate.value_unique` (theorem) | Algebraic; C0 | `(c : AlgebraicRootCertificate) (z : ℂ) (hz : aeval z c.poly = 0) (hre : (c.re.fst : ℝ) ≤ z.re ∧ z.re ≤ c.re.snd) (him : (c.im.fst : ℝ) ≤ z.im ∧ z.im ≤ c.im.snd)` |
| 56 | `algebraic_add_certificate` (theorem) | Algebraic; C0 | `(a b : AlgebraicRootCertificate)` |
| 61 | `algebraic_mul_certificate` (theorem) | Algebraic; C0 | `(a b : AlgebraicRootCertificate)` |
| 66 | `algebraic_inv_certificate` (theorem) | Algebraic; C0 | `(a : AlgebraicRootCertificate) (ha : a.value ≠ 0)` |
| 71 | `AlgebraicRootCertificate.two_root_box_impossible` (theorem) | Algebraic; C0 | None |
| 76 | `rationalRootCertificate` (def) | Algebraic; C0 | `(r : ℚ)` |
| 91 | `rationalRootCertificate_value` (theorem) | Algebraic; C0 | `(r : ℚ)` |
| 96 | `algebraicEqual` (def) | Algebraic; C0 | `(a b : AlgebraicRootCertificate)` |
| 99 | `example@99` (example) | Algebraic; C0 | None |
| 105 | `example@105` (example) | Algebraic; C0 | None |
| 109 | `AlgebraicRootCertificate.repeated_zero` (theorem) | Algebraic; C0 | None |
| 119 | `PadicApproximation` (structure) | Padic; C0 | `(p : ℕ)` |
| 128 | `PadicApproximation.center` (def) | Padic; C0 | `{p : ℕ} (a : PadicApproximation p)` |
| 132 | `PadicApproximation.denotation` (def) | Padic; C0 | `{p : ℕ} [Fact p.Prime] (a : PadicApproximation p)` |
| 137 | `PadicApproximation.center_mem` (theorem) | Padic; C0 | `{p : ℕ} [Fact p.Prime] (a : PadicApproximation p)` |
| 142 | `example@142` (example) | Padic; C0 | None |
| 148 | `example@148` (example) | Padic; C0 | None |
| 163 | `RabinCertificate` (structure) | FiniteFields; C1 | `(f : F[X])` |
| 171 | `RabinCertificate.irreducible` (theorem) | FiniteFields; C1 | `{f : F[X]} (h : RabinCertificate f)` |
| 175 | `RabinCertificate.exists_of_irreducible` (theorem) | FiniteFields; C1 | `{f : F[X]} (hm : f.Monic) (hf : Irreducible f)` |
| 180 | `RabinCertificate.quadratic_two` (theorem) | FiniteFields; C1 | None |
| 184 | `RabinCertificate.quadratic_five_impossible` (theorem) | FiniteFields; C1 | `[Fact (Nat.Prime 5)]` |
| 188 | `RabinCertificate.linear` (theorem) | FiniteFields; C1 | `(a : F)` |
| 192 | `RabinCertificate.cyclotomic_eight_impossible` (theorem) | FiniteFields; C1 | `(p : ℕ) [Fact p.Prime]` |
| 197 | `FiniteFieldPresentation` (structure) | FiniteFields; C1 | `(F K : Type*) [Field F] [Fintype F] [Field K] [Algebra F K]` |
| 205 | `FiniteFieldPresentation.lift` (def) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` |
| 210 | `FiniteFieldPresentation.bijective` (theorem) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` |
| 215 | `FiniteFieldPresentation.equiv` (def) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` |
| 220 | `FiniteFieldPresentation.equiv_root` (theorem) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` |
| 226 | `FiniteFieldPresentation.exists` (theorem) | FiniteFields; C1 | `(K : Type*) [Field K] [Algebra F K] [FiniteDimensional F K]` |
| 231 | `FiniteFieldPresentation.prime_field_five` (theorem) | FiniteFields; C1 | `[Fact (Nat.Prime 5)]` |
| 236 | `FiniteFieldPresentation.minpoly_eq` (theorem) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` |
| 242 | `FiniteFieldPresentation.quadratic_two` (theorem) | FiniteFields; C1 | `{K : Type*} [Field K] [Algebra (ZMod 2) K] (P : FiniteFieldPresentation (ZMod 2) K) (hP : P.poly = X ^ 2 + X + 1)` |
| 248 | `FiniteFieldPresentation.linear_inverse` (theorem) | FiniteFields; C1 | `(P : FiniteFieldPresentation F F) (a : F) (hP : P.poly = X - C a) (x : F)` |
| 254 | `PresentationChange` (structure) | FiniteFields; C1 | `(f g : F[X])` |
| 262 | `exists_presentationChange` (theorem) | FiniteFields; C1 | `{f g : F[X]} (hfm : f.Monic) (hgm : g.Monic) (hf : Irreducible f) (hg : Irreducible g) (hdeg : f.natDegree = g.natDegree)` |
| 267 | `PresentationChange.translate_three` (theorem) | FiniteFields; C1 | None |
| 271 | `PresentationChange.identity` (theorem) | FiniteFields; C1 | `(f : F[X])` |
| 275 | `PresentationChange.scaling_seven_impossible` (theorem) | FiniteFields; C1 | None |
| 288 | `PrattCertificate` (inductive) | Primality; C0 | None |
| 293 | `PrattCertificate.value` (def) | Primality; C0 | None |
| 298 | `example@298` (example) | Primality; C0 | None |
| 302 | `PrattCertificate.nodeConditions` (def) | Primality; C0 | `(n a : ℕ) (cs : List PrattCertificate)` |
| 308 | `PrattCertificate.valid` (def) | Primality; C0 | None |
| 312 | `PrattCertificate.validList` (def) | Primality; C0 | None |
| 318 | `example@318` (example) | Primality; C0 | None |
| 324 | `PrattCertificate.sound` (theorem) | Primality; C0 | `(c : PrattCertificate) (h : c.valid)` |
| 328 | `PrattCertificate.complete` (theorem) | Primality; C0 | `(n : ℕ) (hn : n.Prime)` |
| 335 | `prattBitSize` (def) | Primality; C0 | None |
| 340 | `prattBitSizeList` (def) | Primality; C0 | None |
| 346 | `example@346` (example) | Primality; C0 | None |
| 350 | `pratt_small_certificate` (theorem) | Primality; C0 | None |
| 357 | `StrongLiar` (def) | Primality; C0 | `(n a : ℕ)` |
| 364 | `example@364` (example) | Primality; C0 | None |
| 367 | `strongLiar_2047_composite` (theorem) | Primality; C0 | None |
| 371 | `strongLiar_of_prime` (theorem) | Primality; C0 | `(n a : ℕ) (hn : n.Prime) (hodd : Odd n) (ha : 0 < a) (han : a < n)` |
| 377 | `strongLiar_card_le` (theorem) | Primality; C0 | `(n : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime)` |
| 382 | `millerRabin_rounds_bound` (theorem) | Primality; C0 | `(n k : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime)` |
| 387 | `aksOrder` (def) | Primality; C0 | `(n r : ℕ)` |
| 390 | `aksLen` (def) | Primality; C0 | `(n : ℕ)` |
| 393 | `aksParameter` (def) | Primality; C0 | `(n : ℕ)` |
| 400 | `aksParameter_two_nine_one` (theorem) | Primality; C0 | None |
| 406 | `AKSIdentities` (def) | Primality; C0 | `(n r ℓ : ℕ)` |
| 411 | `AKSIdentities.five_and_empty_nine` (theorem) | Primality; C0 | None |
| 415 | `AKSIdentities.five_all` (theorem) | Primality; C0 | `(r ℓ : ℕ)` |
| 419 | `example@419` (example) | Primality; C0 | `(n r : ℕ)` |
| 425 | `AKSAccepts` (def) | Primality; C0 | `(n : ℕ)` |
| 431 | `AKSAccepts.two_and_not_nine` (theorem) | Primality; C0 | None |
| 435 | `example@435` (example) | Primality; C0 | None |
| 438 | `aks_correct` (theorem) | Primality; C0 | `(n : ℕ)` |
| 443 | `pocklington_prime_divisor` (theorem) | Primality; C0 | `(n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (h : ∀ q, q.Prime → q ∣ F → ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n) (p : ℕ) (hp : p.Prime) (hpn : p ∣ n)` |
| 453 | `pocklington_prime` (theorem) | Primality; C0 | `(n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (hF2 : n < F ^ 2) (h : ∀ q, q.Prime → q ∣ F → ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n)` |
| 461 | `PocklingtonCertificate` (structure) | Primality; C0 | None |
| 465 | `PocklingtonCertificate.factor` (def) | Primality; C0 | `(c : PocklingtonCertificate)` |
| 470 | `PocklingtonCertificate.valid` (def) | Primality; C0 | `(c : PocklingtonCertificate) (n : ℕ)` |
| 476 | `example@476` (example) | Primality; C0 | None |
| 483 | `PocklingtonCertificate.sound` (theorem) | Primality; C0 | `(c : PocklingtonCertificate) (n : ℕ) (h : c.valid n)` |
| 488 | `IntegerFactorCertificate` (structure) | Primality; C0 | None |
| 493 | `IntegerFactorCertificate.value` (def) | Primality; C0 | `(c : IntegerFactorCertificate)` |
| 497 | `IntegerFactorCertificate.valid` (def) | Primality; C0 | `(c : IntegerFactorCertificate) (z : ℤ)` |
| 501 | `example@501` (example) | Primality; C0 | None |
| 508 | `IntegerFactorCertificate.sound` (theorem) | Primality; C0 | `(c : IntegerFactorCertificate) (z : ℤ) (h : c.valid z)` |
| 513 | `IntegerFactorCertificate.complete` (theorem) | Primality; C0 | `(z : ℤ) (hz : z ≠ 0)` |
| 518 | `IntegerFactorCertificate.zero_invalid` (theorem) | Primality; C0 | `(c : IntegerFactorCertificate)` |
| 529 | `FiniteFieldFactorCertificate` (structure) | Factorization; C2 | `(f : F[X])` |
| 539 | `FiniteFieldFactorCertificate.square_linear_three` (theorem) | Factorization; C2 | `[Fact (Nat.Prime 3)]` |
| 545 | `example@545` (example) | Factorization; C2 | None |
| 549 | `FiniteFieldFactorCertificate.five_split` (theorem) | Factorization; C2 | None |
| 555 | `FiniteFieldFactorCertificate.zero_impossible` (theorem) | Factorization; C2 | None |
| 560 | `FiniteFieldFactorCertificate.sound` (theorem) | Factorization; C2 | `{f : F[X]} (c : FiniteFieldFactorCertificate f)` |
| 567 | `FiniteFieldFactorCertificate.complete` (theorem) | Factorization; C2 | `{f : F[X]} (hf : f ≠ 0)` |
| 572 | `transport_finite_factorization` (theorem) | Factorization; C2 | `{K : Type*} [Field K] [Fintype K] [DecidableEq K] (e : F ≃+* K) {f : F[X]} (c : FiniteFieldFactorCertificate f)` |
| 582 | `henselLift` (theorem) | namespace; C0 | `(p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 1 ≤ k) (f : ℤ[X]) (hf : f.Monic) (g₀ h₀ : (ZMod p)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic) (hcop : IsCoprime g₀ h₀) (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀)` |
| 594 | `RationalFactorCertificate` (structure) | namespace; C0 | `(f : ℚ[X])` |
| 603 | `example@603` (example) | namespace; C0 | `(c : RationalFactorCertificate 0)` |
| 609 | `example@609` (example) | namespace; C0 | None |
| 627 | `exists_rationalFactorCertificate` (theorem) | namespace; C0 | `(f : ℚ[X]) (hf : f ≠ 0)` |
| 642 | `OrderBasisCertificate` (structure) | NumberFields; C3 | `(K : Type*) [Field K] [NumberField K] (n : ℕ)` |
| 652 | `OrderBasisCertificate.lattice` (def) | NumberFields; C3 | `{n : ℕ} (b : OrderBasisCertificate K n)` |
| 656 | `OrderBasisCertificate.mul_mem` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n) {x y : K} (hx : x ∈ b.lattice) (hy : y ∈ b.lattice)` |
| 661 | `example@661` (example) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K]` |
| 667 | `OrderBasisCertificate.half_basis_impossible` (theorem) | NumberFields; C3 | None |
| 673 | `multiplierRing` (def) | NumberFields; C3 | `{L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L)` |
| 682 | `mem_multiplierRing` (theorem) | NumberFields; C3 | `{L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) (x : L)` |
| 686 | `example@686` (example) | NumberFields; C3 | None |
| 690 | `multiplierRing_half_impossible` (theorem) | NumberFields; C3 | None |
| 694 | `OrderBasisCertificate.rational_singleton` (theorem) | NumberFields; C3 | None |
| 699 | `multiplierRing_integer_lattice` (theorem) | NumberFields; C3 | None |
| 705 | `IsPMaximal` (def) | NumberFields; C3 | `(R : Subalgebra ℤ K) (p : ℕ)` |
| 709 | `example@709` (example) | NumberFields; C3 | None |
| 715 | `isPMaximal_integer_order` (theorem) | NumberFields; C3 | `(p : ℕ) [Fact p.Prime]` |
| 720 | `isPMaximal_mono` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] (R S : Subalgebra ℤ K) (p : ℕ) (hRS : R ≤ S) (hR : IsPMaximal R p)` |
| 727 | `nilpotent_iff_frobenius_zero` (theorem) | NumberFields; C3 | `(p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A] [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A] (k : ℕ) (hk : Module.finrank (ZMod p) A ≤ p ^ k) (x : A)` |
| 735 | `pRadicalLattice` (def) | NumberFields; C3 | `(R : Subalgebra ℤ K) (p : ℕ)` |
| 739 | `mem_pRadicalLattice` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (p : ℕ) (hp : p.Prime) (hR : (Subalgebra.toSubmodule R).FG) (x : K)` |
| 745 | `pRadicalLattice_integer_three` (theorem) | NumberFields; C3 | None |
| 750 | `pRadicalLattice_zero` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K)` |
| 756 | `pRadical_multiplier_eq_iff` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] (R : Subalgebra ℤ K) (hfg : (Subalgebra.toSubmodule R).FG) (hspan : Submodule.span ℚ (R : Set K) = ⊤) (p : ℕ) [Fact p.Prime]` |
| 764 | `IntegralBasisCertificate` (structure) | NumberFields; C3 | `(K : Type*) [Field K] [NumberField K] (n : ℕ) extends OrderBasisCertificate K n` |
| 769 | `IntegralBasisCertificate.rational_singleton` (theorem) | NumberFields; C3 | None |
| 773 | `IntegralBasisCertificate.rank_pos` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] {n : ℕ} (c : IntegralBasisCertificate K n)` |
| 780 | `IntegralBasisCertificate.half_not_mem` (theorem) | NumberFields; C3 | `(c : IntegralBasisCertificate ℚ 1)` |
| 785 | `exists_integralBasisCertificate_extending` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] {n : ℕ} (b : OrderBasisCertificate K n)` |
| 790 | `PrimeIdealFactorCertificate` (structure) | NumberFields; C3 | `(K : Type*) [Field K] [NumberField K] (p : ℕ)` |
| 797 | `PrimeIdealFactorCertificate.nonempty` (theorem) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] {p : ℕ} (hp : p.Prime) (c : PrimeIdealFactorCertificate K p)` |
| 802 | `PrimeIdealFactorCertificate.rational_two` (theorem) | NumberFields; C3 | None |
| 807 | `example@807` (example) | NumberFields; C3 | `{K : Type*} [Field K] [NumberField K] {p : ℕ} (c : PrimeIdealFactorCertificate K p)` |
| 822 | `phiExpansion` (def) | Newton; C0 | `{R : Type*} [CommRing R] (φ f : R[X]) (i : ℕ)` |
| 826 | `phiExpansion_reconstruct` (theorem) | Newton; C0 | `{R : Type*} [CommRing R] (φ f : R[X]) (hφ : φ.Monic) (hm : 0 < φ.natDegree)` |
| 832 | `phiExpansion_X` (theorem) | Newton; C0 | `(f : ℤ[X]) (i : ℕ)` |
| 836 | `example@836` (example) | Newton; C0 | `(φ : ℤ[X]) (i : ℕ)` |
| 839 | `phiExpansion_shifted_square` (theorem) | Newton; C0 | None |
| 846 | `coefficientValuation` (def) | Newton; C0 | `(p : ℕ) (a : ℤ[X])` |
| 850 | `example@850` (example) | Newton; C0 | `(p : ℕ)` |
| 853 | `coefficientValuation_three_controls` (theorem) | Newton; C0 | None |
| 860 | `IsPhiNewtonSide` (def) | Newton; C0 | `(p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ)` |
| 868 | `phiSide_X_sq_sub_three` (theorem) | Newton; C0 | None |
| 873 | `example@873` (example) | Newton; C0 | `(p s u e h d : ℕ) (φ : ℤ[X])` |
| 878 | `phiResidualPolynomial` (def) | Newton; C0 | `(p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ)` |
| 888 | `ore_residual_irreducible` (theorem) | Newton; C0 | `(p : ℕ) [Fact p.Prime] (φ f : ℤ[X]) (hφ : φ.Monic) (hm : 0 < φ.natDegree) (hirr : Irreducible (φ.map (Int.castRingHom (ZMod p)))) (hf : f.Monic) (e h d : ℕ) (hside : IsPhiNewtonSide p φ f 0 (h * d) e h d) (hred : f.map (Int.castRingHom (ZMod p)) = (φ.map (Int.castRingHom (ZMod p))) ^ (e * d)) (hres : Irreducible (phiResidualPolynomial p φ f 0 (h * d) e h d))` |
| 899 | `example@899` (example) | Newton; C0 | `(p s u e h d : ℕ) (φ : ℤ[X])` |
| 903 | `phiResidual_X_sq_sub_three` (theorem) | Newton; C0 | None |
| 907 | `phiResidual_repeated_linear` (theorem) | Newton; C0 | None |
| 914 | `isSquare_iff_isSquare_mod` (theorem) | Newton; C0 | `(L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L] (π : 𝒪[L]) (hπ : Irreducible π) (u : (𝒪[L])ˣ)` |
| 923 | `card_padicRoots_eq` (theorem) | Newton; C0 | `(K : Type*) [Field K] [NumberField K] (f : ℚ[X]) (hf : f.Monic) (hirr : Irreducible f) (θ : K) (hθ : aeval θ f = 0) (hgen : Algebra.adjoin ℚ {θ} = ⊤) (p : ℕ) [Fact p.Prime]` |
| 934 | `isSquare_iff_isSquare_mod_padic` (theorem) | Newton; C0 | `(p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ)` |
| 942 | `ramified_dyadic_unit_square` (theorem) | Newton; C0 | `(L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L] (π : 𝒪[L]) (hπ : Irreducible π) (hπsq : (π : L) ^ 2 = 2) (u : (𝒪[L])ˣ) (hu : ((u : 𝒪[L]) : L) = 3 + 2 * (π : L))` |
| 957 | `LocalExpansionCertificate` (structure) | namespace; C0 | `(L : Type*) [NormedField L] (π x : L) (N : ℕ)` |
| 966 | `example@966` (example) | namespace; C0 | `{L : Type*} [NormedField L] (π : L) (hπ : π ≠ 0) (hπnorm : ‖π‖ < 1) (N : ℕ)` |
| 974 | `LocalExpansionCertificate.uniformizer_inverse` (theorem) | namespace; C0 | `{L : Type*} [NormedField L] (π : L) (hπ : π ≠ 0) (hnorm : ‖π‖ < 1)` |
| 980 | `LocalExpansionCertificate.one_not_zero_centre` (theorem) | namespace; C0 | `{L : Type*} [NormedField L] (π : L) (hπ : π ≠ 0) (hnorm : ‖π‖ < 1)` |
| 995 | `integralModularLattice` (def) | Modular; C0 | `(k : ℤ)` |
| 999 | `mem_integralModularLattice` (theorem) | Modular; C0 | `(k : ℤ) (f : ModularForm 𝒮ℒ k)` |
| 1004 | `example@1004` (example) | Modular; C0 | None |
| 1007 | `half_eisenstein_four_not_integral` (theorem) | Modular; C0 | None |
| 1012 | `integralCuspLattice` (def) | Modular; C0 | `(k : ℤ)` |
| 1016 | `mem_integralCuspLattice` (theorem) | Modular; C0 | `(k : ℤ) (f : CuspForm 𝒮ℒ k)` |
| 1021 | `eisenstein_four_integral` (theorem) | Modular; C0 | None |
| 1025 | `half_discriminant_not_integral` (theorem) | Modular; C0 | None |
| 1029 | `discriminant_integral` (theorem) | Modular; C0 | None |
| 1033 | `integralCuspLattice_weight_zero` (theorem) | Modular; C0 | None |
| 1038 | `exists_millerBasis` (theorem) | Modular; C0 | `(k : ℕ) (hk : Even k)` |
| 1045 | `levelOne_congruence_sturm` (theorem) | Modular; C0 | `(k : ℕ) (p : ℕ) (hp : p.Prime) (f : integralModularLattice (k : ℤ)) (h : ∀ n ≤ k / 12, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a)` |
| 1053 | `HasLevelOnePrimeRecurrence` (def) | Modular; C0 | `(k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ)))` |
| 1058 | `heckeRecurrence_unique` (theorem) | Modular; C0 | `(k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U)` |
| 1063 | `heckeRecurrence_discriminant_two` (theorem) | Modular; C0 | None |
| 1067 | `heckeRecurrence_zero_controls` (theorem) | Modular; C0 | None |
| 1072 | `weight26_coeff_107` (theorem) | Modular; C0 | None |
| 1078 | `weight26_ordinary_107` (theorem) | Modular; C0 | None |
| 1086 | `pointCount_eq_charSum` (theorem) | EllipticCurves; C0 | `{F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0)` |
| 1093 | `frobeniusTrace_eq_neg_charSum` (theorem) | EllipticCurves; C0 | `{F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0)` |
| 1099 | `pointCount_five_cubic` (theorem) | EllipticCurves; C0 | `[Fact (Nat.Prime 5)]` |
| 1103 | `pointCount_small_character_controls` (theorem) | EllipticCurves; C0 | None |
| 1117 | `localImageSpan` (def) | LocalImage; C4 | `(xs : List K)` |
| 1121 | `example@1121` (example) | LocalImage; C4 | None |
| 1125 | `localImageSpan_le_range` (theorem) | LocalImage; C4 | `(xs : List K) (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x))` |
| 1133 | `localImageSpan_eq_range_of_card_padic` (theorem) | EllipticCurves; C0 | `(p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]] (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℚ_[p]) (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x)) (hcard : Nat.card (localImageSpan W xs) = (1 + Nat.card {x : ℚ_[p] // W.f.eval x = 0}) * (if p = 2 then 2 else 1))` |
| 1142 | `localImageSpan_eq_range_of_card_real` (theorem) | EllipticCurves; C0 | `[DecidableEq ℝ] (W : WeierstrassCurve.Affine ℝ) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℝ) (hxs : ∀ x ∈ xs, 0 < W.f.eval x) (hcard : 2 * Nat.card (localImageSpan W xs) = 1 + Nat.card {x : ℝ // W.f.eval x = 0})` |
| 1150 | `IsPSaturated` (def) | EllipticCurves; C0 | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ)` |
| 1154 | `example@1154` (example) | EllipticCurves; C0 | `{A : Type*} [AddCommGroup A] (p : ℕ)` |
| 1158 | `isPSaturated_six_integers` (theorem) | EllipticCurves; C0 | None |
| 1164 | `isPSaturated_iff_not_dvd_index` (theorem) | EllipticCurves; C0 | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) (hG : G.FiniteIndex)` |
| 1171 | `isPSaturated_iff_forall_not_dvd` (theorem) | EllipticCurves; C0 | `{A : Type*} [AddCommGroup A] (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A)` |
| 1182 | `isPSaturated_iff_forall_not_dvd_of_span_quotient` (theorem) | EllipticCurves; C0 | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A) (hg : ∀ i, g i ∈ G) (hgen : ∀ x ∈ G, ∃ b : Fin m → ℤ, ∃ y ∈ G, x = ∑ i, b i • g i + p • y)` |
| 1193 | `example@1193` (example) | EllipticCurves; C0 | None |
| 1211 | `mem_nsmul_iff_exists_root` (theorem) | EllipticCurves; C0 | `(W : WeierstrassCurve ℚ) [W.IsElliptic] (p : ℕ) (hp : p.Prime) (x y : ℚ) (h : W.toAffine.Nonsingular x y)` |
| 1226 | `intervalMul` (def) | Intervals; C0 | `(I J : NonemptyInterval ℚ)` |
| 1232 | `intervalMul_sound` (theorem) | Intervals; C0 | `(I J : NonemptyInterval ℚ) (x y : ℝ) (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) (hy : (J.fst : ℝ) ≤ y ∧ y ≤ J.snd)` |
| 1238 | `example@1238` (example) | Intervals; C0 | None |
| 1245 | `example@1245` (example) | Intervals; C0 | `(I : NonemptyInterval ℚ)` |
| 1250 | `intervalInv` (def) | Intervals; C0 | `(I : NonemptyInterval ℚ)` |
| 1261 | `intervalInv_sound` (theorem) | Intervals; C0 | `(I J : NonemptyInterval ℚ) (h : intervalInv I = some J) (x : ℝ) (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd)` |
| 1266 | `example@1266` (example) | Intervals; C0 | None |
| 1273 | `dyadicHull` (def) | Intervals; C0 | `(p : ℕ) (I : NonemptyInterval ℚ)` |
| 1280 | `example@1280` (example) | Intervals; C0 | None |
| 1288 | `example@1288` (example) | Intervals; C0 | `(p : ℕ)` |
| 1292 | `dyadicHull_width` (theorem) | Intervals; C0 | `(p : ℕ) (I : NonemptyInterval ℚ)` |
| 1297 | `complexBoxSet` (def) | Intervals; C0 | `(R I : NonemptyInterval ℚ)` |
| 1301 | `example@1301` (example) | Intervals; C0 | None |
| 1306 | `example@1306` (example) | Intervals; C0 | None |
| 1315 | `uniqueInteger` (def) | Intervals; C0 | `(I : NonemptyInterval ℚ)` |
| 1319 | `uniqueInteger_sound` (theorem) | Intervals; C0 | `(I : NonemptyInterval ℚ) (z w : ℤ) (hz : (I.fst : ℝ) ≤ z ∧ (z : ℝ) ≤ I.snd) (h : uniqueInteger I = some w)` |
| 1324 | `example@1324` (example) | Intervals; C0 | None |
| 1337 | `ctTailKernel` (def) | ExplicitFormula; C0 | `(x : ℝ)` |
| 1341 | `example@1341` (example) | ExplicitFormula; C0 | None |
| 1347 | `ctTailKernel_pos` (theorem) | ExplicitFormula; C0 | `(x : ℝ)` |
| 1351 | `ctTailKernel_strict_controls` (theorem) | ExplicitFormula; C0 | None |
| 1356 | `ctTailKernel_tail` (theorem) | ExplicitFormula; C0 | `(α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ)` |
| 1363 | `ctTailKernel_alternating_tail` (theorem) | ExplicitFormula; C0 | `(α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ)` |
| 1371 | `digamma_series_remainder` (theorem) | ExplicitFormula; C0 | `(z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N)` |
| 1378 | `trigamma_series_remainder` (theorem) | ExplicitFormula; C0 | `(z : ℂ) (hz : 0 < z.re) (N : ℕ) (hN : 1 ≤ N)` |
| 1384 | `ctTailKernel_weighted_alternating_tail` (theorem) | ExplicitFormula; C0 | `(α : ℝ) (hα : 0 < α) (N : ℕ) (hN : 1 ≤ α * (N + 1))` |
| 1394 | `exists_disjoint_root_certificates` (theorem) | namespace; C0 | `(f : ℚ[X]) (hf : f ≠ 0)` |
| 1402 | `exists_dirichletLBox` (theorem) | namespace; C0 | `{q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (z : ℂ) (hz : χ = 1 → z ≠ 1) (P : ℕ)` |
| 1409 | `exists_cuspLBox` (theorem) | namespace; C0 | `(k : ℤ) (hk : 0 < k) (f : CuspForm 𝒮ℒ k) (hf : f ∈ integralCuspLattice k) (z : ℂ) (P : ℕ)` |
| 1416 | `delta_L_twelve_bounds` (theorem) | namespace; C0 | None |
| 1423 | `dirichlet_conductor_one_controls` (theorem) | namespace; C0 | None |
| 1430 | `cuspLBox_zero` (theorem) | namespace; C0 | `(k : ℤ) (hk : 0 < k) (z : ℂ)` |
| 1435 | `delta_neg_L_twelve_bounds` (theorem) | namespace; C0 | None |
| 1443 | `platt_bounded_height` (theorem) | namespace; C0 | `{q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1) (ht : &#124;s.im&#124; ≤ if Even q then max (10 ^ 8 / (q : ℝ)) (7.5 * 10 ^ 7 / (q : ℝ) + 200) else max (10 ^ 8 / (q : ℝ)) (3.75 * 10 ^ 7 / (q : ℝ) + 200)) (h0 : χ.LFunction s = 0)` |
| 1451 | `platt_central_nonvanishing` (theorem) | namespace; C0 | `{q : ℕ} [NeZero q] (hq : q ≤ 2000000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)` |
| 1456 | `small_conductor_no_real_zero` (theorem) | namespace; C0 | `{q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℝ) (hs : 0 < s ∧ s < 1)` |
| 1466 | `effectiveGram_lower` (theorem) | Gram; C5 | `(A B : Matrix (Fin n) (Fin n) ℝ) (hAB : ∀ i j, B i j ≤ A i j) (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i)` |
| 1473 | `ellipsoidPoints` (def) | Gram; C5 | `(G : Matrix (Fin n) (Fin n) ℚ) (t : Fin n → ℚ) (R : ℚ)` |
| 1478 | `example@1478` (example) | Gram; C5 | None |
| 1484 | `example@1484` (example) | Gram; C5 | None |
| 1494 | `ellipsoidPoints_complete` (theorem) | Gram; C5 | `(G : Matrix (Fin n) (Fin n) ℚ) (hG : G.PosDef) (t : Fin n → ℚ) (R : ℚ)` |
| 1502 | `ellipsoidPoints_binary_counts` (theorem) | Gram; C5 | None |
| 1508 | `ellipsoidPoints_zero_form_infinite` (theorem) | Gram; C5 | None |
| 1513 | `ellipsoidPoints_zero_dim` (theorem) | Gram; C5 | `(G : Matrix (Fin 0) (Fin 0) ℚ) (t : Fin 0 → ℚ) (R : ℚ) (x : Fin 0 → ℤ)` |
| 1518 | `ellipsoidPoints_shifted_one` (theorem) | Gram; C5 | None |
| 1525 | `loewnerGram_lower` (theorem) | Gram; C5 | `(A B : Matrix (Fin n) (Fin n) ℝ) (h : (A - B).PosSemidef) (x : Fin n → ℝ)` |
| 1531 | `NegativeGramCertificate` (structure) | Gram; C5 | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))` |
| 1538 | `example@1538` (example) | Gram; C5 | `(I : Matrix (Fin 0) (Fin 0) (NonemptyInterval ℚ))` |
| 1546 | `example@1546` (example) | Gram; C5 | None |
| 1562 | `NegativeGramCertificate.sound` (theorem) | Gram; C5 | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (c : NegativeGramCertificate I) (A : Matrix (Fin n) (Fin n) ℝ) (hA : ∀ i j, ((I i j).fst : ℝ) ≤ A i j ∧ A i j ≤ (I i j).snd)` |
| 1569 | `GramWitnessValid` (def) | Gram; C5 | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ)` |
| 1574 | `example@1574` (example) | Gram; C5 | None |
| 1580 | `GramWitnessValid_certificate` (theorem) | Gram; C5 | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (h : GramWitnessValid I t)` |
| 1588 | `GramDatasetValid` (def) | namespace; C0 | `(rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ)))` |
| 1593 | `example@1593` (example) | namespace; C0 | None |
| 1596 | `example@1596` (example) | namespace; C0 | None |
| 1604 | `multiplicityGram_lift` (theorem) | namespace; C0 | `{n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0 < m i) (A : ℝ) (Kmat : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ)` |
| 1612 | `example@1612` (example) | namespace; C0 | None |

## Source-locator verification register

These are 25 checked locator groups, one per legally readable manifest work; repeated citations are not counted again. Mathematical statements were compared with the text, not inferred from a manifest's `certified` flag. No source passage is reproduced here. Mattuck is the separately settled twenty-sixth work.

| Source | Locator group checked | Text witness and result |
| --- | --- | --- |
| Shoup | Theorem10.3;19.10;19.14;Exercise20.2(a);§§20.3–20.5;§21.2 | Shoup lines12442,20086,20193,20535,21611,21783,21819,21864. Odd strong-liar count, finite-field tests and AKS bounds agree; missing AKS contracts are S02. |
| Stein | Algorithm2.18;Lemma2.20;Remark2.21;Proposition2.31;Theorem9.18 | Stein lines1096,1134,1162,1324,7638. Constant-one E₄,E₆ normalization and cusp/M modular distinction checked. Source's sign typo in Δ near line7647 is not copied. |
| Arb | §2.3;§3.1;§§5–6 | Arb lines306,779,800,933,997. Supports enclosure semantics, rounding and discrete recovery; does not locate algebraic-root arithmetic: S10. |
| CT | Equation2.4.4;Remark2.11;§§2.4.3–2.4.6;Proposition4.4 | CT lines755,870,880,896,912,965,1543. Effective-vector restriction, multiplicity normalization and four G-scalars checked. No unit-sphere minimum equality asserted by the package. |
| BCG | Theorem2.4 proof;Corollary3.2;Remark3.3 | BCG lines326,331,335,453,457. Exact coefficient and companion weight agree. Erroneous ordinary inclusion of151 in the source is corrected in the package. |
| NumberRings | §9, equation9-2, Proposition9.3;§12 p.248 | NumberRings lines1042,1104,1111,1125,1660. Radical, multiplier and full-order hypotheses checked; removed class–unit theory remains supplied externally. |
| GMN | Definitions1.6,1.8–1.10;Theorems1.13,1.15,1.19;Corollary1.20 | GMN lines395,495,575,684. Nonzero products, monic factorizations, −∞ factor and residual exponent-one condition agree. |
| CarusoPublished | §2.1.1 Proposition2.1.1/Definition2.1.2;§2.1.2 equations2.1,2.3,2.5 | CarusoPublished lines922,941,955,987. Canonical zero ball and negative valuation cases checked; multiplication/inversion precision formulas agree. |
| BennettSiksek | §7 Proposition7.2 and proof | BennettSiksek lines851,869,913. The application needs the small-conductor zero exclusion; source uses conductor below400000. Package's stronger closed bound is supported by Platt. |
| Thery | Theorems6.1–6.2 | Thery lines248,265,269. Per-prime bases allowed; repeated factors handled. Package uses the corrected square-size inequality rather than the impossible printed F>N version. |
| Platt | Theorems7.1–7.2;continued-value context | Platt lines271,321,951,955,976. Modulus parity and both finite conductor ranges checked. Turing requirements exposed in S04. |
| PrattNotes | pp.1–4 Lucas criterion and proof-length bound | PrattNotes lines7,34,76,89. Repeated-child proof-tree bound is mathematically compatible with the logarithmic proof-line estimate. |
| CL | French preprint §3.16, Proposition3.17 and numerical comments3, pp.304–307 | CL lines11644–11832. Four F-scalars, φ as half the digamma difference, kernel scale, alternating/weighted tails checked against this version. |
| CG13 | §§6–7;Appendix table p.14 | CG13 lines536–564. Eight N-marked rows and six accepted C-marked rows agree after companion-weight symmetry and gcd filtering. |
| MilneANT | Theorems7.32–7.33, Lemmas7.34–7.35;Proposition8.2 | MilneANT lines5320,5346,5353,5365,5929. Newton inequality, coprime factors and finite separable completion decomposition agree; S01/S05 concern ownership, not falsity. |
| Sutherland | Lecture7 §7.2 equation1 | Sutherland lines56,74,84. Odd finite-field square-fibre count gives the stated sign; the counting argument extends to the singular cubic Check. |
| Cremona | §3.6 local solubility p.80 and real components p.93 | Cremona line1474 distinguishes discriminant signs and real quotients. It is now cited as context, not as the unramified norm-kernel equality. |
| FPS | §7 Lemmas3–4, pp.16–17 | FPS lines631,642,662,669. Dimension-two local quotient argument and concrete rational-abscissa generators checked; neither is treated as an elliptic theorem without the package's argument. |
| Siksek | §4 equations39–41, pp.17–19 | Siksek lines811,820,832,843,863,868. Torsion representatives, good-reduction conditions and the exceptional binary representatives agree. No unsupported numerical root-recognition criterion is copied. |
| deWeger | §3.6, Figure2 and translated-centre discussion, pp.51–53 | deWeger lines2357,2366,2376,2471. Positive-definite lattice bounds and translation are supported. The package explicitly restores zero and dimension-zero cases omitted by the enumeration description. |
| LLL82 | CWI report Theorem3.6, p.26 | LLL82 lines812,820. Primitive positive-degree factorization and repeated factors checked; rational scaling, constants and mathematical existence are supplied separately in the package. No runtime bound copied. |
| DLMF | Equation5.7.6 | DLMF line254. Digamma series matches the right-half-plane truncation, including the z=1 cancellation. |
| DLMF15 | Equation5.15.1 | DLMF15 line64. Reciprocal-square series matches derivative of digamma; no missing factorial/sign. |
| DLMF25 | Equations25.11.4,25.11.7 | DLMF25 lines419–449. Shifted even-order Euler–Maclaurin form follows by integration by parts; negative remainder sign and σ₀+2m>1 checked. |
| DLMF8 | Equation8.2.2 | DLMF8 line122. Upper incomplete-gamma integral supports both Mellin tail estimates with positive cutoff. |

## Dependency and ownership register

The mechanical check was run read-only against this README and the supplied order. Its complete output was:

```text
depcheck: 8 roadmaps, 51 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The check does not detect the unowned internal proof inputs S01–S04 or the omitted existing supplier in S05. No notion was moved from a later roadmap; EffectiveDiophantineMethods remains later (ORDER:131), while this package is ORDER:105.

| Supplier / comparison | Exact locations inspected | Outcome |
| --- | --- | --- |
| ClassicalArithmeticCompletion | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5332`, :5404, :6065, :6131, :6296, :6730, :11130, :11156, :11199, :11427, :11453, :11595, :11751 | All 13 cited numbered sections exist; matrix columns, positive pivots, full relation rank, unit torsion and analytic lower-bound hypotheses agree. Its Newton slopes are root valuations, opposite to geometric slopes used for φ-sides here; no equality of those signed parameters is asserted. |
| NumberFieldArithmetic | `Completed/NumberFieldArithmetic/README.md`, Layers3,7; §§5.3,5.5 at :1393,:1470 | Existing arithmetic ownership respected after removal of duplicates; completion bridge omitted from consumers, S05. |
| LocalFieldsRamification | `TauCetiRoadmap/LocalFieldsRamification/README.md:183`, :332, :521; Layer2 norm-on-units contract | Native local invariants, Teichmüller and deep units match. No general coprime-factor Hensel theorem found. |
| PolynomialGaloisGroups | `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1054`, :1107 | Frobenius-orbit factor degrees are supplied; Rabin presentations here are a further adapter. |
| RealAlgebraicGeometry | `TauCetiRoadmap/RealAlgebraicGeometry/README.md:128`, :231, :298, :341 | Real Sturm–Tarski, subresultants and root matching are existing theory; no competing complex certificate arithmetic target found. |
| ModularForms | `TauCetiRoadmap/ModularForms/README.md`, Layers7–11, including :971,:1024,:1204 | Functional equations, symbols, labels, cusp widths and trace formula owned there. Integral q-expansion lattice is distinct from integral modular symbols. |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:423`, :683, :793, :1200, :1262 | Isogeny, finite-field, reduction, Mordell–Weil and Selmer inputs located; certificate/saturation adapters are additional statements. |
| AlgebraicModularFormsAndSerreWeights | R15.2,R15.3,R15.5 named by the package; ORDER:77 | Earlier supplier, but its text is absent from the supplied main/package trees. Scope match not certified; see Not verifiable. |
| HeightsRationalPointsAndObstructions | README:257–264 and `design/plan.json` slug `local-two-quotient`; ORDER:104 | Same declared supplier and section. Exact g-dimensional formulas in README are precise; accepted conditional contract, not an absence finding. |
| Seven supplied sibling heads | `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/`, `TauCetiRoadmap/CohomologyComparisonsPartII/`, `TauCetiRoadmap/ColemanIntegrationPartII/`, `TauCetiRoadmap/QWittVectors/`, `TauCetiRoadmap/ErdosProgressionPowers/`, `TauCetiRoadmap/ArithmeticDynamics/` | All seven searched by objects and dependency names; relevant matches read. ErdosProgressionPowers:286 declares an analytic zero-exclusion gap; ArithmeticDynamics:133,:145 consumes later curve-specific arithmetic. Neither owns these general certificate targets. No citation in this package points to one of these seven heads. |

Pinned declarations were checked by objects as well as names: Lucas primality and prime-factor products; finite-field Frobenius, `AdjoinRoot` and field equivalences; native number-field orders, radicals and multiplier ideals; integer-matrix kernel basis; local square filtration and norm maps; point counts, x−T descent, two-torsion and division polynomials; level-one q-expansion and general Sturm comparison; native digamma, L-functions and positive-definite matrices. The specialized order multiplier ring is not the arbitrary-submodule variant used here. Fixed-p saturation is not Mathlib's all-integers saturated-subgroup notion. Rational translated ellipsoid finiteness is not the same interface as the pinned homogeneous integral-matrix theorem.

## Verified sound

Read all 2,264 README lines and all 1,623 Lean lines. Registered 247 explicit Lean declarations: 142 theorems, 45 definitions, 14 structures, one inductive type and 45 examples. All 202 named declarations occur in the README. Read all 104 bold target statements and all 119 numbered sections; all are covered in the adversarial table. Reviewed 227 Check cases: 224 bullet cases plus the three inline cases in §3.23. These were checked symbolically, by source comparison, or by direct arithmetic; the large finite classifications were checked against their source tables, not recomputed exhaustively.

Checked 25 readable source-locator groups and the metadata/disposition of the settled twenty-sixth work. Arb's algebraic-root attribution remains S10. Checked seven available named supplier roadmaps, searched all seven specified sibling heads, and checked the one declared gap's two occurrences. Of the two suppliers absent from the supplied trees, one is the accepted gap and one remains unverified below. There are zero direct citations to the seven open sibling heads in this package.

Independent exact arithmetic gave:

- `a_107(ΔE₄²E₆)=35830422465487817813321292`, congruent to −1 modulo107.
- In the normalized weight38 Miller basis, `T_79 mod79 = [[3,17],[25,10]]`, whose determinant is zero.
- The two stated binary ellipsoids contain five and seven vectors; the shifted one-dimensional set is `{0,1}`.
- The smooth cubic over F₅ has nine points; the two-block multiplicity sums both give −34.
- The six accepted ordinary-companion gcds equal1; the two weights of the excluded151 pair give gcd3.
- The proposed new nonempty AKS rejection Check gives `[4,4]` versus `[1,1]` in the quotient by `(9,X²−1)`.

The repaired ramified unit-square criterion, φ-residual normalizations, local quotient formulas conditional on the declared supplier, torsion-sensitive saturation equivalences, signed interval arithmetic, digamma/trigamma remainder bounds, Euler–Maclaurin sign, Mellin normalization and multiplicity identity passed the stated boundary tests. No false headline equality was found. S01–S06 identify proof-contract/signature defects; S07 is an omitted easy headline; S08–S12 concern overclaim, Checks, locators and publication scope.

The Lean file is below 5,000 lines. It has exactly one `import Mathlib` followed by six existing individual Tau Ceti modules. No sorry-bodied data, admitted example syntax, `True` placeholder, `set_option`, `#eval`, `#synth`, `#print axioms`, or `lemma` declaration occurs. The surviving native-carrier headlines are not forced through dummy data. No suspicious instruction from untrusted file/source text was acted on.

## Not verifiable

- **Elaboration and retained implicit types:** No Lean build, elaboration or scratch `#check` was run, as this job is read-only and prohibits Lean builds. Proof terms and explicit/ambient binders were inspected statically. Successful compilation is not claimed.
- **AlgebraicModularFormsAndSerreWeights R15.2,R15.3,R15.5:** The supplier is earlier in ORDER, but no copy of its current text was available in the provided content/package trees or the seven specified sibling heads. Its exact denominator, theta/Hasse and lifting hypotheses could not be compared. Absence from these inputs is not evidence that its targets do not exist.
- **HeightsRationalPointsAndObstructions §1.17:** Supplier implementation is intentionally absent under declared `gap:local-two-quotient`. The README and plan contract agree. Acceptance of statements using it is conditional on that contract, with the local absolute value normalized by residue cardinality.
- **Mattuck, Theorem7 p.114:** Settled waived/uncertified citation. No text was requested, fetched or guessed; the local index contract was checked mathematically using the stated open-subgroup comparison.
- **Large finite datasets:** The full nonordinary classification below200, simultaneous companion eigensystems, Platt zero isolations and central nonvanishing data, and all CT application datasets were not reconstructed. Their printed ranges/normalizations were compared with readable sources. The two small modular coefficient/matrix witnesses above were independently reconstructed.
- **Cusp-form numerical tail implementation:** The two-tail estimate and Δ sign normalization were checked analytically, but the stated Δ enclosure was not turned into a formal finite-term proof. It remains an honest named theorem target.
- **Publication diff:** Only the board diff is available. It contains the one intake order insertion noted in S12; the eventual roadmap export was not available to inspect.

All 25 readable cited works were available from the supplied legal cache; there is no new missing-source request. No source, target file, supplier, manifest, order file or toolchain was edited. Only this report and review scratch notes were written.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "47e438ccff104dfeaaf067e5d60f0ef92357a8f0", "job": "RT-ComputationalNumberTheory~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
