# Review of AccessibleInfinityCategories (pull request #2270 at 04df60e)
Folder: `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/`
**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/InfinityCategoryTheory/AccessibleInfinityCategories/Suggested.lean` lines 9, 11, 13, 15, 16, 17 (six `public import TauCeti.AlgebraicTopology.…` lines); `README.md` lines 168–179, "At the pinned Tau Ceti, in `TauCeti/AlgebraicTopology/`".

**Claim:** Six imported modules (`Quasicategory.CategoricalEquivalence`, `Quasicategory.Limit`, `SimplicialSet.AnodyneExtensions.LeftRight.Basic`, `SimplicialSet.Fiber`, `SimplicialSet.InternalHom`, `SimplicialSet.WeakHomotopyEquivalence`) do not exist at the pinned Tau Ceti (2fd255d), so the targeted build fails. The README lists `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.catInfty`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` and `SSet.QCat.IsCategoricalEquivalence` as pinned; none is.

**Witness:** Gate: `imports=6`, `build exited 1`, "bad import". The six files exist at Tau Ceti 8b9f13d993; main's manifest still pins 2fd255d. With the six imports removed, only `IsCategoricalEquivalence`, `categoricalEquivalences`, `categoricalFibrations`, `IsWeaklyCofinal` elaborate at the pin.

**Repair:** The file can pass only after the repository's Tau Ceti pin (on main, in its own change) reaches a commit containing the six modules; then merge main into this branch and re-run the gate. Until then the alternative that passes at 2fd255d is a file stating no theorem, its docstring naming every statement as not statable with the missing module, and README lines 168–179 moved from "At the pinned Tau Ceti" to a list of carriers not at the pin.

## R02 (P2) — κ-accessible ∞-categories and accessible functors already have an owner on main

**Location:** `README.md` lines 54–55 ("κ-accessible and accessible ∞-categories and accessible functors here, in §4.1") and §4.1.1–§4.1.2 (lines 663, 688).

**Claim:** `EnhancedDerivedSheaves` on main owns the same objects, and the README's Scope and ownership names neither it nor how §4.1 differs. An open roadmap cites the owner on main or narrows its own statement.

**Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` (main) lines 390–392, E0.8: `IsKappaCompact`, `IsKappaAccessible`, `IsAccessible`, `IsAccessibleFunctor`, citing HTT Def. 5.4.2.1 and Prop. 5.4.2.2.

**Repair:** Add to Scope and ownership: "κ-accessible and accessible quasicategories and accessible functors are defined in EnhancedDerivedSheaves E0.8, for a locally small C, by generation under κ-filtered colimits from a small full subcategory of κ-compact objects (the form of HTT, Prop. 5.4.2.2 (3)). §4.1.1 states the `Ind_κ` form of HTT, Def. 5.4.2.1, which E0.8 does not, and §5.1.1 proves that the two agree; the accessible functors of §4.1.2 are those of E0.8." In §4.1.2 replace "Define a functor … to be accessible when" by a citation of E0.8's accessible functors, keeping the API bullets and Checks. A transfer of ownership to this family is a revision of EnhancedDerivedSheaves, not something this folder can assert.

## R03 (P3) — the join–slice correspondence is cited at the wrong target

**Location:** `README.md` lines 301, 313, 1235, 1338, 1356: "Part InfinityCategoryFoundations §4.1.1 (HTT, Prop. 1.2.9.2, p. 60)".

**Claim:** InfinityCategoryFoundations §4.1.1 is not the join–slice correspondence.

**Witness:** `TauCetiRoadmap/InfinityCategoryTheory/InfinityCategoryFoundations/README.md` line 1053: §4.1.1 is the pushout-join lemma (HTT, Lemmas 2.1.2.3–2.1.2.4). Prop. 1.2.9.2 is the opening paragraph of §4.1 (lines 1048–1051), as Tau Ceti `SSet.coslice.homEquiv`.

**Repair:** In the five lines write "Part InfinityCategoryFoundations §4.1, opening paragraph (HTT, Prop. 1.2.9.2, p. 60; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`)". Line 1293, which cites §4.1.1 for HTT, Lemma 2.1.2.3, is right and stays.

## R04 (P3) — seventeen declarations of `Suggested.lean` are not named in the README

**Location:** `README.md` §1.1.1, §3.1.2, §3.3.1, §4.2.1, §4.2.2, §6.4.2–§6.4.6, §6.5.2, and Scope and ownership.

**Claim:** README and Lean must agree in both directions; the README names only `IsEssentiallyCardinalSmall`, `IsEssentiallySmall`, `IsWeaklyCofinal`, `IsCardinalCofinal`.

**Witness:** Zero occurrences in `README.md` of, for example, `categoricalFibration_coslice_map`, `isLocallySmall_ihom`, `IsCardinalCofinal.isCofinal`, `hasCardinalFilteredColimits_coslice`, `sectionsRestrict`.

**Repair:** Add "`Suggested.lean` declaration `…`" to each target: §1.1.1 `categoricalFibration_coslice_map`; §3.1.2 `isEssentiallyCardinalSmall_iff_exists_isCategoricalEquivalence`; §3.3.1 `isEssentiallyCardinalSmall_of_cartesianFibration`; §4.2.1 `isLocallySmall_iff_forall_isEssentiallySmall`; §4.2.2 `isLocallySmall_ihom`; §6.4.2 `isCardinalCofinal_coslice_π`; §6.4.3 `IsCardinalCofinal.coslice_map`; §6.4.4 `IsCardinalCofinal.pullback_snd`; §6.4.5 `IsCardinalCofinal.isCardinalFiltered_pullback`; §6.4.6 `IsCardinalCofinal.isCofinal`; §6.5.2 `HasCardinalFilteredColimits`, `hasCardinalFilteredColimits_coslice`. In Scope and ownership name the five repeated definitions (`IsCategoricalEquivalence`, `categoricalEquivalences`, `categoricalFibrations`, `sectionsRestrict`, `IsCofinal`) with the Part and section each repeats.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2.1 initial objects (HTT 5.4.5.2) | `Y = Δ[0]`; `X = {1}`, `Y' = {0}`, `Y = N([1])` | product: `(x, y')` initial iff both are; second: pullback empty, p sends 1 to a non-initial object | agrees with htt line 20498, p. 453 | none |
| §1.2.2 colimits (HTT 5.4.5.5) | K = ∅ | reduces to §1.2.1 through §1.1.2, as htt line 20587 | agrees, p. 454 | none |
| §1.3.1 (HTT 5.4.5.7, 5.4.5.6) | hypotheses compared | source asks images in X, Y′ and Y κ-compact; README the same three | agrees with htt lines 20627–20644, 20590, p. 455 | none |
| §2.2.1–2.2.2 (HTT 5.3.4.14–15) | circle; discrete ℕ | circle = pushout of points, ω-compact; ℕ: identity factors through no finite stage | agrees with htt lines 18996, 19010, p. 419 | none |
| §3.3.1 (HTT 5.4.1.4) | C = ∅; `C × D → D` | ∅ is κ-small; product: classes < κ·κ = κ, homotopy sets bounded by the long exact sequence | agrees with htt line 19885, p. 439 | none |
| §4.1.1 definition (HTT 5.4.2.1) | ∅, `Δ[0] ⊔ Δ[0]`, large discrete nerve | first two are `Ind_κ` of themselves; third: κ-filtered diagrams constant, so classes of objects would be small | agrees with htt line 19988, p. 441 | none |
| §4.1.2 definition (HTT 5.4.2.5–6) | `X × X`, `X^ℕ`, power set | ω-continuous; ℵ₁- but not ω-continuous (`ℕ^ℕ ≠ ⋃ F^ℕ`); `X ∈ P(X)` in no stage for `|X| = κ` | agrees with htt lines 20063–20070, p. 443 | R02 |
| §4.2.1–4.2.2 (HTT 5.4.1.7, 5.4.1.8) | S = ∅, S = {X, Y}; universes u < v and v < u in the Lean | {X, Y}: mapping space of the subcategory is `Map(X, Y)`; both sides hold trivially when everything is u-small | agrees, htt lines 19967, 19977, p. 441; source misprint below | none |
| §5.1.1 generator characterization (HTT 5.4.2.2) | (1)⇒(2)⇒(3)⇒(1) inputs | (1)⇒(2) uses 5.4.1.8, 5.3.5.3–5, 5.4.2.4; (3)⇒(1) uses 5.3.5.10–11; all cited in *Needs* | agrees with htt lines 19995–20006, 20047–20062 | none |
| §5.2.1–5.2.2 (HTT 5.4.2.8–9) | ω ≪ τ; ℵ₁ ≪ ℵ₁; κ = κ′ | `τ₀^n < τ`; `ℵ₀^ℵ₀ = 2^ℵ₀ ≥ ℵ₁`; κ = κ′: κ-small set plus a bound is κ-filtered | agrees; Mathlib `of_pow_lt` hypothesis `β ^ α < κ₂` for `α < κ₁`, `β < κ₂` is HTT's ≪ with `κ₁ < κ₂` | none |
| §5.2.4 uniformization (HTT Rem. 5.4.2.13) | τ ≤ τ′ ≪ κ | `τ₀ < κ`, `κ₀ < τ ≤ τ′` gives `τ₀^κ₀ < κ`, so τ ≪ κ | agrees with htt lines 20119–20134, p. 444 | none |
| §5.3.1 (HTT 5.4.3.6) | `Δ[0]`; monoid `{1, e}` | idempotent complete; no r, s with `rs = 1`, `sr = e`, so not accessible | agrees with htt line 20306, p. 449 | none |
| §5.4.1 adjoints (HTT 5.4.7.7) | left and right adjoint cases | left adjoints preserve colimits; right adjoint: `F(j(D))` τ-compact gives τ-continuity; README's κ is common to C, C′, source's to C′ only | agrees with htt line 21266, p. 469 | none |
| §4.6.1 (HTT 5.3.5.15) | A = point; A = `{0 < 1}` | identity of `Ind_κ(C)`; morphisms are κ-filtered colimits of morphisms of C | agrees with htt line 19399, Warning at 19406, p. 428 | none |
| §6.4.1 definitions (HTT 5.4.5.8) | evens ⊆ ℕ; `{0} ⊆ ℕ`; object of `Idem` | evens: every n below an even; no edge `n → 0`; `Idem`: no g with `g∘e = 1`, so not κ-cofinal | agrees with htt line 20687, p. 457; Lean edge is `j ⟶ f i` | none |
| §6.4.5 (HTT 5.4.5.11 (1)) | κ = ℵ₁, τ = ω, I = J = `N(ℕ)`, f = id, p = id | f is κ-cofinal, p is ℵ₁-small, `I_{p/} = ∅`: not filtered; with p τ-small the route gives a cone using K = `Δ[0]` (1 < κ) | README's hypothesis (p τ-small) correct; the source's is not (Source issues) | none |
| §6.5.1–6.5.4 (HTT 5.4.5.13–16) | K = ∅; K = `Δ[0]` | K = ∅ returns C; `K ⋆ I` τ-filtered since a cone on a τ-small diagram may take its vertex in I ≠ ∅ | agrees with htt lines 20799–20877, pp. 459–461 | none |
| §7.1.1 (HTT 5.4.6.6 with 5.4.6.1, .3, .5) | identities; `Y = Δ[0]` | returns X; returns `X × Y'`; step hypotheses (τ > κ, τ-small κ-filtered colimits, κ-cofinal) equal to htt lines 20955–20971, 21043–21055 | agrees with htt line 21086, p. 465 | none |
| §7.2.1 (HTT 5.4.6.7) | K = `Δ[0]` | pullback of `Δ[0] → Fun(K, C) ← Fun(K × Δ[1], C)` at vertex 1, evaluation coCartesian | agrees with htt line 21152, p. 466 | none |
| §7.3.1–7.3.3 (HTT 5.4.7.8–10) | sets with ≤ 1 element; sets with ≥ 2 elements | first ≃ `N([1])`, small, idempotent complete; second: cocones of the constant-map chain ↔ points of Y, `2^|L| ≥ 4 ≠ 2` | agrees with htt lines 21293–21309, pp. 469–470 | none |
| §8.1.1 (HA 5.2.2.36) | C = ∅ | (a): every morphism of `D_v` invertible; (b): final object; Kan complex with final object contractible = limit of the empty diagram | agrees with ha line 31630, p. 835 | none |
| §8.2.1, §8.3.1 (HA 5.2.2.37, 5.2.2.39) | hypotheses compared; K = ∅ | four hypotheses of ha lines 31696–31704 all present; K = ∅: f-initial lift iff fiber contractible | agrees, pp. 836–837 | none |
| §8.4.1 (HA 4.8.1.1) | 𝒦 = ∅; {∅}; {`Λ[2,0]`} | `Cat∞`; `Δ[0] → N([1])` at 1 excluded, at 0 included; pushout-preserving functors | agrees with ha line 26968, p. 707 | none |
| §8.5.1 (HTT 5.4.2.14) | constant functor at κ points; π₀–power set–inclusion | κ-continuous, point ↦ non-κ-compact space; composite not accessible, so `Acc` not full | agrees with htt line 20135, p. 445 | none |
| §8.6.1, §8.9.1 (HTT 5.4.7.3, 5.4.7.17) | S = `Δ[0]`; S discrete; `C × S → S` | single category; §6.3; §6.2 | agrees with htt lines 21194, 21477, pp. 467, 474 | none |
| Lean `IsEssentiallyCardinalSmall`, `IsEssentiallySmall` | C = ∅; κ universe w ≠ u | ∅ has 0 < κ simplices; κ quantified uncountable regular in `IsEssentiallySmall`, as §3.1.1 | signature equals README (read; not elaborated, R01) | R01 |
| Lean `HasCardinalFilteredColimits`, `hasCardinalFilteredColimits_coslice` | K = ∅ | `coslice p ≅ C`, statement is the hypothesis; binders `[C.Quasicategory]`, `hK : Small.{w} K.N` explicit | equals §6.5.2 (read; not elaborated) | R01, R04 |

- Source locators checked against the text: 166 distinct statement-and-page locators (160 in htt, 5 in ha, 1 in sag_rootfile) compared with the page of the statement in the text, all agree; the 60 statements behind the table read in full; the HTT offset of 18 pages confirmed (PDF p. 20 is printed p. 2).
- Library declarations opened at the pins: 26 Mathlib names of the supplier contract, all present (for instance `Cardinal.SharplyLT.of_pow_lt` at `Mathlib/CategoryTheory/Presentable/SharplyLT/Lemmas.lean:62`, `Cardinal.SharplyLT.exists_isCardinalFiltered_set` at `SharplyLT/Basic.lean:570`, `IsCardinalAccessibleCategory.uniformization` at `Uniformization.lean:127`); of the 17 Tau Ceti names, 11 present (`SSet.IsCardinalFiltered` at `SimplicialSet/CardinalFiltered.lean:63`, `SSet.IsLocallySmall` at `Quasicategory/LocallySmall.lean:66`) and 6 absent (R01).
- Cross-roadmap citations resolved: 73 section targets in the six sibling Parts and the three ModelCategoryTheory Parts at their heads; one mis-pointed (R03). The repeated definitions have the same bodies as `InfinityCategoryFoundations/Suggested.lean` lines 187–193, 721–722 and `LimitsAndKanExtensions/Suggested.lean` lines 116–127.
- Gate: FAIL (`imports=6`, `build=13`); every other check 0. Dependency check: `depcheck: 223 roadmaps, 1972 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the family folder.
- Elaboration: `Suggested.lean` does not elaborate at the pin (R01). A scratch copy without the six imports was elaborated to find what survives; the `#check` comparison and the one-tactic probe could not be run, and padding was judged by reading: no declaration restates a definition, mirrors a Check or treats a boundary case.
- Headlines: the README's eight headline groups all need κ-compact objects, `Ind_κ`, accessible ∞-categories or categorical pullback squares; the module docstring names each as not statable with the missing carrier.
- Pull request text: no sentence of the description contradicts this folder's head; the word count (20.2k) and the Tau Ceti pin paragraph match.
- Overlap check: read ModelCategories, EnrichedLocalization, KanQuillen, SimplicialCategories, LocallyPresentableCategories (open), EnhancedDerivedSheaves, BordismFormalGroups (main); κ-accessible ∞-categories and accessible functors shared with EnhancedDerivedSheaves E0.8, owner EnhancedDerivedSheaves (R02); LocallyPresentableCategories is 1-categorical and shares nothing.
- Source independence: 18 passages compared with 3 sources, none shared beyond hypothesis lists the mathematics forces; largest share htt, 704 of 713 locators; contents compared with htt: independent (Layer 1 ↔ §5.4.5 first half, Layer 2 ↔ §5.3.4 end, Layer 3 ↔ §5.4.1, Layers 4–6 each mix three of §§5.3.5, 5.4.1–5.4.5, 5.4.7, Layer 7 ↔ §5.4.6 with part of §5.4.7, Layer 8 ↔ HA §5.2.2 with §5.4.7; the order differs from the source's and is forced by the *Needs* lines of §2.1.1 on §1.3.1 and of §6.5.1 on §1.3.1 and §2.1.1).

## Not verifiable

- Elaborated types of the 21 declarations: the file does not elaborate at the pinned Tau Ceti (R01), so signatures were compared with the README by reading only.
- `fiber p d` carrying a `Quasicategory` instance in `isEssentiallyCardinalSmall_of_cartesianFibration`: depends on `TauCeti.AlgebraicTopology.SimplicialSet.Fiber`, absent at the pin.
- AR94 (Adámek–Rosický, Thm. 2.11): Cambridge University Press, no legal open copy found; cited for comparison only, no target depends on it.
- Ownership against board packages not yet in a pull request was not checked beyond the three listed in the board index.

## Source issues

- **Error** in htt at Lemma 5.4.5.11 (1), PDF p. 458: the source says the pullback `I ×_J J_{p/}` is τ-filtered for a κ-small diagram p; it should be assume p τ-small (false for κ = ℵ₁, τ = ω, identity of `N(ℕ)`); affects a stated result.
- **Gap** in htt at Lemma 5.4.5.11, proof of (1), PDF pp. 458–459: the source says the lifting follows from Lemma 5.4.5.10 for any τ-small K′; it should be either K′ weakly contractible or an argument using weak cofinality of f; affects the proof.
- **Misprint** in htt at Lemma 5.4.2.8, PDF p. 443: the source says the partially ordered set is κ′-filtered; it should be κ-filtered, as its proof and its use in Prop. 5.4.2.9 require; affects the proof.
- **Misprint** in htt at Example 5.4.1.8, PDF p. 441: the source says the functor ∞-category is essentially small and uses finite collections of functors; it should be locally small, with small collections; affects nothing.
- **Misprint** in htt at Cor. 5.4.1.5 (6), PDF p. 440: the source says essentially small; it should be essentially κ-small; affects nothing.
- **Misprint** in htt at Lemma 5.4.5.12, proof, PDF p. 459: the source says the fiber product is κ-filtered; it should be filtered (τ = ω in Lemma 5.4.5.11); affects nothing.
- **Misprint** in htt at Lemma 5.4.5.13, PDF p. 459: the source says the diagram lands in `C^τ`; it should be `C^κ`; affects nothing.
- **Misprint** in htt at Lemma 5.4.6.1, proof, PDF p. 461: the source says the test diagram is τ-small; it should be κ-small; affects nothing.
- **Misprint** in htt at Prop. 5.4.6.6, PDF p. 465: the source says the test functor goes to X and takes the identity of X; it should be X′ in both places; affects nothing.
- **Misprint** in htt at Def. 5.4.2.14 (2), PDF p. 445: the source says the functor belongs to Acc; it should be `Acc_κ`; affects nothing.

## For the human reviewers

- Pin: the build needs the repository's Tau Ceti pin moved from 2fd255d to a commit with the six modules of R01 (the description names 8b9f13d993, where they exist); that change is outside this folder.
- Ownership: the description asks the maintainers to choose between this family and EnhancedDerivedSheaves E0.8 (main, `README.md` lines 390–392) as owner of accessibility; R02 applies the standing rule, and the choice is yours.
- Sources: 704 of 713 locators are to one text, htt (Lurie's author-page PDF of a book published by Princeton University Press); ha and sag_rootfile are author-page PDFs, the latter unpublished.
