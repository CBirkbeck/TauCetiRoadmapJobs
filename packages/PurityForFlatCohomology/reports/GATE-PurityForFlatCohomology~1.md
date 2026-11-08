# GATE-PurityForFlatCohomology~1: answers to the review of 1de6822

Reviewed comment: CBirkbeck, 2026-11-07T21:17:38Z (findings F01–F03 of the review of `1de6822`).
The branch head was `1176108`, which already carried the repairs of F02 and of the §7 part of F03.
This job adds two commits on top of it. `48f8bb1` applied F01's recommended repair. `758db60`
withdraws it, because it made this roadmap consume a roadmap later in the merge order (see H01).
Points: H01 and H02 are the two claims of F01, H03 is F02 and H04 is F03.

## H01 (CBirkbeck) — applied differently

The duplicate ownership is settled the other way: §§1.4–1.5 (local étale duality on excellent regular
local rings, and the local Lefschetz theorem) stay owned here (`README.md:825–899`), and
EtaleDualityAndPerverseSheavesPartII is named as the roadmap that imports them (`:166–167`, `:2583–2584`).
The recommended repair cannot stand because it makes this roadmap (`ORDER.txt` line 221) consume a
roadmap at line 386; with it, the gate for this pull request failed with
`depcheck: UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#385) at README lines [354, 860, 972]`.

What changed between `48f8bb1` and `758db60`:
- The `### From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract, the Scope "owned
  elsewhere" bullet, the diagram line, and the citations in *Needs* and in the Layer 1 Dependencies
  are gone. `grep EtaleDualityAndPerverseSheavesPartII` now finds only the two importer lines above.
- §§1.4–1.5 are back with their `1176108` text. Layer 1 is numbered §§1.1–1.8 again, so
  EtaleDualityAndPerverseSheavesPartII's consumer paragraph (its line 1570, "§1.6") again names the
  étale-depth bound, and no old → new line is needed. `Suggested.lean` docstrings say §1.8/§1.6 again.
- Three independent fixes from `48f8bb1` are kept:
  - §1.6 spells out the base cases `n = 0` (absolute purity) and `n = 1` (§1.5), at `:909–915`;
  - its "reused in §6.4" now reads §6.3;
  - EtaleCohomologyFoundations §F.0.4 and SchemeAndStackFoundations §2.10 are added to its *Needs*, to the Scope bullet (`:96–98`) and to the Layer 1 Dependencies (`:1027–1032`).

Moved down: the local Lefschetz theorem (EtaleDualityAndPerverseSheavesPartII §7.3) and the parts of
its §§6.11, 6.12 and 7.1 that the theorem uses, in the excellent regular local case, are stated here
as §§1.4–1.5. The second locator demand of this option is already met: `README.md:836–837` gives
[SGA4] XVIII 3.1.8(iii) and [SGA5] I 1.12(a), the references of CS24 lines 1369–1371.

What remains of the finding: §1.4(a) and the dualizing clause of §1.4(b) are Gabber's theorems,
ILO14 XV Corollaire 1.2.4 (line 10362) and XVII Théorème 0.9 (line 12220), and are stated as "the
substance of this target" (`:850–851`). Their ILO14 proofs use inputs that only
EtaleDualityAndPerverseSheavesPartII Layers 0–4 plan:
- uniformization (ILO14 line 10471, VII-1.1 with XIII-2.2.2);
- alteration-topology descent (lines 10429–10431, XII-2.2.4);
- the trait affine Lefschetz theorem (line 10559);
- the finiteness theorem.

No earlier roadmap supplies them:
- EtaleDualityAndPerverseSheaves (`ORDER.txt` line 102) works over fields and excellent regular bases of dimension `≤ 1`;
- LefschetzPencilsAndVanishingCycles §0.10 owns absolute purity only;
- SGA2 XIV Corollaire 4.5 (SGA2 line 7207) is the local Lefschetz theorem only over excellent characteristic-zero bases.

Moving those layers here would plan that roadmap again, so this repair does not. There are two
clean settlements, and both are operator or author decisions outside this pull request's files:
- put this roadmap after EtaleDualityAndPerverseSheavesPartII in `ORDER.txt` and reapply `48f8bb1`. At `48f8bb1` the `--movable` check printed `moved: … from #220 to #385 …` and `0 problem(s)`;
- or have EtaleDualityAndPerverseSheavesPartII cite §§1.4–1.5 here, keeping its general §§5.6, 6.11 and 6.12.

## H02 (CBirkbeck) — answered

This consequence was conditional on this roadmap moving after SchemeAndStackFoundationsPartII. That
move is not made: this roadmap stays at `ORDER.txt` line 221, before SchemeAndStackFoundationsPartII
at line 258. So Layer 3 and §7.10 stay owned here, and that later roadmap is to import them
(`README.md:157–170`, `:2575–2582`). That is the supply direction the single-direction rule asks for,
and no edit is needed. The `48f8bb1` header "Owned here and to be imported by
SchemeAndStackFoundationsPartII" is back to "Two roadmaps later in the merge order …", because
EtaleDualityAndPerverseSheavesPartII is again the second importer.

## H03 (CBirkbeck) — applied

At `1176108`, unchanged since, the five declarations are listed in `### From Tau Ceti` with their files
(`README.md:255–297`). The repairs are in place:
- §7.11 cites `TauCeti.IsRegularLocalRing.free_of_isReflexive` (`:2076`, `:2082`);
- §7.4 takes dimension `≤ 2` from `uniqueFactorizationMonoid` and the finite free resolution from `hasProjectiveDimensionLE` (`:1897`, `:1903`);
- §7.2 cites `free_of_isCohenMacaulay` (Stacks 00NT) and keeps PurityOfBranchLocus §0.3 for `auslander_buchsbaum` only (`:1838–1839`, `:352–356`);
- §7.2 has the optional Check.

Each name was re-opened at Tau Ceti `2fd255d`:
- `Free.lean` lines 73 and 93;
- `DimensionTwo.lean:202`;
- `UniqueFactorization.lean:59`;
- `ProjectiveDimension.lean:195`.

## H04 (CBirkbeck) — applied

At `1176108` §§7.14–7.16 became §§7.13–7.15, with every citation updated. The section headings are
now at `README.md:2119`, `:2158` and `:2191`. `Suggested.lean:55` reads "§§7.14, 7.15, 8.3, 8.6".
The conditional part ("if R01's recommended repair is applied, renumber §§1.6–1.8") no longer
applies, since §§1.4–1.5 remain. Layer 1 is numbered consecutively §§1.1–1.8 (headings at
`:716`, `:786`, `:804`, `:825`, `:878`, `:900`, `:927`, `:957`).

## Build

I ran `lake build TauCetiRoadmap.PurityForFlatCohomology.Suggested` at `758db60`:
- exit 0, `Build completed successfully (18356 jobs)`;
- exactly 7 warnings `declaration uses sorry` (lines 142, 153, 166, 179, 189, 196, 209), and no error.

Signatures: I appended `#check @TauCetiRoadmap.PurityForFlatCohomology.<name>` for all 12 declarations
to a temporary copy of `Suggested.lean`. It elaborated once through the same target (exit 0, 12 `info`
lines), and then I restored the file. After whitespace normalisation, all 12 elaborated types are
identical to those recorded in `signatures.md`, and each matches its README statement:
- `localPicard_torsion_eq_one` carries `IsNoetherianRing`, `IsCompleteIntersection` and `3 ≤ ringKrullDim R`;
- the two Zariski–Nagata theorems carry `IsNoetherianRing`;
- Katz's theorem carries `IsAlgClosed`, `FiniteDimensional` and `Function.Bijective F`;
- Auslander's criterion carries `Module.Finite` and `Module.IsReflexive`.

Nothing changed, because `Suggested.lean` is byte-identical to `1176108` (`git diff 1176108 -- Suggested.lean` is empty). The file has no section `variable`s.

## Gate

```
gate PurityForFlatCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check (`gate --depcheck … --movable`)

```
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, so this roadmap keeps its place at `ORDER.txt` line 221.
EtaleDualityAndPerverseSheavesPartII is mentioned only as an importer (Scope and Downstream
consumers), and those mentions are not supplier edges. The count is the one from before `48f8bb1`.

## Citations and ownership

`roadmaps resolve` on the README reports only the known lead "137: PerfectoidQuotientsPartII
§§Q5.2". That is the board design at `ORDER.txt` line 220, whose sections were checked in the
previous review. There is no unresolved Lean name. No citation depends on an open revision, so
nothing is listed under "only an open revision defines".

Ownership against the 472 open pull requests was checked by object with `roadmaps grep -i` for
"affine Lefschetz", "local Lefschetz" and "quasi-excellent". The only other owner of these statements
is EtaleDualityAndPerverseSheavesPartII (its README lines 23 and 1570), discussed under H01:
- LocalPurity §1.4 is the extension theorem for finite étale covers, a different statement;
- RiemannianGeometry's "affine Lefschetz" is the complex-analytic one;
- ResolutionOfSingularitiesCharacteristicZero and LefschetzPencilsAndVanishingCycles use quasi-excellence only for resolution and log regularity.

## Sources

No new source was fetched, and `needs-references.toml` is not needed.

The restored §1.4 cites:
- [ILO14] XV Corollaire 1.2.4 (line 10362), XVI Théorème 3.1.1 and XVII Théorème 0.9 (line 12220);
- [SGA4] XVIII 3.1.8(iii);
- [SGA5] I 1.12(a) and (4.2.2).

These are all keys already in the manifest; SGA4 and SGA5 are settled as uncertified. So the
`SGA5` key that the earlier version of this report called unused is used again. The References
list of [SGA4] now reads "Exposés VII, X, XVIII", which are the three exposés the text cites
(`README.md:614`, `:1222`, `:836`). At `1176108` it read "V, VII, XVIII": Exposé V was cited
nowhere and X was missing.

## Adversarial pass (statements that `758db60` restores or changes)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.4(a) `H^i(Spec R[1/f], ℤ/ℓ) = 0` for `i > d` | `d = 0`; `d = 1` with `f` a uniformizer; `f = 0`; `f` a unit (outside `f ∈ 𝔪`) | `d = 0`: `𝔪 = 0`, so `f = 0` and `R[1/f]` is the zero ring, with all groups `0`. `d = 1`: `R[1/f] = L` and `cd_ℓ L = 1` (tame inertia `ℤ_ℓ(1)`), so `H^i = 0` for `i ≥ 2`. `f = 0`: the empty scheme. `f` a unit: `R` is strictly henselian, so `H^i = 0` for `i > 0`. | Holds | Restored |
| §1.4(b) normalisation `Ω = (μ_ℓ^{⊗d})[2d]` | closed point `i`; shift `[d]` as the wrong model | Absolute purity gives `i^!ℤ/ℓ = ℤ/ℓ(−d)[−2d]`, so `i^!Ω = ℤ/ℓ` in degree `0`. With `[d]`, `i^!` lands in degree `d ≠ 0` for `d ≥ 1`. | Holds | Restored |
| §1.4(c) local duality | `d = 0`; `d = 1` with `K = j_!ℤ/ℓ`; `R = 𝔽_2`, `ℓ = 3`, `i = 1` (negative control) | `d = 0`: linear duality. `d = 1`: `Hom(H^{2−i}(L, μ_ℓ), ℤ/ℓ)` is `0, ℤ/ℓ, ℤ/ℓ(−1)`, and the sequence `0 → j_!ℤ/ℓ → ℤ/ℓ → i_*ℤ/ℓ → 0` with purity groups `0, 0, ℤ/ℓ(−1)` and `H^*(k) = ℤ/ℓ, 0, 0` gives the same `0, ℤ/ℓ, ℤ/ℓ(−1)`. `𝔽_2`: `H^1(𝔽_2, ℤ/3) = ℤ/3` against `0` on the dual side, so strict henselianity is needed. | Holds | Restored |
| §1.5 local Lefschetz | DVR with `f = π`; `k⟦x,y⟧` with `f = x`; `f = 0`; non-excellent regular `R` | DVR: `i = 0 = d − 1`, and `0 → ℤ/ℓ` is injective, not onto. `k⟦x,y⟧`: degrees `0, 1` are `0 → 0`; degree `2` is `0 → ℤ/ℓ(−1)`, outside the range. `f = 0`: the identity. Non-excellent `R`: CS24 Lemma 3.2.3 (line 1356) assumes only regularity, and the route reduces to complete `R` (CS24 line 1364). | Holds | Restored |
| §1.6 base cases, now through §1.5 | `n = 0` with `d = 0, 1, 2`; `n = 1` with `k⟦x,y⟧/(xy)` and `R̃` a DVR | `n = 0`: purity gives `i < 2d`, against the claim `i < d` (empty, `i < 1`, `i < 2`). `(xy)`: `vdim = 1`, and §1.5 at `i = 0 < 1` gives `H^0_𝔪(R) ≅ H^0_𝔪(k⟦x,y⟧) = 0`; `H^1_𝔪(R) ≠ 0` (two branches) is consistent with the sharpness Check. `R̃` a DVR: `R` is Artinian with `vdim = 0`, so the claim is vacuous. | Holds | Kept from `48f8bb1`; citation of the later roadmap replaced by §1.5 |
| §1.6 "reused in §6.3" | *Needs* of §6.3 and §6.4 | §6.3's route starts "the reduction of §1.6 works for every finite étale `G`" (CS24 line 1389). §6.4 does not use §1.6. | Holds | Kept |
| Layer 1 Dependencies (`:1027–1032`) | union of the *Needs* of §§1.1–1.8 | SchemeAndStackFoundations {0.6, 0.14, 0.17, 0.21, 2.7, 2.10, 2.15, 4.7–4.8}; EtaleCohomologyFoundations {F.0.2, F.0.4, F.5}; LefschetzPencilsAndVanishingCycles 0.10; PrismaticCohomology 2.0; ModularCurves 4D; LocalPurity 1.1, 1.3, 2.1, 2.2; DeformationAndDerivedPatchingAlgebra 3.4; DerivedDeRhamCohomology 0.19, 0.21; PerfectoidSpaces P7.16a. These equal the list. | Matches | Changed |
| Scope bullet for EtaleCohomologyFoundations (`:96–98`) | each use of F.0.2, F.0.4, F.5 | F.0.2 is used by §1.8; F.0.4 by §1.6 and Layer 2 (`:1051`, `:1058`, `:1087`); F.5 by §1.4. | Matches | Changed |
| [SGA4] reference list | every `SGA 4` citation | VII 5.7 (`:614`), X 5.1 (`:1222`), XVIII 3.1.8(iii) (`:836`); no Exposé V citation. | Corrected | Changed |
