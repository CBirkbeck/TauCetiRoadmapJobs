# GATE-FuchsianOrbifoldsPartII~1: answers to human review

One review comment needed an answer. It makes one point (H01). Nothing in `TauCetiRoadmap/FuchsianOrbifoldsPartII/README.md` or `TauCetiRoadmap/FuchsianOrbifoldsPartII/Suggested.lean` was changed, so there is no commit.

## H01 (mycaule) — answered

The roadmap and LeanPool's `CongruenceNormalizers` (at `f8b9b72`) have no object in common, so the roadmap does not cite it and needs no edit.
- **What LeanPool formalizes.** It works inside SL(2,ℝ): the normalizer `Norm0 N` of Γ₀(N), the quotient `B N`, Atkin–Lehner and Newman-form matrices, and Γ_Δ(N). Its theorems are Newman's normalizer theorem (`newman'`, `newmanForm_mem_normalizer'` in `NormalizerLean/NewmanMain.lean` and `NormalizerLean/T1General.lean`).
- **What this roadmap builds.**
  - The one group it constructs is `cycleGroup n` = ⟨T^m, T^(N_k) S T^(−N_k)⟩ ≤ PSL₂(ℤ) (`Suggested.lean` lines 43–49, README §1.1).
  - That group has infinite index (`cycleGroup_infiniteIndex`, README §1.6), so it is never Γ₀(N), never any congruence subgroup and never conjugate to one. For example, n=[4] gives ⟨S,T⁴⟩. Its Ford polygon contains the strip 1<x<3, whose area ∫y⁻²dy diverges, while [PSL₂(ℤ):Γ₀(N)] = N∏_{p|N}(1+1/p) is finite (1, 3 and 6 for N=1, 2, 4).
  - No normalizer is computed. The one statement about conjugation, `cycleGroup_conj_iff_isRotated` (README §3.4), only says whether some conjugating element of PSL₂(ℝ) exists.
- **Sharing a name is not overlap.** The only shared vocabulary is the ambient groups SL₂/PSL₂ and conjugation. Grepping README.md and Suggested.lean for "normaliz", "Γ₀", "congruence" and "Atkin" finds only "normalize" in an unrelated sense and CongruenceSpectralGap §0.1 as the supplier of the level-one quotient measure.
- **Policy.** The README's "Porting existing work" asks a roadmap to cite existing work only when it develops the same mathematics, which is not the case here. LeanPool is also not one of the pinned libraries (Mathlib, Tau Ceti), so it could not be a supplier.

## Elaborated signatures

`Suggested.lean` is unchanged, so the elaborated types the worker recorded for its 8 declarations still apply. I compared each with its README statement:
- `AdmissibleCycle` matches §1.1.
- `cycleGroup` matches §1.1, with centres N₀,…,N_{ℓ−1}.
- `cyclePolygon` matches §1.2, with ℓ+1 exterior-disc inequalities.
- `cyclePolygon_fundamentalDomain`, `cycleGroup_presentation` and `cycleGroup_cuspStabilizer` match §1.3: every admissible list, ℤ*(C₂)^*ℓ with T^m and S_k marked, and Γ(n)∩⟨T⟩=⟨T^m⟩.
- `cycleGroup_infiniteIndex` matches §1.6 (index 0).
- `cycleGroup_conj_iff_isRotated` matches §3.4.

No binder is missing, and no `#check` re-elaboration was needed since nothing changed.

## Adversarial pass

No statement was added or changed. The only mathematical claim this answer relies on was checked with computed values:

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `cycleGroup n` is never Γ₀(N) | n=[4]; N=1,2,4 | [PSL₂(ℤ):⟨S,T⁴⟩]=∞ (area over 1<x<3 diverges); [PSL₂(ℤ):Γ₀(N)]=1,3,6. S=[[0,−1],[1,0]] has c=1, so S∉Γ₀(N) for N>1; for N=1 the index is 1≠∞ | holds | none |
| `cycleGroup_conj_iff_isRotated` computes no normalizer | n=n′=[3,6] | the conjugators φ with φΓφ⁻¹=Γ form the normalizer; the statement only asks that one exists (φ=1, rotation by 0) | holds | none |

## Ownership, sources, citations

- **Ownership.** No construction was added, so no new ownership question arises.
- **Sources.** No new source was cited and none was needed. `needs-references.toml` was not created.
- **Untrusted text.** The review comment contained no instructions.

## Build

`lake build TauCetiRoadmap.FuchsianOrbifoldsPartII.Suggested`: `Build completed successfully (18252 jobs).` It gave 5 `declaration uses 'sorry'` warnings, at lines 60, 69, 85, 92 and 101, and no errors.

## Gate

`gate FuchsianOrbifoldsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 249 roadmaps, 2380 edges, 0 problem(s)`. It reports no UPWARD, CYCLE or `moved:` line.
