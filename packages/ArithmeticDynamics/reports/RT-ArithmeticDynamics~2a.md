# Red-team review of #1335 ArithmeticDynamics at ec203d1 (pass a (codex))

**Verdict:** changes needed

## S01 (P1) — The normal-form scaling uses the inverse conjugator

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:1697`, “conjugating by z ↦ √c z … gives z + 1/z”.

**Claim:** This scaling gives the asserted normal form under the left action fixed in Conventions.

**Witness:** For f(z)=z+4/z and γ(z)=2z, γ∘f∘γ⁻¹=z+16/z. The required conjugator is γ(z)=z/2.

**Exact repair text:** “Choose s with s²=c and conjugate by γ(z)=z/s. Then γ∘f∘γ⁻¹=z+1/z.” Add the c=4 computation as a convention Check. Apply the same correction at line 2512: h(z)=f(z+1)−1 uses γ(z)=z−1, which sends 1 to 0. At line 3912 replace “u⁻¹g(uz)” by “u·g(z/u)” for the stated conjugator z↦uz (test g=z²,u=2).

## S02 (P2) — Nonconstant rational maps need not be surjective on rational points

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:2530`, “For a surjective self-map (in particular a nonconstant rational map)”.

**Claim:** The finite-backward-orbit/grand-orbit equivalence applies to nonconstant rational maps on the point carrier supplied by §0.19.

**Witness:** On ℙ¹(ℚ), f(z)=z² has backwardOrbit(f,2)={2}, whereas its grand orbit contains 2,4,16,256,… . Its rational-point action is not surjective.

**Exact repair text:** “For a surjective self-map, finite backward orbit is equivalent to finite grand orbit. In the rational-map specialization take ℙ¹(K) with K algebraically closed (or separately assume surjectivity on the chosen point carrier). The equivalence is not asserted for arbitrary K-rational points.” Carry this restriction into the proof paragraph and add the ℚ example as a negative Check.

## S03 (P2) — Dynamical Lehmer still drops the higher-dimensional statement

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8559`: “Layer 6 states the ℙ¹ case, which is the case its examples use.”

**Claim:** The roadmap only defines the Lehmer conjecture for rational maps of ℙ¹, while its locator at line 8565 says “The target retains every N ≥ 1.”

**Witness:** bijmst18 lines 1934–1937 quantify over ℙᴺ; the signatures at lines 8569–8570 quantify only over ℙ¹. The explicit restriction in line 8559 contradicts line 8565 and narrows the library to its examples.

**Exact repair text:** “For every N≥1, number field K and degree-d≥2 morphism f:ℙᴺ→ℙᴺ over K, define DynamicalLehmerProperty(f) by ∃C(f)>0, ∀ wandering P∈ℙᴺ(K̄), ĥ_f(P)≥C(f)/[K(P):K]. DynamicalLehmerConjecture quantifies over all such N,K,f. The ℙ¹ statements below are specializations.” Retain the higher-dimensional statement in the README until its carriers exist.

## S04 (P3) — The new arbitrary-characteristic inertia checks are false in small characteristic

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:7104`, “P = x² − u over k[u]: 𝔭 = (u) exactly divides Disc = 4u, and inertia swaps ±√u.”

**Claim:** These are Checks for §5.7, whose standing field hypothesis explicitly allows every characteristic.

**Witness:** In characteristic 2, 4u=0 and +√u=−√u; the extension is inseparable. In characteristic 3, x³−u likewise has zero discriminant and does not give a 3-cycle of distinct roots.

**Exact repair text:** “For char(k)≠2, x²−u has discriminant 4u and inertia at (u) interchanges its two roots. For char(k)≠3, x³−u has discriminant −27u² and inertia is a 3-cycle. In the excluded characteristics these polynomials are inseparable and are negative controls.” Keep the separate characteristic-two Artin–Schreier Check. This is a new error left by the generality repair a-R19.

## S05 (P2) — The one-dimensional André–Oort conjecture is restricted to rational bases

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8994`, “a family over the t-line”; line 9002, “The target states it for families over the t-line”.

**Claim:** The precise one-dimensional conjecture is recorded only for maps over k(t), with rational base substitutions t=φ(s).

**Witness:** bijmst18 lines 1258–1265 allow every nonsingular algebraic base curve. A finite cover such as y²=t⁵−t has genus 2; no rational substitution parametrizes it. Finite base change does not reduce the general statement to k(t).

**Exact repair text:** “Let T be a smooth geometrically integral curve over an algebraically closed characteristic-zero field k, and f a degree-d≥2 rational map over k(T), non-isotrivial in moduli. After a finite cover marking its critical points, DAO(f) asserts that infinitely many PCF fibres are equivalent to pairwise dynamical relatedness of those marks. Define DynamicalAndreOortConjecture over all such T and f. Prove invariance under finite dominant maps of base curves. The t-line examples are specializations.” Extend the §6.50 dependencies to the general curve specialization/height carriers already used in §6.24.

## S06 (P2) — Ingram's general-curve theorem is explicitly excluded from the target

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:9467`, “this is supporting context and is not an extra general-curve formalization claim”.

**Claim:** §6.78 formally supplies only the rational-base special case, despite displaying Ingram's more general conclusion.

**Witness:** ingram-2011-variation lines 48–57 state the divisor-height comparison on a smooth projective base curve; lines 72–82 distinguish the general error term from its ℙ¹ improvement. The exclusion bypasses the general divisor comparison.

**Exact repair text:** “For a number field K, smooth projective geometrically integral curve X/K, f∈K(X)[z] of degree at least two, and P∈ℙ¹(K(X)), construct D(f,P)∈Div(X)⊗ℚ with degree ĥ_f(P), and prove ĥ_{f_t}(P_t)=h_D(t)+O(1) on the good specialization locus, uniformly over algebraic t with absolute heights. Use the supplied curve divisor and Riemann–Roch theory in the local comparison. For X=ℙ¹ deduce the displayed O(1) comparison with ĥ_f(P)h(t).” Register the general comparison as a named target and the rational-base assertion as its corollary.

## S07 (P2) — The Morton coordinate API is confined to ℚ

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:5392`, “All explicit coordinates over ℚ”; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:324–363` hard-code ℚ throughout the seven coordinate definitions and two algebraic identities.

**Claim:** The reusable parametrization and algebraic coordinate comparisons are only planned over the field needed by the rational-cycle application.

**Witness:** morton92 lines 228–234 state the parametrization for char(k)≠2; lines 248–251 give the same symmetric equation. These polynomial/rational identities do not require rational-number arithmetic.

**Exact repair text:** “Define the Morton polynomial and coordinate functions over a field K. State the inverse-parameter identity for char(K)≠2 and t²≠1, and the elliptic-equation polynomial identity for H(t,u)=0 and t+u≠0. Parameterize the corresponding Suggested.lean definitions and identities by K, keeping the rational-cycle exclusion theorem and arithmetic point certificates over ℚ. The displayed ℚ computations are specializations. Do not infer smoothness of the quotient in exceptional characteristics from the polynomial identity.”

## S08 (P3) — Two indispensable classification sources still lack reference entries

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8539`, “Bilu–Tichy classification (Theorem 10.5) and Ritt's equal-common-iterate classification (p.356)”; line 8547 explicitly says GTZ does not reproduce the proof.

**Claim:** The polynomial-classification proof targets cite these primary works without identifying them in References. Neither is one of the specific works repaired for b-R11.

**Witness:** References has no Bilu–Tichy or Ritt entry. ghioca-tucker-zieve-2008 lines 774–775 and 800–801 identify the two works; the README requires their proofs, not merely GTZ's stated consequences.

**Exact repair text:** Add “Y. F. Bilu and R. F. Tichy, The Diophantine equation f(x)=g(y), Acta Arithmetica 95 (2000), 261–288, Theorem 10.5” and “J. F. Ritt, On the iteration of rational functions, Transactions of the AMS 21 (1920), 348–356, p.356” to References and link §§6.23–6.25 to those entries. Preserve the settled maintainer responsibility for manifest registration.

## S09 (P2) — Dickson-polynomial existence is already in the pinned library

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8539`, “The polynomial-decomposition contract includes Dickson-polynomial existence and functional identities”.

**Claim:** The construction contract owns Dickson-polynomial existence without importing the existing general carrier and its proved identities.

**Witness:** At the Mathlib pin, `Mathlib/RingTheory/Polynomial/Dickson.lean:63` defines `Polynomial.dickson` over every commutative ring; lines 122,183 already prove the parameter-one evaluation and composition identities. `Polynomial.dickson 1 a n` is the required first-kind polynomial.

**Exact repair text:** “Use Mathlib's `Polynomial.dickson 1 a n` from `Mathlib/RingTheory/Polynomial/Dickson.lean`, together with `map_dickson`, `dickson_add_two`, `dickson_one_one_eval_add_inv` and `dickson_one_one_mul`. This target extends that API only where needed: prove the general-parameter identity `(Polynomial.dickson 1 (u*v) n).eval (u+v)=u^n+v^n` and the missing parameter-scaling identities on this carrier. Do not reconstruct Dickson polynomials or re-plan the pinned parameter-one identities.” Add the pinned declarations to the supplier contract.

## S10 (P2) — The Bilu–Tichy input stops at the application-specific subcase

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:8543`, “Only the equal-degree necessity is needed.”

**Claim:** §6.25 plans just the equal-degree necessary condition, bypassing the general polynomial-pair classification that its proof uses.

**Witness:** bilu-tichy-2000 lines 1085–1097 give an equivalence without equal degrees, with bounded S-integer denominators and standard or specific pairs. For example, X²=Y³ has infinitely many integer solutions (m³,m²) and is outside the planned scope.

**Exact repair text:** “First prove the general Bilu–Tichy classification for nonconstant F,G over a number field K and a finite set S of places containing the archimedean places. Infinitely many K-solutions with a common nonzero denominator in O_S exist iff F and G factor through one polynomial, separate invertible affine substitutions, and a standard or specific pair whose equation also has infinitely many solutions with bounded O_S-denominators. Define all five standard-pair types and the specific pairs with their parameter conditions from Bilu–Tichy §§1.1,9 and Theorem 10.5. Derive the displayed equal-degree S-integral necessity as a corollary.” Retain the bounded-denominator condition on the residual pair; its shape alone is not the equivalence.

## Verification of the first-pass findings

Here `a-Rnn` and `b-Rnn` identify the two first-pass reports. Line references in this table are to `TauCetiRoadmap/ArithmeticDynamics/README.md`, except those explicitly marked `Suggested.lean`. “Repaired” verifies the original defect, not every independent claim in the surrounding section. Settled out-of-package findings are not re-raised.

| Earlier finding | Status | Repaired passage and locator | Verification witness |
|---|---|---|---|
| a-R01 atomic coordinate invariance | Repaired | 2334: “changes their mutual energy by Σ_x ν({x})η({x})log|γ′(x)|” | δ₀−δ₁ under 2z changes energy from 0 to 2log2, as 2341 now records. Continuous-potential measures have no classical diagonal contribution. |
| a-R02 weak convergence of signed Laplacians | Repaired | 2309: “when their total variations are uniformly bounded” | χ sin(nx)/n tends uniformly to zero while its Laplacians have unbounded total variation; 2319 retains this negative control. Positive fixed-background curvatures have fixed mass. |
| a-R03 missing adelic completion | Repaired | 5596: “Quasi-projective adelic completion and heights”; 5600: “require positive geometric degree” | §4.3a names boundary completion, comparison and intersection targets. yuan-zhang-adelic-v9 lines 1291–1330 and 6607–6612 supply the construction and endpoint hypotheses. |
| a-R04 fictional Berkovich supplier | Repaired | 5628: “supplied by ArithmeticDynamics §§2.2–2.3” | Those sections construct the seminorm carrier and local-degree/potential API. The external nonexistent owner is removed. |
| a-R05 retired Diophantine supplier names | Repaired | 6374: “§0.3 `finite_setOf_absMulHeight₁_le`”; 8926: “§2.4 two-variable specialization” | Main `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:289,364,1143` supplies the height comparison, bounded-degree finiteness and arbitrary characteristic-zero finite-rank unit equation. |
| a-R06 elliptic good reduction in arbitrary coordinates | Repaired | 8154: “an integral model with unit discriminant has good reduction in these coordinates at every residue characteristic” | The model y²+y=x³ has Δ=−27 and doubling resultant 729, including at 2. The scaled model y²+125y=x³ has resultant 729·5²⁴. |
| a-R07 power-map dependency direction | Repaired | 1414: “0.27a The power map”; rational-function-field heights are §0.27b | The constructors now precede Layers 1–2. The explicit linked Needs graph has no later-layer edge. |
| a-R08 arbitrary adelic point-height base change | Repaired | 5952: “Point heights for arbitrary ρ retain the ground field”; 5829: “for this subclass only” | A unit circle centered at i gives h_{ρ,ℚ}(i)=½log2 and h_{ρ,ℚ(i)}(i)=0 after extending the base to ℚ(i). The local-invariance guard removes this counterexample. |
| a-R09 scheme-map classification without owner | Repaired | 1383: “This target constructs the morphism from a base-point-free homogeneous pair and classifies all K-endomorphisms” | §0.26 now owns the Picard/global-sections/generating-sections inputs; constants and identity are included. Stacks Tag 01NE is the generating-sections universal property. |
| a-R10 elliptic height factor two | Repaired | 6781: “`ĥ_{f_E}(x(P))` = `Point.canonicalHeight(P)/[L:ℚ]`” | Pinned `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean`, `Point.canonicalHeight`, uses the full naive x-height limit divided by 4ⁿ, without ½. |
| a-R11 dynatomic comparison/monodromy cycle | Repaired | 5197: “Use §3.66a `dynatomicLocalEquationComparison`”; 5145 lists local monodromy and transversality | The local ideal/Jacobian bridge precedes the independent monodromy conclusion; global integrality is assembled afterward. No SCC occurs in the explicit Needs graph. |
| a-R12 Lech self-dependency | Repaired | 9587: “primitive-root-transport extends the parameter-field map through that root” | §6.86 links §6.28 and §6.51, not itself; integral marks follow from root evaluation and unit denominators. |
| a-R13 zero residue modulus and threshold | Repaired | 8382: “for N ≥ 1”; 8367: “n ≥ 1 + max b_i” | N=0 makes residue reconstruction vacuous; a singleton at max b_i violates periodicity starting at that value. Both guards now survive. |
| a-R14 narrowed Lean endpoints | Repaired | `Suggested.lean:483`: “(p : ℕ) (hp : 2 ≤ p)”; `Suggested.lean:512`: “[Field K] [CharZero K]” | Every p≥2 yields unbounded gaps; affine orbit argument works in the finitely generated coefficient field and then embeds into ℂ. |
| a-R15 missing easy polynomial headlines | Repaired | `Suggested.lean:522`: `polynomialOrbits_commonIterate`; 532: `polynomialLine_returnTimes` | ghioca-tucker-zieve-2008 lines 18–23,83–97 supply the endpoints; Lean keeps equal degree for the first, permits constant polynomials for the second. |
| a-R16 UBC omits dimension | Repaired | 4656: “For integers N ≥ 1, d ≥ 2 and D ≥ 1” | The predicate and monotonicity now retain N. This does not repair the independent Lehmer omission S03. |
| a-R17 obsolete filter arguments | Repaired | 4483: “S.filter (fun x ↦ orbitRepeatsWithin f S (|S| + 1) x)” | The third argument is the natural-number bound, and the last is the starting point, matching §3.11. |
| a-R18 dropped Poonen rank assumption | Repaired | 5544: “Assume rank J(C₁(3₂))(ℚ) ≤ 1”; 5374,5436: “Conditional on rank” | The (3,2) and mixed-cycle consumers carry the same rank condition; the nine-point bound also retains PoonenConjecture. |
| a-R19 arbitrary-characteristic generic arboreal scope | Partly repaired | 8009: “k be any field with (d,char k)≠(2,2)”; §5.61 gives the exceptional image | juul-generic-iterates lines 65–90 support the endpoint split. The expanded arbitrary-characteristic inertia section still has invalid characteristic-2/3 Checks: S04. |
| a-R20 height-bound constants | Repaired | 1862: “upper constant 0 and lower constant −log 2” | For the power lift, the lower generic certificate includes the two-coordinate cardinality; exact doubling is a separate power-height identity. |
| a-R21 absent source manifest | Not repaired; settled | No package `sources.toml`; repair report: “not actionable in this package” | The prior repair was authorized to edit README and Suggested only. That reason is valid; source registration still needs the maintainer, not a re-raised package finding. |
| a-R22 missing easy Checks | Repaired for the listed omissions | `Suggested.lean:391`: “All four sign pairs”; 233: “Integer translation”; 476: “An isolated odd point” | H(±1,±1)=0, H(0,0)=−2; backward translation is infinite; evens∪{1} requires both zero- and positive-step progressions. All now have proved examples. |
| a-R23 nonarchimedean potential falsely constant | Repaired | 5948: “It is harmonic there but not locally constant” | For z²+p⁻² and 1<r<p, escape rate is log p and normalized potential is log p−log r. |
| a-R24 Misiurewicz equation | Repaired | 6546: “gives periodic critical parameters again”; “exact preperiod m and period n” | P_c^(n+1)(0)=P_c(0) forces P_c^n(0)=0; for d=n=2 roots are 0,−1. Strict preperiods require the separate exactness conditions. |
| a-R25 infinity valuation sign | Repaired | §0.27b equates the finite-place degree sum to “log|f|_∞” | For t, the finite divisor has degree 1 and log|t|_∞=1; finite-place logarithms contribute −1, so the product formula holds. |
| a-R26 n=0 discriminant sign | Repaired | 7253: “At n=0 its factor is −4” | Disc(X²+1)=−4. For n≥1 the exponent of −4 is even; the general Lean recursion keeps the sign. |
| b-R01 narrowed affine/power endpoints | Repaired | `Suggested.lean:483,512`, quoted under a-R14 | Same finding as a-R14; both general binders are present. |
| b-R02 quotient-predicate duplication | Repaired | §0.28 imports “IsInvariant”, “IsCategoricalQuotient”, “IsGeometricQuotient” | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2600–2608` owns the predicates. Dynamical GIT quotient existence remains a distinct task, not a duplicate definition. |
| b-R03 multiplier multiplicity Check | Repaired | 4923: “λ = −1, r = 2, B ≡ 3” | In the centered germ g=−z+z², g²−z=−2z³+z⁴, so a(2)=3 and a*(2)=2. |
| b-R04 admitted duplicate doubling result | Repaired | `Suggested.lean:178`: `theorem tateLimit_double ... := by` | Its proof identifies every normalized term with x and uses the constant-sequence limit. There is no admitted duplicate. |
| b-R05 retired DT references | Repaired | 6210,6374,8926, quoted under a-R05 | Actual main declarations and hypotheses match, including arbitrary coefficients after the field embedding. |
| b-R06 RP/SF supplier locators | Partly repaired; remainder settled | 8499: “SchemeAndStackFoundations §0.9 `spreading_out_models`”; Scope names two RP gaps | Main SF:841 has that target. RP outputs remain explicit gaps; the repair report's owner-contract limitation remains valid. No new metadata finding is raised. |
| b-R07 ConformalMapping anchors | Repaired | Supplier contracts cite “Layers, L0” and “Layers, L4” | Main `TauCetiRoadmap/ConformalMapping/README.md:95,118–122` supplies local mapping and analytic continuation/monodromy. |
| b-R08 fictional Berkovich supplier | Repaired | 5628: “ArithmeticDynamics §§2.2–2.3” | Same verified repair as a-R04. |
| b-R09 later-layer power and height constructors | Repaired | “0.27a The power map”; “0.27b Admissible absolute values and heights” | Both constructors now occur before their Layer 1/2 consumers; same repair as a-R07. |
| b-R10 unresolved internal slugs | Repaired for the reported items | Actual linked section owners include §§2.61,3.38,3.40–3.41,3.70,3.82,3.88,5.20,5.29,5.43 | All 1,326 links in explicit Needs lines resolve to headings; their graph has no directed cycle. This is a link/graph check, not certification of every prose dependency. |
| b-R11 missing bibliographic entries | Repaired | References now include “silverman-moduli-1998”, “bijl-2014”, “demarco-faber-degeneration”, “stacks-projective” | All four were fetched legally through the sources service; exact versions are specified. Other unchecked locators remain listed below as uncertified by this pass. |
| b-R12 unprovided ED output | Partly repaired; remainder settled | Scope: “gap:ed-bounded-height-candidates”; 5544: “Explicit hypothesis” | ED completeness is recorded as a supplier contract gap; conditional rank mathematics is an assumption. The prior repair's inability to supply another owner's contract is valid. |

## Lean declaration and instance audit

All 70 declaration blocks are listed below. The scratch inventory retains their complete signatures and section-variable text. The context column records the relevant effective context; unused section variables do not count as hypotheses. “Correct” here is mathematical inspection, not an elaboration result.

| Line / declaration | Layer and context | Instances tried | Result / change |
|---|---|---|---|
| 33: `forwardOrbit` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | id; successor; negative-time exclusion | Orbit starts at n=0 |
| 41: `IsPreperiodicPt` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | identity; quadratic tail; wandering 2 | Positive period is inherited from periodicPts |
| 45: `isPreperiodicPt_iff_finite_forwardOrbit` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | empty carrier; singleton; quadratic tail | Pigeonhole equivalence |
| 49: `isPreperiodicPt_iterate_iff` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | k=0 excluded; k=1,2 | Positive iterate required |
| 53: `isPreperiodicPt_map_iff_of_bijective` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | identity conjugacy; bijection versus collapse | Bijectivity retained |
| 58: `example` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | id; Nat.succ; integer translation | Three conjuncts correct |
| 80: `example` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | 1→0→−1→0 | Exactly three orbit points |
| 99: `example` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | identity on singleton/any type | Period one |
| 104: `example` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | 1→0→−1→0 | Tail length one, period two |
| 108: `quadraticTail_not_periodic` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | same tail | 1 never returns |
| 112: `not_isPreperiodicPt_two_sq_sub_one` | 0: arbitrary Type*; self-maps (equivalence explicit where used) | 2→3→8→63 | Strict escape |
| 116: `isPreperiodicPt_pow_iff_isOfFinOrder` | 0: arbitrary Group G; d≥2 | trivial group; infinite cyclic group; d=1 excluded | Finite order iff eventual equality of powers |
| 133: `tateLimit` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | zero height; a=0,1,2 | Real limUnder is total; convergence is separate |
| 137: `tendsto_tateLimit` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | doubling; stationary orbit; a=1 excluded | Geometric-series convergence |
| 143: `abs_tateLimit_sub_le` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | C=0; P exists forces C≥0 | Denominator a−1 positive |
| 148: `tateLimit_apply` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | doubling; constant map | Shifted limit gives factor a |
| 153: `eq_tateLimit_of_bounded` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | bounded perturbation; empty S | Uniqueness by expansion |
| 159: `tateLimit_eq_zero_iff` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | finite A; infinite zero-height A without Northcott | MapsTo and Northcott are explicit |
| 166: `tateLimit_elliptic_doubling` | 1: Field F; AdmissibleAbsValues F; DecidableEq F; W.IsElliptic | zero/torsion; positive x-height | Full native x-height, no half |
| 173: `example` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | a=0 and zero numerator | Total real division yields zero |
| 178: `tateLimit_double` | 1: ℝ with native topology/uniformity | x=0,1,−1 | Every term equals x; named proof present |
| 195: `tateLimit_id` | 1: S:Type*, φ:S→S, h:S→ℝ, a:ℝ; theorem hypotheses explicit | h(P) negative/zero/positive | h(P)/2ⁿ→0 |
| 198: `not_tendsto_tateSeq_one` | 1: ℝ with native topology/uniformity | successor at zero; expansion one | Sequence n diverges |
| 211: `backwardOrbit` | 2: arbitrary Type*; self-maps (equivalence explicit where used) | identity; translation | Includes zeroth inverse image |
| 215: `exceptionalSet` | 2: arbitrary Type*; self-maps (equivalence explicit where used) | identity; translation; z² on ℚ | Finite-backward predicate; S02 concerns prose only |
| 219: `backwardOrbit_conjugate` | 2: arbitrary Type*; self-maps (equivalence explicit where used) | identity; translation conjugacy | Induction through equivalence |
| 224: `example` | 2: arbitrary Type*; self-maps (equivalence explicit where used) | identity | Singleton |
| 229: `example` | 2: arbitrary Type*; self-maps (equivalence explicit where used) | identity | Every singleton is finite |
| 234: `example` | 2: ℤ | a−n for n∈ℕ | Infinite subset in every backward orbit |
| 257: `classicalFatou` | 2: UniformSpace X; Y uniformity explicit for conjugacy | identity; constant; doubling | Local uniform equicontinuity definition |
| 264: `classicalJulia` | 2: UniformSpace X; Y uniformity explicit for conjugacy | identity versus doubling | Complement convention |
| 267: `classicalFatou_uniformConjugate` | 2: UniformSpace X; Y uniformity explicit for conjugacy | uniform equivalence and inverse | Both uniformities retained |
| 272: `isOpen_classicalFatou` | 2: UniformSpace X; Y uniformity explicit for conjugacy | arbitrary uniform space; empty carrier | Union of open witness neighborhoods |
| 276: `example` | 2: UniformSpace X; Y uniformity explicit for conjugacy | identity iterates | Same entourage works for every n |
| 288: `classicalFatou_const` | 2: UniformSpace X; Y uniformity explicit for conjugacy | id plus one constant map | Finite uniformly continuous family |
| 292: `classicalJulia_realDoubling` | 2: ℝ with native topology/uniformity | two distinct points in every interval | Distances grow as 2ⁿ |
| 299: `local instance` | 2: OnePoint ℂ; local compatible compact uniformity | compact complex sphere | Real body uniformSpaceOfCompactR1 |
| 302: `exceptionalSet_complexPower` | 2: OnePoint ℂ; local compatible compact uniformity | d=2; a=0,∞,1 | Only zero/infinity have finite backward orbit |
| 310: `classicalJulia_complexPower` | 2: OnePoint ℂ; local compatible compact uniformity | inside/outside/on unit circle | Standard power Julia set |
| 324: `mortonThreeCycleEquation` | 3: ℚ; pole/curve hypotheses explicit in identities | four signs; (0,0); symmetric pair | Correct polynomial; generality S07 |
| 329: `mortonThreeCycleParameter` | 3: ℚ; pole/curve hypotheses explicit in identities | three marked cycle points | 3,−3,0; generality S07 |
| 332: `mortonThreeCycleInversePoint` | 3: ℚ; pole/curve hypotheses explicit in identities | t=3; t=±1 excluded | 5/4; totalized poles guarded; S07 |
| 336: `mortonThreeCycleInverseCoefficient` | 3: ℚ; pole/curve hypotheses explicit in identities | t=3; t=±1 excluded | −29/16; S07 |
| 342: `mortonThreeCycleRotation` | 3: ℚ; pole/curve hypotheses explicit in identities | 3→−3→0→3; t=1 pole | Order-three marking action; S07 |
| 346: `mortonCycleTrace` | 3: ℚ; pole/curve hypotheses explicit in identities | t=3,−3,0 | Trace zero; S07 |
| 350: `mortonEllipticCoordinates` | 3: ℚ; pole/curve hypotheses explicit in identities | (−1,−1); (1,−1) | Affine-domain guard essential; S07 |
| 355: `mortonThreeCycleParameter_inverse` | 3: ℚ; pole/curve hypotheses explicit in identities | t=0,±3; t²=1 excluded | Inverse identity; S07 |
| 360: `mortonEllipticEquation` | 3: ℚ; pole/curve hypotheses explicit in identities | H=0; t+u=0 excluded | Residual=(t+u−2)H/(t+u)^4; S07 |
| 368: `atMostOneRationalThreeCycle` | 3: ℚ; pole/curve hypotheses explicit in identities | three markings of −29/16 | Same-cycle conclusion matches Morton |
| 374: `example` | 3: ℚ; pole/curve hypotheses explicit in identities | 5/4,−1/4,−7/4 | Parameters 3,−3,0 |
| 381: `example` | 3: ℚ; pole/curve hypotheses explicit in identities | t=3 | Point 5/4 and coefficient −29/16 |
| 386: `example` | 3: ℚ; pole/curve hypotheses explicit in identities | 3,−3,0 | Rotation and trace checks |
| 392: `example` | 3: ℚ; pole/curve hypotheses explicit in identities | four signs and origin | H=0 versus −2; quotient (0,0) |
| 402: `example` | 3: ℚ; pole/curve hypotheses explicit in identities | (1,−1) versus (−1,−1) | Total division explains excluded domain |
| 407: `noRationalFourCycle` | 3: ℚ; pole/curve hypotheses explicit in identities | c=0,−1; period zero convention | No exact four-cycle |
| 411: `noRationalFiveCycle` | 3: ℚ; pole/curve hypotheses explicit in identities | c=0,−1; period zero convention | No exact five-cycle |
| 415: `relativeHeightCandidateBound` | 3: Field K; NumberField K; B,D:ℝ | degree one versus degree two | Absolute bound needs exp([K:ℚ]B) |
| 422: `nativeHeightCandidateBound` | 3: Field K; NumberField K; B,D:ℝ | native bound zero/positive | Native bound needs exp(B) |
| 436: `discr_iterate_sub_succ` | 5: Field K,L; Algebra K L; IsAlgClosed L; degree nonzero in K | d=1; n=0; f=X²+1; nonmonic quadratic | Sign and leading coefficient retained |
| 457: `IsFiniteUnionAP` | 6: S:Set ℕ; finite natural-step progressions | empty; singleton; evens∪{1} | Zero step intentionally permitted |
| 461: `isFiniteUnionAP_iff_eventually_periodic` | 6: S:Set ℕ; finite natural-step progressions | empty; singleton; periodic residues | Eventually positive period |
| 465: `example` | 6: S:Set ℕ; finite natural-step progressions | {3,7}; ∅; ℕ | Witnesses correct |
| 477: `example` | 6: S:Set ℕ; finite natural-step progressions | evens∪{1} | Both zero and positive steps used |
| 483: `not_isFiniteUnionAP_powers` | 6: S:Set ℕ; finite natural-step progressions | p=2,3; p=1 excluded | Unbounded gaps exclude eventual periodicity |
| 487: `primitiveRootTransport` | 6: Fields F,L,E; Algebra F L; integral primitive generator; ring map e | degree-one extension; ℚ(√2)→ℚ₇ | Root and generator determine unique map |
| 494: `lechIntegralAssembly` | 6: Field L; Algebra ℚ L; Algebra.EssFiniteType ℚ L | L=ℚ; empty marks; marks 0 and 1/6 | EssFiniteType and arbitrarily large p explicit |
| 501: `rittCommonIterate` | 6: Polynomial ℂ; degree F>1; n>0 | n=1; monomial s=0; ±X² and ±X³ | Geometric-sum condition distinguishes parity |
| 512: `linearSynchronizedIntersection` | 6: Field K; CharZero K; a,c≠0; infinite common values | equal translations; root-of-unity slopes | Infinite distinct values is necessary |
| 522: `polynomialOrbits_commonIterate` | 6: Field K; CharZero K; polynomial maps; endpoint-specific guards | same polynomial; unequal degree excluded | Equal-degree/nonlinear hypotheses retained |
| 532: `polynomialLine_returnTimes` | 6: Field K; CharZero K; polynomial maps; endpoint-specific guards | constant maps; vertical/horizontal line; empty hits | Nonzero line coefficient and char zero explicit |

## Adversarial README pass

The running bold-name inventory contains all 820 occurrences, with their section and line. Of these, 459 are entries in the existing-library catalogue; 361 are in the roadmap body. The following table records the mathematical family checks rather than treating a successful text search as a proof of a target.

| Statement family | Instances tried | Result | Change |
|---|---|---|---|
| Forward orbits, eventual periods and power maps | Empty carrier, identity, constant, successor, tail 1→0→−1; d=0,1,2; trivial and infinite cyclic groups | Positive-period and positive-iterate restrictions distinguish the cases. | None |
| Binary resultants and homogeneous lifts | Degree 0; zero ring; zero form; identity; swap matrix; singular matrix; monomial lift | Formal degrees and degree-zero resultant 1 avoid ordinary-degree ambiguity. Nonzero-field lift conditions exclude a zero pair. | None |
| Rational maps and point actions | Constant, identity, Frobenius, finite base field, z² on ℚ | Rational-point action need not be surjective. | S02 |
| Conjugation and local coordinates | z+4/z under 2z; translation of the point 1; z² germ under 2z | Three prose formulas use the inverse of the declared left conjugator. | S01 |
| Scheme/projective comparisons | Constants, identity, base-point pair, finite-field point agreement | Scheme morphisms cannot be inferred from equality of finite sets of rational points. The new line-bundle/section prerequisites are explicitly owned. | a-R09 repaired |
| Global heights and Tate limits | Expansion 0,1,2,4; zero/negative initial heights; empty S; non-Northcott invariant set | Expansion and Northcott hypotheses are explicit; no 0/0 enters a convergence conclusion. | None |
| Height normalizations | ℚ versus ℚ(i); inert 3; rational-function t; elliptic doubling | Native/absolute field-degree factors and full x-height normalization agree. The infinity product-formula sign is repaired. | a-R10,a-R20,a-R25 repaired |
| Good reduction and inseparability | Degree-one identity; Frobenius in characteristic 2; integral Weierstrass model at 2; bad scaled coordinates at 5 | Good reduction is a coordinate/model condition; full algebraic degree remains distinct from separable degree. | a-R06 repaired |
| Escape rates | Monomial lift, scalar 2 times a lift, zero vector excluded, good reduction, ramified local absolute-value scaling | Scaling by log\|c\|/(d−1) and full-degree iteration are consistent. | None |
| Fatou/Julia and analytic carriers | Identity, constant, real doubling; z^d on the complex sphere; nonarchimedean Gauss singleton; pure Frobenius | Classical and Berkovich carriers are distinguished; compactness is not assigned to the classical p-adic point set. | None |
| Laplacians and local energy | Zero measure, Gauss atom, δ₀−δ₁, smooth oscillatory potentials | Atomic coordinate correction and total-variation guard are necessary and now stated. | a-R01,a-R02 repaired |
| Dynatomic multiplicity | n=0,1,2; multipliers 0,1,−1; characteristic p; z²−3/4 at −1/2 | Formal period two has multiplicity 2 although no new exact two-cycle occurs in this example. | b-R03 repaired |
| Periodic equations and exact filtering | Empty candidate set; missing start; repeated orbit; finite superset versus exact cutoff | The finite-segment predicate and its pigeonhole bound are mathematical criteria on an arbitrary type. | a-R17 repaired |
| Morton coordinates | Four sign pairs, origin, t=0,±1,±3, t+u=0; characteristic 2/7 | Algebraic identities and pole guards work over ℚ; coordinate API unnecessarily narrows the source's characteristic range. | S07 |
| Rational-cycle arithmetic | Quadratic three-cycle; four-/five-cycle exclusions; (3,2) tail; rank-dependent nine-point bound | The displayed rank assumption survives into the consumers. Exact supplier certificates remain subject to unavailable-head limitation below. | a-R18 repaired |
| Quasi-projective adelic theory | A¹⊂ℙ¹ with boundary D versus 2D; projective comparison; moving t over k(t); zero geometric degree | The completion is now owned; normalized heights require a nonzero degree denominator. | a-R03 repaired |
| Adelic measure base change | Centered circle at i; splitting of the orbit {i,−i}; locally invariant dynamical measures | Arbitrary point heights must retain the ground field. | a-R08 repaired |
| Equidistribution | Empty finite set excluded; repeated finite set; roots of unity; generic versus subvariety-contained sequence | Cardinality and genericity assumptions prevent the immediate counterexamples. | None |
| Arboreal towers and inertia | n=0,1,2; quadratic characteristic 2; x²−u and x³−u; repeated-root specialization | Generic theorem now retains the exceptional image; two test polynomials lose separability in small characteristic. | S04 |
| Discriminants and Kummer signs | Linear polynomial; X²+1 at n=0; positive-level quadratic recurrence; nonmonic leading coefficient | The negative first factor and leading-coefficient correction are present. | a-R26 repaired |
| Conjectural endpoints | N=1 versus N=2 for UBC and Lehmer; constant versus non-isotrivial family; positive-genus base | UBC retains N; Lehmer and André–Oort retain unjustified restrictions. | S03,S05 |
| Lech–Cassels | No parameters; empty marks; marks 0 and 1/6; degree-one extension; ℚ(√2) embedded in ℚ₇ | Independence is different from specializing to an integer; primitive-root transport and unit denominators supply integral marks. | a-R12 repaired |
| Arithmetic progressions | Empty set, singleton, evens∪{1}, p^n, zero residue modulus | Zero-step progressions are needed; reconstruction uses a positive modulus and threshold beyond singleton offsets. | a-R13 repaired |
| Equal iterates and orbit intersections | n=1; monomial support s=0; ±z² versus ±z³; constant polynomial; vertical/horizontal line | Root-of-unity parity and nonzero-line guards are retained in the signatures. | None |
| Polynomial-pair classification | Unequal degrees X²,Y³; fixed versus varying denominator; Dickson n=0,1,2 and parameter 0,1 | General classification is narrowed to the route; the basic Dickson carrier already exists. | S09,S10 |
| Families and specialization | Constant mark 2; moving mark t; torsion section; general projective base curve | Call–Silverman general-curve target is present, but Ingram's divisor comparison is explicitly restricted. | S06 |
| Lattès and common torsion images | O, 2-torsion, n divisible by residue characteristic, t=0,1,−1; identical versus distinct branch sets | Algebraic construction avoids an unnecessary exclusion of residue characteristic 2; Legendre presentation itself excludes characteristic 2. | None |

## Verified sound

**Coverage counts:** 10,882 README lines and all 537 Suggested.lean lines read; 503 numbered target sections and 820 bold-code occurrences inventoried; 70 Lean declaration blocks (15 definitions, 38 named theorems, 16 examples, one local instance) inspected. All 38 earlier findings have an individual disposition above. The source table below records 30 locator/hypothesis checks; these are not a certification of every citation in the document. Checks: all 16 proved Lean example blocks inspected mathematically, plus 15 independently executed exact-arithmetic check groups. No Lean build or elaboration was run.

**Source locator checks:** the following locators were compared with the service's line-numbered text. Missing displayed mathematics in the Call–Silverman extraction is qualified below.

| Source | Locators checked | Line witnesses |
|---|---|---|
| ms95 | Theorem 3.1; Proposition 3.2 | ms95 lines 407–447 |
| call-silverman-1993 | Theorem 1.1; Proposition 1.2; Theorems 3.1,4.1 | call-silverman-1993 lines 132–164,216–237,410–428,552–584 |
| mcmullen-1987 | Theorem 2.2; Corollary 2.3 | mcmullen-1987 lines 219–237 |
| bijmst18 | Conjectures 4.2,11.6,16.2 | bijmst18 lines 336–343,1258–1265,1934–1937 |
| juul-generic-iterates | Theorems 1.1,3.1,5.1,5.3 | juul-generic-iterates lines 65–90,353–359,661–677,695–699 |
| morton92 | Theorems 3,4,5 | morton92 lines 137–142,228–251 |
| morton98 | Theorem 4 | morton98 lines 175–184 |
| ghioca-tucker-zieve-2008 | Theorems 1.1,1.4,1.5 | ghioca-tucker-zieve-2008 lines 18–22,83–97 |
| ingram-2011-variation | Theorem 1; Corollary 2 | ingram-2011-variation lines 48–57,72–82 |
| yuan-zhang-adelic-v9 | Lemma 2.4.1; Proposition 3.5.1; Theorem 5.4.3 | yuan-zhang-adelic-v9 lines 1291–1330,3105–3125,6607–6612 |
| stacks-projective | Tag 01NE | stacks-projective lines 1267–1288 |
| bilu-tichy-2000 | Theorem 10.5 | bilu-tichy-2000 lines 1040–1047,1085–1097 |
| ritt-1920 | p.356; preceding scope on p.353 | ritt-1920 lines 230–237,319–352; formula OCR qualified below |

**Pinned libraries:** files were fetched at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, after object searches. The verified interfaces include `Function.periodicPts` (positive period), `UniformEquicontinuousOn`, `Height.logHeight_eval_le`, `Height.logHeight_eval_ge`, the power-basis/root-evaluation interface, the full native `Point.canonicalHeight` definition, and `Polynomial.dickson` with its first-kind parameter-one identities. The files read were `Mathlib/Dynamics/PeriodicPts/Defs.lean`, `Mathlib/Topology/UniformSpace/Equicontinuity.lean`, `Mathlib/NumberTheory/Height/MvPolynomial.lean`, `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean`, `Mathlib/RingTheory/PowerBasis.lean`, `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean`, and `Mathlib/RingTheory/Polynomial/Dickson.lean`.

**Supplier checks:** ten section contracts checked on the supplied main tree: DiophantineApproximationAndTranscendence §§0.2,0.3,2.4; SchemeAndStackFoundations §§0.9,1.17; ConformalMapping L0,L4; HeightsAndUnits §1.1; ClassicalArithmeticCompletion §6.37; RestrictedPowerSeries §2.4. Sibling citations checked: zero to ErdosProgressionPowers; object searches of its supplied head found no competing arithmetic-dynamics target. Main/Completed searches by dynatomic, arboreal, preperiodic, Berkovich, adelic-intersection and critical-height objects were also performed; they do not certify every supplier contract.

**Policy:** the outside-folder diff is empty. Suggested.lean uses one `import Mathlib` and the actually used Tau Ceti height module, the required namespace, and 537 lines. No `set_option`, `lemma` declaration, admitted example or admitted data definition occurs. Its heavy geometric/analytic headlines remain README targets. The two previously missing easy polynomial endpoints now have signatures. The finite orbit predicate is stated without a computability requirement; no algorithmic proof obligation was inferred merely from its use of a finite set.

**Dependency checker output:**

```text
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. Separately, all 1,326 explicit internal Needs links resolve to one of the 664 third-level headings. Their graph has no directed cycle or later-layer edge. The graph scan covers linked Needs clauses; it is not evidence that every unlinked proof-plan input is supplied. No move to a later supplier is proposed.

The scratch inventories are `lean-declarations.tsv`, `bold-targets.tsv`, `arithmetic-checks.py`, `arithmetic-checks.txt` and `worklist.md`. The exact-arithmetic groups include the Morton inverse and symmetric/elliptic identities, marked three-cycle and rotation, conjugation counterexample, Legendre t=−1 value, periodic-critical equation, and small-characteristic discriminants. Finite grids test the algebraic formulas; they are not substituted for proofs of polynomial identities.

## Not verifiable

- **Lean elaboration:** prohibited by the brief. Contexts, signatures and proof text were inspected; no claim is made that a new `#check` or build succeeded.
- **Unavailable supplier heads:** the supplied main/Completed and sibling inputs do not provide readable current folders for HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods, InverseGaloisAndArithmeticFundamentalGroups or ArakelovGeometryAndAbelianHeights. RP.0/RP.4, ED.0/ED.3/ED.4, IG.2 and the general adelic supplier interfaces remain uncertified against their heads. Merge-order permission is not signature verification. This absence is not itself raised as a defect.
- **Other supplier contracts:** AlgebraicCurves, FuchsianOrbifolds, ComplexManifolds, ModularCurves, PolynomialGaloisGroups, LocalGaloisGroups, PDE and NumberFieldArithmetic were not independently certified target by target. Object searches do not rule out all duplication or all unowned proof leaves.
- **Source waivers remain settled:** `poonen-corrected-descent-certificates`, `forster-riemann-surfaces`, `Zieve1996`, `stoll-1992-quadratic-iterates`, `silverman-moduli-book-2012` and `tate-1983` are waived in the supplied board manifest. No new missing-text request is made for them. In particular, the corrected Poonen rank-upper-bound computation is still not supplied as a verifiable calculation here; its consumers now carry the rank assumption.
- **Extraction limitations:** the Call–Silverman text omits several displayed formulas, including the exact displays after Theorems 1.1,3.1,4.1 and Proposition 1.2. Their locators, surrounding hypotheses and proof arguments were checked, but the missing displays were not independently visually certified. Ritt p.356 was located and its classification prose read, but the extraction corrupts several exponents; the precise equal-iterate formula is checked against GTZ, not claimed visually certified from the 1920 page.
- **Remaining bibliography and pinned catalogue:** legal fetching is not theorem verification. Only the locator checks and pinned interfaces explicitly listed above are certified by this pass; the other source locators, source corrections and catalogue entries remain unverified individually. Likewise, the numerical README Checks beyond the recorded exact-arithmetic groups and mathematical boundary audit were not all independently recomputed.
