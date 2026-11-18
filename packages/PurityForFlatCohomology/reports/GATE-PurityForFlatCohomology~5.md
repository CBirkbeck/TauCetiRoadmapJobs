# GATE-PurityForFlatCohomology~5: answers to human review

The pull request head was `11b433b`. This round made two commits, and neither has been pushed:

- `89c0a335` ceded §§1.4–1.5 to EtaleDualityAndPerverseSheavesPartII.
- `ed72baa5` "PurityForFlatCohomology: review repairs (§§1.4–1.5 restored as owned here; EtaleDualityAndPerverseSheavesPartII is later)" undoes that cession.

The worker's gate rejected `89c0a335` with `depcheck=1: UPWARD: PurityForFlatCohomology (#239) -> EtaleDualityAndPerverseSheavesPartII (#422) at README lines [638, 1142, 1261]`. After `ed72baa5`, `TauCetiRoadmap/PurityForFlatCohomology/README.md` is byte-identical to its state at `11b433b`: `git diff --stat 11b433b9 -- TauCetiRoadmap/PurityForFlatCohomology` is empty. `Suggested.lean` is unchanged.

There is only one unanswered comment: roed-math, 2026-11-18T07:44Z. It makes a single point, H01. That point refers to the "For the human reviewers" section of the board review of EtaleDualityAndPerverseSheavesPartII, which this round read as data. The section says that PurityForFlatCohomology still states §§1.4–1.5, that EtaleDualityAndPerverseSheavesPartII owns §§6.11–7.3, and that "the repair lies in that roadmap" even though "the merge order lists it first".

## H01 (roed-math) — disputed

§§1.4–1.5 stay owned by this roadmap. The merge order lists PurityForFlatCohomology at `ORDER.txt` line 239 and EtaleDualityAndPerverseSheavesPartII at line 422. A roadmap may take suppliers only from main or from earlier in the order. EtaleDualityAndPerverseSheavesPartII is neither: its pull request #1743 is `OPEN`, with head `b826e54` and `mergedAt: null`, and main at `c780237` has no such folder. So citing it is an upward edge. The README is therefore unchanged from `11b433b`:
- §1.4 (README line 1112) and §1.5 (line 1165) are targets here.
- Scope and ownership (lines 219–220) and Downstream consumers (lines 3308–3309) say that EtaleDualityAndPerverseSheavesPartII is to import them.
- The duplicates to be replaced by citations in that roadmap are its §§6.11, 6.12, 7.1 and 7.3, not this roadmap's §§1.4–1.5.

**Evidence that the cession cannot stand while the order is as it is.**
- The cession put EtaleDualityAndPerverseSheavesPartII in three places:
  - a supplier contract (README line 638 at `89c0a335`);
  - §1.6's *Needs* line (line 1142);
  - the Layer 1 Dependencies (line 1261).
- The gate reported exactly these three lines as an UPWARD edge (above).
- With §§1.4–1.5 restored, the same gate reports `depcheck=0` and the dependency check reports 0 problems (below).
- §1.6 again takes local Lefschetz from §1.5 (*Needs* at line 1206), and §1.5 takes its inputs from §1.4 (*Needs* at line 1174). Every supplier the two sections name is on main or earlier than line 239:
  - EtaleCohomologyFoundations §F.5;
  - LefschetzPencilsAndVanishingCycles §0.10;
  - SchemeAndStackFoundations §§0.21, 2.15;
  - PrismaticCohomology §2.0;
  - ModularCurves Layer 4D.

**When the answer changes.** If #1743 reaches main before this roadmap merges, then EtaleDualityAndPerverseSheavesPartII precedes every open roadmap. This roadmap must then cite it and drop §§1.4–1.5. The README change for that case is the one in `89c0a335`:
- delete §§1.4–1.5;
- §1.6 cites EtaleDualityAndPerverseSheavesPartII §7.3;
- add a supplier contract for §7.3 and an "owned elsewhere" scope bullet naming §§7.1, 6.11, 6.12, 7.3;
- drop EtaleCohomologyFoundations §F.5, SchemeAndStackFoundations §0.21, [SGA5], [SGA4] Exposé XVIII and [ILO14] Exposés XV–XVII, which only §§1.4–1.5 use.

These are the same statements under the same hypotheses: its §7.3 at `b826e54` is [CS24] Lemma 3.2.3 for a regular local ring, not necessarily excellent, which is this §1.5. No roadmap on main or at an open head cites this roadmap's §1.4 or §1.5 apart from EtaleDualityAndPerverseSheavesPartII's own consumer remark, which cites §1.6. So deleting them later needs no old → new mapping.

## Build

`lake build TauCetiRoadmap.PurityForFlatCohomology.Suggested`: **Build completed successfully (18658 jobs)**. The only diagnostics are 15 warnings "declaration uses `sorry`" (Suggested.lean lines 161, 172, 185, 241, 258, 268, 275, 288, 320, 336, 378, 394, 421, 436, 450). There are no errors.

`Suggested.lean` is unchanged this round. None of its declarations or its module docstring mentions §§1.4–1.5, so the elaborated signatures in `scratch/signatures.md` still stand (0 lost binders). No new `#check @name` pass was needed.

## Gate

Run on commit `ed72baa5`:

```text
gate PurityForFlatCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check (`--movable --pr 1840`), full output

```text
depcheck: 229 roadmaps, 2454 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

## Adversarial pass on the restored statements

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 local Lefschetz (README 1165–1186), hypotheses | against [CS24] Lemma 3.2.3 (CS24 line 1356, p. 33) | Both: `R` regular local (no excellence), `f ∈ 𝔪`, `ℓ` an invertible prime; bijective for `i < dim R − 1`, injective for `i = dim R − 1`. | equal generality | none |
| same | `R` a discrete valuation ring, `f` a uniformizer | `dim R − 1 = 0`. The bijective range is empty. In degree 0, `H^0_𝔪(R, ℤ/ℓ) = ker(ℤ/ℓ → ℤ/ℓ) = 0 → H^0(k, ℤ/ℓ) = ℤ/ℓ` is injective and not surjective. | holds as stated (injective only) | none |
| same | `f = 0` | `R/(f) = R`: the identity in every degree. In the route, `Spec R[1/0] = ∅`, so `j_!ℤ/ℓ = 0` and `H^i_𝔪(R, j_!ℤ/ℓ) = 0` for every `i`. | consistent | none |
| same | `R = k⟦x, y⟧`, `k` separably closed, `f = x` | `i ≤ 1`: `H^i_𝔪(k⟦x, y⟧) = 0` (purity, `i < 4`), and `H^0_𝔪(k⟦y⟧) = 0`, `H^1_𝔪(k⟦y⟧) = coker(ℤ/ℓ → ℤ/ℓ) = 0`. `i = 2 = dim R`: `0 → H^1(k((y)), ℤ/ℓ) ≅ ℤ/ℓ(−1)`, not surjective, and not claimed. | holds; range sharp | none |
| §1.4(a) affine Lefschetz (README 1114–1117) | `d = 1`, strictly henselian excellent discrete valuation ring, `f` a uniformizer | `Spec R[1/f] = Spec L`, with `cd_ℓ L = 1` (its Galois group is the tame inertia, of `ℓ`-cohomological dimension 1), so `H^i = 0` for `i > 1 = d`. | holds | none |
| §1.4(b) twist and shift | `R` strictly henselian of dimension `d`, closed point `x` | Purity: `i^!ℤ/ℓ ≅ ℤ/ℓ(−d)[−2d]`, so `i^!((μ_ℓ^{⊗d})[2d]) ≅ ℤ/ℓ` in degree 0. With `[d]` instead, `i^!` would sit in degree `−d ≠ 0` for `d ≥ 1`. | normalisation pinned | none |
| §1.4(c) local duality | `d = 1`, `K = j_!ℤ/ℓ`, `L` the fraction field | Duality: `Hom(H^{2−i}(L, μ_ℓ), ℤ/ℓ)` = `0`, `ℤ/ℓ`, `ℤ/ℓ(−1)` for `i = 0, 1, 2`. Directly, from `0 → j_!ℤ/ℓ → ℤ/ℓ → i_*ℤ/ℓ → 0` with `H^i_𝔪(R, ℤ/ℓ) = 0, 0, ℤ/ℓ(−1)` and `H^i(k, ℤ/ℓ) = ℤ/ℓ, 0, 0`: `H^0 = 0`, `H^1 = ℤ/ℓ`, `H^2 = ℤ/ℓ(−1)`. | agree | none |
| same, strict henselianity | `R = 𝔽_2`, `d = 0`, `ℓ = 3`, `K = ℤ/3`, `i = 1` | Left: `H^1(𝔽_2, ℤ/3) = Hom(Ẑ, ℤ/3) ≅ ℤ/3`. Right: the degree `−1` stalk of `RHom(ℤ/3, ℤ/3)` is `0`. | hypothesis needed and stated | none |
| §1.6, step `n = 1` via §1.5 (README 1196–1204) | `R̃ = k⟦x, y⟧`, `f = xy` | `vdim R = 1`. Purity gives `H^i_𝔪(R̃) = 0` for `i < 4`; bijectivity for `i < 1` gives `H^0_𝔪(R, ℤ/ℓ) = 0`. Directly, `Spec R` is connected and `U_R` has two components, so `H^0_𝔪 = 0` and `H^1_𝔪 ≠ 0`. | agrees; bound sharp | none |
| Scope "owned here, to be imported" (README 210–222) and Downstream consumers (3308–3309) | merge-order positions of both named consumers | EtaleDualityAndPerverseSheavesPartII is at 422 and SchemeAndStackFoundationsPartII at 277, both after 239. | direction correct | restored |

## Ownership, citations and overlaps

- I checked ownership of the disputed objects against EtaleDualityAndPerverseSheavesPartII at its head `b826e54`:
  - its Scope and ownership (line 23) claims §§6.11, 6.12, 7.1, 7.3;
  - its Downstream consumers (line 1656) cites this roadmap's §1.6.
- Under the single direction of supply, the owner is the earlier roadmap, which is this one, and the later roadmap cites. The README says so.
- The duplication persists in EtaleDualityAndPerverseSheavesPartII's text, and that pull request is the place where it is to be repaired, for as long as the order stands.
- No declaration of `Suggested.lean` is affected.

## Sources

No source was fetched or added, and `needs-references.toml` was not written. I checked [CS24] Lemma 3.2.3 at CS24 line 1356 (p. 33) against §1.5. The restored text cites [SGA5] Exposé I, [SGA4] Exposé XVIII and [ILO14] Exposés XV–XVII again. The board manifest's entries for `SGA5`, `SGA4` and `ILO14`, with `cited_for` including `"1.4"`, are therefore accurate as they stand and need no change.

## Untrusted text

The comment and the review section it points to contain no instruction outside this job, so there is nothing suspicious to quote.
