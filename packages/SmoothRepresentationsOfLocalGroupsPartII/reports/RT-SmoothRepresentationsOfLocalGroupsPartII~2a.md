<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1642#issuecomment-6484668721 -->
Red team round 2 pass a (codex) of a450864

Verdict: needs_changes

1. **F01** (P2) The claimed equal-characteristic generic/sign adapter is absent

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1549`: “its characteristic-independent generic/sign adapter in SRU.5.28”; also §§5.5 and 6.2.

   **Claim:** The all-characteristic spherical genericity theorem has a supplied Whittaker/sign comparison.

   **Witness:** §4.3 (line 955) assumes characteristic zero. §5.28 (line 1430) states signatures, positivity and affine-to-graded comparison, but no Whittaker or Gelfand–Graev comparison. For G₂ over 𝔽₂((t)), neither stated target supplies that bridge.

   **Exact repair text:** Add to §5.28: “For every split connected reductive group over any nonarchimedean local field, with pinned hyperspecial K, Iwahori I and K-compatible Whittaker datum ψ_K, identify the I-fixed Gelfand–Graev module with the affine Hecke module induced from the finite sign character, and deduce the Whittaker/sign equivalence for irreducible Iwahori-spherical representations. Prove the analogous spherical/sign comparison for the unramified nonsplit root data used in §6.2, specifying the compatible datum.” Give these their own proof inputs and primary locator; point §§5.5 and 6.2 to them. This covers 𝔽₂((t)) without narrowing the theorem to characteristic zero.

2. **F02** (P1) The coefficient-decay example reverses the fixed valuation convention

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1007`: “χ = q^ρ … On the ray −mω₂^∨ … for St … q^(−2m)”.

   **Claim:** This computes the normalized Jacquet exponent and its modulus in the convention of §§4.4 and 5.1.

   **Witness:** Lines 23 and 1059 give q^ρ = δ_B^(−1/2), whereas §4.4 fixes χ = δ_B^(1/2). On valuation −mω₂^∨ the actual Steinberg coefficient exponent δ_B is q^(2m), not q^(−2m).

   **Exact repair text:** “In A₂, χ = q^(−ρ) in the valuation convention of §5.1. For w = s₂s₁, ρ+wρ = α₁. On the contracting ray with valuation mω₂^∨, δ_B^(1/2)wχ = q^(−m⟨α₁,ω₂^∨⟩) = 1, whereas the Steinberg exponent δ_B has value q^(−2m).” At q=2,m=1 the intermediate exponent is 1 and the Steinberg exponent is 1/4; the original negative ray instead gives 4.

3. **F03** (P3) A repaired Sp₆ Check has the wrong squared distance

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1806`: “that of (0, ½, 1) is ¾”.

   **Claim:** The squared distance from (0,½,1) to (½,½,½) is ¾.

   **Witness:** Their difference is (−½,0,½), with squared norm ¼+0+¼=½. The value ¾ is the squared norm of the central point, not this distance.

   **Exact repair text:** Replace “that of (0, ½, 1) is ¾” by “that of (0, ½, 1) is ½”. The squared norms ¾ and 5/4 remain correct and still exclude Weyl conjugacy.

4. **F04** (P3) The broadened genericity theorem retains a false torus Check

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:961`: “The trivial representation does not contain st_G and is not generic”.

   **Claim:** This example applies to the split connected reductive groups now admitted by §4.3.

   **Witness:** For G=𝔾_m(F), U=1, W=1 and st_G=1_K. The trivial representation contains st_G once and dim Hom_U(1,1)=1, so it is generic.

   **Exact repair text:** “When the semisimple rank is positive, the trivial representation does not contain st_G and is not generic. For a split torus, st_G=1_K and the trivial representation is generic, with one-dimensional Whittaker space.” Both rank zero and PGL₂ then satisfy the stated equivalence.

5. **F05** (P1) The classical list applies a nonexistent vector fundamental weight to SO₄

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1815`: “rⱼ ≥ 3 … ω^j_(⌊rⱼ/2⌋)”; §5.17 explicitly excludes D₂ from its simple-type formula.

   **Claim:** Half the last fundamental coweight of every orthogonal multiplicity factor gives an ambient-geometric extraneous point.

   **Witness:** Take G∨=Sp₈ and orbit (2,2,2,2): Z°=SO₄. In §5.17 coordinates ω₂=(−ε₁+ε₂)/2, so ½ω₂ has standard weights ±¼. Adding h/2 produces ambient standard weights ±¼,±¾, which are not half-integral.

   **Exact repair text:** “In each orthogonal multiplicity factor of dimension r≥3, use the vector direction v_r=ε_⌊r/2⌋ in the standard orthogonal torus coordinates. For r≥5 it is the vector fundamental coweight used above; for r=3 use the rank-one convention v₃=ε₁; for r=4, v₄=ε₂=ω₁+ω₂ in D₂=A₁×A₁. Replace every ω^j_⌊rⱼ/2⌋ in these two lists by v_rⱼ, and prove the rank-one and D₂ cases separately.” Add the Sp₈/(2⁴) Check: the corrected shift ½ε₂ gives dominant ambient real part (0,½,½,1), with standard weights in ½ℤ, rather than the quarter-integral weights of the printed formula. The two A₁ coordinates of this shift both have root pairing ½<1. CH26 Theorem 8.5(1), lines 1369–1371, has the same low-rank omission; the package must not propagate it.

6. **F06** (P3) The finite-Steinberg locator merges two different numbered results

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:913`: “Theorem 4.4, example (b), PDF p. 15”; repeated in sources.toml under CIK71.

   **Claim:** This is the exact location of the finite-Hecke sign example.

   **Witness:** CIK71 lines 514–532 contain Theorem 4.4. The examples are separately numbered 4.6 at line 534; example (b) occurs after the PDF-page-16 marker at line 537, on printed page 95.

   **Exact repair text:** “CIK71, Lemma 4.3 and Theorem 4.4, printed p. 94 (PDF p. 15), and Example 4.6(b), printed p. 95 (PDF p. 16); CIK71 lines 502, 514 and 534–556.” Apply the same locator correction to the existing CIK71 manifest entry. At GL₂(𝔽₃), the sign example still gives degree 3; the correction changes only where that supporting example is found.

7. **F07** (P3) The modular involution has no nonunimodular normalization Check

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:21`: “f*(g) = Δ(g⁻¹) conjugate(f(g⁻¹))”; reused by the integrated-GNS contract at line 111.

   **Claim:** The left-Haar involution convention is fixed for nonunimodular groups.

   **Witness:** The 101 labelled Checks contain no nonunimodular group. On every finite, compact, abelian or reductive group used there, Δ=1, so replacing Δ(g⁻¹) by Δ(g) passes those controls.

   **Exact repair text:** Add to SRU.1.3: “For the affine group (a,b)(c,d)=(ac,b+ad), a,c>0, use left Haar da db/a² and Δ(a,b)=a⁻¹. If f(1/2,0)=1, then f*(2,0)=2, whereas the inverse modular convention gives 1/2. Applying the involution twice multiplies the two factors 2 and 1/2, returning f.” This tests the actual nonunimodular analytic scope without changing the correct involution formula.

## Earlier findings: verification at this head

Locations below refer to `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md` unless another file is named. The earlier reports call their findings F01–F21 (pass a) and F01–F09 (pass b). Every row was checked against the current passage, not merely the repair report.

| Earlier finding | Status | Repaired passage and verification witness |
|---|---|---|
| a-F01 | repaired | Line 1232: “the letters name the type of the root system Φ^∨ of the dual group”. PSp₄ uses B₂; (0,¾) gives ¾<1, rather than the false C bound ¾<½. Line 1444 repeats the dual-type convention. |
| a-F02 | repaired | Line 865: “ν = ν_G + …”; “For unitary central character ν_G = 0.” For F× and abs, the root sum is 0 and the retained central component sends ϖ to q⁻¹. |
| a-F03 | repaired | Line 742: “irreducible constituents of unitarily induced admissible finite-length representations”. Inducing 1⊕1 from F× to itself gives the single class [1] with multiplicity 2. |
| a-F04 | repaired as a dependency graph | Line 1541: “Needs: SRU.5.28”; no §5.11 dependency remains. Line 167 explicitly declares the nonnumerical construction order. The listed forward edges no longer form the former 5.11↔5.29 cycle. This does not certify every proof input; S01 records a missing bridge. |
| a-F05 | repaired | Suggested.lean:125–131: “theorem isCompact_positiveTypeSubunit_integrals”. Line 492 registers the full headline. For the one-point group, Haar mass a>0 gives pairings f↦atf(e), 0≤t≤1, a compact segment. |
| a-F06 | repaired | Line 1555: “extension of least degree d splitting 𝐆”; repeated at 1557,1589,1603. PSU₃ gives d=2=ord τ; the quartic splitting extension no longer changes d. |
| a-F07 | repaired | Line 79 declares “gap:whittaker-multiplicity-one”; line 851 separates the hypothesis “dim … = 1”. For P=G₂ heredity is d=d; the contract supplies d≤1 and genericity supplies d≥1. |
| a-F08 | repaired | Lines 157–159 declare “gap:shahidi-local-coefficient” and “gap:heiermann-muic-implication”; line 869 consumes them. Torus coefficient=1, standard module irreducible; the general analytic implication is now explicitly contracted. |
| a-F09 | repaired, with a new Check regression | Line 955: “split connected reductive group”; line 1017 uses it for M. The (2,2) Levi in PGL₄ has W_M=S₂×S₂ and sign=sign⊗sign. Its split centre is retained. The newly included torus exposes S04. |
| a-F10 | repaired | Lines 1322,1334,1358 now cite “CH26 line 1060”, “1072”, “1111”. Page markers place them on PDF pages 22,22,23; the claimed highest-coroot values are respectively 1,1,½. |
| a-F11 | partly repaired | Lines 196,297,356,443,565,1070 replace laws by C₄, C₂, zero-space and explicit torus computations. Line 1807 tests pairing ¼∉½ℤ. Line 1806 introduces the false squared-distance value in S03. |
| a-F12 | repaired | Line 105: “gap:sigma-finite-l1-duality”, with the matching plan entry. BanachSpaceTheory B5 on main still starts with finite measure spaces (line 257). Counting measure on ℤ has infinite mass, and the declared contract requests the missing ℓ¹/ℓ∞ case. |
| a-F13 | repaired | Line 206: “BHV, Definition A.1.6 … BHV line 11742”. This is the actual sum construction; empty and singleton sums give 0 and H. |
| a-F14 | repaired | Line 1059: “only the q-logarithm ν and its Satake and chamber specialisations are defined here”; line 1078 cites N5 positive-real-part. The supplier's design lines 708–743 give r and u. diag(i,−i) has r=1,ν=0; diag(−2,−½) has r=diag(2,½). |
| a-F15 | repaired | Line 1635: “J' = w⁻¹(J), and Ad(w) transports representations … to L_J”. Ban02 lines 254–256 agree. For A₂ and w=s₂s₁, w⁻¹α₁=α₂, whereas wα₁=−α₁−α₂. |
| a-F16 | repaired by removing the overclaim | Line 1714: “that extension is not claimed here”. Lines 1684,1710 cite KL87 Theorem 7.12 for adjoint G only. Reeder's unrestricted-isogeny assertion is absent; q=2 remains allowed. |
| a-F17 | repaired | sources.toml now has 30 distinct source keys, including BM89, BM93, KL87, HM07 and the seven waived keys. Re02 is no longer cited. Settled access statuses are preserved; no new source request was made. |
| a-F18 | repaired | Suggested.lean:112–119 and 178–191 define WeaklyContainedInFamily and conclude “∃ i, ∃ w : H' i”. In C₂ with σ=sign, family {1,sign}, ε<2 forces the sign member. Empty family fails hweak at e. |
| a-F19 | repaired | Line 139: “Consume Layer S”; line 141 contracts convolution. Springer design S/steinberg-variety at 714 and S/steinberg-components at 762 match; H at 1058 is holonomic theory, no longer an input. |
| a-F20 | repaired | Suggested.lean:21–25 names “Rodier heredity”, “generic standard-module theorem”, finite Steinberg, Whittaker/sign and constituent/exponent targets with missing carriers. No replacement scalar theorem was added. |
| a-F21 | repaired at characteristic zero | Line 955 fixes ψ_K trivial on 𝔭 and nontrivial on O; line 1017 transports that datum into the Levi. The SL₂(ℚ₃) spherical constituent has T_s=3, not −1, and is excluded for ψ_K. Extending that bridge to positive characteristic is the separate S01 issue. |
| b-F01 | repaired | The three CH26 corrections are as above. Line 1710 separates §8.1/line1307/page27 from Corollary5.7/line702/page15; line612 gives GI18 pages29–31, lines1289/1319. Page markers confirm these. |
| b-F02 | repaired | Line1831 uses squared norm “7 + 2t²”; line1833 supplies the corrected CiF4 sign. At t=½, (2,1,3/2,½) reflects to (5/2,½,1,0), both norm²=15/2. The printed CH26 point has norm²=39/2. |
| b-F03 | repaired | Same concrete Layer S and gap correction as a-F19; H has no remaining supplied-convolution role. |
| b-F04 | repaired | Lines129,131,133 and plan gaps split “triple-centralizers”, “graded-open-orbit”, “orbit-tables”. These separately specify reductivity, q-eigenspace orbits, and semantic tables. The old compound slug is absent. |
| b-F05 | repaired | All 89 numbered target headings now have explicit slug labels, e.g. line1720 “(*az-iwahori-matsumoto*)”. The highest-weight input is N5 at line1402. |
| b-F06 | repaired | Line179 uses IsStronglyContinuous; lines345–347 use [π] and unitary equivalence; line427 writes the coefficient bound; line580 names the Hilbert-sum criterion; line558 gives the open operator-support set. The former nonexistent identifiers are gone. |
| b-F07 | repaired | The free convex-space theorem is absent from Suggested.lean. README §1.2 retains Milman's converse. Its ℝ interval instance gives ext[0,1]={0,1}; it is not added back as acceptance padding. |
| b-F08 | repaired as to group generality; analytic limitation below | Suggested.lean:149–180 omits second countability in Raikov and both approximation theorems; README lines504 and524 say locally compact Hausdorff. Uncountable discrete groups now instantiate them. The measure regularity issue is recorded under Not verifiable. |
| b-F09 | repaired outside this package; not re-raised | The repair report correctly called the former consumer placement outside scope. Current ORDER.txt has this roadmap at252 and GlobalShtukasAndFunctionFieldLanglandsPartII at268; the consumer is now later. Line1877 still calls it a consumer. |

## Adversarial statement ledger

These are computed finite and boundary tests, not proofs of the general results. A result of “passes” means the displayed tests do not refute the statement. A source or supplier limitation is recorded separately below. The sampled README rows combine defining formulas, associated identities and worked Checks. Conditions excluded by a target are tested as negative controls, not silently admitted: q=1 is not a residue-field cardinality; zero rings, inseparable coefficient extensions and nonreduced schemes are outside the complex representation/local-field carriers. Rank-zero tests apply to the general reductive targets, not the quasi-simple targets. No natural-number division or subtraction occurs in the Lean signatures.

### Suggested.lean: all 14 declarations

For every theorem, the context includes `[IsTopologicalGroup G]`; definitions that do not use continuity of group operations intentionally omit it. All names below are in `TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII`. Line numbers refer to `packages/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean`. G has a group structure throughout; “Hilbert” includes completeness, “pre-Hilbert” does not. No hidden section hypothesis is being counted as a binder.

| Declaration; section; explicit context | Instances and computed values on both sides | Result/change |
|---|---|---|
| IsStronglyContinuous, 43; SRU.0; topological G, complex pre-Hilbert H, continuous-linear representation π | C₄ acts on ℂ by i: each orbit is continuous. Translation of ℓ²(ℚ_p with counting measure): distance between δ₀ and δ_g is √2 for g≠0, so the orbit is discontinuous at 0 despite each operator being continuous. | Correct distinction from operator continuity; retain. |
| IsTopologicallyIrreducible, 50; SRU.0; complex pre-Hilbert H | Zero space: closed-subspace clause holds but Nontrivial=false. Trivial action on ℂ: subspaces 0,ℂ, true. Trivial action on ℂ²: coordinate line is closed invariant and neither 0 nor top, false. | Nonzero clause essential. |
| IsPositiveType, 58; SRU.0; arbitrary group G, function φ | φ=1: quadratic form is abs²(Σc). φ=−1 at one point gives −1. On ℤ, φ(0)=1, φ(n≠0)=2 gives matrix [[1,2],[2,1]], determinant −3. | Native matrix predicate rejects wrong models. |
| positiveTypeOne, 62; SRU.0; topological G | One-point group: sole member φ(e)=1. C₂: φ=(1,t), real −1≤t≤1; eigenvalues 1±t≥0. φ=0 and φ=2 fail normalization (0≠1,2≠1). | Three independent restrictions have witnesses. |
| ptCoeff, 66; SRU.0; pre-Hilbert H, π,v | C₄, π(g)=i, v=1: inner(v,π(g)v)=i; reversed slot is −i. At e value=norm(v)²; at v=0 value=0. | Second-slot-linear convention consistent. |
| exists_gnsRep, 74; SRU.0; topological G, continuous φ, positive type | φ=0 gives zero Kolmogorov space and zero feature. φ=1 gives dimension 1 and trivial action. Discrete φ=δ_e gives ℓ²(G), feature(g)=δ_g and π(a)δ_g=δ_ag. C₄ character i gives inner(feature(e),feature(g))=i. | Nonabelian translation orientation correct; no completeness binder missing from native completion. |
| mem_extremePoints_positiveTypeOne_iff, 86; SRU.0; normalized continuous φ, native Kolmogorov representation, unitary/strong/feature-action hypotheses | C₂: t=±1 extreme, Gram rank 1, irreducible; t=0 is midpoint, rank 2, reducible. Trivial group gives one extreme point and dimension 1. Zero φ fails φ(e)=1. | Equivalence survives both directions; supplied action conditions do not contain irreducibility. |
| WeaklyContainedIn, 101; SRU.1; topological G, two pre-Hilbert representations | Nonzero σ versus zero π: error at e=norm(v)², fails ε=½norm(v)². Zero σ: n=0, error 0. Regular ℤ coefficient at k equals max(0,1−abs(k)/(2N+1)); at k=1 tends to 1, approximating trivial σ. | Finite sums and compact tests are substantive. |
| WeaklyContainedInFamily, 112; SRU.1; family indexed by arbitrary ι, dependent pre-Hilbert spaces | Empty family and zero σ: empty sum=0, true. Empty family and unit vector σ: error at e=1, false for ε=½. C₂ family {1,sign} contains sign; at generator coefficients are 1 and −1. | Empty index type handled; no implicit nonemptiness assumption. |
| isCompact_positiveTypeSubunit_integrals, 125; SRU.1; LC Hausdorff second-countable G, Borel measure μ, Haar | Trivial group with Haar mass a>0: image is {f↦atf(e):0≤t≤1}, a compact segment. Circle characters zⁿ have integrals tending to 0 against every L¹ test; their limit belongs to subunit image but not normalized image. | Correct full compactness headline. |
| godement, 136; SRU.1; same G,μ; φ in L∞ | Trivial group, φ=c: quadratic integral=a² abs(f(e))² c, nonnegative iff c is nonnegative real, exactly continuous positive type. c=−1 fails at f=1; c=0 yields ψ=0. Finite C₂ test matrix has eigenvalues 1±t. | L∞ equivalence-class formulation appropriate. |
| raikov, 149; SRU.1; LC Hausdorff G, Borel Haar μ, arbitrary filter, continuous normalized positive-type functions | Trivial group: all functions=1 and both limits hold. Bottom filter: both Tendsto clauses true. On an uncountable discrete group compact sets are finite, and each L¹ function has countable support with arbitrarily small ℓ¹ tails; uniform bound 1 controls the tail. Circle zⁿ has weak limit 0 but 0(e)≠1, so is correctly excluded. | Mathematical boundary tests pass; general nonregular-Haar scope remains uncertified below. |
| exists_coeff_approx_of_weaklyContainedIn, 162; SRU.1; LC Hausdorff G, complete H,H′, unitary strong σ,π, irreducible σ, weak containment | C₂ sign weakly contained in regular representation: w=(1,−1)/√2 has coefficient −1 at generator, error 0 and norm 1. Reducible regular σ with v=δ_e gives coefficient 0 there; neither one-dimensional character approximates it within ε<1. Empty Q still requires a unit w, forced by nonzero σ and weak containment. | Completeness/irreducibility explicitly retained. |
| exists_coeff_approx_of_weaklyContainedInFamily, 178; SRU.1; same, with every H′ i complete and every π i unitary/strong | C₂ sign versus family {1,sign}: generator error is 2 for the trivial member and 0 for sign. Empty family cannot satisfy weak containment for the unit v. Zero family members give error 1 at e. | Actual family member is concluded; no finite-sum substitute. |

### README: sampled adversarial rows

The following 25 rows retain boundary cases, convention controls and finding witnesses from the 89-target audit.

| Target | Instances tried; computed values | Result/change |
|---|---|---|
| 0.3 Positive type | Constant 1 gives abs²Σc; constant −1 gives −1 at c=1. Subgroup indicator is a quasi-regular coefficient. ℤ values (1,2,2,…) give determinant −3. S₃ standard-axis reflection fixes v: two-point Gram is all 1, values 4 and 0 on (1,1),(1,−1). | Passes on cyclic and nonabelian examples. |
| 0.8 Compact averaging | A conductor-pⁿ character averages to 0 on ℤ_p and 1 on pⁿℤ_p. For S₃ standard τ of degree 2, correct e_τ acts as 1; omitting d_τ gives 1/2. Infinite algebraic character sum is dense and proper in its completion. | Passes with required degree factor. |
| 1.2 Milman's converse | Segment [0,1]: extremes 0,1; circle: closed convex hull is disk, extremes circle. In ℓ², e_n have norm 1 while averages have norm 1/√n→0, so 0 can be an extreme point of the closed convex hull without belonging to closure{e_n}; this noncompact S is excluded. | Passes; compactness cannot be dropped. |
| 1.6 Single-family coefficient | C₂ sign is approximated with error 0 by the sign member of {1,sign}; trivial member error 2. Reducible regular coefficient at generator 0 has distance 1 from each one-dimensional member. Empty family has error 1 at e. | Passes; irreducibility and family quantifier are essential. |
| 1.9 Sequences and closure | Sequence St,1,1,… has closure containing St but no subsequence tending to isolated St; cluster set={1}. Constant St has limit and cluster sets={St}. | Corrected cluster qualification passes. |
| 2.5 Completion and smooth vectors | Finite-dimensional completion is identity. c₀₀(ℤ) completes to ℓ²(ℤ). For ℤ_p increasing-conductor character sum, each open-fixed space has finitely many coordinates, so completion adds no smooth vectors. Infinite trivial algebraic sum has completed smooth space all ℓ², strictly larger than c₀₀. | Passes; admissibility matters. |
| 3.2 Characters separate semisimplifications | GL₂ reducible principal series and 1⊕St have equal character Θ₁+Θ_St but are not isomorphic. C₂ character evaluation matrix [[1,1],[1,−1]] has determinant −2, so multiplicities are determined. | Passes; finite-length qualification retained. |
| 3.8 Generic standard modules | F× has no roots but abs has nonzero central exponent, retained by ν_G. GL₂ exponents ±1/4 give irreducible generic standard module; at ±1/2 the spherical quotient is nongeneric and the standard module reducible. | Passes; root-only repair verified. |
| 4.1 Finite Steinberg | GL₂(𝔽₃): permutation space on ℙ¹ has dimension 4, quotient by constants dimension 3=q. Rank-zero torus has N=0 and dimension q⁰=1. SL₃(𝔽₂) has dimension 2³=8. Finite Hecke generator eigenvalues q and −1 distinguish trivial and Steinberg. | Passes also at residue characteristic 2. |
| 4.3 Whittaker/sign | Split torus: st=1, dim Whittaker(1)=1, refuting trivial-representation Check. SL₂(ℚ₃) quadratic principal-series constituents have T_s=3 and −1, distinguished by the pinned datum. Levi (2,2) has sign⊗sign. | S04; characteristic-zero scope leaves S01. |
| 4.6 Unitary constituents of principal series | A₂ intermediate exponent on contracting mω₂∨ is 1; St exponent at q=2,m=1 is 1/4. On the printed negative ray it is 4, not 1/4. Rank one has only 1 and St. | S02. |
| 5.1 Real Satake parameter | diag(−2,−1/2) has positive part diag(2,1/2), compact part −I, q=2 logarithm (1,−1). diag(i,−i) gives ν=0. q^ρ=δ_B^(-1/2) in the stated valuation convention. | Passes; comparison with 4.6 produces S02. |
| 5.11 Unitary classification | PSp₄ uses dual B₂: (0,3/4) has highest-root value 3/4<1. The C₂ bound would falsely demand 3/4<1/2. G₂ at (ν₁,ν₂)=(7/20,0) gives 7/10<1<21/20 in second region. | B/C correction passes. |
| 5.17 Type D | D₄: two spin half-weights have coordinates ±1/4 and vector half-weight (0,0,0,1/2); highest-root value 1/2 for all. D₃ leaves vector half-weight, matching A₃. D₂ is explicitly outside simple-type formula. | Target passes; reuse without D₂ exception fails in S05. |
| 5.27 Noncentral G₂ witness | Six positive-root values are −1,√q,−√q,√q,−√q,−q; at q=2 and 3 none is q or q⁻¹. Compact centralizer roots (0,1),(2,1) are orthogonal A₁×A₁. ν=ω₂/2 is nonzero, geometric, and becomes a reducibility wall if compact part is removed. | Passes; refutes unrestricted source corollary. |
| 5.28 Signature/comparison infrastructure | Rank-one c=1/2 gives 1/3 positive detecting scalar, c=2 gives −1/3; q=2,3 give finite-generator eigenvalues (2,−1),(3,−1). No Whittaker-space object appears in target's comparison. | Signature controls pass; missing promised generic/sign bridge S01. |
| 5.29 Explicit regions | Exceptional lists have 2,8,16 alternatives. At ν=0 all b_j=0, so exactly each first alternative holds; alternatives demanding b_j>1 fail. Every displayed doubled simply-laced root has squared norm 8, hence root norm²=2. B₃ sample (1/5,2/5,9/10): interval (2/5,9/10) contains 1−1/5=4/5 once. | Concrete lattice/region controls pass; source table audit below. |
| 6.1 Folded companion | PSU₃: least splitting degree 2, fixed dual SO₃, companion SL₂; a quartic splitting extension must not change d. For ²A₃, SL₄ fixed subgroup Sp₄ gives companion SO₅. ³D₄ has d=3, companion G₂. Identity folding returns original group. | Passes with isogeny retained. |
| 6.4 Odd unitary exception | PSU₃ fixed dual SO₃: residual half-vector parameter has weights −1/2,0,1/2 in defining representation. Spin weights ±1/4 would detect it but spin does not descend to SO₃. | Passes; no illicit spin representation. |
| 7.1 Aubert signs | Torus D=id; GL₂ D(1)=St, D(St)=1, D(cuspidal)=−cuspidal. Rank-two cuspidal sign is +1. In A₂, w=s₂s₁ gives w⁻¹α₁=α₂ while wα₁=−α₁−α₂. | D²=1 and corrected J′ direction pass. |
| 7.3 KL parameters | For dual SL₂, s=diag(√q,1/√q) has Ad(s)e=q e on upper root vector. s=1 has eigenvalue 1, so nonzero e fails q-eigencondition; e=0 always satisfies it. q=1 excluded. | Passes; Springer enhancement and isogeny restriction retained. |
| 7.9 Extraneous point | Sp₆/(2³): central norm²=3/4, extra norm²=5/4, squared distance=1/2. Rank-one ν=ω/4 has root value 1/4, hence fails geometricity although unitary/generic. | S03 corrects distance only. |
| 7.10 Classical extraneous lists | Sp₆/(2³) vector shift gives (0,1/2,1). Sp₈/(2⁴) printed D₂ half-ω₂ gives ambient ±1/4,±3/4; corrected half-ε₂ gives (0,1/2,1/2,1). Spin: one vector shift gives spin weight 1/4, two shifts give sums 0,±1/2. | S05; parity test otherwise passes. |
| 7.11 Exceptional extraneous lists | F₄/B₃ orthogonal norm formula 7+2t² gives 15/2 at t=1/2; printed CH26 point gives 39/2, forcing t=5/2 outside 0≤t<1. Corrected (2,1,3/2,1/2) reflects to (5/2,1/2,1,0). F₄/Ã₁+A₁ point has norm²=5/4. | Corrected numeric points pass; full exceptional exhaustion source-dependent. |
| 7.12 E₈/4A₁ extra region | Half-integer coordinates and ν₁+ν₄<1 force ν₄≤1/2, so ν₂+ν₄≤1 contradicts >1. Quarter coset forces all ν_i≤1/4, sum≤1/2. Samples (1/2)^4 and (1/4,3/4,3/4,3/4) violate upper bounds at 1 and 3/2. | Passes; both full lattices retained. |

### Additional convention and table controls

| Convention/data | Computation | Result |
|---|---|---|
| Nonunimodular left-Haar star | Affine group at (2,0): Δ=1/2, Δ(g⁻¹)=2; correct star multiplies the conjugate inverse value by 2, inverse convention by 1/2; star squared has factor 2·1/2=1. | Formula correct; missing README witness is S07. |
| Positive square root | q=2 and 3 give positive real √2,√3 in ℂ, each square q. No division by 2 in residue-field coefficients occurs. q=1 would make log q=0 but is excluded by residue-field cardinality ≥2. | No bad-prime exception needed. |
| Full exceptional region tables | The 26 inequality rows match BC1 lines 2195–2231. The 53 doubled root vectors match BC1 lines 2235–2254 after multiplying by 2; every norm² is 8. First-row highest-root norms are 2. At ν=0 all 53 pairings vanish. | No transposed inequality or root-vector sign found. |
| Rank-one quotient convention | With χ=q^ρ=δ_B^(-1/2), constant functions give the trivial subrepresentation of normalized induction; with χ=q^(-ρ)=δ_B^(1/2), trivial is the quotient. | README §5.1 corrects CH26's quotient wording; §4.6 still violates it (S02). |
| Parabolic/Aubert convention | In rank one D=Ind∘Jacquet−id gives D(1)=St and D(supercuspidal)=−supercuspidal. In rank two cuspidal sign is +1. | Signed D and unsigned AZ are distinct, as required. |

## Supplier, ownership and acceptance audit

The 15 roadmap supplier subsections were resolved at the current main copy when present, otherwise at the supplied open head or the board's accepted earlier package/design exposed by `roadmaps show`. A revision of an existing main roadmap was not substituted for main. Searches by object used `roadmaps grep`, the main/Completed trees, board packages, and the available sibling copies. No duplicate fully qualified declaration name was found. This is an object-search audit, not a claim to have read every unrelated sibling file in full.

| Supplier and exact locus | Checked contract and ownership boundary |
|---|---|
| SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.1.1–1.5, SR.2.1–2.3, SR.3a.1–3a.2, SR.3.1–3.4, SR.4.1–4.2, SR.5.3 | The named sections/targets exist: normalized induction/Jacquet, Iwahori–Matsumoto, uniform admissibility, Bernstein decomposition, tempered support, nonsplit Iwahori components, Satake and highest-derivative adapter. General Whittaker multiplicity one is not asserted by its GL₂ target; it is contracted here. No equal-characteristic anti-spherical/sign comparison was found (S01). |
| ReductiveGroupsPartII RG2.0, RG2.3–RG2.5 | Rational-point topology, hyperspecial vertices, reductive special-fiber quotient, Iwasawa/Cartan and dual root datum are actual targets. The fixed group must retain its character lattice, as the PSU₃ control does. |
| ReductiveGroups Layers 2 and 7 | Lie/adjoint action, root subgroups, parabolics and Bruhat decomposition exist. The all-field root-subgroup route is distinct from the complex exponential route. |
| NoncompactQuantumSymmetry M0, M0a and “Shared group C*-algebra and weak-support comparisons” | M0 explicitly uses orbit continuity, nonzero closed-subspace irreducibility and vector-valued compact projections with factor d_τ. Shared section compares integrated kernel inclusion with coefficient containment. This package consumes these, while owning the general positive-type/Fell constructions rather than the supplier's model-specific classifications. |
| OperatorTheory/PolarDecomposition Part B, PD-B24–34 and PD-B36 | Rectangular polar partial isometry and uniqueness are present; T=2id has polar factor id, not adjoint 2id. |
| BanachSpaceTheory B5 | Finite-measure L¹/L∞ duality exists; infinite σ-finite extension is an explicit gap, not an asserted supplied theorem. |
| OperatorAlgebraDynamics D1–D2 on main | Universal integrated crossed-product representations and full group C*-algebra are present. Positive L¹-functional GNS comparison is separately contracted. |
| CStarAlgebras C2 | Nonzero irreducibles, pure-state/GNS equivalence and primitive ideals exist; PI dimension bound and bounded-trace limits remain separate gaps. |
| RepresentationTheory/LieHighestWeight Layers 0,2,4 | Integral sl₂ weights, weights/coroots and highest-weight representations are the correct owners. No new highest-weight classification is planned here. |
| LieHighestWeightPartII N0–N3,N5 | N5 owns positive-real-part and highest-weight half-integrality; N2 owns classical/spin comparisons. Triple-centralizer reductivity, graded-open-orbit theorem and semantic exceptional orbit tables are separately contracted, not inferred from N3 profiles. |
| SpringerResolutionAndCharacteristicCycles S | Springer resolution, reduced Steinberg variety and components exist in S. Equivariant coherent K-convolution and the Hecke/enhancement comparison are contracted; H is not silently used as their owner. |
| EndoscopicTransferAndUnitaryTraceComparison §2.16 | Character theorem and Weyl integration have characteristic-zero hypotheses, matching SRU.3. The induced-character continuity contract supplies the additional topological assertion. |
| ExcursionOperatorsAndSpectralActionPartII SC3–SC4 | Central compatibility and atomic semisimple-parameter interface exist. All-local-field induction/cuspidal-support compatibility is explicitly requested as a gap. |
| AutomorphicLFunctionsAndLocalFactors AL.4 | Cited as owner of two new contracts, not as having already stated the general Shahidi/HM input. No missing-current-theorem finding is raised against those contracts. |
| AutomorphicSpectralTheory §7.0b | Finite-place GLₙ unitary induction/Speh classification is expressly owned there. Its number-field use is characteristic zero; this package expressly makes its Hecke proof supply the function-field specialization. |

All 15 gap slugs match between `design/plan.json` and the README. Each names a supplier, the hypotheses and the consumed comparison. None has supplier `none`. The connected statements within the K-theory and finite-product contracts specify one comparison package rather than an unspecified collection of unrelated prerequisites. Existing compact projection, additive GNS, finite-GL₂ Steinberg and finite-measure duality results are not requested again. These are accepted conditional supplier contracts, not completed formalizations.

The stated construction order allows internal forward references but does not treat numbering as a proof order: 3.6→3.5→3.4, 4.9 before 4.1/4.5, 5.28 before 5.29/5.11, and 7.12 before 7.11. The former 5.11↔5.29 cycle is removed. Mechanical direction check, run read-only with the requested arguments, returned exactly:

```text
depcheck: 186 roadmaps, 1230 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Current merge-order positions are 252 for this roadmap and 268 for GlobalShtukasAndFunctionFieldLanglandsPartII, whose RA.8 consumes its restricted lists. That consumer is not a supplier. The issue settled as outside-package in the previous repair is not re-raised.

### Pinned-library record

The manifest pins inspected are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. All 36 declarations in the two native supplier registries were located at these pins, not at a current online library. In the table, paths beginning Mathlib or TauCeti refer to those pinned repositories.

| Declaration(s) | Pin location |
|---|---|
| ContRepresentation | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54` |
| ContinuousMap | `Mathlib/Topology/ContinuousMap/Defs.lean:32` |
| InnerProductSpace.Core | `Mathlib/Analysis/InnerProductSpace/Defs.lean:154` |
| LocallyConvexSpace | `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:50` |
| Matrix.PosSemidef | `Mathlib/LinearAlgebra/Matrix/PosDef.lean:62` |
| MeasureTheory.Lp | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89` |
| MeasureTheory.Measure.haar | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean:582` |
| Multiplicative | `Mathlib/Algebra/Group/TypeTags/Basic.lean:44` |
| Representation.IsIrreducible | `Mathlib/RepresentationTheory/Irreducible.lean:29` |
| Set.extremePoints | `Mathlib/Analysis/Convex/Extreme.lean:70` |
| Submodule.orthogonalProjectionOnto | `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:120` |
| TopologicalSpace.generateFrom | `Mathlib/Topology/Order.lean:70` |
| UniformSpace.Completion | `Mathlib/Topology/UniformSpace/Completion.lean:291` |
| UniformSpace.Completion.innerProductSpace | `Mathlib/Analysis/InnerProductSpace/Completion.lean:89` |
| WeakDual.isCompact_closedBall | `Mathlib/Analysis/Normed/Module/WeakDual.lean:269` |
| closure_convexHull_extremePoints | `Mathlib/Analysis/Convex/KreinMilman.lean:96` |
| convexHull | `Mathlib/Analysis/Convex/Hull.lean:45` |
| extremePoints_convexHull_subset | `Mathlib/Analysis/Convex/Extreme.lean:293` |
| lp | `Mathlib/Analysis/Normed/Lp/lpSpace.lean:369` |
| Matrix.PosSemidef.KolmogorovSpace, kolmogorovFeature, inner_kolmogorovFeature, kolmogorovFeature_dense, kolmogorovIsometry, kolmogorovEquiv | `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean:125`, 132,141,170,208,278 |
| TauCeti.ContRepresentation.IsUnitary, IsUnitary.subrepresentation, IsUnitary.adjoint_eq_inv | `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:48`, 105,189 |
| TauCeti.ContRepresentation.matrixCoeff, matrixCoeff_apply | `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean:70`, 77 |
| TauCeti.ContRepresentation.subrepresentation | `TauCeti/RepresentationTheory/Continuous/Subrepresentation.lean:47` |
| TauCeti.GL2Steinberg, finrank_GL2Steinberg, character_GL2Steinberg, character_GL2PrincipalSeries_one_one_eq_one_add | `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean:105`, 128,140,170 |
| TauCeti.IsPositiveDefiniteSub | `TauCeti/Analysis/PositiveDefinite/AddGroup.lean:140` |

The decisive native carrier fields are `toMonoidHom : G →* V →L[R] V` and `M.IsHermitian ∧ ∀ x : n →₀ R, ...`. The former has no orbit-continuity law; the latter tests every finite-support vector but has no continuity, nonzero or normalization condition. The native matrix coefficient explicitly takes `(hπ : Continuous π)` and evaluates `⟪π g v, w⟫`; it is not the strong-continuity second-slot adapter in this package. The existing additive GNS and `TauCeti/Analysis/Fourier/Pontryagin/StronglyContinuous.lean:273` require AddCommGroup and do not supply a nonabelian GNS action. `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:86` supplies roots of a GL₂ newform polynomial, not the general spherical constituent carrier.

### Headline coverage and one-tactic probe

| README headline group | Acceptance-file disposition |
|---|---|
| Nonabelian GNS; pure positive type iff irreducible | Both present, on native Kolmogorov carrier. |
| Godement; positive-type subunit compactness; Raikov; irreducible single-coefficient approximation, including families | All five present. Together with the two above, these are the seven admitted theorems. |
| Fell closure of sums and isolated summands | Docstring names missing unitary-equivalence quotient/Fell/Hilbert-sum interface. |
| Bernstein unitary admissibility, smooth/unitary bijection, character and generic limits | Docstring names smooth rational-point, Hecke, distribution-character and parabolic carriers. |
| Finite Steinberg, Rodier heredity/standard modules, Whittaker/sign, principal-series constituents/exponents, Howe–Moore and isolation | Each is named in the docstring with its missing flag/Hecke/Whittaker/Jacquet or rational-point carrier. Existing finite GL₂ special case remains an imported Check. |
| Generic spherical unitary/half-integral classification and nonsplit geometric temperedness | Docstring identifies Satake constituent and affine/graded Hecke comparison, rather than replacing them by free scalar inequalities. |
| Aubert duality and semisimple parameters; enhanced KL classification; central points, reduction and extraneous lists | Docstring identifies Grothendieck, semisimple-parameter, Springer enhancement and spherical/graded-Hecke carriers. |

None of the seven retained theorems reduces to unfolding a definition or applying one of the supplied pin declarations: kernel Kolmogorov existence alone does not construct the nonabelian strongly continuous action; compactness of a dual ball alone does not close the positive-type image; the two single-coefficient conclusions are strictly stronger than their finite-sum hypotheses. All seven definitions are used to state these headlines, and all have real bodies. No new padding finding. The removed standalone convex-space Milman theorem remains in the README rather than returning as acceptance padding.

## Verified sound

Read all **1,906 README lines**, all **195 Suggested.lean lines**, and all **30 earlier findings** with the repair report. The audit covered **14 Lean declarations** (7 definitions, 7 theorems), **89 numbered README targets**, and **101 labelled Check bullets** in 28 blocks, plus unlabelled examples and the 26-region/53-root tables. This shortened report retains the declaration table and 25 sampled README rows. The false Check values and missing convention control are explicitly separated in S03, S04 and S07.

Located and checked **103 distinct explicitly keyed source-line anchors** against the 20 cached certified texts; this is a locator count, not a claim that every cited proof was reproduced. The wrong CIK71 locator is S06. The two tables of exceptional roots/regions were compared with BC1 §7.2, including all signs and inequality directions. Earlier corrected CH26 pages and the GI18 statement/proof locations were rechecked. Ten settled unavailable works retain their three uncertified and seven waived statuses.

Resolved **15 roadmap supplier contract sections**, checked all **15 gap pairs**, and located all **36 native registry declarations**. Ownership searches found no duplicate of the new fully qualified Lean declarations and no earlier owner of the nonabelian positive-type/Raikov/Fell package. Existing smooth representation theory, GL₂ finite Steinberg, compact Hilbert projections, positive-real-part, Springer geometry, and GLₙ unitary classification are cited rather than replanned. The seven findings above do not treat declared supplier gaps as missing current implementations.

The read-only diff lists eight changed files, all under `packages/SmoothRepresentationsOfLocalGroupsPartII/`. Suggested.lean has the permitted Mathlib import and two existing used Tau Ceti imports, no sorry'd data, no set_option, no lemma declarations, no admitted examples and no proof-by-assumption placeholders. Its namespace and README names match. No computational algorithm target or pull-request/process narrative was found in the README or Lean docstrings. Static binder inspection confirms explicit completeness, group-continuity, Haar/Borel and finite-support assumptions where recorded in the declaration ledger; no theorem silently loses a standing section variable.

## Not verifiable

- **Elaboration:** the supplied signature extraction failed before producing signatures because a Tau Ceti object file was unavailable. No Lean command or build was run, in accordance with the read-only/no-build instruction. The audit is of written types and pinned source declarations, not a successful `#check @name` run; no elaborated-type change is claimed.
- **Arbitrary-Haar Raikov generality:** after removing second countability, Suggested.lean:149 still quantifies over every native `IsHaarMeasure`. `Mathlib/MeasureTheory/Group/Measure.lean:775` explicitly distinguishes that class from regular/inner-regular Haar measures. BHV line 14695 uses compact approximation of an L¹ test, and README:510 uses inner regularity. I did not establish that step for every measure admitted by the weaker native class, nor obtain a counterexample. This is not reported as a false theorem; regular-Haar instances and uncountable discrete groups were checked. A proof must justify that extension or carry the needed regularity explicitly without restoring a second-countability restriction.
- **Settled inaccessible sources:** BM89, KL87 and HM07 are uncertified; BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74 are waived. Their precise published proofs were not independently verified and were not requested again. In particular the full geometric KL classification and standard-module implication remain conditional on those sources/contracts.
- **Damaged extraction:** Cas80 Proposition 3.5 loses part of its displayed criterion in the cached extraction. Its location is verified; Kato81 Theorem 2.2 supplies the readable stabilizer criterion. CiF4 line 584 has a damaged sign glyph, so the asserted printed typo there could not be independently distinguished from extraction damage; the corrected orthogonal-coordinate calculation in the package was independently checked.
- **Full exceptional classification proofs:** the E₆/E₇/E₈ input tables and their test values were checked, but the complete Weyl-type signature/exhaustion arguments and all semantic Bala–Carter table identifications were not reproved. Those require the specified comparison and orbit-table contracts. No claim that finite test values prove an exhaustive classification is made.
- **External ownership coverage:** the given open-head copies and indexed `roadmaps grep` searches were used by object. Unprovided/private or subsequently changed open work was not inspected. Supplier citations were resolved afresh; unrelated files were not exhaustively read.

## Source issues

- **Error** in CH26 at Corollary 6.32(1), printed p. 25, CH26 line 1192: the source says geometric generic unitary parameters with arbitrary compact part have zero real part; it should be restricted to real or central-compact parameters, with centralizer reduction otherwise; affects a stated result.
- **Error** in CH26 at (6.2)–(6.3) discussion, printed p. 17, CH26 line 808: the source says the dominant parameter gives the spherical quotient under its positive-valuation convention; it should be the spherical subrepresentation, or induction should use the negative parameter; affects a stated result.
- **Error** in CH26 at Theorem 8.5, printed pp. 28–29, CH26 line 1359: the source says its extraneous lists exhaust parameters without restricting compact parts; it should restrict the lists to real or central-compact parameters; affects a stated result.
- **Error** in CH26 at Theorem 8.5(1)–(2), printed pp. 28–29, CH26 line 1369: the source says every orthogonal multiplicity factor uses half its last fundamental coweight; it should specify the vector direction and handle SO₄ using ω₁+ω₂; affects a stated result.
- **Misprint** in CH26 at Theorem 8.5(3), printed p. 29, CH26 line 1384: the source says the F₄/B₃ extra point includes an additional ω₂; it should omit that ω₂, giving norm squared 15/2 instead of 39/2; affects a stated result.
- **Misprint** in CH26 at proof of Theorem 8.5, case (2), printed p. 29, CH26 line 1422: the source says the surviving orthogonal factors have odd block size; it should say even block size; affects the proof.
- **Gap** in CH26 at §8.3, printed p. 30, CH26 lines 1454–1456: the source says the two allowed lattices may be replaced by narrower integer cosets; it should retain all half-integers and the full quarter-plus-half-integer coset, then use the upper-bound contradictions; affects the proof.
- **Misprint** in GS23 at proof of Proposition 11.3, printed p. 32, GS23 lines 1361–1363: the source says normalized conjugate character averaging is the isotypic projector; it should include the irreducible degree factor; affects the proof.
- **Error** in GS23 at Proposition 11.6, printed p. 33, GS23 lines 1398–1400: the source says weak containment in a sequence's Hilbert sum implies an increasing subsequence limit; it should conclude closure of the set of summands, or require weak containment in every tail; affects a stated result.
- **Misprint** in Ban02 at Theorem 3.1(6), printed p. 678, Ban02 line 259: the source says the signed Aubert operator sends irreducibles to irreducibles; it should say irreducibles up to sign, consistently with part (5); affects a stated result.
- **Gap** in BHV at Definition A.1.7, printed p. 310, BHV line 11764: the source says only absence of nontrivial closed invariant subspaces defines irreducibility; it should additionally require a nonzero Hilbert space; affects a stated result.
- **Gap** in BHV at proof of Theorem C.5.5(i), printed p. 385, BHV lines 14661–14663: the source says both summands have value one for coefficients in the closed unit interval; it should first separate endpoints, then use strictly positive coefficients; affects the proof.
- **Misprint** in BHV at final sentence of Theorem C.5.5(ii), printed p. 386, BHV line 14686: the source says every normalized positive-type function lies in the closure of the extreme points; it should say closure of their convex hull; affects the proof.
- **Misprint** in BCP at (5.2.3), printed p. 53, BCP line 2709: the source says bounding simple-coroot pairings below one defines the fundamental alcove; it should bound every positive-coroot pairing, equivalently the highest-coroot pairing in the dominant chamber; affects a stated result.

- **Misprint** in Ber92 at Proposition 23(2), printed p. 40, Ber92 line 1291: the source says every parabolic is conjugate to a minimal parabolic; it should say a unique standard parabolic; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a45086478a8f4d012f22d03e1014e3d33c32f084", "job": "RT-SmoothRepresentationsOfLocalGroupsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
