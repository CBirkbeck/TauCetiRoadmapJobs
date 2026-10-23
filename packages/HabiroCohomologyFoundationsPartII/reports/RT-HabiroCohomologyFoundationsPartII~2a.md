<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/151#issuecomment-6361357908 -->
Red team round 2 pass a (codex) of f8c10d3

Verdict: needs_changes

1. **F01** (P2) Gap declarations duplicate targets at the supplied heads

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:64–75,98–100; design/plan.json:3–80,124–140. “What HabiroCohomologyFoundations must provide (gap:habiro-complete-category)”.

   **Claim:** These contracts describe missing supplier targets. Thirteen already occur at the sibling heads supplied for this round. A planned target counts as supply; its unfinished proof does not justify another gap.

   **Witness:** TauCetiRoadmap/HabiroCohomologyFoundations/README.md:274–305 supplies the complete category, reflection and completed tensor for every commutative A. TauCetiRoadmap/HabiroRings/README.md:474–523 supplies both completion comparisons, including arbitrary B-modules.

   | Gap slug | Existing owner and exact location |
   | --- | --- |
   | habiro-complete-category | HabiroCohomologyFoundations §0.1, README:274–313 |
   | enhanced-filtration | HabiroCohomologyFoundations §§2.1–2.3, README:846–909 |
   | derived-qderham | HabiroCohomologyFoundations §§1.14–1.16 and 2.4–2.10, README:911–1000 for the animated comparisons |
   | chosen-pair-coherences | HabiroCohomologyFoundations §4.1, README:1295–1320 |
   | qhodge-functor | HabiroCohomologyFoundations §4.4, README:1337–1359 |
   | coordinate-pair | HabiroCohomologyFoundations §4.8, README:1404–1425 |
   | habiro-hodge-descent | HabiroCohomologyFoundations §§4.12–4.24, README:1467–1675 |
   | habiro-descent-exports | HabiroCohomologyFoundations §4.28, README:1736–1788 |
   | naive-quasiregular | HabiroCohomologyFoundations §§5.15–5.23, README:2008–2129 |
   | finite-coefficient-pairs | HabiroCohomologyFoundations §5.26, README:2146–2176 |
   | ordinary-derived-habiro | HabiroRings §§2.4–2.5, README:474–523 |
   | relative-habiro-taylor | HabiroRings §§5.1–5.9, README:903–1092 |
   | cubic-coefficients | HabiroRings §7.3, README:1291–1299 |

   **Exact repair:** For each listed row, replace “What <Supplier> must provide (gap:<slug>):” with “Supplied by <Supplier> <the sections in the table>:”, retaining the mathematical contract, replacing proposed API aliases by the actual supplier section/target descriptions, and delete the matching object from design/plan.json's gaps array. Replace README:48 with “HabiroCohomologyFoundations and HabiroRings supply the contracts cited below at their named sections. The remaining gap contracts specify missing extensions and their owners.” Do not delete an actual extension merely because its surrounding machinery exists: in particular, restrict canonical-smooth-pair to the n=0 extension if retaining the dimension-zero use in §3.3; the supplier's §5.2 currently assumes n≥1.

   **Repair test:** For A=0, the existing §0.1 gives the zero category, zero reflection and zero completed tensor. For B=M=𝔽₂, existing HabiroRings §2.4 gives static quotients with dimensions 1 and 3 at P₁ and P₂; no flatness restriction or additional supplier target is needed. This is a new minimality finding, not a re-raising of A-F02's settled supplier-availability objection.

2. **F02** (P1) The spherical map to perfection has no supplier contract

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:305: “along the E∞-map ... of KU Lemma A.1”. Also README:254–255 uses spherical lifts of perfect δ-rings and their maps.

   **Claim:** A connective spherical lift over S_Âp can be extended along a supplied lift of Âp→(Âp)_∞. None of the declared contracts supplies that map. The algebraic perfection contracts supply ordinary rings; the étale-lift contract supplies étale extensions. Citing KU is a mathematical reference, not an owner for this prerequisite.

   **Witness:** KU line 3902 states this additional theorem; its proof uses spherical Witt vectors and the Tate-valued Frobenius. For A=ℤ_p⟨x⟩, A∞/p=𝔽_p[x^(1/p^∞)] is not finitely presented over A/p.

   The named RefinedTraceMethods §6.1 contract at README:79 specifies cyclotomic base and local input data, not the construction of the spherical perfection map. Its §6.14 contract at README:85 is étale lifting. Mathlib/RingTheory/Etale/Basic.lean:205 requires finite presentation. In the example, finitely many proposed generators involve roots only through x^(1/p^N), so cannot generate x^(1/p^(N+1)). Thus étale lifting is not a substitute. Searches by the objects “spherical Witt”, “spherical perfection” and “perfection lift” in main, Completed, the supplied heads and the board contracts found no earlier owner for this spectral map.

   **Exact repair:** Add under RefinedTraceMethods: “What RefinedTraceMethods must provide (gap:spherical-perfection-map): §6.1. For a p-complete p-completely perfectly covered δ-ring A with the cyclotomic spherical base of KU 3.1, construct the unique p-complete connective E∞ spherical lift S_{A∞} of its completed perfection and an E∞-map S_A→S_{A∞} reducing to A→A∞ (KU Lemma A.1, p.87).” Add a matching gaps object with slug spherical-perfection-map, supplier RefinedTraceMethods, section §6.1 and that needs sentence. Add this gap to §2.3's Needs. For §2.1 add a second matching contract, gap:perfect-delta-spherical-lifts at RefinedTraceMethods §6.1: “For every prime p and p-complete perfect δ-ring B, provide its unique p-complete connective E∞ spherical lift S_B, functorial on δ-maps; in particular lift the map ℤ_p{x}_∞→ℤ_p, x↦p, to S_{ℤ_p{x}_∞}→S_p (KU proof of Lemma A.1, p.87; TC §3.4, p.31).” Add it to §2.1’s Needs and to the plan gaps array.

   **Repair test:** For A=ℤ_p, the constructed map is the identity S_p→S_p. For A=ℤ_p⟨x⟩ it lifts the actual inclusion into ℤ_p⟨x^(1/p^∞)⟩, so extension of scalars of S_R has reduction (R⊗_A A∞)^∧_p as required at README:305. No finite-presentation hypothesis is added to the theorem.

3. **F03** (P3) The Frobenius Checks cannot distinguish the inverse convention

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:442–443: “The twisted family f_m = φ_m(i) ... glues”.

   **Claim:** The Gaussian and cubic Checks validate the Frobenius direction in the prime-edge equality of README:426. Both examples use order-two Frobenius, so the inverse convention passes them too.

   **Witness:** In the Gaussian example φ₇(i)=−i=φ₇⁻¹(i). The cubic example has residue algebra 𝔽₅×𝔽₂₅, whose Frobenius also has order two. GSWZ line 273 fixes the edge direction; line 263 has the opposite general constant-family formula.

   **Exact repair:** Add this Check: “Let F=ℚ(ζ₇), Δ=6·7⁵, a=ζ₇ and p=11. Arithmetic Frobenius sends a to a⁴ and has order three. On the m=1 edge the compatible constant terms are f₁=a and f₁₁=φ₁₁⁻¹(a)=a²: φ₁₁(a²)=a⁸=a. Taking f₁₁=φ₁₁(a)=a⁴ instead gives φ₁₁(a⁴)=a¹⁶=a²≠a. Thus the general abelian-field constant family uses inverse Frobenius; the Gaussian example agrees with either convention.” Add a source remark that GSWZ footnote 1's displayed general embedding must be inverted to satisfy its equation (13).

   **Repair test:** 11≡4 modulo 7, 4²≡2 and 4³≡1; the two competing right sides are a and a². The latter is unequal because a has order seven. This does not allege that the existing Gaussian equality is false.

4. **F04** (P2) The stated local build order contains a forward dependency

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:254: “that criterion recovers the higher-power conclusion in this exponent range”; README:299: “Needs: §2.1”.

   **Claim:** All four consequences in §2.1 are targets of §2.1, but quotientLift_perfected's final conclusion explicitly uses §2.2. Section 2.2 then lists all of §2.1 as a prerequisite, although its general proof does not use a quotient presentation.

   **Witness:** The edges as written are §2.1→§2.2 at README:254 and §2.2→§2.1 at README:299. For p=3, A=ℤ₃{x}^∧₃, R=A/x², the first supplies a lift; only the second supplies F_naive/β≃fil_Hdg dR.

   **Exact repair:** End quotientLift_perfected after its spherical-lift assertion. Move its sentences applying perfectedLiftNaive, including the p-torsion-free condition and the prime-two square boundary, to a corollary after the general theorem and proof of §2.2. Replace §2.2's Needs with two lines: “The general criterion and its global corollary need HabiroCohomologyFoundations §§2.6, 5.15–5.22 and RefinedTraceMethods §6.9.” and “The higher-power application additionally needs §2.1 quotientLift_perfected.” Keep the existing higher-power Check there.

   **Repair test:** The instance p=3, R=A/x² is built in the order quotient lift → independently proved general criterion → higher-power application. At p=2, α=2 the application remains unavailable while the independent algebraic theorem still applies. The external-roadmap gate below is clean; it does not detect this internal subsection edge.

5. **F05** (P2) The consumer paragraph assigns a backward use to HabiroNumberFields

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:459: “HabiroNumberFields uses the degree-zero trace realisation of §4.2 to test its coefficient specialisations”.

   **Claim:** HabiroNumberFields consumes a result owned here, even if only for its tests. It is earlier in the required merge order. Calling the use nonglobal does not make the earlier roadmap able to depend on the later comparison.

   **Witness:** The supplied order places HabiroNumberFields at 159, HabiroRings at 160, RefinedTraceMethods at 161 and HabiroCohomologyFoundationsPartII at 162. Section 4.2 here already owns the Gaussian and cubic trace-specialisation tests.

   **Exact repair:** Replace the opening sentence with: “Section 4.2 tests the coefficient specialisations supplied by HabiroRings HR.5 and HR.7 against the genuine-fixed-point description. HabiroNahmSeries may consume these trace specialisations after this roadmap; its K₃-indexed modules, regulator lines and series remain its own constructions.” Keep the rest of the paragraph. The tests stay here; no dependency is added to HabiroNumberFields.

   **Repair test:** The Gaussian and cubic examples remain §4.2 Checks, supplied from HR.5/HR.7 at position 160 and interpreted here at 162. HabiroNahmSeries is at 163. Every actual input then points from an earlier owner to a later consumer.

6. **F06** (P2) Moore-spectrum structures are already owned upstream

   **Location:** packages/HabiroCohomologyFoundationsPartII/README.md:250–255: “Its consequences for the trace inputs are the following, each a target”; “quotientLift_moore”.

   **Claim:** This roadmap constructs E₁/E₂ structures on S/p^α and their chosen power towers as a new consequence. StableHomotopyKTheory already owns these structures, including the compatible tower and the stronger prime-two range.

   **Witness:** TauCetiRoadmap/StableHomotopyKTheory/README.md:2642–2649, §7.32, supplies the v-compatible quotient tower; :2658–2667, §7.34, supplies Moore spectra. Its Checks give S/16 as E₁, S/64 as E₂ and distinguish S/8's other route.

   **Exact repair:** Replace the quotientLift_moore target with: “Import the v-compatible Moore quotient towers from StableHomotopyKTheory §§7.32 and 7.34. At odd p use v=p; at p=2 use v=4 for the even-exponent tower selected by TC §3.3. The specialization of quotientLift along S_{ℤ_p{x}_∞}→S_p, x↦p, is a Check of compatibility with that supplied tower, using its v-compatible uniqueness (TC §3.4, p.31). The high-powered predicate is the supplied RefinedTraceMethods §7.6 predicate.” Keep the exponent and high-powered arithmetic Checks. If a new formal comparison of the two *specified* towers is needed, name only that comparison as a target and explicitly import the towers it compares.

   **Repair test:** S/9, S/16 and S/64 still have the same structures used by the trace application. S/8 remains available from the stronger supplier theorem while excluded from the chosen even-exponent tower. No second Moore-spectrum existence theorem is planned.

## Round-one verification

A and B denote the earlier codex and independent reviews. All 19 findings were rechecked. “Repaired” includes deletion when the acceptance-test policy supersedes a request for elementary Lean examples. The settled availability objection A-F02 is not re-raised: missing declared suppliers are permitted. Availability has changed for two suppliers, creating the separate minimality issue S01.

| Earlier finding | Status | Repaired passage and witness at this head |
| --- | --- | --- |
| A-F01: numbered supplier links | Repaired | README:25–26 now says “PrismaticCohomology Layer 0” and “PrismaticCohomologyPartIII §7.0 and AInfCohomology §AI.7.2”. No numbered pull URL remains. |
| A-F02: undeclared central inputs | Repaired as an ownership declaration, conditional on supply | README:48: “no claim of an available supplier declaration is made.” All 26 README slugs match named suppliers and sections in design/plan.json. RefinedTraceMethods remains unavailable; absence is not a finding. S01 concerns newly readable targets, not that absence. |
| A-F03: stale pins | Repaired | README:52 gives Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Both match lake-manifest.json and the library checkout HEADs. |
| A-F04: missing manifest | Repaired | sources.toml:1 has “tauceti-roadmap-sources/v1”; ten distinct source entries match the ten reference works and the supplied legal extractions. |
| A-F05: wrong prime-two compatibility | Repaired | README:248: “y_i²-compatible quotient structures at p = 2”; README:260 gives tower exponents 2,3 for α=4,6. Bu line 412 defines compatibility relative to v; Bu line 474 permits v=y². |
| A-F06: zero subgroup index | Repaired | README:42: “positive integers m ≥ 1 with transitions from mn to m”; README:390 uses the same range. At m=1 the term is X^{hS¹}; no C₀ occurs. |
| A-F07: missing arithmetic mirrors | Repaired by deletion | Suggested.lean:22–23: “The arithmetic exponent predicates and trace inversion condition are README definitions and Checks.” E₁(2,3)=false, E₁(2,6)=true, E₁(3,1)=false; all exponent-one inputs fail. Lean mirrors would be padding. |
| A-F08: absent absolute-étale signature | Repaired by ownership correction | README:385: “étaleness of R over ℤ ... is required from HabiroRings §5.8”; README:401 retains the localized-base finite-étale consequence. HabiroRings README:1051–1064 already owns absolute étaleness. This elementary consequence is not a spectral headline. |
| A-F09: missing torsion-free condition | Repaired | README:254: “If, in addition, R is p-torsion free”; README:267 tests ℤ/9. The lift exists, but 3·3=0 and 3≠0, excluding the criterion. |
| A-F10: finite-coefficient range/zero exception | Repaired | README:315 distinguishes “m > 1”, “positive powerful m”, “high-powered m” and “m = 1”. Multiplication by p on the zero module is injective; on ℤ/9 multiplication by 3 has nonzero kernel. |
| A-F11: arithmetic ownership | Repaired | README:60: “QWittVectors §§2.1–2.5 provides arithmetic Λ-rings, arithmetic perfection (§2.3), perfect coverage (§2.4) and relative perfection (§2.5)”. Those sections exist at the supplied head. |
| A-F12: example docstrings | Repaired by deletion | Suggested.lean contains no examples or other declarations. Its one module docstring identifies all six unavailable headline carriers. |
| A-F13: vacuous degree-zero Check | Repaired | README:32 retains “no comparison of higher modules or higher cohomology follows”; that sentence is absent from §4.2 Checks. |
| B-F01: completion owner/order | Repaired | README:30 orders “HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods, then this roadmap”; README:185 attributes the complete category to HabiroCohomologyFoundations §0.1. The supplied order has those entries at 156,160,161,162. |
| B-F02: duplicate absolute étaleness | Repaired | README:401 now names “TraceInversion.finiteEtale” over ℤ[1/Δ]. For F=ℚ, Δ=6 it is rank 1; for F=ℚ(i), Δ=12 it is rank 2 with invertible discriminant −4. |
| B-F03: nonexistent §8.12 | Repaired as a scope reference | README:28 now says “Syntomic trace comparisons are supplied by RefinedTraceMethods Layer 8”. No §8.12 remains; the Layer 8 contents cannot be certified without that supplier. No syntomic target is consumed here. |
| B-F04: high-powered mirrors | Repaired by deletion | README:266 keeps “1, 9, 16 and 64” versus “8 ... 32 ... 12”. Their relevant valuations are empty; 2; 4; 6 versus 3; 5; 1. No elementary Lean examples remain. |
| B-F05: unit 3 attribution | Repaired | README:385: “The factor 3 is retained from the stated hypothesis of KU Corollary 6.15”. KU line 3556 requires 2; KU line 3880 requires 6 dividing Δ. |
| B-F06: unpinned availability prose | Repaired | README:56: “Tau Ceti at the pin contains no Habiro, q-Hodge, spherical-lift, THH or Nygaard carrier.” Object searches at the specified pin found none. |

## Acceptance-test inventory

Read every line of packages/HabiroCohomologyFoundationsPartII/README.md (481) and Suggested.lean (28). The namespace contains **zero declarations**, zero section variables and zero instances. Thus the requested declaration/context inventory is empty, no signature loses a binder, and there is no name for a scratch `#check @name`. No Lean command was run. The single import is Mathlib; the module docstring and namespace have the required form. No padding, sorry'd data, stand-in predicates, options or admitted examples remain.

The headline inventory includes the five end results named in the summary and the additional deep quotient-spectrum theorem. All six are named in the module docstring with their missing carriers. The arithmetic predicates and localized finite-étale consequence are not substitutes for them.

| Headline / section | Context and instance | Computed boundary values | Acceptance-file decision |
| --- | --- | --- | --- |
| traceHabiro, §1.3 | A=R=ℤ; unit input | h-completion ℤ[[h]]; reduction at m=1 is ℤ; R=0 gives H=0 | Not statable: enhanced pairs, coherent descents and completed tensor missing |
| quotientLift, §2.1 | p prime, connective p-complete E∞ T, finite sequence; r=0; p=2,3 | Empty tensor=T; α=4 at 2 gives exponent 2 relative to y², hence E₁; α=2 at 3 gives E₁ | Not statable: ring spectra and their Eₙ quotients missing |
| perfectedLiftNaive, §2.2 | Complete perfectly covered δ-base; p-torsion-free p-quasi-lci R; relative semiperfectness | Unit R=A=ℤ_p: F/β is ℤ_p in steps ≤0 and 0 in positive steps; both Hodge sides agree | Not statable: animated qdR, naive filtration and spectral lift missing; S04 fixes order |
| tracePair_quasiRegular, §2.3 | Identity-cover lift at every prime and global amplitude | A=R=ℤ: both filtrations have F⁰=ℤ[[h]], F¹=hℤ[[h]]; zero ring gives constant ℚ[[h]] before completion | Not statable: enhanced pair comparison missing; S02 supplies perfection map |
| canonicalFramedTrace, §3.3 | Framed smooth S, d coordinates, primes ≤d inverted | d=1, S=ℤ[x]: completed first step is hS[[h]]→S[[h]]dx on both sides; d=2 over ℤ excluded | Not statable: canonical/coordinate/trace pairs missing; n=0 extension remains a gap |
| numberFieldTraceExports, §4.2 | Number field, admissible Δ, compatible roots, ε_R | F=ℚ, Δ=6: ρ₁(q)=1, τ₁(q)=1+h; reduction τ₁ mod h=1 | Not statable: P_R, relative Habiro/Taylor carriers missing; S03 strengthens convention Check |

## Computed statement ledger

This is an instance audit, not a claim that examples prove the general theorems. “Conditional” means the mathematical computation agrees on the declared supplier domain; missing spectral constructions have not been formalized. Each row records actual values, including values in the relevant complexes, rather than a blanket “checked”. References to this README below are to packages/HabiroCohomologyFoundationsPartII/README.md.

| Convention or definition | Instances / computed values on the two sides | Result / change |
| --- | --- | --- |
| h and [n]_q, README:36 | n=0,1,2 gives 0,1,1+q; at q=1 these are 0,1,2; at q=−1 they are 0,1,0 | No division by q−1 or junk n−1 is used |
| Descending filtration and Rees grading, :36 | Unit F⁰=ℤ[[h]], F¹=hℤ[[h]]; β sends 1↦h, t sends h↦h; βt(h)=h²=h·h; degrees +1−1=0 | Direction and degree agree |
| Trace shift, :36 | β∈π₂ moves by Σ⁻² to degree 0; degree-two Bott powers β²∈π₄ move by Σ⁻⁴ to 0 | Sign −2i is correct |
| Filtered quotient, :38 | Unit step 0: coker(h:ℤ[[h]]→ℤ[[h]])=ℤ; step 1: cofib(h:ℤ[[h]]→hℤ[[h]])=0; wrong degreewise quotient=hℤ[[h]]/h²=ℤ | Distinguishes β from degreewise h |
| Chosen pair, :40 | Unit: (F⁰,F/β)=(ℤ[[h]],fil_Hdg ℤ). R=0 over ℤ: (ℚ[[h]],constant ℚ); the zero filtration has F⁰=0≠ℚ[[h]] | Clause (a) excludes the plausible completed wrong object |
| qHdg colimit, :40 | Unit: hⁱ→hⁱ⁺¹ is an isomorphism, colimit identifies with ℤ[[h]]; constant ℚ[[h]] with maps h has localized colimit ℚ((h)), whose h-completion is 0 | Correct on unit and zero-ring pair |
| Positive factorial limit H, :40,:181 | k=1,2,3 gives T₁,T₂,T₆ with arrows T₆→T₂→T₁; every m divides m!, e.g. 3 divides 6 | Cofinality uses positive indices only |
| TC⁻ and genuine subgroup order, :42,:390 | C₁={1}: (X^C₁)^hS¹=X^hS¹; X=0 gives 0 at every stage and π₀=0; C₀ has no finite-group carrier | No illegal zero index |
| p-completion before inversion, :42 | ℤ_p completes to ℤ_p then gives ℚ_p; ℤ_p[1/p]=ℚ_p has p-completion 0 | The opposite order changes ℚ_p to 0 |
| Relative semiperfectness, :42 | A=ℤ[x], R=ℤ via x↦1: relative source mod p is 𝔽_p[x]/(x^p−1)→𝔽_p, onto; A=ℤ,R=ℤ[x]: image of Frobenius is 𝔽_p[x^p], omits x | Both directions distinguished |
| p-quasi-lci/global amplitude, :42,:124 | Smooth line has L=S dx in degree 0; regular quotient has its conormal in degree 1; ℚ[u,v]/(u,v)² has height 2 ideal with 3 minimal generators, hence fails lci although every p-completion is 0 | Global amplitude is not inferred from local vanishing |
| TraceInput category, :122–126 | Identity preserves branch and each lifted diagram; E₂→E₁ on the same ℤ[x] at p=3 has no morphism of this category; endomorphism of the zero diagram is its identity | Definition determines morphisms; changing branches requires a comparison theorem |
| E1QuotientExponent, :233–240 | For p=2 and α=0…7: F,F,F,F,T,F,T,F. For p=0,1,3,4: F,F,T,T,T,T,T,T | Total nonprime extension is explicitly documented; application assumes primality |
| E2QuotientExponent, :233–240 | For p=2 and α=0…7: F,F,F,F,F,F,T,F. For p=0,1,3,4: F,F,F,T,T,T,T,T | E₂⇒E₁ at every natural input; not a characterization of all lifts |
| Quotient spectrum, :244–246 | Empty tensor=T; y=1 gives cofiber(id)=0; y=0 gives cofiber(0:T→T)=T⊕ΣT, not the ordinary ring π₀T | Definition is a derived quotient; regularity is required only for static ring applications |
| TraceInversion, :379–385 | ℚ: Δ=6 true,1 false,0 false,−6 false; ℚ(i): Δ=6 false,12 true; ℚ(∛2):108 true | All three conjuncts matter; sign/zero total cases excluded |
| q-derivative and coordinate filtration, :332–338 | ∇_q(1)=0, ∇_q(x)=1, ∇_q(x²)=(1+q)x. At i=1 and j=0,1 the powers are h and 1; d=0 leaves h^max(i,0) | Quotient is divisibility in the completed framed algebra; at q=1 coefficients are 0,1,2x, not 0/0 |
| Normalized q-divided powers, :295,:465 | δ⁰=1, δ¹=x−y, δ²=(x−y)(x−qy)/(1+q); ∇δ²=x−y. h·γ̃¹=−(x−y); h²γ̃²=δ² | Source sign and q-Pochhammer normalization corrected; no division by a nonunit in an arbitrary ring asserted |
| Genuine realisation P_R, :388–399 | F=ℚ,Δ=6: π₀ of the specified limit=H_{ℤ[1/6]}, with m=1 completion ℤ[1/6][[h]]; zero spectrum comparison has π₀0=0 | Keep limit in spectra before π₀; imported ε_R, not rebuilt |
| ρ_m and τ_m, :417–426 | F=ℚ,Δ=6, z=ε(q): ρ₁z=1, τ₁z=1+h; at m=2, ρ₂z=q mod(q²−1), τ₂z=−1+(q+1) | Domains P_R and finite/completed targets fixed by ε_R⁻¹ |

| Target / location | Instances and computed values | Result / change |
| --- | --- | --- |
| TraceInput.forget, :130 | Unit input↦ℤ; zero input↦0; identity diagram↦id_ℤ | Conditional; preserves specified underlying ring |
| TraceInput.lifts, :131 | Unit's localChoice(2)=E₁ identity; framed line has localChoice(3)=E₂ and localChoice(2)=E₁ root cover | Conditional; retains branch data |
| TraceInput.ofSpherical, :132 | ℤ[1/2][x]: 2-completion 0, odd completions ℤ_p⟨x⟩; ℤ[x] has 2 nonunit | Constructor includes only the first instance |
| TraceInput.ofEtale, :133 | A=ℤ,R=ℤ[1/6]: L=0; at p=5 relative Frobenius of 𝔽₅ is id; at 2,3 completion=0 | Conditional étale lift exists; no finite-over-ℤ assertion |
| TraceInput.ofFramed, :134 | d=0 root cover is identity; d=1 at 2 adjoining all x^(1/2ⁿ) makes Frobenius onto modulo 2, whereas x has no square root in 𝔽₂[x] | Actual cover, not identity, needed on the line |
| TraceInput.ofIdentityCover, :135 | A=R=ℤ: L=0 and Frob on 𝔽_p is id; R=ℤ[x]: x absent from Frob image | First allowed, second excluded |
| TraceInput.unit, :136 | A=ℤ gives identity S_p at every p; A=0 gives the zero local algebra; both have zero relative cotangent complex | Torsion-free qualifier is redundant under perfect coverage, but harmless |
| tracePair, :151,:159 | Unit has steps h^max(i,0)ℤ[[h]]; zero ring has constant ℚ[[h]]; completions differ: unit unchanged, zero completed to 0 | Conditional; pair is not defined as completion |
| tracePair_map, :160 | Identity unit input sends h↦h; map ℤ→ℤ[1/2] sends 2h↦2h and completes at 2 to the zero map | Conditional on maps of the chosen data |
| tracePair_map_id, :160 | On unit step 1, h↦h under both sides | Identity law has the right source |
| tracePair_map_comp, :160 | ℤ→ℤ[1/2]→ℤ[1/6] sends 6h↦6h directly and by composition | Composition law has matching scalars |
| tracePair_completion, :161 | R=0: completed constant filtration=0=deshifted even trace; before completion ℚ[[h]]≠0 | Correct completion boundary |
| tracePair_modBeta, :162 | Unit steps i=0,1 give ℤ,0 on both sides; degreewise quotient would give ℤ,ℤ | Correct filtered quotient |
| tracePair_rational, :162 | Unit rational corner ℚ[[h]], step 1=hℚ[[h]]; zero R corner constant ℚ[[h]] | Rational datum survives zero local factors |
| tracePair_pRational, :162 | Unit at p=2 gives ℚ₂[[h]] after completion and inversion; rationalizing first then completing would give 0 | Separate local rational clause needed |
| tracePair_multiplicative, :163 | E₂ input gives n−1=1; E∞ gives E∞; E₁ Čech branch supplies enhanced limits rather than claiming THH globally even | Source's multiplicative levels retained |
| tracePair_etale, :164–165 | A=ℚ,R=ℚ(i), i=1: H⁰=hℚ[[h]], H¹=ℚ·i; completed step=hℚ(i)[[h]] with H¹=0 | Both completed and uncompleted formulas agree with pullback |
| traceHabiro, :181,:197 | Unit gives lim ℤ[q]^∧_(q^m−1); zero pair gives 0 | Imported H applied to the new trace-pair functor |
| traceHabiro_map, :198 | On unit maps 1↦1 and q↦q; identity/composite both send q²↦q² | Inherits input-morphism restriction |
| traceHabiro_hCompletion, :199 | ℤ[x]: x²↦(q²−1)x dx; at h=0 coefficient 0, while qdR coefficient would be 2 | Correct object is qHdg |
| traceHabiro_partialCompletion, :200 | Unit: completion at m=1 is ℤ[[h]]; T₆→T₂→T₁ sends q↦1+h, same as direct map | Positive divisor direction and marked maps retained |
| traceHabiro_qWittGraded, :201 | m=1, line: gr₀=S, gr₁=Ω¹[−1], gr₂=0; étale R: gr₀=R, all higher gr=0 | No unfiltered-complex identification |
| traceHabiro_smooth, :202 | m=1, line: H⁰=S,H¹=S dx; Bockstein(x²)=2x dx. S=A: H⁰=A,Hⁱ=0 for i>0 | Cohomology and Bockstein match qW₁Ω |
| traceHabiro_multiplicative, :203 | E₂↦E₁ and E∞↦E∞ on both pair and descent; zero ring multiplication is the unique zero map | No upgrade from E₂ alone |
| traceHabiro_pairEquiv, :204 | Identity equivalence of the unit pair induces id_H, sending q↦q; zero comparison sends 0↦0 | Requires a specified pair equivalence |
| traceHabiro_periodic, :205 | Unit in β-degrees −1,0,1: each coefficient H; after degreewise h-completion each ℤ[[h]] | Completion must be read in graded modules as supplier §4.28 specifies |
| traceHabiro_cyclonic, :206 | Unit R=ℤ[1/2] has 2 inverse 1/2; m=1 target is circle homotopy fixed points; R=ℤ fails 2-unit condition | Conditional on (A₂); only module equivalence asserted |
| quotientLift, :242–248 | p=3,α=2: 2>1; p=2,α=4: α/2=2>1; p=2,α=6: α/2=3>2; r=0 returns T | Derived quotient theorem has the correct thresholds |
| quotientLift_framed, :252 | S=ℤ[x],y=x: α=3 gives E₂ at 3; α=4 gives E₁ at 2; ℤ[x]/x⁴ has no p-torsion | Regularity ensures static reduction; cover retained |
| quotientLift_identityCover, :253 | B=ℤ[x^r:r∈ℚ≥0],R=B/x⁴: exponents 4 pass at every prime; basis monomials 0≤r<4 shows integer torsion-free | Spherical perfect/formally-étale interface must be specified under S02 |
| quotientLift_perfected, :254 | ℤ₃/(3²)=ℤ/9 has E₁ lift but 3·3=0; toric higher quotient x⁴ is torsion-free | Torsion-free repair is sound; S02/S04 address proof inputs/order |
| quotientLift_moore, :255 | p=3,α=2 gives S/9; p=2,α=4 gives S/16; E₂ at p=2 starts α=6, S/64 | S06: import the existing Moore towers; retain sufficiency only |
| perfectedLiftNaive, :274–288 | R=A=ℤ_p: Fⁱ=h^max(i,0)ℤ_p[[h]], quotient steps ℤ_p then 0; R=ℤ/9 excluded by p-torsion | Conditional source theorem includes p=2 |
| perfectedLiftNaive_qReg, :290 | Rational square-zero non-lci R=ℚ[u,v]/(u,v)²: every local factor 0; rational pair remains, unlike TraceInput which excludes it | This corollary deliberately does not require global amplitude |
| tracePair_quasiRegular (membership), :305 | Unit perfection map id; toric base needs x↦x in the root colimit; tensor reduction is (R⊗A∞)^∧ | S02 |
| tracePair_quasiRegular (pair equivalence), :306 | Unit identity lift gives Fⁱ=h^max(i,0)ℤ[[h]] on both sides; toric x−1 gives δ¹=x−1 in step 1 on both | Conditional global gluing argument, not attributed as a source theorem |
| tracePair_quasiRegular (descent), :307 | For R=0 both descents are 0 although F⁰=ℚ[[h]]; unit descents both H_ℤ | Functor H preserves the specified comparison |
| canonicalFramedTrace_pair, :343,:353 | Line at i=1 has hS[[h]]→S[[h]]dx; reduction map is identity on Hodge terms; zero map would send dx↦0 | Specified counit rules out arbitrary-map equivalence |
| canonicalFramedTrace_habiro, :349,:353 | Line h-completion on each side has d(x)=h dx and d(x²)=h(1+q)x dx | Conditional transport along pair comparison |
| canonicalFramedTrace_einfty, :353 | Fixed line frame has ∇(x²)=(1+q)x dx, unlike 2x dx away from q=1 | Enhanced product is needed; ordinary coordinate multiplication is not silently used |
| TraceInversion.isUnit_two_three, :385 | Δ=6: 2·(3/6)=1 and 3·(2/6)=1; Δ=12: 2·(6/12)=1,3·(4/12)=1 | Elementary consequence correctly stays out of Lean |
| TraceInversion.finiteEtale, :401 | Rational rank=1; Gaussian rank=2 and discr=−4 invertible at Δ=12; at Δ=1, Ω modulo 2 has basis di and is nonzero | Finite over the localized base, not ℤ |
| genuineRealisation and epsilon, :390–401 | F=ℚ,Δ=6: ε(1)=1, ε(q) has τ₁=1+h; P_R/h=R | Reuse supplier's ring comparison |
| numberFieldTraceExports, :417,:430 | z=ε(q): (ρ₁,τ₁)=(1,1+h); z=0 gives (0,0); z=1 gives (1,1) | Maps have the indicated source P_R |
| numberFieldTraceExports_cyclotomic, :431 | At m=2 rational coefficients, q²=1 in the quotient; transition to m=1 sends q↦1 | Reduction and divisor maps match |
| numberFieldTraceExports_taylor, :432 | At ζ₂=−1, q↦−1+(q+1); at ζ₁=1, q↦1+(q−1) | Same q under marked changes of expansion |
| numberFieldTraceExports_transition, :433 | F=ℚ, m=1: expansion q at ζ_p re-expands to 1+h; Frobenius fixes rational coefficients | S03 adds a non-involutory coefficient test |
| numberFieldTraceExports_equalizer, :434 | Family (1,1,…) satisfies 1=φ_p(1)=1; family (1,0,0,…) gives 1≠0 at p=5,m=1 | Equalizer, not full product; no constant R-algebra insertion |
| numberFieldTraceExports_hCompletion, :435 | Rational unit: h↦h, q↦1+h, completion R[[h]]; component idempotent on orders of 2-adic valuation 1 maps to 0 at m=1 | Completion map need not be injective |
| numberFieldTraceExports_naturality, :436 | ℚ→ℚ(i),Δ=12 sends 1↦1,q↦q; both τ₁ paths send q to 1+h; composite embeddings do the same | Naturality is a target here; objectwise KU corollary alone does not assert it |
| Change of base ℤ→ℤ[1/Δ], :424 | Constant 1/Δ: at p∤Δ Frobenius fixes it; at p∣Δ both overlap rings are 0; Δ·(1/Δ)=1 in the equalizer | Completed coefficient extension applies; arbitrary R constants not inserted |

## README Check ledger

There are 53 Check bullets. The rows below follow their order, so none is hidden by a section-level verdict. Structural comparisons remain conditional on the stated supplier contracts. “Excluded” is a computed failure of a hypothesis, not a numerical counterexample to the theorem.

| Check (section, ordinal) | Computed values / negative control | Result |
| --- | --- | --- |
| 1.1.1 sphericalAbsolute | 2·(1/2)=1 in ℤ[1/2][x]; no integer polynomial b has 2b=1 in ℤ[x] | Constructor separates the two rings |
| 1.1.2 invertTwo | ℤ[1/2]/2ⁿ=0 for all n; ℤ/2=𝔽₂≠0 | Empty versus nonempty 2-local datum |
| 1.1.3 polynomial | Frobenius image 𝔽₂[x²] omits x; in 𝔽₂[x^(1/2^∞)] it contains x=(x^(1/2))² | Correct E₁ root cover at 2 |
| 1.1.4 kuLift | Exponent α=1 gives no spherical E₁ lift by the naive obstruction; KU gives a ku-lift | Distinguishes sphere and ku; no claim of an E₂ counterexample |
| 1.1.5 rationalAmplitude | dim ℚ[u,v]_(u,v)=2; minimal generators of (u²,uv,v²)=3; R̂_p=0 for every p | Local zero factors do not force global lci |
| 1.1.6 mixedBranch | At p=3 branch labels E₂ and E₁ are unequal, so identity ring map has no lift as a morphism between those inputs | Structural negative control |
| 1.2.1 unit | (F/β)⁰=ℤ, (F/β)¹=0; degreewise quotient at 1=ℤ | Correct quotient convention |
| 1.2.2 zero | Fⁱ=ℚ[[h]]; lim cofib(id)=0; cofib(h)=ℚ at every step; Hodge graded pieces all 0 | Nonzero uncompleted rational corner retained |
| 1.2.3 etaleUncompleted | k=1: H⁰=hℚ[[h]], H¹=ℚi; k=2: H⁰=h²ℚ[[h]], H¹=ℚi⊕hℚi; completion H¹=0 | Derived pullback differs from static h-adic step |
| 1.2.4 polynomial | i=1: coefficients (h,1); i=2: (h²,h); wrong h-adic model gives (h,h),(h²,h²) | dx term distinguishes filtrations |
| 1.2.5 einfty | n=2 gives n−1=1; n=∞ gives ∞ | Correct supplied multiplicative level; not a necessity claim |
| 1.3.1 etale | m=1 gives H/h=R=qW₁(R/A), higher q-Witt degrees 0; for R=A,m=2 gives A[q]/(q²−1) | Correct degree-zero relative ring |
| 1.3.2 unitFiltration | F⁰=ℤ[[h]], F¹=hℤ[[h]]; filtered quotient at 1=0 versus degreewise ℤ | Correct distinction |
| 1.3.3 polynomial | r=2: q²−1 versus 1+q; at q=1: 0 versus 2 | qHdg distinguished from qdR |
| 1.3.4 kuLiftInsufficient | Exponent-one PD class x^p/p has no lift in naive step p; q-deformation would require its image | Contradicts pair existence, not only chosen lift |
| 1.3.5 mOne | Reduction of qHdg line has differential 0 and H¹=ℤ[x]dx; ordinary dR H¹ has summands ℤ/r, e.g. x dx has order 2 | Ascending and descending filtrations are on different objects |
| 1.3.6 zero | h-localized constant ℚ[[h]] becomes ℚ((h)), whose h-completion=0; H=0 | Consistent with 1.2.2 |
| 2.1.1 E₁ at 2 small | α=2,3: even-and-≥4 is false,false | Correct exclusions |
| 2.1.2 E₁ at 2 even | α=4,6,5: true,true,false; α/2=2,3 for accepted values | Squared compatibility parameter required |
| 2.1.3 E₁ at 3 | α=1,2: false,true | Odd-prime square retained |
| 2.1.4 E₂ at 2 | α=4,7,6: false,false,true; accepted α/2=3>2 | Correct stricter bound |
| 2.1.5 E₂ at 3 | α=2,3: false,true | Correct odd-prime cube |
| 2.1.6 implication | At 2, 6≥4; elsewhere 3≥2; truth sets above show no E₂-true/E₁-false pair for α=0…7 | Arithmetic implication valid even at composite p |
| 2.1.7 sufficiency | S/8 is E₁ while predicate at (2,3)=false; squared tower for n=1,2 gives exponents 4,6 | Not an iff for lift existence |
| 2.1.8 high-powered | 1: empty valuation list; 9:(3,2);16:(2,4);64:(2,6) pass;8:(2,3);32:(2,5);12 includes (3,1) fail | Matches TC's chosen tower |
| 2.1.9 ℤ/9 | Predicate(3,2)=true; 3·3=0 and 3≠0 mod9 | Repair blocks invalid use of §2.2 |
| 2.1.10 α=1 | Predicate false at 2 and every odd prime; free perfect δ exponent-one quotient fails naive deformation | Independent spherical obstruction supports negative control |
| 2.2.1 higher powers | α=2 passes at 3, fails at 2; α=4 passes at both; algebraic square theorem still works at 2 | No “good primes only” narrowing |
| 2.2.2 toric x−1 | δ⁰=1,δ¹=x−1,δ²=(x−1)(x−q)/(1+q); q=1 gives 1,x−1,(x−1)²/2 in the PD envelope | Includes p=2 without dividing in ℤ₂ itself |
| 2.2.3 exponent one | R∞=ℤ_p{x}_∞/x; obstruction class x^p/p exists in dR but not image of naive step p mod β | No spherical E₁ lift; ku-lift insufficient |
| 2.2.4 gluing | For any ℚ-algebra R, R̂_p=0; R=0 still has dR=ℚ and qdR=ℚ[[h]] | Rational corner is not a product of zero locals |
| 2.3.1 toric | x↦1 gives R=ℤ; relative Frobenius 𝔽_p[x]/(x^p−1)→𝔽_p sends x↦1 and is onto; δ¹=x−1 | Correct identity-cover example |
| 2.3.2 higher powers | B/x⁴ free over ℤ on monomials of exponents 0≤r<4; α=4 passes all primes; α=2 fails only the chosen 2-primary range | Torsion-free hypotheses hold |
| 2.3.3 finite coefficients | ℤ/9 has nonzero 3-torsion; m=1 ring=0, multiplication by p injective; constant rational corner ℚ[[h]] remains | Repaired distinction correct |
| 2.3.4 branch | Ω¹_(𝔽_p[x]/𝔽_p)=𝔽_p[x]dx≠0; Frobenius omits x | Polynomial input is not identity-cover input |
| 3.3.1 line | d=1 has no primes ≤d; first two completed steps (h,1) and (h²,h) in degrees 0,1 | Full integral line retained |
| 3.3.2 etale | d=0: Ω^j=0 for j>0; A=ℚ,S=ℚ(i): F⁰=ℚ[[h]], completed F⁰=ℚ(i)[[h]] | Correct pullback distinction; n=0 canonical extension explicitly remains conditional |
| 3.3.3 derivedReduction | H⁰(M)/h=ℤ; H⁰(M/^Lh)=ℤ[x]; δ(x)=dx,δ(x²)=(1+q)x dx are nonzero h-torsion classes before reduction | Derived cofiber cannot be replaced by cohomology quotient |
| 3.3.4 tensorDomain | dims 1+1=2; 2 not unit in ℤ[x,y], is unit in ℤ[1/2][x,y] | Domain not tensor closed; no closure claimed |
| 3.3.5 Laurent | dR_(ℚ[x±¹]/ℚ)=ℚ after animation; completed underived Ω has H⁰=ℚ,H¹=ℚ·dx/x | Different zeroth-step objects retained |
| 4.1.1 rational | discr ℚ=1; Δ=6 passes,Δ=1 fails 6-divisibility; 2⁻¹=3/6,3⁻¹=2/6 | Correct |
| 4.1.2 positive | Δ=0,−6 both satisfy divisibility but fail positivity; Away(0)=0 | Needed positive convention |
| 4.1.3 notIntrinsic | −4∤6 but −4 divides12; ℤ[i][1/6]=ℤ[i][1/12] | Predicate is on Δ, not just localized ring |
| 4.1.4 finiteEtale | Ranks 1 and2; Gaussian discriminant −4 becomes unit at12; at2, differential relation 2i di=0 becomes 0=0, leaving di≠0 | Discriminant condition tested negatively |
| 4.1.5 cubic | Polynomial discriminant x³−2 is −27·4=−108; 108=2²3³; coefficient localization inverts2,3 | Correct cubic coefficients |
| 4.1.6 positiveIndex | |C₁|=1; fixed-point term at1=X^hS¹; finite group of order0 impossible | Correct index domain |
| 4.1.7 order | Replacing both fixed-point stages by homotopy fixed points yields X^hS¹ at every m. For rational coefficients τ₁ kills a nonzero component idempotent e₂, whereas identity on the full H would send e₂ to e₂ | Wrong replacement loses root components; TR maps are not given |
| 4.2.1 rational | m=1 completion ℤ[1/6][[h]]; h↦h, q↦1+h | Correct |
| 4.2.2 mOne | ζ₁=1, qW₁=R; τ₁(q) mod h=1=ρ₁(q); component idempotent e₂≠0 has τ₁(e₂)=0 | Not injective after inverting2,3 |
| 4.2.3 twisted | i versus φ₇(i)=−i; twisted f₇=−i gives φ₇(f₇)=i; 2,3-completions0 | True, but φ₇=φ₇⁻¹: S03 |
| 4.2.4 nonabelian | (x−3)(x²+3x+4)=x³−5x−12≡x³−2 mod5; quadratic discriminant3 nonsquare; for a quadratic root a, a⁵=2−a≠a | Constant family fails; inverse Frobenius still indistinguishable here |
| 4.2.5 gluing | At p=5,m=1: family(1,0,…) gives 1 on left,φ₅(0)=0 on right | Equalizer condition nonvacuous |
| 4.2.6 inversion | F=ℚ,Δ=1: discr divides1 and ℤ/ℤ is étale, but6∤1 | Spectral construction not invoked outside stated domain |

The zero module/ring, empty sequence, unit relation, ranks/dimensions 0,1,2, p=2,3, q=1, a nonreduced rational algebra, split coefficient factors and a non-Galois field are represented above. Characteristic-p coefficient bases such as 𝔽₂ are excluded from nonzero perfectly covered arithmetic Λ-bases; the reduction calculations explicitly use 𝔽₂ and 𝔽₃. A purely inseparable nontrivial finite extension is not étale. Group noncommutativity tests S₃,Q₈ and compact/noncompact topological groups do not instantiate any quantified group here: the only spectral subgroup parameters are the specified finite cyclic C_m. Arbitrary non-quasi-separated spaces and unbounded-dimensional schemes are likewise outside these affine ring statements. There is no natural division by zero, negative natural subtraction, polynomial-degree total function or out-of-range Fin index in Suggested.lean, which has no declarations.

## Sources and supplier audit

The ten works in sources.toml were readable in the supplied legal cache; no additional text or reference request was necessary. The following ledger records **104 locator anchors** (30+45+6+7+6+4+1+1+3+1). A verified anchor means the passage was read and compared with the target's actual hypotheses; it does not certify new coherent constructions absent from the cited paper. Printed pagination, rather than extraction page markers, was used.

| Source | Locators and extraction anchors |
| --- | --- |
| QH (30) | 1.19: line 371; 2.9: line 674; 3.1: line 850; 3.2: line 870; 3.3: line 940; 3.6: line 978; 3.8: line 1006; 3.9: line 1020; 3.11: line 1089; 3.12: line 1105; 3.13: line 1174; 4.1: line 2419; 4.4: line 2501; 4.6: line 2522; 4.7: line 2556; 4.17: line 2743; 4.18: line 2763; 4.21: line 2813; 4.22: line 2860; 4.23: line 2876; 4.24: line 2888; 4.25: line 2953; 4.26: line 2970; 4.27: line 2983; 4.28: line 3026; 4.29: line 3043; 4.31: line 3075; A.12: line 3452; A.14: line 3514; B.1: line 3545. |
| KU (45) | 1.2: line 78; 1.4: line 90; 1.9: line 172; 1.11: line 188; 1.14: line 292; 1.15: line 304; 3.1: line 973; 3.2: line 988; 3.10: line 1117; 3.11: line 1123; 4.4: line 1505; 4.5: line 1546; 4.6: line 1567; 4.7: line 1578; 4.8: line 1598; 4.9: line 1606; 4.14: line 1796; 4.15: line 1798; 4.16: line 1802; 4.17: line 1908; 4.18: line 1949; 4.18a: line 2103; 4.21: line 1986; 4.22: line 2029; 4.23: line 2065; 4.25: line 2107; 4.26: line 2133; 4.27: line 2143; 4.28: line 2153; 4.29: line 2162; 5.43: line 3142; 5.51: line 3292; 5.62: line 3548; 5.63: line 3556; 6.1: line 3611; 6.7: line 3678; 6.8: line 3682; 6.9: line 3705; 6.10: line 3726; 6.11: line 3741; 6.12: line 3791; 6.13: line 3806; 6.14: line 3873; 6.15: line 3880; A.1: line 3902. |
| TC (6) | 3.3: line 1262; 3.4: line 1290, with the lift construction at line 1304; 3.5: line 1317; 3.6: line 1340; 3.7: line 1354; 3.8: line 1370. The rational-corner correction is needed; it does not alter the completed comparison. |
| GSWZ (7) | Definition 1.1 and (12): line 260; (13): line 273; (14): line 290; (15): line 299; footnote 1: line 262; Remark 1.2: line 311. The footnote's general Frobenius convention needs the S03 correction. |
| Bu (6) | Theorems 1.1,1.4,1.5 and footnote 4: lines 23–92; Remarks 5.5,5.7: lines 474–495. The definition of v-compatibility was also read at line 412. The exponent at 2 is relative to y². |
| BS (4) | Theorem 15.3: line 3898; Proposition 15.7: line 3960; Lemma 16.10: line 4148; Theorem 16.22: line 4378. Relative Frobenius uses its scalar twist; Proposition 15.7 is relative to the Breuil–Kisin sphere-polynomial base. |
| BMS2 (1) | Theorem 1.12: line 252; multiplicative complete filtrations and graded shifts at lines 259–297. |
| HA (1) | Theorem 7.5.0.6: line 52724; equivalence for étale algebras, not arbitrary perfection maps. |
| Pri (3) | §1.1, Remark 1.2, Lemma 1.3: lines 80–160; localization and λ-normalization compared with the d=1,2 calculations above. |
| Stacks (1) | Example 60.19.1 / Tag 07L7: line 1728; the cosimplicial free module has a nullhomotopy. This supports the cited row-acyclicity input, not every unproved framed totalisation comparison. |

**Cross-roadmap resolution.** Nine readable supplier roadmaps were checked by section and object: HabiroCohomologyFoundations, HabiroRings, QWittVectors, StableHomotopyKTheory, HabiroCyclotomicCompletions, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII and AInfCohomology. RefinedTraceMethods is the tenth named supplier and is handled by its declared contracts, not an invented current file. The two explicit Habiro-family heads and QWittVectors were read from the supplied checkouts; the roadmap service supplied the other available new-roadmap heads. Main and Completed were searched separately. Ownership searches covered all 24 explicitly supplied open folders, both README.md and Suggested.lean, plus board packages and the roadmap service's object search.

| Citation family | Resolution and hypothesis check |
| --- | --- |
| HabiroCohomologyFoundations §§0.1,1.14,1.16,2.1–2.10,4.1,4.4,4.8,4.12–4.24,4.28 | Exact objects occur; see S01. Animation is on polynomial algebras, so it need not retain all smooth underived values. The exported finite-projective extension is conditional on that supplier's own declared gaps; none is treated as an unconditional arbitrary-flat theorem here. |
| HabiroCohomologyFoundations §§5.2–5.8,5.13 | Canonical section has n≥1 in §5.2 and primes ≤n inverted. §5.13 is the smooth-scheme cohomology export. The local n=0 contract is an actual extension, not a supplied n=0 theorem. |
| HabiroCohomologyFoundations §§5.15–5.23,5.26 | Ordinary naive preimage, injectivity, completed flat base change, higher powers and exponent-one failure match. §5.22's derived commutative refinement retains its own declared contract. Powerful finite coefficients include m=1 with the rational corner. |
| HabiroCohomologyFoundations §§8.18–8.19 | These are the named θ/de Rham and Witt/crystalline comparison targets. This package correctly excludes inferring their equality from trace coefficients. |
| HabiroRings HR.2,HR.5,HR.7 | §§2.4–2.5,5.1–5.9,7.3 supply the claimed objects, with full coefficient tensors, completed base change and cubic Frobenius. Many old API aliases in this package do not occur literally at that head; cite the existing prose target/section when implementing S01, rather than inventing exports. |
| QWittVectors §§2.1–2.5 | Arithmetic Λ-coalgebra, colimit perfection, faithful-flat perfect coverage and linearized relative Adams maps are the current targets. Perfect coverage implies integer torsion-freeness; relative perfection does not mean ψ_p on the base is invertible. |
| StableHomotopyKTheory §§7.29,7.32,7.34 | §7.32 provides uniqueness up to equivalence among v-compatible structures, with q>n, not arbitrary Eₙ structures. §7.34 already owns Moore structures: S06. |
| HabiroCyclotomicCompletions §§1.4,2.3,5.1,5.3 | Factorial cofinality, polynomial/Laurent comparison, ordinary coefficient-module completion and localized domain factors occur. At N=2, deg P₂=3; at Δ=6, component indices are (v₂(m),v₃(m)), explaining the τ₁ kernel. |
| PrismaticCohomology Layer 0; PartII §§3.1,3.13–3.16,3.20–3.23,5.7–5.8 | Ideals φ⁻¹(Jⁱ), the relative Frobenius twist, Lη, Nygaard completion and q-PD envelopes are supplied. The q-PD quotient comparison retains the supplier's complete-quotient hypothesis. These are imported proof machinery, not new targets here. |
| AInfCohomology §AI.7.2; PrismaticCohomologyPartIII §7.0 | Quasisyntomic unfolded trace coefficients, the three graded comparisons and relative Breuil–Kisin comparison occur. The relative result retains the mixed-characteristic DVR/perfect-residue-field domain and Nygaard completion. No identification of global THH with its locally even cover is used. |

All **26** plan slugs have identical README slugs and a named supplier. Thirteen are nonminimal under S01. The remaining thirteen are audited below; their unimplemented status is not itself a finding.

| Remaining gap | Precision / domain retained |
| --- | --- |
| canonical-smooth-pair | Existing n≥1 target plus needed n=0 extension; S01 narrows the missing contract without narrowing the headline |
| spherical-base-data | KU 3.1 base, KU 3.2 E₂ or torsion-free E₁ Čech data and coherent global choices; omits the distinct perfection input in S02 |
| local-trace-comparisons | Odd-prime E₂, all-prime E₁ and identity-cover preimage statements are distinguished |
| global-trace-pair | KU 4.18 plus its 2-primary E₁ addendum; the completed trace description is pulled back to the uncompleted pair |
| full-framed-trace | All relative dimensions, torsion-free base, no dimension-dependent prime inversion; local 2-torsion-free condition accompanies comparison to the selected input |
| framed-proof-exports | Full diagonal, not coordinate-difference ideal alone; pair clauses, normalized generators and multiplicative refinement explicitly requested |
| cyclonic-comparison | Positive indices, 2 invertible and (A₂); module equivalence without an automatic multiplicative upgrade |
| number-field-realisation | Number field, positive Δ divisible by 6 and discriminant, genuine fixed points before residual homotopy fixed points |
| coherent-trace-interface | Circle and finite-subgroup maps with complete even filtrations and explicitly bounded multiplicative level |
| framed-resolution-comparison | Polynomial/perfect-root comparison at 2, with maps from qdR and all pair clauses |
| framed-derived-commutative | Fixed framing and full-diagonal totalisation, retaining the stronger derived commutative structure |
| finite-coefficient-trace | High-powered positive m, including the zero-ring boundary m=1; only completed comparison imported |
| framed-pair-coherences | All four comparison clauses and their squares on the full framed torsion-free domain |

The overlapping framed gap entries are declarations of the same supplier's requested refinements, not a claim of multiple completed owners. The source does not supply the full formal coherent comparison; that work remains explicit.

**Pinned APIs.** The pins in the manifest and actual library HEADs agree with README:52. The native declarations were read in Mathlib/RingTheory/Etale/Basic.lean:205, Mathlib/RingTheory/Smooth/Basic.lean:539, Mathlib/NumberTheory/NumberField/Basic.lean:101, Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36 and :75, Mathlib/RingTheory/Localization/Away/Basic.lean:82, Mathlib/Algebra/Divisibility/Hom.lean:31, Mathlib/Algebra/Divisibility/Units.lean:129 and Mathlib/Algebra/Group/Commute/Units.lean:74. Étale/smooth include finite presentation but not module finiteness. `map_dvd` requires a multiplicative homomorphism, and `isUnit_of_dvd_unit` uses a commutative monoid; those hypotheses hold for the coefficient ring. `Commute.isUnit_mul_iff` retains its commuting hypothesis. Object searches in both pinned trees found no Habiro/q-Hodge carrier, spherical lift, cyclonic THH/KU or Nygaard package making the six headlines statable. The other elementary carriers were located at Mathlib/Algebra/MvPolynomial/Basic.lean:79 (`AddMonoidAlgebra R (σ →₀ ℕ)`), Mathlib/Data/Nat/Factorization/Defs.lean:50 (multiplicities in primeFactorsList), Mathlib/Algebra/Group/Even.lean:55 (the additive declaration generated from IsSquare), and Mathlib/GroupTheory/MonoidLocalization/Away.lean:140 (localization at powers of the element). Native filtered complexes alone do not provide the missing spectral constructions.

**Dependency gate output** (exit 0):

```text
depcheck: 25 roadmaps, 223 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. S04 is an internal subsection-order issue; S05 is a backward consumer assignment in prose. Neither is an extra edge reported by this gate. The package diff against origin/main is confined to packages/HabiroCohomologyFoundationsPartII: seven package files, 1096 inserted lines at the reviewed head. No external-package change, computation algorithm, pull-request-number narrative in README/docstrings, `lemma`, `set_option`, or additional import was found.

## Verified sound

Counts: **19** earlier findings checked individually; **0** Lean declarations read (the entire 28-line file); **5** bold README targets plus the nonbold traceHabiro headline, giving **6** headline rows; **51** target/API rows and **20** convention/definition rows with computed instances; **53** Check bullets tested; **104** source locator anchors across **10** legal works; citations to **9** readable supplier roadmaps resolved and **26/26** gap slugs matched; ownership searched across all **24** supplied sibling folders, main, Completed and board packages. The unresolved tenth supplier is recorded below.

The repaired prime-two quotient convention, positive subgroup indexing, torsion-free restriction, powerful/high-powered distinction, zero-ring rational corner, full coefficient tensor, completed base-change convention, derived quotient, multiplicative levels and q-divided-power sign survive the computed tests above. No false headline identity was found on its stated domain, conditional on the declared supplier interfaces. The five P1/P2 findings concern ownership, missing prerequisite supply and build direction; S03 is the discriminating-Check issue. The empty acceptance file correctly avoids representing unavailable spectra and enhanced pairs by unrelated native stand-ins. No declaration can collide with a sibling's fully qualified Lean name because there are none.

The original head remains f8c10d37ae53a1cebd3d4d9d30f13d39bc8286c1. The only new board file is this report. No package source was edited, no Lean build or elaboration was run, and nothing was posted.

## Not verifiable

- RefinedTraceMethods has no readable current roadmap in the supplied material or the roadmap resolver. Its twelve declared contracts are accepted conditionally as requested; the absence is not re-raised. Their eventual implementations, exact exported Lean names, higher coherences and multiplicative refinements cannot be certified here. S02 concerns an input missing from those contracts, not the absent implementation of a declared one.
- The dimension-zero canonical filtration extension is requested by canonical-smooth-pair, whereas the readable base §5.2 and QH line 2419 begin with n≥1. The d=0 formulas are consistent with the empty-frame calculation, but the specific F₀/counit interface is conditional on that extension. The supplied derived commutative and finite-projective interfaces likewise retain their own declared gaps.
- The new functoriality, global gluing comparison and naturality of the transported number-field realisation are targets to prove, not theorem statements printed wholesale in the sources. The instance audit checks their domains, defining maps and normalization; it is not a formal proof of all higher compatibilities.
- No elaborated-signature artifact exists because Suggested.lean has no named declaration. There was consequently no meaningful `#check @name` file to elaborate. Compilation of the import itself was not attempted under the read-only/no-build instruction.
- The ownership pass searched the provided sibling heads and the roadmap service's indexed objects. It did not inspect the full contents of every other unlisted open pull request. No conclusion about undisclosed work is claimed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f8c10d37ae53a1cebd3d4d9d30f13d39bc8286c1", "job": "RT-HabiroCohomologyFoundationsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
