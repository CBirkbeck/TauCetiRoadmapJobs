# Review of HilbertModularForms (pull request #1724 at 51d3991)

**Verdict:** needs changes

## R01 (P1) — Positive coefficients do not detect weight-zero constants

**Location:** TauCetiRoadmap/HilbertModularForms/Suggested.lean:583; TauCetiRoadmap/HilbertModularForms/README.md:460 (`coeff_injective`).

**Claim:** Injectivity is asserted on the full tuple space, for every weight, with no constant-term coordinate.

**Witness:** Over ℚ(√5), at nonzero level and weight 0, the forms 1 and 0 have identical positive ideal coefficients, all zero; their constant terms are 1 and 0.

**Repair:** Retain constant terms in the full expansion map. State positive-coefficient injectivity separately with the hypotheses that exclude constants, or on cusp forms. The full map now separates these two forms by 1 ≠ 0; add this negative control. Carry degree and nonzero-level hypotheses explicitly where needed.

## R02 (P1) — The negative-weight Lean theorem admits zero level

**Location:** TauCetiRoadmap/HilbertModularForms/Suggested.lean:620 (`modularForms_eq_bot_of_top_neg`).

**Claim:** The README assumes nonzero levels, but this signature quantifies over every ideal.

**Witness:** Take F=ℚ(√5), level ⊥, b=O, parallel weight −2. Every group matrix is upper triangular with unit diagonal. The slash of 1 is N(det)^(−3)N(d)^2=1, so 1 is a nonzero form.

**Repair:** Add the explicit nonzero-level hypothesis, as the three finite-dimensionality statements already do. The refuting level is then excluded; the unit level remains included. Audit the other statements using reduction or commensurability for the same omitted condition.

## R03 (P1) — Representative transport changes the claimed invariant coefficients

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:436 and :462.

**Claim:** The raw arithmetic slash transport is declared to preserve the normalized ideal coefficients and every subsequent invariant.

**Witness:** Put R′=(2)R over a quadratic field. For g=f slash diag(1,2)⁻¹, a′(2μ)=∏2^(1−m_w)a(μ). Thus c(m,g)=4c(m,f), not c(m,f).

**Repair:** Use transport N(α)⁻¹ times the displayed slash, or revise the coefficient definition with the compensating representative norm and propagate that convention through Hecke operators and pairings. With normalized transport the example becomes (4/4)c=c; a totally positive unit still gives factor 1. A check only using R=R misses this defect.

## R04 (P1) — The bad-prime Hecke set contains the extra good-prime coset

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:638 and :702.

**Claim:** The set defined using only integrality, index and the lower-left congruence is claimed to have q cosets at a level-dividing prime, and to give the U coefficient formula.

**Witness:** For F=ℚ(√5), b=c=O, level p=(2), q=4, it contains diag(2,1) and all four matrices [[1,a],[0,2]], a mod 2. These five left cosets are distinct.

**Repair:** At primes dividing the level impose the usual upper-left unit condition on the Hecke semigroup, including the corresponding condition between components. Define the central S action separately. The corrected set has four cosets and gives c(mp); the original extra coset contributes 4^(k₀−1)c(m/p). Recheck §5.3 at bad prime powers as well.

## R05 (P1) — The lattice has rank 2n over ℤ

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:324 (`free of rank 2 over ℤ`).

**Claim:** The asserted rank is incompatible with spanning F² over ℚ.

**Witness:** For F=ℚ(√5), b=O and w=(1+√5)/2, (1,0),(w,0),(0,1),(0,w) are a ℤ-basis. The rank is 4, while the target says 2.

**Repair:** Replace the ℤ-rank by 2[F:ℚ]. Keep rank 2 over O as a projective-rank statement, not a freeness assertion for nonprincipal b. The quadratic test then gives 4 on both sides.

## R06 (P1) — Siegel finiteness and the height bound use the wrong ambient objects

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:507.

**Claim:** The overlap set is asserted finite in Γ itself, and the height bound is asserted after moving the cusp to its original position.

**Witness:** For ε=(3+√5)/2, every ε^j I lies in Γ and fixes all points. Also S(it)=i/t, so heights in the Siegel set transported to cusp 0 tend to 0.

**Repair:** State overlap finiteness in the projective image, modulo the ineffective central units. State the positive height bound on γκ⁻¹𝔖κ, in cusp coordinates. The infinite family becomes one projective element; the inverted example has cusp-coordinate height t, not 1/t.

## R07 (P1) — The weight-two Eisenstein coefficient bound is false

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:616; also the proposed proof at :536.

**Claim:** The sharper bound O(Nm^(k−1)) is asserted for every form including weight-two Eisenstein series. The earlier proof also claims boundedness of |f|N(y)^k on a Siegel set.

**Witness:** For the stated E₂ over ℚ(√5), c(m)=120σ₁(m). For squarefree m, c(m)/Nm=120∏(1+1/Np), unbounded. Moreover E₂(it,it)→1, whereas N(t,t)^2=t⁴.

**Repair:** Keep the exact divisor-sum estimate; at k=2 use Oε(Nm^(1+ε)) or another justified logarithmic bound. For even k≥4, the convergent ζ_F(k−1) bounds the divisor sum. Replace the general-form proof with an actual coefficient estimate. For prime norms 4,5,9 the weight-two ratio is 200, and it continues growing; the corrected σ₁ bound is equality.

## R08 (P1) — Uniqueness of the twisting character rules out the CM examples

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1112.

**Claim:** The character χ in an inner twist is claimed to be determined by σ, immediately before CM is defined by a nontrivial twist with σ=id.

**Witness:** For any listed CM form, (id,1) and (id,χ_CM) both satisfy the coefficient identity. At inert primes both sides are 0; at split primes χ_CM=1.

**Repair:** State uniqueness modulo the self-twist group, or uniqueness under a non-CM hypothesis. Define the group of pairs with its projection and kernel. The CM test then has two distinct characters in the identity fibre, as required.

## R09 (P1) — The inducing-character value field need not be the newform field

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1152.

**Claim:** The coefficient field of θξ is identified with the field generated by all individual values of ξ.

**Witness:** Base-change y²=x³−x to ℚ(√5). Its traces remain rational, but the CM inducing values above norm 5 are −1±2i. Their sum is −2; their value field contains i.

**Repair:** Use the field generated by the norm-fibre sums (equivalently the induced traces and the relevant coefficients), and only assert containment in the character value field. The example gives ℚ for the newform and ℚ(i) for the inducing values. AutomorphicGaloisRepresentations §3.15 supplies the trace calculation.

## R10 (P1) — The split-prime Doi–Naganuma operator rule doubles the eigenvalue

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1236.

**Claim:** The claimed correspondence sends T_p to T_𝔭+T_𝔭′, although both Hilbert eigenvalues were defined to equal b(p).

**Witness:** The roadmap’s D=29, p=5 example has b(5)=−3 and c(𝔭₅)=c(𝔭₅′)=−3. The proposed sum acts by −6, rather than −3.

**Repair:** State the compatibility with each split-prime operator separately (or explicitly use half their sum on the base-change image). The corrected action is −3. Preserve the inert and ramified formulas; they are different formulas, not a single linear Hecke-algebra assignment.

## R11 (P1) — The Brandt trace subtraction ignores nontrivial norm characters

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1287.

**Claim:** Every norm-factoring form is subtracted as if its eigenvalue were q+1.

**Witness:** dembele-voight line 2191, Example 8.1, printed p.44: at norm 4 the Brandt matrix has trace 0, the norm part has dimension 2, and both cusp eigenvalues are 0. The formula gives −10.

**Repair:** Subtract the trace on the norm-factoring subspace: (q+1)Σχ χ([p]), with the actual characters occurring, or use its matrix directly. Here the eigenvalues are 5 and −5, so 0−(5−5)=0. At the norm-13 principal-class example, 36−2·14=8 agrees with 4+4. Do not repair this by assuming narrow class number one.

## R12 (P1) — An earlier roadmap already owns the parallel-weight analytic foundations

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:59 and Layers 0–5.

**Claim:** The ownership list reconstructs parallel-weight form spaces, slash actions, cusp expansions, normalized ideal coefficients and Hecke operators without importing their earlier owner.

**Witness:** TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2287, §F.5, explicitly owns these objects for every totally real field, every component, congruence level and compatible finite-order character; it also retains constant and representative factors.

**Repair:** Import §F.5 by object and convention. Specify only the genuine extensions here, such as nonparallel weights and the additional analytic/dictionary theorems, with comparison targets to the supplied carriers. The parallel weight-2 test must then use one form carrier and one ideal-coefficient map, rather than two independently normalized ones. This is repairable overlap, not a reason to discard the genuinely additional scope.

## R13 (P1) — The adelic supplier citations do not supply the claimed generality

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:110, :829 and :1148.

**Claim:** R16.6.2 is used as Hilbert local newvector theory and R17.5.1 as algebraic-character automorphic induction.

**Witness:** TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:1262 restricts R16.6.2 to classical forms over ℚ. At :2241, R17.5.1 assumes finite image and gives weight one; general quadratic induction is R17.4.16 at :2127.

**Repair:** Use R16.2 and the appropriate general local-factor targets, and explicitly own the Hilbert adapter. Repoint induction to R17.4.16 with its central-character, infinity-type and cuspidality conditions. A character of infinity type (1,0) fails the finite-order contract but satisfies the general induction contract when distinct from its conjugate. It must no longer be passed to the Artin target.

## R14 (P1) — The rationality proof cites absent sections and a stronger structure than supplied

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:925.

**Claim:** B4.18/B4.9/B5.13/B5.16 are used to claim a Hecke-stable integral ℤ-structure and a ℚ-structure on each fixed-weight space.

**Witness:** TauCetiRoadmap/AutomorphicBundles/README.md:4358, §11.18, supplies H⁰ base change over a defining field L. It does not supply the asserted integral Hecke lattice. The cited B4/B5 target numbers are absent.

**Repair:** Resolve the comparison to §11.9, rational base change to §11.18 and Hilbert expansions/principle to §§12.17–12.19. Name an actual owner or a precise declared supplier gap for the integral Hecke statement. Retain the weight’s field of definition and transport the labeled weight under embeddings; do not infer ℚ descent from L-base change. For a quadratic field, swapping embeddings sends weight (2,4) to (4,2), so the two weights must not be silently identified.

## R15 (P1) — Potential modularity is not modularity over the original field

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1361.

**Claim:** The existence of an attached form over F for every E/F in the stated range is said to be supplied by PotentialModularityAndCompatibleSystems.

**Witness:** TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:8 and §12.5 distinguish potential modularity over larger fields from full modularity lifting. No cited section supplies the claimed real-quadratic elliptic modularity theorem over the original F.

**Repair:** Cite the exact owner and theorem for each unconditional base-field case, or declare the precise missing contract. Keep the general attachment comparison conditional on an actual modularity witness. For an output over F′≠F, the corrected interface returns a form over F′ and does not invent descent to F. Also name the curve’s full local-factor/card comparison needed for the final EqOffZero statement.

## R16 (P1) — The recorded push gate fails

**Location:** TauCetiRoadmap/HilbertModularForms/Suggested.lean:1.

**Claim:** The supplied gate has build=1 and FAIL, even though ordinary Lean elaboration succeeds.

**Witness:** The gate reports that Mathlib uses the module system and this file does not. All other recorded gate counters are zero; this is a build-gate failure, not a mathematical counterexample.

**Repair:** Add the module header and rerun the targeted build and gate. A scratch copy with only that header added elaborates with the original sorry warnings; no worktree change was made. Keep the imports within the permitted form. The passing scratch elaboration does not substitute for a passing push gate on a repaired head.

## R17 (P2) — Multiplicity one needs an occurring eigensystem

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:822.

**Claim:** An arbitrary list λ is assigned a cuspidal πλ and a divisor-count dimension, without assuming its eigenspace is nonzero.

**Witness:** Over ℚ(√5), weight 2 and unit level, S₂=0 (dembele-voight line 1357, Example 6.3, p.28). Every simultaneous eigenspace is 0; no πλ of conductor dividing level 1 exists.

**Repair:** Assume the good eigensystem occurs in a nonzero cusp form, then construct πλ and prove its conductor divides the level before taking the integral quotient ideal. In the example the occurrence hypothesis is false, instead of predicting the one divisor of the unit ideal and dimension 1.

## R18 (P2) — The character restriction leaves the promised general twist and CM theory unsupported

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:207, :1078 and :1138.

**Claim:** The form spaces deliberately exclude finite ramified central characters, hence twists with ramified χ². Nevertheless §9.3 claims induction for arbitrary algebraic ξ into these same spaces.

**Witness:** Twist a trivial-central-character newform by a ramified character χ of order 3. Its central character is χ²≠1 on local units, so it has no K₀-fixed vector of the specified kind, at any raised level.

**Repair:** Build/import general nebentypus spaces, including Γ₁ or the correct K₀-character transformation law, and state twisting and CM induction there. Identify the unramified-central-character specialization afterward. The order-3 test then lands in the χ² space; quadratic twists still land in the original specialization. Do not discard this case merely to match the database’s default records.

## R19 (P2) — The L-function card is missing forced normalization constants

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1053.

**Claim:** The card’s completed function is specified as Λ recentred, although the supplier uses Deligne gamma factors and a conductor normalization constant.

**Witness:** Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:53 has Γℂ(s)=2(2π)^(−s)Γ(s). TauCetiRoadmap/LFunctions/README.md:386 requires Q^(−w/4) on recentering. For n=2,w=1,Q=775, the ratio is 4·775^(−1/4), not 1.

**Repair:** Give the exact equality: the analytic card completion is 2^n Q^(−(k₀−1)/4)Λ(f,s+(k₀−1)/2). State the corresponding arithmetic gamma/card convention explicitly. The degree stays 4, conductor 775 and centre 1/2 in the example; the fixed nonzero factor now matches rather than being silently discarded.

## R20 (P1) — The archimedean root-number exponent is wrong for nonparallel weights

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1029.

**Claim:** The formula uses i^(n k₀) for all weights, while the slash/Mellin inversion contributes one i^k_w per real place.

**Witness:** At weights (2,4), m=(1,0), k₀=4, the displayed factor is i⁸=1; the product of the two weight factors is i²i⁴=−1. All parallel-weight checks conceal the sign.

**Repair:** Use i^(Σ_w k_w) with the explicitly fixed Fricke convention, and verify the full Mellin change of variables including the m_w shifts. The nonparallel test then gives −1 on both sides; parallel weight 2 still gives (−1)^n. State any revised Fricke normalization if intending a different exponent.

## R21 (P1) — The Atkin–Lehner adjoint relation has an extra norm factor

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:744.

**Claim:** For the normalized W, the formula multiplies the adjoint by S_p, whose scalar is ψ(p)q^(k₀−2), rather than accounting consistently for the unitary central action.

**Witness:** On a ψ=1 new line with v_p(level)=1, §§7.6–7.7 give a=−εq^(k₀/2−1)≠0. Pairing the proposed equality with f gives a=q^(k₀−2)a. At k₀=4,q=4: ±4≠±64.

**Repair:** Derive the adjoint using the same normalized slash and pairing, removing the spurious q^(k₀−2) and stating the exact central-character factor. In the trivial-character test W U W⁻¹=U* gives ±4=±4; at weight 2 the old formula hid the error because q^0=1. The statement must also restrict the adjoint to the cusp space, where the Petersson product exists.

## R22 (P2) — Atkin–Lehner signs are determined by the full coefficient system

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:978 and :1456.

**Claim:** At squarefull level the sign is described as not determined by the coefficients, rather than not recoverable from the single local U eigenvalue.

**Witness:** Two normalized newforms with identical good coefficients are equal by §6.4. Applying the fixed W to that same nonzero vector gives the same sign. The bad coefficient 0 alone does not distinguish +1 from −1.

**Repair:** Replace the assertion with the precise local one: c(p)=0 does not determine ε_(p^r). Keep the sign as additional displayed local data, while acknowledging its determination by the full normalized newform. The 0 versus ±1 test remains valid without contradicting multiplicity one.

## R23 (P2) — The Atkin–Lehner and Mellin constructions are not specified

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:738 and :1026.

**Claim:** “b⁻¹-type”, “class shift”, “q-primitive” and a “weighted integrand” do not determine the matrices or the Mellin map.

**Witness:** At nonprincipal q there is no global generator π giving the scalar matrix recipe. Different representative scalings already change coefficients by 4 in the R→(2)R test; the missing factors cannot be inferred uniquely.

**Repair:** Give the exact source/target components, fractional-ideal entry conditions, local primitive conditions, representative-change laws, Haar measure and full integrand. Pin the normalization by the identity case, a principal q, and a nonprincipal q. The R→(2)R test must yield the same normalized operator and Mellin transform after the compensating factors are included.

## R24 (P2) — A statable L-series headline is omitted

**Location:** TauCetiRoadmap/HilbertModularForms/Suggested.lean:637; TauCetiRoadmap/HilbertModularForms/README.md:1000.

**Claim:** The file defines LFunction but never states the promised absolute-convergence theorem, despite already having all its carriers.

**Witness:** A scratch theorem with hn, nonzero level, hf:IsCuspForm f, and Re(s)>k.top/2+1 concludes LSeriesSummable (normCoeff F (coeff F f)) s and elaborates against the pins.

**Repair:** State this headline with sorry on the actual tuple/carrier, and the general-form convergence statement if retained. At weight 2 the cusp threshold is Re(s)>2; the zero tuple satisfies it. Keep the Euler product and functional equation in the docstring until their actual newform/local-factor/completion carriers exist, naming each missing carrier.

## R25 (P3) — Suggested.lean contains API padding and unused carrier definitions

**Location:** TauCetiRoadmap/HilbertModularForms/Suggested.lean:153, :348, :614 and :629.

**Claim:** Boundary checks, library restatements and definitions serving no stated headline occupy the acceptance file.

**Witness:** top_parallel closes with the single tactic simp [top, parallel]. The Riesz statement at :614 is exactly one application of Mathlib’s theorem. narrowClass, LFunction, powRoots and classicalLocalFactor serve no theorem as the file stands.

**Repair:** Delete padding from Suggested.lean; retain it as README API/Checks. In particular remove top_parallel, the parallel-m zero/boundary tests, mem_Gamma0_top_iff and the Riesz wrapper. Remove orphan definitions unless a genuine headline now uses them (the convergence theorem can justify LFunction). Inline only helper facts necessary to construct retained definitions. This is deletion, not an invitation to prove the padding in place.

## R26 (P3) — The roadmap does not follow the required target and locator shape

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1, :321, :364 and :468; Suggested.lean:64.

**Claim:** There is no opening Summary paragraph or Exact supplier contracts section; definitions frequently have neither an API list nor three discriminating Checks; most targets have no theorem/page locator. Layers have no closing Examples/Dependencies subsections.

**Witness:** §1.1 defines a lattice and generalized index with zero local Checks; §§1.4, 1.5 and 2.5 have no claim-level source locator. Suggested.lean uses the singular namespace HilbertModularForm rather than the folder namespace HilbertModularForms.

**Repair:** Reformat around the prescribed headings, exact supplier contracts, per-target Needs, APIs and at least three genuine Checks per definition. Supply exact legal-source locators rather than broad bibliography chapters. Correct the namespace and add missing declaration docstrings; remove process narration from the module docstring. The new rank, scalar-transport and zero-weight controls provide discriminating checks rather than tautologies.

## R27 (P3) — The cited sources have no manifest

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1549 (References).

**Claim:** No sources.toml records the works or the legal copies/uncertified status used by this roadmap.

**Witness:** The folder contains README.md and Suggested.lean only. The supplied sources inventory likewise says none recorded; the seeded checks cannot be tied to persisted source/version identifiers.

**Repair:** Add the required source manifest, one lifetime key per work, with exact locators and the fetched metadata or an honest uncertified status. Use the source/version inventory below, recording unavailable texts without claiming their contents were checked. Do not copy any source text into the roadmap. The Dembélé–Voight and Zagier locators should resolve to the same versions read here.

## R28 (P2) — Squarefull level does not force the indefinite quaternion method in even degree

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:1275.

**Claim:** The parity explanation claims that even-degree fields at squarefull level require an indefinite algebra.

**Witness:** For n=2 and D=1, n+ω(D)=2 is even. A quaternion algebra ramified at both real places and no finite places exists; an Eichler order can have the squarefull level in question.

**Repair:** Remove the claimed necessity. State the actual parity constraint and the available choices of D, including D=1. This choice realizes the whole cusp space through the definite algebra at arbitrary finite level. For odd n and D=1 the parity obstruction really is present. Keep implementation choices outside the mathematical target.

## R29 (P2) — The Fourier and zeta library citations overstate their exports

**Location:** TauCetiRoadmap/HilbertModularForms/README.md:407 and :608.

**Claim:** The proof inputs are described as an arbitrary n-torus Fourier theorem and a Dedekind zeta pole theorem, but the named declarations do not have those types.

**Witness:** Mathlib/Analysis/Fourier/AddCircle.lean:433 is L² convergence on one circle. Mathlib/NumberTheory/NumberField/DedekindZeta.lean:56 defines a residue constant. Neither states the result attributed to it.

**Repair:** Own the product-torus and holomorphic locally uniform Fourier steps explicitly in §2.1, using the circle theorem as an input. Cite Tau Ceti’s exists_differentiableOn_eq_dedekindZeta_sub for continuation across 1. Test two independent circle frequencies: coefficients at (1,0) and (0,1) must both survive; the one-index circle expansion alone cannot encode that claim. For the pole, the corrected theorem actually produces a holomorphic remainder after subtracting ρ/(s−1).

## Verified sound

The review covered both complete files: 55 numbered README targets in 12 layers, all 77 Lean declarations and all 27 admitted theorems; 68 retained rows below record computed controls. Findings above are defects, not claims that every other target is proved. The finite tests below are explicit checks of the stated formulas; source limitations are recorded separately. No PR file was changed, and the outside-folder diff is empty. No sorry-defined data, `set_option`, admitted example or computational procedure was found in these two files. The database and algorithm discussion does not itself define an algorithm target.

The worker’s gate reports **all non-build checks zero**, including stray files, outside-folder edits and dependency checks; **build=1 FAIL** is R16. Direct `lake env lean` elaboration of the unmodified file succeeded with only 27 sorry warnings. An independent scratch file with `#check @name` for all 77 declarations also succeeded. I compared those elaborated types with the README: the 28 heuristic binder-loss flags did not establish 28 bugs. Pure matrix/subgroup definitions legitimately omit irrelevant arithmetic instances; the concrete missing nonzero-level condition is R02. The three finite-dimensionality signatures do retain their nonzero-level and degree hypotheses.

All 27 admitted theorems were separately attempted with one `simp` tactic in a scratch copy: all 27 attempts failed. That does not establish depth. A targeted single `simp [top, parallel]` closes `top_parallel`; the already-written Riesz proof is one pinned theorem application. Definition/Check padding is therefore still R25. The added convergence signature elaborates (R24). The module-only scratch probe is distinct from the unsuccessful experiment of adding a public section to private imports; no claim is made that the latter works.

The mechanical supplier-order check was run again, read-only. Its complete output was:

```text
depcheck: 204 roadmaps, 1572 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This result does not validate supplier contents: R12–R15 identify ownership and content defects which require reading the suppliers. No undeclared gap was treated as an accepted supplier promise.

### Computed adversarial table

Here O is the ring of integers, q=Np, and Q₅=ℚ(√5). Unless a row deliberately tests an excluded case, the level is nonzero, the field is totally real of degree at least two, and all powers/denominators have the required nonzero positive input. Rows with “conditional” check the displayed algebra, not the existence theorem. The retained rows cover the seeded sample, headline theorems and mathematical findings; routine definition controls are omitted for length.

| Statement | Instance(s) tried | Values on the two sides / positive and negative controls | Result and change |
|---|---|---|---|
| 0.3 Weight, top, m | (2,4), (4,4), incompatible (2,3) | top=4,m=(1,0); top=4,m=(0,0); parity difference −1 is not even | Definition and parallel identities agree; boundary identities are padding. |
| 0.3 scalar normalization | Q₅, scalar 2I, k=4; scalar wI,k=3,N(w)=−1 | N(2)^(4−2)=16; N(w)^(3−2)=−1 | Arithmetic scalar factor is 16, odd-weight sign is −1. |
| 0.4 unitary comparison | Q₅, diag(1,2), k=4 | N(det)=4; arithmetic/unitary ratio=4^((4−2)/2)=4; unit determinant ratio=1 | Correct distinction; a representative rescaling is not a unit. |
| 1.1 lattice, stabilizer | Q₅, b=O | ℤ-rank=4 vs claimed 2; rank over O=2; diag(2,1) sends O² strictly into O² | R05; containment is not stabilization. |
| 1.1 generalized index | b=c=O; γ=diag(2,1) | quotient O/2 has cardinality 4; index ideal=(2)=det(γ)O | Ideal index convention agrees in this test. |
| 1.2 congruence groups/determinant/index | Q₅, n=(2), b=O; lower unipotent with c=1 or 2 | c=1 fails c∈2O; c=2 passes; index q(1+1/q)=5; at unit level index=1 | Controls distinguish Γ₀ from full group and agree with projective-line count. |
| 1.4 cusps | Q₅, unit and prime level; Q(√10), unit level | h=1 gives 1 cusp and squarefree prediction 2; h=2 gives 2 cusps per component | Internal count checks pass; full source verification unavailable. Distinguish these from narrow-component counts. |
| 1.4 stabilizer | ∞; translations 1 and w; diagonal ε | translation ℤ-rank=2, quotient ε/1=ε; ε⁻¹ also occurs | Nontrivial unit group retained; central units must be factored in reduction. |
| 1.5 representatives | R′=(2)R; R″=εR | narrow classes equal; scalars 2 and 2ε differ by ε; N(ε)=1,N(2)=4 | Existence/ambiguity correct; invariant transport fails R03. |
| 2.1 trace dual | Q₅, b=O, d=(√5) | dual=d⁻¹; Tr(1/√5)=0, Tr(w/√5)=1; Tr(1/2)=1 but Tr(w/2)=1/2 | Positive and negative trace-dual controls. |
| 2.1 Fourier coefficient/expTrace | e(Tr(μz)), coefficient at μ and at ν≠μ | matching frequency average=1; different frequency average tends 0 | Sign in exp(−2πiTr(μz)) is correct. |
| 2.2 Koecher | μ=√5; ε=(3+√5)/2; μ=0 | Tr(ε^(−j)μ)=√5(ε^(−j)−ε^j)→−∞; μ=0 contributes constant 1 | Mixed-sign coefficient excluded by unit invariance; constant term is not excluded. |
| 2.3 modular/tuple spaces | zero, constant 1 at k=0; Q(√6) and Q₅ | zero invariant; 1 slash γ=1 at k=0; tuple sizes 2 and 1 | Constant control refutes positive-coefficient injectivity, not the definition. |
| 2.3 parity and unit law | Q₅, N(w)=−1, odd k₀; positive ε | scalar action=−1, hence f=−f forces f=0; N(ε)^(k₀−1)=1 | Parity and generator-independence algebra agree. |
| 2.4 coefficient map/injectivity | k=0, f=1,g=0 | c(m,1)=c(m,0)=0 for every nonzero ideal; a₀(1)=1≠0 | R01. |
| 2.4 change of representative | α=2 over Q₅; any nonzero coefficient c | transformed coefficient=4c, advertised invariant=c | R03; normalized transport gives c. |
| 2.4 generator ambiguity | μ′=εμ, ε≫0 a unit | a(εμ)∏(εμ)^m / (a(μ)∏μ^m)=N(ε)^(k₀−1)=1 | Generator ambiguity is handled; it is not the same as representative ambiguity. |
| 2.4 zero extension/additivity | zero ideal, f+g | coeffIdeal(⊥)=0; for positive m, c(m,f+g)=c(m,f)+c(m,g) | Native nonzero ideal carrier avoids infinitely many zero-ideal divisors. |
| 2.5 cusp coordinate scaling | upper-triangular δ, especially scalar 2I,k=4,n=2 | actual constant multiplier=∏det(δ)^(k+m−1)d^(−k)=16; determinant-only factor=4096 | The parenthetical formula needs a precise stabilizer/domain and denominator factor; see limitations below. Vanishing is unchanged by either nonzero factor. |
| 2.5 nonparallel constants | k=(2,4), ε=(3+√5)/2 | m=(1,0); unit-law multiplier=ε⁻¹≠1, hence a₀=ε⁻¹a₀ implies a₀=0 | Correct mechanism at every cusp with a finite-index unit group. |
| 2.6 cusp submodule/decay | 0 and 1 at k=0; positive exponential | constant terms 0 and 1; positive exponential at it has modulus exp(−2πtTr μ)→0 | Definition excludes 1; exponential only tests decay, not full automorphy. |
| 3.1 reduction overlap | ε^jI | every overlap is the same nonempty Siegel set; infinitely many matrices, one projective class | R06. |
| 3.1 transported height | γκ=S, z=(it,it) | original cusp height t; transported height 1/t→0 | R06; use cusp coordinates. |
| 3.2 measure/integrability | z↦2z at each place; radial norm r≥t | dxdy scales by 4 and y² by 4; ∫t∞r^(−2)dr=1/t | Invariance and convergence correct; distinguish r=N(y) from y=s·u, where r=s^n. |
| 3.3 cusp coefficient bound | listed newform at norms 4,5,9 | absolute coefficients 3,2,2 ≤ 4,5,9 for C=1,k₀=2 | Finite checks agree; not a proof of a uniform bound. |
| 3.3 general growth route | normalized Eisenstein, n=2,k=2,z=(it,it) | f→1, N(y)^k=t⁴→∞ | R07; proposed bounded function is not bounded. |
| 3.4 Petersson scaling | scalar 2I,Q₅,k=4 | f↦16f, pairing↦256 pairing; N(det)^(k₀−2)=16²=256 | Displayed individual-component scaling is correct. |
| 3.5 finite dimension | Q₅ weight 2 level 1 and norm31; weight0 | dim cusp=0 and 1 respectively; constants have dimension1 | Hypotheses in Lean include nonzero level. Direct sum over finite narrow group stays finite dimensional. |
| 3.5 negative weights | zero level, parallel −2 | constant1 is invariant and nonzero; claimed space=0 | R02. |
| 4.1 Eisenstein constants | normalized own cusp and different cusp, k≥4 | constant-term matrix target diag(1,…,1); zero cusp form has all entries0 | Distinguishes Eisenstein lifts from cusp space; source proof not certified here. |
| 4.2 Hecke trick | n=1,2,3; s→0 | s^n·(1/s)=1,s,s²; only n≥2 forces zero | Cancellation is dimension-sensitive. General scattering formula at arbitrary cusps remains source-unverified. |
| 4.3 decomposition | one cusp; E with a₀=1 and cusp f | constants of aE+f equal a; kernel at a=0 is cusp subspace | Direct-sum algebra correct once existence/constant terms are proved. |
| 4.3 Siegel constants | Q₅,k=2,4,6; ℚ boundary | 4/(1/30)=120;4/(1/60)=240;4/(67/630)=2520/67; −8/B₄=240 | Numerical constants are internally consistent. |
| 4.3 sharper bound | k=2,m squarefree at norms4,5,9 | σ₁(m)/Nm=(5/4)(6/5)(10/9)=5/3; coefficient ratio=200; full product unbounded | R07; retain divisor sum or ε-loss. |
| 5.1 bad double cosets | Q₅,n=p=(2) | original set ≥5 distinct cosets versus claimed4; corrected upper-left-unit set4 | R04. |
| 5.2 central action | Q₅, (2),k=4; Q(√6), (√6),k=2 | S_(2)=4²=16, normalized central action1; sign(−6)²=1 | Scalar sign and normalization agree. |
| 5.3 recurrence | good p,q=4,k=2,a_p=−3,c₁=1 | c_(p²)=a_p²−q=9−4=5; a_p²=5+4 | Good recurrence consistent; bad recurrence depends on R04 repair. |
| 5.4 coefficient formula | m=1,p and p² at q=4 | m=1 gives −3=−3+0; m=p gives9=5+4 | Correct good formula in the principal-component test; missing coset restriction adds unwanted bad-prime term. |
| 5.5 adjoints/diagonalization | ψ=1, real eigenvalue−3; ψ(p)=−1 | in first case adjoint eigenvalue−3; second condition ā=−a permits imaginary a | Normality is not self-adjointness for general ψ. Nonprincipal representative normalization requires R03. |
| 5.6 W involution/adjoint | ψ=1, Wf=εf; k₀=4,q=4, a=−ε4 | W²f=f; claimed adjoint relation gives a=16a | R21; weight2 test has factor1 and cannot detect it. |
| 6.2 comparison and inverse | f=0; representative γ changed by Γ element | Φ₀=0; slash-invariance makes both representative values equal | Basic invariance control; full moderate-growth/inverse proof depends on corrected reduction and conventions. |
| 6.3 shared eigensystem | q=4,k₀=2,ψ=1,a=−3 | t=−3,s=1,q·s=4; polynomial1+3T+4T² | Arithmetic-to-unitary t becomes −3/2; determinant becomes1. |
| 6.4 multiplicity one | Q₅,unit level,weight2 | actual eigenspace dimension0; τ(unit)=1 if an unwarranted conductor-one π is inserted | R17: occurrence first. For an occurring conductor-level system the local invariant dimensions multiply to1. |
| 7.1 old space and V | level1; raise g to level np | old at1=0; c(1,V_pg)=0, c(p,V_pg)=c(1,g)=1 | Inclusion differs from V; a combination g+tVg need not be U-eigen. |
| 7.2 new space/normalization | Q₅ norm31, dim cusp1, lower-level cusps0 | old=0,new dimension1; normalized coefficient c(1)=1 excludes zero | Definition separates old vectors and normalized newforms. |
| 7.3 old/new decomposition | conductor m and level mp² | divisor count of p²=3; local invariant dimension3 | Consistent local count; requires occurrence and actual conductor divisibility. |
| 7.4 all-prime eigenforms | c₁=1,T_pf=a_pf | coefficient at1 gives a_p=c(p); at good q4 recurrence gives c(p²)=5 | Eigenvalue–coefficient algebra correct after Hecke construction is repaired. |
| 7.5 fields/orbits/Galois | field ℚ(√3); weight(2,4) under place swap | two embeddings send t to ±t; traces t+(−t)=0; weight becomes(4,2), not(2,4) | Orbit size2 check passes; fixed-weight ℚ-descent needs R14. |
| 7.6 bad coefficients | ψ=1,weight2,v_p(n)=1 or ≥2 | at norm31 a=−1; squarefull example a=0; local polynomials1+T and1 | Degree loss is intentional; do not impose the good quadratic factor. |
| 7.7 signs | a=−1,q31,k2; squarefull a=0 | ε=−a=1; 0 alone leaves ε=±1, but equality of whole newform fixes ε | R22. |
| 8.1 Dirichlet series/norm grouping | given form, norms0,4,11 | b₀=0,b₄=−3,b₁₁=4−4=0 | Norm sum, not choice of one prime. |
| 8.1 Euler factors | q4,a−3; q5,a−2; bad a−1 | 1+3T+4T²;1+2T+5T²;1+T; reciprocal first has coefficients1,−3,5 | Consistent signs and coefficient recurrence. |
| 8.1 absolute convergence headline | weight2 cusp, s=3; f=0 | threshold2<3; zero series sum=0 and summable | Missing native signature elaborated; R24. |
| 8.2 completion/sign | parallel2,n2,level norm31; nonparallel(2,4) | Q=31·25=775, centre1; parallel arch sign+1; nonparallel actual−1 versus target+1 | R20; parallel worked examples do not test general weights. |
| 8.3 card/analytic rank | n2,w1,Q775; ε=±1 | degree4, centre1/2; completion ratio4·775^(−1/4); parity equation (−1)^r=ε | R19 for normalization; rank parity algebra correct for a nonzero entire function. |
| 9.1 twists | trivial, quadratic and ramified cubic χ | χ²=1 in first two cases; cubic χ² has order3; good coefficients a↦χ(p)a | R18: cubic twist must land in its actual character space. |
| 9.2 inner twists/CM | self-twist at split/inert p | χ=1 gives a=a; χ=−1 forces a=0; two characters lie over id | R08. |
| 9.3 induction/conductor/field | CM E:y²=x³−x; split norm5 | values−1±2i; trace−2; product5; coefficient fieldℚ≠ℚ(i) | R09; conductor and central-character hypotheses must use general induction. |
| 9.4 powRoots/base change | h=1−3T+2T²,r=1,2,0; h=0 | r1 gives h; r2 gives1−5T+4T²; r0 gives(1−T)²; h0 gives1 | Correct inverse-root operation when h(0)=1; r0 and h0 excluded from the intended local-factor relation. No roots/inverse-roots error was found. |
| 9.4 classicalLocalFactor junk p | p=0 versus prime p; weight2 | p0 gives1 with cusp q-coefficient0; prime good p gives1−a_pT+χ(p)pT² | Bare definition accepts junk p, but no theorem calls p0 a prime local factor. Orphan definition should leave acceptance file. |
| 9.5 cyclic base change/descent | inverse roots α=1,β=2,residue degree2 | new inverse roots1,4; trace5,det4; equal split coefficients required | Generic local power operation already has an adelic owner; classical comparison is the new work. |
| 9.6 lift coefficients | D29,t²=−5 | inert2:−5+4=−1; inert3:−5+6=1; split5:−3 twice; ramified:−3+2t−3−2t=−6 | Coefficient examples agree; split sum operator−6 contradicts source T₅ eigenvalue−3 (R10). |
| 10.1 D-new | D=1 and D=rad(n) | empty intersection=whole cusp space; all-prime-new intersection=new space; new⊆D-new | Both endpoint directions consistent. |
| 10.2 JL parity/quotient | n2,D1; n3,D1 | ramification counts2 even (exists),3 odd (impossible); at weight2 remove norm part | General parity correct; squarefull narrative fails R28. |
| 10.3 Brandt trace/charpoly | DV Example8.1 norm4, norm13 | trace0−(5−5)=0=0+0; trace36−28=8=4+4; norm4 full charpoly x²(x²−25) | R11’s trace correction; cuspidal charpoly x² at norm4. |
| 11.1 invariants/Ramanujan | Q₅ form norm31 | field degree1; a₂=−3∈ℤ; abs(−3)=3≤2√4=4; level bad rational primes{31}, field bad{5} | Numerical bounds and database meanings agree; general Ramanujan is an imported theorem, not implied by Hecke’s weaker bound. |
| 11.1 CM density/base-change test | quadratic character group C₂; split primes above11 | inert class size1/group size2 gives1/2; coefficients4 and−4 disprove base change from ℚ | Correct one-way controls; finite matching data never proves base change. |
| 11.3 elliptic attachment | source curve A at residue field9 | #A(𝔽₉)=8, hence9+1−8=2=c((3)); at a multiplicative bad place a=±1 | Good-prime predicate controls good Euler factors; full card equality additionally needs modularity and local compatibility. R15. |

### Headline coverage at the pins

The README’s deep endpoints are Fourier expansion and Koecher (§§2.1–2.2), expansion injectivity and nonparallel cuspidality (§§2.4–2.5), Hecke growth and finite dimension (§§3.3–3.5), Eisenstein existence/decomposition including weight 2 (§4), Hecke relations and spectral decomposition (§5), the classical–adelic dictionary (§6), newform decomposition, rationality and bad-prime theory (§7), absolute convergence/Euler product/functional equation and the card (§8), twisting/CM/base change/Doi–Naganuma (§9), D-new Jacquet–Langlands and Brandt comparison (§10), and the invariant/elliptic interfaces (§11).

The Lean file states the Fourier, Koecher, nonparallel-constant, coefficient-injectivity, growth and finite-dimensionality targets on actual carriers. Injectivity and negative-weight vanishing are false as signed (R01–R02). The module docstring names most of the later missing constructions; it should identify the missing carrier for each headline rather than treating all construction work as a reason not to state anything. Absolute convergence is already statable and is missing (R24). There is no fake free-Prop replacement for the absent newform/Jacquet–Langlands endpoints. The late polynomial and L-series definitions alone are not acceptance theorems.

### Pinned declarations opened and ownership resolved

Library paths here are relative to the pinned Mathlib or Tau Ceti repository. These are actual declarations inspected, not names inferred from a newer library:

| Pin and declaration | File and line | What it supplies, and relevant limit |
|---|---|---|
| Mathlib `FiniteDimensional.of_isCompact_closedBall₀` | Mathlib/Analysis/Normed/Module/FiniteDimension.lean:467 | Riesz for a positive-radius compact closed ball; already proves the wrapper’s conclusion. |
| Mathlib `hasSum_fourier_series_L2` | Mathlib/Analysis/Fourier/AddCircle.lean:433 | L² convergence on one `AddCircle T`, not by itself locally uniform holomorphic Fourier expansion on an arbitrary n-torus. |
| Mathlib `FractionalIdeal.dual_inv` | Mathlib/RingTheory/DedekindDomain/Different.lean:379 | Dual of inverse ideal with the standing finite/separable algebraic setup. |
| Mathlib `coeIdeal_differentIdeal` | same file:532 | Different as inverse trace dual; the number-field specialization satisfies the setup. |
| Mathlib `Complex.Gammaℂ` | Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:53 | Includes the factor 2. |
| Mathlib `NumberField.dedekindZeta_residue` | Mathlib/NumberTheory/NumberField/DedekindZeta.lean:56 | A residue constant definition; not a complex meromorphic-continuation theorem. |
| Tau Ceti `exists_differentiableOn_eq_dedekindZeta_sub` | TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158 | Actual continuation across Re(s)=1 after subtracting the simple pole. |
| Tau Ceti `IsTotallyPositive` | TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71 | Positivity at real embeddings; no hidden degree≥2 hypothesis. |
| Tau Ceti `NarrowClassGroup`, `mk`, `mk_surjective` | TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83, :96, :106 | Quotient by totally positive principal ideals, with surjection; supplies representative existence. |
| Tau Ceti `IdealArithmeticFunction`, `zeroExtend` | TauCeti/NumberTheory/ArithmeticDirichletSeries/Basic.lean:79, :170 | Nonzero integral ideals and zero extension; not a Hilbert form carrier. |
| Tau Ceti `normCoeff` | TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:101 | Linear regrouping by ideal norm. |
| Tau Ceti newform `dirichletLift` | TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:134 | Classical ℚ-side nebentypus, not Hilbert newforms. |

Object searches covered both pins, main/completed roadmaps, board packages, and accessible indexed open heads using `roadmaps grep`/`show`, plus the supplied sibling checkouts. No native Hilbert analytic tuple/newform carrier was found at the pins. The listed source files support the few definitions retained in Suggested.lean; they do not justify replacing deep missing objects by unconstrained predicates. The generic local-factor power/base-change theory belongs to GL2AutomorphicRepresentationsAndTransfer R17.4, and the quaternion carriers/Brandt matrices belong to QuaternionicModularForms and QuaternionArithmetic. This roadmap can own the classical Hilbert comparisons to those carriers. Its parallel analytic overlap with the earlier Iwasawa roadmap is R12; no fully qualified Lean name collision was identified in the searched copies.

The resolved supplier contracts include the following (line numbers refer to the supplier README itself, excluding the tool’s display header):

| Supplier | Resolved locator | Audit result |
|---|---|---|
| GlobalNumberFields, main | Layers 2 (:279), 3A (:345), 7 (:459), 9 (:508), 10 (:531) | Moduli, lattice counting, ray quotient, finite-order Hecke characters and infinity types exist. The finite-idele class quotient needs the actual class-map/ray dictionary, not Layer 4’s carrier alone. |
| Completed/NumberFieldArithmetic | §4.3 (:1210), §8.1 (:2140) | Ramified support and intrinsic label predicate exist; separability holds for number fields. |
| Completed/ArithmeticDirichletSeries | §§0.1, 1.1 (:147), Layers 2–3 | Nonzero-ideal coefficient and norm-regrouping/Euler-data ownership resolved; no new generic coefficient carrier needed. |
| ClassFieldTheory | Layer 12 (:1724) | Number-field global correspondence, norm index and existence; quadratic character/kernel degree is 2. |
| Chebotarev, main | Layer 10 (:410) | Density #C/#G and finite-exception invariance; inert quadratic density 1/2. |
| ModularForms | Layers 2, 4, 6–8 | ℚ-side Hecke/newform/Atkin–Lehner/L-series/coefficient-field theory; does not by itself supply nonparallel Hilbert forms. |
| LFunctions, main | Layer 0, especially :386; Layer 3 | Card predicates and precise recentering constant; R19. |
| AdelicAlgebraicGroups | §4.2 (:4149 and following criterion) | Strong approximation criterion can be applied to split SL₂ with its noncompact real factors; no need to assume a quaternion division case. |
| GL2AutomorphicRepresentationsAndTransfer | R16.4.3–4, R17.3.1/3/5/9, R17.4.1/3/4/5/8/16 | Multiplicity one, JL, cyclic/tower base change and induction inputs exist. The R16.6.2/R17.5.1 applications are drift (R13). |
| AutomorphicGaloisRepresentations | §§3.10, 3.15–3.16 (:1861 onward), §4.2 | Hilbert constructor, regular CM and Ramanujan owner. Its CM normalization distinguishes algebraic from unitary inducing characters. |
| AutomorphicBundles | §§11.9, 11.18 (:4358), 12.14, 12.17–12.19 | Current comparison, field base change and line-valued Hilbert q-expansions; the absent B4/B5 citations and ℤ/ℚ overclaim are R14. |
| HilbertModularVarietiesAndShimuraCurves | H1.10, H3.6, H3.8, H5.2 | Components, moduli comparison, Hecke and surface cusps resolved; not a source for rebuilding geometry here. |
| QuaternionicModularForms | §§0.1, 0.3, 2.1, 3.1 | Orders, class sets and algebraic forms/Hecke action exist. The algebraic weight representation is §1.3, not the cited analytic §1.1. |
| QuaternionArithmetic | Layer 7 (:988) | Brandt matrices, including trace and mass-normalized pairing. It is the owner; R11 corrects the classical trace comparison. |
| NoncommutativeAndEquivariantIwasawa | §F.5 (:2287) | Earlier ownership of full parallel analytic forms, characters, expansions and Hecke action; R12. |
| PotentialModularityAndCompatibleSystems | opening scope and §12.5 | Potential automorphy does not supply the unconditional base-field statement; R15. |

The nine unresolved backticked-name leads in the supplied citation scan were checked as leads, not automatically counted as nonexistent Lean declarations: database knowl/column identifiers are not supposed to be Lean APIs. The ownership search also checked the accessible HilbertModularSurfaces, HilbertModularVarietiesAndShimuraCurvesPartII, QuaternionArithmetic, BianchiModularForms and EllipticCurvePeriodsAndModularParametrizations material for the corresponding classical/geometry/quaternion/curve boundary. No claim is made about inaccessible files from other open work. Main/completed copies were used for revised existing roadmaps where available; the tool-provided head was used for newly proposed suppliers absent on main.

### Seeded source sample

All 15 requested targets were examined. No additional locator was explicitly labeled “unverified” in the README. The source service was used for every fetched work, including the LMFDB texts and code; nothing fetched was executed. The Dembélé–Voight text read is arXiv:1010.5727v2, and the Zagier text is the author-hosted scan of the printed 1975 article. Printed and extraction page numbers are distinguished below. Broad bibliography chapters are not exact theorem locators.

| Sample target | Text/locator actually examined | Conclusion |
|---|---|---|
| 1.4 Cusps | No locator in target; van der Geer Chapter I listed only globally; LMFDB q-expansion knowl line 90 | General cusp formula not certified from a readable theorem. Knowl conflates cusps/components; do not use it for the claimed class-group bijection. |
| 1.5 Representatives | Tau Ceti Basic.lean:96–117 above | Quotient/surjectivity supports the representative and positive-scalar ambiguity. Transport normalization is a separate claim, refuted by R03. |
| 2.2 Koecher | Freitag I §4 unavailable; dembele-voight line 267, Remark 2.3, printed p.5 | Readable source confirms the degree>1 role in parallel weight 2. It does not verify the full arbitrary-character proof as written. |
| 2.4 Normalized coefficients | shimura1978 §2 unavailable; dembele-voight lines 296–309, printed p.6; §7 lines 2090–2115 | Fourier/indexing conventions examined; source has a different-ideal misprint. General transport claim refuted directly, and weight-zero injectivity false. |
| 2.5 Constant terms | No local source locator; van der Geer/Freitag unavailable | Nonparallel unit-character argument checked algebraically; arbitrary-cusp normalization and cited proof not certified. |
| 4.2 Hecke’s trick | zagier1975 line 1453, Appendix 1, printed pp.39–42 (extraction pages 45 onward) | Supports the real-quadratic weight-two limiting construction; does not establish the arbitrary-field/all-cusp scattering claim as written. The cited Mathlib residue is only a constant. |
| 5.4 Coefficients | dembele-voight lines 312–330, (2.6)–(2.7), p.6; shimura1978 §2 unavailable | Good-prime arithmetic weight-two convention checked. The bad-prime construction fails independently (R04); general-character formula not source-certified. |
| 6.4 Dictionary | GL2 supplier R16.4.3–4, R16.2 and R16.6.2 opened | Occurrence is missing; the local classical adapter cited is over ℚ. Correct general suppliers are named in R13 and R17. |
| 7.5 Fields/orbits | dembele-voight lines 331–336, p.6; LMFDB dimension line90 and Hecke-orbit line90; AutomorphicBundles §11.18 | Algebraicity/finite field stated in weight-two source, but its deeper Shimura proof unreadable. A number-field base-change theorem is not the asserted integral ℚ-structure. |
| 8.1 Euler product | dembele-voight §6, displayed L-series and local factors preceding Conjecture6.1; native normCoeff and LSeries | Local polynomials and norm grouping checked. Full nonparallel theorem’s source is shimura1978, unreadable. Convergence signature is statable. |
| 8.3 Card | LFunctions Layer0 and pinned Gammaℂ | Native convention comparison checked; missing factors found. Knowl/database evidence is not a source for analytic continuation or rank. |
| 10.1 D-new | dembele-voight line583, Theorem3.9, printed p.11; GL2 R17.3 fixed vectors | Source states the squarefree-discriminant, coprime-order-level JL image. General higher-conductor D-new decomposition must use the stated local/newform inputs, not expand Theorem3.9’s hypotheses silently. |
| 10.3 Traces | dembele-voight lines2191–2230, Example8.1, printed p.44 | Explicit counterexample to subtraction formula; both norm4 and norm13 matrices checked (R11). |
| 11.1 Invariants | LMFDB dimension/eigenvalue/level/weight knowls; lmfdb-hilbert_modular_form-py lines149,177–180,437–450,460–493 | Display meanings checked; e.g. newspace dimension sums orbit degrees. Heuristic flags are not proofs; some reliability knowls were blocked. |
| 11.3 Elliptic interface | dembele-voight lines1357–1372, Example6.3, printed p.28; LMFDB code lines437 onward | Concrete curve, conductor and modularity argument checked in source. General potential-to-actual modularity claim is unsupported (R15); full EqOffZero needs local compatibility. |

## Not verifiable

- **Unreadable books/articles:** freitag (Chapter I §§2,4 and the chapter-wide claims), vandergeer (Chapters I,VI), garrett (Chapters1–2), shimura1978 (§§2,4, pp.637–679), shimura1971 (Theorem3.24), doi-naganuma (1969 article), miyake (§§4.5–4.6), diamond-shurman (Proposition5.8.5), and atkin-li (twist-level theorem, mentioned in the text but not listed in References). The source service tried the supplied citations, DOI/publisher routes and legal discovery. Springer results for Freitag/Miyake and publisher-only results were treated as uncertified, not read. The Shimura1978 Project Euclid landing page yielded no accessible PDF. The Shimura1971 discovery result was a JSTOR review, not the book, so it is not evidence for Theorem3.24. No paywall or access control was bypassed. The accessible Zagier paper supports a portion of the quadratic lift and weight-two discussion, not every general claim attributed to the unreadable books.
- **LMFDB access controls:** the fetched reliability knowl and the two example-top knowls for 2.2.24.1-1.1-a and 2.2.40.1-1.1-a returned a browser challenge rather than mathematical text. They were not counted as checked sources. The other fetched knowls and the public source-code files were read as data. Their database statements do not certify all the worked numerical records.
- **Insufficient local locators:** §§1.4,1.5,2.5,6.4,7.5,8.3,10.1,10.3,11.1 and11.3 have no primary theorem/page locator at the claim. Supplier locators and the readable sample above partly resolve the content, but the missing exact source locators remain R26. No source passages were copied into the roadmap or this report.
- **Cusp-constant parenthesis (§2.5):** for arbitrary changes of scaling matrix in the rational stabilizer of ∞ the determinant-only multiplier omits d^(−k). The scalar example in the table proves that broader formula false. If “cusp stabilizer” means only the arithmetic stabilizer Γκ of §1.4, that example is not in Γκ; then the parenthesis does not establish independence under arbitrary rational choices. Specify the domain and correct the factor before treating this as a verified comparison.
- **Analytic proof inputs:** the named one-circle L² Fourier theorem does not, by itself, provide the n-torus locally uniform expansion of §2.1. The Montel/Hilbert-space proof and the arbitrary-cusp Eisenstein scattering limit have not been certified by the broad references; the concrete Fourier/zeta citation defect is R29. Add explicit locally owned targets or exact existing suppliers for those steps. For the Dedekind pole step an actual pinned continuation theorem is identified above, so no new pole theorem is needed.
- **Exhaustiveness limits:** numerical controls are not proofs of all general results. The lengthy table records what was computed; it does not certify unread source proofs, every numerical LMFDB record, or inaccessible open-roadmap content. The review is finished with a needs-changes verdict, not parked awaiting books.

## Source issues

- **Misprint** in dembele-voight at §2 after (2.4), printed p.6, line288: the source says the slash condition is equivalent to equation (3.3); it should be equation (2.2); affects nothing.
- **Misprint** in dembele-voight at §2 after (2.5), printed p.6, lines306–309: the source says choose ν in the different with ideal n=νd⁻¹ and coefficient aν; it should be ν in the inverse different with n=νd; affects a stated result.
- **Error** in lmfdb-hilbert at the defining congruence-group display, webpage p.1, line95: the source omits integrality of the diagonal entries; it should require a,d in O_F as well as the off-diagonal conditions; affects a stated result.
- **Error** in mf.hilbert.q_expansion at the cusp-indexing sentence, webpage p.1, line90: the source identifies cusps of a Hilbert modular group with the strict class group; it should distinguish adelic components from the cusps within each component; affects a stated result.
- **Gap** in mf.base_change at the definition of h^(r), webpage p.1, line92: the source specifies roots and degree but no scalar normalization; it should additionally require constant term one for Euler polynomials; affects a stated result.
