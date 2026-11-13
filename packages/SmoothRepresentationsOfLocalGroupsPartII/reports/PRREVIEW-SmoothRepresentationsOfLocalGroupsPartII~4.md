# Review of SmoothRepresentationsOfLocalGroupsPartII (pull request #1815 at 01e8ddf)

**Verdict:** needs changes

## R01 (P1) — Reverse the type-A coordinate inequalities

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1236 — “0 ≤ ν₁ ≤ ⋯ ≤ ν_k < ½”.

**Claim:** The displayed vector is asserted to describe the dominant generic unitary region, but this ordering puts it outside the dominant chamber fixed in Conventions.

**Witness:** For PGL₄, (ν₁,ν₂)=(1/8,1/4) gives (1/8,1/4,−1/4,−1/8); its simple-coroot pairings are (−1/8,1/2,−1/8). CH26 lines 977–983 use the opposite ordering.

**Repair:** Replace the inequality by “0 ≤ ν_k ≤ ⋯ ≤ ν₁ < ½”. Add the PGL₄ Check: (1/4,1/8,−1/8,−1/4) has simple pairings (1/8,1/4,1/8) and highest-coroot pairing 1/2.

## R02 (P1) — Restrict maximal level to levels that occur

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1274 — “the maximal level r₀ of G is the largest r such that”.

**Claim:** The universal condition is true at every level above the highest coroot, so the stated maximum does not exist.

**Witness:** In A₁ the only positive-coroot level is 1. For every integer r ≥ 2 the quantified coroot set is empty, so the condition is true at arbitrarily large r.

**Repair:** Define r₀ as the largest occurring positive-coroot level satisfying the bound, equivalently restrict to integers 1 ≤ r ≤ h−1. Add A₁: r₀=1; level 2 is excluded because no coroot has that level.

## R03 (P1) — Correct the additive-character conductors in the nonsplit adapter

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1358 and 1368 — “ψ₀ is a character of k of conductor O”.

**Claim:** A character of conductor O is trivial on O; composing with an integral trace therefore gives the trivial character on the reductive quotient. The stated positive and negative controls are reversed.

**Witness:** Take k=ℚ₃, k′/k unramified quadratic, and ψ₀ with kernel ℤ₃. Tr(O′)=ℤ₃, so ψ₀(Tr(x))=1 for every x∈O′, contrary to the asserted nontriviality.

**Repair:** Require ψ₀ to be trivial on 𝔭 and nontrivial on O (conductor 𝔭). In the negative control require ψ₁ of conductor O. For ℚ₃, replacing ψ₀(x) by ψ₀(x/3) gives value exp(2πi/3) when Tr(x)=1.

## R04 (P2) — State the statable Milman headline in Lean

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:459 and Suggested.lean:101 — “Then every extreme point of C lies in closure F”.

**Claim:** Milman’s converse is an explicitly owned deep result and is advertised in the pull-request summary, but it is absent from the acceptance file despite requiring no new carrier or definition.

**Witness:** The full signature elaborates at the pins: IsCompact (closure (convexHull ℝ F)) → Set.extremePoints ℝ (closure (convexHull ℝ F)) ⊆ closure F, on a Hausdorff real locally convex topological vector space.

**Repair:** Add this theorem with sorry in Layer SRU.1, with explicit AddCommGroup, Module ℝ, TopologicalSpace, IsTopologicalAddGroup, ContinuousSMul ℝ, T2Space and LocallyConvexSpace ℝ binders; name it in the README. Keep the compactness hypothesis: the ℓ² basis counterexample has extreme point 0 outside closure F.

## R05 (P2) — Retire the already supplied σ-finite duality gap

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:107–109 — “B5 constructs the isometric identification … on finite measure spaces”.

**Claim:** BanachSpaceTheory on main already states the σ-finite theorem, including the bilinear integral pairing and norm equality. The declared gap asks its existing owner to supply the same theorem again.

**Witness:** TauCetiRoadmap/BanachSpaceTheory/README.md:1049 states σ-finite integral duality; Suggested.lean:184 declares exists_lpInftyDualEquiv with [SigmaFinite μ] and the exact integral evaluation law.

**Repair:** Replace the finite-measure claim and gap contract with a citation of BanachSpaceTheory B5, exists_lpInftyDualEquiv. Retire sigma-finite-l1-duality from the gap list and update its Needs citations. Counting measure on ℤ is covered by the existing signature.

## R06 (P2) — Resolve supplier identifiers against the supplied heads

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:141 and 153 — “Consume Layer S” and “Consume SC4’s atomic character and semisimple-parameter interface with SC3’s central compatibility”.

**Claim:** These identifiers have no definitions or former-numbering mappings at the supplied supplier heads. The mathematical inputs have identifiable locations there; the citations must use them.

**Witness:** PR #1828, TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:655,695: §§6.2,6.4. PR #1832, TauCetiRoadmap/ExcursionOperatorsAndSpectralActionPartII/README.md:597: §4.3; its normalized spectral-Levi interface is §0.0, not SC3.

**Repair:** Cite Springer §§6.2–6.5 for the resolution, reduced Steinberg variety and components, retaining the separate equivariant-K-theory gap. Cite Excursion §§0.0,3.3,4.1–4.3 for the parameter, central and atomic interfaces, retaining the additional all-characteristic induction gap; update every dependent Needs line.

## R07 (P3) — Remove the erroneous Ciubotaru misprint claim

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:1676–1678 — “as printed, with 3/2 + ν … which is recorded as a misprint”.

**Claim:** The PDF prints −3/2+ν in the second coordinate. Its direction is orthogonal to its central point; the extraction lost the minus glyph. The roadmap’s alternative is a Weyl conjugate, not an erratum.

**Witness:** CiF4 line 584, §3.2, printed p.14, visually checked: at ν=1/2 the printed vector is (2,−1,3/2,1/2), of squared norm 15/2.

**Repair:** Replace the misprint claim by: “CiF4 prints (3/2+ν,−3/2+ν,3/2,1/2). Changing the second coordinate’s sign is a Weyl action and gives our representative.” Replace “After the sign correction” by “After this Weyl action”; both representatives have squared norm 15/2.

## R08 (P3) — Correct the remaining source page locations

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:819,831,855,973,1005,1660,1672 — “PDF p. 31”, “PDF p. 32”, “PDF p. 28”.

**Claim:** The cited proof steps and exceptional lists lie on the following pages, not those specified.

**Witness:** GS23 line 1331 starts the proof on p.32; lines 1382–1393 are on p.33. CH26 page-29 marker is line 1372; Theorem 8.5(2)–(5) follows it.

**Repair:** Use GS23 p.32 at §§3.4 and 3.7, and p.33 at §§3.5,4.4,4.6. Use CH26 pp.28–29 for §7.10, and p.29 for §7.11. Keep §4.7’s Proposition 11.3 locator on p.32.

## R09 (P3) — Update the description’s declaration count and supplier claim

**Location:** Pull request #1815, description prose — “with the five simple definitions they need”; “everything else named in the README is a consumer, not a prerequisite”.

**Claim:** The head has seven definitions. SpringerResolutionAndCharacteristicCycles, ExcursionOperatorsAndSpectralActionPartII and LieHighestWeightPartII are prerequisites absent from that prose dependency list, although the generated depends-on block names them.

**Witness:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean:47,54,62,66,70,105,116 declares seven definitions; README.md:129,139,151 names the three additional suppliers.

**Repair:** Say “This adds a roadmap with seven definitions and seven headline signatures” for this head (eight signatures after R04). Replace the consumer-only sentence by one naming the three additional suppliers and referring to the complete Exact supplier contracts list.

## Verified sound

Previous review: zero findings at b197d70. Its retained repairs read “regular left Haar measure” (README:21,508), separate (6.11)–(6.13) onto page 19 (README:1108), and retain Rodier73 as uncertified; no previous finding remains open.

Headline coverage: GNS, pure/irreducible, Godement, weak-star compactness, Raikov and both coefficient-approximation theorems are stated. Milman is R04. The docstring names the missing quotient/smooth/Hecke/Springer carriers for sum/closure, isolated summands, admissibility, character limits, generic standard modules, Howe–Moore, isolation, spherical classifications, temperedness, Aubert/KL and complementary-series endpoints.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: inner product | C₄, χ(g)=i, v=1 | ⟪1,i⟫=i; ⟪i,1⟫=−i | Inverse/conjugation adapter required | — |
| Conventions: normalized induction | GL₂, diag(ϖ,1), q=3 | δ_B=1/3; δ_B^(1/2)=1/√3; inverse factor=√3 | Sign fixed | — |
| 0.1 Strong continuity/irreducibility | Trivial G, H=0,ℂ,ℂ² | Irreducible: false,true,false; all orbit maps constant | Nonzero and invariant-subspace conditions discriminate | — |
| 0.2 Hilbert sum | Empty family; two scalar fibres; coordinates 1/n | Dimensions 0,2; squared norm Σ1/n²=π²/6 | Completion differs from algebraic sum | — |
| 0.3 Positive type | C₂, φ(e)=1, φ(a)=±1 or 2 | Kernel eigenvalues (2,0), (2,0), (3,−1) | First two positive; last fails | — |
| 0.4 Coefficients | S₃ standard representation, reflection diag(1,−1), v=e₂ | Coefficient −1; kernel quadratic forms are squared norms; coefficient at e=1 | Nonabelian kernel order agrees | — |
| 0.5 exists_gnsRep | φ=0; φ=1; δ_e on C₂ | GNS dimensions 0,1,2; feature inner products 0,1,δ_ab | Translation identifies the construction | — |
| 0.6 Unitary dual | Trivial G; C₂; S₃ | Class counts 1,2,3; S₃ dimensions 1,1,2 | Zero representation excluded | — |
| 0.7 mem_extremePoints_positiveTypeOne_iff | C₂, φ(a)=1,−1,0 | GNS dimensions 1,1,2; extreme true,true,false | Both directions agree | — |
| 0.8 K-type projectors | S₃, standard τ, Haar mass 1 | ∫conjχτ·τ=I/2; dimension factor gives I; squares I/4 versus I | Corrected projector is idempotent | — |
| 1.1 Weak containment | ℤ interval vectors; trivial into zero | At k=1: 2N/(2N+1)→1; into zero error=1 | Weak containment differs from containment | — |
| 1.2 Milman converse | F={0,1,1/2}; ℓ² basis | ext[0,1]={0,1}⊆closure F; basis averages norm=1/√n→0, dist(0,F)=1 | Compactness essential; signature elaborates | R04 |
| 1.3 godement | C₂, counting measure, φ=±1, f=δ_e+iδ_a | Integrated forms 2,−2; imaginary parts 0; representative positive true,false | Positivity detects the sign | — |
| 1.4 isCompact_positiveTypeSubunit_integrals | C₂; circle characters zⁿ | C₂ triangle vertices (0,0),(1,1),(1,−1); zⁿ weak-star→0, while φ_n(e)=1 | Subunit ball retains zero limit | — |
| 1.5 raikov | Trivial group; ℤ; circle characters | P₁={1}; δ_g pairing=φ(g); circle limit 0 has normalization 0≠1 | Normalized hypothesis excludes false converse | — |
| 1.6 Single approximation theorem | C₂, σ=sgn, π=1⊕sgn | Choose sign unit vector: coefficient error 0 at e,a | Single coefficient sufficient | — |
| 1.6 Family approximation theorem | Family {1,sgn}; empty family | Sign member gives error 0; empty family gives error 1 at e | No hidden nonemptiness assumption needed | — |
| 1.7 Fell topology | C₂, alternating 1,sgn sequence | Limit set ∅; cluster set {1,sgn} | Two notions distinguished | — |
| 1.8 Sum/closure | C₂, S={sgn}, T={1}; repeated sgn | False containment; off-sign error 2; repeated sgn has support {sgn} | Multiplicity does not change support | — |
| 1.9 Gan–Savin closure | G₂, π₁=St, π_n=1 for n≥2 | St is a summand; range closure contains St; every increasing subsequence eventually equals 1 | Corrected closure conclusion holds | — |
| 1.10 Isolated summand | C₂, family of trivial representations | Closure={1}; sgn absent; adding sgn once makes its multiplicity 1 | Isolation yields actual occurrence | — |
| 2.1 Unitary structure | ℚ₃×, |·|; unitary unramified sign | Norm multipliers 1/3 and 1; squared norms 1/9 and 1 | Nonunitary character excluded | — |
| 2.2 Uniqueness | One-dimensional V; V=W⊕W | Forms h,2h have ratio 2; diag(1,2) versus I has ratios 1,2 | Irreducibility necessary | — |
| 2.3 Semisimplicity | C₂ representation 1⊕sgn; reducible GL₂ principal series | Orthogonal dimensions 1+1=2; nonsplit principal-series extension has no invariant positive form | Admissibility/unitarity retained | — |
| 2.4 Unitary induction | P=G; unnormalized Ind_B^GL₂1 | P=G gives original form; latter has nonsplit length-2 extension | Normalization discriminates | — |
| 2.5 Hilbert completion | Trivial action on finitely supported sequences | V=c₀₀; completion ℓ²; all vectors smooth, so V≠completion | Admissibility needed for equality | — |
| 2.6 Admissibility | Compact finite G; infinite trivial Hilbert representation | Irreducible dimensions finite; infinite trivial invariant dimension ∞ | Irreducibility essential | — |
| 2.7 Smooth/unitary dual | F× characters | χ(ϖ)=−1 gives 1-dimensional completion; χ(ϖ)=1/3 admits none | Bijection restricted to unitarizable classes | — |
| 3.1 Character convergence | C₂, 1⊕sgn | Character values at e,a: (2,0)=(1,1)+(1,−1) | Additivity agrees | — |
| 3.2 Character independence | C₂, 1 and sgn | Evaluation matrix ((1,1),(1,−1)), determinant −2 | Independent over ℂ | — |
| 3.3 Miličić limits | Constant irreducible C₂ sequence | Character limit χ; multiplicity 1; limit and cluster sets both {χ} | Positive multiplicity normalization | — |
| 3.4 Tempered extraction | F×, characters of increasing conductor | Each fixed-level average eventually 0; limit character 0 | Zero limit allowed | R08 locator |
| 3.5 Bernstein support | F×, χ_n(ϖ)=exp(i/n) | Center coordinate exp(i/n)→1; all conductors 0 | Support continuity agrees | R08 locator |
| 3.6 K-types persist | C₂, τ=sgn | τ-projector traces: 1 on sgn, 0 on trivial | Missing type separated | — |
| 3.7 Rodier heredity | P=G; irreducible GL₂ principal series | Whittaker dimensions 1=1; reducible series still has total dimension 1 | Endpoint not misidentified as irreducible | R08 locator |
| 3.8 Generic standard module | GL₂, inducing exponents ±1/2 | Standard module length 2; trivial quotient Whittaker dimension 0; St dimension 1 | Nongeneric quotient excludes reducible endpoint | — |
| 3.9 Generic unitary limits | PGL₂ complementary series, s→1/2 | Limit support {1,St}; induction length 2; both unitary | Limit constituents need not all be generic | — |
| 3.10 Tempered isolation | F× with fixed central character | Fixed-character dual has one point; varying unramified twists give a circle | Fixed central character matters | — |
| 4.1 Finite Steinberg | Torus; GL₂(𝔽₂)≅S₃ | Degrees q⁰=1 and q¹=2; flag permutation degree 3=1+2 | Rank-zero and small residue field work | — |
| 4.2 Steinberg K-type | GL₂(𝔽₂), I quotient B | Steinberg degree 2; I-fixed dimension 1; T_s=−1 | Finite sign type detected | — |
| 4.3 Barbasch–Moy | Split torus; GL₂ trivial and Steinberg | Whittaker/sign multiplicities 1/1, 0/0, 1/1 | Fixed compatible datum essential | — |
| 4.4 Rodier exponents | A₂ Weyl group | Positivity-set class sizes 1,2,2,1; total 6; constituent count 4 | w and w⁻¹ conventions distinguished | R08 locator |
| 4.5 Howe–Moore | PGL₂ unramified quadratic character | Character modulus=1 along escaping diag(ϖⁿ,1); G⁺ acts trivially | G⁺-invariant hypothesis excludes it | — |
| 4.6 Steinberg-series unitarity | A₁ and A₂ | Constituents 2 and 4; unitary counts 2 and 2 | Intermediate A₂ constituents excluded | R08 locator |
| 4.7 Steinberg isolated | Rank-one PGL₂; rank-two G₂ | Complementary endpoint has two limits {1,St}; G₂ singleton {St} open | Rank bound necessary | — |
| 4.8 Supercuspidal isolation | F×, fixed central character | Fixed-character set singleton; without fixing, unramified unitary circle | Relative isolation correct | — |
| 4.9 Coxeter/contraction | A₂, proper Levi A₁ | Induced sign dimension [S₃:S₂]=3; sign multiplicity 1, trivial 0, remaining dimension 2 | Extra finite type exists | — |
| 5.1 Real Satake part | Rank one, χ_ν(ϖ)=q^ν | ν=1/2 gives √q; |ϖ| gives q⁻¹ | Positive exponent differs from absolute-value character | — |
| 5.2 Half-integrality | A₁, ν=ω₁/2 | Adjoint root value 1/2; defining highest-weight value 1/4 | Adjoint test alone insufficient | — |
| 5.3 Spherical temperedness | PGL₂, ν=0 and root value 1/2 | Satake moduli 1 versus q^(1/2); tempered true versus false | Real part criterion discriminates | — |
| 5.4 Principal-series irreducibility | A₁, coroot value a=0,1,2 | q^a=1,q,q²; reducibility false,true,false | All walls are not reducibility walls | — |
| 5.5 Spherical genericity | GL₂ at reducible endpoint | Spherical quotient=1, Whittaker dimension 0; St dimension 1, spherical dimension 0 | Constituent conventions agree | — |
| 5.6 Hermitian criterion | A₂, ν=ω₁/2 and (ω₁+ω₂)/4 | −w₀ν=ω₂/2≠ν; symmetric candidate fixed | Not every real parameter is hermitian | — |
| 5.7 Generic unitary region | A₁ | U₀^g=[0,1) in coroot coordinate; 0 included, wall 1 excluded | Relative chamber topology | — |
| 5.8 Fundamental alcove | A₁, a=0,1/4,1 | Intertwiner ratios 1,3/5,0 | Positive interior; reducible boundary | — |
| 5.9 Unbounded exclusion | A₁, a=2 | Detecting ratio (1−2)/(1+2)=−1/3 | Not unitary | — |
| 5.10 Hecke unitarity | Finite rank-one Hecke, q=2,3 | T eigenvalues (2,−1),(3,−1), real and distinct | Small primes not excluded | — |
| 5.11 Generic classification | PGL₄, (a,b)=(1/8,1/4) | Listed simple pairings (−1/8,1/2,−1/8); dominant requirement all ≥0 | Counterexample | R01 |
| 5.12 Integral root wall | A₁, a=2 | q²∉{q,q⁻¹}, hence irreducible; signature ratio −1/3, hence nonunitary | Reducibility and unitarity distinct | — |
| 5.13 Half-integral reduction | A₁ ε=1/4; A₂ adjacent roots | ±1/4 lie in 1/4+½ℤ; adjacent sum 1/2 does not | Rank-one exception necessary | — |
| 5.14 Origin-only types | A₂; E₈ candidate ω₈/2; A₁ levels | A₂ symmetric half-coordinates sum 1; E₈ highest value 1; every absent level passes vacuously | Exclusions work; r₀ undefined | R02 |
| 5.15 Nonzero alcove points | A₁, A₃, D₄ | Highest-coroot values 1/2; A₃ coordinates (1/4,1/4,−1/4,−1/4); D₄ has three listed nonzero points | Listed candidates lie inside | — |
| 5.16 Combined half-integral list | A₂ versus A₃ | Set sizes 1 and 2, including origin | Odd/even distinction retained | — |
| 5.17 Fundamental separators | A₁ defining module | Weights at ω₁/2 are ±1/4, not in ½ℤ; adjoint values 0,±1/2 | Extra point removed | — |
| 5.18 Generic temperedness | A₁, ν=0 versus ω₁/2 | All weights 0 versus defining weights ±1/4 | Geometric iff tempered in stated sector | — |
| 5.19 Noncentral G₂ | q=4, ν=ω₂/2, specified involution | Six coroot values −1,2,−2,2,−2,−4; none equals 4 or 1/4 | Real-only corollary cannot cover this parameter | — |
| 5.20 Split adapter | SL₂(𝔽₂((t))) | Residue sum 1+(−1)=0; T_s on generator −1, trivial eigenvalue 2 | Equal characteristic and p=2 included | — |
| 5.20 Nonsplit datum | Unramified quadratic k′/ℚ₃ | Conductor ℤ₃: trace character on O′=1; corrected conductor 3ℤ₃ gives exp(2πi/3) at trace 1 | Counterexample | R03 |
| 5.21 Explicit regions | A₁ signature; F₄ bound at ω₁/2 | Ratio at a=1/4 is 3/5; F₄ level-9 value 1/2, highest-coroot value 1 | Bounds and reducibility differ | — |
| 6.1 Fixed dual | PSU₃; PSU₄; triality D₄ | Fixed duals SO₃,Sp₄,G₂; companions SL₂,SO₅,G₂; orders 2,2,3 | Full isogeny retained | — |
| 6.2 Unitary transfer | PSU₃, ν=0 | Both sides unitary; real part 0; companion center order 2 versus adjoint center order 1 | Root-system name alone insufficient | — |
| 6.3 Nonsplit temperedness | ²E₆; PSU₄ candidate | F₄ adjoint half-integral region {0}; defining Sp₄ weights detect a quarter value | Listed tests remove nonzero candidates | — |
| 6.4 Odd unitary exception | PSU₃, companion SL₂ | Residual set {0,ω₁/2}; ambient SO₃ weights 0,±1/2; spin weights ±1/4 unavailable | Exception survives stated tests | — |
| 7.1 Aubert involution | Rank-one group; torus | D(1)=−St, D(St)=−1; D²=1; torus D=1 | Signed versus irreducible normalization distinguished | — |
| 7.2 Semisimple parameter | GL₂, trivial and Steinberg | Both semisimple Frobenius eigenvalues q^(1/2),q^(−1/2); monodromy ranks 0,1 | Only semisimple parameter preserved | — |
| 7.3 KL parameters | SL₂ dual, s=diag(q^(1/2),q^(−1/2)) | Ad(s)E₁₂=qE₁₂; Ad(s)E₂₁=q⁻¹E₂₁ | Eigenvalue convention pinned | — |
| 7.4 KL classification | A₁ at Steinberg infinitesimal character | q-eigenspace has orbits {0},ℂ×; two irreducible constituents | Enhancements not free labels | — |
| 7.5 Iwahori–Matsumoto | Rank one, q=2 | T=2 maps to −1; T=−1 maps to 2; real central character unchanged | Trivial/sign exchange agrees | — |
| 7.6 Nilpotent partition | A₁, regular versus unitary generic parameter | q-eigenspace dimensions 1 versus 0; attached orbits regular versus zero | Open orbit determines the stratum | — |
| 7.7 Central-point unitarity | Zero and regular A₁ orbits | h/2=0 and ρ; spherical members unitary principal series and trivial | Both central points unitary | — |
| 7.8 Centralizer reduction | Regular A₁ orbit | Triple centralizer Lie algebra 0; residual ν=0 | No spurious complementary direction | — |
| 7.9 Extraneous point | Sp₆, partition (2,2,2) | Central norm²=3/4; candidate norm²=5/4; difference norm²=1/2 | Candidate not Weyl-conjugate to central point | — |
| 7.10 Classical extraneous points | Sp₈, partition (2,2,2,2) | Vector shift gives weights 0,±1/2,±1; printed spin shift gives ±1/4,±3/4 | D₂ correction excludes wrong point | R08 locator |
| 7.11 Exceptional extraneous points | F₄, B₃; source parameter t=1/2 | Correct norm²=15/2; CH26 printed norm²=39/2; CiF4 printed and sign-flipped norms² both 15/2 | CH26 error real; CiF4 misprint claim false | R07, R08 |
| 7.12 E₈ extra region | Half-integer and quarter-integer lattices | First ν₄≤1/2 gives ν₂+ν₄≤1; second ν₄≤1/4 gives sum≤1/2 | Both contradict required sum>1 | — |
| 7.13 Compact-centralizer reduction | Noncentral G₂ involution | Centralizer A₁×A₁; two positive centralizer values √q,√q; ambient highest value −q | Centralizer comparison preserves the unitary witness | — |
| Supplier σ-finite duality | Counting measure on ℤ, f=δ₀, g≡1 | μ(ℤ)=∞; pairing 1; ‖g‖∞=‖functional‖=1 | Existing B5 theorem applies | R05 |
| Supplier identifiers | Given #1828 and #1832 heads | Layer S occurrences 0; SC3/SC4 aliases 0; relevant numbered sections present | Citation drift | R06 |
| PR description | Fourteen Lean declarations | Seven definitions plus seven theorems=14; claimed definitions 5 | Count mismatch | R09 |

- Seeded sample: all 15 targets examined; 14 have readable primary/supporting text; BM94 is waived, with its implication checked against GS23 line 1374 and the sign comparison against MP21 lines 229–235.
- Source locations opened include BHV F.1.1/F.1.4 and C.4.10–C.5.6; GS23 §11; Ber92 Lemma 38; Cas95 Proposition 2.1.15; HO Corollary 1.2; CH26 §§6–8; BC1 §§3.1–3.4; MP21 Theorem 3; Luo26 Corollaries 5.1–5.2; CiF4 p.14.
- Native definitions read at the pins: Mathlib/RepresentationTheory/Continuous/Basic.lean:54, Mathlib/LinearAlgebra/Matrix/PosDef.lean:62, Mathlib/MeasureTheory/Group/Measure.lean:785, Mathlib/MeasureTheory/Measure/Regular.lean:317; orbit continuity, kernel continuity and Haar regularity are separate hypotheses.
- Native comparisons opened: Mathlib/Analysis/Convex/Extreme.lean:293 and KreinMilman.lean:96; TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean:124,141,170; TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:48, MatrixCoefficient.lean:70, Integrated/Basic.lean:141,291,341,349; none supplies the seven full headlines.
- All 14 elaborated signatures compared with the README: zero lost binders; seven rfl/simp/infer_instance probes fail; the additional full Milman signature elaborates. Fourteen library-search near-match groups inspected; no padding finding.
- Seventeen supplier subsections and all Needs lines read; fifteen declared gap entries checked against their README contracts; the already supplied σ-finite contract is R05 and stale supplier identifiers are R06.
- Worker gate: every scanner and targeted build passed. Independent `lake env lean` passed with exactly seven sorry warnings; outside-folder diff has zero paths.
- Dependency command output: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line.

Overlap check: read SmoothRepresentationsOfLocalGroups, GlobalShtukasAndFunctionFieldLanglandsPartII, ExceptionalThetaCorrespondencesForG2, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, AutomorphicLFunctionsAndLocalFactorsPartII, ReductiveGroupsPartII and CompactGroups. Smooth/Hecke/Jacquet/Satake objects belong to SmoothRepresentationsOfLocalGroups; rational-point and dual-group geometry to ReductiveGroupsPartII; compact Peter–Weyl theory to CompactGroups; local Fell/temperedness/complementary-series inputs to this Part II, consumed by the three named local/global consumers. AutomorphicLFunctionsAndLocalFactorsPartII owns its doubling/local-factor constructions. No second copy or conflicting ownership found; manual supplier-ID drift is R06.

Source independence: 25 passages compared with 10 sources, no copied non-formula passage found; largest keyed-citation share BHV, 63 of 266 before References. BHV contents (lines 25–138) and CH26 section headings compared: no one-to-one run of source chapters. Dependencies 0.5→0.7→1.6→1.8 and 5.16→5.18→6.3 explain the shared mathematical order; the roadmap combines, splits and supplements those sources.

## Not verifiable

- BM89, KL87, HM07, CS18 and Rodier73: settled uncertified citations; their primary texts were not available in the supplied legal cache.
- BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74: settled waived citations; no new request made. In particular BM94’s complete datum-sensitive statement is not independently certified from BM94.

## Source issues

- **Misprint** in GS23 at proof of Proposition 11.3 before Lemma 11.4, printed p.32 (line 1361): the source says the conjugate character divided by subgroup volume is the isotypic projector; it should be multiplied by the representation dimension; affects the proof.
- **Error** in GS23 at Proposition 11.6, printed p.33 (line 1398): the source says weak containment in a sequential sum gives an increasing-index convergent subsequence; it should be closure of the set of summand classes, allowing repeated choices of indices; affects a stated result.
- **Misprint** in BHV at proof of Theorem C.5.5(ii), printed p.386 (line 14686): the source says the point lies in the weak-star closure of the extreme points; it should be the weak-star closure of their convex hull; affects the proof.
- **Misprint** in CH26 at Theorem 6.9, printed p.18 (line 870): the source labels the hermitian locus C₀; it should label that locus C₀,h; affects nothing.
- **Error** in CH26 at Corollary 6.32(1), printed p.25 (line 1192): the source says every geometric generic unitary spherical parameter is tempered; it should be restricted to trivial or central compact part, with noncentral parts treated by centralizer reduction; affects a stated result.
- **Error** in CH26 at Theorem 8.5 and Remark 8.7, printed pp.28–30 (lines 1359,1438): the source says the extraneous-point lists exhaust all compact parts; it should be restricted to the real or central-compact sector; the noncentral G₂ parameter supplies an extra point; affects a stated result.
- **Error** in CH26 at Theorem 8.5(1)–(2), printed pp.28–29 (lines 1369,1380): the source says the orthogonal-factor shift always uses the indicated fundamental coweight; it should use the defining vector direction at multiplicity four, rather than a D₂ spin coweight; affects a stated result.
- **Error** in CH26 at Theorem 8.5(3), printed p.29 (line 1384): the source says the F₄, B₃ real part includes an additional ω₂; it should be ω₁+ω₃/2+ω₄/2, whose squared norm is 15/2 rather than 39/2; affects a stated result.
- **Misprint** in CH26 at proof of Theorem 8.5, case (2), printed p.29 (line 1422): the source says the surviving symplectic-dual multiplicity factors have odd part size j; it should say even j; affects the proof.
- **Misprint** in CH26 at §8.3 after (8.8), printed p.30 (lines 1454–1457): the source says the lattices become ℤ+1/2 and ℤ+1/4; it should retain ½ℤ and ¼+½ℤ, with ν₄≤1/2 and ν₄<3/4 respectively; affects the proof.

## For the human reviewers

- Luo26 is a July 2026 arXiv preprint; README:1358 uses its nonsplit generic/sign comparison beyond its stated characteristic-zero setting. The roadmap owns an all-characteristic proof, including the SU₃ finite-root calculation.
