<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6785975126 -->
Review (codex) of c45c8eb

Verdict: needs_changes

1. **F01** (P3) The dagger-disc Check divides principal units by a group they do not contain

   **Location:** README.md:477: “`ℚ_p ⊗ (O(Y^†)^{**}/C^×)`”. The definition of principal units is at README.md:56.

   **Claim:** This quotient is defined, and its rational logarithm identifies it with functions modulo constants.

   **Witness:** On the dagger closed disc, the constant `p` belongs to `C^×`, but `abs(p−1)=1`; hence `p∉O(Y^†)^{**}`. The proposed denominator is not a subgroup of the numerator.

   **Exact repair:** Replace `C^×` by `O(Y^†)^{**}∩C^×=1+m_C` in this connected-disc Check. This is also the denominator already used at README.md:457. Retain the logarithmic identification after rationalization. For the witness, `p` is excluded from both principal units and the corrected denominator, while `1+p²` belongs to both; the latter has constant logarithm and therefore class zero in `O(Y^†)/C`. Keep this in the README, without adding a Lean theorem.

2. **F02** (P2) The constant quotients need connectedness or componentwise constants

   **Location:** README.md:473: “For an affinoid `Y`” and “`0 → O(Y^†)/C --d--> Ω¹(Y^†)`”; also README.md:422,430 and the initial statement at 485.

   **Claim:** The displayed injection and the one-copy constant syntomic computation hold for the stated spaces. The conventions do not require connectedness.

   **Witness:** For `Y^†=D^†⊔D^†`, `(0,1)` is nonzero modulo diagonal `C`, but its differential is zero. The kernel contains `C²/C≅C`, whereas the displayed initial zero requires kernel zero.

   CDN-CURVES line 803 defines an analytic curve without connectedness; lines 806–807 then impose connectedness separately for subsequent statements. That standing hypothesis has not been transferred. The package itself computes the same obstruction in the Stein case at README.md:496 and repairs that case at 489; it does not extend that repair to §4.1 or the one-copy integral constants in §3.3. For two connected discs, degree-zero syntomic cohomology is `(ℤ_p t)²`, not `ℤ_p t`.

   **Exact repair:** Explicitly state the connected version of these targets, then provide their finite-disjoint-union versions for quasi-compact curves/affinoids, using `H⁰_dR(Y)` or locally constant integral functions in place of a single constant field/ring, and one `ℤ_p t` per component. Keep the existing countable-product extension in §4.2. Audit all `O(Y)/C`, `O(Y_S)/O_C` and one-copy `H⁰` formulas under that convention. On two discs the repaired denominator is `C²`; `(0,1)` becomes zero and the derivative is injective on the quotient. The syntomic constants become `(ℤ_p t)²`. This preserves the general library scope rather than excluding disconnected inputs silently.

3. **F03** (P1) The syntomic cone is missing its shift

   **Location:** README.md:422: “the total complex of the cone of `1 − φ/p: F¹C_dR(Ỹ_S) → C_dR(Ỹ_S)`”; compare the degree-zero Check at 430 and degree-one regulator in the same paragraph.

   **Claim:** The stated cone has the cohomological indexing of the syntomic complex and its regulator.

   **Witness:** For a connected disc, the kernel in degree zero contains `ℤ_p t`. The unshifted cochain cone puts it in `H⁻¹`; the syntomic complex puts it in `H⁰` and has `H⁻¹=0`.

   At the pin, `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` defines the cone as a homotopy cofiber, with terms `F^(i+1)⊕G^i` (line 65). No different cone convention is declared here. CDN-CURVES lines 3591–3607, §6.4.1, printed p.86, instead give the total double complex beginning with `F¹O` in degree zero; the regulator triple at lines 3608–3611 is in degree one. Thus this is not merely a different spelling of the source's construction: applying the ordinary cone convention shifts the claimed groups.

   **Exact repair:** Define `Syn(Y_S,1)` as the homotopy fibre, equivalently `Cone(1−φ/p)[−1]`, and specify the totalization degrees and differential signs. Put the filtered degree-zero functions in degree zero, and the degree-one differential/forms and unfiltered degree-zero functions in degree one. Keep the regulator in `H¹`. On the constant disc summand the corrected computation is `H⁻¹=0`, `H⁰=ℤ_p t`; it now agrees with the Check. Include this two-degree test so an unshifted cone is excluded.

4. **F04** (P2) Layer 4 consumes a normalization only introduced in Layer 5

   **Location:** README.md:503: “the `p`-normalized map ... of the Layer 5 preamble”; its Needs line at 513 omits that input. The construction is at 608–616 and itself names §5.2 at 610 and 614.

   **Claim:** §4.3 is available in the stated build order from its listed earlier targets and suppliers.

   **Witness:** §4.3 uses `ι_HK^{(p)}`; its defining formula first occurs at 614, using `ι_HK^ϖ` of §5.2. Layer 4's dependencies at 604 name only Layers 0–3 and external suppliers.

   The repaired formula is mathematically sound; this finding concerns where its construction is owned and when it is available. At `e=1,p=3,ϖ=12,Ne₁=e₀`, using the untransported map changes the image of `e₁` by the nonzero scalar `log₃(4)` times the image of `e₀`. The missing input cannot be treated as an unused explanatory reference.

   **Exact repair:** Extract the algebraic normalization adapter into a named target before §4.3, for example in Layer 1 after the period-space definitions. State it for a module with `N_raw`, `N_p=N_raw/e`, the specified period embeddings and a Hyodo–Kato comparison satisfying the supplied transport law; it must not require the later Stein-space construction. Give its API, dependencies and three discriminating Checks. Cite that target in §4.3 and specialize it to §5.2 in Layer 5. The existing tests give the required values: `A₂(e₁+ue₀)=e₁+2ue₀`, `Ψ₁₂(u)=u−ℓ₄`, and changing `ϖ` to `ϖw` cancels the two exponential factors. This removes the forward build edge while retaining the full uniformizer generality.

Four findings: one P1, two P2, one P3. All eight findings from round 3 have been repaired; the remaining issues below are independently witnessed. The package is repairable. The author files were not changed.

Locations abbreviated as README.md and Suggested.lean below mean `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`. Library paths are relative to the pinned library repositories. Source references use the supplied line-numbered extractions.

## Verified sound

### Previous findings and the repaired passages

The previous review and its repair report were read first. None of the eight findings was marked not actionable. Each repaired passage was checked directly, and the same patterns were searched for throughout the package. The status below assesses the prior finding, separately from newly found issues.

| Previous finding | Status | Actual repaired passage and computed verification |
| --- | --- | --- |
| F01, ordinary annulus cohomology | Repaired | README.md:351–352 says the residue-one class spans “`H¹_dR(Y)^sep`”. For `ω=Σp^nT^(p^n−1)dT`, primitive coefficients at `p^n` are all 1, so no analytic primitive exists on the outer boundary. Exact partial sums converge to ω: its ordinary class is nonzero and its separated class is zero. |
| F02, Tate p-divisible extension | Repaired | README.md:577 says “`E` itself ... extends to no abelian scheme” and gives two extensions of its abstract generic p-divisible group. At p=5, `y²=x³−x` has discriminant 64, a unit; the Tate curve has `abs(j)=abs(q)⁻¹>1`. Dimensions of the constant étale and good elliptic extensions are `(0,2)` and `(1,2)`. |
| F03, uniformizer transport | Repaired mathematically | README.md:612 gives “`D_raw ∘ A_e = e·A_e ∘ D_p`”; 614 defines “`ι_HK^{(p)} = ι_HK^ϖ ∘ exp(−log_K(a)N_p)`”. For e=2 the correct horizontal coefficients are 1 and 2; the reversed scaling gives coefficient 4 and derivative `−3e₀`. For ϖ=12,p=3, the missing correction is `log₃4`, of valuation 1. The positive sign for transport of ι and negative sign for inverse evaluation agree. Placement of this repaired construction is R04. |
| F04, free logarithmic forms | Repaired | README.md:788–789 uses “`O_C ⊗̂_{ℤ_p} Sp_1(ℤ_p)^*`” and the measure relations. The three residue vectors `(1,−1,0)+(0,1,−1)−(1,0,−1)` sum to zero. The coefficient vector `(1,1,−1)` is nonzero also at p=2. The dense-span wording in §6.6 is consistent. |
| F05, source-programme organization | Repaired | README.md:3 now begins “Build the p-adic pro-étale cohomology of smooth p-adic analytic curves” and states inputs and endpoints. No source-following programme clause remains. The curve branch and higher-dimensional branch have their own mathematical dependencies; R04 is the specific residual build-order defect. |
| F06, segment locator | Repaired | README.md:33,135 separates “SR.3 (*steinberg*)” from “SR.5.2 (*segment-representations*)”. At the inspected #1688 head these are lines 3002 and 4446. The quotient of the increasing normalized product `ν⁻¹/²×ν¹/²` is St, with the trivial representation as subrepresentation. |
| F07, flag and translation Checks | Repaired | README.md:187–204 now states the coordinate-flag and inverse-translation APIs and their tests. For n=2,m=0,1,2,3 the dimensions are 0,1,2,2; n=0 gives the zero space, also top. On S₃ the inverse-translation composite and product both evaluate to 1; direct translation gives 1 versus 0. |
| F08, arbitrary residue field | Repaired | README.md:96 imports CR.4.7 for “an arbitrary algebraically closed field of characteristic `p`”. For `k=𝔽̄_p` and `overline(𝔽_p(t))`, transcendence degrees are 0 and 1, while the same block satisfies `F²=pσ²` and has slopes `(1/2,1/2)`. The replacement supplier explicitly covers both. |

I reread the 50 numbered targets, all 50 Needs lines and the eight layer dependency summaries. For unchanged material I used the previous review's computed rows, not its bare assertions of soundness. Changed passages, all 15 seeded targets, all headline families and the targets involved in R01–R04 were examined again. The table below records the fresh calculations and representative inherited calculations on the required sample; it is not an assertion that finite examples prove the theorems.

### Adversarial calculations

| Statement | Instances tried | Values on the two sides / discriminating computation | Result and change |
| --- | --- | --- | --- |
| §0.1 graph conventions | One loop; one vertex with one or two legs | Loop differential 0 gives H¹=H¹c=L. One leg gives cokernel of `−1:L→L`, hence 0. Two legs give `L²/ΔL≅L`, and residue pairs `(a,−a)`. | Distinguishes compact edges from legs; unchanged. |
| §0.2 graph monodromy | Loop of length 3, subdivided into lengths 1 and 2; tree with four legs | Cycle pairing is `3ab` before and `(1+2)ab=3ab` after subdivision. The tree has H¹=0 and residue space rank 3, so the map to H¹ is zero. | Length normalization and noncompact radical agree. |
| §§0.3–0.4 native flags/Steinberg | n=0; n=2,m=0..3; d=0; d=1,p=2 | Flags have dimensions 0 and `(0,1,2,2)`; `e₀` is in the one-dimensional flag, `e₁` is not. d=0 gives St=A with zero relations. At the first GL₂ residue flag stage there are 3 points and quotient dimension `3−1=2`. | No rank-zero or p=2 contradiction to the headline. |
| §0.3 action and dual | S₃,g=(12),h=(23),f=δ₁,x=gh; two point masses | Inverse action gives `(g·(h·f))(x)=((gh)·f)(x)=1`; `f(gx)` gives 1 and 0. A single Dirac measure has mass 1 and does not annihilate constants; a difference has mass 0 and does. | Wrong action order and full-measure dual excluded. |
| §0.4 lattices/completions | DVR lattice Λ, zero space, finite flag quotient | `lim Λ/ϖⁿ=Λ`; the zero module completes to 0. Finite quotient of A³ by constants has rank 2, and its dual is the mass-zero subspace of A³, also rank 2. | Completion is compatible with quotient relations, not the full flag dual. |
| §1.2 completed tensors | M=0,F²,∏F; dense nonclosed image | Results are 0,B²,∏B in the stated completed inverse-limit convention. For a dense nonclosed image U⊂V, V/U is nonzero with separated quotient 0; quotienting before separation retains the former. | The explicit nonseparated convention matters and is retained. |
| §1.3 periods/slopes | Rank-one slopes 0,1,2; slope-1/2 block over two residue fields | `X¹(0)=(B_cris⁺)^(φ=p)`, `X¹(1)=ℚ_p`, `X¹(2)=(B_cris⁺)^(φ=p⁻¹)=0`. The rank-two block has `F²=pσ²` over both fields and BC Dimension `(1,2)` in the relevant case. | General residue field repair holds; uses declared period gap. |
| §2.3 adoc reconstruction | Disc, annulus, nonexact convergent form ω | Degree-zero connected constants C; residue of dlog T is 1, residue of ω is 0. Ordinary `[ω]≠0`, separated `[ω]=0`; exact partial derivatives approach ω. | Full comparison remains unseparated; repaired Check now agrees. |
| §2.4 symbols/Kummer | Constant, T, T² on an annulus; any prime ℓ | Constants have compatible roots and class 0. Valuation classes of T and T² are 1 and 2 in ℤ/ℓⁿ; dlog residues are 1 and 2. | Correct twist and multiplicative-to-additive map; p=2 still distinguishes T. |
| §3.3 regulator | `1+pT`; T·T; trivial symbols | Differential is `p dT/(1+pT)≠0`; annular residues add `1+1=2`; trivial-symbol components are `(0,0,0)`. At p=2 only the stated cokernel exponent 2 is used. | Regulator normalization sound once the complex is indexed correctly. |
| §3.3 cone degree | Constant connected-disc summand | Unshifted cone has `H⁻¹=ℤ_p t`; the homotopy fibre has `H⁻¹=0,H⁰=ℤ_p t`. | R03: insert [−1] and fix totalization degrees. |
| §§3.3,4.1 constants | Disjoint union of two discs | Kernel of d on `O/C` contains `C²/C`, dimension 1; the asserted injection requires dimension 0. H⁰syn has rank 2, not 1. | R02: connectedness plus componentwise extension. |
| §3.4 integral sequence | Disc and annulus; invert p | Disc third term 0; annulus dlog T has φ=p and image 1 in its residue coordinate. A group killed by p² becomes 0 after tensoring with ℚ_p. | The p²-error and rational exactness are compatible; no claim of integral exactness was substituted. |
| §§3.5,4.1,4.2 diagrams | Closed, dagger and open discs; annulus | Dagger/open HK¹=0, hence H¹proét is O/C. Annulus slope-one residue term gives ℚ_p. The closed-disc principal-unit completion is not replaced by O/C. | Distinct topological versions retained. |
| §4.1 principal-unit quotient | Constants p and 1+p² | `abs(p−1)=1` excludes p from principal units, while `abs((1+p²)−1)<1`. The logarithm of 1+p² is constant, class 0 modulo C. | R01: denominator must be 1+m_C. |
| §4.2 disconnected Stein extension | Two or countably many open annuli | Constants C² or ∏C; `(0,1)` has d=0 and exp-class 0 and is zero modulo H⁰dR. HK¹ is the corresponding product of slope-one lines. | Existing product repair sound; extend its principle to R02. |
| §4.3 filtration | Half-plane; genus-g Mumford curve; ramified Tate curve | Half-plane graph H¹=0 and component H¹=0, leaving compact graph dual twisted −1. Mumford graded dimensions `(g,0,g)`. For q=π²,e=2, raw monodromy coefficient 2 versus normalized coefficient `2/2=1`. | Filtration and normalization mathematics sound. R04 moves the prerequisite earlier. |
| §§4.3,5.2,5.5 period transport | e=2,π²=p; e=1,p=3,π=12 | `D_raw A₂(e₁+ue₀)=0`; reversed application gives `D_p(e₁+4ue₀)=−3e₀`. `θ(Ψ₁₂(u))=−log₃4`, with valuation 1. | Correct arrow and nonzero unit correction verified in every use. |
| §§4.4–4.6 WD convention and similarity | Geometric Φ=diag(1,q),Ne₁=e₀; q=2,3; unramified trivial representation | `NΦe₁=qe₀=qΦNe₁`; `ΦNΦ⁻¹e₁=q⁻¹e₀`, giving 1/2 or 1/3, not 2 or 3. The trivial representation yields WD=ℚ_ℓ,N=0. | Negative-degree semidirect law and Frobenius orientation agree. |
| §§4.7–4.9 proper/Jacobian periods | Genus 0; elliptic good reduction; Tate q | Genus 0 H¹=0. Elliptic H¹ dimension 2 and universal-cover Dimension `(1,2)`. Tate abs(j)=abs(q)⁻¹>1; good elliptic Δ=64 at p=5 is a unit. Torus height is 1 versus elliptic height 2. | Proper period and repaired extension tests agree. |
| §5.1 Stein semistable models | Chain model of A¹; naive disc reductions; product of nodes | Chain components have H⁰= k; naive affine special fibres have H⁰=k[T]. Adjacent-chain coordinates multiply to π. Two node equations give `xy=π=zw`, not a single semistable monomial chart. | Proper-component and chart hypotheses are real restrictions. |
| §5.2 HK/transport | Chain model; N=0; rank-two Kummer module | Tree with one end gives HK⁰=F,HK¹=0. If N=0 both transports are identity. For Ne₁=e₀, ι changes e₁ by `+log(w)e₀`, inverse evaluation by `−log(w)e₀`; multiplying the change by the normalization correction cancels. | Sign repair is consistent with the period embedding, including the inverse-map distinction. |
| §§5.3–5.5 general Stein diagram | Point r=0; p=2,r=2; affine line r=1 | Point fixed constants ℚ_p. For r=2,p=2, a=2 and `(p^a a!)⁻¹=1/8`, not 1/4. On A¹, HK¹=0 and H¹proét=O/C, mapped by derivative to exact forms. | Modified lattice and range q≤r retained; formal comparison is a declared gap. |
| §§6.1–6.3 model/regulator/Frobenius | d=1,q=2; d=2,q=2; a logarithmic residue | Tree valency 3; projective plane has 7 rational point centers. Residues of dlog((z−a)/(z−b)) are +1,−1. For degree-one scalar φ^f=q, monodromy relation gives `qN=q²N`, hence N=0 at q=2 and 3. | General-dimensional source restriction and rank-one tree case distinguished. |
| §§6.4–6.5 half-space diagram | r=0 and r=d+1 | Degree zero gives ℚ_p. Above d, generalized Steinberg is 0 and `Ω^d/ker(d:Ω^d→0)=0`; both quotient terms vanish. | Out-of-range indexing and differential quotient agree. |
| §§6.6–6.8 integral/A_inf | Degree 0; three logarithmic generators; p=2 | H⁰ integral functions O_K, degree-zero A_inf; twist `−1+1=0`. The three measure differences and the three residue vectors both sum to 0, although coefficients `(1,1,−1)` do not vanish. | Completed measure module, not a free family; repaired F04. |
| §6.9 integral étale | r=0,r>d; reduction mod p | Integral values ℤ_p and 0; mass-zero relation reduces to mass 0 over 𝔽_p. | Includes p=2 without a good-prime shortcut. |
| §6.10 compact supports | d=1 with banal ℓ | `H¹_c=St`, `H²_c=Λ(−1)`; top geometric Frobenius eigenvalue q, shifts [−1],[−2]. For nilpotence ≤2, the exponential is `1+tN`. | Coefficient restrictions and shifts match Dat. |
| §§7.1–7.2 tower models | q=2, first nontrivial level; components (v,i) | Supplier deck size 12, odd-level quotient order `12/4=3`. The invariant `type(v)+i mod 2` gives two G-orbits; a D-uniformizer switches parity, giving one orbit under G×D×. | Level convention and finite-orbit condition retained. |
| §7.3 levelwise diagram | Central quotient and full level zero | Component constants C² and C^ℤ; `(0,1)` has zero differential and exponential class. A nonconstant function on a component has nonzero derivative. | Correct locally constant kernel and bounded-vector test. |
| §§7.4–7.5 multiplicities | Frobenius polynomial X²−p; genuine absolute slope-1/2 type | First endomorphism algebra has dimension 2 and fails the absolute-irreducibility scalar test. The allowed rank-two period term has Dimension `(1,2)` and θ-kernel 0. | Absolute irreducibility and slope hypotheses are essential and present. |
| §§7.6–7.7 finite copresentation | Finite constant system; ℤ/pⁿ; arithmetic base changes | Limits finite and ℤ_p are profinite; an infinite discrete vector space is not compact. For a quadratic field F₂, K⊗F F₂ has 1,2,1 factors at K=F,F₂,a disjoint quadratic extension, giving H⁰ dimensions 1,2,1. | Arithmetic versus geometric components are distinguished. |
| §7.8 non-admissibility | F=ℚ_p; F≠ℚ_p; level below a type's level | The first has nonzero local-Langlands Hom and is excluded. A type of conductor level 2 contributes 0 at level 1. The theorem's n>0 and sufficiently large K conditions remain. | No extension of vanishing to ℚ_p or unsupported level-zero case. |

### Seeded source verification

All 15 requested targets were checked against readable cached text, including the theorem/section identifiers, printed pages and standing hypotheses. The following locators are to the versions recorded in the manifest. The five settled uncertified primary works are separately identified below; they were not silently certified from secondary references.

| Sampled target | Text opened and supported scope |
| --- | --- |
| 0.2 monodromy of a metrized graph | CDN-CURVES lines 783–796, §1.2.4 and Remarks 1.5–1.6, pp.19–20: metric pairing, radical and nilpotent extension. Loop/subdivision and leg tests above apply. |
| 0.4 irreducibility, lattices, completions | CDN-STEIN lines 1918–1929, Proposition 5.1, p.38, and 1950–1955, p.39; GK14 lines 1300–1368, Corollaries 4.3–4.4, pp.28–30. Characteristic 0 or p for the field theorem, complete DVR for the lattice assertion; the type-A case used here introduces no excluded small primes. |
| 1.2 completed tensors with nonseparated quotients | CDN-CURVES lines 170–172, footnote 5, p.4, and the explicit topology convention: form the indicated quotient before Hausdorff separation, and use the polynomial B_st presentation. The dense-quotient test distinguishes the two constructions. |
| 2.3 adoc geometry/reconstruction | CDN-CURVES line 1748, p.43; lines 1854–1856, p.45; Proposition 3.20 at 1926–1929, p.47. Reconstruction and unseparated degree-one comparison support the target; the revised annulus Check no longer changes that comparison to its separated quotient. |
| 3.3 syntomic cohomology/regulator | CDN-CURVES lines 3591–3607, §6.4.1, p.86; Theorem 6.24/Corollary 6.25 at 3630–3631, p.87; Proposition 6.29 at 3766–3777, p.90. Footnote 32 at 2195, p.52 gives the p=2 injective/cokernel-killed-by-2 qualification. R02–R03 concern omitted convention/indexing, not a missing source theorem. |
| 3.4 integral sequence | CDN-CURVES lines 3780–3799, Theorem 6.30, pp.90–91, and Remark 0.19 at 568–575, p.14: p²-exactness, bounded p-power torsion of H¹(O), and dependence on leg lengths. |
| 4.3 filtrations | CDN-CURVES lines 4316–4322, p.104, and Theorem 8.9 at 4477–4481, p.108, with the introduction's Theorem 0.15/Remark 0.16. CN-I lines 448–455, p.10 explicitly uses p-normalized periods. The model comparison uses the named suppliers; the adapter's arithmetic is checked above, and its placement is R04. |
| 4.5 ℓ-adic WD representations | CDN-CURVES lines 4512–4539, p.109: logarithmic variable, Galois action, monodromy and projective-limit treatment. The unramified and Tate-block tests distinguish the stated geometric Frobenius convention. |
| 5.1 Stein semistable weak formal schemes | CDN-STEIN lines 682–695, §3.1.1, p.14: proper smooth irreducible components, finite unions and the Stein tube exhaustion. These are retained; naive affine components are expressly rejected. |
| 6.3 Frobenius on standard-model HK | GK05 lines 1209,1254–1264,1275–1292, pp.31–33. The d≥2 result is not applied blindly to d=1; that case uses the tree calculation, also described in CDN-STEIN line 2157. Logarithmic intersections are not identified with ordinary projective-space cohomology. |
| 6.8 A_inf-cohomology | CDN-DUKE lines 89–90 and 96–119, Theorem 1.3 and its specialization, pp.2–3: completed tensor, torsion-freeness and Hodge–Tate regulator. The corrected relations and twist cancellation agree. |
| 6.10 Dat compact-support complex | DAT06 lines 1289–1291 and 1325–1329, pp.27–28; 1963–1969, p.41; 1997–2007 and 2044–2050, pp.42–43. The specified coefficient-ring class, banal/strongly banal conditions, factorial invertibility, twists and derived shifts are retained. |
| 7.2 equivariant semistable models | CDN20 lines 2103–2122, Proposition A.1, p.53; CDN23 lines 1173–1176, p.31. Finite orbit and open stabilizer requirements survive, with proper components for the bounded-function application. |
| 7.3 levelwise fundamental diagram | CDN20 lines 914–928, p.23, and Appendix A at 2103–2133, pp.53–54. The constants are componentwise; the bounded-vector argument uses proper-component models rather than arbitrary semistable discs. |
| 7.8 non-admissibility for F≠ℚ_p | CDN23 lines 1456–1472,1485–1495,1504–1531, pp.38–40. The field exclusion, positive level and sufficiently large finite base extension are present; no assertion for all types at every level was substituted. |

The manifest has 20 distinct work keys, 15 with readable cached texts and five settled uncertified entries. No duplicate key or omitted cited work was found. The new CN-I locator belongs to the existing work entry. There is no unresolved author-marked verification request requiring another source fetch. Source statements were compared in their mathematical content rather than copied into the package or this report.

### Acceptance file, headline coverage and padding

The prescribed `lake env lean` elaboration of the author's Suggested.lean was run from the content checkout. It exited 0; the only warning was `declaration uses 'sorry'` at Suggested.lean:124:8. There is one `import Mathlib`, no TauCeti import, no sorry'd data, no option override and no admitted example. Consequently no TauCeti object build was required.

All eight declaration types were printed with `#check @name` in one scratch copy and compared with the README: five definitions (`flagSubspace`, `parabolic`, `translation`, `steinbergRelations`, `generalizedSteinberg`), two proved construction helpers (`parabolic_mono`, `steinbergRelations_le_comap`) and the admitted `generalizedSteinberg_isIrreducible`. No needed section hypothesis disappeared. In particular the headline retains primality, the normed ℚ_p-algebra structure, finite dimensionality over ℚ_p, the coefficient field and its characteristic disjunction. The translation's topological-group hypotheses and the quotient's topological-ring hypotheses are present.

Every admitted theorem was subjected to the one-tactic probe: there is exactly one. On separate copies of its statement, `simp` made no progress, `rfl` failed, and `infer_instance` failed. A fourth probe using `Representation.irreducible_iff_isSimpleModule_asModule` could not synthesize the simple-module instance. The expected probe errors do not affect the successful author-file elaboration. The two proved helper theorems are used to construct the quotient representation. No padding or omitted statable headline was found.

| Headline family from the README summary/endpoints | Treatment in Suggested.lean |
| --- | --- |
| Generalized Steinberg irreducibility, §0.4 | Stated at line 124 on the native quotient representation, at the README's generality. |
| Symbol/Kummer isomorphism for all ℓ, §2.4 | Named in module docstring; analytic curves, their sites and cohomology are missing at the pins. |
| Affinoid, dagger, Stein and proper fundamental diagrams, §§3.5,4.1,4.2,4.7 | Named; analytic HK cohomology and semistable plus-period carriers are missing. |
| Cohomological filtrations and WD similarity, §§2.5,3.2,4.3,4.6 | Named; abstract linear algebra cannot replace the missing geometric realizations. |
| Jacobian universal-cover period isomorphism and integration, §§4.8–4.9 | Named; general Jacobians/universal vector extensions and their period realizations are missing. |
| Equivariant semistable Stein diagram, §5.5 | Named; weak formal/dagger spaces and syntomic cohomology are missing. |
| Half-space cohomology, including integral p-adic and Dat compact supports, §§6.2,6.4,6.5,6.9,6.10 | Named; the analytic half-space and its cohomology carriers are missing. |
| Tower components, models, multiplicities and fundamental diagram, §§7.1–7.5 | Named; tower spaces, cohomology and required correspondences are missing. |
| Finite copresentation and non-admissibility, §§7.7–7.8 | Named; actual tower-cohomology representations are missing. |

Every backticked identifier attributed to this roadmap's Lean file resolves to these declarations; mathematical notation and explicitly imported planned supplier names were not mistaken for local declarations. No free predicate or arbitrary-variable substitute has been used for a missing headline.

### Pinned library and duplication evidence

Object searches and the supplied near-match leads were checked at the pins. The following definitions were opened. Their structural limitations matter: a carrier alone does not supply a geometric comparison or a finiteness hypothesis.

| Pinned file and line | Declaration or relevant content |
| --- | --- |
| `Mathlib/Topology/LocallyConstant/Basic.lean:212,398` | `LocallyConstant` bundles a function and local constancy; `comap` pulls back along a continuous map. Compactness and Hausdorffness are not fields of the structure. |
| `Mathlib/Topology/LocallyConstant/Algebra.lean:327` | `LocallyConstant.comapₗ`, the linear pullback used in the representation. |
| `Mathlib/Topology/ContinuousMap/Defs.lean:32` | Function plus continuity; compactness for the sup-norm construction is separate. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` | `Matrix.GeneralLinearGroup.toLin`. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:515` | `MulAction.stabilizer`. |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | The action sends a submodule to its linear image; stabilizing a flag subspace does not mean fixing each vector. |
| `Mathlib/GroupTheory/Coset/Basic.lean:424,430` | `Subgroup.quotientMapOfLE` and its representative formula, without normality. |
| `Mathlib/LinearAlgebra/Quotient/Defs.lean:227` | `Submodule.mkQ`. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59` | Native module category. |
| `Mathlib/RepresentationTheory/Basic.lean:329` | `Representation.quotient` uses invariant relations. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29,32` | `IsIrreducible` is simplicity of the subrepresentation order, equivalent to simplicity of the associated module. It does not include smoothness/admissibility or a Steinberg theorem. |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40,65` | Basis flags and coordinate membership; the small flag definition here is necessary scaffolding for the headline, not a proposed replacement library. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75,88` | De Rham period rings, not B_cris⁺ or B_st⁺. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Semilinear Frobenius carrier; no built-in finite dimension, monodromy or topology. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | Scheme cohomology, not adic analytic cohomology. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Jacobian/Basic.lean:110` | Jacobian coordinates for Weierstrass curves, not arbitrary-curve Jacobian schemes. |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,65` | Cochain cone is the cofiber, with source shifted by one; used in R03. |
| `TauCeti/Algebra/Quaternion/Steinberg.lean:14` | Symbol relation, not the representation theorem. |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean:105` | Finite-group GL₂(𝔽_q) complex augmentation representation; not the smooth generalized Steinberg representation over a local field with characteristic-p coefficients. |

The board package index was read before treating either unresolved resolver lead as missing. `ModpRepresentationsOfGL2OverLocalFields` and `PadicLocalLanglandsForGL2QpPartII` are available packages; the first is an earlier supplier and the second a downstream consumer. `Semistable.aOmega` is present as a planned name in AInfCohomology, not asserted to be in pinned Lean. The resolver's environment limitation on pinned-library lookup was compensated by opening the actual pinned sources above.

Object searches using `roadmaps grep` and reads using `roadmaps show` covered generalized Steinberg representations, graph-with-legs cohomology, adoc reconstruction, Jacobian universal-cover periods and cohomologically profinite objects. The arbitrary-coefficient local-field representation here is distinct from the already-owned complex segment representation and the finite-group representation. Metric skeleta/formal reconstruction stay with TropicalAndBerkovichArithmetic; the analytic pattern reconstruction and its de Rham complex are this roadmap's targets. General crystalline, AΩ, period-ring and local comparison infrastructure remain imported.

The closest heads were inspected: #1759 CstConjectureForDaggerVarieties owns the model-free dagger diagram; this package's arbitrary-C curve result and equivariant model-based theorem state their distinction and comparison. #1757 ScholzeFunctorAndModpCohomologyOfTheLubinTateTower explicitly imports the components and arithmetic finite-presentation result, and owns later finite-length/geometric multiplicity statements. The available PadicLocalLanglandsForGL2QpPartII scope imports the geometry and specializes it, rather than giving this package a reciprocal supplier edge. #1062 PadicHodgeTheory, #1064 CohomologyComparisons and #1364 CohomologyComparisonsPartII retain the period/type and comparison inputs cited here. No duplicate fully qualified local declaration or double ownership was found.

The supplied overlap analysis reports no conflicting head, dropped cited id, or id defined only by an open revision. The relevant inspected heads did not contradict it. There is no missing old-to-new mapping to request. This is a new roadmap, not a replanning of a same-name main-branch roadmap. The main-branch shapes of JacobianChallenge and ReductiveGroupsPartII were also read for the house-style comparison.

### Supplier resolution and order

The ledger records the actual main copies or supplied open heads, including the bodies of the cited targets. Multiple numbers after a file denote individually resolved anchors, not a continuous range. References to pull requests here identify review evidence; they are not proposed supplier citations for the README.

| Supplier, inspected origin | Resolved file/anchors |
| --- | --- |
| AdicEtaleGeometry, main | `TauCetiRoadmap/AdicEtaleGeometry/README.md:1703`, A1 and its corrected analytic sites. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:682,10053,11218`, F0,R3.4,R3.7. |
| AdicSpacesPartIV, main | `TauCetiRoadmap/AdicSpacesPartIV/README.md:3766,4090,4238,4515,4662,5594`, F1.5–F1.9,F1.11. |
| EnhancedDerivedSheaves; StableReduction, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1290,2031`, tower limits/E2; `TauCetiRoadmap/StableReduction/README.md:372,405,621`, Layers 1,2,7. |
| ClassicalAdicEtaleCohomology #875 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:354,449,1917,2528,2617,3983,4557,5117,5213`, §§1.3–1.4,4.1,4.6–4.7,Layer 8,9.1,9.6–9.7. |
| CrystallineCohomology #857 | `TauCetiRoadmap/CrystallineCohomology/README.md:6621,8466,10029,11098`, CR.4.7,5.1,6.1,6.5. CR.4.7 has the general perfect/algebraically closed residue-field hypotheses. |
| AInfCohomology #1044 | `TauCetiRoadmap/AInfCohomology/README.md:1045,1898,2108,2658,2824,2901`, AI.1.2,3.1,3.2,6.1–6.3. |
| PrismaticCohomologyPartIII #1070 | `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:213,536`, §§6.3,6.25, including the integral comparison. |
| LocallyAnalyticDistributions #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891,1010,1081,1125,1139,1147`, §§0.0,0.2,0.CR.6.6; completed finite-dimensional inverse limits and nonproper finite-piece comparison. |
| PadicPeriodRings #940 | `TauCetiRoadmap/PadicPeriodRings/README.md:417,470`, §§4.1,4.3; general-C/plus invariants remain explicitly contracted below. |
| VectorBundlesAndIsocrystals #1205 | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1341,1349,1357,1625`, BC dimensions, arbitrary complete algebraically closed C, and the semistable example. The narrower Layer 1 classification is no longer used for arbitrary residue fields. |
| PadicDifferentialEquationsAndRigidCohomology #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:7286,7324,7507,7772,7872,7978,13968`, RD.4.10,4.11,4.18,4.29,4.34,4.38,7.7. The last supplies Frobenius characteristic polynomials, not all endomorphisms. |
| CohomologyComparisons #1064 | `TauCetiRoadmap/CohomologyComparisons/README.md:800,887,915,925`, §§4.5,4.9a,4.11,4.12; §4.5's negative sign is for evaluation maps. |
| CstConjectureForDaggerVarieties #1759 | `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:439`, §1.5; countable residue-field base and model-free dagger scope. |
| CohomologyComparisonsPartII #1364 | `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:500,531,551,570,589`, §§4.1–4.5, modified lattice, bounded comparison and qualified refined exponent. |
| EndoscopicTransferAndUnitaryTraceComparison #999 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4567,4593,4623,4652,4678,4704,4723,4787,4806,4841,4860,4962,4980,4997`, §§12.2–12.8,12.11–12.14,12.19–12.21. |
| HilbertModularVarietiesAndShimuraCurves #1005 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1769,1793,1817`, R18.5.1–3. |
| TropicalAndBerkovichArithmetic #1494 | `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1237,1265,1279,1291,1316,1369`, §§2.11,2.13–2.17. |
| JacobianChallenge; ReductiveGroupsPartII, main | `TauCetiRoadmap/JacobianChallenge/README.md:218`, Layer D; `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2831,3408`, RG2.2 and tree specialization. |
| AbelianSchemesAndArithmeticModuli #849 | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1868,2143,2241`, A4.2,A4.CR.7.2 and the Grothendieck–Messing input. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:3698,4057,4124,4325`, R07.2.20,2.25,2.26,2.28. |
| SmoothRepresentationsOfLocalGroups #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:581,1667,1908,3002,4446`, SR.0,0d,2,3 Steinberg,5.2 segments. |
| PadicHodgeTheory #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:1016,1044,1378`, §§5.3,5.4,8.1. |
| GL2AutomorphicRepresentationsAndTransfer #931 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:951,961,971`, R16.3.1–3. |
| PadicLocalLanglandsForGL2Qp #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:2311`, §6.9, including the general local JL input. |
| ModpRepresentationsOfGL2OverLocalFields, board package | `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:401,438,457,510,845,898`, §§0.3–0.5,0.7,2.4,2.6. |
| Downstream only | `packages/PadicLocalLanglandsForGL2QpPartII/README.md:40,564,710`, scope and §§4.1,4.9; #1757 `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:240,754,799`, §§0.2,5.4,6.2. |

The three declared gaps match between `design/plan.json` and the README's Exact supplier contracts:

- `formal-syntomic-period-comparison`, owned by CohomologyComparisonsPartII §§4.4–4.5: formal/weak-formal semistable schemes and finite base changes, range q≤r, bound A(e,p,r), and the enough-roots refinement Nr+c_p.
- `period-rings-general-C`, owned by PadicPeriodRings §§4.1,4.3: the specified period rings and plus-ring invariants over arbitrary complete algebraically closed C without a discretely valued base choice.
- `endomorphism-characteristic-polynomials`, owned by PadicDifferentialEquationsAndRigidCohomology §RD.7.7: equality for every endomorphism of an abelian variety over a finite field, extending the supplied Frobenius result.

Each is a precise, named, earlier-supplier contract, and none asks again for a result already supplied at the stated generality. They are not unowned prerequisites. This verdict is not conditional acceptance because R01–R04 require changes.

The prescribed mechanical dependency check exited 0 with this complete output:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No prohibited supplier is used. R04 is an internal target-order problem, which this roadmap-level check does not detect.

### Shape and policy checks

The package has the required summary, ownership, conventions, supplier contracts, reading guide, eight mathematical layers, examples/dependencies, downstream discussion and references. The inspected definitions retain prose APIs and discriminating Checks; the native flag/translation additions specifically repair the prior omissions. R01–R03 identify the remaining mathematical failures in those assertions, and R04 requires giving the new normalization construction an earlier named target with its own explicit dependency/API/Check structure.

No computational algorithm, route-specific prime restriction, sorry'd data, `set_option`, source-programme organization sentence, machine path, pull-request identifier, HTML anchor or job narrative was found in the author roadmap/Lean text. Standard source names in theorem locators are not layer organization. The mathematical order of the curve branch is forced by its dependencies; the separate higher-dimensional branch is explained. Source statements are paraphrased, not copied. No content-repository file, merge order or library pin was edited.

## Not verifiable

- **SS91**, recorded §§3–4: primary text remains settled uncertified. The readable CDN-STEIN account was checked, but does not certify having read Schneider–Stuhler itself.
- **IS01**, Theorem 4.5: primary text remains settled uncertified. The regulator use was checked in CDN-STEIN; the original locator was not independently read.
- **DS01**, Theorems 5.7 and 7.7: primary text remains settled uncertified. The related GK05 Frobenius statements were opened; this does not certify de Shalit's original proofs.
- **NAK84**, Theorem 4: primary text remains settled uncertified. Its use in finite copresentation was checked through CDN23.
- **KM74**, Theorem 2: primary text remains settled uncertified. The all-endomorphism extension remains an explicit supplier contract.

These five statuses are settled by the brief. None was requested again or placed in a missing-reference file. All other cited cached works needed for this pass were readable. The source behind CDN-STEIN's nested Tsuji reference was not independently opened; the uniformizer formula here was checked from its period calculation and the named roadmap supplier, without claiming verification of Tsuji's proof. The apparent duplicated degree in CDN-CURVES Proposition 4.7's text extraction was not visually certified against the PDF and is not asserted as a new source erratum.

## Source issues

- **Misprint** in CDN-CURVES at §1.2.1, printed p.18, line 725: the source says the compact-support differential targets only compact edges; it should be all edges including legs, as the cokernel at line 729 already uses; affects nothing.
- **Error** in CDN-CURVES at §8.2.5, printed p.107, lines 4432–4437: the source says positive degree scales the additive coordinate while imposing `Ng=p^deg gN`; it should be negative-degree scaling for the additive action `exp(λN)`; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p.38, line 1936: the source says the dual Steinberg quotient is the inverse limit of all flag-function duals; it should be the annihilator of relations, equivalently the duals of the finite-stage quotient images; affects a stated result.
- **Misprint** in CDN-DUKE at proof of Theorem 2.9 and Lemma 2.12, printed pp.9–10, lines 376,415–423: the source says ψ is `ξ^iφ⁻¹` but later treats it as `1−ξ^iφ⁻¹`; it should distinguish the operators and use the latter in the bijectivity argument; affects the proof.
- **Gap** in CDN20 at Remark A.2, printed pp.53–54, lines 2123–2133: the source says a connected semistable Stein curve has only constant bounded functions; it should require the proper-component hypothesis used by the proof; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c45c8eb1a05491b9c92beafa951a2f9430640c5b", "job": "REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
