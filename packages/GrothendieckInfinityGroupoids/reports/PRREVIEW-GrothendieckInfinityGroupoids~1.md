# Review of GrothendieckInfinityGroupoids (pull request #1060 at e36a7fa)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/GrothendieckInfinityGroupoids/README.md` and `Suggested.lean`. The gate fails (`set_option`), the dependency check passes (0 problems), and `Suggested.lean` states no headline theorem. Four blocking findings (R01–R04), seven notes.

## R01 (P2) — `Suggested.lean` states no headline theorem

- Location: `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` lines 7–12 ("The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap") and lines 276–295.
- Claim: the file is the roadmap's acceptance test and states its headline theorems, or names in its docstring each headline that is not statable and the carrier it lacks.
- Witness: the README's headlines are Ara 2013 Theorem 8.7 (`π_n(Π_∞^R X, x) ≅ π_n(X, x)`), Corollaries 8.9–8.11 (`Π_∞^R f` weak equivalence iff `f` weak homotopy equivalence), Proposition 5.5 / Corollary 8.8 and Theorem 4.18 (README lines 9–12, 204–210, 223–227). None is in the file. The only `sorry`'d theorem, `piPresheaf_isGlobular`, closes with the single term `fun T v hv => hR T X v hv` (probe elaborated at the pin: no error), so it is a restatement of its hypothesis, not a headline. The docstring names layers "not prototyped" but no headline and no missing carrier.
- Repair: (a) define, on `InfinityGroupoid C`, `π₀ X := Quot (Joined 0)` on `X.obj (op (C.disks.disk 0))` and `π_n(X, x)` as the quotient by `Joined` of the `n`-cells whose source and target are the iterated unit `1^{n−1}_x`, the unit `κ_m : D_{m+1} ⟶ D_m` chosen by `Classical.choose` on `C.contractible` applied to the pair `(incl (Table.globe m) 0, incl (Table.globe m) 0)` (which is admissible: `dim = m ≤ m + 1`, parallel); then state Theorem 8.7 as `Nonempty (π_n ((piPresheaf C R).obj X, x) ≃ HomotopyGroup (Fin n) X x)` under the hypothesis `hR`, and Corollary 8.11 as `weTop f ↔ (bijective on π₀ and on every π_n)` for `Π_∞^R f`; or (b) if the group structure is judged not statable, say so in the docstring, naming Theorem 8.7, Corollaries 8.9–8.11 and Proposition 5.5 and the missing carrier (the group structure on `π_n` of a model, Layer 4.1), and state the set-level comparison. Either way, rewrite the module docstring in the acceptance-test form (the file states the headline theorems against the pinned APIs; it is not an API catalogue).

## R02 (P2) — `set_option` in `Suggested.lean` (gate fails)

- Location: `TauCetiRoadmap/GrothendieckInfinityGroupoids/Suggested.lean` line 4: `set_option autoImplicit false`.
- Claim: no `set_option` of any kind.
- Witness: the gate reports `set_option=1 … FAIL`; the file elaborates without the option (every binder is explicit).
- Repair: delete line 4.

## R03 (P2) — Weak homotopy equivalences: wrong owner, declarations that do not exist at the pin, and a duplicate body

- Location: `README.md` line 55 ("[AlgebraicTopology], implemented in Tau Ceti | … `ContinuousMap.IsWeakHomotopyEquivalence` with `comp`, `of_postcomp`, `of_precomp` (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`); `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean`"), lines 69–78 ("What Mathlib and Tau Ceti already have … `ContinuousMap.IsWeakHomotopyEquivalence` with `comp`, `of_postcomp`, `of_precomp`, `HomotopyEquiv.isWeakHomotopyEquivalence`"), line 57 (`TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean`), line 114; `Suggested.lean` lines 23–26 and 258–265.
- Claim: Tau Ceti at the pin has these declarations and AlgebraicTopology owns them.
- Witness: at Tau Ceti `a91d3aa` the directory `TauCeti/Topology/Homotopy/HomotopyGroup/` has no `WeakHomotopyEquivalence.lean`, `TauCeti/AlgebraicTopology/` has no `Homotopy/` and no `SimplicialSet/KanComplex/`, and `IsWeakHomotopyEquivalence` occurs nowhere in the pinned sources; the AlgebraicTopology README on main never names `IsWeakHomotopyEquivalence`, `of_postcomp` or `of_precomp`. The owner is StableHomotopyKTheory §2.1 ("Weak homotopy equivalences of spaces"): `TauCeti.IsWeakHomotopyEquivalence` (bijective `π₀` and every positive `π_n` at every basepoint) and `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence`, with the same two-out-of-three API; `weTop` (lines 262–266) restates its body (path components via `HomotopyGroup (Fin 0)`, which is `ZerothHomotopy` by Mathlib's `HomotopyGroup.pi0EquivZerothHomotopy`).
- Repair: in the table row, the "already have" list, Conventions and `Suggested.lean` docstrings, cite StableHomotopyKTheory §2.1 by name and section as the owner of weak homotopy equivalences; delete the nonexistent file paths and lemma names (`of_postcomp`, `of_precomp`, `Whitehead.lean`, `KanComplex/HomotopyGroup.lean`) and the "implemented in Tau Ceti"/"already have" claims; keep `weTop` only as the `MorphismProperty` form of that predicate with a docstring saying so, or delete it together with `localizedFunctor` (R09). Whitehead's theorem for CW complexes is AlgebraicTopology Stage 8 (README on main, lines 1602 and 1700); cite it that way if it is needed, and only if some layer consumes it (none does).

## R04 (P2) — Table-indexed globular extensions exclude `TopCat`, which Layers 2.5, 5.1 and 7.2 use

- Location: `README.md` lines 96–101 ("This roadmap works with globular extensions whose objects are indexed by tables … Ara 2013, Remark 2.6, notes that this is the natural restriction"), line 152 ("Globular extensions (objects indexed by tables …)"), lines 117–119 and 197–198 ("`TopCat` … is a contractible globular extension"), lines 223–226 (Proposition 5.5); `Suggested.lean` lines 185–200 (`ofTable_bijective`).
- Claim: the scope section's notion of globular extension covers every globular extension the proof plan uses.
- Witness: `TopCat` has objects not indexed by tables, so it is not a `GlobularExtension` of `Suggested.lean` and not a globular extension in the Conventions' sense; yet 2.5 applies Proposition 2.14 to `E = TopCat`, 5.1 states "`TopCat` as a contractible globular extension", and 7.2 cites Proposition 5.5, which is a statement about `∞-Gpd_M` for `M` a *cocomplete* contractible globular extension (ara2013 line 1745–1748, `M = Top`). Ara's Remark 2.6 says the opposite of what line 101 reports: he considered restricting to table-indexed objects and "chose not to do so for technical reasons (see for instance Proposition 5.5)" (ara2013 line 437–439).
- Repair: define globular extensions in Ara's generality (1.4): a category with a coglobular object and, as data, a chosen globular sum for every table (`sum : Table → Obj`, `incl`, `incl_compatible`, `isGlobularSum`), no bijectivity; make the table-indexed ones (globular extensions under `Θ₀` bijective on objects, Ara 1.13 and 2.9–2.10) the special case used for `Θ₀`, `C[A]` and coherators, with the field `disks.disk n = ofTable (Table.globe n)` (see R10). Correct line 101 to what Remark 2.6 says. `TopCat` then is a contractible globular extension and 2.5, 5.1 and 7.2 are statable.

## R05 (P3) — The gluing convention is the mirror image of the one it cites

- Location: `README.md` lines 91–93 ("glued by target on the left and source on the right"), lines 269–271; `Suggested.lean` lines 175–179 (`Compatible`: target face on `castSucc`, source face on `succ`) and docstring line 15.
- Claim: this is Ara 2013, 1.3.
- Witness: Ara's globular sum of a table is `(D_{i₁}, σ) ⊔_{D_{i'₁}} (τ, D_{i₂}, σ) ⊔ …`: the source face lands in the left disk and the target face in the right one (ara2013 line 254–262), and consistently `s(v ∗ u) = s p₂`, `t(v ∗ u) = t p₁` (line 553–555). The roadmap's convention (also the openai comparator's `attach`, verified: left leg `face hl true ≫ prev`, right leg `face hr false`) is the mirror image. Nothing becomes false: the two conventions are exchanged by reversing tables.
- Repair: either adopt Ara's orientation or say that tables are read in the opposite order from Ara 1.3, and pin the choice by the two-term witness: in `D₁ ⊔_{D₀} D₁` the left `1`-cell `u : a → b` and the right `1`-cell `v : b → c` share `t(u) = s(v)`.

## R06 (P3) — Off-by-one in the definition of `π_n`

- Location: `README.md` lines 111–112: "`π_n(X, x)` is the set of `n`-cells from `1^n_x` to `1^n_x` modulo …".
- Claim: matches Ara 2013, 4.11.
- Witness: an `n`-cell has `(n−1)`-cells as source and target; Ara sets `π_n(G, x) = π_n(G, k₀^{n−1}(x))`, the `n`-arrows from the `(n−1)`-fold unit of `x` to itself modulo `∼_n` (ara2013 line 1404–1410). The README's own openai paragraph (line 279–280) has the correct indexing.
- Repair: write `1^{n−1}_x`.

## R07 (P3) — Process narrative and pull-request references in the README and docstrings

- Location: `README.md` lines 52 and 54 (links to pull request 1521), line 55 ("until the pin carries `IsWeakHomotopyEquivalence`"), lines 287–290 ("Admitting the elementary expansion theorem as a target here is a theorem import, made by a reviewed revision of this roadmap"), lines 302–305 ("contact the authors and discuss the plan on Zulip before porting"), line 54 (link to Mathlib `master`); `Suggested.lean` lines 24–26 ("not yet in the Tau Ceti revision this repository pins; `weTop` is to be replaced … when the pin moves") and 260–261.
- Claim: cross-roadmap citations name the roadmap and section, never a pull-request number; the text is timeless.
- Witness: the quoted lines.
- Repair: cite "HomotopyTheoryOfCategories, Layer 8.6" and "Layers 7.1–7.2" by name only; delete the pin narrative (after R03 the owner is a roadmap section, which needs no timing remark); state what the roadmap wants from the openai formalization in one timeless sentence of the Research motivation (it is a cited source, not a target) and drop the "Porting guidance" instructions, which restate the repository README; link Mathlib at the pin or cite the declaration by name only.

## R08 (P3) — README shape: missing sections, items without locators, definitions with fewer than three Checks

- Location: `README.md` lines 69 ("## What Mathlib and Tau Ceti already have"), 123–235 (layers as bold-numbered one-paragraph items), 232 ("## Ordering").
- Claim: the shape of the roadmaps on main: `## Exact supplier contracts`, `## How to read the build`, `### k.n` prose subsections with API bullets and a `**Checks.**` list of at least three discriminating checks per definition, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`; every theorem with a locator.
- Witness: definitions with no Check: 0.2, 1.1, 1.3, 2.1, 2.3, 2.5, 3.1, 3.2, 4.1, 4.3, 5.1–5.4, 6.1, 7.1–7.2; with one or two: 0.1 (2), 1.2 (2), 2.2 (2), 2.4 (1), 4.2 (1). Items with no locator at all: 0.1, 0.2, 1.1, 1.3, 2.1, 3.1. No layer has `### Examples` or `### Dependencies`; there is no `## Downstream consumers` (HomotopyTheoryOfCategories 8.6 is one).
- Repair: rewrite the layers in the prose form (StableHomotopyKTheory §2.1 is a sibling example), with the Checks the review already supplies: `𝔾(k, n)` has two elements for `k < n`, one for `k = n`, none for `k > n`; the sum of `(1, 0, 1)` has three `0`-cells and two `1`-cells; the empty presheaf and the terminal presheaf are models; `(1, 1) : D₀ → D₀` has no lifting in `Θ₀`; `(τ_n, σ_n)` has none in `Θ` (Ara 2.7.3) but one in every contractible extension; `weTop` fails for `∅ → pt` and for `pt → {0, 1}` discrete.

## R09 (P3) — Padding in `Suggested.lean`

- Location: `Suggested.lean` lines 84–86 (`σ_comp_σ`, `τ_comp_σ`, proved by `rfl`), 276–283 (`piPresheaf_isGlobular`, closed by `fun T v hv => hR T X v hv`), 285–295 (`localizedFunctor := Localization.lift (Pi ⋙ W.Q) hPi weTop.Q`).
- Claim: no API lemmas that follow in one tactic and no declarations that restate a library construction.
- Witness: the probe file elaborated at the pin closes `piPresheaf_isGlobular` with one term; the two `Globe` theorems are `rfl`; `localizedFunctor` is Mathlib's `Localization.lift` applied to its arguments.
- Repair: delete the four declarations (the README keeps 0.1, 5.2 and 7.1 as targets); R01 says what replaces them.

## R10 (P3) — The disks of a `GlobularExtension` are not identified with the objects of the one-column tables

- Location: `Suggested.lean` lines 185–200 (`ofTable`, `disks`, no relation between them); `README.md` lines 99–100 ("the functor from `Θ₀` being the identity on objects"), line 165 (the pair `(1_{D_n}, 1_{D_n})`).
- Claim: the Lean structure realises the Conventions.
- Witness: `isGlobularSum` at `Table.globe n` only forces `incl (Table.globe n) 0 : disks.disk n ⟶ ofTable (Table.globe n)` to be an isomorphism (uniqueness applied to `𝟙`), not an equality; the pair `(𝟙 (disk n), 𝟙 (disk n))` has type `disk n ⟶ disk n`, not `disk n ⟶ ofTable T`, so the Check of 2.4 is not an `AdmissiblePair` of the file (probe: the equality `C.disks.disk n = C.ofTable (Table.globe n)` is not provable from the fields).
- Repair: add `ofTable_globe : ∀ n, ofTable (Table.globe n) = disks.disk n` (or define `disks` from `ofTable`), in the table-indexed structure of R04.

## R11 (P3) — Two locators narrower or looser than the source

- Location: `README.md` lines 167–168 ("For a coherator `C` and a contractible globular extension `E`, a globular functor `C → E` exists (Ara 2013, Proposition 2.14)"); `Suggested.lean` line 236 ("Ara's « pseudo-coherator », 2013, 2.4").
- Witness: Proposition 2.14 is stated for a *free* globular extension `C` (ara2013 line 520–521); Ara's 2.4 attributes the term pseudo-coherator to Maltsiniotis and Ara's thesis (line 433).
- Repair: state 2.5 for free globular extensions (coherators as the case used); write "the pseudo-coherators of Maltsiniotis (Ara 2013, 2.4)".

## Verified sound

**Gate and tooling.** Worker's gate at e36a7fa: every check 0 except `set_option=1` (R02); build of `TauCetiRoadmap.GrothendieckInfinityGroupoids.Suggested` passes. Dependency check run by me: `depcheck: 205 roadmaps, 1418 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty); `metadata.toml` has `topic = "math.AT"`. The roadmap is last in the merge order (line 368), after StableHomotopyKTheory.

**Pins.** `lake-manifest.json`: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; the shared packages directory is at those revisions. Opened at the pin: `TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean` line 119 (`HomotopyGroup.map (f : C(X, Y)) (hf : f x = y)`), Mathlib `CategoryTheory/Localization/Predicate.lean` line 304 (`Localization.lift`), `CategoryTheory/ObjectProperty/FullSubcategory.lean` line 39, `AlgebraicTopology/Reedy/Basic.lean` line 45 (`HomotopicalAlgebra.ReedyStructure`), `AlgebraicTopology/ModelCategory/Basic.lean` (`ModelCategory`), `AlgebraicTopology/SimplicialSet/KanComplex.lean` line 40 (`KanComplex`), `PtSimplex` (`KanComplex/MulStruct.lean`), `TransfiniteCompositionOfShape` (two files), `Topology/Connected/PathConnected.lean` line 62 (`Joined`), `HomotopyGroup.pi0EquivZerothHomotopy` (found by `exact?`). `TauCeti/AlgebraicTopology/Sphere/` and `Disk.lean` (`diskBoundaryPair`) exist. Not at the pin: everything listed in R03.

**Elaborated signatures.** The worker's `signatures.md` flags `CoglobularObject.face`, `faceTo`, `Compatible` as having "dropped" `[Category.{v} K]`: false positives, the instance is present as `[inst : Category.{u_2, u_1} K]` in each elaborated type. My probe file (`#check @GlobularExtension.mk`, `@weTop`, `@localizedFunctor`, `@piPresheaf`, `@IsGlobularPresheaf`, `@AdmissiblePair.mk`) agrees with `signatures.md`; no declaration loses a binder its type needs.

**Cross-roadmap citations.** HomotopyTheoryOfCategories at the head of its pull request: its table row (line 74) and 8.6 (line 580) cite GrothendieckInfinityGroupoids Layer 0.1 for `𝔾` and prove it direct with degree `n`; 7.1–7.2 define `IsDirect`, `IsInverse`, `IsDirect.rank` (lines 490–508). Both directions agree; it is not in the merge order yet, so it is placed after this roadmap (not a finding). AlgebraicTopology on main: Stage 8 owns Hurewicz/Whitehead (lines 1602, 1700). GeneralizedCohomology G2 item 1 (Kan–Quillen and Serre model structures) and BordismFormalGroups F6.5 item 1 (simplicial-set and operadic foundations) exist as cited and are "not consumed". StableHomotopyKTheory §2.1 owns `IsWeakHomotopyEquivalence` (R03). Ownership by object: `roadmaps grep` for globular sets, coherators, the globe category and the homotopy hypothesis finds no other roadmap on main or in an open pull request; this roadmap is the owner of Layers 0–7.

**Sources read** (cache ids): ara2013 (arXiv 1206.2941v2), henry2016 (arXiv 1609.04622v1), maltsiniotis2010 (arXiv 1009.2331v1), henrylanari2023 (TAC 39 no. 26, pp. 735–768, open access), simpson1998 (arXiv math/9810059v1), openai2026 (paper.pdf at commit 7ef5c0cc, Apache-2.0 repository). Locators confirmed: Ara 1.3 (line 237–264), 1.4 (265), 1.6 (314), 1.8 (327), 1.11–1.12 (364–377), 2.3 (424–430: parallel, `S` a globular sum, `dim S ≤ n + 1`), 2.4 (431), 2.5 (434: defined for any contractible extension, as the Lean does), 2.6 (437), 2.7.1 (441), 2.9 (467), 2.10–2.11 (492–504), 2.12 (505), 2.14 (520), 3.11 (1137), 4.2–4.3 (1214–1218), 4.5 (1255), 4.6 (1309), 4.8 (1360), 4.11 (1401), 4.13–4.15 (1617–1630), 4.17–4.18 (1638–1664), 5.2 (1708), 5.3 (1727), 5.5–5.6 (1745–1765), 5.10–5.11 (1803–1809), 8.4–8.7 (2613–2705), 8.8–8.11 (2706–2724), 8.13–8.14 (2727–2734). Henry 2016: 5.3.2 Definition (3276), 5.3.3 Conjecture (3279), 5.3.4 Lemma (3289), 5.3.5 Theorem (3296), 5.3.13 Corollary (3476), §5.1 "Cylinder coherators" (2941). Henry–Lanari 2023: title and abstract (3-groupoids), journal data (line 5). openai2026: Theorem 1.1 (line 44–51), convention `dim S ≤ j` for `d_{j−1} ⇉ S` = Ara's (142–148), `π_r(X, x)` at `e₀^{r−1}(x)` (266–270), Corollary 5.1 left semi-model (919–926), Corollary 5.2 Quillen equivalence `|−| ⊣ Π_∞` via Henry's Theorem 5.1.2 (987–1030). The comparator file `lean/ComparatorChallenges/GrothendieckElementaryExpansion.lean` and its `.json` at the commit: `Table.attach (b h) (left : b < last) (right : b < h)`, `AdmissiblePair.height : arity.height ≤ n + 1`, `IsCoherator := Nonempty CellularPresentation ∧ fillers`, `unit` via `Classical.choose`, `Components := Quot (Joined 0)`, `HomotopyGroup` via `Joined (n+1)`, theories and models in `Type v`, `theorem_names = ["OAI.Grothendieck.elementary_expansion"]`, `permitted_axioms = [propext, Quot.sound, Classical.choice]`, `solution_module = OAI.CategoryTheory.Globular.Main`; the directory `lean/OAI/CategoryTheory/Globular/` has 58 files including `Main.lean`; `lean/docs/312.md` says only the expansion theorem is formalized, not the semi-model structure or the comparison with spaces. README lines 258–285 are accurate against these, except as R05 notes on orientation (consistent with the roadmap's own convention).

**Seeded sample.** "Research motivation" (lines 14–23): Conjecture 8.14 as stated (ara2013 line 2733); the Breen letter is not verifiable (below). "In scope" (31–46): each layer's objects are Ara's §§1–5, 8 and Henry 5.3.2 as cited. "Shared material" table (48–59): rows 1, 3, 5, 6, 7 verified; row 4 is R03. "The elementary expansion assertion" (241–247): Henry 5.3.3–5.3.5, 5.3.13 and Henry–Lanari verified. "The openai/math preprint" (249–285): verified as above.

**Adversarial pass.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `Globe.Hom.comp` and the globular identities | `σ 0 ≫ σ 1`, `σ 0 ≫ τ 1`; `τ 0 ≫ σ 1`, `τ 0 ≫ τ 1` | both pairs reduce to `side _ false`, resp. `side _ true`; `Hom m n` has 2 elements for `m < n`, 1 for `m = n`, 0 for `m > n` | matches Ara 1.1 (`σ_{i+1}σ_i = τ_{i+1}σ_i`) | none |
| `GlobularSet.src_src`, `tgt_src` | presheaf `X` on `Globe` | `X(σ_{k+1}σ_k) = s_k ∘ s_{k+1} = s_k ∘ t_{k+1}`; `t_k ∘ s_{k+1} = t_k ∘ t_{k+1}` | agrees with Ara line 230 | none |
| `CoglobularObject.face`, `faceTo` | `m = 0, k = 1`: `face 0 1 ε = (ε ? τ 0 : σ 0) ≫ σ 1` | by `σ_σ`/`τ_σ` equals the same with `τ 1`; `faceTo (h : 0 < 2)` reindexes by `eqToHom` | the face `D_0 → D_2` is determined by its first step | none |
| `Table`, `Table.dim` | `globe n` (width 0): `dim = n`; `(1, 0, 1)`: `top = (1, 1)`, `bot = 0`, `dim = 1`; `(2, 0, 1)`: `dim 2`; `(1, 1, 1)` rejected (`bot_lt_left`) | Ara 1.3: dimension = greatest entry; `i_k > i'_k < i_{k+1}` | matches | none |
| `Compatible`, gluing orientation | `(1, 0, 1)` in globular sets: `φ₀, φ₁ : D₁ → Y` with `t ∘ φ₀ = s ∘ φ₁` | sum has `3` `0`-cells, `2` `1`-cells (README Check 1.2 true); Ara glues `σ` left, `τ` right | mirror of Ara 1.3 | R05 |
| `GlobularExtension.isGlobularSum` at width 0 | `T = globe n`, `Y = disk n`, `φ = 𝟙` | unique `u` with `incl ≫ u = 𝟙`; uniqueness at `Y = ofTable T` gives `u ≫ incl = 𝟙` | `incl (globe n) 0` is an iso, not an equality | R10 |
| `GlobularExtension` vs `TopCat` | `Obj = TopCat` | `ofTable_bijective` fails (objects not indexed by tables) | 2.5, 5.1, 7.2 unstatable; Ara 2.6 read backwards | R04 |
| `Parallel` | `n = 0`: `True`; `n = 1`: `σ 0 ≫ f = σ 0 ≫ g ∧ τ 0 ≫ f = τ 0 ≫ g` | Ara 2.1 (line 390–392) | matches | none |
| `AdmissiblePair.dim_le` | `n = 0, T = (1, 0, 1)`: `1 ≤ 1` admitted (composition of `1`-cells); `n = 0, T = (2)`: `2 ≤ 1` rejected; `n = 1, T = (2)`: admitted (the pair `(τ₁, σ₁)` gives inverses) | Ara 2.3 `dim S ≤ n + 1`; `(τ_n, σ_n)` admissible, no lifting in `Θ` (Ara 2.7.3) | matches | none |
| `IsContractible` negative control | `Θ₀`, pair `(1, 1) : D₀ → D₀` | `dim D₀ = 0 ≤ 1`, parallel; a lifting `D₁ → D₀` would send the `1`-cell of `D₁` to one of `D₀`, which has none | README Check 2.2 true | none |
| `IsGlobularPresheaf` | terminal presheaf; empty presheaf; `y(D_n)`, `T = globe m` | one compatible family, one element; no compatible family, condition vacuous; `incl` iso so `X(incl)` bijective | terminal and empty are models (Henry 5.3.1 "empty groupoid"); README Check 4.2 true | none |
| `weTop` | `∅ → pt`; `pt → {0,1}` discrete; `𝟙 X` | first conjunct false (no `x`); first conjunct false (point `1` not joined); both true | not, not, is a weak equivalence; equals StableHomotopyKTheory §2.1's predicate via `pi0EquivZerothHomotopy` | R03 |
| `piPresheaf` | object `S`, space `X` | `(Π X)(S) = TopCat(R S, X)`; `(Π X)(g) = (R g ≫ ·)` | Ara 5.2 formula | none |
| `piPresheaf_isGlobular` | arbitrary `C, R, hR, X` | proof term `fun T v hv => hR T X v hv` accepted | restates `hR` | R01, R09 |
| `localizedFunctor` | `W`, `Pi`, `hPi` | `= Localization.lift (Pi ⋙ W.Q) hPi weTop.Q` | wrapper of a Mathlib def | R09 |
| Conventions `π_n` | `n = 1`: `1`-cells from `x` to `x`; `n = 2`: `2`-cells from `1_x` to `1_x` | Ara 4.11: from `k₀^{n−1}(x)` | README says `1^n_x` | R06 |
| Theorem 8.7 generality | `C` a coherator (README) vs a formal coherator with any globular `K : C → M` (Ara 8.1) | proof uses only the pregroupoidal structure (3.11) and `K` | README's statement is a special case; `PseudoCoherator` with `R` is the right Lean generality | none |
| 7.2 independence | `R, R'` | underlying globular sets both `n ↦ TopCat(D^n, X)` (Ara 5.2 line 1724–1726); `ϖ_n` equal (Prop 5.5) | matches; needs `∞-Gpd_Top` | R04 |
| Check 0.1 | `𝔾(−, n)` | `k < n`: 2 cells; `k = n`: 1; `k > n`: 0 | true | none |
| Check 2.4 | coherator, `(1_{D_n}, 1_{D_n})` | admissible (`n ≤ n + 1`), lifting `κ_n` exists (Ara 8.1 line 2569–2572) | true, but not formable in the Lean structure | R10 |

## Not verifiable

- *Pursuing Stacks* (SMF 2022) and Maltsiniotis, Astérisque 301: not open access; the README cites them without a statement, so nothing depends on them.
- The 1975 letter to Breen (Montpellier fonds, folder 134-2, pp. 42–45) and the paraphrase "essentially the same thing" (README lines 20–23, 332–334): the archive holds image scans; not read. The line is a quotation-like paraphrase of an unread text: rephrase or drop the quotation marks.
- The "12,753 lines" of `lean/OAI/CategoryTheory/Globular/` (README line 255): the directory and its 58 files were listed; the line count was not computed. That the proof in `Main.lean` closes `elementary_expansion` with only the permitted axioms was not checked (only the challenge statement and the `.json` were read).
- Ownership against open pull requests was checked through `roadmaps grep` over the indexed heads (433 pull requests, index of 2026-10-31); sibling checkouts not in that index were not searched.

## Source issues

- **Misprint** in ara2013 at 8.1, printed page 52 (arXiv v2): the standing functor `F : 𝔾 → M` is called "fibrant and weakly contractible"; it should be "cofibrant and weakly contractible" (5.8, and 8.1's own gloss that `i_n` is a cofibration); affects nothing.
