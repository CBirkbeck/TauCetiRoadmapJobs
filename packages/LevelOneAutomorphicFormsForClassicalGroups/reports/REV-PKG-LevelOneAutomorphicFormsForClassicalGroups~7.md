<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6851739742 -->
Review (codex) of b5475a6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The exclusion theorem needs a positivity hypothesis

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1109–1115`, §2.17: “If `β_Q(t, t) < 0` for some nonzero `t ≥ 0`, this is impossible”.

   **Claim.** The displayed exclusion applies without specifying the test function or requiring (POS). Neither the layer introduction nor §2.9 imposes (POS) globally. Listing §2.16 among the dependencies does not bind the free `F` in this statement.

   **Witness.** Take `F = −F₁`, `S = ∅`, `U = 1`, `δ = 0`, `m = 1`, `t = 1`. Then `β = −(A_F₁ − J_F₁(1)) < 0`, although the trivial class exists.

   The strict sign has an exact verification using §§2.5–2.7: for the positive function `F₁`, the finite term at the trivial class includes `F₁(log 2) log(2)/√2 > 0`, and all other prime and zero contributions are nonnegative. Thus `A_F₁ − J_F₁(1) > 0`. Numerically that prime contribution is approximately `0.03997538123`; direct quadrature gives `A_F₁ = 0.81056946914`, `J_F₁(1) ≈ 0.76889291717`, hence `β ≈ −0.04167655196`. The exact argument, rather than quadrature accuracy, establishes the counterexample. The negative function remains an even compactly supported C² test function of §2.1.

   **Exact repair.** Begin §2.17: “Let `F` be a test function of §2.1 satisfying (POS). Let `S ⊂ Π_alg` …”. Write `β_Q^F` consistently. State the GRH variant for a test function with `F ≥ 0` and nonnegative Fourier transform on the real axis, including `G_ℓ` for `ℓ > 0`. Add the negative-control Check above. This keeps the general positivity theorem; it need not be restricted to a particular Odlyzko family. Tested: `−F₁(0) = −1` violates the repaired hypothesis, while every application using `F_ℓ`, `ℓ > 0`, satisfies it. CT20 lines 674–695 and 1548–1554 state the two respective positivity hypotheses.

2. **F02** (P2) Two complete source tables are reproduced

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2706–2735` and `:2753–2785`, the tables in §§7.8–7.9, headed “Genus”, “Weight”, “Standard parameter”.

   **Claim.** These are the full 29-row and 32-row tables of the source, with columns permuted and summands reordered. Their mathematical entries are correct, but this is reuse of source tables prohibited by the review contract.

   **Witness.** CT20 lines 2343–2375 (Table 6, printed p. 58) and 2378–2413 (Table 5, printed p. 59): all 61 triples reappear, including both parameters at `(g,k) = (4,12)`.

   **Exact repair.** Delete the two reproduced tables and state the classifications using the parameter sets already defined by the roadmap. For example:

   “Let `A_reg` be the positive-genus parameter set of §7.4 passing the character equalities of §3.3. Assign a dominant weight by `k_i = a_i + i`, where `a_i` are its decreasing positive infinitesimal weights. On the subset with nonscalar weight this assignment is injective and has image of cardinality 29. For every nonscalar dominant `k` with `13 ≥ k₁ ≥ ⋯ ≥ k_g > g ≥ 1`, the dimension of `S_k(Γ_g)` is the cardinality of this fibre (CT20 Theorem 2, Table 6).”

   “For each `g ≥ 1` and `0 ≤ k ≤ 13`, let `A(g,k)` consist of the scalar-weight members of `A_reg`, together with the singular parameters proved in §§7.5 and 7.7, at weight `(k,…,k)`. Then `dim S_k(Γ_g) = |A(g,k)|`; the union of the regular sets has 29 elements and the singular part has three (CT20 Theorem 2, Table 5).”

   Keep the existing individual mathematical Checks and §7.10's four-form theorem. This retains every space and parameter through the intrinsic classification, without reproducing the source's table. Tested: `(13,10,7)` gives positive weights `(12,8,4)` and one nonscalar parameter; `(4,12)` has two regular scalar parameters and dimension 2; `(24,13)` retains `Δ₁₁[12] ⊕ [25]` through §7.7. Changing only column order is not this repair.

3. **F03** (P2) The mass nonvanishing assertion exceeds its cited range

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1975–1977`, §4.18: “the masses of §§4.12–4.17 … `m_P ≠ 0` for every `P ∈ P₁(G)` except six indices for `SO₁₃` and six for `SO₁₇`”.

   **Claim.** This covers `Sp₁₆`, included in §4.17, as well as the groups of CT20 Theorem 6.

   **Witness.** CT20 line 1369 restricts Remark 3.10 to Theorem 6. CT20 lines 515–516 restrict its symplectic range to `Sp₂n`, `2n ≤ 14`; line 525 treats `Sp₁₆` separately in Theorem 7.

   **Exact repair.** Retain the full mass-identification theorem for §§4.12–4.17. Separate its second clause: “For the groups of CT20 Theorem 6, the only zero masses in `P₁(G)` are six for `SO₁₃` and six for `SO₁₇` (Remark 3.10).” Scope the twelve-zero Check to those groups too. A broader nonvanishing theorem can instead be retained with a precise supporting result and proof input for `Sp₁₆`; Theorem 7's existence of a mass table is not itself that result. Tested: `Sp₁₄` satisfies `14 ≤ 14`, while `Sp₁₆` fails `16 ≤ 14`; all 2521 `Sp₁₆` masses remain targets of §4.17. This finding does not assert that a particular `Sp₁₆` mass is zero.

4. **F04** (P2) Unique spherical member is not a singleton local packet

   **Location.** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1289–1290`, §3.3: “The finite unramified packets are singletons with trivial character.”

   **Claim.** The whole local Arthur packet of an unramified parameter is a singleton, rather than its part spherical for the fixed hyperspecial subgroup.

   **Witness.** Tai17 lines 2313–2315, Lemma 4.1.1, printed p. 305, assert uniqueness of the spherical member. For `Sp₂`, unramified Frobenius `diag(−1,−1,1)` in `SO₃` has component group of order 2.

   For this tempered parameter, with trivial inertia and both SL₂ factors trivial, the centralizer is `S(O₂ × O₁) ≅ O₂`: its identity component is `SO₂`, so `S_φ ≅ ℤ/2`. The p-adic packet therefore has two members by the very local packet theorem imported here, while the chosen hyperspecial subgroup has one spherical member. This is also checkable at open PR #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:2017`, §3.15, which gives the bijective tempered pairing. No global realization of this example is needed to distinguish the two local assertions.

   **Exact repair.** Replace the sentence by: “At each finite prime the local packet contains exactly one `Sp_{2g}(ℤ_p)`-spherical member, and its packet character is trivial (Tai17 Lemma 4.1.1, p. 305).” Add a Check distinguishing the whole packet from this spherical part. Tested on the rank-one parameter: whole packet `2`, spherical part `1`; the repaired sentence holds and supplies exactly the finite factor needed by the global multiplicity test. The main multiplicity formula and its local multiplicity-one hypothesis need no change.

Four P2 findings; four blocking. The five previous findings are repaired. No package input was changed. This report distinguishes a theorem's stated hypotheses from hypotheses its proposed proof would need.

## Verified sound

### Previous findings, checked first

The prior report's five findings and the repair report were read individually. None was marked not actionable. All five are repaired; the new findings above are not re-raisings.

| Previous finding | Repaired passage | Status and verification |
|---|---|---|
| F01: premise scope omitted §3.2 | README:167, “to §§3.2–3.16 (§3.2 uses that same-type root number)”; §3.2, “Prove, under the standing premises” | Repaired. In `Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]`, same-type trivial pairs have exponents `7,1,1` and root numbers `1,1,1`. The imported same-type assertion now lies within the premise scope. |
| F02: obsolete ModularForms supplier | README:231–235, “the newforms of level `N` and weight `k` form a basis of the new subspace”; “at level one the new subspace is all” | Repaired. Opened all six replacement declarations, listed below. At weights `12,24,54`, the normalized eigenform counts are `1,2,4`; at level one `gcd(p,1)=1` for every prime. No obsolete Layers 3–4 citation remains. |
| F03: unused import | Suggested.lean:8, `public import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Basic` | Repaired. Its `Isometry` structure is used; no declaration from Isometry/Group is required. The unchanged signatures elaborate. |
| F04: claimed attainment of a bound | README:2103–2104, “the lower end of the range `14 ≤ dim U ≤ 42`”; “not that some element of `V` attains it” | Repaired. CT20 lines 1430–1431 give the bound only. `dim U_exc = 14`, whereas the displayed `A ∈ V` has dimension 16; no attainment is inferred. |
| F05: crossed B/D forms | README:447–449, “types `B_n` and `D_n`”; odd-rank then even-rank forms, “respectively” | Repaired in both README and the plan's existing gap. At `n=1`, polar determinants are `−2` for `x₁x₃+x₂²` and `−1` for `x₁x₂`; ranks are 3 and 2. |

The changed contracts, §2.20, the premise language and their other occurrences were re-read. Repaired-pattern searches found no other crossed B/D pairing, attainment claim, obsolete ModularForms citation, unused Tau Ceti import, or missed same-type-root-number premise scope.

### Seeded source sample

All fifteen selected targets were read against the cached source text. Pages below are printed pages of the manifest's specified version, not PDF page indices. CT20's manifest explicitly records the HAL manuscript numbering, including the one-number offset in its later section 5 relative to the published version. No source fetch or manifest addition was needed. All eight cited works have manifest entries. KT87 remains the sole settled uncertified work; it was not requested again.

| Target | Source text opened | Verification |
|---|---|---|
| 1.1 Level-one algebraic cuspidal spectrum | CT20 lines 540–571, §2.1, pp. 12–13 | Unitary normalization, every finite place spherical, central real scalars acting by a common sign, and the algebraic infinity type agree. Includes the rank-one trivial class. |
| 2.4 Eight scalars | CL14 lines 11662–11735, IX Proposition 3.17, pp. 304–306; CT20 lines 1557–1575, Proposition 4.4, p. 38 | The four F-scalars and four G-scalars have the stated transform normalization, `ℓ>0`, and nonnegative integral `w`. Supplier ComputationalNumberTheory §4.17 has the same eight slots. |
| 2.7 Cone inequality | CT20 lines 674–695, Proposition 2.2, p. 16 | Both positivity conditions and nonnegative coefficients are retained. It is not a positive-semidefinite assertion on arbitrary signed vectors. |
| 2.8 Multiplicity bound | CT20 lines 705–713, Corollary 2.3, p. 17 | Distinct classes with common parameter, `m≥1`, coefficient `1/m`, and the `A_F/m` bound agree. |
| 2.10 Rayleigh minimum | CT20 lines 789–799, Lemma 2.6, p. 19 | Finite dimension, self-adjointness and a local minimum on the sphere give the least eigenvalue; the native eigenvector lemma alone is weaker. |
| 2.21 Repeated-weight PGL₄ vanishing | CT20 lines 1036–1043, §2.4.7, p. 25 | The odd range `1≤w≤53`, parameter `2I_w` and known elliptic classes agree. The package correctly uses their actual dimension, correcting the source's count. |
| 3.3 Multiplicity test | CT20 lines 1687–1700, (5.1.4), p. 41; Tai17 lines 2313–2315, Lemma 4.1.1, p. 305 | The global test and real multiplicity-one hypothesis agree. The additional whole-packet claim is R04. |
| 3.8 Scalar membership | CT20 lines 1761–1790, 1806–1814 and 1837–1862, §5.2.2, pp. 43–45 | Range `g≥k≥1`, prescribed infinitesimal character, cases I/H and multiplicity one agree; the H2 remainder omits the stated weight. |
| 3.9 Case-I character | CT20 lines 1795–1836, (5.2.2)–(5.2.3), p. 44 | Both branches, the position parity and independence of the chosen sign agree. |
| 4.4 Polynomial indices | CT20 lines 1077–1083 and 1120–1133, Definition 3.1 and §3.1, pp. 26–27 | Cyclotomic multiplicities, degree, determinant and negation-orbit conventions agree. |
| 4.18 Mass values | CT20 lines 515–525, Theorems 6–7, p. 12; lines 1369–1372, Remark 3.10, p. 33 | The source announces the mass tables. Its twelve-zero assertion has the smaller range: R03. The external tables themselves were not reproduced or independently certified. |
| 5.3 Eleven classes | CL14 lines 654–667, Théorème F, p. 15; CT20 §2.4.6 | Exactly `1+5+4+1=11` classes, motivic weight at most 22, with the stated ranks and parameters. |
| 6.6 Pluriharmonic coefficients | CT20 lines 2231–2242, §5.4, p. 54; CL14 lines 5445–5468, V §4.1, p. 143 | Harmonicity and determinant covariance give the coefficient module; CT20 supports the genus-general formulation beyond CL14's displayed range. |
| 8.1 Eichler basis theorem | CT20 lines 2213–2228, Corollary 5.10, p. 54 | Surjectivity in weights 4, 8, 12 for every genus is correctly distinguished from injectivity. |
| 8.9 Rank-sixteen harmonic source | CT20 lines 2281–2284, §5.4, p. 55 | Source dimension 2 and the two parameters `Δ₂₁,₁₃[4]`, `Δ₁₇[8]` agree. |

### Computed adversarial checks

The table includes all fifteen sampled targets, all headline families, the four Lean theorems, repaired passages, and every finding. The README was read in full. For unchanged material the previous review's computed rows were used where available, particularly the full cyclotomic enumeration and the 223-parameter enumeration; those computations are explicitly attributed below, not claimed rerun. Previous prose-only conclusions were not used as computed evidence. Tests outside the arithmetic or characteristic-zero hypotheses are negative controls, not assertions of wider generality.

| Statement | Instances | Values on the two sides | Result / change |
|---|---|---|---|
| 1.1 spectrum and 1.4–1.6 conventions | trivial class; `Δ₁₁`; `I₀` | rank/weights `(1;0)` and `(2;±11/2)`; determinants `1` and `e¹²=1`; `I₀=1+e`, dimension `2=1+1`, epsilon `i=1·i` | Holds; the trivial class is essential to R01. |
| 1.8 and repaired 3.2 | `I₁+2I₂₃`; `2I₁`; three trivial blocks | dimensions `6` and `4`; simple weight fixes alternating type in the first, both pairing types occur in the second; pair-root exponents `7,1,1` give `1,1,1` under the stated premise | Holds. |
| 1.9 weight inverses | Sp₂ at `λ=0`; candidate `(0,0,0)` | image `(1,0,−1)`; inverse of the candidate would be `−1`, not dominant | Regularity excludes the wrong model. |
| 2.1–2.4 transforms | `ℓ=1`; triangle function at zero | `A_F₁=8/π²≈0.81056946914=Ĝ₁(0)`; `Ĝ₁(i/(4π))≈0.82021545440`; triangle transform limit `4`, whereas totalized `0/0=0` | Correct normalization; two G-values differ. |
| 2.3 gamma difference | recurrence at `s=1` | `D(1)=−log 2`, integral of `e^(−x)/(1+e^(−x))=log 2`; the leading minus sign reconciles them | Holds. |
| 2.5–2.7 positivity | `F=0`; trivial class with F₁; signed coefficients `(1,−1)` | zero identity `0+0+0=0`; `C^F₁(1,1)>0.03997538123`; signed cross coefficient `−2` versus the required nonnegative coefficient | Cone restriction and POS are necessary. |
| 2.8 multiplicity | `m=2`; `m=0` | diagonal average `A·2/4=A/2`; empty sum gives `0≥0`, not a bound on arbitrary U | `m≥1` correctly excludes the empty case. |
| 2.9 diagonal root term | `U=1+e`, `δ=m=1` | `ε(U²)=i²=−1`; correction `−B(1−(−1))/4=−B/2`, not zero | Holds; determinant-one exception is not applied here. |
| 2.10–2.12 | `diag(1,2)`; `[[1,2],[2,1]]`; `b=−2,a=c=1` | Rayleigh curve at e₂ is `2−sin²θ<2`; second matrix eigenvalues `3,−1`, cone minimum `1`; third matrix value at `(1,1)` is `−2` | Eigenvector alone is insufficient; face and sign conditions work. |
| 2.14–2.15 compression | `A=1`, constant kernel 1, block size 2 | expanded matrix `[[0,−1],[−1,0]]`; vector `(t/2,t/2)` has value `−t²/2`, equal to compressed `−t²/2`; unit-sphere minima `−1` and `−1/2` differ | Correct lift, no false equality of minima. |
| 2.16–2.18 exclusion and covers | negative F₁; rational enclosure crossing zero; positive-definite one-variable form | R01 value `<−0.03997538123` but actual class count `1`; interval upper end `1/100>0` proves nothing; `x²≤1` has integer solutions `−1,0,1`, effective solutions `0,1` | R01; other hypotheses discriminate correctly. |
| 2.19 Miller headline | cohomological rank 2; boundary rank 26 | weight list `±1/2` at rank 2, determinant `e²=1`; rank limit `26`, not `27` | Correct stated range and infinity normalization; Mil02 Theorem 1.6 read. |
| 2.20–2.21 and prior F02 | `w=11,13,23,53` | cusp dimensions `1,0,2,4`; PGL₄ target parameter dimensions `2·2=4`; odd integers 1 through 53 number `27` | Correct count; source singleton claim is wrong. |
| 3.1–3.3 multiplicity test | `Δ_w[2]⊕[1]`; one odd block | standard dimension `4+1=5`; `χ=−1`, `ε=i^(w+1)=(−1)^(k−1)`, equal iff k even; sign group order for one odd block `1` | Global multiplicity test holds. |
| 3.3 local claim | unramified rank-one Frobenius `diag(−1,−1,1)` | determinant `1`; centralizer `S(O₂×O₁)` has `2` components; full tempered packet `2`, fixed-hyperspecial spherical part `1` | R04. |
| 3.4 unitary range | `g=3,k=(1,0,0)`; `g=2,k=(1,1)` | bounds respectively `0≥1/2` false and `1≥0` true | Correct singular-range discriminator. |
| 3.7–3.8 membership | `(g,k)=(12,12)`, `Δ₁₁[12]⊕[1]`; H2 at k=2 | weights `±1,…,±11` plus zero three times, dimension `25=2g+1`; `11>0` gives I; H2 forces g=2 and a trivial length-3 block needing e, absent from 1 | Case I passes; impossible H2 boundary excluded. |
| 3.9 character signs | `(ε,a)=(−1,1),(1,3)` | `(-1)^floor(-1/2)=−1`, product `−1`; `(-1)^floor(3/2)=−1`, product `(+1)(−1)(+1)=−1` | Holds in both sign branches. |
| 3.10–3.12 remainder | `(g,k)=(16,13)` in H2 | remove length `2(16−13)+3=9`; remaining dimension `33−9=24=2(k−1)`; shortened list omits `4` | Correct length, determinant parity and renumbering convention. |
| 3.13–3.15 choice independence and EP | g=k=12; SO₃ at λ=0; SO₈ outer pair | I and H1 both give `χ=1=ε`; SO₃ EP `1`, versus `0` without the residual term; SO₈ average `(1+0)/2=1/2`, multiplied by `m_ψ=2` gives `1` | Full compact group, residual spectrum and outer averaging retained. |
| 3.15–3.16 triangular headline | simple rank-one symplectic group; induced block | Sp₂ dual rank `3`; block `Δ[2]` uses cuspidal rank `2<3`; simple rank-3 term stays separate | Lower-rank input cannot include the unknown rank-3 term; statement retains nonzero leading coefficient and supplier premises. |
| 4.4 indices | Sp₂ and SO₃ | Sp₂ full set `{Φ₁²,Φ₂²,Φ₃,Φ₄,Φ₆}` has 5 elements and 3 negation orbits; SO₃ has 5 full indices and 3 spinor-permitted indices | Definition and both quotient conventions agree. |
| 4.4/4.9 counts | prior round's full cyclotomic enumeration | symplectic orbit counts `3,12,32,92,219,530,1158,2521`; displayed Sp₁₄ value `1158` versus source `1157` | Retained computed evidence; not rerun. |
| 4.7 and Lean regularity definition | n=0; x²; xy; x²+y²; x₁x₃+x₂² | polar determinants `1,2,−1,4,−2`; permitted absolute values `1,2,1,1,2`, so the fourth fails | Both parity branches correct; empty rank admitted consistently. |
| Lean specialOrthogonalPoints | identity; reflection on x²; zero matrix in rank 1 | identity det `1`, preserves q; reflection det `−1` fails; zero det `0` fails | Real body excludes wrong isometry and zero-map models. |
| Spinor obstruction headline | rotations of orders 3,4,6 in SO₃; hyperbolic rank 4 | `Q(−1)=1,2,3`; last two are nonunit spinor classes at 2 and 3; `Φ₄²` evaluations `4,4`; `Φ₁₂` evaluations `1,1` | All-primes hypothesis, especially p=2, is indispensable and present. |
| 4.2/4.10 mass rationality and characters | identity in SO₃; highest weight 2 in Sp₂ and SO₃ | mass `ζ(−1)=−1/12`; character dimensions at identity `e₁²−e₂=4−1=3` for Sp₂ and `e₁²−e₂−1=9−3−1=5` for SO₃ | Signed measure and distinct character formulas agree. |
| 4.11–4.18 masses | SO₃; Sp₁₆ range comparison | permitted masses `−1/12,1/4,1/3`; at k=5 dimension `11/12+3/12+4/12−6/12=1`; Sp₁₆ `16≤14` is false, SO exceptions `6+6=12` | SO₃ normalization holds; R03 for the extended nonvanishing range. |
| 5.1 cover cutoff | `c=−1`, empty cover; corrected bound at m=1 | positive-definite values `≥0`, empty sublevel; trivial class count `1`; repaired standing cutoff is `c≥A_Fℓ>0` | Existing negative Check correctly rejects a vacuous cover. |
| 5.3 eleven-class headline | trivial, elliptic, GL₄, symmetric-square classes | count `1+5+4+1=11`; ranks `1,2,4,3`; Sym²Δ₁₁ weights `−11,0,11`, maximum motivic weight 22 | Holds. |
| 5.4–5.8 classifications | U_exc; A; residual alternatives | dimensions `14` and `16`; residual bound `181+2=183`; regular weight-23 count `2+3+7+1=13` | Correct bounds, no attainment or existence conclusion for every residual type. |
| 5.9–5.10 weight-24 headline | known classes and block types | `1+5+2+1+4+3=16` classes in 15 grouped types; `1260−4=1256`; possible odd rank 15 corresponds to Sp₁₄, not Sp₈ | Holds; source range corrected in roadmap. |
| 6.1 normalization | genus 1, weight 4 Eisenstein series | standard factor `ζ(s)ζ(s+3)ζ(s−3)`; Siegel operator removes the pair with shifts ±3 | Holds. |
| 6.3 neighbours | rank 16, p=2 | `255·129=32895`; row sums `18225+14670=12870+20025=32895`; reciprocity `12870·405=18225·286=5212350` | All-prime example agrees with the imported lattice-neighbour relation. |
| 6.4–6.7 theta and coefficients | g=0; n=g=1; n=1,g=2,ν=1 | empty-tuple theta term `1`; a linear coefficient x has second derivative `0`; any alternating 2-form on dimension 1 is `0` | Constant normalization, harmonicity, and overlarge genus behave correctly. |
| 6.8–6.10 first occurrence | n=16,g=4; n=24,g=12 | `Δ₁₁[4]⊕[7]⊕[1]` has rank `8+7+1=16`; target rank `9`; rank-24 source gives `Δ₁₁[12]⊕[1]` of rank 25 | Rallis string uses actual genus; cusp and higher square-integrable lifts remain distinct. |
| 6.11 central-value signs | Δ₂₁,₁₃ and Δ₁₉,₇ | epsilon products `i²²i¹⁴=i³⁶=1` and `i²⁰i⁸=i²⁸=1` | No forced central zero; positivity uses the stated analytic bound, not the sign alone. |
| 6.12/8.7 nonvanishing criterion | five recorded cases | order sums `0+0+0−1+1=0`, `0+0+0+0+0=0`, `0+0+0−1+1=0`, `0−4−4−1+9=0`, `0−12−12−1+25=0` | Correct reciprocal sign; BoechererNote's five products were read. |
| 7.2 genus-two control | k=20 | five even-ring monomials minus two noncuspidal dimensions gives `5−2=3`; cusp count `1+2+0=3` | Agrees with vdG08. |
| 7.3–7.4 regular headline | prior full sign enumeration, genus-zero inclusion | 223 positive-genus candidate parameters when the two Δ₂₃ classes are distinguished; 198 when identified; 58 passing, `29+29`; including genus zero gives 224/199/59 | Retained computed evidence; no reliance on a bare source cardinality. |
| 7.8–7.9 classifications | first nonscalar example; `(4,12)`; `(24,13)` | `(13,10,7)−(1,2,3)=(12,8,4)`; two parameters give dimension 2; last parameter rank `24+25=49` | Mathematical values hold; all 61 source table rows are reused: R02. |
| 7.10 weight-13 headline | g=24 | Δ₁₁[12] gives zero twice and ±1,…,±11 once; [25] adds zero once and ±1,…,±12 once; total dimension 49 | Exactly `0,±(13−i)` for 1≤i≤24. |
| 8.1 Eichler headline | n=8,g=1; n=16,g=1 and g=4; n=24,g=1 | source dimensions `1,2,2,24`; theta images dimensions `1,1,2,2`; kernels `0,1,0,22` | Surjectivity does not become an erroneous basis/injectivity claim. |
| 8.3 orbit-basis theorem | S₃ and C₃ permuting a three-element basis | S₃ exterior-invariant dimensions in degrees 1,2,3 are `1,0,0`; C₃ gives `1,1,1`. A transposition in a two-set stabilizer has orientation `−1`; a three-cycle has determinant `+1` | Nonabelian and cyclic tests distinguish orientable orbits from all orbits. |
| 8.5 invariant forms headline | Leech degrees 0,8,12,16,24,25; odd degree | coefficients of `t²⁴+t¹⁶+t¹²+t⁸+1` give `1,1,1,1,1,0`; central −1 gives `ω=−ω`, hence 0 in odd degree | Correct; average-characteristic-polynomial input is a declared supplier gap. |
| Root-span vanishing headline | one norm-2 root; zero space; g=0 | reflection sends the root to its negative, giving contraction `a=−a`, so `2a=0` over ℚ; positive-degree forms on zero space vanish; degree 0 invariant constants have dimension 1 | `g>0` retained; no unnecessary positivity hypothesis. |
| Theta coefficient definition and nonvanishing headline | g=0,T empty; g=24 and a full Leech Gram matrix | coefficient `ω(())` for the unique empty tuple; full-rank embeddings form an O(Leech) orbit and coefficient is `±8315553613086720000` in the source normalization | Real `finsum` body and Gram/2 convention agree; arbitrary nonzero invariant forms scale this nonzero value. |
| 8.9–8.10 rank-sixteen source | two eigenparameters, genus 8 target | ranks `4·4=16` and `2·8=16`; source dimension 2, target dimension 1, kernel dimension 1 | No erroneous injectivity of the whole source. |
| 8.12–8.14 stable headlines | k=0; k=4; k=8, g≥16 | constant dimensions `1`; rank-8 class count `1`; rank-16 class count `2`; these equal the stable M-dimensions; Siegel-map dimensions agree on both sides | Boundary `g=2k` and theta-source rank `2k` retained. |

### Lean acceptance file and headline coverage

`lake env lean` on `packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean`, run from the pinned content checkout, exited 0. Its only output was four `declaration uses 'sorry'` warnings, at lines 85, 129, 142 and 154. No missing object file required a build.

A scratch copy with `#check @name` for all eight declarations also elaborated. Every expanded type was compared with its README statement and the supplied signatures. The evenness, unimodularity, positive definiteness, rank 24 and rootlessness binders survive in both rootless theorems. Root-span vanishing retains its span hypothesis and `g>0`. The spinor theorem retains regularity and quantification over every prime. Nothing changed; no section binder was lost.

All four sorried theorems were tested on a scratch copy with one-tactic alternatives `simp`, `rfl`, `infer_instance` and `assumption`; none closed. The library-match candidates were compared with the actual pinned definitions and results; none is a one-lemma proof of a headline. An additional unrestricted `exact?` search was stopped without a result; it is not counted as a successful or exhaustive lemma search. The four statements neither restate definitions nor merely compute a Check or boundary case. No padding finding.

| README headline | Suggested.lean disposition |
|---|---|
| §2.7 cone inequality; §2.19 Miller; §2.21 repeated-weight PGL₄ vanishing | Named in the module docstring; actual automorphic classes and Rankin–Selberg analytic carriers are missing at the pins. |
| §§3.15–3.16 regular packet and triangular EP/count relation | Named in the docstring; packets, automorphic multiplicities and EP carriers are missing. |
| §§4.13–4.18 mass recovery | Named in the docstring; intrinsic adelic orbital integrals and masses are missing. |
| §4.7 spinor obstruction | `spinor_charpoly_obstruction`. |
| §§5.3–5.10 classifications through weights 22, 23, 24, including the GRH result | Named in the docstring; actual cuspidal-spectrum carriers are missing. |
| §§7.3, 7.8–7.10 Siegel dimensions and weight-13 forms | Named in the docstring; higher-genus Siegel spaces and their representation dictionary are missing. |
| §8.1 Eichler, §8.8 harmonic realizations, §8.10 theta isomorphisms, §§8.12–8.14 stable theorems | Named in the docstring; higher-genus theta maps and Siegel spaces are missing. |
| §8.5 Leech invariant forms and root-span vanishing | `finrank_invariantAlternatingForms_of_rootless`, `invariantAlternatingForms_eq_bot_of_roots_span`. |
| §8.6 harmonic Leech nonvanishing | `exists_thetaCoefficient_ne_zero_of_rootless`. Exact normalized Q_g coefficients are separately named as unstatable without the coordinate/M₂₄/Q_g comparisons. |

There are four small definitions with real bodies and four headline theorems. All eight own backticked names resolve to those declarations. Auxiliary Rayleigh and reflection results are not substitutes for missing headline statements. The header has the Mathlib root import and five individually used Tau Ceti modules, using the pin's `module`/`public import` syntax. No `set_option`, sorry'd data, empty Prop field, `lemma`, admitted example or foreign roadmap import occurs.

### Pinned library evidence

Opened the following declarations at the pins, rather than relying on the resolver's name search. In particular, the resolver explicitly did not check external library names.

| Pinned file and line | What was checked |
|---|---|
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65`, `:262` | `CuspForm.discriminantEquiv`, `ModularForm.dimension_level_one`; the newform-count computations use nonnegative even weights. |
| `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266` | `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`; eigenvector conclusion, not local-to-global minimality. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:312`; `Gamma/BohrMollerup.lean:111` | `Complex.Gamma_add_one` has `s≠0`; `Real.convexOn_log_Gamma` is on the positive real interval. |
| `Mathlib/Analysis/Fourier/Inversion.lean:175` | `Continuous.fourierInv_fourier_eq` retains integrability of the function and its transform. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`; `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227` | Native determinant characteristic polynomial and integral cyclotomic polynomial; the degree-zero cyclotomic convention is not used as a factor index. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71`; `PadicNumbers.lean:545` | Integral unit ball and prime-indexed p-adic field, including p=2. |
| `Mathlib/LinearAlgebra/Alternating/Basic.lean:67`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/LinearAlgebra/Matrix/Rank.lean:134` | Alternation law and native dimension/rank carriers, specialized over ℚ or ℂ here. |
| `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:121` | Native zeta function, not an arbitrary analytic placeholder. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154` | `Matrix.toQuadraticForm'` is the diagonal evaluation of the matrix bilinear form; no assumption that 2 is invertible in its definition. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` | Fields include `carrier.IsLattice ℚ`, symmetry and integrality. The structure does not include positivity or nondegeneracy. |
| `TauCeti/LinearAlgebra/IntegralLattice/Even.lean:67`, `Unimodular.lean:61`, `Signature.lean:171` | Separate evenness, equality with the dual carrier, and positive-definiteness predicates. |
| `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78`, `:221`; `Isometry/Basic.lean:77` | Norm is `form x x`; roots use norm 2; isometries are ambient form equivalences mapping carriers onto carriers. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98` | Nondegenerate-field spinor norm into square classes, not the integral dyadic unit assertion. |
| `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:120`, `:213`; `Smooth.lean:93` | Native group scheme, points equivalence and smoothness; no second group construction. |
| `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66`, `:136`, `:563`, `:606`, `:662` | Native code, rank 12, Type II, weight enumerator and distance 8. Coefficient sum `1+759+2576+759+1=4096=2¹²`. |
| `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33` | Rooted Construction-A lattice, not a second definition of the rootless Leech model. |
| `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean:98`, `Petersson/Eigenbasis.lean:169` | Petersson coset pairing and finite simultaneous good-Hecke eigenbasis. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `Newforms/OrthogonalBasis.lean:256` | Newform normalization and basis indexed by normalized newforms. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:304`, `CongruenceSubgroups/Basic.lean:1093` | `cuspFormsNew_one`, `Gamma1_one_map_eq_SL`, closing the level-one bridge. |

Object searches covered the pinned integral-lattice, alternating-map, spinor-norm, modular-form and Rayleigh developments, and the supplied near-match list for all eight declarations. The generic carriers are imported; none of the four headline conclusions was found already proved at the pins.

### Ownership, supplier resolution and order

Read the board package index before the ownership audit. Main has no second copy of this roadmap. The supplied overlap report has no conflicting head, dropped cited id or id defined only by an open revision. `roadmaps resolve` found no missing cross-roadmap citation or own Lean name against its indexed main and open heads. The following supplier sections were opened and compared with the consumed objects, with missing extensions treated as the explicitly declared contracts below:

- AutomorphicFormsOnReductiveGroups §§2.2, 2.4–2.5, 3.2, 3.4–3.5, 4.2, 5.1, 5.5, 6.7–6.8, 7.2–7.2a, 7.4–7.5: real parameters, purity, tensor factors, adelization and lattice automorphic realizations.
- AutomorphicLFunctionsAndLocalFactors §§AL.1.4, AL.3.2.3, AL.3.3.8, AL.3.6–AL.3.7, AL.3.9.2, AL.3.9.4: factors, pole criterion, unitary bounds and strip bounds away from poles. The last assertion explicitly supplies the all-rank completed-pair bound used in §2.6.
- AnalyticNumberTheoryPartI §§1.3, 1.8 and SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7: admissible test functions, the explicit formula and the Odlyzko kernel.
- ModularityAndLanglandsExtensions §§3.4, 3.8, 3.15, 3.17, 3.20–3.22: type, actual packets, multiplicities and scalar membership, with their external standing premises. R04 corrects what the consumer says about the finite local part.
- AutomorphicSpectralTheory §§4.4–4.5, 4.10, 6.9, 6.17, 6.19–6.20: residual/discrete spectrum, Wallach, connected-centralizer orbital integrals, EP functions and the lower-Levi trace formula. §6.17 does not already give the requested Gross rationality theorem.
- AutomorphicBundles §§11.1–11.2, 11.9, 11.16, 12.10–12.11, 12.13, 12.15: Siegel coefficients, analytic comparison, cusp boundary conditions and Hecke action, including non-neat descent.
- MetaplecticAutomorphicForms §§0.15, 2.4c, 3.1, 3.4–3.5, 3.7, 3.10, 3.21, 5.1, 5.6, 6.14: oscillator representation, theta kernel/lifts, first occurrence and local parameter relation; its generic criterion is distinct from the declared Böcherer specialization.
- SymplecticReidemeisterTorsionModSquares §4.1: the primary Zassenhaus formula. GeometryOfNumbersAndQuadraticArithmetic §2.4.2: the nondyadic integral-unit assertion, distinct from the declared dyadic extension.
- ComputationalNumberTheory §§4.17, 4.17a, 4.18, 4.26, 4.29–4.34 and 5.1: exact scalar expressions, enclosures, Gram validity, integral ellipsoid comparison and multiplicity compression. In §4.34 its lift is explicitly `t_i/m_i`, as here.
- OrthogonalTamagawaAndLatticeMass §§3.1, 4.1–4.2: lattice class sets and small-rank classification; CFSGBasicProperties P2-L: Leech/Conway action, but not the declared average characteristic polynomial.
- Main and completed suppliers: IntegralLattices §4G (`TauCetiRoadmap/IntegralLattices/README.md:1722`, the two equal p-indices), Completed/IntegralLattices Layer 1, Rank24LatticeConstructions Layer 6, ThetaSeries Layers 1, 5, 8, AlgebraicCodingTheory Layer 5, SporadicOrders Layer 1, OrthogonalSpinGroups Layer 1, LieHighestWeight Layer 6, ClassicalGroups Layers 3–5 and ReductiveGroups Layer 9. The active and completed IntegralLattices folders were distinguished.

The main roadmaps ThetaSeries, ModularForms and Rank24LatticeConstructions were also read for shape and scope. Indexed object searches over main/open work included Stark–Odlyzko positivity, Miller vanishing, spinor characteristic-polynomial constraints, invariant alternating forms and local least eigenvalues. Generic invariant-form mentions elsewhere do not state the Leech result. No second owner of a new package construction or equal fully qualified headline name was found.

Overlap check: read SiegelModularForms (#1714), OrthogonalTamagawaAndLatticeMass (#1222), ModularityAndLanglandsExtensions (#1180), AutomorphicLFunctionsAndLocalFactorsPartII (#1756), AutomorphicSpectralTheory (#925), and main Rank24LatticeConstructions, ThetaSeries, ModularForms; general packets belong to ModularityAndLanglandsExtensions, spectral/orbital-integral infrastructure to AutomorphicSpectralTheory, lattice classifications to OrthogonalTamagawaAndLatticeMass, coordinate constructions to Rank24LatticeConstructions, genus-one theta theory to ThetaSeries, classical modular foundations to the pins/ModularForms, and generalized doubling to AutomorphicLFunctionsAndLocalFactorsPartII. This package owns the level-one exclusion/classification results and even-unimodular higher-genus harmonic theta specializations; SiegelModularForms explicitly imports its §§6.1–6.2, 6.4, 6.7, 7.3 and 7.9. No shared object has two owners in the inspected scopes.

The required dependency command returned:

```text
depcheck: 208 roadmaps, 1912 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs line was read; no forbidden supplier, upward supply or cycle was found. The consumer SiegelModularForms is not used as a supplier.

The same eight gap slugs occur in `design/plan.json` and the README's “What … must provide” contracts: `sp2g-lowest-weight-modules`, `siegel-adelic-lift`, `gross-volume-rationality`, `same-type-pair-root-number`, `boecherer-theta-image`, `integral-spinor-norm-units`, `split-orthogonal-regular-form`, `conway-group-average-charpoly`. Each has a named supplier and a specific mathematical requirement. Their current absence is not a finding; no duplicate supplied theorem or unowned slug was found. The corrected split-form order agrees in both places.

### Principles, shape and source independence

The roadmap keeps all finite primes, including dyadic arithmetic, and separates conditional global classification premises from unconditional analytic assertions. It neither replans a main roadmap nor uses an upward shortcut. Numerical algorithms belong to the named computational supplier; this README's own claims are mathematical identities, finite classifications and exact inequalities. The eight layers have Examples and Dependencies. All 110 numbered targets have at least three listed Checks; the definitions also have prose APIs. The mathematical discriminator tests are recorded above, rather than inferred from that count. No process residue, machine path, pull-request number or LaTeX delimiter was found in the roadmap prose or Lean docstring. Mathematical “packet” is used in its standard representation-theoretic sense.

Compared the fifteen sampled passages and nine additional passages: §§1.4, 2.3, 2.19, 4.7, 5.8, 6.12, 7.2 and the two Lean Leech headline docstrings. Sources were CT20, CL14, CT19a, Tai17, Mil02, vdG08 and BoechererNote. Apart from mathematical formulas, names and forced hypotheses, no copied prose or clause-by-clause translation was identified in these comparisons. The two complete tables are a separate reuse defect, R02.

Counting explicit source-key occurrences before References gives CT20 113, CL14 20, CT19a 16, Tai17 12, Mil02 2, vdG08 2, BoechererNote 2, KT87 1: 168 keyed citations, with compound locators counted once per key occurrence. CT20's contents at lines 52–80 were compared with all eight layers. Its main progression is explicit formula / masses / classifications / Siegel theory. The roadmap separately constructs packet characters before masses, theta interfaces before the low-weight dimension theorem, and harmonic/stable conclusions using CT19a and CL14. The dependency `4.11 → 3.16`, classification's use of Layers 2 and 4, and Layer 7's use of Layers 3–6 force these choices; this is not a one-to-one relabeling of the source's contents.

Source independence: 24 prose passages compared with 7 sources; no prose copying identified; complete-table reuse in R02. Largest share CT20, 113 of 168 keyed citations; contents compared with CT20: independent layer organization. KT87's text remains uncertified and was not compared.

## Not verifiable

- KT87, pp. 466–511: settled uncertified access. Its determinantal character formulas were tested on rank-one examples, not certified by reading that text. No new source request was made.
- CT20's external 181-element list, exclusion families, mass tables and full-rank matrices: the cached paper states their properties but does not contain the underlying data. I did not run source programs or claim independent certification of those datasets. In particular, no `Sp₁₆` nonvanishing result is inferred from an unread data table.
- The additional unrestricted `exact?` run produced no result before it was stopped. The completed original build, all eight signature checks, all four finite tactic probes and direct library comparisons are the Lean evidence; no process remains running for this review.

## Source issues

- **Error** in CT20 at §2.4.7, printed p. 25: the source says the elliptic class set has one element for every remaining odd weight; it should have dim S_(w+1), including 2 at w=23 and 4 at w=53; affects the proof.
- **Misprint** in CT20 at Table 2 and §3.3, printed pp. 28 and 33: the source says Sp₁₄ has 1157 polynomial orbits; it should have 1158 by the definition's cyclotomic enumeration; affects nothing.
- **Misprint** in CT20 at footnote 13, printed p. 33: the source says dim S₂₃(SL₂(ℤ)) is 2; it should say dim S₂₄ is 2, since odd-weight full-level forms vanish; affects nothing.
- **Misprint** in CT20 at proof of Proposition 4.1, printed p. 36: the source says the self-dual exclusions leave 187 elements of U₂; it should say U₁, the one-class cover used in that paragraph; affects the proof.
- **Misprint** in CT20 at proof of Proposition 4.1, printed p. 36: the source says U₁ has 12230 elements, then subtracts 187 from 12293; it should use a consistent cover cardinality and distinguish any enlarged cover; affects nothing.
- **Misprint** in CT20 at proof of Proposition 4.1, printed p. 36: the source says the one-class bound evaluates the transform at i/π; it should use i/(4π), as in Corollary 2.3; affects nothing.
- **Error** in CT20 at proof of Proposition 4.1, printed p. 36: the source says all six regular residual parameters are unrepresented; it should except the first, the known rank-10 class; affects the proof.
- **Misprint** in CT20 at proof of Theorem 5, printed p. 38: the source says the rank-at-most-16 argument uses Sp₂n only for 2n≤8; it should permit 2n≤14 to include odd ranks through 15; affects the proof.
- **Misprint** in CT20 at proof of Theorem 4, printed p. 38: the source says δ=m=2 for excluding the exceptional dual pair; it should say δ=0 and m=2, since δ is Boolean; affects the proof.
- **Misprint** in CT20 at proof of Theorem 4, printed p. 39: the source says every parameter in V must be excluded; it should exclude V except A, which its theorem leaves possible; affects the proof.
- **Misprint** in CT20 at Remark 5.3, printed p. 45: the source says k≥2 in H2 although its argument excludes k=2; it should say k≥3; affects nothing.
- **Misprint** in CT20 at the Rallis relation in §5.3.2, printed p. 50: the source says the extra block uses first-occurrence genus g₀ for a lift in genus g; it should use g, as the standard dimensions require; affects a stated result.

## For the human reviewers

- KT87's text is settled uncertified in `packages/LevelOneAutomorphicFormsForClassicalGroups/sources.toml`; its wording and arrangement were not compared. The dominant source CT20 and its contents were accessible and checked.
- BoechererNote is an author-hosted companion note, recorded as operator-resolved in the manifest. It supplies the five specialized order computations; the general theorem remains a declared supplier contract.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b5475a636017a89dc8c155f997242d418c8cb5bd", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups~7", "model": "gpt-6-astra", "worker": "chris-6"} -->
