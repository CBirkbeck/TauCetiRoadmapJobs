# Review of HilbertModularForms (pull request #1724 at 5f43770)

**Verdict:** needs changes

## R01 (P2) — Specify prime-power divisors in the root-number product

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1843`: “ε(f) = i^{Σ_w k_w} ∏_{𝔮 ‖ 𝔫} ε_𝔮(f)”; also the convention at line 250 and the display-column description at line 2274.

**Claim:** The product needs an explicit prime-power restriction. Sections 5.6 and 7.7 define W_𝔮 and ε_𝔮 for every exact divisor, including products of distinct prime powers. With that domain, the displayed product is false. The earlier Atkin–Lehner convention at line 243 correctly specifies 𝔮=𝔭^{v_𝔭(𝔫)}, but §8.2 does not retain this restriction after §7.7 has enlarged the domain. This is an indexing inconsistency, not a request to change the normalization.

**Witness:** Over ℚ(√13), the weight-two form of y²+xy+y=x³+x²−10x−10 has prime-power signs (+1,+1,−1). Their product is −1; the product over all eight exact divisors is +1.

**Exact repair:** Write the finite product as `∏_{𝔭 ∣ 𝔫} ε_{𝔭^{v_𝔭(𝔫)}}(f)`, or use the single Fricke sign ε_𝔫. Make the same range explicit in the conventions and the `AL_eigenvalues` row. Keep the operators for arbitrary exact divisors. Add the witness as a Check: the corrected formula gives (+1)(+1)(−1)=−1, while level one still gives the empty product 1.

The witness does not require trusting a database label. The curve has b₂=5, b₄=−19, b₆=−39, b₈=−139, c₄=481 and Δ=50625=3⁴5⁴. Its singular projective reductions have five points at both 3 and 5, giving multiplicative coefficients −1 and +1 respectively. In ℚ(√13), 3 splits and 5 is inert; the three finite local root numbers are therefore +1,+1,−1, and the two real places contribute +1. Modularity is supplied by flhs, Theorem 1, p.2 (flhs line 87). More generally, with r≥2 prime-power divisors, multiplying the signs over all exact divisors repeats each local sign 2^{r−1} times and always gives +1.

## R02 (P2) — Condition the double-coset counts on compatible components

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1218`: “cardinality Σ_{𝔞 ∣ 𝔪} N𝔞 for 𝔪 prime to 𝔫 and N𝔪 for 𝔪 supported on 𝔫”.

**Claim:** These positive counts, and the following prime-coset representative counts, require the narrow-class equality stated in the preceding sentence. The subsection quantifies over arbitrary 𝔟 and 𝔠 and explicitly allows Δ to be empty, but does not condition its cardinality formula on nonemptiness.

**Witness:** Take F=ℚ(√6), 𝔫=𝔪=𝔠=𝒪_F and 𝔟=(√6). Every possible determinant has norm −1/6, so Δ is empty. The asserted cardinality is nevertheless Σ_{𝔞∣1}N𝔞=1.

**Exact repair:** State the count as zero when `[𝔟]≠[𝔪𝔠]`, and give the displayed formulas and representative descriptions under `[𝔟]=[𝔪𝔠]`. Do not impose narrow class number one. In this witness no unit has norm −1: x²−6y²=−1 is impossible modulo 3. Thus the repaired count is 0=0. With equal components and 𝔪=1 it is 1=1; compatible norm-4 prime components retain the good/bad counts 5 and 4.

## R03 (P3) — Record the references in the source manifest

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:2538`, “## References”; missing `TauCetiRoadmap/HilbertModularForms/sources.toml`.

**Claim:** The required source manifest is still absent. In particular, the newly specified Voight edition and Cremona preprint have no version/provenance records in the package. This is previous review R04, still unrepaired.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml, but no sources.toml. The reference list alone cannot distinguish readable texts, publisher-only citations and downloaded access-check pages.

**Exact repair:** Add the v1 manifest, one stable key per work, with locators, cited targets, versions and legal retrieval metadata/status. Reuse the keys identified below. Keep all source material outside the repository. Validate that Voight's August 5, 2026 edition and Cremona v1 resolve to their stated pages; those two checks succeeded in this review. Do not mark a reCAPTCHA response as a readable source.

## R04 (P3) — Locate the full weight-two regularization claim

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1131`: “prove convergence, the functional equation in s of its constant term, and the limit”.

**Claim:** Section 4.2 supplies a useful cancellation calculation, but no exact literature locator for the constant-term formula and continuation of this cusp-indexed series at arbitrary level and degree. A Dedekind-zeta remainder does not itself state the Eisenstein constant-term calculation. The bibliography's chapter descriptions do not locate it either.

**Witness:** Bruinier Remark 1.35, p.18 (bruinier line 765), discusses weight-two holomorphy in the real-quadratic full-level setting. It does not state §4.2's all-cusp, arbitrary-degree and arbitrary-level formula.

**Exact repair:** Attach the theorem/equation and page for the general constant-term and continuation statement. If using a restricted prototype, identify that restriction and state the general adapter, including its cusp scattering coefficients and the pole-order argument. Keep an exact locator with an uncertified status if its text is paywalled. Retest n=2, where s²·ρ/(2s)→0, and n=1, where s·ρ/(2s)→ρ/2; these distinguish the claimed cancellation but do not replace the missing locator.

## Verified sound

This is a full rereview of the 56 numbered subsections, the conventions and worked examples, and all 49 declarations in Suggested.lean. There are four findings: two P2 and two P3. The calculations below are tests of statements and conventions, not proofs of the general theorems. Unread texts and claims whose source generality could not be certified are identified separately.

**Disposition of the four preceding findings, checked before the full pass.**

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01, character-general Jacquet–Langlands scalar | README:2200: “−λ_𝔭(f) N𝔭^(k₀/2−1), where λ_𝔭(f)²=ψ([𝔭])”; §7.7 supplies the local comparison. | Repaired. The cubic-twist check gives λ=−ζ₃, c=ζ₃, λ²=ζ₃², rather than a real sign. |
| R02, tuple finite-dimensionality padding | README:1067 consumes `Module.Finite.pi`; `finiteDimensional_hilbertModularForms` is absent from Suggested.lean. | Repaired. Component finite dimensionality remains; the finite-product consequence is no longer an admitted headline. |
| R03, locators in §§1.1, 1.2, 2.4, 3.5, 5.6 | README:462 cites Voight 9.6; §1.2 gives Assaf's opposite-diagonal adapter; §2.4 gives the Raghuram–Tanabe normalization adapter; §3.5 labels Bruinier's prototype; §5.6 cites Cremona Definition 9. | These specified repairs are present and were checked against the texts. R04 above concerns the additional seeded target §4.2, not a denial of these repairs. |
| R04, source manifest | README:2538 retains the references; sources.toml is absent. | Not repaired; R03 above. No supplied repair report marked this finding not actionable. |

**Gate, elaboration and form.** The supplied gate at this exact head passes every check, including the targeted build, source-material/stray-file scans, imports, sorry-data, `set_option`, metadata, dependency direction and outside-folder changes. The outside-folder diff against origin/main is empty, and the reviewed worktree remains unchanged. Independently running the prescribed dependency check produced:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. All `Needs`, `Rests on`, dependency summaries and supplier citations were read. Direct `lake env lean` elaboration succeeded with only the 11 expected sorry warnings. The separate `#check @name` file for all 49 declarations also elaborated successfully. None of the 24 automatic binder-loss leads proved to lose a needed hypothesis: underlying algebraic definitions legitimately use fewer assumptions; analytic embeddings and slash actions retain total reality; degree greater than one and nonzero level remain explicit where needed. The Fourier expansion sums over the entire trace-dual lattice and therefore does not need Koecher's degree restriction.

The scratch one-tactic probes tried `simp`, `rfl` and `infer_instance` on the 11 admitted targets; none closed. Reading the native definitions and relevant pinned declarations found no direct one-library-lemma replacement among these remaining targets. The action and linearity proofs construct the retained carriers. There is no sorry-defined data, substitute free predicate, forbidden import or option override. All target names agree with the README. The roadmap has APIs and discriminating Checks throughout its definition sections, layer Examples/Dependencies, and explicit general-degree/nonparallel adapters. The remaining source-form defects are recorded above.

**Headline coverage.** The 11 statable headlines are: Fourier expansion; Koecher support; vanishing of nonparallel cusp constants; full-expansion injectivity; cusp-coefficient injectivity; the cusp Hecke bound; component cusp finite dimensionality; component modular finite dimensionality; negative-weight vanishing; general absolute L-series convergence; and cusp absolute L-series convergence. All are present. The module docstring names the missing carriers for the cusp–Eisenstein decomposition, classical–adelic comparison, newform decomposition, coefficient-field rationality, functional equation/card, twists, CM induction, base change, Doi–Naganuma and Jacquet–Langlands, and the finite-nebentypus comparison. The classical Newform carrier at the pin does not supply a Hilbert newform carrier. No statable headline was found to have been replaced by a stand-in.

**Seeded source sample: all 15 requested targets.** Eight mathematical texts were legally retrieved and read: assaf (arXiv:2301.10302v2), dembele-voight (arXiv:1010.5727v2), bruinier (arXiv:math/0609763v1), raghuram-tanabe (June 20, 2011 author version), cremona (arXiv:2601.17524v1), voight (August 5, 2026 author edition), flhs (arXiv:1310.7088v4), and zagier (1975 author copy). Locators below refer to these versions. No README locator is explicitly marked “unverified” or “uncertified”. Library and supplier locators were checked at the supplied pins/heads, not substituted from a newer library.

| Seeded target | Text/locator inspected and conclusion |
| --- | --- |
| 0.2 holomorphy | Mathlib `LocallyUniformLimit.lean:45,49`: Cauchy derivative equality and estimate on an open domain, with positive radius and contained closed disk. Coordinate restriction supplies the polydisc estimate; the zero-radius case is explicitly excluded. |
| 0.3 slash | dembele-voight line 1847, (7.10), pp.37–38: determinant exponent and denominator agree after the stated weight convention. raghuram-tanabe line 1464, §4.1.2, p.27, is the unitary convention, requiring the displayed norm adapter. |
| 1.1 lattices/stabilizers | assaf lines 89–124, (2.1.4)–(2.1.10), p.3, gives R⊕𝔟 and the matrix restrictions. voight lines 6328–6376, Definition 9.6.1 and Lemmas 9.6.3–4, 9.6.7, 9.6.9, pp.143–144, gives determinant-lattice indices. The rank-two denominator clearing and column convention are explicitly owned here. |
| 2.6 cusp forms | dembele-voight lines 1899–1907, §7, p.38, and raghuram-tanabe lines 1476–1484, §4.1.2, p.27: all required constants vanish. The Lean definition uses convergent means at every slash, not merely the infinity coefficient. |
| 3.1 Siegel sets | bruinier lines 344–399, §1.2.1, pp.8–9, is a quadratic covering prototype. Its finite-intersection assertion needs correction (Source issues). AdelicAlgebraicGroups §3.4 supplies the general Siegel property. The roadmap retains the logarithmic-unit window and projective quotient. |
| 4.2 weight two | bruinier lines 740–779, Theorem 1.34 and Remark 1.35, pp.17–18, verifies the restricted prototype. Tau Ceti's holomorphic Dedekind remainder supplies precisely the pole cancellation input. General cusp scattering/continuation locator remains R04; no general-source certification is claimed. |
| 5.1 double cosets | dembele-voight lines 2031–2050, (7.22)–(7.24), p.41, gives the oriented component correspondence and inverse finite action. The empty-component case refutes the unconditional count (R02). Garrett's general lattice exposition was unavailable. |
| 5.2 T, S, central action | dembele-voight lines 1850–1918, (7.10)–(7.14), pp.37–39, and 2031–2050, p.41, fix the action convention. The representative norm factors and narrow-class central action are adapters here, tested below. Shimura's §2 text was unavailable. |
| 5.6 Fricke/Atkin–Lehner | cremona lines 609–622, Definition 9, p.12, and 683–688, §4.2.1, p.13: row-lattice factor N𝔮⁻¹, square and coprime-product relations. The roadmap explicitly changes to oriented columns and its arithmetic slash. Local existence is supplied by SL₂ strong approximation, not by assuming 𝔮 principal. |
| 7.2 newforms | raghuram-tanabe lines 1567–1585, §4.1.3, p.28, gives primitive normalization and orthogonal complement; its missing proper-divisor restriction is recorded below. The roadmap's §7.1 uses proper lower levels and avoids that error. |
| 7.3 newform decomposition | raghuram-tanabe lines 1612–1616, §4.1.4, p.29, supports the primitive eigenform characterization, not by itself the full multiplicity formula. The latter's exact input is the Casselman dimension theorem in AutomorphicLFunctionsAndLocalFactors AL.2.2.4 and GL2AutomorphicRepresentationsAndTransfer R16.4.3–4, transported by §6.4. Miyake's text was unavailable. |
| 7.7 pseudo-eigenvalues/signs | The matrix and square are checked against cremona Definition 9/§4.2.1. GL2AutomorphicRepresentationsAndTransfer R16.2.1/R16.3.2 supplies the Steinberg/parameter normalization; the comparison of its two actions is now a named target here. The cubic twist tests the sign beyond λ²=ψ. The product's indexing defect occurs downstream in §8.2. |
| 9.2 inner twists/CM | raghuram-tanabe lines 1621–1623, §4.1.4, p.29, identifies quadratic self-twists with CM induction; lmfdb-mf.cm lines 90–92 gives the displayed predicate. ClassFieldTheory Layer 12 and GL2AutomorphicRepresentationsAndTransfer R16.4.6/R17.4.16 give the precise character/induction inputs. |
| 10.1 partial newness | dembele-voight lines 583–607, Theorem 3.9/Remark 3.10, pp.11–12, distinguishes D-new from new at every level prime. D=1 leaves the whole cusp space, including oldforms. |
| 10.2 definite dictionary | dembele-voight Theorem 3.9, p.11, is the weight-two prototype. GL2AutomorphicRepresentationsAndTransfer R17.3.1/.3/.5/.9 and QuaternionicModularForms §§1.3,2.1,3.1 supply the larger weight/character and opposite-action conventions. The repaired cubic-twist scalar passes. |

Additional checks: raghuram-tanabe lines 1495–1498 locate the unitary Fourier normalization used in §2.4; lines 2005–2069, §4.4.1 and Theorem 4.16, pp.34–35, give the gamma shifts. Bruinier Lemma 1.31/Theorem 1.32, pp.15–16 (lines 633–677), is correctly labeled a finite-dimensionality prototype. Zagier equations (95a)–(95c) and Theorem 5, pp.32–33 (lines 1191–1248), retain the prime-discriminant/class-number-one hypotheses of the explicit Doi–Naganuma prototype. General base change is imported separately. Dembélé–Voight Example 8.1, p.44 (lines 2190–2235), supplies the two trace computations below. Freitas–Le Hung–Siksek Theorem 1, p.2, supplies the unrestricted real-quadratic elliptic interface; potential modularity is not substituted for modularity over the original field.

**Computed adversarial pass (72 rows, followed by 11 individual headline checks).** Each row gives actual values or an explicit algebraic identity with substituted parameters. “Retain” means the tested instance agrees, not that the instance proves the target. Algebraic normalization tests are identified as such when they do not assert existence of a form with freely chosen coefficients. Zero rings, positive characteristic coefficient fields, inseparable number fields and empty infinite-place sets do not satisfy this roadmap's standing number-field/complex-coefficient hypotheses; they were not silently admitted as inputs. The general local suppliers retain residue characteristics 2 and 3.

| Statement | Instances tried | Values computed on the two sides; result | Change |
| --- | --- | --- | --- |
| 0.1 domain/action, determinant positivity | I, translation, inversion at i and 2i; scalar 2 | I·i=i; translation gives 1+i; −1/(2i)=i/2; scalar 2 fixes i. Positive determinant preserves positive imaginary part. | Retain. |
| 0.1 action order | T:z↦z+1, S:z↦−1/z | TS·i=1+i; ST·i=(−1+i)/2. Noncommutativity prevents reversing the action law. | Retain. |
| 0.2 holomorphy and Cauchy bounds | 1, z−z₀, conjugation; radius r>0 | Derivatives 0 and 1; bounds 0≤1/r and 1≤r/r=1. Conjugation's real/imaginary quotients are 1 and −1. | Retain; radius 0 excluded. |
| 0.3 weight and arithmetic slash | k=(2,4); scalar 2 in degree 2 | k₀=4, m=(1,0); factors 4²/2²=4 and 4³/2⁴=4, product 16=N(2)². For scalar norm −1 at odd parallel weight the factor is −1. | Retain. |
| 0.4 unitary adapter | Same scalar; diag(2,1) | Unitary scalar action is 1, arithmetic is 16. For diag(2,1), determinant norm 4 gives arithmetic/unitary factor 4. | Retain. |
| 1.1 lattice determinant/index | ℤ², diag(2,3); inverse; clearing denominators | Indices 6 and 1/6. For 3ℤ⊕(1/2)ℤ, clearing by 2 gives 6/4=3/2; clearing by 4 gives 24/16=3/2. | Retain. |
| 1.1 stabilizer versus bare determinant | diag(2,1/2) on ℤ² | Determinant 1 but second vector (0,1/2) is outside ℤ². It is not a lattice stabilizer. | Retain integral-entry restrictions. |
| 1.2 group indices | F=ℚ, levels 1,2,4 | Indices 1, 2(1+1/2)=3, 4(1+1/2)=6. Prime-square level is not replaced by its radical. | Retain. |
| 1.2 Γ₁ convention | F=ℚ(√5), w²=w+1, u=w², diag(u,1) mod 2 | d=1; a=u≠1 in 𝔽₄. README convention accepts it, Assaf's a-congruence does not. | Retain the explicit adapter. |
| 1.3 conjugation and commensurability | Conjugation by diag(1,2) | (a,b;c,d) maps to (a,b/2;2c,d). For (√6), the ordinary principal class is 1 but its narrow class is not 1. | Retain orientation distinction. |
| 1.4 cusp count | Narrow-class-one quadratic example; prime and prime-square level | Full level gives 1; prime level gives 2. At norm-4 prime-square level, the middle unit-orbit term is 1, total 1+1+1=3, not 5. | Retain unit quotient in the count. |
| 1.5 representatives | ℚ(√5), ℚ(√6); rescaling by 2 | h⁺ values 1 and 2; rescaling changes representative norm by 4 but not its narrow class. | Retain arbitrary h⁺. |
| 2.1 periodic expansion/extraction | 1+2e(x₁) on a unit torus | Coefficients at 0,e₁,2e₁ are 1,2,0; integrating e(x₁)e(−x₁) gives 1, whereas nontrivial frequency averages give 0. | Retain sign and constant. |
| 2.1 box-mean junk values | T<0, T=0 and eventual T>0 | Empty/measure-zero boxes have average 0 in the totalized definition; for the constant 1 every positive box has average 1, so the limit is 1. | Retain atTop limit, not a value at T=0. |
| 2.2 Koecher support | μ=0; mixed-sign √5 and ε=(3+√5)/2 | Constant 1 has a₀=1. The trace along μ ε^{−j} is √5(ε^{−j}−ε^j)→−∞, excluding a nonzero mixed-sign coefficient by the unit argument. | Retain μ≠0 and degree>1. |
| 2.3 modular carrier/parity | Weight zero; odd weight with norm−1 unit | Constant 1 transforms to 1 at weight 0. At odd weight the unit forces f=−f, hence 2f=0 and f=0 over ℂ. | Retain parity check. |
| 2.3 representative transport | Multiply a quadratic representative by 2 | N(2)=4; normalized transport multiplier 1/4; inverse multiplier 4; composite 1. | Retain. |
| 2.4 arithmetic/unitary coefficients | Scalar-factor test: μ=3+√5, k=(2,4), raw coefficient 1 | Nμ=4; arithmetic coefficient 3+√5; unitary coefficient (3+√5)/16; ratio 16=Nμ^{k₀/2}. | Retain normalization. |
| 2.4 expansion injectivity | Constant 1 versus 0; cusp restriction | Positive coefficients are 0 in both cases, constants 1 versus 0. On cusp forms constants are 0, so this obstruction disappears. | Retain full constants in the first theorem. |
| 2.5 transformed constants | diag(2,1), parallel k=4, degree 2 | Constant scales by (2³)²=64; a zero constant remains 0. A nonparallel unit multiplier ε^{−1}≠1 forces a₀=0. | Retain all-cusp formulation. |
| 2.6 cusp predicate/decay | Zero, constant 1, positive exponential along it | Cusp constants 0 versus 1; positive Fourier term has modulus exp(−2πnt)→0 for n>0. | Retain. |
| 2.7 global central law | ℚ(√10), nontrivial class character, constant tuple | The specified central transformation of the constant tuple is 1; required character value is −1, so 1≠−1. A cubic twist changes central value to ζ₃². | Retain global law, not merely finite character data. |
| 3.1 Siegel window/intersections | Positive units; balanced heights | Scalar units give infinitely many matrices but one projective action. At balanced height y=(t,t), norm height is t² and both coordinates grow as t. | Retain projective and unit-window qualifications. |
| 3.2 invariant measure | z↦2z; two norm/radius coordinates | Jacobian 4 cancels y² scaling 4. Norm height r has tail integral ∫₂∞r⁻²dr=1/2. Radius s gives 2s⁻³ds, value 2/27 at s=3, not 1/9. | Retain repaired norm height. |
| 3.3 cusp bound normalization | μ=3+√5, k=(2,4) | Multiplying μ^m by ∏μ_w^{k_w/2} gives μ₁²μ₂²=16=Nμ². Coefficient extraction contributes exp(+2πTr(μy)), not a negative exponent. | Retain. |
| 3.3 general bound/zero form | k₀=4; zero form | General norm exponent 4 versus cusp exponent 2; at norm 4 the powers are 256 versus 16. Zero form admits C=0 and 0≤0. | Retain distinct estimates. |
| 3.4 Petersson convention | Unit-norm h, ih; scalar 2 at quadratic weight 4 | ⟨ih,h⟩=−i and ⟨h,ih⟩=i. Arithmetic slash multiplies h by 16 and its squared norm by 256. | Retain conjugate-first pairing and weights. |
| 3.5 finite-dimensional norm comparison | A=2, volume=3; common zero; two components | Dimension estimate r≤A²vol=12; at a common zero the pointwise sum is 0≤4, with no division by zero. Component dimensions 1 and 2 give tuple dimension 3. | Retain; tuple consequence stays out of Lean. |
| 3.5 negative weights and nonzero level | Negative k₀; weight 0; level zero excluded | Claimed negative-weight space is {0}; at weight 0 constant 1 prevents the same conclusion. At zero level, y-independent constant 1 survives some negative even-weight parabolic transformation laws. | Retain strict negativity and nonzero level. |
| 4.1 cusp Eisenstein normalization | Two cusps; classical E₄ | Constant matrix is ((1,0),(0,1)); scaling by 2 gives ((2,0),(0,2)) and fails normalization. E₄'s first two coefficients are 1,240. | Retain mathematical normalization. |
| 4.2 Hecke-trick cancellation | n=2 and n=1 | (ρ/(2s))s²=ρs/2→0; (ρ/(2s))s=ρ/2≠0. | R04: this calculation needs the full constant-term locator. |
| 4.3 cusp/Eisenstein splitting | ℚ(√5) full level, weights 2,4,6 | Constant-normalized Eisenstein coefficient multipliers 120,240,2520/67; E₂ is not cuspidal because a₀=1. Constant map splits off the Eisenstein coordinate. | Retain; no cusp bound for E₂. |
| 5.1 nonempty component and count | F=ℚ(√6), 𝔪=𝔫=𝔠=1, 𝔟=(√6) | Determinant norm −1/6; Δ=∅; left quotient cardinal 0, displayed divisor sum 1. | R02: add class compatibility or return 0. |
| 5.1 compatible cosets/operator | Equal components at unit ideal; norm-4 good/bad prime | Counts 1,5,4. Unit correspondence multiplier 1 and operator identity. Norm ratio 1/2 reverses to 2 when components reverse. | Retain these cases after R02. |
| 5.2 central action | Scalar 2 in quadratic weight 4 | S_(2) acts by 16; normalization N(2)^{−2}=1/16 gives central action 1. Nontrivial narrow-class character can instead have eigenvalue −1. | Retain central action, not assumed trivial. |
| 5.3 good-prime recurrence | q=4, k₀=2, ψ=1, a_𝔭=−3 | a_{𝔭²}=9−4=5; T_𝔭² eigenvalue 9=5+4. | Retain central correction. |
| 5.3 bad-prime recurrence | a_𝔭=−1 at conductor exponent 1 | a_{𝔭²}=1 and a_{𝔭³}=−1, without the good-prime q correction. | Retain bad primes. |
| 5.4 coefficient formula | Unit coefficient; two iterations at a bad norm-4 prime | c(1,T_𝔭 f)=c(𝔭,f)=−3 in the good example. At a bad prime the iterated shift is c(𝔭²𝔪,f), with 4²=16 local cosets. | Retain extension-by-zero convention. |
| 5.5 adjoints | ψ=1 and ψ=ζ₃; representative scaled by 2 | Character factor is 1 versus ζ₃⁻¹. Quadratic weight-4 representative compensation is 4⁴=256; omitting it gives reciprocal 1/256. | Retain weighted Petersson sum. |
| 5.6 nonprincipal Atkin–Lehner | ℚ(√10), the nonprincipal norm-2 component switch | Successive component norm factors 1/2 and 2 multiply to 1; determinant ideals have norms 1 and 2 as in the chosen matrices. W₁ is identity. | Retain lattice construction and orientation. |
| 5.6 square/local adjoint | ψ=1; q=4, k₀=4; ψ=ζ₃² | Squares are 1 versus ζ₃². At exponent one the arithmetic coefficient magnitude is q^{k₀/2−1}=4, not 64. | Retain normalization. |
| 6.1 adelic components | ℚ(√6) | Narrow class count 2 versus ordinary class count 1; replacing narrow by ordinary loses one component. | Retain. |
| 6.2 adelization/transport | Representative multiplied by 2 in degree 2 | Norm factor 4 cancels classical factor 1/4. The weight-4 finite scalar factor 1/16 becomes 16 under the dual action. | Retain. |
| 6.3 Hecke/Satake adapter | q=4, k₀=4, arithmetic coefficient a | Raw finite action a/16; dual arithmetic action a; unitary T action a/4; Satake trace a/8. Central actions 1/16→16→1. | Retain both T and S coordinates. |
| 6.4 transported multiplicities | Local conductor c, levels c−1,c,c+1 | Casselman dimensions max(0,0)=0, 1, 2; the minimal line is one-dimensional, an oldspace need not be. | Retain level hypotheses. |
| 7.1 degeneracy maps/oldspace | g and V_𝔭g | First coefficients 1 and 0; g+tV_𝔭g has first coefficient 1 for every t. At unit level the proper-divisor sum is empty and oldspace is 0. | Retain proper lower levels. |
| 7.2 newform definition/basis | g, 2g, g+tV_𝔭g | Normalized coefficients 1 versus 2; the third vector has first coefficient 1 but lies in the oldspace, so normalization alone does not make it new. | Retain newness and nonzero condition. |
| 7.3 decomposition | A conductor-one constituent lifted by 𝔭^r | Multiplicities for r=0,1,2 are τ(1)=1, τ(𝔭)=2, τ(𝔭²)=3. | Retain full divisor multiplicity. |
| 7.4 all-index eigenvalues | a_𝔭=−3, q=4, k₀=2 | a_{𝔭²}=5; a_{𝔭³}=−3·5−4(−3)=−3; a₁=1. Scaling the form by 2 changes a₁ to 2 and breaks the asserted normalization. | Retain. |
| 7.5 coefficient fields and conjugation | t²=3; nonparallel weight | Two embeddings send t to ±t, so field degree/orbit size is 2. Embedding exchange sends weight (2,4) to (4,2). | Retain orbit across conjugate weights. |
| 7.6 bad coefficients | Exponent 1 versus ≥2, unramified ψ | At q=4,k₀=4, c²=16 and absolute value 4 in the first case; c=0 in the second. Cubic character gives c=ζ₃, c²=ζ₃² at weight 2. | Retain ψ in the square law. |
| 7.7 pseudo-eigenvalue comparison | Repaired cubic twist; trivial character | −(−ζ₃)·11⁰=ζ₃ and (−ζ₃)²=ζ₃². With c=−1 and ψ=1, ε=+1. At higher conductor c=0 does not choose ±1. | Prior R01 repaired. |
| 8.1 Euler factors | Good norms 4,5 and a bad multiplicative prime | Factors 1+3T+4T², 1+2T+5T², and 1+T. At norm 11 the two coefficients 4 and −4 sum to 0 under norm grouping. | Retain ideal indexing and bad factors. |
| 8.1 convergence | k₀=4; s=6; zero form | General threshold 5 and cusp threshold 3; 6 exceeds both. Zero series has all terms 0, including norm coefficient at 0. | Retain strict half-planes. |
| 8.2 conductor, gamma and Mellin | Quadratic level norm 31; k=(2,4); representative scaling | Q=31·5²=775; gamma arguments s−1,s; archimedean phase i⁶=−1 rather than i⁸=1. Mellin transport gives 4^{−s}4^s=1. | Retain these conventions. |
| 8.2 root-number range | E15 over ℚ(√13), three level primes | Prime-power signs (+1,+1,−1) multiply to −1. All eight exact-divisor signs multiply to +1. | R01: specify prime-power range. |
| 8.3 card and analytic rank | Quadratic weight 2, Q=775 | Degree 4, motivic weight 1, analytic centre 1/2; Γℂ normalization introduces factor 4·775^{−1/4}. Sign −1 forces odd order; +1 forces even order, not necessarily zero. | Retain completed continuation. |
| 9.1 twist | Cubic χ(𝔭)=ζ₃; quadratic χ | Coefficient c becomes ζ₃c; central value becomes ψζ₃². Twice a quadratic twist restores good coefficients since χ²=1. Coefficient twist is 0 at its conductor primes. | Retain primitive-associate distinction. |
| 9.2 inner-twist group/fibres | Complex conjugation σ acting on cubic character χ | (σ,χ)²=(1,χσ(χ))=(1,1), whereas a direct-product law would give (1,χ²). A CM self-twist yields 0=(−1)0 at inert primes and c=1c at split primes. | Retain semidirect law and nonunique fibre. |
| 9.2 CM nonexample | Proposed inert prime with coefficient 4 | Required equality is 4=−4, false in ℂ. A nonzero inert coefficient rules out that quadratic self-twist. | Retain. |
| 9.3 CM infinity/induction | Split values −1±2i; inert Frobenius matrix | Trace −2 and determinant 5; inverse values instead give trace −2/5 and determinant 1/5. Matrix ((0,−9),(1,0)) has trace 0, determinant 9. | Retain inverse-monomial adapter and determinant sign. |
| 9.4 root powering | Polynomial 1−3T+2T²; roots 1,−1 | Squaring 1,2 gives 1−5T+4T². Squaring roots of 1−T² gives (1−T)², multiplicity 2 at 1. Empty multiset stays polynomial 1. | Retain multiset, not set. |
| 9.5 base change/descent | Quadratic descent and a degree-2 then degree-3 tower | Two character-twisted descents can have one base change. Roots 2 and 3 become 2⁶=64 and 3⁶=729 in either order. | Retain nonuniqueness and tower law. |
| 9.6 Doi–Naganuma | D=29, k=2; inert 2,3; ramified 29 | Inert values −5+4=−1 and −5+6=1. Ramified conjugates −3±2√−5 sum to −6; a single b(29) is not that real value. Split b(5)=−3 is attached separately to each prime. | Retain ramified correction and explicit prototype scope. |
| 10.1 D-new | D=1; local conductor a<n versus a=n | Empty newness conditions leave the entire cusp space; local old multiplicity n−a+1 is >1 when a<n and 1 at a=n. | Retain distinction from full newness. |
| 10.2 quaternion ramification parity | (n,ω(D))=(2,0),(3,0),(3,1),(2,2) | Ramification totals 2,3,4,4: existence, obstruction, existence, existence. Cubic-twist quaternion eigenvalue is ζ₃, not ±1. | Retain corrected character generality. |
| 10.3 Brandt trace subtraction | Dembélé–Voight norm-4 and norm-13 matrices | Total traces 0 and 36; norm-character traces 5−5=0 and 28; cuspidal traces 0 and 8. | Retain subtraction, not total class-set trace. |
| 11.1 displayed invariants | Rational and quadratic coefficient fields; good norm 4 | Degrees 1 and 2; coefficient −3 satisfies 3≤2√4=4. The self-twist's inert set has quadratic density 1/2. | Retain conditional arithmetic/Ramanujan inputs. |
| 11.2 label prefix | F=ℚ(√5), conjugate norm-31 levels | Both give field prefix (2,2,5) and level norm 31. Substituting level norm 81 fails 31=81; no ordering suffix is inferred. | Retain intrinsic-only label. |
| 11.3 elliptic interface | y²+xy+wy=x³+(1+w)x²+wx, w²=w+1 | Direct finite-field enumeration gives 8 points over 𝔽₄,𝔽₅,𝔽₉, hence traces −3,−2,2, equal to the displayed coefficients. Multiplicative ±1 gives 1∓T; additive gives 1. | Retain full local-factor premise. |
| Worked examples: conjugation/base change | Norm-11 conjugate primes | Values 4 and −4 differ, excluding descent to ℚ with those good factors; their norm-grouped coefficient is nevertheless 0. | Retain prime-ideal data, not only norm sums. |
| Worked examples: coefficient field | Square level, t²=3 | t and −t are distinct, so the orbit spans degree 2 over ℚ; this is not a one-dimensional rational Hecke constituent. | Retain correction of the source example. |

The elliptic point counts in the last rows were independently enumerated in the fields defined by w²=w+1 (w=3 in 𝔽₅). The R01 discriminant, reductions and subset-sign product, R02 norm obstruction, and the recurrence/index arithmetic were independently recomputed as well.

**Individual admitted headline checks.** These are the 11 declarations actually probed, with an instance of their own conclusions rather than a replacement theorem.

| Declaration in Suggested.lean | Instance and computed values | Result/change |
| --- | --- | --- |
| `hasSum_fourier` | Quadratic full level, weight 0, f=1: coefficient at μ=0 is 1, all other coefficients 0; series sum 1=f(z). | Retain full trace-dual sum. |
| `koecher` | Same form, μ=−1: coefficient 0, required right side 0; μ=0 instead has coefficient 1 and is excluded by hμ. | Retain nonzero-exponent hypothesis. |
| `constantTerm_slash_eq_zero_of_not_isParallel` | k=(2,4), ε=(3+√5)/2: unit relation has unequal multipliers 1 and ε, forcing (ε−1)a₀=0 and a₀=0 at each conjugate cusp stabilizer. | Retain nonparallel restriction. |
| `fullExpansion_injective` | Weight-zero forms 1 and 0 have positive coefficient sequences both 0 but constant coordinates 1 and 0. The full pairs differ. | Retain constants. |
| `cusp_coeff_injective` | Cusp constants are all 0; the normalized norm-31 form has c(1)=1, whereas the zero cusp form has c(1)=0. | Retain cusp domain. |
| `exists_norm_coeff_le` | Weight-two norm-31 form at norm 4: left side 3, right side 4C, requiring C≥3/4. Zero form permits C=0 and equality 0=0. | Retain existence of form-dependent C. |
| `finiteDimensional_cuspForms` | ℚ(√5), weight 2, norm-31 level: dimension 1; at full level weight 2: dimension 0. Both are finite. | Retain component theorem. |
| `finiteDimensional_modularForms` | ℚ(√5), full level, weight 0: constants give dimension 1; negative weights give dimension 0. | Retain component theorem. |
| `modularForms_eq_bot_of_top_neg` | Weight −2 and inversion at z=(2i,2i): the candidate constant 1 slashes to 16, so it is excluded. At weight 0 it slashes to 1 and is a counterexample to dropping strict negativity. | Retain strict k₀<0. |
| `LSeriesSummable_of_modularForm` | Full-level E₂ over ℚ(√5), s=4: threshold 3<4; norm-4 term is 600/4⁴=75/32. The zero series has sum 0. | Retain general half-plane; this term test alone is not convergence proof. |
| `LSeriesSummable_of_isCuspForm` | Weight-two norm-31 cusp form, s=3: threshold 2<3; norm-4 absolute term is 3/4³=3/64. | Retain sharper cusp half-plane. |

**Pinned-library audit.** Mathlib pin: `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following are paths relative to those library repositories. These declarations were opened, rather than inferred from their names.

| File and line at the pin | Declaration and scope checked |
| --- | --- |
| `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:45`, `:49` | `Complex.cderiv_eq_deriv`, `Complex.norm_cderiv_le`: open domain, complete target for the derivative comparison, positive radius, contained closed disk and sphere bound. |
| `Mathlib/Analysis/Fourier/AddCircleMulti.lean:286`, `:320`, `:329` | `UnitAddTorus.hasSum_mFourier_series_L2`, uniform and pointwise summable-coefficient versions. L² convergence alone does not give the holomorphic pointwise expansion. |
| `Mathlib/MeasureTheory/Function/L2Space.lean:136` | `MeasureTheory.L2.inner_def`: integral of the native conjugate-first inner product. |
| `Mathlib/RingTheory/Finiteness/Basic.lean:274` | `Module.Finite.pi`: finite products of finite modules; this supplies the deleted tuple consequence. |
| `TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71`, `:315` | `IsTotallyPositive` quantifies over real places, hence is vacuous for totally complex fields. `norm_pos_of_isTotallyPositive` also requires nonzero input. These restrictions are respected. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83`, `:98`, `:106`, `:366` | Quotient by positive principal ideals, `mk`, surjectivity, and `mk0_eq_mk0_iff`. An ordinary principal ideal need not have narrow class one. |
| `TauCeti/NumberTheory/NumberField/Global/RayClass/Narrow/Basic.lean:134` | `narrowEquivNarrowClassGroup`: a proved multiplicative equivalence, not a definitional identification. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120`, `:270` | `idealCharacter` has prime-to-conductor domain. The principal-generator identity is the inverse embedding monomial and requires matching infinity type, congruence and positivity. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60` | `IsAlgebraic` compares infinity types on the identity component; it does not prohibit finite-order real sign characters. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:101` | `normCoeff` sums over nonzero ideals of fixed norm and has zero coefficient at 0. Cancellation in a norm fibre does not erase the individual ideal coefficients. |
| `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158` | `exists_differentiableOn_eq_dedekindZeta_sub`: holomorphic G on Re(s)>1−1/n, with G=ζ−ρ/(s−1) initially on Re(s)>1. It is stronger than a real residue limit, weaker than the full Eisenstein statement. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84`, `:104` | `EigenformAwayFromLevel` and `Newform`: classical Γ₁(N), nonzero N, nebentypus, good Hecke eigencondition, nonzero vector, newness and first coefficient 1. They are not Hilbert-form carriers. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48` | `TauCeti.CoefficientField`: intermediate field generated by positive classical Fourier coefficients. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91` | `Newform.satakeParameters`: polynomial root multiset, retaining multiplicity; arbitrary natural-number arguments have arithmetic meaning only at primes. |
| `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72` | `HasLMFDBIntrinsicLabel`: degree, real-place count and absolute discriminant only, with no database-ordering suffix. |

**Ownership and every supplier family.** Object searches used `roadmaps grep`, `roadmaps show`, the supplied main checkout, the board packages, pinned libraries and supplied sibling heads. The worker supplied ten name leads: `Weight.IsParallel` is declared here, and the other nine are database/knowl strings, not missing Lean APIs. The fresh resolver reports no missing cross-roadmap citations or Lean names; it explicitly did not inspect external pinned packages, which were inspected locally as recorded above. No duplicate fully qualified name was found for this module. Searches concerned lattices/indices, Hilbert carriers and coefficients, Hecke operators, newvectors, integral q-expansions, transfer and modularity, rather than only this file's declaration names.

| Supplier citation resolved | File/section opened and ownership boundary |
| --- | --- |
| NoncommutativeAndEquivariantIwasawa F.5 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2519`: parallel k≥2 analytic forms, all cusps, normalized coefficients, good/bad Hecke actions and integral lattices. This roadmap compares on that domain and extends to nonparallel/low weights; it does not allocate a second parallel construction. |
| KTheoryLowDegrees §5.4 | `TauCetiRoadmap/KTheoryLowDegrees/README.md:606`: line-map index ideal and local determinant scalar. The rank-two fractional-lattice denominator-clearing adapter is the additional target here. |
| GlobalNumberFields Layers 2,4,7,9,10 | `Completed/GlobalNumberFields/README.md:279`, `:418`, `:459`, `:508`, `:531`: moduli/ray classes, finite adeles, idele quotient, finite-order characters and the inverse-monomial algebraic character convention. |
| ClassFieldTheory Layer 12 | `TauCetiRoadmap/ClassFieldTheory/README.md:1724`: number-field global correspondence and quotient/Galois comparison, sufficient for the quadratic-character dictionary. |
| NumberFieldArithmetic §§4.3,8.1 | `Completed/NumberFieldArithmetic/README.md:1210`, `:2140`: finite ramified support and intrinsic label prefix. |
| ArithmeticDirichletSeries Layers 1,3 | `Completed/ArithmeticDirichletSeries/README.md:148`, `:193`: finite norm fibres and the multiplicative ideal Euler-product package; not an arbitrary function's automatic Euler product. |
| ModularForms Layers 2(a),4,6–8 | `TauCetiRoadmap/ModularForms/README.md`, the named layers: the rational-field double-coset, classical newform, Fricke and L-function objects. The Hilbert extension compares to this rational specialization rather than redefines it. |
| LFunctions Layers 0,3 | `TauCetiRoadmap/LFunctions/README.md:346`, `:730`: arithmetic/analytic card translation and Dedekind continuation/functional equation. Neither is an Eisenstein scattering formula. |
| AdelicAlgebraicGroups §§3.2,3.4,4.2 | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, real Siegel coordinates, §3.4 at line 3173, and strong approximation at line 4180: cover/intersection inputs and SL₂ density. The SL₂ case applies with the archimedean places removed, not only with a finite split quaternionic place removed. |
| GL2AutomorphicRepresentationsAndTransfer R16.1.3/.6 | `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:525`, `:596`: local/adelic K₀,K₁ and finite-level automorphic functions with growth and differential conditions. The holomorphic nonparallel comparison is the adapter here. |
| R16.2.1, R16.3.2–.4/.6 | Same README, §R16.2.1 at line 680, §R16.3.2 at line 891: local classification, Steinberg Weil–Deligne normalization, full ramified factors and twists. No good-prime-only replacement is used. |
| R16.4.3–.6 | Same README:1051,1061,1128,1153: multiplicity one, both trace and central Hecke coordinates, algebraic rationality and self-twist stabilizer. The unitary-to-algebraic norm twist is retained; rationality does not by itself construct an integral lattice. |
| R16.5.4 | Same README:1212: conductor-balanced completion and full functional equation. §8.2 owns the classical normalization comparison. |
| AutomorphicLFunctionsAndLocalFactors AL.2.2/AL.2 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1689`: exact newvector dimension max(0,n−c+1), last-row convention, no odd-residue-characteristic restriction; AL.2 also supplies standard local factors/equations. |
| AutomorphicBundles §§11.9,11.18,12.17–12.19 | `TauCetiRoadmap/AutomorphicBundles/README.md:4055`, `:4358`, `:5179`, `:5229`, `:5263`: analytic comparison, coherent field base change, coefficient-line q-expansions and all-cusp vanishing. The tame-level/flatness assumptions are retained. The nonparallel Hecke-stable integral lattice is expressly a target here. |
| HilbertModularVarietiesAndShimuraCurves H1.10,H3.6,H3.8,H5.2 | `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:525`, `:864`, `:890`, `:1307`: moduli comparison, arithmetic quotient, component-changing isogenies and cusp geometry. H3.8's finite-étale subgroup assumptions are not used as an all-bad-prime integral theorem. |
| AutomorphicGaloisRepresentations §§3.10,3.15,3.16 | `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1646`, `:1861`, `:1888`: regular Hilbert Galois representations and CM characterization. These do not make every arbitrary elliptic curve modular. |
| GL2AutomorphicRepresentationsAndTransfer R17.4.1/.3/.4/.5/.8/.16 | Same supplier README:1754,1823,1833,1841,1865,2127: root-multiset powers, all-place base change, descent ambiguity, cuspidality, solvable towers and quadratic induction. The trivial/nontrivial self-twist distinction remains visible. |
| PotentialModularityAndCompatibleSystems §5.1; Chebotarev | `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1316` and `Completed/Chebotarev/README.md`: potential modularity and Frobenius density. Potential modularity is used only after extension; the elliptic interface keeps its modularity premise over F. |
| QuaternionicModularForms §§0.1,0.3,1.3,2.1,3.1 | `TauCetiRoadmap/QuaternionicModularForms/README.md:190`, `:267`, `:440`, `:492`, `:792`: orders/class set, algebraic weight, invariant functions and opposite Hecke action. No second Brandt-space construction is planned here. |
| GL2AutomorphicRepresentationsAndTransfer R17.3.1/.3/.5/.9 | Same supplier README:1578–1702, the named targets: Jacquet–Langlands, compatible twists, finite-level comparison and algebraic-weight normalization. §10.2 now transports the full central character correctly. |

These suppliers are earlier owners under the supplied order; no consumed object had to be moved to a later supplier. No declared gaps exist. No fictitious supplied section was found. The cited geometric and representation-theoretic theorems are distinguished from the new classical comparison targets; the report does not certify all the suppliers' own proofs.

Against open work, `TauCetiRoadmap/HilbertModularSurfaces/README.md:28` explicitly consumes these groups, cusps and holomorphic forms and owns surface geometry instead. `TauCetiRoadmap/BianchiModularForms/README.md:118` leaves the totally real theory here. HilbertModularVarietiesAndShimuraCurvesPartII owns mod-p cohomology/patching, and QuaternionArithmetic owns quaternion arithmetic, not these holomorphic carriers. The board-package search also found geometric boundary/family consumers, not a competing owner for the analytic nonparallel extension. Main ModularForms and the completed GlobalNumberFields/Chebotarev roadmaps were read for repository shape. No source passage, computational algorithm, route-specific shortcut, or foreign instruction was adopted into the reviewed work.

## Not verifiable

- **Full generality of §4.2's source claim:** the readable Bruinier text is a real-quadratic full-level prototype, and the pinned zeta theorem only supplies the local meromorphic remainder. The general scattering/continuation locator is R04. The cancellation arithmetic was checked independently.
- **freitag**, Hilbert Modular Forms, Chapter I; **miyake**, Modular Forms, §§4.5–4.6; **doi-naganuma**, On the functional equation of certain Dirichlet series, pp.1–14: the sources service classified the publisher-only references as uncertified. Their exact text was not read and is not asserted verified. These settled citations are not new missing-text requests. Zagier's readable treatment provides the restricted prototype used above.
- **van-der-geer**, Hilbert Modular Surfaces, Chapters I and VI; **garrett**, Holomorphic Hilbert Modular Forms, Chapters 1–2; **diamond-shurman**, A First Course in Modular Forms, Proposition 5.8.5; **atkin-li**, Twists of newforms and pseudo-eigenvalues of W-operators: title/author resolution through the legal sources service found no readable full text. These are retained in the missing-reference record, not guessed from their titles.
- **shimura1978**, §§2,4: the DOI led to the Project Euclid article landing page without a readable PDF. **shimura1971**, Theorem 3.24/§3.3: title resolution led to a JSTOR review rather than the cited book; that review is not evidence for the theorem. **iwaniec-kowalski**, equation (5.7): the AMS publisher landing page did not yield readable text. No paywall was bypassed.
- Four fetched LMFDB knowls, **lmfdb-mf.base_change**, **lmfdb-nf.narrow_class_group**, **lmfdb-dq.mf.hilbert.reliability**, **lmfdb-rcs.cande.mf.hilbert**, contain only a browser/reCAPTCHA access check (line 5 in each extraction). They are not verified source texts. The other nine requested knowls were readable. All three named public LMFDB source files were fetched; `lmfdb-hilbert-modular-form` lines 465–493 confirms prime-indexed coefficient display and distinguishes empty Atkin–Lehner data at level one from missing data at other levels. This does not certify database completeness or all numerical records.
- The displayed examples were checked through the cited readable texts and explicit arithmetic, including direct elliptic point counts. A live exhaustive audit of LMFDB records was not performed. The mathematical transfer tests and source sample above do not depend on such an audit.

All accessible parts of the review were completed despite these access limitations; no text was copied into the roadmap and no source manifest was edited by this review.

## Source issues

- **Error** in bruinier at Proposition 1.16, p.9 (bruinier lines 367–375): the source says its unbalanced coordinate-height domains meet only finitely many translates; it should be restricted using a logarithmic-unit window before asserting the finite-intersection property; affects a stated result.
- **Misprint** in bruinier at the proof of Proposition 1.41, pp.21–22 (bruinier lines 928–936): the source says coefficient extraction contributes exp(−2πTr(νy)) to the absolute-value bound; it should be exp(+2πTr(νy)); affects the proof.
- **Error** in raghuram-tanabe at §4.1.3, p.28 (raghuram-tanabe lines 1567–1574): the source says the oldspace is generated using all levels dividing the given level; it should exclude the level itself, or the identity degeneracy makes the entire cusp space old; affects a stated result.
- **Misprint** in dembele-voight at Example 6.6, p.29 (dembele-voight lines 1426–1431): the source says the displayed square-level cusp space has dimension one while its Hecke eigenvalues generate ℚ(√3); it should have dimension two, with one rational Hecke constituent; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, p.42 (dembele-voight lines 2101–2105): the source says Fourier exponents lie in a d⁻¹; it should use a⁻¹d⁻¹ for the displayed translation lattice a; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, p.42 (dembele-voight lines 2112–2115): the source says the coefficient ideal is νa d⁻¹; it should be νa d with the preceding trace-dual exponent convention; affects a stated result.
- **Error** in lmfdb-mf.hilbert at the congruence-group definition, unpaginated (lmfdb-mf.hilbert line 95): the source says off-diagonal ideal membership and positive-unit determinant define the lattice stabilizer; it should also require integral diagonal entries; affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at the cusp indexing, unpaginated (lmfdb-mf.hilbert.q_expansion line 90): the source says cusps are indexed by the strict class group; it should distinguish component labels from the level-dependent cusps inside each component; affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at the expansion formula, unpaginated (lmfdb-mf.hilbert.q_expansion line 93): the source says a general Hilbert form has only positive Fourier terms; it should include its constant term, or assume cuspidality; affects a stated result.
- **Error** in lmfdb-mf.hilbert.q_expansion at the eigenvalue identification, unpaginated (lmfdb-mf.hilbert.q_expansion line 94): the source says an eigenform's Fourier coefficients equal its Hecke eigenvalues; it should require first-coefficient normalization and the specified ideal-coefficient normalization; affects a stated result.
- **Gap** in lmfdb-mf.hilbert.hecke_orbit at the orbit definition, unpaginated (lmfdb-mf.hilbert.hecke_orbit line 90): the source says the Hecke-generated subspace is the orbit without specifying the scalar field; it should specify rational Hecke span or describe coefficient conjugates, since complex eigenlines have dimension one; affects a stated result.
