<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6858508464 -->
Red team round 1 pass a (codex) of 56357cf

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) Sign changes act diagonally on wedge monomials, not orbit sums

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2898, “An element `S ∈ G₂₄` acts on `σ_T` by `(−1)^{|S ∩ T|}`”.

   **Claim:** Every Golay sign change scales a Mathieu orbit sum by the intersection sign.

   **Witness:** For singleton `T={p}` and octad `S` through `p`, the image of `σ_T=Σe_i` has eight negative coefficients; the asserted `−σ_T` has twenty-four. CT19a lines 292–299 concern monomials `β_T`.

   **Exact repair text:** “A codeword `S` sends the wedge monomial `β_T` to `(−1)^{|S ∩ T|}β_T`. If `T` is a codeword, every monomial in `σ_T` is fixed by every codeword sign change. If an orientable `T` is not a codeword, choose a codeword `S` meeting `T` oddly; the coefficient of `β_T` changes sign, so `σ_T` is not fixed by `S`. For `T = {p}` and an octad through `p`, the image of `Σ_i e_i` has eight negative and sixteen positive coefficients.” Replace line 2900 with: “For a non-orientable orbit, invariance forces its wedge coefficients to vanish; an orbit sum over stabilizer cosets is defined only for orientable subsets.”

   **Retest:** The singleton witness now changes one specified coefficient without incorrectly claiming that the whole sum is an eigenvector. The codeword case remains fixed because every transformed codeword has even intersection with `S`.


2. **F02** (P2) The permitted groups include an undefined rank-zero triangular term

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:545 and :1587, “for a permitted `G`, dominant `λ` and `w = w(λ)`”.

   **Claim:** Every permitted group admits the nonzero simple-parameter coefficient in §3.16.

   **Witness:** At `n=0`, `SO₁=1`, `m_G=0` and `EP(1;0)=1`. Section 1.1 admits only ranks `m≥1`, so the simple parameter defining `κ` does not exist.

   **Exact repair text:** “The positive-rank groups in the mass recursion are `Sp_{2n}` and `SO_{2n+1}` for `n ≥ 1`, and `SO_{4n}` for `n ≥ 1`. For the trivial group, the empty parameter contributes `EP(1;0) = 1`; there is no rank-zero cuspidal count or simple-parameter coefficient. Section 3.16 applies to the positive-rank groups.” Add this convention at §1.3 and its boundary Check to §3.16. Keep the unrestricted matrix rank in §4.7 and Suggested.lean.

   **Retest:** `SO₁` now contributes the explicitly supplied base value `1`, without invoking a nonexistent rank-zero cuspidal representation. For `SO₃`, the formula remains `κ = −1`, `R = δ_{k,0}`.

3. **F03** (P2) Central-order theory is narrowed to two consumers

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2514–2518, “the completed standard `L`-functions of `Δ₁₉,₇` and `Δ₂₁,₁₃` do not vanish”.

   **Claim:** Section 6.11 develops only these two instances of the cited central-order theorem.

   **Witness:** CL14 line 12315 (IX Proposition 3.38, p. 322) gives the central order for every self-dual class of motivic weight at most 22, including order `1` for `Δ₁₇` and `Δ₂₁`.

   **Exact repair text:** Replace the target with: “For every self-dual `π ∈ Π_alg` with motivic weight at most 22, prove `ord_{s=1/2} Λ(s,π) = (1−ε(π))/2`. The sign is `−1` exactly for `Δ₁₇` and `Δ₂₁` (CL14 IX Proposition 3.38, p. 322).” Keep the two required nonvanishing instances as Checks, together with the order-one instance `Δ₁₇`. In the proof plan use the central-zero lower bound in §2.6 for every class in §5.3 and the rational enclosures of §2.4; retain §§6.12 and 8.7 as consumers.

   **Retest:** The two current inputs still have `ε = 1` and order `0`; `Δ₁₇` has `ε = i¹⁸ = −1` and order `1`. This restores the source's generality without introducing a new automorphic carrier.

4. **F04** (P3) The rank negative control has impossible dimensions

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1895, “Full row rank does not suffice when `|Λ| > |P₁(G)/∼|`”.

   **Claim:** A tall matrix provides a negative control separating full row rank from the needed full column rank.

   **Witness:** For a matrix with four rows and three columns, rank is at most `3`; full row rank would require `4`. Thus the proposed hypothesis is impossible and tests nothing.

   **Exact repair text:** “Full row rank is insufficient when there are fewer rows than columns: `A = [[1,0,0],[0,1,0]]` has full row rank `2`, but `A m = 0` has the distinct solutions `(0,0,0)` and `(0,0,1)`. Full column rank is required.”

   **Retest:** Both displayed vectors map to `(0,0)`, and the nullspace has dimension `1`.

5. **F05** (P2) Numerical source tables are reproduced as lists

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1842–1845 and :2987–2988.

   **Claim:** The complete cardinality rows and five-factor order rows are retained verbatim as numerical lists.

   **Witness:** Compare the cardinality rows with CT20 lines 1144–1146 and 1284–1287, and the order rows with BoechererNote lines 114–118. Changing table rows into inline tuples retains their selection and arrangement.

   **Exact repair text:** State the facts the roadmap needs in its own form, with the locator. Replace §4.9's rows with: “For each permitted degree, express the cardinality of the cyclotomic index set modulo negation as half the sum of the number of indices and the number fixed by negation; use the analogous restricted count for the spinor-filtered set (CT20 Tables 2–3).” Retain the independent Checks at degrees 2, 4 and 14. Replace §8.7's tuple list with: “For each of the five parameters, prove that the sum of the orders of the polynomial factor, reciprocal zeta product, gamma ratio, completed standard function and reciprocal archimedean factor is zero, and that their leading coefficients are nonzero (BoechererNote pp. 2–3).” Retain the explicit genus-16 sign Check of §6.12 and the genus-24 pole count.

   **Retest:** In degree 4 the orbit count is `(19+5)/2=12`; in degree 14 it is `(2257+59)/2=1158`. In genus 16 the factor orders sum to `0−4−4−1+9=0`. The repaired statements retain the needed mathematics without reproducing whole source rows.

6. **F06** (P2) Polynomial coefficients do not exist for the admitted negative weights

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:127–129, “irreducible polynomial representation of `GL_g(ℂ)` of highest weight `k`”.

   **Claim:** This defines the coefficient representation for every dominant integral weight, including the negative weights of §6.2.

   **Witness:** For `g=1`, `k=(-1)` is dominant. Its character is `t↦t⁻¹`, an algebraic representation of `GL₁` but not a polynomial representation. Thus the stated coefficient object for `M₋₁(Γ₁)` does not exist.

   **Exact repair text:** “For a dominant integral weight `k=(k₁≥⋯≥k_g)`, use the irreducible algebraic representation of `GL_g(ℂ)` with highest weight `k`; it is polynomial exactly when `k_g≥0`. Equivalently it is `det^{k_g}` times the polynomial representation of highest weight `(k₁−k_g,…,k_{g−1}−k_g,0)`.”

   **Retest:** At `g=1,k=-1` the coefficient is `det⁻¹` and the negative-weight vanishing statement is meaningful. At `g=2,k=(1,-1)` it is `det⁻¹⊗Sym²`, with highest weight `(1,-1)`; at `(1,0)` it is the polynomial standard representation.

7. **F07** (P3) The theta spanning target precedes its construction

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2310–2315, “§6.4 for the theta series in the last item”.

   **Claim:** Section 6.2 includes a theorem using the theta map before §6.4 constructs that map, despite the declared build order.

   **Witness:** The last target of §6.2 requires §6.4; §6.4 requires §§6.1 and 6.3. Thus the necessary local order is `6.1 → 6.3 → 6.4 → spanning`, not `6.1 → 6.2 → 6.3 → 6.4`.

   **Exact repair text:** Move only the Freitag spanning target from §6.2 to the end of §6.4. Leave the vanishing statements in §6.2. Add at §6.2: “The theta-spanning statement formerly included here is now the final target of §6.4.” Change the spanning citations in §§8.14 and 6.2's Checks to §6.4. Give that target its own Needs line: “§§6.1 and 6.3; the theta construction earlier in §6.4; CT20 (5.5.2).”

   **Retest:** For `k=4,g=9`, §6.3 supplies `[E₈]`, §6.4 constructs its theta series with constant coefficient `1`, and only then the spanning result identifies its line with `M₄(Γ₉)`. The vanishing `S₄(Γ₉)=0` still precedes it.

8. **F08** (P2) The Rankin–Selberg supplier contract loses pole translations

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:278–280, “simple poles exactly at `s = 0, 1` when `π′ ≅ π^∨` up to a unitary norm twist”.

   **Claim:** Allowing a unitary norm twist does not move the poles.

   **Witness:** TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1752 takes `π=1`, `π′=|·|^{2i}`. The completed product is `Γ_ℝ(s+2i)ζ(s+2i)`, with poles at `−2i,1−2i`, not `0,1`.

   **Exact repair text:** “Section AL.3.6.1 supplies continuation and simple poles at `s=iσ,1+iσ` when the ranks agree and `π^∨≅π′⊗|det|^{iσ}`. In this roadmap's `Π_alg` application, algebraicity and the fixed unitary normalization force `σ=0`, so the poles occur at `0,1` exactly for the contragredient pair.”

   **Retest:** The supplier's norm-twisted trivial pair gives `σ=−2` and poles `−2i,1−2i`; the trivial pair gives `σ=0` and poles `0,1`. No change to the explicit formula on `Π_alg` is required.

9. **F09** (P2) Regular packet occurrence is planned twice

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1360–1364, “`ρ_k` lies in the real packet ... exactly when `d_{i₀} = 1`”.

   **Claim:** The regular holomorphic occurrence criterion and its specified packet character are new proof targets here.

   **Witness:** TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:2156 already states the same `Sp_{2g}`, `k_g>g`, `d_{i₀}=1` occurrence criterion with the CT packet character, citing CT20 (5.2.1).

   **Exact repair text:** “Import from ModularityAndLanglandsExtensions §3.21 the regular holomorphic packet occurrence criterion, multiplicity one and its CT20 (5.2.1) character. Specialize it to the level-one parameter carrier of §3.1. Prove here that regular infinitesimal weights force regular constituents, one odd-dimensional block, and `4 | n_i d_i` for every even-dimensional block; identify the imported character's position count with the `e_i` used below.” Add the exact occurrence and character input to the supplier contract, keeping the formulas and Checks as the imported interface.

   **Retest:** For `Δ_w[2]⊕[1]`, the imported condition reads `d_{i₀}=1`; the character is `(-1)^{2·2/4}=−1`. There is one owner for that criterion and a distinct level-one adapter here.

10. **F10** (P3) The mass definition has only two discriminating Checks

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1674, “Two rational classes in one geometric class contribute to a single coefficient”.

   **Claim:** This is the third independent Check of the geometric torsion-class/mass definition.

   **Witness:** Section 4.1 defines the coefficient by grouping precisely those classes. The Check merely repeats that grouping, leaving only the identity mass and locally impossible classes as discriminating tests.

   **Exact repair text:** Replace that Check with: “In `Sp₂=SL₂`, `u=[[1,1],[0,1]]` and the identity have the same characteristic polynomial `(X−1)²`, but `u^r=[[1,r],[0,1]]≠1` for every positive integer `r`. Thus `u` does not define a torsion class in `C(G)`; characteristic-polynomial membership alone is insufficient.”

   **Retest:** At `r=1,2,3`, the upper-right entry is `1,2,3`, while the identity's is `0`. This tests the finite-order restriction independently of the two mass-value Checks.

11. **F11** (P1) The character coefficient rule omits monicity

   **Location:** packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1858 and :1867, “For an integral polynomial `P` of degree `d_G`”; “`e_j = (−1)^j` times the coefficient”.

   **Claim:** The elementary symmetric functions of the roots equal the signed coefficients of every integral polynomial of the specified degree.

   **Witness:** In degree 2 take `P=2(X−1)²=2X²−4X+2`. Its roots are `1,1`, so `(e₀,e₁,e₂)=(1,2,1)`; the asserted signed coefficients are `(2,4,2)`.

   **Exact repair text:** “Let `P∈ℤ[X]` be monic of degree `d_G`. For `0≤j≤d_G`, define `e_j` as the elementary symmetric function of its roots, counted with multiplicity; then `e_j=(−1)^j [X^{d_G−j}]P`. Set `e_j=0` outside this range. Apply the character formulas only when `P` is the characteristic polynomial of the stated classical-group element.” Add the nonmonic polynomial above as a negative-control Check.

   **Retest:** For the monic polynomial `(X−1)²`, both sides are `(1,2,1)`. The polynomial `2(X−1)²` is excluded, as it must be: no matrix has a characteristic polynomial with leading coefficient 2.

## Verified sound

Read all 3,157 README lines and all 162 Suggested.lean lines: 110 numbered target sections, eight Lean declarations (four definitions and four theorems), and 359 Check bullets. The tables below record 110 target-level test groups and eight declaration-level test groups. They do not certify all 359 Checks independently; large numerical witnesses are identified under Not verifiable. The six bold convention blocks were also tested: weights at `(−1)` and `(1,−1)` (R06); `I₁²` and `I₀`; doubled weights `±11`; epsilon `i¹⁸=−1`; the stated Arthur premises versus the supplier's premises; and rank-zero/rank-one rational lattices versus positive rank 24.

The four Lean headline statements have no identified false instance, dropped binder, one-tactic library proof, or Check-only padding. All four definitions have real bodies and serve those statements. The bare `finsum` definition is total on indefinite lattices, but its nonvanishing theorem explicitly assumes positivity. No theorem depends on the value of a divergent sum. Root reflections preserve the lattice because integrality gives `B(x,r)∈ℤ` and `B(r,r)=2`; this argument works even when the ambient form is degenerate.

The supplied elaboration record was compared declaration by declaration; no signatures were changed and no Lean process was run. This review uses that supplied record rather than claiming a fresh elaboration. There are no section variables or implicit standing hypotheses to be recovered: every material hypothesis is in its declaration's type.

| Lean declaration, section and line | Actual binder / instance context | Computed tests and result |
|---|---|---|
| `IsRegularIntegralForm`, §4.7, packages/LevelOneAutomorphicFormsForClassicalGroups/Suggested.lean:68 | `{n:ℕ}`, integer n×n matrix; no instances/hypotheses | Empty determinant1, Even0=true: regular. Rank1 matrix[1] gives polar determinant2: regular. Hyperbolic plane determinant−1: regular. diag(1,1) gives4: not regular. |
| `specialOrthogonalPoints`, §4.7, :74 | `{n:ℕ}`, integer matrix c, `R:Type u`, `[CommRing R]`; no implicit regularity | Identity satisfies determinant1 and q(Ix)=q(x). Over ℤ, rank1 c=[1], −1 preserves q but determinant−1 excludes it. Rank2 hyperbolic diag(2,1/2) belongs over ℚ, not ℤ. Over the zero ring the unique matrix satisfies 0=1; the docstring only identifies group-scheme points over the specified characteristic-zero domains. |
| `spinor_charpoly_obstruction`, §4.7, :85 | Regular c; a,b:ℕ; Q:ℚ[X]; Q(1)Q(−1)≠0; for every p with `[Fact p.Prime]`, local integral γ with the displayed characteristic polynomial | n0,a=b0,Q1: both absolute evaluations1=1². n1,c1,γ1: a1,b0,Q1 gives1. SO₃ indices Φ₁Φ₄,Φ₁Φ₆ give nonsquares2,3 and are excluded; Φ₁Φ₃ gives1. The local predicate includes p2 and p3. |
| `invariantAlternatingForms`, §8.5, :101 | Arbitrary universe V, `[AddCommGroup V] [Module ℚ V]`, integral lattice L, g:ℕ; no positivity assumed | g0 invariants are constants, dimension1. Root line with B(x,x)=2,g1: ω(−x)=−ω(x) and invariance forceω(x)=0. V0,g1: alternating-map space0. For trivial group on ℚ², degree1 would have dimension2; requiring all lattice isometries including −1 removes it. |
| `thetaCoefficient`, §8.6, :118 | Same V instances; L; implicit g; alternating ω; rational g×g matrix T; no implicit positivity | g0 has one empty tuple and coefficientω(()). On positive root line,g1,ω(x)=x,T=[2], vectors±1 cancel to0. T=[−2] has no tuples and sum0. Replacing ω by2ω doubles every finite coefficient. |
| `finrank_invariantAlternatingForms_of_rootless`, §8.5, :129 | Same V instances; L even, unimodular, positive, finrank24, all lattice vectors have norm≠2; g arbitrary | g0:1=1; g1:0=0 by −1; g25:0=0 by exterior dimension. Source average gives coefficient1 in degree8. Rooted Golay Construction A instead has degree8 dimension0, and fails the rootless premise. |
| `invariantAlternatingForms_eq_bot_of_roots_span`, §8.5, :142 | Same V instances; rational span of image of `L.vectorsOfNorm 2` equals top; `0<g`; no definiteness assumption | Root line,g1: fixed form0. Zero space,g1: both submodules0. g0 would have constantsℚ≠0 and is excluded. A degenerate rank2 form diag(2,0) has roots (±1,b) spanning; reflection in (1,0) forces first slot zero and roots (1,1) force the radical slot zero. |
| `exists_thetaCoefficient_ne_zero_of_rootless`, §8.6, :154 | Same five lattice premises; g∈{8,12,16,24}; ω invariant and nonzero | Source degree8 coefficient has magnitude5·831555361308672000=4157776806543360000. Scaling ω by−1 negates it; by2 doubles it. ω0 makes every coefficient0 and is excluded. No canonical normalization of ω is claimed. |

Native carrier checks used `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` (finite generation, spanning, symmetric integral form, no nondegeneracy), `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean:77` (ambient equivalence and carrier equality), `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78` and :221 (norm and root set), and `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:171` (positivity). Mathlib's matrix quadratic form, characteristic polynomial, p-adic cast and alternating-map carriers match these signatures. The near-match list's `spinGroup`, generic `finrank`, Fourier-coefficient and matrix-subblock declarations prove none of these four theorems.

Headline coverage:

| README headline | Acceptance-test coverage |
|---|---|
| Spinor obstruction §4.7 | Stated with unrestricted matrix rank and every prime. |
| Leech invariant dimensions and root-spanning vanishing §8.5 | Both stated on native lattices. |
| Leech harmonic theta nonvanishing §8.6 | Stated as actual nonzero Fourier coefficient; the stronger normalized coefficient is expressly unavailable. |
| Stark–Odlyzko inequality, Miller and repeated-weight exclusions §§2.7,2.19,2.21 | Named in docstring; missing automorphic representation/L-function carriers. |
| Packet EP and triangular counts §§3.15–3.16; exact masses §§4.13–4.18 | Named in docstring; missing packets, cohomology and trace-formula carriers. |
| Cuspidal classifications §§5.3–5.10 | Named in docstring, including conditional GRH branch. |
| Genus≤8 dimensions, low-weight enumerations and four weight-13 forms §§7.3,7.8–7.10 | Named in docstring; missing higher-genus Siegel carriers. |
| Eichler basis, harmonic realization, alternating and stable theta isomorphisms §§8.1,8.8,8.10,8.12–8.14 | Named in docstring with missing Siegel operator/theta carriers. |

No omitted statable headline was established by the pinned-object searches. The general orbit-basis construction of §8.3 is a supporting target, not a replacement headline for the Leech theorem.

The dependency command returned exactly:

```text
depcheck: 238 roadmaps, 2162 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This global result does not detect the local ordering issue R07. The diff against origin/main contains only the package folder. No README/Lean edit, build, push, post or Git mutation was performed.

Supplier verification covered 67 distinct numbered contracts listed below, against the supplied heads or main, with their actual mathematical context. R08 and R09 are the resulting contract discrepancies; declared future gaps were not mistaken for absent current targets.

| Supplier | Sections directly compared |
|---|---|
| AutomorphicFormsOnReductiveGroups | 2.5,5.1,5.5,6.7,6.8,7.2,7.2a,7.4,7.5 (9) |
| AutomorphicLFunctionsAndLocalFactors | AL.1.4.2,AL.1.4.3,AL.3.6.1–3,AL.3.7.1–2 (7) |
| AnalyticNumberTheoryPartI | 1.3,1.8 (2) |
| SmallRamificationAndAbelianVarietyBaseCases | 1.5–1.7 (3) |
| AutomorphicSpectralTheory | 4.4,4.5,4.10,6.9,6.17,6.19,6.20 (7) |
| ModularityAndLanglandsExtensions | 3.4,3.8,3.15,3.17,3.20–3.22 (7) |
| AutomorphicBundles | 11.1,11.2,11.9,11.16,12.10,12.11,12.13 (7) |
| MetaplecticAutomorphicForms | 3.4,3.5,3.7,3.10,3.21,5.1,5.6,6.14 (8) |
| GeometryOfNumbersAndQuadraticArithmetic | 2.4/2.4.2 (1 contract) |
| OrthogonalTamagawaAndLatticeMass | 3.1,4.1,4.2 (3) |
| SymplecticReidemeisterTorsionModSquares | 4.1 (1) |
| CFSGBasicProperties | P2-L (1) |
| ComputationalNumberTheory | 4.17–4.18,4.26,4.29–4.34,5.1 (11, including 4.17a). |

All eight declared gap slugs occur in both README and design/plan.json with the named supplier. The lowest-weight gap is needed at `(g,k)=(3,(1,0,0))`; the scalar discrete-series supplier alone does not supply its failed bound `0≥1/2`. The dyadic spinor gap is separate from the nondyadic unit-square-class theorem. The Conway average is not supplied merely by the current P2-L order/simplicity statements. No new gap request was generated.

Ownership searches used the roadmap grep/show tools, the supplied sibling checkout index and the main/completed files. The closest SiegelModularForms head explicitly consumes the level-one results; its general-level theta comparisons do not replace the level-one classification here. Rank24LatticeConstructions and OrthogonalTamagawaAndLatticeMass own the lattice models/classification, not the new invariant-form/nonvanishing assertions. The overlap with open #2285 is this roadmap's existing downstream proposal: its README differs and must be updated with the repaired package before merging; it is not a second copy already on main. No second independent roadmap declaring these eight fully qualified Lean names was found.

The tables record computed boundary/normalization tests, not proofs of the classification or of unprovided numerical certificates. “Source” means the named classification is used to evaluate that instance, not independently rederived. A dash in the change column means this instance did not refute the statement.

| README target | Instances and computed values | Result / change |
|---|---|---|
| 1.1 Level-one spectrum | Trivial PGL₁: rank 1, weight 0, dual itself. At p=2 complementary roots 2^(±1/4): product 1, maximum 1.189207, below √2=1.414214. Level-11 newform has ramified conductor 11. | Unitarity is not temperedness; ramified example excluded. |
| 1.2 Weil ring | I₁²=I₂+1+e: dimensions 4=2+1+1; e²=1, eI₇=I₇; I₂₃² includes I₄₆. | Parity and nonclosure agree. |
| 1.3 Integral groups | Polar matrix for x₁x₃+x₂² has determinant −2; hyperbolic plane has determinant −1. diag(p,p⁻¹) has determinant 1 but nonintegral last entry. At n=0, SO₁=1. | Positive-rank recursion needs R02. |
| 1.4 Gamma/epsilon | Γ_R(1)Γ_R(2)=1/π=Γ_C(1); ε(I₀)=i; dim I₁₁=2, det=e¹²=1, ε=i¹²=1. | — |
| 1.5 Purity | Δ₁₁ weights ±11/2, motivic weight 11; Sym² has −11,0,11, motivic weight 22; trivial class weight 0. | — |
| 1.6 Regularity | (1,0,0,−1) has one permitted repeated pair; (1,1,−1,−1) has two forbidden pairs; (1/2,0,−1/2) has nonintegral difference 1/2. | Ordered-pair convention excludes the wrong model. |
| 1.7 Counts | Rank-one fibre has N=N⊥=1. Weight-24 elliptic forms: dim M₁₂=2, hence N(23/2,−23/2)=2. A dual pair has N=2,N⊥=0. | — |
| 1.8 Type/root signs | ε(I₁₁I₁₅)=i²⁷i⁵=1; ε(I₁₇)=i¹⁸=−1. I₁+2I₂₃ has dimension 6 and simple weight 1/2; 2I₁ has multiplicity 2 at both weights and admits both types. | Simple-weight condition is necessary for the stated inference. |
| 1.9 Weight dictionary | Sp₂,λ=0 gives (1,0,−1); SO₃,λ=0 gives (1/2,−1/2). Inverting (0,0,0) gives λ=−1; inverting (1,1,−1,−1) for SO₄ gives (0,1), not dominant. | — |
| 2.1 Test functions | ρ=0,1,1/2 gives ξ=−i/(4π),i/(4π),0. Triangle transform has value 4 at zero, whereas totalized sin²(0)/0² gives 0. | Removable value correctly separated. |
| 2.2 Odlyzko kernel | g(0)=1; u*u(0)=1/2; g(1)=g′(1)=g″(1)=0. At x=ℓ/2, F/G=1/cosh(ℓ/4)<1. | — |
| 2.3 Archimedean functional | I₁² gives J(I₂)+J(1)+J(e). For (1−x²)³ on [−1,1], positive-half integral is approximately 0.2254836448, opposite unsigned gamma difference is negative. | Sign fixed by positive integrand. |
| 2.4 Scalar comparisons | At ℓ=1, A_F=B_G=8/π²≈0.8105694691; at ℓ=2 both double to ≈1.6211389383. A_G at ℓ=1≈0.8202154544. | Two pole scalars are distinct; last decimal approximate. |
| 2.5 Bilinear forms | Distinct Δ₂₃ classes: δ=0 despite equal infinity type; ε(Δ₁₇)=−1 gives e⊥=1. Diagonal prime term is a squared modulus ≥0. | — |
| 2.6 Explicit formula | F=0: every term 0. Trivial pair: Γ_R(s)ζ(s) has residues −1 at 0 and 1 at 1; pole transform total is 2A_F, divided formula gives A_F. | — |
| 2.7 Cone inequality | x=Δ₁₇−1 has cross coefficient −2, so pairwise inequalities cannot be added. x=1 gives A_F−J_F(1)≥0; x=0 gives 0≥0. | Cone restriction retained. |
| 2.8 Multiplicity bound | m=2 gives A_F/2, m=1 gives A_F. At m=0, averaging vector is 0 under totalization and inequality is only 0≥0, not J(U²)≤0. | Positive multiplicity retained. |
| 2.9 Admissible Gram data | I₀²=2+2e, ε=i²=−1 gives diagonal A_F−J(2+2e)−B_F/2. Pair (1,e) has ε=i and fails real-sign guard. | — |
| 2.10 Rayleigh minimum | diag(1,2): quotient at e₁=1, at e₂=2; e₂ is a maximum, not a minimum. In dimension 1 the two sphere points both have the only eigenvalue. | Imported extremum lemma alone is insufficient, as stated. |
| 2.11 Principal faces | diag(1,−1): cone minimum −1 at e₂. [[1,2],[2,1]]: unrestricted eigenvalues −1,3, cone minimum 1 at singleton faces. | Both directions distinguish eligible faces. |
| 2.12 Two coordinates | (a,b,c)=(1,−2,1): q(1,1)=−2; (1,2,1): determinant remains −3 but q≥0 on cone. b=−1 gives (x−y)² and minimum 0. | — |
| 2.13 Equal blocks | Identical two singleton blocks with A=1,K_ij=1 give matrix [[0,−1],[−1,0]], minimum −1 at (1,1)/√2. diag(1,1) has minimum 1 at unequal-coordinate e₁. | Negative-minimum condition separates cases. |
| 2.14 Flags | Newly activated ε=−1 subtracts B_F/2 from an entry. Off-diagonal pair at x=(1,1) subtracts B_F; at (1,−1) adds B_F. ε=1 subtracts 0. | Order only on cone. |
| 2.15 Compression | One block m=2,A=K=1: expanded [[0,−1],[−1,0]] minimum −1, compressed [−1/2] minimum −1/2. Lift t=1 to (1/2,1/2) gives −1/2 on both sides. | Negativity, not minima, agrees. |
| 2.16 Enclosures | [[1,−2],[−2,1]] at (1,1) gives −2. Interval [−.01,.01] has upper endpoint .01>0. Zero vector gives 0. | — |
| 2.17 Exclusions | S empty, one candidate: β=A_F−J(U²), with root correction −B_F/2 when ε(U²)=−1. At F=−F₁, trivial class exists but β<0 since F₁(log2)log2/√2≈.0399754>0. | POS cannot be omitted. |
| 2.18 Covers | B=[1],c=1 has effective points 0,1; B=[0],c=1 has every natural number. For B=[[0,1],[1,0]] and x=(1,−1), quadratic value −2. | Definiteness and cone hypotheses discriminate. |
| 2.19 Miller | n=0 families have dimensions 2 and 1; n=12 dimensions 26 and 25. Odd family determinant eⁿeⁿ=1. Rank-one parameter is 1 and its class exists. | Rank-one exception correct; strict analytic certificates not recomputed. |
| 2.20 Elliptic dimensions | w=11: dim M₀=1; w=23: dim M₁₂=2; even w gives odd classical weight and dimension 0. | — |
| 2.21 Repeated weights | w=53: dim S₅₄=dim M₄₂=3+1=4. Number of odd w in [1,53] is 27; dim(2I_w)=4 versus dim I_w=2. | No inference from a one-copy Gram witness. |
| 3.1 Parameters | Δ₁₇[8]+[9]+[7]+[1] has dimension 33; Δ₁₁[12]+[25] has dimension 49. Repeating class 1 at distinct lengths is allowed; repeating an identical pair twice fails discreteness. | — |
| 3.2 Component character | One odd block gives kernel size 1; three odd blocks give 2^(3−1)=4; (s₁s₂)(s₂s₃)=s₁s₃. For Δ₁₇[2]+[1], sign i¹⁸=−1. | — |
| 3.3 Multiplicity | Sp₄ scalar k=10: local −1 equals (−1)^9=−1; k=11: −1 differs from (−1)^10=1. Unramified quadratic SL₂ packet has 2 members, only 1 spherical for fixed hyperspecial. | Fixed level is essential. |
| 3.4 Lowest weights | g=1,k=0: criterion 0≥0, module trivial. g=2,k=(1,1): bound 0≤1. g=3,k=(1,0,0): required 0≥1/2 is false. | Dominance alone insufficient. |
| 3.5 Regular packet | Δ_w[2]+[1]: odd-block length 1, even-block dimension 4, character (−1)¹=−1. Length-3 odd block fails length=1. | R09: import occurrence/character from existing owner. |
| 3.6 Scalar condition | 1+e+I₂: weights −1,0,0,1; zero multiplicity 2. 3·1 has multiplicity 3 of 1; 2I₁ repeats ±1/2 twice. | First allowed for k≥2, other models excluded. |
| 3.7 Cases | For g=16,k=13: H1 long length 7, H2 length 9; e^13=e excludes trivial H1 long block, e^12=1 allows H2. | Length/sign difference is 2 and −1 versus 1. |
| 3.8 Scalar membership | g=k=12: Δ₁₁[12]+[1] has 25 weights; zero occurs 3 times, nonzero ±1,…,±11 once. k−1=11>0=g−k. | Case I holds; multiplicity one is sourced. |
| 3.9 Case-I character | floor(−1/2)=−1 gives (−1)^−1=−1; floor(3/2)=1 gives −1. n=2,d odd gives nd≡2 mod4, excluded. | Integer floor, not truncation toward zero. |
| 3.10 Compact remainder | Triple-zero branch at g=k has g−k=0,d₀=1; at g=k+1 the H1 length is 3. For 1+e+I₂ the zero multiplicity is 2, not regular. | The exceptional conditions distinguish these inputs. |
| 3.11 Even generators | π=1: r=1,e₊=e₋=0,n=1, so 1+0+0=1. n=2,d=12 gives nd/4=6, sign +1. | — |
| 3.12 Odd generators | U=2·1 has zero multiplicity 2 but e-multiplicity 0. At a=1, floor(1/2)=0, floor(−1/2)=−1, signs +1,−1. | Distinguishes characters from weights. |
| 3.13 Choices | g=k=12, Δ₁₁[12]+[1]: I and H1 both give (−1)^6=1; global ε=i¹²=1. Swap two length-1 odd blocks: same product generator. | Overlapping branches agree in this test. |
| 3.14 EP | SO₃,k=0: −dim S₂+1=1; k=5: −dim S₁₂=−1. Omitting residuals changes first value to 0. | — |
| 3.15 Packet contribution | SO₈ λ=(9,7,4,2): averaged EP=(1+0)/2=1/2; mψ=2 restores 1. Mismatched character average is (1−1)/2=0. | Factor 2 required. |
| 3.16 Triangularity | SO₃: κ=−1,R=δk0 gives 1 at k0 and −1 at k5. SO₁ gives EP=1 but no rank-zero π[1]. | R02. |
| 4.1 Mass | SO₃ identity −1/12; orders 4,6 have mass 0; constant-character elliptic sum −1/12+1/4+1/3=1/2. | R10: replace the grouping restatement with a unipotent negative control. Normalized supplier definition retained. |
| 4.2 Rationality | ζ(−1)=−1/12; zero masses 0∈ℚ; ζ(2)=π²/6 is not rational. | Correct critical-value direction. |
| 4.3 Levi terms | SO₃,k0: elliptic 1/2 plus proper-Levi 1/2 equals EP=1; k5: elliptic −3/2 plus 1/2 equals −1. | — |
| 4.4 Indices | Sp₂: 5 products, 1 fixed by negation, quotient (5+1)/2=3. SO₃: 5 products, no negation quotient. Negating (X−1)³ gives (X+1)³ with forbidden odd exponent 3. | — |
| 4.5 Fibres | In SO₄ use eigenvalues 2,1/2,3,1/3: no ±1, two SO-classes in one O-class. For central-trivial λ=0, trace sum 1+1=2; central-odd pairs cancel 1+(−1)=0. | Fibre sum and central factor distinct. |
| 4.6 Spinor formula | Euclidean plane, γ rotation by π/2: det((1+γ)/2)=1/2, same square class as Q(−1)=2. Q(1)Q(−1)=4, square class 1=disc. γ=−1 gives Q=1 and spinor disc. | Associated versus polar determinant differs by a square in dimension 2. |
| 4.7 Obstruction | Φ₃(−1)=1, Φ₄(−1)=2, Φ₆(−1)=3. Hyperbolic plane t=±1 gives Q=1, values (1,1), whereas unfactored values are (4,0),(0,4). Rank 0 gives Q=1 and square 1. | All primes, including 2, are required; no contradiction found. |
| 4.8 Filter | SO₃: three survivors out of five. Φ₅(−1)=1 and Φ₅(1)=5; a=1 makes only first constraint active. | Correct one-sided condition. |
| 4.9 Cardinalities | Degree4:19 total,5 fixed,12 orbits. Degree14:2257 total,59 fixed,1158 orbits. Degree16:4877 total,165 fixed,2521 orbits. | Printed 1157 corrected; R05 reuse. |
| 4.10 Characters | At identity Sp₂ λ2: e₁²−e₂=4−1=3; SO₃ λ2:9−3−1=5; λ1 yields dimensions 2 and3. | Monic character examples agree; nonmonic 2(X−1)² gives e=(1,2,1) versus signed coefficients(2,4,2): R11. |
| 4.11 Recovery | Tall 4×3 matrix has rank≤3<4. Wide [I₂ 0] maps both (0,0,0),(0,0,1) to 0. | R04. |
| 4.12 SO₃ | k0: sin(π/4)/sin(π/4)=1; wrong denominator gives 1/√2. k5 dimension 11/12+1/4+1/3−1/2=1. Five-row character determinant 288. | Source misprint does not propagate. |
| 4.13 Coarse tables | SO₁₅:1924−1339=585 extra rows; Sp₁₄:974−1158=−184 rows. | Dimension obstruction verified; full large matrix ranks not recomputed. |
| 4.14 Known classes | 11+13+3=27 classes; merging two I₂₃ classes gives 26 blocks. | Counting classes versus types separated. |
| 4.15 Refined tables | Sp₁₄ columns1158; SO₁₇ claimed rows3461 exceed columns2948 by513 but this does not imply rank2948. | Full-column-rank certificates not recomputed. |
| 4.16 Easy indices | At odd p, S={1,2} fails 0∈S; at p2, {1,3} passes and {2,3} fails; singleton {7} passes size≤1. | Dyadic branch differs. |
| 4.17 Sp₁₆ | 2521−766=1755 easy orbits;1086−766=320 surplus hard rows;1427−2521=−1094. | Counts arithmetically consistent; mass/rank certificates not recomputed. |
| 4.18 Mass values | SO₃ nonzero masses sum1/2;6+6=12 exceptional zeros. 16>14 excludes Sp₁₆ from the asserted zero classification. | —; large exceptional list not reconstructed. |
| 5.1 Exclusion framework | Positive definite [1] at cutoff−1 has no points; empty cover alone would miss trivial class. At c≥A_F>0 the trivial parameter is admitted by multiplicity bound. | Cutoff hypothesis excludes false empty certificate. |
| 5.2 Bounded weights | A positive definite 1×1 form [1] at bound4 has effective indices0,1,2; zero form gives infinitely many. | Coercivity essential; actual weight23 enclosure not recomputed. |
| 5.3 Weight≤22 | Δ₂₁,₁₃ dimension4, doubled weights21,13,−13,−21; Sym²Δ₁₁ dimension3, weights−11,0,11. | Source classification, not independently derived. |
| 5.4 Residual cover | Uexc has7 two-dimensional summands, dimension14, top multiplicity2.187−6=181. First multiplicity-free residual dimension10, already a known class. | Outside-known-set qualification needed and present. |
| 5.5 Exceptional pair | An involution on a fibre of size≤2 has either singleton fixed point or 2-cycle; excluding fixed points leaves sizes0 or2. | Self-dual exclusion supplies missing converse. |
| 5.6 Top-simple count | 2+3+7+1=13, while the two rank2 classes share one infinity type. | No uniqueness from weights alone. |
| 5.7 Alternatives | 181+1=182 parameter types;181+2=183 possible classes if exceptional dual pair occurs. | Necessary, not existence statement. |
| 5.8 GRH | Retained A has8 two-dimensional summands, rank16; dual pair uses m2,δ0, not δ2. | Conditional claim distinguished from existence. |
| 5.9 Weight24 bound |16 known classes/15 types; rank7 orthogonal parameter has positive doubled weights24,16,8 and zero. | Large exclusion witnesses not reconstructed. |
| 5.10 Regular weight24 | Ranks11,13,15 map to Sp₁₀,Sp₁₂,Sp₁₄; rank7 maps to Sp₆. | Correct standard dual dimension. |
| 6.1 Boundary | Constant form1 maps to1; cusp Δ maps to0. At k=g, two zeta shifts both0, product ζ(s)². | — |
| 6.2 Vanishing/spanning | g9,k13 has (−1)^(117)=−1, so M=0. g9,k4 has9>8, cusp0, theta constant coefficient1. | R07 construction order; R06 negative coefficients. |
| 6.3 Lattice forms | p2,E₈: (16−1)(8+1)=135 neighbours.12870·405=18225·286=5212350; reciprocal-weight cross terms differ. | Pairing direction checked. |
| 6.4 Theta | θ₀[L]=1 and constant coefficient1. Rescaling E₈ theta by its order gives1/696729600≠1 while Φ compatibility survives. | Constant coefficient excludes wrong scaling. |
| 6.5 First occurrence | [E₈] has degree0; rank16 difference has θ₀=1−1=0, first nonzero degree4 by source. | Higher lifting genus does not change degree. |
| 6.6 Harmonic coefficients | H₁,₁,ₙ dimension n; exterior degree n+1 has dimension0. For g2,ν1 determinant coefficient scales by t², not t. | — |
| 6.7 Harmonic theta |24/2+1=13;16/2+5=13. Alternating coefficient on dependent tuple0; plain E₈ theta constant coefficient1. | ν0 excluded from cuspidality. |
| 6.8 Lattice parameters | Δ₁₁[4]+[7]+[1] has8+7+1=16. For rank24 long[15],g₀=(23−15)/2=4; [1] instead gives11. | Classification source-dependent. |
| 6.9 Rallis | E₈,g8: dimensions7+1+9=17. Rank24,g12: Δ₁₁[12]+[1] has24+1=25. | Uses current genus, not first occurrence. |
| 6.10 Higher lifts | E₈,g8,g₀0,n8:8>0,8>7 and17>9>8. | Strict inequalities consistent. |
| 6.11 Central values | ε(Δ₁₉,₇)=i²⁸=1; ε(Δ₂₁,₁₃)=i³⁶=1; ε(Δ₁₇)=i¹⁸=−1. | R03 full source theorem needed. |
| 6.12 Criterion | n/2−g takes0,4,0,−4,−12. At g16 reciprocal omega order−4; total0−4−4−1+9=0; reversed denominator gives8. | Denominator sign matters. |
| 7.1 Spectral dimensions | g1,k12: one Δ₁₁, one adjoint rank3 parameter, dimension1. Two distinct Δ₂₃ remain2 distinct global parameters. | — |
| 7.2 Regular dimensions | g2,k20:5 ring monomials−2 elliptic images=3 cusp dimensions; SK gives dim S₃₈=2; simple remainder1. k11 parity test−1≠1 and no odd genus2 form below35. | Igusa cross-check agrees. |
| 7.3 Genus≤8 | g8 standard dual dimension17 requires Sp₁₆ input; g9 gives19, outside available18-dimensional symplectic mass range. | Boundary of claimed range correct. |
| 7.4 Low weights |29+29=58; weight reconstruction a=(12,8,4) gives k=(13,10,7). | Enumeration totals sourced, not recomputed. |
| 7.5 Scalar I | g=k12, ψ dimension24+1=25; character(−1)^6=1=ε(I₁₁). | — |
| 7.6 Scalar H1 | For k2,6, (−1)^(k/2)=−1 versus global1. At g14,k13, I₁₁·(1+I₂₂) contributes I₃₃+2I₁₁: ε=i³⁴i²⁴=−1. | Mismatch excludes displayed candidate. |
| 7.7 Scalar H2 | g16,k13 omitted weight16−13+1=4; long block9. Δ₁₁[12]+[25] dimension49 gives genus24. d6 on Δ₁₁ gives(−1)^3=−1. | — |
| 7.8 Nonscalar spaces | (13,10,7)−(1,2,3)=(12,8,4); (11,11,7,7)−(1,2,3,4)=(10,9,4,3).3+7+4+5+4+6=29. | Individual list completeness not reconstructed. |
| 7.9 Scalar spaces | g4,k12 has2 source parameters with weights11,10,9,8; genus24,k13 has24<26 and is singular13<24. | Dimension2 is source-dependent. |
| 7.10 Four forms | g8 shifts give12,…,5 plus negatives and0:17 weights. g24 has±12 once,±1,…,±11 twice,0 three times:2+44+3=49. | — |
| 8.1 Eichler basis | Genus0 source maps all lattice basis vectors to1, rank1; at weight16,genus14 source theorem records failure of surjectivity. | Induction uses vanishing plus existing theta compatibility. |
| 8.2 Small dimensions | Starting genus0 dim1; weight12 successive first values1+1=2,2+1=3,3+1=4,4+2=6; stable endpoint24. | Successive differences agree; no independent full classification. |
| 8.3 Exterior orbits | S₃ on3 points: degrees2,3 invariant dimensions0,0; A₃ gives1,1. Empty wedge degree0 dimension1. ℤ acting through A₃ gives1,1,1,1,0 in degrees0…4. | Includes infinite group and nonabelian test. |
| 8.4 Mathieu forms | Singleton orbit sum under octad sign change has8 minus and16 plus coefficients; claimed negative sum has24 minus. | R01. |
| 8.5 Lattice invariants | Root rank1 reflection yields ω(x)=−ω(x), hence0. Root-spanning Construction A gives degree8 dimension0; Leech gives1 by average coefficient. g25 exterior space0; g0 constants1. | Lean hypotheses retain rootless/positive assumptions. |
| 8.6 Coefficients | Co₀ order/10=831555361308672000, times e₈5 gives4157776806543360000≠0. Order/3=2771851204362240000. Reversing ω changes coefficient sign, not nonvanishing. | Exact coefficients use source orbit count; no canonical sign asserted. |
| 8.7 Orders | g16 total−4−4−1+9=0; g24 total−12−12−1+25=0. Gamma poles at s−12 count13+12=25. | R05 numerical rows reuse. |
| 8.8 Theta realization |24/2+1=16/2+5=13; rank16,g8 source maps nontrivially to target dimension1. | Distinct construction routes conditional as documented. |
| 8.9 Rank16 source | Parameters dimensions4·4=16,2·8=16; source dimension2,target1,kernel dimension1. Added[1] yields17. | Surjection alone does not imply source dimension1. |
| 8.10 Isomorphism | g9:0→0; g25:0→0; g8:one-dimensional source, nonzero coefficient forces rank1. g0 excluded, where full source dimension24 would not equal1. | Positive genus restriction essential. |
| 8.11 Stable parameters | k2,g4: local(−1)¹=−1, global1. k4,g8: long length9; g9 length11, both exceed d≤4; even exponent makes ε^d=1. | — |
| 8.12 Stable dimensions | k0 all genera dimension1; k1,2,3 stable dimensions0; k4,g8 dimension1. | Separate zero weight avoids empty-block inference. |
| 8.13 Stable Φ | k0 constants:1↦1. At k4,g8, next genus9>8 so cusp kernel0, dimensions1=1. | Strict vanishing used at g+1. |
| 8.14 Stable theta | k4,g8:1→1; k8,g16:2→2. Full Gram coefficient of E₈ is696729600≠0; rank0 coefficient1. | Injectivity from full-rank coefficient, not arbitrary normalization. |

Source-locator ledger: the following 35 distinct locator groups were checked against their text; a correct locator is not certification of every assertion or numerical certificate in its surrounding section.

| Source locator | Cache locator | Comparison |
|---|---|---|
| CT20 §1.2 regular weights | CT20 line 206 | README correctly orders the exceptional pair. |
| CT20 §1.4, (1.4.3)–(1.4.5) | CT20 line 398 | Full-centralizer volume/orbital-integral convention; the connected convention in Tai17 has a component denominator. |
| CT20 §2.1 | CT20 line 550 | Weil irreducibles, gamma and epsilon normalization. |
| CT20 §2.2 | CT20 line 584 | Simple-weight condition for reading self-dual type. |
| CT20 (2.3.5)–(2.3.7) | CT20 line 667 | Explicit formula, half-zero term and cone quadratic form. |
| CT20 Proposition 2.2 | CT20 line 676 | Nonnegative coordinates are essential. |
| CT20 Corollary 2.3 | CT20 line 705 | Multiplicity bound uses number of classes. |
| CT20 Proposition 2.5 | CT20 line 782 | Principal faces and strictly positive least eigenvectors. |
| CT20 Lemma 2.6 | CT20 line 789 | Local spherical minimum has least eigenvalue. |
| CT20 Lemma 2.8 | CT20 line 806 | Equal triples and negative minimum. |
| CT20 Corollary 2.9 | CT20 line 845 | Minima equality is erroneous; roadmap correctly retains only negativity equivalence. |
| CT20 Remark 2.10 | CT20 line 848 | Monotonicity on the cone. |
| CT20 §2.4.4 | CT20 line 914 | Final interval inequality is the mathematical certificate, independent of search. |
| CT20 §2.4.5 | CT20 line 940 | Exclude classes outside known set; source multiplicity normalization needs correction. |
| CT20 Table 2 | CT20 line 1144 | Source's degree-14 count is wrong; independent orbit count gives 1158. |
| CT20 Proposition 3.7 | CT20 line 1245 | Regular integral forms, every prime, absolute square obstruction. |
| CT20 Table 3 | CT20 line 1284 | Cardinality rows reproduced in §4.9; R05. |
| CT20 Proposition 4.1 and proof | CT20 line 1424 | Exceptional dual pair versus 181 singleton possibilities; residual-index typo. |
| CT20 Remark 5.3 | CT20 line 1860 | H2 excludes k=2; the later shortened list is consistent with k≥3. |
| CT20 Corollary 5.10 | CT20 line 2216 | Surjective theta for three weights; source proof uses the same necessary boundary induction. |
| CT20 Remark 5.11 | CT20 line 2225 | Stable thresholds 1,4,12; no full dimension row is printed there. |
| CT20 Proposition 5.12 | CT20 line 2248 | The two harmonic theta realizations. |
| CT20 Proposition 5.14 | CT20 line 2292 | Stable dimensions, divisibility by four. |
| CT20 Corollary 5.15 | CT20 line 2326 | Stable Siegel operator and theta isomorphism, including equality boundary. |
| CT19a Theorem 2 | CT19a line 105 | Nonzero coefficient, embedding count and normalization ambiguity ±. |
| CT19a Lemma 1.3 | CT19a line 253 | Orientable Mathieu orbits. |
| CT19a Proposition 1.4 | CT19a line 283 | Code sign changes act on monomials; R01. |
| CT19a Proposition 4.1 | CT19a line 1052 | Root-reflection vanishing. |
| CL14 IX Proposition 3.38 | CL14 line 12315 | Full central-order theorem, not only two nonvanishing cases. |
| Tai17 (3.1.1) | Tai17 line 617 | Rational component-index denominator. |
| Tai17 §4.1.2 | Tai17 line 2397 | Outer-averaged EP; simple contribution must retain mψ. |
| Mil02 Theorem 1.6 | Mil02 line 137 | Strict rank range 1<N<27. |
| vdG08 Theorem 9.1 | vdG08 line 858 | Igusa graded ring, weight20 five monomials and three cusp dimensions. |
| BoechererNote p.1 | BoechererNote line 17 | Gamma/zeta/polynomial factors and criterion. |
| BoechererNote pp.2–3 | BoechererNote line 50 | Five parameter substitutions; R05 concerns the copied table. |

For wording, 20 representative statement/prose pairs from these locator groups were compared, including the following five additional passages beyond theorem statements: the regularity explanation (§1.6/CT20 line 206), the equal-coordinate proof idea (§2.13/CT20 line 811), the mass-definition prose (§4.1/CT20 line 398), the root-reflection proof sentence (§8.5/CT19a line 1054), and the stable theta proof route (§8.14/CT20 line 2331). No unforced consecutive prose passage was identified as copied; formulas, standard names and forced short mathematical phrases were excluded from that conclusion. The numerical reuse is separately reported in R05.

The source-key locator-group count is CT20 113, CT19a 13, CL14 17, Tai17 11, Mil02 1, vdG08 2, BoechererNote 2, and the uncertified KT87 reference 1: 160 groups, counting a source key followed by a locator once, not each theorem number inside a range, and excluding the bibliography. CT20's contents are at CT20 lines 52–82. The comparison is Layer 1 ↔ §§1.2,2.1–2.2; Layer 2 ↔ §§2.3–2.4; Layer 3 ↔ §§1.4,5.1–5.2; Layer 4 ↔ §3; Layer 5 ↔ §4; Layer 6 ↔ §§5.3–5.4 plus CL14; Layer 7 ↔ §§5.1–5.3; Layer 8 ↔ §§5.4–5.5 plus CT19a. This is not a one-to-one run of source sections: the packet theory is moved before mass/classification, and theta foundations before the low-weight conclusions. Sections 3.16→4.11→4.14→5.3 and 6.4→7.9→8.1 explain the main mathematical ordering. No arrangement finding beyond numerical reuse was established.

## Not verifiable

- The large interval-certificate families, full-rank mass matrices, 187/181-element residual sets, 58 regular eigenparameter enumeration and all mass entries were not independently reconstructed. Their arithmetic boundary tests and source statements were checked; this is not a certificate of their exhaustive numerical data.
- KT87 remains settled **uncertified**. Its text was not fetched or requested. The manifest gives the entire article's page interval; the exact internal locator and full rank/partition hypotheses of the determinantal formulas could not be certified. Low-rank character tests do not substitute for that verification.
- Cross-roadmap citations outside the 67 contracts listed above, including some broad main/completed layer citations, were searched as ownership leads but not all re-proved or fully recertified against every claimed consequence. No absence finding is inferred from a failed broad search.
- Of the 160 source-key locator groups, only the 35 distinct groups in the ledger received direct text verification in this pass. Other locator occurrences and large finite classifications remain outside the certified coverage. All eight works are already in sources.toml; no additional source was needed or requested.
- No fresh Lean elaboration was run, as required by the read-only/no-build instruction. The eight supplied elaborated signatures were inspected; the review does not claim to have reproduced that run.

## Source issues

- **Misprint** in CT20 at §1.2, regularity definition, printed p.5 (CT20 line 206): the source says the asymmetric central-zero exception applies under an ordered `i≠j` quantifier; it should be an `i<j` quantifier or a symmetric exceptional-pair condition; affects a stated result.
- **Misprint** in CT20 at §1.4, SO₃ character calculation, printed p.11 (CT20 line 468): the source says the sine denominator has argument `2π/i`; it should be `π/i`, giving trivial-character value one; affects a stated result.
- **Misprint** in CT20 at (2.4.5), printed p.18 (CT20 line 767): the source says the middle bilinear expression has arguments `U_i,U_i`; it should be `U_i,U_j`; affects a stated result.
- **Error** in CT20 at Corollary 2.9 and preceding embedding, printed p.20 (CT20 lines 840–847): the source says square-root block normalization preserves the compressed form and negative minima agree; it should retain negativity equivalence using division by block size, without equality of unit-sphere minima; affects the proof.
- **Error** in CT20 at §2.4.5, printed p.23 (CT20 lines 955–959): the source says square-root multiplicity coefficients give the compressed Gram comparison; it should use coefficients divided by multiplicity for that Gram matrix; affects the proof.
- **Error** in CT20 at Table 2, printed p.27 (CT20 line 1146): the source says the Sp₁₄ index quotient has 1157 elements; it should have 1158, since `(2257+59)/2=1158`; affects a stated result.
- **Misprint** in CT20 at §3.3 footnote 13, printed p.33 (CT20 line 1373): the source says the repeated elliptic infinity type comes from dimension two in weight 23; it should be weight 24; affects nothing.
- **Misprint** in CT20 at §4.1, printed p.36 (CT20 lines 1484–1491): the source says the 187 remaining one-class parameters belong to `U₂`; it should name `U₁`; affects the proof.
- **Gap** in CT20 at §4.1, printed p.36 (CT20 lines 1479–1485): the source gives incompatible cardinalities 12230 and 12293 for the one-class calculation; it should reconcile the exact set/cutoff and its cardinality before subtracting 187; affects the proof.
- **Error** in CT20 at §4.1, printed p.36 (CT20 lines 1492–1495): the source says none of the six multiplicity-free residual types occurs self-dually; it should exclude additional classes, retaining the known rank-ten class at the first type; affects the proof.
- **Misprint** in CT20 at Remark 5.3, printed p.44 (CT20 lines 1860–1863): the source says H2 also has `k≥2` and then excludes `k=2`; it should record the stronger bound `k≥3`; affects nothing.
- **Misprint** in Tai17 at §4.1.2, printed p.311 (Tai17 line 2573): the source says the SO₄ₙ shifted weight is `k_r+n−r`; it should be `k_r+2n−r`; affects a stated result.
- **Error** in Tai17 at §4.1.2, printed p.311 (Tai17 lines 2582–2587): the source says a simple parameter contributes the packet EP sum alone; it should retain `m_ψ`, which equals two in the even orthogonal simple case; affects the proof.
- **Misprint** in vdG08 at §9, printed p.18 (vdG08 lines 848–850): the source gives elliptic E₁₀ factors for the leading χ₁₀ term; it should give Δ⊗Δ, as its own expansion at vdG08 line 878 does; affects the proof.

Source independence: 20 prose/statement passages compared with 7 readable sources; no unforced prose copying identified; numerical reuse in R05. Largest share CT20, 113 of 160 source-key locator groups; contents compared with CT20: no one-to-one source arrangement. KT87 wording untested (settled uncertified).

## For the human reviewers

- Licence: BoechererNote is an author-hosted companion note. packages/LevelOneAutomorphicFormsForClassicalGroups/sources.toml:15 records answered provenance, not an explicit reuse licence. R05 identifies its numerical table reused in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "56357cf455bb49109d6c93876eb950c92162017d", "job": "RT-LevelOneAutomorphicFormsForClassicalGroups~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
