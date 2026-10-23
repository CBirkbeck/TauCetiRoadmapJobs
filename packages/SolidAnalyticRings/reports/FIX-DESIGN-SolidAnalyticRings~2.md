# SolidAnalyticRings design repair

## F01 (P1) — applied

Implicit import of light integer solidity from VS2.1 → local §1.5, including the null test, abelian and derived reflections, cohomological characterization, free measures and countable product tensor. Repointed §§1.3, 2.1–2.4, 3.1, 4.2 and 7.4, their plan prerequisites, supplier contracts, ownership and references. Native universe-0 carriers and their larger-universe transport are distinguished.

Evidence: RC line 732 defines the light internal null test; RC lines 754–786 state Theorem 3.2.4(1)–(13). RC lines 806–821 give the finite-support integer inverse. VS2.1's “The abelian category of solid groups” starts from `CondensedAb` and `CondensedMod.IsSolid`; the latter quantifies over `Profinite` in Mathlib/Condensed/Solid.lean:83–85. It is not a light-site predicate. §1.5 supplies all thirteen requested assertions, including the vanishing of real solidification in assertion (4).

## F02 (P2) — applied

Vague stabilization and solid-inclusion tails → precise preservation of K-indexed limits in Spaces and Sp(Spaces_*), and an explicit independent-subobject colimit map in light abelian groups. README and plan use identical needs sentences. §4.2 derives the solid specialization locally; its plan no longer incorrectly requires the product of independent index sets to be countable.

Evidence: HTT line 18705, Proposition 5.3.3.3, concerns spaces. EnhancedDerivedSheaves E5:presentability.2 supplies the loop-tower stabilization; filtered colimits commute with its finite loop limits, giving the stated spectral consequence. RC line 539 states countable AB6. The two supplier extensions remain explicitly declared gaps; this package does not claim their suppliers already state them.

## F03 (P2) — applied

The bound Λ_a(M)≥b−1 and split-only improvement → Λ_a(M)≥b for every coherent divisibility quotient tower. Replaced the necessity Check by Hℤ₂ with π₋₁=0, and distinguished the ideal tower. Updated §6.3's two tails to ≥b+d+1, its first-layer Check and sufficient skeleton bound d>k−b; reconciled plan statements, hypotheses and prerequisites.

Evidence: π_b(M/a_r)=coker(a_r:π_bM→π_bM). The square (b_(r,s),id) induces an epimorphic quotient transition. The Milnor sequence therefore has zero lim¹ in degree b−1, by RC line 540 and the replete-tower inputs. No completeness, finite-free stage or splitting enters this argument. The general ideal-tower counterexample does not contradict it.

## F04 (P3) — applied

Finite output support presented as an additional restriction → automatic existence of finite factorizations for countable-product blocks, with coherent choices retained as data in §5.2. Replaced the exclusion claim in §5.4 with the completed fold calculation (t^j)_j↦(1−t)⁻¹≡1+t modulo t², and retained the valid duplication computation. Added the compactness prerequisites to the plan.

Evidence: §§3.2 and 3.1 give ∏_I A≃A⊗■∏_Iδ𝕊 for the coefficient datum. The sphere product is a retract of the compact generator of §2.4, also for finite or empty I. Its free A-module is compact. A direct sum is the filtered colimit of its finite sub-sums, so every map from the block has such a factorization.

## F05 (P3) — applied

Incomplete inputs → §1.4 and EnhancedDerivedSheaves E2.1–E2.3 in §2.1; E5:abstract.3 in §1.1; E5:spectra-comparison and its ordinary tower comparison in §6.4; E2:towers in Layer 5 Dependencies. Added the native essentially-small instance and ordinary small-site sheaf equivalence to Conventions and Mathlib contracts. Plan prerequisite lists and supplier sections agree.

Evidence: Mathlib/Topology/Category/LightProfinite/Basic.lean:403 supplies the instance; Mathlib/Condensed/Light/Small.lean:30 supplies `LightCondensed.equivSmall`. EnhancedDerivedSheaves E2.1–E2.3 contains the countable-product, Milnor and Postnikov inputs; E5:abstract.3 is monoidal localization. E5:spectra-comparison's `symmetricSpectra_towerComparison` explicitly compares the (p,id) tower and its completion unit, including its H𝔽_p Check.

## F06 (P3) — applied

Consumer request-label commentary, design-stage wording and source-certification narrative → deleted the two extraneous sentences, stated that no direct Tau Ceti declaration is imported, and used “versions recorded in sources.toml” in References. Searched the whole README for the same request labels and the removed formulations; none remains.

## F07 (P3) — applied

Noncomputational §1.1 Check → π₀𝕊[C](*)=⊕_Cℤ and π₀𝕊[C]({0,1})=(⊕_Cℤ)², excluding the all-one vector. Misoriented base-change cospan → H𝔽₂←Hℤ→H𝔽₂, with derived pushout having π₀=π₁=𝔽₂. Both Checks and the first Check's computation classification were updated in the plan.

Evidence: the free light module functor and adjunction are Mathlib/Condensed/Light/Module.lean:68–73; a point cover splits, and the two-point value is a finite product. The resolution ℤ --2→ ℤ of 𝔽₂ gives 𝔽₂ --0→ 𝔽₂ after tensoring, so Tor₀ and Tor₁ are both 𝔽₂ and higher Tor vanishes.

## F08 (P3) — applied

Kernel generation required for the displayed two-path comparison → compatibility of the analytic morphisms alone. Replaced the proof route by restriction/extension adjunction applied to each intermediate reflection kernel. Removed kernel generation from the plan hypothesis and statement; added the target-zero Check showing both paths equal 0 although the proposed kernel-generation equality fails.

Evidence: for K∈ker L_D_B and target-complete N, Map_B′(B′⊗_B K,N)=Map_B(K,N|_B)=0 because restriction is complete. Thus target reflection inverts the scalar extension of the intermediate unit. The same proof applies through A′. This is the argument of RC lines 1511–1519 in the stated compatible-morphism setting, without a minimality condition on the target kernel.

## Verification and scope

The edits are confined to `packages/SolidAnalyticRings/design/README.md`, `packages/SolidAnalyticRings/design/plan.json`, `packages/SolidAnalyticRings/sources.toml` and this requested report. There are no listed gate failures beyond the findings. No commit, push, pull-request edit, tooling change or merge-order edit was made.

The baseline was confirmed in the content manifest and the checked-out libraries: main a07e2024, Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read upstream examples in GeneralizedCohomology, EnhancedDerivedSheaves, ComplexTori and PadicMeasuresIwasawaAlgebras before editing. All nine cited works were available in the supplied legal cache; no additional source, duplicate source key or missing-reference request was needed. The RC manifest entry now includes Definition 3.2.1, §1.5 and §6.2; CS is identified as the compact-Hausdorff input to §7.4.

Ownership searches used the roadmap service across main and all 330 indexed open heads, and local searches of the board packages, for the objects: light solid abelian groups, LightCondAb, solidification, null sequences, hypersheaves of spectra, condensed spectra and countable AB6. The supplied sibling names were included by that service search; separate sibling checkout paths were not present. The only foundational integer owner found is VS2.1's compact-Hausdorff construction. HabiroRings is a consumer of the light spectral theory. The other null-sequence hits concern functional analysis or adic series, not the light null-test localization. This is why the missing light construction belongs to §1.5 here; it does not re-plan VS2.1. Searches at both pins found no light null-test localization or AB6 declaration. In particular, Mathlib's actual `CondensedMod.IsSolid` definition has a profinite-measure test, while its native `LightCondAb` abbreviation fixes universe 0 (Mathlib/Condensed/Light/Module.lean:32–42,85).

Supplier citations were rechecked on main for GeneralizedCohomology G2.1–G2.7, G3.8–G3.9 and the EnhancedDerivedSheaves sections named in the contracts; at the service heads for StableHomotopyKTheory §§5.13–5.18, VStackSheavesAndLisseCategories VS2.1–VS2.2, and HabiroRings §§2.6–2.12. The interfaces used are the concrete spectra/towers, enhanced light ringed-site categories, localizations, stabilization, animated module comparison and common-presentation analytic measures specified in the README. The contract passages for both gaps still do not state the required general extensions, so their gap entries remain.

The citation resolver returned one existing lead: “7: RefinedTraceMethods §6.2: no roadmap RefinedTraceMethods on main or in an open pull request”. The board index identifies its head as 87bc3ff, whose `packages/RefinedTraceMethods/README.md` was read through the local Git object. Its §6.2 contains the exact “Light condensed and solid spectra” block; §§6.3–6.4 contain the stated consumers. This confirms the citation against the indexed board head rather than claiming a main-branch supplier. The block's ownership remains in this package, as already specified; it creates no reverse dependency. The resolver reported no unresolved Lean names, but explicitly did not check external Lean names because its own host has no pinned Lake packages; those declarations were inspected in the supplied pinned checkouts instead.

The unchanged HigherHidaAndColemanTheory R23–R24 consumer citation could not be independently reopened: its board-index entry identifies da88512, but neither a checkout nor that Git object is present, and the roadmap service reports no main/open copy. This is an outgoing consumer note, not a supplier or a new ownership claim. No claim is made to have verified that consumer's text. LocallyAnalyticRepresentationsOfLocalGroups LR.3 was read in its board design; its broader geometric, group-ring and functional-analysis requests remain outside this package.

## Adversarial mathematics pass

These are computed mathematical tests, not an assertion that examples prove the general theorems. The source and proof arguments above settle the changed claims. Rows identify each target, each API law, both supplier-gap statements and the conventions; the Checks in each target were recomputed against the same objects. Integer homotopy groups below are at the point unless a sheaf is specified. A denotes the actual coefficient algebra of the row.

| Statement | Instances tried | Values computed on the two sides / obstruction | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: site, skeleton and empty value | ∅, *, two points; universe lift | stable terminal=0; two-point value=M(*)²; lifted two-point set still has 2 elements | consistent | Native small-site citations added |
| Conventions: left modules/right endomorphisms | Matrix units on a rank-two generator | e₁₂e₂₁=e₁₁; e₂₁e₁₂=e₂₂; precomposition reverses action order | consistent | None |
| Conventions: degree | ΣHℤ; cochain ℤ in degree 2 | π₁=ℤ, π₀=0; π₋₂=ℤ=H² | consistent | None |
| Conventions: symmetry | Two suspended and two unsuspended rank-one factors | suspended swap=−1; coordinate swap=+1 | consistent | None |
| Conventions: null shift | e₁ and e₀ | σ*e₁=e₀, σ*e₀=0; (1−σ*)(e₁+e₀)=e₁ | consistent | Reused in §1.5 |
| Conventions: discrete/product distinction | e_n in ∏ℕℤ | each fixed coordinate eventually 0; e_n is never 0 as a vector | condensed convergence, discrete nonconvergence | None |
| Conventions: sphere-linear sections | s:A/(t)→A for A=𝕊[t] | s(t·1)=0; t·s(1)=t≠0 | not A-linear | None |
| Conventions: marked ideals and quotients | a₀=1; zero scalar; t^(j+1)→t^j | B₀=0, J₀=A; cofib(0)=A⊕ΣA; inclusion preserves t^(j+1) | consistent | None |
| Conventions: prime quotient direction | X=H𝔽_p, p=2,3 | X/p^r=X⊕ΣX; transition diag(id,0); limit=X | consistent | Ordinary adapter explicitly cited |
| §1.1 ambient category | ∅, two points, C=ℕ∪{∞} | 0; M(*)²; π₀𝕊[C](*)=⊕_Cℤ versus solid product | consistent | Computed free-sheaf Check |
| §1.1 free evaluation law | T=* and M=δHℤ | Map(𝕊,M)=Hℤ=M(*) | consistent | None |
| §1.1 detection/extensionality | Zero map and identity of δHℤ | π₀ maps 0 and 1 differ at * | wrong identification excluded | None |
| §1.1 descent law | Identity hypercover of * | Tot of the constant Hℤ diagram=Hℤ | consistent | None |
| §1.1 free tensor law | Finite sets of sizes 2 and 3; empty first factor | 𝕊⁶=𝕊[6]; 0⊗𝕊³=0=𝕊[∅] | consistent | Monoidal prerequisite added |
| §1.2 discrete adjunction | X=0, 𝕊⊕Σ𝕊; inverse system H(ℤ/p^r) | δ0=0; π₀=ℤ, π₁=ℤ/2⊕ℤ; identity on ℤ_p is continuous but not locally constant | limits distinguished | None |
| §1.2 map law | 0, id and two ×2 maps on Hℤ | 0, 1 and 2·2=4 on π₀ | consistent | None |
| §1.2 unit law | X=ΣHℤ | π₁ of X and (δX)(*) is ℤ; unit sends 1→1 | consistent | None |
| §1.2 tensor coherence | X=Σ𝕊,Y=Σ𝕊 | symmetry acts by −1 before and after δ | consistent | None |
| §1.3 marked null definition | Singleton marked point; C | cofib(id_𝕊)=0; π₀N(*)=⊕ℕℤ | unreduced model excluded | Removed false VS dependency |
| §1.3 map law | Identity and collapse to marked point | induced maps on N are id and 0 | consistent | None |
| §1.3 internal Hom fiber | M=δHℤ | evaluation at ∞ removes the constant summand; kernel=⊕ℕℤ | consistent | None |
| §1.3 shift law | e₁ | coefficient at 0 becomes 1 and all others 0, so σ*e₁=e₀ | opposite shift excluded | Locator corrected |
| §1.3 universe/scalar transport | Lift of e₁+e₀ | lifted difference remains e₁; coefficients remain 1,1,0,… | consistent | §1.5 explicitly uses this transport |
| §1.4 solidity definition | 0, δ𝕊, N | zero Hom has invertible identity; sphere π₀=ℤ, π₁=ℤ/2; N(*) has ⊕ℤ rather than ∏ℤ | N fails | None |
| §1.4 external/internal tests | M=0, T=* | internal Hom=0 and tested Map=0 | consistent | None |
| §1.4 equivalence/full inclusion law | Identity on δHℤ | π₀ maps are the same integers in the full category | consistent | None |
| §1.4 discrete solidity law | δHℤ, e₁ | inverse=e₁+e₀; difference=e₁ | consistent | Integer justification now §1.5 |
| §1.5 light integer definition | ℤ; topological ℝ | finite-support inverse exists on ℤ; harmonic null input has partial sums 1,3/2,11/6,… diverging in ℝ | ℤ passes, ℝ fails | New target |
| §1.5 abelianness, extensions and colimit closure | 0; ×2 on ℤ; split extension ℤ²; ⊕ℕℤ | kernel=0, cokernel=ℤ/2; extension=ℤ²; coproduct retains finite support | consistent | Local ownership |
| §1.5 limit and internal-Hom closure | ℤ^ℕ; Hom(ℤ²,ℤ) | product includes (1,1,…); internal Hom=ℤ² | consistent | Local ownership |
| §1.5 abelian reflection and adjunction | B=ℤ, test source ℤ | Hom(Lℤ,ℤ)=Hom(ℤ,ℤ)=ℤ; unit sends 1→1 | consistent | Local ownership |
| §1.5 abelian tensor unit | ℤ⊗■ℤ; zero factor | ℤ on both sides; 0 on both sides | consistent | Local ownership |
| §1.5 real solidification | Harmonic null sequence; the real solid unit | null inverse would have divergent x₀; real solid unit satisfies 1=0 in the source's argument, so reflected ℝ=0 | consistent | RC assertion (4) included |
| §1.5 derived closure and cohomology criterion | Σℤ and ΣHℝ | H⁻¹=ℤ and other H=0; H⁻¹=ℝ fails the test | both directions discriminated | Local ownership |
| §1.5 derived internal Hom | RHom(ℤ,Σℤ) | Σℤ on both sides, H⁻¹=ℤ | consistent | Local ownership |
| §1.5 fully faithful derived inclusion | ℤ and Σℤ | Hom(ℤ,ℤ)=ℤ and Ext¹(ℤ,ℤ)=0 in both categories | consistent | Local ownership |
| §1.5 left derived reflection/tensor | Free ℤ in degree 0; Σℤ⊗ᴸ■ℤ | reflection=ℤ with no higher groups; tensor=Σℤ | consistent | Local ownership |
| §1.5 free measure and its unit | S=∅,*,2,C | 0,ℤ,ℤ²,ℤ×∏ℕℤ; unit sends each marked basis vector to its finite-partition coordinates | consistent | Local ownership |
| §1.5 projectivity and infinite generator | S=∅,2,C | zero measure has Hom=0; Hom(ℤ²,ℤ)=ℤ²; P■(*) contains (1,1,…) | empty measure cannot generate the nonzero category | Infinite-S condition retained |
| §1.5 countable derived product tensor | I empty; sizes 2,3; I=J=ℕ | 0=0; ℤ⁶=ℤ⁶; ∏ℕ²ℤ=∏ℕ²ℤ, higher Tor=0 | consistent | Local ownership |
| §2.1 homotopy structure | ΣHℤ; 0; square-zero 𝕊⊕Σ𝕊 | π₁=ℤ; all groups=0; square-zero π₁=ℤ/2⊕ℤ | higher data retained | Heart and inputs repaired |
| §2.1 truncation law | τ≤0ΣHℤ and τ≥1ΣHℤ | 0 and ΣHℤ; π₁ values 0 and ℤ | consistent | None |
| §2.1 heart law | Hℤ | π₀=ℤ, π_k=0 for k≠0 | consistent | Uses §1.5 |
| §2.1 shift law | M=Hℤ | π₁ΣM=ℤ=π₀M; π₀ΣM=0 | consistent | None |
| §2.2 reflection/tensor construction | 0,δ𝕊,C | L■0=0; L■δ𝕊=δ𝕊; L■𝕊[C]=δ𝕊⊕∏ℕδ𝕊 | consistent | Integer measure input repaired |
| §2.2 reflection-unit law | C=M=δHℤ | both mapping spectra have π₀=Hom(ℤ,ℤ)=ℤ | consistent | None |
| §2.2 idempotence law | C=0 and δ𝕊 | repeated reflection=0 and δ𝕊, units=id | consistent | None |
| §2.2 tensor–Hom law | C=D=δ𝕊,M=δHℤ | Hom(𝕊⊗■𝕊,Hℤ)=Hℤ=Hom(𝕊,Hom(𝕊,Hℤ)) | consistent | None |
| §2.2 finite-quotient measure law | Two-point T, identity quotient system | limit=δ𝕊²; both point projections give the chosen coordinate | consistent | Input now §1.5 |
| §2.3 Hℤ comparison/detection | Σ^bH𝔽₂; H𝔽_p⊗HℤH𝔽_p, p=2,3 | bottom group 𝔽₂→𝔽₂ is identity; Tor₀=Tor₁=𝔽_p | consistent | Derived light category locally supplied |
| §2.3 animated boundary | Free commutative H𝔽₂ algebra versus animated polynomial | H₁(BΣ₂;𝔽₂)=𝔽₂ versus 0 | positive-characteristic identification excluded | None |
| §2.4 generator construction | *,ℕ; A=0 | π₀G(*)=∏ℕℤ; G_0=0 and zero module category | consistent | Integer measure input repaired |
| §2.4 generator unit | e_n in N | coordinate images=Kronecker vector e_n; all-one vector occurs only in G(*) | correct marked comparison | None |
| §2.4 homotopy law | k=−1,0,1 | 0, ∏ℕℤ, ∏ℕℤ/2 respectively | consistent | None |
| §2.4 free-module mapping law | A=Hℤ,M=0; then M=Hℤ | both sides=0; π₀=Hom(∏ℕℤ,ℤ)=⊕ℕℤ | consistent | None |
| §3.1 product tensor | I=∅; sizes 2,3; ℕ×ℕ | 0; six spheres; integer image=∏ℕ²ℤ on both sides | consistent | Integer tensor input now §1.5 |
| §3.2 split-tower definition | Zero, constant rank one, ranks n+1, ×2 | limits 0,𝕊,∏ℕδ𝕊; 2b=1 has no integer solution | nonsplit map excluded | None |
| §3.2 coherent data law | Rank-one constant tower with id sections | d_ns_n=1; all composites=1 | consistent | None |
| §3.2 map extensionality law | Identity and zero tower maps | limit maps on π₀ are 1 and 0 | wrong equality excluded | None |
| §3.2 split decomposition law | P_n=𝕊^(n+1), n=0,1,2 | ranks 1,2,3=1+0,1+1,1+2; kernels rank 1 | consistent | None |
| §3.2 change-of-section law | ℤ²→ℤ; s(x)=(x,0), s′(x)=(x,x) | coordinate changes (x,y)↦(x,y+x); projection still x | coherence retains marked projections | None |
| §3.3 independent towers | Rank-one constants; rank-two/rank-three stages | 𝕊=𝕊; tensor rank 6=2·3; diagonal meets stage (m,n) at max(m,n) | consistent | None |
| §3.4 balanced tensor | A=𝕊; A=𝕊[t]; rationalized ∏ℕℤ | X⊗■Y; ℤ[t₁,t₂] maps t₁,t₂↦t; (2⁻ⁿ)_n has no bounded denominator | unrestricted product base change excluded | None |
| gap:cardinal-interchange | κ=ω₁,J=ω₁,K=ℕ, F(α,k)=Hℤ for k<α; J=point,K empty | both sides ∏ℕHℤ after α≥ω; both sides 0 for empty K in spectra | consistent | Exact ambient categories named |
| §4.1 spectral/site interchange | J=ℕ versus ω₁, K=ℕ | ℕ gives ⊕ℕℤ versus ∏ℕℤ; ω₁ gives ∏ℕℤ on both sides | ordinary filteredness insufficient | Supplier statement clarified |
| gap:light-countable-ab6 | B_j=ℚ, B_(j,n)=(1/n!)ℤ; B_j=0 | independent stage n_j=j+1 contains (1/(j+1)!)_j on both sides; zero case gives 0=0 | consistent | Map and quantifiers explicit |
| §4.2 solid AB6 and split towers | Same factorial subobjects; ℤ^(n+1) | diagonal union omits that vector; ∏ℕℤ→ℤ^(n+1) is onto, lim¹=0 | independent indices essential | Local solid consequence; no countability of ∏A_j |
| §5.1 coefficient/completion definition | A=0; A=𝕊[[t]]; proposed 𝕊/p stage | 0; quotient ranks 0,1,2 for r=0,1,2; ℤ/p is not free | zero allowed, torsion stage excluded | None |
| §5.1 datum equivalence law | Identity datum on 𝕊[[t]] | both completion units send coefficient t^j to t^j at every quotient | consistent | None |
| §5.1 marked ideal law | r=1,s=2,a_r=t^r | J₂→J₁ is ×t under abstract A identifications; t²x maps to t²x in A | marking cannot be discarded | None |
| §5.1 completion-unit naturality | ×t on A=𝕊[[t]], modulo t² | 1 maps to t on either path; t maps to 0 modulo t² | consistent | None |
| §5.1 cofinality law | Even quotient stages t^(2r) | compatible coefficients still give ℤ[[t]] on π₀ | consistent | None |
| §5.1 cofiber/tensor law | a=1 and a=0 | M⊗A0=0=cofib(id); M⊗A(A⊕ΣA)=M⊕ΣM | derived quotient distinguished | None |
| §5.2 profile/block-map definition | f(j)=j, f=0; empty blocks | sublevel sizes r and ∞ for r=1; V_f=0 for empty blocks | improper profile excluded | Compactness explanation added |
| §5.2 profile constructor/equality | f(j)=j, g(j)=j+1 | at j=0 values 0 and 1 differ; both proper | consistent | None |
| §5.2 filteredness and cardinal boundary | f_k(j)=max(j−k,0) | common lower bound g must have g(j)=0 for all j; infinite sublevel at r=1 | not ω₁-filtered | None |
| §5.2 transition composition | t^(j+2)→t^(j+1)→t^j | abstract multipliers t·t=t²; all marked images=t^(j+2)x | consistent | None |
| §5.2 block-map composition | Duplication twice; zero map | supports {4j,4j+1,4j+2,4j+3}; empty support | consistent | None |
| §5.2 automatic finite factorization | Singleton fold block, identity, empty block | supports {0}, {j}, ∅; empty block=0 | every compact-block map factors | Added §3.1, §3.2, §2.4 inputs |
| §5.3 null-family equivalence | (t^j)_j; (1)_j; two singleton blocks; one infinite block | modulo t^r survivors j<r; constants survive infinitely; A²=A²; ∏ℕA=∏ℕA | positive and negative models separated | None |
| §5.4 all degrees/naturality | k<0; ηt^j; duplication; fold | 0; modulo t² survivors η,ηt; outputs 0–3; fold 1+t modulo t² | consistent | False restriction Check replaced |
| §6.1 bounded resolutions | 0; Σ^bG_A; Σ^(−n)G_A | realizations 0 and Σ^bG_A; lower bounds −n unbounded | uniformity essential | None |
| §6.2 quotient completion | a_r=1; zero scalar; Hℤ/2^r | 0; M⊕ΣM at a zero scalar; π₋₁Hℤ₂=0, lim¹ quotients=0 | bound is ≥b | Stronger target |
| §6.2 ideal/quotient boundary | ℤ←2ℤ←4ℤ; quotient system ℤ/2^r | ideal lim=0, pointwise lim¹=ℤ₂/ℤ; quotient lim=ℤ₂, lim¹=0 | towers differ | Necessity claim deleted |
| §6.3 realization estimate | Constant object; first normalized layer Σ^bHℤ, a_r=2^r | identity; completion=Σ^(b+1)Hℤ₂, π_b=0 and π_(b+1)=ℤ₂ | retains b+1 connectivity | Both tails and skeleton threshold raised |
| §6.3 unbounded countercontrol | Normalized input Σ^(−n)A in degree n | suspended layer=A in every degree | no increasing lower bound | None |
| §6.4 prime-complete comparison | p=2,3; H𝔽_p | unit π₀=ℤ₂,ℤ₃; H𝔽_p quotient limit=H𝔽_p | consistent | Ordinary tower adapter cited |
| §6.4 evaluation-unit law | X=H𝔽₂,H𝔽₃ | e_pX(*)=X; π₀ maps 1→1 | consistent | None |
| §6.4 monoidal law | X=Y=𝕊_p^∧ | completed smash unit=𝕊_p^∧; target unit has π₀=ℤ_p on both sides | completed unit retained | None |
| §6.4 integer comparison law | Hℤ_p⊗■HℤHℤ_p; H𝔽_p⊗HℤpH𝔽_p | Hℤ_p; Tor₀=Tor₁=𝔽_p | relative coefficient rings distinguished | None |
| §6.4 reflection law | Hℤ[1/p]; H𝔽_p | quotient completion=0 and H𝔽_p; local unit=id in second case | consistent | None |
| §7.1 analytic structure definition | D=all, D=0, Perf(Hℤ) | L=id, L=0; ⊕ℕℤ not a finite perfect module | invalid subcategory excluded | None |
| §7.1 structure-data law | D=all and D=0 for Hℤ | completed coefficient π₀=ℤ and 0 respectively | different inclusions distinguished | None |
| §7.1 extensionality law | Identity full subcategory with its unit | unit on Hℤ sends 1→1; multiplication by 2 cannot replace it | unmarked scalar rescaling excluded | None |
| §7.1 analytic-morphism law | Identity of (Hℤ,all), then map to (Hℤ,0) | restriction maps 0 to 0; composite restriction still 0 | consistent | None |
| §7.1 completedness law | D=0, A=Hℤ or 0 | unit Hℤ→0 not invertible; 0→0 invertible | iff tested in both cases | None |
| §7.2 completed tensor/scalars | Zero module; trivial structures; target-zero structures | tensor 0; F₂⊗ᴸℤF₂ has π₀=π₁=F₂; both target paths 0 | consistent without kernel generation | Hypothesis and diagram repaired |
| §7.2 tensor-unit law | D=all and D=0 over Hℤ | units Hℤ and 0; π₀=ℤ and 0 | consistent | None |
| §7.2 scalar adjunction law | Identity on (Hℤ,all), M=N=Hℤ | both mapping spectra=Hℤ, π₀=ℤ | consistent | None |
| §7.2 composition law | Trivial structures on Hℤ→H𝔽₂→H𝔽₂; M=Hℤ | both iterated and composite extensions=H𝔽₂ | consistent | None |
| §7.2 base-change law | All underlying algebras Hℤ, target D=0 | paths=0=0; generated input kernel=0 but target kernel=all | necessity disproved | Kernel generation removed |
| §7.3 summability construction | F=∅,{0},{1}; topological Hℚ_p,f=1/p | identity localization for first three; b_n=p^n gives b_n−p⁻¹b_(n+1)=0, b₀=1 | Hℚ_p not complete for that test | None |
| §7.3 internal-test law | Finite-support input e₁ | (1−fσ*)(e₁+fe₀)=e₁ | sign fixed | None |
| §7.3 free-local-object law | F=∅, C=Hℤ | L_FC=Hℤ; Hom to Hℤ has π₀=ℤ on both sides | consistent | None |
| §7.3 monotonicity law | F=∅⊆{0} | both reflectors=id; composite=id | consistent | None |
| §7.3 scalar-naturality law | Hℤ→H𝔽₂, f=0 | both source and target tests are identity; 0 maps to 0 | consistent | None |
| §7.3 nilpotent test law | 𝔽₂[ε]/ε², f=ε; f=0 | (1−εσ*)(1+εσ*)=1; geometric inverse at f=0 is 1 | nonreduced and characteristic-2 cases hold | None |
| §7.4 common-presentation measure comparison | Integer measures at ∅,*,2; E/ℚ_p; animated 𝔽₂ | measures 0,ℤ,ℤ²; (p⁻ⁿ)_n lacks uniform denominator; H₁(BΣ₂;𝔽₂)=𝔽₂ versus 0 | no unrestricted product or animated equivalence | Comparison now explicitly names §1.5 |

The repaired proof routes have no new circular prerequisite: §1.5 uses the marked light construction and supplied enhanced categories, not the spectral Hℤ comparison that consumes it. The completion estimate uses only quotient cofibers, bottom homotopy, countable exact products and the epimorphic-tower Milnor input; §5.3's split coefficient datum is not needed for its general bound. The scalar comparison uses compatibility with the actual target inclusion, not a hypothesis containing the claimed comparison.

## Mechanical outcomes

- README/plan audit: PASS. All 27 target statements, all 27 prerequisite lists, all 89 Checks and all 61 API laws agree. Every target has at least three Checks. The two gap needs sentences agree exactly and occur under the required “What … must provide” lines. The independent-choice indices have no unintended countability restriction. Source TOML parses with nine unique source keys. `git diff --check` exits 0; only the three permitted package files and this requested report are changed.
- Lean audit: not applicable to this design. There is no `Suggested.lean`, hence no declarations, section-variable binders, sorry'd data or theorem signatures to compare mechanically with `#check @name`. No Lean command was run and no acceptance-test file was created outside the permitted scope.
- Citation audit: no unresolved Lean name was returned; one existing RefinedTraceMethods lead was independently resolved against its indexed local board head as described above. The external-name resolver limitation and unavailable HigherHidaAndColemanTheory consumer text are recorded above rather than treated as verified.
- Dependency check: exit 0. Exact output:

```text
candidate: SolidAnalyticRings is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order placement decision or supplier-file edit is requested by these repairs. `gap:cardinal-interchange` and `gap:light-countable-ab6` remain external proof obligations with their existing supplier assignments; their statements are now precise. No cited consumer-facing name was renamed or deleted. The added plan target is `SolidAnalyticRings.lightSolidAbelianTheory`, §1.5; there is no Lean declaration of that name at this design stage. The unchanged RefinedTraceMethods foundational relocation remains an ownership consequence for its maintainer, not a supplier dependency of this package.
