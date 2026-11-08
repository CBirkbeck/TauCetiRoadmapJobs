# GATE-PadicExtensionFamilies~3: answers to the review of `327faa6`

One comment was unanswered: CBirkbeck's comment of 2026-11-08T23:27:27Z. The quoted text breaks
off mid-word ("§2.0 Herbrand functions for non-Galo") and then gives the gate summary. Commit
`327faa6` changes only `TauCetiRoadmap/PadicExtensionFamilies/README.md` and moves only §2.0, so
the list it introduces has that one item. The comment makes two points: the ownership move (H01)
and the claim that the gates pass at this head (H02).

## H01 (CBirkbeck) — applied

The citation is right. RamificationOfCompleteDiscretelyValuedFields §4a.2, read at its head, states
the four things this roadmap consumes:
- independence of `M`;
- the tower law `ψ_(N/K) = ψ_(N/L) ∘ ψ_(L/K)`;
- the finite-level subgroup identity, `subgroupOf_upperRamificationGroup` in its
  `Suggested.lean`;
- the integral formula.

That roadmap's *Downstream consumers* also names PadicExtensionFamilies as the consumer of §4a.2,
and it is line 2 of the merge order, this roadmap line 394.

The move was left half done. The heading `### 2.0 Herbrand functions for non-Galois extensions`
survived, with a body saying only that the material lives elsewhere ("this roadmap does not
restate them"). That stub is deleted. Its notation now sits in the Layer 2 standing hypotheses
(README lines 721–724), with the locator and a computed witness: for `ℚ_2(∜2)` with its
`D_4`-closure, `ψ_{L/K}(2) = φ_{M/L}(3) = 2` and `ψ_{L/K}(3) = φ_{M/L}(7) = 4`. No roadmap cites
PadicExtensionFamilies §2.0, and 2.1–2.7 keep their numbers (ArtinRepresentations cites 2.7).

The same pattern was checked elsewhere. The 2.3 corollary used §4a.2's integral formula for
`u > −1`, but §4a.2 states it only for `u ≥ 0`. The corollary now splits the range (README
lines 811–818):
- for `u > 0` it uses §4a.2's integral formula;
- on `(−1, 0)` both sides equal `f`, because §4a.2 makes `ψ_{L/K}` the identity on `[−1, 0]`
  and 2.1 makes the orbit count `f` there.

Its *Needs* line gains 2.1 and §4a.2.

## H02 (CBirkbeck) — disputed

At `327faa6` the targeted build fails: `lake build TauCetiRoadmap.PadicExtensionFamilies.Suggested`
reports `Unknown identifier` at `Suggested.lean` 334:10, 335:10 and 337:10. The three names are
`finiteExtensionValuativeRel`, `finiteExtensionNormedFieldTopology` and
`finiteExtension_valuativeExtension`. None of them exists at the Tau Ceti pin `2fd255d`, which
merge `91d741cd` brought in by changing `lake-manifest.json` and `lean-toolchain`. The comment's
targeted build runs only where the Lean file changed, and `327faa6` does not change it.

Repaired: `cyclotomicInvariants` now uses the names at the pin:
- `algebraicExtensionValuativeRel` (`AlgebraicExtension/Basic.lean` line 130);
- `algebraicExtensionNormedFieldTopology` (line 86);
- `algebraicExtension_valuativeExtension` (line 147);
- `finiteExtension_isNonarchimedeanLocalField` (`FiniteExtension/Basic.lean` line 54).

Their hypotheses `[Algebra.IsAlgebraic K M]` and `[Module.Finite K M]` hold for a splitting field.
The README's Tau Ceti table (line 363) and the 6.7 *Needs* line (lines 1751–1752) now name these
four declarations instead of "finite-extension structure adapters".

## Build and gate

- Build after the repairs: `lake build TauCetiRoadmap.PadicExtensionFamilies.Suggested` →
  `Build completed successfully (18452 jobs).` Its only warnings are the 13 `declaration uses
  'sorry'`, one per theorem. At `327faa6` the same command ended `error: build failed`.
- Gate after commit `5e8f0afd`: `gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0
  prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, so there is
  no UPWARD, CYCLE or `moved:` line.

## Signature check

All 39 declarations were elaborated once:
1. 39 `#check @TauCetiRoadmap.PadicExtensionFamilies.<name>` lines were appended to
   `Suggested.lean` temporarily.
2. The permitted `lake build` ran once.
3. The output was compared, whitespace-normalised, with the pre-repair signature dump.
4. The lines were removed before the commit (the gate shows `forbidden=0`).

Only `cyclotomicInvariants` changed. It is now `(K) [Field K] [ValuativeRel K]
[TopologicalSpace K] [IsNonarchimedeanLocalField K] → ℕ → ℕ → ℕ × ℕ`. The three local-field
binders the dump reported lost were an artefact of its body failing to elaborate.

The other six defs flagged for dropped binders are `wildExponent`, `ramificationPolynomial`,
`conjugateBreaks`, `residualPolynomial`, `embeddingSubgroup` and `indexOfInseparability`. Each
has a real body that does not need the dropped binders, and the README's Conventions closing
paragraph says so. Every theorem that uses them carries the binders in its own elaborated type.
For example, `conjugateBreaks_eq_of_irreducible` has `[ValuativeExtension K L]`,
`[ValuativeExtension K M]`, `[ValuativeExtension L M]`, `[Module.Finite K M]` and
`[IsGalois K M]`, and `indexOfInseparability_eq_of_eisenstein` has `[ValuativeExtension K L]`.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `cyclotomicInvariants K p i` (splitting field of `X^{p^i} − 1`, spectral-norm structure) | `ℚ_2`, `i = 0, 1, 2`; `ℚ_3`, `i = 1`; `ℚ_3(ζ_3)`, `i = 1`; `ℚ_4`, `p = 2`, `i = 1`; equal characteristic | `(1,1)`, `(1,1)` (`−1 ∈ ℚ_2`), `(2,1)` (`ℚ_2(i)`); `(2,1)`; `(1,1)`; `(1,1)`; `(X−1)^{p^i}` splits, so `(1,1)`, never reached because `mongeCount` requires `FinitePadicExtension K p` | agrees with 6.7's `e(i) = e(K(ζ_{p^i})/K)` and with `e(i) = φ(p^i)`, `f(i) = 1` over `ℚ_p` | names repaired; elaborated type regains K's binders |
| `mongeCount ℚ_2 2 2 1` with the repaired `cyclotomicInvariants` | `i = 0`: `e' = 1, 2`; `i = 1`: `e' = 1, 2` | `Σ_2(1,0)Δ_2(1,1,0) = 1·1`; `Σ_2(2,1)Δ_2(2,0,0) = 3·1`; `Σ_2(1,0)Δ_2(1,1,1) = 1·2`; `Δ_2(2,0,1) = 0` (`i > s''`); total `1 + 3 + 2 = 6` | matches the 6.7 Check `1, 3, 2` and `N_2(2,1) = 6` | none |
| Layer 2: `ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}`, independent of `M` | `ℚ_2(∜2)`, `D_4`-closure, `#G_t = 8,8,4,4,2,2,2,2,1`, `H` a reflection with `H_0 = H_1 = H`, `H_2 = 1` | `φ_{M/K}(1) = 1`, `φ_{M/K}(3) = 2`, `φ_{M/K}(7) = 3`; `φ_{M/L}(3) = 2`, `φ_{M/L}(7) = 4`; so `ψ_{L/K}(2) = 2`, `ψ_{L/K}(3) = 4`. §4a.2's integral formula: `[G : G^t H] = 1, 2, 4` on `(0,2]`, `(2,3]`, `(3,∞)`, so `ψ(2) = 2`, `ψ(3) = 4`. 2.5's polygon reading through `(2,2)`, `(3,4)` gives the same. The wrong order `φ_{M/K} ∘ ψ_{M/L}` gives `5/2` at `3` | consistent across §4a.2, 2.5 and the 2.3 Check | witness added to Layer 2 |
| Same, `ℚ_3(∛3)` (the §4a.2 non-Galois witness) | `ε = 1`, `w = 1`, `m_1 = 1` (2.6 Check) | `s_1 = r_1 = 3/2`; 2.5 gives slope `1` on `[0, 3/2]` and `3` after, i.e. `3u − 3`; §4a.2's Check states `u` on `[0, 3/2]` and `3u − 3` after | agrees | none |
| 2.3 corollary: `f ψ_{L/K}' = [G : G^u H]` a.e. on `(−1, ∞)`, `c = f ∫_{−1}^{∞}(e − ψ')` | `K/K`; unramified quadratic; tame cubic; `ℚ_2(∜2)`; `ℚ_3(∛3)` | `c = 0`; `f = 2`, `ψ' = 1`, `[G:G^uH] = 2`, `c = 0`; `ψ' = 1` on `(−1,0)` and `3` after, `c = ∫_{−1}^0 2 = 2`; `c = 3·3 + 2·1 = 11`; `c = (3−1)·(5/2) = 5`. On `(−1,0)`, `G^u = G_0` and `[G : G_0 H] = [L^{ur} : K] = f` | matches the 2.3 Checks (`0, 0, 2, 11`) and 2.6 (`11 = 3 + 4·2`, `5 = 2 + 3·1`) | the range is split: `u > 0` from §4a.2, `(−1,0)` from §4a.2's identity and 2.1 |
| Tau Ceti table: finite-extension and intermediate-field adapters | each name at the pin | `AlgebraicExtension/Basic.lean` 86, 130, 147; `FiniteExtension/Basic.lean` 54; `FiniteExtension/IntermediateField.lean` 81 (`finiteIntermediateField_valuativeExtension`, already used by `Suggested.lean`) | all exist; hypotheses `[Algebra.IsAlgebraic K M]`, `[Module.Finite K M]` met by a splitting field | rows added |

## Ownership, citations, overlaps, sources

- Ownership: the repairs add no construction. The non-Galois `ψ_{L/K}` is owned by
  RamificationOfCompleteDiscretelyValuedFields §4a.2, earlier in the merge order, and both sides
  agree on this. That roadmap is a new folder in an open pull request. It was read with
  `roadmaps show`, since it is not among the sibling checkouts, and its README link resolves once
  it merges first, as the merge order provides. A search of main and every open roadmap pull
  request for the non-Galois `ψ_{L/K}` finds no second owner:
  - FilteredLocalGaloisGroups lists it under "It does not own" and consumes §4a.2;
  - ArithmeticGaloisRepresentations cites §4a.2 for it;
  - LocalFieldsRamification has only the Galois tower law `ψ_{M/K} = ψ_{M/L} ∘ ψ_{L/K}`;
  - in AdicCoefficientsAndComparisonsPartII, `ψ_{L/K}` names a different object, the map on
    valuation spectra.
- Citations: the 20 "Lean names found nowhere" leads are all LMFDB knowl identifiers (`lf.*`,
  `nf.galois_root_discriminant`), each written after the word "knowl"; none is a Lean name, and
  the gate's identifier check (`readme-ids-missing=0`) agrees.
- Overlaps: no open pull request changes this roadmap or drops an id it cites. Removing §2.0
  breaks no citation.
- Sources: the repairs cite no new source. `needs-references.toml` was not created, and no text is
  missing.
