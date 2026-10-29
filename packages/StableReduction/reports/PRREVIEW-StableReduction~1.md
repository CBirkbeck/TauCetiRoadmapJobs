# Review of StableReduction (pull request #898 at bd42ac2)

**Verdict:** needs changes

The pull request's own change (the Layer 2 relative-Proj input pinned to AlgebraicVectorBundles L2A, the valuative-criterion name, the two Stacks tag corrections, the Layer 7 Jacobian paragraph, `lemma` → `theorem`) is sound: every citation it adds resolves, and the dependency direction is correct. The blocking finding is about the acceptance test `TauCetiRoadmap/StableReduction/Suggested.lean` as it stands at this head: it declares, as its own, four carriers that the pinned Tau Ceti now owns, one of them with a different (wider) definition than the README's, and it states no headline theorem. The remaining findings are P3.

## R01 (P2) — `Suggested.lean` redeclares carriers the pinned Tau Ceti owns, and its `Model` is not the README's model

**Location.** `TauCetiRoadmap/StableReduction/Suggested.lean` lines 13–19 (docstring: "families of curves … and finite DVR extensions are all roadmap targets … compiled below"), 50 (`FiniteDVRExtension`), 81 (`Model`), 213 (`NumericalType`), 240 (`arithmeticGenus`), 263 (`Pic`), 266 (`torsion`).

**Claim.** The file's own docstring says the scheme-level vocabulary does not exist at the pin and compiles the "model interface and numerical-type data" as the roadmap's declarations. At the pinned Tau Ceti (`lake-manifest.json` rev `a91d3aa`) every one of these objects already exists, under the roadmap's own suggested home:

- `TauCeti.Model` at `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`, with fields `flat`, `locallyOfFinitePresentation`, `quasiCompact`, **`quasiSeparated`**, `genericFiberIso`, plus `Model.baseChangeHom` (line 76), `Model.Hom` (line 109), `Model.Hom.ext` (line 122) and `Model.IsProper`;
- `TauCeti.FiniteDVRExtension` at `TauCeti/AlgebraicGeometry/Curves/StableReduction/DVRExtension/Basic.lean:85` (the place as `IsLocalization.AtPrime localRing prime` and `prime.LiesOver (maximalIdeal R)`, not an `AlgEquiv` to `Localization.AtPrime`);
- `TauCeti.NumericalType` at `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/Basic.lean:114` (same data; symmetry as `Matrix.IsSymm`), `TauCeti.NumericalType.arithmeticGenus` at line 320 of the same file (identical formula), `TauCeti.NumericalType.Pic` at `…/Picard/Basic.lean:204`, `TauCeti.NumericalType.torsion` at `…/Picard/Torsion/Basic.lean:45`;
- `TauCeti.AlgebraicGeometry.FamilyOfCurves` at `TauCeti/AlgebraicGeometry/Curves/Family.lean:56`.

So the acceptance test gives a second owner to four objects (defect class 6, two owners for one object). The duplicate is also not the README's object: README line 160 says a model is "a flat finitely presented morphism X → Spec R"; finite presentation is locally of finite presentation plus quasi-compact plus quasi-separated, which is exactly how Tau Ceti's `Model` records it, while `Suggested.lean` line 81 omits `QuasiSeparated`.

**Witness.** Instance: take `R` any DVR and `X` the affine plane over `R` with its origin doubled along a non-quasi-compact open (the standard non-quasi-separated scheme), with its flat locally finitely presented structure map; it satisfies every field of `Suggested.lean`'s `Model` but is not a `TauCeti.Model` and not a model in the sense of README line 160. Library witness: `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44` (field `quasiSeparated`) versus `Suggested.lean:86–88`. The docstring's "pinned Mathlib commit `05ae0103…`" (line 14) is not the pin: `lake-manifest.json` pins Mathlib `6b7abb3c`.

**Repair.** Delete lines 37–338 (the private `genericPointMap`, `genericFiber`, `FiniteDVRExtension`, `Model` with its category instance and lemmas, `DualGraph`, `NumericalType` with `Pic`/`torsion`, the three private examples and six `example`s). In the README, cite the pinned declarations by name in a `From Tau Ceti` supplier paragraph (`TauCeti.Model`, `TauCeti.FiniteDVRExtension`, `TauCeti.AlgebraicGeometry.FamilyOfCurves`, `TauCeti.NumericalType`, `TauCeti.NumericalType.Pic`, `TauCeti.NumericalType.torsion`, `TauCeti.NumericalType.finrank_torsion_le_arithmeticGenus`). Rewrite the module docstring to list the headline theorems (end goals 1–6 of README lines 34–64) and, for each, the carrier the pin lacks: an at-worst-nodal predicate, `PrestableFamily`/`StableFamily`, pointed families with sections, `HasNodalReduction`, `PrestableMap`/`IsStableMap` (none of these names occurs in the pinned Tau Ceti; checked by grep). Drop the Mathlib commit from the docstring. If a statable statement is wanted so the file is not empty, the one Layer 5 milestone statable at the pin is existence of a proper regular model: for `toK : C ⟶ Spec K` with `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` (`Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40`), there is `M : TauCeti.Model R K C toK` with `M.IsProper` and `IsRegularLocalRing (M.total.presheaf.stalk x)` for every `x`; this needs `import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic` and nothing else.

## R02 (P3) — Padding in `Suggested.lean`

**Location.** `TauCetiRoadmap/StableReduction/Suggested.lean` lines 123–163 (`Hom.ext`, `baseChangeHom_id`, `baseChangeHom_comp`, the `Category` instance), 252–256 (`principalDivisor_mul_weight`), 270–336 (three private example types and six proved `example`s).

**Claim.** The file has no `sorry` at all. Its proved content is API lemmas on a definition (category laws, an `ext` lemma, exact division) and value computations: genus 3, −1 and 2 and the relations `(-1, 1)`, `(1, -1)`, `(-2, 1)` for the two-component types. These are exactly the README's Checks at lines 788–794 ("verify … g(T) = 3", "the first weighted relation is (−2,1)", "test … a type with odd diagonal entries").

**Witness.** `Suggested.lean:290` (`weightedExample.arithmeticGenus = 3`) against README line 789; `Suggested.lean:308` (`principalDivisor 0 = ![-2, 1]`) against README line 792. The one-tactic probe does not apply (nothing is sorried); each `example` closes by `decide` or `norm_num` as written.

**Repair.** Delete them from `Suggested.lean` (the README keeps the Checks). Subsumed by R01's repair.

## R03 (P3) — The README's inventory contradicts the pin and carries process narrative

**Location.** `TauCetiRoadmap/StableReduction/README.md` lines 184–186 ("checked on 2026-08-26 against Tau Ceti commit `e8af08d…` and … Mathlib … `05ae0103…`"), 254–273 ("The audit found no … intention", four Mathlib pull-request numbers, "Recheck … Lean Zulip"), 277–283 ("There is presently no scheme-level API for families of curves, relative dimension at most one, … Fitting ideals, the sheaf Ω_{X/S}, syntomic morphisms, … the relative singular locus, … numerical types").

**Claim.** At the pin, `TauCeti.AlgebraicGeometry.FamilyOfCurves` (`Curves/Family.lean:56`), `RelativeDimensionLE` (`Morphisms/RelativeDimension.lean:84`), `PureRelativeDimension` (`Morphisms/PureRelativeDimension.lean:79`), `fittingIdeal` (`RingTheory/FittingIdeal/Basic.lean:343`), `IsStandardSyntomicOfRelativeDimension` (`RingTheory/Syntomic/StandardSyntomic.lean:81`) and `NumericalType` exist; the "missing" list is false for six of its items, and an implementer who trusts it builds a second one. The dated commits, the audit narrative and the Mathlib pull-request numbers are process text (house rule: timeless, no pull-request references).

**Witness.** README line 277–279 versus `TauCeti/AlgebraicGeometry/Curves/Family.lean:56`; README line 186 versus `lake-manifest.json` (Mathlib rev `6b7abb3c`, Tau Ceti rev `a91d3aa`).

**Repair.** Replace the two inventories by `## Exact supplier contracts` paragraphs `From Mathlib` and `From Tau Ceti` that name the pinned declarations (the list in R01 plus the five above, and Mathlib's `AlgebraicGeometry.IsProper.eq_valuativeCriterion`, `ValuativeCommSq`, `ValuativeCriterion.Existence`/`.Uniqueness`, `Scheme.Hom.smoothLocus`, `SheafOfModules.IsQuasicoherent`/`IsFinitePresentation`, `Scheme.Hom.fiber`, `GeometricallyConnected`, all confirmed at the pin). Keep "what is missing" to the carriers that are actually absent (nodal predicate, dualizing sheaf, prestable/stable families, markings, stable maps, blowups of ideal sheaves, intersection theory, minimal models). Remove the dates, the audit sentence and the Mathlib pull-request links.

## R04 (P3) — The Jacobian-criterion deferral drops the residue-field hypothesis and does not name the owner

**Location.** `TauCetiRoadmap/StableReduction/README.md` lines 573–584 (new in this pull request).

**Claim.** The paragraph cites "Deligne–Mumford, Theorem 2.4" for the equivalence of nodal reduction of `C` and semistable reduction of its Jacobian, and defers it to "the roadmap that owns Néron models of abelian varieties". Deligne–Mumford's §2 is written under the standing assumption that the residue field is algebraically closed (`deligne-mumford-numdam` line 495), and Stacks Remark 55.18.2 states the criterion "if the residue field is perfect" (`stacks-0CEK` lines 3976–3980). The text this pull request replaced said "under additional residue-field hypotheses"; the new text says nothing, so the deferred statement reads as unconditional. The owner exists and is not named: `NeronModelsAndSemistableAbelianVarieties` §3.9 "The Picard identity component is the Néron identity component" (that roadmap lists StableReduction Layers 0–7 among its suppliers, so the direction is right).

**Witness.** `deligne-mumford-numdam` line 495: residue field assumed algebraically closed; line 556: Theorem (2.4). `stacks-0CEK` line 3978–3979.

**Repair.** Write: "… (Deligne–Mumford, Theorem 2.4, for a DVR with algebraically closed residue field; Stacks Remark 55.18.2 records it for perfect residue fields) is not a target of this roadmap; it is stated in NeronModelsAndSemistableAbelianVarieties §3.9 after its Picard–Néron comparison."

## R05 (P3) — Locator: Stacks 0E6N does not give the syntomic-through-smooth-embedding construction

**Location.** `TauCetiRoadmap/StableReduction/README.md` lines 371–373: "Construct the nodal case cheaply as the relative dualizing sheaf of a syntomic morphism through a smooth embedding, as in Stacks tag 0E6N."

**Claim.** Moduli of Curves §19 (tag 0E6N) defines `ω_{X/S}` as `H^{-1}` of the relative dualizing complex `f^!𝒪_S`, proves flatness and base change for Cohen–Macaulay fibres (Lemma 19.1, `stacks-0E6N` lines 865–887) and records that Gorenstein fibres give an invertible sheaf by citing Algebraic Curves (lines 862–864). The word "syntomic" and any embedding into a smooth scheme do not occur in the section.

**Witness.** `stacks-0E6N` lines 823–891 (no occurrence of syntomic, embedding or Koszul; checked by search).

**Repair.** Cite 0E6N for the definition, the Gorenstein invertibility and the base-change property, and cite the Duality for Schemes section that proves the lci formula `ω = det(Ω_{P/S}|_X) ⊗ det(𝒩)^{-1}` for the "syntomic through a smooth embedding" clause, or drop "as in Stacks tag 0E6N" from that clause.

## R06 (P3) — README shape

**Location.** `TauCetiRoadmap/StableReduction/README.md`, whole file.

**Claim.** The README predates the house shape: it has no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (the contract table at lines 235–243 is the nearest thing), no `### k.n` subsections, no `*Needs:*` lines, no per-definition `**Checks.**` lists (the acceptance examples at lines 773–830 are one global list), and no `### Examples`/`### Dependencies` per layer. Terminology is defined where used and every layer states what it consumes in prose, so this is a form note for the next full revision, not a content defect.

**Repair.** Restructure on the next revision that touches the layers; this pull request need not do it.

## Verified sound

**Gate.** The worker's gate at bd42ac2 passes every check (`gate.md`: build, depcheck, stray-files, set_option, imports all 0). I elaborated `TauCetiRoadmap/StableReduction/Suggested.lean` with `lake env lean` from the worktree: exit 0, the only output is the `#check` line `IsProper.eq_valuativeCriterion : @IsProper = ValuativeCriterion ⊓ @QuasiCompact ⊓ @QuasiSeparated ⊓ @LocallyOfFiniteType`, no warnings (there is no `sorry`). The 27 elaborated signatures in the worker's `signatures.md` lose no section binder; `FiniteDVRExtension` and `Model` carry `[IsDomain R] [IsDiscreteValuationRing R] [IsFractionRing R K]` explicitly, as the README requires.

**Dependency check.** Run as instructed with `--movable`:

```
depcheck: 200 roadmaps, 1319 edges, 0 problem(s)
```

No UPWARD or CYCLE line. StableReduction and AlgebraicVectorBundles are both on main and not in the merge order; the check places them by supplier.

**Pull request scope.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StableReduction'` is empty: no change outside the folder. `STATUS.md`, `PROGRESS.md` and `metadata.toml` are the generated companions already on main (gate `stray-files=0`).

**Cross-roadmap citations, resolved now.**

| Citation (README line) | Resolved at |
| --- | --- |
| AlgebraicVectorBundles L2A, `GradedObject`-based quasicoherent algebra, affine graded-ring, localization and base-change interfaces (382–385) | main, `TauCetiRoadmap/AlgebraicVectorBundles/README.md:306–327`: "### L2A — structured linear schemes … Export the affine graded-ring interface … localization, affine-restriction and arbitrary-base-change comparisons … shared input interface for StableReduction Layer2's relative Proj". Direction: AVB supplies, StableReduction consumes; AVB names StableReduction only as a consumer. The open AVB head (rev 1221) keeps the L2A label (its line 154) and the interface (line 406). |
| JacobianChallenge Layers A–F (237–243, 245–250, 837, 850) | main, `TauCetiRoadmap/JacobianChallenge/README.md:111, 135, 143, 218, 332, 448`; Jacobian line 171 names StableReduction's contract J-C, consistent. |
| EllipticCurves `ReductionSymbol` left to this roadmap (269–271) | main, `TauCetiRoadmap/EllipticCurves/README.md:819, 865` ("until a geometric comparison exists"). |
| SchemeAndStackFoundations (pull-request description only) | not cited in the README; nothing to resolve. |

Ownership of the Deligne–Mumford Jacobian criterion: `roadmaps grep` for "semistable reduction of (the|its) Jacobian" and "Jacobian has semi" matches nothing on main or at any open head; `StableReductionPartII` exists in the merge order but has no readable folder; the Néron roadmap's §3.9 (read through `roadmaps show`) is the natural owner (R04). Ownership against open pull requests without files in this brief was not checked beyond the `roadmaps grep` tool.

**Library declarations opened at the pins.** Mathlib `6b7abb3c`: `IsProper.eq_valuativeCriterion`, `ValuativeCommSq` (`AlgebraicGeometry/ValuativeCriterion.lean:53`), `ValuativeCriterion.Existence`/`Uniqueness` (lines 78, 83) and its "Future projects: show that it suffices to check discrete valuation rings when the base is Noetherian" (line 28–29, confirming README lines 208–209); `Scheme.Hom.smoothLocus` (`Morphisms/Smooth.lean:300`); `SheafOfModules.IsQuasicoherent`/`IsFinitePresentation` (`Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:253, 269`); `Scheme.Hom.fiber` (`AlgebraicGeometry/Fiber.lean:37`); `Geometrically/{Connected,Integral,Irreducible,Reduced}.lean` present; `IsDiscreteValuationRing` (`RingTheory/DiscreteValuationRing/Basic.lean:56`); `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:51`); `Proj.toSpecZero` proper (`ProjectiveSpectrum/Proper.lean:372`). No `Syntomic`, `IsProjective` or relative `Proj` in Mathlib's `AlgebraicGeometry/` at the pin, as the README's inventory says. Tau Ceti `a91d3aa`: the declarations listed in R01 and R03, plus `NumericalType.finrank_torsion_le_arithmeticGenus` (`Picard/Torsion/Genus.lean:116`) and `exists_chain_or_fork_or_exceptional` (`NumericalType/Classification.lean:215`).

**Source sample (18 locators read at the text).**

| README claim (line) | Source and locator | Result |
| --- | --- | --- |
| Numerical type axioms: nonempty finite set, `mᵢ, wᵢ > 0`, `gᵢ ≥ 0`, symmetric `A` with `aᵢⱼ ≥ 0` off-diagonal, connected, `Σⱼ aᵢⱼ mⱼ = 0`, `wᵢ ∣ aᵢⱼ` (514–519) | `stacks-0C6Z` lines 257–266, Definition 3.1 | matches, condition by condition |
| Signed genus `1 + Σ mᵢ(wᵢ(gᵢ−1) − aᵢᵢ/2)`, `Σ mᵢ aᵢᵢ` even, negative genus possible (525–528) | `stacks-0C71` lines 275–309, Lemma 3.3, Definition 3.4 | matches; the evenness proof is the one sketched below |
| `Pic(T) = Coker(eᵢ ↦ Σⱼ (aᵢⱼ/wⱼ) eⱼ)`, injection into `Coker(A)` (529–533) | `stacks-0C7H` lines 514–531, Definition 4.1, Lemma 4.3 | matches (the prose "matrix (aᵢⱼ/wᵢ)" is the same map in column convention, not a misprint) |
| Theorem 55.18.1 at tag 0CDN; `B_g = (2g−2)(ℓ^(2g))!`, `ℓ' < ℓ` first primes `> 768g` (563–566) | `stacks-0CDN` lines 3943–3967, (18.0.1) and Theorem 18.1 | matches; the corrected tag is right (0CDM is the section) |
| Genus 0: degree-2 separable extension, `C_{K'} ≅ ℙ¹` (559–560) | `stacks-0CDN` lines 3955–3958, part (1) | matches |
| Genus 1: smooth genus-one curve or cycle of rational curves (561–562) | `stacks-0CDN` lines 3959–3963, part (2) | matches |
| Simultaneous form over every maximal ideal of the integral closure (567–570) | `stacks-0CDN` lines 3964–3967, part (3); `stacks-0E98` lines 1444–1453, Theorem 24.3 (1)–(2) | matches both forms of end goal 1 |
| "the Stacks proof takes `ℓ > 768g`" (549) | `stacks-0CEI` lines 3902–3906; `stacks-0C6Z` lines 2750–2755, Proposition 7.4 | matches |
| Remark 55.18.2 at 0CEK on the Jacobian comparison (577) | `stacks-0CEK` lines 3976–3984 | tag right; hypothesis "residue field perfect" not carried (R04) |
| Moduli of Curves §109.24 and Algebraic Curves §§53.23–53.25 (15, 593) | `stacks-0C6Z` lines 4041, 4043, 4104 (chapter list: 53, 55, 109); `stacks-0E8C` line 1373 (§24); `stacks-0E7N` lines 2628, 2748, 2908 (§§23–25) | matches |
| Prestable = nodal of relative dimension 1 with universal `f_*𝒪_X = 𝒪_S` (411–413) | `stacks-0E6S` lines 922–932, Definition 20.1 | matches |
| Semistable ⟺ no rational tails ⟺ `ω^{⊗m}` globally generated, `m ≥ 2`, genus `≥ 1` (414–416) | `stacks-0E6X` lines 982–985, Lemma 21.1 | matches |
| Stable ⟺ no tails or bridges ⟺ `ω` ample, genus `≥ 2` (416–417) | `stacks-0E73` lines 1095–1099, Lemma 22.1 | matches |
| Stabilization via stack descent at 0E8A (612–613) | `stacks-0E8A` lines 1323–1340, Lemma 23.4 | matches: `𝒪_Y = c_*𝒪_X`, `R¹c_*𝒪_X = 0` universally, fibrewise contraction, uniqueness |
| Relative dualizing sheaf, Gorenstein ⇒ invertible, base change (369–371) | `stacks-0E6N` lines 862–891 | matches for these three claims; not for the syntomic construction (R05) |
| Deligne–Mumford Corollary 2.7 (889) and Theorem 2.4 (576) | `deligne-mumford-numdam` lines 678–681, 556 | Cor 2.7 is the stable reduction theorem as cited; Thm 2.4 under algebraically closed residue field (line 495) |
| Behrend–Manin Prop. 3.10, Lemmas 3.11–3.12 at page 22 (731) | `behrend-manin` lines 872–912 | page and numbering match; `L = ω_C(Σxᵢ) ⊗ f^*M^{⊗3}`, generation, `H¹ = 0`, normal generation as the README states |
| Fulton–Pandharipande stability definition (903–905) | `fulton-pandharipande` lines 238–252 | matches, including that the genus-one condition matters only for `g = 1, n = 0, β = 0` (README line 743) |
| Knudsen II §1 contraction, stabilization, clutching (895–896) | `knudsen-ii` lines 31–54, 135–154, 280, 423 | §1 contraction with Main Lemma 1.6, §2 stabilization, §3 clutching: supports the citation |

**Adversarial table.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `NumericalType.arithmeticGenus` (Lean 240; README 525) | `weightedExample` m=(1,1), w=(2,2), g=(1,1), A=[[−2,2],[2,−2]] | `1 + Σ m w (g−1) − (Σ m aᵢᵢ)/2 = 1 + 0 − (−4)/2 = 3`; Stacks formula `1 + Σ mᵢ(wᵢ(gᵢ−1) − aᵢᵢ/2) = 1 + (1 + 1) = 3` | agree | none |
| same | genus-0 variant of the same type | `1 + (−2 −2) − (−2) = −1` (negative, as README 528 warns) | agree | none |
| same | `oddDiagonalExample` w=(1,1), A=[[−1,1],[1,−1]], g=(1,1) | `1 + 0 − (−2)/2 = 2`; individual halves `−1/2` not integers, sum `−2` even | agree; the single halving is needed | none |
| same | `n = 1` type: `fiber_relation` forces `m₁ a₁₁ = 0`, so `a₁₁ = 0`; genus `1 + m₁w₁(g₁−1)` | equals Stacks Lemma 3.5 (`stacks-0C6Z` lines 310–311) | agree | none |
| Evenness of `Σ mᵢ aᵢᵢ` (README 526) | general type | multiply row relation by `mᵢ` and sum: `Σ mᵢ² aᵢᵢ = −2 Σ_{i<j} mᵢ mⱼ aᵢⱼ`; `mᵢ² ≡ mᵢ (mod 2)` | even | none |
| `Pic(T)` weighted vs raw cokernel (README 788–790) | `weightedExample` | weighted rows `(−2/2, 2/2) = (−1,1)` and `(1,−1)`: `ℤ²/⟨(−1,1)⟩ ≅ ℤ`; raw rows `(−2,2)`: `ℤ²/⟨(−2,2)⟩ ≅ ℤ ⊕ ℤ/2` | agree with README | none |
| same, mixed weights (README 791–792) | w=(1,2) | `e₀ ↦ (−2/1, 2/2) = (−2, 1)`, `e₁ ↦ (2/1, −2/2) = (2, −1)`; rank 1 as Lemma 4.2 requires; cokernel `ℤ` | agree; division by the destination weight `wⱼ` | none |
| `principalDivisor_mul_weight` (Lean 252) | needs `wⱼ ∣ aᵢⱼ`; the axiom gives `wᵢ ∣ aᵢⱼ` | symmetry `aᵢⱼ = aⱼᵢ` and `wⱼ ∣ aⱼᵢ` close it, as the proof does | sound | none |
| `DualGraph.firstBetti = E + 1 − V` in ℕ (Lean 202) | single vertex, no edge: `0+1−1 = 0`; tree on V vertices: `(V−1)+1−V = 0`; cycle of r: `r+1−r = 1`; connectedness forces `E ≥ V−1` so no truncation; empty graph excluded by `Nonempty` (it would give `0+1−0 = 1`, the spurious genus-one curve of README 786) | junk value never reached | sound | none |
| Dual-graph genus `Σ g_v + b₁` (README 348, 783–787) | two smooth components, one node: `g₁+g₂+0`; cycle of r rational curves: `0 + 1 = 1` | matches normalization sequence values | agree | none |
| `Model` fields vs README 160 | non-quasi-separated flat lfp `X → Spec R` | admitted by Lean 81–89, excluded by "finitely presented" and by `TauCeti.Model` | mismatch | R01 |
| `genericFiber` (Lean 42) | `pullback.snd toBase (Spec K → Spec R)` | an object of `Over (Spec K)`, i.e. `X ×_R K → Spec K` | right direction | none |
| `FiniteDVRExtension` (Lean 50) | `prime.comap = maximalIdeal R` and `localRing ≃ₐ[R] Localization.AtPrime prime` with a DVR instance | a maximal ideal of the integral closure (Dedekind) over `m_R`; the localization is a DVR, consistent with the assumed instance | sound but duplicated | R01 |
| `deg(ω_X|_E) = 2g(Ẽ) − 2 + #branches` (README 376–378) | cycle of r rational curves: each `E` has 2 branches, degree `0`, total `0 = 2·1−2`; rational tail: `−2+1 = −1`; rational bridge: `−2+2 = 0`; nodal rational curve (one self-node): `−2+2 = 0`, genus 1 | agree with README 795–797 | sound | none |
| Knudsen zero-degree components (README 453–457) | stable `(n+1)`-pointed fibre, remove `p`; only the component through `p` drops by 1 | degree `≥ 1` before, so `≥ 0` after; zero only on a rational component with three special points one of which is `p`: a one-marked tail or an unmarked bridge; `p` lies on one component, so at most one | agree | none |
| Stable-map vertex inequality (README 719–721) | `deg(ω(Σs)⊗F^*L^3)|_E = 2g_v − 2 + val + n_v + 3d_v` | positive-degree vertex automatic; `d_v = 0` reduces to pointed stability | agree | none |
| Excluded types for forgetting a marking (README 741–743) | `d = 0`: `2g−2+n' > 0` fails exactly for `(0, n' ≤ 2)` and `(1, 0)`; `d > 0`: never fails | matches `fulton-pandharipande` line 251 | agree | none |
| Genus-zero non-uniqueness (README 808–810) | `T₁T₂ = πT₀²` in `ℙ²_R`: affine chart `xy = π`, regular; special fibre two lines, each `(−1)` | two contractions to two smooth models with different generic identifications | agree | none |
| Node regularity (README 779–781) | `R[x,y]/(xy − πⁿ)` at `(π,x,y)`: `n ≥ 2` puts `πⁿ ∈ m²`, so `dim m/m² = 3 > 2` | regular iff `n ≤ 1`; proved at the pin (`TauCeti/RingTheory/RegularLocalRing/Node.lean`) | agree | none |
| `HasNodalReduction` versus `SemistableFamily` (README 555–558) | Stacks Definition 14.6 ("has semistable reduction" = some proper nodal model) at `stacks-0E8C` line 1377 | the README keeps the two notions apart as the source does | agree | none |
| Contraction descent (README 403–407) | hypotheses: proper surjective, `𝒪_Y = c_*𝒪_X` universally, target separated, constancy on geometric fibres | matches the hypotheses of Lemma 23.4's use (`stacks-0E8A`) and Behrend–Manin Lemma 2.2 (`behrend-manin` line 888) | no overclaim | none |
| Valuative-criterion inventory (README 205–209) | `IsProper.eq_valuativeCriterion` elaborates to `ValuativeCriterion ⊓ QuasiCompact ⊓ QuasiSeparated ⊓ LocallyOfFiniteType` | the file's "future projects" line matches README 208–209 | agree | none |

**Headline theorems and padding.** Headlines are the six end goals (README lines 34–64). None is statable at the pin: the pinned Tau Ceti has no at-worst-nodal predicate, no `PrestableFamily`/`StableFamily`, no pointed family, no `PrestableMap` (grep over the pinned `TauCeti/` for `AtWorstNodal`, `StableFamily`, `PrestableMap`: no file). The docstring says so, but names carriers that do exist (R01). No sorried declaration exists to probe; the proved content is padding (R02).

**Declared gaps.** None declared (no `design/plan.json`); the README states no `gap:` contracts.

## Not verifiable

- Artin–Winters, *Degenerate fibres and stable reduction of curves*, Topology 10 (1971): DOI prefix of a paywalled publisher; the sources service records it as `uncertified`. The README cites it only as a general reference without a locator, so no claim depends on reading it.
- Q. Liu, *Algebraic Geometry and Arithmetic Curves*; Mumford–Fogarty–Kirwan; Gieseker: cited without locators as background; not fetched.
- Deligne–Mumford via the Centre Mersenne landing page is unclassified for the service; the Numdam copy (`deligne-mumford-numdam`) was read instead, so nothing is missing.

## Source issues

- none
