<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6781605764 -->
Review (codex) of f7af1de

Verdict: needs_changes

1. **F01** (P2) Being killed by the raising operator does not imply being a weight vector

   **Location:** `packages/LieHighestWeightPartII/README.md:193`: “a nonzero vector killed by `ρ(e)` has weight at least `0`”.

   **Claim:** Every nonzero vector in the raising operator's kernel has an individual weight.

   **Witness:** In `M=V(0)⊕V(1)`, take `v=(1,v₊)`. Then `Ev=0`, but `Hv=(0,v₊)` is not `μv` for any scalar: the first coordinate forces `μ=0`, the second `μ=1`.

   **Exact repair:** Say “every nonzero `h`-eigenvector killed by `ρ(e)` has a nonnegative integral eigenvalue”; equivalently, the entire kernel is contained in the direct sum of the nonnegative integer eigenspaces. Add the mixed vector above as a negative-control Check. The pinned input actually has the eigenvector condition: `IsSl2Triple.disjoint_ker_toEnd_e_eigenspace`, `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`, concerns the intersection with a specified eigenspace; `IsSl2Triple.HasPrimitiveVectorWith`, `Mathlib/Algebra/Lie/Sl2.lean:79`, includes `lie_h` as well as `lie_e`.

   **Repair tested:** The two components of `v` have weights `0` and `1`, both nonnegative, so the corrected direct-sum assertion holds; `v` itself is not an eigenvector. On `V(1)`, the highest vector has weight `1` and is killed by `E`, whereas the weight `−1` vector is sent to the highest vector. The repaired assertion keeps both controls and does not alter the valid graded surjectivity/injectivity theorem preceding it.

2. **F02** (P2) Faithful matrix coefficients need not generate the coordinate algebra without antipodes

   **Location:** `packages/LieHighestWeightPartII/README.md:519`: “a faithful comodule, whose matrix coefficients generate `H`”.

   **Claim:** The coefficients of any faithful finite-dimensional comodule alone generate its coordinate Hopf algebra as an algebra.

   **Witness:** For `G=G_m`, the faithful character `z↦z` has sole coefficient `t`. It generates `ℂ[t]`, strictly smaller than `H=ℂ[t,t⁻¹]`: every polynomial has nonnegative exponents, whereas `t⁻¹` has exponent `−1`.

   **Exact repair:** Say that the matrix coefficients **together with their antipode images** generate `H`, or use the faithful comodule `M⊕M∨`, whose coefficients generate it. Alternatively use directly the injectivity on points of the faithful closed immersion and delete the generation clause. Add the one-dimensional torus Check. This is precisely the distinction in `TauCetiRoadmap/ReductiveGroups/README.md:1046–1065`: its faithful-comodule criterion includes the antipode images and its standard-character Check gives this same counterexample. The pin agrees: `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:235` defines `IsFaithful` by a closed immersion, and `:379` proves `isFaithful_iff_matrixCoefficientSubalgebra_prod_dual_eq_top`, with the dual included. The correct §5.3 tensor-generation argument already includes duals; retain that formulation.

   **Repair tested:** For `M⊕M∨` the coefficients are `t,t⁻¹`, generating all Laurent monomials `t^k`, `k∈ℤ`. For `s=2i`, the positive-part condition on `M` forces the action of `r` to be `2`; its dual action is then `1/2`. These determine the point uniquely. Thus the positive-part uniqueness and recognition headlines remain valid; the defect is the stated algebra-generation justification.

3. **F03** (P3) The new explicit invariant-form definition has no API list

   **Location:** `packages/LieHighestWeightPartII/README.md:268–277`: “Define `β_n` by …”; the paragraph is followed directly by `**Checks.**`.

   **Claim:** The new definition follows the required definition/API/Checks shape.

   **Witness:** Section 2.1 has four Check bullets but zero API bullets. Its invariance, nondegeneracy, transpose sign and proportionality facts are embedded in one paragraph, unlike the definition sections 0.1, 1.2, 3.2 and 3.3.

   **Exact repair:** Keep the actual basis-dependent definition and source locator, then list its API as prose bullets: Lie invariance; nondegeneracy; transpose sign `β_nᵀ=(−1)^nβ_n` and its symmetric/alternating consequences; scalar proportionality, explicitly consumed from the native theorem. Keep all four Checks. Do not add any declaration to `Suggested.lean` for this formatting repair.

   **Repair tested:** For `n=0,1,2,3`, the anti-diagonals are `(1)`, `(1,−1)`, `(1,−1,1)`, `(1,−1,1,−1)`; each determinant is `1` and the transpose signs are `+1,−1,+1,−1`. On `V(2)` the trace-form anti-diagonal is `(−2,2,−2)=−2β₂`. The API facts to be listed are mathematically correct.

Three findings: two P2 and one P3. All twelve round-2 findings are repaired. The submitted acceptance file elaborates with exactly eight `sorry` warnings. All fifteen seeded targets were checked against the four recorded source texts; all 23 numbered subsections were read. The computed adversarial evidence, signature audit, ownership audit and dependency output follow the findings. None of the four package inputs was modified.

## Verified sound

### Previous findings, checked first

The quotations in this table are short excerpts from the repaired package, not quotations from sources. No finding was marked not actionable in the preceding repair report, and no settled finding is re-raised.

| Round-2 finding | Repaired passage at this round | Disposition |
|---|---|---|
| R01: obsolete imports | `Suggested.lean:4–5`: `PointsAction.Basic`, `SemisimplePoint.Basic`; README:62 names the matching paths | Repaired. Original file passes at the prescribed pins. |
| R02: duplicate inner group | README:30: “Tau Ceti's `TauCeti.intLieAlgebra K L`”; all six conjugacy headlines use it | Repaired. `innerAutGroup` is absent; the rational structure is explicit. |
| R03: duplicate native proof steps | README:18: “Layers 0–3 consume these and do not prove them again”; README:54–56 names raising maps, label bounds, Cartan containment and form proportionality | Repaired. The zero-triple branch remains a genuine extension. R01 above is a different, imprecise consequence of the correct native raising-map theorem. |
| R04: so₂ called Killing | README:252: “for `r ≥ 2` the algebra `so(2r, K)`”; README:262: “its Killing matrix is `[0]`” | Repaired. Killing ranks at dimensions 2,3,4 are 0,3,6. |
| R05: empty very-even partition | README:281: “exactly when `dim V > 0` and the partition is very even” | Repaired, including §2.4 and the orthogonal Lean docstring. Empty dimension has one orbit. |
| R06: characteristic-two Check | README:113: “the remaining relation asks exactly `[e, f] = 0`” | Repaired. `(0,E,0)` works; `(0,E,F)` has bracket `I≠0`. |
| R07: false unipotent pattern equality | README:552: “take `s = s' = u`”; degree-zero dimensions are explicitly `1` and `2` for `u` and `1` | Repaired. Equal inputs give equal patterns; positive parts still need not be conjugate without semisimplicity. |
| R08: negative support bound | README:364: `B_T(a) = Σ_i ∣a_i∣ θ_i`; README:358: “contributes `r` to it” | Repaired. G₂ at `(−1,0)` has radius 3 and profile `(4,2,1,2)`; at zero its zero-weight space has dimension 14, not 2. |
| R09: reductive scope | README:543: “connected complex reductive group”; Suggested.lean:242 uses `TauCeti.reductiveCommHopfAlgProperty` | Repaired, including the torus Check and §5.2. R02 above concerns a separate justification exposed by that torus case. |
| R10: adjoint-group construction | README:145 names “ReductiveGroups §9B”, “§9A.1”, “9D” and “LieHighestWeight Layer 7” | Repaired. Those sections supply construction, Lie comparison and componentwise Serre identification. |
| R11: invariant-form locator | README:268: “KIR Theorem 5.6, equation (5.4)” | Repaired mathematically and bibliographically. `w_j=j!v_j` gives the stated ladder and invariant anti-diagonal. The newly explicit definition needs R03's shape repair. |
| R12: identity between distinct carriers | README:219: “the coordinate map of a chosen basis” | Repaired. For degree-at-most-one polynomials, `a+bX↦(a,b)` intertwines two zero actions. |

### Principles, shape and coverage

This is a Part II extension of LieHighestWeight, with a mathematical dependency order: triple/module comparisons feed classical and exceptional recognition independently, then factorwise semisimple recognition. The weight-pattern strand has separate group-theoretic inputs. No source chapter sequence dictates the plan. The finite candidate comparison is a mathematical finite-set assertion, not an algorithm target. The roadmap handles zero triples, low ranks, the very-even exception, both E₆ and E₇ directly, and central tori; no good-prime or route-specific shortcut was found.

All 23 subsections have at least three Check bullets. Every layer has Examples and Dependencies; all Needs lines were read. The definition/API shape exception is R03. The names attributed to this package resolve to its 13 declarations, with ordinary mathematical symbols distinguished from Lean identifiers. The eight theorem docstrings describe the actual objects. No `set_option`, sorry'd data, admitted example, `lemma`, extra import scheme, copied source passage, process/job identifier, local path or PR number was found in the package text. The four sources have one key each with legal provenance; the KIR entry now records §2.1 and the precise ladder locator. Metadata is the expected `math.RT` classification.

### Headline coverage and Lean verification

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The prescribed `lake env lean` command was run from the content checkout on the submitted `packages/LieHighestWeightPartII/Suggested.lean`: exit 0, exactly eight `declaration uses sorry` warnings, at lines 75, 92, 106, 123, 146, 173, 193 and 240. No build or dependency update was required.

A scratch copy appended `#check @name` for all 13 declarations and tried `simp`, `rfl` and `infer_instance` separately on every one of the eight admitted theorems, asserting failure to close each goal. It elaborated successfully: all 24 closure probes failed, all 13 types were printed, with only the eight remaining `sorry` warnings. Every printed type was compared with its README claim. No section binder disappeared. The rational Lie-algebra argument, all finite-dimensionality hypotheses, finite spin basis, line-zero condition, invertible 2, module universe `Type (max u v)`, reductivity, both semisimple-point hypotheses, both geometricity hypotheses and both positive-part predicates are retained. No package signature was changed.

The near-match suggestions were inspected at the pin: carrier definitions, weight-space transport/extensionality, root-triple existence, Killing-to-semisimple instances, and scalar/operator positive-part lemmas do not prove any recognition headline by a single `exact`. No one-lemma match or padding theorem was found. The elementary half-integrality argument remains accounted for in the docstring, rather than added as padding.

| README headline | Suggested.lean coverage |
|---|---|
| §1.3 recovery of the restricted sl₂-module | `finrank_weightFiltration_eq_iff_exists_intertwiner`, line 75 |
| §2.4 type A recognition | `exists_innerAut_of_finrank_weightFiltration_sl`, line 92 |
| §2.4 type C recognition | `exists_innerAut_of_finrank_weightFiltration_sp`, line 106 |
| §2.4 orthogonal recognition with an odd Jordan part | `exists_innerAut_of_finrank_weightFiltration_so`, line 123; explicit nonzero zero-eigenspace hypothesis |
| §§2.3–2.4 full type D recognition | `exists_innerAut_of_finrank_weightFiltration_typeD`, line 146; actual even half-spin action, not full spin |
| §3.4 exceptional adjoint recognition | `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`, line 173; all five types |
| §4.1 general semisimple recognition | `exists_innerAut_iff_finrank_weightFiltration`, line 193 |
| §4.1 prescribed finite factorwise test family | Docstring:27–31 names the unavailable assembled typed-factor/test-module decomposition; it is not replaced by an artificial predicate |
| §§5.1–5.2 highest-weight half-integrality | Docstring:33–35 explicitly accounts for the short supplier weight-coset consequence, kept in README |
| §5.5 positive-part recognition | `exists_conj_positiveRealPart_of_weightPattern_eq`, line 240; connected reductive scope |

### Computed adversarial pass

Rows cover every seeded target, every headline, every finding and the remaining numbered targets. Unchanged cases already computed in the round-2 table were also compared with that table; no section was accepted solely on its earlier generic summary. The root counts, candidate injectivity, CH table-profile membership and half-spin distributions below were independently recomputed this round. Root enumeration uses the declared reflection formula and Cartan orientation, not orbit tables as input.

| Statement | Instances | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.1 zero-inclusive predicate, exchange and homomorphism laws | zero; standard sl₂; exchange; zero map; 𝔽₂ | Zero: all three relations `0=0`, native `h≠0` false. Standard: `[E,F]=H`, `[H,E]=2E`, `[H,F]=−2F`. Exchange without changing h gives `−H≠H`; changing h gives `−H=−H`. Zero map sends all three brackets to 0. In 𝔽₂, `(0,E,0)` gives 0 throughout; `[E,F]=I≠0` rules out `(0,E,F)`. | Both directions of the characteristic-zero iff hold; repaired Check sound. |
| §0.2 adjoint image and twist normalization | SL₂, c=2; abelian L; so₈ outer reflection | `w(2)=[[0,2],[−1/2,0]]`; `w(2)w(1)⁻¹=diag(2,1/2)`; Ad sends E to 4E. `exp(ad E)H=H−2E`, matching matrix conjugation. Abelian ad is 0, so Int is `{1}`. Outer reflection exchanges half-spin top jumps 4 and 3. | Native inner carrier and algebraic adjoint convention agree. Inner invariance does not assert descent of half-spin to SO. |
| §0.3 raising maps and neutral conjugacy | zero; standard sl₂; rescaling | Zero on sl₂: `dim L₀=3`, image of E-action 0 equals `L₂=0`. Standard: `[E,H]=−2E`, image dimension 1 equals `dim L₂=1`; kernel on `L₋₂` is 0. `diag(2,1/2)` sends `(H,E,F)` to `(H,4E,F/4)`. | Repaired group construction and native raising maps apply. |
| §1.1 restriction | trivial K²; standard and exchanged triples; minimal triple in sl₃ | Trivial gives `2V(0)`. Standard and exchanged triples have spectra `±1`, related by coordinate swap. Minimal adjoint spectrum `2,1,1,0,0,−1,−1,−2` equals that of `V(2)⊕2V(1)⊕V(0)`. | Pullback and order of H/E/F pass. |
| §1.2 filtration definition, direction and zero branch | V(1), adjoint sl₂, zero module | V(1) jumps 1 at −1 and 1 at 1. Adjoint cumulative ranks at −2…2 are `1,1,2,2,3`; decreasing alternative gives `3,2,2,1,1`. Zero module gives 0 in every degree; zero triple gives 0 below 0 and dim M above. `[E,F]=H∉KF`. | Filtration, exhaustiveness and non-submodule warning pass. |
| §1.2 consequence about a vector killed by E | `V(0)⊕V(1)`, v=(1,v₊) | `Ev=0`; `Hv=(0,v₊)`; scalar eigenvector equation requires simultaneously `μ=0` and `μ=1`. Components have nonnegative weights 0 and 1. | R01. Corrected eigenspace/direct-sum formulations pass. |
| §1.3 multiplicity inversion and intertwiner iff | `V(2)⊕2V(0)`; V(2) versus V(1)⊕V(0); polynomial and coordinate carriers | `d₀=3,d₂=1` gives `m₀=2,m₂=1,W₀=4`; inverse strings recover d. The two 3-dimensional modules have cumulative arrays `1,1,2,2,3` and `0,1,2,3,3`, so no intertwiner. Trivial polynomial/coefficient carriers both jump by 2 at 0; the coordinate isomorphism sends action value 0 to 0. | Both iff directions and the repaired carrier map pass. |
| §1.4 exactness and strictness | projection `V(1)⊕V(0)→V(0)` | At degrees −1 and 0 the image-of-step dimensions are 0 and 1; intersection with target steps also has dimensions 0 and 1. The kernel-step dimensions are 1 and 1, and source-step dimensions 1 and 2. | Stepwise short exactness and strictness pass. |
| §1.4 tensors and duals | V(1)⊗V(1); V(1) dual; unit | Tensor graded values `1,2,1` at −2,0,2 give cumulative `1,1,3,3,4`. Dual ranks at −2…1 are `0,1,1,2`, equal to dimensions of `Ann W_(−i−1)`. Wrong shift gives 0 instead of 1 at −1. Unit and its dual jump by 1 at 0. | Tensor index and dual shift pass. |
| §2.0 classical models and rank ranges | so₂,so₃,so₄,so₅,so₆; rank 4 | Dimensions 1,3,6,10,15; so₂ Killing rank 0, so₃ rank 3, so₄ rank 6. D₂ roots are the two orthogonal pairs `±(ε₁−ε₂)`, `±(ε₁+ε₂)`. Rank-4 dimensions `28=4+24`, `36=4+32` for C/B. | Separate Killing/simple ranges and small-rank coincidences pass. |
| §2.1 explicit β and invariance | n=0,1,2,3; identity pairing | Anti-diagonals `(1)`, `(1,−1)`, `(1,−1,1)`, `(1,−1,1,−1)` all have determinant 1 and transpose signs +,−,+,−. f-invariance gives `(-1)^(j+1)+(-1)^j=0`; e-invariance gives the same cancellation times `j(n−j+1)`. The identity form on V(1) gives h-invariance sum `1+1=2≠0`. | Mathematics and source conversion pass; R03 only requires API bullets. |
| §2.1 adjoint normalization | n=2, basis E,−H,−2F | Trace-pairing anti-diagonal `(−2,2,−2)` equals `−2(1,−1,1)`. H-invariance alone allows independent outer and middle anti-diagonal coefficients; E/F impose their negative ratio. | Scale and non-example pass. |
| §2.2 partitions and splitting | sp₄; so₄; so₈; zero space | sp₄ `(3,1)` has forbidden odd-part multiplicities 1,1, while `(2,2)` is allowed. so₄ `(2,2)` gives 2 SO classes, `(3,1)` gives 1. Reflection determinant on V(n)⊗line is `(-1)^(n+1)`. Empty partition gives 1 class, because O=SO=1. | Positive-dimension qualification repairs the splitting iff. |
| §2.3 half-spin separation | a=(3,3,1,1), (1,1,1,1), (1,1), with last sign reversed | First S⁺ distributions: `{-4:1,-2:1,0:4,2:1,4:1}` versus `{-3:2,-1:2,1:2,3:2}`. Second: `{-2:1,0:6,2:1}` versus `{-1:4,1:4}`. Rank 2: `{-1:1,1:1}` versus `{0:2}`. Maxima `(4,3),(2,1),(1,0)` equal `(A,A−a_r)`. | Correct parity summand separates. Full spin adds both distributions and cannot separate. |
| §2.3 minuscule convention | ω_r and 2ω_r | Pairings with `±ε_i±ε_j` are `½(±1±1)∈{−1,0,1}` for ω_r; with ε₁+ε₂ the doubled weight gives 2. Subtracting that root gives `(0,0,1,…,1)`, outside the sign orbit of `(1,…,1)`. | Wrong doubled-weight model excluded. |
| §2.4 A/C headlines | sl₀,sl₁,sp₀; sl₃; sp₂ | Zero algebras have only zero triple and identity conjugator. sl₃ minimal/regular standard spectra `(1,0,−1)` and `(2,0,−2)` differ. sp₂ zero/standard jumps are `2@0` and `1@−1,1@1`. | General signatures retain boundaries and distinguish classes. |
| §2.4 orthogonal and type-D headlines | so₀,so₁,so₂,so₇; split ranks 0,1,2,4 | so₀ zero-eigenspace is bottom, so hker false; so₁/so₂ only zero triple. Odd dimension forces an odd block, hence nonzero kernel. `(4,4)` has standard spectrum `±3,±1` each twice, kernel 0, but spin maxima 4/3. Split rank 0 has S⁺ dimension 1; rank 1 only zero triple; rank 2 standard restrictions both `2V(1)`, spin `V(1)` versus `2V(0)`. | The kernel restriction and added half-spin hypothesis are substantive and correct. |
| §3.1 dominant characteristics | sl₂; G₂ (2,0); E₆ opposition | sl₂ dominant label 2; zero label 0. G₂ (2,0) profile `4,0,2,0,1,0,2` has `d₄=1<d₆=2`. E₆ opposition leaves `3⁴=81` labels out of `3⁶=729`. For W=S₂, invariant x² distinguishes orbits ±1 and ±2 by values 1 and 4. | Bounds, opposition and dominant uniqueness pass. |
| §3.2 root-profile definition and support | zero; negative G₂ label; principal G₂/F₄ | Zero profiles have `D₀=14,52,78,133,248`; Cartans contribute only ranks `2,4,6,7,8`. G₂ (−1,0) has nonnegative half `(4,2,1,2)`, radius `3=Σ∣a_i∣θ_i`, total 14. Principal G₂ has `(2,0,2,0,1,0,1,0,1,0,1)`. Principal F₄ has `D₀=4,F₀=28`, total 52 rather than root-only 48. | Repaired bound and zero-space wording pass. |
| §3.3 candidate definition and injectivity | exhaustive ternary labels in all five types | Root counts `12,48,72,126,240`; candidate counts `7,28,34,274,245`; distinct profile counts exactly `7,28,34,274,245`. E₆ without opposition: 212 candidates, only 123 profiles. G₂ extra candidates (1,1),(1,2) give `(2,2,1,1,1,1)` and `(2,1,1,1,1,1,0,1)`. | Finite strengthened assertion passes, without identifying candidates with orbits. |
| §3.4 exceptional headline | five G₂ classes; zero in each type; classical negative control | G₂ profiles `14`; `(4,4,1)`; `(4,2,1,2)`; `(4,0,4,0,1)`; principal row above are five different vectors. Zero filtration jump is dim L. so₈ very-even pair has equal adjoint distributions, since its outer automorphism intertwines adjoint actions. | Adjoint recognition holds for the stated exceptional types, not arbitrary simple types. |
| §3.5 all CH numerical table rows | 70 E₈,16 F₄,5 G₂ rows | All 91 rows match a unique computed candidate profile, have stated top degree, and reflected total `248,52,14` respectively. Principal top degrees `58,22,10`, rank entries `8,4,2`. F₄ rows `(22,14,1)` and `(22,8,7)` both total 52. | All 88 nonzero profiles also match the converted diagrams in DG Tables 2,3,6 bijectively; the remaining three are zero. Graded interpretation passes. |
| §4.1 semisimple recognition and finite family | zero; sl₂×sl₂, (t,0)/(0,t) | Zero has identity conjugator. Product adjoint weights are `2,0,−2,0,0,0` for both triples; first-factor standard cumulative ranks at −1 are 1 versus 0, with jumps `1@±1` versus `2@0`. | Factor-selective modules exclude swaps of isomorphic ideals; both recognition directions agree. |
| §§5.1–5.2 coset and highest-weight tests | A₁; Q=0; missing root condition; G_m/PGL₂ | α=2ω and ν(α)=1/2 give ν(ω)=1/4, ν(3ω)=3/4, all outside ½ℤ; adjoint values ±1/2,0 lie inside. If ν(α)=1/3, λ=0 has value 0 inside while μ=α is outside. Q=0 gives singleton λ. PGL₂ weights kα give k/2; a torus character k gives exactly the one test ν(k). | Both iff directions, central torus and actual character lattice pass. |
| §5.3 patterns, tensor, dual, geometricity | zero/unit; SL₂ diagonal; q=1; Jordan block; nongeometric diagonals | Patterns 0,δ₀, and `1@±1`; tensor square `1,2,1@−2,0,2`; dual reverses indices. At q=1 every index selects modulus 1, so q>1 matters. J₂(√q) contributes 1 not 2. At q=3, powers of 2 or 5 equal powers of √3 only at exponent 0: both SL₂ diagonals retain only zero-weight multiplicities. | Semisimple/geometric hypotheses prevent the undercount and omitted-modulus counterexamples. |
| §5.4 torus part and predicate | SL₂ diag(z,z⁻¹), z=i; unipotent u; faithful G_m character | Positive eigenvalues `∣z∣,∣z∣⁻¹`; at i both equal 1 while s has eigenvalues i,−i. For u, both u and 1 act by 1 on every fixed vector. G_m coefficient algebra `ℂ[t]≠ℂ[t,t⁻¹]`; adding dual coefficient t⁻¹ yields equality. | Predicate pins the actual part at semisimple points. R02 fixes coefficient generation. |
| §5.5 reductive recognition | phase/Weyl pairs; identity; u; G_m; trivial group | Phase/Weyl pairs give equal positive traces `√q+1/√q`; identity trace is 2. Corrected s=s'=u gives equal standard pattern value 1, but r=u and r'=1 are not conjugate. G_m at q=4, s=2i,s'=2 gives `1@k` and positive trace `2^k` on character k; both r=2. Trivial group has g=1. | Eight admitted headlines remain mathematically sound on the tested instances. |

### Seeded source audit

All four manifest texts were read legally from the supplied cache. No cited source was missing or marked unverified; published-edition numbering is expressly not claimed. No source fetch or manifest edit was needed. The table distinguishes a theorem stated in the text from a consequence established by the package's own route.

| Seeded target | Locator and text read | Support and scope |
|---|---|---|
| 0.1 | CH §2.1, relations (2.1), printed p.6; CH line 272 and CH line 279 | Characteristic-zero algebraically closed setting and all three brackets; no nonzero restriction in the definition. |
| 0.2 | CH Appendix Lemma 10.9, printed p.35; CH line 1701 through CH line 1708 | All Lie modules and adjoint conjugacy are the source context. Equality with the exponential inner group and the intertwiner construction are the package's argument using the named native and ReductiveGroups inputs, not a separate theorem at this locator. |
| 1.2 | CH Definition 2.2, printed p.6; CH line 284 through CH line 295 | Increasing filtration and the +2 raising convention; the integer-eigenspace formula realizes it. The source does not supply the malformed arbitrary-vector consequence in R01. |
| 1.4 | Same Definition 2.2 | Symmetric monoidal filtration; strict exactness and the dual shift are explicitly derived here from eigenspaces. |
| 2.0 | KIR Theorem 6.33, printed p.75, KIR line 2919; Appendix C.1–C.4, printed pp.124–129, KIR lines 4760,4835,4888,4958 | Correct root lists and orthogonal dimension >2. KIR works over ℝ/ℂ; arbitrary K is justified by the algebraic supplier comparisons, not attributed to the source alone. |
| 2.1 | KIR Theorem 5.6, equation (5.4), printed p.61; KIR line 2369 through KIR line 2375 | Source basis has f(v_j)=(j+1)v_(j+1); w_j=j!v_j gives the repaired ladder. Invariant β, parity and the trace normalization follow by the displayed computations. |
| 2.2 | CH Lemma 10.9 proof, printed p.35; CH line 1709 through CH line 1718 | Partition parametrization and positive-dimensional very-even splitting. The general-K form proof and empty-space exception are explicitly supplied by the package. |
| 2.3 | CH Lemma 10.9 proof, printed p.35; CH line 1716 through CH line 1727 | Half-spin separation; the source's coordinate and largest-filtration-index slips are corrected by the package. |
| 2.4 | CH line 1709 through CH line 1727, same lemma/page | Standard-module recognition with the even-orthogonal ambiguity and half-spin remedy. Small ranks are checked separately. |
| 3.1 | SOM §3.1, printed pp.15–16, SOM line 361 through SOM line 380; DG §2, printed p.3, DG line 83 through DG line 94 | Neutral-element injectivity and 0/1/2 labels. Native general-field theorems supply the repaired label/Cartan steps; opposition and inequalities follow from module theory. |
| 3.2 | DG §2, printed p.3; DG line 83 through DG line 89 | Root-space decomposition and evaluation at h. Counting and the absolute-value support bound are stated consequences, independently checked. |
| 3.4 | CH Lemma 10.9 proof, printed p.35; CH line 1728 through CH line 1733 | Source asserts exceptional separation but its E₈-to-Levi argument is insufficient. This package's separate E₆/E₇ finite proofs pass the exhaustive check. |
| 3.5 | CH Tables 2–4, printed pp.36–37; CH line 1734 through CH line 1837; DG Appendix A Tables 2–6, printed pp.7–16 | All CH numeric rows were compared with computed profiles and with all 4/15/69 nonzero DG diagrams. Headers must denote graded multiplicities. No E₆/E₇ table is claimed in CH. |
| 4.1 | CH Lemma 2.4, printed p.6, CH line 296 through CH line 300; Appendix Lemma 10.9, printed p.35, CH line 1701 | Semisimple all-module theorem and simple refinements; factorwise assembly supplies the finite test family. |
| 5.1 | CH §6.12, proof of Lemma 6.30, printed p.24; CH line 1163 through CH line 1171 | Root-coset subtraction proves the claim; its extension to an arbitrary additive subgroup is the same additive argument, not a claim that CH states that abstraction. |

Additional changed-source checks: DG Lemmas 2–3, printed p.4, DG line 139 through DG line 153 gives the centralizer differential and dense-orbit route; the orbit is open by the cited orbit geometry. CH Proposition 10.2, printed p.32, CH line 1554 through CH line 1565 proves recognition by traces, with connected reductive context at CH line 314. Definition 2.5, printed p.7, CH line 323 includes arithmetic algebraicity/all embeddings; the roadmap explicitly uses its complex-modulus version. No arithmetic condition is silently claimed.

The additional DG table audit converted its E-type display order `(a₁,a₃,a₂,a₄,…)` to Bourbaki order, reversed its G₂ order, and kept its F₄ order. The 4,15,69 nonzero diagrams in DG Tables 2,3,6 give precisely the nonzero profiles in CH Tables 4,3,2, respectively, with no missing or duplicate profile. For example DG line 300 gives `(2,2,0,2)`, matching CH’s F₄(a₁) row `(6,0,6,0,5,0,4,0,3,0,3,0,1,0,1)`; DG line 785 gives `(2,0,0,2,0,2,2,2)`, matching CH’s E₈(a₃) row with top 34 and initial values `(14,0,14,0,12)`. The differing row names are intentional in DG (DG line 265).

An extra E₇ comparison found a source misprint, confirmed visually on the cached PDF’s printed p.11. DG lines 476 and 481 give D₅+A₁ and D₆(a₁) the same diagram. This does not affect the package: it uses the E₇ orbit count, but proves profile injectivity on its independently defined candidate set.

| Additional source check | Computed values on both sides | Result |
|---|---|---|
| DG Table 5, D₅+A₁ diagram | Printed Bourbaki labels `(2,1,1,0,1,0,2)` give profile `(11,8,8,8,6,6,6,4,4,4,3,2,1,0,1)`. The listed representative’s simple roots 17,1,15,19,18,16 (DG Table 10, DG line 904) form D₅+A₁. Solving its Cartan equations against the vector of twos gives coroot coefficients `(8,14,18,10,10,1)`, hence dominant labels `(2,1,1,0,1,1,0)` and profile `(11,8,8,8,6,6,6,4,5,4,2,2,1,0,1)`. | Source misprint. The 44 nonzero E₇ entries have 43 distinct printed diagrams, and 44 after this correction. Package count 45 including zero remains correct. |

### Native declarations and object ownership

The following are direct inspections at the stated pins. They are also the substantive near-match checks: none of these carrier, decomposition or transport declarations is itself one of the eight filtration/positive-part recognition headlines. The 74 explicitly qualified library identifiers extracted from the README have declaration matches; common terminal names were disambiguated by namespace and the cited source paths, not accepted on basename alone.

| Object / declaration | Pinned file and line | Relevant contract checked |
|---|---|---|
| `IsSl2Triple`, `HasPrimitiveVectorWith` | `Mathlib/Algebra/Lie/Sl2.lean:38`, `:79` | Triple includes h≠0; primitive vector includes both eigenvector and raising-kernel conditions. |
| `LieModule.toEnd`, `LieAlgebra.ad` | `Mathlib/Algebra/Lie/OfAssociative.lean:186`, `:196` | Lie-module action and adjoint action, with bracket XY−YX. |
| `Module.End.eigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423` | Ordinary eigenspace, kernel of f−μ, not generalized multiplicity. |
| `Module.finrank`, `DirectSum.IsInternal` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/Algebra/DirectSum/Basic.lean:440` | Cardinal-to-natural rank; bijective direct-sum map. Finite hypotheses in headlines avoid infinite-rank junk. |
| `LieAlgebra.IsKilling`, root system | `Mathlib/Algebra/Lie/Killing.lean:50`; `Mathlib/Algebra/Lie/Weights/RootSystem.lean:411` | Nondegenerate Killing form; split Cartan root pairing. |
| Classical carriers `sl`, `sp`, `so`, `typeD`, `typeB` | `Mathlib/Algebra/Lie/Classical.lean:92`, `:157`, `:166`, `:252`, `:321` | Trace-zero and form-preserving matrix subalgebras on finite index types. |
| `typeDEquivSo'`, `typeBEquivSo'`, `soIndefiniteEquiv`, `Matrix.reindexLieEquiv` | Same classical file `:290`, `:373`, `:224`; `Mathlib/Algebra/Lie/Matrix.lean:85` | Invertible 2, an actual square root of −1, and index equivalence respectively. |
| Cartan existence | `Mathlib/Algebra/Lie/CartanExists.lean:374`; `TauCeti/Algebra/Lie/CartanExists.lean:45` | Finite dimension/infinite field; second theorem places an ad-semisimple element in a Cartan. |
| `Matrix.ToLieAlgebra`, five exceptional abbreviations | `Mathlib/Algebra/Lie/SerreConstruction.lean:145`, `:152–164` | Serre quotient definitions; finite-dimensional Killing structure is not supplied there. |
| `CategoryTheory.FilteredObject` | `Mathlib/CategoryTheory/Filtration/Basic.lean:73` | Underlying object plus mono-over filtration; no assertion that filtered objects form an abelian category. |
| `TauCeti.lieHomOfSl2Basis` | `TauCeti/Algebra/Lie/Sl2/Basic.lean:359` | Source basis and three target relations; zero target allowed. |
| Integral spectrum/decomposition | `TauCeti/Algebra/Lie/Sl2/Spectrum.lean:151`, `:327`, `:341` | `exists_int_of_hasEigenvalue`, `iSup_eigenspace_toEnd_intCast_eq_top`, `isInternal_eigenspace_toEnd_intCast`; nonzero native triple, finite module, characteristic zero. |
| Standard decomposition/irreducibility and weight symmetry | `TauCeti/Algebra/Lie/Sl2/Decomposition.lean:68`; `Standard.lean:956`; `WeightMultiplicity.lean:167` | Finite internal decomposition into actual standard modules; irreducibility; μ/−μ dimensions. |
| Raising-map results | `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`, `:188`, `:209` | Negative-eigenspace injectivity, allowed-weight surjectivity, adjoint degree 0→2. |
| Label bound | `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Basic.lean:124` | Split Cartan, root base, native triple and natural simple-root values. |
| Invariant-form proportionality | `TauCeti/Algebra/Lie/InvariantForm/Basic.lean:141` | Finite irreducible module over an algebraically closed field, invariant forms, one nonzero. No construction/parity conclusion. |
| Rational structure and exponential | `TauCeti/Algebra/Lie/InnerAutomorphism.lean:99`, `:109`, `:188`; `Mathlib/Algebra/Lie/Derivation/Basic.lean:398` | Rational scalar structure and finite nilpotent exponential; associative conjugation formula. |
| Inner group and action | `TauCeti/Algebra/Lie/AdjointAction/InnerAutomorphismGroup.lean:70`, `:108` | Closure of nilpotent adjoint exponentials in GL, and actual bracket-preserving Lie equivalence. |
| Cartan conjugacy; Weyl automorphism | `TauCeti/Algebra/Lie/AdjointAction/CartanConjugacy.lean:74`; `TauCeti/Algebra/Lie/Sl2/Weyl/Automorphism.lean:116`, `:330` | Int-conjugacy; three exponentials and membership in Int. |
| Ad-nilpotent elements and module action | `TauCeti/Algebra/Lie/Killing/AdNilpotent.lean:211`; `TauCeti/RepresentationTheory/Lie/AdNilpotent.lean:95` | Killing hypothesis needed for nilpotence on every finite module. |
| Jacobson–Morozov and fixed-e conjugacy | `TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean:87`, `:228`; `TauCeti/Algebra/Lie/AdjointAction/ExpAdSubgroup.lean:101` | General characteristic-zero existence, fixed-e conjugator and its inner-group inclusion. These also resolve the general-field Lie-theoretic inputs independently of complex orbit geometry. |
| Dynkin matrices, rank ranges, root counts, opposition | `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:219`, `:153`; `NumberOfRoots.lean:45`; `Opposition.lean:198` | Bourbaki G₂ transpose; classification ranges; root counts; base permutation from −w₀. |
| Polarization and parity spaces | `TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:83`; `HalfSpin/Basic.lean:119`, `:125` | Genuine decomposition equivalence, perfect pairing and separating law; even/odd exterior spaces. Finite b and line=0 force the finite split case. |
| Half-spin actions, irreducibility, weights | `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean:96`, `:111`; `Polarization/Irreducible.lean:201`; `TypeD/CartanWeights.lean:131`; `TypeD/Character.lean:47` | Actual typeD action; sign +½ on exterior subset, −½ outside; multiplicity one. |
| Highest vector and typeD structure | `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/HighestWeight.lean:197`; `TauCeti/Algebra/Lie/Orthogonal/TypeD/Killing.lean:265`, `:308`; `TypeD/Basis.lean:45` | Highest-vector result uses even rank ≥4; simple/Killing results use rank ≥4. Lower-rank cases are separate. |
| Finite Hopf algebras and comodules | `TauCeti/Algebra/AlgebraicGroup/FiniteType/CommHopfAlgCat.lean:68`; `TauCeti/Algebra/Coalgebra/Comodule/Finite/Basic.lean:95` | Finite-type coordinate algebra; finite comodules. These do not themselves assert reductivity. |
| Point action and semisimple points | `TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction/Basic.lean:102`; `SemisimplePoint/Basic.lean:81` | Action on underlying comodule and semisimplicity on every finite comodule. |
| Reductivity and classical group inputs | `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`; `SpecialOrthogonal/Reductive.lean:149`; `Symplectic/Reductive/Basic.lean:102` | Smoothness, geometric connectedness, trivial connected normal smooth unipotent subgroups. SO needs 2≠0; Sp works over every field. |

Paths abbreviated inside a table cell share that cell's fully written library directory; they are not paths to unpinned copies.

### Cross-roadmap citations, overlaps and supply order

The board package index was read first; its three packages have unrelated subjects. Object searches used `roadmaps grep` across supplied open heads and main for neutral elements, very-even classes, half-spin/filtration recognition, invariant forms, positive real parts and the package namespace. The five nearest open revisions were read: LieHighestWeight #1797/#1220, SpinRepresentations #1207, ReductiveGroups #1332 and ClassicalGroups #1192. The new supplier ReductiveGroupsPartIII was read at its open head. Revisions of existing roadmaps were not used as new dependencies.

No second owner of this package's recognition objects or duplicate fully qualified acceptance declaration was found. The general invariant-form sign in LieHighestWeight #1220, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1130`, differs from the explicit rank-one anti-diagonal form here. SpinRepresentations #1207 consumes the native exterior/type-D core at `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:279–291`; this package consumes it too and owns the separation consequence. ClassicalGroups #1192, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:12–23`, owns rational classical representations/branching, not triple recognition. ReductiveGroups #1332, `TauCetiRoadmap/ReductiveGroups/README.md:11–24`, owns group dictionaries and structure, not the weight-pattern invariant.

The supplied overlap report has no shared-file conflict, dropped cited id, or id defined only by an open revision. The former-layer maps in RootSystems and LieHighestWeight #1220 preserve the cited old numbering. No ownership move or added supplier gap is needed. Consumer design-label references previously identified outside this package are not re-raised.

| Citation | Current resolution and checked scope |
|---|---|
| LieHighestWeight Layers 0–6 | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319`, `:351`, `:370`, `:405`, `:537`, `:567`, `:773`: rank-one modules, roots, weights, highest weights, irreducibles, complete reducibility and characters. Where this package uses a native instance of that input it names it explicitly. |
| LieHighestWeight Layer 7 | Same README:980 for restriction/invariants; :1158–1195 for the normalized Serre presentation and explicit componentwise semisimple assembly. This supplies the repaired identification in §0.3. |
| LieHighestWeight Layers 8–9 | Same README:1197 and :1432: exceptional models and the reductive/gl diagonal framework. The B/C matrix-root comparison instead comes from ReductiveGroups 9A. |
| NilpotentOrbits N0/N2/N4 | `TauCetiRoadmap/NilpotentOrbits/README.md:13`, `:101`, `:113`, `:162`, `:169`, `:187`, `:215`: complex geometry, fixed-e triples, weighted diagrams and type-A partitions. `TauCetiRoadmap/NilpotentOrbits/Suggested.lean:124` additionally states general-field Jacobson–Morozov. Native existence and fixed-e conjugacy were opened above; the complex geometry is not a general-K orbit-classification input. |
| RootSystems old Layers 4–6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:1134–1138` maps them to native chamber, classification and numbered integral-root-data owners. No drift from the old numbering. |
| SpinRepresentations Layer 5 | `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:777`, Layer 5; its native Fock core is explicitly consumed at :270–308. The package's general-K half-spin action is supplied by Tau Ceti, rather than inferred from a complex-only statement. |
| ReductiveGroups Layers 1–7 | `TauCetiRoadmap/ReductiveGroups/README.md:1030`, `:1230`, `:1262`, `:1687`, `:1880`, `:1949`, `:2253`: representations, tangent/adjoint, orbit/centralizer, Jordan/tori, exponential, reductive groups, roots/Bruhat. Its faithful-coefficient criterion is the witness to R02. |
| ReductiveGroups 9A,9B,9D,10B | Same README:3046–3061, :3286–3330, construction in 9B, :3846–3854, :4087 onward: rational pinned Lie comparison, classical folded models, integral split group construction, existence/isomorphism, rational highest weights. |
| ReductiveGroupsPartIII §§0.3/0.5 | `TauCetiRoadmap/ReductiveGroupsPartIII/README.md`, open head, headings “Group Chevalley restriction” and “Characters separate semisimple classes”: class-function restriction and trace separation over an algebraically closed field, central directions retained. Both statements match Layer 5. |
| NoncompactQuantumSymmetry Layer 3 | `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1038–1048`, open head: real-Lie-group adjoint/inner comparison. This is a scope distinction, not an input to the algebraic theorem. |

The automated resolver found no unresolved roadmap citation or Lean name within the roadmap index. It expressly did not inspect the pins; the native checks above were performed separately. The dependency check on the unmodified package returned:

```
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All Needs edges point to earlier layers, main roadmaps, or the earlier new supplier ReductiveGroupsPartIII. The package declares no supplier gaps. The three findings are local repairs and do not require changing the roadmap's scope or merge order.

## Not verifiable

- Published CH/DG editions and the Cambridge edition of KIR were not collated with the cached preprint/draft numbering. The manifest and References explicitly identify the versions actually read; all sampled locators in those versions were readable.
- DG deliberately uses alternative orbit labels (DG line 265). The complete numerical diagram/profile bijections were checked, including common labels; an independent classification proof of every alternative Bala–Carter name was not reconstructed. The package explicitly treats names as row labels.
- Source assertions about unpublished computations and the E₈-to-Levi shortcut were not independently recovered from that proof. The roadmap's replacement direct E₆/E₇ computation was verified.

No missing-reference request is needed: all four cited works are accessible. These limits do not conceal a failing elaboration or a missing sampled theorem locator.

## Source issues

- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1720: the source combines ascending neutral coordinates with descending-chain simple roots; it should reverse the chain roots or reverse the coordinates; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1726: the source takes the largest index with nonzero increasing filtration; it should take the largest nonzero graded index or largest filtration jump; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.36–37, CH lines 1734,1813,1831: the source labels graded multiplicities as filtration dimensions; it should label graded-piece dimensions, whose cumulative sums give filtration dimensions; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1731: the source infers E₆/E₇ adjoint separation from E₈ by Levi inclusion; it should justify complementary summands and descent of conjugacy, or verify those types independently; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source puts the target adjoint automorphism on the source side of the homomorphism; it should postcompose the sl₂-to-g homomorphism by the automorphism of g; affects nothing.
- **Error** in KIR at Appendix C.2/C.4, printed pp.125/128, KIR lines 4828,4951: the source describes right multiplication by the Gram matrix as a Lie-algebra isomorphism; it should use conjugation by a genuine congruence between the forms; affects a stated result.
- **Misprint** in KIR at Appendix C.4, printed p.128, KIR line 4951: the source calls the even orthogonal model odd-dimensional; it should name so(2n,C); affects nothing.
- **Misprint** in KIR at Theorem 5.7(2), printed p.62, KIR line 2414: the source reverses the raising and lowering isomorphism directions; it should use e^n from weight −n to n and f^n from n to −n; affects a stated result.
- **Misprint** in DG at Appendix A, Table 5, printed p.11, DG line 476: the source gives D₅+A₁ the same diagram as D₆(a₁), namely (2,1,1,0,1,0,2) in Bourbaki order; it should be (2,1,1,0,1,1,0), as computed from its listed D₅+A₁ representative; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f7af1de261efe3182b4804344c851c8593fe6383", "job": "REV-PKG-LieHighestWeightPartII~3", "model": "gpt-6-astra", "worker": "chris-32"} -->
