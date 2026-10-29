# Review of ProfiniteCohomology (pull request #616 at a925164)

**Verdict:** needs changes

Full re-review of the repaired head (the folder changed by 6062 lines since the head the previous review read). The pins are Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`, read from `lake-manifest.json` and confirmed as the checked-out package revisions. No change outside `TauCetiRoadmap/ProfiniteCohomology` (the outside-folder diff against `origin/main` is empty).

**Repair of the previous review, finding by finding.**

- R01 (admitted constructions): *partly repaired.* `Suggested.lean` no longer contains or depends on admitted data (it is four `sorry`'d theorems). But `CohomologyUniverseComparison.lean` and `DimensionNormalization.lean` are unchanged since commit `607b419` and still carry six `sorry`'d `def`s and everything that depended on them. See R01 below.
- R02 (class-module end theorems on native carriers): *repaired.* `Suggested.lean:80` and `:94` state `H¹ = 0` and the cyclic `H²` with the generator on `TauCeti.abelianizationProP` and `TauCeti.abelianizationProPClass`.
- R03 (consume the pinned cup and index-two packages): *repaired in substance, with drift.* Layer 12 and 13.1 now consume `TauCeti.TopPairing`, the graph cochain and class, the exact sequences and the pullback. Several of the names it consumes do not exist at the pin (R02 below), and Mackey, the all-degree `δ` compatibilities and the Galois bridge are still planned as targets although the pin has them (R04 below).
- R04 (general coefficient-ring norm): *repaired.* 13.2 builds `H^{2q}(U, A) → H^{2lq}(G, A)` for a discrete commutative `G`-ring, the characteristic-two form in every degree, and the agreement with the index-two form, with four Checks.
- R05 (padding): *repaired.* The file has no API aliases, boundary cases or computed values.
- R06 (Lean form of the helper files): *not repaired.* Both files still import a roadmap module, one imports a Mathlib submodule, both have `set_option`, both docstrings are process narrative.
- R07 (locators): *mostly repaired.* Kozlowski Lemma 2.4 is now cited only for the special double cover (README 2455–2460, checked below), and the Serre attribution is gone. The Kahn Remarque II.2.3 citation is still off (R06 below).
- R08 (per-target dependencies and Checks): *partly repaired.* Every target written since has a `*Needs:*` line and three or more Checks; Layers 12 and 13 end with Examples and Dependencies. The remaining layers keep the previous shape (R08 below).

## R01 (P1) — Two orphan Lean files with sorry'd data, `set_option`, forbidden imports; one no longer elaborates

**Location:** `TauCetiRoadmap/ProfiniteCohomology/CohomologyUniverseComparison.lean:1`–`2` (imports `TauCetiRoadmap.ProfiniteCohomology.Suggested` and `Mathlib.Algebra.Homology.ShortComplex.ModuleCat`), `:17` (`set_option autoImplicit false`), `:46` (`noncomputable def resolutionTermEquiv … := by sorry`), also `:77`, `:144`, `:149`, `:188`, `:195`; `TauCetiRoadmap/ProfiniteCohomology/DimensionNormalization.lean:1`, `:12`, `:22`, `:36`.

**Claim:** Both files are unchanged since `607b419`. The first still constructs six pieces of data by `sorry` and composes them (`canonicalCohomologyAddEquiv`, line 218). The second imports it and refers to `CohomologicalDimensionLE` and `cd_p` of this roadmap's namespace, which the new `Suggested.lean` no longer declares, so it cannot elaborate at this head. Neither file is mentioned anywhere in `README.md`; the route they encoded is now the README's Layer 11 target "Independence of the extra coefficient universe" and the two universe theorems of `Suggested.lean`. The gate's zero counts come from scanning `Suggested.lean` alone.

**Witness:** A scratch concatenation of `Suggested.lean` with the two files (imports stripped) elaborates `CohomologyUniverseComparison` with 19 admission warnings plus the two `letI` linter warnings and an unused-variable warning, and fails on `DimensionNormalization` with "Unknown identifier `CohomologicalDimensionLE`" and "Unknown identifier `cd_p`" at the lines corresponding to its 22–23 and 36–37. The docstring at line 7 reads "The failed predecessor established …"; line 13 reads "They have not been compiled."

**Repair:** Delete both files. Nothing in `Suggested.lean` or the README refers to them, and the README already carries the construction (resolution-degree recursion, equivariance, the kernel-modulo-image presentation, the class equations) as prose with its Checks. If a construction target is wanted in Lean form later, it belongs to the library, not to the acceptance test.

**Repair check:** After deletion the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`, as on `main`; `lake env lean Suggested.lean` still reports exactly its four `sorry` warnings.

## R02 (P2) — Tau Ceti declarations cited by name that do not exist at the pin

**Location:** `README.md:2316`–`2320`, `:2353`, `:2433`, `:2474` (the norm on classes); `:254`, `:1951`, `:1959`, `:2151` (the strict criterion); `:1994`–`1995`, `:2040`–`2066`, `:2077`, `:2093`–`2098` (class-module route); `:1304`, `:1638`, `:1659` (dimension shifting); `:2473`–`2495` (Galois bridge); `Suggested.lean:26`–`28`.

**Claim:** The README says the pin "supplies, and this roadmap consumes by these names" declarations that are not in the pinned Tau Ceti. By object:

1. The index-two norm on classes. `TauCeti.ContCohomology.evensNormIndexTwo`, `evensNormIndexTwo_homClass`, `evensNormIndexTwo_eq_ind_pullback`, `homClass`, `homClass_eq_cochainClass`, `homClass_surjective`, `graphClass_representative_independent`, and the file `Evens/IndexTwoNorm.lean`: none exists. At the pin the norm is `graphClass` on a continuous homomorphism `α : U →* Multiplicative (ZMod 2)` (`Evens/Class.lean:276`, with `[LocallyCompactSpace G]`), and the `D₁₆` identity is the cochain-level `evensGraphCochain_eq_indexTwoInd_pullback` (`Evens/DihedralPullback.lean:285`). The descent to `H¹(U, 𝔽₂)` and the pullback identity on classes are not at the pin.
2. The strict-dimension criterion `TauCeti.strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (NSW (3.3.4)). The pinned `CohomologicalDimension/` directory holds `Basic`, `BoundedExponent`, `ClassModule/{Basic,ChangeOfGroup}`, `ClosedSubgroup`, `Comparison`, `Corestriction`, `IndexNotDvd`, `OpenSubgroup`, `Restriction`, `RightExact`, `SingleDegree`, `Strict`, `Torsion`, `TrivialFp`; `Strict.lean` proves only NSW (3.3.3) (`strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`, line 158).
3. The class-module route. `TauCeti.abelianizationProPTransfer` and its six companions, `TauCeti.zmodChar_eq_one_of_transfer_eq_one`, `TauCeti.zmodChar_eq_one_of_comp_transfer_eq_one`, `TauCeti.exists_abelianizationProPMk_eq_smul_div_of_mk_eq_one`, `TauCeti.subsingleton_h1_abelianizationProP_of_isCyclic`, `TauCeti.abelianizationProPClass_generates_of_isCyclic`, `TauCeti.abelianizationProPClass_generates_of_card_eq_prime`: none exists. The pinned `ClassModule/` has `Basic.lean` (the carrier, action, factor set and class) and `ChangeOfGroup.lean` (the subgroup equivalences). The claim "Tau Ceti proves both statements when `G ⧸ V` is a cyclic `p`-group" (README 1993, `Suggested.lean:27`) is therefore false at the pin.
4. `TauCeti.galoisEvens` (and the laws `galoisRes_galoisEvens`, `galoisEvens_add`, `galoisEvens_galoisRes`): absent, as they must be without item 1.
5. "Tau Ceti supplies … the embedding `coindBotEmbedding` with its quotient `DimensionShiftQuotient` and short exact sequence `coindBotShortExact`" (1302–1305, used again at 1638 and 1659): none of the three names occurs in the pinned Tau Ceti. `DimensionShifting/Basic.lean` has `explicitDimensionShift0` (146), `explicitDimensionShift1`, `dimensionShiftIso` (192) and the two `subsingleton_H*_discreteCoind_bot` theorems.

**Witness:** `grep -rl` over the pinned `TauCeti/` for each name returns nothing (for example `evensNormIndexTwo`: 0 files; `abelianizationProPTransfer`: 0 files; `coindBotShortExact`: 0 files). `STATUS.md` documents a later Tau Ceti (`c7ae9d7`), which is where these names come from.

**Repair:** For each name either cite the pinned declaration that does the job (`graphClass`, `graphClass_eq_cochainClass`, `evensGraphCochain_eq_indexTwoInd_pullback`, `explicitDimensionShift1`, `dimensionShiftIso`) or write the item as this roadmap's own target, unbackticked as §2's convention prescribes, with its hypotheses and `*Needs:*`. Concretely: the norm on `H¹(U, 𝔽₂)` classes with representative independence and the pullback identity on classes become targets of 13.1; the strict criterion becomes a target of Layer 11 (and a headline, R03); sub-milestones 2 and 3 of the class module become targets throughout, and the sentence about the cyclic case is deleted from the README and from the docstring of `Suggested.lean`; the embedding and quotient of dimension shifting become Layer 7 targets. Keep the pin's `[LocallyCompactSpace G]` on `graphClass` in the contract.

**Repair check:** Run the README's backticked `TauCeti.*` names against the pinned tree by last component: at this head 428 such names, of which 21 declarations are absent; after the repair every backticked `TauCeti.*` name resolves.

## R03 (P2) — The strict-dimension criterion is a statable headline and is absent from `Suggested.lean`

**Location:** `README.md:1956`–`1968` ("The strict dimension from the ordinary one (NSW (3.3.4))") and `:1951`, `:2151`; `Suggested.lean:17` (the docstring lists "the criteria for ordinary and strict cohomological dimension" among the headlines the pin proves).

**Claim:** The criterion `scd_p G ≤ n ↔ cd_p G ≤ n ∧ ∀ open U, H^{n+1}(U, ℤ)(p) = 0` is one of the roadmap's end theorems (Scope item 10, the Class Field Theory consumer at `n = 2`). The pin does not prove it (R02, item 2), and the acceptance test neither states it nor names it as unstatable. It is statable on native carriers.

**Witness:** A scratch file with `import Mathlib`, the pinned `CohomologicalDimension.Basic` and `TrivialF2` modules, and

```lean
theorem strictCriterion (p : ℕ) (hp : p.Prime) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (n : ℕ) :
    strictCohomologicalDimensionAt.{u} p G ≤ n ↔
      cohomologicalDimensionAt.{u} p G ≤ n ∧
        ∀ U : OpenSubgroup G, AddCommGroup.primaryComponent
          (continuousCohomology (n + 1)
            (TopRep.of (ContRepresentation.trivial ℤ U.toSubgroup (ULift.{u} ℤ)))) p = ⊥ := by
  sorry
```

elaborates with only its `sorry` warning (with `TopRep.distribMulAction` and `TopRep.smulCommClass` as local instances, the pin's own idiom in `TrivialF2.lean`).

**Repair:** Add this statement to `Suggested.lean` under Layer 11, docstring citing NSW (3.3.4) and noting that the `≤` form holds for every `n`; update the module docstring so that it lists the criterion among the stated headlines rather than among the pinned ones.

**Repair check:** `G = ℤ_p`, `n = 1`: left side false (`scd_p ℤ_p = 2`); right side false because `H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`. `n = 2`: both true, since `cd_p = 1 ≤ 2` and `H³(U, ℤ) ≅ H²(U, ℚ/ℤ) = 0` for every open `U ≅ ℤ_p`. `G = C_p`, any `n`: both false.

## R04 (P2) — Targets the pinned Tau Ceti already proves are planned again instead of cited

**Location:** `README.md:1149`–`1150` and `:1185`–`1195` (Layer 6, "What remains to build here is the Mackey formula"); `:1625`–`1626` ("`delta_naturality` … and `delta_corestriction` remain targets here"); `:1678`, `:1681` (`corestriction_trans`, `corestrictionLe`, `mackeyTerm`, `corestriction_mackey` as unbackticked targets); `:2084`–`2091` (`abelianizationProPSubgroupOfEquiv`, `…H1Equiv`, `…H2Equiv`, `…H2Equiv_class` as targets); `:2462`–`2501` (13.3, "Both halves of the passage are targets here", and galoisRes, galoisCor, galoisConj, galoisF2Iso, galoisRes_cup, galoisCor_cup, galoisRes_comp, the three `_embedding_independent` laws as targets).

**Claim:** By the README's own convention (§2, lines 219–222) an unbackticked name is an object this roadmap still builds. Each of the objects above exists at the pin:

- Mackey in degrees 0 and 1: `Corestriction/Mackey/Basic.lean:230` (`explicitCor0_mackey`), `:321` (`explicitCor1_mackey`); in every degree: `Corestriction/Mackey/AllDegrees.lean:90` (`mackeyTerm`), `:279` (`corestriction_mackey`), `:310` (independence of the double-coset representative).
- `delta_naturality` and `delta_corestriction`: `HomologySequence.lean` and `Corestriction/ConnectingMap.lean` (the README's own export row at line 240 lists both as Tau Ceti's, contradicting line 1625).
- `corestriction_trans`, `corestrictionLe`: `Corestriction/AllDegreeTransitivity.lean`.
- The Galois bridge: `TauCeti/FieldTheory/GaloisCohomology/Restriction.lean:60` (`galoisF2Iso`), `:84` (`galoisRes`), `:111` (`galoisRes_cup`), `:148`, `:163`; `Corestriction/Basic.lean:75` (`galoisCor`), `:120` (`galoisConj`), `:138`, `:161`, `:176`; `Corestriction/Cup.lean:52`; `Character.lean:49`, `:63`; `Corestriction/Exact.lean:75`.
- Sub-milestone 4 of the class module: `ClassModule/ChangeOfGroup.lean:64`, `:125`, `:152`, `:179`.

**Witness:** The line numbers above, at the pinned Tau Ceti `a91d3aaf`.

**Repair:** Cite each by its qualified name in the layer and in the §2 table, and reduce the "what remains" sentences accordingly. What genuinely remains in 13.3 is the Evens transport (`galoisEvens` with its three laws, after R02 item 1) and the exactness statement at `H¹(G_L)` and `H²(G_L)`; in Layer 10 nothing of the connecting-map package; in Layer 6 the coefficient naturality of `explicitCor1`/`explicitCor2` on classes and the conjugation interaction; in Layer 11 sub-milestone 4 only the transfer `Ver_{W→V}` and the inflation maps `i`.

**Repair check:** `S₃ ⊇ U = V = C₂`, `H⁰` with trivial `ℤ`: the pinned `explicitCor0_mackey` must give `res ∘ cor = 1 + 2 = 3`, the two double cosets having sizes 2 and 4 and intersections `C₂` and `1`. That is the value the README's formula gives, so consuming the pinned theorem changes no convention.

## R05 (P3) — The module docstring's inventory of what the pin proves

**Location:** `Suggested.lean:12`–`19`, `:26`–`28`.

**Claim:** The list "already proved at the Tau Ceti pin" includes "the criteria for ordinary and strict cohomological dimension" and "the index-two Evens norm with its identities, its exact sequences and its `D₁₆` pullback formula", and line 27 says the class-module theorem is proved for cyclic `p`-groups. At the pin: the ordinary criteria exist (`SingleDegree.lean`, `BoundedExponent.lean`), the strict one does not (R03); the index-two package exists at the level of the graph class of a homomorphism and the cochain-level pullback, not as a norm on classes (R02); no case of the class-module theorem exists.

**Repair:** Reword the two bullets and delete the cyclic-case sentence, together with the matching README sentence at 1993–1996.

## R06 (P3) — Kahn, Remarque II.2.3, is cited for a statement it does not make

**Location:** `README.md:2375`–`2377` and `:2679`–`2683`.

**Claim:** The references entry says Remarque II.2.3 gives "at rank one, the reading of Layer 13.1's pullback formula as `w₂` of the representation induced from `α`". `Kahn line 812`–`832` is the remark that Proposition II.1.5 fails for a general group, with the dihedral group of order 8 as counterexample (`w₃(ρ) = 0` while the degree-3 term `d · N(x)` of the formula is nonzero). The rank-one reading is Théorème I.4.2 at `r = 1` (`Kahn line 674`–`683`: `w(Ind ρ) = Σ_j N(w^{(j)}(ρ)) d^j`), which the entry already cites.

**Repair:** Cite th. I.4.2 at `r = 1` for the reading, and cite Remarque II.2.3, printed pp. 242–243, only as the warning that the field-theoretic formula of Kahn's Theorem 1 does not hold for an arbitrary group, which is why Layer 13 proves the pullback formula directly.

**Repair check:** For `G = D₈ ⊇ H = C₂ × C₂` and `x` the character of `H` as in the remark, Kahn's own computation shows `N(x) ≠ cor(u) + …` for every `u ∈ H²(H)`, so the remark refutes a formula rather than reading one.

## R07 (P3) — Locators into a private text extraction, and a pinned-file locator that does not exist

**Location:** `README.md:2382`, `:2411`, `:2418`, `:2453`, `:2456`–`2457` ("Evens1963 lines 209–230", "Kozlowski1984 lines 90–102", "Kozlowski1984 line 126"); `:1832`–`1834`.

**Claim:** Line numbers of a worker's text extraction are not locators a reader can use: the roadmap has no sources manifest, and the keys `Evens1963`, `Kozlowski1984` name nothing in the repository. The section and page numbers given beside them suffice (I checked them: Evens §5 is printed pp. 59–60 and the G-ring homomorphism `ψ` is on p. 60; §6 Props. 1–4 pp. 60–62; Thm. 1 p. 63; Kozlowski §2 pp. 310–311 and Lemma 2.4 p. 311). Separately, line 1833 cites `TauCeti/NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean` as an arithmetic consumer reading the invariants at `v = 0`: that path does not exist at the pin (`Local/` has `CohomologicalDimension.lean`, which does not mention `cohomologicalDimensionAt`), and no pinned file instantiates `cohomologicalDimensionAt.{0}`.

**Repair:** Delete the "lines N–M" locators; state the `v = 0` motivation without a file, or cite a pinned file that uses it.

## R08 (P3) — README shape

**Location:** `README.md:44`, `:308`, `:486`, `:579`; Layers 0–11.

**Claim:** The previous review asked for the upstream headings (Scope and ownership, Conventions, Exact supplier contracts, How to read the build, `## Layer k` with `### Examples` and `### Dependencies`). The head keeps `## 1. Scope`, `## 3. Standing hypotheses`, `## 4. What Mathlib already has`, `## 5. The build, in layers`, layers as `###` with `**Prerequisites.**`/`**API**`/`**Source**` paragraphs, and only Layers 12 and 13 end with Examples and Dependencies. The Check at 1897 ("`rfl` does not prove … at the pins") is a statement about the elaborator rather than about the mathematics; it is true (confirmed below) but belongs in the docstring of the theorem, not among the Checks.

**Repair:** Author's choice; the mathematics does not depend on it. If the shape is changed, keep every target's `*Needs:*` line and Checks as they now are.

## Verified sound

**Scope and principles.** No route-specific shortcut: the Evens norm is now built for every finite index, every even degree and every discrete commutative `G`-ring (13.2), with the mod-2 all-degree form as a specialisation. No re-planned roadmap: the only roadmap supplier is `RepresentationTheory/InductionRestriction`, which exists on `main` (`TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`); `ProfiniteProPGroups` and `LocalGaloisGroups` (both under `Completed/`), `ClassFieldTheory` and `QuadraticFormInvariants` (both on `main`) are cited as consumers only, and `ClassFieldTheory` does declare `scd_p_absoluteGaloisGroup_eq_two` and `FiniteClassFormation`. No copied passage, no algorithm. `Suggested.lean` has `import Mathlib` plus two pinned `TauCeti.*` modules, no `set_option`, no sorry'd data, four theorems with docstrings. The two helper files violate every one of these (R01).

**Gate and build.** The worker's gate reports every check passing. `lake env lean Suggested.lean` from the worktree: four `declaration uses sorry` warnings (lines 62, 70, 80, 94), nothing else, 2.9 s. The depcheck with `--movable`:

```text
depcheck: 175 roadmaps, 1176 edges, 0 problem(s)
```

no UPWARD, CYCLE or `moved:` line; `ProfiniteCohomology` is at line 379 of the merge order, `InductionRestrictionPartII` at 45 (its base roadmap is on `main`).

**Signatures and standing hypotheses.** `#check @` of the pinned objects (scratch): `cohomologicalDimensionAt : ℕ → (G : Type u_2) → [Group G] → [TopologicalSpace G] → [IsTopologicalGroup G] → ℕ∞`, with the extra universe `v` first (`CohomologicalDimension/Basic.lean:40`–`44`, `:131`, `:146`); `abelianizationProPClass : (p : ℕ) → (G : Type u_1) → … → (V : Subgroup G) → [V.Normal] → IsOpen ↑V → H2 (G ⧸ V) (Additive (abelianizationProP p G V))` (`ClassModule/Basic.lean:166`); `abelianizationProP_continuousSMul` (`:116`) supplies `ContinuousSMul (G ⧸ V) (abelianizationProP p G V)` from `[V.Normal]`. The four theorems of `Suggested.lean` carry every binder their types need in their own signatures (no `variable` block): `Fact`-free `hp : p.Prime`, compactness, total disconnectedness, normality, openness, and `strictCohomologicalDimensionAt.{u}` at the universe the pinned subgroup theorems use (`ClosedSubgroup.lean:108`–`110`, `IndexNotDvd.lean:163`–`165`). The README states the same generality (1859–1868, 1984–1991).

**One-tactic probe.** Each of the four theorems was tried in a scratch copy with `rfl`, `simp`, `infer_instance` (the `Subsingleton` one) and `exact ?_`: none closes. In particular `rfl` does not identify `cohomologicalDimensionAt.{u} p G` with `cohomologicalDimensionAt.{0} p G`, so the universe theorems are not renamings. No padding.

**Headline inventory.** From the README's Scope (items 1–12) and Layer 11: comparison isomorphisms, finite-quotient colimit, long exact and five-term sequences, change of groups with Mackey, Shapiro and dimension shifting, cup products, cohomological dimension with the dévissage criteria, the strict criterion, the class-module theorem, Hilbert 90 and Kummer, the graded cup, the Evens norm. Proved at the pin and correctly cited: comparisons (`CohomologyComparison.lean`), colimits (`FiniteQuotient/*`), sequences (`ShortExact`, `LongExact`, `HomologySequence`, `FiveTerm`, `Transgression`), corestriction with `res_comp_corestriction`, transitivity and Mackey, Shapiro (`Shapiro/AllDegrees.lean`), `dimensionShiftIso`, `TopPairing` with `cup_assoc`, `cup_gradedComm`, `cup_projection`, `hilbert90`, `kummerIso`, the ordinary-dimension criteria (`SingleDegree.lean`, `BoundedExponent.lean`), the subgroup inequalities. Stated in `Suggested.lean`: the two universe theorems and the two class-module theorems. Not at the pin and absent: the strict criterion (R03, statable). Not statable and named in the docstring: the general Evens norm (the map is a construction through tensor induction; `Subgroup.tensorInductionFunctor` exists at `TauCeti/RepresentationTheory/Tensor/Induction.lean:235`, no cohomological norm does), which I accept.

**Adversarial pass.** Coefficients have the trivial action unless stated; finite groups are discrete.

| Statement | Instances tried and the values on each side | Result |
|---|---|---|
| `cohomologicalDimensionAt_universe_eq` | `G = 1`: both sides `0`. `G = ℤ_p`: both `1`. `G = C_p`: both `⊤`. `u = 0`: the two parameters are the same term. Both predicates quantify over `M : Type u` since `max u u = max u 0 = u`; the comparison in degree 0 for `G = 1`, `M = ℤ` sends `[1] ↦ [1]`, excluding `x ↦ −x`. | True; route sound; not `rfl` (probe). |
| `strictCohomologicalDimensionAt_universe_eq` | Same three groups: `0 = 0`, `2 = 2`, `⊤ = ⊤`. An additive equivalence carries `primaryComponent p` to `primaryComponent p`, so the predicate transfers. | True. |
| `subsingleton_h1_abelianizationProP` | `G = ℤ_p`, `V = pℤ_p`: `V^ab(p) = pℤ_p`, trivial `ℤ/p`-action, `H¹ = Hom(ℤ/p, pℤ_p) = 0`. Free pro-`p` `F` of rank 2, `V` of index `p`: `V^ab(p) ≅ ℤ_p[C_p] ⊕ ℤ_p`, `H¹(C_p, ℤ_p[C_p]) = 0`, `H¹(C_p, ℤ_p) = Hom(C_p, ℤ_p) = 0`. `V = G`: trivial group, `H¹ = 0`. Negative control `G = C_p`, `V = 1`: `scd_p = ⊤`, excluded. | Hypotheses necessary and sufficient on these instances. |
| `abelianizationProPClass_generates` | `ℤ_p ⊇ pℤ_p`: `H² = pℤ_p/p²ℤ_p` of order `p`, carry cocycle class `= p`, `ZMod (p^1)`, `p ↦ 1`; `p = 2, 3` give orders `2, 3`. `V = G`: `index = 1`, `factorization 1 p = 0`, `ZMod 1`, `H² = 0`, `1 = 0`. `G = ℤ_p × C_ℓ`, `V = ℤ_p`, `ℓ ≠ p`: `H²(C_ℓ, ℤ_p) = ℤ_p/ℓ = 0`, `ZMod (p^0)`; with the full index `ℓ` the statement would be false. Free pro-`p` rank 2, index `p`: `H²(C_p, ℤ_p[C_p]) = 0`, `H²(C_p, ℤ_p) = ℤ/p`, cyclic of order `p`. `G = ℤ_p²`, `V = pG` (`cd_p = 2`, `scd_p = 3`): `H²((ℤ/p)², ℤ_p²)` has order `p⁴ ≠ p²`, excluded by `scd_p ≤ 2`. | Hypothesis `scd_p ≤ 2` is the right one; `cd_p ≤ 2` is not. |
| Junk value of `V.index.factorization p` | Infinite index gives `index = 0`, `factorization 0 p = 0`, `ZMod 1`; excluded because an open subgroup of a compact group has finite index. | No junk reaches the statement. |
| Strict criterion (R03) | `ℤ_p`, `n = 1`: left false, right false (`H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p`). `n = 2`: both true (`H³(U, ℤ) ≅ H²(U, ℚ/ℤ) = 0`). `C_p`: both false for every `n`. | Statement as written is correct; must be stated. |
| `cd_p ≤ scd_p ≤ cd_p + 1` | `1`: `0 ≤ 0 ≤ 1`. `ℤ_p`: `1 ≤ 2 ≤ 2`. `C_p`: `⊤ ≤ ⊤ ≤ ⊤ + 1 = ⊤`. | Upper bound attained at `ℤ_p`; equality false. |
| Ordinary versus strict predicate | `ℤ_p`, `M = ℤ`, `i = 2`: `H² = ℚ_p/ℤ_p ≠ 0`, so dropping the torsion restriction from the ordinary predicate changes `cd_p ℤ_p` from `1` to `≥ 2`. | The two predicates differ as the README says. |
| Compactness in the torsion theorem | `⊕_ℕ ℤ` discrete, `ℚ_p/ℤ_p`: `H¹ = ∏_ℕ ℚ_p/ℤ_p`, the element `(1/p^k)_k` is killed by no `p^r`. | README negative control valid. |
| General Evens norm, index one | `N_G^G = id` in every degree and for every `A`; a map multiplying by `l` also gives `id`, separated by the next row. | Check pair discriminates. |
| General norm, odd characteristic | `G = C₃ × C₂ ⊇ U = C₃`, `A = 𝔽₃`, `a` generating `H²(C₃, 𝔽₃)`: `res N(a) = a · (s·a) = a² ≠ 0` (`H^*(C₃, 𝔽₃) = 𝔽₃[x, y]/(x²)`, `a = y`); `N(2a) = N(2) N(a) = 4 N(a) = N(a)`, `2 N(a) ≠ N(a)`. | The general-ring target is needed and non-additive. |
| Expansion, Evens Thm. 1 | Same example, `l = 2`: `res(1 + cor a + N a) = 1 + 2a + a² = (1 + a)² = res N(1 + a)`. Degree 0, `A = ℤ`, index 2, `x = 2`: `N(1 + 2) = 9 = 1 + 4 + 4`; `N(1 + 1) = 4 ≠ N(1) + N(1) = 2`. | Source matches (`Evens line 345`–`348`): `N_0 = 1`, `N_1 = tr`, `N_l = N`. |
| Even-degree restriction | Odd degree `q`, index 2: the swap acts on `f ⊗ f` with sign `(−1)^{q²} = −1`, so the external square is equivariant only when `2 = 0` in `A`; for `A = 𝔽₂` the sign vanishes. | 13.2's degree rule is right. |
| Double-coset law | `U` normal of index 2, `K = U`: two double cosets, both intersections `U`, so `res N(x) = x · (s·x)`; at `U = G`: one coset, identity. | Shape agrees with `Evens line 274`–`276`. |
| Monomial embedding convention | `S₃`, `U = 1`, `t = id`: factors all `1`; `(12)(23) = (123)` under left translation, `(132)` under inverse translation. `C₄ ⊇ ⟨s²⟩`, `t = {1, s}`: `a(s, U) = s²`, `a(s, sU) = 1`. | Only left translation is a homomorphism. |
| Index-two graph cochain | `C₄ = ⟨σ⟩`, `U = ⟨σ²⟩`, `s = σ`, `α(σ²) = 1`: `b₁ = (0, 1, 1, 0)` at `1, σ, σ², σ³`; `b₁(σ²) = 1 ≠ b₁(σ) + b₁(σ) = 0`. | Components are not cocycles; only the sum has a class. |
| Index-two norm anchor | `C₄ ⊇ C₂`, `α ≠ 0`: `res N(α) = α ⌣ α = x² ≠ 0` in `H²(C₂)`, so `N(α) = u ≠ 0` in `H²(C₄, 𝔽₂) = 𝔽₂`; the central extension with class `u` is `C₈` (a lift of `σ` has fourth power the kernel generator), the class `0` is `C₂ × C₄`. | Convention anchor consistent. |
| `H^*(C₄, 𝔽₂) = 𝔽₂[χ, u]/(χ²)` | `χ² = 0`, `res u = x² ≠ 0`, `χ ⌣ H¹ = 0`: the index-two sequence `H¹(G) →χ⌣ H²(G) →res H²(U)` is exact (`0 → 𝔽₂ ↪ 𝔽₂`). | README Check correct. |
| Index exactly two | `S₃ ⊇ C₂` (index 3), `𝔽₂`: `res¹` and `cor¹` are both isomorphisms `𝔽₂ → 𝔽₂`, so `im res = 𝔽₂ ≠ ker cor = 0`. | Hypothesis necessary. |
| Norm of a restricted class | `C₂ ≀ C₂`, `y = χ_U`: `res χ_U = 0`, `N(0) = 0 = χ_U² + χ_U · χ_U`; the false neighbour `y ⌣ y = χ_U² ≠ 0`. | `χ_U ⌣ y` term necessary. |
| `D₁₆` pullback | `|D₁₆| = 16`, `|C₂ ≀ C₂| = 8`, kernel `{1, r⁴}` of order 2 (central). The pinned `evensGraphCochain_eq_indexTwoInd_pullback` (`DihedralPullback.lean:285`) is cochain-level; the class-level name the README cites is absent (R02). | Convention at the pin; citation to repair. |
| Kozlowski Lemma 2.4 | `x` of degree 1: formula (ii) gives `N(x) = Sq⁰x · t + Sq¹x = x t + x²`; `x = 0` gives `0`. | Locator now correct (`Kozlowski line 126`–`130`). |
| Kahn I.4.2 at `r = 1` | `ρ = α` rank one: `w(ρ) = 1 + α`, `w(Ind α) = N(1 + α) + …`, degree-2 term `N(α) + d · cor(α)`-type; `C₂ × C₂ ⊇ C₂`, `x` on `H`, `χ` the quotient character: `Ind` splits as `x ⊕ (x + χ)`, `w₂ = x² + χ x`. | Matches the restricted-class identity. |
| Graded-cup `δ` sign (Layer 12 target) | `(m, n) = (2, 1)`: `(−1)^{mn + (m+1)n} = (−1)^{2+3} = −1`; `(1, 2)`: `(−1)^{2+4} = +1`; `(m, 0)`, unit class: both sides `δx`. | Excludes `(−1)^m`, `(−1)^{mn}`, `−1`, and an extra sign in degree 0. |
| Cup, Leibniz, commutativity | `C₂`, `𝔽₂`: `x(s) = 1`, `(x ⌣ x)(s, s) = 1`, nonzero class. `C₃`, `𝔽₃`: `x² = 0` since `x² = −x²`. Degree 0 over `ℤ`, `G = 1`: `1 ⌣ 3 = 3 = 3 ⌣ 1`, `(2 ⌣ 3) ⌣ 5 = 30`. | Signs and units consistent. |
| Projection formula | `C₄ ⊇ C₂`, degree 0, `ℤ`, `a = 3`, `b = 5`: `cor(res a ⌣ b) = 2 · 15 = 30 = a ⌣ cor b = 3 · 10`. | Direction and index agree with the pin's `cup_projection`. |
| `cor ∘ res = (G : U)` | `C₄ ⊇ C₂`, `𝔽₂`, `H¹`: `res χ = 0`, `cor res χ = 0 = 2χ`; `H⁰` over `ℤ`: `2 = 2 · 1`. Cochain level, `C₄`, sign `ℤ`, `f(s) = 1`: `cor¹(res f)(s) = 0` while `2 f(s) = 2`, difference `d⁰` of `−2`. | Identity on classes, not on cochains (README 425–433). |
| Mackey | `S₃`, `U = V = C₂`, `H⁰`, `ℤ`: double cosets of sizes 2 and 4, contributions `1` and `2`, sum `3 = res cor`. | Pinned theorem to be cited (R04). |
| Inner automorphisms trivial (Milne 0.15) | `S₃`, `𝔽₂`: `H¹ = {0, sign}`, conjugation by `(12)` sends `(23)` to `(13)`, sign unchanged; `C₂`: identity. | Source at `Milne line 542`–`548`. |
| Finite-quotient colimit | `ℤ_p`, `𝔽_p`: `H¹ = 𝔽_p`; at level `pℤ_p`, `H¹(ℤ/p, 𝔽_p) = 𝔽_p`, generator already there. `M = 0`: all terms `0`. `C₄ ⊇ C₂ ≥ 1`: the nonzero `H¹(C₂, 𝔽₂)` inflates to the parity character, value `1` at `σ`. | Direction `(OpenNormalSubgroup G)ᵒᵖ` correct. |
| Shapiro, degree 0 | `C₂`, `H = 1`, `𝔽₂`: `Coind = 𝔽₂²` (order 4) with invariants `(a, a)` (order 2) mapping to `𝔽₂`; the complexes differ in degree 0, the cohomology agrees. | Quasi-isomorphism, not isomorphism of complexes, as the README says. |
| Dimension shifting at `i = 0` | `C₂`, sign `ℤ`: `Coind_1 = ℤ²` swap, embedding `m ↦ (m, −m)`, quotient `ℤ` by sum, invariants `(a, a) ↦ 2a`, cokernel `ℤ/2 = H¹(C₂, ℤ_sign)`, while `H⁰(quotient) = ℤ`. | Isomorphism false at `i = 0`, cokernel form right. |
| Descent from a closed subgroup, false neighbour | `C₂`, `𝔽₂ ↪ 𝔽₂[C₂]` diagonal: `H¹(C₂, 𝔽₂[C₂]) = 0`, so the coefficient inclusion kills `H¹(C₂, 𝔽₂) = 𝔽₂`. | The levelwise shortcut fails as the README says. |
| Five-term sequence | `C₄ ⊇ C₂`, `𝔽₂`: `H¹(C₂^{quot}) → H¹(C₄)` iso, `res: H¹(C₄) → H¹(C₂)` zero, transgression iso onto the carry class, `H²(C₂^{quot}) → H²(C₄)`: images/kernels `1/1`, `0/0`, `1/1`. | Exact at the three middle nodes. |
| Kummer | `ℝ`, `n = 2`: `ℝˣ/ℝˣ² = {±1}`, `H¹(C₂, μ₂)` of order 2. `ℂ`: both trivial. `𝔽₂(t)`, `n = 2`: `μ₂ = 1` so `H¹ = 0`, but `t` is not a square. | `IsUnit (n : K)` necessary. |
| Hilbert 90 | `ℂ/ℝ`: the cocycle with value `−1` at conjugation is `σ(i)/i`. Separably closed `K`: trivial group, `H¹ = 0`. | Multiplicative coboundary convention. |
| Sections of profinite quotients | `ℝ → ℝ/ℤ` has no continuous section; `ℤ_p → ℤ/p` has none that is a homomorphism (a homomorphism `ℤ/p → ℤ_p` is zero). | Hypotheses and false neighbour as stated. |
| Discrete `C(G, M)` and the explicit topology | `∏_ℕ C₂`, `𝔽₂`: no finite set of evaluations isolates the zero character, so the pointwise quotient topology on `H¹` is not discrete. | `DiscreteH1`, `DiscreteH2` necessary for the categorical statement. |
| Zero module, zero ring, trivial group | `M = 0`: every `Cⁿ`, `Zⁿ`, `Bⁿ`, `Hⁿ` is `0`; the unit ideal gives the zero module only. `G = 1`, `M = ℤ`: `H⁰ = ℤ`, `H¹ = H² = 0`. | No nontriviality hypothesis needed. |
| `p = 2`, `p = 3` in the class module | Orders `2` and `3` for `ℤ_p ⊇ pℤ_p`; the carry cocycle at `(p − 1, 1)` has value `p` for both. | No parity exception. |

**Pinned declarations opened** (file and line at the pins): `Mathlib/RepresentationTheory/Continuous/TopRep.lean:213` (`TopRepEquivActionTop`), `:262` (`res`), `:266` (`resFunctor`), `:258` (`coind₁Functor` in use); `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113` (`homogeneousCochains`); `Functoriality.lean:50` (`resolutionMap`), `:103` (`cochainsMap`), `:158`, `:163` (`map_id`, `map_comp`); `LowDegree.lean:84` (`zeroIso`); `Mathlib/Topology/Algebra/ClopenNhdofOne.lean:47`; `Mathlib/Topology/CompactOpen.lean:430`, `:466`, `:471` (`curry` with no hypothesis, `uncurry` and `continuous_uncurry` with local compactness, as the README says); `Mathlib/Topology/Algebra/OpenSubgroup.lean:280`, `:312` (`isOpen_mono`, `quotient_finite_of_isOpen`, both in `namespace Subgroup`); `Mathlib/GroupTheory/Index.lean:240`, `:679`, `:756`. Tau Ceti: `CohomologicalDimension/Basic.lean:131`, `:139`, `:146`, `:151`, `:173`; `Strict.lean:144`, `:158`; `ClosedSubgroup.lean:80`, `:108`; `IndexNotDvd.lean:163`; `ClassModule/Basic.lean:63`, `:116`, `:127`, `:144`, `:166`; `ClassModule/ChangeOfGroup.lean:64`, `:125`, `:152`, `:179`; `LowDegree.lean:712`, `:779` (`H1`, `H2`); `Evens/Class.lean:276`, `:285`; `Evens/DihedralPullback.lean:157`, `:190`, `:285`; `Evens/Identities.lean:74`, `:105`, `:139`; `Evens/CyclicFour.lean:89`; `Corestriction/IndexTwo/EvensConj.lean:72` (`evensConj = cor ≫ res − 𝟙`); `Corestriction/IndexTwo/Exact.lean:130`; `Corestriction/IndexTwo/CupExact.lean:213`, `:242`; `Corestriction/Mackey/Basic.lean:230`, `:321`; `Corestriction/Mackey/AllDegrees.lean:90`, `:279`, `:310`; `DimensionShifting/Basic.lean:146`, `:192`; `TrivialF2.lean:87`–`88` (`ULift.{u} (ZMod 2)`); `RepresentationTheory/Tensor/Induction.lean:235`; `GroupTheory/Index/Two.lean:206`; `GroupTheory/GroupExtension/DihedralSixteen.lean:374`; `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:111`, `:133`, `:166`; `FieldTheory/GaloisCohomology/Restriction.lean:60`, `:84`, `:111`, `:148`, `:163`, `Corestriction/Basic.lean:75`, `:120`, `:138`, `:161`, `:176`, `Corestriction/Cup.lean:52`, `Corestriction/Exact.lean:75`, `Character.lean:49`, `:63`. Name audit: 637 identifier-like backticked tokens of the README checked by last component against both pinned trees; the misses that are declarations are exactly those of R02 (the rest are file, roadmap or notation tokens such as `cd_p`, `G_K`, `b_s`).

**Sources.** The seeded sample's labels (Prerequisites, Source, API) repeat, so I checked every Prerequisites line by the name audit above and every Source paragraph that cites a readable text. Read at their locators in the project's legal cache: Milne, *Arithmetic Duality Theorems* (author's site): `Milne line 291`–`302` (the cup properties (0.1.1)–(0.1.6), with (0.1.6) the inflation compatibility cited at README 1369), `line 449`–`461` (Remark 0.11, the coinduced module `M_*` with right translation and Shapiro, README 1258), `line 542`–`548` (Prop. 0.15, README 832). Evens, Trans. AMS 108 (AMS open archive): `Evens line 209`–`230` (§5, the norm for a subgroup of finite index, transversal independence at 219–222, the `G`-ring homomorphism `ψ` at 223–227, printed pp. 59–60), `line 231`–`233` (the remark that the trivial-action restriction is dropped), `line 249` (Prop. 1), `line 274`–`276` (Prop. 2), `line 301`–`303` (Prop. 3 with `(G : H) = (G' : H')`), `line 313`–`314` (Prop. 4), `line 345`–`348` (Thm. 1, `χ ∈ H^{2r}(H, k)`, `k` a commutative `G`-ring, printed p. 63). Kozlowski, Proc. AMS 91 (AMS open archive): `Kozlowski line 90`–`102` (the `Z/2` transfer `H^i → H^{ni}` and its multiplicativity, printed pp. 310–311), `line 126`–`131` (Lemma 2.4, the special double cover only, printed p. 311). Kahn, Invent. Math. 78 (author's institutional page): `Kahn line 674`–`683` (th. I.4.2), `line 812`–`832` (Remarque II.2.3, see R06). All four locators the README gives agree with the texts except the Remarque II.2.3 reading (R06). The sources service, asked by generic citation, found none of the four; the texts were read from the project cache, whose header records the legal URL of each.

**Ownership.** Searched by object (continuous cohomology carrier, cohomological dimension, class module, Evens norm, Galois bridge) in the pinned libraries, the roadmaps on `main` and the sibling checkouts named in the brief. The only competing owners are the pinned Tau Ceti files of R04. `ProfiniteProPGroups` at its open head (`rev/618`) consumes this roadmap and builds none of its objects. Open pull requests without files in the brief were not checked.

**Declared gaps.** None declared, none needed: every prerequisite is Mathlib, Tau Ceti, an earlier layer or `RepresentationTheory/InductionRestriction` on `main`.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, 2nd ed.: the service resolves the DOI prefix `10.1007` to a paywalled publisher and records `uncertified`; (1.2.5), (1.3.2), (1.5.1)–(1.5.9), (1.6.1), (1.6.4), (1.6.7), (3.3.1)–(3.3.6), (3.3.11), (3.6.1)–(3.6.4), (6.2.1)–(6.2.2) are cited by locator only. The `p`-primary form of (3.6.4) was tested on the instances in the table, not read.
- **Ribes–Zalesskii**, **Serre** (*Galois Cohomology*, *Local Fields*), **Koch**, **Brown**: paywalled or no legal copy located; cited by locator only, as in the previous review.
- **Kahn's and Evens' typography**: the AMS and Inventiones extractions garble superscripts; the even-degree hypothesis of Evens was read from Thm. 1 (`H^{2r}`) and from the sign argument, not from §5's display.
- **Ownership against open pull requests** whose files the brief does not provide was not checked.

## Source issues

- **Misprint** in Milne at I Remark 0.11, printed p. 8: the source says the adjunction target is `Hom_H(H, N)`; it should be `Hom_H(Res_H N, M)`; affects a stated result.
