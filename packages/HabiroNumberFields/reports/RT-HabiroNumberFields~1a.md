<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/155#issuecomment-6320459442 -->
Red team round 1 pass a (codex) of c15e8c6

Verdict: needs_changes

1. **F01** (P1) The nonlinear global definition admits incompatible signs

   **Location:** `packages/HabiroNumberFields/README.md:676`, “Also require for every positive integer γ”; `packages/HabiroNumberFields/README.md:691`, “the subset in degree zero is exactly H_R”; `packages/HabiroNumberFields/README.md:702`.

   **Claim:** Prime-to-p local membership and the displayed nonlinear γ conditions define H_R in degree zero and an additive descended module in every degree.

   **Witness:** K=ℚ, Δ=6, ξ=0. Set f₂=−1 and f_m=1 otherwise. Every local restriction is integral. For odd γ the product is 1; even γ excludes order 2. But the 2→10 gluing equation is −1=1.

   The local restrictions are themselves invertible zero-degree sections: their logarithms and Frobenius defects vanish. Thus this witness does not rely on the later span theorem. Both f and 1 satisfy §3.8, but f+1 fails its γ=1 condition: its squared family is zero at order 2 and four at order 10. Therefore the subset is not closed under addition. Effective descent cannot identify a module with this subset; tensor, Picard, and functoriality claims depending on that identification are consequently unsupported.

   **Exact repair text:** “Define GlobalIndexedFamily ξ using the linear, coherent full-order transition conditions of the normalized local extensions, in addition to local membership. For each p∤Δ, require the entire p-adic family to equal the compatible extension of its prime-to-p restriction. The γ product condition is a theorem about these linear families, not their defining converse. Prove effective descent for this revised linear datum. In degree zero it must impose rex(f_m)=φ_R(f_pm).” Delete the asserted equivalence with the old nonlinear subset in §3.10. Add the sign family above and the failure of addition as negative controls. Specify the transition maps and prove their coherence before claiming descent.

2. **F02** (P1) Core prerequisites are attributed to unavailable, undeclared suppliers

   **Location:** `packages/HabiroNumberFields/README.md:41`, “From K3BlochGroups V.2–V.6”; lines 46, 48 and 53 name the other contracts.

   **Claim:** The Bloch conventions, arithmetic K-theory, all-order finite Chern maps, completed local K₃ presentations, and Pochhammer analysis are supplied before this roadmap.

   **Witness:** K3BlochGroups, ArithmeticKTheory, MotivicEtaleKTheory, PadicHodgeRegulators and QSeriesPartitionsAndMockModularForms have no roadmap in the supplied main/completed trees or six sibling heads and no entry in `merge-order/ORDER.txt`. No `design/plan.json` or matching `gap:` contracts exist for this package.

   These are consumed mathematical inputs, not merely downstream names. In particular the completed root-symbol presentation and its integral regulator in line 48 support all of Layer 3; the unspecified early M.8 prefix supports Layers 0–1. An imperative that another roadmap “must” supply a result does not register a supplier gap under this job's contract.

   **Exact repair text:** “The prerequisites listed below are owned targets of the earlier foundation layers of this roadmap until an eligible earlier supplier exports them.” Replace each unavailable supplier citation by a numbered prerequisite target here, with its full hypotheses, source locator, and proof inputs; for Coleman analytic functions repoint to the existing ColemanIntegration ownership where applicable. Alternatively, obtain an eligible earlier supplier and register each genuinely missing contract with the same `gap:<slug>` and precise `needs` in the plan and README. Do not continue to call the five absent contracts supplied, and do not substitute another consumer's mention for an owner.

3. **F03** (P1) K3BlochGroups is both supplier and consumer

   **Location:** `packages/HabiroNumberFields/README.md:9`, “The genuine finite-coefficient comparison that ends V.6 is not imported”; `packages/HabiroNumberFields/README.md:831`, “K3BlochGroups uses the étale Bloch group of §1.6”.

   **Claim:** Excluding the final V.6 comparison from the imports prevents a dependency cycle.

   **Witness:** The stated edges are K3BlochGroups V.2–V.6 → HabiroNumberFields and HabiroNumberFields §§0.2,1.6,1.13 → K3BlochGroups V.6. No merge order can place both roadmaps before each other.

   **Exact repair text:** “K3BlochGroups supplies only its existing foundational Bloch and configuration results. The finite-coefficient comparison consuming excludedInteger, etaleBlochGroup and finiteRegulator is a target of HabiroNumberFields after §1.13, and is not an input to its construction.” Move ownership of that final comparison to this roadmap, or to a separately named downstream Part II roadmap, and remove the reverse consumer edge. Section-level independence inside a supplier does not satisfy the single-direction roadmap contract.

4. **F04** (P2) An easy Layer 0 milestone is missing from Suggested.lean

   **Location:** `packages/HabiroNumberFields/README.md:106`, “finiteEndomorphism_torsionKernel”; `packages/HabiroNumberFields/Suggested.lean:16`, the empty Layer 0 block.

   **Claim:** The representative file omits the finite endomorphism milestone, although its complete signature is easy on existing carriers.

   **Witness:** This criterion needs only `[AddCommGroup A] [Finite A]`, `f : A →+ A`, a natural n, and equations involving n-smultiplication. None of its carriers depend on K-theory or completions.

   **Exact repair text:** Add the Layer 0 milestone with a mathematical docstring:

   ```lean
   theorem finiteEndomorphism_torsionKernel
       {A : Type*} [AddCommGroup A] [Finite A]
       (f : A →+ A) (n : ℕ)
       (h : ∀ y : A, ∃ a b : A, y = f a + n • b)
       (x : A) (hfx : f x = 0) (hnx : n • x = 0) : x = 0 := by
     sorry
   ```

   Keep finiteness explicit and retain the n=0 and divisible-group negative controls from §0.5. This is a missing easy milestone, not a request to encode the heavy K-theory headlines.

5. **F05** (P3) Two Lean theorem names have no README entry

   **Location:** `packages/HabiroNumberFields/Suggested.lean:44` and `packages/HabiroNumberFields/Suggested.lean:51`.

   **Claim:** Every kept Lean declaration is named in the definitive roadmap.

   **Witness:** Neither `cyclicDilog_quasiPeriodicity` nor `cyclicDilog_one_pow_twentyFour` occurs anywhere in the README, although §1.1 states their formulas.

   **Exact repair text:** In §1.1 name the cleared identity `cyclicDilog_quasiPeriodicity` and the phase-free identity `cyclicDilog_one_pow_twentyFour`, retaining their stated field, primitive-root, order and invertibility hypotheses.

6. **F06** (P3) The Lean file ends with a prohibited catalogue

   **Location:** `packages/HabiroNumberFields/Suggested.lean:115`, “The README definitions absent here include”.

   **Claim:** Lines 115–136 enumerate dozens of omitted definitions and milestones as commentary.

   **Witness:** This block contains no declaration; it is precisely a catalogue of names and process commentary, both excluded by the required Suggested.lean shape. The module docstring already says the file is not exhaustive.

   **Exact repair text:** Delete lines 115–136. Keep the mathematical explanations of omitted heavy constructions in README.md, and keep only actual layer comments and permitted declarations in Suggested.lean.

7. **F07** (P3) The required source manifest is absent

   **Location:** `packages/HabiroNumberFields/README.md:835`, the References list; package root.

   **Claim:** The package relies on nine source versions, including precise published/preprint distinctions, but provides no source manifest.

   **Witness:** `git diff --stat origin/main...HEAD` lists README.md, Suggested.lean, metadata.toml and review.json only. There is no `packages/HabiroNumberFields/sources.toml`.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry per cited source/version, complete bibliography, exact locator scheme and locators, cited target sections, and the legal-source service's provenance, hash, licence class and status. Distinguish CGZ-pub from CGZ-v3. Use the source audit below to populate the locators; do not put cache paths or extracted source passages in the package.

8. **F08** (P3) Statable Checks are missing their Lean mirrors

   **Location:** `packages/HabiroNumberFields/README.md:187`, `packages/HabiroNumberFields/README.md:207`, and `packages/HabiroNumberFields/README.md:647`.

   **Claim:** The Checks test the roadmap's three kept real-bodied definitions at their stated boundaries.

   **Witness:** Suggested.lean has only six examples. It omits D₁(x)=1, D_n(0)=1, f₀=0, f₁=1, the nonsingular diagonal sum, and halfShiftLinearCoeff(2,1)=1/12 and (−1,2)=1/96. All use existing carriers and the file's own definitions.

   **Exact repair text:** Expand the existing examples into grouped conjunctions covering the additional elementary boundary Checks, keeping at most two proved examples per definition. Add the two missing rational half-shift evaluations to the existing sign tests. For any nontrivial Check that cannot yet be proved, give it a named theorem target in both files instead of silently leaving it untested. Keep the nonsingular premise on the diagonal hypergeometric Check, and test a singular input as a negative control.

9. **F09** (P1) The Pochhammer defect has the opposite residue

   **Location:** `packages/HabiroNumberFields/README.md:602`, “its residue is p Li₂^(p)(ζ)”.

   **Claim:** With q=1+x, log(t^p;q^p)_∞−p log(t;q)_∞ has residue +p Li₂^(p)(t), hence the stated positive residue at admissible roots.

   **Witness:** Its coefficient of t is p/(1−q)=−p/x. GSWZ line 814, equation (49), likewise gives −p Li₂^(p)(t)/log(1+x). The positive sign printed in equation (56), GSWZ line 858, contradicts these expansions.

   This is a source misprint propagated into the roadmap. It is visible at an allowed specialization: take p=5 and ζ a primitive cube root in the unramified quadratic integer ring. Modulo 5, Li₂^(5)(ζ)=(ζ+4ζ²+4ζ³+ζ⁴)/(1−ζ⁵)=1+2ζ≠0. Therefore the proposed and actual residues differ modulo 25.

   **Exact repair text:** “At an admissible root ζ, the residue in the additive coordinate x=q−1 is −p Li₂^(p)(ζ). This sign follows from (48)–(49); the plus sign in GSWZ (56) is a misprint.” Add the coefficient-of-t test and the p=5, order-three specialization as sign-sensitive Checks. Carry this sign into `pochhammer_frobeniusDefect` and the half-shift defect calculation.

10. **F10** (P3) Combined subsections conceal definitions with too few Checks

   **Location:** `packages/HabiroNumberFields/README.md:456` and `packages/HabiroNumberFields/README.md:510`.

   **Claim:** ArithmeticHabiroRingAway, multiplicativeTaylorCoordinates and weighted jets have the required discriminating definition checks.

   **Witness:** The only restricted-ring-specific Check is line 462. Coordinate conversion has only m=1 and m=2 (lines 513–514). The weighted-jet definition has only the N=4 index test (line 515).

   **Exact repair text:** Add, for ArithmeticHabiroRingAway, γ=1 recovering all orders and γ=2 retaining odd orders while deleting the 1→2 edge. For coordinate conversion add an order-three linear coefficient a mapping to −ζ₃a and verify the inverse. For weighted jets add N=0 and N=1 giving empty jets, and N=2 retaining only (m,k)=(1,0). Keep the N=4 strict-boundary test. Mirror the statable tests once their light definitions are kept, within the two-example limit by grouping assertions.

11. **F11** (P3) The étale Bloch comparison points to the wrong source section

   **Location:** `packages/HabiroNumberFields/README.md:280`, “CGZ v3 Theorem 2.11, p. 15, and §1.1, p. 5”.

   **Claim:** These locators support the étale Bloch exact sequence, its divided-boundary map and the H¹ comparison.

   **Witness:** CGZ-v3 line 699 is the regulator's five-term factorization. The exact sequence is Theorem 1.7 in §1.2 (line 218); its construction and cohomological comparison are in §6, lines 1439–1519, pp. 31–33.

   **Exact repair text:** Replace the locator at the end of §1.6 by “CGZ v3 Theorem 1.7, §1.2, p. 5; Definition 6.1 and (35)–(38), §6, pp. 31–33. The regulator factorization is Theorem 2.11, p. 15.” Keep the separate hypotheses for the exact sequence and for the comparison with H¹.

12. **F12** (P2) Eta calibration is used outside the comparison theorem's domain

   **Location:** `packages/HabiroNumberFields/README.md:366`, “for gcd(n,M_F)=1”; `packages/HabiroNumberFields/README.md:377`, “then γ=a b⁻¹ mod n”.

   **Claim:** The comparison scalar from §1.13 can be read from eta's regulator and Chern values over the real cyclotomic field.

   **Witness:** At n=5, eta lives over F₀=ℚ(√5), whose discriminant is 5. Thus gcd(5,M_F₀)≠1 and §1.13 cannot be applied to eta. Over ℚ both mod-5 groups vanish, so their comparison alone constrains no scalar.

   The statement that a scalar is independent of F on the good-order domain does not extend its equality to a field outside that domain. The compositum warning in §1.13 does not supply the missing extension.

   **Exact repair text:** “Before scalar calibration, prove `finiteRegulator_compare_eta`: the same γ furnished by the local comparison satisfies R_ζ(eta)=c_fixed,ζ(eta)^γ over F₀=ℚ(ζ+ζ⁻¹), without assuming gcd(n,M_F₀)=1. Prove this from the finite-field comparison, compatible reduction, and the exact-valuation eta generator, with all arrows specified. The scalar-reading theorem assumes this equality and that [ζ] has exact order n; then b∈(ℤ/n)ˣ gives γ=a b⁻¹. The ordinary-unit theorem keeps its separate good-order hypotheses.” Retain the independent normalization and Nahm-evaluation premises; do not add a good-order assumption that excludes the calibrating field.

## Verified sound

Read all 844 README lines and all 138 Suggested.lean lines. The inventory covers 54 numbered README target groups, their named subtargets, and 219 Check bullets. Read all 13 Lean declarations: three real-bodied definitions, four admitted theorems and six proved examples. The examples' equations were checked mathematically; Lean was not run. All four admitted signatures retain the mathematical hypotheses used by their types. No sorry'd data, `set_option`, `lemma`, extra import, or forced heavy headline occurs. The package diff changes only its own folder.

The finite tests passed for 6,354 admissible KMS/shift triples, 1,336 quasi-periodicity cases including singular inputs, 16 exact cyclotomic phase identities, 217 Kummer inversion inputs, 3,380 root/lift-change cases, and 53 eta specializations. These are 11,356 cases, with multiple assertions in several cases. The two Kontsevich–Zagier Taylor jets and all four rational half-shift values were also computed exactly. Tests establish these instances, not the general theorems or source conjectures. All 219 Checks were reviewed; the table records the boundaries actually tested or the reason a claim remains conditional.

Eleven roadmap supplier citations were checked for ownership/availability: ten external supplier names and Chebotarev Layer 10. All six supplied sibling heads were searched for overlap and names; the package directly cites none of those six. The five absent supplier contracts are R02; the five eligible supplier texts unavailable in these inputs are listed below. The Chebotarev citation exists on main. No declared supplier gap was available to exempt an absent contract.

The following table records every Lean declaration. Line numbers refer to `packages/HabiroNumberFields/Suggested.lean`. Type variables have universe `Type*`; the six anonymous examples are counted as declarations. No `include` line changes a theorem context.

| Line; section | Declaration | Variable and instance context retained in the statement | Instances/result; change |
|---|---|---|---|
| 25; 1.1 | `cyclicDilog` | R, `[CommRing R]`; n:ℕ; ζ,x:R | Empty product, n=1,2,3, x=0; correct, including zero ring. R08 covers missing mirrors. |
| 29; 1.1 | First example | R, `[CommRing R]`; x:R | n=2, ζ=−1 gives 1+x, also in characteristic two. Correct. |
| 33; 1.1 | Second example | R, `[CommRing R]`; ζ,x:R | n=3 retains exponents 1,2 without a primitive-root premise. Correct. |
| 44; 1.1 | `cyclicDilog_quasiPeriodicity` | K, `[Field K]`; n,s,ζ,x; n>0, primitive ζ, s≤n | s=0,n; x=0 and xⁿ=1; 1,336 finite cases. No mathematical defect found. R05. |
| 51; 1.1 | `cyclicDilog_one_pow_twentyFour` | K, `[Field K]`; n,ζ; n>0, primitive ζ, (n:K)≠0 | Exact integral cyclotomic computation n=1 through 16. R05. |
| 57; 1.2 | `cyclicHypergeom` | K, `[Field K]`; n,ζ,x,y,z | n=0 gives 0; n=1 gives 1; singular inputs use total division. R08. |
| 63; 1.2 | Third example | K, `[Field K]`; ζ,x,y,z | Two summands give the stated ratio, even under total division. Correct. |
| 68; 1.2 | Fourth example | Concrete ℚ; no inherited arbitrary K | 1+(4/3)·5=23/3. Correct. |
| 72; 1.2 | `cyclicHypergeom_shift` | K, `[Field K]`; positive n, primitive ζ; X,Y≠1; hypersurface relation | n=1 reduces to that relation; finite tests passed. Required denominator conditions retained. |
| 81; 1.3 | `kms_odd` | K, `[Field K]`; n≥3 odd and invertible; primitive ζ; x,y,z≠0; X,Y≠1; X≠Y; relation | 6,354 admissible triples at n=3,5,7,9; excluded X=Y forces the singular Z=1 case. Correct tested orientation. |
| 103; 3.5 | `halfShiftLinearCoeff` | K, `[Field K]`; z,r:K. Unused section `[CharZero K]` need not survive elaboration | The rational function is total even at r=0,z=1; the asymptotic use explicitly excludes them. Four rational values correct. R08. |
| 106; 3.5 | Fifth example | Concrete ℚ | (z,r)=(−1,1) gives 1/48. Correct. |
| 110; 3.5 | Sixth example | Concrete ℚ | (z,r)=(−1,−1) gives −1/48. Correct. |

The all-target adversarial inventory follows. “Conditional” means no additional counterexample was established, but the cited supplier or earlier theorem must be supplied; it does not certify a general theorem. Numbers in the Checks column count bullets read, not proof obligations discharged by computation.

| README section; statement family | Checks | Instances tried / distinction tested | Result and change |
|---|---:|---|---|
| 0.1 Integral eigenclass obstruction | 4 | Trivial group; twisted regular module over ℤ/9; augmentation image 6ℤ/9; inverse root character at orders 5,7 | Averaging obstruction and inverse convention hold. Conditional on power-class carriers. |
| 0.2 Excluded integers | 3 | ℚ:12,4; ℚ(i):24,8; n=1,3,9,2M | Values correct; BG line 1268 verifies the tame kernel. R02 for arithmetic owner. |
| 0.3 Finite Chern untwisting | 3 | r=1,2; k=−1; n=1; trivial relative G at ℚ(ζ₃) | χ^(1−r) and k^(1−r) have the stated direction. All-order construction still needs R02 supplier. |
| 0.4 Restriction/injectivity | 3 | n=3,9 over ℚ; trivial group Sah test | Repeated-prime condition distinguishes squarefree n from 9. No additional finding. |
| 0.5 Finite endomorphism/Picard obstruction | 5 | A=0; n=0,1; ℤ/9 with f=2 or 0; ℚ/ℤ with f=3 | Finite criterion correct; divisible-group counterexample rejects omission of finiteness. R04. Keune input subject to R02. |
| 0.6 Exact lift/valuation image | 4 | D=3ℤ in ℤ modulo 3; trivial character; n=9; non-Galois cubic at p=5 | Using D avoids false saturation. Unique lift follows from injection. Cyclotomic arithmetic conditional on owner. |
| 0.7 S-units/ordinary units | 3 | n=1; nonzero S-valuation; extension adjoining an n-th root | Fixed-n finite S and noninjective field extension are distinguished. No additional finding. |
| 0.8 Unit character multiplicities | 3 | ℚ at p=3,5,7; ℚ(√−7) at 5; non-Galois cubic at 3 | Torsion correction at p=3 and r₂ multiplicity consistent with the character calculation. |
| 0.9 Finite Chern unit theorem | 3 | n=3,5,35,25; trivial quotient over ℚ | Squarefree surjectivity is not asserted at arbitrary prime powers. Conditional on R02. |
| 1.1 Cyclic dilogarithm and phase | 5 | n=0,1,2,3,9; x=0,ζ⁻¹; phase n≤16; quasi-period endpoints | All computed values correct. R05 and R08. |
| 1.2 Cyclic hypergeometric sum | 5 | n=0,1,2; nonsingular diagonal; singular cancellation; 23/3; cubic geometric sum | Correct total definition and nonsingular identity scope. R08. |
| 1.3 KMS/analytic passage | 5 | Center (1/5,2,−4/5); S=4/9; X=Y; four finite fields | Annulus and finite identity checks pass. General uniform analytic limit and integral descent remain targets, not facts established by tests. R02 analytic supplier. |
| 1.4 Kummer value/boundary | 5 | X=0,1,∞; missing root of 1−X; trivial finite witness; five quadratic finite fields | Root independence and inversion passed; obstruction is not automatically zero for raw symbols. No additional finding. |
| 1.5 Regulator/powered lift set | 6 | n=1,3,15; root inversion; ℚ(ζ₃) with [2]; [32] modulo 5 | Nonunique powered descent is correctly a set; root exponent inverse confirmed. Small-field comparison contract unverified under R02. |
| 1.6 Étale Bloch group | 4 | n=1; [32] over ℚ modulo 5; tame symbol at 31; μ_p in F | Divided boundary detects a nonunit étale class. R11 locator; construction conditional on R02. |
| 1.7 Eta | 4 | n=3,5; inversion k=−1; squared root change | Degenerate symbols and k² convention consistent with positive cyclic construction. Higher orbit-multiset Check not independently executed. |
| 1.8 Positive chains/Bott | 5 | N=1,3; normalized two-term chains; inverse root; ℤ[ζ_p] before inverting p | Boundaries +3[t] and zero fix the stated sign. Bott versus étale-Chern invertibility hypotheses distinguished. |
| 1.9 Bar-to-eta/product | 4 | N=3; determinant of A; diagonal column rescaling; k²; even N | Matrix computation and odd-degree-two restriction argument correct. Product comparison remains supplier-dependent. |
| 1.10 Chern normalization | 4 | Cubic classes ζ,ζ⁻¹; a=1; cubes {1,6} in ℱ₇ | Raw negative sign is retained; numerical fixed-sign calibration is explicitly conditional. |
| 1.11 Local maps | 3 | n=3, ℓ=5 and 2; ℓ≡1 mod p; nonunit reduction | Unique n-th root argument correct; ℱ₂ comparison needs explicit verification in the missing supplier contract (R02). |
| 1.12 Local isomorphism/eta generator | 4 | n=3, ℓ=5,17,29; exact valuation; exponent-zero factor; 53 eta tests | Exact-valuation warning is necessary; numerical eta tests pass. Small-field supplier scope is unverified. Higher-order isomorphism passage not proved by tests. |
| 1.13 Detection/unit comparison | 3 | Unit multiples of a class; infinitely many detecting primes; no eligible primes under failed disjointness | Product target and scalar ambiguity correct. Independent-field comparison proof not supplied by a compositum assertion alone. R12 bridge needed for calibration. |
| 1.14 Scalar calibration | 3 | (a,b)=(2,1),(2,−1); nonunit b; n=5 calibrating field | Arithmetic a/b correct; its use of the preceding equality is outside that equality's hypotheses. R12. |
| 1.15 Chern torsors/root lines | 5 | m=1,3,25→5; μ₃ in K; inverse sign; m prime to 6 over ℚ | Keeping all orders and quotient/torsor distinctions is necessary. Coherence remains an explicit target dependent on R02. |
| 2.1 Root transitions | 4 | Orders 1,2,3,6; prime-power transitions; compatible ζ₆=exp(5πi/3) | Coprime-product convention differs from independent standard exponential roots as stated. No additional finding. |
| 2.2 Full algebras/Frobenius | 10 | Zero completion; p=3,5 for ℚ(i); order-four idempotents; x³−2 modulo 5; a=2 in ℤ₃ | Product retention, coefficient/root distinction and lcm(1,2)=2 correct. Pinned Frobenius API checked. |
| 2.3 Re-expansion | 3 | x,x²; geometric series shifted by p; forbidden shift 1 | Sign, binomial coefficient and convergence restriction correct. |
| 2.4 Arithmetic gluing/Away | 5 | ℚ polynomial families; constant i; zero/one; missing edges; KZ evaluations | Frobenius direction correct. R10 for separate Away definition's Checks. |
| 2.5 Local products/untwisting | 5 | m=p²d; arbitrary seeds; split/inert ℚ(i); p inverted in R | Exponent +v_p(m) and zero-ring completion correct. No assertion equating a product with completion without proof. |
| 2.6 Étale chart/p-chain completion | 6 | (p,m)=(2,1),(3,3),(11,5),(2,3); modulo (4,q+1); raw scalar 2 | Separable full-algebra chart and counterexample at p∣m correct. Double completion is an explicit proof target. |
| 2.7 Taylor splitting | 4 | Four linear factors at (11,5); quadratic factor at (2,3); independent seeds; q² | Rank tests and p-chain reconstruction correct. Conditional on HC contracts. |
| 2.8 Coordinate conversion/jets | 3 | m=1,2,3; N=0,1,2,4; strict inequality | Coordinate sign and N=4 list correct. R10 for missing checks per definition. |
| 2.9 Rational/classical comparison | 3 | Δ=1,2; odd-order indicator; exact KZ jets at orders 1,2; constants at 3,4 | Localization/completion distinction correct. KZ jets computed exactly. Conditional on HC detector. |
| 2.10 Components/domains | 3 | Δ=1,6; orders 5,35,10,18; ℚ(i),d=4 internal idempotent | Component labels and exhibited idempotent correct; domain conclusion retains disjointness. |
| 2.11 Abelian scalar map | 3 | ℚ; ℚ(i); ζ₅ at m=2; non-Galois cubic | Exponent 3 is the inverse of 2 modulo 5 and satisfies gluing. No general constant R-map is asserted. |
| 3.1 Local section/linear shape | 5 | ξ=0; (1+x)^(1/p); 1+x/5; zero and p multiples; polar term | Integral first coefficient necessary; x² defect of 1+x/5 is 8/5. General existence depends on R02. |
| 3.2 Dwork/exponential criterion | 4 | f=1; inverse units; binomial counterexample; ramified/equal-characteristic; p=2 | Linear premise and exponential radius restrictions retained. No additional finding. |
| 3.3 Depleted polylog/Pochhammer | 4 | s=0,2; t,t^p coefficients; ζ=1; p=5, ζ₃ | Residue sign fails. R09. |
| 3.4 Regularized factor | 3 | Empty presentation; even m half-power; invalid raw symbol | Constant-one branch and presentation restrictions coherent. Half-shift defect still a separate proof target, affected by R09. |
| 3.5 First jet | 4 | Four rational values; m=1,2; p=2,3; ζ=1; coefficient divided by p | Formula and denominator restrictions correct. R08 mirrors. |
| 3.6 Local freeness | 3 | ξ=0; unit rescaling; ps nongenerator | Quotient first jets integral and local/global distinction correct. Existence conditional on R02. |
| 3.7 Full-order extension | 3 | ω=2 for p≥5; no unit ω−ω⁻¹ at 2,3; zero cocycle | Algebraic phase equation correct. Extension is not automatically imposed on the global subset: R01. |
| 3.8 Global subset | 5 | Zero; γ=1,2; 1−q; sign at order two; f+1 | Explicit failure of additivity despite all stated membership conditions. R01. |
| 3.9 Degree zero/multiplication | 3 | ξ=η=0; zero factors; inverse degrees; sign family | Claimed degree-zero identification false. R01. Multiplicative closure alone does not fix it. |
| 3.10 Effective descent | 3 | Degree zero; independent local seeds; sign family | Cannot identify a module equalizer with the nonadditive subset. R01. |
| 3.11 Tensor/Picard map | 5 | Zero/negative powers; ξ and −ξ; finite tensor sum; local free lines | Formal Picard consequences require actual invertible modules. R01 blocks this use. Existing Picard API checked. |
| 3.12 Substitution/involution | 5 | γ=−1,0,2; m=1,2,3; 1−q; double inversion | Formal substitution formulas correct. Global membership conclusions conditional on repaired R01. |
| 3.13 Pairing/proportionality | 3 | f=g; g=0; orthogonal idempotents | af=bg correct without division or nonzero coefficients. Module pairing conditional on R01. |
| 3.14 Vanishing/evaluation | 4 | Component indicator; zero constant/nonzero series; root outside coefficient field | Stated distinctions are necessary; general propagation relies on repairing R01. |
| 3.15 Freeness distinction | 3 | Multiplication by 1−q, zero and units | Non-surjectivity follows by q=1 evaluation. Invertibility still needs valid descent. |
| 3.16 Pullback/scalar extension | 5 | Identity; ℚ→ℚ(i) at 5; tower; enlarged Δ; degree zero | Correct tensor base H_R and retention of split factors. Line equivalence conditional on R01/R02. |
| 3.17 Coefficient Galois action | 4 | Conjugation on ℚ(i) twice; split-factor permutation; changed degree | Fixing abstract ζ differs from q-inversion; degree bookkeeping correct. Conditional on descent. |
| 3.18 Determinant norm | 4 | Split quadratic (1+ax,1+bx); base scalar; split rank; ξ=0 | Norm 1+(a+b)x+abx² and trace first jet correct. Transfer diagrams depend on R02. |
| 3.19 Multiplicative transfer | 4 | Identity/tower; quadratic 1+1; zero/one; restricted base section | Positive-degree norm is nonadditive and has the stated powers. Global membership conditional on R01/R02. |

Source locator audit: nine cited versions were obtained through the legal-source service. The table gives 36 locator groups checked against the text, with the individual locators identified inside each group. “Located” certifies the locator and the stated subject, not every generalization proposed by the roadmap. The numerical, sign, and hypothesis departures are recorded explicitly.

| Source/version; locator group | Extraction witness | Audit result |
|---|---|---|
| CGZ-pub, published Theorem 1.2 and Remark 1.4, pp. 385–386 | CGZ-pub line 93; CGZ-pub line 115 | Regulator scope and two excluded integers located. README explicitly uses fixed-n S and squarefree assembly targets. |
| CGZ-pub, Theorems 1.5–1.6, p. 386 | CGZ-pub line 157; CGZ-pub line 170 | Unit-image theorem and comparison up to a unit located; calibration-domain gap is R12. |
| CGZ-v3, §2.1 and Lemma 2.3, pp. 8–9 | CGZ-v3 line 378; CGZ-v3 line 418 | Bloch convention and universal Kummer extension located. Finite-witness warning in README is necessary. |
| CGZ-v3, Lemma 2.4 and §2.2 product/phase formulas, pp. 9–11 | CGZ-v3 line 435; CGZ-v3 line 454; CGZ-v3 line 475 | Root-change, quasi-periodicity and integral phase formulas located; finite identities tested separately. |
| CGZ-v3, Proposition 2.5, pp. 11–13 | CGZ-v3 line 521 | Descended regulator and powered variant located. README's lift-set correction avoids unrestricted uniqueness. |
| CGZ-v3, Lemmas 2.7, 2.8 and 2.10, pp. 14–15 | CGZ-v3 line 640; CGZ-v3 line 673; CGZ-v3 line 686 | Order distribution, CRT and field naturality located. |
| CGZ-v3, Theorem 2.11 and Proposition 2.12, pp. 15–17 | CGZ-v3 line 699; CGZ-v3 line 747 | Five-term factorization and unit multiplicities located; 2.11 does not supply the étale exact sequence (R11). |
| CGZ-v3, Lemma 3.1 and Theorem 3.2, pp. 18–19 | CGZ-v3 line 830; CGZ-v3 line 856 | Restriction and odd-primary K₃/cohomology comparison located. |
| CGZ-v3, Lemmas 3.3–3.5 and §3.5, pp. 19–21 | CGZ-v3 line 866; CGZ-v3 line 882; CGZ-v3 line 901; CGZ-v3 line 925 | Repeated-prime restriction, S-units and ordinary units located. Keune's precise comparison remains a supplier obligation. |
| CGZ-v3, Lemma 4.1, Proposition 4.2 and Remark 4.3, pp. 21–23 | CGZ-v3 line 964; CGZ-v3 line 1004; CGZ-v3 line 1042 | Rigidity, detection and disjointness located; replacing the source's direct sums by products is necessary. |
| CGZ-v3, §§4.2–4.4 and Lemma 4.4, pp. 23–25 | CGZ-v3 line 1048; CGZ-v3 line 1128; CGZ-v3 line 1158 | Cross ratios and local comparison diagrams located; source starts with odd residue characteristic. |
| CGZ-v3, Lemma 5.1 and Theorem 5.2, pp. 26–27 | CGZ-v3 line 1197; CGZ-v3 line 1228 | Exact valuation in the eta generator lemma distinguished from the all-prime regulator claim. |
| CGZ-v3, Lemmas 5.3–5.4, pp. 27–28 | CGZ-v3 line 1236; CGZ-v3 line 1260 | Root-valued eta regulator and non-pth-power witness located. |
| CGZ-v3, §5.3, pp. 28–31 | CGZ-v3 line 1305; CGZ-v3 line 1405 | The source labels the normalization diagram an assumption; README retains a separate comparison target. |
| CGZ-v3, Theorem 1.7 and §6, pp. 5,31–33 | CGZ-v3 line 218; CGZ-v3 line 1439; CGZ-v3 line 1489; CGZ-v3 line 1498 | Correct source for the étale exact sequence and H¹ comparison. R11. |
| CGZ-v3, Theorem 7.4, pp. 37–39 | CGZ-v3 line 1742 | Eta evaluation located; it is only a conditional downstream input here, not a proof of the missing comparison at that field. |
| BG, §7, p. 24, table of trivial tame kernels | BG line 1251; BG line 1268 | Table uses absolute discriminant d and includes d=4. Author copy obtained from the Belabas page after Durham timed out. |
| H2024, §2.1, Lemma 2.1 and Corollary 2.2, p. 2 | H2024 line 57; H2024 line 80 | Positive cyclic chains and Bockstein normalization located. |
| H2024, Proposition 2.4 and Theorem 2.8, pp. 3–4 | H2024 line 121; H2024 line 152 | Hurewicz and Suslin comparisons located with infinite-field hypotheses. |
| H2024, Theorem 2.12 and Corollary 2.13, pp. 4–5 | H2024 line 187; H2024 line 194 | Negative finite Chern product sign located. |
| H2024, Theorem 3.1, Lemma 4.1 and Proposition 4.6, pp. 5–7 | H2024 line 271; H2024 line 296; H2024 line 353 | Eta/Bott evaluations located; line 308's tensor/sign identification still requires the README normalization diagram. |
| H2013, §§6.2–6.4, pp. 31–33 | H2013 line 1506; H2013 line 1530; H2013 line 1554 | Repeated-point correction and positive cyclic configuration comparison located. |
| GZ, Appendix A, Proposition 8.1 and (55)–(56), pp. 235–236 | GZ line 846; GZ line 852; GZ line 855; GZ line 862 | KMS and finite difference identities located. |
| GZ, Appendix A, (58) and subsequent Gaussian/phase argument, pp. 236–237 | GZ line 882; GZ line 910; GZ line 929 | The abbreviated asymptotic route is present; uniform tails are additional targets, not certified by those displays. |
| GSWZ, Definition 1.1, (13)–(15), Remark 1.2, pp. 6–7 | GSWZ line 260; GSWZ line 273; GSWZ line 289; GSWZ line 311 | Frobenius direction and local products located. README corrects the scalar inverse and unqualified component-domain wording. |
| GSWZ, (16)–(18), Definition 1.3 and Theorem 1, pp. 8–9 | GSWZ line 349; GSWZ line 370; GSWZ line 380; GSWZ line 400 | All-order Chern data and local-section definition located; corrected linear shape comes later. |
| GSWZ, Definition 1.4, Theorem 2 and Proposition 1.5, pp. 10–11 | GSWZ line 415; GSWZ line 443; GSWZ line 465 | Global nonlinear membership and claimed conclusions located. The sign-family counterexample is R01. |
| GSWZ, (46)–(50), pp. 18–19 | GSWZ line 792; GSWZ line 801; GSWZ line 806; GSWZ line 814 | Logarithmic formulas force the negative residue. R09. |
| GSWZ, Lemma 2.1, Proposition 2.2 and (60), p. 19 | GSWZ line 826; GSWZ line 855; GSWZ line 879 | Integral depleted coefficients and Bernoulli expansion located; equation (56) has the contrary residue sign. R09. |
| GSWZ, Lemma 3.1, Propositions 3.2–3.3 and Theorem 9, pp. 37–39 | GSWZ line 1975; GSWZ line 1995; GSWZ line 1998; GSWZ line 2015 | Local regulator/root-symbol context located. This does not certify the unavailable Lean supplier contracts. |
| GSWZ, Lemma 3.4 and Corollary 3.5, pp. 39–40 | GSWZ line 2034; GSWZ line 2076; GSWZ line 2080 | Dwork induction's linear requirement and exponential step located. |
| GSWZ, Lemma 3.6, Corollary 3.7 and (195)–(204), pp. 41–42 | GSWZ line 2102; GSWZ line 2103; GSWZ line 2132; GSWZ line 2138 | Corrected first jet and phase-cocycle calculation located. |
| GSWZ, Definition 3.9, Theorem 10, Corollary 3.10, pp. 42–43 | GSWZ line 2168; GSWZ line 2172; GSWZ line 2182; GSWZ line 2208 | Regularized factors and local membership located; linear jet and half-shift defect remain separate obligations. |
| GSWZ, proof of Theorem 2, Proposition 1.5; (298)–(306); Propositions 5.3–5.4 and Example 5.6 | GSWZ line 2213; GSWZ line 2285; GSWZ line 2964; GSWZ line 2997; GSWZ line 3345; GSWZ line 3354; GSWZ line 3372 | Global proof does not fix R01. Coordinate, Taylor-image and concrete KZ locators found. |
| W-thesis, §2.2 items 2.7,2.11 and Lemma 2.12, pp. 29,31–32 | W-thesis line 1313; W-thesis line 1400; W-thesis line 1413; W-thesis line 1448 | Frobenius, root and chart locators found. Irreducibility sentence is false; README correctly replaces it by separability. |
| Q v2, §2.2 item 2.7 and Lemma 2.12, pp. 15,18 | Q line 647; Q line 750; Q line 781 | Article locators found; same irreducibility correction is necessary. |

Pinned-library verification used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, taken from the content repository's manifest. Search results were only discovery aids; the following files were read at those commits. This table records selected exact declaration witnesses and the hypotheses relevant to this package, rather than inventing substitute targets.

| Pinned file and declaration | Hypothesis/convention checked |
|---|---|
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:784`, `IsPrimitiveRoot.autToPow`; line 821, `autToPow_spec` | Positive root exponent and `[NeZero n]`. |
| `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:212`, `modularCyclotomicCharacter` | Domain coefficient ring, `[NeZero n]`, and exact root-count hypothesis. |
| `Mathlib/RepresentationTheory/Homological/Resolution.lean:429`, `Rep.barResolution` | Representation over a commutative ring, group G; no chosen positive generator identification supplied. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:122`, `Rep.FiniteCyclicGroup.groupHomologyIsoOdd` | Existing odd cyclic homology; resolution's inverse-generator convention still needs comparison. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:191`, `groupHomology.d₃₂` | First term uses the inverse group action; with trivial coefficients the two-term positive-chain test has the claimed boundary. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402`, `groupCohomology.H1InfRes_exact` | Discrete representation version; continuous use requires the Tau Ceti interface. |
| `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:358`, `NumberField.Units.rank`; line 456, `finrank_modTorsion` | Number-field hypothesis and removal of torsion before the free-rank calculation. |
| `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:231`, `IsDedekindDomain.selmerGroup.fromUnitLift_injective` | Positive coefficient order, no replacement by arbitrary field-extension injectivity. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`, `not_dvd_discr_iff_isUnramifiedIn` | Number-field/integral-closure setting; discriminant exclusion supplies unramifiedness. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:652`, `Polynomial.separable_cyclotomic` | Field coefficients and nonzero order in that field; separability, not irreducibility. |
| `Mathlib/RingTheory/Smooth/Fiber.lean:245`, `Algebra.Etale.of_formallyUnramified_of_flat` | Finite presentation and flatness are required alongside formal unramifiedness. |
| `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`, `exists_mkₐ_comp_eq_of_isAdicComplete` | Complete-adic lifting; not an arbitrary substitution at a nonnilpotent constant. |
| `Mathlib/RingTheory/Unramified/Basic.lean:161`, `ext_of_iInf` | Formal-unramified uniqueness with the separated ideal intersection condition. |
| `Mathlib/RingTheory/PicardGroup.lean:155`, `Module.Invertible.left`; lines 484,494,502, `Pic.mk_eq_mk_iff`, `Pic.mk_eq_one_iff_free`, `Pic.mk_tensor` | An actual tensor equivalence proves invertibility; local freeness alone does not. |
| `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`, `kummerIso`, `kummerIsoTransport`; lines 890,920, `kummerCor_kummerMap`, `kummerIso_norm` | Positive cocycle σ(α)/α; transport requires equivariance; norm/corestriction compatibility is already supplied. |
| `TauCeti/LinearAlgebra/Eigenspace/JointEigenvector/Basic.lean:368`, `iSup_inf_iInf_eigenspace_unitHom_of_invariant_of_commGroup` | Finite commutative group, roots, and invertibility of group order; cannot average at n=9. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297`, `map_eq_id_of_inner` | Locally compact group, smooth discrete coefficients, actual compatible inner pair. |
| `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164`, `frobeniusAlgEquiv`; lines 178,197,237 | Unramified finite Galois local extension, residue-cardinality power, uniqueness and order. Rational base gives exponent p. |
| `TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean:186`, `fromSUnitLift_injective`, `ker_toClassGroup`, `range_toClassGroup` | S-unit injection is at line 186, kernel equality at 269, and range at 296; the last carries `[NeZero n]`. |

Dependency check output, run against the unchanged package and supplied order:

```text
NOT IN ORDER: HabiroNumberFields (insert it after its last supplier)
depcheck: 7 roadmaps, 43 edges, 1 problem(s)
```

Exit status was 1. There is no UPWARD or CYCLE line. The NOT IN ORDER line is not raised as a defect under this job's rule. The explicit reciprocal dependency in R03 is a manual finding that this output does not detect; no tooling or order file was edited. `TauCetiRoadmap/Chebotarev/README.md:410` supplies the named Layer 10, including finite-set deletion at line 423. The six supplied sibling heads were used for current names and overlap: QWittVectors leaves the generic cyclotomic-completion work to HabiroCyclotomicCompletions, and ColemanIntegrationPartII preserves ColemanIntegration's analytic-polylogarithm ownership. No later sibling is imported by this package.

## Not verifiable

- The exact current sections/signatures of StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.2/K.3/K.7, KTheoryFiniteLocalFields L.2/L.7, HabiroCyclotomicCompletions HC.1/HC.3–HC.5, and PolylogarithmFunctions PF.1/PF.3 are not present in the supplied main/completed trees or the six supplied sibling heads. These names are eligible earlier entries in the merge order; their absence from these readable inputs is recorded as a verification limit, not automatically an ownership finding.
- The five other purported suppliers in R02 have neither an eligible supplied roadmap nor a declared gap. Their exact maps, normalization and hypotheses cannot be certified. This includes the completed-local-K₃ root-symbol presentation, the small finite-field Bloch comparisons, and the Keune quotient injection. Arithmetic finite-product tests do not fill those contracts.
- No Lean elaboration or build was run, as required. The stated instance contexts were inspected in source; the six example proofs and the proposed R04 signature have not been compiler-checked in this pass. In particular the unused `CharZero` section binder on the light half-shift definition was not checked with an elaborator.
- General analytic uniform-tail/phase arguments, higher-order local-isomorphism passages, torsor coherence and arithmetic effective descent were not independently proved. The sources and proposed inputs were inspected. R01 disproves the specific effective-descent identification actually requested, so downstream tensor and line-functoriality conclusions cannot be certified from this package.
- The eta orbit-multiset Check for each n=3,5,7,9,11 was not independently executed. Matrix diagonalization, the cubic boundary, the root-scaling convention, and 53 finite regulator specializations were checked separately.
- No cited work remains unavailable. The earlier BG fetch failure was resolved using the author's Bordeaux copy, and its entry was removed from the scratch missing-reference list. The package itself still lacks the required manifest (R07).

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c15e8c62a9a33f568937941a4fe3ee13a0b33f13", "job": "RT-HabiroNumberFields~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
