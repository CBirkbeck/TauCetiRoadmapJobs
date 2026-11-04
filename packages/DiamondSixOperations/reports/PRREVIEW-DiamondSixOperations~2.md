# Review of DiamondSixOperations (pull request #927 at f893965)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check is clean, all five findings of the previous review are repaired, and the sampled sources support the statements as written. The four findings below are P3 notes the author may take or leave.

## R01 (P3) — A cited supplier declaration name does not exist in the supplier

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:316`: “Transporting C8.16's `diamondDimTrg_empty` along the classification gives `dim.trg = ⊥`”.

**Claim:** `DiamondEtaleCohomology` §C8.16 exports a declaration named `diamondDimTrg_empty`.

**Witness:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md` at the head of its pull request, §C8.16 (its line 2370 onwards), states the empty-source value only as a prose API bullet (“Empty source gives bottom”) and a Check; the string `diamondDimTrg` occurs nowhere in that roadmap's `Suggested.lean` (199 lines), so no such name is promised anywhere.

**Repair:** Replace the backticked name by prose: “by the empty-source clause of `DiamondEtaleCohomology §C8.16`, the empty diamond has `dim.trg = ⊥ = −∞ ≤ 0`”. The Check's content is unchanged: `T = ∅` gives `Y = ∅`, and the supplier's clause gives `⊥`, which is `≤ 0`. This is the same class as the previous review's R05: a supplier is cited by a name it does not declare.

## R02 (P3) — Exactness of `j_*` is cited from a statement about locally spatial diamonds

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:356`: “Since `j_*` is exact (C8, ECD Remark 21.14, for the quasicompact separated quasi-pro-étale inclusion `j`)”.

**Claim:** `DiamondEtaleCohomology §C8.22` applies to `j : Y′ → (Y′)‾^{/Y}`.

**Witness:** `TauCetiRoadmap/DiamondEtaleCohomology/README.md` §C8.22 (line 2448 at its head) is stated for maps of locally spatial diamonds; the same README's own Theorem 22.5 discussion, and ECD line 5388, say it is not known whether the canonical compactification of a spatial-eligible map is spatial. ECD line 5158 (Remark 21.14) carries the same hypothesis. The conclusion is nevertheless true: after base change along a strictly totally disconnected cover of the compactification (qcqs base change, C3) the pullback of `j` is a quasicompact open immersion between strictly totally disconnected spaces, where higher direct images vanish by C8.21.

**Repair:** State that one-line reduction in the proof route instead of citing C8.22 alone (C3 base change for the qcqs `j`, then `DiamondEtaleCohomology §C0.19` or §C8.21 on the cover). On the ball over `Spa(C, O_C)` the pulled-back `j` is the inclusion of a quasicompact open of a strictly totally disconnected space and `R^{>0} j_* = 0` as claimed. ECD's own proof has the same gap; it is recorded under Source issues.

## R03 (P3) — The Huber locator for Proposition 5.5.8 disagrees with the supplier's

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:120` and `:1301`: “Huber 1996, Proposition 5.5.8, p. 304”.

**Claim:** Proposition 5.5.8 of Huber's book is on page 304.

**Witness:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` §8.4 (line 4344 at its head) cites the same statement as “Proposition 5.5.8 and proof, pp. 307–308”. The book is paywalled and neither page could be checked here; one of the two locators is wrong.

**Repair:** Cite Proposition 5.5.8 by number and take the page from the supplier contract once verified against the printed text, or drop the page number. The mathematics (the `2·dim.tr` bound for `R^q f_!` of a separated taut locally `+`weakly finite type map) is stated in the supplier's §8.4 as this README describes it.

## R04 (P3) — A listed reference is cited nowhere

**Location:** `TauCetiRoadmap/DiamondSixOperations/README.md:1304`: “[LZ14] Y. Liu and W. Zheng, *Enhanced six operations and base change theorem for Artin stacks*”.

**Claim:** The reference list records the sources the README cites.

**Witness:** The string `LZ14` occurs only at line 1304; no target, proof route or supplier contract cites it. The place where ECD uses it (ECD line 5660, the simplicial coCartesian fibration of enhanced derived categories, with the enough-points hypothesis of LZ14 §2.2) is Section S2.3, which cites `DiamondEtaleCohomology §C2.9` and `EnhancedDerivedSheaves §E0.7` instead.

**Repair:** Either cite [LZ14] §2.2 in Section S2.3 as the construction's source (noting that the enough-points hypothesis is supplied by the v-topos), or delete the entry. Either is consistent with the Needs lines already given.

## Verified sound

**Repairs of the previous review (ac2b810 → f893965).**

- Previous R01 (P1, closed strata omitted from the dévissage): repaired. README line 1168 now filters `A` by `DiamondEtaleCohomology §C7.11` into pieces `j_!(L|_Z)` with `Z` constructible closed, applies the open–closed triangle `(j∘k)_!(L|_W) → j_!L → j_!(L|_Z)` with `W = U ∖ Z` quasicompact, and uses closure of the biduality-equivalence locus under cones; line 1182 makes the same reduction for finiteness; the witness is now the negative-control Check at line 1177 (`A = coker(j_!𝔽_ℓ → 𝔽_ℓ)` on the ball, stalks `0` on `U` and `𝔽_ℓ` on `Z`, nonopen support). C7.11 at the supplier's head (line 1828) states exactly that filtration for noetherian `Λ`, so it covers `𝔽_ℓ`.
- Previous R02 (P2, profinite projection narrowed to prime-to-`p` torsion): repaired. README line 718 states `Rh_*h^*C ≃ C⁰(S, Λ) ⊗_Λ C` for any commutative ring `Λ`; the proof route at line 720 uses C2.3 (test on a v-cover), C0.24, C0.19, C8.22 and C0.18, each of which exists at the supplier's head with the content used (lines 814, 623, 581, 2448, 573). The two-point Check at line 727 now includes `Λ = ℤ` and `Λ = 𝔽_p`. ECD line 6017 states the lemma for any ring.
- Previous R03 (P3, two units conflated): repaired. Lines 667, 677 and 685 name `η_* : id → Rf_* f^*` and `η_! : id → Rf^! Rf_!`, give the fibrewise inclusions of `η_!`, and keep the computation `tr ∘ η_* = 2`, normalised `3·2 = 1` over `𝔽₅`.
- Previous R04 (P3, undeclared own Lean names): repaired. Line 37 now says backticked names are declarations of Mathlib, Tau Ceti or a supplier; the backticked identifier scan of the README finds only supplier and library names plus mathematical notation (the worker's `readme-ids-missing=0` agrees), and `Suggested.lean` line 4 carries the “: target signatures” title. The one remaining supplier-name slip is R01 above.
- Previous R05 (P3, Haar theorem cited by a nonexistent name): repaired. Lines 22 and 59 cite `HaarMeasureWithValues`, `HasUnitProOrder` and the target *a-valued-haar-measure* of SR.1.1; all three occur in `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` at its head (lines 726, 1036–1038), with the normalisation `μ(U₀) = 1` and `μ(gU) = [U₀ : U]⁻¹` as this README describes.

**Gate and checks.** The worker's gate at f893965 passed every scanner, the dependency check and `lake build TauCetiRoadmap.DiamondSixOperations.Suggested`. Independently, `lake env lean` on `Suggested.lean` exited 0 in 2.6 s with no output: the file has a single `import Mathlib`, a module docstring, an empty namespace and no declarations, so there is nothing to `#check`, no sorry'd data, no `set_option`, and the one-tactic padding probe has an empty domain. The diff outside the roadmap folder against `origin/main` is empty. The dependency check returned:

```text
depcheck: 201 roadmaps, 1314 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The merge order lists `DiamondSixOperations` directly after `DiamondEtaleCohomology`, its last supplier; the consumers it names (`AdicCoefficientsAndComparisons`, `VStackSheavesAndLisseCategories`, `AnalyticStacks`) are all later in the order and none is cited as a supplier. A scan of the README for process words found none (`torsion-removed` at line 1112 is mathematical).

**Headline theorems and the Lean file.** The headlines are: compactifiability and its descent (S0); `Rf_!` with the `2·dim.trg` and `3·dim.trg` bounds, base change, composition, projection formula and sums (S1–S2); `Rf^!`, Verdier duality and exceptional base change (S3); the smoothness criteria, universal openness, the dualizing complex, composition, descent and smooth base change (S4); the ball with `Λ(1)[2]`, profinite quotients, smooth analytic maps, `Spd ℚ_p` and the geometric-base criterion (S5); biduality, finiteness and conservativity over `Spa(C, O_C)` with the counterexamples over `Spa(C, C⁺)` (S6). The module docstring names every one of them as not statable and says what is missing. At the pins, Mathlib has `RingTheory/Perfectoid/{Untilt,BDeRham,FontaineTheta}.lean` and `RingTheory/Perfection.lean` (ring-level perfectoid theory only) and Tau Ceti has `AlgebraicGeometry/AdicSpace/PreAdicSpace/Affinoid.lean` (pre-adic spectra of Huber pairs); neither has perfectoid spaces, the v-topology, small v-stacks, locally spatial diamonds or `D_ét`, so no headline is statable and no stand-in was written. The two purely algebraic auxiliaries (the formal duality lemma of S3.2 and the Zariski–Riemann closed-point lemma of S6.3) are ingredients, not headlines, and correctly stay in the README.

**Source sample.** Locators refer to the ECD arXiv v4 text fetched through the sources service (printed pagination as in the README).

| Target | Source inspected and outcome |
| --- | --- |
| Compactifiable morphisms (README 123) | ECD line 5255, Definition 22.2, p. 128: open immersion followed by partially proper. Matches. |
| Compactifiability criterion (135) | ECD line 5260, Proposition 22.3(i): separated and `Y′ → Y′‾^{/Y}` open. Matches. |
| Independence of the compactification (302) | ECD line 5343, Definition 22.4, p. 129, and line 5380 (Theorem 19.2 used as proper base change). The README states the independence ECD asserts implicitly and proves it through 19.2 as ECD does in 22.9. |
| The `2·dim.trg` bound (344) | ECD line 5369, remark after Theorem 22.5 and line 5383, the spatial case of the proof: hypothesis “compactification representable in spatial diamonds”, bound `2 dim.trg f`. Matches. |
| Composition (170, 376, 553) | ECD lines 5264 (22.3(iv), v-stacks, no representability), 5472 (22.9, order `Rf_! ∘ Rg_!`), 5732 (22.21, eligible maps of small v-stacks). All match. |
| Direct sums (390) | ECD line 5549, Proposition 22.12: small v-sheaves, spatial representability, `dim.trg < ∞`. Matches, including the “small v-sheaves” hypothesis kept here. |
| Colimits over a locally spatial base (478) | ECD line 5622, Proposition 22.14, quasiseparated locally spatial diamonds, HA 1.4.4.1(2) (HA line 5809). Matches. |
| Coherence of the exchange equivalences (565) | ECD line 5724 (“over `Δ × Δ¹`”) and lines 5767–5814 (proof of 22.23). ECD does not number these identities; the README derives them from the same construction over `Δ × [1]ⁿ`, as stated. |
| Change of rings (605) | ECD line 5827, Remark 23.2, p. 140: restriction along `g : Λ′ → Λ` commutes with `Rf^!`, as the right adjoint of the projection-formula identity. Matches. |
| The dualizing complex (845) | ECD line 6124, Proposition 23.12(i) and (iii), p. 147: `Λ` ℓ-power torsion, `D_f` étale locally `Λ[n]`, base change. Matches. |
| Perfect-constructibility (858) | ECD line 6128, Proposition 23.12(ii): `f` quasicompact, perfect-constructible input. Matches; the README's “no statement for an arbitrary proper map” is a correct scope remark. |
| Base change (152, 372, 545, 876) | ECD lines 5262 (22.3(ii), arbitrary base map), 5465 (22.8), 5713 (22.19), 6275 (23.15 first part). All match. |
| Descent along smooth surjections (888) | ECD line 6239, Proposition 23.13 second part, p. 149: `g` surjective smooth, `f ∘ g` smooth, `f` representable in diamonds and compactifiable. Matches. |
| Descent of representability, locally split case (894) | ECD line 6245, Remark 23.14 and lines 6251–6255, p. 150: universally open separated surjective `g`; compactifiability omitted when `g` has local sections after pullback to strictly totally disconnected spaces. Matches. |
| Approximation by relative balls (1072) | ECD line 6557, proof of Proposition 24.6, p. 157: `X′ = lim X̃ᵢ` with `X̃ᵢ` affinoid open in finite-dimensional balls over `X`, asserted without proof. The README's construction target supplies it; its limit identification was recomputed below. |
| Biduality (1166) | ECD line 6585, Theorem 25.1, pp. 158–160: complete algebraically closed `C`, separated smooth `X`, bounded constructible `A`; line 6608 (20.8 reduction) and line 6664 (proper-curve reduction). Matches; the closed-stratum repair follows the proof's own structure. |

Also inspected: ECD lines 5866–5926 (23.4, conditions (iii)–(iv) with connected components `Spa(C, C⁺)`), 6017 (23.6), 6024 (23.7), 6043 (23.8), 6061 (23.10), 6093 (23.11), 6289–6321 (23.16–23.17), 6330 (24.1), 6383–6398 (24.2 and the distribution remark), 6457 (24.3), 6502 (24.4), 6523 (24.5: `K_∞` the cyclotomic `ℤ_p`-extension, `(Spa ℚ_p)^♢ = Spa 𝔽_p((t^{1/p^∞}))/ℤ_p`), 6537 (24.6), 6593–6605 (25.2, 25.3 with footnote 6), 6686–6715 (25.4–25.6 and proof), 5058–5077 (Lemma 21.6, Definition 21.7, Remark 21.8), 5158 (Remark 21.14), 4245 and 4335 (18.6, 18.8). HTT lines 12422 (4.3.1.7), 12841 (Definition 4.3.2.2), 13478 (Corollary 4.3.2.14) and 321/15388 (Corollary 5.5.2.9); HA line 5809 (1.4.4.1); KW line 171 (§2.1, valuation rings and affinoid fields, printed page 4 for the higher-rank examples); Poo lines 333 (Lemma 4, p. 8) and 356 (Theorem 1, p. 9).

**Supplier citations resolved** (every round, at the cited copy): all 53 distinct `DiamondEtaleCohomology §C*` sections have a heading at the head of its pull request; all 32 `DiamondsAndVStacks D*/label` citations and `§D4.11` resolve (D4.11 at line 6756 defines properness exactly as README line 33 says; D5.3 carries *limits-and-finite-stage-comparisons*); `EnhancedDerivedSheaves` §§E0.1, E0.7, E2.6, E3.1–E3.4 are headings on main; `AdicEtaleGeometry A2/*` (3 labels), `A4/test_not_cyclotomic` (main line 9532) and *finite-etale-torsor-tower*; `PerfectoidSpaces P1/*` (4 labels), `P2/rational-localization-in-characteristic-p`, P1.31; `PerfectoidTowers P8.3/invariant-quotient-v-sheaf-presentation` and `P8.4/invariants-of-perfectoid-tate-ring`, with *Perfectoid.tilt_invariants* and *invariants_perfectoid* present at its head and the “no hypothesis on `|G|`” clause at its line 645; `AdicSpacesPartII §R0.19.10` (main line 8010) and `§R0.19.2` (line 7525); `SchemeAndStackFoundations §2.5` (main line 3388); `ClassicalAdicEtaleCohomology` §§2.4, 8.2, 8.3, 8.4, 9.2, 9.5, 9.6, 10.4, 10.5, 11.3 (headings at its head; §9.6 line 57 states the unbounded open-coefficient duality and line 31 names this roadmap as the consumer that deduces the `Rf^!` form by Yoneda; §11.3 states the finite frontier and the direct-summand reduction; §2.4 cites Huber 1993 Lemma 2.1; §10.5 carries the field-base map used in S5.2). The citation resolver's two leads were checked: `Perfectoid.tilt_invariants` exists in PerfectoidTowers P8.4; `dim.trg` is ECD's notation, not a Lean name.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `JacobsonSpace` (Topology/JacobsonSpace.lean:70), `closedPoints` (:36), `nonempty_inter_closedPoints` (:105), `JacobsonSpace.of_isOpenEmbedding` (:133), `jacobsonSpace_iff_locallyClosed` (:80, the form the S6.3 proof uses); `IsLocalRing.exists_factor_valuationRing` (RingTheory/Valuation/LocalSubring.lean:248); `finite_of_finite_type_of_isJacobsonRing` (RingTheory/Jacobson/Ring.lean:676); `LocallyConstant.freeOfProfinite` (Topology/Category/Profinite/Nobeling/Induction.lean:153, an instance `Module.Free ℤ (LocallyConstant S ℤ)` for `S : Profinite`); `Algebra.linearMap` (Algebra/Algebra/Defs.lean:370); `Algebra.trace_eq_matrix_trace` (RingTheory/Trace/Defs.lean:86); `Pi.basisFun` (LinearAlgebra/StdBasis.lean:120); `CategoryTheory.conjugateIsoEquiv` (CategoryTheory/Adjunction/Mates.lean:424, `(L₂ ≅ L₁) ≃ (R₁ ≅ R₂)`, the direction the formal duality lemma uses); `CategoryTheory.Adjunction.comp` (Adjunction/Basic.lean:563); `MonoidalClosed` (Monoidal/Closed/Basic.lean:46); `DerivedCategory.singleFunctor` (Algebra/Homology/DerivedCategory/Basic.lean:243); `Module.evalEquiv` (LinearAlgebra/Dual/Defs.lean:225) and `Module.Dual.eval` (:79); `TopCat.Presheaf.stalk` (Topology/Sheaves/Stalks.lean:82); `rootsOfUnity` (RingTheory/RootsOfUnity/Basic.lean:56); `OpenNormalSubgroup` (Topology/Algebra/OpenSubgroup.lean:465). Tau Ceti: `TauCeti.profiniteOrder` (Topology/Algebra/Group/Profinite/Order.lean:58) and `TauCeti.ofNat_card_quotient_le_profiniteOrder` (:146, inside `namespace TauCeti`, hypotheses `[SeparatelyContinuousMul G] [CompactSpace G]`, conclusion `Supernatural.ofNat (card (G ⧸ U)) ≤ profiniteOrder G` for `U : OpenNormalSubgroup G`); `Subgroup.profiniteIndex` (Index/Basic.lean:70); `OpenSubgroup.profiniteIndex_eq_ofNat_index` (:189); `Subgroup.profiniteOrder_eq_mul_profiniteIndex` (Lagrange.lean:94); `TauCeti.profiniteOrder_multiplicative_padicInt` (ProP/PadicInt/Basic.lean:170, value `primePower p ⊤`). All four Tau Ceti module paths named at README lines 50–51 exist.

**Ownership.** `roadmaps grep` for “cohomologically smooth”, “exceptional direct/inverse image”, `Rf_!`/`Rf^!` and “biduality” across the open pull requests and main: the other hits are consumers later in the merge order by the same author (`VStackSheavesAndLisseCategories`, `AnalyticStacks` at order position 307, whose README line 10 names this roadmap as the owner of the étale operations on small v-stacks, `AdicCoefficientsAndComparisons`, `BunGAndNewtonStrata` and the rest), scheme-theoretic six-functor roadmaps (#196, `DeligneWeightsAndPurity`, `EtaleDualityAndPerverseSheaves`), and `DiamondEtaleCohomology` itself, whose README line 27 and §C5.1 (line 1428) construct `f_!` only for étale `f` and defer the general operations here. No second owner exists for the five geometric targets the Scope section claims. The board packages index lists no package on this topic.

**Computed adversarial pass.** `P = Spa(C, O_C)`, `B` the perfectoid closed unit ball, `k = 𝔽₅` unless stated, `1`/`0` for a predicate true/false, tuples are stalks in the displayed point order. “Retain” means the instance supports the statement; it is not a proof.

| Statement (README line) | Instances tried | Computed left side | Computed right side / control | Result; change |
| --- | --- | --- | --- | --- |
| Compactifiable predicate (123) | `id`; `η ⊂ {η,s}`; doubled-origin ball | factorisations `id∘id`, `id∘j`; none (not separated) | 1, 1, 0 | Retain. |
| Compactifiability criterion (135) | same three | separated and `j` open: 1, 1, 0 | compactifiable: 1, 1, 0 | Both directions retain. |
| Rational-open Check (131) | `a ∈ O_C ∖ C⁺`, `U = {\|a\| ≤ 1}` | norm point: `\|a\| ≤ 1` so `η ∈ U`; closed point `s`: `\|a\|_s > 1` so `s ∉ U` | `(R,R°)`-points: `a` power-bounded so `a ↦ R°`; compactification `= X` | Retain. |
| Base change (152) | `η ⊂ {η,s}` pulled back to `η`, to `s` | `id_η`, `∅ → s` | compactifiable 1, 1 (`∅` open) | Retain. |
| v-locality on target (164) | `f = id`, `g` two-point cover; `g = ∅ → Y`, `f` doubled origin | pullback `id`: 1; pullback `∅ → ∅`: 1 | `f`: 1; `f`: 0 | Surjectivity of `g` is necessary; retained. |
| Composition (170) | `D ⊂ B ⊂ B‾ → *` | open immersion then compactifiable | composite compactifiable 1 | Retain. |
| Source locality (176) | doubled origin covered by two balls | each piece compactifiable 1 | whole map 0; separatedness hypothesis excludes it | Retain. |
| Separated étale (182) | `Fin 2 × X → X`; doubled origin | 1 | étale but not separated: 0 | Retain. |
| Cancellation (188) | `U ⊂ V ⊂ B` | `g∘f` compactifiable, `g` separated | `f` compactifiable 1 | Retain. |
| Locally split (196) | `id`; `K × X → X`; `Spa(C′) → Spa(C)` | sections `id`, `x ↦ (e,x)`, none | 1, 1, 0 (a `C`-map `C′ → C` would embed `C′` in `C`) | Retain. |
| Clopen refinement clause (196) | component `{η,s}` | open neighbourhood of `s` is the whole component | clopen neighbourhood of the component exists by compactness of `π₀` | Retain; “totally disconnected” means `π₀` profinite with local components. |
| Source descent (209) | `Z = U ⊔ U → U` | `g` split 1, `f∘g` compactifiable 1 | `f` compactifiable 1 | Retain. |
| Eligible (217) | `id`; `B → *`; `⊔ₙ Bⁿ → ⊔ₙ P`; `[*/C₂] → *` | local `dim.trg` 0, 1, `n`, undefined | 1, 1, 1 (global `∞`), 0 (fibre `[*/C₂]` not a diamond) | Retain local/global distinction. |
| Spatial-eligible (230) | `B → P`; `D → P`; `∅ → P` | qc 1, 0, 1 | 1, 0, 1 with `dim.trg` 1, 1, `⊥` | Retain. |
| Fibre-dimension bound (264) | `B` over `P`; `∅` | `dim = 1`, `⊥` | `dim.trg = 1`, `⊥`; compactification adds the `\|T\| > 1` rank-two point | Retain. |
| `Rf_!` definition (283) | `id`; `j : η ⊂ {η,s}`, `Λ ≠ 0`; finite étale degree 2 | `id`; stalks `(Λ,0)`, `RΓ = 0`; `Λ²` | `Rj_*Λ` stalks `(Λ,Λ)`, `RΓ = Λ`; `Rf_*Λ = Λ²` | Excludes `Rf_*` as wrong model. |
| Independence of compactification (302) | ball, two compactifications | `Λ(−1)[−2]` | `Λ(−1)[−2]` (`H²_c` of the disc) | Retain. |
| Classification (310) | `T = ∅, *, [0,1]`; `X = ∅` | `∅`, `X`, interval diamond | `dim.trg ⊥, 0, 0`; only `∅` | Retain; R01 renames the cited supplier clause. |
| Continuity (323) | `Zᵢ = ℤ/2ⁱ × P` | `colim Λ^{2ⁱ}` | `C⁰(ℤ₂, Λ) = Γ(ℤ₂ × P, Λ)` | Retain. |
| Topological comparison (329) | `[0,1] × P`; `S¹ × P` | `H⁰ = Λ, H¹ = 0`; `H¹ = Λ` | topological cohomology, same | Retain. |
| `2·dim.trg` bound (344) | `id`; ball, `Λ ≠ 0`; `Λ = 0` | top degree 0; 2; none | bounds 0; 2 (sharp); vacuous | Retain. |
| `3·dim.trg` bound (356) | ball; `∅` | top degree 2 | bound 3; `⊥` | Retain; R02 on the `j_*` citation. |
| QC base change (372) | `B × X → X` at a point | stalk of `R²f_!Λ` | `H²_c(B_C) = Λ(−1)` | Retain. |
| QC composition (376) | `B² → B → P` | `Λ(−1)[−2] ⊗ Λ(−1)[−2]` | `Λ(−2)[−4]` | Retain. |
| Étale agreement (380) | two-sheeted cover | `f_! = ` sum | `Rf_! = Rf_* = ` sum, no factor `1/2` | Retain. |
| Direct sums (390) | ball, family `⊕_ℕ Λ` | `⊕_ℕ Λ(−1)` | `∏_ℕ Λ(−1)` differs for `Λ ≠ 0` | Retain. |
| QC projection formula (400) | ball, `Λ = ℤ/ℓ²`, `M = 𝔽_ℓ` | `Λ(−1)[−2] ⊗^L M = M(−1)[−2]` (no Tor, rank one free) | `Rf_!f^*M = M(−1)[−2]` | Retain. |
| Hypercovers (428) | `∅`; strictly totally disconnected `X`; ball | constant object | shape (1): 1, 1, 0 (connected, many rank-one points) | Retain. |
| Proper support (448) | qc `f`; `j_{V!}Λ` on `D`; `Λ_D` | everything; in; out (stalks off `V` nonzero) | 1, 1, 0 for `Λ ≠ 0` | Retain. |
| Kan-extended `Rf_!` (460) | `D → P`, `Λ ≠ 0` | `colim_r Λ(−1)[−2] = Λ(−1)[−2]` | `Rf_*Λ = Λ` | Retain; excludes `Rf‾_*j_!` on all objects. |
| Filtered-support formula (474) | `⊔_ℕ P → P` | `⊕_ℕ Λ` | not `∏_ℕ Λ` | Retain. |
| Colimits, locally spatial base (478) | same source, family `Aᵢ` | `⊕ᵢ⊕ₙ` | `⊕ₙ⊕ᵢ` | Retain. |
| Base change, locally spatial (482) | pull back along `Fin 2 → P` | `⊕_ℕ Λ` at each point | same | Retain. |
| Support diagram (490) | constant hypercover | fibres constant, transitions `id` | homotopy-category version fails descent | Retain. |
| Fibres and coCartesian edges (510, 514) | constant hypercover | `Rfᵢ! = Rf_!` | transitions `id` | Retain. |
| `Rf_!` on small v-stacks (518) | `id`; `B → *`; `[*/C₂] → *` | `id`; `Λ(−1)[−2]`; outside class | required outputs | Retain. |
| Hypercover independence (537) | `P` by itself, by two points | `R(id)_! = id` | `id` | Retain. |
| General base change, composition, étale, projection (545–561) | `B × X`; `B²`; `D ⊂ B`; `B = Λ` | `Λ(−1)[−2]` pulled back; `Λ(−2)[−4]`; stalks `(Λ,0)`; `A(−1)[−2]` | same | Retain. |
| Exchange coherence (565) | fibres of sizes 2, 3, 2 | 12 summands, either pasting | basis vector `(i,j,k) ↦ (i,j,k)` | Retain. |
| `Rf^!` (592) | `id`; open `j`; `q : ℤ₂ × P → P`; ball | `id`; `j^*`; distributions `Hom(C⁰(T,Λ),Λ)`; `Λ(1)[2]` | `q^*Λ` has stalk `Λ`, distributions on `ℤ₂` over `k` have dimension `2^{ℵ₀}` | Excludes twisted pullback as definition. |
| Change of rings (605) | `ℤ/25 → 𝔽₅`, two-point map | `(𝔽₅,𝔽₅)` as `ℤ/25`-modules | same in either order | Retain. |
| Formal duality lemma (611) | `R = ℤ, S = ℤ/5, B = S, A′ = ℤ` | `Hom_ℤ(S,ℤ) = 0` | `Hom_S(S, Hom_ℤ(S,ℤ)) = 0`; wrong `f^! = S ⊗ −` gives `S ≠ 0` | Retain. |
| Verdier duality (629) | `Fin 2 → P`, `A = B = Λ` | `RHom(Λ², Λ) = Λ²` | `f_*RHom(Λ, Λ) = Λ²` | Retain. |
| Internal Hom (639) | ball, `A = Λ²` | `Λ²(1)[2]` | `RHom(Λ², Λ(1)[2])` | Retain. |
| Composition of `Rf^!` (645) | `B² → B → *` | `Λ(2)[4]` | `Rg^!Rf^!Λ = Λ(1)[2] ⊗ g^*Λ(1)[2]` | Retain reversed order. |
| Étale `Rf^!` (649) | `Fin 2 → P` | `Λ ↦ (Λ,Λ)` | `f^*` | Retain. |
| Exceptional base change (653) | `g = Fin 2 → P`, `f = Fin 3 → P` | `Rg^!Rf_*Λ = (Λ³,Λ³)` | `Rf′_*Rg̃^!Λ = (Λ³,Λ³)` | Retain; no condition on `f`. |
| Traces and units (667–687) | `I = Fin 2`, `k`; `I = ∅`; degree `d` | `η_*(1) = (1,1)`, `tr(1,0) = 1`, `tr∘η_* = 2`, normalised `3·2 = 1`; `0` not a unit; `d` | `η_!` = inclusions, `Σ∘η_! = id` | Retain. |
| `τ_q` not an equivalence (688) | `T = ℤ_r`, `M = ⊕_ℕ Λ` | `Γ(T, Rq^!M) = ∏_I ⊕_ℕ Λ` | `⊕_ℕ ∏_I Λ`, a proper subgroup | Retain. |
| `C⁰(S,Λ)` (708) | `S = Fin m`; `ℤ_p` over `k`; `Λ = 0` | `Λ^m`; dimension `ℵ₀`; `0` | dual dimension `2^{ℵ₀}` | Retain. |
| Profinite pushforward (718) | `S = Fin 2`, `C = Λ[0]`, `Λ ∈ {k, ℤ, 𝔽_p}`; `S = ∅`; `S = *` | `Λ²[0]`; `0`; `C` | `C⁰(S,Λ) ⊗ C`: same | Retain (previous R02). |
| Smoothness criteria (731) | finite `S`; `ℤ₂ × X`, `X ≠ ∅`; `X = ∅` | all hold; (3) fails (`R⁰q_!𝔽_ℓ` fibre `C⁰(ℤ₂,𝔽_ℓ)`); all hold | | Retain. |
| ℓ-power-torsion coefficients (750) | ball, `Λ = ℤ/ℓ²` | `Rf^!Λ = Λ(1)[2]` | `Λ(1)[2] ⊗ f^*` | Retain. |
| Direct-sum criterion (756) | ball over strictly totally disconnected `X`; `ℤ₂ × X` | both hold | both fail | Retain. |
| Coefficient conventions (770) | `Λ[1]`; `Λ = ℤ/1` | `H⁻¹ = Λ, H⁰ = 0`; `Λ[0] ≅ Λ[1]` | | Retain. |
| Invertible objects (778) | `Λ` on `*`; `Λ ⊕ Λ`; `j_!Λ`; `Λ ⊔ Λ[1]`; reduction detection on a point | degree 0; rank 2; stalk `0` at `s`; degrees `0, −1`; `M` flat over `ℤ/ℓ^m` with `M ⊗ k = k` forces `M ≅ ℤ/ℓ^m` | control `𝔽_ℓ` as `ℤ/ℓ²`-module: `Tor₁(𝔽_ℓ,𝔽_ℓ) = 𝔽_ℓ ≠ 0`, not invertible | Retain. |
| Smooth maps (794) | `id`; ball; `ℤ₂ × X`; origin | `D = Λ`; `Λ(1)[2]`; distributions; image not open | | Retain. |
| Practical criterion (812) | `⊔ₙ Bⁿ → ⊔ₙ P` | smooth, local bound `n` | global `dim.trg = ∞`; ECD's (i) fails, README's (1) holds | Retain the README's form. |
| Dualizing complex (845) | ball along `Spa(C′) → Spa(C)`; finite étale; `ℤ_r × X` | `Λ(1)[2] ↦ Λ(1)[2]`; `Λ`; distributions | | Retain. |
| Perfect-constructibility (858) | ball; `S` infinite, `Λ ≠ 0`; `Λ = 0` | `Λ(−1)[−2]` perfect; `C⁰(S,Λ)` not f.g.; perfect | | Retain. |
| Universal openness (868) | origin `i`; open immersion | image `{0}` not open | open | Retain. |
| Base change, v-locality, composition, descent (876–894) | `B × X`; `Spd ℚ_p` from `P`; `Bⁿ`; chart pulling back to a ball | smooth; smooth; `Λ(n)[2n]`; smooth | | Retain. |
| Smooth base change and exchange (902–918) | `g = id`; `g` finite étale; `g` infinite profinite | identity; sheetwise; no claim | | Retain; eligibility of `f` added at 912 is needed for `Rf^!` to exist. |
| Ball (940) | `Spa(C,C⁺)` | `B = C⁺` | `B‾ = O_C ≠ C⁺` when `C⁺ ≠ O_C`; `dim.trg 1` | Retain. |
| Tate twists (959) | `Λ = 𝔽₂`, `p` odd, `n = 4` vs `2`; `Spd ℚ_p`, `p ≢ 1 (ℓ)` | square map `μ₄ → μ₂` iso on twists; `H⁰(𝔽_ℓ(1)) = 0` | inclusion `μ₂ ⊂ μ₄ = (μ₄)²` gives `0` mod 2; `𝔽_ℓ(1) ⊗ 𝔽_ℓ(−1) = 𝔽_ℓ` | Retain. |
| Ball is smooth (973) | `B × P` | `R²f_!Λ(1) = Λ`, `D = Λ(1)[2]` | criterion (3) from the supplier's unbounded open-coefficient duality | Retain. |
| Profinite quotients (988) | trivial action; translation on `K × X`; `K = ℤ_r` | `q = id`; quotient `X`, `q` finite étale for finite `K`; `q` not étale (infinite fibre) | | Retain. |
| Unit quotient orders (1006) | `K = ℤ_p`, `ℓ = 5`, `p = 2`; `K = ℤ_ℓ`, `Λ = 𝔽_ℓ`; trivial `K` | order 2, inverse 3; order `ℓ = 0`; 1 | hypothesis excludes `ℤ_ℓ` | Retain. |
| Averaging (1017) | `K = ℤ/2` free over `k`; `ℤ_r` on `ℤ_r × X`; compatibility `H′ ⊂ H ⊂ K` | `α_q = 3·id`, `tr∘η_* = 3·2 = 1`; not an equivalence; `[K:H′]⁻¹[H:H′] = [K:H]⁻¹` | canonical identification would give `1`, not `3` | Retain. |
| Free quotients (1032) | trivial `K`; `ℤ/m`; `ℤ_p`-torus | identity; scaled by `m⁻¹`; smooth quotient, `q` not smooth | | Retain. |
| Distributions (1044) | `S` finite; `S = ℤ_r`, `Λ = 𝔽_ℓ`; `Λ = 0` | `Λ^S = q^*Λ`; Dirac `δ_x` not a density (a density integrating to `0` on clopens avoiding `x` vanishes near `x`); `0` | | Retain. |
| Non-free quotients (1056) | trivial action; `m = 2` over `k`; stalk argument | `∫1 dμ = 1`, identity; scalar 3; `q_*β` splits `D_g` so `β ≠ 0` at every stalk, equal shifts, isomorphism | | Retain. |
| Relative-ball approximation (1072) | `X′ = X`; zero section in `B_K`; infinitely many coordinates; limit identification | `n = 0`; `∩_m {\|T\| ≤ \|ϖ\|^m}` is the zero section since `∩ ϖ^m R⁺ = 0`; `nᵢ` unbounded; `\|T_{a+b} − T_a − T_b\| ≤ \|ϖ\|^m` for all `m` forces equality in `R⁺` | so a compatible family is a ring map `A′⁺ → R⁺` | Retain. |
| Smooth analytic maps (1084) | torus over `C_p`; characteristic `p`; over `ℤ_p^cycl` | `T̃/ℤ_p`; open in a ball; non-free quotient with smooth fibres | | Retain. |
| Cyclotomic torsor (1090) | `p` odd; `p = 2` | `\|Δ\| = p−1`, `u` of order `p−1`, `G = 1+pℤ_p`; `δ(t) = t/(1+t)` in characteristic 2, `u = t²/(1+t)` of order 2, `G = 1+4ℤ₂ ≅ ℤ₂` | full `ℤ_p^×` has torsion, so `Δ` must be removed | Retain. |
| `Spd ℚ_p` (1105) | pull back to `P`; `p = 2`, `ℓ` odd | `D^×_C/ℤ_p`; pro-order `2^∞` prime to `ℓ` | | Retain. |
| Geometric-base criterion (1117) | `id`; `B × X`; origin `i ⊂ B_C` | both hold; `d = 2`; `Ri^!𝔽_ℓ = 𝔽_ℓ(−1)[−2]` invertible | `τ_i` on `i_*𝔽_ℓ`: source `𝔽_ℓ(−1)[−2]`, target `𝔽_ℓ`, so (2) fails | Retain. |
| Verdier dual (1151) | point; ball; rational open over `Spa(C,C⁺)`; shift; smooth pullback | linear dual; `Λ(1)[2]`; `RHom(j_!𝔽_ℓ,𝔽_ℓ) = Rj_*𝔽_ℓ = 𝔽_ℓ`; `𝔻(A[1]) = 𝔻A[−1]`; `𝔻_{X′}(g^*A) = D_g ⊗ g^*𝔻_X A` from `D_{f∘g} = D_g ⊗ g^*D_f` | | Retain. |
| Biduality (1166) | `j_!𝔽_ℓ` on ball; `A = coker(j_!𝔽_ℓ → 𝔽_ℓ)`; point, `𝔽_ℓ²` | reflexive; stalks `(0 on U, 𝔽_ℓ on Z)`, `Z` closed constructible and nonopen; evaluation iso | triangle reduces `A` to `j_!𝔽_ℓ` and `𝔽_ℓ` | Retain (previous R01 repaired). |
| Finiteness (1182) | ball; annulus; `⊔_ℕ P` | `H⁰ = 𝔽_ℓ`; `H¹ = 𝔽_ℓ(−1)`; `H⁰ = ∏_ℕ 𝔽_ℓ` infinite | quasicompactness needed | Retain. |
| ℓ-power-torsion coefficients (1192) | `ℤ/ℓ²` on ball | `RΓ = Λ` perfect, self-dual | `Rj_*Λ = Rj_*ℤ/ℓ^m ⊗^L Λ` | Retain. |
| Failure over `Spa(C,C⁺)` (1198) | rank 2 (quiver model `s → η`); infinite rank | `j_!Λ = P_η = (0 → Λ)`, double dual `Λ = (Λ → Λ)`; convex subgroups `Γ_{>n}` of `⊕_ℤ ℚeᵢ` have no largest proper member, so no height-one prime and `η` not open; `v(x₀⁻¹) = −e₀ < 0` so `a ∉ C⁺` | | Retain. |
| Zariski–Riemann closed points (1212) | `K = k`; `K = k(t)`; `k = ℝ`, `K = ℝ(t)`; chain intersection | one point; closed points = local rings of `P¹_k`, trivial valuation not closed; `t²+1` point has residue `ℂ`, minimal; `x ∉ V_α ⇒ x⁻¹ ∈` every member | specialisation = inclusion `V′ ⊆ V`, so closed = minimal | Retain. |
| Jacobson detection (1224) | discrete; Sierpiński; `Spec ℤ` | stalkwise; `j_!M` nonzero with zero stalk at `s`, `{η}` locally closed without closed point | Jacobson; not Jacobson; Jacobson | Retain. |
| Closed points on proper perfectoids (1234) | `X = S`; component with `C′⁺` from `k[t]`; `S × P` | one point; compactification space `ZR(k′/k)` contains the valuations above `t = ∞`; all points closed | | Retain. |
| Conservativity (1248) | point, unbounded `A`; `∅`; rank-2 skyscraper | `∏ᵢ Hom(Hⁱ, 𝔽_ℓ)` detects; trivial; dual `0` | base excluded | Retain. |
| Failure of conservativity (1260) | quiver model; rank 3; `Λ = 0` | `i_*Λ = I_s`, `Λ = I_η` injective, `Hom(I_s,I_η) = 0`, `Ext^{>0} = 0`; stalk of `j_{s!}Λ` at `t` is `Λ`, of `j_{η!}Λ` is `0`; both zero | | Retain. |
| Conditional conservativity (1270) | `𝔽_ℓ[[t]]`, `M = 𝔽_ℓ((t))`; `O_K`, `K` spherically complete nondiscrete; `ℤ/ℓ^m` | `(bₙ) ↦ (bₙ − t bₙ₊₁)` bijective on `∏Λ`, inverse `Σⱼ tʲ aₙ₊ⱼ`, so `RHom = 0`; `Hom(k,O_K) = 0`, `Ext¹ = (O_K : 𝔪)/O_K = 0` as `𝔪` is not principal, `Ext^{≥2} = Ext^{≥1}(k, K/O_K) = 0`; self-injective cogenerator | DVR control: `Ext¹(k,R) = 𝔪⁻¹/R ≅ k ≠ 0`, so nondiscreteness is needed | Retain. |

Rows: 88. No row refuted a statement; no change to the README is required by this pass beyond the four P3 notes.

## Not verifiable

- **Hub96**, Huber, *Étale cohomology of rigid analytic varieties and adic spaces* (1996): paywalled; the sources service reaches only the publisher page. Corollary 1.6.10 (p. 80), Proposition 5.5.8 (p. 304 here, pp. 307–308 in the supplier: R03), Theorem 6.2.2 (p. 329), Theorems 7.2.2 (p. 368), 7.5.3 (p. 390) and Lemma 7.5.4 (pp. 391–396) remain uncertified. The corresponding supplier contracts in `ClassicalAdicEtaleCohomology` §§8.4, 9.2, 9.6, 10.5 were read instead; that is not certification of the printed pages.
- **Sch92**, Scheiderer, *Quasi-augmented simplicial spaces* (JPAA 81, 1992), Corollary 4.6: paywalled. The bound is consumed through `DiamondEtaleCohomology §C8.44`, which cites KST Lemma 6.6; the original was not read.
- **SGA4**, Exposé VI, Corollaire 5.2: the sources service found no legal copy under the citation or the institutional URL tried in this run (the previous review read it from an institutional archive). The statement (cohomology of a coherent topos commutes with filtered colimits) is standard and the README's use of it at line 390 is the standard one; the request is recorded in the job's `needs-references.toml` for the worker and does not block this verdict.

## Source issues

- **Error** in ECD at Proposition 23.10(i), printed p. 145: the source says smoothness is equivalent to conditions including one global finite bound on `dim.trg`; it should be a finite bound after each strictly totally disconnected test, since `⊔ₙ Bⁿ → ⊔ₙ Spa(C,O_C)` is smooth with infinite global `dim.trg`; affects a stated result.
- **Error** in ECD at Proposition 23.16(iii), printed p. 151: the source says only `g` smooth and `Λ` ℓ-power torsion while using `Rf^!` and `Rf′^!`; it should also assume `f` compactifiable, representable in locally spatial diamonds with locally finite `dim.trg`; affects a stated result.
- **Gap** in ECD at Proposition 23.17, printed p. 151: the source says the internal-Hom exchange for an unspecified `Λ`; it should carry the ℓ-power-torsion hypothesis of Proposition 23.12 that its proof uses; affects the proof.
- **Gap** in ECD at the proof of Lemma 23.6, printed p. 144: the source says the arbitrary-ring statement follows from the projection formula 22.11; that formula needs `nΛ = 0` with `n` prime to `p`, so the cases `Λ = ℤ`, `Λ = 𝔽_p` need the continuity argument instead; affects the proof.
- **Gap** in ECD at the proofs of Propositions 24.2 and 24.3, printed pp. 153 and 155: the source says it suffices to check the averaging comparison for `Λ = 𝔽_ℓ`; it should state that `Λ` is ℓ-power torsion for this reduction; affects the proof.
- **Gap** in ECD at the proof of Theorem 22.5, printed p. 130: the source says `j_*` is exact by Remark 21.14, which is stated for maps of locally spatial diamonds, while the compactification is not known to be locally spatial; it should add the base change to a strictly totally disconnected cover; affects the proof.
- **Error** in ECD at Remark 25.2, printed p. 158: the source says `Spa(C, O_C) → Spa(C, C⁺)` is an open immersion for any `C⁺ ≠ O_C`; at infinite rank the norm point need not be open, and a nonempty proper rational open should be used; affects a stated result.
- **Misprint** in ECD at Remark 25.3, printed p. 158: the source says `RΓ(X, A)` is a perfect complex of `A`-modules; it should be `Λ`-modules; affects nothing.
- **Misprint** in ECD at Proposition 25.4, printed p. 161: the source says `C` algebraically closed nonarchimedean; it should say complete, as in Theorem 25.1; affects nothing.
- **Error** in ECD at Remark 25.6, printed p. 161: the source says `Λ = O_K` with `K` spherically complete gives `RHom(k, Λ) = 0`; for a discretely valued `K` one has `Ext¹(k, O_K) ≅ k ≠ 0`, so nondiscreteness is needed, and `O_K` is killed by an integer prime to `p` only when `K` has characteristic `ℓ ≠ p`; affects a stated result.
