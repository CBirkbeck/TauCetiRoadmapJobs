# GATE-ModularCharactersAndBlocksPartII~1: answers to the review of head 74855fc

One review, by kim-em (2026-11-19T00:54:29Z). Its ten numbered requests are H01–H11 (request 2
makes two points, H02 and H03); the closing ownership section adds one more suggestion, H12. The
review's coverage section raises no defect. Repairs are in commit `f198e03` on the pull request
branch (not pushed).

## H01 (kim-em) — applied

The Clifford divisibility is now planned in this roadmap, as new `TauCetiRoadmap/ModularCharactersAndBlocksPartII/README.md` §2.5 (line 426): (a) `χ(1) ∣ |H : Z|` for `Z ≤ Z(H)` (isaacs Theorem 3.12, by Tate's tensor-power argument), (b) Schur's `dim M ∣ |Q|` for an irreducible projective representation (through the pinned `TauCeti.IsProjectiveRep.exists_commonExtension_linearization` and `TauCeti.projectiveLiftingFactorSet_ker_le_center`), (c) `θ(1) ∣ χ(1)` and `χ(1)/θ(1) ∣ |G : N|` (isaacs Corollary 11.29), which is Reynolds' own route (reynolds line 538, proof of Theorem 8, p. 30). §8.3 (line 1448), the Layer 8 Dependencies, the opening overview, Scope and ownership and the InductionRestriction contract (line 1915) now cite §2.5. The `gap:` label, the "One supplier gap" paragraph and "What InductionRestriction must provide" are gone.

No roadmap on main or in an open pull request states any of (a)–(c). InductionRestriction Layer 7 on main owns the tensor factorisation and the lifting of projective representations but no degree divisibility. So this roadmap is the owner, and no amendment to InductionRestriction is needed.

## H02 (kim-em) — applied differently

`IsBlockDefectGroup` is replaced by `IsDefectGroup p e P` (`Suggested.lean` line 229). It takes `e : Subalgebra.center k (MonoidAlgebra k G)`, the base's domain, and is the base §6.2 definition with `brauerProjection P e ≠ 0` written as a nonzero coefficient on `C_G(P)`. `brauer_height`, `fongReynolds`, `reynolds_heights` and `reynolds` now take the reduction as a central element `c` with `MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) b = c`, the pattern of base `existsUnique_blockIdempotent_map_residue`, and assume `IsDefectGroup p c D`.

The base's own declaration cannot be used directly: `Suggested.lean` may import only Mathlib and Tau Ceti modules, and `IsDefectGroup` exists only in the base roadmap's `Suggested.lean`, not at the pins (grep of the pinned Tau Ceti and Mathlib finds no `IsDefectGroup`). So the definition is restated, and README §6.1 (line 858) and Scope and ownership both say that it is the base's notion, not a second one. `existsUnique_fongReynolds` mentions no defect group and is unchanged. The base theorems `isDefectGroup_conj` and `isDefectGroup_iff_sylow_of_augmentation_ne_zero` are now cited as base §6.2 in the body and by their fully qualified base names in the supplier contract.

## H03 (kim-em) — applied

`blockCharacters` is now a target of its own in §6.1 (line 858). It has its definition, the identification `blockCharacters e_B = Irr(B)` at a splitting system (base §4.2), a partition bullet, and the four witness Checks that used to sit in Conventions. The Conventions bullet "Blocks in `Suggested.lean`" (line 164) keeps only the Lean encoding of the system and of the reduction. The Lean body is unchanged. It is identical to the `blockCharacters` that the open revision #2534 of ModularCharactersAndBlocks adds to base §4.2, so when that revision merges, this target becomes a citation.

## H04 (kim-em) — applied differently

The Brauer correspondent is now defined as a target in §6.4 (line 1105), retitled "The Brauer correspondent and heights in special blocks". It is built from base §6.2 (`Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D`, each arising from exactly one `B`) and base §7.1 (`b'^G = B`). It comes with the bijection statement, conjugation behaviour `D ↦ gDg⁻¹`, `b' ↦ g b' g⁻¹`, and a Check. The defect `d(B)`, defined by `|D| = p^{d(B)}` and independent of `D` by base §6.2, is defined in §6.3 (line 1015) rather than §6.4, because the heights `h(χ) = ν(χ(1)) − (a − d)` defined there use it. Pointers to "Conventions" for the correspondent in §9.2 and in the base §6.2 and §7.1 contracts now point to §6.4.

## H05 (kim-em) — disputed

Both names are correct at the pinned Tau Ceti (`2fd255d`, the `lake-manifest.json` pin), which the roadmap is written against. `CharacterTable/Degree.lean` declares `finrank_dvd_card` (line 117) inside `namespace TauCeti` (line 52) and `namespace Representation` (line 57). `Induction/Clifford/Basic.lean` declares `isSemisimpleRepresentation_comp_subtype` (line 327) inside `namespace TauCeti` (line 97) and `namespace Representation` (line 99).

A temporary `#check @TauCeti.Representation.finrank_dvd_card` and `#check @TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` against the pins elaborated both (signatures recorded below). The root-namespace names the review gives come from a newer Tau Ceti (`0642eae29`), not the pin. `FDRep.finrank_dvd_card` also exists at the pin (Degree.lean line 140) but is not used.

## H06 (kim-em) — disputed

LocalFiniteGroupTheory (open, #1634) cannot supply this roadmap. It is not in the merge order, while this roadmap is at position 59, and it is not among the admissible suppliers of this roadmap. So §1.2 keeps the statements, and the duplication is settled the other way: LocalFiniteGroupTheory L3 should cite §1.2 for `C_G(A)`-conjugacy of fixed points and for fixed cosets. Its coset statement is the special case of a normal `A`-invariant `N`; §1.2 proves it for any `S`-invariant subgroup `H`.

Adopting its declaration names here is not possible either. §1.2's statements are not headline theorems, and every backticked name of this roadmap's own must be declared in `Suggested.lean`, where non-headline lemmas are not admitted. No roadmap on main states these lemmas: OddOrderTheorem §1.3 has other coprime-action results, and FiniteGroupExtensionSplitting leaves coprime action to LocalFiniteGroupTheory.

## H07 (kim-em) — answered

The top-level placement follows the convention on main for Part IIs of RepresentationTheory sub-roadmaps. `TauCetiRoadmap/RootSystemsPartII/` and `TauCetiRoadmap/QuiverRepresentationsPartII/` (Part IIs of `RepresentationTheory/RootSystems` and `RepresentationTheory/QuiverRepresentations`) are top-level directories, each with its own `metadata.toml` (`topic = "math.RT"`). Moving the folder would also change its module path and its merge-order and build entries, which a README/Lean revision does not touch. The directory is unchanged.

## H08 (kim-em) — applied

All 106 lines with `<source> line N` citations now give theorem, section and page instead. For example, "glauberman line 234, Theorem 2 (a)" → "Glauberman 1968, Theorem 2 (a), p. 1470"; "martinez line 728, Theorem 3.4, proof lines 783–831" → "Martínez, Theorem 3.4 and its proof, pp. 18–20"; "reynolds line 531, Theorem 8" → "Reynolds 1963, Theorem 8, p. 30". The pages used are:

- journal pages for Glauberman (pdf page + 1464), Reynolds (+ 14), Hartley–Turull (+ 173) and Späth–Vallejo (+ 275);
- the printed pages of Martínez's notes (pdf page − 8, the base's convention);
- the pages of Sambale's author PDF (the base's convention).

References (line 1921) now carry `doi:10.4153/CJM-1968-148-x` (Glauberman), `doi:10.1017/S0027763000011004` (Reynolds) and `doi:10.1016/j.jalgebra.2016.01.042` (Späth–Vallejo), each printed in the cached text. Hartley–Turull, Martínez and Sambale now carry the GDZ, author and course URLs. The three Annals papers carry arXiv ids, with the preprint version whose numbering is cited. Ruhstorfer's published title, volume and pages (Ann. of Math. 201 (2025), 379–457) were checked against the Annals issue page.

## H09 (kim-em) — applied

In §6.3 the parenthesis "where the parenthesis at line 725 compares `d(B)` with `χ(1)_p` and should compare `p^{a−d(B)}` with `χ(1)_p`" is deleted. The correct statement stays, cited as "Martínez, §3.2, p. 18".

## H10 (kim-em) — applied

Conventions (line 130) now justify "at every place `v` over `p`": base §1.1 fixes an arbitrary finite place, and base §4.2 notes that a statement over all maximal ideals `M ∋ p` of the algebraic integers covers every choice of place in §1.1. The same citation is added to the base §1.1 supplier contract (line 1809).

## H11 (kim-em) — applied

The sentence "GlaubermanZStar consumes the base only." is deleted from Downstream consumers (line 1562).

## H12 (kim-em) — answered

The change of system for blocks and defect groups (§6.1 first bullet, §6.3 "Change of system") stays in this roadmap. The base on main does not state it: base §6.2 has the scalar extension `k ⊆ k'`, which §6.1 consumes, and base §2.4 the compatibility of decomposition maps, but neither has the passage from the system at a place to an arbitrary splitting system. A revision cannot be waited on (open #2534 does not add it either), and Layers 6–9 need it. If a later revision of the base takes it over, this roadmap will cite it.

## Build

`lake build TauCetiRoadmap.ModularCharactersAndBlocksPartII.Suggested`: `Build completed successfully (18334 jobs)`. The only warnings are the 16 expected `declaration uses 'sorry'`, one per theorem.

## Gate

`gate ModularCharactersAndBlocksPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable --pr 2411`): `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

Citation resolver (`roadmaps resolve`): no cross-roadmap citation and no Lean name is unresolved. The four leads in the brief (`IsGlaubermanFamily.*`) are declared in `Suggested.lean`.

## Signature check

I put a `#check @name` for each changed declaration and for the newly cited library names into a temporary copy of `Suggested.lean`, built it once against the pins, then restored the file. The temporary copy imported the Tau Ceti modules those names live in.

- **Changed declarations.** `IsDefectGroup`, `blockCharacters`, `brauer_height`, `fongReynolds`, `existsUnique_fongReynolds`, `reynolds_heights` and `reynolds` elaborate with exactly the binders of their README statements. The new binders `c`/`hc`, `cB`/`hcB`, and `B'`/`cB'` with the equation `mapRingHom … B' = cB'` in the conclusion are all present. No section binder is lost, since the file has no `variable` block.
- **Library names elaborated against the pins.** `TauCeti.Representation.finrank_dvd_card`, `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`, `TauCeti.IsProjectiveRep.exists_commonExtension_linearization`, `TauCeti.projectiveLiftingFactorSet_ker_le_center`, `TauCeti.exists_isProjectiveInertiaExtension`, `TauCeti.IsProjectiveInertiaExtension.isProjectiveRep_homAction`, `TauCeti.IsProjectiveInertiaExtension.tensorRepEquiv`, `TauCeti.IsProjectiveInertiaExtension.isIrreducible_tensorRep_iff` and `CategoryTheory.endomorphism_simple_eq_smul_id`.
- **One name confirmed by grep instead.** `FDRep.cliffordCorrespondence` was cited before this revision and its module was not imported in the temporary copy. It is at `Induction/Clifford/Classes.lean` line 125, in `namespace FDRep`.

## Adversarial pass on the statements added or changed

| statement | instances | values | result | change |
|---|---|---|---|---|
| §2.5 (a) `χ(1) ∣ \|H : Z\|`, `Z ≤ Z(H)` | `SL(2,3)`, `Z = {±1}`; `Z = 1`; `H` abelian, `Z = H`; non-central `⟨t⟩ ≤ S₃` | degrees `1,1,1,2,2,2,3` vs `12`; `χ(1) ∣ \|H\|`; `1 ∣ 1`; `2 ∤ 3` | holds; square variant fails (`9 ∤ 12`); centrality needed | Checks added (square variant, `⟨t⟩`) |
| §2.5 (a) route | `H^m`, `Z_m` | `\|Z_m\| = \|Z\|^{m−1}`, `\|H^m/Z_m\| = \|H : Z\|^m \|Z\|`; on `Z_m` the character equals `χ(1)^m λ(z₁⋯z_m) = χ(1)^m` | holds | none |
| §2.5 (b) `dim M ∣ \|Q\|` | `Q = 1`; `Q = C_n`; `C₂ × C₂` with `diag(1,−1)`, swap; 3 copies of trivial rep of `C₂` | `1 ∣ 1`; `1 ∣ n` (`H²(C_n, ℂˣ) = 0`); `DS = −SD`, factor `−1`, no stable line, `2 ∣ 4`; `3 ∤ 2` | holds; irreducibility needed | Checks added |
| §2.5 (c) `χ(1)/θ(1) ∣ \|G : N\|` | `SL(2,3)`, `N = Q₈`; `Q₈`, `N = Z`; `S₃`, `N = A₃`; `N = 1`; `N = G` | `3/1 ∣ 3`, `2/2 ∣ 3`; `2/1 ∣ 4` with `\|G : T\| = 1`; `2/1 ∣ 2`, `1/1 ∣ 2`; `χ(1) ∣ \|G\|`; `1 ∣ 1` | holds; undivided variant fails at `N = G` (`χ(1) ∣ 1`); "ratio = `\|G : T\|`" fails for `Q₈` | Checks added |
| §8.3 via §2.5 (c) | `SL(2,3)`, `p = 2`, `D = Q₈`, `T = G`, `\|T : N\| = 3` | `ψ(1)/θ_ξ(1) ∈ {1, 3}`, prime to `2`; heights `{0, 1}` | holds | gap citation → §2.5 |
| `IsDefectGroup` (Lean) vs base | `e = 0`; `e = 1` in `𝔽_p[G]`; `k[S₃]`, `p = 2`, `e = 1+r+r²`, `r+r²`; `k[S₄]`, `p = 3` | none qualify; Sylow subgroups; `⟨t⟩`, `1`; `1` (coefficients `0,2,1,0,1`) | equals base `brauerProjection P e ≠ 0` (truncation nonzero ⇔ some coefficient on `C_G(P)` nonzero) | name and domain changed |
| `brauer_height` with `c` | `G = 1`; `S₃`, `p = 2`, `O = ℤ₂[ζ₃]`, `B₀` and defect-zero block | `c = 1`, `D = 1`, `1 ∣ 1`, `ν(1) = 0`; `a = d = 1`, degrees `1,1`; `D = 1`, `2 ∣ 2`, `ν(2) = 1 = a − d` | holds; `c` exists (image of a central element under a surjective map is central), so `hc` is not vacuous | binders added |
| `fongReynolds` with `cB`, `cB'` | `N = G` (`T = G`, `B = b`); `S₃`, `N = C₃`, `p = 2`, `b = {λ}` | `B' = B`, `cB' = cB`, `indClassFun` the identity; `{λ} ↦ {std}`, defect groups `1 ↦ 1` | holds | binders added |
| `reynolds_heights`, `reynolds` with `c` | `Q₈`, `p = 2`, `O = ℤ₂[i]`; `S₃`, `p = 3`, `D = C₃` | heights `{0,1}` = `{ν(1), ν(2)}`; degrees `1,1,2`, `ν₃ = 0 = a − d`, `C₃` abelian | holds | binders added |
| §6.1 `blockCharacters e_B = Irr(B)` and partition | `G = 1`; `S₃`, `p = 2` over `ℤ₂[ζ₃]`; `ℤ₂[C₃]` (non-splitting) | `{1}`; `{1, sgn}`, `{std}`; single degree-2 character `2, −1, −1` | identification holds at a splitting system; the non-splitting Check shows why the hypothesis is stated | text moved from Conventions |
| §6.3 `d(B)` | `G = 1`; `S₃`, `p = 2`, `B₀`; conjugate defect groups | `d = 0`; `d = 1`; `\|gDg⁻¹\| = \|D\|` | well defined | definition added |
| §6.4 Brauer correspondent and conjugation | `S₃`, `p = 2`, `D = ⟨t⟩`, `r⟨t⟩r⁻¹`; `A₅`, `p = 2`; `SL(2,3)`, `p = 3` | `Br_D(1+r+r²) = 1`, `Br_D(r+r²) = 0`; `Br_{gDg⁻¹}(e_B) = g Br_D(e_B) g⁻¹` since `e_B` is a class function; `4 = 4`; `3 = 3` | holds | definition moved from Conventions; conjugation sentence and Check added |

## Ownership against open work

- **Sibling checkouts.** I searched the roadmaps on main and the open roadmap pull requests through `roadmaps grep`, by object, for the inputs of §2.5. I also searched for blocks characters and defects and for Glauberman's lemma.
- **Open revision #2534 of the base (author kim-em).** It adds to the base `blockCharacters` (§4.2, with the same body as here), `IsDefectGroup` over `k` and over `O`, `blockDefect` and `brauerCorrespondent` (§6.2). A revision is never a dependency, so this roadmap keeps its §6.1, §6.3 and §6.4 definitions and cites the base as it is on main. When #2534 merges, those three targets become citations of base §§4.2 and 6.2: `blockCharacters` and `IsDefectGroup` already have its signatures.
- **No name collisions.** No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap. This roadmap's `TauCetiRoadmap.ModularCharactersAndBlocksPartII.IsDefectGroup` differs from the base's `TauCetiRoadmap.ModularCharactersAndBlocks.IsDefectGroup`.
- **§1.2.** See H06.

## Sources

No new text was fetched; every locator above was read from the cached extractions listed in the brief, and `needs-references.toml` is not needed. The review text contained no instruction to run commands or act outside the job.
