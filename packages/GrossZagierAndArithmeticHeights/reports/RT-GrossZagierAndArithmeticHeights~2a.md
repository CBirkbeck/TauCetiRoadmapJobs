<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/147#issuecomment-6373972597 -->
Red team round 2 pass a (codex) of b5527a0

Verdict: needs_changes

1. **F01** (P1) Equal truncation spaces refute the outer-theta identity

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:1649 and :2265, “V0 ⊂ V1 ⊂ V” and “the sum equals the sum of its associated outer theta series”.

   **Claim:** The comparison holds without requiring the truncation space to be proper.

   **Witness:** Take F=ℚ, V₀=V₁=V=0, S=∅, standard Gaussian and finite-unit data. All dimensions are even. The pseudo-theta series is 0 (empty sum), automorphic; its outer theta at 1 is 1.

   **Exact repair text:** In §6.5 require “Either V₀=∅, or V₀ is a proper F-subspace of V₁; allow V₁=V.” Carry this condition into §§6.25, 6.40 and 6.49. Add the Check “V₀=V₁=V=0 is rejected: its empty sum is 0 and its outer theta is 1.” Properness also makes the Schwartz extension unique by density. The source's notation is ambiguous about strictness; its proof at yuan-zhang line 2088 drops the inner codimension-zero term, so this condition is essential.

2. **F02** (P3) ARGOS metadata describes a different book

   **Location:** packages/GrossZagierAndArithmeticHeights/sources.toml:496, “id = "argos"” and “title = "Néron Models"”.

   **Claim:** This record identifies the source used for the CM lift and intersection results in §§7.1–7.2.

   **Witness:** README:2822 cites Wewers, ARGOS Chapter 8, and Vollaard, Chapter 11. The manifest instead repeats the BLR title, authors, DOI and §7.5 locator already recorded at sources.toml:524.

   **Exact repair text:** Keep key argos and status uncertified; change title to “ARGOS seminar on intersections of modular correspondences”, authors to “ARGOS seminar contributors”, URL to the existing Bonn link in README:2822, and locator to “Meusers, Chapter 9 §2 Proposition 2.1, p.102, §3 Propositions 3.4–3.5, pp.104–105; Wewers, Chapter 8 §1 Theorem 1.4, p.79, §3 Theorem 3.2, p.84; Vollaard, Chapter 11 §2 Theorems 2.1 and 2.3, pp.114–115”. Set cited_for to [“7.1”, “7.2”]. Keep BLR's metadata only under blr. This repairs identity and indexing without reopening either settled access status.

3. **F03** (P1) Classical Gross–Zagier is already owned by an earlier sibling

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:4799 and :4865, “Gross–Zagier's route for c = 1, D odd, (D, N) = 1” and “Prove that L′(1, E, χ)”.

   **Claim:** This package owns the classical class-character and elliptic trace Gross–Zagier formulas afresh.

   **Witness:** TauCetiRoadmap/EffectiveClassNumbers/README.md:648, §2.8, explicitly owns both formulas with the same odd-discriminant, split-level hypotheses and constants. EffectiveClassNumbers precedes this package in the supplied merge order and cites no reverse dependency.

   **Exact repair text:** Add “EffectiveClassNumbers §2.8 supplies the odd-discriminant, conductor-one class-character formula and its elliptic trace specialization, including the quotient-polarization and relative-height comparisons. We import those statements; §§8.15 and 8.19 own their ring-conductor, even-discriminant and ramified-level extensions.” Replace the duplicated classical proof instructions with that import and retain only the additional generality. For c=1, D=−7 and split level, the imported coefficient is exactly 8π²(f,f)/(deg(f)√7), equal to the coefficient currently re-planned here. The more general quaternionic kernel targets remain owned here.

4. **F04** (P2) The BDP headline discards allowed ramified level primes

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:5278, “Heegner hypothesis in the strong form 'every prime of N splits'”.

   **Claim:** The weight-two BDP target is restricted to the all-split case, although the source and earlier geometric targets allow cyclic ramified level.

   **Witness:** bdp line 778 requires a cyclic norm-N ideal; bdp lines 4364–4370 retain that condition and finite local signs. For 37a1, K=ℚ(√−111), c=1, p=5, χ=1, 37 ramifies and a₃₇=−1.

   **Exact repair text:** Replace the strong split hypothesis by “There is a proper cyclic ideal 𝔑_c⊂O_c with O_c/𝔑_c≅ℤ/Nℤ; retain every finite local sign and finite-type condition of BDP Assumption 5.12.” Remove the assertion that those signs are automatic, and prove the ramified local specialization using §§4.4–4.7 and 9.4. Keep all-split level as a Check. The witness has O_K/𝔭₃₇≅𝔽₃₇, −111≡4 mod5, and nonsplit Steinberg a₃₇=−1, giving the required trivial-character ramified sign. Its reduction has 39 projective points, so a₃₇=38−39=−1. It is admitted after the repair, while an inert level prime remains excluded by the cyclic-ideal hypothesis.

5. **F05** (P2) Two local Green prerequisites are ordered circularly

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:3896, “C = 2κ_N − λ_N”; :3958, “the renormalized self-value of 7.82”.

   **Claim:** The marked and diagonal kernels are constructed before the constants and finite parts needed to construct them.

   **Witness:** §7.68 uses λ_N and its cusp normalization; §7.79 Needs §7.68. §7.71 uses the limit evaluated in §7.82; §7.82 Needs §7.71 (README:4105, :4141).

   **Exact repair text:** Prove §7.79 from the supplied Eisenstein continuation and §7.54 before §7.68; delete its dependency on §7.68. Prove §7.82 directly from the local Legendre-Q asymptotic and §7.20 before §7.71; delete its dependency on §7.71. Then list those earlier results in the corresponding kernel Needs lines. In the diagonal test s=1, the finite part is −log|2π(z−z̄)η(z)⁴|², since 2Γ′/Γ(1)−2Γ′/Γ(1)=0; it can and must be obtained without an already constructed global diagonal kernel. Likewise the four residues κ−κ−κ+κ=0 do not determine the still-free additive constant.

6. **F06** (P3) Proof-status narrative remains in the roadmap

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:2414, “original YZZ proof leaves remain open”; :5067, “Counterexample to the original p ≥ 5 dichotomy”.

   **Claim:** The roadmap describes a repair history and proof status instead of stating the mathematical proof obligations.

   **Witness:** Both phrases remain verbatim at this head. The second refers to a replaced assertion; the first describes unfinished proof leaves without naming them.

   **Exact repair text:** Replace the §6.51 outline by “Prove the Picard-valued modularity theorem of §6.20 and apply the degree-zero height functional; prove cuspidality using the vanishing constant terms.” Replace “Counterexample to the original p ≥ 5 dichotomy:” by “At p=5 there is a second valuation-zero case:”. The example still computes #E(F₅)=10, a₅=−4 and E₅=2.

7. **F07** (P3) The CM kernel definition points to a nonexistent section

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:3933, “τ_(𝒜ᵢ,𝔫) as in 2.16”.

   **Claim:** §2.16 defines the CM representatives used in the kernel.

   **Witness:** Layer 2 ends at §2.15, README:964. Its defining paragraph at :966 supplies exactly these τ_(A,𝔫), their discriminant and N-divisibility conditions.

   **Exact repair text:** Replace “as in 2.16” by “as in §2.15 (Gross–Zagier II §1, equations (1.4)–(1.5))”. For a class-number-one field there remains one representative and one class-pair summand; only the locator changes.

8. **F08** (P1) Small-ramification cotangent exactness has an earlier owner

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:4921, “small-ramification exactness is proved here”.

   **Claim:** §9.1 constructs cotangent exactness and saturation for the p-adic application from scratch.

   **Witness:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3798, §6.4d, SemistableQuotientCotangent, already states exact Lie and cotangent sequences with free cokernel for finite K/ℚ_p, e<p−1 and semistable middle variety, including good reduction.

   **Exact repair text:** “For finite K/ℚ_p, import NeronModelsAndSemistableAbelianVarieties §6.4d, SemistableQuotientCotangent; good reduction is a specialization. This target proves only the extension to the stated general mixed-characteristic DVRs and the separate coefficient-prime-optimal isogeny comparison of JSW Proposition 5.1.7.” Replace the duplicated finite-p-adic exactness proof and API ownership with that citation. The owner is earlier in the merge order and is a new roadmap absent from main. At R=ℤ₃ and J=B×A the imported cotangent sequence is the same split sequence with ranks dim A, dim A+dim B, dim B; p=2 remains outside e<p−1.

9. **F09** (P2) Two deep logarithm headlines are missing from the Lean omission list

   **Location:** packages/GrossZagierAndArithmeticHeights/Suggested.lean:11–16, the list ending “These headlines remain in the README”.

   **Claim:** The module identifies the roadmap's headlines that cannot yet be stated at the pins.

   **Witness:** README:4927 names the p-adic analytic subgroup theorem as an owned target; :5184 states algebraic-point eigenlogarithm nonvanishing. Neither is named in the module's omission list, and neither is its existing canonical-height theorem.

   **Exact repair text:** Add to the module docstring: “The p-adic analytic subgroup theorem (§9.2) lacks the algebraic-group logarithm, its domain and its Lie-algebra comparison. Eigenlogarithm nonvanishing for algebraic points of GL(2)-type abelian varieties (§9.13) lacks the endomorphism-eigendifferential and p-adic logarithm interfaces.” Do not add abstract-function stand-ins. The product point (x₁,0) in A₁×A₂ shows why the actual subgroup and endomorphism hypotheses must remain visible; a theorem about an arbitrary linear functional cannot express these headlines.

10. **F10** (P3) All classical-kernel Checks admit the wrong normalization

   **Location:** packages/GrossZagierAndArithmeticHeights/README.md:2112–2116, Checks for §6.31.

   **Claim:** Three discriminating Checks test the classical Rankin kernel construction.

   **Witness:** Replace every kernel K(θ) by 2K(θ). Its level is still N|D|, the N=1 trace still has source |D|, and K(0)=0 still holds. All three printed Checks pass.

   **Exact repair text:** Replace the three bullets by: “For the normalized weight-two newform of 37a1, D=−7 and s=2, the unnormalized trace kernel satisfies (f,K₂)=1369 L_A(f,3)/(32π³)≠0 by §6.41; doubling the kernel doubles this value.” “For N=37,D=−7,m=16, the pre-trace q¹¹² coefficient receives the n=3 Eisenstein term with theta index 1: r_A(1)e_s(3)=e_s(3); using n+l=112 incorrectly gives r_A(109)e_s(3)=2e_s(3) in the principal class.” “With the same nonzero inputs, replacing θ by 2θ doubles the kernel; replacing it by θ+θ′ adds the two kernels, with the trace normalization fixed by the first Check.” Here 109 is prime and splits in ℚ(√−7), giving two norm-109 ideals, whereas there is one norm-one ideal. At s=2 the Rankin Euler product at 3 converges absolutely and is nonzero. The first Check rejects 2K directly; the second tests the dilation; the third rejects nonlinear constructions.

## Earlier findings, verified against this head

Identifiers are pass-a/pass-b review numbers; the repair report labels them F01 onward separately for each pass. “Repaired” concerns the reported defect, not every assertion in its section. Quotations below are from the package, not from sources.

| Earlier finding | Disposition | Repaired passage and independently checked witness |
|---|---|---|
| a R01 / F01, inconsistent height pin | Repaired | README:25: “At the supplied Tau Ceti pin a91d3aaf canonicalHeight is h_x”. The manifest has a91d3aaf; TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:120 divides by 4ⁿ. Doubling gives 4h, half-polar diagonal h; rank-zero determinant is 1. |
| a R02 / F02, differential-lattice cycle | Repaired | README:1002: “Integral Whittaker and cusp-expansion bounds”; :1014 imports the normalized AL.2 newvector before :1016's lattice argument. §3.8 now consumes §3.1. The exceptional odd-prime exponent at a=2,b=1 is −1/2, not 0. New Green cycles are separate S05. |
| a R03 / F03, bounded-support convergence | Repaired | README:1651: “require … C(1+\|log dist_v(x,V₀)\|)^m”. At p=2,n=2,3 the rejected shell summands have logarithms 155.469… and 3693.876…; polynomial n-growth times exp(−2πp^(2n)) tends to 0. S01 records a different boundary defect. |
| a R04 / F04, maximal-level input used at general level | Repaired as specification; book proof uncertified | README:3539: “four targets use (D), with its deep principal U_v at S₁”. The four targets explicitly include common ramification and omitted diagonals. At q=2 principal level has six GL₂(𝔽₂) cosets, rather than one. The public maximal-level calculation is no longer claimed to prove it. |
| a R05 / F05, globally finite place sum | Repaired | README:2482: “For each fixed nonzero Fourier index only finitely many places contribute”. At inert primes 3 and 7 in ℚ(i), local terms are log3 and log7; their arithmetic partners cancel them. Only the difference has fixed finite support. |
| a R06 / F06, missing dyadic constants | Repaired | README:5089: “including even discriminant”. CST Propositions 3.11–3.12 and Lemma 3.13, cst lines 1645, 1710, 2009, give products (1/2)·2=1 and (2/3)(3/2)·2=2 for d=2,n=0,1. For d=3,n=0, (2√2)⁻¹·2√2=1. |
| a R07 / F07, absent supplier interfaces | Repaired/settled conditional contracts | README:85–88 names all four gap slugs; design/plan.json has the same four suppliers and slugs. The nonelliptic point contract excludes the supplied elliptic §4.26 case. P4.1–P4.3 exists at the supplied AbelianSchemesAndArithmeticModuliPartII head. No re-raise of the settled absence of these four inputs. |
| a R08 / F08, duplicate semistable integration | Repaired | README:5004: “use the harmonic semistable integral of ColemanIntegrationPartII”. The supplied §§4.2–4.3,7.2,7.4,7.7 own general integration. At z=q the Tate correction is log(q)−ord(q)log(q)/ord(q)=0; only p-new relations and cusp normalization remain here. |
| a R09 / F09, omitted rational-height headline | Repaired | README:298 and Suggested.lean:32 state canonicalHeightRat_exists_unique. The supplied elaborated type retains Field, AdmissibleAbsValues, DecidableEq and IsElliptic. For x=(1/n)⊗P, n²q(x)=h_x(P); uniqueness follows since n≠0. |
| a R10 / F10, copied source announcement | Repaired | README:1776: “with the Euler factors at p\|N omitted”. The source announcement and internal bibliography number are gone; gz86 lines 194–200 identify the actual Euler convention. N=1 gives an empty removed-factor product 1. |
| a R11 / F11, source manifest absent | Partly repaired | sources.toml contains 35 records with the settled statuses. Its argos record identifies BLR instead of ARGOS, S02. The two YZZ edition keys retain their explicitly mandated waivers. |
| a R12 / F12, weak character examples and light adapters | Repaired | README:4693: “its cyclic shift is 4 times that vector”. In 𝔽₇, shift(1,2,4)=(4,1,2)=4(1,2,4), whereas 2(1,2,4)=(2,4,1). C₂ averaging changes norm 2 to 1/2. Lightweight Lean declarations were deleted. |
| a R13 / F13, imprimitive-series Checks | Repaired | README:5245: “With F=1+T and a singleton factor 1−T, the result is 1−T²”. Empty product gives F; two factors (1−T)(1+T)=1−T²; a zero factor gives 0. |
| a R14 / F14, zero ideal assigned a class | Repaired | README:3805 and :4019 condition the class assertion on α≠0. At D=−7,N=1, inert p=3,q=23,b=j, α=0 and 0+3·161=483=69·7. There is no class of (0); the endpoint uses r_A(0)=1/2. |
| a R15 / F15, lost norm-ideal valuation | Repaired | README:3805: “− ord_p(N𝔞)”. At 𝔞=(7),b=7(1+j), v₇(N𝔠′)=v₇(14)=1, while v₇(DN(b₋))−v₇(N𝔞)=3−2=1. |
| a R16 / F16, Skinner edition mismatch | Repaired | README:5258 identifies “Published §2.6, p.342”; :5410 distinguishes preprint pages. skinner-published lines 556–558 explicitly give O^ur[[Γ]], matching §§9.15,9.21. Some other citations explicitly retain the preprint page numbers, rather than pretending they are published pages. |
| b R01 / F01, characteristic-three Lean example | Repaired | The example is absent from the 39-line file. README:4541 keeps the mathematical control: in the trivial C₃ representation over 𝔽₃, average(1)=0 but fixed vector 1≠0. No failed instance construction remains. |
| b R02 / F02, one-simp admitted identities | Repaired | Suggested.lean contains only the rational-height theorem; both algebra adapters were deleted. README:4519 retains the inverse-square identity; when #G=0 in the field both averages and their paired value are 0. |
| b R03 / F03, source-internal numbered references | Repaired | README:908 cites GZ I §4 (4.3); :3103 cites II §5 (5.1); :3393 cites II §5 (5.2); :3780 cites III §9 (9.3). The reported dangling bibliography numbers are gone. The N=1 weight-two cusp space is 0. |
| b R04 / F04, “directly read erratum” narrative | Repaired | Both phrases are absent; item-specific erratum citations remain, e.g. README:4745 “Erratum items 1 and 16”. A separate residual process sentence is recorded in S06. |


## Verified sound

Read the complete 5,425-line README and 39-line Suggested.lean, both repository rule files, both prior reviews and the repair report. The inventory contains **292 numbered targets plus 17 explicitly bold mathematical subtargets**, with a separate computed row for each below. All **423 explicit Check bullets** were read. **45 explicit Checks** were re-evaluated in §§0.2, 6.31, 6.33, the general-level prerequisites of §7.47, and §§9.1–9.4; the target ledger records additional boundary and normalization computations. A ledger control is a test of the stated instance, not a proof of the general theorem. Zero-data controls are identified as such rather than presented as discrimination of normalization.

There is **one actual Lean declaration**, not two: the supplied signature extractor also treated “theorem that” in the module docstring as a declaration named “that”. Its resulting unknown-identifier message concerns that extraction error. The actual theorem's supplied elaborated signature retains all five structure/hypothesis binders. No Lean command was run, consistently with the read-only/no-build instruction.

| Declaration and section | Variables and instances in the elaborated signature | Computed tests | Result |
|---|---|---|---|
| Suggested.lean:32, canonicalHeightRat_exists_unique, Layer 0 / README §0.2 | K : Type u; Field K; Height.AdmissibleAbsValues K; DecidableEq K; W : WeierstrassCurve.Affine K; W.toAffine.IsElliptic; result ∃! q : QuadraticMap ℚ (ℚ⊗[ℤ]W.Point) ℝ, ∀P, q(1⊗P)=canonicalHeight(P) | q((1/2)⊗P)=h(P)/4; torsion tensor=0 and height=0; finite fields of characteristic 2 and 3 have finite point groups, so rational tensor=0 and unique q=0; two extensions differ by n²(q−q′)(P/n)=0, with n≠0 | No lost binder, no false signature, no sorry'd data, and no one-tactic padding found. |

The pinned height definition is the x-height limit divided by 4ⁿ, in TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:119–120. The integral quadratic map is at :341, its value comparison at :350, the half-polar pairing at :368 and its diagonal comparison at :384. Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127 supplies scalar base change for an R-valued quadratic form; it does not directly extend this ℤ-quadratic map with ℝ-valued output. Thus the retained rational-extension theorem is not merely a restatement of that declaration. The zero ring is excluded by Field, and noncommutative test groups such as S₃ are excluded by the native commutative elliptic point group. These are domain exclusions, not silently assumed extra hypotheses.

The headline inventory is: rational canonical-height extension (§0.2); Poincaré/polarization and Faltings–Hriljac comparisons (§§1.1–1.3, 2.12); projected arithmetic kernel identity (§8.1); classical and quaternionic Gross–Zagier formulas (§§8.6, 8.11, 8.14–8.19); algebraic-point subgroup and eigenlogarithm theorems (§§9.2, 9.13); CM-root interpolation and anticyclotomic special-value comparisons (§§9.4, 9.11–9.17, 9.21–9.22). Only the rational height headline has its necessary interfaces at the pins. The omission list accounts for the other groups except S09. Tau Ceti already has the native AbelianVariety carrier (AlgebraicGeometry/AbelianVariety/Basic.lean:95); it is the logarithm/eigendifferential interfaces, not the bare abelian-variety structure, that are missing for those logarithm headlines.

Ownership searches covered the objects in main and Completed, the board packages, the 26 supplied sibling heads, and the roadmap-tool index. The two concrete duplicated owners are S03 and S08. No duplicate fully qualified name of the single Lean theorem was found. General semistable integration is correctly imported from ColemanIntegrationPartII. This package can own the CM-specific level comparisons, local intersection/analytic comparisons and genuinely more general height formulas; the existence of a generic group, curve or theta supplier alone does not duplicate those comparisons.

The following **25 current supplier section/declaration checks** were resolved explicitly. The seven entries that the provided resolver classified as missing library names are roadmap targets, not pinned declarations.

| Count | Supplier citation | Witness and compatibility |
|---:|---|---|
| 2 | ShimuraVarieties §4, CanonicalModel.special_rational and special_action | README:1066–1067 supplies rationality and the reciprocity action; geometric/arithmetic inversion must still be transported by this package's §0a.4. |
| 1 | AbelianSchemesAndArithmeticModuli A4, SerreTate.homCriterion | README:2303 gives the ordinary Hom-lifting criterion, so the package's CM chart may specialize it. |
| 4 | ComplexMultiplicationAndExplicitReciprocity, idealAction.picardEquiv, degree_eq_norm, idealLatticeCurve.automorphism_factors, classPolynomial.ringClassField | README:353, :399, :357, :652 respectively; proper ideal action, degree and extra-unit factors are supplied. |
| 5 | ColemanIntegrationPartII §§4.2,4.3,7.2,7.4,7.7 | README:761, :782, :1109, :1149, :1222: smooth residue comparison, annular valuation term, proper holomorphic integral, divisor evaluation, Tate correction. At q=p³, log(p)=1 the correction is −v_p(z), not a constant on the annulus. |
| 3 | AbelianSchemesAndArithmeticModuliPartII P4.1–P4.3 | README:885, :898, :938: ordinary completion, projected connection and torsion translation. The integral torsion condition and generic-fibre connection qualification are retained by the supplier; a moduli deformation is an additional construction here. |
| 3 | ClassFieldTheory Layers 11–13 | README:1699–1711, :1742, :1848–1858: arithmetic Artin, order-reversing correspondence and quadratic-order ring-class field. The package's imaginary quadratic input satisfies the dimension-two restriction. |
| 1 | GlobalNumberFields Layer 11 | README:565–612: order, invertible proper ideal classes and extension map. c=d gives the identity map, not a new field construction. |
| 2 | PadicMeasuresIwasawaAlgebras §§2.1,2.5 | README:1148 and :1477–1500; bounded inverse Amice transform over complete ultrametric coefficient rings. Infinite residue fields are not excluded. |
| 2 | NewtonPolygons §§6.3–6.4 | README:901–963; complete-DVR preparation and open-disc zero count. Nonzero ϖ²(T+ϖ)³ has μ=2, λ=3 even with infinite residue field. |
| 1 | EffectiveClassNumbers §2.8 | README:648, the existing classical Gross–Zagier owner; S03. |
| 1 | NeronModelsAndSemistableAbelianVarieties §6.4d | README:3798–3808, the existing cotangent exactness owner; S08. |

All four declared gap slugs occur both in design/plan.json and the README's Exact supplier contracts. Their named owners are earlier suppliers; none is “none”. The skeleton, ideal-zeta/genus, nonelliptic point Kummer/logarithm, and normalized E₂-family contracts are accepted as conditional inputs. The elliptic logarithm comparison is explicitly separated from the nonelliptic gap. Their present absence is not a finding and does not reopen earlier settled aF07.

The read-only dependency command returned exit status 0:

```text
depcheck: 27 roadmaps, 262 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This package-level result does not resolve the within-roadmap cycles of S05. The reviewed commit remains b5527a0293e27a92e7049b13ea1c53075d4c49a8; the tracked working tree matches it. The pinned revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The origin/main...HEAD diff has seven changed files, all inside packages/GrossZagierAndArithmeticHeights. The review adds only this report. No builds, git writes or external posts were made.

The single Mathlib import, individual existing Tau Ceti import, namespace, theorem syntax and absence of set_option, admitted data and computational algorithms satisfy those checks. No unconditional nonzero denominator is inferred from a zero pairing. In particular §§8.11–8.12 retain the zero toric-Hom case as 0=0; §§8.16 and 9.18 explicitly require the denominators they use.

**Source audit.** The following **50 locator groups** were independently reopened against the provided legal extractions. Counts are groups of related theorem/equation locators, not a claim that every page of a cited book was inspected. All 35 manifest records and their access statuses were inspected.

| Groups | Source and locator | Extraction witness / result |
|---:|---|---|
| 1 | muller-stoll Remark 3.1 | muller-stoll lines 143–165: x-height versus half-height convention. |
| 1 | gross84 I §4 | gross84 lines 110–130: arithmetic Artin and inverse ideal action. |
| 1 | conrad-trace §9, (9.8)–(9.9), Remark 9.9, Theorem 9.10 | conrad-trace lines 1612–1657: relative field factor, adjointness and polarization. |
| 2 | cns Theorems 3.14 and 3.15 | cns lines 1010–1070: odd residue characteristic general local field versus ℚ₂ restriction. |
| 3 | jsw §5.1 conventions/Remark 5.1.1; Propositions 5.1.6 and 5.1.7 | jsw lines 1298–1330, 1357–1423: measure, square and quotient normalization; source slips listed below. |
| 1 | fuchs-pham Theorem 2.2 | fuchs-pham lines 65–92: algebraic point, nonzero logarithm and positive-dimensional subgroup. |
| 3 | bsw Theorem 1.1; Theorem 2.8(i); Theorems 3.1–3.2 | bsw lines 105–137, 250–285, 420–452: real embedding and dimension conditions, character restriction, connected multiple. |
| 1 | prasanna Theorem 2.4 | prasanna lines 484–510: prime exclusions and primitive rational lattice. |
| 3 | cst Propositions 3.11,3.12 and Lemma 3.13 | cst lines 1635–1754, 2000–2034: dyadic norm/test-vector/measure constants. |
| 3 | bdp Assumption 1.9; Assumption 5.12; Theorem 5.13 | bdp lines 766–796, 4358–4425: cyclic ideal, finite signs and special-value formula; S04. |
| 7 | gz86 II (3.5), II (5.6), III (9.3), III (9.5)–(9.7), III (9.8)–(9.10), IV completed zero coefficient, V (1.3) | gz86 lines 754–778, 1003–1019, 1585–1661, 2256–2258, 3245–3268. The package's expanded §6.63 coefficient retains both powers of y and agrees with its completion; it is not a defect. |
| 3 | yuan-zhang §6.2; Lemma 6.1; proof of Theorem 7.2 | yuan-zhang lines 1906–1944, 2078–2105, 2520–2538. Package §6.61 correctly adds [F:ℚ](γ+log4π); its gamma derivative cancels that term. S01 concerns a different boundary case. |
| 1 | brooks Propositions 8.12–8.13 and preceding transition | brooks lines 2096–2115: source square, point label/domain and descent issues below. |
| 2 | skinner-published §2.6 coefficient ring; comparison constants | skinner-published lines 535–565, 586–603: published O^ur and the period-dependent phase comparison. |

| 1 | lmfdb 37.a1 BSD invariants | lmfdb lines 355–368: regulator 0.05111140823996884… and full real period 5.986917292463919…; no live-data claim made. |
| 1 | conrad Theorem 9.2 | conrad lines 2506–2534: half new-automorphism count plus the tensor correction, including exceptional CM and level primes. |
| 1 | zhang-survey Theorem 4.3.1 | zhang-survey lines 773–777: rank-one conclusions retain the first-derivative hypothesis; not used to prove the height formula circularly. |
| 1 | yzz-erratum-pku items 62–63 | yzz-erratum-pku lines 279–295: weak Green correction and missing gamma ratio. |
| 1 | jetchev §1 | jetchev lines 22–39: cyclic ideal, cusp-normalized trace point and Manin factor. |
| 2 | dit Theorem 4 and (5.17) | dit lines 665–717: sign ambiguity in the vector; package §5.2 correctly uses phase-invariant coefficient norms and the 12π normalization. |
| 1 | gqt §1.7 | gqt lines 137–151: convergent and first-term ranges; split ternary (m,r,n)=(3,1,1) fails m−r>n+1 because 2>2 is false. |
| 2 | yuan-bigness-pku §§A.1,A.6 | yuan-bigness-pku lines 3445–3485, 4011–4033: probability normalization, real descent and general valuation fields; missing degree in the source equation is listed below. |
| 1 | waldspurger II.1 Theorem 1 | waldspurger lines 442–448: theta image vanishes outside JL and gives the tensor image inside; the package owns the additional scalar comparison. |
| 1 | edixhoven Theorem 1.1.4.1 | edixhoven lines 169–176: noetherian regular local ring and tame stabilizer hypotheses; not an all-prime smoothness statement. |
| 1 | castella-hsieh Proposition 3.8 | castella-hsieh lines 678–686: (Heeg′),(ST), conductor and the squared root interpolation. |
| 1 | castella-exceptional Proposition 2.7 | castella-exceptional lines 604–611: p-new primitive and weight-two cusp normalization. |
| 1 | castella-multiplicative Theorem 3.2 | castella-multiplicative lines 431–447: ε_p=0 at p∣N; the Euler factor is 1−a_p/p. |
| 1 | burungale Lemma 5.5 and (5.8) | burungale lines 1039–1055: local expansion and finite weighted measure sum. |
| 1 | yuan-modular Theorem 4.3 / Remark 4.4 | yuan-modular lines 2729–2745, 2808–2815: all four Hodge terms and the extra −[F:ℚ]E*/2 term. |
| 1 | disegni Proposition 8.3.1 | disegni lines 2825–2839: general-level Schwartz kernels with §§6.1,6.2.2 assumptions; reduced q-expansion statement, not an unrestricted scalar identity. |

**Computed target ledger.** Each numbered row refers to packages/GrossZagierAndArithmeticHeights/README.md at the indicated line, including its standing blocks, defining formula, APIs and Checks. A result is limited to the instances written. The 17 bold subtargets follow separately. The seven standing blocks are tested after them. “Conditional” means that the source or supplier theorem remains an input, not that a zero computation certifies it.

| Target and location | Instances | Computed values | Result / required change |
|---|---|---|---|
| §0a.1 Ring-class tower comparisons (:141) | c=d=e=1; order-three Artin element | tower maps compose id∘id=id; a↦a⁻¹ sends order-three generator to its square, not itself | Identity and inverse conventions agree |
| §0a.2 The Heegner cyclic-isogeny pair at every quadratic discriminant (:162) | Gaussian norm-5 and Eisenstein norm-7 pairs; N=1 | indices N(2+i)=5, N(3+ζ₃)=7; N=1 kernel has one element; automorphism counts 4,6 | Cyclic index and extra units retained |
| §0a.3 Optimal embeddings and the cyclic-level dictionary (:185) | N=1; primitive versus doubled lattice basis | End-preserving integral multiplication gives R₀(1)=M₂(ℤ); doubled primitive coefficients have gcd 2≠1 | Primitive condition necessary |
| §0a.4 Quaternionic CM points, levels and canonical-model descent (:205) | U′=U; arithmetic Artin of order 3 | level map id; action exponent −1=2 mod3; definite B has zero split real places, so no curve domain | Domain and inversion controls agree |
| §0a.5 From CM moduli points to level triples (:233) | identity isogeny; differential scaled by 2 | degree 1, pullback ω=ω; weight-two value scales 1/4 while period-square scales 4 | Product 1 unchanged |
| §0.1 The dictionary of height conventions (:269) | P=0,2P; ranks 0,1 | h(0)=0; h(2P)=4h(P); half-polar diagonal (4h−2h)/2=h; empty determinant 1 | Old aR01 repaired |
| §0.2 The canonical height on E(K) ⊗ ℚ (:294) | P/2; torsion P; two extensions | q(P/2)=h(P)/4; torsion value 0; n²(q−q′)(P/n)=0 ⇒ q=q′ | One native Lean headline |
| §0.3 The motivic centre s = 1 and the unitary centre s = 1/2 (:322) | L(s)=s−1, N=1,4 | L′(1)=1; completed derivatives 1/π,2/π; half-gamma convention 1/(2π),1/π | Factor 2 discriminated |
| §0.4 The unit index u (:338) | D=−3,−4,−7 | unit counts 6,4,2; half-counts 3,2,1; 2u=w in each | Extra-unit cases retained |
| §0.5 The Artin-map convention and the Galois action on Heegner points (:367) | class generator a of order 3 | Art(a)P₁=P_(a²); Art(a)³P₁=P₁; forward indexing would give P_a | Inverse action discriminated |
| §0.6 Full real period, identity-component period and c∞ (:390) | positive/negative real discriminant | two components give Ω=2Ω⁰; one component Ω=Ω⁰; ratio c∞=2,1 | No universal factor 2 |
| §0.7 Base-change signs and measure comparison (:404) | torus volume v=3; two averages; η_v(−1)=−1 | mass of 1 is 3 versus 1; double factor 9 versus 1; ε_RS=−ε_BC | Measure and local-sign distinctions retained |
| §0.8 Genus-character factorization (:427) | trivial genus character, D=−7 | factors D₁=1,D₂=−7; ζ_K(s)=ζ(s)L(s,χ_−7); at a split prime coefficient 2=1+1 | Conditional on declared genus gap |
| §0.9 Trace versus normalised average of a Galois orbit (:439) | C₂, orbit vectors (1,0),(0,1) | sum (1,1), average (1/2,1/2); dot-product norms 2 and 1/2 | Factor h⁻²=1/4 |
| §0.10 Rescaling height and period identities (:453) | height scaled by 2; rank 0,1,2 | Gram determinants multiply 1,2,4; reciprocal formula constant divides by 2 | Scalar directions agree |
| §0.11 Relative-field height comparison (:467) | extension degree 2; zero point | h_L(P)=2h_K(P); at P=0 both 0; absolute heights h_L/[L:ℚ]=h_K/[K:ℚ] | Relative/absolute separated |
| §0.12 CM action convention comparison (:479) | order-three ideal class | two Artin conventions act a versus a²; composing the inverse twice returns a | Conversion not invisible as in C₂ |
| §1.1 Poincaré height pairing (:509) | L=(O) on elliptic E; x=0 and x=y=P | h𝒫(0,y)=0; h𝒫(P,φ_LP)=h_L(2P)−2h_L(P)=2h_L(P) | Full polarization |
| §1.2 Endomorphism-field height pairing (:537) | M=ℚ(√5); dual basis | Tr(1·1/2)=1, Tr(√5·√5/10)=1; crossed traces 0 | Trace-dual normalization excludes unscaled trace |
| §1.3 Elliptic Poincaré comparison (:567) | elliptic divisor (O), P=P | φ_(O)(P)=[−P]−[O]; pairing h𝒫(P,φP)=h_x(P), not h_x(P)/2 | Sign follows pullback convention |
| §1.4 Character-component height pairing (:581) | C₃ over ℂ, characters ζ,ζ² | paired eigenvalues multiply ζ·ζ²=1; pairing two ζ-eigenvectors forces (ζ²−1)B=0, hence B=0 | Inverse components necessary |
| §1.5 Rational Galois descent of Mordell–Weil spaces (:608) | C₂ descent after rationalization | average (x+σx)/2 is fixed; on fixed x gives x; on anti-fixed x gives 0 | Integral descent not asserted |
| §2.1 Global arithmetic intersection on curves (:633) | principal divisor of a unit; extension degree 2 | log-product sum 0; arithmetic degree doubles 2d; principal class intersects to 0 | Proper/flat geometric hypotheses retained |
| §2.2 Arakelov probability form (:661) | genus 1 and genus 0 | normalized one-form integral gives mass 1; denominator 2g is 2 or 0, so g=0 excluded | Probability normalization tested |
| §2.3 Arithmetic normalization of the admissible skeleton measure (:688) | single genus-one loop of length L; bridge | edge density 1/L, integrated mass 1; bridge density 1/∞=0 | Conditional on declared skeleton gap |
| §2.4 Archimedean admissible metric (:707) | D=0; metric multiplied by exp(−c) | curvature 0; Green shift g↦g+c leaves ddᶜg fixed but changes mean by c | Mean excludes constant ambiguity |
| §2.5 Local intersection height comparison (:734) | disjoint integral sections; one transverse meeting over 𝔽₃ | intersection length 0 or 1 gives 0 or log3 | Local logarithmic weight necessary |
| §2.6 Degree-weighted admissible Green function (:746) | degree d=2 versus d=0 | integrated Green equation d−d=0; degree weighting 2μ versus 0μ | Unweighted probability term fails at d=0 |
| §2.7 Complex admissible metric existence (:773) | D=0; shifted solution g+c | normalized solution 0; mean(g+c)=c while mean(g)=0 | Uniqueness requires normalization |
| §2.8 Normalized Arakelov Green function (:787) | symmetric kernel; added constant 1 | symmetry unchanged; mean shifts 0→1 | Zero mean excludes wrong constant |
| §2.9 Admissible arithmetic extension (:814) | zero divisor and degree-zero model correction | extension 0 has zero curvature/intersections; adding full fibre preserves vertical intersections but normalization changes | Boundary controls only; general model construction not proved |
| §2.10 Arakelov dualizing metric (:846) | genus 1 and genus 2 | deg ω=0,2; dividing by 2g−2 gives division by 0 at g=1 and 1/2 at g=2 | Genus-one branch essential |
| §2.11 Squared-norm complex height symbol (:873) | principal f scaled by 2 | log\|2f\|²−log\|f\|²=2log2, not log2 | Squared-norm convention discriminated |
| §2.12 Faltings–Hriljac comparison (:898) | D=0; D multiplied by 2 | intersection and canonical self-height 0; both scale by 4 | Sign normalized by principal and elliptic comparison |
| §2.13 Admissible metrics at real places (:912) | complex conjugation; real norm scaled by 2 | conjugate \|z\|²=\|z\|²; scaling norm changes squared log by 2log2 | Conjugation invariance required |
| §2.14 Residue-normalized adjunction line (:939) | local parameter z; replacement 2z | residue dz/z=1; d(2z)/(2z)=dz/z | Residue normalization excludes scalar multiple 2 |
| §2.15 Archimedean CM height sum (:964) | zero degree-zero divisor; field extension degree 2 | local sum 0; relative global sum doubles, matching 2h | Boundary control; actual CM value requires source formula |
| §3.1 Integral modular differential lattices at bad primes (:1000) | odd p cusp a=2,b=1; dyadic a=4,b=2 | bound −1/2 in exceptional odd case; dyadic improvement 1 versus generic 0 | Repaired ordering; local inputs explicit |
| §3.2 Normalized Hodge class (:1036) | degree d>0; formal d=0 | normalized ξ has degree d/d=1; d=0 produces forbidden normalization | Positive component degrees retained |
| §3.3 Rational ξ-normalized realization (:1065) | clear denominator m=2; m=1 | map P↦2[P]−2ξ has degree 2−2=0; m=1 gives [P]−ξ | Rational class differs from a chosen integral map |
| §3.4 Strict GL₂ realization and transfer (:1095) | strict GL₂ dimension g=1,2 | [M:ℚ]=g gives Tate dimension 2g=2,4; arbitrary larger endomorphism algebra not assumed a field | Dimension conditions retained |
| §3.5 Manin constant (:1111) | parametrization f versus [2]∘f | pullback differential scalar C→2C; degree d→4d | Nonzero rational C, integrality separate |
| §3.6 Volume-normalized composition pairing (:1138) | identity map; multiplying one morphism by 2 | composition id; normalized pairing 1/vol; linear scaling 2/vol | Volume not silently set to 1 |
| §3.7 Integral Manin constant and p-unit range (:1168) | optimal good prime versus nonoptimal [p]∘f | C→pC, valuation increases by 1 | Optimality/p-unit hypotheses indispensable |
| §3.8 Manin constant and modular degree (:1182) | source degree-5, Manin-5 example | 5 divides 5 and 6·5=30 | Divisibility compatible with nonunit Manin constant |
| §3.9 Petersson and modular-degree comparison (:1196) | [2]∘f | degree×norm²/C² changes 4/4=1; both Petersson sides unchanged | Degree and differential scaling agree |
| §3.10 Manin isogeny and twist transfer (:1210) | isogeny degree d; differential scalar cψ | h(ψP)=dh(P); norm quotient changes cψ²/d, so displayed formula remains invariant | Distinguishes degree from differential scalar |
| §3.11 Eigendifferential period comparison (:1224) | ω=2πif dz | iω∧ω̄=8π²\|f\|²dxdy; missing factor 2 would give 4π²\|f\|² | Period factor computed |
| §3.12 Modular period-degree comparison (:1236) | C=1 versus C=2, fixed degree | period-degree quotient divided by C² gives factor 1 versus 1/4 | Same normalization as §3.9 |
| §3.13 Quadratic-twist real-period comparison (:1248) | quadratic twist scale √d | differential period scale 1/√\|d\| before minimal-model factor; d=1 gives factor 1 | Integral minimal-differential correction retained |
| §4.1 Local toric functional space (:1271) | central element z with ω(z)χ(z)=−1 | equivariance forces ℓ=−ℓ, hence ℓ=0 over ℂ | Central obstruction, not arbitrary eigenline |
| §4.2 Saito–Tunnell dichotomy (:1298) | two quaternion algebras at one place | toric dimensions (1,0) or (0,1); sum 1; never (1,1) | Local root-number convention determines side |
| §4.3 Normalized local toric form (:1312) | pairing b scaled by 2; b(f,g)=0 | unnormalized toric form scales 2; quotient cancels 2/2=1; zero denominator excluded | No 0/0 definition |
| §4.4 Admissible toric order (:1340) | wrong intersection order O_(c+1) | same discriminant can coexist with intersection O_(c+1)≠O_c | Optimal-intersection/orientation conditions discriminate |
| §4.5 Unramified toric value and finite product (:1367) | unramified spherical vectors; zero input | normalized factor 1; bilinear zero input gives 0 | Finite exceptional set separate from zero vector |
| §4.6 Nonzero toric test vectors (:1381) | test vector f versus 2f and 0 | linear toric functional ℓ(2f)=2ℓ(f)≠0; ℓ(0)=0 | Nonzero vector hypothesis retained |
| §4.7 Explicit local toric constants at test vectors (:1395) | dyadic ramified d=2,n=0,1 | normalized products 1 and 2; d=3,n=0 also 1 | Verified against cst lines 1645,1710,2009 |
| §5.1 Coherent quaternionic theta specialization (:1425) | zero Schwartz function; scaling φ by 2 | theta and corresponding lift 0; scaling gives 2θ | Boundary test only; split (3,1) separately targeted |
| §5.2 Half-weight Waldspurger value (:1448) | half-weight form multiplied by 2 | squared coefficient and Petersson norm both ×4, ratio unchanged | No signed square-root identification |
| §5.3 Waldspurger period formula (:1471) | one toric functional zero; two nonzero scalar factors 2,3 | zero product 0; bilinear period product scales 6 | No denominator at vanishing pairings |
| §5.4 Toric period nonvanishing criterion (:1485) | local toric Hom dimension 0; all local dimensions 1 | global period forced 0 in first case; no implication for arbitrary chosen vectors in second | Existential test vectors distinguished |
| §5.5 Finite test-vector variation (:1499) | one local vector multiplied by 2 | raw toric integral and pairing both ×2; normalized ratio unchanged | Local Haar scale cancels |
| §5.6 Petersson pairing as a product of local Whittaker pairings (:1513) | weight 2 archimedean Whittaker W=y exp(−2πy) | ∫₀∞y exp(−4πy)dy=1/(16π²); doubled ±y contribution 1/(8π²) | Archimedean factor-of-two retained |
| §6.1 Petersson projectors and their growth domains (:1544) | S=0; H∈S; H orthogonal to S | projection 0; ΠH=H; ΠH=0 respectively | Finite-dimensional pairing, not holomorphy of H |
| §6.2 The classical V-kernel, terminating polynomials and decay (:1569) | t=3, n=0,1,2; (k,r)=(2,0),(3,2) | Laguerre values 1,−2,−1/2; kernel values 9/8,−1/2 | Factorials and terminating ranges tested |
| §6.3 Special correspondence cycle (:1593) | identity correspondence; generic map degree 3 | cycle diagonal with coefficient 1; pushforward coefficient 3, reduced image coefficient 1 | Reduced image is wrong model |
| §6.4 ξ-normalized CM divisor (:1620) | point on same versus other component as ξ | degree vector 1−1=0; on two different components (1,−1)≠0 | Componentwise subtraction essential |
| §6.5 Pseudo-theta datum (:1647) | V₀=V₁=V=0; shell p=2,n=2 | empty pseudo-theta 0, outer theta 1; log shell term 256−32π=155.469… | S01; growth repair separately survives |
| §6.6 Mixed theta–Eisenstein kernel (:1674) | centre s=0; one tensor factor zero | I(0)=0; θ·0=0=I(s,φ₁⊗0) | Incoherence and linearity controls |
| §6.7 Normalized local Whittaker terms (:1699) | φ=0; g=1 with normalized φ(0,u)=1 | W°₀(0)=0 or 1 respectively; δ(1)=1 | Zero/nonzero Whittaker terms distinguished |
| §6.8 Finite CM orbit average (:1724) | orbit cardinality 2; function identically 1 | average (1+1)/2=1, sum 2; extra unit factor e remains separate | Probability definition discriminated |
| §6.9 Two auxiliary split places (:1749) | two vanishing local factors versus one | d(s²)/ds at0=0; d(s)/ds at0=1 | Two auxiliary places necessary |
| §6.10 Ideal-class Rankin series (:1774) | N=1; k=1 and k=2 | removed Euler product empty=1; exponents 1−2s and 3−2s | Old copied announcement removed |
| §6.11 Hecke height-series cuspidality (:1800) | N=1; c=0 | S₂(SL₂ℤ)=0, height series 0; all pairings ⟨0,T_m0⟩=0 | Boundary handled separately |
| §6.12 Classical trace adjunction (:1812) | M=N; scalar g→2g | trace id, both pairings equal; both multiply 2 | Unnormalized trace, no index division |
| §6.13 Prime-to-level newform detection (:1824) | difference g(2z) at level divisible by 2 | all odd coefficients 0; newform pairing 0 | Prime-to-level coefficients detect only new projection |
| §6.14 Classical Eisenstein transformation (:1836) | γ=id, D₁=1 | δ₁=1, ε₁=1; transformed series E_s(z)=E_s(z) | Identity case; transformation generality retained |
| §6.15 Ramified theta reindexing (:1848) | D₁=1, δ₁=1 | U₁=id; reindexing norm n by δ₂ gives n/δ₂ then n | Identity/ramified divisibility control |
| §6.16 Rankin genus-sign function (:1860) | D=−7,N=1,n=7,d=1,7 | ε(7,1)=1; ε(7,7)=χ_−7(−1)=−1 | Divisor reversal sign visible |
| §6.17 Different ideal reindexing (:1886) | D=−7, A=1, m=0,1 | r(0)=1/2 on both sides; r(7)=r(1)=1 | Zero endpoint convention retained |
| §6.18 Eisenstein Mellin asymptotics (:1898) | m=1,s=0 in first Mellin limit | ∫−24e^(−4πy)dy=−6/π; formula −6σ₁(1)/π=−6/π | Exponential normalization tested |
| §6.19 Cusp constant matrix inverse (:1910) | N=1 and N=2 | C₁=(1); C₂=[[1,1/4],[1,1]], inverse [[4,−1],[−4,4]]/3; product I₂ | ν=0 exception necessary |
| §6.20 Picard-valued generating series (:1922) | Φ=0; Φ→2Φ | all cycle coefficients 0; constant and nonconstant terms both ×2 | Boundary/linearity only; modularity requires owned target |
| §6.21 Special test function and integral j (:1949) | residue q=2; bad-place special coefficient | 1+q+q²=7, so subtraction coefficient 1/7 | No replacement by 1/(q+1) |
| §6.22 Norm congruence shells and ramified correction (:1974) | unramified base v(d_v)=0 | sum n=0…−1 empty=0, α_v=0 | Ramification correction not present in unramified case |
| §6.23 Local Whittaker series for incoherent sections (:1999) | q=2, s=0, finite nonzero shell sum S | 1−2⁰=0; derivative of (1−2^(−s))S is (log2)S | Derivative sign positive |
| §6.24 Incoherent central derivative (:2011) | odd analytic family I(s)=s or s³ | central values 0, derivatives 1 or 0 | Central vanishing does not imply derivative nonvanishing |
| §6.25 Pseudo-theta comparison on a small bad-place compact (:2025) | g=1; equal truncations | χ(1)=ρ∞(1)=δ(1)=1; outer−inner=1−1=0 | Comparison itself survives; S01 properness needed downstream |
| §6.26 Classical Rankin normalization (:2037) | class group trivial; C₂ character ±1 | one class L=L_A; two classes L_+=L₁+L₂, L_−=L₁−L₂ | No hidden average by h |
| §6.27 Rankin absolute convergence (:2049) | k=1, Re(s)=2 and 3/2 | 2>3/2 admitted; 3/2>3/2 false | No endpoint convergence claim |
| §6.28 CM Hecke disjointness criterion (:2061) | m=1, A=1 | r_A(1)=1, point lies on identity correspondence; disjointness false | Nonzero ideal count excludes disjoint case |
| §6.29 Classical Rankin unfolding (:2073) | one Fourier coefficient, k=1,s=1 | ∫₀∞y e^(−4πny)dy=1/(16π²n²); Γ(2)(4πn)⁻² same | Unfolded gamma factor tested |
| §6.30 Möbius level decomposition (:2085) | N=1; divisor e=p² | N=1 only e=1; μ(p²)=0 removes that term | Möbius cancellation and identity level |
| §6.31 Classical Rankin kernel (:2097) | D=−7, N=1 | trace level N\|D\|=7, not −7; U_\|D\|=U₇ | S10: all three original Checks admit 2K |
| §6.32 Trace coset classification (:2122) | D=−7 and D=−15, prime-to-D N | coset counts 1+7=8 and 1+3+5+15=24 | All divisors, including 1, required |
| §6.33 Genus Eisenstein combination (:2134) | D=−7,−15 | ordered fundamental factorizations number 2,4; unordered counts would be 1,2 | Ordered genus decomposition retained |
| §6.34 Genus-sign reversal (:2159) | D=−7,N=1,n=7 | ε(7,1)=1, ε(7,7)=−1; reversal factor −1; sum 0 | Both directions checked |
| §6.35 Signed divisor sums (:2171) | same n=7 | σ(7)=1−1=0; σ′(7)=log7−(−log7)=2log7 | Signed logarithm tested |
| §6.36 Genus-sign multiplicativity (:2196) | D=−7,N=1,n=14,d′=2,d″=7 | ε(14,2)=1, ε(14,7)=−1, ε(14,14)=−1; product −1 | Coprime-divisor multiplicativity control |
| §6.37 Boundary Eisenstein cusp constants (:2208) | M=N₁=1; M=2,N₁=1 | y′=y or y/2; leading cusp coefficient 1 or 1/4 | Square in cusp matrix retained |
| §6.38 Arithmetic height kernel (:2220) | first degree-zero class 0; scalar 2 | height kernel 0; scaling one point doubles it | Bilinear height, not quadratic in one slot |
| §6.39 Arithmetic theta lifting comparison (:2249) | zero Schwartz datum; f scaled by 2 | theta lift and its cycle pairing both 0; both pairings ×2 | Only boundary comparison, book theorem remains waived |
| §6.40 Automorphic sum reduces to nondegenerate outer theta (:2263) | V₀=V₁=V=0,S=∅ | automorphic sum 0; asserted outer theta 1 | S01 |
| §6.41 Rankin kernel pairing (:2275) | f=0; normalized Fourier term k=1,s=1,N=1 | pairing 0=L_A(0); gamma coefficient Γ(2)/(4π)²=1/(16π²) | Scalar normalization agrees |
| §6.42 Rankin kernel U formula (:2287) | N=1, U₁ | U₁ coefficient a_n→a_n; level factor 1^s=1 | Identity operator boundary |
| §6.43 Prime-discriminant Eisenstein formula (:2299) | D=−7 | two ordered discriminant decompositions (1,−7),(−7,1) | Prime-discriminant simplification uses two terms |
| §6.44 Eisenstein zero coefficient (:2311) | k=1,s=1,D=−3,N=1 | e₁(0,y)=3L(3,ε)y−πL(2,ε)/(6√3y) | Nonconstant in y, refutes §6.63 expansion |
| §6.45 Eisenstein nonzero coefficient (:2323) | φ Fourier nonzero index n=±1; zero divisor sum | positive divisors of either signed index are {1}; zero signed sum gives coefficient 0 | n=0 formula kept separate |
| §6.46 Genus sigma identity (:2335) | D=−7,N=1,n=−7 | σ(−7)=1+1=2; δ(7)R(7)=2·1=2 | Negative-index sign is essential |
| §6.47 Boundary Eisenstein orthogonality (:2347) | any cusp f paired with E₂*; f=0 | Eisenstein projection 0; (f,E₂*)=0; zero f gives 0 | Boundary subtraction preserves cuspidal projection |
| §6.48 Projection boundary coefficients (:2359) | N=1; N=2, A(1)=1,A(2)=0 | α(1)=A(1); N=2 gives (1−1/4)⁻¹=4/3 | Matches first row of C₂ inverse |
| §6.49 Positive-codimension theta cancellation (:2371) | codimension 2; opposite theta terms T,T | sum T−T=0; differing discriminant signs would yield T+T=2T | Common character required; S01 domain repair |
| §6.50 Local derivative and zero-term corrections (:2383) | φ=0; local measure volume doubled with matching integral | k=c=0; numerator/volume both ×2, ratio unchanged | Normalization independent of compatible Haar scaling |
| §6.51 Automorphy and cuspidality of the height series (:2408) | zero cycle datum; nonzero constant height functional | zero generating series 0; degree-zero functional kills degree term | Proof availability remains book-conditioned |
| §6.52 Hodge-class terms vanish and the height series splits into horizontal and vertical parts (:2420) | four equal unit pairings; extension degree 2 | 1−1−1+1=0; normalized intersections (2I)/(2d)=I/d | All four Hodge terms required |
| §6.53 Rankin kernel Fourier expansion (:2432) | D=−7,N=1,n=1,l=6 | n+l=7; Fourier exponent (n+l)/7=1 | Congruence enforces integral Fourier index |
| §6.54 Logarithmic prime decomposition (:2444) | D=−7,N=1,n=7 | σ′(7)=2log7; only ramified prime contributes coefficient 2 | Arithmetic congruence condition retained |
| §6.55 Logarithmic weight-two projection (:2456) | already holomorphic cusp coefficient a_m, A=B=0 | 4πm∫a_m e^(−4πmy)dy=a_m; all counterterms 0 | Projection fixes cusp forms |
| §6.56 Projected derivative decomposition (:2468) | g=1; zero kernel datum | logδ_f(1)=0; zero datum yields 0 on every summand | Full identity still needs corrected c₁, S01 |
| §6.57 Derivative of the mixed theta–Eisenstein series before projection (:2480) | inert primes 3 and 7 in ℚ(i) | local terms log3,log7; corresponding analytic−arithmetic differences 0 | Coefficientwise, not global, finiteness |
| §6.58 Rankin kernel meromorphic continuation (:2498) | n≠0, large y | e^(−2π\|n\|y)→0; zero Fourier mode is the only possible pole source | No uniform bound asserted at y=0 |
| §6.59 Logarithmic coefficient parity (:2510) | D=−7,N=1,n=7 | −2Σ ε(7,d)log d=−2(−log7)=2log7; coefficient 2 even | Logarithmic parity tested |
| §6.60 Single-prime logarithm criterion (:2522) | two odd inert factors; n=7 ramified witness | two inert geometric sums each contain 1−1=0; σ′(7)=2log7 from sole ramified factor | Single-prime exception separated |
| §6.61 Archimedean holomorphic projection of log δ∞·W^(2) (:2534) | F=Q | −2c₂=γ+log4π=3.1082399119…; completed gamma contribution−3.1082399119… cancels it | Formula is correct as printed |
| §6.62 Integral Rankin kernel values (:2546) | k=1,r=0, ε(N)=1 | L(1,ε)−πL(0,ε)/√δ=0; coefficient degree 0 in 1/y | Central zero term cancels |
| §6.63 Kernel coefficient functional equation (:2558) | k=1,s=1,D=−3,N=1,y=1,2 | Both expanded formula and completion give Ay−B/y; change A+B/2>0 | Formula is correct as printed |
| §6.64 Central kernel holomorphy (:2570) | r=0 | degree in 1/y is 0; no antiholomorphic y-polynomial remains | Does not assert cuspidality |
| §6.65 Classical L functional equation (:2582) | ε(N)=1,s=k | Λ(k)=−Λ(k), so 2Λ(k)=0 ⇒ Λ(k)=0 | Opposite sign permits nonzero value |
| §6.66 Classical central-value kernel (:2594) | k=1 | constant 2³π²/(0!√δ)=8π²/√δ; polynomial p₀=1 | Weight-two specialization agrees with §6.69 |
| §6.67 Classical central-derivative kernel (:2606) | k=1,D=−7,N=1,n=7 negative-index tail | σ(7)=0 but σ(−7)=2 | The corrected tail coefficient is −2, not 0 |
| §6.68 Completed Rankin functional equation (:2618) | k=1,s=1 | Λ(1)=−Λ(1), hence 0; model odd function s−1 has derivative 1 | Central vanishing distinct from vanishing derivative |
| §6.69 Weight-two central-value formula (:2630) | m=0,D=−7,h=u=1 | b₀=r(0)h/u=1/2; modular form need not be cusp | Endpoint retained |
| §6.70 Rankin cusp constants (:2642) | N=1,D=−7,h=u=1 | A(1)=1/2; logarithmic cusp term is nonzero | N=1 may have nonholomorphic kernel despite cusp space 0 |
| §6.71 Rankin Mellin regularization (:2654) | s=0,t=nN/(mδ)=1 | Q₀(3)=½log2; Mellin integral log2/(4πm) | Factor 2 in resolvent identity tested |
| §6.72 Central-value endpoint normalization (:2666) | D=−7,t=1,h=u=1 | δ(0)R(0)=2·(1/2)=1=h/u; P_(k−1)(1)=1 | Endpoint replacement exact |
| §6.73 Central-value genus-sum filter (:2678) | n=0; compatible/incompatible genera | nN denominator 0 ⇒ excluded; genus matching indicator 1 versus 0 | No 0/0 genus character |
| §6.74 Rankin boundary coefficients (:2692) | N=1; N=2 with ε(2)=1 | α=h/(2u²); second α=(h/(4u²))·(3/2)⁻¹=h/(6u²) | Euler/cusp denominator checked |
| §6.75 Definite period specialization (:2704) | zero CM projection; probability average of two equal points | period and normalized central value 0; average of P,P is P, sum 2P has fourfold norm | Probability measure retained |
| §6.76 Projected Rankin derivative cusp form (:2716) | N=1 | cusp space 0, Φ_A=0; universal assertion on span of weight-two newforms has only f=0 | No nonexistent normalized level-one weight-two form used |
| §6.77 Definite central-value square class (:2728) | a_K=0,2; e scaled by 3 | norm 0 or 4(e,e); new coefficient 2/3 and new norm 9(e,e) give 4(e,e) | No square class assigned to zero |
| §6.78 Projected Rankin derivative coefficients (:2746) | m=1 | Σ_(d\|1)d log(1/d²)=0; σ₁(1)=1 | Endpoint counterterm has no extra logarithm from divisors |
| §7.1 Ordinary CM lift charts and split intersection lengths (:2769) | Square-zero chart, Q=Q′=1+t, exponents 1,2 | Q=1+t; (Q′)²=1+2t; equality forces t=0; identity exponents give identical 1+t | No counterexample; nilpotents matter |
| §7.2 CM lifts and the integral endomorphism filtration (:2789) | q=3, quasi-level s=1, Hom valuation ℓ=1,3 | Unramified counts 3+1=4, lengths 2,6; ramified counts 3, lengths 2,8; excluded parity shell has count 0 | No counterexample in admitted ranges |
| §7.3 Hom of actual integral CM isogeny diagrams (:2825) | Identity and zero homomorphism | Identity diagram commutes and degree=1; zero commutes but degree=0, excluded when m>0 | No counterexample |
| §7.4 Degenerate Schwartz classes (:2848) | Two local vanishing factors versus one | s·s=s² has derivative 0 at 0; s has derivative 1; S¹ gives φ on torus=0 | No counterexample |
| §7.5 Nearby coherent kernel orthogonality (:2884) | Opposite local Hasse invariant | Local toric Hom dimension changes 1→0, hence projected coherent contribution 0 | Conditional on supplied epsilon dichotomy |
| §7.6 Integral order sandwich (:2902) | Unramified and ramified quadratic local algebra | Unramified order index=1; ramified nontrivial discriminant gives index>1; equality is rejected in ramified case | No counterexample |
| §7.7 Inert norm-shell cutoff (:2914) | Inert shell with v(ad)=0 | n=0 shell retained, n=1 empty with volume 0; threshold inequality is inclusive | No counterexample |
| §7.8 Ramified norm-shell volume (:2926) | q=2, discriminant exponent 2, v(ad)=0 | n=1 volume=(1/2)·2⁻¹=1/4; n=2 volume=0; missing ramified tail would wrongly give 0 at n=1 | No counterexample |
| §7.9 Archimedean zero-term correction (:2938) | Standard archimedean Gaussian | Constant derivative correction cφ=0; multiplying φ by 2 still gives 0 | Gaussian hypothesis retained; no arbitrary-Schwartz extension |
| §7.10 Finite zero-term correction (:2950) | S² at q=2, allowed unit norm | cφ=−2log2/7; torus-excluded argument gives 0 | No counterexample |
| §7.11 Regularized archimedean multiplicity (:2962) | Weak Green mean and constant correction | Mean −1 becomes 0 after adding 1; different components have residue 0 | No counterexample |
| §7.12 Finite local multiplicities and diagonal omission (:2989) | Omitted diagonal singleton | Orbit {(1,1)} is removed, resulting sum=0; inversion preserves omitted orbit | No counterexample |
| §7.13 Superspecial multiplicity by uniformization (:3014) | Superspecial multiplicity, v(λ)=2,4 | m=1,2 respectively; off norm support indicator=0 | No counterexample |
| §7.14 Vertical correction vanishes at B-split places (:3026) | Split quaternionic vertical term | Vertical divisor=0 and pairing=0; doubled zero divisor still gives 0 | Boundary control only |
| §7.15 Nonzero associated weight-one theta (:3038) | S² average at q=2,3 | At q=2: (1−1/2)²(1−3/7)=1/7; q=3: (4/9)(1−3/13)=40/117; both nonzero | No counterexample |
| §7.16 Archimedean derivative kernel (:3050) | λ=−1,s=0 archimedean integral | Integral from 1 to infinity of 1/[t(1+t)]=log2; prefactor 1/2 gives Q₀(3)=log2/2 | No counterexample |
| §7.17 Marked Green height characterization (:3077) | Additive constant in marked kernel | Four-term correction to a constant a is a−a−a+a=0; base marked divisor gives 0 | No counterexample |
| §7.18 CM Eisenstein sum (:3089) | Single ideal class and trivial character | CM class sum contains h=1 summand, no extra class multiplicity; residue of ζ_K is π/(u√Dabs) | Normalization compatible with 7.106 |
| §7.19 Tangent-normalized CM height symbol (:3101) | Replace local parameter g by 2g, simple divisors | Change of symbol is −log norm_v(2); at complex v this is −2log2 | No counterexample |
| §7.20 Eta-normalized CM tangent (:3126) | Eta parameter multiplied by ζ₆; u=3 | log norm(ζ₆)=0; tensor order r+6=6/3=2, so r=−4 | No counterexample |
| §7.21 Supersingular Eichler realization (:3151) | N=1, inert prime p | Nearby B ramifies at p and infinity: two places, parity even; maximal order level=1 | No counterexample |
| §7.22 CM level reduction component (:3163) | Level p, n=1 | Two labels F_(0,1),F_(1,0), not one; Frobenius and Verschiebung directions exchanged | No counterexample |
| §7.23 Half Hom count (:3175) | Degree-one automorphisms, generic/extra-unit CM | Half-counts 2/2=1,4/2=2,6/2=3 | No counterexample |
| §7.24 New CM homomorphisms (:3200) | No new Hom elements at any thickening | Each difference cardinality=0; summed new contribution=0, while old identity remains excluded | No counterexample |
| §7.25 Good-place arithmetic identity (:3225) | Good inert q=3, near component of valuation one | k=log3, m=1, k−m log3=0; individual terms are nonzero | No counterexample |
| §7.26 Inert logarithmic singularity and diagonal extension (:3246) | Inert unit d·q(j), norm valuation one | Half valuation expression=(1+1)/2=1; k−m logq=0; logarithm of unit correction=0 | No counterexample |
| §7.27 Ramified logarithmic singularity and diagonal extension (:3258) | Ramified q=2, discriminant exponent 3, d unit | Correction ((3−1)/2)log2=log2, versus 0 if discriminant omitted | No counterexample |
| §7.28 Diagonal coefficient and modified self-intersection (:3270) | Averaging index e=2, Ω=2 | Ω/e=1; replacing by unnormalized Ω would double self correction | No counterexample |
| §7.29 Nonsplit proper-height expression (:3295) | Formal component bookkeeping M=2,N=3,self=1,Ω/e=1 | Proper part 2+3−1=4; including diagonal without subtraction gives 5 | Algebra check; geometric inputs still required |
| §7.30 Ordinary multiplicity and local pairing (:3307) | Split principal multiplicity r=1,v(b)=0 | q=2 gives 1/(2⁰·1)=1; q=3 gives 1/(3⁰·2)=1/2 | No counterexample |
| §7.31 Superspecial local intersection (:3319) | Division-case norm valuation 2; off support | On support m=2/2=1; off support m=0 | No counterexample |
| §7.32 Vertical correction is nonsingular pseudo-theta (:3331) | Vertical divisor 0 and twice V | V=0 gives l=0 and theta=0; 2V gives 2l, not 4l | No counterexample |
| §7.33 Archimedean adjunction constant (:3343) | Hyperbolic separation tending to 0 | Q₀(t)=log((t+1)/(t−1))/2 cancels log(2 Im z/distance); constant remainder tends to 0 | No counterexample |
| §7.34 Extended local diagonal vanishes at small away-v level (:3355) | Only diagonal orbit after shrinking level | Omitted sum=0; split proper contribution remains 0 | No counterexample |
| §7.35 Corrected CM multiplicity at 𝔹-split, E-nonsplit places (:3367) | Zero test function and reversal of both arguments | φ=0 gives all multiplicities weighted by 0; inversion twice returns original coset | Boundary/control only; nonzero formula source-dependent |
| §7.36 Hecke kernel action (:3379) | m=1,2, s=1 Hecke action on Eisenstein | σ₁(1)=1; σ₁(2)=3; 2·σ₋₁(2)=2(1+1/2)=3 | No counterexample |
| §7.37 Tangent product formula (:3391) | Global cotangent multiplied by rational 2 | log norm∞2 + log norm₂2=log2−log2=0; global change=0 | No counterexample |
| §7.38 Complex tangent asymptotic (:3403) | Complex parameter scaled by 2, u=3 | Local correction u log normℂ2=6log2; unsquared convention would incorrectly give 3log2 | No counterexample |
| §7.39 Degree-one CM intersection count (:3415) | Inert residue degree two, one intersection | q=p² and −logq=−2logp; half Hom count 2/2=1 gives same value | No counterexample |
| §7.40 Inert quaternionic order model (:3427) | D=−7,p=3, q=23 versus q=11 | 3·23≡−1 mod7; 3·11≡5 mod7, so q≡−p is insufficient | Correct strengthened congruence retained |
| §7.41 CM component orthogonality (:3452) | CM and cusp on same component | Component degrees 1−1=0; divisor on different component would give (1,−1) | No counterexample |
| §7.42 Prime-to-p Hom decomposition (:3464) | m=1 Hecke correspondence | Only conductor dividing 1 is 1; T₁x=x. Higher conductor points are not presumed H-rational | No counterexample |
| §7.43 Diagram isomorphism intersection count (:3476) | Two degree-m lifts at a single depth | Half-cardinality=2/2=1, matching length one; no lifts gives 0 | Conditional local deformation count |
| §7.44 Split CM intersection vanishing (:3488) | Split p, r_A(m)=0 | No characteristic-zero Hom; ordinary intersection contribution 0 | No counterexample |
| §7.45 CM endomorphism congruence order (:3500) | Depth n=1,2 at inert and ramified p | Ideal norm exponents inert 2n−1=1,3; ramified n=1,2 | No counterexample |
| §7.46 Tangent self-intersection number (:3512) | Cotangent coefficient α replaced by πα | ord increases by 1; intersection correction increases by 1; primitive α has order 0 | No counterexample |
| §7.47 Nearby quaternionic approximation (:3537) | Good inert derivative cancellation; S² average | logq−logq=0; constant torus kernel with volume3 has inner value3, outer probability average1 | General-level proof remains conditional on settled YZZ locators |
| §7.48 Archimedean proper-height expression (:3609) | Formal M=2, diagonal coefficient1 and Ω/e=1 | Proper horizontal contribution 2−1=1; weak Hodge term at degree1 is −E*/2 | No counterexample; cannot omit weak Hodge term prematurely |
| §7.49 Split proper height and zero extended diagonal (:3621) | Split place with no off-diagonal orbit | Horizontal diagonal removal gives 0; remaining proper contribution equals N | Boundary control only |
| §7.50 Supersingular inert local intersection (:3633) | Inert nonsplit norm valuation 1,3 | m=(1+1)/2=1 and (3+1)/2=2 | No counterexample |
| §7.51 Wild-inclusive ramified local intersection (:3645) | Ramified valuation formula, discriminant exponent1 versus3 | At fixed norm valuation, m increases by (3−1)/2=1 | No counterexample; dyadic different essential |
| §7.52 Diagonal-correction local coefficient (:3657) | S² at q=2 and unit norm | nφ=−1/(1+2+4)=−1/7; cφ=2nφlog2=−2log2/7 | No counterexample |
| §7.53 Geometric realization of extended self-intersection (:3669) | Identity covering and omitted singleton | Degree1 covering induces identical sum; diagonal-only sum after omission=0 | No counterexample |
| §7.54 Resolvent cusp expansion (:3681) | Cusp asymptotic at s=2 | Leading coefficient −4π/(2·2−1)=−4π/3 times E/y; tends to 0 as y→infinity | No counterexample |
| §7.55 Hecke Green kernel (:3693) | m=1, matrices modulo sign | Two matrices ±γ become one term by factor1/2; G¹=G | No counterexample |
| §7.56 Norm-one generator count (:3718) | Norm equation endpoint α=0, D=−7,p=3,q=23,m=69 | 0+3·161=483=69·7; numerical equality alone does not supply a lattice generator | Endpoint admitted only in unmarked finite setting |
| §7.57 Finite CM intersection height (:3730) | Single marked finite intersection, residue q | Local symbol=−logq, not +logq; disjoint intersection0 gives 0 | No counterexample |
| §7.58 CM Hom intersection count (:3742) | Two Hom elements at each of two depths | Half-count=(2+2)/2=2, equal to length2; subsequent counts0 | No counterexample |
| §7.59 CM Hom quaternion realization (:3754) | Identity ideal a=O and identity isogeny | N(b)/N(a)=1/1=1; multiplying both by principal scalar preserves quotient degree | No counterexample |
| §7.60 Special j tangent values (:3766) | j=1728 and j=0 exceptional branches | 2⁶·3⁴=5184; 2⁹·3^(3/2)=1536√3, both nonzero; naive generic expression gives 0 | No counterexample |
| §7.61 Inert CM Hom lattice (:3778) | Connecting ideal with reversed orientation | bbar/b becomes b/bbar, inverse; their product=1. Principal real ideal gives ratio1 | No counterexample |
| §7.62 Ramified quaternionic order model (:3803) | Ramified a=(7), b=7(1+j) | v₇(DN(b₋))−v₇(Na)=3−2=1=v₇(14); α=0 has no ideal class | Earlier valuation repair verified |
| §7.63 CM tensor stabilizer height (:3830) | Generic stabilizer u=1, Δ, prime away from level | r+k=6, tensor correction0; new automorphism counts all0 give self value0 | No counterexample; elliptic specialization not asserted |
| §7.64 Modular cusp and boundary correction (:3844) | N=1 versus marked N>1 | At N=1 cusp labels0=∞, so marked disjointness fails; boundary corrections require separate handling | No counterexample |
| §7.65 Full local decomposition of the height series (:3858) | Degree F=1,2 before auxiliary degeneracy | Weak Hodge coefficient −1/2,−1; after both conditions contribution0. Zero φ makes all five sums0 | No counterexample |
| §7.66 Split diagonal cancellation (:3870) | S² q=2, q(j)=−1,d unit | 2nφlog2−cφ=−2log2/7+2log2/7=0; RHS log norm(−1)=0 | No counterexample |
| §7.67 Finite adjunction lattice identity (:3882) | Residue lattice N=π⁻²O, e=2 | length(N/O)=2; i/e=4/2=2 | Algebraic length normalization control |
| §7.68 Marked modular Green kernel (:3894) | Four residues and additive constant | κ−κ−κ+κ=0; adding arbitrary C leaves this 0, so cusp condition must determine C | S05 construction order |
| §7.69 Atkin–Lehner kernel invariance (:3919) | m=1 and identity Atkin–Lehner d=1 | Kernel argument unchanged, so both sides G; nontrivial involution preserves determinant m | No counterexample |
| §7.70 CM kernel invariants (:3931) | Class group C₃ and fixed difference A | Three ordered pairs have A₁A₂⁻¹=A; partition over B counts each once, total3 | S07 broken reference only |
| §7.71 Diagonal Green finite part (:3956) | One diagonal orbit at s=1 | Multiplicity a=1; self contribution is −log normℂ(2π(z−zbar)η⁴); unrenormalized term diverges | S05 construction order |
| §7.72 Inert disjoint intersection formula (:3981) | Inert odd norm valuations 1,3 | Contributions (1+1)/2=1 and (1+3)/2=2; residue q=p² | No counterexample |
| §7.73 Ramified disjoint intersection formula (:3993) | Ramified norm valuation0, v_p(D)=1 | Contribution v_p(DNb₋)=1; residue q=p^k with k order of ramified ideal class, not automatically p² | No counterexample |
| §7.74 New automorphism length (:4005) | No extra automorphisms versus one depth with four instead of two | Half-difference0 versus (4−2)/2=1; primitive tangent iff every nonnegative difference0 | No counterexample within u=1 hypothesis |
| §7.75 Inert norm-ideal map (:4017) | α=0 endpoint and a=(p) | Zero ideal norm0 has no class; valuation subtraction is v_p(Nb₋)−2, not v_p(Nb₋) | Earlier repairs retained |
| §7.76 Modified CM intersection pairing (:4043) | Aut_W=2, Aut_W₁=4, later no extra automorphisms | I^GZ=1; cotangent value=1+tensor correction, not automatically1 | No counterexample |
| §7.77 Analytic–arithmetic difference is a finite pseudo-theta sum (:4071) | Good inert q=3 versus exceptional finite place | Good k−m logq=log3−log3=0; finite exceptional support may retain nonzero terms | No counterexample |
| §7.78 Arithmetic adjunction for the CM point (:4083) | Zero degree-zero CM class | Both adjunction-derived height and pairing0; multiplying unit index e scales i₀=e(−height) | Only boundary/algebra control; book theorem not independently certified |
| §7.79 Modular Green constant (:4095) | Expansion s=1+t | y^(−t)/(1+2t)=1−t(log y+2)+O(t²); pole−κ/t produces −κ(log y+2) | S05 ordering, formula consistent |
| §7.80 CM genus-orbit count (:4107) | Prime D (t=1), and t=2 | Genus-compatible pair count2⁰=1 or2¹=2; incompatible genus count0 | No counterexample |
| §7.81 Hyperbolic norm parameter (:4119) | τ₁=τ₂=i, γ=identity and translation by1 | Identity m=1,n=0,n+4m=4; translation m=1,n=1,n+4m=5. For D=−7,τ²+τ+2=0 and γ=(0,−1;1,0), corrected n=2, source polynomial n=1 | Corrected sign verified |
| §7.82 Renormalized resolvent self-value (:4131) | s=1 and s=2 | Digamma difference0 at1; ψ(2)−ψ(1)=1 gives self value at2 equal self value at1 plus2 | S05 ordering, formula consistent |
| §7.83 New Hom intersection formula (:4143) | No new Hom; b∈K | New count0 and omitted b₋=0 contribution0; prevents ord(0) from entering sum | No counterexample |
| §7.84 Inert unit-orbit count (:4155) | u=1, δ(n)=1 | One orbit after ± quotient; unreduced count2 becomes1. Printed extra factor2 would count twice | Source correction retained |
| §7.85 Tensor-normalized local-to-global CM height (:4167) | Scale global tensor parameter by rational2 | Finite contribution log2 cancels real contribution−log2, or squared complex pair gives twice both | No counterexample; individual local redistributions not identified |
| §7.86 Nonsplit diagonal cancellation (:4181) | Unit d·q(j), good inert point | 2(logq)−2(1)logq+0=0=−log norm(unit)·φ | No counterexample |
| §7.87 Archimedean modular height formula (:4193) | N>1 cusp limit and residues | Residues cancel0; constant C=−λ+2κ as in7.68, opposite sign would shift value4κ | No counterexample |
| §7.88 Quadratic-pair representation count (:4205) | N=1,D=−4, τ=i, translation γ=(1,1;0,1) | α=−1−2i norm5; β=−1 norm1; l−n=4=mDabs; inverse gives c=0,d=1,a=1,b=1 | Matrix control outside odd-D arithmetic assumptions, explicitly separated |
| §7.89 Inert total intersection formula (:4217) | Inert p, p∤m | Added diagonal term (u r_A(m)/2)·ord_p(m)=0; valuation-one noncentral orbit contributes1 | No counterexample |
| §7.90 Ramified total intersection formula (:4229) | Ramified p, p∤m | Added diagonal term u r_A(m)·0=0; v_p(D)=1 and unit noncentral norm contribute1 | No counterexample |
| §7.91 Split total intersection formula (:4241) | r_A(m)=0; and two split ideals at m=p | Zero case κ=κbar=0, no 0/0; two-ideal case r=2,κ=κbar=1 gives k=kbar=1/2 and sum1 | No counterexample |
| §7.92 Level intersection formula (:4253) | Level exponent1, u=r_A(m)=1 | At v dividing n: J=0; at v dividing nbar: J=−1; discriminant correction supplies difference | No counterexample |
| §7.93 Rational-prime CM height sum (:4265) | No diagonal r_A(m)=0; one length at inert p | Tensor correction0; total−log(p²)=−2logp | No counterexample |
| §7.94 Hecke archimedean height formula (:4292) | m=2 at s=1 | σ₁(2)=3=2σ₋₁(2); residue cancellation3κ−3κ−3κ+3κ=0 | No counterexample |
| §7.95 Ramified-congruence pair count (:4304) | u=1 and one ideal in each represented class | Each ideal has two generators; quotient gives (2·2)/2=2=2u²·1·1 | No counterexample |
| §7.96 Diagonal archimedean CM formula (:4316) | r_A(m)=0 and m=1 | Self term0; constant −λ+2κ equals7.87; erroneous printed sign would give−λ−2κ | Corrected sign consistent |
| §7.97 Split-prime height sum (:4328) | p∤mN; p∣N with valuation1 | First contribution0; second becomes +u r_A(m)h logp from ord_p(m/N)=−1 | No counterexample |
| §7.98 Inert-prime height sum (:4340) | Marked N>1, n endpoint | Equality nN=mDabs impossible since gcd(mD,N)=1; open upper bound loses no endpoint here | No defect; N=1 restricted elsewhere |
| §7.99 Ramified-prime height sum (:4352) | Marked N>1, empty admissible n set and p∤m | Both sum and diagonal term0; endpoint excluded by same coprimality as7.98 | No counterexample |
| §7.100 Prime-discriminant pair count (:4364) | Prime D, n divisible/not divisible by D | Generator congruence sign choices2/1; coefficient2u²/u² respectively | No counterexample |
| §7.101 Genus pair count (:4376) | Two ramified factors in gcd(n,D), u=1 | δ(n)=2²=4; incompatible genus gives0, compatible gives4r_A(l)r_B(n) | No counterexample |
| §7.102 Total finite CM height formula (:4388) | N>1, m=1 diagonal correction | hu r_A(1)logN; finite endpoint r_A(0)/w never appears because N∤Dabs | No counterexample |
| §7.103 Genus kernel evaluation (:4400) | Wrong genus; compatible genus with r counts1,u1,δ1 | Wrong genus term0; compatible summand−2Q_(s−1)(1+2nN/(mDabs)) | No counterexample |
| §7.104 CM orbit kernel evaluation (:4412) | Genus partition and zero ideal counts | Sum over B with each count0 gives0; one nonzero genus count1 gives same summand as7.103 | No counterexample |
| §7.105 Genus-character filter (:4424) | n prime to D, two ideals conjugate | Conjugate ideals differ by inverse class, same class modulo squares; both in genus or neither, R_genus=2 or0 | No counterexample |
| §7.106 Self-value CM orbit sum (:4436) | Laurent ζ_K at1 and s=1 | Leading factor (2u/π)√Dabs·πh/(u√Dabs)=2h cancels 2h/(σ−1); ψ(1)=−γ | No counterexample |
| §7.107 Disjoint archimedean CM formula (:4448) | m=1 divisor correction | Σ_(d∣1)dlog(1/d²)=0; pole subtraction coefficient hκ | No counterexample |
| §7.108 Total archimedean CM formula (:4460) | r_A(m)=0 versus1 | Extra self term0 versus 2hu[ψ(s)−log2π+L′/L+logDabs/2] | No counterexample |
| §7.109 Global-local archimedean comparison (:4472) | At s=1, u=h=r_A(m)=1 | Extra self value2L′/L−2γ−2log2π+logDabs agrees with7.108 using ψ(1)=−γ | No counterexample |
| §8.1 Projected arithmetic kernel identity (:4495) | Nonzero projected arithmetic value z; zero test vector | Analytic projection=2z, zero vector gives0=2·0; adding an Eisenstein form changes pointwise values but projection0 | Projected, not pointwise, identity retained |
| §8.2 The χ-isotypic Mordell–Weil space A(χ) (:4517) | Trivial C₃ over F₃ and regular C₃ over F₇ | Average1=0 in F₃, fixed space contains1; in F₇ shift(1,2,4)=(4,1,2)=4(1,2,4) | No counterexample; inverse character and bad characteristic explicit |
| §8.3 Matching local signs force the global sign −1 (:4554) | Odd/even ramification cardinality | Odd gives (−1)^(2a+1)=−1 and central value0; even gives+1 and no forced vanishing | No counterexample |
| §8.4 Petersson norm, parametrisation degree and Manin constant (:4568) | ω=2πif dz and isogeny multiplier2 | Absolute wedge=8π² norm(f); differential square scales4, degree of [2] is4 | No counterexample |
| §8.5 Admissible orders and the test-vector line V(π, χ) (:4582) | One-dimensional test line and scalar2 | Nonzero vector2f has nonzero toric contraction twice that of f; zero vector excluded | Conditional on local test-vector theorem |
| §8.6 The main identity on X₀(N): heights as Fourier coefficients (:4613) | m=1 and zero cuspidal eigenspace | Coefficient is height/u²; at genus-zero level all Jacobian heights0 and cusp forms0 | No counterexample |
| §8.7 The L-linear Néron–Tate pairing on A(χ) × A^∨(χ^(-1)) (:4627) | M=Q,L quadratic and pure tensor1 | Trace_L of scalar b is2b, not b; character product ≠1 forces invariant pairing0 | No counterexample |
| §8.8 The χ-Heegner point P_χ(f) and its finite form P⁰_χ(f) (:4661) | C₂ orbit P,Q, trivial and sign characters | Average(P+Q)/2 or(P−Q)/2; refinement by two repeats gives same average; character inverse equals itself only here | C₃ check of8.2 distinguishes inverse |
| §8.9 Toric integral versus finite trace (:4701) | h=2, norm(P⁰)=2, volume3 | Probability height=2/4=1/2; volume height=9/2; missing one averaging factor gives1 | No counterexample |
| §8.10 The Heegner map is a toric-invariant functional (:4715) | C₃ character value2 in F₇ | Translation scales weighted sum by inverse2=4; using2 gives wrong eigenspace | No counterexample |
| §8.11 The Yuan–Zhang–Zhang Gross–Zagier formula (YZZ Theorem 1.2) (:4735) | Toric Hom zero; scaling f₁ by2 | Zero space gives0=0; both height and α scale2, no division by zero | Nonzero theorem at waived book locator remains conditional |
| §8.12 The zero case: vanishing of the toric Hom space (:4749) | Mismatched local sign at one place | Local Hom0, global toric map0, point0, local product0; L′ left unconstrained | No converse inferred |
| §8.13 Heegner points detect a nonzero central derivative (:4765) | One evaluated α=0 despite nonzero form; χ=1 nonzero point | α(f₁,f₂)=0 yields height0 and cannot force L′; positive polarized actual point gives positive component heights | Hypotheses block the false converse |
| §8.14 The explicit Gross–Zagier formula of Cai–Shu–Tian (:4779) | One ramified common prime; no common primes | Factor2⁻¹=1/2 versus empty factor1; relative K/F height factor2 retained | No counterexample |
| §8.15 The Gross–Zagier formula on X₀(N) for ring-class characters (:4793) | c=1,D=−7, all level primes split | u=1,μ=0, coefficient8π²(f,f)/√7; D=−3 gives u⁻²=1/9 | S03 ownership of classical specialization |
| §8.16 Variation of the explicit formula for other test vectors (:4807) | S empty; rescale local Haar by3 | Empty product1 recovers8.14; ratio (3β)/(3β′)=β/β′ | No counterexample; relative Picard correction necessary |
| §8.17 Heegner points on X_(N⁺,N⁻) over ℚ and the trivial character (:4821) | Rational Hecke field and λ principal | Coefficient-field trace degree1, polarized point height is scalar elliptic height; zero point gives derivative0 | No counterexample in stated sign cases |
| §8.18 Non-torsion of the trace point on a parametrised GL(2)-type quotient (:4849) | Strict GL₂ type degree d=1,2 | One simple zero per embedding gives total orders1,2; zero point gives each derivative0, hence total order at least3d | No counterexample; all embeddings required |
| §8.19 Heights of Heegner points on an elliptic curve (:4863) | Compose parametrization with [2] | deg becomes4deg, height becomes4height, quotient unchanged; C becomes2C and C² grows4 | S03 classical duplication; normalization coherent |
| §8.20 Corollaries on derivatives: positivity and Galois invariance (:4877) | Root sign +1 versus−1 | Even orders0,2; odd orders1,3. Failure of simple zero with odd parity means≥3; with even parity means≥2 | No counterexample |
| §9.1 Cotangent saturation for good-reduction optimal quotients (:4902) | R=Z₃ versusZ₂; split projection B×A→A | e=1<2 true,1<1 false; split cotangent cokernel free; pR⊂R cokernel R/pR nonzero torsion | S08 ownership; source BLR settled uncertified |
| §9.2 The algebraic-point subgroup input to eigenlogarithms (:4923) | Torsion x and product point(x₁,0) | log torsion0 allows finite B; product log lies in Lie(A₁)×0, proper subgroup dimension dimA₁ | Algebraic-point restriction necessary |
| §9.3 CM coefficient rings, Amice series and interpolation uniqueness (:4947) | F=ϖ²(T+ϖ)³; G=T+ϖ; p=2,3 | μ(F)=2,λ(F)=3; μ(G²)=0,λ(G²)=2; nonzero constant has0 roots; log(1+T) unbounded gives infinitely many zeros | No counterexample; infinite residue fields allowed |
| §9.4 Integral ordinary CM moments on modular and Shimura curves (:4971) | F=1, Q, Q²; coordinate Q′=Q² | Positive moments0,1,2^j; in new coordinate Q has j-th moment2^(−j); ordinary second derivative of Q is0 but D²Q(0)=1 | No counterexample |
| §9.5 The semistable integration adapter for p-new weight two (:5002) | Tate point z=q_E and z=1 | log(q_E)−ord(q_E)log(q_E)/ord(q_E)=0; value at1=0; branch shift cancels | Supplier owns general integral; additional p-new comparison retained |
| §9.6 The ratio α(f, f_B) of Petersson norms (:5023) | Multiply quaternionic form by2 | Petersson ratio changes by factor4 or1/4 according to direction; primitive integral line excludes a nonunit rescaling | Primitive normalization essential; sign fixed in definition |
| §9.7 The Euler factor at the BDP point (:5057) | p=5,a_p=1,−4,0; p=23,a_p=−1 | Euler factors1,2,6/5,25/23; valuations0,0,−1,−1; all nonzero | Correct exceptional p=5 check |
| §9.8 In weight two the p-adic Abel–Jacobi map is the formal logarithm (:5073) | Weight-two AJ at torsion and twice a point | AJ(torsion)=log(torsion)=0; AJ(2P)=2log(P) | Conditional on supplied AJ/abelian comparison |
| §9.9 The Waldspurger formula at CM points of X_(N⁺,N⁻) (:5087) | Dyadic d=2,3 at n=0; d=2,n=1 | αβγ·2^(d/2)=1,1,2 respectively; n=1 uses (2/3)·(3/2)·2=2 | Earlier dyadic repair verified |
| §9.10 Compatibility with isogenies, differentials and characters (:5125) | Isogeny [2], differential pullback2 | Log doubles; square quadruples; formula coefficient changes by1/4. Pushforward Dirac maps Dirac at image | No counterexample |
| §9.11 Brooks's quaternionic p-adic L-function (:5139) | Moment shift n=2; scale form2 | j=n−1=1; untwisted moment would be2. Root scales2 and central-value function scales4 | No counterexample |
| §9.12 The weight-two formula at a multiplicative prime (:5170) | p=5, split/non-split multiplicative a_p=1,−1 | BDP factors4/5,6/5 nonzero; family factor1−a_p⁻¹=0,2 respectively | No conflation with exceptional-zero formula |
| §9.13 Heegner points have nonzero logarithm in every eigencomponent (:5184) | M=Q(√5), matching/opposite coefficient embedding | Idempotent evaluates (1+1)/2=1 or(1−1)/2=0; arbitrary tensor can have zero log, actual non-torsion point cannot under source hypotheses | No counterexample |
| §9.14 Normalization of the toric root and its square (:5198) | Root G=ϖ(T+ϖ), unit U | μ(UG²)=2,λ(UG²)=2; multiplying byϖ instead makes μ=3 and is not a unit comparison | No counterexample; integrality of comparison is an actual target |
| §9.15 The BDP anticyclotomic p-adic L-function in weight two (:5222) | Trivial character n=0; interpolation weight n=p−1 | n=0 excluded; n=p−1>0 admitted. Integral coefficient ring supports 1+T but notϖ⁻¹(1+T) | No continuity-only construction |
| §9.16 The quaternionic weight-two formula of Brooks and JSW (:5262) | Auxiliary scalar a_ℓ−ℓ−1 versus its negative | Squares equal; normalization denominator is nonzero by hypothesis; logarithm must be squared | Source typo corrected |
| §9.17 The BDP p-adic Gross–Zagier formula in weight two (:5276) | 37a1,K=Q(√−111),p=5,c=1; χ=1 | 37 ramified, a₃₇=−1; K split at5 since−111≡4; source allows cyclic ideal O_K/p₃₇=F₃₇ | S04 unjustified all-split restriction |
| §9.18 The formula for a p-optimal quotient (:5290) | p-optimal pullback unit c and auxiliary unit u | log differential scalesc, squarec² is unit; y=u z gives squareu², also unit | No counterexample |
| §9.19 The formal logarithm detects non-torsion Heegner points (:5304) | Torsion point; nonzero global point; local-zero Selmer class | Point log0 iff torsion for claimed carriers; local-zero class haslog0 regardless of global class≠0 | No incorrect Selmer equivalence |
| §9.20 Bloch–Kato logarithm of the Heegner Kummer class (:5318) | Good-reduction point torsion and nP | Rational Kummer torsion=0, log=0; both maps send nP to n times value; H_e=H_f uses φ-fixed space0 | Twist convention requires supplied de Rham comparison, no substitute carrier |
| §9.21 The BDP function lies in the Iwasawa algebra (:5338) | Period unit outside finite L | A unit in O^ur has valuation0 yet need not belong toO; integral series overO^ur does not imply descent toO | No counterexample |
| §9.22 Dictionary between Skinner's L^S_𝔭(f) and the BDP and Brooks functions (:5352) | n=1 and n=2; imprimitive F=1+T | j=0,1, not2,3; multiply by1−T gives1−T²; odd power (2πi)^3 is purely imaginary | Source constant cannot match without periods |

| Bold target and location | Instances | Computed values | Result / required change |
|---|---|---|---|
| 3.1 bounds, README:1002 | p odd,a=2,ℓ=1; p=2 extension boundary | Odd exceptional valuation bound −1/2; dyadic theorem explicitly restricted to Q₂; arbitrary dyadic extension is not supplied | No new finding |
| 7.4 vanishing, README:2852 | x₂=0 and v(uq(x)) above threshold | φ=0 on each excluded locus; translating by U keeps0 | No counterexample |
| 7.4 line terms, README:2853 | Two factors vanish to first order | Derivative of s² at0 is0; derivative of s at0 is1 | Two-place condition necessary |
| 7.4 existence, README:2854 | Matching versus opposite toric sign | Matching local Hom dimension1; opposite dimension0 cannot admit nonzero contraction | Sign condition necessary; source-dependent existence |
| 7.47 projected derivative, README:3541 | Torus volume3, constant kernel1 | Inner probability average1; outer volume integral3; erroneous double volume9 | No counterexample |
| 7.47 multiplicity, README:3544 | q=2 principal congruence subgroup | GL₂(F₂) cardinality(4−1)(4−2)=6; diagonal-only sum becomes0 after omission | No counterexample |
| 7.47 vertical kernel, README:3547 | V=0 and2V | Kernel0 and2l; square of intersection would give4l | No counterexample |
| 7.47 full height, README:3548 | Degree F=1,2; zero Schwartz function | Weak Hodge coefficients−1/2,−1; zero φ givesZ=M=N=j=Ω=0 | Both auxiliary conditions retained |
| 7.47 local nonsingularity, README:3575 | φ supported away from torus | Kernel vanishes on an open torus neighborhood, value0 and extension0; constant nonzero extension fails | General-level YZZ proof remains waived |
| 7.47 vanishing off S′, README:3576 | Unramified inert q=3 | log3−log3=0; archimedean K−M=0 | No counterexample |
| 7.47 pseudo-theta form, README:3577 | No exceptional places in finite support | Empty sum0; a singleton exceptional contribution stays one term | Boundary control only |
| 7.47 identity, README:3578 | Codimension0,2 terms | Vandermonde separates coefficients at powers1,z²; z=1,2 gives determinant3≠0 | Dependent on S01 properness correction |
| 7.47 projection, README:3579 | Nearby sign mismatch | Each local toric Hom0, hence σ projection0; retained kernel factor2 | No counterexample |
| 9.2 analytic subgroup, README:4927 | G=G_a×G_m, diagonal Lie line | No positive-dimensional algebraic subgroup has that diagonal Lie algebra; nonzero algebraic log-vector there would contradict theorem | Algebraicity essential; S09 omission |
| 9.2 abelian form, README:4929 | Torsion point, W=0; product point | Torsion log0 yields finite subgroup, positive order point gives nonzero dimension; (x₁,0) lies in A₁×0 | No false assertion x=0 |
| 9.4 periods/root, README:4977 | Scale ω by2; one-point expansion1+t | Algebraic value1/4 times period-square4=1; second invariant moment1; twice form gives root2 and square4 | No counterexample |
| 9.9 dyadic constants, README:5089 | Discriminant exponents2,3, conductor n=0,1 | n0 combined constants1 for both d; n1 gives(2/3)·3·2^(−d/2)·2^(d/2)=2 | Source constants rechecked |

| Standing context | Boundary instance and computed value | Domain conclusion |
|---|---|---|
| C | D=−3,−4 gives w=6,4 and r_A(0)=1/6,1/4; N=0, k=0 excluded | Fundamental negative discriminant, positive level and positive weight are actual hypotheses. |
| H | N=1 gives 0=∞ as cusp labels; marked c,d construction therefore separately requires N>1 | The unmarked finite intersection setting still allows N=1. |
| G | D=−7 has two ordered decompositions (1,−7),(−7,1); D=−4 is even and excluded | Genus formulas cannot silently use the dyadic case. |
| L | Inert p has q=p²; ramified class of order f has q=p^f, with residue degree f | Length is ord_π, so ramified uniformizers cannot be replaced by p. |
| Q | Nearby coherent algebra flips one local invariant: an odd number of ramified places becomes even | Nontrivial CM extension is separable in characteristic zero; split local algebras remain allowed. |
| Q′ | Split residue F₂ has O_E× image {(1,1)}, while O_E contains (1,0) | Containing units does not force containing the order; the stronger order containment is present. |
| D | Two vanishing factors give derivative(s²)(0)=0; one gives derivative(s)(0)=1; principal GL₂(F₂) quotient has6 elements | Two-place degeneracy and actual principal level cannot be replaced by one place or maximal-level data. |

The scalar/sign controls also cover γ=i on a weight-two Petersson pairing (first-slot linear versus conjugate-linear produces i versus −i), finite averages on C₃, empty products equal to1, zero modules, rank-zero determinant1, genus-zero exclusions, genus-one loop density1/L, inseparability exclusions in characteristic-zero fields, and square-zero ordinary charts. These controls do not assert that every unrelated degeneration is an object in every theorem's domain.

## Not verifiable

- yzz-draft and yzz-book retain their settled waived status. In particular the general principal-level YZZ proof of §7.47 and the nonzero global formula are not independently certified from the public maximal-level Colmez computations. The package now states the additional obligations explicitly; this is not a renewed finding about the settled source access.
- argos and blr retain their settled uncertified status. No replacement source request is made. S02 concerns the wrong bibliographic identity, independently of access. BLR §7.5 Theorem 4 is also identified through jsw lines 1405–1409, but that quotation is not independent inspection of BLR.
- The saito extraction locates the characteristic-zero theorem and its explicit inclusion of residue characteristic two at lines 29–50, but drops the displayed character formula after line 50. Its exact sign cannot be certified from that missing display. This is an extraction limitation, not an asserted source error or a request to reopen an access waiver.
- The source audit certifies the specified locator groups and the computations shown, not every intermediate argument on every cited page. Long constructions, general spectral estimates and every local isogeny deformation theorem have not been formally proved by this review. Rows marked “boundary control” or “conditional” retain that limitation.
- No fresh Lean elaboration was run. The supplied actual elaborated theorem type was compared with the complete file and README, while the spurious extracted “that” declaration was rejected as an extractor error. There are no changed Lean signatures requiring a second elaboration.
- Approval of the completed roadmap remains conditional on the four declared supplier gaps. None was treated as missing ownership. No additional source-access request was created.

## Source issues

- **Error** in yuan-zhang at §6.2, printed p.579, yuan-zhang line 1932: the source says bounded local support suffices for convergence; it should be accompanied by growth control toward the removed subspace; affects the proof.
- **Gap** in yuan-zhang at Lemma 6.1(1), printed pp.582–583, yuan-zhang line 2088: the source says the codimension-zero coefficient contains only outer theta terms; it should explicitly exclude an equal inner truncation space, whose theta term also has codimension zero; affects the proof.
- **Misprint** in yuan-bigness-pku at §A.1, printed p.102, yuan-bigness-pku line 3468: the source says the probability measure occurs with coefficient one for a general divisor; it should have coefficient deg(D); affects a stated result.
- **Error** in dit at Theorem 4, printed pp.965–966, dit lines 669–695: the source says the nonzero normalized half-weight vector is unique; it should be determined only up to sign by the displayed coefficient products; affects a stated result.
- **Misprint** in gz86 at II §3 equation (3.5), printed p.244, gz86 line 764: the source says the bc term shares the ad coefficient; it should use −bc(D+B₁B₂)/2 instead of −bc(D−B₁B₂)/2; affects a stated result.
- **Misprint** in gz86 at II §5 equation (5.6), printed p.251, gz86 line 1013: the source says the final constant subtracts σ₁(m)(λ_N+2κ_N); it should subtract σ₁(m)(λ_N−2κ_N), consistently with (2.23); affects a stated result.
- **Misprint** in gz86 at III §9 proof of (9.7), printed p.266, gz86 lines 1630–1633: the source says the count modulo simultaneous sign is 2u²δ(n); it should be u²δ(n); affects the proof.
- **Misprint** in gz86 at III §9 before (9.8), printed p.266, gz86 line 1636: the source says the residue degree is p^f; it should give degree f and residue cardinality p^f; affects nothing.
- **Misprint** in gz86 at III §9 equation (9.8), printed p.266, gz86 line 1642: the source says α is congruent to a sign alone; it should say that sign times β, so zero belongs to the order; affects a stated result.
- **Gap** in gz86 at III §9 after (9.6) and (9.10), printed pp.265–266, gz86 lines 1607 and 1651: the source says the valuations agree without a norm-ideal correction; it should require p∤N𝔞 or subtract ord_p(N𝔞); affects the proof.
- **Gap** in gz86 at V §1 Corollary (1.3), printed p.309, gz86 lines 3259–3265: the source says parity and order-zero/one invariance establish order-at-least-three invariance in every sign; it should restrict that deduction to odd parity; even orders two and four remain indistinguished; affects the proof.
- **Misprint** in jsw at §5.1 after (5.1.a), printed p.32, jsw lines 1304–1307: the source says weight-two Petersson norm uses dxdy/y² without the weight factor; it should include y², giving dxdy; affects a stated result.
- **Misprint** in jsw at Remark 5.1.1(b), printed p.32, jsw line 1322: the source says the derivative index is j=n+1; it should be j=n−1 under its stated character substitution; affects a stated result.
- **Misprint** in brooks at the transition to §8.6, printed p.4239, brooks line 2099: the source says every summand uses P_χ; it should use the CM point P_a indexed by the summation ideal; affects a stated result.
- **Misprint** in brooks at Propositions 8.12–8.13, printed p.4239, brooks lines 2108 and 2115: the source says the special value contains one logarithm; it should contain its square, as in Theorem 8.11; affects a stated result.
- **Misprint** in brooks at §8.6 logarithm functoriality, printed p.4239, brooks line 2112: the source says the point is on the target C′; it should lie on the source C before applying φ; affects a stated result.
- **Error** in brooks at Proposition 8.13, printed p.4239, brooks lines 2113–2114: the source says the character-weighted divisor is K-rational for every central-critical character; it should retain the finite character's eigenspace and field, becoming K-rational in the trivial finite-character case; affects a stated result.
- **Error** in skinner-published at §2.6, printed p.343, skinner-published line 595: the source says an odd power of 2πi times real factors equals the real archimedean constant; it should compare that constant together with the CM-period normalization; affects a stated result.
- **Error** in yzz-book at the archimedean Green comparison, printed pp.231–232, documented by yzz-erratum-pku lines 279–285: the source says the resolvent Green function is admissible; it should be weakly admissible with mean −1 and an extra Eisenstein correction; affects the proof; corrected in print at yzz-erratum-pku item 62, p.7, and yuan-modular Theorem 4.3 and Remark 4.4, pp.67–69.
- **Misprint** in yzz-book at the resolvent integral, printed p.233, documented by yzz-erratum-pku lines 286–295: the source says the leading Legendre coefficient is 2; it should be 2Γ(2s+2)/(Γ(s+1)Γ(s+2)); affects the proof; corrected in print at yzz-erratum-pku item 63, p.7.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b5527a0293e27a92e7049b13ea1c53075d4c49a8", "job": "RT-GrossZagierAndArithmeticHeights~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
