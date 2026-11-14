<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6869934317 -->
Review (codex) of 95b03fe

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Give the extension-class cup formula coefficients over the stated ring

   **Location.** `packages/CohomologyOfGroups/design/README.md:1422`: “where `c ∈ H²(Q, N^ab)` is the class”; also the conventions at line 152 and `packages/CohomologyOfGroups/design/plan.json:1638`, target 6.6 and its `d2_eq_neg_cup` API at line 1685.

   **Claim.** Section 6.6 promises the formula over every commutative `k`, using the cup product of 4.1–4.3. That product requires both coefficient objects to be in `Rep k Q`. The abelian group `N^ab` need not admit a `k`-module structure. Neither this target nor its prerequisites supplies a mixed integral/k-linear cup product or the scalar-change comparison needed to use the displayed integral class instead. This is an incomplete interface at the promised generality, not a claim that Hochschild–Serre's integral formula is false.

   **Witness.** Take `k=M=𝔽₃`, `N=3ℤ/27≅C₉`, `G=C₂₇`, `Q=C₃`. In `N^ab`, `3·1=3≠0`, impossible in an `𝔽₃`-module. Yet `u(3)=1` has transgression `df(2,1)=2`, for `f(i)=⌊i/3⌋ mod 3`.

   The pinned carrier requires the missing structure: `Mathlib/RepresentationTheory/Rep/Basic.lean:30` includes a `Module k V` field, and `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183` takes `A : Rep k G`. The roadmap's cup at README line 910 takes `M N P : Rep k G`. HS53 line 984–990 states the formula for abelian-group coefficients; it does not supply a `k`-module structure on the abelianized kernel.

   **Exact repair.** Keep arbitrary `k`. In the conventions and target 6.6, put `B_k = Additive(N^ab) ⊗_ℤ k`, with its quotient conjugation action. Define `c_k ∈ H²(Q,B_k)` directly from the normalized factor set followed by `b ↦ b ⊗ 1`. State its independence of section, and identify `Hom_ℤ(N^ab,M)` with `Hom_k(B_k,M)` by `φ(b ⊗ a)=a·φ(b)`. Use the equivariant evaluation `B_k ⊗_k Hom_k(B_k,M) → M` in the formula `d₂(u)=−c_k ∪ u`. Update the plan statement/API and add the C₉-in-C₂₇ instance as a Check. The existing integral extension-class convention can remain explicitly integral; its use in the k-linear formula must go through this defined scalarized cocycle.

   **Repair tested.** Here `B_k=C₉⊗𝔽₃≅𝔽₃`, the scalarized carry is `1` at `(2,1)`, and `−c_k∪u=2=df(2,1)`. I checked all 729 pairs of elements of C₂₇: `df(a,b)` equals the negative carry of their residues modulo 3. The original C₃-in-C₉ sign Check still gives `2`; the split extension gives `0`. Thus the repair keeps the nonzero transgression and does not exclude groups whose abelianized kernel has exponent larger than the characteristic.

2. **F02** (P2) Import the existing bar normalization of the Hopf map

   **Location.** `packages/CohomologyOfGroups/design/README.md:1485`: “Define `h : H₂(G, ℤ) → (R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`”; also the ownership claim at lines 96–98, the normalization API at lines 1508–1513, and `packages/CohomologyOfGroups/design/plan.json:1753` (6.8).

   **Claim.** The distinction from StableHomotopyKTheory's unspecified perfect-group identification is real, but it no longer establishes sole ownership of the normalization. Another earlier roadmap already owns the positive lifted-boundary adapter, its relative-cycle formula, naturality and torus sign. This roadmap defines that same adapter again without citing it.

   **Witness.** PR #1302, `TauCetiRoadmap/K2SymbolsBrauer/README.md:111`, §1.1, specifies the positive lifted boundary and `[a]−[b]↦ab⁻¹`; line 113 sends the ordered torus cycle to `[s,t]⁻¹`. These are precisely README lines 1485–1488 and 1522–1526 here.

   I opened the actual #1302 head. Its scope at line 9 assigns the bar-normalization adapter to K2SymbolsBrauer. Its §1.1 expressly leaves existence, bijectivity and presentation independence of the abstract Hopf equivalence to its supplier. This finding concerns the adapter, not a claim that K2SymbolsBrauer proves the general Hopf theorem. K2SymbolsBrauer is at `merge-order/ORDER.txt:89`, before IntegralIwasawaTheoryPartII at line 315, after which this candidate is placed.

   **Exact repair.** Assign the positive bar-boundary normalization and its torus-sign/naturality laws to K2SymbolsBrauer §1.1 in Scope and ownership, Exact supplier contracts, 6.8's Needs and the plan. State 6.8's remaining general-group bijectivity theorem for that imported normalized connecting map; retain the kernel/long-exact-sequence argument needed to prove the general theorem, but stop presenting the normalization adapter and its laws as a second local construction. Keep the torus computation as a comparison Check. Do not infer general bijectivity merely from K2SymbolsBrauer's normalization requirement, and do not add a reverse dependency from that earlier roadmap.

   **Repair tested.** For `ℤ²=⟨a,b | [a,b]⟩`, both maps send `[a|b]−[b|a]` to `ba(ab)⁻¹=[a,b]⁻¹`. In the unitriangular group over 𝔽₃, with `a=(1,0,0)`, `b=(0,1,0)`, their central coordinate is `2`; the opposite normalization gives `1`. Importing the existing adapter preserves the mathematical value and removes the duplicate ownership. The cyclic cases remain `H₂(C_n,ℤ)=0`.

Two findings, both P2. The previous round's sole finding is repaired. The design, plan and sources manifest were not changed. No maintainer notes were supplied.

## Verified sound

### Previous finding and repair audit

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| Round 7 F01: omitted flat, nonprojective coefficients in Künneth | Repaired | README lines 1105–1110 now say “one of `M`, `N` is flat over `k`” and “split (not naturally)”. Plan 5.1 has the same hypothesis. The new `gap:flat-kunneth` appears in both files, with supplier DerivedModuleAlgebra §0.2. |

The repair uses a larger ring class than the suggested PID clause. That is justified: over a ring of global dimension at most one, submodules of projectives are projective. Nonnegative projective replacements have projective cycles and boundaries, and their cycle inclusions split. The two tensor comparison maps are quasi-isomorphisms by bounded-below flatness. Tau Ceti's split Künneth sequence therefore transports to one degreewise-flat factor. Loh19 line 5854–5866 supports the PID case, and the README correctly labels that source's scope instead of attributing the entire hereditary-ring extension to it.

All changed passages were read: scope lines 67–73; the native Künneth contract; the new gap and its proof route; target 5.1, its two new Checks and Layer 5 dependencies; and the matching plan fields. The same restriction pattern was checked in 3.1, 5.2, 5.3 and 5.4. Projectivity in 3.1's Hom comparison is necessary; 5.2 uses free group chains with arbitrary coefficients; 5.3 uses a field; the field product clause in 5.4 is not a lost general-ring Künneth assertion. No further repair of F01 is needed.

The earlier cyclic-order and Hopf-boundary repairs also remain effective: 3.3 requires `m≥1` for the finite norm; 6.8's wrong-model Check separates the two constructions only for `n≥1` and explicitly treats `n=0`. No previous finding was marked not actionable, and neither new finding is a re-raising of a settled finding.

### Principles, shape and acceptance-file applicability

I read the eight layers and all 41 plan statements/hypothesis lists, their API and Check text, and every Needs line. There are 28 theorem targets, 10 definitions and 3 constructions, with 139 plan tests. Every definition/construction has API text and at least three Checks; all targets carry locators. The target prerequisite graph has no forward target edge. The required Summary, ownership, conventions, supplier contracts, build explanation, Examples, Dependencies, consumers and references are present. Main's DerivedModuleAlgebra, ProfiniteCohomology and ClassFieldTheory were also read for house shape.

Apart from R01 and R02, no route-specific narrowing, good-prime restriction, computational algorithm, copied example list, forbidden supplier, circular proof route, process narrative, HTML anchor or machine path was found in the design. The finite-group hypotheses are localized to the appropriate targets; the general coefficients are retained. Mathematical backticks such as `c_g`, `Θ` and `h` are formulas, not claims of existing Lean declarations. The fully qualified supplied identifiers were checked at the pins, including multiline declarations and namespace ambiguities that a suffix-only search cannot settle.

The seven explicitly named end theorems are Hochschild–Serre with its structure (6.2–6.7), the tree sequence (3.5), Künneth (5.1), double cosets (7.1), stable elements (7.2), Tate duality (8.1) and periodicity (8.5). The Summary additionally promises universal coefficients (5.2), the Pontryagin ring (5.4), Hopf's formula (6.8), all-degree cyclic cup periodicity (8.4), and periodicity from cohomologically trivial resolutions (8.3). All twelve have targets.

There is no `Suggested.lean` in this design package. Elaboration: **not available (this lane does not elaborate)**. Zero sorried theorems are available for the one-tactic probe, and there are zero local acceptance declarations for a `#check @name` binder audit. No passing elaboration, absence of padding in a future file, or completed headline-signature coverage check is claimed. Imports, sorry'd data, `set_option`, declaration/docstring form and actual binder retention must be checked when the package supplies its acceptance file. Their absence from a nonexistent file is not evidence of a package-stage pass.

### Computed adversarial table

Coefficients and actions are trivial unless specified. Current sampled targets, headlines, changed passages and both findings were checked afresh. For other unchanged passages I relied only on round 7's rows containing computed values, matching them against the current statements; no prose-only previous assurance was treated as a computation. Negative indices in ordinary homology and sums with negative total index are read as zero/empty, as the degree-zero Check in 5.1 explicitly requires; a future natural-number Lean signature must preserve that convention.

| Statement | Instances tried | Values computed on the two sides or against a wrong model | Result / change |
| --- | --- | --- | --- |
| Conjugation and quotient action, 1.1–1.2 | S₃, H=⟨(12)⟩, g=(123); C₄ with sign ℤ | `gHg⁻¹=⟨(23)⟩`, inverse convention gives `⟨(13)⟩`. For N=2ℤ/4, H⁰(N,ℤ)=ℤ and quotient generator acts −1, not +1. | Correct direction and coefficient action. |
| Additivity and permutation Shapiro, 1.3–1.4 | C₂ on C₂ disjoint union one point; empty sum; infinite free abelian group | H₀=ℤ² and H₁=ℤ/2 from stabilizers; summing over points gives wrong ℤ³. Empty sums give 0=0. Identity into ⊕ℕℤ has infinitely many coordinate maps, outside ⊕ℕHom(A,ℤ). | No infinite cohomological coproduct claim. |
| Discrete comparison, 1.5 | ℤ discrete or with profinite-induced topology; trivial group | Discrete H¹(ℤ,ℤ)=ℤ on both sides; continuous Hom in the latter topology is 0. For G=1 both theories give A in degree 0 and 0 above. Identity versus negative character on C₃ gives 1 versus 2. | Discreteness and sign normalization matter. |
| Hyperhomology and its two sequences, 2.1, 2.3 | C=(ℤ[S₃/A₃]→ℤ); G=1, shifted ℤ | H₀=0, H₁=ℤ/2, H₂=ℤ/3; naive coinvariants give the acyclic ℤ→id ℤ. A complex at degree −1 gives ℤ at degree −1, not degree 0. | Derived construction and shift correct. |
| Long exact sequences, 2.2 | G=1, degree-zero sequence 0→ℤ→×2ℤ→𝔽₂→0 | Kernel of reduction and image of ×2 are both 2ℤ; positive homology vanishes. Tensoring with 𝔽₂ gives first map 0 and fails injectivity. | Original degreewise exactness supplies the sequence. |
| Resolution coefficients, 3.1 | k=ℤ/4; flat nonprojective localization over ℤ | Tensoring the displayed nonsplit exact complex produces H₂=ℤ/2 instead of 0. For the localization resolution the dual equation forces `a₀=−1/3` in ℤ₂, impossible for integer a₀; H²≠0 versus H²(1,ℤ)=0. | Flat/projective distinction necessary. |
| Orbit sequence, 3.2 | Two-edge circle with C₂ reflection or rotation | Reflection: odd-q vertex terms are (ℤ/2)² and edge terms vanish for q>0. Rotation: q>0 row terms all vanish; quotient has H₀=H₁=ℤ. | Stabilizers, not cell count, determine the first page. |
| Free complexes, 3.3 | Double cover of circle, sign coefficients; cyclic m=1,2 | Sign quotient boundary is −2, giving (H₀,H₁)=(ℤ/2,0), versus (ℤ,ℤ) for constants. Finite cyclic differentials alternate 0,m; odd homology ℤ/m, positive even 0. | Constant-coefficient comparison and positive m bound retained. |
| Tree chains, 3.4 | Vertex, edge, loop, empty graph | Vertex sequence 0→0→k→id k→0. Edge boundary [v₁]−[v₀] has augmentation 0. Loop has nonzero kernel; empty graph would miss surjectivity onto k. | Native tree is connected and nonempty; counterexamples excluded. |
| Tree sequence, 3.5 | ℤ translating its line, trivial or sign ℤ | Edge map 0 gives H₀=H₁=ℤ; edge map −2 gives H₀=ℤ/2,H₁=0. Sum instead of difference gives wrong H₀=ℤ/2 in the trivial case. | Correct orientation and coefficient transport. |
| Amalgam/HNN/free group, 3.6 | C₄*₍C₂₎C₆; BS(1,2); F₂ with both generators −1 | Cokernel of 1↦(−2,3) is C₁₂. BS edge H₁ map 1−2=−1 and H₀ map 0 give H₁=ℤ. Twisted F₂ has ker[−2,−2]≅ℤ while each cyclic factor has H₁=0. | Exceptional twisted degree-one exact sequence is necessary. |
| Cup and connecting signs, 4.1–4.3 | ℤ² torus; C₂ over 𝔽₂; action-omitted cochain | `(x∪y)(z)=1`, `(y∪x)(z)=−1`. On a single pair values are 1 and 0, so no cochain commutativity. C₂ degree-one square is nonzero. Omitting coefficient action gives `d(φψ)(1,1,1)=2(t−1)`, not 0. | Sign, action, and characteristic-two cases pass. |
| Diagonal approximation, 4.4 | Interval [a,b], degree-zero resolution | AW boundary is `[b]⊗[b]−[a]⊗[a]=Δ∂[a,b]`; naive full tensor has degree 2 instead of 1. In degree 0 the map is k→k⊗k. | Chain map and augmentation pin the construction. |
| Projection/evaluation/cup comparison, 4.5–4.7 | C₂,H=1; sign ℤ; C₂ with integral coefficients | Degree-zero projection formula is 2y=2y. Sign evaluation on the boundary is −2 on both sides. H⁰→Ĥ⁰ is ℤ→ℤ/2, not an isomorphism. | No transfer reversal or degree-zero Tate overclaim. |
| Künneth, 5.1, projective cases | C₂² over ℤ or 𝔽₂; zero ring | Integral H₂=ℤ/2; H₃=(ℤ/2)²⊕Tor₁(ℤ/2,ℤ/2)=(ℤ/2)³. Field dimensions 1,2,3 for n=0,1,2. Zero ring: 0 on all sides. | Existing general cases retained. |
| Künneth repair, 5.1 | M=𝔽₂,N=ℤ[1/3], G=H=C₂; n=0,1,2,3 | Tensor/Tor/middle dimensions: (1,0,1), (2,0,2), (2,1,3), (3,1,4). Exchanging factors gives the same dimensions and sign (−1)ᵖᑫ. | Previous F01 repaired. |
| Flat Künneth gap and hypotheses | K=ℤ/2[0], L=(ℤ→×2ℤ); neither-flat example; k=ℤ/4 | K⊗L has zero differential and H₀=H₁=ℤ/2: tensor and Tor respectively. With G=H=1 and M=N=ℤ/2, actual H₁=0 but Tor=ℤ/2. Over ℤ/4, M=ℤ/2, H=C₂,N=ℤ/4, actual H₂ has order 2 while proposed tensor-plus-Tor has order 4. | Both flatness and ring hypotheses substantive; gap precise. |
| Universal coefficients, 5.2 | C₂,A=𝔽₂ over ℤ | H¹=Hom(ℤ/2,𝔽₂)=𝔽₂; H²=Ext¹(ℤ/2,𝔽₂)=𝔽₂ while Hom(H₂,𝔽₂)=0. H₂(C₂,𝔽₂)=Tor₁(ℤ/2,𝔽₂)=𝔽₂. | Both correction terms needed. |
| Cohomological cross product, 5.3 | Cₚ²; two infinite free abelian factors over ℚ | Dimensions 1,2,3. In the infinite case tensor products of duals give finite-rank matrices, but the identity bilinear form has infinite rank. On ℤ² the specified pairing is 1=1·1. | Finiteness and no-extra-sign convention correct. |
| Pontryagin ring, 5.4 | ℤ²,C₂,ℚ | Exterior ranks for ℤ²: 1,2,1. Λ³C₂=0 but H₃(C₂,ℤ)=C₂. Λ²ℚ=0=H₂(ℚ,ℤ), H₁=ℚ via localization colimit. | Integral degree bound necessary; torsion-free/rational clauses consistent. |
| Filtration and HS, 6.1–6.3 | N=1,G; S₃/A₃ over 𝔽₃; C₂⊂C₄ vs split extension | N=1 leaves row q=0; N=G leaves column p=0. S₃ invariant dimensions are 1 for q≡0,3 mod4, otherwise 0. C₄ abutment has dimension 1 each degree versus n+1 for C₂². Native coordinates become (2p+q+1,−p−1), stabilization bound max(q+3,p+2). | Nondegeneration and local convergence hypotheses correct. |
| Edges, products, low-degree sequences, 6.4–6.5,6.7 | C₂⊂C₄; split torus | Integral edge maps C₂→C₄→C₂ are ×2 and reduction. Mod 2 H¹ inflation=id, restriction=0; H² inflation=0. Fibre-first identification gives y∪x↦+xy, x∪y↦−xy. | Edge directions, vanishing condition and page-product sign pass. |
| Transgression, 6.6 | C₃⊂C₉,𝔽₃; split extension | df(2,1)=−1=2, carry=1; split carry and transgression both 0. | Source sign agrees. |
| Transgression coefficients, R01 | C₉⊂C₂₇,𝔽₃ | `3·1=3` in C₉ but `3v=0` in every 𝔽₃-module. After scalarization carry=1 and df=2=−1; equality checked on 729 pairs. | Missing coefficient interface; repair above. |
| Hopf map, 6.8 and R02 | Torus; cyclic n=0,1,2; Heisenberg group over 𝔽₃ | Torus boundary [ba]−[ab] maps to inverse commutator. Correct/wrong cyclic outputs (0,0),(0,ℤ),(0,2ℤ). In Heisenberg group inverse/forward commutator coordinates are 2/1. | Mathematics correct; normalization already owned by #1302. |
| Finite/profinite comparison, 6.9 | C₃⊂C₉; N=G | Pinned descended coboundary evaluates to 2, agreeing with discrete negative carry; for N=G target H²(1,−)=0. | No reliance on remembered sign or unspecified comparison. |
| Double cosets, 7.1 | S₃,H=K=C₂; normal A₃ | Degree-zero contributions 1+2=3=[G:H]. In positive degrees trivial-intersection contribution 0. On H¹(A₃,𝔽₃), normal-subgroup conjugation sum 1+(−1)=0. | Cosets, indices and inverse in homological formula agree. |
| Stable elements, 7.2 | S₃ at 3; degree 0; C₂×S₃ permutation module | H²(C₃,ℤ) stable part=0; H⁴ stable part=C₃. In degree 0 stable ℤ≠p-primary part 0. Twisted example has normalizer-invariant dimension 3, stable dimension 2. | Positive degree and trivial-action simplification hypotheses required. |
| Tate duality, 8.1 | C₂,M=ℤ or ℤ/2 | Ĥ⁰(C₂,ℚ/ℤ)=0=dual Ĥ⁻¹(C₂,ℤ); Ĥ¹(C₂,ℚ/ℤ)=C₂=dual Ĥ⁻²(C₂,ℤ). Integral dual of ℤ/2 is 0 although Ĥ⁰(C₂,ℤ/2)=C₂. | Shift and integral freeness restriction correct. |
| p-group classification, 8.2 | Q₈,D₈; composite parameter 21 | Q₈'s maximal abelian subgroups C₄; D₈ contains C₂². In C₇⋊C₃, orders are 1,3,7 and every 21st power is 1, but products (1,0)(0,1)=(1,1) and reversed=(2,1). | Prime hypothesis cannot be inferred from IsPGroup. |
| CT resolutions and cyclic periods, 8.3–8.4 | C₂ sign sequence; S₃ at 3; Q₈ | Ĥ⁰(C₂,ℤ)=C₂→Ĥ¹(C₂,ℤ_sgn)=C₂ is an isomorphism; two twists give trivial character and shift 2. S₃ has least 3-period 4, though 8 also qualifies. Q₈ has Ĥ²=C₂², Ĥ⁴=C₈. | Twist doubling and least-period definition retained. |
| Periodicity theorem, 8.5 | 1,S₃,A₄,SL₂(𝔽₉); prime away from order | For 1 all Tate groups 0 and order 1; S₃ period 4; A₄ contains C₂². SL₂(𝔽₉) order 720 has Sylow 3 subgroup C₃² and fails; subgroup mod-3 dimensions n+1. Away from group order every primary part is 0 on both sides. | Equivalences survive boundary and nonabelian tests. |

### Seeded source checks

All fifteen seeded targets are accounted for below. The author-flagged uncertified locators occur in Brown82 and CE56; their settled statuses were respected, not silently converted to certification. No other unverified-source flag was found. All eight cited works are already in the manifest, so no source fetch or manifest edit was necessary.

| Target | Locator read | Support and limits |
| --- | --- | --- |
| 1.5 | HS53 line 129–141, I §2, pp.112–113 | Homogeneous/inhomogeneous cochain change and differential verified. The continuous-carrier comparison is correctly described as new, not as a theorem in HS. |
| 2.2 | CE56 XVII | Uncertified; unread. Direct exactness uses sums/products of modules and native homology sequences. |
| 3.2 | HS53 line 201–216, I §4, p.114; Brown82 VII | HS supplies the bicomplex/acyclic-term framework, not arbitrary-k monomial Shapiro verbatim. The latter is the stated application of 1.3–1.4. Brown remains unread. |
| 3.4 | SerreArbres line 5132–5153, II §2.8, p.168 | No inversions, invariant orientation, terminal-minus-initial boundary and exact augmented tree chains. Extension from ℤ to k uses the stated splitting. |
| 3.5 | SerreArbres line 5170–5184, Proposition 13 and Remark 1, p.169 | Both sequences; sums in homology/products in cohomology; endpoint signs and inclusion maps. |
| 3.6 | SerreArbres line 5190–5196, example after Proposition 13, p.169 | Amalgam sequence. HNN/free-group versions use the tree route and named geometric supplier; Brown82 II §7 unread. |
| 4.1 | HS53 line 386–396, II §1, pp.118–119; MilneCFT line 3459–3484, II Proposition 1.38, p.73 | Coefficient action, Leibniz sign, passage to cohomology and exact-tensor connecting rules match. |
| 4.4 | HS53 line 389–396; Brown82 V | Standard cup formula verified, not the entire arbitrary-resolution diagonal theorem. Brown unread; resolution comparison and explicit AW test checked independently. |
| 5.2 | Loh19 line 5841–5851, Corollary 3.2.21, p.135; line 5985–5994, Outlook 3.2.26, p.138 | Integral homological UCT stated. Cohomological UCT is announced, not proved in the outlook. Hereditary-ring extension uses the native projective-cycle route. |
| 5.4 | Brown82 V | Uncertified; unread. Exterior/graded-ring tests above and the directed-union supplier were checked; no source certification claimed. |
| 6.6 | HS53 line 792–823, III §3 Proposition 1, pp.128–129; line 984–1015, III §6 Theorem 4, p.133 | Transgressive representatives and negative cup formula verified with trivial kernel action. R01 concerns transporting its integral coefficient object into the roadmap's k-linear interface. |
| 6.9 | HS53 line 854–856, III §4 remark, p.130 | Five-term sequence only. Finite/profinite comparison checked against pinned lift/coboundary definitions, as the roadmap explicitly says. |
| 7.1 | Brown82 III §§8–9 | Uncertified; unread. Mackey computations and native continuous formula checked, without certifying Brown's exact pages. |
| 7.2 | MilneCFT line 3357–3366 and 3382–3389, II Proposition 1.30/Corollary 1.33, pp.70–71; Hutchinson13 line 482–491, §3,p.11 | Index identity, Sylow injectivity, and integral homological stable-elements statement verified. Arbitrary coefficients/Tate form use the stated Mackey route. Brown's fusion reference remains unread. |
| 8.5 | Loh19 line 7089–7128, §4.3.2, pp.167–168; Brown82 VI §9; CE56 XII | Löh gives the sphere-action-to-Sylow argument, including the nonperiodicity obstruction. It does not prove every equivalence verbatim. Full periodicity sources remain uncertified; algebraic proof route and tests checked. |

Additional source readings include Loh19 Theorem 3.2.22/Corollary 3.2.23, pp.135–136, for the repair, MilneCFT Proposition 3.4/Remark 3.5 at line 3793–3822 for cyclic cup periodicity, and Hutchinson13 Theorem 3.1/Corollary 3.3 at line 494–520. The latter is a secondary statement; SwanPPeriod60 remains the named, waived primary source. Example 3.2.25 begins on printed p.137 and continues onto p.138, so the manifest's starting-page locator is not an error.

### Pinned-library audit

Pins read from the manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. I searched 106 qualified/native identifier spellings and inspected the relevant declarations, resolving multiline declarations and collisions such as `map`, `cup`, `res` and `spectralSequence` in their actual namespaces. The citation tool itself does not check these native packages; its empty output was not used as evidence of native-name existence.

| Opened pinned input | File and line | Fact used |
| --- | --- | --- |
| Representation and group cohomology | `Mathlib/RepresentationTheory/Rep/Basic.lean:30`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183`, 202, 210 | Module structure is part of Rep; cohomology takes that carrier; Ext and resolution comparisons exist. R01's coefficient object lacks this structure. |
| Group chains and homology | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125`, 132, 153, 226, 246, 254 | First boundary term acts by the inverse group element; Tor and resolution comparisons use actual complexes. |
| Functoriality | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:141`, 522, 534, 552, 566; corresponding `GroupHomology/Functoriality.lean:157`, 543, 818, 831, 850, 864 | Compatible pairs, coefficient functors, inflation/corestriction/coinflation and low-degree sequence. |
| Shapiro and resolutions | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `GroupHomology/Shapiro.lean:65`; `Resolution.lean:321`, 427 | Coinduction versus induction, arbitrary coefficients, standard/bar resolutions. |
| Continuous carriers and comparison | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:21`, 39, 113, 131; `TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean:166` | Iterated continuous-function carrier; discrete comparison absent in Mathlib's stated TODO; Tau Ceti's finite-group existence theorem is weaker than the proposed natural named comparison. |
| Continuous lift | `TauCeti/RepresentationTheory/Homological/ContCohomology/Transgression.lean:147`, 354, 702, 779 | Lift identities and descended actual coboundary; profinite hypotheses on transgression. |
| Transfer and induction | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79`, 121; `GroupHomology/Induced.lean:49`; `TauCeti/RepresentationTheory/Induction/Permutation.lean:166`, 339 | Finite-index transfer, correct index identity, induced vanishing and projection comparison. |
| Künneth and UCT | `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:270`, 307, 729, 786, 793; `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121`, 153, 180 | Projective cycles/quotients and split inclusions are real assumptions; neither sequence is falsely advertised as directly covering arbitrary flat terms. |
| Filtered complexes | `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`, 409, 425; `FirstPage.lean:89`; `Stabilization.lean:83` | Native coordinate shift, first differential and local vanishing conditions for stabilization. |
| Tate cups and periodicity | `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Product.lean:131`; `Cup/Cyclic.lean:146`; `Periodic.lean:302`, 346 | Existing Tate product and cyclic resolution periodicity are consumed; the cup-character comparison at the pin is degree zero, so the all-degree extension is not padding. |
| Trees | `TauCeti/Combinatorics/Graph/Serre/Tree.lean:47`; `Basic.lean:178` | IsTree is connected and acyclic; Connected includes Nonempty vertices. Empty-graph counterexample is excluded. |
| Hopf sign inputs | `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1019`; `Mathlib/Algebra/Homology/HomologySequence.lean:282` | Degree-one identification and connecting map support the chain computation; they do not resolve R02's roadmap ownership. |

No duplicate fully qualified local acceptance declaration exists to compare: this design has no Lean file. Object searches distinguished ordinary discrete products from the existing Tate and continuous products, group-specific hyperhomology from generic total/spectral-sequence machinery, and group Pontryagin products from topological torus/loop-space products.

### Ownership, resolved suppliers and order

The board-package index was read first. The main and Completed trees contain no CohomologyOfGroups folder. The overlap file reports no conflicting head, dropped cited id or revision-only cited id for this candidate. I used `roadmaps grep` by object and `roadmaps show` at main/open heads, not just declaration-name matching. This found the additional K2SymbolsBrauer overlap in R02, which a vocabulary-nearest list alone misses.

| Supplier read at present head | Resolved locator | Ownership boundary checked |
| --- | --- | --- |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794`, §0.2; line 955, §S.1 | K-flat/tensor laws and generic bicomplex sequences. The two declared gaps add precise missing contracts. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140`, 1155, 1571, 1770, 2622, 2763, 3519 | §§3.1–3.2,5.5,6.4,10.1,10.5 and Layer 12 resolve. Low-degree comparisons, profinite sequences and products remain there. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:778`, §0.1 | Tate interface, all-subgroup cohomological triviality and projectivity criterion; no new class-formation theory here. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385`, 773, 803, 863, 875, 906, 937 | §§2.2,4.1,4.2,4.5–4.8 exist. Stable-letter relation and inversion-free trees agree. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:1273`, 1294, 1305, 1945, 2005 | Cellular §§4.1–4.3; surjective regular-cover constant-coefficient comparison §5.3; torus §5.4. No vanished §8.15 is cited. |
| StableHomotopyKTheory, main | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1336`, 1347 | §3.29's perfect-group kernel/H₂ comparison remains. It does not fix the particular bar sign; R02 concerns a different owner's normalization. |
| SchemeKTheoryOperations, #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2548`, 2582, §6.7 | Integral nonnegative hyperhomology, permutation first page, directed unions imported; arbitrary-k/cohomological extensions are distinct. |
| K3BlochGroups, #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:1189`, 1855 | §4.1 reindexing; §5.2 integral stable elements, duality, quaternion resolution and Swan periods. No new copy of those special cases. |
| MappingClassGroupsAndCanonicalRepresentations, #2266 | `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:847`, §1.1 | Abstract cohomological HS and section-lift five-term sequence; filtered realization and higher structure are distinguished here. |
| IntegralIwasawaTheoryPartII, #2267 | `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:273`, §0.7 | ℂₚ evaluation and specified flat/edge input; arbitrary pairings here retain wider scope. |
| InductionRestrictionPartII, #1154 | `TauCetiRoadmap/InductionRestrictionPartII/README.md:312`, RS.0.1 | Central-extension five-term exactness; no independent local declaration of that special case. |
| ModularCurvesPartII, #913 | `TauCetiRoadmap/ModularCurvesPartII/README.md:3935`, §15.4 | Modular amalgam application; arbitrary amalgam/HNN sequence here is wider. |
| K2SymbolsBrauer, #1302 | `TauCetiRoadmap/K2SymbolsBrauer/README.md:107`, §1.1 | Positive bar-boundary calibration overlaps 6.8: R02. |

The closest scopes were read, including HomologicalStabilityOfGeneralLinearGroups #2036 (frame/stability applications, importing SchemeKTheoryOperations §6.7) and ArithmeticGaloisDuality #858 (continuous/compact coefficients and arithmetic duality). AlgebraicTopology is already on main, so its main scope/numbering supplies this audit; the supplied overlaps report no dropped citation requiring a revision dependency. No supplier drift was established from a section number remembered from the preceding round.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, AlgebraicTopology, ProfiniteCohomology, DerivedModuleAlgebra and ClassFieldTheory from the three closest-roadmap lists (the results/headings list is empty); K3BlochGroups owns integral stable elements/duality and quaternion/Swan inputs, IntegralIwasawaTheoryPartII the specialized evaluation/edge theorem, AlgebraicTopology topological chains/covers/torus, ProfiniteCohomology and ArithmeticGaloisDuality continuous/arithmetic theory, DerivedModuleAlgebra generic homological algebra, ClassFieldTheory class formations, and HomologicalStabilityOfGeneralLinearGroups its frame/stability applications. The discrete generalizations belong here, except the additional K2SymbolsBrauer bar-calibration overlap in R02.

Both declared gaps are precise, minimal contracts with identical slugs in README and plan. `homological-low-degree` requests the two edge maps and their one homological five-term sequence from DerivedModuleAlgebra §S.1, which currently states the cohomological edges and homological E²/convergence. `flat-kunneth` requests one exact, natural, noncanonically split sequence for nonnegative complexes with one flat factor from §0.2. The named pinned sequence has strictly stronger projective-cycle assumptions. Neither gap has supplier `none`, asks for unrelated results, nor duplicates the inspected native contract. These gaps are not findings; eventual acceptance can be conditional on both.

Dependency check output:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The citation resolver found no unresolved cross-roadmap citation; native-name limitations were handled separately above. No merge-order file was edited.

### Source wording and arrangement

I compared twelve readable seeded passages or readable portions thereof with their sources, and five further passages: conjugation (1.1, HS53 line 154–160), quotient action (1.2, HS53 line 345–354), cup uniqueness (4.2, MilneCFT line 3459–3484), flat Künneth (5.1, Loh19 line 5854–5866), and period definition (8.4, Hutchinson13 line 494–504). No non-forced copied sentence, translated passage, clause-by-clause borrowed proof plan, copied table or exercise list was identified. Shared formulas and necessary hypothesis lists are mathematical content; no wording finding is inferred from them. There is no Suggested.lean docstring or external formalization adaptation to inspect.

Before References the 100 locator-bearing source-key occurrences are HS53 34, Loh19 22, Brown82 14, Hutchinson13 12, MilneCFT 9, SerreArbres 4, CE56 3 and SwanPPeriod60 2. HS53's outline at line 22–42 has three chapters: auxiliary/Cartan–Leray theory, a separately filtered construction, and applications. The eight roadmap layers do not correspond one-to-one to these. Within Layer 6 the sequence 6.1→6.2→6.5→6.6→6.7 is required by the stated filtration, product, differential and transgression inputs. The tree, product-group, subgroup and periodicity layers have different mathematical scope. No chapter-arrangement finding was established. Brown82 and CE56 remain unread, so no independence conclusion against their wording/contents is claimed.

Source independence: 17 passages compared with 5 readable sources, no non-forced copying found; largest share HS53, 34 of 100 source-key locator occurrences; contents/outline compared with HS53: independent. Brown82 and CE56 wording/contents were not verified; SwanPPeriod60 remains waived.

## Not verifiable

- Brown82 and CE56 are settled uncertified sources. All their flagged locators remain uncertified, including seeded 2.2, 5.4, 7.1, the full arbitrary-resolution theorem in 4.4 and full periodicity equivalences in 8.5. They were not requested again.
- SwanPPeriod60 is waived. Its cited original was not read; the accessible Hutchinson statement and supplier contract were read instead.
- Löh's Outlook 3.2.26 announces cohomological UCT/Künneth, and §4.3.2 supplies the sphere-action implication, not all the general statements attributed elsewhere. The algebraic routes were checked separately; those announcements are not certified full proofs.
- Page images were not inspected for the extraction anomalies below; the available text was read. No claim about an installed PDF renderer is made.
- This design has no acceptance Lean file and this lane does not elaborate. Package-stage build, one-tactic probes, binder elaboration and headline-to-signature coverage remain unperformed.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p.12 (line 518): the source says the degrees are congruent to 3 modulo 3; it should be congruent to 3 modulo 4; affects the proof.
- **Gap** in Hutchinson13 at the period convention preceding Theorem 3.1, printed p.12 (line 494–497): the source says a qualifying period is the period used in Swan's formula; it should be the least qualifying period; affects a stated result.
- **Misprint** in Loh19 at proof of Corollary 3.2.23, printed p.136 (line 5903, 5908, 5927): the source says both tensor factors are chains of G; it should be chains of G and H; affects the proof.
- **Misprint** in Loh19 at Example 3.2.24, printed p.137 (line 5954–5955): the source says torus homology vanishes in degrees at least two; it should be at least three, with H₂ equal to ℤ; affects a stated result.
- **Misprint** in Loh19 at Example 3.2.25, printed p.138 (line 5976–5980): the source says integral coefficients and dimension n after summing n+1 field terms; it should be 𝔽ₚ coefficients and dimension n+1; affects a stated result.

## For the human reviewers

- Brown82 and CE56 remain uncertified; their wording and contents were not tested. SwanPPeriod60 remains waived. HS53, the source with the largest locator share, was readable and its outline was compared.
- The source-extraction anomalies in Loh19 at lines 5954–5955 and 5976–5980 were not compared with page images. The roadmap uses the mathematically correct torus and Cₚ² values.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "95b03fead8b70070007882092f12f9763f2376c2", "job": "REV-DESIGN-CohomologyOfGroups~8", "model": "gpt-6-astra", "worker": "chris-6"} -->
