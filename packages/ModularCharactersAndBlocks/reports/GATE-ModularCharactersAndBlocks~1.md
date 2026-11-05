# GATE-ModularCharactersAndBlocks~1 — answers to human review of head 4b23da3

Repairs committed as `4e18c0d3` on the pull-request branch (not pushed). Files changed:
`TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md` (rewritten in house shape)
and `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean`.

## H01 (kim-em) — answered

LocalFiniteGroupTheory is a new-roadmap pull request by another author, so it may be consumed. Only Layer 8.3 (the kernel theorem `⋂_{χ ∈ Irr(B₀)} ker χ = O_{p'}(G)`) uses it, through §L1 `pPrimeCore p ⊤`; Layers 0–7 need only Mathlib's Sylow theory. The README now cites "LocalFiniteGroupTheory, §L1" by name and section (supplier contract and Layer 8 *Needs:*). Neither roadmap is in the merge order yet; the dependency check places this roadmap after its last supplier.

## H02 (CBirkbeck) — applied

F01: `groupAlgebraBaseChangeK0` does not exist at Tau Ceti `358314d4` or Mathlib `f6090c70` (searched both). It is removed. Field-extension comparisons now cite ModularInduction Layer 1 `modRepK0.baseChange` (main, `RepresentationTheory/ModularInduction/README.md` lines 227–231), in the supplier contracts and in §§2.1, 2.4. A contract Check records `G = 1`, `𝔽₂ ⊆ 𝔽₄`: trivial class ↦ trivial class.

## H03 (CBirkbeck) — applied

F02: the five `Mathlib.*` imports are replaced by `import Mathlib` and `import TauCeti.RingTheory.Idempotents.Primitive.Basic`. The targeted build now succeeds with only `sorry` warnings (the module-system note was later cleared by adding the `module` header). The gate reports `imports=0 mathlib-subimports=0 no-import-mathlib=0`, and no build failure.

## H04 (CBirkbeck) — applied

F03: the sentence "…must be linked by proved bijections" is replaced in §4.2. There are now surjections `Irr(G) → Bl(G)` and `IBr(G) → Bl(G)` with fibres `Irr(B)` and `IBr(B)`, and bijections among the blocks of `O[G]`, the blocks of `k[G]` and the two families of fibres (Martínez Def. 2.1 p. 9, Thms 2.11–2.12 p. 15). A Check records `S₃`, `p = 3`: fibres of sizes 3 and 2 over the single block.

## H05 (CBirkbeck) — applied

F04: Layer 0 no longer constructs the `p`-part decomposition. "Scope and ownership" and §0.1 consume `TauCeti.pPart`, `TauCeti.pFreePart`, `eq_pPart`, `eq_pFreePart`, `commute_pFreePart_pPart`, `pPart_mul_pFreePart`, `pPart_conj`, `pFreePart_conj`, `orderOf_pPart` and `orderOf_pFreePart` (`TauCeti/GroupTheory/OrderOfElement/PPart.lean`). §0.1 keeps only the sections, their centralizer parametrization and homomorphism compatibility. Conventions pin the `C₆`, `p = 2` witness (`g³`, `g⁴`). They also state that the native `pSectionIndicator` indexes sections by the `p`-regular part, not the `p`-part.

## H06 (CBirkbeck) — applied

F05: §1.3 now consumes `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` (`RingTheory/AdicCompletion/Idempotent.lean:75`) and `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (`Algebra/Module/Projective/Lift.lean:89`). It states what is added here: primitivity is preserved, central lifts are unique, and `Z(O[G]) → Z(k[G])` is surjective via class-sum bases. That addition is the new headline `existsUnique_blockIdempotent_map_residue`. Checks: the `ℤ₂`, `G = 1` lift (with `(2)` not nilpotent), the `ℤ₂[C₃]` block lifts, and the non-integral `(1 ± t)/2` in `ℤ₂[C₂]`.

## H07 (CBirkbeck) — applied

F06: `Suggested.lean` now states seven headlines. Principal-block defect groups are exactly the Sylow subgroups (`isDefectGroup_iff_sylow_of_augmentation_ne_zero`), using the defect predicate the reviewer tested, now `IsDefectGroup`. The others are Brauer's count `card_simpleModules_eq_card_pRegularClasses`, `existsUnique_blockIdempotent_map_residue`, `isDefectGroup_conj`, `brauer_first_main` and `brauer_third_main_local`, kept alongside `brauerProjection_mul` and `complete_blockIdempotents_unique`. The module docstring names the headlines that cannot be stated at the pins and the carrier each lacks:
- reciprocity, surjectivity of the decomposition map and the Brauer-character basis: Brauer characters, and reduction of lattices over a complete DVR (`TauCeti.reductionK0` reduces `ℤ`-forms only);
- generalized decomposition numbers and the second main theorem: Brauer characters of centralizers;
- the ordinary block partition, block-section orthogonality and the kernel theorem: the `p`-block partition of `Irr(G)`, and `O_{p'}(G)`, which is absent from pinned Mathlib.

## H08 (CBirkbeck) — applied differently

F07: §5.2 states the orthogonality exactly, with conjugation, index set `R` and the Cartan matrix `c^u` of `k[C_G(u)]`: `∑_{χ ∈ Irr(G)} d^u_{χφ} conj(d^v_{χψ}) = δ_{uv} c^u_{φψ}`. It also states the block form (Sambale Thm 1.14 p. 16) and the matrix form `Q* Q = diag(c^u)`, so `|det Q|² = ∏ det c^u`. The vague "integral change-of-basis statements" and "class-algebra coefficient formulas" are deleted, not repaired: `Q` is invertible over `ℂ` and not in general over `ℤ[ζ_{|G|_p}]` or its localization at `p`, which the README now says. The block-restricted within-section Cartan formula is that block form; it stays in §5.2, with *Needs:* §7.2, instead of moving to Layer 7. Checks reproduce `C₂`: `det Q = −2`, `Q*Q = diag(2,2)`; `S₃`, `p = 3`: `det Q = −3`; and the `S₃` factors `6, 2, 3`, which are imported from the native `TauCeti.sum_characterTable_mul_conj`.

## H09 (CBirkbeck) — applied

F08: every target now carries a theorem number and printed page, checked against the cached texts. Examples: Brauer's count is Webb Thm 9.3.6 p. 147 and Martínez Thm 1.9 p. 5; `C = DᵀD` is Webb Cor. 9.5.6 p. 160; defect groups by maximal Brauer image are Webb Thm 12.5.2 / Cor. 12.5.5 pp. 244–246; Brauer pairs are Craven Defs 2.6–2.10 pp. 22–24; the main theorems are Webb Thm 12.6.4 p. 250 and Sambale Thms 1.12–1.15 pp. 16–17. Where only a route exists (residue splitting §2.3, kernel theorem §8.3), the route and its inputs are given, with no locator claimed. Serre is marked as cited by locator only, text not read.

## H10 (CBirkbeck) — applied

F09: the README now has the house sections (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–8 with `k.n` subsections, Downstream consumers, References). Every definition has an API list and at least three Checks; targets have *Needs:* lines; each layer ends with Examples and Dependencies. Brauer-pair inclusion is defined (`⊴` and its transitive closure, Craven Def. 2.8) before its laws. Layers 0–8 keep the old M0–M8 numbering, so citations from GlaubermanZStar transfer directly. §3.1 adds the asymmetric `A₂` orientation Check (`[[1,0],[1,1]]` against its transpose). §6.1 adds the three negative controls: non-fixed input, characteristic, and `p`-group.

## H11 (CBirkbeck) — applied

F10: the module docstring is now "target signatures", with `/-! ## Layer k -/` comments in README order (0, 2, 4, 6, 7). Every declaration has a mathematical docstring with source, every Lean name appears in the README (gate `readme-ids-missing=0`), and every declaration carries its binders explicitly.

## H12 (CBirkbeck) — applied

F11: the pull-request link and "proposal" wording are removed. The supplier is "LocalFiniteGroupTheory, §L1" with its `pCore p H` / `pPrimeCore p H` contract. A Check records that `pPrimeCore p ⊤` for `S₃` at `p = 2` is `C₃`, the intersection of the kernels of the trivial and sign characters. The gate reports `prnum=0`.

## Further change found while repairing (ownership)

GL2AutomorphicRepresentationsAndTransfer §R17.5.11 is earlier in the merge order. It already plans the Brauer character over an algebraically closed field of characteristic `p`, for a chosen `τ : μ_m(k) ≃ μ_m(ℂ)`, with conjugacy invariance, additivity, the lattice comparison and recognition of composition factors. It states "Modular characters and their projective pairing are owned here". Layer 2.1 now imports these with `m = e'` and `τ` fixed by the modular system. It owns only the tensor, dual, restriction, inflation and induction formulas, the basis theorem and the count. Fong–Swan (§R17.5.12 there) is cited, not restated. No notion was moved down from a later roadmap.

Ownership against open pull requests: `roadmaps grep` for defect groups, Brauer characters, block idempotents, Brauer pairs and principal blocks found only GL2AutomorphicRepresentationsAndTransfer (handled above), IntegralHeckeAndGaloisDeterminants (block idempotents of generalized matrix algebras, a different object) and consumers (GlaubermanZStar). No declaration in `Suggested.lean` reuses a fully qualified name from a readable roadmap.

## Elaborated signatures

All eleven declarations were checked with `#check @name`, appended temporarily to `Suggested.lean`, elaborated in one build and then removed. Each elaborated type matches its README statement, and no section binder was dropped: every declaration now carries its binders explicitly, with no section `variable`s. Changes from 4b23da3: `IsAlgClosed` appears only on the count and the first and third main theorems. The defect-group theorems are stated for any field of characteristic `p`, the generality of Webb Cor. 12.3.2 and Thm 12.5.2; `existsUnique_blockIdempotent_map_residue` assumes no characteristic.

## Adversarial pass (statements added or changed)

| Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| `card_simpleModules_eq_card_pRegularClasses` | `S₃` p=2; `S₃` p=3; `C_p`; `G=1`; `C₃` over `𝔽₂` | 2 simples / 2 classes; 2 / 2; 1 / 1; 1 / 1; 2 simples vs 3 classes | holds; `𝔽₂` case shows splitting is needed | kept `IsAlgClosed`; Check added |
| `existsUnique_blockIdempotent_map_residue` | `ℤ₂`, `G=1`; `ℤ₂[C₃]`; `ℤ₂[C₂]` | `0,1 ↦ 0,1`; `(1+r+r²)/3 ↦ 1+r+r²`, `(2−r−r²)/3 ↦ r+r²`; only block `1`, matching one block of `𝔽₂[C₂]` | holds | none |
| `IsDefectGroup` | `S₃` p=2 blocks `1+r+r²`, `r+r²`; `C₃` p=2 without the `p`-group condition | `Br_{⟨(12)⟩}`: 1, 0; maximal: three `C₂`'s and `1`; without the condition `C₃` would be maximal (`Br_{C₃}(1+r+r²) ≠ 0`) | definition excludes the wrong model | Check added |
| `isDefectGroup_conj` | `S₃` p=2 principal; `G=1` | three conjugate `C₂`'s; `{1}` | holds | dropped `IsAlgClosed` |
| `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `S₃` p=2; `𝔽₂[C₃]`; `G=1` | augmentation of `1+r+r²` is `3=1`, of `r+r²` is `0`; Sylow `C₂` ↔ defect `C₂`; `C₃` p=2: defect `1` = Sylow `1` | holds both directions | dropped `IsAlgClosed` |
| `brauer_first_main` | `S₃` p=2 `D=⟨(12)⟩`; `D=1`; `S₃` p=3 `D=C₃` | `N=D`, one block ↦ `B₀` (`Br_D(e₀)·1 = 1`), defect-zero block not hit; identity on defect-zero blocks; identity | holds | none |
| `brauer_third_main_local` | `S₃` p=2 `P=H=⟨(12)⟩`; `P=1`, `H=G`; `C₃` p=2 with `P=H=C₃` (not a `p`-group) | `1·1 ≠ 0` and `aug=1`; `e₀e_b≠0 ⇔ b=e₀`; `(1+r+r²)e_j = 0` for `j ≠ 0` and `aug(e_j)=0` | holds | none |
| `brauerProjection_mul` (unchanged) | `x=y=r+r²`; `x=r`, `y=r²`; over `ℚ`; `P=C₃` in char 2 | `0=0`; `1 ≠ 0`; `2 ≠ 0`; `1+r+r² ≠ 0` | hypotheses all needed | Checks added |
| `complete_blockIdempotents_unique` (unchanged) | `𝔽₃[C₂]` with `(e₊,e₋)` and `(e₋,e₊)`; empty family | swap matches; empty sum `0 ≠ 1` excluded by completeness | holds | none |
| §5.2 orthogonality | `C₂` p=2; `S₃` p=3; `C₃` p=3 with and without conjugation; `S₃` p=2 blocks at `g=h=1` | `Q*Q = diag(2,2)`, `det −2`; `diag([[2,1],[1,2]],3)`, `det −3`; 3 vs 0; 2 and 4, total 6 | conjugation required; not integrally invertible | stated exactly |
| §4.2 block partitions | `S₃` p=3; `S₃` p=2 central characters on transposition class | fibres 3 and 2 over 1 block; `3 ≡ −3 ≢ 0 (mod 2)` | holds | replaces the false bijection claim |
| §0.1 sections | `S₃` p=2, p=3; `C₆` | sizes 3,3 and 4,2; classes `3 = 2+1`; `g ↦ (g³, g⁴)` | holds | Checks added |
| §8.3 kernel theorem | `S₃` p=2, p=3; `C_p` | `C₃ = O_{2'}`; `1 = O_{3'}`; `1`, while the simple module's kernel is `C_p` | holds | route given |
| §0.2 scalar extension | `𝔽₂[C₃] → 𝔽₄[C₃]` | `r+r² = (1+α²r+αr²) + (1+αr+α²r²)` | primitivity not preserved | Check added |

## Build, gate and dependency check

Two repairs were made after the worker's checks, in commit "review repairs (restore family README, mark Suggested.lean as module)":
- `outside-folder`: `TauCetiRoadmap/RepresentationTheory/README.md` is restored to its `origin/main` version. The pull request's earlier commits had added a family-list entry, a dependency bullet and a rewritten scope paragraph there. `git diff --stat origin/main...HEAD` now lists only `ModularCharactersAndBlocks/README.md` and `ModularCharactersAndBlocks/Suggested.lean`. The family index is regenerated after merge. Its "No modular representation theory proper" exclusion still reads as it does on main, so the family maintainers will need to reconcile it with this roadmap at merge time.
- `build` module-system warning: `Suggested.lean` now begins with the `module` header (as `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main does). The imports are unchanged: `import Mathlib` plus `import TauCeti.RingTheory.Idempotents.Primitive.Basic`. Nothing else in the file changed.

Build (`lake build TauCetiRoadmap.RepresentationTheory.ModularCharactersAndBlocks.Suggested`): `Build completed successfully (8958 jobs).` The only warnings left are eight `declaration uses 'sorry'`; the "consider adding `module`" warning is gone.

Gate summary line at the repair commit:

```text
gate ModularCharactersAndBlocks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: ModularCharactersAndBlocks (insert it after its last supplier)
```

The only remaining item is `depcheck=1`. The roadmap is not in the merge order yet, which is the design-stage case and not a defect.

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

No `UPWARD` or `CYCLE` line.

Sources: no new source was fetched and `needs-references.toml` was not written. All locators come from the cached `martinez`, `webb`, `sambale`, `craven`, `axiom-section` and `axiom-third` texts; `serre` stays uncertified and is cited by locator only. Two Webb sections, Theorem 12.6.4 and Cor. 12.5.5, were read for the first time; `sources.toml` (board-managed, not editable here) already records `webb`.
