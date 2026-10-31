# Review of VonNeumannAlgebras (pull request #1041 at 8b00f8a)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/VonNeumannAlgebras/README.md` (396 lines) and `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` (94 lines, 12 declarations). The previous review on file is of pull request #889 (the sibling that builds the same folder), so its findings are checked against this head under "Previous findings" below. The gate passes, the dependency check reports no problem, the Lean file elaborates with exactly five `sorry` warnings, every supplier section cited on main exists where it is cited, and the four locators the README carries are correct in the texts. What blocks: the folder has two open owners (this pull request and #889, which this pull request's own description calls the complete owner), and three headline theorems that are statable at the pin are absent from `Suggested.lean`. The README is also far from the TauCetiRoadmap form: no scope, conventions, supplier-contract or build-order sections, no Checks, one `*Needs:*` line, and no locator on any target of the seeded sample.

## R01 (P2) — Two open pull requests build the same folder and declare the same names

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:23`, `:29`, `:34`, `:45`, `:63`, `:70`, `:74`, `:77`; README V0–V4 against pull request #889's `TauCetiRoadmap/VonNeumannAlgebras/README.md` Layers 0–4.

**Claim:** `roadmaps list` (index of 2026-10-31T00:01:34Z) shows `#889 VonNeumannAlgebras (new) dee8088` and `#1041 VonNeumannAlgebras (new) 8b00f8a`. Pull request #889's `Suggested.lean` declares `IsFactor` (`:146`), `ProjectionEquivalent` (`:128`), `ProjectionSubequivalent` (`:134`), `equivalent_of_subequivalent` (`:140`), `double_commutant_iff_isClosed_image_ofCLM` (`:83`), `IsCyclic` (`:111`), `IsSeparating` (`:115`) and `isCyclic_iff_isSeparating_commutant` (`:120`), and its README carries this README's V0–V4 as its Layers 0–4 (`:276`, `:393`, `:524`, `:906`, `:971`, with the same sublayer names V4.Core `:973`, V4.PositivePredual `:1060`, V4.Normality `:1125`, V4.0.Fields `:1182`). This pull request's description says the complete programme "is retained and corrected in" #889 and that "the original #1041 branch is retained as its historical staged snapshot". While both are open, every object of V0–V4 has two owners, and the consumers on main that cite `VonNeumannAlgebras V4.0.Fields` (OperatorTheory `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1391`) and `V1`, `V2` (`TypeAHeckeAlgebras/README.md:366`, `:899`) point at a folder that two pull requests define differently. Re-raised: R02 of the review of #889.

**Witness:** `roadmaps show VonNeumannAlgebras --pr 889 --file Suggested.lean`, lines above; this file `:23–79`.

**Repair:** One owner per object. Either this pull request is the foundations roadmap (V0–V4 with V4.0.Fields, the sections main already cites) and #889 becomes its Part II from V5 on, deleting its Layers 0–4 and citing them by section; or this pull request is closed and #889 keeps the folder. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`, and one open pull request has a section named V4.0.Fields.

## R02 (P2) — Three headline theorems statable at the pin are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:7–12` (module docstring) and the file as a whole; README `:45–46` (Gelfand–Naimark), `:88–92` (Kaplansky density), `:233–236` (Sakai's theorem).

**Claim:** The README's headline theorems are the bicommutant theorem (V1), Kaplansky density (V1), the faithful direct-sum representation of a C*-algebra (V0, "Gelfand–Naimark"), the Schröder–Bernstein law for projections (V3/V4), cyclic-iff-separating (V4.Normality), the L∞ comparison and abelian classification (V2), the positive spanning of the predual and the normality criterion (V4), Sakai's theorem (V4.Core) and the measurable-field theorems (V4.0.Fields). Of these, the bicommutant theorem, Schröder–Bernstein and cyclic-iff-separating are stated. Three more are statable at the pin and absent:

- Kaplansky density: the unit ball of a unital star subalgebra `A` is dense, in `H →WOT[ℂ] H` (or in `H →Lₚₜ[ℂ] H`), in the unit ball of its double centralizer; every carrier exists at the pin (`ContinuousLinearMapWOT.ofCLM`, `Set.centralizer`, `Metric.closedBall`), and #889 states exactly this as `closure_unitBall_eq_unitBall_double_centralizer` (`:92`).
- Gelfand–Naimark: for a `CStarAlgebra A`, there is a complete inner product space `H` and an injective `A →⋆ₐ[ℂ] (H →L[ℂ] H)`; `PositiveLinearMap.gnsStarAlgHom` (pin `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:246`) is the ingredient and the statement needs nothing else; #889 states it (`:72`).
- Sakai's theorem, which the README states as "the equivalence with Mathlib's `WStarAlgebra` definition": for `[CStarAlgebra M] [WStarAlgebra M]` there exist `H` and `N : VonNeumannAlgebra H` with `M ≃⋆ₐ[ℂ] N`; `WStarAlgebra` (pin `Analysis/VonNeumannAlgebra/Basic.lean:45`) and `VonNeumannAlgebra` (`:67`) are at the pin.

The module docstring (`:7–12`) names no headline as not statable, and says nothing about the L∞ comparison, the predual theorems or the measurable fields, which are indeed not statable at the pin (no bounded Borel calculus, no ultraweak topology, no direct integral).

**Witness:** pin `Analysis/VonNeumannAlgebra/Basic.lean:45–67`; `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:246`; `Analysis/LocallyConvex/WeakOperatorTopology.lean:438` (`WOTofCLM`); #889 `Suggested.lean:72`, `:92`.

**Repair:** State the three theorems with `sorry` (each on its native carriers; for Sakai, note in the docstring that `WStarAlgebra` asks for a conjugate-linear isometry `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`, so the predual the README constructs is the conjugate of Mathlib's `X`), and rewrite the module docstring in the target-signatures form, listing the L∞ comparison, the predual/normality theorems and V4.0.Fields as not statable and what each lacks. Control: `lake env lean` shows eight `sorry` warnings and nothing else.

## R03 (P3) — The README is not in the TauCetiRoadmap form: no scope, conventions, contracts or build sections, no Checks, one `*Needs:*` line, four locators

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:1–36` (title and preamble), `:37`, `:53`, `:93`, `:190`, `:219` (section headings), the whole file.

**Claim:** The headings are `# Von Neumann algebras: …` and `## V0.` … `## V4.`; there is no `**Summary.**`, no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, no `## Layer k:` headings, no `### Examples` or `### Dependencies`, no `## Downstream consumers`. `grep -c '\*\*Checks'` gives 0 and `grep -c '\*Needs:\*'` gives 1 (`:176`). The file carries four locators in three citations (`:162–163` Houdayer 3.4 and Peterson 2.8.7, `:184` Peterson 2.8.9, `:207–208` Jones §4.5); every other target, including all five of the seeded sample (V4.Core `:221`, V4.PositivePredual `:281`, V4.Normality `:341`, V4.0 `:359`, V4.0.Fields `:361`), has no locator, so the sources check of the sample could not be done against any text. None of the twelve Lean names appears in the README (`grep` for `IsFactor`, `IsCyclic`, `ProjectionEquivalent`, `double_commutant_iff_isClosed_image_ofCLM` etc.: 0 hits each). Sibling #889 shows the same material in the required form (`## Scope and ownership :18`, `## Conventions :78`, `## Exact supplier contracts :122`, `## How to read the build :240`).

**Witness:** `grep -n '^## ' README.md` lists exactly six headings; the counts above.

**Repair:** Restructure to the README form: summary, scope and ownership (naming the OperatorTheory, BanachSpaceTheory and SemisimpleAlgebras deferrals by id and section), conventions, exact supplier contracts (the declarations and ids now scattered through `:21–35`, `:174–178`, `:233–262`), build order, `## Layer k:` sections with `### Examples` and `### Dependencies`, at least three discriminating `**Checks.**` per definition (the material is largely already there as prose: `:69–73`, `:105–107`, `:202–209`), a `*Needs:*` line per target, a locator at every theorem (Dixmier, Takesaki I, Kadison–Ringrose or the three notes already cited), the Lean names at their README targets, and a `## Downstream consumers` section naming OperatorTheory SA-B85, FreeProbability and TypeAHeckeAlgebras. Control: `grep -c '\*\*Checks'` ≥ 20, every `## V` heading replaced by `## Layer`, every target carries a parenthesised locator.

## R04 (P3) — Padding in `Suggested.lean`: three unused definitions and two one-line lemmas, one with a wrong docstring

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:23` (`IsFactor`), `:51` (`generated`), `:82` (`IsTracial`), `:39` (`ProjectionEquivalent.symm`), `:86` (`range_projection_mem_commutant`).

**Claim:** `IsFactor`, `generated` and `IsTracial` are used by no theorem of the file, so they are not "definitions only to make a headline statable". `ProjectionEquivalent.symm` restates the definition: in a scratch copy it closes by `obtain ⟨hp, hq, hpM, hqM, v, hv, h1, h2⟩ := h; exact ⟨hq, hp, hqM, hpM, star v, star_mem hv, by simpa using h2, by simpa using h1⟩`. `range_projection_mem_commutant` closes by elementary rewriting (`adjoint_comp`, `map_star`, `star_eq_adjoint` applied to `hu (star x)`, then the two intertwining equations), and holds for any star subalgebra, not only a von Neumann algebra; its docstring "The initial range dimension is replaced by the semifinite trace of this final projection" describes a different theorem (the dimension of normal modules, #889's Layer 7) and not this statement.

**Witness:** scratch probe elaborated with `lake env lean` from the worktree: both probes compile with no error.

**Repair:** Delete `IsFactor`, `generated`, `IsTracial`, `ProjectionEquivalent.symm` and `range_projection_mem_commutant` from `Suggested.lean`; the README keeps the factor definition, the generated-algebra constructor, traciality, symmetry and the range-projection lemma as targets or Checks. Do not prove anything in place.

## R05 (P3) — Lean form: the namespace is Mathlib's `VonNeumannAlgebra`, not the roadmap's

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:18` ("`namespace VonNeumannAlgebra`"), `:7–12`.

**Claim:** The form rule is `namespace TauCetiRoadmap.<Name>`; this file puts `VonNeumannAlgebra.IsFactor`, `VonNeumannAlgebra.IsCyclic`, `VonNeumannAlgebra.generated` and the others directly into Mathlib's `VonNeumannAlgebra` namespace, where a future Mathlib declaration of the same name clashes. The module docstring is not the "<title>: target signatures" form, does not say that the roadmap is `README.md`, and (R02) names no unstatable headline.

**Witness:** `:18`; the elaborated signatures in the worker's signature file are all `VonNeumannAlgebra.*`.

**Repair:** `namespace TauCetiRoadmap.VonNeumannAlgebras`, the standard module docstring, `/-! ## Layer k -/` section comments in README order.

## R06 (P3) — V4.0's heading promises spectral representation and central decomposition that the folder does not plan

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:359` ("**V4.0 — Measurable fields, spectral representation and central decomposition.**") against `:4–6` ("The measurable-field construction uses given measures and fields, not spectral representation or central disintegration") and `:361` (the only sublayer, V4.0.Fields).

**Claim:** The heading is inherited from #889, where V4.0.Multiplication (`:1218`) and V4.0.Decomposition (`:1280`) follow; here nothing follows V4.0.Fields, and the preamble disclaims exactly what the heading promises. Main's OperatorTheory mentions "VonNeumannAlgebras V4.0.Decomposition" as a downstream consumer (`SelfAdjointSpectralTheory/README.md:1406`), a section this folder does not have.

**Repair:** Rename the heading to "V4.0 — Measurable fields" (or fold V4.0.Fields into V4 directly), and say in the scope section which roadmap owns the spectral representation and central decomposition (the Part II, if R01 is resolved that way).

## R07 (P3) — V0 plans the norm-at-one identity it says it consumes, which is at the pin

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:39–42` ("including positivity, …, positive-functional Cauchy–Schwarz and norm at one") against `:48–49` ("prove the positive-functional norm-at-one identity and develop convex sums, restriction and Cauchy–Schwarz").

**Claim:** The first sentence consumes the identity and the second plans it. At the pin it is `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one` (`Analysis/CStarAlgebra/PositiveLinearFunctional.lean:74`, `‖(f : A →L[ℂ] ℂ)‖ = f 1` for a unital C*-algebra) and the Cauchy–Schwarz bound is `norm_map_sq_le_opNorm_mul` (`:40`).

**Repair:** Delete "prove the positive-functional norm-at-one identity … Cauchy–Schwarz" from `:48–49` and cite the two declarations by name in the supplier contract.

## R08 (P3) — The L∞ comparison is stated below Peterson's generality

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:157` ("For a normal operator a on a separable Hilbert space H") with locator `:163` (Peterson, Corollary 2.8.7, p. 38).

**Claim:** Peterson's corollary (peterson-notes line 1510) assumes only that `W*(x)` is separable, with the remark (line 1514) that `W*(x)` need not be separable in general, giving `ℓ∞[0,1]` on `ℓ²[0,1]`; Houdayer's Theorem 3.4 (houdayer-invitation line 570) assumes H separable. The README's hypothesis is the narrower one, and the route (`:167–176`, countable maximal family of cyclic vectors) uses separability of H, not of `W*(a)`.

**Repair:** Either state the theorem for `W*(a)` with separable predual (equivalently countably decomposable abelian, the hypothesis under which the countable cyclic family exists) and keep "H separable" as the Check, or keep the separable-H statement and cite Houdayer alone at the claim with Peterson at the remark. Either way, add the `ℓ∞[0,1]` non-example as a Check.

## Previous findings

The review on file is of pull request #889 at fe361f3, not of this pull request; its findings concern that folder.

- R01 of that review (OperatorTheory plans the polar decomposition, Borel calculus, trace class and closed operators that #889 plans again): not applicable here as stated. This README consumes those objects (`:21–23` "Consume OperatorTheory's OrthogonalGeometry, PolarDecomposition, bounded Borel/PVM calculus through SelfAdjointSpectralTheory SA-B84, and OperatorIdeals' trace-class/Hilbert–Schmidt theory", `:176–178` the SA-B ids) and plans only the membership adapters (`:98–100`) and the `B(H) = S₁*` duality (`:224–225`), which OperatorIdeals on main does not state (its Part B/C stop at the Hilbert–Schmidt structure, `OperatorIdeals/README.md:349–377`, `:530`). No finding.
- R02 of that review (two owners): not repaired; re-raised as R01 above.
- R03 of that review (companion Lean files): not applicable; this folder has `README.md`, `Suggested.lean` and `metadata.toml` only (`stray-files=0`).
- R04 of that review (local convexity declarations): not applicable; this README does not name them. Its V1 route "by locally convex separation" (`:85–86`) is the one #889 now carries with the correct pin declarations; this README should name them in its supplier contract (R03).

## Verified sound

**Gate** (worker, at 8b00f8a): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty: nothing outside the folder. No `set_option`, no LaTeX, no pull-request number, no process word in the README (`removed` at `:126` is mathematical).

**Dependency check** (verbatim, run this round):

```text
depcheck: 204 roadmaps, 1394 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists VonNeumannAlgebras at line 4 after KacMoody and LefschetzPencilsAndVanishingCyclesPartII, neither of which the README cites; every supplier it cites is on main: OperatorTheory (`OrthogonalGeometry/`, `PolarDecomposition/`, `SelfAdjointSpectralTheory/README.md:293` SA-B05, `:307` SA-B11, `:359` SA-B30, `:428` SA-B46, `:436` SA-B49, `:449` SA-B53, `:488` SA-B84, `:255` SA-B85, `:753` SA-B86; `OperatorIdeals/README.md:350` OI-B30, `:355–377` Hilbert–Schmidt), BanachSpaceTheory (`README.md:41` B1 with annihilators `:43–44`, `:74` B2 with Krein–Šmulian `:91–93` including the subspace criterion the README's V4.Core needs, `:167` B4 with the Schmidt series, zero-based `s_n=a_n(T)`, nuclear/trace-class identification and rank-one norms `:224–247`), RepresentationTheory/SemisimpleAlgebras (`README.md:233` Layer 3 double centralizer). The direction with main's OperatorTheory is mutual at roadmap level (SA-B85 consumes V4.0.Fields, `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1391`; this README consumes SA-B05–B53, SA-B84, PolarDecomposition and OperatorIdeals) but acyclic at layer level: V4.0.Fields states at `:386–389` that it has no PVM, normal-operator or central-decomposition input, and the one target that consumes SA-B05–B53 (`:157–178`) says it uses neither SA-B85–B86 nor V4.0.Fields. What SA-B85 consumes ("independent measurable Hilbert fields, rectangular decomposable maps, fibrewise unitarity and measure change", `:1391–1393`) is each a stated target of V4.0.Fields (`:361–389`).

**Ownership.** Direct integrals, the completed Hilbert tensor product, the spatial tensor product, Kaplansky density, the bicommutant theorem, Gelfand–Naimark and Sakai: on main and in the open pull requests whose files the brief supplies, every other mention is a consumer citing this folder (main `FreeProbability/README.md:60`, `:329`; main `TypeAHeckeAlgebras/README.md:366`, `:899`; #925 AutomorphicSpectralTheory `:44`, `:149`; #1015 NoncompactQuantumSymmetry `:1830`; #1027 UnboundedOperators `:57`, `:809`; #860 CStarAlgebras `:43`; #874 Subfactors `:187`; #1167 AnalyticNumberTheoryPartII `:106`), except #889 (R01). Ownership against open pull requests whose files the brief did not supply was not checked.

**Pinned declarations opened** (Mathlib `6b7abb3c`, paths library-relative): `Analysis/VonNeumannAlgebra/Basic.lean:45` `WStarAlgebra` (`∃ X …, Nonempty (StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M)`, conjugate-linear), `:67` `VonNeumannAlgebra` (extends `StarSubalgebra ℂ (H →L[ℂ] H)` with `centralizer_centralizer'`), `commutant` (a `VonNeumannAlgebra H`); `Algebra/Star/Subalgebra.lean:312–318` `StarSubalgebra.centralizer R s := Subalgebra.centralizer R (s ∪ star s)` (so `generated s` is the bicommutant of `s ∪ s*`), `:332` `coe_centralizer_centralizer`; `Algebra/Star/StarProjection.lean:26` `IsStarProjection`; `Analysis/InnerProductSpace/Positive.lean` `ContinuousLinearMap.instLoewnerPartialOrder` and `le_def : f ≤ g ↔ (g - f).IsPositive` (the `≤` of `ProjectionSubequivalent` is the Loewner order, as the README `:33` says); `Analysis/LocallyConvex/WeakOperatorTopology.lean:73` `ofCLM`, `:438` `WOTofCLM`; `Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean` (the SOT type `H →Lₚₜ[ℂ] H`); `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:55`, `:246` `PositiveLinearMap.GNS`, `gnsStarAlgHom`; `Analysis/CStarAlgebra/PositiveLinearFunctional.lean:40`, `:74` (R07); `Analysis/CStarAlgebra/Spectrum.lean:266`, `:282` `nnnorm_apply_le`, `norm_apply_le` (contractivity of star homomorphisms, consumed at `:40`); `Analysis/CStarAlgebra/ApproximateUnit.lean` (exists); `Analysis/CStarAlgebra/ContinuousFunctionalCalculus/NonUnital.lean` (exists); `Analysis/InnerProductSpace/TensorProduct.lean:70` `inner_tmul`, `:147` `norm_tmul`, `:347` `commIsometry`, `:602` `mapL` (the README's `:131–134` claims hold; no completion of the tensor product exists at the pin, so V2 owns it); `Analysis/LocallyConvex/WeakDual.lean:184` `dualEmbedding_surjective`, `:193` `rightDualEquiv (hr : B.SeparatingRight) : F ≃ₗ[𝕜] StrongDual 𝕜 (WeakBilin B)`; `Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:1103` `topDualPairing`; `Analysis/LocallyConvex/SeparatingDual.lean:88` `SeparatingDual.eq_zero_of_forall_dual_eq_zero`. Not at the pin: WOT compactness of the unit ball, a Gelfand–Naimark injective representation, a state structure, a Hilbert tensor completion, freeness of `MonoidAlgebra` over a subgroup algebra, an `L∞` ring instance; the README rightly plans these.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree: exit 0, exactly five `declaration uses sorry` warnings (`:39`, `:45`, `:63`, `:77`, `:86`), nothing else. The worker's signature file shows 12 declarations with no dropped binder; I compared each elaborated type with the README: `IsFactor` (`:18` "nonzero identity and scalar centre"), `ProjectionEquivalent`/`Subequivalent` (`:16–17` `v*v=p`, `vv*=q`, `vv*≤q`), `IsCyclic`/`IsSeparating` (V4.Normality `:352`), the bicommutant statement (`:76–77`) agree; no declaration lost a hypothesis. Scratch `#check` lines for the eleven library declarations named above all elaborate.

**Sources read this round** (through the sources service; author-page copies): houdayer-invitation (the 2016–2017 Orsay graduate course), Theorem 3.4 at line 570, page 13: separable H, normal T, `B(σ(T)) → A_T` onto and `L∞(σ(T),μ_T) ≅ A_T`; supports `:157–166`. peterson-notes, Corollary 2.8.7 at line 1510, page 38 (R08), Theorem 2.8.9 at line 1531, pages 38–39: separable abelian von Neumann algebra `≅ ℓ∞K` or `L∞([0,1],λ) ⊕ ℓ∞K`, K countable possibly empty; supports `:181–189` including the empty-set case. jones-vna, §4.5 at line 896, page 29: `M` free left `N`-module of rank `k²` for `N ⊂ M = M_k(N)`, and `ℂG` free left `ℂH`-module of rank `[G:H]`; supports `:203–209`; Example 4.4.4 at line 878, page 29 gives the `M₂⊕ℂ ⊂ M₅⊕M₃` inclusion with matrix `[[2,1],[1,1]]` (`:199`). The five seeded sample targets carry no locator (R03): their mathematics was checked on instances below.

**Computed adversarial pass.** "retain" means the instance confirms the statement.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `IsFactor` (`:23`) | M₂ on ℂ²; diagonal algebra on ℂ²; H = 0 | M₂: 1 ≠ 0, M ∩ M′ = ℂ1, true. Diagonal: e₁₁ ∈ M ∩ M′, not scalar, false. H = 0: `1 = 0`, false, matching README `:18` | retain |
| `ProjectionEquivalent` orientation (`:29`, README `:16–17`) | M₂, p = e₁₁, q = e₂₂, v = e₂₁ | `v*v = e₁₂e₂₁ = e₁₁ = p`, `vv* = e₂₁e₁₂ = e₂₂ = q`; the relation is symmetric so the reversed convention is the same relation | retain |
| `ProjectionSubequivalent` (`:34`) | M₂, p = e₁₁, q = 1, v = e₁₁; p = e₁₁, q = 0 | first: `v*v = e₁₁`, `vv* = e₁₁ ≤ 1` true; second: `vv* ≤ 0` forces `v = 0`, then `v*v = 0 ≠ e₁₁`, false | retain |
| `equivalent_of_subequivalent` (`:45`) | H = 0; M₂ with p ≾ q ≾ p; B(ℓ²) with p = 1, q the projection onto span(e₂, e₃, …) | H = 0: p = q = 0, v = 0 witnesses both sides. M₂: traces force rank p = rank q, equivalent. B(ℓ²): shift S has `S*S = 1`, `SS* = q`, and `q ≤ 1`, so 1 ≾ q ≾ 1 and 1 ~ q by `v = S` | retain, both directions |
| `generated` (`:51`) | s = {e₁₂} in M₂; s = ∅ | {e₁₂, e₂₁}′ = ℂ1, so generated = M₂. ∅: centralizer is B(H), its centralizer ℂ1 | retain (but unused, R04) |
| `double_commutant_iff_isClosed_image_ofCLM` (`:63`) | A = ℂ1; A = finite rank + ℂ1 on ℓ²; H = 0 | ℂ1′′ = B(H)′ = ℂ1, closed: both true. Finite rank + ℂ1: A′′ = B(ℓ²) ≠ A and the WOT closure is B(ℓ²), not closed: both false. H = 0: A = B(0) = {0}, both true | retain |
| `IsCyclic` / `IsSeparating` / iff (`:70–78`) | M₂ on ℂ², ξ = e₁; diagonal algebra, ξ = e₁; diagonal algebra, ξ = e₁+e₂; H = 0 | M₂: Mξ = ℂ², cyclic; M′ = ℂ1 separating: both true. Diagonal, e₁: Mξ = ℂe₁, not cyclic; e₂₂ ∈ M′ kills ξ, not separating: both false. Diagonal, e₁+e₂: Mξ = ℂ², `diag(a,b)(1,1) = 0 ⇒ a = b = 0`: both true. H = 0: `Dense {0}` and `M′ = {0}`: both true | retain, both directions |
| `IsTracial` (`:82`) | tr on M₂; x ↦ x₁₁ | tr(e₁₂e₂₁) = tr(e₂₁e₁₂) = 1. `(e₁₂e₂₁)₁₁ = 1 ≠ 0 = (e₂₁e₁₂)₁₁` | retain (unused, R04) |
| `range_projection_mem_commutant` (`:86`) | K = H, u = 1, π = inclusion; probe | `uu* = 1` commutes. General: `u*π(x) = (π(x*)u)* = (ux*)* = xu*`, so `uu*π(x) = uxu* = π(x)uu*` | retain; one-line, R04 |
| V0 zero algebra has no state (`:50–51`) | A = 0 | the only functional is 0 with norm 0 ≠ 1 | retain |
| V1 ultraweak φ not WOT continuous (`:64–69`) | φ = Σ n⁻² ⟨eₙ,·eₙ⟩, T_F = φ(P_η)⁻¹P_η with η ⊥ F | φ(P_{eₙ}) = n⁻², so ‖T_F‖ = n² unbounded; for ξ ∈ F, T_Fξ = 0, so T_F → 0 SOT; φ(T_F) = 1 | retain |
| V1 `e_m + m e_n` set (`:69–72`) | ultrastrong neighbourhood Σ‖Tξ_k‖² < ε; a sequence x_j | choose m with Σ_k|⟨e_m,ξ_k⟩|² < ε/2 then n with m²Σ_k|⟨e_n,ξ_k⟩|² < ε/2: 0 in the closure. Sequence: m_j bounded gives ⟨e_m, x_j e_m⟩ = 1 infinitely often; m_j → ∞ gives ‖x_j‖ = m_j → ∞, no WOT limit | retain |
| V1 `T_n e₀ = n^(−1/2) Σ_{k≤n} e_k` (`:77–79`) | η square-summable | ‖T_n e₀‖² = n·n⁻¹ = 1; `n^(−1/2)|Σ_{k≤n} η̄_k| ≤ n^(−1/2)|Σ_{k≤N} η_k| + (Σ_{k>N}|η_k|²)^(1/2) → 0` | retain |
| V1 unit-ball WOT-compact criterion (`:88–89`) | A = B(H); A = finite rank + ℂ1 on ℓ² | B(H) ball compact (Alaoglu in S₁*). Finite rank + ℂ1: `Σ_{k≤n} k⁻¹e_k` has norm ≤ 1, lies in A, and converges WOT to `diag(1/k) ∉ A`, so the ball is not WOT closed, hence not compact | retain |
| V2 support projection `SOT-lim (a/‖a‖)^(1/n)` (`:96–98`) | a = diag(1, 1/2, 0); a = 0 | (a/‖a‖)^(1/n) = diag(1, 2^(−1/n), 0) → diag(1,1,0) = support. a = 0 excluded by "a ≠ 0" | retain |
| V2 four unitaries (`:100–101`) | self-adjoint contraction h | `h = (u+u*)/2` with `u = h + i√(1−h²)`, `u*u = h² + 1 − h² = 1`; x = Re x + i Im x gives four | retain |
| V2 Kaplansky parallelogram (`:111–112`) | M₂, p = e₁₁, q = projection onto (1,1)/√2 | p∨q = 1, p∧q = 0: p∨q − p = e₂₂ ~ q = q − p∧q, both rank one | retain |
| V2 `p∧q = SOT-lim (pq)ⁿ` (`:112`) | same p, q | pq has norm 1/√2, (pq)ⁿ → 0 = p∧q | retain |
| V2 `yp = 0 ↔ y c(p) = 0` (`:120–121`) | M = diagonal on ℂ², p = e₁₁, y = e₂₂ ∈ M′ | c(p) = e₁₁ (central), yp = 0 and y c(p) = 0 | retain |
| V2 `ab ≠ 0` in a factor (`:125`) | M = M₂ ⊗ 1 on ℂ²⊗ℂ², a = e₁₁⊗1, b = 1⊗e₂₂ | ab = e₁₁⊗e₂₂ ≠ 0; in the non-factor diagonal ⊕ diagonal, a = e₁₁ ∈ M, b = e₂₂ ∈ M′ gives ab = 0 | retain; factor hypothesis needed |
| V2 `pSp` generates `pMp` (`:126–127`) | M₃, S = {e₁₃+e₃₁, e₂₃+e₃₂, e₁₁, e₂₂, e₃₃} (self-adjoint, S′′ = M₃ since e₁₃e₃₂ = e₁₂), p = e₁₁+e₂₂, S not multiplicatively closed | pSp = {0, 0, e₁₁, e₂₂, 0} generates the diagonal of M₂ ≠ pM₃p = M₂; with S replaced by its multiplicative closure, pSp ∋ p(e₁₃+e₃₁)(e₂₃+e₃₂)p = e₁₂ | retain; the README's "give a counterexample" has no value (R03) |
| V2 tensor zero cases (`:142–147`) | K = 0; M = ℂ on H = ℂ, N = 0 on K = 0; K ≠ 0, x⊗1 = 0 | H⊗̂0 = 0 so M⊗̄N = 0 and the left map is zero, injective iff M = 0 iff H = 0; ℂ → 0 is the zero map. K ≠ 0: pick η ≠ 0, ‖(x⊗1)(ξ⊗η)‖ = ‖xξ‖‖η‖ = 0 forces xξ = 0 | retain |
| V2 `‖x⊗y‖ = ‖x‖‖y‖` at the pin (`:133`) | `norm_tmul` | `Analysis/InnerProductSpace/TensorProduct.lean:147` states it; `inner_tmul :70` | retain |
| V2 coin product on {0,1}^I (`:137–140`) | centred coordinates c_i = x_i − 1/2 | E[c_i c_j] = 0 for i ≠ j, ‖c_i‖² = 1/4: uncountable orthogonal family | retain |
| V2 factoriality of M⊗̄N via slices (`:148–150`) | x ∈ Z(M⊗̄N), ω ∈ N_* | (id⊗ω)(x) ∈ Z(M) = ℂ gives c(ω)·1; symmetric d(φ)·1; φ⊗ω gives c(ω)φ(1) = d(φ)ω(1), so x − λ1 is killed by all slices, x = λ1; slice maps are built at `:147–148` before this use | retain |
| V2 L∞ comparison (`:157–178`) | H = 0; a = diag(1, 1/2, 1/3, …) on ℓ²; the `ℓ∞[0,1]` remark | H = 0: σ(a) = ∅ in the zero ring (every element a unit), μ = 0, both sides 0. Diagonal a: ξ = Σ 2^(−n/2) eₙ is cyclic for W*(a) = ℓ∞, μ = Σ 2^(−n) δ_{1/n}, null sets = ∅, L∞(μ) = ℓ∞ = W*(a). Route: ‖f_n − f_m‖²_{L²(μ)} = Σ_k w_k‖(f_n − f_m)(a)ξ_k‖², each term → 0 and dominated by 4‖T‖²w_k, so Cauchy; the a.e. limit f has |f| ≤ ‖T‖ a.e. | retain; generality R08 |
| V2 abelian classification (`:181–189`) | ℓ∞(ℕ) on ℓ²; L∞[0,1]; zero algebra | atomic part only: K = ℕ; nonatomic only: K = ∅ with the L∞ summand; zero algebra: ℓ∞(∅), matching Peterson's "possibly empty" | retain |
| V3 minimal corner `pMp = ℂp` (`:192`) | M₂, p = e₁₁; p = 1 | e₁₁M₂e₁₁ = ℂe₁₁ minimal; 1·M₂·1 = M₂ ≠ ℂ, not minimal | retain |
| V3 `M₂⊕ℂ ⊂ M₅⊕M₃` (`:199`) | Jones Example 4.4.4 | M₅ ⊇ X⊕X⊕z: 2·2+1 = 5; M₃ ⊇ X⊕z: 2+1 = 3; Λ = [[2,1],[1,1]] | retain |
| V3 no algebraic trace on B(H), dim H = ∞ (`:201–203`) | B(ℓ²) | every operator is a sum of two commutators (Halmos), so [B,B] = B and any trace vanishes; on M_n, [M_n,M_n] = trace-zero matrices of codimension 1 | retain |
| V3 group ring free over subgroup ring (`:203–209`) | Η = {1}, Γ = ℤ, U = λ(1) | `(2−U)⁻¹ = (1/2)Σ(U/2)ⁿ = Σ 2^(−n−1)Uⁿ`, norm-convergent since ‖U‖ = 1; `(2−U)⁻¹δ₀ = Σ 2^(−n−1)δ_n`, infinite support, not a finite combination of the λ(g); `ℂ[ℤ] = ⊕_g ℂ·g` free of rank [ℤ:1] = ∞ over ℂ | retain |
| V4.Core `B(H) = S₁*` (`:224–225`) | H = ℂ²; H = 0 | M₂ with trace norm ↔ M₂ with operator norm, pairing Tr(xh) nondegenerate; H = 0: 0 = 0* | retain |
| V4.Core right-separation route (`:236–244`) | B = S₁(ℂ²), evaluation at b | `rightDualEquiv` with `topDualPairing ℂ B` gives B ≃ (WeakDual ℂ B)*, so a weak-star continuous functional on B(ℂ²) is `h ↦ Tr(xh)` for one x; `SeparatingRight` is the RCLike `SeparatingDual` instance; no reflexivity used | retain |
| V4.Core `WStarAlgebra` equivalence (`:233–236`) | Mathlib's class | `exists_predual` asks `StrongDual ℂ X ≃ₗᵢ⋆[ℂ] M`, conjugate-linear; the README's linear predual M_* corresponds to X = conjugate of M_*; equivalence holds, convention unstated (R02 repair notes it) | retain |
| V4.Core trace-class separability (`:246–260`) | ℓ², rational finite matrices | truncation error ≤ Σ_{j>n} s_j → 0; rank-one term error ≤ ‖u−u′‖‖v‖ + ‖u′‖‖v−v′‖ by `‖u⊗v*‖₁ = ‖u‖‖v‖` (B4 `:247`); countable dense set | retain |
| V4.Core group-algebra annihilator (`:262–263`) | Γ = ℤ/2 | L(Γ) = ℂ² ⊊ M₂ = B(ℓ²Γ), so L(Γ)_⊥ ≠ 0 in S₁ = M₂ and S₁ → L(Γ)* is not injective; for Γ = {1}, L(Γ) = B(ℂ) and the annihilator is 0, so "at least two elements" is needed | retain |
| V4.Core countable decomposability of 0 (`:274–275`) | M = 0 | no nonzero projection, every orthogonal family empty | retain |
| V4.PositivePredual norm formula (`:281–299`) | M₂, φ = Tr(·h), h = diag(2,−1); M = 0 | ‖φ‖ = ‖h‖₁ = 3 = a(1)+b(1) = 2+1 with a = Tr(·e₁₁·2), b = Tr(·e₂₂); M = 0: inf over a = b = 0 is 0 | retain |
| V4.PositivePredual Hermitian lift (`:289–292`) | φ self-adjoint, h a lift | Tr(xh*) = conj Tr(x*h) = conj φ(x*) = φ(x), so h* and (h+h*)/2 lift φ; ‖(h+h*)/2‖₁ ≤ ‖h‖₁ | retain |
| V4.PositivePredual vector domination (`:313–333`) | q ≠ 0, ξ ∈ qH with ‖ξ‖² > φ(q) | f₀ = q would give φ(q) ≥ ω_ξ(q) = ‖ξ‖² > φ(q); `|φ(xe)|² ≤ φ(1)φ(ex*xe) ≤ φ(1)‖xeξ‖²`; `|φ(x(1−e_F))| ≤ ‖x‖φ(1)^(1/2)φ(1−e_F)^(1/2)` by Cauchy–Schwarz; the remark that spectral steps are taken inside the fixed corner is right (projections of a noncommuting increasing net need not increase) | retain |
| V4.PositivePredual faithful normal functional (`:302–311`) | M ≠ 0 countably decomposable; M = 0 | [M′ξ] ∈ M′′ = M; maximal family sums to 1 (else ξ ∈ (1−p)H gives [M′ξ] ≤ 1−p); φ = Σcₙω_{ξₙ}, φ(x) = 0 ⇒ x^(1/2)M′ξₙ = 0 ⇒ x = 0. M = 0: zero functional, no state | retain |
| V4.Normality GNS of φ(a) = a₁₁ on M_n (`:348–349`) | M_n, φ = ⟨e₁, · e₁⟩ | null space {a : ae₁ = 0}, quotient of dimension n, a ↦ ae₁ identifies it with ℂⁿ with cyclic vector e₁ | retain |
| V4.0.Fields two fundamental families (`:364–368`) | (ξₙ) fundamental for S and S′-measurable | ⟨x,ξₙ⟩ measurable for S′-measurable x, so S′ ⊆ S; Gram–Schmidt on (ξₙ) gives S′-measurable orthonormal (ε_k) total in each fibre, and x = Σ⟨ε_k,x⟩ε_k with measurable coefficients, so S ⊆ S′: one-directional hypothesis suffices | retain |
| V4.0.Fields change of measure (`:375–384`) | μ ≪ λ with density r | `∫|f|²dμ = ∫ r|f|²dλ`, so f ↦ √r f is isometric; a λ-section g vanishing where r = 0 is √r·(g/√r on {r > 0}), so onto; for μ ~ ν the inverse is division by √(dμ/dν) | retain |
| V4.0.Fields as SA-B85's supplier (`SelfAdjointSpectralTheory/README.md:690–712`, `:1391`) | the four consumed items | measurable Hilbert fields `:361–364`, rectangular decomposable maps `:371–374`, fibrewise unitarity `:375`, measure change `:376–384`: each present | consistent |

45 rows with computed values; no statement changed.

## Not verifiable

- None of the five seeded sample targets (V4.Core, V4.PositivePredual, V4.Normality, V4.0, V4.0.Fields) carries a locator (R03), so no text could be checked at a locator for them; each was checked on instances in the table.
- Mathlib's `WStarAlgebra` is a conjugate-linear predual; the README's "equivalence with Mathlib's `WStarAlgebra` definition" (`:234`) is read as the linear predual up to conjugation (R02).

## Source issues

- none
