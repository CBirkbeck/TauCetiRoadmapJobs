# Review of FarguesFontaineDiamonds (pull request #964 at c7b5024)
**Verdict:** needs changes

## R01 (P1) — Replace nonexistent supplier identifiers

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:999`, also lines 39, 258–262, 1001 and 1011. The dependency names are “`push_globalSections`, `push_limits`” and “`etTensor`”.

**Claim:** DiamondEtaleCohomology supplies these named interfaces in C3.2 and C3.8.

**Witness:** At the supplied supplier head, neither its README nor Suggested.lean contains any of the three identifiers. `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1010` and `:1103` instead specify the operations in prose. Its Suggested.lean explicitly leaves C3 in the README.

**Repair:** Cite C3.2's limit-preserving right adjoint and mapping-object definition of global sections, and C3.8's restricted symmetric monoidal tensor, by section and mathematical description. Remove these three purported supplier names everywhere. No new supplier target or gap is needed: the mathematics is already owned there. This is P1 under the review's explicit missing-supplier-declaration rule, not a claim that the mathematical operations are absent. Test: with Λ=𝔽₃, the actual C3.8 unit calculation is Λ⊗ᴸ_ΛΛ=Λ, and the actual C3.2 identity pushforward sends Λ to Λ and preserves its constant tower.

## R02 (P2) — State the discrete comparisons at their available generality

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:125` and `:937`: “a commutative ring `Λ` killed by an `ℓ`-power, with `ℓ` a prime different from `p`”. This restricts the targets at lines 961, 985, 997 and 1009.

**Claim:** The discrete left-completion, bounded-below, sections and tensor comparisons are only developed in that coefficient range.

**Witness:** ECD line 3633 (Proposition 14.15, p.88) and line 4078 (Lemma 17.7, p.100) have no such coefficient restriction. DiamondEtaleCohomology C2.2/C2.5/C2.12 and C3.2/C3.8 likewise supply these operations for general coefficients.

**Repair:** State these four discrete comparisons for every commutative discrete coefficient ring. Keep the regular-ideal and prime-to-p-integer hypotheses on the separate adic comparison. Keep ℓ-primary coefficients as examples. Test the repaired statement with p=2 and Λ=𝔽₂: at a geometric étale point both categories give D(𝔽₂), the constant unit maps to 𝔽₂, its tensor square is 𝔽₂, and its degree-zero section map is a↦a. Discrete ℤ₂ is also allowed by the site comparison; this does not assert an adic ℤ₂ comparison. The restriction currently discards supplied general theory contrary to the general-library requirement.

## R03 (P3) — Remove undeclared Lean names from README API and Check lists

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:397`: “`affinoid_product_forward` (data)”; similarly all ten API blocks and the named Checks, for example line 404.

**Claim:** These backticked names designate this roadmap's declarations.

**Witness:** `TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean:35` opens an empty namespace; there are zero declarations. The README itself confirms that at line 1081. The passing name scanner does not establish the required README–Lean agreement.

**Repair:** Express the README-only targets, API bullets and Checks in mathematical prose, referencing their subsection titles. Retain backticks for actual library/supplier declarations and mathematical formulas. Do not add artificial Lean definitions or API theorems. For example, the forward-map bullet can simply specify the two coordinates; on the Kummer untilt these are still (id,u), with [t]↦p.

## R04 (P3) — Use the required Lean namespace and timeless availability note

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean:31` and `:35`: “These signatures are deferred” and “namespace TauCeti.FFDiamond”.

**Claim:** The file uses the required target-signature form.

**Witness:** The prescribed namespace is `TauCetiRoadmap.FarguesFontaineDiamonds`; the current empty namespace differs. The word “deferred” adds process framing after the already sufficient missing-carrier explanation.

**Repair:** Change both namespace lines to `TauCetiRoadmap.FarguesFontaineDiamonds`, remove the deferred sentence, and explicitly say the file states statable headline theorems against the pinned APIs and none are currently statable. Keep the individual mathematical missing-carrier explanations. The file remains one import, one module docstring, zero declarations and zero admitted propositions; changing the empty namespace cannot change a theorem's meaning.

## R05 (P3) — Record the four sources in the source manifest

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:1101`, References, through line 1121.

**Claim:** FS, SW, ECD and KL are the four identifiable source editions underlying the targets.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml only. There is no `TauCetiRoadmap/FarguesFontaineDiamonds/sources.toml`; the citations therefore have no required manifest records.

**Repair:** Add one `tauceti-roadmap-sources/v1` record for each of FS, SW, ECD and KL, retaining the edition/version, legal origin, locator and fetch provenance. The review fetched all four successfully; no replacement source is needed. FS's fetched SHA-256 is exactly the hash already printed in the README. Preserve that edition and ECD v4/KL v5 rather than silently changing numbering. This review has not edited the manifest.

## R06 (P3) — Supply a third discriminating Cartier Check

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:705`–710. The third bullet says “Closed image on one chart alone is insufficient”.

**Claim:** The definition block has three discriminating Checks.

**Witness:** The first two give actual ideals and quotients; the third repeats the criterion's quantifier and cites a warning without an instantiated object or computed outcome. It does not distinguish an embedded ideal from its support.

**Repair:** Retain the warning in prose and add an explicit Check on K⟨T⟩ comparing (T) and (T²). Both supports are the origin and both generators are regular, but the quotients are K and K[ε]/(ε²), of K-dimensions 1 and 2. A support-only model identifies them and fails this Check; the specified embedded-ideal definition distinguishes them. This supplies a third concrete Check without changing the definition.

## R07 (P3) — Repair navigation to the completed supplier and name downstream ownership

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:1130`, the `adic-anchor` reference; also lines 50–54 and the transition to References at line 1092.

**Claim:** The main-branch AdicSpaces link resolves and the exclusions have named owners.

**Witness:** On reviewed main 3ec8d5f, the supplier is `Completed/AdicSpaces/README.md:691`; `TauCetiRoadmap/AdicSpaces/README.md` is absent. “their own roadmaps” names no owner for the excluded extensions, and there is no Downstream consumers section.

**Repair:** Point `adic-anchor` to `Completed/AdicSpaces/README.md#layer-6-the-adic-farguesfontaine-curve`. Add the required downstream section and resolve the excluded general-base/coefficient, vector-bundle and divisor-moduli work to named roadmaps and sections, as consumers where later in order. Do not create an upward Needs edge. Following the repaired link reaches §§6.1–6.4, including the actual chart and choice-transport contracts used here.

## Verified sound

This is an independent AI review. I reviewed both requested files at c7b50246bf7206344f0342e9e6f22bc7ec7970b8, all 37 named construction/theorem targets (counting the Cartier criterion), their APIs and Checks, every Needs line, all ten API blocks selected by the repeated sample label, and all four cited source editions. No previous review was supplied. There were no explicitly unverified locators in the README. The following are checks of statements and concrete instances, not claims that an elaboration proves the roadmap's geometry.

**Principles and ownership.** The fixed-field objects are an extension of Completed/AdicSpaces Layer 6, not a replacement plan for them. Its Q_p coefficient scope agrees with that supplier; ramified and relative carriers are not silently assumed. The algebraic theta kernel, generic tilting, diamondification and general coefficient reconstruction are assigned to their suppliers. F4 explicitly owns the boundary approximation/fiber argument rather than using principality as a closedness proof. I found no computational algorithm, copied source passage, sorry-valued data or set_option. No file outside this folder changes in the PR diff. The only supply defect established is R01; the mathematical supplier statements themselves exist. R02 concerns unnecessary loss of generality in the discrete comparison, independently of the fixed-field geometric scope.

**Build and dependency results.** The worker's full gate at this head passed every scanner, metadata, file-scope, dependency and targeted-build check. I separately elaborated Suggested.lean with `lake env lean` from the worktree: exit 0, no diagnostics. The separately run prescribed dependency command returned exactly:

```text
depcheck: 164 roadmaps, 1171 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I did not modify the merge order. The worktree was clean before and after the review.

**Headline inventory and Lean audit.** F0's analytic/scalar/chart interfaces; F1's bounded correspondence and product isomorphism; F2's equivariance, graph relation and effective quotient; F3's site-compatible sheaf and finite-cover descent; F4's boundary/multiplication estimates, closed Cartier immersions, exact divisor sequence and marking-orbit descent; and F5's enhanced and adic equivalences, tensor/reduction and actual section maps are the headline families. The module docstring explicitly lists all six families and their missing carriers. The pinned FF files contain a valuative locus and a topological orbit quotient, not the required period-annulus/sheaf constructions. Algebraic PreTilt and theta do not provide marked perfectoid spaces or their sites. Scheme Cartier divisors do not provide analytic closed Cartier ideals. The ordinary derived and categorical APIs do not supply the enhanced coefficient categories. No headline forced through a stand-in, omitted statable headline, or padding theorem was found. There are **zero local declarations**, so the requested per-declaration `#check @name` and one-tactic sorry probes have zero targets. I separately elaborated **17 library #checks**; they all resolved, including the generated additive antilipschitz name. No binder was silently lost from a local declaration because none exists.

**Source sample.** There are exactly ten `**API.**` blocks, so I checked all ten rather than guessing which occurrences the ten identical sample labels meant. Page numbers below are printed pages, not the extraction's PDF page offsets. Each source's relevant hypotheses, direction and locator were read. Additional F0, F2, root-annulus and finite-descent locators were checked as listed afterward.

| API block (README line) | Source text read | Result |
| --- | --- | --- |
| Affinoid product (395) | FS line 1838, II.1.2 p.49; line 2098, II.1.17 p.55 | Bounded marked-map dictionary and generic open give both factors; empty test is allowed. |
| Product isomorphism (437) | FS line 1838 and line 2098 | Naturally glued isomorphism; projection and two-coordinate extensionality follow. |
| Quotient isomorphism (554) | FS line 2067, II.1.15–17 pp.54–55 | Positive generator scales radius by p; quotient action is on S. |
| Sheaf descent (620) | ECD line 3735, 15.5/15.6 p.91; line 1957, 9.7 pp.47–48 | Site comparison and descent support the construction. The cyclic cocycle formula is derived from the graph relation, not printed as a named source theorem. |
| Cartier ideal/closedness (691) | SW line 1740, 5.3.2 p.38; line 1783, 5.3.7 pp.39–40; line 1793, 5.3.8 p.40 | Locally free embedded ideal, all-open-affinoid closedness, and integral-closure quotient plus ring agree. R06 concerns the Checks. |
| Sections/untilts (726) | FS line 1869, II.1.4 pp.49–50; line 2104, II.1.18 p.55 | Sections correspond to marked untilts; no map X^◇→S is needed. |
| Divisor on Y (847) | FS line 1876 and line 2108; SW line 1793 and line 3785 | Actual Cartier immersion, closed rational quotients and unit-change invariance agree. |
| Divisor on X (883) | FS line 2108, II.1.18 p.55 | The composite into X is closed Cartier; the ideal is not asserted globally principal. |
| Completed derived comparison (971) | ECD line 3625, 14.13–15 p.88 | Left completion and bounded-below agreement are correct; the available coefficient range is wider (R02). |
| Adic comparison (1037) | ECD line 6717 and line 6728, 26.1–3 pp.161–162 | Finite regular ideal, prime-to-p integer, enhanced inverse limit, completed tensor and non-Noetherian allowance agree. |

Also read: FS line 1796–1835 for the integral Witt topology, root chart and t₁-sharp ratio; FS line 1880–1911 and SW line 3785–3820 for the boundary argument and positive lower bound; FS line 2116–2122 for open-cover versus v-sheaf untilt quotients; SW line 4245–4276 and line 4394–4399 for the geometric analytic example and curve quotient; ECD line 2175–2199 for finite étale descent; ECD line 4018–4027 and line 4078–4088 for adjoints and tensor; KL line 6361–6401 for the public étale convention and sheafiness warning. SW Lecture 13 uses an algebraically closed field; the general-F assertion here is supported by FS and the AdicSpaces supplier, not by silently dropping SW's hypothesis.

**Adversarial computations.** In the tables, F_t is the completed perfection of 𝔽_p((t)), u is the Kummer untilt with t-sharp=p, G is a geometric étale point, K is a complete nonarchimedean field, and A=K⟨T⟩. “Pass” means the displayed instance agrees, together with the source/supplier checks above; it is not a numerical proof of the general theorem. The fraction/window calculations were also recomputed in a scratch script.

| Statement or convention | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| Generic locus, README 63–70 | p in valuation support, [ϖ] outside | D(p[ϖ])=false; D(p)∩D([ϖ])=false; the union=true | Pass; union is correctly excluded. |
| Positive radius, 79–84 | p=2,3; κ=1 | log(r^p)/log(r)=p, versus inverse generator 1/p | Pass. |
| Window convention, 92–97 | p=2 and 3 | c=3/2 and 2; 1<c<p in both cases | Pass. |
| Plus-ring units, 72–77 | p in Q_p and Z_p | inverse p⁻¹ exists in Q_p, absent in Z_p | Pass; Tate/plus units distinguished. |
| Sharp is multiplicative | t and t in F_t | (t²)-sharp=p²=(t-sharp)² | Pass; no additive-sharp assertion. |
| Locally constant graph labels | two disjoint nonempty tests | labels (0,1) exist locally; no constant n has (n,n)=(0,1) | Pass. |
| KL finite étale/cover convention | identity, split double cover, empty cover | degrees 1,2,0; images X,X,∅ | Pass; empty cover only covers ∅. |
| Adic coefficient convention | Z₃,(3),p=2; Z₂,(2),p=2 | 3∈I is prime to 2; no odd integer lies in (2) | Pass for the adic hypotheses. |
| analytic_interface, 319 | generic chart and characteristic-p boundary | p is a nonzero topologically nilpotent unit on the generic chart; p=0 at the boundary | Pass. |
| qp_factorisation, 331 | p=2; zero target; nonzero char-2 target | 2·(1/2)=1; 0=1 in zero ring; 0≠1 in nonzero char 2 | Pass, including empty space. |
| chart_category_interface, 343 | identity wandering chart restriction | ring/plus maps are id; both product projections restrict to the same original chart maps | Pass via A1.16. |
| bounded_witt_theta, 373 | F_t, m=0,1,2 | [t^(1/p^m)]↦p^(1/p^m) on both constructions | Pass; p-power relations retained. |
| affinoid_product, 385 | T=∅ and T=S | cardinalities 1=1·1; i_u↦(id,u)↦i_u | Pass. |
| point_naturality, 415 | g=id; two nested restrictions r,s | (f,u)=(f∘id,id* u); (f∘r∘s,s*r*u) on both paths | Pass. |
| product_iso, 427 | section i_u; two maps differing by Frobenius | coordinates (id,u); (φ_S,u) differs from (id,u) on t↦t^p versus t | Pass; forgetting first factor fails. |
| projection_field_naturality, 452 | F=F′, identity; extension to completed algebraic closure | [t] maps to p along either path; second coordinate is u along either path | Pass. |
| frobenius_equivariance, 484 | p=2,3; t-sharp=p | [t] after φ maps to 4,27; inverse φ would give sqrt(2), cubert(3) | Pass; κ becomes 2,3. |
| adic_graph_relation, 496 | p=2; U₀ against V₀ | k=0 intersection {3/2}; k=1 intersection {1}; all other k empty | Pass; two components retained. |
| diamond_graph_relation, 508 | labels 0,1,−1; disconnected test | diagonal=(y,y); inverse labels sum 0; (0,1) is valid locally | Pass. |
| diamond_quotient_cover, 520 | a geometric point and a wandering chart | full fiber ℤ, chart fiber {*}; q(U₀)∪q(V₀)=X | Pass; q is not qc. |
| effective_quotient, 532 | constant h with value a; labels (0,1) | h(φ^n y)=a=h(y); one descended constant map | Pass; both labels descend. |
| quotient_iso, 544 | y and φy | π(α(y))=π(φ_S f,u)=π(f,u) | Pass. |
| quotient_spatiality_choices, 568 | p=2 and 3, U₀/V₀ | overlap radii {1,3/2} and {1,2}; two qc pieces in either case | Pass; finite translate bound d/b≤p^k≤e/a. |
| chart_site_compatibility, 598 | split cover restricted twice | {1,2} restricts to {1,2} along both paths; each sheet map remains its original inclusion | Pass. |
| sheaf_descent, 610 | constant 𝔽₃ sheaf with c=2 | c₀=1, c₁=2, c₂=1, c₋₁=2; c₁c₁=1=c₂ | Pass in the explicit module scope. |
| finite_cover_descent, 634 | split double cover, sheet transposition τ | τ²=id; τ⁻¹=τ; two sheets after restriction | Pass; invariant sections alone lose τ. |
| AnalyticCartierIdeal, 679 | (1),(T),(T²), zero ideal in A | quotients 0,K,K[ε]/ε²,A; first three ideals rank 1, zero ideal rank 0 | Pass; multiplicity Check needed (R06). |
| IsClosedCartier / analytic_cartier_closed_iff, 680–687 | (1),(T),(T²) in A | closed ideal=true and adic quotient=true in each; quotient K-dimensions 0,1,2 | Pass in these instances. |
| section_untilt_equiv, 716 | u and u∘φ_S | graphs (id,u), (id,u∘φ_S); both first projections id | Pass; different marking is retained. |
| primitive_equation_interface, 740 | ϖ=t, a=1 in Kummer example | θ(p−[t])=p−p=0; quotient of W(O_F) is O_(F-sharp) | Pass. |
| root_extension_frame, 752 | 1 and b⊗p^(1/p) | σ(1)=1; σ(p^(1/p))=0; retraction gives b and 0 | Pass; coefficient projection is linear, not a ring map. |
| root_annulus_tilt, 764 | p=2; boundary with equal absolute values of p and [ϖ] | t₁-sharp=p/[ϖ] has norm 1; π²=[ϖ]; s_(m+1)^2=s_m | Pass. |
| Root-chart coverage Check, 770 | p=2, V₀ | κ∈[3/2,2] outside κ≤1; inverse translate [3/4,1] inside | Pass. |
| Root cancellation Check, 775–787 | ratios in R and Z/4 | (2^(1/2^(m+1)))²=2^(1/2^m); with denominator 0, 2²=0≠2 mod 4 | Pass; unit denominator is essential. |
| boundary_supremum, 791 | disc radius r; b=T^j, j=0,1,2 | whole-disc sup r^j equals boundary sup r^j; at j=0 both 1 | Pass; finite-root/fiber passages remain explicit proof targets. |
| Gauge transport, 795 | p=2 and 3 | (2⁻²)^(1/2)=1/2; (2⁻³)^(log(3)/(3log(2)))=1/3 | Pass; same power on both gauges. |
| multiplication_lower_bound, 807 | n=2, p=2,3, b=1; b=0 | boundary products 1/4,1/9 match p⁻²·1; 0=constant·0 | Pass; inverse-sign bound would fail. |
| rational_strict_exactness, 819 | ξ=1 and ξ=0 in a nonzero complete normed field | range=whole field, quotient=0; for ξ=0,c>0: 0≥c·1 is false | Pass; c=0 would not imply injectivity. |
| untilt_closed_divisor, 837 | geometric untilt; disjoint chart | integral quotient O_C, analytic quotient C; disjoint-chart quotient 0 | Pass. |
| untilt_sheaf_exactness, 861 | disjoint chart; generator replaced by vξ | kernel/cokernel of unit multiplication 0/0; (vξ)(v⁻¹b)=ξb | Pass; inverse unit is in first vertical map. |
| curve_untilt_divisor, 873 | Kummer radius 1, p=2 | translated radii …,1/2,1,2,… distinct; all map to one quotient point | Pass; local finiteness in bounded windows. |
| untilt_quotient_sections_field, 897 | non-algebraically-closed F_t | The underlying space of Spa(F_t,O_F_t) has one point; integer-valued locally constant maps are ℤ; quotient lifts differ by one integer | Pass using FS's open-cover quotient assertion. |
| untilt_orbit_invariance, 917 | n=1,−1 | (φ,id)(id,u)φ⁻¹=(id,uφ⁻¹); qφ=q and qφ⁻¹=q | Pass; resetting first coordinate reverses marking exponent. |
| completed_derived_equiv, 961 | G, Λ=𝔽₃; G, p=2,Λ=𝔽₂ | both sides D(Λ); unit has H⁰=Λ, Hⁱ=0 for i≠0 | Generalize second instance (R02); repair names (R01). |
| ordinary_bounded_below, 985 | Λ[0] and Λ[1] | H⁰(Λ[0])=Λ; H⁻¹(Λ[1])=Λ on both paths | Pass; unnecessary coefficient restriction R02. |
| completed_global_sections, 997 | G; A=⊕_(j≥0)Λ[j] | H⁻ʲ of each sufficiently long truncation and its limit is Λ; comparison is id in each degree | Pass; uses RΓ's limit preservation, not invariant sections. |
| derived_pullback_tensor, 1009 | G, Λ=𝔽₃ and 𝔽₂; Λ[1]⊗Λ[−1] | tensor=Λ[0] on both sides; unit tensor Λ⊗Λ=Λ | Pass after coefficient generalization and supplier-name repair. |
| AdicEtaleCurve / adic_derived_equiv, 1021 | G,Λ=Z₃,I=(3); n=1,2 | levels Z/3,Z/9; limit unit Z₃; (Z/9)⊗ᴸ_(Z/9)Z/3=Z/3 | Pass; enhanced rather than ordinary category limit. |
| Non-Noetherian coefficient Check, 1052 | R=(∏_m𝔽₃)[[t]], I=(t), p=2 | tf=0 implies every coefficient f_m=0; R/tⁿ=(∏𝔽₃)[t]/tⁿ; 3=0∈I | Pass; no Noetherian condition is needed. |
| adic_global_sections, 1056 | G, constant completed Z₃ and its shift; zero | reductions Z/3ⁿ, Z/3ⁿ[1],0; transitions are ordinary reductions on both paths | Pass; preserve derived reduction on general objects. |

The two adversarial tables contain **87 rows**. The following additional rows cover **each API bullet** in the ten sampled blocks, including both directions of extensionality claims. They use the same examples and are separate from the source-locator table.

| API statement (README line) | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| affinoid_product_forward (397) | Kummer i_u | α(i_u)=(id,u) | Pass; remove synthetic name, R03. |
| affinoid_product_inverse (398) | (id,u) | [t]↦p on inverse and θ | Pass; R03. |
| affinoid_product_inverse_formula (399) | t,t^(1/p),1 | p,p^(1/p),1 from both maps | Pass; R03. |
| affinoid_product_ext (400) | (id,u) against itself and (φ,u) | equality true/true in first pair; false/false in second since t≠t^p | Pass both directions; R03. |
| product_iso_apply (439) | S, i_u | α_F(i_u)=α_S(i_u)=(id,u) | Pass; R03. |
| product_iso_inverse (440) | (id,u), empty test | i_u on both paths; unique point on both empty-test paths | Pass; R03. |
| product_iso_over_qp (441) | i_u | second projection=u=structural untilt | Pass; R03. |
| product_iso_ext (442) | same versus Frobenius first coordinate | true iff (true and true); false iff (false and true) | Pass both directions; R03. |
| quotient_iso_square (556) | y,φy | both composites equal [α(y)] for each | Pass; R03. |
| quotient_iso_over_qp (557) | (f,u),(φf,u) | both quotient projections=u | Pass; R03. |
| quotient_iso_unique (558) | a competing map with same cover composite | value at [y] forced to [α(y)] | Pass via effective epi; R03. |
| sheaf_descent_pullback (622) | constant sheaf, identity cocycle | pullback constant Λ; c₀=c₁=1 | Pass; R03. |
| sheaf_descent_inverse (623) | two sheets with τ=(12) | one descended cover, local degree 2; τ²=id | Pass; R03. |
| sheaf_descent_cocycle (624) | c=2 on 𝔽₃, m=n=1 and n=−1 | c₂=1=2·2; c₀=1=2·2 | Pass; R03. |
| AnalyticCartierIdeal.support (693) | (1),(T),(T²) | ∅,{0},{0} from each quotient support | Pass; equal support does not imply equal ideal. |
| restrict and transport (694–696) | restrict (T) to T≠0; identity isomorphism | ideal becomes (1); identity transport returns (T) | Pass; R03. |
| unit_change (697) | −T and T in K⟨T⟩ | (−T)=(T); both quotients K | Pass; R03. |
| IsClosedCartier.restrict and glue (698–700) | (T) on disc and punctured complement | quotient K on divisor chart, zero off support; glued quotient K | Pass; R03. |
| quotient_pair (701) | disc origin over K | quotient pair (K,O_K) on both descriptions | Pass; R03. |
| section_untilt_equiv_graph (728) | u | α⁻¹(id,u)=i_u | Pass; R03. |
| section_untilt_equiv_projection (729) | u,uφ | both first projections id | Pass; R03. |
| section_untilt_equiv_recover (730) | u,uφ | second projections u,uφ respectively | Pass; R03. |
| untilt_closed_divisor_equation (849) | ξ=p−[t] | θξ=0; ideal on chart ξB | Pass; R03. |
| untilt_closed_divisor_quotient (850) | chart containing geometric untilt; disjoint chart | (C,O_C); (0,0), respectively | Pass; R03. |
| untilt_closed_divisor_unit_change (851) | ξ and −ξ | same principal ideal and same quotient map kernel | Pass; R03. |
| curve_untilt_divisor_map (885) | i_u point y | image is q(y) on both descriptions | Pass; R03. |
| curve_untilt_divisor_chart (886) | n=0 and n=1 wandering lifts | primitive ideals transported by id and φ, respectively | Pass; their quotient fields are the same untilt field. |
| curve_untilt_divisor_pullback (887) | p=2, radius 1 | support radii 2^n, n∈ℤ, on both sides; finitely many in [a,b] | Pass; R03. |
| completed_derived_equiv_t_exact (973) | Λ[0],Λ[1] | only H⁰=Λ and only H⁻¹=Λ, respectively, on both sides | Pass; R02/R03. |
| completed_derived_equiv_heart (974) | constant Λ | degree-zero object and map a↦a on both routes | Pass; R02/R03. |
| completed_derived_equiv_inverse (975) | constant Λ and shift | inverse composite=id_Λ and id_(Λ[1]) | Pass; R02/R03. |
| AdicEtaleCurve.reduce (1039) | completed Z₃ unit, n=1,2 | Z/3 and Z/9 | Pass; R03. |
| AdicEtaleCurve.map_ext (1040) | maps between completed units at G | Map(unit,unit) has π₀=Z₃=lim Z/3ⁿ, higher homotopy 0 | Pass in this example; general mapping spaces retain coherence. |
| AdicEtaleCurve.coefficient_limit (1042) | unit tower | coherent (1 mod 3ⁿ)_n corresponds to 1∈Z₃ | Pass; R03. |
| adic_derived_equiv_reduce (1044) | unit, n=1,2 | E_n(Z/3ⁿ)=Z/3ⁿ=E(unit) mod 3ⁿ | Pass; R03. |
| adic_derived_equiv_complete_tensor (1045) | completed unit with itself | Z₃⊗̂Z₃=Z₃; reductions Z/3ⁿ | Pass; R03. |
| adic_derived_equiv_inverse_limit (1046) | compatible unit maps | transition 1 mod 3^(n+1)↦1 mod 3ⁿ; limit map id_(Z₃) | Pass; R03. |

Noncommutative automorphism check: on a constant three-sheeted object take a=(12), b=(23) in S₃. Then ab≠ba, while the cyclic cocycle generated by a has c₂=id and c₋₁=a. A sheaf map b does not intertwine this cocycle with itself. Thus “morphisms intertwine c” is substantive even though the acting exponent group ℤ is abelian. Rank-zero coefficient objects, the empty perfectoid test, zero quotients and p=2 are included above. Nonreduced thickenings do not enter the perfectoid-test category as perfectoid objects; (T²) instead legitimately tests the Cartier quotient. Trivial/discrete valuations, q=1 and ramified coefficient fields are outside the explicit fixed-field input, not hidden divisions by zero. Here p≥2, ϖ is nonzero topologically nilpotent, and logarithmic denominators at rank-one points are strictly negative.

**Pinned declarations opened.** Pins were checked in lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. File names in this table are relative to the indicated library repository. I read the declaration bodies/signatures rather than inferring their content from names.

| Library file and line | Declaration(s), supplied content and limits |
| --- | --- |
| Mathlib `Mathlib/RingTheory/WittVector/Basic.lean:253` | WittVector.map is the ring map induced by a coefficient ring homomorphism, with prime p. |
| Mathlib `Mathlib/RingTheory/WittVector/Teichmuller.lean:119` | map_teichmuller supplies coefficientwise evaluation. |
| Mathlib `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:118`, `:165`, `:182` | Explicit nonunit-p and p-adic completeness assumptions, algebraic theta and Teichmüller evaluation; no analytic untilt carrier. |
| Mathlib `Mathlib/RingTheory/WittVector/Frobenius.lean:283` | frobeniusEquiv requires characteristic p and PerfectRing; it is an algebraic ring equivalence, not yet an adic automorphism. |
| Mathlib `Mathlib/CategoryTheory/Equivalence.lean:82` | Functor, inverse, unit, counit and triangle condition; no enhanced category supplied. |
| Mathlib `Mathlib/RingTheory/Ideal/Prime.lean:95` | IsPrime.mul_mem_iff_mem_or_mem; complement gives the intersection formula. |
| Mathlib `Mathlib/RingTheory/Ideal/Span.lean:100`, `:204` | span_singleton_mul_left_unit and span_singleton_eq_top; no new ideal theorem needed. |
| Mathlib `Mathlib/Logic/Equiv/Set.lean:129`; `Mathlib/Data/Set/Image.lean:247`, `:270` | Equiv.image_eq_iff_eq, Set.image_union and Set.image_univ_of_surjective. |
| Mathlib `Mathlib/Analysis/Normed/Group/Uniform.lean:132` | to_additive generates AddMonoidHomClass.antilipschitz_of_bound; the generated name was confirmed by Lean. |
| Mathlib `Mathlib/Topology/MetricSpace/Antilipschitz.lean:93`, `:175` | Injectivity needs a separated metric source; closed range needs complete source, separated target and uniform continuity. The complete normed-ring use supplies them. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean:377` | spaAnalytic_eq_spa_of_isTateRing; analyticity of the points, not a new period-annulus construction. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116`, `:122`, `:130`, `:158`, `:218` | spaY, its membership/open-locus description, analytic inclusion and Frobenius homeomorphism. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.lean:97`, `:103`, `:144`, `:255`, `:262`, `:551` | Order-theoretic radius bounds/scaling, both rational windows and disjointness of positive translates. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56`, `:67`, `:72`, `:166`, `:182`, `:200`, `:212` | Topological quotient, orbit relation, open window embeddings, two-chart cover, compactness and T0. The definition is a Quotient with a TopologicalSpace instance; it does not include the structure sheaf. |

**Resolved cross-roadmap contracts.** For roadmaps already on main I used main 3ec8d5f, including Completed/AdicSpaces and AdicSpacesPartII as the two format/reference roadmaps, not an open revision of those roadmaps. For new suppliers I read their indexed open heads using `roadmaps show`; line numbers here exclude that tool's one-line wrapper.

| Supplier | Exact locations resolved | Result |
| --- | --- | --- |
| Completed/AdicSpaces | `Completed/AdicSpaces/README.md:698`, `:729`, `:779`, `:807`, `:845` | §§6.1–6.4 own Witt input, windows, strongly noetherian compact annuli, actual quotient chart sheaf and choice transport. Broken link is R07. |
| AdicSpacesPartII | `TauCetiRoadmap/AdicSpacesPartII/README.md:2759`, `:2885`, `:3868`; §R0.3 | Banach completed tensor and exact_of_split really are README contracts; R0.8 requires quotient sheafiness and compatible kernels. The citation scanner's exact_of_split warning is a false lead, not a missing supplier. |
| AdicSpacesPartIII | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10181` | R3.5 gives continuous retraction and closed embedding on completed base change; F4 supplies its coefficient projection. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md:3780`, `:4079`, `:4167`, `:4525`, `:4611`, `:4652`, `:4799`, `:4870`, `:4912`, `:5049`; P2.2/P2.3/P2.11/P2.12 | Gauge normalization, sharp, integral tilt, primitive kernels, marked untilts, π-regular integral criterion, rational localization, gluing and slice equivalence are present. π=v₁ meets π^p∣p; using ϖ instead would not. |
| AdicEtaleGeometry | `TauCetiRoadmap/AdicEtaleGeometry/README.md:6272`, `:6341` (A1.16) | Fully faithful sheafy embedding and analytic Yoneda-adic fiber products exist as specified targets. |
| DiamondsAndVStacks | `TauCetiRoadmap/DiamondsAndVStacks/README.md:2046`, `:4857`, `:5371`, `:5928`, `:8633`, `:8741`, `:8803`, `:8927`, `:9008` | D0.26, D3.5/D3.9, D4.3, D6.1–D6.5 support graph quotient, finite descent, marked tests, Spd, open/product compatibility and both site equivalences. |
| DiamondEtaleCohomology | `TauCetiRoadmap/DiamondEtaleCohomology/README.md:786`, `:813`, `:821`, `:829`, `:863`, `:909`, `:1010`, `:1103`, `:1160` | C2 and C3 supply the mathematics; R01 identifies three stale names, R02 the narrower coefficient range. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:427`, `:1229`, `:2125`, `:2739`, `:2820`, `:2832` | §§0.1–0.4, E3.4, E2.3 and E4.5 supply enhancements, towers, completion, non-Noetherian regular-ideal reconstruction and perfect coefficient change. |
| AdicCoefficientsAndComparisons | `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:508`, `:548`, `:578` | The three L0 targets exist, with derived-complete objects, enhanced reconstruction and completed tensor; F5 transports them rather than rebuilding them. |

The citation scanner's other three leads, AnalyticCartierIdeal.unit_change, IsClosedCartier.quotient_pair and AdicEtaleCurve.coefficient_limit, are this roadmap's own README API labels. Their problem is the unsupported Lean-name presentation (R03), not an unowned external prerequisite.

Object-based searches used the pinned libraries, main roadmaps, the provided open-roadmap index (`roadmaps grep`, including a targeted Cartier/boundary search), relevant supplied sibling checkouts, and board package README/Suggested files. Generic scheme Cartier divisors, algebraic theta, normed-group closed-range theory, categorical equivalences and set-image identities are already owned and are cited rather than duplicated. The separate fixed-field diamond comparison and its analytic Cartier closedness argument were not found as existing targets in the reviewed main/supplier scope. Board designs for RelativeFarguesFontainePartII treat broader ramified/relative and primitive-degree calculations; AnalyticStacks Layer 7 concerns Cartier duality of bialgebras, a different object. No local fully qualified declaration can collide: this Suggested.lean has none. Broader relative/vector-bundle index hits are not evidence that their unprovided heads have been fully audited; see the limitation below.

## Not verifiable

- No source text was inaccessible: all four were retrieved legally through the sources service. No missing-reference request is needed. The absent source manifest is R05, not a claim that the papers cannot be read.
- The supplied open-head list does not provide VectorBundlesAndIsocrystals or RelativeFarguesFontaine checkout paths. Object searches expose these as broader-scope ownership leads, but this review does not certify their full head contents or resolve the unnamed downstream exclusions against them. R07 requests precise ownership citations; no speculative duplication finding is made from search snippets.
- There is no completed Lean formalization of the period-annulus, diamond or enhanced-category targets at these pins. Accordingly the computed examples and source checks above do not certify every arbitrary affinoid boundary-approximation passage or enhanced coherence by execution. These are explicit mathematical proof targets, not missing sources or accepted axioms.

## Source issues

- **Misprint** in ECD at the pullback-composition discussion immediately before Lemma 17.5, printed p.98 (ECD line 4017): the source says composition of pullbacks follows the written order of the two maps; it should be g* composed with f* for f composed with g; affects the proof.
