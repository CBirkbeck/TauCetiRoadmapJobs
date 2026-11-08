# Review of LieHighestWeight (pull request #1220 at 024d797)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

Incremental re-review of the 14 lines changed since a02f4b2 (the merge of the Tau Ceti pin bump to `2fd255d99` and the rename `adjointDerivation` → `lieModuleDerivation`). The rename itself is correct (the three native names exist at the new pin and the old one is gone), but the pin bump moved five of the fifteen headline theorems and four of the five definitions of `Suggested.lean` into the pinned Tau Ceti, so the acceptance test now restates library theorems and the README plans targets the library already proves (R01). The worker's gate fails on the targeted build at the new pin (R02). The four findings of the previous review are untouched by the change and are carried (R03–R06). Paths below are relative to the folder above; library paths are relative to the pinned package roots.

## R01 (P2) — Five headlines and four definitions of `Suggested.lean` are native at the pin

**Location:** `Suggested.lean:116` (`minuscule_pieri`), `:141` (`symmetricDegreeLE`), `:145` (`linearInvariants`), `:155` (`lieInvariantSymmetricAlgebra`), `:170` (`lieCartanRestriction`), `:179` (`exists_lieChevalleyRestrictionIso`), `:189` (`exists_harishChandraIso`), `:198` (`centralCharacter_eq_iff_dotOrbit`), `:249` (`gl_dual_standard_pieri`); README.md:1339 “the **minuscule Pieri rule** `minuscule_pieri` gives …”, :1462 “Define the ordinary linear Weyl-invariant subalgebra `linearInvariants`”, :1476 “the normalized existence theorem `exists_harishChandraIso`”, :1483 “construct `harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W`”, :1512–1530, :1704 “Prove `exists_lieChevalleyRestrictionIso`”, :1745–1754, :1765 (`centralCharacter_eq_iff_dotOrbit`), :1873–1944 (§7.2), :2364 (`gl_dual_standard_pieri`), :333–335 (“Bijectivity and the filtered comparison remain Layer 7 targets”).

**Claim:** these are headline theorems the finished roadmap will prove, and the four definitions are needed to state them.

**Witness:** at the pinned Tau Ceti (`2fd255d99`) each one exists with the same statement, opened at file and line and elaborated in a scratch `#check` scaffold (signatures in the table under Verified sound):

- `TauCeti.minuscule_pieri` (`Algebra/Lie/HighestWeight/Pieri.lean:154`): the identical statement, hypotheses `IsDominantIntegral b lam`, `IsMinuscule b mu`, `IsDominantIntegral b nu`; the roadmap's theorem closes by `exact TauCeti.minuscule_pieri base hlam hmu nu hnu`.
- `TauCeti.gl_dual_standard_pieri` (`Algebra/Lie/GeneralLinear/Pieri.lean:388`): the identical statement over `[IsAlgClosed K]`; closes by `exact`.
- `LieSubalgebra.lieChevalleyRestrictionIso H : lieInvariants K L L ≃ₐ[K] linearInvariants H` (`Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:151`), with `coe_lieChevalleyRestrictionIso_apply` (`:163`, the forward map is `TauCeti.lieCartanRestriction H`, by `rfl`) and `lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff` (`:177`, degrees preserved in both directions); the roadmap's `exists_lieChevalleyRestrictionIso` closes by `⟨LieSubalgebra.lieChevalleyRestrictionIso H, fun p => rfl, fun n p => (…_mem_homogeneousSubmodule_iff H).symm⟩` once its three carriers are the native ones.
- `TauCeti.harishChandraIso b : Subalgebra.center K (U L) ≃ₐ[K] dotInvariants b` (`CentralCharacter/Isomorphism.lean:106`), `coe_harishChandraIso_apply` (`:114`, the map is `hcProjection b`) and `harishChandraIso_symm_mem_pbwFiltration` (`:148`: PBW degree ≤ n iff the invariant lies in `wordFiltration (SymmetricAlgebra.ι K H) n`); the roadmap's `symmetricDegreeLE n` equals that word filtration by `rw [TauCeti.Algebra.wordFiltration_eq_iSup_pow, symmetricDegreeLE, iSup_subtype]` (elaborated), so `exists_harishChandraIso` closes from the three native declarations by `⟨harishChandraIso base, coe_harishChandraIso_apply base, …⟩` with that `rw` (elaborated). The whole of `Isomorphism.lean` is stated for `K : Type` (universe zero); the roadmap's statement has `K : Type*`, a difference of universe only, which is not a mathematical generality and not a headline: cite the native declaration and say in the contract that the pin states it for `K : Type`. `TauCeti.harishChandraLinearIso` (`:84`) and `TauCeti.hcProjectionLinear` (`CentralCharacter/Linear.lean:223`) are the linear versions the README asks to construct.
- `TauCeti.vermaCentralCharacter_eq_iff` (`Isomorphism.lean:160`): `vermaCentralCharacter b lam = vermaCentralCharacter b mu ↔ ∃ w, dotAction … b w lam = mu`; the roadmap's `centralCharacter_eq_iff_dotOrbit` is this up to `eq_comm`: it closes by `(TauCeti.vermaCentralCharacter_eq_iff base).trans (exists_congr fun _ => eq_comm)` (elaborated, with `K : Type` as at the pin; with `K : Type*` the term fails only on the universe).
- `TauCeti.SymmetricAlgebra.lieInvariants K L L` (`LinearAlgebra/SymmetricAlgebra/LieModule.lean:172`), `TauCeti.linearInvariants H` (`CentralCharacter/Linear.lean:100`) and `TauCeti.lieCartanRestriction H` (`Algebra/Lie/Killing/CartanRestriction.lean:203`, the symmetric map of `killingCartanProjection H`, `:93`): each is equal to the roadmap's definition by `rfl` (elaborated: `lieInvariantSymmetricAlgebra_eq`, `linearInvariants_eq`, `lieCartanRestriction_eq_rfl` in the scratch probe). The pin also has `decompose_mem_lieInvariants_iff` (`LieModule.lean:197`) and `mem_lieInvariants_iff_mem_maxTrivSubmodule` (`:185`), the two API bullets README.md:1912–1914 and :1747 ask for.

**Repair:** in `Suggested.lean` delete the five theorems and the four definitions (`symmetricDegreeLE`, `linearInvariants`, `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`; the fifth, `productEnveloping`, stays), remove the imports that only they used (`…SymmetricAlgebra.LieModule`, `…SymmetricAlgebra.Homogeneous` if nothing else needs it; `…CentralCharacter.DotOrbit` and `…HighestWeight.Tensor`/`Minuscule` are then unused as well) and rewrite the module docstring's list of headlines (`:21–25`) so it names only the ten that remain (polynomial dictionary, monic finiteness, PBW symmetrization, Tits sign, Serre injectivity, G₂, F₄, E₈, E₆/E₇, product centre). In the README: move the five results and the three carriers into `### From Tau Ceti` with their names and files (replace :333–335 “Bijectivity and the filtered comparison remain Layer 7 targets” by the citation of `harishChandraIso`, `harishChandraLinearIso`, `hcProjectionLinear`, `vermaCentralCharacter_eq_iff`; add `lieChevalleyRestrictionIso`, `lieCartanRestriction`, `lieInvariants`, `linearInvariants`, `minuscule_pieri`, `gl_dual_standard_pieri`), list them under Scope and ownership as consumed, and cut the corresponding construction prose of §6.1 (:1335–1345 becomes a citation), §7.1 (:1458–1490 the HC construction, :1512–1530 the Chevalley construction, :1695–1705, :1745–1754, :1765–1766) and §7.2 (:1873–1944, whose four definitions are now native; keep only what is not at the pin, which is nothing in that subsection), and §9.1 (:2363–2366). Where a later target consumes them (Layer 9's centre comparison, Layer 10, the `*Needs:*` lines at :1952 and :2579), cite the native names. The five own backticked names of R03 that are now library names (`harishChandraLinearIso`, `hcProjectionLinear`) become `TauCeti.`-qualified citations.

## R02 (P3) — The targeted build fails the gate at the new pin

**Location:** `Suggested.lean:1`, “import Mathlib”; the worker's gate: `build=4 FAIL`, “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`” (twice for this file, twice for `AdoIwasawa/Suggested.lean`).

**Claim:** the gate passes on this head.

**Witness:** rerun on this head with `--build`: every text counter is 0 and `build=4 FAIL` with exactly those four warnings. The two for `AdoIwasawa/Suggested.lean` are main's file (the pull request does not touch it; the outside-folder diff against `origin/main` is empty) and are not this roadmap's to fix; the two for this file are. Twelve roadmaps on main (`AffineMorseLefschetz`, `CoboundaryExpansion`, `HeegaardFloer`, `MorseNovikov`, `PDE`, …) already use the module form and the gate's import rule accepts `public import Mathlib`.

**Repair:** write the file in module form: `module`, blank line, `public import Mathlib`, `public import TauCeti.…` for each remaining Tau Ceti module, the docstring, `@[expose] public section` (or `public section`), then the namespace; no declaration changes.

## R03 (P3) — Five backticked names of this roadmap's own have no declaration (carried)

**Location:** README.md:1483 “construct `harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W`”; :1451 (`centralCharacter base λ`), :1481 (`hcProjectionLinear`), :1516 (`coadjointRepresentation := …`), :1721 (`centerPBWGradedInvariantIso n`).

**Claim:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

**Witness:** none of the five is in `Suggested.lean` at this head; `harishChandraLinearIso` and `hcProjectionLinear` now exist at the pin as `TauCeti.harishChandraLinearIso` (`CentralCharacter/Isomorphism.lean:84`) and `TauCeti.hcProjectionLinear` (`CentralCharacter/Linear.lean:223`), so “construct” is wrong for them; the other three resolve only in main's `Suggested.lean`, which this pull request replaces. Unchanged since the previous review (R01 there).

**Repair:** cite the two native ones with the `TauCeti.` prefix (see R01), and write the other three as prose targets without backticks.

## R04 (P3) — A cited TangentialBordism anchor does not exist at its head (carried)

**Location:** README.md:52 “[TangentialBordism, B3](../../TangentialBordism/README.md#b3-low-groups-and-specified-geometric-examples)”; :2172; and “CharacteristicClasses, C5.1” at :50, :1518, :1759, :2499.

**Claim:** TangentialBordism has a section B3 at that anchor, and CharacteristicClasses a heading C5.1.

**Witness:** TangentialBordism at its open head (rev/942) has no heading containing “low groups”; the Cayley-plane ownership is `### 9.1 Idempotent Cayley plane (B3.6)` (`README.md:2053`) and `### 9.2 Compact automorphisms and Spin isotropy (B3.7)` (`:2112`). CharacteristicClasses on main has a `## C5.` heading and no “C5.1” heading. Unchanged since the previous review (R02 there).

**Repair:** cite “TangentialBordism §§9.1–9.2 (B3.6–B3.7)” with the anchors `#91-idempotent-cayley-plane-b36` and `#92-compact-automorphisms-and-spin-isotropy-b37`; “C5” for CharacteristicClasses.

## R05 (P3) — The family index still describes the old layer structure (carried)

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:36–40`, “sl₂ as the engine case, the root-space decomposition, weights, Verma modules and `L(λ)`, the highest-weight classification, Weyl's complete reducibility, the Weyl character and dimension formulas, …”.

**Claim:** this is what the LieHighestWeight roadmap builds.

**Witness:** at this head those items are supplier contracts (README.md:12–32), and the roadmap's own content is the tensor comparisons, Serre presentation, exceptional models, reductive centres and affine Weyl geometry (README.md:3–8). The index is the pull request's own (the brief) and is unchanged since the previous review (R03 there); with R01 the index's “minuscule Pieri rule” also becomes a consumed native theorem.

**Repair:** rewrite the entry to the restructured scope in one or two lines.

## R06 (P3) — Gap bookkeeping: a shared slug with different needs, and no registration (carried)

**Location:** README.md:473–480, “What SchurWeyl must provide (gap:skew-lr-tableaux, the contract that TensorProductCombinatorics also consumes under this name)”; :482–485 (`gap:lr-product-rule`); :70–81.

**Claim:** `gap:skew-lr-tableaux` is one contract shared with TensorProductCombinatorics, and `gap:lr-product-rule` is a separate need.

**Witness:** TensorProductCombinatorics at its head (rev/1107, `README.md:289–313`) declares `gap:skew-lr-tableaux` against SchurWeyl with a far larger `needs` that already includes the product rule this roadmap asks for under `gap:lr-product-rule`. The board package for this folder still holds only `reports/` (no `plan.json`), so none of the eight gaps is registered. Unchanged since the previous review (R04 there).

**Repair:** either adopt TensorProductCombinatorics' wording for the shared slug and drop `gap:lr-product-rule`, or give this roadmap's narrower contract its own slug (for example `gap:lr-tableau-count`) and keep `gap:lr-product-rule`.

## Previous findings

- R01 — not repaired: README.md:1483 still says “construct `harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W`”; :1451, :1481, :1516, :1721 unchanged (now R03).
- R02 — not repaired: README.md:52 still links `#b3-low-groups-and-specified-geometric-examples`; :2172; “C5.1” at :50 (now R04).
- R03 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:36–40` unchanged (now R05).
- R04 — not repaired: README.md:473–485 unchanged; the board package has no `plan.json` (now R06).

## Verified sound

**The change.** The diff is exactly the rename: README.md:1514, :1748, :1922 and `Suggested.lean:6`, `:161`, `:165`, `:167`. At the pinned Tau Ceti (`2fd255d99`, Lean `v4.36.0-rc2`, Mathlib `1b1ccf4b0`) `TauCeti.SymmetricAlgebra.lieModuleDerivation` (`LinearAlgebra/SymmetricAlgebra/LieModule.lean:89`, `(derivationOfEnd R M).comp (LieModule.toEnd R L M)`), `lie_eq_lieModuleDerivation` (`:115`, `rfl`), `lieModuleDerivation_mem_homogeneousSubmodule` (`:119`) and the module `TauCeti.LinearAlgebra.SymmetricAlgebra.LieModule` exist; no `adjointDerivation` remains anywhere in the pinned Tau Ceti; `rootInvariantForm.isOrthogonal_reflection` (`Algebra/Lie/Weights/InvariantForm.lean`) and `derivationOfEnd` still exist. `lieModuleDerivation_ι` (`:99`) gives `x · ι m = ι ⁅x, m⁆`, the convention the README's Checks use. The definition's bracket `⁅x, p⁆` on `SymmetricAlgebra K L` is the pin's `instLieRingModule` (`:106`) for `M = L`, so the carrier is the adjoint invariants, and it is `rfl`-equal to the native `lieInvariants K L L` (R01). The outside-folder diff against `origin/main` prescribed by the brief is empty (the 300-odd files `changes.md` lists outside the folder are main's own pin-bump commit, merged into the branch).

**Gate and dependency check.** Rerun on this head:

```text
gate LieHighestWeight: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

and with `--build` the same counters with `build=4 FAIL` (R02). The required dependency check returned exactly

```text
depcheck: 241 roadmaps, 2368 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The supplier edges are unchanged since the previous review (RootSystems, ClassicalGroups, SchurWeyl, CompactGroups, LieGroups, ReductiveGroups, ReflectionInvariantTheory, all on main at the headings cited there).

**Elaboration and signatures.** The worker's `lake env lean` of `Suggested.lean` at this head gives the 20 elaborated types in the job's signatures file; each was compared with its README statement, and the ten “looks dropped” leads are the tool's heuristic (the `IsTriangularizable K H L` instance is present in every elaborated type as `LieModule.IsTriangularizable K (↥H) L`; the four definitions carry only the variables their types mention, as README.md:1873 and :1925–1929 state). A scratch file importing the four native modules (built first with `lake build` of those modules) elaborated `#check @name` for 19 native declarations and closed the roadmap's `minuscule_pieri`, `exists_lieChevalleyRestrictionIso` and `gl_dual_standard_pieri` from the native declarations with one term each (over `K : Type*`), and `centralCharacter_eq_iff_dotOrbit` and `exists_harishChandraIso` likewise once `K : Type` as at the pin (over `K : Type*` the same terms fail only with a universe mismatch), proved the three definition equalities by `rfl` and `symmetricDegreeLE n = wordFiltration (ι K H) n` by `rw` (R01). The one-tactic padding probe of the previous review stands for the ten headlines that are not native.

**Identifiers.** All 346 backticked identifiers of the README were resolved against the pins and `Suggested.lean`: 322 occur literally; the 24 leads are notation (`G_sc`, `H_tot`, `gl_1`), file names, composites (`cartanEquivDual.symm`) or qualified names whose declaration is in a namespace block (`TauCeti.ContRepresentation.exists_isUnitary_congr` at `RepresentationTheory/Compact/UnitaryModel.lean:92`, `CartanMatrix.E₆` now at Mathlib `LinearAlgebra/Matrix/Cartan/Basic.lean:78`, `CartanMatrix.Relations.HE` at `Algebra/Lie/SerreConstruction.lean:102`, `IsKilling.instSemisimple`, `LieAlgebra.exists_isCartanSubalgebra`, `UnitAddTorus.mFourierBasis`, `rootInvariantForm.isOrthogonal_reflection`, `character_irreducible_eq_detTwist` in ClassicalGroups' `Suggested.lean` on main), all present. The resolver's lead list for this README is empty.

**Pinned declarations opened this round.**

| Pin, file and line | Declaration | What it states |
| --- | --- | --- |
| Tau Ceti `LinearAlgebra/SymmetricAlgebra/LieModule.lean:89`, `:115`, `:119`, `:172`, `:185`, `:197` | `lieModuleDerivation`, `lie_eq_lieModuleDerivation`, `lieModuleDerivation_mem_homogeneousSubmodule`, `lieInvariants`, `mem_lieInvariants_iff_mem_maxTrivSubmodule`, `decompose_mem_lieInvariants_iff` | derivation action of `L` on `S(M)` over any commutative ring; invariants `{p ∣ ∀ x, lieModuleDerivation x p = 0}`; invariants are the maximal trivial submodule; invariance is degreewise |
| Tau Ceti `Algebra/Lie/HighestWeight/CentralCharacter/Linear.lean:100`, `:223` | `linearInvariants H`, `hcProjectionLinear b` | `{p ∣ ∀ w lam, lift (w • lam) p = lift lam p}` under `[Field K] [CharZero K] [IsKilling K L] [FiniteDimensional K L] [H.IsCartanSubalgebra] [IsTriangularizable K H L]`; the `−ρ`-translated projection |
| Tau Ceti `Algebra/Lie/Killing/CartanRestriction.lean:93`, `:203`, `:232`, `:238` | `killingCartanProjection H`, `lieCartanRestriction H`, `_surjective`, `_mem_homogeneousSubmodule` | `(cartanEquivDual H).symm ∘ H.incl.dualMap ∘ killingForm K L`; its symmetric map, without `CharZero` |
| Tau Ceti `Algebra/Lie/Killing/ChevalleyRestriction.lean:137`, `:87` | `LieSubalgebra.lieCartanRestriction_injOn_lieInvariants`, `map_coreflection_lieCartanRestriction` | injectivity on `S(L)^L`; coreflection invariance |
| Tau Ceti `Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:151`, `:163`, `:177`, `:136` | `LieSubalgebra.lieChevalleyRestrictionIso H`, `coe_…_apply`, `…_mem_homogeneousSubmodule_iff`, `map_lieInvariants_lieCartanRestriction` | `lieInvariants K L L ≃ₐ[K] linearInvariants H` under `[IsAlgClosed K]`; forward map is restriction; degrees preserved both ways |
| Tau Ceti `Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:84`, `:106`, `:114`, `:138`, `:148`, `:160` | `harishChandraLinearIso`, `harishChandraIso`, `coe_harishChandraIso_apply`, `harishChandraLinearIso_symm_mem_pbwFiltration`, `harishChandraIso_symm_mem_pbwFiltration`, `vermaCentralCharacter_eq_iff` | `Z(U(L)) ≃ₐ[K] S(H)^W` and `≃ₐ[K] S(H)^{W·}`, the whole file with `K : Type` (universe zero) and `L : Type u`; inverse filtration via `wordFiltration (ι K H) n`; `χ_λ = χ_μ ↔ ∃ w, w·λ = μ` |
| Tau Ceti `Algebra/Lie/HighestWeight/Pieri.lean:154`, `:184`, `:193` | `minuscule_pieri`, `tensorMultiplicity_eq_one_iff_of_isMinuscule`, `…_eq_zero_iff_…` | identical to `Suggested.lean:116–122` |
| Tau Ceti `Algebra/Lie/GeneralLinear/Pieri.lean:388` | `gl_dual_standard_pieri` | identical to `Suggested.lean:249–254` |
| Tau Ceti `Algebra/WordFiltration/Basic.lean:342`, `LinearAlgebra/SymmetricAlgebra/Homogeneous.lean:128–141` | `wordFiltration_eq_iSup_pow`, `iSup_homogeneousSubmodule_eq_top` | `wordFiltration f k = ⨆ i ≤ k, range f ^ i`, and `homogeneousSubmodule R M n` is `range ι ^ n` |
| Tau Ceti `Algebra/Octonion/Serre.lean:267`, `:397`, `:405`; `Algebra/AlbertAlgebra/Derivation/Finrank.lean:384`; `Algebra/Lie/E8/Vinberg.lean:79` | `g₂ToDerivationLieAlgebra`, `_surjective`, `fourteen_le_rank_g₂`; `AlbertAlgebra.finrank_derivationLieAlgebra`; `finrank_prod_sl_exteriorPower_dual` | a surjection `g₂ → Der 𝕆` (not yet an equivalence); `dim Der J = 52` (not yet `≃ f₄`); the Vinberg model has dimension 248 (not `finrank e₈`) — so these four headlines are not native |
| Tau Ceti `Algebra/Lie/UniversalEnveloping/PBW/Symmetrization.lean:78`; `CenterFinite.lean:52`; `Prod.lean`, `Abelian.lean` | `pbwSymmetrization n` (degreewise, `n!` a unit); `moduleFinite_over_center` (prime characteristic only); `prodEquivTensor`, `symmetricAlgebraEquiv` | no global `S(L) ≃ U(L)` symmetrization, no central-monic finiteness over an arbitrary field, no product-centre equivalence, no Tits-sign theorem, no `serreLift` injectivity, no polynomial/symmetric-power dictionary — the other six headlines are not native |
| Mathlib `LinearAlgebra/Matrix/Cartan/Basic.lean:78`, `Algebra/Lie/SerreConstruction.lean:102` | `CartanMatrix.E₆`, `CartanMatrix.Relations.HE` | present at the new pin (moved files) |

**Seeded sample in the changed passages.** The three changed README lines sit in §7.1 (the Chevalley bullet) and §7.2 (the `lieInvariantSymmetricAlgebra` definition); the other sampled targets are untouched and their checks of the previous review stand. `etingof` (arXiv 2401.01446v2, cached) lines 2987–3000 (Theorem 13.5 and proof, printed p. 69): the proof works with the invariants `(Sg)^g` under the `g`-action on `Sg` and the symmetrization `Sg → U(g)` as a `g`-module isomorphism, for a semisimple complex `g`; the README's “every Lie algebra over a characteristic-zero field” is its own generalisation of the definition, true since the pin's `lieInvariants` is over any commutative ring. Lines 2207–2210 (Remark 10.2(1), printed p. 52): the Killing identifications `g ≅ g*`, `h ≅ h*` turn Chevalley restriction into `Res : (Sg)^g → (Sh)^W`, a graded algebra isomorphism, which is what README.md:1925–1934 says.

**Adversarial computations.** Rows for the untouched statements are carried from the previous report (its table under Verified sound, rows `exists_polynomialSymmetric` through “Period calibration”, all with their computed values); the rows below are for the statements the change touches.

| Statement or object | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `lieInvariantSymmetricAlgebra`, Check 1 (README.md:1917) | abelian `L`, `p = ι x` | `⁅y, ι x⁆ = ι ⁅y, x⁆ = ι 0 = 0` | invariant | agrees; generators invariant |
| Check 2 (:1918) | `sl₂`, `p = h`, `x = e` | `e · h = ι ⁅e, h⁆ = ι (−2e)` | `≠ 0` | `h ∉` invariants; the sign `⁅e,h⁆ = −2e` is the pin's `lieModuleDerivation_ι` convention |
| Check 3 (:1919) | `sl₂`, `p = h² + 4ef` | `D_e: 2h·(−2e) + 4(0·f + e·h) = −4he + 4eh = 0`; `D_f: 2h·(2f) + 4((−h)f + 0) = 0` | invariant | agrees (commutativity of `S(L)` used) |
| `lieInvariantSymmetricAlgebra = lieInvariants K L L` | definitional | `{p ∣ ∀ x, ⁅x,p⁆ = 0}` | `{p ∣ ∀ x, lieModuleDerivation x p = 0}` with `⁅x,p⁆ ≡ lieModuleDerivation x p` | `rfl` (elaborated) |
| `lieCartanRestriction = TauCeti.lieCartanRestriction H` | definitional | `map ((cartanEquivDual H).symm ∘ H.subtype.dualMap ∘ (killingForm).toDual)` | `map ((cartanEquivDual H).symm ∘ H.incl.dualMap ∘ killingForm)` | `rfl` (elaborated); same map on `sl₂`: `e ↦ 0`, `h ↦ h` |
| `symmetricDegreeLE n = wordFiltration (ι) n` | `H` one-dimensional, `n = 0, 1` | `K`; `K ⊕ K h` | words of length ≤ 0, ≤ 1 | equal (`rw`, elaborated); README.md:1884–1886 Checks hold on both sides |
| `exists_harishChandraIso` versus `harishChandraIso` | `sl₂`, `Ω = h² + 2h + 4fe` | `hcProjection Ω = t² + 2t`, PBW degree 2 | `t² + 2t ∈ wordFiltration 2`, `∉ wordFiltration 1` | same value as the previous report's row; the native inverse-filtration lemma gives both directions |
| `centralCharacter_eq_iff_dotOrbit` versus `vermaCentralCharacter_eq_iff` | `λ = 2`, `μ = −4`; `μ = 1` | `χ(Ω) = 8, 8`; `3` | `∃ w, w·λ = μ`: `s·2 = −2−2 = −4` true; `1` false | the two statements differ only by `eq_comm` |
| Module-form rewrite (R02) | `AffineMorseLefschetz/Suggested.lean` on main | `module` / `public import Mathlib` / `public section` | gate `imports=0` on main | accepted form |

**Ownership.** The object searches of the previous review stand; the only new owner of a headline object is the pinned library itself (R01). Ownership against open pull requests without supplied files was not checked beyond the roadmap search service.

## Not verifiable

- The seeded targets outside the changed passages (§0.1, §3.1–3.2, §5.1–5.2, §6.1–6.2, §9.1–9.3, §10.1–10.2) were not re-opened this round; the previous report's locator checks stand, with its not-verifiable items (Dixmier §1.6, Humphreys 1972 §20.3, Goodman–Wallach, and the background references) unchanged.
- The registration of the eight supplier gaps: no `plan.json` exists in the board package (R06).

## Source issues

- none
