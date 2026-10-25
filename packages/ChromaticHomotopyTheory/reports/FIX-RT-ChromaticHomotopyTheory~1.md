# ChromaticHomotopyTheory repair report

The first seven finding sections answer RT-ChromaticHomotopyTheory_r1a.md; the last two answer RT-ChromaticHomotopyTheory_r1b.md. The repeated F01/F02 identifiers belong to different reviews. Shared height-one and Check issues are repaired once, with both findings accounted for below. No finding is disputed. The BHLS ownership decision remains external; a successful dependency gate does not settle it.

## F01 (P1) — applied

Commutative spectral localization of End(V) → the E₁ ring Q_n=L_n^f(DV⊗V), using BordismFormalGroups F6.3’s finite-source telescope comparison. Corrected §3.3, Layer 3 Dependencies and the supplier contract. Added the matrix-unit Check e₁₂e₂₁=e₁₁≠e₂₂=e₂₁e₁₂. Evidence: GeneralizedCohomology G2.8 only localizes commutative spectral rings; BordismFormalGroups F6.3 supplies the required finite-source comparison.

## F02 (P1) — applied differently

Unnamed categorical-height input → gap:weak-ring-finite-postnikov, addressed to BordismFormalGroups F6.5 and repeated in the plan’s gaps. It requests the actual one-sided-unital weak-ring criterion, its infinity endpoint, finite-Postnikov extension and higher norm inputs. Updated §6.3 and Layer 6 Dependencies; added H𝔽_p, Q_i and Hℚ Checks. Evidence: csy line 3616, line 3970, line 4036 and line 4060. No Lean padding.

## F03 (P1) — not actionable in this package: prerequisite ownership and Part II placement require a maintainer decision

Carriers-only BHLS route → explicit gap:bhls-purity-comparison and gap:bhls-bp-redshift, addressed to GeneralAlgebraicKTheoryPartII KII.5–KII.6. Updated §8.3, contracts, Dependencies, downstream text and Lean docstring. Added the π_−1=ℤ₂ Check. That supplier already consumes this roadmap; splitting ownership or creating Part II exceeds these edits. Evidence: bhls line 2904, line 3203, line 3219 and line 3225.

## F04 (P2) — applied

Module adjunction/Čech reconstruction from a homotopy ring → homotopy-unital action a:R⊗M→M, with a(η⊗id)=id. After ⟨R⟩≤⟨E(n)⟩, the supplier’s pairing-locality criterion makes R⊗M local and the unit action retracts onto M. Corrected §8.1, Layer 8 Dependencies and Lean docstring. Three action Checks cover M=R, M=0 and a forbidden zero action on nonzero M.

## F05 (P2) — applied

Prime-two z(m) → z_p(m) for every prime, defined from Ωfib(J_(p^m−1)S²→K(ℤ,2)) in p-complete spectra. Updated §13.3–§13.4, their API, proof inputs, Checks, Layer 13 Dependencies and Lean docstring. Added p=3 indices 2 and 8, π₀=ℤ₃, rational π₀=ℚ₃ and ranges ∅/{1}. Evidence: lmmt line 867; akq line 218 and line 632 for the prime-two specialization.

## F06 (P3) — applied

Deleted the thirteen identified scope-only Check bullets; their mathematical qualifications remain in the statements. Removed fifteen further occurrences of the same pattern in Layers 2–10 and separated §5.1’s existing computed examples into individual Checks. Retained the explicit suspension-loop, connectivity, KU-height, affineness and modular-form calculations. Every definition/API block still has at least three Checks. No Lean declaration was added.

## F07 (P2) — applied

Unqualified auxiliary q → prime q throughout Conventions and every dependent Moore-spectrum, coefficient and worked example. Made “any prime q different from p” explicit in Layer 0. Added p=2,q=3 with maps 1 and unchanged ℤ/3 after inversion; integer 4 gives maps 0 and annihilated ℤ/4 and is excluded. The relative-fiber cases q=p remain admitted.

## F01 (P2) — applied

Finite-complex representatives attributed to HomotopySpheres §3A → GeneralizedCohomology G3.7’s finite-CW suspension-spectrum mapping formula. Corrected Scope, both supplier contracts, §§3.1/5.1 Needs and Layers 3/5 Dependencies. HomotopySpheres retains convenient pointed mapping spaces and sphere Freudenthal. The Moore Check uses a stable periodic power at 2; degree 2p−2 is specified only at odd primes, where the Adams map has that degree.

## F02 (P3) — applied

Height-one equality cited only to BHLS → Miller Theorem 4.11/Corollary 4.12, pp.294–295, and Mahowald Theorem 6.3, p.382, with its corrected proof in the 1984 addendum §2. Added all three primary manifest entries and references. Evidence: miller line 272 and line 282; mahowald line 627; mahowald-addendum line 75 and line 87. BHLS remains the higher-height locator.

## Required checks and file boundaries

| Check | Exact outcome |
| --- | --- |
| Elaboration of packages/ChromaticHomotopyTheory/Suggested.lean from the pinned content checkout | `lake env lean` exited 0, with no diagnostics. No TauCeti import or targeted object build was needed. |
| Elaborated-signature inventory | Mechanically found 0 declarations, 0 section variables and 0 instances. Thus the `#check @name` list is empty. An import-only scratch signature file was elaborated once: exit 0, no diagnostics. No binder can silently disappear, and no signature changed. |
| Dependency direction | Exit 0; verbatim output below. No UPWARD, CYCLE or moved line. |
| README/plan gap agreement | All 6 slugs, supplier names and needs sentences match. Three existing gaps were preserved; three were added. |
| Plan edit boundary | Parsed comparison with HEAD, excluding only top-level gaps, is equal. No node, edge, coverage entry or other plan value changed. |
| Sources | 23 unique entries, each with authors, title, year, locator scheme, locator and cited_for. All new texts legally retrieved and read; no missing reference remains. abs retains its settled uncertified status. |
| Acceptance-file form | One import Mathlib, one module docstring, empty namespace; no definitions, admitted data, stand-ins, set_option or padding. The missing spectral carriers still prevent every headline signature. |
| README definition Checks | All 13 numbered subsections containing the definition/API marker retain at least 3 Check bullets; the relative Dₚ definition also retains 3. No new subsection or layer was introduced. |
| Whitespace and machine paths | `git diff --check` exited 0. No machine path in README, Suggested.lean, sources.toml or this report. |
| Other gate failures supplied in the brief | None. No tooling, merge order, other package or pull-request text edited. metadata.toml is unchanged. No commit or push performed. |

```text
depcheck: 52 roadmaps, 586 edges, 0 problem(s)
```

The gate has only a declared supplier gap for GeneralAlgebraicKTheoryPartII, whose package contains a design rather than an accepted package README. Its clean result therefore does not exclude the mathematical cycle documented under F03. The package cannot certify closure of that prerequisite graph.

## Sources, pins and ownership evidence

The content checkout read is at 1ce5c4f05d1387e8830ae981f7d34d74ba931a89. Mathlib HEAD and the manifest both identify 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti HEAD and the manifest both identify a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The roadmap-service index separately identifies its main as e9512ca; its resolve output was used as a lead, not as evidence that the local pinned libraries were absent. Its citation and own-name searches report none missing.

Representative upstream shapes read before editing were TauCetiRoadmap/EnhancedDerivedSheaves/README.md, TauCetiRoadmap/AlgebraicTopology/README.md and Completed/UniversalCovers/README.md. Existing layer order and forty numbered target subsections were preserved.

| Supplier | Sections re-resolved and evidence used |
| --- | --- |
| GeneralizedCohomology, local main | G2.8, lines 460–465: commutative even-class localization. G3.7, lines 773–783: finite-CW mapping colimit. G3.4/G3.8/G3.9: spectral colimits, covers and completion. G4.5/G5.1/G5.4: orientations, finite duality, Bott models and coefficient normalization. |
| BordismFormalGroups, local main | F1–F3/F5: orientation and BP coefficient carriers, invariant ideals. F6.1–F6.4: localization, nilpotence including ∞, telescopes, finite quotient and smashing. F6.3, lines 858–867: pairing locality; lines 1192–1201: finite-source telescope comparison. F6.5: coherent norms, Kan extensions and K(n)-local comparisons; it does not state the requested higher finite-space criterion. |
| EnhancedDerivedSheaves, local main | E0.4–E0.5 and E5 stable monoidal/compact-presentable interfaces. E5:abstract.4’s ordinary ringed-site tensor does not itself supply the spectral elliptic module enhancement; gap:spectral-ringed-sites remains. |
| AlgebraicTopology, local main | Stages 4–5 and 8: CW/fibration/local-system and homotopy-fiber, Hurewicz and Whitehead inputs. |
| ModularCurves, local main | §3D, §4B, §4C, §5B, §7E and §7F: invertible-level comparison, Weierstrass descent, ordered full bases with right action, p-divisible heights and Serre–Tate. |
| HomotopySpheres, roadmap-service head | §3A.1–4: convenient pointed spaces and sphere Freudenthal, not a finite-complex stable-map comparison. §3B: connected James and word quotients; its stable splitting remains gap:stable-james-splitting. §4B: real Bott. |
| StableHomotopyKTheory, roadmap-service head | §3.18/§3.21: Postnikov and twisted data; §§7.21–7.27, especially §7.24: exhaustive bounded-below homological filtrations without a connective coefficient hypothesis. |
| TopologicalKTheory, roadmap-service head | T7: Clifford coefficients, a²=4b, real periodicity and complexification normalization. |
| EllipticCohomology, roadmap-service head | E1, E2.2–E2.3, E3, E4 and E6: marked heights 1/2, obstruction machinery, sheaf, δ=Δ²⁴ and level-stack descent; degree +2 generator is u⁻¹ here. |
| RefinedTraceMethods, supplied head | §2.3, §2.6, §2.9, §2.10, §4.9, §4.11 and §6.8: Segal, THH/TC/K, trace and completed KU comparison. These are carriers/comparisons, not the BP Lichtenbaum–Quillen theorem. |
| GeneralAlgebraicKTheoryPartII, board design | KII.5/purity owns purity; KII.5 Stage inputs and cmnn-vanishing consume this roadmap’s finite localization, Tate and height results. KII.6 owns redshift, but its general E∞ result does not state the associative BP-specific contract. No supplied theorem was invented for either gap. |

Ownership was searched by object with the roadmap service on its open-head/main index and with rg in main, the board and all 102 README/Lean files in the 51 supplied sibling folders: weak-ring Eilenberg–Mac Lane criteria, higher finite-space ambidexterity, finite-source telescopes, homotopy actions, integral James Thom families and BP Lichtenbaum–Quillen/redshift. No competing owner for the all-prime integral Thom extension was found. The earlier generic spectral and pairing constructions keep GeneralizedCohomology/BordismFormalGroups ownership; the missing higher finite-space theorem is explicitly requested, not claimed as supplied. The known purity ownership is preserved. No additional unprovided open checkout was sought. There is no own Lean declaration whose qualified name could duplicate another roadmap.

The four added legal texts are Miller’s author-hosted PDF, Mahowald’s institution-hosted PDF, Mahowald’s publisher-open addendum and Hahn–Wilson arXiv v5. An initial Project Euclid response for Mahowald was an access-error HTML page; it was not used as mathematical evidence and its manifest fetch was replaced by the actual institutional PDF. All failed preliminary reference requests were resolved under the same keys. The addendum is a separate work, not a second key for bo-resolutions.

The BHLS-specific primary comparison is also recorded: hahn-wilson line 93 gives the E₃-BP model’s redshift theorem and following large-degree comparison; hahn-wilson line 1422–1438 gives a sequence of unital maps through TC to the nonzero relative negative cyclic detector. A zero K(h+1)-local TC would force that target to vanish. Since ⟨K(h+1)⟩≤⟨T(h+1)⟩, this forces the required nonzero T(h+1)-smash as well. The requested model remains the specified highly structured BP form, not an arbitrary multiplication on the underlying truncation.

## Adversarial mathematics pass

These rows record explicit instance calculations, not proofs of the future theorems. Shared API and worked-example formulas use the same computed objects in their corresponding rows. Supplier-gap rows test the requested statements without representing those gaps as completed supply. No assertion of acceptance or independent review is made.

| Statement | Instances tried | Computed values on the relevant sides | Result and change |
| --- | --- | --- | --- |
| Universe/derived and finite conventions | Empty diagram; zero object; finite sphere; countable wedge | colim∅=0; π₀S_(p)=ℤ_(p); identity on countably many nonzero summands has infinitely many nonzero projections | Zero and finite/infinite distinctions retained. |
| Suspension, signs and boundary | ΣS; degree (1,1) switch; id:S→S; 0→S | π₁ΣS=ℤ; switch=−1; cofib(id)=0; cofib(0→S)=S; boundary lowers degree by 1 | Sign convention retained. |
| Auxiliary prime and all-spectra bottom | p=2,q=3; excluded integer 4 | 3 on ℤ/2=1; (ℤ/3)[1/2]=ℤ/3; 4 on ℤ/2=0; (ℤ/4)[1/2]=0 | Prime hypothesis added globally. |
| Rational versus p-inversion detector | S/q, q≠p; S_(p) | S[1/p]⊗S/q=S/q≠0; Hℚ⊗S/q=0; S_(p)[1/p]=Hℚ | Both directions of restricted comparison preserved. |
| Connected covers | K(A,2), pointed two-point set | K(A,2)⟨3⟩=*; τ≤2K(A,2)=K(A,2); τ≤0{a,b}={a,b}; {a,b}⟨1⟩={a} | Cover indexing retained. |
| Coefficient grading | p=2,3; degree −2 u | degrees v₀=0, v₁=2 or 4; degree u^(1−pⁱ)=2(pⁱ−1) | No negative-degree substitution. |
| Formal coordinate and p-series | Additive/multiplicative laws over 𝔽₂,𝔽₃; x↦−x | [2]_add=0, [2]_mult=X²; [3]_add=0, [3]_mult=X³; negative coordinate changes XY to −XY | Finite/infinite heights and plus sign retained. |
| Periodicity and elliptic grading | ψ^(−1); Δ²⁴ | u↦−u↦u; u⁻¹↦−u⁻¹; weight=12·24=288; degree=576 | Witness reused in Layers 7/12. |
| Coherent action and completion conventions | Trivial C₂-action on rational spectra; mod-p/integral Thom endpoints | Norm=2 with inverse 1/2; π₀ endpoints=𝔽_p and ℤ_p; ambient π₀ colimit is completed for integral endpoint | Local/raw and completed-category conventions preserved. |
| Layer 0 finite duality | S_(p), S/p; target Hℤ | D(S_(p))=S_(p); D(S/p)=Σ⁻¹S/p; π₀F(S_(p),Hℤ)=0, π₀(S_(p)⊗Hℤ)=ℤ_(p) | p-local-target hypothesis retained. |
| Layer 0 homological reflectors | E=0,S,Hℚ | L₀X=0; L_SX=X; L_HℚS=Hℚ | No ordinary categorical predicate substituted for a reflector. |
| Layer 1 MU versus BP | p=3 | π₂BP=0; π₂MU_(3)=ℤ_(3) | p-typical retract distinguished. |
| Layer 1 Morava coefficients | K(0); K(1) at 2; K(∞) | K(0)₀=ℚ, K(0)₂=0; K(1)₂k=𝔽₂, odd groups 0; H𝔽₂ only degree 0 | Infinity endpoint distinguished. |
| Layer 1 coefficient cofibers | BP⟨1⟩/v₁; k(1)/v₁; Hℤ_(p)/p | π₀=ℤ_(p), 𝔽_p, 𝔽_p respectively | Connective quotient conventions retained. |
| Layer 2 type and smash | S_(p), S/p, 0 | types 0,1,∞; max(0,1)=1; max(1,∞)=∞ | Zero assigned no finite exact type. |
| Layer 2 nilpotence endpoint | H𝔽_p; zero ring | Every finite K(i)-smash of H𝔽_p=0; H𝔽_p⊗H𝔽_p≠0; unit of zero ring=0 | Missing-∞ false criterion excluded. |
| Layer 2 thick classification | Sphere, Moore, zero | thick sphere=C₀; thick Moore=C₁; thick zero={0}; Hℚ⊗S/p=0≠Hℚ⊗S_(p) | Type-one generator cannot generate sphere. |
| Layer 2 periodic powers | p on S/p; v versus v²; sign | p on K(1)_*(S/p)=0; powers (2,1) both degree 2d; (−1)²=1 | Noninvertible map rejected; power convention retained. |
| §3.1 finite unstable representative | Stable Moore v₁ power | Degree d class represented at some k by Σ^(d+k)S/p→Σ^kS/p; odd-prime d=2p−2, while sphere-only input has no Moore carrier | Supplier repointed to G3.7; prime-two power qualified. |
| §3.1 periodic groups/shift/functoriality | Point; Hℤ; v versus v² | π_jMap(V,*)=0; [Σ^(k+rd)V,Hℤ]=0 for large r; even subsequence has same colimit; shift k↦k+d drops one initial stage | Colimit, grading and functorial maps retained. |
| §3.1 relative height zero | id on BS₃; BS₃×K(ℤ/q,2)→BS₃ | Higher groups on BS₃=0; π₁=S₃; fiber π₂[1/p]=0 for q=p and ℤ/q for q≠p | No nonabelian π₁ tensor asserted. |
| §3.2 cover and infinite-loop comparisons | Hℤ; a shifted connective cover | Stable and Ω∞ colimits both eventually 0; a bounded tail fiber contributes periodic colimit 0 | Positive degree is essential. |
| §3.2 orthogonality and detection | T(n), Hℚ, H𝔽_p; V itself | K(i)⊗T(n)=0 for i≠n including ∞; K(n)⊗T(n)≠0; identity class on V survives; T(n)⊗Hℤ=0 | Telescope class not identified with K(n) on all spectra. |
| §3.2 completion | S→S_p^∧ | Bottom π₀ map ℤ[1/p]→ℚ_p is not onto; positive-height completion fiber has S/p-smash 0 | Height-zero exclusion retained; redundant scope Check deleted. |
| §3.3 E₁ telescope model | W=End(U∨U), U nonzero type n | e₁₂e₂₁=e₁₁ and e₂₁e₁₂=e₂₂; K(n)⊗L_n^fW≠0; other Morava smashes=0 | Commutative localization rejected; smashing E₁ model used. |
| §3.3 unital magma | Rational algebra with a²=b, ab=1, ba=b²=0 | (a²)a=0, a(a²)=1; both units act as id; T(n)⊗HA=K(n)⊗HA=0 | Associativity not introduced as a hidden hypothesis. |
| §3.3 acyclicity iff | R=0,K(n),H𝔽_q with q≠p | For 0 both smashes 0; for K(n) both nonzero; at height 0 H𝔽_q[1/p]=H𝔽_q≠0 but Hℚ⊗H𝔽_q=0 | Both directions tested; bottom counterexample preserved. |
| §4.1 tower/unit conventions | n=0; X=S/q,0 | L₀^fS=Hℚ; L₀^(p,f)S=S[1/p]; two outputs on S/q=0 and S/q; both on 0=0 | No transition below 0 silently inferred. |
| §4.2 finite kernels/smashing | n=0; S/p,S/q | S/p maps to 0 in both towers; S/q maps to S/q in p-finite tower and 0 in rational-bottom tower | Different integral kernels retained. |
| §4.3 comparison | S_(p); S/q | Bottom outputs Hℚ=Hℚ versus S/q≠0 | Restricted equivalence and unrestricted failure both computed. |
| §4.4 fracture | (E,F)=(0,S),(S,0) | Four vertices (X,X,0,0) and (X,0,X,0); pullback X in each case | Preservation hypothesis kept in theorem; scope-only Check deleted. |
| §4.5 bottom comparison | X=S/q,0 | T(1)⊗S/q=0; L₁^(p,f)S/q=S/q[1/p]=S/q; outputs on 0 both 0 | No p-locality restriction added. |
| Layer 4 common examples | Hℚ,H𝔽_p | Both finite towers give Hℚ on Hℚ and 0 on H𝔽_p | Examples agree with kernels. |
| §5.1 finite functor and powers | Point; finite Postnikov space; v/v²; Ω∞T(n) | Values 0,0; direct systems agree via r=0,2,4,…; periodic groups of Ω∞T(n) nonzero | Existing values separated into individual Checks. |
| §5.2 finite-source characterization | X=0,T(n),Σ⁻¹Hℚ | Φ_nΩ∞0=0; Φ_nΩ∞T(n)=L_T(n)T(n)≠0; Ω∞Σ⁻¹Hℚ=* while T(0)⊗Σ⁻¹Hℚ≠0 | Locality/compatibility retained; no height-zero stand-in. |
| §5.3 detection versus preservation | Hℤ→0; Σ⁻¹Hℚ→0 | Positive-height source smash 0 but Σ∞ℤ has a sphere retract; negative rational map becomes 0→0 after Ω∞ although original rational fiber≠0 | Arbitrary preservation and nonconnective bottom detection rejected. |
| Layer 5 discrete-space example | X=S⁰ | [Σ^jV,S⁰]_* =0 for j≥1; Φ_nS⁰=0 while L_T(n)Σ∞S⁰=L_T(n)S≠0 | Φ_n distinguished from localized suspension. |
| §6.1 spectral-sequence indexing | Reflection mapping torus | Differential on ℤ is 1−(−1)=2; kernel 0, cokernel ℤ/2; H₂=0,H₁=ℤ⊕ℤ/2 versus constant-transport ℤ,ℤ² | Sign and monodromy retained. |
| §6.1 periodic/infinite base | E=KU, base ℂP∞; point base | E²_(s,t)=ℤ for even s,t and 0 otherwise; d_r would need both r and r−1 even, so all 0; point gives E_*(F_+) | Supplied homological convergence used without bounded E. |
| §6.2 fiberwise comparison | id; ∅→*; two-point fiber | Augmentations id_E, 0→E, fold E⊕E→E; respective fibers 0,Σ⁻¹E,E | Unreduced augmentation and empty case distinguished. |
| §6.3 nullification definition/idempotence | V; K(ℚ,2); their wedge | N_VV=*; reduced rational cohomology of V=0, so N_VK(ℚ,2)=K(ℚ,2); wedge output K(ℚ,2) | Identity and constant functors fail different tests. |
| Weak-ring supplier criterion, infinity | R=H𝔽_p | Finite Morava support empty; K(∞)⊗R≠0; H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p≠0 | Infinity retained in exact gap. |
| Weak-ring supplier criterion, finite support | R=Q_i,i≤n; R=Hℚ,n=0 | Q_i support={i}; F(n+1)⊗Q_i=0 and Q_i⊗Σ∞K(C_p,n+1)=0; Hℚ⊗F(1)=H̃_*(BC_p;ℚ)=0 | Requested criterion has correct examples; higher norm input explicitly requested. |
| §6.3 sharp bound | n=1; point; K(ℤ/p,n) | n+1=2; reduced suspension of point=0; K(n)-homology of K(ℤ/p,n)≠0, its connectivity n<n+1 | Off-by-one lower bound excluded. |
| §6.3 arbitrary endpoints | id on BS₃; BS₃×K(ℤ/q,2)→BS₃ | Fibers *=0 or K(ℤ/q,2); π₂[1/p]=0 for q=p, ℤ/q otherwise; latter reduced H₂[1/p]=ℤ/q | Relative bottom test and nonabelian endpoints retained. |
| §6.4 suspension-loop preservation | id; Hℤ→0 | Identity fiber=0; Hℤ fiber has π₀=ℤ and is not (n+1)-connective; Σ∞Ω∞Hℤ has nonzero T(n)-homology | Sharp-bound dependency updated, counterexample retained. |
| §7.1 realization | h=1,2,3; additive formal law | Rings ℤ_p, W(𝔽_(p²))[[u₁]], two deformation parameters at h=3; additive law has [p]=0 and h=∞ | Finite heights all retained; degree +2 supplier generator inverted. |
| §7.2 stabilizer/coherence | ±1 at odd p; residue degrees 2,3 | π₀ fixed under −1, u↦−u, square=id; Galois groups have orders 2,3 | Coefficient-only action rejected. |
| §8.1 geometric-height ideal | Multiplicative law; additive characteristic-p law; zero ring | (p,v₁)=(1); additive ideal=0≠(1); zero-ring ideal=0=(1) | Uniform bound and zero-ring case retained. |
| §8.1 action/retract locality | M=R; M=0; zero action on nonzero M | Unit-action composites id_R, id_0=0, and 0≠id_M respectively | Homotopy identity states precisely the needed action; coherent modules only with E₁ refinement. |
| §8.2 restricted telescope comparison | L_(n−1)S; K(n); KU_(p) | First two localized outputs 0=0 and K(n)=K(n); π₀KU_(p)=ℤ_(p) versus completion ℤ_p | Restricted domain preserved. |
| §8.3 height-one equality | Miller Moore telescope, odd p; corrected bo route at 2 | Miller periodic groups=𝔽_p[φ,φ⁻¹]⊗E(δφ), not 0; corrected prime-two bound is 6s>t+14, replacing t+12 | Primary locators and correction recorded; no claim that the original erroneous bound is usable. |
| §8.3 BHLS negative-degree input | p=2,n=2,k=0 | ψ fixes π₀=ℤ₂; H¹(ℤ;ℤ₂)=coker(ψ−1)=ℤ₂, so π_−1 of fixed points=ℤ₂ | Connective trace alone fails; exact comparison gap added. |
| BHLS Lichtenbaum–Quillen condition | A=0; proposed zero BP model | THH(0)=0 and V⊗THH(0)=0 in every degree for every finite V, so boundedness alone holds; T(h+1)⊗TC(0)=0 and π₀0=0≠ℤ_p | Explicit boundedness quantifiers added to gap; BP coefficients and nonzero detector exclude zero model. |
| §8.3 BHLS nonvanishing/obstruction | T(2)⊗TC(BP⟨1⟩); hypothetical zero detector | Required detector≠0; thick(0)={0}, so a zero detector yields no nonzero coassembly obstruction | Specific BP input requested; external ownership remains unresolved. |
| §8.3 separation range | n=1; BHLS X at n≥2 | Acyclic classes equal at 1; L_T(n)X=X while X→L_K(n)X is not an equivalence at n≥2 | Higher theorem retained with explicit prerequisites, not supplied from carriers alone. |
| §8.4 BP support/inversion | n=0,1 | BP⟨0⟩=Hℤ_(p), positive-height smashes 0; rational degree −(2p−2) is 0 in BP⟨1⟩ and ℚ in E(1) | Rational finite-local equivalence not inferred. |
| Layer 8 Ravenel/smashing examples | BP[p⁻¹]; Hℚ; X=S/p | π_(2p−2)BP[p⁻¹]=ℚ versus 0 in Hℚ, despite equal acyclics; Hℚ⊗S/p=0=L₀S/p | Class equality distinguished from spectrum equality. |
| §9.1 localized norm | G=1; rational C₂; H𝔽₂ | Norm=id,2,0 on degree-zero coefficients; cofiber 0,0,nonzero respectively | Raw/local distinction preserved. |
| §9.2 transfer criterion | Rational C₂,C₃,S₃ | Degrees 2,3,6 and sections 1/2,1/3,1/6; integral equation ord(G)·a=1 has no solution when ord(G)>1 | Transfer distinguished from basepoint-section augmentation. |
| §9.3 telescopic Tate | KU_p^∧, trivial C_p; induced object for C₂,S₃ | Raw π₀=ℚ_p(ζ_p)≠0 but L_T(1) output 0; induced orbits=fixed points=L_T(n)S, norm=id | No raw vanishing inferred for arbitrary local inputs. |
| §9.4 finite-local blueshift | KU_p^∧ at n=1; X=0 | KU Tate rational and L₀^f-local; zero Tate=0 | Further height drop permitted. |
| §9.5 Euler inversion | p=2,3 | (1+z)²−1 divided by z=2+z, z=−2, field ℚ₂; at 3: z²+3z+3, field ℚ₃(ζ₃), z²=−3ζ₃ | Both fields nonzero, positive finite-height localizations zero. |
| Layer 9 integral Tate | Trivial C₂ on Hℤ | π_nTate=ℤ/2 for even n,0 for odd n; both p-inversion and positive-height telescopes kill these H𝔽₂ shifts | Nonzero Tate does not contradict local-input theorem. |
| §10.1 absolute Dₚ unit | H𝔽_p; zero θ; K(r) | P(0)=0,P(1)=1; zero θ gives P(1)=0≠1; K(r−1)⊗K(r)=0 but K(r)⊗K(r)≠0 | Zero extended multiplication and mere ring structure excluded. |
| §10.1 relative Dₚ versus absolute unit | R=0; R=E,p=2, θ scaled by 1+z | On zero algebra P=0 and 1=0; scaled θ restricts to same product at z=0 but sends 1 to 1+z≠1 | No extra absolute unit square smuggled into relative definition. |
| §10.1 relative quotient operation | p=2,h=2,k=1 | [2](z) mod 2=u₁z²+_F u₂z⁴+_F z⁸; division by z⁴ only modulo (2,u₁), leading coefficient u₂; h=1 gives empty 1≤k<h range | Denominator/reduction and Bockstein ranges retained. |
| §10.2 upward acyclicity | H𝔽_p; K(h),h≥1 | K(0)⊗H𝔽_p=K(1)⊗H𝔽_p=0 while H𝔽_p≠0; K(h−1)⊗K(h)=0≠K(h)⊗K(h) | Dₚ hypothesis not replaced by E₁. |
| §10.3 height definition/threshold | 0,H𝔽_p,Hℚ,H𝔽_q, q≠p | Heights −1,−1,0,0; bottom smashes 0,0,Hℚ,H𝔽_q and next smashes all 0 | Infimum and all-spectra bottom convention agree. |
| §10.3 height monotonicity examples | ℤ_(p)→𝔽_p; Hℤ_(p),KU_p^∧ | Heights 0→−1; Hℤ_(p) bottom Hℚ≠0,next=0; KU height-1 smash≠0,height-2 smash=0 | Direction of inequality retained. |
| §10.4 Tate converse | Hℚ; KU_p^∧; H𝔽_p | Rational Tate=0 and all positive smashes 0; KU Tate has T(1)-smash 0 but KU T(1)-smash≠0, T(2)-smash=0; H𝔽_p Tate all finite Morava smashes 0 | Conclusion starts at i+1. |
| §10.4 intermediate homotopy E-algebra | 0; E₁ at i=0; E_(i+1) | Zero pair=0,0; height-one Tate coefficient ℚ_p(ζ_p) faithfully flat/nonzero over ℚ_p; both K(i)-smashes nonzero for E_(i+1) | No negative-index parameter used at i=0. |
| §11.1 real coefficients/inversion | α,β under complexification; rational degree −8 | (2b²)²=4b⁴; wrong α²=β would force 4=1; π_−8ko⊗ℚ=0 versus π_−8KO⊗ℚ=ℚ | Positive-height inversion retained, bottom counterexample preserved. |
| Layer 11 coefficient examples | ko,KO,ku in degrees 0,1,2,3,8 | ko: ℤ,ℤ/2,ℤ/2,0; KO degree 8=ℤ; ku degree 1=0 | Real versus complex coefficients distinguished. |
| §12.1 affineness/projection | Affine chart; V=0,S,S∨ΣS | Both sides 0,Γ(O),Γ(O)∨ΣΓ(O); chart Γ(O⊗V)=A⊗V | Quasicoherence remains a hypothesis. |
| §12.2 modular chromatic comparisons | n≥3; Δ inversion at height 2; connective cover at height 0 | T(n)⊗Tmf=T(n)⊗tmf=0; T(2)-local discriminant cofiber=0; negative rational connective-cover groups=0 versus nonzero periodic groups | Scope-only Checks removed; actual values retained. |
| §12.3 Galois definition | B=A×A with swap; B=0,A=Hℤ; trivial S₃ torsor | B⊗_AB=A⁴=∏_(C₂)B; B^hC₂=A; zero base change kills Hℤ≠0; S₃ gives 6·6=36 factors on both tensor/product sides | Faithfulness not inferred from descent equations alone. |
| §12.3 all levels | N=1,2,3,5 | Group orders 1,6,48,480; at 2, −1 fixes a 2-torsion basis; N=3 base inverts 3, not 2 | Small-level stacks retained. |
| §12.3 action direction | Two unipotent GL₂(𝔽₃) matrices g,h; diag(−1,1) | ((P,Q)g)h=(2P+Q,P+Q); reverse order=(P+Q,P+2Q); Weil pairing ζ↦ζ⁻¹ under determinant −1 | Right bases/left section action and determinant components retained. |
| §12.4 supersingular group | p=2,3 | Geometric order×Galois factor=24·2=48 and 12·2=24; omitting Galois halves both | Marked chart comparison and extended groups retained. |
| Layer 12 sheaf/global grading | Nodal and supersingular fibers; descent degree (s,2r) | Heights 1,2; contribution degree=2r−s, odd for odd s; π_−1tmf=0 | Even sheaf coefficients not mistaken for even global groups. |
| Layer 12 discriminant examples | Δ²⁴; Δ⁸ at 2; Δ³ at 3 | Degrees 576,192,72; 24 divisible by 8 and 3 | Actual surviving uniform class retained. |
| §13.1 units | H𝔽₂,H𝔽₃ | Unit components 1,2 versus additive components 2,3 | Zero/nonunit components excluded. |
| §13.1 Thom colimit/API | Trivial line on point/two points; coefficient base change R→R′ | Thom objects R,R⊕R; tensor base change gives R′,R′⊕R′ | Zero/constant replacement fails two-point test. |
| §13.2 completed Hopkins–Mahowald input | p=2,3; completed versus uncompleted S³ | Units 1−p=−1,−2; completed π₃ map ℤ_p→ℤ_p=id so kernel/cokernel 0; uncompleted cokernel ℤ_p/ℤ in π₂ | Cover and p-complete Thom conventions retained. |
| §13.2 Thom outputs | Mod-p and integral restrictions | π₀=𝔽_p and ℤ_p; at 2 values 𝔽₂ versus ℤ₂ | Integral restriction not identified with original mod-p Thom ring. |
| §13.3 y and z definitions | m=0; (p,m)=(2,1),(3,1),(3,2) | p⁰−1=0, y(0)=S_p^∧; indices 1,2,8; π₀y(1)=𝔽_p, π₀z_p(1)=ℤ_p | All-prime integral definition added, no z_p(0) asserted. |
| §13.3 inner fiber/transition/colimit | J₁S²→K(ℤ,2); integral/mod-p endpoint | π₂ map ℤ→ℤ=id so fiber π₂=0; limiting π₀ map ℤ_p→𝔽_p is reduction mod p | Cover index 3 and compatible Thom maps retained. |
| §13.4 acyclicity range | m=1,2 at p=2,3 | y-range at m=1={0}, p-inversion=0; integral positive range ∅ then {1}; π₀z_p(m)⊗ℚ=ℚ_p≠0 | Prime-two restriction removed; height zero still excluded. |
| §13.4 vanishing-line denominators | (p,m)=(2,1),(3,1),(3,2) | 2p^m−2=2,4,16; at p=3,i=1,m=2, v_i slope 1/4>1/16; v₀ degree=0 not used as a divisor | Positive-height integral comodule/convergence proof explicitly included. |
| §13.5 James acyclicity | W=*; S²; K(ℤ/p,1), E=Hℚ | Positive smash powers of *=0; S² powers give degrees 2,4,6,…; tensor algebra on reduced rational homology 0 has reduced part 0 | Reduced wedge starts at 1; spurious r=0 would contribute E. |
| Layer 13 disconnected James boundary | W=S⁰ | π₀J∞S⁰=ℕ versus π₀ΩS¹=ℤ | Connectedness cannot be dropped. |
| Signature inventory | Entire Suggested.lean | Declarations=0; section variables=0; instances=0; imports=1 | No shadow assumptions, admitted data or weakened headline. |

## Maintainer consequences

The request in F03 cannot be completed by changing these files. GeneralAlgebraicKTheoryPartII KII.5’s purity proof uses this roadmap’s finite blueshift and Tate-height converse; KII.6 likewise consumes its height interfaces. Making it supply §8.3’s purity/BP prerequisites therefore leaves a roadmap-level cycle, despite the acyclic fine-grained route in which the foundational chromatic results precede purity and BHLS follows it. The maintainer must choose the ownership split, including the proposed ChromaticHomotopyTheory Part II, or authorize moving prerequisite ownership and changing the consumer. Neither another roadmap nor the immutable non-gap design was edited. The two BHLS gaps record exactly what is missing and do not certify existing supply.

The additional gap:weak-ring-finite-postnikov asks BordismFormalGroups F6.5 for a genuine higher finite-space theorem and its constructions. It is not present in that supplier’s text; §6.3 now makes this dependency explicit instead of treating a literature citation as a supplied theorem.

No exported Lean name changed: Suggested.lean still declares none. The prose integral-family notation is now z_p(m); prime-two consumers recover their object as z₂(m). Higher-height BHLS scope was not silently removed, narrowed to good primes or claimed closed. The next independent review must distinguish the applied package repairs from the outstanding ownership decision.
