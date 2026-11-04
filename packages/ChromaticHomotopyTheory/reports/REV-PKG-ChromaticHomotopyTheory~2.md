<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/986#issuecomment-6392889954 -->
Review (codex) of 5bbacd4

Verdict: needs_changes

1. **F01** (P2) Height-zero periodicity is used outside its defined domain

   **Location:** `packages/ChromaticHomotopyTheory/README.md:567`: “If f:X→Y is an (n+1)-connective map and a v_i-periodic equivalence for every 0≤i≤n”. Compare line 261: “for spectra and simple spaces”.

   **Claim:** The map theorem covers arbitrary spaces, but its height-zero hypothesis was defined only for simple spaces. Connectivity of the fibers does not make either endpoint simple.

   **Witness:** Take n=1 and f=id on BS₃. Every fiber is contractible, but π₁(BS₃)=S₃ is nonabelian; the prescribed abelian-group expression π₁(BS₃)[1/p] is unavailable. All positive-degree fiber groups are zero.

   **Exact repair:** Keep arbitrary endpoints. For these maps explicitly define the relative height-zero condition as: for every basepoint x and every k≥2, π_k(f,x)⊗ℤ[1/p] is an isomorphism. State that the connectivity assumption already supplies the component and π₁ isomorphisms. Equivalently require π_k(fib_y f)⊗ℤ[1/p]=0 for every y and k≥2; prove equivalence using the fiber exact sequence and flatness. Keep the positive-height hypotheses for 1≤i≤n. Update the corresponding route and terminology in §6.4.

   **Repair test:** id on BS₃ now has 0→0 in every degree k≥2 and is admitted. For n=1, BS₃×K(ℤ/q,2)→BS₃ has a 2-connective fiber: its π₂ after p-inversion is 0 if q=p and ℤ/q if q≠p. Thus the repaired hypothesis admits the former and excludes the latter without imposing abelian π₁ on the base.

2. **F02** (P2) Ring acyclicity is restricted below the cited generality

   **Location:** `packages/ChromaticHomotopyTheory/README.md:305`: “For n≥1 and any associative unital ring spectrum R”.

   **Claim:** §3.3 requires associative spectral algebra structure although the cited result needs only a homotopy unit and multiplication. This loses part of the general library explicitly supported by its source.

   **Witness:** lmmt line 317, Remark 2.4, p.8, explicitly removes the algebra-in-spectra assumption and gives the result for a unital magma in the homotopy category.

   **Exact repair:** State the equivalence for a spectrum R with maps S→R and R⊗R→R satisfying the two unit identities in the homotopy category. Name the domains and unit diagrams. Retain associative rings as an application. Use the E₁ structure on the chosen telescope model and the unital multiplication on its tensor with R; the nilpotence-of-the-unit step does not require associativity of R. Update scope and the corresponding missing-headline description in `Suggested.lean`.

   **Repair test:** On the rational vector space with basis 1,a,b, make 1 a two-sided unit and set a²=b, ab=1, ba=b²=0. Its Eilenberg–Mac Lane spectrum has a unital multiplication but (a²)a=0 whereas a(a²)=1. For n≥1 both T(n)- and K(n)-smashes are zero. The repaired statement accepts this input; the old associative signature excludes it. R=0 still gives 0=0; R=K(n) gives two nonzero detectors.

3. **F03** (P2) The power-operation lane omits the source's Dₚ generality

   **Location:** `packages/ChromaticHomotopyTheory/README.md:873`, 901 and 945: “a K(h+1)-local E∞ E-algebra R”; “For an E∞ ring spectrum R”; “For an E∞ ring R with trivial C_p-action”.

   **Claim:** The operation, upward-acyclicity and Tate-converse lane requires a coherent E∞ structure throughout. The cited source proves these results with substantially less multiplicative data; no general Dₚ target is registered.

   **Witness:** hahn lines 22–36 define Dₚ and state Theorem 1.3 for it. Lines 187–202 give the relative operation theorem; lines 432–443 give the Dₚ Tate converse and homotopy-E-algebra intermediate result.

   **Exact repair:** Define Dₚ with the homotopy commutative associative multiplication, unit, cyclic extended-power factorization and unit compatibility of hahn Definition 1.2; define its relative E-version using Definition 3.1. State §§10.1–10.2 and the Hahn form of §10.4 at those hypotheses. Keep the E∞ versions and §10.3's E∞-ring application as consequences. At i=0 retain the stated implication from S[1/p]-acyclicity to rational acyclicity. Add the general missing carriers to the Lean docstring; do not encode them as free predicates.

   **Repair test:** Forget the coherent E∞ data of H𝔽_p, retaining only its Dₚ data: K(0)⊗H𝔽_p=K(1)⊗H𝔽_p=0, P(0)=0 and P(1)=1. The new signature uses exactly the retained data. A bare K(h) multiplication still fails the proposed upward implication: K(h−1)⊗K(h)=0 and K(h)⊗K(h)≠0, so the Dₚ factorization cannot be omitted. For rational R with trivial C_p-action the Tate object and every positive-height smash are zero.

4. **F04** (P2) The Galois theorem is reduced to the downstream level-three instance

   **Location:** `packages/ChromaticHomotopyTheory/README.md:1037`: “prove that TMF[1/3]→TMF(3) is a faithful GL₂(𝔽₃)-Galois extension”.

   **Claim:** The only elliptic Galois theorem uses level three, although the cited theorem is uniform in the level and the supplier already owns general level sheaves. This is a route-specific restriction under the review contract.

   **Witness:** mm line 1757 fixes any positive integer N; mm line 1801, Theorem 7.6, p.38, gives TMF[1/N]→TMF(N) with group GL₂(ℤ/Nℤ). EllipticCohomology E6 supplies Γ(N) sheaves.

   **Exact repair:** State this full-level theorem for every integer N≥1, using the smooth level stack over ℤ[1/N], its ordered-basis action, and the same three Galois/faithfulness comparisons. Consume EllipticCohomology E6 and ModularCurves §§3D, 4C and 5B with their stack/representability ranges. Preserve N=1,2 as stack cases; do not impose the scheme condition N≥3 on the theorem. Keep N=3 and its 2-localization as Checks and as the input to §12.4. Update scope, suppliers and the Lean docstring accordingly.

   **Repair test:** N=1 gives the identity and the trivial group; N=2 gives GL₂(𝔽₂)≅S₃ of order 6 and a level stack with residual order-two automorphisms; N=3 gives 48; N=5 gives (25−1)(25−5)=480. The group calculations and base inversion remain compatible with the existing tensor-product map. The N=2 stack warning is confirmed by mm lines 1776–1785.

5. **F05** (P3) The nullification definition has no own API and discriminating Checks

   **Location:** `packages/ChromaticHomotopyTheory/README.md:569`: “Construct nullification N_V”. The Checks at lines 573–577 concern the final connectivity theorem, not N_V.

   **Claim:** A new reflective construction is introduced inside the proof route without the required API list and three Checks distinguishing its object and unit.

   **Witness:** Replacing N_V by the identity or the constant-point functor leaves every displayed §6.3 Check unchanged: none evaluates N_V, its unit, or its mapping-space universal property.

   **Exact repair:** Give this construction a prose target before its use, with its mapping-space universal property, natural unit, functoriality, null output, unit equivalence on V-null inputs, idempotence and the precise range of the periodic comparison. Add three evaluations for the allowed finite, rationally acyclic V: N_VV≃*, N_VK(ℚ,2)≃K(ℚ,2), and N_V(V∨K(ℚ,2))≃K(ℚ,2). Cite bhm §3's nullification setup and state the pointed/unpointed mapping convention.

   **Repair test:** These outputs are respectively *, K(ℚ,2), K(ℚ,2). The identity functor gives V in the first case; the constant-point functor loses π₂=ℚ in the second and third. V is noncontractible, while its reduced rational cohomology is zero, so K(ℚ,2) is V-null.

6. **F06** (P3) The repaired BHM locator was not propagated to the manifest

   **Location:** `packages/ChromaticHomotopyTheory/sources.toml:172`: “§3, Theorem 3.1, p.5, and Lemmas 3.2–3.3, p.6.” The matching References item is `packages/ChromaticHomotopyTheory/README.md:1286`.

   **Claim:** §6.1 now correctly cites Lemma 3.5, but the work's recorded locator and reference summary still omit it.

   **Witness:** `packages/ChromaticHomotopyTheory/README.md:523` cites Lemma 3.5, p.6; bhm line 258 is that lemma. The manifest stops at Lemma 3.3.

   **Exact repair:** Add “Lemma 3.5, p.6” to the existing `bhm` locator and References item. Keep its key, retrieval fields and other locators unchanged. This is the remaining part of prior F06, not a request for a new source.

   **Repair test:** The locator then resolves directly to bhm lines 258–265, the fiber-sequence homology comparison used in §6.1, rather than the nullification lemma at line 233.

Six findings: four P2 and two P3. The earlier mathematical and supplier repairs are present; F06 has a small remaining manifest omission. The blocking findings below concern the domain of a hypothesis and the contract requiring the general statements supported by the sources. They do not claim that the narrower ring or level-three theorems are false.

## Verified sound

The review read all 40 numbered targets, all 14 layers, their API bullets, Checks, examples, conventions and Needs lines. It checked all 15 newly seeded targets, inspected 97 distinct explicit source-line anchors, resolved the named suppliers again, and compared all 15 prior findings with the repaired passages. The computations below cover the mathematical assertions and their interfaces, including the changed passages; they are not a claim to have formalized the proofs. For unchanged material, the earlier computed rows were used and expanded; no earlier “sound” summary without values was used as mathematical evidence.

### Prior findings, checked first

| Earlier finding | Repaired passage or data, at package README unless stated | Disposition and verification |
| --- | --- | --- |
| F01 | `design/plan.json` now has exactly three records, each with supplier, section and needs | Repaired. The twenty obsolete ownerless records are absent; the surviving slugs match lines 57, 69, 83 verbatim. |
| F02 | line 83: “construct a natural equivalence Σ∞ΩΣW≃⋁_(r≥1)Σ∞W^∧r compatible with the word-length filtration” | Repaired. HomotopySpheres §3B supplies the filtration and connected James equivalence, while the splitting is an explicit named contract. |
| F03 | line 99: “Consume §2.3’s Segal comparison”; “§4.9’s connective and nonconnective K-theory” | Repaired. RefinedTraceMethods at head 9dd2691 has the cited sections; no duplicate supplier gaps remain. |
| F04 | line 523: “converges strongly … for every CW base and every spectrum E” | Repaired. StableHomotopyKTheory §7.24 has exactly this exhaustive, bounded-below filtration result; KU/ℂP∞ has zero differentials. |
| F05(a) | line 53: “G4.5’s real, complex and quaternionic orientation data” | Repaired. Main G4.5, line 1246, is the orientation item. |
| F05(b) | line 95: “§7F’s Serre–Tate equivalence” | Repaired. ModularCurves main §7F, line 1551, states it; §7E supplies formal heights. |
| F05(c) | line 87: “The real Bott theorem itself is HomotopySpheres §4B” | Repaired. T7 supplies coefficients and consumes that Bott theorem. |
| F05(d) | line 849: “RefinedTraceMethods §6.8’s formula … gives the same conclusion directly” | Repaired. The retired KU gap is covered both by that formula and by F3/F6.5's Adams splitting and completion route. |
| F05(e) | line 741: “the third term vanishes by induction, so v_n acts invertibly” | Repaired. The cofiber induction proves T(i)-acyclicity without importing an unstated BP-truncation class identity. |
| F06 | e.g. line 1005: “mm line 1729”; line 1071: “lmmt line 925”; line 523: “bhm line 258” | Partly repaired. Replaced explicit line anchors resolve; the BHM manifest/reference summary was not updated (R06). |
| F07 | line 13: “including ⟨K(n)⟩≤⟨T(n)⟩ and the choice-independence of ⟨T(n)⟩” | Repaired. These facts are imported from F6.3, not listed as new §3.2 targets. |
| F08 | line 895: “u₁z²+_F u₂z⁴+_F z⁸”; “leading coefficient is u₂” | Repaired. Modulo (2,u₁), division by z⁴ is valid; before reduction the u₁z² term prevents it. |
| F09 | line 131: “L_(zero spectrum)S=0” | Repaired. L₀S elsewhere remains Hℚ; no remaining collision of those two functors was found. |
| F10 | line 1223: “E any spectrum” | Repaired. The argument works for arbitrary E and retains the telescopic instance as an application. |
| F11 | line 553: “supplied by BordismFormalGroups F6.5” | Repaired. The H.6/E3-request/G2 process labels are absent. |
| F12 | line 30: “that generator is u⁻¹ here” | Repaired. The new §7.1 Check computes both degrees and the Adams sign. |
| F13 | `Suggested.lean:17`: “the pinned Eilenberg–Steenrod homology pretheory has no excision axiom and no weak-equivalence invariance” | Repaired. Opened both pinned Eilenberg–Steenrod files; the separate algebraic homotopy-fiber file is about chain complexes. |
| F14 | line 385 names cmnn's convention; Examples now include discrete spaces, Adams operations and Hℤ Tate groups | Repaired in the listed respects. Capitals, Unicode coefficients and TMF spelling are corrected, and the listed duplicate example paragraphs were replaced. |
| F15 | `sources.toml` hs, greenlees-sadofsky and hesselholt-ku: `licence_class = "institutional"` | Repaired. These are institutional-hosted copies of other authors' papers; the author's own Ravenel paper retains author-page. |

No prior repair was marked “not actionable in this package”; none of these findings re-raises a settled finding on that basis. The later review found additional scope defects R01–R04, not a failed restoration of the earlier formulas.

### Seeded source sample

Page numbers here refer to the cited version's printed/manuscript numbering, not blindly to extraction page markers. In particular hs has an extra front page, while goerss uses printed pages 238–239.

| Target | Text opened at locator | Hypotheses and support |
| --- | --- | --- |
| 3.1 Periodic homotopy groups | lmmt lines 239–295, Definition 2.1/Lemma 2.2, pp.6–7 | Positive-degree self-map, abelian cofinal tail, fixed source and stable/Ω∞ comparison agree. The simple-space restriction at height zero is real and causes R01 later. |
| 4.2 Finite localization kernels | lmmt lines 323–338, Lemma 2.6, p.8 | All-spectra p-finite kernel is Ind of finite p-local type greater than n; these positive-type finite spectra are p-primary torsion. Compactness yields smashing. |
| 4.5 Bottom finite-local comparison | lmmt lines 344–358, Lemma 2.8 and consequence (ii), pp.8–9 | T(1)-acyclic X needs no p-locality; p-inversion, not global rationalization, is the lower corner. |
| 5.2 Bousfield–Kuhn | kuhn-guide lines 105–121, 644–758, Theorem 1.1, Theorem 5.2, Lemmas 5.4–5.5, Definition 5.6, pp.3–4,15–18 | n≥1; locality is included in the characterization; rigidified finite-source compatibility is retained. |
| 5.3 Detection | lmmt lines 361–380, Proposition 2.9/Remark 2.10, p.9 | Retract argument has the stated direction; height zero is restricted to connective spectra. |
| 6.1 Generalized Serre | lmmt lines 398–402, p.10; bhm lines 258–265, Lemma 3.5, p.6 | These use the homological fiber comparison. Full filtration/convergence is supplied by StableHomotopyKTheory §§7.21–7.24; monodromy is retained. R06 concerns the manifest only. |
| 7.1 Morava E | goerss lines 670–695, Theorem 3.6, pp.238–239; behrens lines 1018–1043 and 1252 onward, pp.28,34 | Perfect field and finite height; marked realization and coherent action. Polynomial coordinates are chosen, not canonical. h≥3 extends the supplier's h=1,2. |
| 8.2 Local telescope comparison | lmmt lines 904–923, Corollary 4.21 proof, p.22; behrens lines 1048–1076, p.29 | The source explicitly compares T(n) and K(n) on L_n-local spectra, not globally. |
| 9.3 Tate vanishing | cm-tate lines 118–131, Theorem 2.6/Corollary 2.7, pp.3–4; kuhn-tate lines 151–162, pp.4–5 | Coherent finite G-actions, localized Tate output and the raw-telescope variant are distinct. |
| 9.4 Raw blueshift | cmnn lines 97–100, p.3; lmmt lines 625–649, Remark 3.9, pp.15–16; kuhn-tate lines 154–155 | The raw Tate output is lower finite-local. The proof route includes the additional raw-telescope and module argument, not just localized vanishing. |
| 10.3 Ring height | lmmt lines 149–153, p.4; hahn lines 19–39, p.1 | Threshold starts at −1 and uses T(0)=S[1/p]. The E∞ result is true; R03 asks for the source-supported general power-operation lane. |
| 12.3 Galois extension | mm lines 1757–1803, Definitions 7.3–7.4/Theorem 7.6, pp.37–38 | Level three is a valid instance; the theorem is actually uniform in positive N (R04). |
| 12.4 Supersingular comparison | behrens lines 1148–1167, Proposition 1.6.12, p.31; lmmt lines 925–931, p.22 | At 2: geometric order 24 times residue degree 2. At 3: 12 times 2. The marked level-three chart and finite descent match. |
| 13.3 James-filtered Thom rings | lmmt lines 834–850, pp.20–21; akq lines 205–248, Construction 2.1/Lemma 2.2, pp.5–6 | J_(p^m−1), m=0 separately; integral family's degree-two Postnikov fiber. Package explicitly completes colimits and constructs the completed comparison. |
| 13.5 James acyclicity | lmmt lines 823–830, Corollary 4.14 proof, p.20 | The proof step works for arbitrary E; connected W and wedge beginning at 1 are essential. The missing supplier splitting is declared, not silently assumed. |

No author-flagged unread locator remains beyond the settled uncertified abs entry. All 18 certified source files were readable. The source service was not needed: no missing work was fetched and no manifest entry was changed.

### Computed adversarial pass

Each row records values or maps, including negative controls. “Pass” means the listed instances and the stated law agree; it does not replace the source or proof-route audit. Multiple distinct assertions in a subsection are separated below. All ordinary, spectral and completed constructions are interpreted in the universes and derived categories fixed by the README. Algebraic field/DVR substitutions are made only where the object admits them; unrelated noncompact Lie groups and inseparable extensions are not inputs to finite-group Tate or perfect-field Morava realization.

| Statement | Instances tried | Computed values on the two sides / distinguishing output | Result | Change |
| --- | --- | --- | --- | --- |
| Universe bounds | point; countable wedge in the chosen universe | sizes 1 and ℵ₀; enlargement leaves the same indexed summands | Pass | — |
| Homological suspension | X=S, k=1 | π₁ΣS=ℤ=π₀S | Pass | — |
| Koszul sign | two degree-one classes; degree 0 and 1 | (−1)¹=−1; (−1)⁰=1 | Pass | — |
| Cofiber/boundary | id_S; 0→S | cofib(id)=0; cofib(0→S)=S; boundary degree k→k−1 | Pass | — |
| Finite p-local convention | S_(p), S/p, countable wedge | π₀=ℤ_(p), 𝔽_p; identity on the wedge uses infinitely many components | Pass | — |
| P-local duality | S/p; S_(p) with X=Hℤ | D(S/p)=Σ⁻¹S/p; integral mapping π₀=0 versus tensor π₀=ℤ_(p) | Pass; target locality needed | — |
| Zero/S/rational reflectors | X=S | L_zero S=0; L_S S=S; L_Hℚ S=Hℚ | Pass | F09 repaired |
| Tower-bottom convention | p=2, X=S/3; X=S_(2) | p-inversion outputs S/3 versus rational 0; on S_(2) both give Hℚ | Pass | — |
| Connected covers | K(A,2), r=2,3; two-point space | cover 2 has π₂=A; cover 3=*; cover 1 of {a,b}={a} | Pass | — |
| Map connectivity | identity; K(A,2)→* | fiber *=∞-connective; second fiber has π₂=A, is 2-connective | Pass | R01 fixes height-zero domain |
| Multiplicative coordinate | p=2,3 | [2]=2z+z²; [3]=3z+3z²+z³; reductions z²,z³ | Pass | — |
| Geometric height | additive/multiplicative over 𝔽₂ | p-series 0 versus z²; heights ∞ versus 1 | Pass | — |
| Field requirement | coefficient ring 𝔽₂[ε]/ε² | ε²=0 but ε≠0; residue point is 𝔽₂, not the thickened ring | Pass; no field-height definition on thickening | — |
| Morava grading | i=1, p=2,3 | degree u_i u^(1−p^i)=2,4; using degree +2 gives −2,−4 | Pass | F12 repaired |
| Elliptic grading | Δ, Δ²⁴ | weights 12,288; degrees 24,576 | Pass | — |
| Coherent-action convention | ψ⁻¹ at height one | π₀ fixed; u↦−u; square u↦u | Pass; π₀ action alone insufficient | — |
| Completed tensor | unit S_p^∧; zero | completed unit⊗unit=unit; completed 0=0 | Pass | — |
| BP versus MU | p=3, degree 2 | π₂BP=0 versus π₂MU_(3)=ℤ_(3) | Pass | — |
| Morava coefficients | K(0); K(1) at 2; H𝔽₂ | degrees 0,2: (ℚ,0), (𝔽₂,𝔽₂), (𝔽₂,0) | Pass | — |
| Cofibers | BP⟨1⟩/v₁; k(1)/v₁; Hℤ_(p)/p | π₀=ℤ_(p), 𝔽_p, 𝔽_p | Pass | — |
| Type and smash | S_(p)∧S/p; 0∧S/p | max(0,1)=1; max(∞,1)=∞ | Pass | — |
| Nilpotence endpoint | unit of H𝔽_p; unit of 0 | finite-height images all 0 but 1^r=1≠0; zero-ring unit 0¹=0 | Pass | — |
| Thick classes | sphere, Moore, zero | generated classes C₀,C₁,{0}; rational homology Hℚ,0,0 | Pass | — |
| Self-map qualification | p on S/p | induced map on K(1)_*(S/p) is 0, not an automorphism | Pass | — |
| Powers/centrality | v and v²; odd-degree sign | v²=(v²)¹, degree 2d; (−1)²=1 | Pass | — |
| 3.1 colimit definition | *, Hℤ, height-zero S/q | 0; H^(−k−rd)(V)=0 eventually; (ℤ/q)[1/p]=ℤ/q for q≠p | Pass | R01 for later use |
| 3.1 functoriality | identity and zero maps | colimit(id)=id; colimit(0)=0 | Pass | — |
| 3.1 degree periodicity | shift k→k+d | sequence terms a₀,a₁,… versus a₁,a₂,…; same colimit | Pass | — |
| 3.1 stable/Ω∞ | bounded spectrum; T(n) | both periodic groups 0; both nonzero on T(n) | Pass | — |
| 3.2(a,b) covers | Hℤ; Σ⁻¹Hℚ; integer covers | all positive-height colimits 0 before and after covering | Pass | — |
| 3.2(c) orthogonality | K(0), K(n), H𝔽_p | T(n)-smashes 0, nonzero, 0 | Pass | — |
| 3.2(d,e) S/p and completion | Hℚ; S→S_p^∧ | positive-height smash 0→0; height-zero ℤ[1/p]→ℚ_p not onto | Pass | — |
| 3.2(f) iff | Hℤ; source V | group/telescope pairs (0,0), (nonzero,nonzero); id maps to v^r≠0 | Pass both directions | — |
| 3.3 iff | 0, K(n), nonassociative rational example R02 | detector pairs (0,0), (≠0,≠0), (0,0); associator 0≠1 | True but restricted | R02 |
| 3.3 height-zero exclusion | H𝔽_q, q≠p | T(0)-smash H𝔽_q≠0; K(0)-smash 0 | Pass | — |
| Telescope examples | zero, identity, p at q≠p | Tel(0)=0; Tel(id)=V; Tel(p)⊗S/q=S/q | Pass | — |
| 4.1 functors/units | n=0, X=S; zero X | units ℤ→ℚ and ℤ→ℤ[1/p]; 0→0 | Pass | — |
| 4.1 transitions | n=1→0; n=0 boundary | lower output has π₀ ℤ[1/p]; no automatic index −1 | Pass | — |
| 4.1 locality/idempotent algebra | zero and rational input | L0=0; L(Hℚ)=Hℚ and Hℚ⊗Hℚ=Hℚ | Pass | — |
| 4.2 all-spectra kernel | n=0, S/p, S/q | p-kernel contains S/p; L_pfinite S/q=S/q≠0 | Pass | — |
| 4.2 p-local kernel | n=0, S_(p), S/p | Hℚ≠0 versus 0; rational-acyclic part is generated by S/p | Pass | — |
| 4.2 compact preservation | sphere at n=0 | localized sphere is the local unit; maps out detect π₀ and preserve filtered colimits | Pass | — |
| 4.3 comparison | S_(p), S/q | (Hℚ,Hℚ) versus (S/q,0) | Pass; p-locality necessary | — |
| 4.4 general fracture | (E,F)=(0,S),(S,0) | squares (X,X,0,0), (X,0,X,0); pullback X in both | Pass | — |
| 4.4 sufficient assumptions | E=0 or S; m=0 | exact zero/identity preserve F-acyclics; S[1/p]⊗S/q=S/q | Pass | — |
| 4.5 bottom comparison | 0, S/q, q≠p | both outputs 0, respectively S/q | Pass | — |
| Layer 4 new example | Hℚ and H𝔽_p at any finite n | both towers give Hℚ and 0 respectively | Pass | — |
| 5.1 Φ_v definition | point, finite Postnikov space | every eventual mapping group 0; Φ_v=0 | Pass | — |
| 5.1 powers/maps | v²; id_V; zero finite map | even subsequence same colimit; induced maps id and 0, contravariantly | Pass | — |
| 5.1 Ω∞ formula | T(n) and 0 | stable and unstable periodic groups nonzero and 0 respectively | Pass | — |
| 5.2 characterization | 0, T(n); finite-source limit | 0; L_T(n)T(n)≠0; mapping from finite V commutes with the same inverse limit | Pass | — |
| 5.2 locality in uniqueness | candidate Φ_n(−)⊕Hℚ | for positive-type finite V, F(V,Hℚ)=0; at the point the candidate is Hℚ but its T(n)-localization is 0 | Pass; locality retained | — |
| 5.2 height-zero control | X=Σ⁻¹Hℚ | Ω∞X=* but X[1/p]=Σ⁻¹Hℚ≠0 | Pass | — |
| 5.3 retract/direction | Hℤ→0; Σ⁻¹Hℚ→0 | T(n)Hℤ=0 but Σ∞ℤ has a sphere retract; negative rational image 0→0 hides ≠0→0 | Pass | — |
| Layer 5 new example | discrete S⁰ | Φ_n(S⁰)=0; L_T(n)Σ∞S⁰=L_T(n)S≠0 | Pass | — |
| 6.1 filtration graded pieces | point base; empty X | one column E_t(F_+); all columns 0 for empty X | Pass | — |
| 6.1 differential direction | r=2, (s,t)=(2,0) | target (0,1), total degree 1 versus source 2 | Pass | — |
| 6.1 monodromy | reflected circle mapping torus | 1−(−1)=2; ker=0, coker=ℤ/2; H₂=0,H₁=ℤ⊕ℤ/2 | Pass | — |
| 6.1 negative transport control | identity circle monodromy | differential 0; H₂=ℤ,H₁=ℤ² instead | Pass | — |
| 6.1 convergence | KU, identity fibration of ℂP∞ | E²=ℤ on nonnegative even s/even t; all d_r=0; finite-stage filtration exhausts KU_* | Pass | F04 repaired |
| 6.2 augmentation | id; ∅→*; two-point fiber | E→E; 0→E; fold E⊕E→E with fiber E | Pass | — |
| 6.2 arbitrary base | constant point fibers over infinite CW | colim constant E = E⊗Σ∞_+Y on both sides | Pass | — |
| 6.3 sharp bound | n=1; K(ℤ/p,n) | required connectivity 2; excluded example has π_n=ℤ/p and nonzero K(n)-homology | Pass for space theorem | — |
| 6.3 arbitrary-space map | id_BS₃; product with K(ℤ/q,2) | π₁=S₃ not abelian; fiber p-inverted π₂=0 or ℤ/q | Domain gap | R01 |
| 6.3 nullification | V, K(ℚ,2), their wedge | required outputs *, K(ℚ,2), K(ℚ,2); old Checks never evaluate them | Missing Checks | R05 |
| 6.3 Eilenberg–Mac Lane step | finite p-group A abelian, r>i; r=i | reduced T(i) homology 0 in stated range; K(i)K(ℤ/p,i)≠0 at boundary | Pass | — |
| 6.4 preservation | id; Hℤ→0 | comparison cofiber 0; excluded fiber has π₀=ℤ and wrong connectivity | Pass | Terminology per R01 |
| Layer 6 Postnikov example | S¹; K(A,2) | τ≤0S¹=*; τ≤2K(A,2)=K(A,2); cover 3=* | Pass | — |
| 7.1 realization | h=1,2,3; additive law | parameter counts 0,1,2; W(𝔽_p)=ℤ_p; additive height ∞ excluded | Pass | — |
| 7.1 marking/coordinates | u and u⁻¹ | degrees −2 and +2; same Laurent ring, different named generator | Pass | — |
| 7.1 coefficient map | p=2,3 and i=1 | degrees 2(p−1)=2,4; inverse sign choice gives −2,−4 | Pass | — |
| 7.2 action/coherence | h=1, a=−1; h=2,3 residue action | u↦−u↦u; residue automorphism orders 2,3 | Pass | — |
| Layer 7 Adams example | p=3, a=2 | π₂ multiplier 2; π₋₂ multiplier 1/2; a=−1 multiplier −1 in both | Pass | — |
| 8.1 height ideal | multiplicative, additive over nonzero field, zero ring | (p,v₁)=(1); (0)≠(1); 0=(1) in zero ring | Pass | — |
| 8.1 all modules | R=0; R=KU_(p), free module R∨ΣR | only zero module; localization preserves both summands, outputs R∨ΣR | Pass | — |
| 8.2 first assertion | X=L_(n−1)S | T(n)- and K(n)-smashes 0 | Pass | — |
| 8.2 comparison | X=K(n); KU_(p), n=1 | both localizations K(n); KU coefficient changes ℤ_(p)→ℤ_p | Pass | — |
| 8.3 witness | n=1; n≥2,k=0; arbitrary k≥0 | class difference 0 at 1; witness satisfies L_T(n)X=X and L_K(n)X≠X at ≥2 | Pass; indices match BHLS | — |
| 8.4 induction | n=0; n=1,i=2 | T(i)Hℤ_(p)=0; invertible v₁ gives T(2)BP⟨1⟩=T(2)E(1)=0 | Pass | F05(e) repaired |
| 8.4 inversion | n=1, degree −(2p−2) | rational groups 0 versus ℚ; T(1)-localized cofiber 0 | Pass | — |
| Ravenel example | BP[p⁻¹], degree 2p−2 | ℚ versus 0 for Hℚ; Bousfield acyclic classes nevertheless equal | Pass | — |
| Hopkins–Ravenel example | n=0, S/p | Hℚ⊗S/p=0=L₀(S/p) | Pass | — |
| 9.1 localized cofiber | G=1; X=Hℚ,C₂ | norm id, cofiber 0; norm ×2 with inverse 1/2 | Pass | — |
| 9.1 nonunit norm | H𝔽₂,C₂ | norm on degree 0 is 0; Tate π₀=𝔽₂≠0 | Pass | — |
| 9.2 equivalence/transfer | rational C₂,C₃,S₃ | transfer 2,3,6; sections 1/2,1/3,1/6 | Pass | — |
| 9.2 augmentation exclusion | integral C₂ | transfer π₀=×2 has no integral section; augmentation has basepoint section | Pass | — |
| 9.2 shifted section | Ω^(∞+1) transfer | π₀ after extra loop is π₁, so the obstructing integral π₀ degree map is not the test | Pass; shift retained | — |
| 9.3 localized/raw | KU_p^∧,C_p; G=1 | raw π₀=ℚ_p(ζ_p)≠0 versus localized 0; trivial-group cofiber 0 | Pass | — |
| 9.3 arbitrary action control | Ind_1^G L_T(n)S, G=C₂,S₃ | orbits=fixed points=L_T(n)S; norm id, raw Tate 0 | Pass | — |
| 9.4 blueshift | n=1,KU_p^∧; X=0 | output has π₀ field with p invertible; zero output remains 0 | Pass; not exact height loss | — |
| 9.4 lower input | X=S[1/p],C_p | averaging 1/p exists; Tate 0 | Pass | — |
| 9.5 Euler inversion | p=2,3 | 2+z=0 gives ℚ₂; z²+3z+3=0 gives ℚ₃(ζ₃) | Pass | — |
| 9.5 ramification | p=3, z=ζ₃−1 | z²=−3ζ₃; z invertible implies 3 invertible | Pass | — |
| 9.5 locality route | p=2,3 | KU_(2)=E(1); KU_(3)=E(1)∨Σ²E(1); completion π₀=ℤ_p | Pass | F05(d) repaired |
| 9.5 completion negative control | X=H𝔽_p | derived complete X=X≠0; L_K(1)X=0 | Pass; completeness alone insufficient | — |
| Layer 9 new example | Hℤ,C₂; degrees −2,−1,0,1,2 | Tate groups ℤ/2,0,ℤ/2,0,ℤ/2; finite-local output 0 | Pass | — |
| 10.1 operation laws | x=0,1; x=y=1 | P0=0,P1=1; additive discrepancy is transfer; quotient discrepancy 0 | Pass; restricted signature | R03 |
| 10.1 divisibility | p=2,h=2,k=1 | before quotient u₁z² term; after quotient g₂ leading u₂, exponent 4 | Pass | F08 repaired |
| 10.1 small height/index | h=1; h=0 | 1≤k<h empty; no u_−1 or division by a degree-zero v₀ | Pass; separate argument stated | — |
| 10.1 module quotient | regular E; arbitrary module R | regular π₀ quotient matches coefficients; arbitrary quotient may have higher Tor, not asserted equal | Pass | R03 for multiplicative scope |
| 10.2 upward implication | H𝔽_p; K(h) | (K(0),K(1)) smashes (0,0); for bare K(h), consecutive smashes (0,≠0) | Pass in E∞ case | R03 |
| 10.2 bottom implication | H𝔽_q,q≠p | Hℚ-smash 0 while S[1/p]-smash H𝔽_q≠0 | Pass; converse not used | — |
| 10.3 threshold | 0,H𝔽_p,Hℚ,H𝔽_q | −1,−1,0,0 respectively | Pass | — |
| 10.3 iff/∞ | vanishing set all heights; empty set | inf=−1; inf=∞; no off-by-one at T(0) | Pass both directions | — |
| 10.3 monotonicity | Hℤ_(p)→H𝔽_p; R→0 | heights 0→−1; ht(R)→−1, both nonincreasing | Pass | — |
| 10.4 Tate converse | Hℚ; KU_p^∧ at i=1 | raw Tate 0 for Hℚ; T(1) of KU Tate 0 but T(1)KU≠0,T(2)KU=0 | Pass; cannot start at j=i | R03 |
| Layer 10 new example | Hℤ_(p); KU_p^∧ | T(0) nonzero/T(1) zero: height 0; T(1) nonzero/T(2) zero: height 1 | Pass | — |
| 11.1 Bott inversion | ko→KO, rational degree −8 | 0→ℚ fails at height 0; positive periodic cofiber 0 | Pass | — |
| 11.1 algebra base change | A=ko, A=0 | ko⊗_koKO=KO; 0⊗_koKO=0 | Pass | — |
| 11.1 coefficient normalization | complexify α²=4β | (2b²)²=4b⁴; wrong α²=β would give 4b⁴=b⁴ | Pass | — |
| Layer 11 coefficients | degrees 0,1,2,3,8 | ℤ,ℤ/2,ℤ/2,0,ℤ; β↦b⁴ of degree 8 | Pass | — |
| 12.1 affineness | chart Spec A; modules 0,A,A∨ΣA | Γ gives 0,A,A∨ΣA; extension of scalars gives same | Pass | — |
| 12.1 projection formula | V=0,S,S∨ΣS | 0; ΓM; ΓM∨ΣΓM on both sides | Pass | — |
| 12.2 chromatic bounds | n≥3; n=2 | T(n)tmf=T(n)Tmf=0; discriminant inversion has T(2)-cofiber 0 | Pass | — |
| 12.2 connective control | degree −21 rationally | tmf group 0; compactified Tmf has nonzero negative rational class | Pass | — |
| 12.3 Galois definition | trivial C₂ and S₃ torsors | B⊗_AB=A⁴,A³⁶; product_G B=A⁴,A³⁶; fixed points A | Pass | — |
| 12.3 faithfulness | B=0,A=Hℤ; A=0 | Hℤ↦0, not conservative; zero base has only zero module | Pass | — |
| 12.3 group/level | N=1,2,3,5 | group orders 1,6,48,480; only N=3 is a package theorem | Generality missing | R04 |
| 12.4 supersingular | p=2,3 | 24·2=48; 12·2=24; discarding Galois gives wrong half-order | Pass | — |
| Layer 12 elliptic law | ordinary, supersingular, additive | heights 1,2,∞ respectively | Pass | — |
| Layer 12 sheaf grading | s=1,r=1; nodal chart | global degree 2r−s=1; nodal formal height 1 | Pass | — |
| Layer 12 discriminant | exponents 8,3,24 | spectral degrees 192,72,576; 24 divisible by 8 and 3 | Pass | — |
| 13.1 units | H𝔽₂,H𝔽₃; zero ring | unit components 1,2,1; additive components 2,3,1 | Pass | — |
| 13.1 Thom colimit | point; trivial line on two points | R; R⊕R; zero coefficient gives 0 | Pass | — |
| 13.1 universal property/base change | point and R→R′ | maps out are maps R→M; R′⊗_R R=R′ | Pass | — |
| 13.2 unit/Thom rings | p=2,3 | units −1,−2; output π₀=𝔽₂,𝔽₃; integral cover gives ℤ₂,ℤ₃ | Pass | — |
| 13.2 completed cover | completed and uncompleted S³ | ker/coker(ℤ_p→ℤ_p)=0,0; uncompleted coker=ℤ_p/ℤ in π₂ | Pass | — |
| 13.3 finite stages | m=0; p=2,m=1 | p⁰−1=0, y(0)=S_p^∧; J₁S²=S², π₀y(1)=𝔽₂ | Pass | — |
| 13.3 integral stage | z(1); cover of S² | π₀z(1)=ℤ₂; π₂ cover=ker(id_ℤ)=0 | Pass | — |
| 13.3 maps/colimit | degree 0 of z→y and limits | ℤ₂→𝔽₂ is reduction; colimit π₀ values ℤ₂ and 𝔽₂ | Pass | — |
| 13.4 acyclicity ranges | m=1,2 | y low ranges {0},{0,1}; z ranges ∅,{1}; rational z π₀=ℚ₂≠0 | Pass | — |
| 13.4 slope denominators | (p,m)=(2,1),(3,1) | 2p^m−2=2,4; v₀ degree 0 treated separately | Pass | — |
| 13.5 arbitrary E | E=Hℚ,W=K(ℤ/p,1) | reduced rational homology 0; tensor algebra's reduced part 0 | Pass | F10 repaired |
| 13.5 wedge indexing | W=*,S² | 0; wedge S²∨S⁴∨S⁶…; wrong r=0 adds S | Pass | — |
| 13.5 type instance | m>n, n=1 | T(1) smash 0 and S[1/p] smash 0 for finite p-primary type >1 | Pass | — |
| Layer 13 James example | J₀S²,J₁S²,J₂S²; S⁰ | reduced cells ∅,{2},{2,4}; π₀J∞S⁰=ℕ versus π₀ΩS¹=ℤ | Pass | — |
| Gap finite p-duality | S_(p),S/p,countable wedge | duals S_(p),Σ⁻¹S/p; finite subwedges colimit to whole wedge | Precise declared contract | — |
| Gap spectral ringed sites | affine chart, module 0 and unit | Γ0=0; ΓO=A; affine tensor unit A | Precise declared contract | — |
| Gap stable James splitting | W=*,S¹,S² | reduced wedges 0, ⋁_(r≥1)S^r, ⋁_(r≥1)S^(2r) | Precise declared contract | — |

The six Worked examples were recomputed in the corresponding rows: distinct bottoms, additive/multiplicative series, ramified KU field, real Bott factor 4, sign-monodromy complex, and completed Postnikov fiber. No denominator used in these computations is zero; the m=0, height-zero and empty-range cases are treated separately.

### Pinned library and ownership audit

The pins in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations were opened at those pins, rather than inferred from a recent API or from the citation resolver.

| Declaration and pinned file | Actual carrier or law inspected | Consequence for this package |
| --- | --- | --- |
| `FormalGroup`, `Mathlib/RingTheory/FormalGroup/Basic.lean:56` | Two-variable series, constant coefficient zero, both linear coefficients one, substitution associativity | Algebraic law already owned; no spectrum, orientation or realization structure. |
| `FormalGroup.IsComm`, same file:74 | Separate substitution-symmetry class | A bare `FormalGroup` does not include commutativity. |
| `FormalGroup.Point`, same file:126 | `{f : MvPowerSeries σ R // PowerSeries.HasSubst f}` | Actual substitution-qualified series, not arbitrary points of a topological ring. No topological separation or completeness assumptions are bundled. |
| `FormalGroup.𝔾ₐ`, `.𝔾ₘ`, same file:145,161 | Addition, respectively addition plus the cross term | At 2/3 the multiplicative p-series is z²/z³; no copied point-calculation targets occur in the Lean file. |
| `FormalGroup.map`, same file:184 | Coefficient ring-homomorphism transport | Already cited, not redefined. |
| `CategoryTheory.ObjectProperty.isLocal`, `Mathlib/CategoryTheory/Localization/Bousfield.lean:55` | For every Z with P Z, precomposition on ordinary Hom sets is bijective | It is a morphism predicate, not the construction of a spectral reflector or derived mapping spaces. |
| `WeierstrassCurve.formalGroup`, `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` | Reindexing the existing chord-addition series into Fin 2 | Uses a commutative coefficient ring; the declaration does not require a separate nonsingularity binder. The package does not claim such a binder. |
| `TopPair.HomologyPretheory`, `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36` | Relative and absolute functors, their comparison, boundary and shape condition | Not a spectral homology theory; no excision or weak-equivalence axiom in this structure. |
| `TopPair.HomologyPretheory.IsHomotopyInvariant`, same file:144 | Homotopic pair maps induce equal maps | Does not by itself say all weak equivalences are inverted. |
| `HasPairSequence`, `IsAdditive`, `HasDimensionAxiom`, `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65,85,94` | Pair exactness, arbitrary discrete coproduct preservation, positive-degree point vanishing | These additions do not supply the missing spectrum or generalized Serre construction. |
| `Topology.Homotopy.LoopSpace`, `GenLoop`, `Mathlib/Topology/Homotopy/HomotopyGroup.lean:86,97` | Based paths; maps from an indexed cube taking its boundary to the basepoint | Ordinary loop carriers exist; they are not the derived suspension-spectrum/Ω∞ adjunction. |
| `HomologicalComplex.homotopyFiber`, `Mathlib/Algebra/Homology/HomotopyFiber.lean:55` | Homotopy fiber of a chain-complex morphism | Does not fill the missing homotopy-fiber carrier for spaces. |

Object searches across both pinned source trees covered spectra/prespectra, symmetric spectra, suspension spectra, ring spectra, Morava theories, telescopes, Bousfield–Kuhn, Tate and Thom spectra, and homotopy fibers. The only homotopy-fiber hits in this search were algebraic chain-complex constructions. None supplies the spectral carriers needed by the headline theorems.

Ownership searches used `roadmaps list`, `roadmaps grep` and `roadmaps show`, including the 352 indexed open roadmap heads and main, with objects rather than proposed declaration names: finite localization, Bousfield–Kuhn, Kahn–Priddy, James splitting, Morava realization, Thom rings, spectral affineness, Dₚ multiplication, spectral Galois extensions and generalized Serre theory. Existing revised roadmaps were consumed from main, not from their progress branches. The index's source of truth for main is b41e47b.

The general finite and chromatic machinery remains with GeneralizedCohomology and BordismFormalGroups. EllipticCohomology owns height-one/two realization and the elliptic/level sheaves; extending the realization to higher height and proving spectral affineness/Galois comparisons are distinct targets here. GeneralizedCohomology G5.3 constructs vector-bundle Thom diagrams, whereas §13.1 constructs Thom colimits for arbitrary spectral R-line systems. StableHomotopyKTheory §7.27 owns the constant-coefficient AHSS, while §6.1's fibration-dependent generalized fiber local system is different. No second owner of the Bousfield–Kuhn, Hahn or completed James-filtered Thom targets was found in the readable material. The package declares no Lean names, so no fully qualified declaration collision is possible.

The board index was read before checking its packages. At the recorded heads, five package READMEs were readable: AnalyticNumberTheory (310e834), ArithmeticStatistics (357e723), AutomorphicCongruences (b047dd3), KatoEulerSystems (5fb6ef4), and LogicAndDefinabilityInNumberTheory (3062436). Searches there produced arithmetic spectral-sequence, automorphic-spectrum or valuation-spectrum uses, not chromatic spectral objects. Fifteen other indexed paths returned HTTP 404; those are listed under Not verifiable, not claimed absent.

### Supplier citations and order

Every Needs line was read. The exact contracts resolve as follows; paths below are relative to the cited roadmap repository, and open-head references name their recorded heads without using a pull-request number as a mathematical supplier.

| Supplier and version used | Resolved location and consumed statements |
| --- | --- |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md`: G2 at 211 (spectral models, monoidal and module structures); G3 at 663 with items 4/7/8/9 (colimits, finite-source continuity, covers and completion; item 7 at 773, item 8 at 785, item 9 at 878); G4.5 at 1246; G5.1 at 1512; G5.4 at 1559 with Bott models at 1652 and coefficients at 1677. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md`: F1 at 46, F2 at 145, F3 at 284 with BP/cofibers and Adams splitting at 293–307, F5 at 466, F6.1 at 555, F6.2 at 586, F6.3 at 760 with telescope classes/finite kernels at 1171–1194, F6.4 at 1248, F6.5 at 1526. Generic straightening/Kan comparison at 2094–2117; transfers, norm transitivity and the unit criterion at 2399–2432; K(n)-completion and Landweber-locality at 2530–2557. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`: E0.4 at 211 and E0.5 at 241 (stable and space-indexed categorical interfaces, explicitly supplied in part by F6.5); E5:abstract.4 at 1512 (stable monoidal enhancement), E5:presentability.1 at 1597 (compact objects and Ind). These do not already construct QCoh over an étale sheaf of spectral rings. |
| StableHomotopyKTheory, head 00bfbf7 | `TauCetiRoadmap/StableHomotopyKTheory/README.md`: §3.18 at 1157 (Postnikov sections/tower); §3.21 at 1192 (twisted obstruction data); §§7.21–7.27, especially §7.24 at 2543 and §7.26 at 2563. Bounded-below increasing filtration and complete-tower convergence are not interchanged. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md`: Stage 4 at 499 (CW/cofibration framework), Stage 5 at 849 with monodromy Serre at 918, Stage 8 at 1602 with Hurewicz at 1684 and fiber/relative exact sequences. |
| HomotopySpheres, head fb7c47e; second head 0b90c9b checked for splitting | `TauCetiRoadmap/HomotopySpheres/README.md`: §§3A–3B, with 3B at 388 in the first head; word quotients, connected James equivalence, and a regression mention of the stable splitting. The latter is not an owned construction theorem. §4B supplies real Bott. |
| TopologicalKTheory, head 7575afa | `TauCetiRoadmap/TopologicalKTheory/README.md`: T7 at 1149, Clifford square at 1243–1246, coefficient presentation at 1288. The Bott proof is correctly attributed to HomotopySpheres. |
| EllipticCohomology, head f0df48d | `TauCetiRoadmap/EllipticCohomology/README.md`: E1 (compactification and Hodge line); E2 items 2–3 at 217–239 (h=1,2 realization and obstruction machinery), item 5 at 284 (marked supersingular descent); E3 (sheaf/global spectra); E4 (surviving discriminant and comparisons); E6 at 815, general level sheaves at 832–842. |
| ModularCurves, main | `TauCetiRoadmap/ModularCurves/README.md`: §4B at 1077, §4C at 1100 with full level-three torsor at 1112; §7E at 1510; §7F at 1551. General level-N input for R04 is in §5B at 1313, with the right row-vector action and determinant law at 1322–1334. |
| RefinedTraceMethods, head 9dd2691 | `TauCetiRoadmap/RefinedTraceMethods/README.md`: §2.3 at 554 (Segal comparison at 566), §2.6 at 639 (E₁ THH and Frobenius), §2.9 at 845 (TC), §2.10 at 871 with categorical THH at 885, §4.9 at 1817 with nonconnective K at 1845, §4.11 at 1940 (trace), §6.8 at 2821 (completed KU-localization). These are the repaired section numbers. |

No consumed item was found to have drifted to an unavailable section. The relative height-zero issue R01 is internal. The three gaps in `design/plan.json` and the README have matching slugs, suppliers and needs. They are coherent single interfaces with their necessary compatibilities, precise in their hypotheses and not duplicate targets in the readable supplier sections: p-local duality/compact generation is additional to integral finite duality; spectral QCoh is additional to ordinary derived ringed-site modules; the stable splitting is additional to the James equivalence and its filtration. They remain valid conditional supplier contracts, not blocking findings in themselves.

The prescribed dependency check completed successfully. Its output was:

```text
depcheck: 48 roadmaps, 530 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no cross-roadmap citation or own Lean name nowhere. It reported that it did not check external Lean names; the direct pin inspection above supplies that check.

`merge-order/ORDER.txt` places RefinedTraceMethods at 218 and this package at 222. GeneralAlgebraicKTheoryPartII's design, currently listed at 220, consumes this package in `packages/GeneralAlgebraicKTheoryPartII/design/README.md:52`; its consumer placement must follow this supplier when that design/package is submitted with the movable check. This package imports nothing from that consumer and introduces no reverse edge. This is an order-coordination note on the consumer, not an invented supplier gap here.

### Headline statability, Lean and shape

The README headline groups correspond to the following 25 docstring entries in `packages/ChromaticHomotopyTheory/Suggested.lean`:

| README headline | Missing native carrier at the pins |
| --- | --- |
| Ring-spectrum detector equivalence (§3.3) | Spectra, multiplication, Morava/telescope smash |
| Finite-local reflectors, kernels and smashing (§4.1–§4.3) | Spectral localization and compact stable subcategories |
| Homological fracture (§4.4) | Spectral units and homotopy pullbacks |
| Finite telescopic and Bousfield–Kuhn functors (§5.1–§5.2) | Derived pointed spaces, mapping spectra and telescopes |
| Suspension–loop detection (§5.3) | Spectral suspension/Ω∞ adjunction |
| Generalized Serre filtration (§6.1) | Spectrum-valued fiber local systems and their filtered colimits |
| Fiberwise homology comparison (§6.2) | Spectral homology and space homotopy fibers |
| Sharp connective vanishing and preservation (§6.3–§6.4) | Unstable periodicity, nullification and finite-local tower |
| Marked realization and actions (§7.1–§7.2) | E∞ spectra and their marked realization spaces |
| Geometric-height locality (§8.1) | Oriented spectra and module categories |
| Local telescope comparison (§8.2) | T(n)/K(n) spectral reflectors |
| Telescope separation (§8.3) | Spectral rings, their K-theory and coherent Adams fixed points |
| BP-truncation support (§8.4) | BP spectra, cofibers and inversion |
| Transfer criterion and Tate vanishing (§9.1–§9.3) | Coherent G-spectra, norm and Tate |
| Finite-local raw blueshift (§9.4) | Raw Tate and finite-local functors |
| Completed KU Tate calculation (§9.5) | KU spectrum, completion and Tate tower |
| Hahn's operation/height lane (§10.1–§10.3) | Spectral extended powers and chromatic detectors |
| Tate height converse (§10.4) | Spectral trivial actions and Tate comparison |
| Real Bott consequence (§11.1) | ko-algebras and spectral relative tensor |
| Elliptic affineness (§12.1) | Spectral ringed stacks and QCoh |
| Modular-form chromatic bounds (§12.2) | tmf/Tmf/TMF spectra and localizations |
| Elliptic Galois/supersingular comparisons (§12.3–§12.4) | E∞ algebras, Morava E and coherent fixed points |
| Completed Thom equivalences (§13.1–§13.2) | Spectral units and E₂ Thom algebras |
| James-filtered Thom family (§13.3–§13.4) | Completed E₁ Thom colimits and Morava homology |
| James acyclicity (§13.5) | Reduced suspension spectra and stable splitting |

The newly requested general forms in R02–R04 still require those spectral carriers; they should be named in the docstring, not replaced by algebraic stand-ins. No statable headline was found to be omitted. Algebraic power-series identities, finite group orders and abstract localization predicates are Checks, not substitutes.

The prescribed `lake env lean` invocation on the package's actual `Suggested.lean`, run from the pinned content checkout, exited 0 with no output and no warnings. It has one `import Mathlib`, one module docstring and the correct empty namespace. There are zero declarations, zero admitted theorems and zero definitions: consequently the mechanical declaration-signature inventory and one-tactic probe each have zero cases. No hypothesis can have disappeared from a declaration, and no padding theorem is present. No TauCeti module is imported, so no targeted object build was necessary; no broader Lean command was run.

Main-branch GeneralizedCohomology, BordismFormalGroups and ModularCurves were read for shape before preparing this report. The package has the required opening and ownership/convention/contracts/read-build order, 14 Layers with Examples and Dependencies, Downstream consumers, Worked examples and References. Existing definition blocks carry prose APIs and multiple Checks except the construction identified in R05. There are no executable algorithms, sorry'd data, `set_option`, copied long source passages, own backticked API-name catalogues or unauthorized package edits. `metadata.toml` parses and records `math.AT`; `sources.toml` parses under the declared schema with 19 distinct keys, including the one settled uncertified work. No suspicious instructions were encountered in the reviewed material.

## Not verifiable

- **abs:** settled `uncertified`. Its coefficient/Bott locators were not reopened or requested. The mathematical normalization was independently checked against GeneralizedCohomology G5.4 and TopologicalKTheory T7.
- **thom's OCR unit-group notation:** the extraction around Theorem 5.1 is garbled. The choice 1−p∈ℤ_p^× is independently readable at lmmt lines 834–838. No claim is made to have recovered the unread glyphs.
- **Fifteen board package paths at their supplied heads returned HTTP 404:** ArithmeticLocallySymmetricSpacesPartII (84a41ac), CompletedCohomologyAndLocalGlobalCompatibilityPartII (948c94c), CrystallineCohomologyPartII (84ea77e), EndoscopicTransferAndUnitaryTraceComparisonPartII (80a66cc), HigherHidaAndColemanTheory (da88512), LawrenceVenkateshMethod (9ee7ac3), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38), PELModuliPartII (d4bb48d), PadicHodgeTheoryPartII (6502997), PadicLocalLanglandsForGL2QpPartII (3e0777d), RealSurfacePeriodIndex (875bca4), SchemeAndStackFoundationsPartII (accb0a0), ShimuraVarietiesPartII (57dc0a4), VStackSheavesAndLisseCategoriesPartII (0987ba7), VectorBundlesAndIsocrystalsPartII (b58d862). Ownership against these exact board files remains unverified. This does not mean the packages or corresponding roadmaps exist nowhere.
- **Proof depth:** the review verifies statements, interfaces, sources at the specified locators and explicit computations; it does not independently reconstruct the complete BHLS non-hyperdescent argument or Hopkins–Smith's periodicity induction. Those are proof constructions in the named target/supplier, not currently formalized proofs certified by this empty Lean build.

No new missing source work was identified, so no new request in `needs-references.toml` was required.

## Source issues

- **Misprint** in lmmt at Remark 2.12, p.10: the source says finite-group Eilenberg–Mac Lane spaces vanish for every r>i; it should be finite abelian p-groups in this argument; affects nothing.
- **Gap** in cmnn at Lemma 4.7 and Theorem 4.6 proof, pp.19–20: the source uses the positive-height ideal and Laurent-series field also at i=0; it should separate the zero ideal and rational Witt-vector field case; affects the proof.
- **Misprint** in mm at Example 7.5, p.37: the source lists (0,1) as a 2-torsion point of the Legendre curve; it should list (1,0); affects nothing.

The first issue is witnessed by i=0,r=1,A=ℤ/q with q≠p: reduced H₁ after p-inversion is ℤ/q, not zero (lmmt line 410). The second is at cmnn lines 831–832 and does not refute the theorem; the package explicitly separates i=0. For the third, substituting (0,1) in y²=x(x−1)(x−λ) gives 1=0, while (1,0) gives 0=0 (mm line 1780).

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5bbacd4ec0c4e4372829de8f9b0eb73f8fb9d99e", "job": "REV-PKG-ChromaticHomotopyTheory~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
