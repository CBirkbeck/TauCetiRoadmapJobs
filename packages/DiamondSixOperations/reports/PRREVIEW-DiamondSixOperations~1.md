# Review of DiamondSixOperations (pull request #927 at ac2b810)

**Verdict:** needs changes

## R01 (P1) — The constructible dévissage omits closed strata

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:1167`: “`A` is filtered by sheaves `j_!L`”.

**Claim:** Every constructible sheaf on the spatial diamond in the biduality reduction has a finite filtration by extensions of local systems along quasicompact separated étale maps.

**Witness:** On a connected perfectoid ball, take a proper nonempty rational open U and A = coker(j!𝔽ℓ → 𝔽ℓ). Its support is the nonopen complement. A finite filtration by étale j!L has open support.

More precisely, take U = {∣T∣ ≤ ∣ϖ∣} in the closed unit ball over Spa(C,O_C). A has stalk 0 on U and 𝔽ℓ on its constructible closed complement Z. The ball is connected, so Z is not open. A finite-rank local system has open-and-closed support in its étale source; its extension has open support in X. Supports of successive extensions are unions, so the proposed filtration cannot produce A. The actual supplier, `TauCetiRoadmap/DiamondEtaleCohomology/README.md:1860` (§C7.11), retains a constructible closed Z in each graded piece j!(L∣Z). ECD line 4757 (Proposition 20.8, p. 116) does too. ECD line 6608 reduces the proof to j!L; it does not assert this stronger filtration.

**Repair:** Use C7.11's closed-stratum filtration, then the localization triangles for Z and its open complement in the étale source. Explain that the biduality-equivalence property is stable under finite triangles, which permits the further reduction to open extensions. Make the same correction in the finiteness reduction at line 1175. Retain the general biduality theorem. On this witness the triangle j!𝔽ℓ → 𝔽ℓ → A has stalks 𝔽ℓ → 𝔽ℓ → 0 on U and 0 → 𝔽ℓ → 𝔽ℓ on Z, so the repaired reduction covers precisely the omitted sheaf. Add this as a negative-control Check for the dévissage.

## R02 (P2) — Preserve arbitrary coefficients in the profinite-projection theorem

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:718`: “The statement is made with that hypothesis, which covers its only use”.

**Claim:** Restrict `Rh_* h^* C ≃ C⁰(S,Λ) ⊗Λ C` to prime-to-p torsion coefficients because the selected proof uses the exceptional direct image.

**Witness:** ECD line 6018 states Lemma 23.6 for any ring. For S with two points and C = Λ[0], both sides are Λ²[0], including Λ = ℤ and Λ = 𝔽p, which the roadmap excludes.

**Repair:** Restore the arbitrary-ring statement, independently of the coefficient convention for exceptional operations. Supply a proof using the finite quotients of S, étale continuity, the strictly totally disconnected comparison and exact direct image for the quasicompact quasi-pro-étale projection. These are `DiamondEtaleCohomology` §§C0.18–C0.19, C0.24 and C8.22; identify those inputs on the target's Needs line. Exactness and the unbounded comparison extend the sheaf calculation to complexes; Nöbeling's coefficient extension gives flatness of C⁰(S,Λ). This repairs the proof's scope without discarding the general theorem. The two-point tests remain ℤ² and 𝔽p² on both sides; the empty and one-point tests remain 0 and C. The cited source itself has a proof-scope gap here, recorded below, but that does not authorize narrowing this library target to its next consumer.

## R03 (P3) — Distinguish the two adjunction units in the trace convention

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:679`: “For a finite fibre `I`, the unit is the diagonal”. The unit introduced at line 667 is instead that of `Rf_! ⊣ Rf^!`.

**Claim:** The trace discussion uses one unnamed “unit” for two adjunctions with different domains.

**Witness:** For two points over 𝔽₅, the pullback–pushforward unit sends 1 to (1,1); summation gives 2. The exceptional adjunction unit consists of the inclusions Aᵢ → A₀ ⊕ A₁, whose triangle composites are identities.

**Repair:** Name the diagonal as `η_* : id → Rf_* f^*`, the unit of `f^* ⊣ Rf_*`. Name the other unit `η_! : id → Rf^! Rf_!`, on the source category. Give its fibrewise inclusions separately. Retain the diagonal–trace calculation, now labelled with its correct adjunction: over 𝔽₅ the unnormalised composite is 2 and the normalised composite is 3·2 = 1. This is a convention clarification, not a claim that those numerical calculations are false.

## R04 (P3) — Remove promises of undeclared Lean API names

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:37`: “Lean names in backticks are intended declarations of the mathematical development”; for example the API paragraph at line 123.

**Claim:** Planned API declarations are presented as backticked Lean names although none is declared in Suggested.lean.

**Witness:** `TauCetiRoadmap/DiamondSixOperations/Suggested.lean:29` opens an empty namespace, closed at line 31. It declares neither IsCompactifiable nor any of its advertised constructors, and likewise none of the other proposed APIs.

**Repair:** Keep the mathematical targets and APIs in the README, with prose API bullets and subsection references in Needs lines. Remove undeclared own Lean identifiers from headings and API lists; retain actual supplier identifiers and mathematical notation. Do not add stand-in geometric carriers or API padding to Suggested.lean. Also give its module title the required “: target signatures” suffix. Rechecking the empty namespace then leaves zero own Lean-name promises and zero missing geometric substitutes. The passing scanner does not override this explicit form rule.

## R05 (P3) — Cite the supplied Haar theorem by its real locator

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:22`: `HaarMeasureWithValues.existsUnique_vol_eq_one`.

**Claim:** The supplier exports a theorem with this exact declaration name.

**Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1034` (§SR.1.1, a-valued-haar-measure) states normalized existence and uniqueness, but the asserted suffix occurs in neither that README nor its Suggested.lean at the supplied head.

**Repair:** Cite §SR.1.1's a-valued-haar-measure target and its mathematical normalization, as the supplier contract at line 59 already does. There is no missing mathematical prerequisite to request. For K = C₂ over 𝔽₅, that target gives μ(K) = 1 and μ({e}) = 2⁻¹ = 3, exactly the measure used here.

## Verified sound

The review covered both files in this folder at the specified head, all seven layers, the 15 requested sample entries, their proof routes and Checks, the pinned libraries, the supplier contracts, main-roadmap ownership, board packages and the supplied open-work sources. There was no previous AI review to reconcile. No PR files were changed. The diff outside this folder is empty. No copied source passage, executable algorithm, sorry'd data, set_option, forbidden import or duplicate fully qualified Lean declaration was found.

The worker's targeted gate passed every scanner, dependency check and `lake build TauCetiRoadmap.DiamondSixOperations.Suggested`. Independently, `lake env lean` on Suggested.lean exited 0 without warnings. Its one import is Mathlib; there are no Tau Ceti imports to prebuild. There are **0 declarations and 0 sorry'd theorems**, so the per-declaration elaborated-signature comparison and one-tactic padding probe have empty domains. This is not evidence that the README's mathematics is automatically true.

The independent dependency check returned:

```text
depcheck: 164 roadmaps, 1166 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Every Needs line was read. No undeclared supplier gap was needed for the two blocking repairs: R01 uses an existing supplier in its actual generality, and R02 uses existing arbitrary-coefficient inputs. The normalized Haar name mismatch is R05, rather than an invented mathematical gap.

**Headline coverage.** The README's principal outputs are: S0 compactifiability and its descent; S1 compactification-independent exceptional direct image, dimension bounds and zero-dimensional classification; S2 the small-v-stack construction, hypercover independence and coherent base change/composition/projection formula; S3 exceptional inverse image, Verdier duality and exceptional base change; S4 the criteria, openness, permanence, dualizing complex and smooth exchange; S5 the ball with Λ(1)[2], profinite quotients, analytic smooth maps, Spd ℚp and the geometric-base criterion; S6 biduality, finiteness, coefficient extension, conservativity and the higher-rank counterexamples. All are named by layer and content in the module docstring. Searches by object at the pins found adic spectra and the AdicSpace category, algebraic tilting and general derived categories, but no category of geometric perfectoid spaces with its v-topology, small v-stacks, locally spatial diamonds or their étale derived categories. A few simple native definitions cannot supply those carriers. Thus no absent *statable geometric headline* or substituted headline was found. The finite-module calculations and general adjunction conjugation are ingredients, not replacements for these headlines.

**Source sample.** Locators below refer to the legally fetched ECD arXiv v4 text (14 April 2026), with its printed pagination. The reference is [Étale cohomology of diamonds, v4](https://arxiv.org/abs/1709.07343v4). The two repeated “Composition” labels were checked at S0.2, S1.5 and S2.4. No explicitly unverified locator was flagged in the README.

| Requested target | Text inspected and outcome |
| --- | --- |
| Compactifiability through the canonical compactification, line 135 | ECD line 5260, Proposition 22.3(i), p. 128: separatedness and openness of the canonical map are both retained. |
| Composition, line 170 | ECD line 5264, Proposition 22.3(iv), pp. 128–129: general v-stacks, no representability added. |
| Locally split maps, line 196 | ECD line 5271, Proposition 22.3(vii) and footnote 5, p. 128; Remark 23.14, p. 150. The roadmap defines the local-section condition and keeps it separate from smoothness. |
| Descent along locally split maps, line 209 | ECD line 5271 and the proof through line 5325, pp. 128–129: separatedness, local spatial representability and source splitting remain explicit. |
| Eligible morphisms, line 217 | ECD line 5247, Convention 22.1, p. 127; line 5705, Definition 22.18, p. 137; line 5819, Theorem 23.1, p. 140. Local dimension finiteness is distinguished from a uniform bound. |
| Composition, lines 376 and 553 | ECD line 5472, Proposition 22.9, p. 132, and line 5732, Proposition 22.21, p. 138: order `Rf_! Rg_!` is retained. |
| Base change over locally spatial bases, line 482 | ECD line 5641, Proposition 22.15, p. 136: the roadmap's intermediate construction retains quasiseparatedness; S2.4 subsequently supplies arbitrary small-v-stack base change. |
| Exceptional direct image for small v-stacks, line 518 | ECD line 5656 through line 5711, Lemmas 22.16–22.17 and Definition 22.18, pp. 136–137: enhanced support diagrams and coCartesian sections, not descent of homotopy categories. |
| Base change, line 545 | ECD line 5713, Proposition 22.19 and proof, pp. 137–138: arbitrary base map and eligible exceptional map. |
| Coherence of exchange equivalences, line 565 | ECD line 5713 and the proof of 22.23 through line 5785, pp. 138–139; HTT line 12422 and line 13478. The listed pasting laws are the roadmap's enhanced Kan-extension consequence, not a separately numbered ECD theorem. |
| Identity and composition, line 645 | ECD line 5819, Theorem 23.1, with Proposition 22.21, p. 138: right-adjoint composition reverses the order. The pinned conjugate-isomorphism API has that direction. |
| Exceptional base change, line 653 | ECD line 6297, Proposition 23.16(i), p. 151: g eligible; f arbitrary. No smoothness is silently imposed. |
| Quotients by profinite actions, line 987 | ECD line 6383, Proposition 24.2, p. 153, and line 6457, Proposition 24.3/proof, pp. 155–156: image-relation quotient, qcqs action relation, proper quasi-pro-étale q; stack quotient with stabilizers is excluded. |
| Finite quotient orders are units, line 1005 | ECD line 6407, proof of 24.2, p. 153, plus pinned supernatural-order inequality. The roadmap states the actual ℓ-power-torsion/unit argument and keeps ℓ = p as a negative control. |
| Biduality, line 1165 | ECD line 6585, Theorem 25.1, pp. 158–160: complete algebraically closed C, maximal plus ring, separated smooth X, bounded constructible A; qc only for finiteness. The theorem matches; the stronger filtration asserted in its route does not (R01). |

Seven of the nine cited works were readable legally. Also inspected: HTT line 21924 (Corollary 5.5.2.9, printed p. 466); HA line 5809 (Proposition 1.4.4.1, p. 154); LZ14 line 1107 (§2.2, pp. 23–24, enough-points hypothesis); SGA4 line 6836 (VI, Corollary 5.2, printed p. 260); KW line 206 (§2.1, p. 4, valuation-chain description); Poo line 333 and line 356 (Lemma 4 and Theorem 1, pp. 8–9). HTT/HA came from the author's IAS pages, SGA4 from the institutional Laszlo archive, Poo from Poonen's MIT page, and ECD/LZ14/KW from arXiv, all through the sources service. Neither a source manifest nor the repository was edited.

**Computed adversarial pass.** The tables have 121 computed rows. In the tables, k = 𝔽₅ unless specified, P = Spa(C,O_C), and B is the perfectoid closed unit ball over P. A finite set denotes its disjoint union of geometric points. For predicates, 1 and 0 mean true and false. For sheaves, tuples give stalk values in the displayed point order. “Retain” means the computed instance supports the statement; it is not a proof of all cases. Each separately named target is represented, including the additional unnumbered claims and the three intermediate constructions. The negative controls also test the plausible wrong model. API specializations are recorded with their definition where they express the same operation.

| Statement (README line) | Instances tried | Computed left side | Computed right side / control | Result; change |
| --- | --- | --- | --- | --- |
| Coefficient and shift conventions (29) | k[1]; zero ring | H⁻¹(k[1]) = k, H⁰ = 0 | H⁰(k[0]) = k; over 0 both vanish | Retain sign and nonzero-ring guard. |
| Properness / compactification convention (33) | Two-point valuation chain η → s, open η | Image {η} is not closed; proper = 0 | Compactifiable = 1; compactification = {η,s} | Retain distinction. |
| Compactifiable predicate and constructors (121–123) | id, open η, doubled-origin ball | 1, 1, 0 | Canonical factorizations id/id, open/id; doubled origin separated = 0 | Retain mathematical API; R04 names. |
| Canonical compactification iff (135) | Same three maps | Compactifiable: 1,1,0 | Separated-and-open-canonical-map: 1,1,0 | Both directions survive. |
| Compactifiable base change (152) | η ⊂ {η,s}, pull back to η and s | id_η and ∅ → s | Compactifiable = 1 and 1 | Retain; empty case included. |
| Target v-locality (164) | Two-point finite cover of P, f = id_P | Pullback id has value 1 | Original id has value 1; ∅ → P is not surjective | Retain surjectivity condition. |
| Compactifiable composition (170) | Nested rational discs U ⊂ V ⊂ B | Composite open inclusion, value 1 | Each factor value 1; canonical factorization exists | Retain. |
| Source open locality (176) | Disjoint two-point source; doubled-origin ball | On each chart value 1 | Whole separated finite source 1; doubled origin 0 | Separatedness prevents false gluing. |
| Separated étale compactifiability (182) | Two points → P; empty source | Compactifiable 1,1 | Separated étale 1,1; dim.trg 0,⊥ | Retain. |
| Compactifiable cancellation (188) | U ⊂ V ⊂ B | Compactifiability of composite = 1 | Compactifiability U → V = 1 | Retain separated outer map. |
| Locally split predicate / API (196–198) | id; K × P → P; ∅ → P | Sections id, e ↦ (e,−), none | Locally split 1,1,0 | Retain; group identity supplies section for S₃ as well as C₂. |
| Locally split composition/base change (198) | Fin 2 × Fin 3 × P → P | Section (0,0,−); pullback same formula | Six-point projection locally split = 1 | Retain. |
| Source descent with local splitting (209) | Z = U ⊔ U → U, U ⊂ B | f∘g compactifiable = 1, g split = 1 | f compactifiable = 1 | Retain extra hypothesis; no arbitrary v-cover replacement. |
| Eligible predicate/permanence (217–219) | id; ⊔ₙ Bⁿ → P; [P/C₂] → P | id eligible 1; local dimensions n finite; stack map 0 | Second map global sup n = ∞ but eligible 1; third not representable | Retain local/global and stack boundary. |
| Spatial-eligible predicate (230–232) | B → P; ⊔ₙ Bⁿ → P; ∅ → P | 1,0,1 | qc/global bound: (1,1), (0,∞), (1,⊥) | Retain. |
| Eligible cancellation (243) | U ⊂ V ⊂ B | Composite eligible 1; relative dimensions 0 | U → V eligible 1 | Retain explicit representability/local-dimension hypotheses. |
| Fibre dimension bound (264, clause 1) | P, B, ∅ over P | dim = 0,1,⊥ | dim.trg = 0,1,⊥ | Retain, including bottom value. |
| Compactification dimension (264, clause 2) | Ball, empty; higher-rank base | dim.trg before = 1,⊥,1 | After = 1,⊥,1; boundary over rank-one base has one exterior point | Retain; higher-rank boundary can have several points. |
| Rf! via compactification (283) | id; two-point valuation open j | id sends k to k; j!k stalks (k,0) | Rj*k stalks (k,k); global sections 0 versus k | Construction excludes ordinary pushforward as wrong model. |
| Compactification independence (302) | id_P factorization; rational subdisc inside B | Outputs k and k(−1)[−2] respectively | Same from canonical factorization or a larger proper compactification | Retain support restriction. |
| Proper dim.trg ≤ 0 classification (310) | T = ∅, singleton, Fin 2, circle | X × T fibres have 0,1,2 or circle points | Recovered T exactly ∅,*,Fin 2,S¹ | Retain compact Hausdorff generality; circle need not be spatial. |
| qcqs continuity (323) | Finite quotients of ℤ₂; constant k | colim k^(ℤ/2ⁿ) = locally constant functions | H⁰ of limit = C⁰(ℤ₂,k), dimension ℵ₀; higher constant cohomology 0 | Retain actual inverse system and bounded-below input. |
| Topological étale comparison (329) | T = singleton, interval, circle | H⁰ = k in all three; H¹ = 0,0,k | Topological sheaf cohomology gives the same values | Retain; do not infer all proper dim-zero diamonds are acyclic. |
| Spatial 2d bound (344) | id; ball; zero coefficients | Highest nonzero degrees 0,2; no nonzero degree for 0 | Bounds 0,2; d = 1 for ball | Retain sharp nonzero coefficient test. |
| General 3d bound (356) | id; ball; empty | Top degrees 0,2; empty pushforward 0 | Bounds 0,3; empty d = ⊥ | Retain; bound is not an equality. |
| QC base change (372) | Fin 2 → P and P ⊔ P → P | k² on each base point | Pushforward of pulled-back fibre also k² | Retain. |
| QC composition (376) | Fin 3 × Fin 2 → Fin 2 → P | (k³)² = k⁶ | Direct six-point pushforward k⁶ | Retain functor order. |
| QC étale agreement (380) | Fin 2 → P; open η in rank-two chain | k²; stalks (k,0) | Étale extension k²; (k,0) | Retain. |
| QC coproduct preservation (390) | Two-point projection, countable k family | ⊕ℕ k² | (⊕ℕ k)², same finite-support pairs | Retain; no product substitution. |
| QC projection formula (400) | Fibre two, A = k², B = constant k | k² ⊗ k² = k⁴ | ⊕₂ k² = k⁴ | Retain variables on correct sides. |
| Hypercover existence (428.1) | Empty, P, B | Constant nerves ∅,P,B satisfy matching surjectivity | First two are STD-term covers; B has multiple rank-one points in a component | Retain necessary refinement for B. |
| Hypercover pullback (428.2) | Fin 2 → P and constant P cover | Each pulled-back term Fin 2 | Matching maps identities, surjective = 1 | Retain separated representability. |
| Common refinement and map of covers (428.3) | Two finite covers of sizes 2 and 3 | Product refinement has 6 points | Projections onto 2 and 3 are surjective | Retain. |
| Proper-support subcategory / API (448–450) | Open disc D; j!k from qc subdisc V; k_D | j!k off V = 0; k_D off every such V = k | Membership 1 and 0; qc source gives all objects | Retain; excludes “all objects have proper support”. |
| Locally spatial Kan extension (460) | Finite source; countable discrete source | k^m; ⊕ℕ k | Proper-support extension gives finite sums then their colimit | Retain Kan universal property. |
| Filtered-support formula (474) | ⊔ℕ P → P | colim finite sums = k^(ℕ) | Rf!k = k^(ℕ), not ∏ℕ k | Retain. |
| Locally spatial colimits (478) | Same source, family Aᵢ | ⊕ᵢ ⊕ₙ Aᵢ,ₙ | ⊕ₙ ⊕ᵢ Aᵢ,ₙ, same finite-support arrays | Retain exactness input. |
| Locally spatial base change (482) | Discrete source, two-point base pullback | k^(ℕ) at each point | Each pulled-back pushforward k^(ℕ) | Retain QS at this construction stage. |
| Coherent support diagram (490) | Constant P hypercover, identity f | Every fibre D(k), transitions id | Support inclusion and direct image both id | Retain; degreewise objects alone would not specify the transitions. |
| Hypercover fibre formula (510) | Constant P cover, two-point f | Fibre functor (A₀,A₁) ↦ A₀ ⊕ A₁ | Local construction has exactly that value | Retain. |
| CoCartesian-edge preservation (514) | Same constant diagram | Transition id on A₀ ⊕ A₁ | Pushforward of identity edge also id | Retain. |
| Small-v-stack Rf! (518) | id_*; B → *; [*/C₂] → * | id; Λ(−1)[−2]; undefined in eligible class | Required outputs id and ball twist; stack fibre has automorphisms C₂ | Retain domain boundary. |
| Hypercover independence (537) | P covered by 1 or 2 points, common refinement | Descent of A along either nerve = A | Identity direct image = A for both | Retain enhanced rather than homotopy-category descent. |
| General base change (545) | B → *, pullback to P | k(−1)[−2] restricted to P | Compact-support complex of B_P = k(−1)[−2] | Retain. |
| General colimits (549) | Open discrete countable source | ⊕ₙ ⊕ᵢ Aₙᵢ | ⊕ᵢ ⊕ₙ Aₙᵢ | Retain. |
| General composition (553) | B² → B → P | k(−1)[−2] ⊗ k(−1)[−2] | k(−2)[−4] | Retain dimension/twist addition. |
| General étale agreement (557) | Open inclusion of a subdisc | On-source stalk k, off-source stalk 0 | Étale j! has stalks k and 0 | Retain. |
| General projection formula (561) | Ball, A = k[1] | k(−1)[−2] ⊗ k[1] | k(−1)[−1] = Rf!f*k[1] | Retain shift sign. |
| Exchange coherence (565.1–4) | Fibre I×J×K, sizes 2,3,2; identity base maps | Either iterated composition has 12 summands indexed (i,j,k) | Pasting sends each basis vector to the identical (i,j,k); identity sends e to e | Retain associativity, two pastings and units. |
| Exceptional right adjoint (592) | Fin 2 → P; infinite profinite fibre | `f^!M = (M,M)`; `q^!M` has sections Hom(C⁰(S,k),M) | Adjoints to finite sum and C⁰(S,k)⊗− respectively | Retain actual adjunction; excludes q* for infinite S. |
| Restriction of coefficients (605) | ℤ/25 → k, identity and two-point maps | Underlying ℤ/25 modules k and (k,k) | Restrict first or apply exceptional pullback first: same modules | Retain; no flatness assumption inserted. |
| Formal Verdier conjugation (611, first formula) | R = ℤ, S = ℤ/5, B = S, A′ = ℤ | Homℤ(S,ℤ) = 0 | HomS(S,Homℤ(S,ℤ)) = 0; tensor substitute gives S ≠ 0 | Retain genuine right adjoint and naturality variable. |
| Formal internal-Hom conjugation (617) | Identity adjunction; A = k², A′ = k³ | Hom(k²,k³), dimension 6 | Same Hom, dimension 6 | Retain. |
| Verdier duality (629) | Fin 2 → P, A = constant k, B = k | Hom(k²,k) = k² | f*Hom(k,k) = k² | Retain. |
| Exceptional internal Hom (639) | B → P, A = k², target coefficient k | k²(1)[2] | Hom(k²,k(1)[2]) = k²(1)[2] | Retain. |
| Exceptional identity/composition (645) | id; B² → B → P | id; k(2)[4] | Reversed right-adjoint composite gives k(2)[4] | Retain reversal. |
| Exceptional étale comparison (649) | Fin 2 → P; open immersion | k ↦ (k,k); restriction k ↦ k on open | f* gives identical outputs | Retain. |
| Exceptional base change (653) | g = two-point cover, f = three-point map | g!f*k = (k³,k³) | f′*g̃!k = (k³,k³) | Retain g/f roles; no extra condition on f. |
| Unit/counit and traces (665–689) | Fin 2 over k | η*(1)=(1,1), trace=2, average=1 | η! fibre inclusions, triangle composites=1 | R03: label the two units. |
| Twisted pullback and base-change map (669–671) | id, finite étale, closed origin i in B | τ_id = id; τ_etale = id; on i*k, source k(−1)[−2] | Target for origin is k; base-change maps for id are id | Retain canonical map, not universal equivalence. |
| Trace composition (675) | Fibre sizes 2 and 3 | Σ₂Σ₃ aᵢⱼ | Σ₆ aᵢⱼ; on all ones both 6 = 1 in k | Retain, without normalizing ordinary trace. |
| Profinite locally constant modules (708) | S = ∅,*,Fin 2,ℤ₂; Λ = k or 0 | C⁰ = 0,k,k²,k^(ℕ); over 0 always 0 | Ranks 0,1,2,ℵ₀ over k; dual of last is k^ℕ, dimension 2^ℵ₀ | Retain general coefficient extension of pinned ℤ result. |
| Profinite projection (718) | S = Fin 2, C = Λ[0], Λ = ℤ or 𝔽p | `Rh_* h^* C = Λ²[0]` | C⁰(S,Λ)⊗C = Λ²[0] | R02: include these coefficients. |
| Four twisted-pullback criteria (730) | id_P; q:ℤ₂×P→P | For id, τ=id, sums commute; for q, dual of C⁰ is k^ℕ | Criteria (i)–(iv) all true for id, all false for q; q fails coproduct comparison | Retain both directions; not merely existence of an arbitrary twist. |
| ℓ-power coefficient extension (749) | Λ=ℤ/25, ball; K=k[0] | Dualizing object Λ(1)[2]; degreewise filtration of K has grades k,0 | τ yields same Λ(1)[2]; grades need not be identical under this chosen filtration | Retain actual filtration argument. |
| Direct-sum criterion (755) | Fin 2, ℤ₂, empty base | Right adjoint preserves sums: 1,0,1 | Pushforward constant fibre dimension 2,ℵ₀,0; constructible: 1,0,1 | Retain iff and nonempty-base qualification. |
| Point complex and shifts (769) | Λ=ℤ, n=0,1; Λ=0 | H⁰(ℤ[0])=ℤ; H⁻¹(ℤ[1])=ℤ | Other indicated degrees 0; all shifts of zero =0 | Retain shift uniqueness only for nonzero coefficients. |
| Invertible predicate (777) | k, k[1], k², j!k on valuation chain | Invertible values 1,1,0,0 | Ranks 1,1,2; closed-point stalk of j!k =0 | Retain stated local-shift notion; no converse from tensor-invertibility asserted for arbitrary rings. |
| Invertible API / degree (779) | D=(k,k[1]) on two points; tensor inverse; ℤ/25→k | Degrees (0,−1); D⊗D∨=(k,k); reduction of Λ[2]=k[2] | Locally varying shifts allowed; unit object (k,k); lifted shift Λ[2] | Retain; zero ring has no unique degree. |
| Cohomological smoothness definition (793) | id_*, B→*, origin i:P→B | Smooth values 1,1,0 | Twists Λ,Λ(1)[2]; origin image not open | Retain general small-v-stack base and local dimension. |
| Practical criterion (811) | ⊔ₙ Bⁿ → ⊔ₙ P | Each qc test meets finitely many components, bound max n <∞ | Global sup n=∞; map smooth on every component | Retain corrected quantifiers; source's global bound is too strong. |
| Étale smoothness (824) | Fin 2→P; empty source | Dualizing k on each source point; empty object 0 | `f^! = f^*` on source; empty smoothness true | Retain. |
| Smooth exceptional base change (832) | B→P pulled to Fin 2 | Dualizing object k(1)[2] on each ball | Pullback of original dualizing object same | Retain canonical comparison. |
| Smooth twisted pullback (838) | Ball, input k[1] | D_f⊗f*k[1] = k(1)[3] | Exceptional pullback of k[1] = k(1)[3] | Retain. |
| Dualizing complex/API (844) | id, B, B² | Λ,Λ(1)[2],Λ(2)[4] | Composition gives Λ(1)[2]⊗Λ(1)[2]=Λ(2)[4]; degrees 0,−2,−4 | Retain source, target and twist convention. |
| Perfect-constructible direct image (857) | Ball, constant k; countable disjoint points | Rf!k=k(−1)[−2], perfect | Non-qc disjoint source gives k^(ℕ), not perfect | Retain qc hypothesis. |
| Universal openness (867) | Ball projection; closed origin | Image of ball open = base; origin image={0} | {0} not open in B, hence origin not smooth | Retain negative control. |
| Smooth base-change permanence (875) | Ball pulled back to P or ∅ | Dualizing k(1)[2] or empty 0 | Smoothness 1 in both cases | Retain. |
| Smooth target v-locality (879) | Cover of ⊔ₙ P by components | Every pulled-back Bⁿ has D=k(n)[2n] | Assembled map locally finite, global dimension ∞ | Retain separate local-finiteness hypothesis. |
| Smooth composition (883) | B²→B→P | D_composite=k(2)[4] | D_inner⊗pullback D_outer=k(2)[4] | Retain. |
| Descent along smooth surjections (887) | Two copies of B covering B | g finite étale, D_g=k; composite D=k(1)[2] | D_f=k(1)[2], smooth=1 | Retain separately assumed compactifiability of f. |
| Representability descent (893, first target) | Fin 2×B→B→P | Quotient local model B, dimension1 | f representable=1; empty covering source cannot cover B | Retain separated 0-truncated and cover hypotheses. |
| Locally split smooth descent (893, second target) | Same two-copy cover | Global section into first copy; compactifiability descends | f smooth=1, D_f=k(1)[2] | Retain; no automatic splitting claimed for all smooth surjections. |
| Smooth ordinary base change (901) | g:Fin 2→P, f:Fin 3→P | `g^* Rf_* k = (k³,k³)` | `Rf′_* g̃^* k = (k³,k³)` | Retain arbitrary f. |
| Exceptional pullback through smooth base change (911) | f:B→P, g:Fin 2→P | Two copies of k(1)[2] | Each pulled-back ball has exceptional pullback k(1)[2] | Retain added eligibility of f. |
| Smooth pullback of internal Hom (917) | Ball projection, A=k², B=k³ | Constant Hom has rank6 | Hom of pulled-back constants has rank6 | Retain ℓ-power-torsion hypothesis. |
| Ball canonical compactification (945) | C⁺ strictly smaller than O_C; a∈O_C∖C⁺ | B(C,C⁺)=C⁺ excludes a | Compactified ball gives O_C, includes a | Retain; B is compactifiable but not partially proper. |
| Absolute perfectoid ball/API (939–947) | Test pair (R,R⁺); zero; norm-one element | B(R,R⁺)=R⁺, includes 0 and 1 | Open disc has ∣T∣<1, excludes 1; finite products have n coordinates | Retain full plus ring, not only topologically nilpotent elements. |
| Tate twist (958) | n=5, p≠5; n=1; n=p in char p | μ₅ on geometric point has 5 roots, Λ(1) rank1; Λ=0 for n=1 | μp is non-étale as a group scheme; excluded by invertibility | Retain prime-to-p restriction and twist/shift distinction. |
| Tate-twist annihilator comparison (958) | p=3, Λ=𝔽₂, n=4 and m=2 | Square map sends primitive μ₄ generator to μ₂ generator, hence scalar1 mod2 | Inclusion μ₂→μ₄ multiplies the generator by2, hence scalar0 mod2 | Retain power map, not inclusion. |
| Tate-twist addition and nontriviality (960–966) | d=1 and −1; p=2, ℓ=3 over ℚ₂ | Λ(1)⊗Λ(−1)=Λ; Frobenius on μ₃ acts by2 | Untwisted invariants=𝔽₃, twisted invariants=0 since 2−1=1 | Retain twist inverse and nonconstant example. |
| Ball smoothness and dualizing object (972) | Ball over P, Λ=k or 0 | D_f=k(1)[2]; Rf!k=k(−1)[−2]; for 0 both0 | H⁻²(D_f)=k(1); H²_c(B,k)=k(−1) | Retain opposite shifts/twists and trace normalization. |
| Profinite quotient geometry (987.1) | Trivial C₂ action on P; regular S₃ action on Fin6 | Image quotient P in both cases | Stack quotient for trivial action would retain C₂ automorphisms | Retain image relation; excludes wrong quotient. |
| Quotient projection and eligibility (987.2–3) | C₂×P→P; ℤ₂×P→P | Proper=1, quasi-pro-étale=1; dimensions0 | Finite case étale=1; infinite case étale=0; quotient dimension0 | Retain; compactness excludes discrete ℤ with infinite quotient cardinality. |
| Unit quotient orders (1005) | K=C₂,S₃,Q₈; Λ=k; K=ℤ₅ | Orders2,6,8 have inverses3,1,2 in k | Quotient of ℤ₅ of order5 gives0, not a unit; zero ring has 0=1 a unit | Retain supernatural-order and torsion hypotheses, including nonabelian groups. |
| Averaging transformation (1016) | Free C₂ action, Λ=k | α=3·id; normalized trace(a,b)=3(a+b) | On diagonal1, trace=3·2=1; plain trace=2 | Retain canonical identification distinct from averaging. |
| Averaging subgroup compatibility (1018) | K=C₆, H=C₃, Λ=k | [K:H]⁻¹·∣H∣⁻¹=3·2=1 | ∣K∣⁻¹=6⁻¹=1 | Retain; applying the index factor twice would give3. |
| Free quotient smoothness (1031) | Fin2→P with regular C₂ | f smooth, quotient id_P smooth; both twists degree0 | Averaging comparison on each component=3, an isomorphism | Retain normalization. |
| Distribution sheaf (1043) | S=Fin2, ℤ₂; Λ=k,0 | Finite sections k²; infinite sections Hom(k^(ℕ),k)=k^ℕ | Pullback sections C⁰(ℤ₂,k)=k^(ℕ); zero coefficients give0=0 | Retain nonzero qualification; Dirac mass is not a locally constant density. |
| Nonfree quotient smoothness (1055) | Trivial C₂ action on B; regular finite action | Quotient B; geometric fibres smooth; normalized comparison id | Free two-point comparison=3·id; both nonzero on stalks | Retain geometric-fibre smoothness and check the specified comparison, not an arbitrary isomorphism. |
| Relative-ball approximation (1071) | Identity; zero section; countably many variables | Limit X; intersection ∣T∣≤∣ϖ∣ᵐ is T=0; all coordinates retained | Stage dimensions0;0 over ambient B; unbounded finite n for countable ball | Retain approximation of plus ring and relations. |
| Analytic smoothness (1083) | Smooth curve, torus; p=2 | D_curve=Λ(1)[2]; torus covered by compatible roots | Chart dimension1; pro-2 quotient allowed for ℓ=5 | Retain both characteristic-p and mixed-characteristic fibres. |
| Cyclotomic torsor (1089) | p=2,3; finite torsion removed | p=2: u=t²/(1+t), v_t(u)=2; p=3: v_t(u)=2 | Γ/Δ=1+4ℤ₂ or 1+3ℤ₃, each ≅ℤp; full Γ still has finite torsion | Retain; no division by2 in the characteristic-two invariant field. |
| Cyclotomic finite levels / negative control (1093–1102) | Galois finite level and unramified quadratic extension | Fibre product has ∣Gₙ∣ translates; residue extension degree2 survives | Limit gives G-torsor; universal finite-étale splitting value0 | Retain distinction from A4 tower. |
| Spd ℚp smoothness (1104) | Geometric base; p=2,ℓ=5 | Presentation D×/ℤp, local relative dimension1 | Cover D× smooth, pro-order ℓ-exponent0 | Retain torsion-removed presentation. |
| General-perfectoid-base criterion (1116) | id; ball; closed origin i | First two τ=id/twist, invertible; origin has D_i=k(−1)[−2] | On i*k, τ_i source k(−1)[−2], target k, not equivalent | Retain both conditions; invertibility alone is insufficient. |
| Verdier/naive dual definitions and API (1150–1152) | P; ball; A=k[1] | D_P(k)=k; D_B(k)=k(1)[2]; D(A[1])=D(A)[−1] | Twice dual at P returns k[1]; smooth pullback correction D_g⁻¹ cancels D_g | Retain contravariance and shift. |
| Biduality theorem (1165) | P, A=k²; B, A=k | A∨∨=k²; naive double dual on B=k | Evaluation v↦(φ↦φ(v)); respective dimensions2 and1 | Retain theorem; proof route needs R01. |
| Constructible filtration claim (1167) | A=k_Z for Z=B∖{∣T∣≤∣ϖ∣} | Stalks on (U,Z)=(0,k); support nonopen | Every finite extension of étale j!L has open support | False; R01 localization triangles repair it. |
| Finiteness (1175) | P, annulus, countable disjoint P | H⁰(P)=k; H¹(annulus)=k(−1) | Dimensions1,1; non-qc disjoint union H⁰=k^ℕ has dimension2^ℵ₀ | Retain qc; correct inherited dévissage. |
| General-coefficient biduality (1185) | Λ=ℤ/25, A=Λ²[1] on P | A∨=Λ²[−1]; A∨∨=Λ²[1] | RΓ=A, a finite free complex | Retain perfect-constructible hypothesis. |
| Higher-rank failure of biduality (1191) | Rank2 chain (η,s), A=j!k | A stalks(k,0), A∨ stalks(k,k) | A∨∨ stalks(k,k), unequal at s | Retain counterexample. |
| Infinite-rank rational-open control (1199) | Γ=⊕ℤ ℚeᵢ, a=x₀⁻¹ | v(a)=−e₀<0 at closed point; norm value1 | U nonempty proper; no finite set of bounds isolates generic point | Retain rational open instead of presumed open norm point. |
| Closed valuation subrings (1205) | k algebraically closed, K=k(t); contrast k=ℝ | V=k[t]_(t), residue k, basic open t∈V | ℝ[t]_(t²+1) residue ℂ, not ℝ | Retain algebraically closed base; explicit closed refinement. |
| Jacobson stalk detection (1217) | Fin2; Spec k[t]; non-Jacobson two-point chain | A nonzero section has nonempty closed support locally, meeting a closed point | In two-point chain j!k has closed stalk0 but generic stalk k | Retain Jacobson assumption. |
| Proper perfectoid closed-point detection (1227) | P; finite disjoint union of P | All component closed stalks0 implies every stalk0 | Global sheaf/complex0; a nonzero component has stalk k | Retain compactified component hypothesis; no arbitrary-component argument substituted. |
| Conservativity over P (1241) | A=k^(ℕ); A=0 | Dual k^ℕ ≠0; dual0=0 | A≠0 in first case, A=0 in second | Retain no constructibility hypothesis. |
| Higher-rank nonconservativity (1253) | Rank2/3 chain, closed skyscraper i*k | Stalk at s=k; derived internal Hom into constant k=0 | Complement-open extension at middle point is k, generic-open extension there0 | Retain arbitrary-rank complement, including rank3 correction. |
| General ring conservativity condition (1263) | Λ=ℤ/25; Λ=k[[t]], M=k((t)) | First ring self-injective cogenerator; second Hom-derived value0 | M≠0 in second; telescope dual inverse bₙ=Σⱼtʲaₙ₊ⱼ | Retain condition; noetherianity alone does not suffice. |
| Spherically complete ring counterexample (1263) | Hahn field k((t^ℚ)); compare k((t)) | Nondiscrete valuation ring gives RHom(residue,Λ)=0 | DVR instead has Ext¹(residue,Λ)=k ≠0 | Retain nondiscreteness; source omits it. |
| Source proof sign control (Poo line 375) | v(μ−λ)=g=1, leading coefficient s=1 | Subtracting p gives valuation >1 | Subtracting p⁻¹ gives valuation −1 | Source misprint; use positive exponent. |

The finite-field values in the normalization rows were recomputed: 2·3 = 1, 3·2 = 1, 6·1 = 1 and 8·2 = 1 modulo 5. The rank-three stalk calculation distinguishes the complementary open {η,t} from the generic open {η}. The telescope calculation is an actual inverse: bₙ − t bₙ₊₁ = aₙ; if that difference is zero for all n, t-adic separatedness forces every bₙ = 0. No denominator was used without its unit condition. Inseparability, nilpotent thickenings and noncompact groups were not silently treated as perfectoid spaces or profinite groups: the geometric category is perfectoid of characteristic p, prime-to-p roots of unity are étale, and the profinite-order definition alone does not supply compactness.

**Pinned declarations opened: 21 API rows.** These are paths within the named pinned libraries, not claims about a newer version. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Declaration / object | Pinned file and line | What was checked |
| --- | --- | --- |
| LocallyConstant.freeOfProfinite | `Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153` | Free module over ℤ, on a Profinite carrier; does not itself state arbitrary coefficient extension. |
| IsLocalRing.exists_factor_valuationRing | `Mathlib/RingTheory/Valuation/LocalSubring.lean:248` | Local source ring, homomorphism into a field, factorization through a dominating valuation subring. |
| finite_of_finite_type_of_isJacobsonRing | `Mathlib/RingTheory/Jacobson/Ring.lean:676` | Finite-type field algebra over a Jacobson ring is module-finite. |
| nonempty_inter_closedPoints | `Mathlib/Topology/JacobsonSpace.lean:105` | Requires JacobsonSpace and nonempty locally closed subset. |
| JacobsonSpace.of_isOpenEmbedding | `Mathlib/Topology/JacobsonSpace.lean:133` | Open subspaces retain that hypothesis. |
| conjugateIsoEquiv | `Mathlib/CategoryTheory/Adjunction/Mates.lean:424` | Equivalence (L₂ ≅ L₁) ≃ (R₁ ≅ R₂), with both adjunctions; order reverses. |
| Algebra.linearMap | `Mathlib/Algebra/Algebra/Defs.lean:370` | Algebra map as linear map; on Λ^I it is the diagonal. |
| Algebra.trace, trace_eq_matrix_trace | `Mathlib/RingTheory/Trace/Defs.lean:70`, line 86 | Trace of multiplication; with the finite product basis it is summation. |
| Module.evalEquiv | `Mathlib/LinearAlgebra/Dual/Defs.lean:225` | Requires IsReflexive; the finite-free instance is in `Mathlib/LinearAlgebra/Dual/Lemmas.lean:255`. It is not a theorem for arbitrary modules. |
| DerivedCategory.singleFunctor | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:243` | Native single complex in a specified degree; does not construct diamond étale categories. |
| DerivedCategory.homologyFunctor | `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean:33` | Homology of the native derived category, under Abelian and HasDerivedCategory assumptions. |
| MonoidalClosed; Adjunction.comp | `Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:46`; `Mathlib/CategoryTheory/Adjunction/Basic.lean:563` | Internal Hom is right adjoint to left tensor; composite adjunction reverses the order of right adjoints. |
| PreTilt; PreTilt.untilt | `Mathlib/RingTheory/Perfection.lean:633`; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49` | Perfection of the mod-p ring and multiplicative untilting map; these are algebraic constructions, not the perfectoid-space site. |
| TauCeti.ValuationSpectrum.spa; TauCeti.AdicSpace | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101`; `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | A set of continuous bounded valuations, and the sheafy locally affinoid category; neither gives a diamond or its étale enhancement. |
| TopCat.Presheaf.stalk | `Mathlib/Topology/Sheaves/Stalks.lean:82` | Colimit over open neighborhoods, under the colimit assumptions; no automatic Jacobson or sheaf-detection hypothesis. |
| rootsOfUnity | `Mathlib/RingTheory/RootsOfUnity/Basic.lean:56` | Subgroup of units satisfying the power equation, not a pre-existing diamond Tate-twist sheaf. |
| TauCeti.profiniteOrder | `TauCeti/Topology/Algebra/Group/Profinite/Order.lean:58` | Supremum of prime valuations of open-normal quotient cardinalities; definition itself does not assume compactness. |
| TauCeti.ofNat_card_quotient_le_profiniteOrder | `TauCeti/Topology/Algebra/Group/Profinite/Order.lean:146` | Divisibility inequality under the compact topological-group section assumptions. |
| Subgroup.profiniteIndex; OpenSubgroup.profiniteIndex_eq_ofNat_index | `TauCeti/Topology/Algebra/Group/Profinite/Index/Basic.lean:70`, line 189 | Ordinary finite index of an open subgroup, encoded as a positive natural supernatural number. |
| Subgroup.profiniteOrder_eq_mul_profiniteIndex | `TauCeti/Topology/Algebra/Group/Profinite/Lagrange.lean:94` | Closed-subgroup hypothesis retained. |
| TauCeti.profiniteOrder_multiplicative_padicInt | `TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicInt/Basic.lean:170` | Requires p prime; order is p^∞. |

**Ownership and supplier resolution.** The object searches used `roadmaps grep` and `roadmaps show`, followed by reading the matching source sections; the main copies were used for existing roadmaps and supplied heads for new roadmap folders. The citation resolver reported no unresolved cross-roadmap citation and 50 candidate unknown Lean names. The latter are chiefly the planned identifiers covered by R04, plus the real supplier-name mismatch R05; `Perfectoid.tilt_invariants`, for example, does exist as a target in PerfectoidTowers P8.4 and is not a missing supplier.

| Supplier / ownership boundary | Resolved repository-relative evidence |
| --- | --- |
| DiamondEtaleCohomology: 52 explicitly cited numbered targets | `TauCetiRoadmap/DiamondEtaleCohomology/README.md:565` (§§C0.18–19), line 615 (C0.24), line 783 (C2.2–5), line 860 (C2.9–10), line 906 (C2.12); line 980 (C3.1–2), line 1102 (C3.8–9), line 1159 (C3.11); line 1202 (C4.1), line 1262 (C4.5), line 1296 (C4.7), line 1330 (C4.9), line 1364 (C4.13–15); line 1452 (C5.1–3), line 1527 (C5.6), line 1573 (C5.9); line 1597 (C6.1); line 1743 (C7.3), line 1801 (C7.8), line 1860 (C7.11), line 1947 (C7.14), line 2005 (C7.17), line 2047 (C7.22); line 2111 (C8.2), line 2376 (C8.14–23), line 2670 (C8.41), line 2724 (C8.44), line 2756 (C8.48); line 2944 (C9.5), line 2970 (C9.8), line 3028 (C9.12–13). These supply the categories, ordinary operations, étale extension, compactification, dimension, constructibility and compact generation, not general exceptional operations. R01 identifies a misuse of C7.11's otherwise existing contract. |
| DiamondsAndVStacks: topology, geometry, quotients and charts | `TauCetiRoadmap/DiamondsAndVStacks/README.md:1141` (D0.9), line 1475 (D0.18), line 1656 (D0.21); line 2227 (D1.1), line 2392 (D1.3–5), line 2914 (D1.9–11); line 4217 (D2.7); line 4858 (D3.5–10); line 5753 (D4.1–2), line 6031 (D4.5–8), line 6559 (D4.10), line 6728 (D4.11); line 6843 (D5.1), line 7055 (D5.3–5), line 7610 (D5.11–15); line 8634 (D6.1), line 8804 (D6.3–5). Properness has one owner, D4.11; the relative nonfree-quotient/compactifiability theorem here adds to D4's quotient carrier. |
| EnhancedDerivedSheaves: generic enhancement and coherence | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:187` (E0.1), line 360 (E0.7), line 429 (§§0.1–0.4), line 1121 (E3.1–4), line 2293 (E2.6). E3.4's poset diagram result is not treated as supplying arbitrary simplicial diagrams: DiamondEtaleCohomology C2.9 and E0.7 supply those. E3.3 explicitly gives the compact-generator criterion. |
| ClassicalAdicEtaleCohomology: classical curve inputs | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:1032` (§2.4), line 4138 (§8.2 local/global curve compactification), line 4339 (§8.4 amplitude), line 4518 (§9.2), line 4929 (§9.5), line 5058 (§9.6 plus-ring trace), line 5112 (§9.6 unbounded open-coefficient duality), line 5563 (§10.5 pulled-back constructibility), line 5573 (support-image comparison), line 5724 (§11.3 frontier), line 5738 (direct summand), line 5748 (proper-curve pairing). The arbitrary-rank and unbounded contracts are actually present. |
| SmoothRepresentationsOfLocalGroups | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:723` (§SR.0.3 unit pro-order), line 1034 (§SR.1.1 normalized ring-valued Haar measure). This roadmap uses that measure and proves the supernatural-order-to-unit implication, rather than reconstructing measure theory. R05 corrects only the invented identifier. |
| Analytic/perfectoid inputs | `TauCetiRoadmap/AdicSpacesPartII/README.md:8005` (R0.19.10); `TauCetiRoadmap/AdicEtaleGeometry/README.md:6718`, line 6942, line 7134 (A2 balls, tori, smooth charts), line 9458 and line 9532 (A4 tower and non-cyclotomic control); `TauCetiRoadmap/PerfectoidSpaces/README.md:3583` (P1), line 5423 (perfected Tate algebras), line 5517 (cyclotomic field), line 6174 (P2 characteristic-p rational localization); `TauCetiRoadmap/PerfectoidTowers/README.md:619`, line 633 (P8.3–4 finite invariants, including group orders divisible by p). |
| Adjacent open work and board packages | `TauCetiRoadmap/AnalyticStacks/README.md:10` leaves étale six operations to this roadmap. `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:14` imports this roadmap; its boundary at line 83 concerns lisse/stack extensions. The object search did not find an earlier owner of the general ECD §§22–25 construction. AdicEtaleGeometry's consumer at `TauCetiRoadmap/AdicEtaleGeometry/README.md:7196` explicitly leaves the cohomological conclusion to S5.5. These are consumer references, not upward supplies. |

No declaration-name collision is possible in this folder's empty Lean namespace. No already-existing roadmap was replanned. The additional geometric targets—hypercover refinements, diamond fibre-dimension comparison, relative profinite quotients, relative-ball approximation and the torsion-removed cyclotomic torsor—have distinct scope from the suppliers' carriers and finite-stage results. The search included the supplied open-roadmap sources and the board-package object matches; it was not restricted to matching this roadmap's proposed names. No ownership move or new supplier gap is proposed.

The README has all seven layer endings, dependencies, examples, scope/conventions/contracts and references. Its definitions have API descriptions and at least three discriminating Checks; the defect is the representation of those APIs as nonexistent Lean declarations (R04), rather than missing mathematical tests. The point, empty, zero-ring, higher-rank, infinite-profinite, nonabelian and coefficient controls above were checked against the neighboring formulas as well as their own paragraphs.

## Not verifiable

- **Hub96**, Huber, *Étale cohomology of rigid analytic varieties and adic spaces* (1996), DOI 10.1007/978-3-663-09991-8: the sources service reached the publisher's paywalled edition after the title search. No text was available legally in this run. The README's direct Huber locators, including Corollary 1.6.10, p. 80, and Proposition 5.5.8, cited as p. 304, remain uncertified. The corresponding named supplier contracts were read; that is not independent certification of the book's printed pages.
- **Sch92**, Scheiderer, *Quasi-augmented simplicial spaces, with an application to cohomological dimension*, cited for the spectral-space bound: the sources service classified the publisher route as paywalled. No legal text was obtained. The bound's supplier contract C8.44 was inspected, but the source itself remains uncertified.

These are source-access limits, not requests to edit a manifest or to pause the review. All seven other cited works were fetched and read at the relevant passages. No inaccessible source was treated as read.

## Source issues

- **Misprint** in ECD at Theorem 19.2, printed p. 108, ECD line 4461: the source says the pullback uses an undefined V; it should be U ×Y Y′; affects nothing.
- **Misprint** in ECD at proof of Theorem 22.5, printed p. 130, ECD line 5379: the source says V is the inverse image under f inside the compactification; it should be the inverse image under the compactified map; affects nothing.
- **Gap** in ECD at Proposition 22.15, printed p. 136, ECD line 5641: the source says the target base may be any locally spatial diamond; it should be restricted to the construction's quasiseparated domain here, or first extended by gluing; affects the proof.
- **Gap** in ECD at proof of Lemma 23.6, printed p. 144, ECD line 6021: the source says the arbitrary-ring result follows through the exceptional projection formula; it should be proved for arbitrary rings using continuity and the exact profinite projection, or have that additional argument supplied; affects the proof.
- **Misprint** in ECD at Definition 23.8, printed p. 145, ECD line 6048: the source says the twist uses f* after passing to X; it should be the pullback f_X* with domain D_ét(X,𝔽ℓ); affects nothing.
- **Error** in ECD at Proposition 23.10(i), printed p. 145, ECD line 6064: the source says smoothness requires one global finite transcendence-dimension bound; it should be a finite bound after each strictly totally disconnected test, allowing unbounded dimensions on different base components; affects a stated result.
- **Error** in ECD at Proposition 23.16(iii), printed p. 151, ECD line 6305: the source says only g must satisfy the geometric hypotheses while using the exceptional inverse image of f; it should be assumed that f is eligible too; affects a stated result.
- **Misprint** in ECD at proof of Proposition 23.16(iii), printed p. 151, ECD line 6312: the source says the tensor factors use 𝔽ℓ while A has Λ coefficients; it should be Λ and the exceptional pullback Rg^!Λ throughout those formulas; affects the proof.
- **Gap** in ECD at Proposition 23.17, printed p. 151, ECD line 6316: the source says the internal-Hom exchange for unspecified Λ; it should be supplied with the ℓ-power-torsion hypothesis used by the cited twisted-pullback theorem; affects the proof.
- **Gap** in ECD at proofs of Propositions 24.2 and 24.3, printed pp. 153 and 155–156, ECD line 6414 and line 6497: the source says the comparison reduces to 𝔽ℓ without specifying Λ as ℓ-power torsion; it should be supplied with that coefficient hypothesis for this reduction, or proved by another argument at the larger generality; affects the proof.
- **Gap** in ECD at proof of Proposition 24.3, printed p. 156, ECD line 6497: the source says the specified averaging comparison is an equivalence on geometric fibres by assumption; it should be shown nonzero on every stalk using orbit equivariance and the normalized unit–trace identity; affects the proof.
- **Error** in ECD at Remark 25.2, printed p. 158, ECD line 6595: the source says the generic norm point is open for an arbitrary higher-rank plus ring; it should be formulated with a proper nonempty rational open, or additionally assume the norm point open; affects a stated result.
- **Misprint** in ECD at Remark 25.3, printed p. 158, ECD line 6599: the source says global sections form a perfect complex of A-modules; it should be Λ-modules; affects nothing.
- **Error** in ECD at Remark 25.6, printed p. 161, ECD line 6694: the source says spherical completeness supplies the residue-field zero-dual counterexample; it should be restricted to nontrivial nondiscrete valuations, since a discrete valuation ring has nonzero residue-field Ext¹; affects a stated result.
- **Misprint** in Poo at proof of Theorem 1, printed p. 9, Poo line 375: the source says subtracting s times p to the negative g improves the approximation; it should be s times p to the positive g that is subtracted, consistently with the next line; affects the proof.
