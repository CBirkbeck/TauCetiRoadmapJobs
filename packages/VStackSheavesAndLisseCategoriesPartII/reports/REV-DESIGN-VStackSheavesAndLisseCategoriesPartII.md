<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/441#issuecomment-6366979305 -->
Review (claude) of 0987ba7

Verdict: needs changes

1. **F01** (P1) The Liu–Zheng gap has no supplier and no target depends on it

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json:4925`: gap `VS-PII/G-liu-zheng` has no `supplier`, `section` or `needs` field. `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:2470`: “Liu–Zheng enhanced operation maps and DESCENT have no owner.” The machinery is used at README lines 730 and 771. The *Needs:* lines at 734 and 777 leave it out.

   **Claim:** VS7.4–VS7.5, and with them every stacky target in VS7–VS11, can rest on these inputs as an open gap.

   **Witness:** Brief rule: a gap with supplier `none` is unowned (P1). No plan node lists `gap:VS-PII/G-liu-zheng`. A board-issue search for “EnhancedDerivedSheaves” titles returns 0. On main, EnhancedDerivedSheaves uses Liu–Zheng only for its §E3.4 ringed diagrams.

   **Exact repair:** Give the inputs an owner, in one of two ways.
   - (a) Plan them here as targets of a new first layer, each with its own statement and locator, and record both Liu–Zheng papers in the manifest. The targets are: the enhanced operation map datum; the partial adjoint theorem (arXiv:1211.5948, Proposition 1.4.4); the gluing of restricted nerves (arXiv:1211.5294, Theorem 5.4 and Corollary 0.4); and DESCENT (arXiv:1211.5948, Theorem 4.1.8(1), in the form of GHW22 Theorem 4.9).
   - (b) Name an existing earlier roadmap section that states them.

   If a gap remains, split `needs` into one sentence per result (four results, not one) and give it `supplier` and `section`. Delete the narrative from `needs` (“Restructure proposal 2…”, “read here only as cited…”). Add the gap, or the new targets, to the prerequisites of VS7.4 and VS7.5. Test: VS7.5 step 3 must then cite an owned target for GHW22 Theorem 4.9.

2. **F02** (P1) The representability gap has no supplier and no target consumes it

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json:4934` and README line 2471. README line 552 says: “the general case is recorded as a gap and is not needed by any target here.”

   **Claim:** `VS-PII/G-lsep-representability` is a supplier contract needed by VS6/proper-nice-maps.

   **Witness:** Its supplier is `none` (P1 by the brief's rule). The prerequisites of VS6/proper-nice-maps contain no gap, and README line 552 says no target needs it. Its `detail` combines a claim about HKW22, a non-example and a reduction.

   **Exact repair:** Delete the gap from `plan.json` and from “Open inputs”. Keep the restriction as one sentence in Conventions or in Scope and ownership: proper 2-morphisms and proper pushforwards are proper nice. That sentence should also say that Rf_! ≅ Rf_* for arbitrary proper fine maps (HKW22 Theorem 4.1.8) is not claimed, because representability of proper fine maps in locally spatial diamonds is not established; this is recorded under Source issues. If the general case is wanted, plan it here as a target with its own statement. Test: VS6.11 step 5 then cites no gap, and no `neededBy` field points at VS6.

3. **F03** (P1) A Check gives a false reason why the point of [S/Z_p] is not a chart

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:279` (also `plan.json:519`): “it is not cohomologically smooth (its dualizing object is the noninvertible sheaf of distributions; parent VS0/point-to-classifying-stack-not-smooth)”.

   **Claim:** For q : S → [S/Z_p], Rq^!Λ is the noninvertible sheaf of distributions.

   **Witness:** VS8.7 (line 1187) gives Rq^!Λ = Haar(G, Λ), which VS8.5 (line 1121) makes free of rank one. Directly, Rq^!Λ = lim(Λ, ·p) ≅ Λ. FS21 Remark IV.1.10 (p. 110) places the distributions on the pullback G → ∗, not on q. The Check at README line 863 calls Haar(Z_p, Λ) invertible.

   **Exact repair:** Replace the parenthesis with this: the base change Z_p × S → S has the noninvertible sheaf of distributions as dualizing object (FS21 Remark IV.1.10). Rq^!Λ = Haar(Z_p, Λ) ≅ Λ is invertible, but its formation does not commute with that base change. Tested: q^!Λ ≅ Λ. On the base change, the germs at 0 of δ₀ and of the Haar measure are independent, so the dualizing sheaf is not of rank one.

4. **F04** (P2) The 2-cells of trace functoriality and of the relative trace formula point the wrong way

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:1365`: “For a square e′ ∘ f ⇒ f ∘ e”. Line 1373: “coev_X ⇒ (f ⊗ f^{!∨}) ∘ coev_{X′} … ev_{X′} ∘ (f ⊗ f^{!∨}) ⇒ ev_X”. Line 1766: “p̃ filling the square 𝔣′ ∘ 𝔮 ⇒ 𝔮 ∘ 𝔣”. Line 1777: “coev_{𝔛′} ⇒ (𝔮 ⊗ 𝔮^∨) ∘ coev_𝔛”. The same text is at `plan.json:2730`, 2735, 3574 and 3582.

   **Claim:** With these directions and f right adjointable there is a morphism tr(e) → tr(e′), and the proper map p supplies the 2-cell.

   **Witness:** LZ22 Construction 1.7 (pp. 5–6) uses f∘v ⇒ v′∘g and (1.3): (f⊗f^{!∨})∘coev_X ⇒ coev_{X′}. Lemma 1.11 (p. 8) and VS9.3 (line 1391) use g∘c ⇒ c′∘f. In VS10.3 with Y = ∅, p gives ∅ → X, but the stated direction needs X → ∅.

   **Exact repair:**
   - VS9.2: state the result for a 2-cell f ∘ e ⇒ e′ ∘ f. In step 1, write (f ⊗ f^{!∨}) ∘ coev_X ⇒ coev_{X′} (from the counit) and ev_X ⇒ ev_{X′} ∘ (f ⊗ f^{!∨}) (from the unit). Note that step 1 as written does not even compose.
   - VS10.1: state the 2-cell as p̃ : 𝔮 ∘ 𝔣 ⇒ 𝔣′ ∘ 𝔮, and the first triangle as (𝔮 ⊗ 𝔮^∨) ∘ coev_𝔛 ⇒ coev_{𝔛′}.
   - Add a Check: for X = P¹_C, X′ = C′ = S and the empty correspondence, the 2-cell is the proper map ∅ → X and both sides of the trace formula are 0.

   Tested: with Y = ∅ the corrected 2-cell exists (the unique map ∅ → X), and tr(0 | RΓ) = 0 = ∫_∅.

5. **F05** (P2) The 1-categorical trace re-plans PivotalSpherical and AdicSpacesPartIII

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:1318`: “In a symmetric monoidal 1-category this is the trace of an endomorphism of an object with an exact pairing”. Also the API bullets and Checks at lines 1344–1359, line 1447 (“LinearMap.trace on each P^i”), line 2475 (“Keep these three nodes as the single owner of the generic prefix”), and the Lean plan at line 2487.

   **Claim:** No roadmap owns the generic trace, so VS9.1 is its single owner, and Mathlib's `LinearMap.trace` computes the traces of projective terms.

   **Witness:** `TauCetiRoadmap/PivotalSpherical/README.md:318` (traces, cyclicity, monoidality) and line 496 (symmetric trace formula; traces equal linear traces). `TauCetiRoadmap/AdicSpacesPartIII/README.md:662` (`LinearMap.projectiveTrace_eq_categoricalTrace`). For Λ = ℤ/6 and P = 3ℤ/6, tr(id_P) = 3, but `LinearMap.trace` gives 0 (`Mathlib/LinearAlgebra/Trace.lean:75`).

   **Exact repair:**
   - In Scope and ownership, import two things. First, PivotalSpherical Layers 2 and 7: the trace in symmetric rigid categories, its cyclicity, multiplicativity and unit value, and the comparison with linear traces. Second, AdicSpacesPartIII R3.8 (*projective-module-trace*, *projective-trace-realization*) for traces of finite projective modules.
   - Keep in VS9.1–VS9.3 only the statements about symmetric monoidal bicategories (Lu–Zheng §1), and say in one clause how they extend PivotalSpherical's trace.
   - Delete the restated 1-categorical bullets and Checks: `categoricalTrace_comp_comm`, `_tensor`, `_id_tensorUnit`, `_eq_of_exactPairing`, `_fgModule` and `_id_fgModule`.
   - In VS9.4, take the Euler-characteristic trace with the projective-module trace, not `LinearMap.trace`.
   - Restrict restructure proposal 1 (`plan.json`) and README line 2475 to the bicategorical prefix.

   Tested on ℤ/6 with P = 3ℤ/6: the projective-module trace of id is 3 on both sides.

6. **F06** (P2) VS9.4 cites EnhancedDerivedSheaves for a theorem that roadmap does not state

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:1445`: “(c) ⇔ (d) ⇔ (e): EnhancedDerivedSheaves E5:spectra-comparison/perfect-modules (perfect = compact = dualizable).” Also README line 16 and `plan.json:2888` and 2897.

   **Claim:** EnhancedDerivedSheaves §E5:spectra-comparison supplies perfect = compact = dualizable in D(Λ).

   **Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1842–1895` states only Mod_{HR}(Sp) ≃ D(R) and comparisons with concrete spectra. Its “dualizable” at line 1746 is about presentable categories. Compact = perfect is `TauCetiRoadmap/DGAInfinity/README.md:455–458`. No roadmap states dualizable ⇔ perfect.

   **Exact repair:**
   - Repoint (d) ⇔ (e) to DGAInfinity Layer 5: compact objects are the perfect modules (Keller).
   - Make (c) ⇔ (e) a target proved here from HKW22 Lemma B.1.2(2), p. 73; its compact-implies-perfect step cites Stacks Tag 07LT.
   - Correct README line 16 so that it no longer says EnhancedDerivedSheaves supplies “perfect = compact = dualizable modules”.

   Tested on Λ = ℤ and M = ℚ[0]: M is not compact, not dualizable and not perfect, and each of the three implications now has an owner.

7. **F07** (P2) EtaleDualityAndPerverseSheaves has no “EDC.8”, and its local terms cover fewer coefficient rings

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:138–141` and line 1973. Line 2004: “The scheme-theoretic local term is that of EtaleDualityAndPerverseSheaves EDC.8 for the finite-type models”. Also line 2014 and `plan.json:3760` and 4083.

   **Claim:** EDC.8 supplies scheme correspondences, cohomological correspondences, pullback and restriction, and local terms, for every Λ with nΛ = 0.

   **Witness:** At the head of its open roadmap pull request the README has no “EDC” label; the content is Layer 6, §§6.1–6.3 (README lines 6216–6600). The §6.2–6.3 hypotheses (line 6292) take Λ finite and killed by a power of ℓ, or finite over ℤ_ℓ or ℚ_ℓ, and F in D^b_ctf. Λ = F_ℓ[t] satisfies VS10.8 but not §6.3.

   **Exact repair:**
   - Repoint the four citations: §6.1 (correspondences and Fix), §6.2 (cohomological correspondences and their composition), §6.3 (trace map and local terms).
   - For “pullback and restriction”, name the §6.x target that carries it, or plan it here.
   - Restrict VS10.8, and the comparison in VS10.7, to the coefficient range of §6.3. Alternatively, declare a gap with EtaleDualityAndPerverseSheaves §6.3 for arbitrary n-torsion Λ and f-ULA F.

   Tested: Λ = F_ℓ[t] is excluded after the repair.

8. **F08** (P3) Other supplier and library identifiers do not resolve at the heads and pins

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:75–111` (DiamondSixOperations slugs), lines 128–134 (EnhancedDerivedSheaves slugs), line 145 (“SF.0/perfection-universal-homeomorphism”), line 62 (the `TauCeti.IsSmoothDiscrete` file), and the `plan.json` baseline (mathlib `082e2d3`, tauceti `f790474`).

   **Claim:** The cited targets exist under these identifiers, and the declarations were read at the pinned commits.

   **Witness:** 34 of the 37 DiamondSixOperations slugs, all 7 EnhancedDerivedSheaves slugs and “SF.0” occur nowhere in those READMEs. The lake-manifest pins mathlib `6b7abb3` and TauCeti `a91d3aa`. At that pin, `IsSmoothDiscrete` lives in `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`.

   **Exact repair:**
   - Cite DiamondSixOperations by its section numbers or Lean names (for example S0.2 for permanence of compactifiability, S1.3, S2.4, S4.2–S4.5, S5.3–S5.5).
   - Cite EnhancedDerivedSheaves by section: §E1.4, §E2.6 (`hypercoverDescent`), §E3.2, §E3.4 and §E5:abstract.1.
   - Cite SchemeAndStackFoundations by §0.24 (`perfection_universalHomeomorphism`) and §0.23a.
   - Update the IsSmoothDiscrete path and re-pin the baseline. All 21 Mathlib declarations exist at `6b7abb3`; their lines shift, for example `SymmetricCategory` to 366 and `Module.Finite` to 121.
   - Remove the VS6.8 Check citation “S4/etale-maps-smooth”, which is neither a prerequisite nor present in the supplier.

9. **F09** (P3) Several objects are restated instead of cited

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:1243` (“Rf_*M is derived G-invariants RΓ(G, M)”), line 2054 (“RHom(M, Λ) is the derived smooth dual”), line 2044 (“Such M are called admissible”), lines 1121 and 1144 (Haar(G, Λ)) and line 1462 (the reflexivity criterion).

   **Claim:** These are new objects or statements of this roadmap.

   **Witness:** The parent's VS4 *classifying-stack-equivalence* (its README line 1233) already gives derived invariants and the derived smooth dual. SmoothRepresentationsOfLocalGroups defines admissible complexes in *derived-smooth-dual* (line 1737) and `HaarMeasureWithValues` (line 1034). `Module.IsReflexive` is at `Mathlib/LinearAlgebra/Dual/Defs.lean:212`.

   **Exact repair:**
   - Cite the parent's VS4 target for Rf_* in VS8.9 and for M^∨ in VS11.1.
   - In VS11.1, cite SmoothRepresentationsOfLocalGroups for “admissible”.
   - In VS8.5, take `HaarMeasureWithValues` as the carrier and keep only the module, rank-one and modulus statements.
   - State VS9.5 as `Module.IsReflexive (R ⧸ 𝔪^k) M ↔ Module.Finite (R ⧸ 𝔪^k) M`. Cite `Module.instFiniteDimensionalOfIsReflexive` (`Mathlib/LinearAlgebra/Dual/Lemmas.lean:284`) as the case k = 1, and the finite-projective instance at line 262 of the same file.

   Tested: the case k = 1 is exactly the Mathlib instance.

10. **F10** (P3) Some Checks fail in degenerate cases or leave a convention open, and one proof step skips a hypothesis

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:1839` and line 1884 (“g(z) = 2z”). Lines 2132 and 2443 (“G = Z/2, Λ = Z[1/2]”). Line 1155 (“|p|^{±1}”). Line 1427 (“F(X)^op-enriched”). Line 294 (“Pick a chart U → X. Fargues–Scholze Remark IV.1.4(ii)”).

   **Claim:** Each item is valid and discriminating under the stated hypotheses.

   **Witness:**
   - When p = 2 and C has characteristic 2, the map z ↦ 2z is zero.
   - The trace-distribution Check needs nΛ = 0, with n odd because ℤ/2 is pro-2; ℤ[1/2] is torsion-free.
   - For the ax+b group, right translation by diag(p, 1) scales the left Haar measure by |p|⁻¹.
   - FS21 Remark IV.1.4 needs a separated chart.

   **Exact repair:**
   - Replace 2 by any a ∈ C^× ∖ {1}. The local terms stay 1 because 1 − a ≠ 0 and 1 − a⁻¹ ≠ 0, and their sum stays 2.
   - Use Λ = F_3; the values 1 and −1 are unchanged.
   - Pin the action as (g·μ)(E) = μ(Eg) and state the value |p|⁻¹ = p.
   - Restate the C_F Check as “endomorphisms of (X, L) over id_X are End_{F(X)}(L)” and rename it.
   - In VS6.3 step 1, pick the clean chart of VS6.2 first.

11. **F11** (P3) “Proper” is overloaded, and VS10.6 narrows its base and disagrees with VS10.5

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:539` (“the word proper … means proper nice”), line 1798 (“p is proper and fine”), line 1824 (“Y → S is proper”), line 1852 (“proper over S”) and line 1937 (“S is a small v-sheaf (decent), T → S a map”).

   **Claim:** The hypotheses match the statements.

   **Witness:** The statement of VS10.2 (line 1793) says “proper nice”, but its hypothesis says “proper and fine”, which is the generality README line 552 calls unestablished. HKW22 Proposition 5.3.1 (p. 49) allows any small v-sheaf S with data representable in nice diamonds. VS10.5 requires T decent; VS10.6 does not.

   **Exact repair:**
   - Write “proper nice” explicitly in VS9.6 and VS10.1–VS10.6, and delete the overloading sentence.
   - In VS10.6, either use HKW's generality (small v-sheaves S and T, with data representable in nice diamonds, through the representable operations of DiamondSixOperations) or require T decent, as VS10.5 does.

12. **F12** (P3) The Suggested-file section describes a missing file at unpinned commits and plans padding

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:2487`: “The suggested file … states … the categorical trace … smooth modules … the reflexivity criterion … elaborates against Mathlib `082e2d3` and Tau Ceti `f790474`”.

   **Claim:** A `Suggested.lean` exists, elaborates at the pins and states the acceptance test.

   **Witness:** The design folder holds only README.md and plan.json, and the pins are `6b7abb3` and `a91d3aa`. The planned declarations are generic lemmas, not headlines. The headlines (VS10.1, VS11.4, VS11.9, VS11.12) need small v-stacks, D_ét and symmetric monoidal bicategories, none of which exist at the pins.

   **Exact repair:** Replace the section with the plan for the module docstring. It names each headline as not statable, with its missing carrier, and states nothing in its place. The headlines are: the relative Lefschetz–Verdier formula; characteristic class equals trace distribution; the Künneth formula for characteristic classes; and characteristic class on [X/G] equals universal local term. The missing carriers are small v-stacks and diamonds, D_ét, symmetric monoidal bicategories and CoCorr_S. Delete the planned trace, smooth-vector and reflexivity declarations; the README keeps them as targets.

13. **F13** (P3) Process residue and catalogue format remain in the README

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:17` (“identifiers of its atlas plan”); lines 189, 600, 978, 1312, 1760 and 2038 (“shown in the atlas”); lines 252, 477, 801, 827, 1471, 1824, 2424, 2432 and 2492 (“sourceIssues”); line 1482 (a Check naming “the suggested declaration”); line 1543 (“misprint E14”); line 1668 (“HKW extraction brief”); line 2470 (“Restructure proposal 2”); line 2475 (“PAPER-ABE-25 … under revision … If the maintainer prefers”).

   **Claim:** The README is timeless prose in house style.

   **Witness:** These phrases refer to tooling, jobs and reviews. House style also forbids field lists (*Hypotheses.*, *API.*, *Uses.*) and Lean names on Checks, and about 380 bullets carry backticked names.

   **Exact repair:**
   - Delete these phrases, and point to “Corrections to the sources” instead.
   - At the package stage, convert the field lists to prose. Keep backticked names only for `Suggested.lean` declarations, and remove Lean names from Checks.
   - Move the gaps into “Exact supplier contracts” in the intake form, and fold “Boundaries with neighbouring roadmaps” into Scope and ownership without proposals.

14. **F14** (P3) There is no sources manifest, and two cited works are unrecorded

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/sources.toml` (absent from the design); README line 2496 (the Liu–Zheng papers).

   **Claim:** Every cited work is recorded in the manifest.

   **Witness:** The design recorded its sources only in `plan.json`. This review's fetches created the manifest with HKW22 (DOI and arXiv v4), GHW22, LZ22, Sch17 and FS21. arXiv:1211.5948 and arXiv:1211.5294 are still unrecorded.

   **Exact repair:** Keep the five entries, aligning `cited_for` and the locators with the targets. Add both Liu–Zheng papers with their locators; R01 needs them.

Reviewed on 2026-10-23. There are fourteen findings. Seven are blocking: three P1 and four P2. There was no previous review. The design does not re-plan its parent roadmap. The geometric layers VS6–VS8 and VS10–VS11 are new relative to *Artin v-stacks, solid and lisse coefficient categories*. The design is repairable. The design files were not changed. The sources service created `packages/VStackSheavesAndLisseCategoriesPartII/sources.toml` with five entries when the cited texts were fetched (see R14). Elaboration: not available (this lane does not elaborate). The design package has no `Suggested.lean`, so the `#check @name` binder comparison could not be run.

## Verified sound

### Seeded sample (15 targets; seed = job id; none chosen by heading)

Each target was checked for statement number, printed page, hypotheses and match. All 15 pass on locators; trace-functoriality also carries R04.
- **VS6 decent-is-artin:** GHW22 Prop 4.4, p. 20; HKW22 p. 24 list; FS21 Rem IV.1.4(ii), p. 108.
- **VS6 fine-permanence:** GHW22 Prop 4.8(o)–(iv), pp. 23–26; HKW22 footnote 4, p. 28.
- **VS7 enhanced-operations-for-qcqs-v-sheaves:** GHW22 Thm 3.14 and Prop 3.15, p. 17; proof, p. 18; Prop 3.16, p. 19.
- **VS7 fine-six-functor-identities:** HKW22 Thms 4.1.4–4.1.5, pp. 22–23; Thm 4.1.8, p. 24; GHW22 Thm 1.4 (1)–(5), pp. 3–4; HKW22 Def 4.3.4, p. 30.
- **VS7 diagonal-dualizing-complex:** HKW22 Lemma 4.1.11 and (4.1.3), pp. 24–25.
- **VS8 smooth-and-complete-modules:** HKW22 B.2, Def B.2.1 and Lemmas B.2.2–B.2.3, pp. 73–74.
- **VS9 trace-functoriality:** LZ22 Constructions 1.7–1.8, pp. 5–7; Remark 1.9, p. 7; HKW22 proof of Thm 4.3.8, p. 33.
- **VS9 perfect-complexes-are-dualizable:** HKW22 Ex 4.3.2, p. 28; Lemma B.1.2(2) (a)–(e), p. 73.
- **VS9 correspondence-bicategory:** HKW22 Def 4.3.3, pp. 28–29; LZ22 Remark 2.7 and Lemma 2.9, pp. 13–14.
- **VS9 cohomological-correspondence-bicategory:** HKW22 Def 4.3.4, pp. 29–30; ΩCoCorr, p. 31; LZ22 Construction 2.6, Remark 2.7 and Lemma 2.8, pp. 13–14.
- **VS9 inertia-and-characteristic-class:** HKW22 Def 4.3.6, p. 32; LZ22 Notation 2.20, p. 18; Remark 2.24, p. 20.
- **VS11 modified-kunneth-map:** HKW22 Def 4.5.1 and (4.5.1), pp. 36–37 (HKW22 line 1803).
- **VS11 based-fibre-product-coherence:** HKW22 (4.5.8)–(4.5.9), p. 40, with no proof given (HKW22 line 1966).
- **VS11 inertia-of-quotient-stack:** HKW22 §4.6, pp. 41–42.
- **VS11 characteristic-class-of-quotient-is-universal-local-term:** HKW22 Thm 4.6.1 and (4.6.1)–(4.6.4), pp. 42–43.

All ten entries of “Corrections to the sources” were confirmed against the texts (HKW22 lines 1072, 1153, 1184, 1403, 1508, 1639–1646, 1995, 2140–2143, 2331, 3528; GHW22 Thm 1.4). GHW22 v1 is the only version (arXiv listing).

### Adversarial table (one row per statement)

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conv. Λ: nΛ = 0, n prime to p | ℤ/6 with p = 5; ℤ[1/2] | n = 6 is valid; ℤ[1/2] has no such n | ok; violated by a Check (R10) |
| Conv. duality orientation | Mathlib `ExactPairing` (Rigid/Basic.lean:77–106) | coev 𝟙→X⊗Y, ev Y⊗X→𝟙, as in LZ22 Def 1.1 | ok; σ needed in the trace |
| Conv. Haar action | ax+b group, diag(p,1) | left Haar \|a\|⁻²da db scales by \|p\|⁻¹ | unpinned (R10) |
| Conv. “proper” | VS10.2 | statement says nice, hypothesis says fine | R11 |
| VS6.1 lsep representability | id; open U⊂X; [S/G]→S | fibres T; open in T; [T/G_T] not 0-truncated | ok |
| VS6.2 decent v-stack | Spd C; point of [S/Z_p] | identity chart; Rq^!Λ ≅ Λ vs Check “noninvertible” | R03 |
| VS6.3 decent ⇒ Artin | [S/GL_n(ℤ_p)] | diagonal fibres are G-torsors (diamonds) | ok; needs a clean chart (R10) |
| VS6.4 fibre products | In_S(X) | two fibre products of decent stacks are decent | ok |
| VS6.5 examples | Spd ℤ_p | chart × Spd F_p((t^{1/p^∞})) is adic (GHW p. 3) | ok |
| VS6.6 fine maps | [S/GL_n]→S; ∞-ball | top map dim.trg n²; dim.trg ∞ | ok |
| VS6.7 permanence | X←C→X′ | C→S fine by (i); c₁ fine by (iii) | ok |
| VS6.8 smooth fine | point of [S/ℤ_p] | Haar⊗C(ℤ_p,Λ) → Λ[[ℤ_p]] not onto (δ₀) | ok |
| VS6.9 classifying stacks | Spd ℚ_p, G = 1, H = ℤ/2 | H¹(ℚ_p, ℤ/2) of order 4 ≠ 1 | correction valid |
| VS6.10 2-morphisms | finite G | α_{gh} = α_g α_h gives the action | ok |
| VS6.11 proper nice | [S/ℤ_p]; P¹; open disc | diagonal not injective; proper; not qc | ok |
| VS7.1 prespatial | ⊔_ℕ points | locally prespatial, not qc | ok |
| VS7.2 amplitude | proper curve | bound 3, actual 2 | ok |
| VS7.3 weakly compactifiable | qc open j; proper f | j_!; Rf_! = Rf_* | ok |
| VS7.4 qcqs operations | T×Spa C, T profinite | weakly compactifiable; Dist not invertible, so excluded | ok |
| VS7.5 !-functors | [S/G]→S | Rf_! = (M⊗Haar)_G (HKW Ex 4.2.4) | ok; gap R01 |
| VS7.6 identities | (BC2) by mates; [S/G], B = Λ | Rf′_*Rg′^! ≅ Rg^!Rf_*; (P4) ✓ | ok |
| VS7.7 proper nice !=∗ | closed immersion | Ri_! = i_* | ok |
| VS7.8 intrinsic smoothness | q : S→[S/ℤ_p] | q^!Λ ≅ Λ; C(ℤ_p,F_ℓ) countable vs Λ[[ℤ_p]] uncountable | ok |
| VS7.9 dualizing complex | P¹_C; ℤ_p | Λ(1)[2], H² ≅ Λ; stalk rank ≥ 2 | ok |
| VS7.10 twist | I = Λ | w = id | ok |
| VS7.11 diagonal | [S/G]→S; id | (Haar*)⁻¹ = Haar; Λ⊗Λ = Λ | ok |
| VS8.1 smooth modules | T = ∅; ℕ, ℤ; T compact | 0; 1 ∉ ⋃1_U ℤ^ℕ; 1_T ∈ C_c | ok |
| VS8.2 sheaves | T finite | Λ^T-modules; C_c → C(T,Λ) | ok |
| VS8.3 distributions | Fin 3; ∅; ℤ_p over F_ℓ | Λ³; 0; μ(a+p^nℤ_p) = p^{−n} ≠ 0 | ok |
| VS8.4 constant diamond | T finite | f^!M = M^T; f_! = f_* | ok |
| VS8.5 Haar module | ℤ/3 over ℤ[1/3]; ℤ_p over F_p | rank 1; μ(ℤ_p) = p·μ(pℤ_p) = 0 | ok |
| VS8.6 [S/G] decent | ℚ_p^× | open pro-p subgroup 1+pℤ_p | ok |
| VS8.7 point operations | G finite; ℤ_p | Λ[G]⊗; Rq_*Λ = C(ℤ_p,Λ) | ok (contradicts R03) |
| VS8.8 restriction/induction | H = 1; H′ finite | reduces; Hom_{H′}(Λ[H′],M) = M | ok |
| VS8.9 structure map | \|G\| invertible; ℤ_p | (M)_G ≅ M^G; H^{>0} = 0; q^!f^! = id | ok |
| VS8.10 [T_S/G_S] | T a point | Hom_G(Haar, Λ) | ok |
| VS9.1 dualizable/trace | FGModuleCat; Λ⊕Λ[1]; K^(ℕ) | dim V; 1−1 = 0; not dualizable | ok; duplicate (R05) |
| VS9.2 trace functoriality | Y = ∅ | stated 2-cell needs X → ∅ | R04 |
| VS9.3 Grothendieck construction | B terminal; Lemma 1.11 | F(∗); g∘c ⇒ c′∘f | ok |
| VS9.4 perfect = dualizable | Λ^n; ℤ/6 with P = 3ℤ/6 | matrix trace; HS trace 3 vs `LinearMap.trace` 0 | R05, R06 |
| VS9.5 reflexivity | ℤ/ℓ² with ℤ/ℓ⊕ℤ/ℓ²; F_ℓ^(ℕ) | M ≅ M**; dim M** > dim M | ok; cite (R09) |
| VS9.6 Corr_S | id; [S/G]; q♮ | In_S(X); [G//G]; unit Δ closed, counit q | ok |
| VS9.7 CoCorr_S | (S,A); ⊗ | End(A); target A′₁⊠A′₂ (HKW line 1508 misprint) | ok |
| VS9.8 dualizability criterion | (S,A); smooth X | m iso ⇔ perfect; dual K_{X/S} | ok |
| VS9.9 dualizable ⇔ ULA | j_!Λ on closed disc | jump at the boundary, not ULA | ok |
| VS9.10 trace class | A = Λ², u 2×2; σ on finite T | a+d; Fix = T^σ | ok |
| VS9.11 characteristic class | Λ³⊕Λ[1]; [S/(ℤ/2)]; finite G | 2; two components; constant 1 | ok |
| VS9.12 open restriction | U = X | trivial | ok |
| VS10.1 relative LV | Y = ∅ | 2-cell direction | R04 |
| VS10.2 cc pushforward | p iso; X proper | transport; ∫cc = χ | ok; hypothesis R11 |
| VS10.3 Lefschetz | g = az on P¹; char C = 2; T+p on disc | 1+1 = 2 = 1+1; 2z = 0; Fix ∅, tr 1 | R10 for 2z |
| VS10.4 local terms | Λ^n at S; ∅; id on P¹ | n; 0; ∫ = 2 | ok; hypothesis R11 |
| VS10.5 base change CoCorr | a = id; C ⊂ C′ | identity | ok |
| VS10.6 local terms and base change | a = id | trivial | ok; base R11 |
| VS10.7 diamondification | perf. A¹, x ↦ x+1 | Fix = ∅ on both sides | ok; drift R07 |
| VS10.8 perfect schemes | Λ = F_ℓ[t]; X = Spec k | outside §6.3; χ(F) = χ(F) | R07 |
| VS11.1 admissible | C_c(G,Λ), G noncompact | K-invariants free on infinite K\G | ok |
| VS11.2 inertia of [S/G] | G finite; G abelian | ⊔[S/Z(g)]; G_S×[S/G_S] | ok |
| VS11.3 trace distribution | ℤ/2 over F_3; ℤ_p trivial; ℚ_p | 1 and −1; ∫h dμ; not finitely generated | ok (R10 for Λ) |
| VS11.4 cc = tr.dist | G finite | character | ok |
| VS11.5 modified Künneth | U = T = S, f_i = id; ℤ_p | identity; rank-one twist | ok |
| VS11.6 trivialisation | T = S; G finite étale | cc = 1; K trivial | ok |
| VS11.7 BCoCorr | T = S, B = Λ | ⊗ of CoCorr_S | ok |
| VS11.8 coherence | trivial base | ⊗ functoriality | ok (unproved in source) |
| VS11.9 Künneth for cc | T = S; X_i = T | tr(A⊗B) = tr A·tr B; cc(Λ_T) | ok |
| VS11.10 inertia of [X/G] | X = S; trivial action | [G//G]; X×[G//G] | ok |
| VS11.11 universal local term | ℤ/2 swapping {a,b} | Fix = {(a,1),(b,1)}, values 1 | ok |
| VS11.12 cc = universal local term | X = S | canonical trivialisation | ok |
| VS11.13 étale locus | ax+b with a∈1+p𝒪, b∈𝒪 on P¹ | w(bw+a−1) = 0 double at a = 1; loc 2 vs 1+1 | correction valid |
| Gap G-liu-zheng | — | supplier none, no prerequisite edge | R01 |
| Gap G-lsep | — | supplier none, no consumer | R02 |

### Library declarations opened at the pins

Mathlib at `6b7abb3`:
- `MonoidalCategory` (Monoidal/Category.lean:161)
- `SymmetricCategory` (Braided/Basic.lean:366)
- `ExactPairing`, `coevaluation` and `evaluation` (Rigid/Basic.lean:77, 103, 106)
- `Bicategory` (Bicategory/Basic.lean:61)
- `Bicategory.Adjunction` (Adjunction/Basic.lean:89)
- `Pseudofunctor` (Pseudofunctor.lean:57)
- `LocallyConstant` (LocallyConstant/Basic.lean:212)
- `LocallyConstant.charFn` (Algebra.lean:91)
- `CompactOpens` (Sets/Compacts.lean:777)
- `Module.Dual` and `Dual.eval` (Dual/Defs.lean:61, 79)
- `IsDiscreteValuationRing` (DiscreteValuationRing/Basic.lean:56)
- `maximalIdeal` (MaximalIdeal/Defs.lean:30)
- `Module.Finite` (Finiteness/Defs.lean:121)
- `LinearMap.trace` (Trace.lean:75, zero without a basis)
- `FGModuleCat` and `rightRigidCategory` (FGModuleCat/Basic.lean:57, 264)
- `DerivedCategory` (DerivedCategory/Basic.lean:87; no monoidal structure at the pin)
- Also opened: `Module.IsReflexive` (Dual/Defs.lean:212) and `instFiniteDimensionalOfIsReflexive` (Dual/Lemmas.lean:284).

No categorical trace exists in Mathlib or in Tau Ceti at the pins. In Tau Ceti at `a91d3aa`, `TauCeti.IsSmoothDiscrete` is at `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`.

### Cross-roadmap citations resolved

- *Artin v-stacks, solid and lisse coefficient categories*: all 12 anchors of VS0, VS1, VS4 and VS5 resolve at the head of its roadmap pull request.
- SmoothRepresentationsOfLocalGroups: all 14 slugs resolve.
- DiamondsAndVStacks: all 10 D4–D6 slugs resolve.
- AdicCoefficientsAndComparisons: all 6 L1 and L3 slugs resolve.
- DiamondSixOperations, EnhancedDerivedSheaves, SchemeAndStackFoundations and EtaleDualityAndPerverseSheaves: see R06–R08.

### Dependency gate output

    candidate: VStackSheavesAndLisseCategoriesPartII is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 231 edges, 0 problem(s)

There is no UPWARD or CYCLE line. Every cited supplier is in the allowed list.

### Ownership and duplication by object

I searched main, the open roadmap pull requests through the roadmaps tool, the board packages and the board's job issues for the following objects: decent v-stacks, fine maps, Gulotta–Hansen–Weinstein, Lefschetz–Verdier, Lu–Zheng and Liu–Zheng, cohomological correspondences, trace distributions, universal local terms, inertia stacks, Haar modules, smooth C(T,Λ)-modules and categorical traces.

The only duplications are R05 and R09. HeckeStacksAndLocalShtukas, BunGAndNewtonStrata and GeometricSatakeAndFusion do not plan this material. The scheme 2-category of EtaleDualityAndPerverseSheaves Layer 6 is scheme-specific; the bicategorical Lu–Zheng prefix has no other owner. On the board, the HeckeStacksAndLocalShtukasPartII design only proposes a later Kottwitz Part II, which consumes this roadmap. The TraceFormula roadmap of an open pull request plans Hattori–Stallings traces on perfect complexes; it is not earlier in the merge order, so it was noted and not cited.

### Headline theorems

The headlines are VS10.1, VS11.4, VS11.9 and VS11.12, together with the deep results VS7.5 and VS9.9. None is statable at the pins (R12). The one-tactic probe was not applicable because there is no Lean file.

## Not verifiable

- Liu–Zheng, arXiv:1211.5948 and arXiv:1211.5294, were not opened. They are needed only by gap R01, and the design read them only through GHW22. Their locators (Prop 1.4.4, Thm 4.1.8(1), Thm 5.4, Cor 0.4) are therefore unverified.
- The individual local terms equal to 1 at transversal fixed points of P¹ over Spd C in characteristic 0 (the Checks at README lines 1839 and 1884) follow from no target: VS10.8 compares only perfect schemes over Spd k. Only their sum, 2, is checked.
- The adaptation of FS21 Thm V.7.1 (VS11.1 step 3) was read at statement level only.
- Elaboration and `#check` comparison: not available (this lane does not elaborate), and the design package has no `Suggested.lean`.

## Source issues

- **Error** in HKW22 at Example 4.1.1, p. 22: the source says maps [S/G] → [S/H] correspond to S-homomorphisms G → H; it should say H-torsors on S with commuting G-action, giving homomorphisms only after trivialising; affects a stated result.
- **Gap** in HKW22 at Theorem 4.1.8, p. 24: the source says GHW22 Theorem 1.4 gives (P1)–(P5), (BC1)–(BC2) and Rf_! ≅ Rf_* on all proper fine maps; it should say Theorem 1.4 gives agreement, pseudo-functoriality, projection formula, proper base change and adjoint only; affects a stated result.
- **Misprint** in HKW22 at Definition 4.1.7, footnote 4 and the paragraph after Theorem 4.1.8, pp. 23–24, 28: the source says GHW22 Definitions 4.3 and 4.1, Propositions 4.10 and 4.17; it should say GHW22 v1 Definitions 4.1 and 1.1, Proposition 4.8(i),(iii), Proposition 4.14; affects nothing.
- **Misprint** in HKW22 at Definition 4.3.1, p. 28: the source says tr(f) is ev after f ⊗ id after coev, with no symmetry; it should say the symmetry X⊗X^∨ → X^∨⊗X is inserted before ev, as in LZ22 Construction 1.6; affects nothing.
- **Misprint** in HKW22 at Definition 4.3.4, tensor product of 1-morphisms, p. 30: the source says the target is (c₂ × d₂)^!(A₂ ⊠ A′₂); it should say (c₂ ×_S d₂)^!(A′₁ ⊠_S A′₂); affects nothing.
- **Error** in HKW22 at Example 4.3.10, p. 33: the source says Theorem 4.3.8 applies to any correspondence over a proper X; it should say the correspondence must also be proper over S; affects a stated result.
- **Misprint** in HKW22 at Definition 4.5.1, pp. 36–37: the source says the composite applies the diagonal's upper-shriek to the constant sheaf on T; it should say the constant sheaf on U ×_T U, as in (4.1.3); affects nothing.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), p. 40: the source says functoriality and monoidality of the based fibre product are straightforward and gives no proof; it should say they need a proof from the coherence of the Künneth maps; affects the proof.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, p. 41: the source says the fixed locus is fibred over In_S(T₁); it should say In_S(T); affects nothing.
- **Error** in HKW22 at §4.6, closing remark, p. 44: the source says isolated fixed points over U make the inertia étale over [U//G]; it should say étaleness of the fixed locus over U is needed (fails for the affine group on P¹); affects a stated result.
- **Misprint** in HKW22 at §5.3, p. 48: the source says the trace map is described before Definition 4.3.5; it should say before Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at the proof of Lemma B.1.1, pp. 72–73: the source says the exponent is m in 𝔪^{m−1} and in Λ/𝔪^{m−1}; it should say k; affects nothing.
- **Misprint** in GHW22 at footnote 1, p. 2: the source says [HKW21, Example 4.2.7] for f_! as group homology; it should say Example 4.2.4 in the published HKW22; affects nothing.
- **Misprint** in GHW22 at the proof of Theorem 3.14, pp. 17–18: the source says “Proposition 3.14” and refers to “the map ??”; it should say Theorem 3.14 and the map (3.1); affects nothing.
- **Gap** in GHW22 at the proof of Proposition 4.4, p. 20: the source says FS21 Remark IV.1.4(ii) applies to any chart; it should say first refine to a clean (separated) chart by Remark 1.2.ii, as Remark IV.1.4 needs a separated map; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0987ba7", "job": "REV-DESIGN-VStackSheavesAndLisseCategoriesPartII", "model": "opus", "worker": "fable-rev12"} -->
