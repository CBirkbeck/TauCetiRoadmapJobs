# Review of PrestableInfinityCategories (pull request #2270 at a6d7928)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — §4.1.4 takes a later Part as supplier, and that Part cites this one

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:479`–504, §4.1.4: “*Needs:* … Part DerivedInfinityCategories §6.8.1, §6.8.2, §6.8.3 … and §6.8.4”.
**Claim:** The new target consumes Part DerivedInfinityCategories, which is after this Part in the merge order and already cites this Part's §4.1: an upward citation that closes a cycle. The supplier contracts (headed “earlier Parts”) do not list it, and line 959 calls it a downstream consumer.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/README.md:64`, :70 order this Part 12th and DerivedInfinityCategories 13th. `TauCetiRoadmap/InfinityCategoryTheory/DerivedInfinityCategories/README.md:149` and :716 cite “Part PrestableInfinityCategories §4.1” and already state that `D(A)_{≥0}` is Grothendieck prestable with heart A.
**Repair:** Delete §4.1.4 (statement, route, Checks, `Needs`) from this README. The statement stays where its inputs are, in Part DerivedInfinityCategories Layer 6 (line 716), which cites §4.1 here; make it a numbered target there if one is wanted. After the deletion no `Needs` line of this README names Part DerivedInfinityCategories, and no other section cites §4.1.4.

## R02 (P2) — The Tau Ceti supplier claims are still false at the pin

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:48`, :59, :103–108 and `Suggested.lean:22`–24: “Tau Ceti already has limits and colimits in quasicategories (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`), fully faithful functors (`SSet.IsFullyFaithful`)”.
**Claim:** Finding R01 of the previous review is not repaired. Five cited declarations and five cited files do not exist at the pinned Tau Ceti, and the Moore theorem's path is wrong.
**Witness:** At Tau Ceti `2fd255d997`: no occurrence of `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.IsFullyFaithful`, `SSet.catInfty`, `fibration_whiskerRight_forget_addCommGrpCat_of_epi`; `TauCeti/AlgebraicTopology/Quasicategory/` holds only `Cartesian`, `Core`, `FullSubcategory`, `LocallySmall`, `RightMappingSpace`; `kanComplex_of_addGroup` is at `KanComplex/SimplicialGroup.lean:214`.
**Repair:** Make the contracts true at the pin: cite limits, colimits, fully faithful functors and `Cat∞` as targets of the earlier Parts that own them (by Part and section), or land the pin update first and verify the five names there. Give `SSet.kanComplex_of_addGroup` the path `TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/SimplicialGroup.lean`. Align Scope (line 48), Conventions (line 59), every `Needs` line that names these declarations, and the module docstring.

## R03 (P2) — The separator step of §4.1.3 does not follow

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:464`–469, §4.1.3: “If X in C♥ is nonzero then `Map(G_α, X)` is not contractible for some α … So the `π₀ G_α` are a separating family in A”.
**Claim:** A family that maps nontrivially to every nonzero object need not be separating; separation needs, for every nonzero f : X → Y, some h : G → X with f ∘ h ≠ 0. The route proves the weaker property only.
**Witness:** Modules over R = k[x]/(x²), G = k: Hom(k, M) = {m : xm = 0} ≠ 0 for every M ≠ 0, yet every k → R lands in xR and composes to 0 with the nonzero R → k. So {k} is not separating.
**Repair:** Replace the two sentences by: “Let f : X → Y be a nonzero map of C♥. The objects Z of C such that f ∘ h is null for every h : Z → X are closed under small colimits, because `Map(Z, Y)` is discrete for discrete Y and so a map out of a colimit into Y is determined by its restrictions. If every `G_α` were such an object, X would be, and f = f ∘ id_X would be null. So some h : G_α → X has f ∘ h ≠ 0, and it factors through `π₀ G_α` (τ≤0 is left adjoint to the inclusion, §3.2.1).” On the witness this asks for h : k → R with nonzero image in k, which does not exist, as it should.

## R04 (P3) — Layer 3 Dependencies cites a section that does not exist

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:423`: “InfinityCategoryFoundations (§2.6, §10.6) and CartesianFibrations (§3.4)”.
**Claim:** Part CartesianFibrations has no §3.4; the result used (HTT, Prop. 1.2.7.3) is its §3.3, as lines 114, 387 and 394 of this README say.
**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/CartesianFibrations/README.md:611` is “### 3.3 Functor ∞-categories and the forms of categorical equivalence”; the next heading, line 656, is “### 4.1 Correspondences”.
**Repair:** In line 423 replace “CartesianFibrations (§3.4)” by “CartesianFibrations (§3.3)”.

## R05 (P3) — Whitehead's theorem is used in §3.3.2 but missing from the contracts

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:128` and :423: “Part KanQuillen: the long exact sequence of a Kan fibration (§1.2), Postnikov sections of Kan complexes (§5.1) and the convergence of towers (§5.3)”.
**Claim:** The route and the `Needs` line of §3.3.2 (lines 411, 414) consume Part KanQuillen §1.3.3; the supplier contract and the Layer 3 Dependencies omit §1.3, and the Dependencies also omit Part SimplicialCategories §3.2.
**Witness:** Line 414: “Part KanQuillen §1.2.3 …, §1.3.3 (Whitehead's theorem), §5.1.1 … and §5.3.1”. The section exists: ModelCategoryTheory, Part KanQuillen, “### 1.3 Weak equivalences of Kan complexes and Whitehead's theorem”, target 1.3.3.
**Repair:** In line 128 write “the long exact sequence of a Kan fibration (§1.2), Whitehead's theorem (§1.3), Postnikov sections …”. In line 423 write “ModelCategoryTheory Parts SimplicialCategories (§3.2, §4.2) and KanQuillen (§1.2, §1.3, §5.1, §5.3)”.

## R06 (P3) — Process narrative in §2.4.3

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/PrestableInfinityCategories/README.md:296`: “The target is larger than one pull request, and it stays one target: the source names one result here and no intermediate result to divide it along”.
**Claim:** The sentence speaks of pull requests and of how the target was sized, which the README's timeless style excludes. Line 871 (“The target is large … so it stays whole”) is the same kind of remark.
**Witness:** `README.md:296` contains the words “one pull request”; no mathematical statement of §2.4.3 depends on the sentence.
**Repair:** Delete the sentence of line 296 from “The target is larger than one pull request” to “no step of the route is a result the source names.” and the sentence of line 871 from “The target is large” to “so it stays whole.”

## Previous findings

- R01 — not repaired: lines 48, 59, 103–108 and `Suggested.lean:22`–24 unchanged in substance; the pin is still `2fd255d997` (this report R02).
- R02 — repaired: lines 86–89 list `prop_X₂_of_exact`, the inverse-image Serre instance and `IsClosedUnderColimitsOfShape.inverseImage`; lines 150–151 and 167 name them.
- R03 — repaired: line 162 now ends “Equivalently, A₀ is a Mathlib `ObjectProperty.IsSerreClass` that is closed under small coproducts”; the docstring (lines 15–18) lists five theorems and one definition.
- R04 — repaired: lines 413–414 add “Part SimplicialCategories §4.2.2 …, §4.2.1 (injective fibrancy of towers) and §3.2.1 (homotopy limits); Part LimitsAndKanExtensions §3.2.1”.
- R05 — repaired: the notes file is gone; the gate reports `stray-files=0`.
- R06 — no longer applies: against the base the folder removes nothing (0 declarations removed, 6 added), so the description owes no removal notice.

## Verified sound

| Statement | Instances tried | Left side / input values | Right side / output values | Result / change |
|---|---|---|---|---|
| §1.1.1 Serre class (headline, `isNoetherianObject_isSerreClass`) | 0→ℤ→ℤ→ℤ/2→0; 0→ℤ→ℚ→ℚ/ℤ→0; zero object | Middle Noetherian: true; false; true | Both ends Noetherian: true; false (ℚ/ℤ has chain ⅟(n!)ℤ/ℤ); true | iff holds; SAG line 76209; not closed by `infer_instance` |
| §1.3.1 three conditions (`tfae_sSup_noetherianSubobjects_eq_top`) | X = 0; ℚ in Ab; R = k[x₁,x₂,…] over itself | sSup: ⊤ (⊥ = ⊤); ⊤; ⊥ ≠ ⊤ | Filtered colimit / epi from coproduct: true (J = PUnit, ι = ∅); true; false (images are 0) | All three agree; SAG line 76233 |
| §1.3.2 compact ⇔ Noetherian, Ind-description (headline) | ℤ, ℚ, ⊕ℕ ℤ in Ab; R over k[x₁,…]; zero category | Compact: T, F, F; T | Noetherian: T, F, F; F — excluded, Mod_R not locally Noetherian; Ind(A₀) = 0 | Hypothesis needed and present in Lean (`hA`) |
| §2.1.1 prestable | Δ[0]; N(Ab); pointed spaces; Sp≥0 | Σ fully faithful: T; F (Map(ℤ,ℤ) = ℤ vs point); F (2 elements vs ℤ); T | (c): fiber of 0 → Hℤ in Sp≥0 is 0, square 0,0,0,Hℤ pullback not pushout | Definition matches SAG lines 71089–71103; discriminates |
| §2.2.1–2 Spanier–Whitehead envelope | Sp≥0; N(Ab); pointed finite spaces | SW: bounded-below spectra; 0; π₀ Map(S⁰,S⁰) = colim πₖ(Sᵏ) = ℤ | In C: ⊕Σ⁻ⁿHℤ absent; Ab; two elements | SAG lines 71008–71060 |
| §2.3.2 stable-envelope criterion (headline) | ∅; Sp≥0 ⊂ Sp; N(Ab) | Prestable: F; T; F | Embedding with closed image: F (no 0); T; F (Σ = 0 not faithful) | SAG line 71173 |
| §3.1.2 connective parts (headline) | Sp≥0; N(Ab) | Prestable with finite limits: T; F | SW = bounded below, Sp(C) = Sp, differ at ⊕Σ⁻ⁿHℤ; C → SW(C) = 0 not fully faithful | Consistent |
| §3.2.1 heart | Sp≥0; Sp; ΣHℤ | Heart: Ab; 0 | ΩΣHℤ = Hℤ ≠ 0, so ΣHℤ not discrete; cofib(Hℤ → 0) leaves heart | SAG line 71282 |
| §4.1.1–2 Grothendieck prestable (headline) | Sp≥0; pointed spaces; N(Ab); Δ[0] | Presentable and Ω commutes with filtered colimits: T, T, T, T | Prestable: T, F, F, T | Prestability not implied; consistent |
| §4.1.3 separator route | k over k[x]/(x²) | Hom(k, M) = ann_M(x) ≠ 0 for all M ≠ 0 | (R → k) ∘ (k → R) = 0 for every k → R | Inference false: R03 |
| §4.1.4 | Family order; DerivedInfinityCategories README | This Part 12th, cites Part 13 §6.8.1–4 | Part 13 lines 149, 716 cite this Part §4.1 | Cycle: R01 |
| §4.2.1 left exact localizations | L = id; L = 0; rationalization of Mod_ℤ^cn; τ≤0 on Sp≥0 | Acyclics: {0}; all; torsion homotopy (ℤ/p yes, ℤ no) | cofib(ℤ → ℚ) = ℚ/ℤ acyclic, L inverts it; τ≤0 sends fiber Hℤ of 0 → ΣHℤ to 0 | SAG lines 71749–71760 |
| §4.2.2 intersections | Empty family; one subcategory | ⋂ = X; X₁ | L = id; L₁ | SAG line 73072, three hypotheses present |
| §4.3.1–2 localizing ⇔ acyclics (headline) | 0, C; torsion; Σ(Mod_ℤ^cn); p-invertible objects | (i),(ii),(iii): TTT; TTT; fails (ii) at ℤ → 0 → Σℤ; fails (iii) at ℤ → ℚ → ℚ/ℤ | Kernel of a left exact localization: yes; yes; no; no | SAG lines 71808–71836 |
| §4.6.1 sifted colimits | Sequence Hℤ → Hℤ → … along 2; pushout 0 ← Hℤ → 0 | U(colim): ℤ[1/2]; K(ℤ,1), π₁ = ℤ | colim U: ℤ[1/2]; suspension of discrete ℤ, π₁ free of infinite rank | Sifted needed; HA line 5777, p. 153 |
| §5.3.1–2 filtered colimits (headline) | Constant diagram; Sp≥0 → Sp≥0 → … along Σ | Colimit in `Pr^L`: C; limit along Ω = Sp | Grothendieck prestable: T; T; Σ not left exact, so not a diagram of `Groth∞^lex` | SAG lines 72437, 72539, 72562 |
| §5.4.1–2 separated quotient, completion (headline) | Sp≥0; Sp | C^sep: Sp≥0; Δ[0] | Ĉ: Sp≥0; Δ[0]; id_Sp does not factor through C^sep | SAG lines 72739, 72785 |
| §7.3.1–2 completion equivalence (headline) | Mod_ℤ^cn; Sp≥0; Ind(Sp^fb_≥0); Sp | (complete, anticomplete): TT; TF; FT; FF | Completions: itself; itself; Sp≥0; Δ[0] = completion of Δ[0] | SAG lines 74253, 75248 |
| §8.1.1–2 almost compact | S; ⊕ℕ Hℤ; ℤ ⊕ Σ(⊕ℕ ℤ); 0 | τ≤0 compact: T; F; T; T | Almost compact: T; F; F (fails at n = 1); T | SAG lines 75551–75572 |
| §8.2.1 finite limits | Mod_ℤ^cn; R = k[x,y₁,y₂,…]/(xyᵢ) | Almost compact: finitely generated πₙ; R | Fiber of x on R: Ann(x) = (y₁,y₂,…), not finitely generated | (a) holds; fails; SAG lines 75572–75600 |
| §8.4.1 recognition (headline) | Mod_ℤ^cn; Sp; Sp≥0 | Compact objects truncated, Ω-stable: T; F (S); F (S) | Anticomplete and coherent: TT; FT; FT | Four conditions agree; SAG line 76131 |
| §9.1.1–2 locally Noetherian | Mod_ℤ^cn; Mod_R^cn, R = k[x₁,…]; Sp | Weakly coherent: T; T; T | Heart locally Noetherian: T; F; T (heart 0) | SAG lines 76333, 76342 |
| §9.2.1–2 three conditions (headline) | Mod_ℤ^cn; R = k[x₁,…]; Sp | (a): T; F; T | (b): T; F (R compact in τ≤0, π₀ not Noetherian); T. (c): T; F; T | SAG lines 76361–76363, 76414 |
| Tau Ceti contracts | Pin `2fd255d997` | Declarations claimed: 11; files claimed: 8 | Found: 6 declarations; 3 files | R02 |
| Lean signatures | `#check` of 6 declarations | Binders `[Category A] [Abelian A] [IsGrothendieckAbelian A]`, `hA` | All present in elaborated types; hom universe `v` throughout | The worker's “dropped binder” leads are false |

- Sources: 44 SAG locators and 2 HA locators read at the text (every sampled section; pages agree with the README). HTT not reopened this round.
- Libraries: 24 Mathlib names opened at the pin, all present, among them `prop_X₂_of_exact` (`SerreClass/Basic.lean:62`), `isSeparator_sigma` (`Generator/Basic.lean:726`), `nerveAdjunction.isIso_counit` (`NerveAdjunction.lean:402`); no `IsSerreClass` instance for `isNoetherianObject` exists (`Subobject/NoetherianObject.lean:127` gives subobjects only).
- Cross-roadmap: Part DerivedInfinityCategories §6.8.1–4, CartesianFibrations §3.3, KanQuillen §1.2.3, §1.3.3, §5.1.1, §5.3.1, SimplicialCategories §3.2.1, §4.2.1–2, §6.4.1, §6.4.3 and ModelCategories §3.5.1–3 resolved at their heads; the resolver lists no missing citation.
- Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`; it does not see the edge of R01, which is between two Parts of this pull request.
- Gate: the worker's run passes every check; no change outside the family folder.
- Lean: `Suggested.lean` elaborates with five `sorry` warnings only; on a scratch copy none of the five theorems closes with `infer_instance`, `rfl`, `simp` or one library lemma. Ten headlines listed; the abelian one is stated, the nine others are named in the docstring with the missing carrier.
- Overlap check: read EnrichedLocalization, KanQuillen, SimplicialCategories, ModelCategories, QuasicoherentSheavesOnPrestacks, EnhancedDerivedSheaves, BordismFormalGroups, StableHomotopyKTheory, and GeneralAlgebraicKTheoryPartII; nothing shared except additive ∞-categories, which GeneralAlgebraicKTheoryPartII §1.2 describes in E∞ form without a definition target: owner here (§2.4.2).
- Source independence: 51 passages compared with 2 sources, none shared (longest common run 8 words, a forced formula); largest share SAG, 375 of 868 locators; contents compared with SAG Appendix C: independent (Layer 1 ↔ C.6.8 and C.5.1, Layer 4 ↔ C.1.4, C.2.3, C.4.3, C.5.2, Layer 6 before Layer 7 ↔ C.6.1 before C.5.5).
- Research link: the headline targets are the theory of prestable ∞-categories of Lurie, *Spectral Algebraic Geometry* (2018), Appendix C, which generalizes Grothendieck abelian categories and contains `D(A)_{≥0}` (Ex. C.1.4.5), used by Part DerivedInfinityCategories. Rests on the README and SAG.

## Not verifiable

- The Tau Ceti commit `8b9f13d993` named in the description was not read: library claims are checked at the pin only.
- The count “1119 numbered statements” in the description concerns the whole family and was not recounted.

## Source issues

- **Misprint** in SAG at the proof following Proposition C.3.6.3, printed p. 1992: the source says the proof is of a proposition with an unresolved number; it should be a proof of Proposition C.3.6.3; affects nothing.
- **Misprint** in SAG at Proposition C.5.2.8, proof of (d), printed p. 2015: the source says right completeness follows from a proposition with an unresolved number; it should be a resolved reference to the right-completeness criterion; affects nothing.
- **Misprint** in SAG at Remark C.1.4.6, printed p. 1953: the source says the commutative ring and the connective E∞-ring carry the same letter; it should be two letters, the second with π₀ equal to the first; affects nothing.
- **Misprint** in SAG at Warning C.6.9.6, printed p. 2089: the source says the counterexample is the heart of the module category; it should be the connective module category over that E∞-ring; affects nothing.
- **Misprint** in SAG at Remark C.1.1.6, printed p. 1944: the source says `Pr^L` consists of presentable stable ∞-categories; it should be presentable ∞-categories, with stabilization as an endofunctor; affects nothing.

## For the human reviewers

- Scope: SAG (3 February 2018, marked under construction) and HA (18 September 2017) are author's PDFs, not published books; every prestable target (Layers 2–9) cites SAG Appendix C as its source.
- Licence: SAG and HA were read from the author's page at math.ias.edu; no reuse licence is stated there.
- Pin: the description asks for a separate Tau Ceti pin update; this folder's Lean file builds at the present pin, and R02 is about README claims that hold only after that update.
- Ownership: GeneralAlgebraicKTheoryPartII §1.2 (open, earlier in the merge order) describes additive ∞-categories through E∞ mapping spaces; this README §2.4.2 defines them through the homotopy category (SAG, Def. C.1.5.1) and names no other owner.
- Ownership: the description leaves the conflict with BordismFormalGroups §F6.5, EnhancedDerivedSheaves and the reorganization in #1807 to the maintainers; no target of this folder restates one of theirs.
